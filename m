Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 726E2C3600C
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Apr 2025 08:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tK2L6WqKTCHdHB/3vz0cn0aihlnrtCRTiCA/rfVF5AI=; b=p0uIMM+015ShMs
	JTs6PS5ZweOOan7KG4+yM9QOXEFJZ68xmjL3HZIUZsiqRGCwQwItKOhenVm3Gxsl1ZlGMkP8ddjvf
	hiDb/v9tH3OC25O2moGUPMj3orFfpyzcf5OZS0ShpkmNeR6SLas/hS1val05CdZuavtCW5cykAwKg
	ecOHz4bTKh3sa1ofomOZH3yCaFbAzcrBbuQn5krWaM/Mfq/+CZ9ruS+q/+Jt14sbmNpXwU/XdHTJe
	Gf+6wXkXQ/SnbN+NnPfvNb0c+F9FL8D/BqWACiR6vDL9Yrcj0jHye9VSXapsVrsnoXlDuv7rLR5bR
	vj0MpLW5NfMGTUrYslNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u24Zc-00000003IP5-3s3n;
	Tue, 08 Apr 2025 08:44:48 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u24YV-00000003I8Z-104Q
	for linux-riscv@lists.infradead.org;
	Tue, 08 Apr 2025 08:43:41 +0000
Received: from ubt.. (unknown [210.73.43.1])
	by APP-05 (Coremail) with SMTP id zQCowAA3dg6p4fRnGBEpBw--.8246S2;
	Tue, 08 Apr 2025 16:43:22 +0800 (CST)
From: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Deepak Gupta <debug@rivosinc.com>,
	Ved Shanbhogue <ved@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chunyan Zhang <zhang.lyra@gmail.com>
Subject: [PATCH V6 0/2] riscv: mm: Add soft-dirty and uffd-wp support
Date: Tue,  8 Apr 2025 16:42:59 +0800
Message-Id: <20250408084301.68186-1-zhangchunyan@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: zQCowAA3dg6p4fRnGBEpBw--.8246S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw1xGw4rKw4fJryUtr1UJrb_yoW8GrW5pF
	Z3GwnxJry5Cr1xtrs3Ca40kr4Fqan5AryrGa47Jw1kJws8GFWjqrnYkFyrtr18JF1SqrWF
	9F45Cry5Ww4qy3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9qb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkI
	wI1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67AK6r43MxAIw28IcxkI7VAKI48JMxC20s
	026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_
	JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14
	v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xva
	j40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJV
	W8JbIYCTnIWIevJa73UjIFyTuYvjxUxq2NUUUUU
X-Originating-IP: [210.73.43.1]
X-CM-SenderInfo: x2kd0wxfkx051dq6x2xfdvhtffof0/1tbiCQ4GB2f0uz6+mQAAs3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_014339_638934_1120F210 
X-CRM114-Status: UNSURE (   9.16  )
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

This patchset adds soft dirty and userfaultfd write protect tracking 
support for RISC-V.

This patchset has been tested with kselftest mm suite in which soft-dirty, 
madv_populate, test_unmerge_uffd_wp, and uffd-unit-tests run and pass,
and no regressions are observed in any of the other tests.

This patchset applies on top of v6.15-rc1.

V6:
- Changes to use bits 59-60 which are supported by extension Svrsw60t59b [1]
  for soft dirty and userfaultfd write protect tracking.

V5:
- Fixed typos and corrected some words in Kconfig and commit message;
- Removed pte_wrprotect() from pte_swp_mkuffd_wp(), this is a copy-paste error;
- Added Alex's Reviewed-by tag in patch 2.

V4:
- Added bit(4) descriptions into "Format of swap PTE".

V3:
- Fixed the issue reported by kernel test irobot <lkp@intel.com>.

V1 -> V2:
- Add uffd-wp supported;
- Make soft-dirty uffd-wp and devmap mutually exclusive which all use the same PTE bit;
- Add test results of CRIU in the cover-letter.

[1] https://github.com/riscv/Svrsw60t59b.git

Chunyan Zhang (2):
  riscv: mm: Add soft-dirty page tracking support
  riscv: mm: Add uffd write-protect support

 arch/riscv/Kconfig                    |   2 +
 arch/riscv/include/asm/pgtable-bits.h |  29 ++++++
 arch/riscv/include/asm/pgtable.h      | 136 +++++++++++++++++++++++++-
 3 files changed, 165 insertions(+), 2 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
