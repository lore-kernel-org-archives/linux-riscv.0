Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5129CCD193
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Oct 2025 21:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Iik8konttwQQGaZ2225X8KFFWHeUAHh8seoVZ5jT1Mg=; b=KAig+aIOqSW2rs
	iC/Y0yjqUnkztINoU8C6THnJ+Tqcj8fPo7kAUWKHCfhOlylJaWEfg7YUooWzOoOyjp9DM68+d9BwQ
	huuVzlP+NsOe9Ah1G2FZ8tHmUwIy+yv4npwYbyzgmZWU+PTfHK7r7oru0/v77Yyf3cXvGK9LT5Lbs
	rXTSlkQ7znt1qEqG3tWfVm18Ibpa1b0M/ZMAqH3l33gHbkWe355hQTi2OD9h9TY5sULgxano8nzxk
	SZ65YgW9L5dCavCSQq+ofhXNC740j9OBxXu+VDAc4ef2oVacW5ad/SjlnsellMm2zY8672yvRAwwV
	vASz37QbZYLPuBnTb7MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v996e-00000002wsY-2V8A;
	Wed, 15 Oct 2025 21:32:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v996d-00000002wrp-292h
	for linux-riscv@bombadil.infradead.org;
	Wed, 15 Oct 2025 21:32:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=an2G/9d47hEEnOP9myHHqMnuHCaBvnAN8tAqBfiHYNY=; b=JOiF2jjJjCTDYGG3/61DHi5sME
	55qeTdfKq6SI2Qqn56fQO+zNrS7WXnpspztX/I0OWScOHGSKndFSXZFEPX1nHXxI2pil0UL64tzZw
	txCtnFFnCrXeg0kJ7/+0qMF/zkbVHhtmgBqPQTzyd2ew+h/WjUMMdKL+sFp2JrIFDHeUVLHe1QPEw
	FgAjAZNCTYOI58gRlTa2u2d3glyF1OQNK+BOvTTcq57AXDN5UargNvz+LCSPF9awk8ERM9DV+aAG3
	vQmtuyDI7D1BJ7hodGv3HU57uHo3SUwwFkwiwwQmosHtrkL+tdhx6BwztIUiGUxh9VeCZwxi3PLpy
	8iW9Cm6g==;
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v996Y-00000006Hi0-3Kit
	for linux-riscv@lists.infradead.org;
	Wed, 15 Oct 2025 21:32:22 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-637dbabdb32so2933a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 15 Oct 2025 14:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760563937; x=1761168737; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=an2G/9d47hEEnOP9myHHqMnuHCaBvnAN8tAqBfiHYNY=;
        b=WDOPWIwC0woqR68mEArG1Hc3ndg1FIcAvEo7DF7SGfLRU0bdR/uCkFI6n/kJXl9SK9
         PtGnnJaSaePaDWBFJw9ccvidxZ8UO8QiF6NACseWuZEdZPM9mdFdIKgKfADHgi66Kmk5
         ++GIQbVG3ayVszA3d7J/RyUGhJwDPV0Zbqn1Je9BdE0gXxLjldWwCLa6PPzMfOjNOlzt
         4ZdfDCMAv5bfJcwJjvIrdHvgHKpFgCrlH2z7ZHkRCitbJY6mLbdWkFgr5ZA5T68cowgq
         W2YRqi8m1xFUAgJhDXICMNht15wyBxc2UHZbQ6Wlbr9wa5j2gABrF0D6eIiB+G0tTCpL
         wmMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760563937; x=1761168737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=an2G/9d47hEEnOP9myHHqMnuHCaBvnAN8tAqBfiHYNY=;
        b=lxfbxF+vlOb4iIIG6U9gSV/8z7IK3CIZ4MNNlyOgUVtAhEnX9aVysAJPyF08j1Lp88
         R0XGwsHDAbBJyJBkj7e9mCa6HGd5to+ZfNnU4JsZwQu9AiCbcPSkujnu7PjfyH+Jd14w
         tC9x0Smg0sJH7WkYFg+64iicXW4tQzUlHEuNzl5pIB2i6zDpObHTT5DMK31eJua0dbIT
         X/f3C/r3aClYgs+DmNcLxQOCVPwN4/rAI436f3hxCtwGwN7KGI+CouhPpkOrKQyaLycJ
         okWE5Xs4lpiueT7B2OzDqjuuxeIxMU71jBevn4ELHuAgAz3n/rbWbBRPeyHbB589S1JG
         g2JA==
X-Gm-Message-State: AOJu0YznCz8+LsdLuYkNWdKhq8B1l4wxZWX7d3WdbaTzx74fIubjzAA0
	SFp1CAaS8oTsgvMkKuupX+UHh8nQCBHv+ofxpx5L98Ibn6oqs3lIb8VUSjcuAlYuvnKhFXwl54z
	kDf20JTo4785LhKOmn/mSHt/6vhf1Jjo=
X-Gm-Gg: ASbGnctMMBgwts/p2w8SUPOUBPc3kDngiNT2LJRb3m5KYuDUrgQZWOfuvZXH7VqBE3J
	9uB6IJ4O2BrEErNntI7LsUiyOkEwYrzfIlBjTkIYV5tRrxmt8JYyqLkx2uIJkwYa01R4Bj7sh6Q
	cOesGohl2I+6mfdF+AayuKl6efDa1yP/yzJU5wc84966navgw2Ny0eanyMk8tO8iVspcEHl2QxW
	ew2UrpBGpoO93kfMElP42HZ36N6N2rG2w==
X-Google-Smtp-Source: AGHT+IETKXp4XkWEQ4U32sIWCcsCD1bfRNMB8NWYLayln3kcDdXtKdJRAQEty2d2BGBYtgl6wpMhbm29twcjTOJnDpM=
X-Received: by 2002:a05:6402:34d1:b0:63c:343:2485 with SMTP id
 4fb4d7f45d1cf-63c03439d20mr349068a12.3.1760563936779; Wed, 15 Oct 2025
 14:32:16 -0700 (PDT)
MIME-Version: 1.0
References: <20251007115840.2320557-1-geomatsi@gmail.com> <20251007115840.2320557-5-geomatsi@gmail.com>
 <CAFTtA3MObvXRHxbULghGcT=ThrBDeFDJzUY7LOhgNnarzpYeGg@mail.gmail.com>
In-Reply-To: <CAFTtA3MObvXRHxbULghGcT=ThrBDeFDJzUY7LOhgNnarzpYeGg@mail.gmail.com>
From: Andy Chiu <andybnac@gmail.com>
Date: Wed, 15 Oct 2025 16:32:05 -0500
X-Gm-Features: AS18NWAGi9Py3C8rtbFuAwojqdEayvWFLUvCpApDZcPh7rosVGDCcfhgBNv2VKo
Message-ID: <CAFTtA3NoOZEMqYD6+vjP=09T15GiThjVy1LeDX0U8CC-4HMKOA@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] riscv: vector: allow to force vector context save
To: Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Oleg Nesterov <oleg@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Thomas Huth <thuth@redhat.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Han Gao <rabenda.cn@gmail.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Nam Cao <namcao@linutronix.de>, 
	Joel Granados <joel.granados@kernel.org>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_223220_278709_2F19A2BA 
X-CRM114-Status: GOOD (  33.09  )
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

T24gV2VkLCBPY3QgMTUsIDIwMjUgYXQgMzoxOOKAr1BNIEFuZHkgQ2hpdSA8YW5keWJuYWNAZ21h
aWwuY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgT2N0IDcsIDIwMjUgYXQgNjo1OOKAr0FNIFNlcmdl
eSBNYXR5dWtldmljaCA8Z2VvbWF0c2lAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBXaGVuIHB0
cmFjZSB1cGRhdGVzIHZlY3RvciBDU1IgcmVnaXN0ZXJzIGZvciBhIHRyYWNlZCBwcm9jZXNzLCB0
aGUKPiA+IGNoYW5nZXMgbWF5IG5vdCBiZSBpbW1lZGlhdGVseSB2aXNpYmxlIHRvIHRoZSBuZXh0
IHB0cmFjZSBvcGVyYXRpb25zCj4gPiBkdWUgdG8gdmVjdG9yIGNvbnRleHQgc3dpdGNoIG9wdGlt
aXphdGlvbnMuCj4gPgo+ID4gVGhlIGZ1bmN0aW9uICdyaXNjdl92X3ZzdGF0ZV9zYXZlJyBzYXZl
cyBjb250ZXh0IG9ubHkgaWYgbXN0YXR1cy5WUyBpcwo+ID4gJ2RpcnR5Jy4gSG93ZXZlciBtc3Rh
dHVzLlZTIG9mIHRoZSB0cmFjZWQgcHJvY2VzcyBjb250ZXh0IG1heSByZW1haW4KPiA+ICdjbGVh
bicgYmV0d2VlbiB0d28gYnJlYWtwb2ludHMsIGlmIG5vIHZlY3RvciBpbnN0cnVjdGlvbnMgd2Vy
ZSBleGVjdXRlZAo+ID4gYmV0d2VlbiB0aG9zZSB0d28gYnJlYWtwb2ludHMuIEluIHRoaXMgY2Fz
ZSB0aGUgdmVjdG9yIGNvbnRleHQgd2lsbCBub3QKPiA+IGJlIHNhdmVkIGF0IHRoZSBzZWNvbmQg
YnJlYWtwb2ludC4gQXMgYSByZXN1bHQsIHRoZSBzZWNvbmQgcHRyYWNlIG1heQo+ID4gcmVhZCBz
dGFsZSB2ZWN0b3IgQ1NSIHZhbHVlcy4KPgo+IElJVUMsIHRoZSBzZWNvbmQgcHRyYWNlIHNob3Vs
ZCBub3QgZ2V0IHRoZSBzdGFsZSB2ZWN0b3IgQ1NSIHZhbHVlcy4KPiBUaGUgc2Vjb25kIHJpc2N2
X3ZyX2dldCgpIHNob3VsZCBiZSByZWFkaW5nIGZyb20gdGhlIGNvbnRleHQgbWVtb3J5Cj4gKHZz
dGF0ZSksIHdoaWNoIGlzIHVwZGF0ZWQgZnJvbSB0aGUgbGFzdCByaXNjdl92cl9zZXQoKS4gVGhl
IHVzZXIncwo+IHZzdGF0ZSBzaG91bGQgcmVtYWluIHRoZSBzYW1lIHNpbmNlIGxhc3QgcmlzY3Zf
dnJfc2V0KCkuIENvdWxkIHlvdQo+IGV4cGxhaW4gbW9yZSBvbiBob3cgdGhpcyBidWcgaXMgb2Jz
ZXJ2ZWQgYW5kIHdoeSBvbmx5IENTUnMgYXJlCj4gYWZmZWN0ZWQgYnV0IG5vdCB2LXJlZ3MgYXMg
d2VsbD8KCkZyb20gbG9va2luZyBpbnRvIHlvdXIgdGVzdCwgSSBjYW4gc2VlIHRoYXQgeW91IHdl
cmUgdHJ5aW5nIHRvIHNldCBhbgppbnZhbGlkIGNvbmZpZ3VyYXRpb24gdG8gVmV0b3IgQ1NScyBh
bmQgZXhwZWN0IHZpbGwgdG8gYmUgcmVmbGVjdGVkCnVwb24gbmV4dCByZWFkLiBZZXMsIHRoaXMg
aXMgbm90IGhhcHBlbmluZyBvbiB0aGUgY3VycmVudAppbXBsZW1lbnRhdGlvbiBhcyBpdCB3YXMg
bm90IGV4cGVjdGluZyBpbnZhbGlkIGlucHV0IGZyb20gdGhlIHVzZXIsCndoaWNoIHNob3VsZCBi
ZSB0YWtlbiBpbnRvIGNvbnNpZGVyYXRpb24uIFRoYW5rcyBmb3Igc3BvdHRpbmcgdGhlCmNhc2Uh
CgpBY2NvcmRpbmcgdG8gdGhlIHNwZWMsICJUaGUgdXNlIG9mIHZ0eXBlIGVuY29kaW5ncyB3aXRo
IExNVUwgPApTRVdNSU4vRUxFTiBpcyByZXNlcnZlZCwgaW1wbGVtZW50YXRpb25zIGNhbiBzZXQg
dmlsbCBpZiB0aGV5IGRvIG5vdApzdXBwb3J0IHRoZXNlIGNvbmZpZ3VyYXRpb25zLiIgVGhpcyBt
ZWFuIHRoZSBpbXBsZW1lbnRhdGlvbiBtYXkKYWN0dWFsbHkgc3VwcG9ydCB0aGlzIGNvbmZpZ3Vy
YXRpb24uIElmIHRoYXQgaXMgdGhlIGNhc2UsIEkgdGhpbmsgd2UKc2hvdWxkIG5vdCBhbGxvdyB0
aGlzIHRvIGJlIGNvbmZpZ3VyZWQgdGhyb3VnaCB0aGUgdmVjdG9yIHB0cmFjZQppbnRlcmZhY2Us
IHdoaWNoIGlzIGRlc2lnbmVkIHRvIHN1cHBvcnQgMS4wIChhbmQgMC43KSBzcGVjcy4gVGhhdApt
ZWFucywgd2Ugc2hvdWxkIG5vdCBhbGxvdyB0aGlzIHByb2JsZW1hdGljIGNvbmZpZ3VyYXRpb24g
dG8gcGFzcwp0aHJvdWdoIHJpc2N2X3ZyX3NldCgpLCByZWFjaCB1c2VyIHNwYWNlLCB0aGVuIHRo
ZSBmb3JjZWQgc2F2ZS4KCkkgd291bGQgb3B0IGZvciB2YWxpZGF0aW5nIGFsbCBDU1IgY29uZmln
dXJhdGlvbnMgaW4gdGhlIGZpcnN0IHBsYWNlLgpDb3VsZCB5b3UgYWxzbyBoZWxwIGVuZm9yY2Ug
Y2hlY2tzIG9uIG90aGVyIHJlc2VydmVkIGJpdHMgYXMgd2VsbD8KClRoYW5rcywKQW5keQoKPgo+
IFRoYW5rcywKPiBBbmR5Cj4KPiA+Cj4gPiBGaXggdGhpcyBieSBpbnRyb2R1Y2luZyBhIFRJRiBm
bGFnIHRoYXQgZm9yY2VzIHZlY3RvciBjb250ZXh0IHNhdmUgb24KPiA+IHRoZSBuZXh0IGNvbnRl
eHQgc3dpdGNoLCByZWdhcmRsZXNzIG9mIG1zdGF0dXMuVlMgc3RhdGUuIFNldCB0aGlzCj4gPiBm
bGFnIG9uIHB0cmFjZSBvcHJhdGlvbnMgdGhhdCBtb2RpZnkgdmVjdG9yIENTUiByZWdpc3RlcnMu
Cj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogU2VyZ2V5IE1hdHl1a2V2aWNoIDxnZW9tYXRzaUBnbWFp
bC5jb20+Cj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3RocmVhZF9pbmZvLmgg
fCAyICsrCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZWN0b3IuaCAgICAgIHwgMyArKysK
PiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9wcm9jZXNzLmMgICAgICAgICAgfCAyICsrCj4gPiAgYXJj
aC9yaXNjdi9rZXJuZWwvcHRyYWNlLmMgICAgICAgICAgIHwgNSArKysrKwo+ID4gIDQgZmlsZXMg
Y2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3RocmVhZF9pbmZvLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3RocmVh
ZF9pbmZvLmgKPiA+IGluZGV4IDgzNmQ4MGRkMjkyMS4uZTA1ZTlhYTg5YzQzIDEwMDY0NAo+ID4g
LS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90aHJlYWRfaW5mby5oCj4gPiArKysgYi9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL3RocmVhZF9pbmZvLmgKPiA+IEBAIC0xMTgsNyArMTE4LDkgQEAg
aW50IGFyY2hfZHVwX3Rhc2tfc3RydWN0KHN0cnVjdCB0YXNrX3N0cnVjdCAqZHN0LCBzdHJ1Y3Qg
dGFza19zdHJ1Y3QgKnNyYyk7Cj4gPgo+ID4gICNkZWZpbmUgVElGXzMyQklUICAgICAgICAgICAg
ICAgICAgICAgIDE2ICAgICAgLyogY29tcGF0LW1vZGUgMzJiaXQgcHJvY2VzcyAqLwo+ID4gICNk
ZWZpbmUgVElGX1JJU0NWX1ZfREVGRVJfUkVTVE9SRSAgICAgIDE3ICAgICAgLyogcmVzdG9yZSBW
ZWN0b3IgYmVmb3JlIHJldHVyaW5nIHRvIHVzZXIgKi8KPiA+ICsjZGVmaW5lIFRJRl9SSVNDVl9W
X0ZPUkNFX1NBVkUgICAgICAgICAxMyAgICAgIC8qIGZvcmNlIFZlY3RvciBjb250ZXh0IHNhdmUg
Ki8KPiA+Cj4gPiAgI2RlZmluZSBfVElGX1JJU0NWX1ZfREVGRVJfUkVTVE9SRSAgICAgQklUKFRJ
Rl9SSVNDVl9WX0RFRkVSX1JFU1RPUkUpCj4gPiArI2RlZmluZSBfVElGX1JJU0NWX1ZfRk9SQ0Vf
U0FWRSAgICAgICAgICAgICAgICBCSVQoVElGX1JJU0NWX1ZfRk9SQ0VfU0FWRSkKPiA+Cj4gPiAg
I2VuZGlmIC8qIF9BU01fUklTQ1ZfVEhSRUFEX0lORk9fSCAqLwo+ID4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vdmVjdG9yLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Zl
Y3Rvci5oCj4gPiBpbmRleCBiNjE3ODZkNDNjMjAuLmQzNzcwZTEzZGE5MyAxMDA2NDQKPiA+IC0t
LSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmVjdG9yLmgKPiA+ICsrKyBiL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vdmVjdG9yLmgKPiA+IEBAIC0zNzAsNiArMzcwLDkgQEAgc3RhdGljIGlubGlu
ZSB2b2lkIF9fc3dpdGNoX3RvX3ZlY3RvcihzdHJ1Y3QgdGFza19zdHJ1Y3QgKnByZXYsCj4gPiAg
ewo+ID4gICAgICAgICBzdHJ1Y3QgcHRfcmVncyAqcmVnczsKPiA+Cj4gPiArICAgICAgIGlmICh0
ZXN0X2FuZF9jbGVhcl90c2tfdGhyZWFkX2ZsYWcocHJldiwgVElGX1JJU0NWX1ZfRk9SQ0VfU0FW
RSkpCj4gPiArICAgICAgICAgICAgICAgX19yaXNjdl92X3ZzdGF0ZV9kaXJ0eSh0YXNrX3B0X3Jl
Z3MocHJldikpOwo+ID4gKwo+ID4gICAgICAgICBpZiAocmlzY3ZfcHJlZW1wdF92X3N0YXJ0ZWQo
cHJldikpIHsKPiA+ICAgICAgICAgICAgICAgICBpZiAocmlzY3Zfdl9pc19vbigpKSB7Cj4gPiAg
ICAgICAgICAgICAgICAgICAgICAgICBXQVJOX09OKHByZXYtPnRocmVhZC5yaXNjdl92X2ZsYWdz
ICYgUklTQ1ZfVl9DVFhfREVQVEhfTUFTSyk7Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9r
ZXJuZWwvcHJvY2Vzcy5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jCj4gPiBpbmRleCAz
MWEzOTI5OTNjYjQuLjQ3OTU5YzU1Y2VmYiAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3Yva2Vy
bmVsL3Byb2Nlc3MuYwo+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jCj4gPiBA
QCAtMTgzLDYgKzE4Myw3IEBAIHZvaWQgZmx1c2hfdGhyZWFkKHZvaWQpCj4gPiAgICAgICAgIGtm
cmVlKGN1cnJlbnQtPnRocmVhZC52c3RhdGUuZGF0YXApOwo+ID4gICAgICAgICBtZW1zZXQoJmN1
cnJlbnQtPnRocmVhZC52c3RhdGUsIDAsIHNpemVvZihzdHJ1Y3QgX19yaXNjdl92X2V4dF9zdGF0
ZSkpOwo+ID4gICAgICAgICBjbGVhcl90c2tfdGhyZWFkX2ZsYWcoY3VycmVudCwgVElGX1JJU0NW
X1ZfREVGRVJfUkVTVE9SRSk7Cj4gPiArICAgICAgIGNsZWFyX3Rza190aHJlYWRfZmxhZyhjdXJy
ZW50LCBUSUZfUklTQ1ZfVl9GT1JDRV9TQVZFKTsKPiA+ICAjZW5kaWYKPiA+ICAjaWZkZWYgQ09O
RklHX1JJU0NWX0lTQV9TVVBNCj4gPiAgICAgICAgIGlmIChyaXNjdl9oYXNfZXh0ZW5zaW9uX3Vu
bGlrZWx5KFJJU0NWX0lTQV9FWFRfU1VQTSkpCj4gPiBAQCAtMjA1LDYgKzIwNiw3IEBAIGludCBh
cmNoX2R1cF90YXNrX3N0cnVjdChzdHJ1Y3QgdGFza19zdHJ1Y3QgKmRzdCwgc3RydWN0IHRhc2tf
c3RydWN0ICpzcmMpCj4gPiAgICAgICAgIG1lbXNldCgmZHN0LT50aHJlYWQudnN0YXRlLCAwLCBz
aXplb2Yoc3RydWN0IF9fcmlzY3Zfdl9leHRfc3RhdGUpKTsKPiA+ICAgICAgICAgbWVtc2V0KCZk
c3QtPnRocmVhZC5rZXJuZWxfdnN0YXRlLCAwLCBzaXplb2Yoc3RydWN0IF9fcmlzY3Zfdl9leHRf
c3RhdGUpKTsKPiA+ICAgICAgICAgY2xlYXJfdHNrX3RocmVhZF9mbGFnKGRzdCwgVElGX1JJU0NW
X1ZfREVGRVJfUkVTVE9SRSk7Cj4gPiArICAgICAgIGNsZWFyX3Rza190aHJlYWRfZmxhZyhkc3Qs
IFRJRl9SSVNDVl9WX0ZPUkNFX1NBVkUpOwo+ID4KPiA+ICAgICAgICAgcmV0dXJuIDA7Cj4gPiAg
fQo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3B0cmFjZS5jIGIvYXJjaC9yaXNj
di9rZXJuZWwvcHRyYWNlLmMKPiA+IGluZGV4IDkwNmNmMTE5N2VkYy4uNTY5Zjc1NmJlZjIzIDEw
MDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvcHRyYWNlLmMKPiA+ICsrKyBiL2FyY2gv
cmlzY3Yva2VybmVsL3B0cmFjZS5jCj4gPiBAQCAtMTQ4LDYgKzE0OCwxMSBAQCBzdGF0aWMgaW50
IHJpc2N2X3ZyX3NldChzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRhcmdldCwKPiA+ICAgICAgICAgaWYg
KHZzdGF0ZS0+dmxlbmIgIT0gcHRyYWNlX3ZzdGF0ZS52bGVuYikKPiA+ICAgICAgICAgICAgICAg
ICByZXR1cm4gLUVJTlZBTDsKPiA+Cj4gPiArICAgICAgIGlmICh2c3RhdGUtPnZ0eXBlICE9IHB0
cmFjZV92c3RhdGUudnR5cGUgfHwKPiA+ICsgICAgICAgICAgIHZzdGF0ZS0+dmNzciAhPSBwdHJh
Y2VfdnN0YXRlLnZjc3IgfHwKPiA+ICsgICAgICAgICAgIHZzdGF0ZS0+dmwgIT0gcHRyYWNlX3Zz
dGF0ZS52bCkKPiA+ICsgICAgICAgICAgICAgICBzZXRfdHNrX3RocmVhZF9mbGFnKHRhcmdldCwg
VElGX1JJU0NWX1ZfRk9SQ0VfU0FWRSk7Cj4gPiArCj4gPiAgICAgICAgIHZzdGF0ZS0+dnN0YXJ0
ID0gcHRyYWNlX3ZzdGF0ZS52c3RhcnQ7Cj4gPiAgICAgICAgIHZzdGF0ZS0+dmwgPSBwdHJhY2Vf
dnN0YXRlLnZsOwo+ID4gICAgICAgICB2c3RhdGUtPnZ0eXBlID0gcHRyYWNlX3ZzdGF0ZS52dHlw
ZTsKPiA+IC0tCj4gPiAyLjUxLjAKPiA+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
