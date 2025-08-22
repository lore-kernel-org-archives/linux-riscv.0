Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6E2CCA0EFA
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Aug 2025 06:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fOE07S34+qkwr2+T/7xsYadl8zzkehcBqql70wodm0k=; b=nTQq6w5JFIKAnL
	0sSwwQ5YtQ2vQTbGdGFc54fves9CSWPcfSADaZokc3Da6lQl5Y+chJAR+NHCxVPnCa1ksdrkYDq4X
	KGMkMmkhGpsxsvgY24Q1J1QPOkAmdLhTtrDHetjGOoe4J3ZZ72TWLmYiWdGg0G9bSwIrJyN6T7H7p
	Q7qGuAWQAlYQIjIFMNtLx5WLSB3UGBlgp191Ex4rcHH9Dk2gNRKlEJNSooKak+6eksEMP6K26U4au
	2nFwzy5ONsJYnE5PYZ5WFVeV0c/uOzyfy3Sqr6Ww5usyZ5UUe0+sAO3w3U0erg+x0XTzTDIAX3uuc
	VRFP4ZasjRB69fCMF6qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphvd-00000004C9p-0rpO;
	Sat, 23 Aug 2025 06:40:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upV0i-00000003CaY-3F7J
	for linux-riscv@bombadil.infradead.org;
	Fri, 22 Aug 2025 16:53:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=ZNc6HAkilVj95AD5v4iVrYFpTlJyFL+BVNzBz5/w8Q0=; b=gLVyXwxglOhit82jyKgA62dWWh
	NmpOkreMyuRzbfNhY5F7+1/GprxLMt5aJxirXxfJh+j2yH0ZrB7LeVi5bqO0/lQfRAgOYVy1ZrRqX
	zdIAKXDGhQeYKTLKoWgabWJSeVSrHoSDXsUPUaP32pb+fDAOTrsP3O7O4CpucMcvcPclzV81/aO0+
	DpGpZisuDjnvt/1HRVjQj2ypSvpHTdNMsYnW4xQ+fiRhx89cmUQ++ctlstLyCPTZkrbJLQcC1AMBj
	cyK5EaTOJJrfNu/ZgCKsjJk9N+FgU8oyQmYuK335NBL/wY2kg847yqviljVrVVTj1OT5HW5pktNXl
	jdS+SzPQ==;
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upV0d-000000011s1-1PHB
	for linux-riscv@lists.infradead.org;
	Fri, 22 Aug 2025 16:53:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ZNc6HAkilVj95AD5v4iVrYFpTlJyFL+BVNzBz5/w8Q0=; b=44R7wmt4qk/+fP4DtINLZHB3ls
	9myEAKLs+0axsfFBxB+e0rBTJOYD9r34s1X4Oy3vKdtatiI/oP9jtdJwvUvyP5eo+0CJk8KR18xWP
	ZtPTIpgk6fhPZPn2BidvcoJBaEgac6fkEfkIGEXzAaRlfn91Sts7RzNZFmVfKOl+hIz0WmRKZN000
	VSfRkF10LiQ12gi0KRtAWCzhZj+i+/mpt8gF+2RvKgi0aSa78YVzhYPnj9tVj8xzFbYnOmxoDd59u
	uNjkiWImKsNT38evjM8vSdVQaa/iiwVk9qYwNGdpKy3l6GspM7kTgqWlE70t8k3VxlYORQON4Z0A6
	wsYzYT6w==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1upV0U-001NGs-C6; Fri, 22 Aug 2025 17:52:50 +0100
Received: from ben by rainbowdash with local (Exim 4.98.2)
	(envelope-from <ben@rainbowdash>)
	id 1upV0U-00000001DPC-2BOl;
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
Subject: [PATCH 05/18] riscv: asm: use .insn for making custom instructioons
Date: Fri, 22 Aug 2025 17:52:35 +0100
Message-Id: <20250822165248.289802-6-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
In-Reply-To: <20250822165248.289802-1-ben.dooks@codethink.co.uk>
References: <20250822165248.289802-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_175259_542354_5FC28210 
X-CRM114-Status: UNSURE (   7.22  )
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

Using .word breaks with big endian builds, making something which
is not a valid or worse an instruction or pair that does something
which is not intended.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 arch/riscv/include/asm/insn-def.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/include/asm/insn-def.h b/arch/riscv/include/asm/insn-def.h
index d5adbaec1d01..2a3019bc1a3b 100644
--- a/arch/riscv/include/asm/insn-def.h
+++ b/arch/riscv/include/asm/insn-def.h
@@ -256,10 +256,17 @@
 	INSN_S(OPCODE_OP_IMM, FUNC3(6), __RS2(3),		\
 	       SIMM12((offset) & 0xfe0), RS1(base))
 
+#ifndef CONFIG_AS_HAS_INSN
 #define RISCV_PAUSE	".4byte 0x100000f"
 #define ZAWRS_WRS_NTO	".4byte 0x00d00073"
 #define ZAWRS_WRS_STO	".4byte 0x01d00073"
 #define RISCV_NOP4	".4byte 0x00000013"
+#else
+#define RISCV_PAUSE	".insn 0x100000f"
+#define ZAWRS_WRS_NTO	".insn 0x00d00073"
+#define ZAWRS_WRS_STO	".insn 0x01d00073"
+#define RISCV_NOP4	".insn 0x00000013"
+#endif
 
 #define RISCV_INSN_NOP4	_AC(0x00000013, U)
 
-- 
2.37.2.352.g3c44437643


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
