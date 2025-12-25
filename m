Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6636E784AC
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Dec 2025 02:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AxmhndSpncjnb+zgk9E++o0iyB1gLEH/9Ge1+yCDtnk=; b=BkC4tMlO0uCFtu
	RDKM1NkAJiLmCeWCpuPkIN1aQXpBClFXsdiPB14gooEhlitJmfiA5Xt/kjOPgH4EMfQlFy4uCS045
	SfIB9/vXOLfG3X6GJOGtrX4wprUbcNFPhzAstLgfFYlXqbl4B479k2CI3N5jPrkdXdOrau3ozVq2E
	BURaDjhVCTz2yFk/W/E3tAy800utAPfOmWjrXJqbxQe6CL18DIZtc5yLfwhZ8sNHAwF8UmdCv7ii3
	E7pirrloSeIIAyb9n4pAK1Iz1kgaH7N1qZbJYjqhzGsRFq1acgrHAkORlCWfL6Blv+f4RJYf/pPk5
	qKeKfZnYUWLcvioBPdIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYazy-0000000Hant-3piG;
	Thu, 25 Dec 2025 02:22:42 +0000
Received: from mail.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYazv-0000000HanG-24qG
	for linux-riscv@lists.infradead.org;
	Thu, 25 Dec 2025 02:22:41 +0000
Received: from ofsar (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 33C4A341030;
	Thu, 25 Dec 2025 02:22:32 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Haylen Chu <heylenay@4d2.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Charles Mirabile <cmirabil@redhat.com>,
	Brian Masney <bmasney@redhat.com>,
	Akhilesh Patil <akhilesh@ee.iitb.ac.in>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: Yixun Lan <dlan@gentoo.org>,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v4 0/2] clk: spacemit: Fix module build for spacemit common ccu driver
Date: Thu, 25 Dec 2025 10:22:25 +0800
Message-ID: <176662919110.361686.13875991021272017337.b4-ty@gentoo.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251219012819.440972-1-inochiama@gmail.com>
References: <20251219012819.440972-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_182239_557904_BC244948 
X-CRM114-Status: UNSURE (   8.85  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On Fri, 19 Dec 2025 09:28:16 +0800, Inochi Amaoto wrote:
> Currently, the SPACEMIT_CCU entry is only a switch for enabling entry
> SPACEMIT_K1_CCU. It does not guide the build for common clock codes
> even if it is a tristate entry. This makes this entry useless.
> 
> Change the Makefile to add a separate build for common clock logic,
> so the SPACEMIT_CCU entry takes effect, also add necessary
> MODULE_LICENSE()/MODULE_DESCRIPTION()/EXPORT_SYMBOL() for the module
> build.
> 
> [...]

Applied, thanks!

[1/2] clk: spacemit: Respect Kconfig setting when building modules
      https://github.com/spacemit-com/linux/commit/5ec8cbbc54c82c0bdae4dbf0e5aecf9817bde2b9
[2/2] clk: spacemit: Hide common clock driver from user controller
      https://github.com/spacemit-com/linux/commit/99735a742f7e9a3e7f4cb6c58edf1b38101e7657

Best regards,
-- 
Yixun Lan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
