Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C6BC43458
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Jun 2026 17:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zFy900YYgJLiUC/xyxkk17zQBf5EYKJevi+SA+tY4sU=; b=yrgBX6vdzXAYm5
	kH5y+hT8mr2j6WFHMH73r3P+d9zQRMtIGbt0jueGMZPczMzF0tSxxaqViRiG2TSdJUoULrnDt5Lmh
	sgxnjMfO993tqB2cGC0ikhMXvyqd8p1MjR8Y2NKNaAsUv6DcOliluK2uvCLWipZtTNwR9Ml1ssDhT
	RltHk34v9uJCmnRGsPzUpAQbeZvyfUVBzwH1u6gfBTeZ1t6pT1bkzny33EedGRgrOqW6xqznGV7il
	qHOmay681ZOorCfRFWpVpADGDzoVRcUTZSnZNfP27IaAJ1miclJYj/zekgQx03ZsJUGFmsQC1TTAN
	s3r1+M1AUi+HG8Dng3Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdtH7-0000000DF86-3Yro;
	Sun, 28 Jun 2026 17:26:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdtH6-0000000DF7z-2ze5
	for linux-riscv@lists.infradead.org;
	Sun, 28 Jun 2026 17:26:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D78AE419FB;
	Sun, 28 Jun 2026 17:26:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 264821F000E9;
	Sun, 28 Jun 2026 17:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782667591;
	bh=5X+nFlRn3ahrs8bSxEJpS+nHnqWlIe2VEb5G9WNWcrY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=HcUnvRAlS64bbx2Vkp0YYkzuZcoEjFJiIiF1iZQsaPMNJZC0dZB1L9C/dRLKXVvm4
	 K9JAgm3OVavnloRE56RvZeX54eyL+lnzzKBt4gE6AAm6edARSuYBPAJWoUxvV5BscG
	 3kdG0y8SvAKCAr8Q+fBblCBJdnU/7h4ZXMSbmaw1wPKRXwpUDCszeUGi3TLOYDfCsh
	 cycoJHcQfYgpMjBK1hkYvb4hqm/Wym0GTp1sBcr3BzDFzh5zfl9rx5qNk1G1S8ul4a
	 VI0iNyIGiaEShlmiuky6wpG8+bAD56q95rV9rmLr1UAkAXoi75k0WjjmE3IvZjzPWB
	 0WNutq4TFBf2A==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Varun R Mallya <varunrmallya@gmail.com>, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, ast@kernel.org,
 daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com,
 memxor@gmail.com, pulehui@huawei.com
Cc: alex@ghiti.fr, martin.lau@linux.dev, song@kernel.org,
 yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com,
 puranjay@kernel.org, shuah@kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org, varunrmallya@gmail.com
Subject: Re: [PATCH bpf-next v2 1/3] riscv: stacktrace: Implement
 arch_bpf_stack_walk() for BPF
In-Reply-To: <20260628081710.113333-2-varunrmallya@gmail.com>
References: <20260628081710.113333-1-varunrmallya@gmail.com>
 <20260628081710.113333-2-varunrmallya@gmail.com>
Date: Sun, 28 Jun 2026 10:26:28 -0700
Message-ID: <87ik72y3sr.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
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

VmFydW4hCgpUaGFua3MgZm9yIHNwZW5kaW5nIHRpbWUgb24gZ2V0dGluZyBSViBlQlBGIG1vcmUg
ZmVhdHVyZSBjb21wbGV0ZSEgU29ycnkKZm9yIHRoZSBzbG93IHJlcGxpZXMuCgpWYXJ1biBSIE1h
bGx5YSA8dmFydW5ybWFsbHlhQGdtYWlsLmNvbT4gd3JpdGVzOgoKPiBUaGlzIHdpbGwgYmUgdXNl
ZCBieSBicGZfdGhyb3coKSB0byB1bndpbmQgdGlsbCB0aGUgcHJvZ3JhbSBtYXJrZWQgYXMKPiBl
eGNlcHRpb24gYm91bmRhcnkgYW5kIHJ1biB0aGUgY2FsbGJhY2sgd2l0aCB0aGUgc3RhY2sgb2Yg
dGhlIG1haW4KPiBwcm9ncmFtLgo+IFRoaXMgaXMgcmVxdWlyZWQgZm9yIHN1cHBvcnRpbmcgQlBG
IGV4Y2VwdGlvbnMgb24gUklTQy1WLgo+IFRoaXMgZGVwZW5kcyBvbiB0aGUgZnJhbWUgcG9pbnRl
ciB1bndpbmRlciwgc28gaXQgaXMgb25seSBidWlsdCB1bmRlcgo+IENPTkZJR19GUkFNRV9QT0lO
VEVSLCBlbHNlIGZhbGxzIGJhY2sgdG8gdGhlIHdlYWsgbm8tb3AuCj4KPiBTaWduZWQtb2ZmLWJ5
OiBWYXJ1biBSIE1hbGx5YSA8dmFydW5ybWFsbHlhQGdtYWlsLmNvbT4KPiBSZXZpZXdlZC1ieTog
UHUgTGVodWkgPHB1bGVodWlAaHVhd2VpLmNvbT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9rZXJuZWwv
c3RhY2t0cmFjZS5jIHwgMzEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAxIGZp
bGUgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
a2VybmVsL3N0YWNrdHJhY2UuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3N0YWNrdHJhY2UuYwo+IGlu
ZGV4IGM3NTU1NDQ3MTQ5Yi4uNjQ5MjkzODFiYjMwIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yv
a2VybmVsL3N0YWNrdHJhY2UuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3N0YWNrdHJhY2Uu
Ywo+IEBAIC01LDYgKzUsNyBAQAo+ICAgKi8KPiAgCj4gICNpbmNsdWRlIDxsaW51eC9leHBvcnQu
aD4KPiArI2luY2x1ZGUgPGxpbnV4L2ZpbHRlci5oPgo+ICAjaW5jbHVkZSA8bGludXgva2FsbHN5
bXMuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3NjaGVkLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9zY2hl
ZC9kZWJ1Zy5oPgo+IEBAIC0xMDIsNiArMTAzLDM2IEBAIHZvaWQgbm90cmFjZSB3YWxrX3N0YWNr
ZnJhbWUoc3RydWN0IHRhc2tfc3RydWN0ICp0YXNrLCBzdHJ1Y3QgcHRfcmVncyAqcmVncywKPiAg
CX0KPiAgfQo+ICAKPiArdm9pZCBub3RyYWNlIGFyY2hfYnBmX3N0YWNrX3dhbGsoYm9vbCAoKmNv
bnN1bWVfZm4pKHZvaWQgKmNvb2tpZSwgdTY0IGlwLCB1NjQgc3AsIHU2NCBicCksCj4gKwkJCQkg
dm9pZCAqY29va2llKQo+ICt7Cj4gKwl1bnNpZ25lZCBsb25nIGZwLCBzcCwgcGM7Cj4gKwlpbnQg
Z3JhcGhfaWR4ID0gMDsKPiArCj4gKwlmcCA9ICh1bnNpZ25lZCBsb25nKV9fYnVpbHRpbl9mcmFt
ZV9hZGRyZXNzKDApOwo+ICsJc3AgPSBjdXJyZW50X3N0YWNrX3BvaW50ZXI7Cj4gKwlwYyA9ICh1
bnNpZ25lZCBsb25nKWFyY2hfYnBmX3N0YWNrX3dhbGs7Cj4gKwo+ICsJZm9yICg7Oykgewo+ICsJ
CXN0cnVjdCBzdGFja2ZyYW1lICpmcmFtZTsKPiArCj4gKwkJaWYgKHVubGlrZWx5KCFfX2tlcm5l
bF90ZXh0X2FkZHJlc3MocGMpKSkKPiArCQkJYnJlYWs7Cj4gKwkJLyogcGMgYmVsb25ncyB0byB0
aGUgZnVuY3Rpb24gd2hvc2UgZnJhbWUgcG9pbnRlciBpcyBmcCAqLwo+ICsJCWlmICghY29uc3Vt
ZV9mbihjb29raWUsIHBjLCBzcCwgZnApKQo+ICsJCQlicmVhazsKPiArCQlpZiAodW5saWtlbHko
IWZwX2lzX3ZhbGlkKGZwLCBzcCkpKQo+ICsJCQlicmVhazsKPiArCj4gKwkJZnJhbWUgPSAoc3Ry
dWN0IHN0YWNrZnJhbWUgKilmcCAtIDE7Cj4gKwkJc3AgPSBmcDsKPiArCQlmcCA9IFJFQURfT05D
RV9UQVNLX1NUQUNLKGN1cnJlbnQsIGZyYW1lLT5mcCk7Cj4gKwkJcGMgPSBSRUFEX09OQ0VfVEFT
S19TVEFDSyhjdXJyZW50LCBmcmFtZS0+cmEpOwo+ICsJCXBjID0gZnRyYWNlX2dyYXBoX3JldF9h
ZGRyKGN1cnJlbnQsICZncmFwaF9pZHgsIHBjLAo+ICsJCQkJCSAgICZmcmFtZS0+cmEpOwo+ICsJ
fQo+ICt9CgpXZSBkb24ndCBuZWVkIG1vcmUgc3RhY2sgdW53aW5kZXJzLiBDYW4geW91IHNlZSBp
ZiB5b3UgY2FuIGV4dGVuZAp3YWxrX3N0YWNrZnJhbWUoKSB3aXRoICJjb29raWUiIHRvIG1hdGNo
IEJQRidzIG5lZWRzPyBIYXZlIGEgbG9vayBhdAp3aGF0IGFybTY0IGRvZXMuCgpTYXNoaWtvIGhh
ZCBhIGdvb2QgcG9pbnQgYWJvdXQgZnRyYWNlX2dyYXBoX3JldF9hZGRyKCkgLS0gbm93IHdoYXQg
YWJvdXQKa3JldHByb2JlPyBEbyB3ZSBuZWVkIHRvIHRha2UgdGhhdCBpbiBjb25zaWRlcmF0aW9u
IGFzIHdlbGw/CgoKVGhhbmtzLApCasO2cm4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
