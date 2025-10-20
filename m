Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B68CCD199
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 09:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3sKDbTu90Mzmg41j9Z1PxD3nsypjclNtJ47rlzDzpnw=; b=fdhepM8N8RwSCk
	zoX4hYREA88oT/MYNMWnYXqh02Eg7SzfnABszxU4HILRqfU3EQMNOUFcm/HDDtM+riuPbNWrOGc3I
	9q5AnheRdFpzlRUN3JCl8dAAnLhUl1kXZ0Pz2140Es9JW6Tm97qD5vVt4OaWDL49UQOcIbHAEpNPi
	6YhlxwO8KrqfDFasmhg9FzqSFQdT1ZQw0YmXM8FBlFT8F9A0Kci0InkXx+SZwHHaWoT9T4NDfpkov
	vULrrjAKlu4R/hGIAoV5iIDo4zebtKurHn9GQfd2mB+pl/q3j5qsueay3DMR0zgibDvY0eTz+hO4K
	uZoLYKcxKqBOTCsxHg/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAluA-0000000CWQ0-13So;
	Mon, 20 Oct 2025 09:10:14 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAlu6-0000000CWO2-2Pwp
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 09:10:13 +0000
Received: from [127.0.0.2] (unknown [114.241.85.109])
	by APP-03 (Coremail) with SMTP id rQCowAD3RoFo_PVo4mflEQ--.23190S2;
	Mon, 20 Oct 2025 17:10:00 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Subject: [PATCH v4 0/5] riscv: Use riscv_has_extension_{likely,unlikely}
Date: Mon, 20 Oct 2025 17:09:55 +0800
Message-Id: <20251020-riscv-altn-helper-wip-v4-0-ef941c87669a@iscas.ac.cn>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGP89WgC/4XO3U7DMAwF4Fepco2r/CxptiveA+3CuA6NtLUlK
 Rlo6rsTOgmB0MTlsY4/+yoyp8hZHJqrSFxijtNYw+6hETTg+MIQ+5qFltpKryWkmKkAnpYRBj7
 NnOASZ5ASg0FrNZlO1N05cYjvm/t0vOXEr2+VX25D8YyZgabzOS6HprhWeUikxFd5iHmZ0sf2U
 1Fb+5/zRYEEMuS0IxU6do+1hrlFamnczKJ/Ouqeo6uzt94F7KQOnf/rmG9HSXXXMdXpd7LvEdX
 eW/ztrOv6CQLP75R5AQAA
X-Change-ID: 20250820-riscv-altn-helper-wip-00af3a552c37
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yury Norov <yury.norov@gmail.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, Paul Walmsley <pjw@kernel.org>
Cc: Charlie Jenkins <charlie@rivosinc.com>, 
 Xiao Wang <xiao.w.wang@intel.com>, 
 =?utf-8?q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
 Vivian Wang <wangruikang@iscas.ac.cn>, Vivian Wang <uwu@dram.page>, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-CM-TRANSID: rQCowAD3RoFo_PVo4mflEQ--.23190S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCw13Gr4UCryrKw4DGr4rXwb_yoW5ZF13pF
	4SkFZI9r1kG34Sq3Z3Ar17ZrWFva1rWw13WrnIg3y8Za12yryxZrZIkw4ruryqqFZ7Aryj
	yw4fGr1UC3WUAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Y14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
	0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
	zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
	4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
	CwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
	nIWIevJa73UjIFyTuYvjfUFg4SDUUUU
X-Originating-IP: [114.241.85.109]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_021011_493656_ADEA2D48 
X-CRM114-Status: UNSURE (   9.24  )
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

There are about a dozen uses of asm goto in arch/riscv just to select
between two code paths with the alternative mechanism. Convert them to
the existing helpers riscv_has_extension_{likely,unlikely}.

In each case, I have preserved the existing code's choice of asm goto
pattern while picking between "likely" and "unlikely", namely:

  ALTERNATIVE("j %l[no]", "nop", ...)   -> "likely"
  ALTERNATIVE("nop", "j %l[yes]", ...)  -> "unlikely"

Since the helpers are just implementations of these patterns, the
performance should be the same as before.

There are some oddities:

- The two pgtable checks for Svvptc are not guarded behind
  CONFIG_RISCV_ALTERNATIVE (or something that implies it). However since
  TLB flushes are slow, relatively speaking, it should still be
  beneficial to check at runtime for Svvptc.
- arch/riscv/include/asm/{bitops.h,swab.h} have a check for
  defined(NO_ALTERNATIVE), which is defined in efistub where
  alternatives are not a thing. It's not checked in any other header
  file. I verified that currently no actual asm(ALTERNATIVE(...)) usage
  in efistub exists (by inserting an assembly .error if NO_ALTERNATIVE),
  so I've decided against preemptively adding checks for it.

These patches are also available at:

https://github.com/dramforever/linux/tree/riscv/altn-helper/v4

---
Changes in v4:
- Rebase on v6.18-rc1
- Use riscv_has_extension_{likely,unlikely} instead of double-underscore
  version __riscv_has_extension_{likely,unlikely} (See oddities in cover
  letter body)
- Link to v3: https://lore.kernel.org/r/20251011-riscv-altn-helper-wip-v3-0-d40ddaa1985a@iscas.ac.cn

Changes in v3:
- Rebased on riscv for-next
  - Resolve conflict, use ALT_RISCV_PAUSE() in moved lines
- Link to v2: https://lore.kernel.org/r/20250821-riscv-altn-helper-wip-v2-0-9586fa702f78@iscas.ac.cn

Changes in v2:
- Cc'd authors who initially introduced the asm goto blocks
- Use existing __riscv_has_extension_{likely,unlikely} instead
- Remove bogus comment for Zbb being likely (checksum)
- Restructured patch to minimize diff (bitops, hweight, cmpxchg)
- Link to v1: https://lore.kernel.org/r/20250820-riscv-altn-helper-wip-v1-0-c3c626c1f7e6@iscas.ac.cn

---
Vivian Wang (5):
      riscv: pgtable: Use riscv_has_extension_unlikely
      riscv: checksum: Use riscv_has_extension_likely
      riscv: hweight: Use riscv_has_extension_likely
      riscv: bitops: Use riscv_has_extension_likely
      riscv: cmpxchg: Use riscv_has_extension_likely

 arch/riscv/include/asm/arch_hweight.h | 24 ++++++----------
 arch/riscv/include/asm/bitops.h       | 32 ++++++---------------
 arch/riscv/include/asm/checksum.h     | 13 +++------
 arch/riscv/include/asm/cmpxchg.h      | 12 +++-----
 arch/riscv/include/asm/pgtable.h      | 15 +++++-----
 arch/riscv/lib/csum.c                 | 53 ++++++++---------------------------
 arch/riscv/mm/pgtable.c               | 22 +++++++--------
 7 files changed, 53 insertions(+), 118 deletions(-)
---
base-commit: cb6649f6217c0331b885cf787f1d175963e2a1d2
change-id: 20250820-riscv-altn-helper-wip-00af3a552c37

Best regards,
-- 
Vivian "dramforever" Wang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
