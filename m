Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5306C3DA7F
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jul 2024 04:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VHiSmzzjv6eckw6XS/gVNJKZNBTKvQfLUGSEQcrWaKk=; b=mYuEXq5i5DwDbe
	JgOVOo2Nw7seqJ7eHBA9/Kpvk4hrO35zGVr0VOFMQXqq91jQB9UsVLesy2eeiyyJLQYL5R8LSI+JX
	u2R0kOaz/law+oUcFakCsGJiq0WnKX87mKu96S1vSvJnLvzMecE3l6PIoKveVUm3LZSH01IOSu8S2
	472bEkkEjXASHdc6VqsN/1E5nbSzznPG+bAnghxeudrdP3k7z1apT/WDYQ9aw9msw/YX5XyVBRKJU
	w+STIt0BDfap9VmlYOCX24XZ9N0qinB2HZRj4AtqPvPqc4bQIhSNpC9HqpkC8p+E3sLx/nrhkJvoN
	uBTa3hEtgx1x+rHW5y0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ0bP-0000000HEJe-16NB;
	Wed, 31 Jul 2024 04:06:15 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ0bL-0000000HEIM-3SJl
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jul 2024 04:06:13 +0000
Received: from ubt.. (unknown [210.73.53.31])
	by APP-01 (Coremail) with SMTP id qwCowAAnL0spuKlmWXZdAg--.7845S2;
	Wed, 31 Jul 2024 12:06:04 +0800 (CST)
From: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chunyan Zhang <zhang.lyra@gmail.com>
Subject: [PATCH V2 0/3] riscv: mm: Add soft-dirty and uffd-wp support
Date: Wed, 31 Jul 2024 12:04:41 +0800
Message-Id: <20240731040444.3384790-1-zhangchunyan@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: qwCowAAnL0spuKlmWXZdAg--.7845S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw17trWDGF1fZryUCr4Uurg_yoW8JFykpa
	9xCw15tryYkr1IyrsxAr1qgw15X3WfG3s0yry3X34ktw45WF4UZr9Yk3W8Jw18Ja42vr90
	ka1UGry5Cw4kZaUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvSb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjc
	xK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
	Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVW8JV
	WxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_Jw0_
	GFylc2xSY4AK67AK6r45MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI
	8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
	xVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI
	8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280
	aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43
	ZEXa7IU8u6wtUUUUU==
X-Originating-IP: [210.73.53.31]
X-CM-SenderInfo: x2kd0wxfkx051dq6x2xfdvhtffof0/1tbiBwwPB2apggyjfAAAsd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_210612_288607_7E5151C4 
X-CRM114-Status: UNSURE (   8.77  )
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

As described in the patches, we are trying to utilize only one free PTE bit to
support three kernel features (devmap, soft-dirty,uffd-wp). Users cannot have
them supported at the same time (have to select one when building the kernel).

This patchset has been tested with:
1) The kselftest mm suite in which soft-dirty, madv_populate, test_unmerge_uffd_wp,
and uffd-unit-tests run and pass, and no regressions are observed in any of the
other tests.

2) CRIU:
- 'criu check --feature mem_dirty_track' returns supported
- incremental_dumps works fine
- zdtm test suite can run under host mode

V1 -> V2:
- Add uffd-wp supported;
- Make soft-dirty uffd-wp and devmap mutually exclusive which all use the same PTE bit;
- Add test results of CRIU in the cover-letter.

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
