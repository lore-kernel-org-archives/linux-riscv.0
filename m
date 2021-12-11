Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2F26C433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Dec 2021 03:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rt/HdzcxqS7OdRKolzNS1x4Rtq93Ws5ad8kqlltIwO0=; b=QtOFWkh/R7DxjO
	kCLl9odo2zDxuwVxJCebdlg00RgYJM6CYPKw/49sRXLp0GsKCKz2ETqkJRtghwtCOV2gBTDyiwAOh
	L/W/ZTTb4VF5PNdaKJXVIfdakX0fvq0ED7hpjyvPb6zmQYjH1bCVGKtRKa6p6wBj2/06Sl6pnsIjp
	7XrUuFACEumyLNZ1mxrmUlT1Q+FQDqV00VBdt0QOJgGnS4e+1QArFEiF01FpOa+sugxDq3DDul/Ts
	MWEH3SBAC16z3DHZV6ms2fJXdG3XQRL6sCvKACSy6gWQxJxArxV47psAxlmxhhwMfavcm5BDXWCuX
	frpnLyzyakvcBtrU6BOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvt8b-004UQJ-Nu; Sat, 11 Dec 2021 03:33:29 +0000
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvt8N-004UMg-51; Sat, 11 Dec 2021 03:33:17 +0000
Received: from linux.localdomain (unknown [113.200.148.30])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Ax+sj1G7RhlA0GAA--.13327S2; 
 Sat, 11 Dec 2021 11:33:09 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Dave Young <dyoung@redhat.com>, Baoquan He <bhe@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org, x86@kernel.org,
 linux-fsdevel@vger.kernel.org, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH v2 0/2] kdump: simplify code
Date: Sat, 11 Dec 2021 11:33:06 +0800
Message-Id: <1639193588-7027-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9Ax+sj1G7RhlA0GAA--.13327S2
X-Coremail-Antispam: 1UD129KBjvdXoWruFyrWF13KFW3ZFW3Gr18Grg_yoWDJrb_JF
 Z7ua4rGr4IvayrtFy7K3Z3ZryDtr4vyF90v3WktrW5tasxJF1rJw4UAF4Yqrn8XFWkJrWU
 ZrW5JFyvyr1FqjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUb38FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
 Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJV
 WxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
 Y2ka0xkIwI1lc2xSY4AK67AK6r48MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r
 1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
 b7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
 vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI
 42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWI
 evJa73UjIFyTuYvjfUnQ6pDUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_193315_636067_3CE51665 
X-CRM114-Status: UNSURE (   4.00  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

v2:
  -- add copy_to_user_or_kernel() in lib/usercopy.c
  -- define userbuf as bool type

Tiezhu Yang (2):
  kdump: vmcore: remove copy_to() and add copy_to_user_or_kernel()
  kdump: crashdump: use copy_to_user_or_kernel() to simplify code

 arch/arm/kernel/crash_dump.c     | 12 +++---------
 arch/arm64/kernel/crash_dump.c   | 12 +++---------
 arch/ia64/kernel/crash_dump.c    | 12 +++++-------
 arch/mips/kernel/crash_dump.c    | 11 +++--------
 arch/powerpc/kernel/crash_dump.c | 11 ++++-------
 arch/riscv/kernel/crash_dump.c   | 11 +++--------
 arch/sh/kernel/crash_dump.c      | 11 +++--------
 arch/x86/kernel/crash_dump_32.c  | 11 +++--------
 arch/x86/kernel/crash_dump_64.c  | 15 +++++----------
 fs/proc/vmcore.c                 | 32 +++++++++-----------------------
 include/linux/crash_dump.h       |  8 ++++----
 include/linux/uaccess.h          |  1 +
 lib/usercopy.c                   | 15 +++++++++++++++
 13 files changed, 61 insertions(+), 101 deletions(-)

-- 
2.1.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
