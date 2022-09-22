Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E13FEC6FA82
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Sep 2022 05:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SgmOgiGpYX6rnA+XJU9Jt21aPWcvd7yYlTgAAUbIlTs=; b=vnGVttGBUV33AK
	ZR7SAaoEeIQ+atdVFM5zg9Q0EULQJX/laHof+XiV7KCX+UMGoWzmXf1nGSDycGfltQ7309W/1PfwG
	81uHzzqX/DKmCnJ5GefAUJtG6q0RL70ScDdhMKmbqkZ6GtOq8uquKsbKCknSXfSZMc8n73GSUs6y0
	XLv0viQ65RpyrcXik5Nl6dBy7gwiBwW4v1XeO7NTnm07wCBHO68NVa55DDGUe4Br2F+Wlqas7wdf6
	Ar2TuTr5FzCXbyI/llJrGCF1eRlQQCXMAIIlw2vu02xm5rdWYxzXedKf3s/Nu19fqhfYC+YovIcoY
	vYNskCt5yJ05ioKER++A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obF3x-00DS39-Ve; Thu, 22 Sep 2022 05:47:54 +0000
Received: from wout3-smtp.messagingengine.com ([64.147.123.19])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obF3u-00DS19-Sd
	for linux-riscv@lists.infradead.org; Thu, 22 Sep 2022 05:47:52 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 4AEC73200A14;
	Thu, 22 Sep 2022 01:47:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Thu, 22 Sep 2022 01:47:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm3; t=1663825664; x=1663912064; bh=HTiACL8xrBd4oR3VgelAWNmCL
	H9hEi9gj1GAvInP2lQ=; b=oipLhFsV9rqwxDrBkS3KDOHEhF99HeDkCi1vqif0X
	vr2qEqDK9RW+tbo9mXU6D9Gj46z8c7G9/fp3aVnvdL1+kqlrwG680MqfXm9D91Wj
	aol2zHNoJWeIEVLWbl8ULPIUSXWpAEF8FhDAdtyvYUX8nSrIDxY/TFEiYuFZ/ul2
	kB7XMPTwDL74rx5qhPS1bSVrX0pngK6X7b1Wqgh0qFa31C48FxzCq0AS8XDICIMX
	hgIOGiJkR9kFW5CZk21fLcFythybFIqJjGJ8sqK9SJKS6TL++f8ml/z0TTVdeIEs
	RWPRBQJ2K99TePujBh85aUO31AFZHd1PTYwenGQYRs9vA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1663825664; x=1663912064; bh=HTiACL8xrBd4oR3VgelAWNmCLH9hEi9gj1G
	AvInP2lQ=; b=cKNFiLe88tNeOvaO76WvWVcGvB5gnX43RWuy3HO8uHb4x7JSHRE
	+1PEDXiKeCAa6EauCOV+vegcnn6OaYMwh7BM78bf8CYxeWmECN/UoArsxQwUGoRO
	2Wvm3HmZPJknRpu11NvZqkuzsC754PqrPY8lAuExkP9Y7Z1j5NTOlEw9vDKkam2K
	ALTyJfTpjBMqyQXGIsZHXNc8Qd1RjP7GVCBs1mgiKo0ARlWOQ2eCSnb9NKyZD3/n
	V4QprjB+6cspHqgt4TJLJqP8KZ7XhvyyV5zHgej68TdKgfDSOukB2505nPvsdgBr
	j5tOIDvjJRQdo5Ld2i71SSdi+JQ0VgVYVuQ==
X-ME-Sender: <xms:APcrY9LSpDi1VSLXRVONXWFwG-_Z6pOKHDrwYKucG8IMWpDSReiyOQ>
    <xme:APcrY5KLJPF-xco5O87ToFXzhr77wKenMJNVpwvgLH6rYhdb1dSlnmia-fKSujVGq
    f16TlmgGw0aVRqJJw>
X-ME-Received: <xmr:APcrY1vx7L_Zc2RQn4T3wx2iHmJiqvkEcaFCGKRTqpK3EqywWGaJXvI9T1qRl8L_wk7EB9qzn2zfAFpqYTdIL6YCtaiFVv6mALDXjTiOtO5B_F0vvFJBWWpTE9hm1cbRODd8gA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeefvddgleelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
    ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
    grthhtvghrnhepkeevlefhjeeuleeltedvjedvfeefteegleehueejffehgffffeekhefh
    hfekkeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:APcrY-bxgUf2O0V3R4dmTMnOJzZ4eB_PymG_VxaLkVzo8a08OPOAMw>
    <xmx:APcrY0Zn9OGH4O4qRlkZU5Q2_YN8adMoG-fjeclP8WyqXjlaI0PuBg>
    <xmx:APcrYyB5RzPBglYtcX1PEdQXahpgDf8KwYLm8nMrwp20VbD7uA-9bQ>
    <xmx:APcrY5OQFJ5hdE9tELmOj953L6qcRViyId5DvCRZtZAEiLx8mZ9S9g>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Sep 2022 01:47:44 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: Samuel Holland <samuel@sholland.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] riscv: Fix crash during early errata patching
Date: Thu, 22 Sep 2022 00:47:41 -0500
Message-Id: <20220922054743.30159-1-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_224751_390904_C42EACE2 
X-CRM114-Status: UNSURE (   9.60  )
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

The patch function for the T-Head PBMT errata calls __pa_symbol() before
relocation. This crashes when CONFIG_DEBUG_VIRTUAL is enabled, because
__pa_symbol() forwards to __phys_addr_symbol(), and __phys_addr_symbol()
checks against the absolute kernel start/end address.

Fix this by directly using the underlying kernel_mapping_va_to_pa().

Fixes: a35707c3d850 ("riscv: add memory-type errata for T-Head")
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 arch/riscv/errata/thead/errata.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
index 202c83f677b2..83174f13783e 100644
--- a/arch/riscv/errata/thead/errata.c
+++ b/arch/riscv/errata/thead/errata.c
@@ -76,8 +76,9 @@ void __init_or_module thead_errata_patch_func(struct alt_entry *begin, struct al
 		if (cpu_req_errata & tmp) {
 			/* On vm-alternatives, the mmu isn't running yet */
 			if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
-				memcpy((void *)__pa_symbol(alt->old_ptr),
-				       (void *)__pa_symbol(alt->alt_ptr), alt->alt_len);
+				memcpy((void *)kernel_mapping_va_to_pa((unsigned long)alt->old_ptr),
+				       (void *)kernel_mapping_va_to_pa((unsigned long)alt->alt_ptr),
+				       alt->alt_len);
 			else
 				patch_text_nosync(alt->old_ptr, alt->alt_ptr, alt->alt_len);
 		}
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
