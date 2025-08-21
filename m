Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F54CA0EF8
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Aug 2025 12:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JXBamEhyCPBw5i/ndDSU2DYBVvbpYRoKGfDfha34XdU=; b=VjHg+wMzB1rBJ2
	APtKxmH99CV09Q0G1mkmOw2T0M7hoExfdelEtmvRQDk5Rd3OyGZD8ACM0DXrDgJwpV9Qb2QJQpkQL
	lnd85h4QSMT6tNXW4I7mTbXb07zS62WaUOqn0G49ETccOtbyJlAMB1pwEbVcCuT2RrYRkq8ZyfKI8
	AhRxpS2G3DNqfA5ipmuy/1GYVQ3sgr4K45SQjtqXylRsVruhMR+IFrvEKzOoI4uT9U3NAf7w/ReBM
	PhR3GSRGgbApN4PNXs+I6BFU9Dch6M64gFSJloUcMz8908vufX4FXQhPM1CYt4nqHe+xem7BE81B5
	AThopm2510talNiWOXjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up4Ax-0000000Grqo-0GuR;
	Thu, 21 Aug 2025 12:13:51 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up1PW-0000000GN34-2Ns8
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 09:16:45 +0000
Received: from [127.0.0.2] (unknown [114.241.87.235])
	by APP-01 (Coremail) with SMTP id qwCowADXAqfv46ZovXADDg--.14435S2;
	Thu, 21 Aug 2025 17:16:31 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Subject: [PATCH v2 0/5] riscv: Use __riscv_has_extension_{likely,unlikely}
Date: Thu, 21 Aug 2025 17:16:30 +0800
Message-Id: <20250821-riscv-altn-helper-wip-v2-0-9586fa702f78@iscas.ac.cn>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAO7jpmgC/4WOTQ6CMBCFr0Jm7ZC2BDCuvIdhUcdBJuHPtlYN4
 e5WOIDLb/LNe28Bz07YwylbwHEUL9OYwBwyoM6Od0a5JQajTKmORqETTxFtH0bsuJ/Z4UtmVMq
 2hS1LQ0UN6Xd23Mp7y700Ozt+PFN82I9wtZ6RpmGQcMpilesaHWn4yZ34MLnPtinqzf5THzUqp
 IIqU5Fua67OSbM+t5TTCM26rl8IVKXC6QAAAA==
X-Change-ID: 20250820-riscv-altn-helper-wip-00af3a552c37
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yury Norov <yury.norov@gmail.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Charlie Jenkins <charlie@rivosinc.com>, 
 Xiao Wang <xiao.w.wang@intel.com>, 
 =?utf-8?q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
 Vivian Wang <wangruikang@iscas.ac.cn>, Vivian Wang <uwu@dram.page>, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-CM-TRANSID: qwCowADXAqfv46ZovXADDg--.14435S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zw17Xr4UArW3Zw4xJw1DZFb_yoW8ZF43pF
	43Cr9I9Fn5G34Sq3Z3Ar12vr40vF4rWw1aqrsIgry8X3y2yryIgryqkw1rZryDtFZ7Zryq
	kw13Cr1xuF17C3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9j14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
	C2KfnxnUUI43ZEXa7VUbGQ6JUUUUU==
X-Originating-IP: [114.241.87.235]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_021642_996288_3FF4D930 
X-CRM114-Status: UNSURE (   6.44  )
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
base-commit: 062b3e4a1f880f104a8d4b90b767788786aa7b78
change-id: 20250820-riscv-altn-helper-wip-00af3a552c37

Best regards,
-- 
Vivian "dramforever" Wang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
