Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB3BCA0EFA
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Aug 2025 06:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/3gzhdrKVJgYIJ0MUyPcHOhATiAqRow+FxHATQAL2Mo=; b=ymc5NoRrAcPEvH
	2xnzF7eAxFuiXnv6bRYBltZsOfaUkDT0IKfr+9EH+OzkBqviTXcYY+PbmLrCLTMB3GEiqM8zncQtk
	KUrMJjByJxFHNTNNOHMuhXrc8C15B0EwRdnPRGpPTQDbHTlajnTfV5J7taTiVgU4jdRFQi73j4nOY
	x2jQ7gb2HtXC7dAG8qOqPHsbM0T+Ui//2Oa/JJ1EML60RX97w1RjTE9jLRWuthOIITw/eQlUh+Z/q
	6KCulkzd+OfoFiRD4Zfh+1o00He3DKwWydogY/od1TeNEzB67e09ofigjgngignS2PDTBf8epjeCs
	bqOEkbzsm+J2POJByOQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphvL-00000004Bpd-0AmY;
	Sat, 23 Aug 2025 06:40:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upV0f-00000003CYn-3hYN
	for linux-riscv@bombadil.infradead.org;
	Fri, 22 Aug 2025 16:53:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=uJesEVQkRvw2nGYERGit7awwg76AlyOFrkxgXBcemoM=; b=rWWHBo+rHoc+2hYf7/d3w1T6Ky
	SjDrKVpkw577uCirAmJgyEdvOwcSwBdSmwemiGcJG3FpJ2OANaihRs2DlQBhsrmCNAWgEVrWs+U40
	XwIkbwS0J78TrFFl9aSNSAy98utYh2rqji0NkH+YyYGSgzXgktp1apDV4DBsVtaqmkmVQqeZZezl3
	+o/J8s8aQ8RQfOmrwNd/2pUXiasKAGiDp2NEoR5KLamECxhdacKazc27qq59OY4pLA3t/yvr5um5/
	xkLPc5RGmn9gDz9shlPs9+OjwtX86Y/xmNwwI+/npKFzZOJBiBhxEvwFxY/2MY9eqZTn/9k7yYCIG
	E2ZanRVQ==;
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upV0c-000000011s0-3R2u
	for linux-riscv@lists.infradead.org;
	Fri, 22 Aug 2025 16:53:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=uJesEVQkRvw2nGYERGit7awwg76AlyOFrkxgXBcemoM=; b=AahzoRZgXv0UGB/CooaO7j5PVq
	wIhKcxIyPe4ffjRepTBgCX2eEKZxZaOkUYiEXU9LRmnRB/OMUFLskFLDi0TXVUgoAPHGRqT2bDMyy
	C2REfVY7BUzDCch8CbUCoZ8CicoerF4nhxo4nmB9GFH43N+d4CBhBz6dqn0oZjgV2DLdO8BFA7cGb
	EJriiyGH8A/Lb1OpsDYmo1MBXwde0f0J963SqrpUqyWx+C0slqbPbcNO1XZJUIZA1/NnbRTrR9Afm
	cujGFfi8AjpoK26qCREc9HGy5UXs3W5IQq+bnzit4mQnUgAM0So7M6cR7k/Ya7ncyODVrO4PZNYn6
	d7TR4oaw==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1upV0U-001NGz-IC; Fri, 22 Aug 2025 17:52:50 +0100
Received: from ben by rainbowdash with local (Exim 4.98.2)
	(envelope-from <ben@rainbowdash>)
	id 1upV0U-00000001DPf-2swZ;
	Fri, 22 Aug 2025 17:52:50 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: -linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>,
	Javier Jardon <javier.jardon@codethink.co.uk>,
	Ben Dooks <bjdooks@gmail.com>,
	Lawrence Hunter <lawrence.hunter@codethink.co.uk>,
	Roan Richmod <roan.richmond@codethink.co.uk>,
	Sam Grove <sgrove@mips.com>,
	Chao-ying Fu <cfu@mips.com>,
	Mukunda Aprameya <maprameya@mips.com>,
	Umesh Kalappa <ukalappa@mips.com>,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>,
	Kurt Martin <kmartin@mips.com>,
	allikarjuna Gouda <mgouda@mips.com>,
	Vaibhav Chauthmal <vchauthmal@mips.com>,
	wapnil Agrawal <sagrawal@mips.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH 12/18] riscv: threads need UBE flag setting if big-endian
Date: Fri, 22 Aug 2025 17:52:42 +0100
Message-Id: <20250822165248.289802-13-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
In-Reply-To: <20250822165248.289802-1-ben.dooks@codethink.co.uk>
References: <20250822165248.289802-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_175259_178931_140E2FFF 
X-CRM114-Status: UNSURE (   9.44  )
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

If operating in big-endian, start all threads with UBE to keep
them the same endian as the system.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 arch/riscv/include/asm/csr.h | 1 +
 arch/riscv/kernel/process.c  | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 6fed42e37705..78f795936c7e 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -13,6 +13,7 @@
 #define SR_SIE		_AC(0x00000002, UL) /* Supervisor Interrupt Enable */
 #define SR_MIE		_AC(0x00000008, UL) /* Machine Interrupt Enable */
 #define SR_SPIE		_AC(0x00000020, UL) /* Previous Supervisor IE */
+#define SR_UBE		_AC(0x00000040, UL) /* User mode is big-endian */
 #define SR_MPIE		_AC(0x00000080, UL) /* Previous Machine IE */
 #define SR_SPP		_AC(0x00000100, UL) /* Previously Supervisor */
 #define SR_MPP		_AC(0x00001800, UL) /* Previously Machine */
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index a0a40889d79a..c4e335b5e5f3 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -144,6 +144,8 @@ void start_thread(struct pt_regs *regs, unsigned long pc,
 	unsigned long sp)
 {
 	regs->status = SR_PIE;
+	if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN))
+		regs->status |= SR_UBE;
 	if (has_fpu()) {
 		regs->status |= SR_FS_INITIAL;
 		/*
-- 
2.37.2.352.g3c44437643


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
