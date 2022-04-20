Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D813C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Apr 2022 16:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VCq7nVRN/FJk7sdjwVwFQAvSz7vskbcEXuPWPkGvm+A=; b=TjJ2YyPW8zKmWQ
	Mx2bUuy+lu+D3xGzjdP/L0J3NOJ8XUcYcuM0wD+d69D21FM+fj+DtRn5sofF2FsHraDvfUgTlze9q
	FYsQCYuq+1I4N4xqoqOb17po/rSFHlN8k6eFN2t/d7wUz4vPjbiwLyX7Fm++anmKAAAW7WKdkqZEh
	XiELadwX4eaDQWKRe02wqYPCY7UMHDC3HofC5i97845PG/TuzD+Cp0rLa+v+IQLpyy0FbVmq5lnhG
	9XTd/FSO/qZs+/t+UrCoSxjfmWGgTEqo9GU1hzgkfB5Z8OxrVUYjQilW78Ss3FhXWk65lEW5jxUg2
	pucXtg4hbs27wdvAW+IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhDRw-009iue-23; Wed, 20 Apr 2022 16:45:04 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhDRl-009iry-Fn
 for linux-riscv@lists.infradead.org; Wed, 20 Apr 2022 16:44:54 +0000
Received: by mail-ej1-x635.google.com with SMTP id g13so4761525ejb.4
 for <linux-riscv@lists.infradead.org>; Wed, 20 Apr 2022 09:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=soleen.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=AfxWSlxIEICGSyTo5UTwMPZe6Q55PvAA0DKxMflvlU4=;
 b=nC9D+qQY6zO1b5+6ctalBsBld2Gklo1raloLX7LprQ0sz5ZMyJeK4iWk33WJIMlBys
 sWrGm3frGJHX0al+4QCmYIKE7/xB/nf2dHq34Kz/P8+KRaTi2tfXM3zPx31zCAO/b1Rx
 KsZ2TB/vy3W4s+buZh6s672JbmkLoKKCcRCzSZc7IaxWMIbQ8/G6krCr2AeARLmX0PBe
 SYuPncrqbw/hmoPenwsyTTApQEjuiClFf78tTK4ef20HmQPibh2pVeKqEKo9Ii8LvUcM
 aj/x9FkzcoYXASEDuyIQkrrZOcqOIfXVN9KydRiHmMBD6cNygUpxKXPQR8YkW0vJZwzS
 B+kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AfxWSlxIEICGSyTo5UTwMPZe6Q55PvAA0DKxMflvlU4=;
 b=R0oTz/cL+4pB3u34DcpN6WA35Sh0gFvMJOy+nJUi/+MWAt+3NUPeXEuRD5MflFjVPy
 2yz7ptdbLDPfIEok4fQvWNLJ/J5g2HlBp5T69PIlFcyBQyjimaPC2zuDqe6v28NcErqt
 DGpTS8gC4kb06ri+JEqAJuritvujtCEM1EyuglXUCj5WmVpbotvSjs+kABYmiNkSJGvK
 jJHTowglkJWgIHa5wLdRJILXY0O5BRtenD1/Qc8dVwJZ0Si26+LBR6A3Wo+boEBN328z
 7iLspyDCcWSsDagGtVhsTMo/VeXm017wDkSVGZ0w2TTcy2+xvhqSnQUWXctrejYoMqxJ
 buKg==
X-Gm-Message-State: AOAM5300M9mndxELDK+o+Ds8yd7o2mLxeeOEfog2X6h6/WaNatMfvxnk
 zEJwk6T5xY9RUy2gMAgjBlexe4gMKJBgcReeTSJUQg==
X-Google-Smtp-Source: ABdhPJyZtJ2OiQqRMqkArjaqQ1FeKnI5zVUYHqY6VjiqjAqVr53rH54QfeTBwC+gpwXOjHnNJhHpdYKW5AxpfxLyFmo=
X-Received: by 2002:a17:907:1c8a:b0:6e9:2a0d:d7b7 with SMTP id
 nb10-20020a1709071c8a00b006e92a0dd7b7mr19095476ejc.572.1650473083179; Wed, 20
 Apr 2022 09:44:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220418034444.520928-1-tongtiangen@huawei.com>
 <20220418034444.520928-2-tongtiangen@huawei.com>
 <1671baf7-046e-7c52-183f-fd654125fd67@arm.com>
 <c376877e-53a7-d471-61bc-e7f9dd400d60@huawei.com>
In-Reply-To: <c376877e-53a7-d471-61bc-e7f9dd400d60@huawei.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 20 Apr 2022 12:44:07 -0400
Message-ID: <CA+CK2bCF=7mADB=rxyHtVEd3oCZ4mxtKf=28L49uQr5oxUwYZQ@mail.gmail.com>
Subject: Re: [PATCH -next v4 1/4] mm: page_table_check: move
 pxx_user_accessible_page into x86
To: Tong Tiangen <tongtiangen@huawei.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, 
 Andrew Morton <akpm@linux-foundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 LKML <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-riscv@lists.infradead.org, 
 Kefeng Wang <wangkefeng.wang@huawei.com>, Guohanjun <guohanjun@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_094453_571370_70BAA061 
X-CRM114-Status: GOOD (  14.49  )
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

T24gV2VkLCBBcHIgMjAsIDIwMjIgYXQgMjo0NSBBTSBUb25nIFRpYW5nZW4gPHRvbmd0aWFuZ2Vu
QGh1YXdlaS5jb20+IHdyb3RlOgo+Cj4KPgo+IOWcqCAyMDIyLzQvMTkgMTc6MjksIEFuc2h1bWFu
IEtoYW5kdWFsIOWGmemBkzoKPiA+Cj4gPgo+ID4gT24gNC8xOC8yMiAwOToxNCwgVG9uZyBUaWFu
Z2VuIHdyb3RlOgo+ID4+IC0tLSBhL21tL3BhZ2VfdGFibGVfY2hlY2suYwo+ID4+ICsrKyBiL21t
L3BhZ2VfdGFibGVfY2hlY2suYwo+ID4+IEBAIC0xMCw2ICsxMCwxNCBAQAo+ID4+ICAgI3VuZGVm
IHByX2ZtdAo+ID4+ICAgI2RlZmluZSBwcl9mbXQoZm10KSAgICAgICAgInBhZ2VfdGFibGVfY2hl
Y2s6ICIgZm10Cj4gPj4KPiA+PiArI2lmbmRlZiBQTURfUEFHRV9TSVpFCj4gPj4gKyNkZWZpbmUg
UE1EX1BBR0VfU0laRSAgICAgICBQTURfU0laRQo+ID4+ICsjZW5kaWYKPiA+PiArCj4gPj4gKyNp
Zm5kZWYgUFVEX1BBR0VfU0laRQo+ID4+ICsjZGVmaW5lIFBVRF9QQUdFX1NJWkUgICAgICAgUFVE
X1NJWkUKPiA+PiArI2VuZGlmCj4gPgo+ID4gV2h5IGNhbm5vdCBQTURfU0laRS9QVURfU0laRSBi
ZSB1c2VkIG9uIGV2ZXJ5IHBsYXRmb3JtIGluc3RlYWQgPyBXaGF0IGlzIHRoZQo+ID4gbmVlZCBm
b3IgdXNpbmcgUFVEX1BBR0VfU0laRS9QTURfUEFHRV9TSVpFID8gQXJlIHRoZXkgZGlmZmVyZW50
IG9uIHg4NiA/Cj4gPiAuCj4KPiBIaSwgUGFzaGHvvJoKPiBJIGNoZWNrZWQgdGhlIGRlZmluaXRp
b25zIG9mIFBNRF9TSVpFL1BVRF9TSVpFIGFuZAo+IFBVRF9QQUdFX1NJWkUvUE1EX1BBR0VfU0la
RSBpbiB4ODYgYXJjaGl0ZWN0dXJlIGFuZCB0aGVpciB1c2Ugb3V0c2lkZQo+IHRoZSBhcmNoaXRl
Y3R1cmUoZWc6IGluIG1tLywgYWxsIHVzZWQgUE1EX1NJWkUvUFVEX1NJWkUpLCBXb3VsZCBpdCBi
ZQo+IGJldHRlciB0byB1c2UgYSB1bmlmaWVkIFBNRF9TSVpFL1BVRF9TSVpFIGhlcmU/CgpIaSBU
b25nLAoKWWVzLCBpdCBtYWtlcyBzZW5zZSB0byB1c2UgUE1EX1NJWkUvUFVEX1NJWkUgaW5zdGVh
ZCBvZgpQVURfUEFHRV9TSVpFL1BNRF9QQUdFX1NJWkUgaW4gcGFnZV90YWJsZV9jaGVjayB0byBi
ZSBpbmxpbmUgd2l0aCB0aGUKcmVzdCBvZiB0aGUgbW0vCgpQYXNoYQoKPgo+IFRoYW5rcywKPiBU
b25nLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
