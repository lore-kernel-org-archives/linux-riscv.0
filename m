Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14F2BC433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jan 2022 00:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wfFdvGvMNb5C9EZznja1PAndgaVep3+rH/URyAiwaPA=; b=bOkVbuU4hVqeAe
	OzwC9FwFczNDrPvQiiemL42gO4+asIxyT99T0UqSDWYNiW7K6HzUUdOA7YEnAhCJZrGa0HgtvzUz3
	+RRIG2inGJS3iTSNilLcaabfbOKyytCOygyg/OpyxIijGVTE76h9tqwH0kXyBOibjfgXJPKMDF0Np
	98KJHUeSKJu4rU4dTq0IQRgK3nnOwMyECKVuFiZiIbbgWv5xJB+gkU9PIEioaKIuvjkqZ+n2ps7TU
	EQYAA7n3uz/TDepuUVYDhNAWR6z6knWXgoAn0cVPQWvw9K151ZUa7cUok9U9aa4E6UwKRqNUszZGw
	/+BuYjStfYghUNhqhjzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5d0o-001fIM-8B; Fri, 07 Jan 2022 00:21:42 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5d0k-001fGz-CC
 for linux-riscv@lists.infradead.org; Fri, 07 Jan 2022 00:21:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 095B6B82495;
 Fri,  7 Jan 2022 00:21:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6397C36AE0;
 Fri,  7 Jan 2022 00:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641514895;
 bh=rTyEa7BxzW7vXGzxnTzq6mIOCIByq0fmnlYF1ivc89g=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=WJHCCLp9K8Dvs8uGvdfmZi7BI5i8ebM1ssP6jiZ4Ll/ePiDFoUcjfRRPrw2+7OZXT
 XIDeYObPjJ1GBIvLKgSnYCNQyf67JC7Hddn8pjpdDf/bSi+RpuZbtjgl/zhlyI58vk
 xvG+HSpL7FZ79xZnfhc8Y3xM3OYc+AcLiW0WosDshGFA3yr2h9rynGrAIIFlD1OqpG
 z5rDmK0VMPQAMXAkpMLLYDwE937BMUZ9r7o1HKA62+bvDqtpsThVHW0JbSgMgN8nEw
 Vh4bZH9dp6Xhv6lKYg4238TaULc2rViXBR2AUciO8hRSIvZnZ6B9RN1FoV5/BVlknW
 HTF1x0iV54Lsg==
MIME-Version: 1.0
In-Reply-To: <a298286a42461e07c92e282224f469d84344feac.1641434305.git.zong.li@sifive.com>
References: <a298286a42461e07c92e282224f469d84344feac.1641434305.git.zong.li@sifive.com>
Subject: Re: [PATCH v3] clk: sifive: Fix W=1 kernel build warning
From: Stephen Boyd <sboyd@kernel.org>
Cc: Zong Li <zong.li@sifive.com>
To: Zong Li <zong.li@sifive.com>, lee.jones@linaro.org,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 mturquette@baylibre.com, palmer@dabbelt.com, paul.walmsley@sifive.com
Date: Thu, 06 Jan 2022 16:21:34 -0800
User-Agent: alot/0.9.1
Message-Id: <20220107002135.B6397C36AE0@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_162138_586776_99B36E59 
X-CRM114-Status: GOOD (  11.58  )
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

UXVvdGluZyBab25nIExpICgyMDIyLTAxLTA1IDIxOjU4OjI4KQo+IFRoaXMgY29tbWl0IHJldmVy
dHMgY29tbWl0IDQ4N2RjN2JiNmEwYyAoImNsazogc2lmaXZlOiBmdTU0MC1wcmNpOgo+IERlY2xh
cmUgc3RhdGljIGNvbnN0IHZhcmlhYmxlICdwcmNpX2Nsa19mdTU0MCcgd2hlcmUgaXQncyB1c2Vk
IikuCj4gRm9yIGZpeGluZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocykgYWJvdXQg4oCYcHJj
aV9jbGtfZnU1NDDigJkgZGVmaW5lZAo+IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtY29uc3QtdmFy
aWFibGU9XSwgdGhlIHByb2JsZW0gaXMgdGhhdCB0aGUgQyBmaWxlCj4gb2YgZnU1NDAgYW5kIGZ1
NzQwIGRvZXNuJ3QgdXNlIHRoZXNlIHZhcmlhYmxlcywgYnV0IHRoZXkgaW5jbHVkZXMgdGhlCj4g
aGVhZGVyIGZpbGVzLiBXZSBjb3VsZCByZWZpbmUgdGhlIGNvZGUgYnkgbW92aW5nIHRoZSBkZWZp
bml0aW9uIG9mIHRoZXNlCj4gdmFyaWFibGVzIGludG8gZnU1NDAgYW5kIGZ1NzQwIGltcGxlbWVu
dGF0aW9uIHJlc3BlY3RpdmVseSBpbnN0ZWFkIG9mCj4gY29tbW9uIGNvcmUgY29kZSwgdGhlbiB3
ZSBjb3VsZCBzdGlsbCBzZXBhcmF0ZSB0aGUgU29Dcy1kZXBlbmRlbnQgZGF0YQo+IGluIHRoZWly
IG93biBpbXBsZW1lbnRhdGlvbi4KPiAKPiBDaGFuZ2VkIGluIHYzOgo+ICAtIFJlYmFzZSBvbiB2
NS4xNi1yYzgKPiAgLSBBZGQgZml4ZXMgdGFnCgpXaGVyZT8KCj4gCj4gQ2hhbmdlZCBpbiB2MjoK
PiAgLSBNb3ZlIGRlZmluaXRpb24gb2YgdmFyaWFibGUgdG8gQyBmaWxlIGZyb20gaGVhZGVyCgpQ
bGVhc2UgcmVtb3ZlIHRoZSBjaGFuZ2Vsb2cgYnkgcHV0dGluZyBpdCBiZWxvdyB0aGUgdHJpcGxl
IGRhc2guCgo+IAo+IFNpZ25lZC1vZmYtYnk6IFpvbmcgTGkgPHpvbmcubGlAc2lmaXZlLmNvbT4K
PiAtLS0KPiAgZHJpdmVycy9jbGsvc2lmaXZlL2Z1NTQwLXByY2kuYyAgfCAgNiArKysrKy0KPiAg
ZHJpdmVycy9jbGsvc2lmaXZlL2Z1NTQwLXByY2kuaCAgfCAgNiArLS0tLS0KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
