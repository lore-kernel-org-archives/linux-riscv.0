Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC2EC88CB2
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Aug 2023 22:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ftNaVZSJld7XZEGxt4NW3M6jcWrT4CzkFIud3/Iki8s=; b=kiBn2fJAsk9k0Q
	tIS6IVnspFCCZlFZz5otDA1S96LT3QtIMlmXP4zySreyW6qfllOg5favqVJCvVMocwqkqDMwtaGIZ
	I+BOeDq2znDDxMRY+2juizLCWfVF9wjcgYZ8v4Hppqq9ujtB09ds3Z4u/1JDFtWSynUZsNUfGtx+g
	QFXnmyzdqpwcOj7bhO1SJN6bb9BDo7dj4BsEh91p1woTjCR1UoS6ut94OQZn7Od4IKOMhR+QMzynY
	dvZ4OGE2CQQteIb22c8JUJWVCmtFV4UlPdS8YA/sfgLy01X4t1dXwVU28xFEJ8nm+uteqWE4RPKli
	wf6C2rajLGQxMvjCm9dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZISz-003txw-2E;
	Thu, 24 Aug 2023 22:06:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZISu-003twy-27
	for linux-riscv@lists.infradead.org;
	Thu, 24 Aug 2023 22:06:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F3F4565230
	for <linux-riscv@lists.infradead.org>; Thu, 24 Aug 2023 22:06:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 667BFC433CA
	for <linux-riscv@lists.infradead.org>; Thu, 24 Aug 2023 22:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692914767;
	bh=wokMPVNGYw0bXxAHx+gbY2Rre1rA2yUIZNWpn8SDz0A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jyUXaUaxJtZV7CYOk2XL+Zyg2f4RZPI22r4LPPqKKdjy32b+hTft9aRxzS/4P+2da
	 PN1vk5nAcbHZwlOIfXEfFFkGSP0OmUVpQXTOOCk7GK9nwxknPK7fSrOfOAaezFDAJR
	 qCE8Njk77g7JsK1do2ZVbCU9ipTZ42pOpn0luBnxg5ayImyQUnUEyLagHycmdgNnys
	 /wA0eb+ayL6lpfMWgMkdRNHFHS/B4IUdwcNnU9tayDj5pEbFFbKlk1APFHAyxzrk9b
	 Sav4OVLLleGO4L879987zDovjmeQEtacJq7eLL2VsJpafwnrhW10nEvfUORf35rUk5
	 xwAqdf7Lqo9UQ==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-50078e52537so414596e87.1
        for <linux-riscv@lists.infradead.org>; Thu, 24 Aug 2023 15:06:07 -0700 (PDT)
X-Gm-Message-State: AOJu0YyTSmDZ7etRK4+Gr6Mh0lscDNTTSGeLaT/3b8hQVraGihfXZ1rF
	6KmHPvCF6lQHFd2M92emckrs6R+6z180ZEDHWjA=
X-Google-Smtp-Source: AGHT+IE7zxauTjqBL+3SpA3KVBh8UWS/WrLsqL0PTc+cCRH+7F9/m4FCw4SAU8RPuh5hsVsfOy/8ggpSJsWfddEbnQw=
X-Received: by 2002:a05:6512:a8f:b0:4fe:8c01:32ac with SMTP id
 m15-20020a0565120a8f00b004fe8c0132acmr16342249lfu.41.1692914765396; Thu, 24
 Aug 2023 15:06:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230824133135.1176709-1-puranjay12@gmail.com> <20230824133135.1176709-3-puranjay12@gmail.com>
In-Reply-To: <20230824133135.1176709-3-puranjay12@gmail.com>
From: Song Liu <song@kernel.org>
Date: Thu, 24 Aug 2023 15:05:53 -0700
X-Gmail-Original-Message-ID: <CAPhsuW6jLLt7gu1RbZTAjLeFKzu=PoumaohRsN538BW2gH97sA@mail.gmail.com>
Message-ID: <CAPhsuW6jLLt7gu1RbZTAjLeFKzu=PoumaohRsN538BW2gH97sA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 2/3] riscv: implement a memset like function
 for text
To: Puranjay Mohan <puranjay12@gmail.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	pulehui@huawei.com, conor.dooley@microchip.com, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, yhs@fb.com, 
	kpsingh@kernel.org, bjorn@kernel.org, bpf@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_150610_865782_A1124001 
X-CRM114-Status: GOOD (  18.40  )
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

T24gVGh1LCBBdWcgMjQsIDIwMjMgYXQgNjozMeKAr0FNIFB1cmFuamF5IE1vaGFuIDxwdXJhbmph
eTEyQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBUaGUgQlBGIEpJVCBuZWVkcyB0byB3cml0ZSBpbnZh
bGlkIGluc3RydWN0aW9ucyB0byBSWCByZWdpb25zIG9mIG1lbW9yeQo+IHRvIGludmFsaWRhdGUg
cmVtb3ZlZCBCUEYgcHJvZ3JhbXMuIFRoaXMgbmVlZHMgYSBmdW5jdGlvbiBsaWtlIG1lbXNldCgp
Cj4gdGhhdCBjYW4gd29yayB3aXRoIFJYIG1lbW9yeS4KPgo+IEltcGxlbWVudCBwYXRjaF90ZXh0
X3NldF9ub3N5bmMoKSB3aGljaCBpcyBzaW1pbGFyIHRvIHRleHRfcG9rZV9zZXQoKSBvZgo+IHg4
Ni4KPgo+IFNpZ25lZC1vZmYtYnk6IFB1cmFuamF5IE1vaGFuIDxwdXJhbmpheTEyQGdtYWlsLmNv
bT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wYXRjaC5oIHwgIDEgKwo+ICBhcmNo
L3Jpc2N2L2tlcm5lbC9wYXRjaC5jICAgICAgfCA3NCArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgNzUgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGF0Y2guaCBiL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vcGF0Y2guaAo+IGluZGV4IDYzYzk4ODMzZDUxMC4uYWE1YzE4MzBlYTQzIDEwMDY0NAo+
IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGF0Y2guaAo+ICsrKyBiL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vcGF0Y2guaAo+IEBAIC03LDYgKzcsNyBAQAo+ICAjZGVmaW5lIF9BU01fUklT
Q1ZfUEFUQ0hfSAo+Cj4gIGludCBwYXRjaF90ZXh0X25vc3luYyh2b2lkICphZGRyLCBjb25zdCB2
b2lkICppbnNucywgc2l6ZV90IGxlbik7Cj4gK2ludCBwYXRjaF90ZXh0X3NldF9ub3N5bmModm9p
ZCAqYWRkciwgY29uc3QgaW50IGMsIHNpemVfdCBsZW4pOwo+ICBpbnQgcGF0Y2hfdGV4dCh2b2lk
ICphZGRyLCB1MzIgKmluc25zLCBpbnQgbmluc25zKTsKPgo+ICBleHRlcm4gaW50IHJpc2N2X3Bh
dGNoX2luX3N0b3BfbWFjaGluZTsKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvcGF0
Y2guYyBiL2FyY2gvcmlzY3Yva2VybmVsL3BhdGNoLmMKPiBpbmRleCA0NjViMmVlYmJjMzcuLjI0
ZDQ5OTk5YWMxYSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9wYXRjaC5jCj4gKysr
IGIvYXJjaC9yaXNjdi9rZXJuZWwvcGF0Y2guYwo+IEBAIC0xMyw2ICsxMyw3IEBACj4gICNpbmNs
dWRlIDxhc20vZml4bWFwLmg+Cj4gICNpbmNsdWRlIDxhc20vZnRyYWNlLmg+Cj4gICNpbmNsdWRl
IDxhc20vcGF0Y2guaD4KPiArI2luY2x1ZGUgPGFzbS9zdHJpbmcuaD4KPgo+ICBzdHJ1Y3QgcGF0
Y2hfaW5zbiB7Cj4gICAgICAgICB2b2lkICphZGRyOwo+IEBAIC01Myw2ICs1NCwzNCBAQCBzdGF0
aWMgdm9pZCBwYXRjaF91bm1hcChpbnQgZml4bWFwKQo+ICB9Cj4gIE5PS1BST0JFX1NZTUJPTChw
YXRjaF91bm1hcCk7Cj4KPiArc3RhdGljIGludCBfX3BhdGNoX2luc25fc2V0KHZvaWQgKmFkZHIs
IGNvbnN0IGludCBjLCBzaXplX3QgbGVuKQo+ICt7Cj4gKyAgICAgICB2b2lkICp3YWRkciA9IGFk
ZHI7Cj4gKyAgICAgICBib29sIGFjcm9zc19wYWdlcyA9ICgoKHVpbnRwdHJfdCkgYWRkciAmIH5Q
QUdFX01BU0spICsgbGVuKSA+IFBBR0VfU0laRTsKPiArICAgICAgIGludCByZXQ7Cj4gKwo+ICsg
ICAgICAgLyoKPiArICAgICAgICAqIE9ubHkgdHdvIHBhZ2VzIGNhbiBiZSBtYXBwZWQgYXQgYSB0
aW1lIGZvciB3cml0aW5nLgo+ICsgICAgICAgICovCj4gKyAgICAgICBpZiAobGVuID4gMiAqIFBB
R0VfU0laRSkKPiArICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7CgpTYW1lIGZvciB0aGlz
IG9uZS4KClsuLi5dCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
