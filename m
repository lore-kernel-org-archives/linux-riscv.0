Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D57BC4451C
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2026 07:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xyTrNCB87YwZY7K1eAnyA83e/NqydLOmKv3s9FK+R0Y=; b=pDcQZFl7ueqq7E
	EHXs2oh18AMEYUITn3QDXJW0Juwmp7X2g5DXLB26yoERSC5cKkuvQPkNymXY3Cdyg2uyhEORh62gD
	K2GCzh0+zf54OuY7aY2ZoABSNAoDs8dn+robdDVFlFDlF+GpHqnHOiqQhAY2XVBRqbnZs5f8j4dS6
	PDuH8szAIqS0zO1sZurIXeZMdWBDIi6bIieu8juQ8u+8PvEqRhk0lhvh0ou2mmJ6G/Uwaz2EJilFn
	NAITVopDlOEi9kZcw6QCKmprvwt47g74gHKoK4ClLTJdHbjf70hv3HAH875FcPM5K3Bp1kdf+5oTk
	3407Xjeo4T6ilwPBTdhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5N1-00000008jGX-0tYU;
	Tue, 21 Jul 2026 07:58:31 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5My-00000008jEO-1SwT
	for linux-riscv@lists.infradead.org;
	Tue, 21 Jul 2026 07:58:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-Id:In-Reply-To:References; bh=WLL13H6pAzg6R/XvQjZDAUGzQH
	4dmGtx+tqHLvncJbY=; b=lR1KqYDT2hE+wkhLscra8FBodIhZINNId3d62fXXas
	dkM1xWmRRGjXbyIyqeHJKBoeRkdYDMsNA23vOauZ69ahOntCZ8GN1Ftq8dfk5mSC
	HCbHUmC9BbCkg4z8KdHtrZL9/3tiD4em92LtrYupP3MTmoKTjUrRVKLVo1OcCRoh
	U=
Received: from localhost.localdomain (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwAnEkOyJl9q4GgUAA--.17568S3;
	Tue, 21 Jul 2026 15:58:50 +0800 (CST)
From: Xie Bo <xb@ultrarisc.com>
To: linux-riscv@lists.infradead.org
Cc: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux-kernel@vger.kernel.org,
	Xie Bo <xb@ultrarisc.com>
Subject: [RFC PATCH 1/3] riscv: sbi: Add FWFT get helper
Date: Tue, 21 Jul 2026 15:58:10 +0800
Message-Id: <20260721075812.82708-2-xb@ultrarisc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260721075812.82708-1-xb@ultrarisc.com>
References: <20260721075812.82708-1-xb@ultrarisc.com>
X-CM-TRANSID: AQAAfwAnEkOyJl9q4GgUAA--.17568S3
X-Coremail-Antispam: 1UD129KBjvJXoW7KFyfCFyfJryxWw4rZryUAwb_yoW8ZF47pF
	s5CF98CFWYgF1Ik3WSy34Du3yrJw4kKa13K3y2ya4aya13tF4rAwnYv3Z0qr1kAa4jqFWr
	CayYgrWq9a1UXa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPI14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
	ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
	vE14v26r106r15McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
	r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r126r1DMx
	kIecxEwVCm-wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw
	1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUS
	jgsUUUUU=
X-CM-SenderInfo: l0e63zxwud2x1vfou0bp/1tbiAQAOB2pdm1EAHAALsi
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_005828_885312_5B624AD5 
X-CRM114-Status: GOOD (  10.85  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The SBI FWFT extension supports querying a feature's value on the local
hart, but the RISC-V SBI wrapper currently only exposes SET operations.

Add a generic GET helper which maps SBI errors to Linux errno values and
only updates the caller's output on success.

Signed-off-by: Xie Bo <xb@ultrarisc.com>
---
 arch/riscv/include/asm/sbi.h |  1 +
 arch/riscv/kernel/sbi.c      | 29 +++++++++++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 5725e0c..b1773b1 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -607,6 +607,7 @@ int sbi_remote_hfence_vvma_asid(const struct cpumask *cpu_mask,
 				unsigned long asid);
 long sbi_probe_extension(int ext);
 
+int sbi_fwft_get(u32 feature, unsigned long *value);
 int sbi_fwft_set(u32 feature, unsigned long value, unsigned long flags);
 int sbi_fwft_set_cpumask(const cpumask_t *mask, u32 feature,
 			 unsigned long value, unsigned long flags);
diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index c443337..51e0c58 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -318,6 +318,35 @@ static void cpu_sbi_fwft_set(void *arg)
 		atomic_set(&req->error, ret);
 }
 
+/**
+ * sbi_fwft_get() - Get a feature value on the local hart
+ * @feature: The feature ID to get
+ * @value: Where to store the feature value
+ *
+ * Return: 0 on success, appropriate Linux error code otherwise.
+ */
+int sbi_fwft_get(u32 feature, unsigned long *value)
+{
+	struct sbiret ret;
+	int error;
+
+	if (!sbi_fwft_supported)
+		return -EOPNOTSUPP;
+
+	if (!value)
+		return -EINVAL;
+
+	ret = sbi_ecall(SBI_EXT_FWFT, SBI_EXT_FWFT_GET,
+			feature, 0, 0, 0, 0, 0);
+	error = sbi_err_map_linux_errno(ret.error);
+	if (error)
+		return error;
+
+	*value = ret.value;
+
+	return 0;
+}
+
 /**
  * sbi_fwft_set() - Set a feature on the local hart
  * @feature: The feature ID to be set
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
