Return-Path: <SRS0=iddv=VA=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57365C5B57D
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2019 00:54:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30DD32089C
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2019 00:54:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pGRkB7G7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="VJzPVWED"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30DD32089C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NE8Y1RzxBvpZZkahMmW2AKwGZc/3j2BYXZC679v9V6s=; b=pGRkB7G7f+kyZf
	VX1FqllgJ30SjKVD8BKwmAQmx38t+nB9gVWkQ4wBLoQ9cWOcz+20Eegs+iBwxDJ4m3cXmrE9Z14GI
	Y43+9zqaQMDp6NRirnAN6/BoKHT8AeZfHD0ChHc39K2ou1NjCjaaH6XKwc/EaHRPOJ0mnCDZ/rRCu
	GFVw6HXKOTRwva38TcOVEegb/vdAEH4NvGjf+sztdm2mgB8DBtb5G7crvlwPipIOd3cILgIzEp8SP
	i8+JUyXQ1Jy+hEYdPzAxNHb+xxr/06JHM+9ZGJRNt7r9ec0FlZKINA3AdXzv2vTpOJuTpIhpKlZ4B
	t0yYiksmPFaZQ2iz5GSQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hiTXy-0001wQ-4u; Wed, 03 Jul 2019 00:54:54 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hiTXu-0001tJ-Im
 for linux-riscv@lists.infradead.org; Wed, 03 Jul 2019 00:54:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1562115291; x=1593651291;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eC3388U7gS1n3ruZjbzbm4lmFXg2heaDobqQD9WiAWA=;
 b=VJzPVWEDxn0rs2pd9NqlzJdfZ+1CZlj5hZTteRj0FvR8LDsdDa3G9dow
 pKLTL9pK2L+LX5rqCgB4xUJGWlzleyQb7Jsce5vF20jLao5mPoYNJvUlo
 NcV4GsJ3QU1+s/bk1pkZrMePADGLvqFMNHpOpvbUzrCDjZVHnI4pXDC5Y
 +s9sLt/OPfS5HRw7moOvx/psZ1PWxCrBfg8OKc5p43LA+dHLUGzq1nBYu
 SOwATCEAEP3xRWOSVAm5ovMVBHEHUXYRjTgedLNIwPQgab+UM16vxhPXi
 cAXxe07lFkF3sM3donHjJyc2e3HZDUpOQLW9cvvjogbS2RpxJrDPXmt9Z Q==;
IronPort-SDR: Qt8AD4SbO8vZQaBJXgsqe/qetwUYfl8hjvt+Te6sB5B2HPyxqFTLmBCX2pwtTvG4pwWYinN2ob
 1dpFKTVoc/iBbfYFtnFLtfIYADYXNmy4SqT944EEVp/FzD+FkGECdK754stKPtLWa4tMnoSyRe
 yJNQppZXvqlJNz0GN2dr8hytQnd0NVe+V9KeWIsH6hg1olN6CrcmZTS2TWzrpidnrDXdQXOZ0H
 BMr43moET/CRKUcVkncghYJtq93zukULhTvlORZtOcHqZNsr/Wml/GRaG/2A8tsWMpTHiljOZg
 G4M=
X-IronPort-AV: E=Sophos;i="5.63,445,1557158400"; d="scan'208";a="116940451"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 03 Jul 2019 08:54:41 +0800
IronPort-SDR: Nslcd0P1/s0h53PbLHAID5jBM5KKcWFUivcZp3FzwJyqk6u4lSdEiPraORW7ytP2u6WEvk/qSw
 96+EsaDk4qBypS7xLPScsLOarW9SFkXDZYB78eSUfde0E4UoJejAgemD8jNkM9W70L0F7dRTkL
 B/EGuem9atYd0abKQpmgLHgY5f/B6HCblg5SAHidRApLHeHwK/nybgJs7btsqq8IM/yfAwIR+P
 eaRuz2njNTr1eVCDwCtIVoLjYHaoXzfdU3tPp68JHHT+Sy0hugCGBMz1tKLHQtzXNtdBYdvppj
 sqI3rGFBr+cRsf71GNC6pcmp
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP; 02 Jul 2019 17:53:41 -0700
IronPort-SDR: Dz0M+IAo+4wEj1xOA9OuK1TY7/bzSPMnj56ySQqqLHxHvhJqyk+qM7mAVnJVSzpTgtWXeJGXeT
 VR7FIVmdIBGVqnmB3xCVDmmWT+OjqX3n1v3Hd9XToK4l5EmqTrcu7eRpU7PQkGXRpqGEg0eCBV
 NwsGHI9DjzM+VRiXDScIaGRIIPUIqG5/OYkSby1iHa9my/PtofrTcTDnMAHzWfBXA2HLzqtPWT
 ReqvW0u8MFrhAYRboKlwLjqEB0pcnS80OdRU0TCPHKmKJktCldw8RVSryG1VikQdZBmsEH7sLg
 vxg=
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.157.140])
 by uls-op-cesaip01.wdc.com with ESMTP; 02 Jul 2019 17:54:41 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: linux-riscv@lists.infradead.org,
	arnd@arndb.de
Subject: [PATCH RESEND 1/2] uapi/asm-generic: Allow defining a custom
 __SIGINFO struct
Date: Tue,  2 Jul 2019 17:52:01 -0700
Message-Id: <20190703005202.7578-2-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190703005202.7578-1-alistair.francis@wdc.com>
References: <20190703005202.7578-1-alistair.francis@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190702_175450_738686_0204B7DF 
X-CRM114-Status: UNSURE (   8.75  )
X-CRM114-Notice: Please train this message.
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
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Allow defining a custom __SIGINFO struct. This allows architectures to
apply their own padding and allignment requirements to the struct. This
is similar to the __ARCH_SI_ATTRIBUTES #define that already exists, but
applies to the __SIGINFO struct instead of the siginfo_t struct.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/uapi/asm-generic/siginfo.h | 32 ++++++++++++++++--------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/include/uapi/asm-generic/siginfo.h b/include/uapi/asm-generic/siginfo.h
index cb3d6c267181..09b0a1abac14 100644
--- a/include/uapi/asm-generic/siginfo.h
+++ b/include/uapi/asm-generic/siginfo.h
@@ -108,23 +108,25 @@ union __sifields {
 	} _sigsys;
 };
 
-#ifndef __ARCH_HAS_SWAPPED_SIGINFO
-#define __SIGINFO 			\
-struct {				\
-	int si_signo;			\
-	int si_errno;			\
-	int si_code;			\
-	union __sifields _sifields;	\
+#ifndef __SIGINFO
+# ifndef __ARCH_HAS_SWAPPED_SIGINFO
+# define __SIGINFO 						\
+struct {							\
+	int si_signo;						\
+	int si_errno;						\
+	int si_code;						\
+	union __sifields _sifields __ARCH_SI_ATTRIBUTES;	\
 }
-#else
-#define __SIGINFO 			\
-struct {				\
-	int si_signo;			\
-	int si_code;			\
-	int si_errno;			\
-	union __sifields _sifields;	\
+# else
+# define __SIGINFO 						\
+struct {							\
+	int si_signo;						\
+	int si_code;						\
+	int si_errno;						\
+	union __sifields _sifields __ARCH_SI_ATTRIBUTES;	\
 }
-#endif /* __ARCH_HAS_SWAPPED_SIGINFO */
+# endif /* __ARCH_HAS_SWAPPED_SIGINFO */
+#endif /* __SIGINFO */
 
 typedef struct siginfo {
 	union {
-- 
2.22.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
