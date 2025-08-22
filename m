Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BFF0CA0EFF
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Aug 2025 09:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=njJvpjNdVmf+ua4ponwfN+B+PFTRasDmbL6eQ/qkdIY=; b=B5R+XOViRgcfmg
	d7RjrMazioMnd2JrsX0R/BA3hccGlYyg6BBhJcUdnqT0k/Ya/5dc63pgYUZRb0fbucGTaNjf+5xuP
	Hso6KYZ6BfQZzFzWrToCjErUc+g2VCUebP+ReTQhttpEQjXymXpIAZJ1nMN9wBTuChUIf/VtU8iyR
	yNHYLQO1H2qcPz9sPSLSot6Jf9BfbIzfxhi96AVrypyGXMaQeFENKxBDwwIchn11Ic8dGQAn/piHk
	P3TLzFwYNrlb2J5apUhqtcFLJEA9u8GzWkzqiWmf/Lw9m0CPhz32px4v2gAwM4cStdz3+mOxLI4Yg
	bHK0A6OXJ+b9i2QwU3JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upkfF-00000004UVC-3vuu;
	Sat, 23 Aug 2025 09:35:57 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upV0c-00000003CW1-2P2z
	for linux-riscv@lists.infradead.org;
	Fri, 22 Aug 2025 16:53:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1NhnqlGNIGl1ftjM5uNXTWqRJcGgMe7kqpqe+uTaihA=; b=N9ShRF1gSxkphBjsbPAHklSF2+
	MZL/EUa0nUd6ssbWteTipIcyXBsByQUzs3XYZZ2LNSmE/cQS3t0f4rm5Eri8hs/OKYhLL2Nibvt4R
	TeMcwOthHyQj1Wr/1d6Z7vLeCgd9MOdcZ7yIcaUJzBSKlM7u49gfn27ySETrORV/Xpa3uOh/zK96T
	IoKZXJD49xVzb30qCuAhcEmSBF4A/XNTRaQAefrOUWXm7SCdVlADI/v94Dk61+QvLsbaJhh0aNlMN
	HFOwk51/CpjVH0I5Ql1fGwTlRr+wHLZwm/FCqmG/+//Lx8zKZM7WHd+QDXHAnPeQ2L+joKUjh7IKB
	T2vmNm4Q==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1upV0U-001NGv-I9; Fri, 22 Aug 2025 17:52:50 +0100
Received: from ben by rainbowdash with local (Exim 4.98.2)
	(envelope-from <ben@rainbowdash>)
	id 1upV0U-00000001DPW-2gVc;
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
Subject: [PATCH 10/18] riscv: ftrace big endian updates
Date: Fri, 22 Aug 2025 17:52:40 +0100
Message-Id: <20250822165248.289802-11-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
In-Reply-To: <20250822165248.289802-1-ben.dooks@codethink.co.uk>
References: <20250822165248.289802-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_095258_621465_32F79E7E 
X-CRM114-Status: UNSURE (   9.79  )
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

Make the ftrace code work with big endian by ensuring the
instruction stream is accessed little endian.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 arch/riscv/include/asm/ftrace.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/ftrace.h b/arch/riscv/include/asm/ftrace.h
index 22ebea3c2b26..8d004639406b 100644
--- a/arch/riscv/include/asm/ftrace.h
+++ b/arch/riscv/include/asm/ftrace.h
@@ -99,8 +99,8 @@ struct dyn_arch_ftrace {
 do {									\
 	unsigned int offset =						\
 		(unsigned long) (callee) - (unsigned long) (caller);	\
-	call[0] = to_auipc_t0(offset);					\
-	call[1] = to_jalr_t0(offset);					\
+	call[0] = cpu_to_le32(to_auipc_t0(offset));			\
+	call[1] = cpu_to_le32(to_jalr_t0(offset));			\
 } while (0)
 
 /*
-- 
2.37.2.352.g3c44437643


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
