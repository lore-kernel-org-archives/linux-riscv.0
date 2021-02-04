Return-Path: <SRS0=a4kH=HG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBBCFC433DB
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Feb 2021 05:27:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90A9C64DF0
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Feb 2021 05:27:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90A9C64DF0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+V5GP7iKT64Rb1iSB6iukmpOmPeon8aWg+nRWQPYEiM=; b=s3D9Hc1nbVObgFtymPIaqVrK1Y
	uceFTHgmHjZfmqivT6ZsD9ZyCq3a7xImHTkZ5fp001BIYf3bVSNgIcsGe34qb7EpiWimmCb5fgRv/
	YVBYcRAokOUPSWi04BBYReIcLqo4da+KaoPtwU1pD3K/T+9KVQmKN+lNwVxch80sMCUcb3uaUBJXS
	2hphC2fzsgbIFVvbPIpDdPjgFbHtBfDQZJStUtsSfDr7sB+CT/WRCLUogIl7yCVhi1KfueTxh4jXr
	hmBs8ey30uTNwDAX1UHXCgJdakpktZuKlb7q3uAKIbhWsAyJS3WVAOfNbAGETeL/gtzwzEnxecvN5
	jcpLIFsQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7XAg-0005mA-6J; Thu, 04 Feb 2021 05:27:14 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7XAd-0005lO-Fw
 for linux-riscv@lists.infradead.org; Thu, 04 Feb 2021 05:27:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612416431; x=1643952431;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Yq2a5kpgE+6TdPCNXjfWQtCixV8BN1i4FQgs4xdcets=;
 b=kbUWz3GEJ20Q79vuB5TfnGYik4i8YWauzix/So0hbaUdkF1qkQB1cD6Y
 gk2UJ2LsT4mLdDgB8khvT7pRRXY3qiXvq5OSJQtwL+hF3l4ntny0I0dOO
 PIhFupnNxVThoCbaCL024ZUUM7gwGj5S3Vv0z28yX6Hz8zTDvOCKvvOKz
 C0qT8e/YTAxSQP80RRBPEK547bXAFGbsLa123C2Pw5sXW10V0ly7cL6SA
 YZxVfG7gZII3bPTDl5xtUaamJhkcLYdOPomd8PHluOhZRJhEka2Tl/lpo
 LjfP5rygCA1UnBc/rRtSrOr8Ug/XBGXT5fnbAnSOMGkveZnKPl54ph9/K Q==;
IronPort-SDR: iFH5rL1vt1NZWDHIcxlOe+073ulG0JQaIheliyd33YXPLtQFfKsLkoX+BBkWfeEO6sZ1IyL7IG
 yeOwtQUK41LZqj0zkawc0EEzA5mr1tNLM++ttNmTp1gjhZe6gIpkMmMob4Jfbdf3O7ppD3mHE3
 lZZY3Ag+UkEJUV1zFrmfT3LTb0u4+MCvzXupLhqt1/Q2ILaF5gjTVjV8QEcMhBCGBOhtSvePtC
 pe6TQHrZYiAZ/lLWZN97rteRSOMuqZchVp1DLeSMrye2Kg3gmq8dkfaS7yYBCb+Bf590OU8muq
 pCA=
X-IronPort-AV: E=Sophos;i="5.79,400,1602518400"; d="scan'208";a="159086085"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 04 Feb 2021 13:27:09 +0800
IronPort-SDR: IjczpwM7AXq6A8Y09tfSKGGFfeDctS/KEFnwcd+JR966vErqXrMU9dPDThJuLk8f6P3fcnrjpi
 d6BNxUeryiOSlVm6wemmuMqCLv4aDLMVWP7g8wMwzMxc/vDiRkUZSuVDiRPfoUCQ8yMmtPjmyh
 uo4nQEl7enIXaWD1YrOzsbSh/q+bJfbrtp9+EWHEwpBbVG539Ma18oLCtsi32iI5tls3lqmQ/+
 RrZdG7UL/eRwByp9V8i2n6ow277yjv+9nIlZKombYEy/L06KaXweXVOOFuDyS4KoVTWLZDzeFl
 NNr/jwF2H0eODFQQRadx0UhW
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2021 21:11:08 -0800
IronPort-SDR: Fsg2IHeItNjsgVSOmyJudO88BgXJORjFuZkaZo7fFQ8BgukMWrt+ARsJz+dz49xKcTt2uURMLV
 40bukx3NGRViuKwLqRy4hp6RoaXtvrl2uqvuKu8jU1/1PL2xtZBE/TJtHui7QDCiMJrnXGf80A
 r6SP3x7aDYB/7+W7Sy34BWKkUqhlWtS+zPo52ve7M4CWOZvGbv3R/NxiCjWktd1h+9jxwOBmwP
 X4qjRm2eMydCIkEN2STyZFWX3DP9cd8JIhua4NpbelKNX6Ur7U69U4Rwp/4ES2kdz/n3R1ObHC
 ZeM=
WDCIronportException: Internal
Received: from cnf008142.ad.shared (HELO jedi-01.hgst.com) ([10.86.63.165])
 by uls-op-cesaip02.wdc.com with ESMTP; 03 Feb 2021 21:27:09 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] RISC-V: Add a non-void return for sbi v02 functions
Date: Wed,  3 Feb 2021 21:26:43 -0800
Message-Id: <20210204052643.1608586-1-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_002711_742633_C84D5BFF 
X-CRM114-Status: GOOD (  15.23  )
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SBI v0.2 functions can return an error code from SBI implementation.
We are already processing the SBI error code and coverts it to the Linux
error code.

Propagate to the error code to the caller as well. As of now, kvm is the
only user of these error codes.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/include/asm/sbi.h | 10 +++++-----
 arch/riscv/kernel/sbi.c      | 32 ++++++++++++++++----------------
 2 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 1b26ec8e6a15..3e7141a7d11f 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -116,13 +116,13 @@ int sbi_console_getchar(void);
 void sbi_set_timer(uint64_t stime_value);
 void sbi_shutdown(void);
 void sbi_clear_ipi(void);
-void sbi_send_ipi(const unsigned long *hart_mask);
-void sbi_remote_fence_i(const unsigned long *hart_mask);
-void sbi_remote_sfence_vma(const unsigned long *hart_mask,
+int sbi_send_ipi(const unsigned long *hart_mask);
+int sbi_remote_fence_i(const unsigned long *hart_mask);
+int sbi_remote_sfence_vma(const unsigned long *hart_mask,
 			   unsigned long start,
 			   unsigned long size);
 
-void sbi_remote_sfence_vma_asid(const unsigned long *hart_mask,
+int sbi_remote_sfence_vma_asid(const unsigned long *hart_mask,
 				unsigned long start,
 				unsigned long size,
 				unsigned long asid);
@@ -163,7 +163,7 @@ static inline unsigned long sbi_minor_version(void)
 
 int sbi_err_map_linux_errno(int err);
 #else /* CONFIG_RISCV_SBI */
-static inline void sbi_remote_fence_i(const unsigned long *hart_mask) {}
+static inline int sbi_remote_fence_i(const unsigned long *hart_mask) {}
 static inline void sbi_init(void) {}
 #endif /* CONFIG_RISCV_SBI */
 #endif /* _ASM_RISCV_SBI_H */
diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index 8d60b2ebcad3..f904af48635d 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -352,7 +352,7 @@ static int __sbi_rfence_v02(int fid, const unsigned long *hart_mask,
  * sbi_set_timer() - Program the timer for next timer event.
  * @stime_value: The value after which next timer event should fire.
  *
- * Return: None
+ * Return: None.
  */
 void sbi_set_timer(uint64_t stime_value)
 {
@@ -363,11 +363,11 @@ void sbi_set_timer(uint64_t stime_value)
  * sbi_send_ipi() - Send an IPI to any hart.
  * @hart_mask: A cpu mask containing all the target harts.
  *
- * Return: None
+ * Return: 0 on success, appropriate linux error code otherwise.
  */
-void sbi_send_ipi(const unsigned long *hart_mask)
+int sbi_send_ipi(const unsigned long *hart_mask)
 {
-	__sbi_send_ipi(hart_mask);
+	return __sbi_send_ipi(hart_mask);
 }
 EXPORT_SYMBOL(sbi_send_ipi);
 
@@ -375,12 +375,12 @@ EXPORT_SYMBOL(sbi_send_ipi);
  * sbi_remote_fence_i() - Execute FENCE.I instruction on given remote harts.
  * @hart_mask: A cpu mask containing all the target harts.
  *
- * Return: None
+ * Return: 0 on success, appropriate linux error code otherwise.
  */
-void sbi_remote_fence_i(const unsigned long *hart_mask)
+int sbi_remote_fence_i(const unsigned long *hart_mask)
 {
-	__sbi_rfence(SBI_EXT_RFENCE_REMOTE_FENCE_I,
-		     hart_mask, 0, 0, 0, 0);
+	return __sbi_rfence(SBI_EXT_RFENCE_REMOTE_FENCE_I,
+			    hart_mask, 0, 0, 0, 0);
 }
 EXPORT_SYMBOL(sbi_remote_fence_i);
 
@@ -391,14 +391,14 @@ EXPORT_SYMBOL(sbi_remote_fence_i);
  * @start: Start of the virtual address
  * @size: Total size of the virtual address range.
  *
- * Return: None
+ * Return: 0 on success, appropriate linux error code otherwise.
  */
-void sbi_remote_sfence_vma(const unsigned long *hart_mask,
+int sbi_remote_sfence_vma(const unsigned long *hart_mask,
 			   unsigned long start,
 			   unsigned long size)
 {
-	__sbi_rfence(SBI_EXT_RFENCE_REMOTE_SFENCE_VMA,
-		     hart_mask, start, size, 0, 0);
+	return __sbi_rfence(SBI_EXT_RFENCE_REMOTE_SFENCE_VMA,
+			    hart_mask, start, size, 0, 0);
 }
 EXPORT_SYMBOL(sbi_remote_sfence_vma);
 
@@ -411,15 +411,15 @@ EXPORT_SYMBOL(sbi_remote_sfence_vma);
  * @size: Total size of the virtual address range.
  * @asid: The value of address space identifier (ASID).
  *
- * Return: None
+ * Return: 0 on success, appropriate linux error code otherwise.
  */
-void sbi_remote_sfence_vma_asid(const unsigned long *hart_mask,
+int sbi_remote_sfence_vma_asid(const unsigned long *hart_mask,
 				unsigned long start,
 				unsigned long size,
 				unsigned long asid)
 {
-	__sbi_rfence(SBI_EXT_RFENCE_REMOTE_SFENCE_VMA_ASID,
-		     hart_mask, start, size, asid, 0);
+	return __sbi_rfence(SBI_EXT_RFENCE_REMOTE_SFENCE_VMA_ASID,
+			    hart_mask, start, size, asid, 0);
 }
 EXPORT_SYMBOL(sbi_remote_sfence_vma_asid);
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
