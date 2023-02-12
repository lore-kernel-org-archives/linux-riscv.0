Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD5DC61DA4
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Feb 2023 02:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8H0EA/ehUq6lzze0z1HD0SDWf13JHtOPsvfmQd/o4VM=; b=ZotrwbL4x0Lw0l
	28UVQr7VT3lnJe67BWUu0u3v2Onm4+P6Uf4mChjsBeFNyf5bnv5Qtk146I8iGI+mPr4Vft0ikw0NU
	l3DRPnZVAzkjj1mE1I5abSflGDX/gfWhXUrYfVGhVSQXCQc6wOmJdpO+JNL1Fq9PyfWq0VuU301jQ
	p2rkuFtZ/WSKVhKqGNA0vWII30IVWIKo7pad+3apDXLe5CW16ewNP8uZqKBDVpPsXbA/2qpXvsiYj
	DXI/PhEKh5A4MBqHAo2QzYrNFI7r3oK4AGYofZGxMkWWoYpCw1TiMCDvaRrck4niZw7L/48dYhNj7
	7eFcICDRv/1JMt0IO1Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pR1u6-00AkEe-Tn; Sun, 12 Feb 2023 02:15:46 +0000
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pR1u2-00AkCG-Hx
	for linux-riscv@lists.infradead.org; Sun, 12 Feb 2023 02:15:44 +0000
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 65F925C00AF;
	Sat, 11 Feb 2023 21:15:31 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Sat, 11 Feb 2023 21:15:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1676168131; x=1676254531; bh=8u+zNk0AjPoNWDX5vvoNZoLkc
	vhYyKyvuQLWFPq8Xw4=; b=P3VcwyR/XPyQzZsLPQf3+70PgeCLSVPNbRlAS5Ui5
	8LAhd9a26Ebs5Bz50oX28oG76XqKnHqRVyhPH/59ewT/FS6+WavRRqxgG2v6L1H2
	x7nQh87PAiONAsZzG6tJSMWKOWcqCEiwBIMIRUMcv3jn3zkrwSoE2r+XIaQ/9S71
	vhw9z0c33lI5U58wcq1aI92VCcKmTAF11O5U+Tzl0a2+1leUh8YMz4i3DAVkqwnk
	yjDfL+V/CpMOffghO3NNGH4CET3o/NNqjMucZ/S1OKGQZWDX1sWbQdZQvl2YRuMu
	FL8yRM+u2PyjteMTHO08aNETeZAOulbvo0bJttzwMWQzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1676168131; x=1676254531; bh=8u+zNk0AjPoNWDX5vvoNZoLkcvhYyKyvuQL
	WFPq8Xw4=; b=XjK4iBkh7EXNhYDVHsnD8BQby4izoyDlSQWZDWXHMLeXkEzNHXN
	YHV+H8Rw9+NaMpMJbq3+85R1xHpzoVxyjKTv0JOLWzyrH488dfD73HPBbWB+myfW
	aTXp8cRncZ5iWi3dC7SYD8BXkEJecnWquk2LV+0eiQbfeEZY86tTr52PPMvTjb8u
	BLH/VgHOKKKPehCVz+E7/dr6OMCbi9bhC1BDTTqhrBMZv4DgjiVeZgcTUehTwxyn
	Fmxi037Gpjoe3wCChDSZAEW0iP8BZkWkKFij8Kzl9xaFX/p3U9Cn9l1MMQgUJIZQ
	Am3A1oisCG6gKc8DBz/I7gKR93SM0UCEbLw==
X-ME-Sender: <xms:wkvoYzjTecigdPNONtT-oLT0WKFPT1HDCGkiW1j-BQD4GifJPZAtUA>
    <xme:wkvoYwBbOV8qx1U-6Ib0UwMm6UcUxnx0rSk_qNVESgb_j-gpacWLqjjdfUxKpfC_J
    uOnhSraf8IjCjVGEg>
X-ME-Received: <xmr:wkvoYzEXju6zIYH3PUaMfUL6VMc_K2Tmpl8SZxYdlVh0xOXysdZGQMyp3bIVbz0beo330QqNe5exQMZPtnC0-USOk0fvX9ruptY5eRRlkXsB1yWgvflVlCGzbdaLnkzs2WHdZQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudehkedggeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
    ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
    grthhtvghrnhepkeevlefhjeeuleeltedvjedvfeefteegleehueejffehgffffeekhefh
    hfekkeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:wkvoYwRSZV9GlhaL0K5uzuEPcMb2AkNE9BENfFodP404t66tNCoEWQ>
    <xmx:wkvoYwxIx_XioTZXMCCKav8hSt5qwIuXrm7gXPza6LyAvdmy6ojfyA>
    <xmx:wkvoY24RiwSXEKsvqQedv6-f0_YWw29PKXHW-zPSw7YFeGBRqt3s_A>
    <xmx:w0voY1r1_6sfHR0pQGYEUzw8a9Ox6MZuXUmKw8EIdduUMHStmihJWw>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 11 Feb 2023 21:15:29 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Heiko Stuebner <heiko@sntech.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: Samuel Holland <samuel@sholland.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Christoph Muellner <christoph.muellner@vrull.eu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Nathan Chancellor <nathan@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] riscv: Fix alternatives issues on for-next
Date: Sat, 11 Feb 2023 20:15:31 -0600
Message-Id: <20230212021534.59121-1-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230211_181543_112511_D71ABEC8 
X-CRM114-Status: UNSURE (   7.30  )
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

Several people have reported that D1 fails to boot on linux-next.
Patch 1 fixes a bug where early alternative patching used the wrong
address. Patch 2 fixes a separate issue where the Zbb alternatives
are incorrectly applied based on the 'C' extension instead of Zbb.


Samuel Holland (2):
  riscv: Fix early alternative patching
  riscv: Fix Zbb alternative IDs

 arch/riscv/errata/thead/errata.c     | 4 +---
 arch/riscv/include/asm/errata_list.h | 5 -----
 arch/riscv/lib/strcmp.S              | 2 +-
 arch/riscv/lib/strlen.S              | 2 +-
 arch/riscv/lib/strncmp.S             | 2 +-
 5 files changed, 4 insertions(+), 11 deletions(-)

-- 
2.37.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
