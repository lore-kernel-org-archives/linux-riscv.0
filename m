Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EFE2C25B75
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jun 2024 09:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qk0p4y5YASaCDxMY5JqKgTf3F4u4i9dQaU/S/HB7ah8=; b=24WYTKmbfGuE4G
	C/y5msvhAJobv143iH0cqGCZuM2hTYleym9jSezKn4NSkxBVPq4icSJCtXlZoAL4rV0WWXj57lzZ3
	Vz1ui+BSpzP3Mz67sbOqxWbRR5FhBvDgRAAe8O1UOSzl6rWDCu2xipynEcYWnyptdPpGk5+Jpc29o
	3Cyfjk9b53fEKmGB8w5tufc6RY+BeYeZNJN5SXTyCHp+EjlwvUH4ZuioP849xLUOXc9V6j0yy3wv6
	OsOsvVqMY2FPZAKrNqlQOx8K2WG5CrLCmUkAhBk6BXvC+Rf3ztb3A6Csf2y8bQJhX9XO72t/Vu4uy
	YqMMNZ3gL3fuvln87vpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF9Iz-000000096Gm-29gJ;
	Thu, 06 Jun 2024 09:21:09 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF9Iv-000000096EA-07Eb
	for linux-riscv@lists.infradead.org;
	Thu, 06 Jun 2024 09:21:07 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-37491216a2bso3335905ab.1
        for <linux-riscv@lists.infradead.org>; Thu, 06 Jun 2024 02:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1717665661; x=1718270461; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AdJFT3+u1sx6Ka9DdK4imlo+hWjtAf82CvjoDoTozfE=;
        b=LPozKAvT4LIAY4dhEVFx9qM911/ZnMCyt1GxW0zqJLnxTofAL3MdmmE+R2sc4dL7Ks
         +k0O37ojZej+VZUJUdllti9eMQQ2FKerEE3HJKxF9BC9YEgtXiN6iahiBPqc7mKH2wXO
         D0SQ54H27n6qcZcuRvYJTC0O/CB6z86jvKLZe9jNyvJYMEv5elZO3rr+opRl1QV1pMna
         BUQY/qzppamX5lYTrldChOFvTZpDiQiSk5RT/QUDW0zUdQoAOfSCs43TB5odwHHjsgJJ
         vEfwtC4MpLRe+KrDtvlZXsPPwEdhRekl210or+ln3sLigtv3wXYI497cTHfGNoJ3Ubwg
         NosA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717665661; x=1718270461;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AdJFT3+u1sx6Ka9DdK4imlo+hWjtAf82CvjoDoTozfE=;
        b=lZR7/3G7q23MjdERoOiqFQEnxAIHENGqH+Qqnx4DGAbopLkJ9qtcXgJQdaiROXCwQj
         NhCJRP/fXDqXP47NGm+nj6m/Ph8WCoKLRM/JrVx94K93sg/r71gl+cBM8Mi7lPQAYbrH
         rgjGG+4J1VA4tNjT9B8fn41eeZTfBYTerWCbykKM42mQ1JrVZnTSQPrMFPcVMoSy3RNl
         xxwb5a6my3d94hgD8lzZwn3O18fOOHosIYHWGxQlUMOT7blZiTVdMzygMaDWA3yLu+n0
         AqlMNdspHbybq6Uplr0Qp+wArmJ3ccka0qik4JfWIP6KOIGOi3JdHqpFKwuIaVj+DA0O
         mj+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUmayIQUJCFopBM3+OnZax6xIbcm7qvIOEm+o/7hEqpnnkXCNGdCEz7p4xAtAQNE1cTOb2wlg7PqvLXLnytZ/iaYXGBHd0EnMExRRZoqEyg
X-Gm-Message-State: AOJu0Yw7t42NjP6I7ZvmlsOtEbwJa0WGju+bua8dxjLbira1fpqX0uII
	egEM0D5mIou/3G49O2wrmBLvltm4e+PEI1cXMWB9Cp6OSVPNw3AUwqeGuCBUyd2uHRBM8hF3chw
	osm65xDG7ZqQ09DCTnBDpoJy1sh1x7+KO/1Xadg==
X-Google-Smtp-Source: AGHT+IE8YaOoLCQa7Dozfw5ABFzfn4U30/iv1AHjlqK24vEsauUk0R4EPjGHHwgvhsSuZpl+WSU9M4bDGfvRA8iArzk=
X-Received: by 2002:a05:6e02:1fe6:b0:374:9cdc:7a3a with SMTP id
 e9e14a558f8ab-374b1ef4a7dmr55256965ab.11.1717665660959; Thu, 06 Jun 2024
 02:21:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240422080833.8745-1-liangshenlin@eswincomputing.com>
In-Reply-To: <20240422080833.8745-1-liangshenlin@eswincomputing.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 6 Jun 2024 14:50:49 +0530
Message-ID: <CAAhSdy0+174Mgiw=bD8SENFz8+izE9wy=ABM_MiuvH7Wjhqf+A@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] perf kvm: Add kvm stat support on riscv
To: Shenlin Liang <liangshenlin@eswincomputing.com>
Cc: atishp@atishpatra.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	peterz@infradead.org, mingo@redhat.com, acme@kernel.org, namhyung@kernel.org, 
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org, 
	irogers@google.com, adrian.hunter@intel.com, linux-perf-users@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_022105_246406_FE3CCCAE 
X-CRM114-Status: GOOD (  17.83  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBBcHIgMjIsIDIwMjQgYXQgMTo0MuKAr1BNIFNoZW5saW4gTGlhbmcKPGxpYW5nc2hl
bmxpbkBlc3dpbmNvbXB1dGluZy5jb20+IHdyb3RlOgo+Cj4gJ3BlcmYga3ZtIHN0YXQgcmVwb3J0
L3JlY29yZCcgZ2VuZXJhdGVzIGEgc3RhdGlzdGljYWwgYW5hbHlzaXMgb2YgS1ZNCj4gZXZlbnRz
IGFuZCBjYW4gYmUgdXNlZCB0byBhbmFseXplIGd1ZXN0IGV4aXQgcmVhc29ucy4gVGhpcyBwYXRj
aCB0cmllcwo+IHRvIGFkZCBzdGF0IHN1cHBvcnQgb24gcmlzY3YuCj4KPiBNYXAgdGhlIHJldHVy
biB2YWx1ZSBvZiB0cmFjZV9rdm1fZXhpdCgpIHRvIHRoZSBzcGVjaWZpYyBjYXVzZSBvZiB0aGUK
PiBleGNlcHRpb24sIGFuZCBleHBvcnQgaXQgdG8gdXNlcnNwYWNlLgo+Cj4gSXQgcmVjb3JkcyBv
biB0d28gYXZhaWxhYmxlIEtWTSB0cmFjZXBvaW50cyBmb3IgcmlzY3Y6ICJrdm06a3ZtX2VudHJ5
Igo+IGFuZCAia3ZtOmt2bV9leGl0IiwgYW5kIHJlcG9ydHMgc3RhdGlzdGljYWwgZGF0YSB3aGlj
aCBpbmNsdWRlcyBldmVudHMKPiBoYW5kbGVzIHRpbWUsIHNhbXBsZXMsIGFuZCBzbyBvbi4KPgo+
IENyb3NzIGNvbXBpbGluZyBwZXJmIGluIFg4NiBlbnZpcm9ubWVudCBtYXkgZW5jb3VudGVyIGlz
c3VlcyB3aXRoIG1pc3NpbmcKPiBsaWJyYXJpZXMgYW5kIHRvb2xzLiBTdWdnZXN0IGNvbXBpbGlu
ZyBuYXRpdmx5IGluIFJJU0MtViBlbnZpcm9ubWVudAo+Cj4gU2ltcGxlIHRlc3RzIGdvIGJlbG93
Ogo+Cj4gIyAuL3BlcmYga3ZtIHJlY29yZCAtZSAia3ZtOmt2bV9lbnRyeSIgLWUgImt2bTprdm1f
ZXhpdCIKPiBMb3dlcmluZyBkZWZhdWx0IGZyZXF1ZW5jeSByYXRlIGZyb20gNDAwMCB0byAyNTAw
Lgo+IFBsZWFzZSBjb25zaWRlciB0d2Vha2luZyAvcHJvYy9zeXMva2VybmVsL3BlcmZfZXZlbnRf
bWF4X3NhbXBsZV9yYXRlLgo+IFsgcGVyZiByZWNvcmQ6IFdva2VuIHVwIDE4IHRpbWVzIHRvIHdy
aXRlIGRhdGEgXQo+IFsgcGVyZiByZWNvcmQ6IENhcHR1cmVkIGFuZCB3cm90ZSA1LjQzMyBNQiBw
ZXJmLmRhdGEuZ3Vlc3QgKDYyNTE5IHNhbXBsZXMpCj4KPiAjIC4vcGVyZiBrdm0gcmVwb3J0Cj4g
MzFLIGt2bTprdm1fZW50cnkKPiAzMUsga3ZtOmt2bV9leGl0Cj4KPiAjIC4vcGVyZiBrdm0gc3Rh
dCByZWNvcmQgLWEKPiBbIHBlcmYgcmVjb3JkOiBXb2tlbiB1cCAzIHRpbWVzIHRvIHdyaXRlIGRh
dGEgXQo+IFsgcGVyZiByZWNvcmQ6IENhcHR1cmVkIGFuZCB3cm90ZSA4LjUwMiBNQiBwZXJmLmRh
dGEuZ3Vlc3QgKDk5MzM4IHNhbXBsZXMpIF0KPgo+ICMgLi9wZXJmIGt2bSBzdGF0IHJlcG9ydCAt
LWV2ZW50PXZtZXhpdAo+IEV2ZW50IG5hbWUgICAgICAgICAgICAgICAgU2FtcGxlcyAgIFNhbXBs
ZSUgICAgVGltZSAobnMpICAgICBUaW1lJSAgIE1heCBUaW1lIChucykgICBNaW4gVGltZSAobnMp
ICBNZWFuIFRpbWUgKG5zKQo+IFNUT1JFX0dVRVNUX1BBR0VfRkFVTFQgICAgIDI2OTY4ICAgICA1
NC4wMCUgICAgMjAwMzAzMTgwMCAgICA0MC4wMCUgICAgIDMzNjE0MDAgICAgICAgICAyNzYwMCAg
ICAgICAgICA3NDI3NAo+IExPQURfR1VFU1RfUEFHRV9GQVVMVCAgICAgIDE3NjQ1ICAgICAzNS4w
MCUgICAgMTE1MzMzODEwMCAgICAyMy4wMCUgICAgIDI1MTM0MDAgICAgICAgICAzMDgwMCAgICAg
ICAgICA2NTM2Mwo+IFZJUlRVQUxfSU5TVF9GQVVMVCAgICAgICAgIDEyNDcgICAgICAyLjAwJSAg
ICAgMzQwODIwODAwICAgICA2LjAwJSAgICAgIDExOTA4MDAgICAgICAgICA0MzMwMCAgICAgICAg
ICAyNzMzMTIKPiBJTlNUX0dVRVNUX1BBR0VfRkFVTFQgICAgICAxMTI4ICAgICAgMi4wMCUgICAg
IDM0MDY0NTgwMCAgICAgNi4wMCUgICAgICAyMTIzMjAwICAgICAgICAgMzAyMDAgICAgICAgICAg
MzAxOTkwCj4gU1VQRVJWSVNPUl9TWVNDQUxMICAgICAgICAgMTAxOSAgICAgIDIuMDAlICAgICAy
NDU5ODk5MDAgICAgIDQuMDAlICAgICAgMTg1MTUwMCAgICAgICAgIDI5MzAwICAgICAgICAgIDI0
MTQwMwo+IExPQURfQUNDRVNTICAgICAgICAgICAgICAgIDk4NiAgICAgICAxLjAwJSAgICAgNjcx
NTU2MjAwICAgICAxMy4wMCUgICAgIDQxODAyMDAgICAgICAgICAxMDA3MDAgICAgICAgICA2ODEw
OTEKPiBJTlNUX0FDQ0VTUyAgICAgICAgICAgICAgICA2NTUgICAgICAgMS4wMCUgICAgIDE3MDA1
NDgwMCAgICAgMy4wMCUgICAgICAxODA4MzAwICAgICAgICAgNTQ2MDAgICAgICAgICAgMjU5NjI1
Cj4gSFlQRVJWSVNPUl9TWVNDQUxMICAgICAgICAgMjEgICAgICAgIDAuMDAlICAgICA0Mjc2NDAw
ICAgICAgIDAuMDAlICAgICAgNzE2NTAwICAgICAgICAgIDExNjAwMCAgICAgICAgIDIwMzYzOAo+
Cj4gQ2hhbmdlcyBmcm9tIHYxLT52MjoKPiAtIFJlYmFzZWQgb24gTGludXggNi45LXJjMy4KPgo+
IENoYW5nZXMgZnJvbSB2Mi0+djM6Cj4gLSBBZGQgdGhlIG1pc3NpbmcgYXNzaWdubWVudCBmb3Ig
J3ZjcHVfaWRfc3RyJyBpbiBwYXRjaCAyLgo+IC0gUmVtb3ZlIHBhcmVudGhlc2VzIHRoYXQgY2F1
c2UgY29tcGlsYXRpb24gZXJyb3JzCj4KPiBTaGVubGluIExpYW5nICgyKToKPiAgIFJJU0NWOiBL
Vk06IGFkZCB0cmFjZXBvaW50cyBmb3IgZW50cnkgYW5kIGV4aXQgZXZlbnRzCj4gICBwZXJmIGt2
bS9yaXNjdjogUG9ydCBwZXJmIGt2bSBzdGF0IHRvIFJJU0MtVgo+Cj4gIGFyY2gvcmlzY3Yva3Zt
L3RyYWNlLmggICAgICAgICAgICAgICAgICAgICAgICB8IDY3ICsrKysrKysrKysrKysrKysKPiAg
YXJjaC9yaXNjdi9rdm0vdmNwdS5jICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDcgKysKPiAg
dG9vbHMvcGVyZi9hcmNoL3Jpc2N2L01ha2VmaWxlICAgICAgICAgICAgICAgIHwgIDEgKwo+ICB0
b29scy9wZXJmL2FyY2gvcmlzY3YvdXRpbC9CdWlsZCAgICAgICAgICAgICAgfCAgMSArCj4gIHRv
b2xzL3BlcmYvYXJjaC9yaXNjdi91dGlsL2t2bS1zdGF0LmMgICAgICAgICB8IDc5ICsrKysrKysr
KysrKysrKysrKysKPiAgLi4uL2FyY2gvcmlzY3YvdXRpbC9yaXNjdl9leGNlcHRpb25fdHlwZXMu
aCAgIHwgMzUgKysrKysrKysKPiAgNiBmaWxlcyBjaGFuZ2VkLCAxOTAgaW5zZXJ0aW9ucygrKQo+
ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9rdm0vdHJhY2UuaAo+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgdG9vbHMvcGVyZi9hcmNoL3Jpc2N2L3V0aWwva3ZtLXN0YXQuYwo+ICBjcmVhdGUg
bW9kZSAxMDA2NDQgdG9vbHMvcGVyZi9hcmNoL3Jpc2N2L3V0aWwvcmlzY3ZfZXhjZXB0aW9uX3R5
cGVzLmgKClF1ZXVlZCB0aGlzIHNlcmllcyBmb3IgTGludXgtNi4xMQoKVGhhbmtzLApBbnVwCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
