Return-Path: <SRS0=FXTp=BN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCDF1C433E0
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Aug 2020 17:59:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F8E222B45
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Aug 2020 17:59:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pjqZ1O7F";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="fZWmXbUt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F8E222B45
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=A3SWTf1o9FuvBSJw9jJrj/LvDspxrgB7wQm+IN6oUuM=; b=pjqZ1O7FXysHWW/679wQLnRwm
	1Uee+dsOcRY37pvp4+eK9dq9q01dJrsRrFkESlJx0TRwoYBODr01TEOhSEmSP37hzhRQ+Je7Rc07q
	6xkE35Ts/YfscF9dlgmmlrsbuY1gbV8hh4+VuNhysnitHGqjHttgN+whETbreR1k6v/HN4lOlXznk
	ONwX5ZoYZ76YYoOZQ+BBlJiho/lK3l6DCpWRYK7b4GvX6UarkRRYeJCI/5xz1Avnhff1bwTpw0KYC
	1AVxii0D85+v6e/CJtr97tGkVY3GECfE4JPSWJ1y6Nyljms9a4K7wdYSPLniySMyY7B2v7EvFFrD/
	d7i3EoYow==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2ejt-00053j-Vc; Mon, 03 Aug 2020 17:59:10 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2ejq-00051j-Hq; Mon, 03 Aug 2020 17:59:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1596477547; x=1628013547;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/WuBKKqQJ2DS9gLpxSbna82b/Rj8bNfTeDN1/MeY4to=;
 b=fZWmXbUtmsvgIDjdzmGLpBLDh69Brvx42Sl2x5rNIvO6WckVMDj40+jh
 sksrjc4r08ZGCoPUs1ohjpP5dulvRUy5OyDvn5YBoWHMTE/stMlzkoFG0
 lmqOZvQ8BPZ9EnW9TOc5UHJR2LvBadrk2ENBmLnrD4mEs8r5JnixmL9QS
 247viK/wzj+f9fwstaezOTrEnnXXsiP4XHrDnU/ThnFsrSeXE/X+Ke6O4
 9SC2IJJpWPkmFWv8qZDZvZ0PiQoBNIgPvAbk9oulRUzUzo46+EAH9ZEx6
 onrBEGAobCFpeKYYY7Rw0zoPf0wtuau9fsiNnAMUfcbVX6t5tnSfDXVkN Q==;
IronPort-SDR: bzxyYca/GJz1iDG4IHsNWmOuCAtl2pdo38r/Z8MrNiAl/kJlQGgvpQ0pA76cJK6T/prayBTPNr
 EStra1EcsixPK2vCdj5BuDyiFrTORP2bDEQo1ZQ+Jo+yQk3ya5MDIGXmOw9O0IpWwFKej6pqEZ
 wknktGQOFaefviciFsv/hSdqnYHi6gWWvoGG5NeglfSpXxKt1UbOH1RrZ936shcZmxxisgp/0c
 /5Ekl7cHcJWKYF0WUgj26AX1RaIkoDmQ3AzgbT0FLj2v34OkU66IwnkNN51E3ij8qwls381fm5
 t24=
X-IronPort-AV: E=Sophos;i="5.75,430,1589212800"; d="scan'208";a="145273246"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 04 Aug 2020 01:59:05 +0800
IronPort-SDR: ieidBQqb4Mo5nFovzvEsNGUxRMy3AoLqMd4RLNYOTskWcGGsuFmhaQZOZB5+2on0zD8JFUSYzE
 49fphOpAGbtw==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2020 10:46:26 -0700
IronPort-SDR: b+L5ix2uhA5t3rcfUs2Aw7nrz9gwA9OaAzaqQxbJ4RQos5fVRvplQWg6A9RrXVtMjAiNbZUBpf
 aiMRiMpi9kvA==
WDCIronportException: Internal
Received: from cnf007830.ad.shared (HELO jedi-01.hgst.com) ([10.86.58.196])
 by uls-op-cesaip01.wdc.com with ESMTP; 03 Aug 2020 10:59:03 -0700
From: Atish Patra <atish.patra@wdc.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 1/6] RISC-V: Add a non-void return for sbi v02 functions
Date: Mon,  3 Aug 2020 10:58:41 -0700
Message-Id: <20200803175846.26272-2-atish.patra@wdc.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200803175846.26272-1-atish.patra@wdc.com>
References: <20200803175846.26272-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_135906_720295_0269D6CE 
X-CRM114-Status: GOOD (  16.13  )
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
 kvm@vger.kernel.org, Anup Patel <anup.patel@wdc.com>,
 linux-kernel@vger.kernel.org, Atish Patra <atish.patra@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Alexander Graf <graf@amazon.com>,
 Thomas Gleixner <tglx@linutronix.de>
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
 arch/riscv/include/asm/sbi.h |  8 ++++----
 arch/riscv/kernel/sbi.c      | 32 ++++++++++++++++----------------
 2 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 653edb25d495..2355515785eb 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -100,13 +100,13 @@ int sbi_console_getchar(void);
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
diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index f383ef5672b2..53c44c831eb8 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -351,7 +351,7 @@ static int __sbi_rfence_v02(int fid, const unsigned long *hart_mask,
  * sbi_set_timer() - Program the timer for next timer event.
  * @stime_value: The value after which next timer event should fire.
  *
- * Return: None
+ * Return: None.
  */
 void sbi_set_timer(uint64_t stime_value)
 {
@@ -362,11 +362,11 @@ void sbi_set_timer(uint64_t stime_value)
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
 
@@ -374,12 +374,12 @@ EXPORT_SYMBOL(sbi_send_ipi);
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
 
@@ -390,14 +390,14 @@ EXPORT_SYMBOL(sbi_remote_fence_i);
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
 
@@ -410,15 +410,15 @@ EXPORT_SYMBOL(sbi_remote_sfence_vma);
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
2.24.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
