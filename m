Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF791C61D97
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 20:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TMh/HYBmCV0Lhqap/oHrfagkMwv5p4iCptcsbBcbjuY=; b=IgxINvmgVHsOHx
	59hsIWJYPPZQNV6s0dGaknghxNrfoijGscDpYjZPwTXeMeClRfUooKNItPRtkW2g4e0Zqh6FU+AbP
	mG7xafkLr5TNLmCMT1s1L6uSHQjTPdLyKnoNocYl2eZ9NurqmyK3a0OPBhjgl/PJIqFVwOEXrJQrK
	T0N6VS6Tuhx7+nCx0iIFmcKuERaj2ve5yd0myPAiXEIT/raW4KBqmtiNh8qTb412zlCHJs5GWMoOk
	j71GgjOHCZR96Tk2XqXAq8OoNxg8VcBAs1D1P4tAXFwzTNtSz+TkGWS5egFkbueozUiDSROTj5HEe
	ycckKPjgLOBaTMUQnOyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5ta9-002zfz-27;
	Wed, 22 Nov 2023 20:12:21 +0000
Received: from mail-oa1-f53.google.com ([209.85.160.53])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5ta6-002zem-0O;
	Wed, 22 Nov 2023 20:12:19 +0000
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-1d542f05b9aso30636fac.1;
        Wed, 22 Nov 2023 12:12:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700683935; x=1701288735;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hRAUhzzHnP+XZxzQEXs8TfAKCs5HsmLQBIFGrTTFm+M=;
        b=TdvWCl/tCckqxuWdttROWJmVXgNmEvMl/D1lN3HmfR+GJmJ/ldYvmKN6a9baPY46AI
         s+1qLj+Jd4fcC4qydAJnQwEhXvSGLm+Y0zUFmS8+JfGrDMGqqLEEVeN3I3vvccAWKyOG
         26YryjKnUoCH9+ohqbKgvBuxtHGZv9hZIRY4m+cuwdmKPHGCSWY10QQOY4st/N9RMxST
         D3N5DqCRSwrPs5ySW5Js6JP3jUJkvYLn4D4wzq53WZe6XGE9eu/7vEMFn8LSrq1MUNKM
         mwi1NCCbb0b+3H257xuosF6X/CFZLLZpJGx1Y+TrEx1V6sQTMbI0The6c5VAvGnV/Y5m
         chPQ==
X-Gm-Message-State: AOJu0YyRM3XqA05o2F/PWHlYBDkp3lDG23XT2kJhTkCQNRBE8un+opSM
	E/voaxdIXFBNwNqM/lBGgpXbA5wOx/RvwTbQt6Q=
X-Google-Smtp-Source: AGHT+IH/N9ldr6Rfz2HMts22gtDdEZrdomZQ3Wqdv4io0UUWkzkPpVzYdpFHz7cSkxilm43rTrV9+lWFNT1vpjiJ/R4=
X-Received: by 2002:a05:6871:a58b:b0:1ea:1510:d8df with SMTP id
 wd11-20020a056871a58b00b001ea1510d8dfmr3742289oab.4.1700683935194; Wed, 22
 Nov 2023 12:12:15 -0800 (PST)
MIME-Version: 1.0
References: <ZVyz/Ve5pPu8AWoA@shell.armlinux.org.uk> <E1r5R2m-00Csyb-2S@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1r5R2m-00Csyb-2S@rmk-PC.armlinux.org.uk>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 22 Nov 2023 21:12:04 +0100
Message-ID: <CAJZ5v0jbjykNooJ_PvkOjpE6hA0QFJUw+kpwYfNY7jOtkcPA0Q@mail.gmail.com>
Subject: Re: [PATCH 02/21] x86: intel_epb: Don't rely on link order
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: linux-pm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev, x86@kernel.org, 
	linux-csky@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, 
	Salil Mehta <salil.mehta@huawei.com>, Jean-Philippe Brucker <jean-philippe@linaro.org>, jianyong.wu@arm.com, 
	justin.he@arm.com, James Morse <james.morse@arm.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_121218_157473_DC2B0348 
X-CRM114-Status: GOOD (  18.57  )
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

T24gVHVlLCBOb3YgMjEsIDIwMjMgYXQgMjo0NOKAr1BNIFJ1c3NlbGwgS2luZyA8cm1rK2tlcm5l
bEBhcm1saW51eC5vcmcudWs+IHdyb3RlOgo+Cj4gRnJvbTogSmFtZXMgTW9yc2UgPGphbWVzLm1v
cnNlQGFybS5jb20+Cj4KPiBpbnRlbF9lcGJfaW5pdCgpIGlzIGNhbGxlZCBhcyBhIHN1YnN5c19p
bml0Y2FsbCgpIHRvIHJlZ2lzdGVyIGNwdWhwCj4gY2FsbGJhY2tzLiBUaGUgY2FsbGJhY2tzIG1h
a2UgdXNlIG9mIGdldF9jcHVfZGV2aWNlKCkgd2hpY2ggd2lsbCByZXR1cm4KPiBOVUxMIHVubGVz
cyByZWdpc3Rlcl9jcHUoKSBoYXMgYmVlbiBjYWxsZWQuIHJlZ2lzdGVyX2NwdSgpIGlzIGNhbGxl
ZAo+IGZyb20gdG9wb2xvZ3lfaW5pdCgpLCB3aGljaCBpcyBhbHNvIGEgc3Vic3lzX2luaXRjYWxs
KCkuCj4KPiBUaGlzIGlzIGZyYWdpbGUuIE1vdmluZyB0aGUgcmVnaXN0ZXJfY3B1KCkgdG8gYSBk
aWZmZXJlbnQKPiBzdWJzeXNfaW5pdGNhbGwoKSAgbGVhZHMgdG8gYSBOVUxMIGRlcmVmZXJlbmNl
IGR1cmluZyBib290Lgo+Cj4gTWFrZSBpbnRlbF9lcGJfaW5pdCgpIGEgbGF0ZV9pbml0Y2FsbCgp
LCB1c2VyLXNwYWNlIGNhbid0IHByb3ZpZGUgYQo+IHBvbGljeSBiZWZvcmUgdGhpcyBwb2ludCBh
bnl3YXkuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBNb3JzZSA8amFtZXMubW9yc2VAYXJtLmNv
bT4KPiBSZXZpZXdlZC1ieTogR2F2aW4gU2hhbiA8Z3NoYW5AcmVkaGF0LmNvbT4KPiBTaWduZWQt
b2ZmLWJ5OiBSdXNzZWxsIEtpbmcgKE9yYWNsZSkgPHJtaytrZXJuZWxAYXJtbGludXgub3JnLnVr
PgoKQWNrZWQtYnk6IFJhZmFlbCBKLiBXeXNvY2tpIDxyYWZhZWwuai53eXNvY2tpQGludGVsLmNv
bT4KCmFuZCBJJ2Qgc3VnZ2VzdCBzZW5kaW5nIHRoaXMgc2VwYXJhdGVseSB0byB0aGUgeDg2IGxp
c3QuCgo+IC0tLQo+IHN1YnN5c19pbml0Y2FsbF9zeW5jKCkgd291bGQgYmUgYW4gb3B0aW9uLCBi
dXQgbW92aW5nIHRoZSByZWdpc3Rlcl9jcHUoKQo+IGNhbGxzIGludG8gQUNQSSBhbHNvIG1lYW5z
IGFkZGluZyBhIHNhZmV0eSBuZXQgZm9yIENQVXMgdGhhdCBhcmUgb25saW5lCj4gYnV0IG5vdCBk
ZXNjcmliZWQgcHJvcGVybHkgYnkgZmlybXdhcmUuIFRoaXMgbGl2ZXMgaW4gc3Vic3lzX2luaXRj
YWxsX3N5bmMoKS4KPiAtLS0KPiAgYXJjaC94ODYva2VybmVsL2NwdS9pbnRlbF9lcGIuYyB8IDIg
Ky0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBk
aWZmIC0tZ2l0IGEvYXJjaC94ODYva2VybmVsL2NwdS9pbnRlbF9lcGIuYyBiL2FyY2gveDg2L2tl
cm5lbC9jcHUvaW50ZWxfZXBiLmMKPiBpbmRleCBlNGMzYmE5MTMyMWMuLmYxOGQzNWZlMjdhOSAx
MDA2NDQKPiAtLS0gYS9hcmNoL3g4Ni9rZXJuZWwvY3B1L2ludGVsX2VwYi5jCj4gKysrIGIvYXJj
aC94ODYva2VybmVsL2NwdS9pbnRlbF9lcGIuYwo+IEBAIC0yMzcsNCArMjM3LDQgQEAgc3RhdGlj
IF9faW5pdCBpbnQgaW50ZWxfZXBiX2luaXQodm9pZCkKPiAgICAgICAgIGNwdWhwX3JlbW92ZV9z
dGF0ZShDUFVIUF9BUF9YODZfSU5URUxfRVBCX09OTElORSk7Cj4gICAgICAgICByZXR1cm4gcmV0
Owo+ICB9Cj4gLXN1YnN5c19pbml0Y2FsbChpbnRlbF9lcGJfaW5pdCk7Cj4gK2xhdGVfaW5pdGNh
bGwoaW50ZWxfZXBiX2luaXQpOwo+IC0tCj4gMi4zMC4yCj4KPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
