Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9415CA0FFD
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Sep 2025 06:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6a15oygLyhLVvrVg4dTc02fAwGyEistJ8340EbUPnq0=; b=McDod4RwNMyJf6
	R/chaucpCGqM/vWkBRoDF8rYbmv2zWuax7dWDP9X0JQA/3uFrWFZ1cSkQfoBEiv0UophOgLIgn0vG
	VRWjqoFpoYtzsG+lyZXcb2pR72jkDFz20nCQzi+P9LTM8iG/S+IaU7ujD7UqFGfU2Y131Bz/Z+nWm
	nwuVCBZ9SxV6pJ2+N6i5/X7DWyRA7z/pJV5bkyl3/ieB/1Jwoc8SabI+qOIvn/z3KHM9jGqe3U5iP
	sde4NBmm2tYnGeba8MI/mcM0qfg7s7y8SNIAQwCxslhgINSCWx8cGHPWCH4Gy5RjZZeymxqiRhXHl
	y+qKt22Cw17x8x2er98A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usxk8-0000000BHnz-3qk8;
	Mon, 01 Sep 2025 06:10:16 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usxXs-0000000BFlj-1mVQ
	for linux-riscv@lists.infradead.org;
	Mon, 01 Sep 2025 05:57:37 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-61e47ee70d3so337021eaf.2
        for <linux-riscv@lists.infradead.org>; Sun, 31 Aug 2025 22:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1756706251; x=1757311051; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AeQYWbY1S4fZ+YczB8KbzZBm49i+mRKtPu5B3WoNWrY=;
        b=QyCScfTQtp9oPJ/SYl9r5cAZ4ZW62aRnS4Yx/Pk13+ZNf5dtrXIdPxwhpbS7nkTABN
         Oa9HCDFq2oP+zoliFIAyASVjwf2WXxW1K9SohGReY/J2HN++/T5e6KesnlYoV3HxU89r
         J7pYcVqkNMQwcPoeIs+VX9yWLwsLQA135FTbV9FUIF6bDChvov639cvhjXBcFSL+VuQB
         8jwByrE7tayux0Mb+rtdssL1W2PO9jJop2tLbA+ym3eG51M4ZyxVDpg/7DSbWOG8J6cH
         Bx55nzWjIAHV64sFOogb/PdelH4eMN60z3QK8KMfGPH39EDIrXlimY4UbIvkk40keKiJ
         uhzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756706251; x=1757311051;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AeQYWbY1S4fZ+YczB8KbzZBm49i+mRKtPu5B3WoNWrY=;
        b=oWoE7spD0KCHD0gLesE1JD4vNU5vx1oOXUthTEdRQ0G5pgUaEnt+J+vbeBpBCoCyWS
         U8ZJmZUj3uEmlfRYt7hqQWEOSXvilnG2ETyeVaxzy/MJQeSzLLGiOj/dcbIXAbcWMAdh
         tLLPNo5xki27MgYrAk6NMxlKHiFg1VxP6zl66yATJ5FQI5wX0AwVF/f16WJAgInHgRhC
         zzX6eCyWRjKTictayeyS1wrjkPAauiTMj6wlltGB4EA83GKqmUYNTs4gYf/ntfbYjeKZ
         NMNfc9Pc5Su4OTkOV4GJnH1SnAS/mGklc+5Z+kJU09XBlBF0py3Zv8hq3A9v59TQRz2E
         F4hw==
X-Forwarded-Encrypted: i=1; AJvYcCWsDN/b2ZVYe0ZMrhgETwx3G+GzCb7TT6NAWg8PhLC74UiGISTCqnd20OM7JAEMjojr0t2PzZFcgSI8eQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwSqMKTIM6JGP+Gv1OZtqfthsSImv4MmS5skNLvOM5on19VMRh3
	t9ZCmi/E/FTVj/Fd/Ui8TIIAdY/kfnW8bzS+xlSxunNjk36VhP9Vuk6FsldvhH6c8Z1+2tpl33x
	G+1sk9sBgq2Emc51ZFVz5WfJCNlou2hqM08zXRrxxow==
X-Gm-Gg: ASbGncu2SElIETSk9h9QzT/C/ea89Vm7oEtINNAWo1Ak4/XeQJigjcDqYgnIOvlx/VK
	Woy/v/Y/v+AlXkHJJENxilde3bnH2lmwrrmKug0bCS1zpx0TAQnfzVMDg/4HIDxHXIONTudrlZ4
	fbgjTaihyfjUDMKL3beYjl0OZFuRGDMJvDZ0nd+0E0sc+ape1bKOHo5vZ2Ce5z7CW+uQoAds3Jo
	BMogI9A4h/EQOudJpRFaPB0L5pemQ==
X-Google-Smtp-Source: AGHT+IEtvyL0v+dIqPd4cVuA9FY2MWzZGsXTxWqPBDg5RCf2ntrVdCNu37vpIo27yokw6idnCUTUmPkUJc2WW9ZSX9I=
X-Received: by 2002:a05:6808:14c2:b0:437:75a1:34ff with SMTP id
 5614622812f47-437f7dc9eadmr3255975b6e.43.1756706251452; Sun, 31 Aug 2025
 22:57:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250827100959.83023-1-cuiyunhui@bytedance.com>
 <20250827100959.83023-2-cuiyunhui@bytedance.com> <CAD=FV=WiZ5=4Ck3G2gme=ey6uYQhi-3Wo32DpLj9P53wxGCojw@mail.gmail.com>
In-Reply-To: <CAD=FV=WiZ5=4Ck3G2gme=ey6uYQhi-3Wo32DpLj9P53wxGCojw@mail.gmail.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Mon, 1 Sep 2025 13:57:20 +0800
X-Gm-Features: Ac12FXztNIRPMxCTXiinwhNyATXzi2utzF9owhxKyx-0keFQXx7jGWYBvVSkODg
Message-ID: <CAEEQ3wmBvevbkP8XmwR0_q_1QWQsie5g0UUxTFm6ovS1m41pEQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH 1/2] watchdog: refactor watchdog_hld functionality
To: Doug Anderson <dianders@chromium.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, atish.patra@linux.dev, anup@brainfault.org, will@kernel.org, 
	mark.rutland@arm.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, catalin.marinas@arm.com, 
	masahiroy@kernel.org, suzuki.poulose@arm.com, maz@kernel.org, 
	zhanjie9@hisilicon.com, yangyicong@hisilicon.com, mingo@kernel.org, 
	lihuafei1@huawei.com, akpm@linux-foundation.org, jpoimboe@kernel.org, 
	rppt@kernel.org, kees@kernel.org, thomas.weissschuh@linutronix.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_225736_604545_E5F7235B 
X-CRM114-Status: GOOD (  17.68  )
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

SGkgRG91ZywKCk9uIFNhdCwgQXVnIDMwLCAyMDI1IGF0IDU6MzTigK9BTSBEb3VnIEFuZGVyc29u
IDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+IHdyb3RlOgo+Cj4gSGksCj4KPiBPbiBXZWQsIEF1ZyAy
NywgMjAyNSBhdCAzOjEw4oCvQU0gWXVuaHVpIEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+
IHdyb3RlOgo+ID4KPiA+IE1vdmUgd2F0Y2hkb2dfaGxkLmMgdG8ga2VybmVsLywgYW5kIHJlbmFt
ZSBhcm1fcG11X2lycV9pc19ubWkoKQo+ID4gdG8gYXJjaF9wbXVfaXJxX2lzX25taSgpIGZvciBj
cm9zcy1hcmNoIHJldXNhYmlsaXR5Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFl1bmh1aSBDdWkg
PGN1aXl1bmh1aUBieXRlZGFuY2UuY29tPgo+ID4gLS0tCj4gPiAgYXJjaC9hcm02NC9rZXJuZWwv
TWFrZWZpbGUgICAgICAgICAgICAgICAgICAgfCAxIC0KPiA+ICBkcml2ZXJzL3BlcmYvYXJtX3Bt
dS5jICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KPiA+ICBpbmNsdWRlL2xpbnV4L25taS5o
ICAgICAgICAgICAgICAgICAgICAgICAgICB8IDEgKwo+ID4gIGluY2x1ZGUvbGludXgvcGVyZi9h
cm1fcG11LmggICAgICAgICAgICAgICAgIHwgMiAtLQo+ID4gIGtlcm5lbC9NYWtlZmlsZSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiArLQo+ID4gIHthcmNoL2FybTY0L2tlcm5lbCA9
PiBrZXJuZWx9L3dhdGNoZG9nX2hsZC5jIHwgOCArKysrKystLQo+ID4gIDYgZmlsZXMgY2hhbmdl
ZCwgOSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+ID4gIHJlbmFtZSB7YXJjaC9hcm02
NC9rZXJuZWwgPT4ga2VybmVsfS93YXRjaGRvZ19obGQuYyAoOTclKQo+Cj4gSSdtIG5vdCBhIGh1
Z2UgZmFuIG9mIHRoZSBwZXJmIGhhcmRsb2NrdXAgZGV0ZWN0b3IgYW5kIElNTyB3ZSBzaG91bGQK
PiBtYXliZSBqdXN0IGRlbGV0ZSBpdC4gVGh1cyBzcHJlYWRpbmcgaXQgdG8gc3VwcG9ydCBhIG5l
dyBhcmNoaXRlY3R1cmUKPiBpc24ndCBteSBmYXZvcml0ZSB0aGluZyB0byBkby4gQ2FuJ3QgeW91
IHVzZSB0aGUgYnVkZHkgaGFyZGxvY2t1cAo+IGRldGVjdG9yPwoKV2h5IGlzIHRoZXJlIGEgcGxh
biB0byByZW1vdmUgQ09ORklHX0hBUkRMT0NLVVBfREVURUNUT1JfUEVSRj8gQ291bGQKeW91IGV4
cGxhaW4gdGhlIHNwZWNpZmljIHJlYXNvbnM/IElzIHRoZSBjb21tdW5pdHkncyBmdXR1cmUgcGxh
biB0bwpmYXZvciBDT05GSUdfSEFSRExPQ0tVUF9ERVRFQ1RPUl9CVUREWT8KCj4KPiBUaGF0IGJl
aW5nIHNhaWQsIEkgZGlkIGEgcXVpY2sgbG9vayBhdCB5b3VyIHBhdGNoLiBJJ20gcHJldHR5IHN1
cmUgeW91Cj4gY2FuJ3QganVzdCBtb3ZlIHRoZSBhcm02NCAid2F0Y2hkb2dfaGxkLmMiIHRvIGJl
IGdlbmVyaWMuIFdvbid0Cj4gaHdfbm1pX2dldF9zYW1wbGVfcGVyaW9kKCkgY29uZmxpY3Qgd2l0
aCBldmVyeW9uZSBlbHNlJ3MgKHg4NiBhbmQKPiBwb3dlcnBjKT8KPgo+IC1Eb3VnCj4KClRoYW5r
cywKWXVuaHVpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
