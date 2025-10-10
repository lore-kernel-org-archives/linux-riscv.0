Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBAC5CCD187
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 23:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YJ7CTlRGGnJ1v5EiVW3fmXkQqXXpqUOUsb5BiQTSZrw=; b=qymWCaKpFDqiXo
	eEMe65GV2nKN+egfU0/CGZTG7VC80EG/8ue2fvEJ+BJLdbilc4yncPZ9/ZAxZMoOZirzxq/G+IUYg
	GWeyV8VlaC+qPZDK7qTh3M/2xXYpqSqKzhNcSMXneCoOa1dv0tY0bm3G3wRCfvpAu8WZOh6TR+qIP
	BztMQT8QFfjgd7MTGn4sQxTgZyD+SLaOLcegbev9sZKaJalu6c0RE9Y/xyZa/J1V/JHz5Eb7Yi+c7
	AiX4tN8dvdOwZx6SCy6lfzIgq7ckUapqIZzVQqPy4sayQUq5191ThHAc1D6ZrAt/uRX3bRW+ASa/r
	pZWljdikolZOX6FdK34w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Mea-00000009WiI-2Wix;
	Fri, 10 Oct 2025 23:36:04 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7MeX-00000009Whz-1U8Z
	for linux-riscv@lists.infradead.org;
	Fri, 10 Oct 2025 23:36:03 +0000
Received: from [127.0.0.2] (unknown [114.241.81.247])
	by APP-05 (Coremail) with SMTP id zQCowADHaxVUmOloXC2IDQ--.41211S2;
	Sat, 11 Oct 2025 07:35:48 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Subject: [PATCH v3 0/5] riscv: Use __riscv_has_extension_{likely,unlikely}
Date: Sat, 11 Oct 2025 07:35:42 +0800
Message-Id: <20251011-riscv-altn-helper-wip-v3-0-d40ddaa1985a@iscas.ac.cn>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAE6Y6WgC/4XOy07DMBAF0F+JvMaVH/KDrvgPxGI8HhNLbZLaw
 S2q8u+YdAMLxPKO5h7dO6tUMlV2HO6sUMs1z1MP+mlgOML0TjzHnpkSygivBC+5YuNwWic+0mm
 hwq954UJA0mCMQu1Y7y6FUr7t7uvbIxe6fHR+fRxZgEoc5/M5r8cBo4EuhJi80Dqi185bLU20O
 vmglQkxgEqRfVtjrutcPvfJTe7YP+ua5IKjRqssyuTIvvQ3qAfAA0672dRPR/7lqO48G28TOKG
 S87+dbdu+AA3BjXVQAQAA
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
X-Mailer: b4 0.14.2
X-CM-TRANSID: zQCowADHaxVUmOloXC2IDQ--.41211S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zw17Xr4UArW3tr1rXw1kZrb_yoW8trW3pF
	43Cr9I9rn3G34Sqws3Ar129r40va1rWw1agrsIg348Z3y2yryxZrn0kw1ruryDtFZ7Zryj
	kr13Gr17uF1UA3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9214x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
	1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02
	628vn2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4
	IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1r
	MI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJV
	WUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j
	6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYx
	BIdaVFxhVjvjDU0xZFpf9x0JUd-B_UUUUU=
X-Originating-IP: [114.241.81.247]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_163601_802610_CBAD3CD3 
X-CRM114-Status: UNSURE (   6.55  )
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
the existing helpers __riscv_has_extension_{likely,unlikely}.

In each case, I have preserved the existing code's choice of asm goto
pattern while picking between "likely" and "unlikely", namely:

  ALTERNATIVE("j %l[no]", "nop", ...)   -> "likely"
  ALTERNATIVE("nop", "j %l[yes]", ...)  -> "unlikely"

Since the helpers are just implementations of these patterns, the
performance should be the same as before.

These patches are also available at:

https://github.com/dramforever/linux/tree/riscv/altn-helper/v2

---
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
      riscv: pgtable: Use __riscv_has_extension_unlikely
      riscv: checksum: Use __riscv_has_extension_likely
      riscv: hweight: Use __riscv_has_extension_likely
      riscv: bitops: Use __riscv_has_extension_likely
      riscv: cmpxchg: Use __riscv_has_extension_likely

 arch/riscv/include/asm/arch_hweight.h | 24 ++++++----------
 arch/riscv/include/asm/bitops.h       | 32 ++++++---------------
 arch/riscv/include/asm/checksum.h     | 13 +++------
 arch/riscv/include/asm/cmpxchg.h      | 12 +++-----
 arch/riscv/include/asm/pgtable.h      | 15 +++++-----
 arch/riscv/lib/csum.c                 | 53 ++++++++---------------------------
 arch/riscv/mm/pgtable.c               | 22 +++++++--------
 7 files changed, 53 insertions(+), 118 deletions(-)
---
base-commit: cd5a0afbdf8033dc83786315d63f8b325bdba2fd
change-id: 20250820-riscv-altn-helper-wip-00af3a552c37

Best regards,
-- 
Vivian "dramforever" Wang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
