Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B4F9C27C4F
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jun 2024 02:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rz4GWa8z9lmHMYZR0cqLSyEzwvt32cfF+LAMSlaIZmc=; b=FS0C8uDPuPBYoG
	cJJEqg+nOB20zx/2qqKFR0QvxNGHWvMDlLuH8xolM+Tmf7ahXun15MJpJp8E9FsEvENEKobEfzi3y
	t+NhwqMXBHd/EO93R6TlpZJo5p5FHsdhMfZ7kEN7SqVkcUakggZJTeZfGuQRHbm7U3TBCORja7F8m
	ND92AWeYE35jUBGV/WfRNRXzu2/SaP7zSA4dOfRd88Z4eS2rl5iD8JpBRzoufuEckwatqIkLQVk82
	13yHNFym9obKnD/ZWvRRp3lOdovTPxx/XWZtwWZsaChnrnq7ta0dnPccfMBQFT1MPLo4yzqxJz2/Q
	XkWSTcR7dwj/2iEVQMyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJkdl-0000000H9sn-2bAq;
	Wed, 19 Jun 2024 02:01:37 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJkdj-0000000H9ra-1Ndj
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jun 2024 02:01:36 +0000
Received: from ThinkPad-T480s.. (unknown [121.237.44.152])
	by APP-05 (Coremail) with SMTP id zQCowACHjeX3O3JmKoWbEQ--.13480S2;
	Wed, 19 Jun 2024 10:01:27 +0800 (CST)
From: zhouquan@iscas.ac.cn
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: oleg@redhat.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	andy.chiu@sifive.com,
	shuah@kernel.org,
	charlie@rivosinc.com,
	zhouquan@iscas.ac.cn
Subject: [RFC PATCH 1/2] riscv: Expose orig_a0 in the user_regs_struct structure
Date: Wed, 19 Jun 2024 10:01:27 +0800
Message-Id: <d4c7da80b72375c75836303bc744e4db9eeec218.1718693532.git.zhouquan@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718693532.git.zhouquan@iscas.ac.cn>
References: <cover.1718693532.git.zhouquan@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: zQCowACHjeX3O3JmKoWbEQ--.13480S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZrW7WF4rXr4fJF4kKrWfXwb_yoW8Xw1DpF
	Zakwn7KFWrurWvkry7ZF4DWr4UJwn8K343KrWIy34Yv3WUtF45ZrZ3Gw1qyr1fJayvqFyx
	uFySkr98A3WDZ3JanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9C14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
	4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
	Yx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbV
	WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7Cj
	xVA2Y2ka0xkIwI1lw4CEc2x0rVAKj4xxMxkIecxEwVAFwVW8JwCF04k20xvY0x0EwIxGrw
	CFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE
	14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2
	IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxK
	x2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI
	0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JU6MKtUUUUU=
X-Originating-IP: [121.237.44.152]
X-CM-SenderInfo: 52kr31xxdqqxpvfd2hldfou0/1tbiBwwNBmZyBf6gSQAAsG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_190135_796564_FF4B55CA 
X-CRM114-Status: GOOD (  10.65  )
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

From: Quan Zhou <zhouquan@iscas.ac.cn>

Expose orig_a0 to userspace to ensure that users can modify
the actual value of `a0` in the traced process through the
ptrace(PTRACE_SETREGSET, ...) path. Since user_regs_struct is
a subset of pt_regs, we also need to adjust the position of
the orig_a0 field in pt_regs to achieve the correct copy.

Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
---
 arch/riscv/include/asm/ptrace.h      | 4 ++--
 arch/riscv/include/uapi/asm/ptrace.h | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/ptrace.h b/arch/riscv/include/asm/ptrace.h
index b5b0adcc85c1..37f48d40ae46 100644
--- a/arch/riscv/include/asm/ptrace.h
+++ b/arch/riscv/include/asm/ptrace.h
@@ -45,12 +45,12 @@ struct pt_regs {
 	unsigned long t4;
 	unsigned long t5;
 	unsigned long t6;
+	/* a0 value before the syscall */
+	unsigned long orig_a0;
 	/* Supervisor/Machine CSRs */
 	unsigned long status;
 	unsigned long badaddr;
 	unsigned long cause;
-	/* a0 value before the syscall */
-	unsigned long orig_a0;
 };
 
 #define PTRACE_SYSEMU			0x1f
diff --git a/arch/riscv/include/uapi/asm/ptrace.h b/arch/riscv/include/uapi/asm/ptrace.h
index a38268b19c3d..3e37f80cb3e8 100644
--- a/arch/riscv/include/uapi/asm/ptrace.h
+++ b/arch/riscv/include/uapi/asm/ptrace.h
@@ -54,6 +54,8 @@ struct user_regs_struct {
 	unsigned long t4;
 	unsigned long t5;
 	unsigned long t6;
+	/* a0 value before the syscall */
+	unsigned long orig_a0;
 };
 
 struct __riscv_f_ext_state {
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
