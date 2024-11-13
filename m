Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A446D41C1E
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Nov 2024 09:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uY4IYi5Itn/fsGd+rw9ToSiXoKbsgFpTdOELvM15Nb0=; b=G/0JvBsy58pHNn
	RAhaBZD43Cy/BVtI/AGJfBWpZoXuHy71Anp+FQG9Mathyfcf/JXwZBBL5HptoxxMWlIlWhNW4YqNm
	mE+sBadNw2LzUARfAsOPP+4xUd+N6myD8r62WO0Ki7snd8RVUoFOkoXGOq1lVC2+cCB76HRls7z91
	yO9Xuudw01CQhntsAUC1nbxsVQ+oPg/SkQ7jblkD1yKZCoVDhlhUunwtaJ0b5CY4e1jKVyz3WIF9i
	dOif3AFS9x5DBJmyLM1bwaKsaHaCq9HqkgKeMKP0YojjVehiEtklxyYPVEYVaxDNI4AnTq3hxwB8z
	h4H6ErC6UaH5EH8AhSzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB9Yz-00000006E2E-2vBl;
	Wed, 13 Nov 2024 09:21:25 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB9Up-00000006DUK-2vDN
	for linux-riscv@lists.infradead.org;
	Wed, 13 Nov 2024 09:17:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ndQVvTzHXT+i+I2ixdEppGGTUj/crNj5V52A15z/KHw=; b=Cq78MvQ9Es/ZEKqr+E25u6eTL9
	Gdugsx7JW93JAa2yPj6D3MgefOyqg0f9mRPyJfnwSUNDJXfY9yZKP+T3rg/EHBuRh8ECUs59ZKt1n
	n+xHF+xGSq1wLpTdfa6SzvaQiMpZqyf8LA7+6mpVpKmiElToTVly6hJFXBL0KhRnaBAtzan1Rx/oG
	tULxQd7PlYXSn2fcm1LGN1nX14A6rLGrZKNQ0wjxS6G1XpCRs8iRiT9cVOmJe88EvX3UpLl0E7Q90
	UAMi+teKE608dDEOXfTxBF6cJdfYEfqYqY3JOSgZFFNoknSFpgBYNP2v7gQREOFXWw0EVan/PHkmb
	r5iaKCAQ==;
Received: from [63.135.74.212] (helo=rainbowdash)
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1tB9Um-003uoo-0L; Wed, 13 Nov 2024 09:17:04 +0000
Received: from ben by rainbowdash with local (Exim 4.98)
	(envelope-from <ben@rainbowdash>)
	id 1tB9Ul-0000000D93F-47ve;
	Wed, 13 Nov 2024 09:17:03 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-riscv@lists.infradead.org
Cc: palmer@dabbelt.com,
	ajones@ventanamicro.com,
	alex@ghiti.fr,
	Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH 3/3] riscv: insn: add RV_EXTRACT_FUNCT3()
Date: Wed, 13 Nov 2024 09:17:03 +0000
Message-Id: <20241113091703.3133017-4-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
In-Reply-To: <20241113091703.3133017-1-ben.dooks@codethink.co.uk>
References: <20241113091703.3133017-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_011707_761025_F6BEAA44 
X-CRM114-Status: UNSURE (   8.11  )
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

Add extraction for the func3 field of most instructions
for use with anyone who needs it.

Note, added this for decoding of CSR accesses for
work we did looking at the RDCYCLE v RDTIME calls.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 arch/riscv/include/asm/insn.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
index 09fde95a5e8f..c67f44ff2066 100644
--- a/arch/riscv/include/asm/insn.h
+++ b/arch/riscv/include/asm/insn.h
@@ -299,6 +299,10 @@ static __always_inline bool riscv_insn_is_c_jalr(u32 code)
 	({typeof(x) x_ = (x); \
 	(RV_X(x_, RVG_RD_OPOFF, RVG_RD_MASK)); })
 
+#define RV_EXTRACT_FUNCT3(x) \
+	({typeof(x) x_ = (x); \
+	(RV_X(x_, RV_INSN_FUNCT3_OPOFF, RV_INSN_FUNCT3_MASK)); })
+
 #define RV_EXTRACT_UTYPE_IMM(x) \
 	({typeof(x) x_ = (x); \
 	(RV_X(x_, RV_U_IMM_31_12_OPOFF, RV_U_IMM_31_12_MASK)); })
-- 
2.37.2.352.g3c44437643


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
