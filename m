Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60AC3CAC598
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 10:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7SqCT/rNKXoY+F6oqg2Xd4T9Ot+uCFc7hCiuFFJZ1P4=; b=QQYDpYxWOViVAh
	a7LVwPWArJMsFNjp5MAgDh54pFVqU/PqiJJj2Hww7Csv1yF67qjDlO1FN8JUQnKY3AdQScBoQZECU
	cpjPL+1See3mqWjcoq9OmhB8rotcG5Z5FvEva2LoNkkkwKw7jueFn317aBkSvEmWfM6hh7cxbrHpo
	pwkqclt8wqUunMkpUyYMuR9/U6EJBe42+PsH5zjxMH5mbip+U8E7iIY+PWcgojSmdfYZtZgeHPvvU
	UY5id/+PqvnD24S+0VvafJRVTQuo+nMY9tUBU1Whl6ZCig0GlQZPzkNZnWMnl3Z2D8ksnhLgNHgEx
	JqmtlSyYwtguJXVA7UiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6b8-00000003icv-2Mu1;
	Mon, 15 Sep 2025 10:38:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6b7-00000003ica-404y
	for linux-riscv@lists.infradead.org;
	Mon, 15 Sep 2025 10:38:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3451E601A3;
	Mon, 15 Sep 2025 10:38:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7006C4CEF1;
	Mon, 15 Sep 2025 10:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757932692;
	bh=qJ9kQ8BFAZY2v4fggocnqvi8R1BnMMUDXlwGB+RmYH8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TMxLcgCFGdAs6MATYhGGP+jh+ft9np0Fb7ScunMNiJRVJXDUL6wMUqoqbShz6OOvn
	 lqcvod4uqVzBmhRyKFkZOjKbJthLcMrKW02PinbWvimlMKOHJZrXZ1HjF+278V0mHN
	 H9bXnlObipolMo69DvS2bVpT4stzi4OHSJtZJStFPS7Abprg003eu0lV0S7A5o4dCn
	 mfmfx77hf/fH3Kd7Ryyq+7mfBSt89Hh06smcKm4xiI55LiXbf9pYODmFE7uM6gAWKx
	 peCFyjhVMckRq+qELmpKBOiKSgcqzgM5fiUrXKOb0ICG6y3NM+9dHceY7ofxg9AZnS
	 5Xq8EyXap8hug==
Date: Mon, 15 Sep 2025 11:38:07 +0100
From: Will Deacon <will@kernel.org>
To: Yaxing Guo <guoyaxing@bosc.ac.cn>
Cc: linux-riscv@lists.infradead.org, iommu@lists.linux.dev,
	tjeznach@rivosinc.com, joro@8bytes.org, robin.murphy@arm.com,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, anxu@bosc.ac.cn, wangran@bosc.ac.cn
Subject: Re: [PATCH v1 1/3] iommu/riscv: Add iommu perf driver
Message-ID: <aMfsj1U7NY2m68T4@willie-the-truck>
References: <20250915020911.1313-1-guoyaxing@bosc.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250915020911.1313-1-guoyaxing@bosc.ac.cn>
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

T24gTW9uLCBTZXAgMTUsIDIwMjUgYXQgMTA6MDk6MDlBTSArMDgwMCwgWWF4aW5nIEd1byB3cm90
ZToKPiBUaGlzIHBhdGNoIGludHJvZHVjZXMgYSBwZXJmb3JtYW5jZSBtb25pdG9yIGRyaXZlciBm
b3IgUklTQy1WIElPTU1VCj4gaW9ocG0gaW1wbGVtZW50aW9ucyB0aGF0IHN1cHBvcnQgaGFyZHdh
cmUgcGVyZm9ybWFuY2UgY291bnRlcnMuCj4gVGhlIGRyaXZlciBleHBvc2UgUklTQy1WLUlPTU1V
LXNwZWNpZmljIHBlcmZvcm1hbmNlIGV2ZW50cyAoZWcuIGN5Y2xlcywKPiB0bGIgbWlzcyAuLi4p
dGhyb3VnaCB0aGUgTGludXggcGVyZiBzdWJzeXN0ZW0sIGVuYWJsaW5nIGRldmVsb3BlcnMKPiB0
byBwcm9maWxlIGFuZCBvcHRpbWl6ZSBJL08gdHJhbnNsYXRpb24gcGVyZm9ybWFuY2UuCj4gCj4g
S2V5IGZlYXR1cmVzOgo+IC0gSW1wbGVtZW50cyBhIHBlcmYgUE1VIGRyaXZlciBmb3IgUklTQy1W
IElPTU1VLgo+IAo+IC0gRXhwb3NlcyBJT01NVSBwZXJmIGV2ZW50cywgc3VjaCBhcyAnY3ljbGVz
JywgJ3RsYl9taXNzJy4uLiB2aWEKPiAgIC9zeXMvZGV2aWNlcy9yaXNjdi1pb21tdS1wbXUvZXZl
bnRzLywgYWxsb3dpbmcgdXNlIHdpdGggcGVyZgo+ICAgdG9vbHM6Cj4gICAgIHBlcmYgc3RhdCAt
QyAwIC1lIHJpc2N2LWlvbW11LXBtdS9jeWNsZXMvIC4uLgo+ICAgICBwZXJmIHN0YXQgLUMgMCAt
ZSByaXNjdi1pb21tdS1wbXUvdGxiX21pc3MvIC4uLgo+ICAgICAuLi4KPiAtIFN1cHBvcnRzIGV2
ZW50IGZpbHRlcmluZyB0aHJvdWdoIGNvbmZpZ3VyZWFibGUgYXR0cmlidXRlcyBleHBvc2VkCj4g
ICBpbiAvc3lzL2RldmljZXMvcmlzY3YtaW9tbXUtcG11L2Zvcm1hdC8sIGluY2x1ZGluZzoKPiAg
IGR2X2dzY3YsIHB2X3BzY3bvvIxkaWRfZ3NjaWTvvIxwaWRfcHNjaWTvvIxpZHQgKHJpc2N2IGlv
bW11IHNwZWMgNS0yMykuCj4gCj4gLSBJbXBsZW1lbnRzIG92ZXJmbG93IGludGVycnVwdCBoYW5k
bGluZy4KPiAKPiAtIEFkZHMgZGV2aWNlIHRyZWUgYmluZGluZyBzdXBwb3J0IHZpYSBvcHRpb25h
bCAncG11LW5hbWUnIHByb3BlcnR5Cj4gICBhbGxvd2luZyBwbGF0Zm9ybS1zcGVjaWZpYyBJT01N
VSBpbXBsZW1lbnRhdGlvbnMgdG8gc3BlY2lmeSBhIGN1c3RvbQo+ICAgZGVmaW5lZCBldmVudCBJ
RCBsaXN0LiBJZiBub3QgcHJvdmlkZWQsIHRoZSBkcml2ZXIgZGVmYXVsdHMgdG8gb25seQo+ICAg
c3VwcG9ydGluZyAnY3ljbGVzJy4gV2hlbiBzZXQgdG8gJ2R1bW15JywgaXQgZW5hYmxlcyBhbGwg
OSBzdGFuZGFyZAo+ICAgZXZlbnQgSURzIGFzIGRlZmluZWQgaW4gcmlzY3YgaW9tbXUgc3BlYyg1
LTIzKS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBZYXhpbmcgR3VvIDxndW95YXhpbmdAYm9zYy5hYy5j
bj4KPiAtLS0KPiAgZHJpdmVycy9pb21tdS9yaXNjdi9pb21tdS1wZXJmLmMgfCA1MzUgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKwo+ICBkcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LXBl
cmYuaCB8ICA4OCArKysrKwo+ICBkcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LmggICAgICB8ICAg
OCArCj4gIDMgZmlsZXMgY2hhbmdlZCwgNjMxIGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IGRyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUtcGVyZi5jCj4gIGNyZWF0ZSBtb2RlIDEw
MDY0NCBkcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LXBlcmYuaAoKUE1VIGRyaXZlcnMgYXJlIGJl
dHRlciBwbGFjZWQgdW5kZXIgZHJpdmVycy9wZXJmLwoKKHRoZSBBcm0gU01NVXYzIFBNVSBkcml2
ZXIgbGl2ZXMgdGhlcmUsIGZvciBleGFtcGxlKS4KCldpbGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
