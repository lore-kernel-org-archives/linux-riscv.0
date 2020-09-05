Return-Path: <SRS0=D0Wr=CO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C5FAC433E2
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Sep 2020 05:53:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6B12208DB
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Sep 2020 05:53:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BSlw8g7c";
	dkim=temperror (0-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gaeAJ+xG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6B12208DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YNb/CC+hD0Y9cHBvMo/aY4UR9M/cuJfbgZZpe15TUnk=; b=BSlw8g7csRx/YfsNzwQpdaHqQF
	wq7De8k5i6/0BwYL0Tpqnwl09ukYzQXHKN9NIU30pPj2Ql9sMFqXMSYXHoV8KuFpr1DBMxOkp8l1k
	HXnRxwQ/rmJxiRiO/nfFblQ561lrADfL3SgTdcuNs57fdzpZ7Sxb6wRHkNkabMTBFYdc9gz9ONTTK
	YYHlVbMy13XdBi7JHQ9sY6NJNs7GIV74KS6TGHZvxKtaRxbDsK0Y0nR9RzdtME4Carv6LTG/07s4O
	pMmQYGMvNTEgus4cyT5lETJs2iN3znpS5l5RLkjTIiKja8416zndWzf3r0t2vp0z3yXMd+qY4vbAr
	t0rs913w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kER8R-0006vp-N3; Sat, 05 Sep 2020 05:53:11 +0000
Received: from forward4-smtp.messagingengine.com ([66.111.4.238])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kER8P-0006vR-2V
 for linux-riscv@lists.infradead.org; Sat, 05 Sep 2020 05:53:10 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailforward.nyi.internal (Postfix) with ESMTP id 37F5419402CB;
 Sat,  5 Sep 2020 01:53:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Sat, 05 Sep 2020 01:53:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=p/IqhxuUf+geXOUpq
 b/ae7GJFYBwZM31jPQfxJJcpwY=; b=gaeAJ+xGbSqG9JP9iIpuJPvovHS/xx4sN
 JVd8cmAAz8OhRjQ92+i5nOHSw1zvqHoyotWn70e7Iq+wCA7zHR7+zp5X0hAhMziw
 ZdAeTi8cAztfxXmfYz077s6lW8RKyS+z4xnGDyXq0erK/3Gd3ImmOxWmCsI7H+nt
 Ovuo02YtiNgpN1uwa8GJZV9R4ZJe7Mv6is8TcuzfUH4y442o9pmmYITKUtd+hbnU
 OP935luTeXMtHlghSdxVv4EMPVaCGb/VMOo9REfxxgO50OO2I9+/rFphiN0y/FZw
 fffWM+H6vQYgP6/Hmn6TX0ptlQpHHHCQeuJOi21eN3s8WAUVUMgjg==
X-ME-Sender: <xms:vCdTX5kbtelNgA2uJKcsQT8md_GEZ27sDvP9oQG5dJ_TBz-gdMwHFw>
 <xme:vCdTX01S6p9ixFpVRHCxqyYmD3FkL4s9kSHAS036N7XhGA5RRBSzndlNaYPsEXHaD
 TH62Vf4-NX7M3gmJA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudeggedguddtudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertd
 ertddtnecuhfhrohhmpefrvghkkhgrucfgnhgsvghrghcuoehpvghnsggvrhhgsehkvghr
 nhgvlhdrohhrgheqnecuggftrfgrthhtvghrnhepleehfeffffekvdfgieffueduvdeuue
 elffdvgfefveeifeeujeelffdtgeefudevnecukfhppeeivddrjeekrddujeelrddufedu
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgvnh
 gsvghrgheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:vCdTX_qQEjkUVUgKTtGwpsaZSegrta_soycsrLBXjLkOzANPwhrrng>
 <xmx:vCdTX5nCg7KNBJpyFMfsm3c1LWfRT3Y-le_HLkLyo_4DKUQXRISnyA>
 <xmx:vCdTX30VP7JkA4SrkD-aLypirrjShLH_mfFfQjBan71-AUdgIc-hBQ>
 <xmx:vidTXyRPC0FqqbKXwjZHqiD6y8hRJ9DKurTCIabtReTDtS_hxBv98Q>
Received: from nero.bb.dnainternet.fi (62-78-179-131.bb.dnainternet.fi
 [62.78.179.131])
 by mail.messagingengine.com (Postfix) with ESMTPA id 298353280059;
 Sat,  5 Sep 2020 01:53:00 -0400 (EDT)
From: Pekka Enberg <penberg@kernel.org>
To: linux-riscv@lists.infradead.org
Subject: [PATCH for-next] riscv/mm/fault: Fix inline placement in
 vmalloc_fault() declaration
Date: Sat,  5 Sep 2020 08:52:52 +0300
Message-Id: <20200905055252.527753-1-penberg@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200905_015309_258219_871CEF06 
X-CRM114-Status: GOOD (  10.70  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Pekka Enberg <penberg@kernel.org>, palmer@dabbelt.com,
 kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The "inline" keyword is in the wrong place in vmalloc_fault()
declaration:

>> arch/riscv/mm/fault.c:56:1: warning: 'inline' is not at beginning of declaration [-Wold-style-declaration]
      56 | static void inline vmalloc_fault(struct pt_regs *regs, int code, unsigned long addr)
         | ^~~~~~

Fix that up.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Pekka Enberg <penberg@kernel.org>
---
 arch/riscv/mm/fault.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index a23eaf5ce95c..a173432ccf82 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -78,7 +78,7 @@ static inline void bad_area(struct pt_regs *regs, struct mm_struct *mm, int code
 	no_context(regs, addr);
 }
 
-static void inline vmalloc_fault(struct pt_regs *regs, int code, unsigned long addr)
+static inline void vmalloc_fault(struct pt_regs *regs, int code, unsigned long addr)
 {
 	pgd_t *pgd, *pgd_k;
 	pud_t *pud, *pud_k;
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
