Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A2FEE57CC
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Sep 2023 20:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wZiPvZBmRV32oEmRUW40iqumqSFKdPSlxnSh+MCQl2g=; b=TAFOsF8ChvdjrK
	RGhKxPdbnuCK6xFq7PefWjoviekUFkbU1xcQ8SR7ZfYsgXb46FJm5C9PIM7TuqfvLlv1KhUCN/+AL
	SUq4uRvgOdl30hdZTsePCv9azNVfTiD9Y2nLnB9kkrHq+m6JlINqxJ6TbYUOSYymTPCbgrvGmhsXL
	e+kQ8tjNSzCbbMc8jkUQwX3clhN+QIYEma9T9NnKc2LmGdLqkdh5i7pwzTnn6TPgcw6cEN/m1MrP6
	kpcwfVn5DyvrmB+6UqemhXUQu8ixRpnrOa0651wwIVorAO3LKzKRbIWc6aIrtakPk6EjlG37Fs6Cu
	htbbNEKx2nge+DyUw/vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qf4Op-00Fky5-03;
	Sat, 09 Sep 2023 20:17:47 +0000
Received: from wout4-smtp.messagingengine.com ([64.147.123.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qf4Oh-00FkqA-0W
	for linux-riscv@lists.infradead.org;
	Sat, 09 Sep 2023 20:17:41 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 2D9BD3200805;
	Sat,  9 Sep 2023 16:17:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Sat, 09 Sep 2023 16:17:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1694290657; x=
	1694377057; bh=rUsqFVJjBVyLyCtvleKeuxMZhdTqpYL3EtsdFwHrfmk=; b=E
	N8Sx3QN/zwyT1uB2+ogFARNEBx5avj520tUSxakXtHkIRaKHXquCPWKjhWIzDZgG
	srtx3VyL9+CDt3cqFSDUG6MQF2i/sOudw4fvnTOxSxeyya6GP/oPZW2IYxCwRut2
	40mmFiiqU6NNduAoRnoXLlYRKOSSRHcwtZ6GXPO3ZkS6e9fZ27yZrvOyB0euLz9y
	kj88QUz7fOXwIZUbxic69m6Kh2dLZ/WpeigR/X4t3feBkqX7h24Rk/4bXQEfm40M
	fQdX4a9Nz3LeVejqFaHuJXTUPRCg2thjwWhWK1mK2V6IgHXJdCUprlREPHV1mf+b
	tDiB8MPwA70ma9zm4JwUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1694290657; x=
	1694377057; bh=rUsqFVJjBVyLyCtvleKeuxMZhdTqpYL3EtsdFwHrfmk=; b=l
	R+Q/fYfNiHJVIzgyH8iPibJTTy6BLgjJwAJX9wbPM0FZjI/tTm4mQMH5s2MYqzG7
	CoypenZlZDIJwwfOBTr01Buows1SWTkPrwjGvr26szHSjHxGbO+6QUhMwxCDrjqy
	X013ycgQWlbyxULqmNrU3Xfy+mJZL3U876cdL6urH/vRtDyoMEk99b46BbaZTwPE
	FPfJ+CPX3k0+3F9zmkQop8AxbAbmC2TrHdCRcFf3vELyKw6fJ4BqmE60GJNZdLXQ
	slewUndvm4x5TzH5Y1HEHVR6aif3RLAIEw78+QsrAXYpDFfgIf7KUkBJT8Srh0vt
	LdKCPxnON/hgTnyTp6hFQ==
X-ME-Sender: <xms:4dL8ZP9-5oTidZloLy-nR4A4FbUUVGt-C7Bk6E37WxyKXgTk2PJW-g>
    <xme:4dL8ZLtIRylnb_DLOCyHGJRtEVI_MwLggr1EH8q_NWYe7mgHOn_NNCTPiwgZR46nf
    I4oD6zJTmMiIbRTog>
X-ME-Received: <xmr:4dL8ZNBRdsxg3h_Z2SdA8FnR7qYUb0DtLHc-6Uo2qgP792mDniMJ9-aMgr5_b_o2xaS1Okk7eqLaBwHkqmV18wwEYkZXxlBr7oU1BozGtUF4cebUMD0iKGnavlKwwDLOtcgwVA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudehledgudeghecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghm
    uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
    ggtffrrghtthgvrhhnpedukeetueduhedtleetvefguddvvdejhfefudelgfduveeggeeh
    gfdufeeitdevteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:4dL8ZLchhWySKUuDasjyZRBwirkTM0Hv-5KK324bJPnioTfpilz32A>
    <xmx:4dL8ZEOJ8dOb5MX812UdY66grGmMnTiq_0FdOjruBInopqeysKKZQQ>
    <xmx:4dL8ZNk_1GNUP3mm6M8l-i85_rfeI8IhxNymwDZf0md-BVV5Yd1Ktw>
    <xmx:4dL8ZBoYoYJ7FQKWFAUwYWhZX7FXYpsZwK4IwxxST5Z9rMObLBc-Fw>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 9 Sep 2023 16:17:37 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-riscv@lists.infradead.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH 4/7] riscv: mm: Make asid_bits a local variable
Date: Sat,  9 Sep 2023 15:16:32 -0500
Message-ID: <20230909201727.10909-5-samuel@sholland.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230909201727.10909-1-samuel@sholland.org>
References: <20230909201727.10909-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230909_131739_228803_8559B23F 
X-CRM114-Status: UNSURE (   7.73  )
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

This variable is only used inside asids_init().

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 arch/riscv/mm/context.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
index b5170ac1b742..43a8bc2d5af4 100644
--- a/arch/riscv/mm/context.c
+++ b/arch/riscv/mm/context.c
@@ -20,7 +20,6 @@
 
 DEFINE_STATIC_KEY_FALSE(use_asid_allocator);
 
-static unsigned long asid_bits;
 static unsigned long num_asids;
 
 static atomic_long_t current_version;
@@ -226,7 +225,7 @@ static inline void set_mm(struct mm_struct *prev,
 
 static int __init asids_init(void)
 {
-	unsigned long old;
+	unsigned long asid_bits, old;
 
 	/* Figure-out number of ASID bits in HW */
 	old = csr_read(CSR_SATP);
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
