Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA67BC3DA7F
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Aug 2024 09:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GndouvrXbGLF/NMVev+Qhs1Za79+t8MZcDgFIgGcbc8=; b=bOhFDUbs3ozcbq
	DS6heJGR3figYR4vikr5U/U7SgPOE044p4c3iKGY+HnYPQ4BYWWSNn9h8UATYfBGezJzxS0e4euw+
	tvPD4BmkN5ko6xwGa6qOIQmHSd8Y+vId5zanJZtWvRw1LR0hQDDBWTjFmXjPDRDp+UIfYiCPviWs+
	XrrKUqzf4qTvMkMuMGNkxrGQ9owoYOteI1tivbZ91A/X79LmFLVEJHvml2klnyg52bBH4VU1LAIQD
	MLfD72OcRHCk6CNqTkbaOZkTPen6a6TBUQoaOEA44klBswfCUO1kaocdCOf/n3xVBOMIAGXb207gl
	d9xeXTywsRdyB0E5EBww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sauPl-0000000FOMI-3RE8;
	Mon, 05 Aug 2024 09:54:05 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sauPg-0000000FOJP-3mhT
	for linux-riscv@lists.infradead.org;
	Mon, 05 Aug 2024 09:54:04 +0000
Received: from ubt.. (unknown [210.73.53.31])
	by APP-03 (Coremail) with SMTP id rQCowACHjvoJobBmMT6cAw--.14790S2;
	Mon, 05 Aug 2024 17:53:14 +0800 (CST)
From: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chunyan Zhang <zhang.lyra@gmail.com>
Subject: [PATCH V3 0/3] riscv: mm: Add soft-dirty and uffd-wp support
Date: Mon,  5 Aug 2024 17:52:40 +0800
Message-Id: <20240805095243.44809-1-zhangchunyan@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: rQCowACHjvoJobBmMT6cAw--.14790S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw17trWrtr4xKryUZF4UXFb_yoW8XF15pa
	ySkwn8try5CryIyr4fCr1qgr15X3Wft3s8Cryft34vyw4rWFWUZrnYk3WfJw18X3W29r9Y
	93W5Gry5u3ykZaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvSb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
	C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
	Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJV
	W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_JF0_
	Jw1lc2xSY4AK67AK6r4fMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI
	8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
	xVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI
	8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280
	aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43
	ZEXa7IU8KFAPUUUUU==
X-Originating-IP: [210.73.53.31]
X-CM-SenderInfo: x2kd0wxfkx051dq6x2xfdvhtffof0/1tbiDAgAB2awjLg3zAAAsa
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_025401_379274_F1C826B0 
X-CRM114-Status: UNSURE (   9.26  )
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

V3:
- Fixed the issue reported by kernel test irobot <lkp@intel.com>.

V1 -> V2:
- Add uffd-wp supported;
- Make soft-dirty uffd-wp and devmap mutually exclusive which all use the same PTE bit;
- Add test results of CRIU in the cover-letter.

[1] https://www.criu.org/Incremental_dumps
[2] https://asciinema.org/a/232445

Chunyan Zhang (3):
  riscv: mm: Prepare for reuse PTE RSW bit(9)
  riscv: mm: Add soft-dirty page tracking support
  riscv: mm: Add uffd write-protect support

 arch/riscv/Kconfig                    |  34 ++++++-
 arch/riscv/include/asm/pgtable-64.h   |   2 +-
 arch/riscv/include/asm/pgtable-bits.h |  31 ++++++
 arch/riscv/include/asm/pgtable.h      | 132 +++++++++++++++++++++++++-
 4 files changed, 196 insertions(+), 3 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
