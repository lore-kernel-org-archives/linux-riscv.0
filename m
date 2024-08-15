Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72EBCC531DE
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Aug 2024 03:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yE5lOgWbVhYnvGBppRq/kX07Sro8QMVqUG5IE/oAfQ0=; b=oa9ftHJhbOY/af
	FFOuJ/o4mHnizn4/POyz8BtrHao+onrbZe9QoHEeYQ3VYmj7lHIx7C3SvYRpGEHyrECMi63oG3g4F
	a8z4BZCdeoxQ5epRLFEqWRwLQwwLlWIDt+uZ54nU8lMRJLPkfOruGY5rMDqoqOA06g7jNaJfYcD/P
	vbbv7ysL8eShBlJBZJJh9O6w9+UOUbXEhR2ZasO8OggBdE0Qm9v9xbvVCV9TzVKlnMGogVkQ9NUCO
	7/MPY7Cu9g+O8UMxT8W2GzoFxExxSkbUSp5aCcxN/Psju2Y5snSLwDst3hgzzo7HfbxPY32IH4FXw
	9rJLXNe/B/LE+OOMF/fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seQmt-00000008sQN-3ULt;
	Thu, 15 Aug 2024 03:04:31 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seQmq-00000008sNl-07vF
	for linux-riscv@lists.infradead.org;
	Thu, 15 Aug 2024 03:04:30 +0000
Received: from ubt.. (unknown [210.73.53.31])
	by APP-01 (Coremail) with SMTP id qwCowADn7EgucL1mTZWnBg--.51305S2;
	Thu, 15 Aug 2024 11:04:15 +0800 (CST)
From: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chunyan Zhang <zhang.lyra@gmail.com>
Subject: [PATCH V4 0/3] riscv: mm: Add soft-dirty and uffd-wp support
Date: Thu, 15 Aug 2024 11:04:00 +0800
Message-Id: <20240815030403.832489-1-zhangchunyan@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: qwCowADn7EgucL1mTZWnBg--.51305S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw17trWrtr4xKryUZF4UXFb_yoW8Xw4rpa
	9Ykwn8try5Cr1xtrs3Cr1DKr15W3Wft345Cryft34vyw45JF4jvrnYkF1fJw18X3W29r90
	kF15CrW3u3ykZaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvIb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
	C2z280aVCY1x0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWU
	twCY02Avz4vE14v_Gr4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2
	IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v2
	6r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2
	IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv
	67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf
	9x07jreOJUUUUU=
X-Originating-IP: [210.73.53.31]
X-CM-SenderInfo: x2kd0wxfkx051dq6x2xfdvhtffof0/1tbiCQ4AB2awi9k5hwACs4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_200428_456310_F98D17D0 
X-CRM114-Status: UNSURE (   9.33  )
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

This patchset adds soft dirty and userfaultfd write protect tracking support
for RISC-V.

As described in the patches, we are trying to utilize only one free PTE
bit(9) to support three kernel features (devmap, soft-dirty, uffd-wp).
Users cannot have them supported at the same time (have to select
one when building the kernel).

This patchset has been tested with:
1) The kselftest mm suite in which soft-dirty, madv_populate, test_unmerge_uffd_wp,
and uffd-unit-tests run and pass, and no regressions are observed in any of the
other tests.

2) CRIU:
- 'criu check --feature mem_dirty_track' returns supported;
- incremental_dumps[1] and simple_loop [2] dump and restores work fine;
- zdtm test suite can run under host mode.

V4:
- Added bit(4) descriptions into "Format of swap PTE".

V3:
- Fixed the issue reported by kernel test irobot <lkp@intel.com>.

V1 -> V2:
- Add uffd-wp supported;
- Make soft-dirty uffd-wp and devmap mutually exclusive which all use the same PTE bit;
- Add test results of CRIU in the cover-letter.

[1] https://www.criu.org/Incremental_dumps
[2] https://asciinema.org/a/232445

Chunyan Zhang (3):
  riscv: mm: Prepare for reusing PTE RSW bit(9)
  riscv: mm: Add soft-dirty page tracking support
  riscv: mm: Add uffd write-protect support

 arch/riscv/Kconfig                    |  34 ++++++-
 arch/riscv/include/asm/pgtable-64.h   |   2 +-
 arch/riscv/include/asm/pgtable-bits.h |  31 ++++++
 arch/riscv/include/asm/pgtable.h      | 133 +++++++++++++++++++++++++-
 4 files changed, 197 insertions(+), 3 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
