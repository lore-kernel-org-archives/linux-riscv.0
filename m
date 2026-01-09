Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10192D26D75
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jan 2026 16:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cPUKMAzzNzWwP3nHFfuBXtyouyJcSsQt8nHLBFFb/xo=; b=KNlp3uAsEpgeOe
	PILEavLl3YDmhW6bTlLPxsiAhmE7woJiK19TPccVoChjq+XPP8cjCfm6bIUoWVaCBTA8jKRv+d74a
	IHmEvkLrdfqYDkmNW3Oq7WsPl/mZPLUZXhD5ixSGZplsad4QeSKSBhOijCgN3+VCxlvnwJsWmAZo7
	z/pU/KeCwSYS4LfNmIENDpnuvHCMD0jEhYhBdoERz7QzmK69LhmQH1lAxFbqtVcRlqTqsIzPql+mG
	2jqslocVwC3zIh8x44woy/x9++K7eBjXrqGf0+Q052ZWSo18HDa8tiY47lOJeMafBtR5eh7Lz95bS
	goFSfSPcyixgEn4g6zQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veFYO-00000002djQ-1eQK;
	Fri, 09 Jan 2026 16:41:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veFYM-00000002dis-1TMz
	for linux-riscv@lists.infradead.org;
	Fri, 09 Jan 2026 16:41:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BD580408D3;
	Fri,  9 Jan 2026 16:41:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CE19C4CEF1;
	Fri,  9 Jan 2026 16:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767976893;
	bh=HlhshcbACU4cx8fSzZn3AaPVzCECAd+ZwpQPQ+F2DSc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=T+HCE/kD6HWY5CMtJFaT4wz+DFAXfChTB70NHDkKf+n30FMQN1RFfYCjY64eq2O9w
	 MUrKKjjMPTNN3AeVWodaHutbYQDGKede/37Dpm4BrpwdUnMI0chvWmOiWWz/UUpBKp
	 yNqYqq60tAMvUa0CdJWwvIMBX90ege+RRtuHxF16dCL+jWBgZQ+1yFyy038XQ+ddOl
	 hEuUBmCQakMOXuN0btbOtdRNbZS4WxORe0KJ8+4ssZezRo8T5udT/lULmHEVKTj7ZP
	 A8osj7Hom5hwE+kYp2nWNXoPS2EhBFhTL0bYX5Yi1OLgZP3KlbdpZ3w/UwFbMHpTaD
	 g5IjwO+msAtXg==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-i2c@vger.kernel.org, 
 linux-rtc@vger.kernel.org
In-Reply-To: <20251225-p1-kconfig-fix-v4-2-44b6728117c1@linux.spacemit.com>
References: <20251225-p1-kconfig-fix-v4-2-44b6728117c1@linux.spacemit.com>
Subject: Re: (subset) [PATCH v4 2/3] mfd: simple-mfd-i2c: add default value
Message-Id: <176797689092.1850390.415240283270353240.b4-ty@kernel.org>
Date: Fri, 09 Jan 2026 16:41:30 +0000
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-52d38
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_084134_408400_8416913A 
X-CRM114-Status: UNSURE (   5.65  )
X-CRM114-Notice: Please train this message.
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

T24gVGh1LCAyNSBEZWMgMjAyNSAxNTo0NjozMiArMDgwMCwgVHJveSBNaXRjaGVsbCB3cm90ZToK
PiBUaGUgZGVmYXVsdCB2YWx1ZSBvZiB0aGUgUDEgc3ViLWRldmljZSBkZXBlbmRzIG9uIHRoZSB2
YWx1ZQo+IG9mIFAxLCBzbyBQMSBzaG91bGQgaGF2ZSBhIGRlZmF1bHQgdmFsdWUgaGVyZS4KPiAK
PiAKCkFwcGxpZWQsIHRoYW5rcyEKClsyLzNdIG1mZDogc2ltcGxlLW1mZC1pMmM6IGFkZCBkZWZh
dWx0IHZhbHVlCiAgICAgIGNvbW1pdDogNzdkZjExZDFmMWY5NjI2MzZlODk3ZjNmY2YwOTc3MTA5
YWE3NDc5MQoKLS0KTGVlIEpvbmVzIFvmnY7nkLzmlq9dCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
