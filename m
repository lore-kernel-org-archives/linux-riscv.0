Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B18CCD184
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 10:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ulmc00OZxfo5FdOSjI6z/fqAwR2lQewvLmu6P8Rdds=; b=jiDfAHKVqqOGYr
	1oIt9VBpiQqFcA6xXchtm1X6TvjwZ90jYMyGj15rHPeeHpb7eviGsBYzYW44Dsx3XTH1oW5/Et+Ao
	ksBEMn3TzuRo2hYHYOOf8aR3HpRTTuaZqRjhsbASMRPByKdwVe05WhvqtuJE7y3i++/p654D/cXUJ
	QoHwTEhvf8QRYWjNFPkikPUrn6zb+9/BWT9OZegvhtaPCjwybCyvT0EU6CqNNzuKl3JpKDBkbvFk3
	9ZwyFFiKnV6350gsTST2p7earhhx112FAuwzE57ukckM23VfpKOGCQR/OmHL5Q5hoH9QL4nGYvJQQ
	fQ/gqStJDJ77ZQR/FRvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8bp1-0000000Fr1o-3Upz;
	Tue, 14 Oct 2025 09:59:59 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8boy-0000000FqxT-1MYU
	for linux-riscv@lists.infradead.org;
	Tue, 14 Oct 2025 09:59:58 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-57bd482dfd2so5148858e87.2
        for <linux-riscv@lists.infradead.org>; Tue, 14 Oct 2025 02:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1760435993; x=1761040793; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kGnwyF4jYSh+xrpmPEI3PovGZBe2hum4kk9xDbM3qa0=;
        b=KMKNp38gz/+aI/QRAMwz85wggorYSS4CZxVfXsMdIhZX5bgo0/d3+a4s3S+KLTigVg
         3fKrhKX2+MHbmEA8ZZ8kTINCKl071J+sFWpSxLOdObpxYs/wOh42+EOa4eNsgkSadAM2
         AprWpTX3O9Yxxxr/bkYE/BxtdGXU+4h7BDaZ09KVwkGsDhBohonGGw0pOupsUloK2M1n
         7+ZuPbzXIaRa0dRShFIWgf9zFd3Gz2umjjvj1+m+8WWBaj4zsvtvr3L60iliDihIYLWp
         3DlpTLD7dND42hcC5AppTVXxUADIKFOtpGLrX3kSC/NFgj+BpCDvuAOcLLorEqrFpGwu
         zS2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760435993; x=1761040793;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kGnwyF4jYSh+xrpmPEI3PovGZBe2hum4kk9xDbM3qa0=;
        b=ck++qPXfECaN0E+t1Qvo2Sr2sJzTS2YIw+PKDA9Xp9OjMMrAvrzGhTTQjzQgtxfmI3
         dNm1cRlsLM+K96Hg4B7c3NVDE7zTHlWNzw1g7sa6RwPtzTRz1U/w/76E30RMvZK2rBej
         TEWynbv17JhgN2+b+av5wS1U+YSYs/IYkKkHMIZyqx5k6qyuxKlibZb5m7wlO5uF1kMx
         pBv52nbPIaFqAycMHpxy+iHmEMpVi4cCbwmbbN9SnTYVebBri1eZL9sfTEamytNbg27A
         Dmqftmd9kj36b9ITQjPb5Uq7c6H0Vstz6dk9LBIvLlEKFScrdtlYQOJ+BYcxIlwU8MwQ
         pCTw==
X-Forwarded-Encrypted: i=1; AJvYcCV0Xxc408u694YpByBOkdOCBmgRPbq+dUnLOcX11J36deq27RzGOJCpOy10R0VtTYfsZ2FJsREpuQmRpA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxuWwlZTcQ/da5TMzY2cRMzI/hHKN+ZiJgOaJ/aPMKWu027gtK1
	0HPRo1r9bRgfczpctEbOBQm6f402Cv76EKaqTrMZM4OLjLrO+xVSO2V5rae5Rit6nhipa0NLcpK
	Zhfn/5GqGvJva2I2FWxlaN5EEs5oLZfgPx7rNcW+n8w==
X-Gm-Gg: ASbGnctVt+b5pyJj6G/LnbI0fkm0DTRZF1qDQP1qajD3LAX99vlwmgTBBOLO9PKN2uF
	pWSfLEBAfA40SzXPvMCCtrDDNPS4IcSmEEfPNod0T9AIR8uM8TrA5Kw4H1ilJNJW5Pp/ehZEwS7
	M3bEMsrxrrt+gGsVe/9LFGlXPmiR362roK2nRX9xbN+eqHJxzkMxg8rZ4cni6d0slIL04TnvnCB
	IOUqbVrSaEWYePeKMqJzNkRLA==
X-Google-Smtp-Source: AGHT+IFccA1E4PwdPeeKOGDJIdWhNIjb/k89kPVOnFoDhwCQaRYrKxTJ0bronuRsh6s3sU6ql3j1EwsME3Nk8U8WO64=
X-Received: by 2002:a05:6512:3b96:b0:576:d5df:fe1b with SMTP id
 2adb3069b0e04-5906d75f897mr6922565e87.10.1760435993287; Tue, 14 Oct 2025
 02:59:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250905122512.71684-1-apatel@ventanamicro.com>
In-Reply-To: <20250905122512.71684-1-apatel@ventanamicro.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 14 Oct 2025 15:29:42 +0530
X-Gm-Features: AS18NWDD6aRd1nI8wArqIOvocEcwVLyW7B4gNUAD7NAERHdf-8hTiE64kQnFO_w
Message-ID: <CAK9=C2V6QXbnnr-WmE4AeCviL5Or0qGisFugnLiNK6WDOsUHJw@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Enable HOTPLUG_PARALLEL for secondary CPUs
To: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_025956_406282_4CC4D090 
X-CRM114-Status: GOOD (  22.60  )
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
Cc: Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atish.patra@linux.dev>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBTZXAgNSwgMjAyNSBhdCA1OjU14oCvUE0gQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRh
bmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gVGhlIGNvcmUga2VybmVsIGFscmVhZHkgc3VwcG9ydHMg
cGFyYWxsZWwgYnJpbmd1cCBvZiBzZWNvbmRhcnkKPiBDUFVzIChha2EgSE9UUExVR19QQVJBTExF
TCkuIFRoZSB4ODYgYW5kIE1JUFMgYXJjaGl0ZWN0dXJlcwo+IGFscmVhZHkgdXNlIEhPVFBMVUdf
UEFSQUxMRUwgYW5kIEFSTSBpcyBhbHNvIG1vdmluZyB0b3dhcmQgaXQuCj4KPiBPbiBSSVNDLVYs
IHRoZXJlIGlzIG5vIGFyY2ggc3BlY2lmaWMgZ2xvYmFsIGRhdGEgYWNjZXNzZWQgaW4gdGhlCj4g
UklTQy1WIHNlY29uZGFyeSBDUFUgYnJpbmd1cCBwYXRoIHNvIGVuYWJsaW5nIEhPVFBMVUdfUEFS
QUxMRUwgZm9yCj4gUklTQy1WIHdvdWxkIG9ubHkgcmVxdWlyZXM6Cj4gMSkgUHJvdmlkaW5nIFJJ
U0MtViBzcGVjaWZpYyBhcmNoX2NwdWhwX2tpY2tfYXBfYWxpdmUoKQo+IDIpIENhbGxpbmcgY3B1
aHBfYXBfc3luY19hbGl2ZSgpIGZyb20gc21wX2NhbGxpbigpCj4KPiBUaGlzIHBhdGNoIGlzIHRl
c3RlZCBuYXRpdmVseSB3aXRoIE9wZW5TQkkgb24gUUVNVSBSVjY0IHZpcnQgbWFjaGluZQo+IHdp
dGggNjQgY29yZXMgYW5kIGFsc28gdGVzdGVkIHdpdGggS1ZNIFJJU0MtViBndWVzdCB3aXRoIDMy
IFZDUFVzLgo+Cj4gU2lnbmVkLW9mZi1ieTogQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNy
by5jb20+CgpGcmllbmRseSBwaW5nID8gQW55IGNvbW1lbnRzIG9uIHRoaXMgb25lID8KClJlZ2Fy
ZHMsCkFudXAKCj4gLS0tCj4gIGFyY2gvcmlzY3YvS2NvbmZpZyAgICAgICAgICB8ICAyICstCj4g
IGFyY2gvcmlzY3Yva2VybmVsL3NtcGJvb3QuYyB8IDE1ICsrKysrKysrKysrKysrKwo+ICAyIGZp
bGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L0tjb25maWcgYi9hcmNoL3Jpc2N2L0tjb25maWcKPiBpbmRleCBhNGIy
MzNhMDY1OWUuLmQ1ODAwZDZmOWExNSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L0tjb25maWcK
PiArKysgYi9hcmNoL3Jpc2N2L0tjb25maWcKPiBAQCAtMTk2LDcgKzE5Niw3IEBAIGNvbmZpZyBS
SVNDVgo+ICAgICAgICAgc2VsZWN0IEhBVkVfU0FNUExFX0ZUUkFDRV9ESVJFQ1RfTVVMVEkKPiAg
ICAgICAgIHNlbGVjdCBIQVZFX1NUQUNLUFJPVEVDVE9SCj4gICAgICAgICBzZWxlY3QgSEFWRV9T
WVNDQUxMX1RSQUNFUE9JTlRTCj4gLSAgICAgICBzZWxlY3QgSE9UUExVR19DT1JFX1NZTkNfREVB
RCBpZiBIT1RQTFVHX0NQVQo+ICsgICAgICAgc2VsZWN0IEhPVFBMVUdfUEFSQUxMRUwgaWYgSE9U
UExVR19DUFUKPiAgICAgICAgIHNlbGVjdCBJUlFfRE9NQUlOCj4gICAgICAgICBzZWxlY3QgSVJR
X0ZPUkNFRF9USFJFQURJTkcKPiAgICAgICAgIHNlbGVjdCBLQVNBTl9WTUFMTE9DIGlmIEtBU0FO
Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3NtcGJvb3QuYyBiL2FyY2gvcmlzY3Yv
a2VybmVsL3NtcGJvb3QuYwo+IGluZGV4IDYwMWEzMjFlMGYxNy4uZDg1OTE2YTM2NjBjIDEwMDY0
NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3NtcGJvb3QuYwo+ICsrKyBiL2FyY2gvcmlzY3Yv
a2VybmVsL3NtcGJvb3QuYwo+IEBAIC0zOSw3ICszOSw5IEBACj4KPiAgI2luY2x1ZGUgImhlYWQu
aCIKPgo+ICsjaWZuZGVmIENPTkZJR19IT1RQTFVHX1BBUkFMTEVMCj4gIHN0YXRpYyBERUNMQVJF
X0NPTVBMRVRJT04oY3B1X3J1bm5pbmcpOwo+ICsjZW5kaWYKPgo+ICB2b2lkIF9faW5pdCBzbXBf
cHJlcGFyZV9jcHVzKHVuc2lnbmVkIGludCBtYXhfY3B1cykKPiAgewo+IEBAIC0xNzksNiArMTgx
LDEyIEBAIHN0YXRpYyBpbnQgc3RhcnRfc2Vjb25kYXJ5X2NwdShpbnQgY3B1LCBzdHJ1Y3QgdGFz
a19zdHJ1Y3QgKnRpZGxlKQo+ICAgICAgICAgcmV0dXJuIC1FT1BOT1RTVVBQOwo+ICB9Cj4KPiAr
I2lmZGVmIENPTkZJR19IT1RQTFVHX1BBUkFMTEVMCj4gK2ludCBhcmNoX2NwdWhwX2tpY2tfYXBf
YWxpdmUodW5zaWduZWQgaW50IGNwdSwgc3RydWN0IHRhc2tfc3RydWN0ICp0aWRsZSkKPiArewo+
ICsgICAgICAgcmV0dXJuIHN0YXJ0X3NlY29uZGFyeV9jcHUoY3B1LCB0aWRsZSk7Cj4gK30KPiAr
I2Vsc2UKPiAgaW50IF9fY3B1X3VwKHVuc2lnbmVkIGludCBjcHUsIHN0cnVjdCB0YXNrX3N0cnVj
dCAqdGlkbGUpCj4gIHsKPiAgICAgICAgIGludCByZXQgPSAwOwo+IEBAIC0xOTksNiArMjA3LDcg
QEAgaW50IF9fY3B1X3VwKHVuc2lnbmVkIGludCBjcHUsIHN0cnVjdCB0YXNrX3N0cnVjdCAqdGlk
bGUpCj4KPiAgICAgICAgIHJldHVybiByZXQ7Cj4gIH0KPiArI2VuZGlmCj4KPiAgdm9pZCBfX2lu
aXQgc21wX2NwdXNfZG9uZSh1bnNpZ25lZCBpbnQgbWF4X2NwdXMpCj4gIHsKPiBAQCAtMjI1LDYg
KzIzNCwxMCBAQCBhc21saW5rYWdlIF9fdmlzaWJsZSB2b2lkIHNtcF9jYWxsaW4odm9pZCkKPiAg
ICAgICAgIG1tZ3JhYihtbSk7Cj4gICAgICAgICBjdXJyZW50LT5hY3RpdmVfbW0gPSBtbTsKPgo+
ICsjaWZkZWYgQ09ORklHX0hPVFBMVUdfUEFSQUxMRUwKPiArICAgICAgIGNwdWhwX2FwX3N5bmNf
YWxpdmUoKTsKPiArI2VuZGlmCj4gKwo+ICAgICAgICAgc3RvcmVfY3B1X3RvcG9sb2d5KGN1cnJf
Y3B1aWQpOwo+ICAgICAgICAgbm90aWZ5X2NwdV9zdGFydGluZyhjdXJyX2NwdWlkKTsKPgo+IEBA
IC0yNDMsNyArMjU2LDkgQEAgYXNtbGlua2FnZSBfX3Zpc2libGUgdm9pZCBzbXBfY2FsbGluKHZv
aWQpCj4gICAgICAgICAgKi8KPiAgICAgICAgIGxvY2FsX2ZsdXNoX2ljYWNoZV9hbGwoKTsKPiAg
ICAgICAgIGxvY2FsX2ZsdXNoX3RsYl9hbGwoKTsKPiArI2lmbmRlZiBDT05GSUdfSE9UUExVR19Q
QVJBTExFTAo+ICAgICAgICAgY29tcGxldGUoJmNwdV9ydW5uaW5nKTsKPiArI2VuZGlmCj4gICAg
ICAgICAvKgo+ICAgICAgICAgICogRGlzYWJsZSBwcmVlbXB0aW9uIGJlZm9yZSBlbmFibGluZyBp
bnRlcnJ1cHRzLCBzbyB3ZSBkb24ndCB0cnkgdG8KPiAgICAgICAgICAqIHNjaGVkdWxlIGEgQ1BV
IHRoYXQgaGFzbid0IGFjdHVhbGx5IHN0YXJ0ZWQgeWV0Lgo+IC0tCj4gMi40My4wCj4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
