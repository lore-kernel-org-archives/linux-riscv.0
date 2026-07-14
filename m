Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AFBAC43458
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 09:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oo0EGEibnwQvLN3QZdL4RqMQhwNGElAbVf8zBYiVWz0=; b=bEoac82Bv5F6hN
	iGUBuZ9PSZAUU15F6Df7EVVVF3r5IMYmqJBQmga3F8+WwBrGGyjFLW+5C/ixUDzKKNqPMBAxD9VuZ
	TcoKDT/qa4LE7YgVxEfZSLN/oGvd79jmJ/lxUrdH0161zBGUSvaey9aBlNqyMZoJKJPOeId5JWQjj
	6oikQm39hmEXqYuL5clFNMWhME8OA20BSMGuQdm1xWcpj+e3oU+TS7RC7S9uPPjdAdRmWjUW6pdQM
	viwhCaWFoclQ/jE447uc7jBQE26Ai7uaOMitBm1HRmYDdYOQpdEX2aLMRmluxa8QBKin+vkfthOSf
	ZJlOjCBF6R7GpE0H3zbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjZJ4-0000000BRJZ-0OU8;
	Tue, 14 Jul 2026 09:20:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjZJ3-0000000BRJD-13v4
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jul 2026 09:20:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9CE3F601EC;
	Tue, 14 Jul 2026 09:20:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46C351F000E9;
	Tue, 14 Jul 2026 09:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784020800;
	bh=NvIQGG17Gg6DcApfmewQ2HnIgUe9CvNeraPvhuLErkY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZgIMC8fq8Y7SDpWpKGGfZshWrTsaMJ2RLMvcqXwYFLdK8Y45Exq6BgifINGTkCRon
	 8xm6gjqK5+4+1RVRqsLGMxIEOhbkjb4Mi7UWAQbsRmEW5CuxIcffb4PUclJxCKEaIa
	 Ix3fxa+VOUImnOe7gjGO5/wCkWyLAntWpOUhE2q+gGv9IaS3HEEwB8zR/ceGOuq0T1
	 l2t+aHBehC1C5Zz+u7K6cOYlUHI9EtmMAkOFCa1gUGii9IZiZJvI5kfCZdaDVz3n+y
	 1o4Dv2tCW+zYSzuRnt+/Uy2B/XBGCZ+S8lqhBP8WmjfYiSe38Ez+D7CGHQ/cqKTnRU
	 5WW59IX/476jg==
From: Yixun Lan <dlan@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 0/3] clk: spacemit: Add clock support for UFS
Date: Tue, 14 Jul 2026 09:19:54 +0000
Message-ID: <178402023785.1567931.15038161534812979659.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260630-06-clk-ufs-support-v1-0-cf7521d1d0fe@kernel.org>
References: <20260630-06-clk-ufs-support-v1-0-cf7521d1d0fe@kernel.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On Tue, 30 Jun 2026 12:52:44 +0000, Yixun Lan wrote:
> This series try to fix parent clock of UFS aclk which was submitted as
> wrong version, so correct it according to updated doc[1] here. Also, add
> a UFS reference clock which was missing in previous patchset.

Applied, thanks!

[1/3] clk: spacemit: k3: fix parent clock of UFS aclk
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=7a588b62679c51abd08171d31df6e44589f0097d
[2/3] dt-bindings: soc: spacemit: k3: Add clock ID for UFS refclk
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=4fc567e1bacdb5da85628de8dd1d1e3328060798
[3/3] clk: spacemit: k3: Add UFS refclk clock
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=8abba78dc0ee4ffa7c4e0e05b93c58bd94ff11c0

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
