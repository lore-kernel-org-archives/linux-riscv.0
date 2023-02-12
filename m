Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2590C636D7
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Feb 2023 02:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Rh5QIDn4ODod37fHdfNkNg/BIl6LYDAFHB+7+p0Vv8=; b=ef0ZHVnYFJ1MRF
	u0K0glCrzxmVB+O9IyfM9uCAEsqOn9rSL29xZHBkZiKqTlOM3u1dN5OoWW7r5XwGbZNu2DdGaoolY
	1NNiQRacHtH4pNRnB0lb4O6eOO7JU4SbIO7Jx/7OuPgaSC3O2ZZN7YdQl5yo4SF/+cA/WqgyWykpX
	elolFivvvdS2B1ZIn9bcFhHtAxZedVSf04rkLtxyK5DukO8ocVsWvcgHcwC599n/HQvaVJzqp2uWV
	3qZo2zyF9MZZoxVUGyoEvWDlVXNGOtXXoOjdPpZm3ex9X1GOX6ENQ3j/qLhFedaWgKzpIghppo8CU
	P0jXCtuGvUuP3/1iLKkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pR1u9-00AkEv-Ki; Sun, 12 Feb 2023 02:15:49 +0000
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pR1u2-00AkCH-Hw
	for linux-riscv@lists.infradead.org; Sun, 12 Feb 2023 02:15:45 +0000
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 7B88F5C00B2;
	Sat, 11 Feb 2023 21:15:32 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Sat, 11 Feb 2023 21:15:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1676168132; x=1676254532; bh=XF
	d2itQ9Q8tRMCuANmPpVcUQz7tHsp9UVd1TrH5jLFM=; b=bDR6b4n0NG+2t72sIG
	VAH6ziPmwqPxQxLfm1jzqnPrshKt7OXIccm/Gr8vEnAX+VnkyNyrA2s8PZCabm4z
	4M4FEHh5osWWgS1UrmO5YK4HpFRGWG15l5ZgclBxrkALRG6tG8sqZWtEWLkB0pkz
	LHGMJsdKmISsZOZllphS/lJZbadEp/hymDNckm/2gTRKyeygpDoqUJPFqnQEZ6V1
	Ib6mvL1GjdhoVPF1gaDSskqx7tfp10dz0shDtHX5zPE6Ui5qt1hCHwMT+gCFlF44
	NhLEBHRLml30VP1TUvrVErscqm3ZiUtiwe1iLP7v4NPHOkDStH0wFFe4+OUeEub6
	MvJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1676168132; x=1676254532; bh=XFd2itQ9Q8tRM
	CuANmPpVcUQz7tHsp9UVd1TrH5jLFM=; b=KLEtnz0+tCfMFjMxGOhUF5UGpmLT9
	E2k+2D7fWrC3t31yEROpLLQOiyem0XfuNqRlgKtuGX0Uq0zdKgvCdUkOvl3K21Qn
	p2+cSuMAhjljl6r7nJEISPFAmW2YTQdIXqGx6GBFxoLoUot90pOxQMvCgrH5WJPk
	WzEyK/jETrR6HMD4JzR6yxNuH3OOkkcPmHS4PQPnd4KH32IAUy14FFQ61Mh3Ucr4
	A7dpgCsWsouPzfenRBYOu0g/OjRbZL4sp+JbTYfEFikpC57gNNLEOYCnIR5UKpnw
	knAFgTlygdyEmIT2AIwa8++VVJEzmqlU8mRw5zagsvvflrPlU0dxXJlLg==
X-ME-Sender: <xms:xEvoY-7GNFfLILLAYsTchd2SabJ-mixxPCLfxVEB1IxVrbQGa1u7Sg>
    <xme:xEvoY36jkJtG2bRIoVLs64MzLxS0WOxxG2AVKrR1-Wm6iLkXJA7y1hLjaa7IxGtMl
    WXzwcvTwNl3zA6CgA>
X-ME-Received: <xmr:xEvoY9coASMaC5e-N4jrkSRhgOlig9H7oVqaTQcbKJkCzkggLYH0_W-x0l79-MzcOIJl3CVFzPrOX3mYfnujlGk97cWTBml4hu2wnNLjakPQuCMVjG6JOhKqqcS5TYIjPTS2nw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudehkedggeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepudekteeuudehtdelteevgfduvddvjefhfedulefgudevgeeghefg
    udefiedtveetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:xEvoY7L5Rk_PbKMLjP50gI7JXNTc1KqD68ej3adBLfYQmL_Ndq2NPQ>
    <xmx:xEvoYyIB6k0tujYNeVzxtO1HGLY2SfrKAFmFgYq6d0g1gQ8UdNCURQ>
    <xmx:xEvoY8yj5XEbubFJ2Xcd0PiQmBSPpAZvJlP9ke5IdEpe3AJ9bpIUwQ>
    <xmx:xEvoY_AfO3C20HwqnZlD0SPKYSm3coD9eY7_69meVmjkTMrHEHi7Ag>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 11 Feb 2023 21:15:31 -0500 (EST)
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
Subject: [PATCH 1/2] riscv: Fix early alternative patching
Date: Sat, 11 Feb 2023 20:15:32 -0600
Message-Id: <20230212021534.59121-2-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20230212021534.59121-1-samuel@sholland.org>
References: <20230212021534.59121-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230211_181543_112516_DFCF5D91 
X-CRM114-Status: UNSURE (   8.83  )
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

Now that the text to patch is located using a relative offset from the
alternative entry, the text address should be computed without applying
the kernel mapping offset, both before and after VM setup.

Fixes: 8d23e94a4433 ("riscv: switch to relative alternative entries")
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 arch/riscv/errata/thead/errata.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
index c0bea5c94128..1dd90a5f86f0 100644
--- a/arch/riscv/errata/thead/errata.c
+++ b/arch/riscv/errata/thead/errata.c
@@ -102,9 +102,7 @@ void __init_or_module thead_errata_patch_func(struct alt_entry *begin, struct al
 
 			/* On vm-alternatives, the mmu isn't running yet */
 			if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
-				memcpy((void *)__pa_symbol(oldptr),
-				       (void *)__pa_symbol(altptr),
-				       alt->alt_len);
+				memcpy(oldptr, altptr, alt->alt_len);
 			else
 				patch_text_nosync(oldptr, altptr, alt->alt_len);
 		}
-- 
2.37.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
