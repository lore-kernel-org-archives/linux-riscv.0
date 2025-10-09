Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A8C2CCD184
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 13:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/MPSxqeNxc7TN2PLFuzRw++ll837OOUCdyqipwdMzVo=; b=f2F1B9aya/Soo0
	lmWaxuLfaEsBM32KwOjxFxx6VCX1Dg18p+43NSdvFfUrvFl/C6MNxOrkzVnqRMSlfGuWNW2r7lxHZ
	08Zba00omVpZBBg959nOuzED9Io1pdls+n717SCXzsSVTrH7NVWH2Z/HP1hnCdN9NLFTxdltnROTT
	OCOLezDm8eEva/MOiC3GEV2cUFcV4Q/xFH1HtkvcIIcKwrqIBvDmXP8PqqdxPNgVZqtW9KIOw9D/h
	hOtr15uUG/N2Qc7wnYKUYuvw4z6xS7wV/4FcvXulRDH9dHxq75vSZcj8LMk9jSmy52SgVUieSG7TL
	j6gavmJLfve2yACzte0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6qw8-00000006Fb4-2C1u;
	Thu, 09 Oct 2025 13:44:04 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6qw3-00000006FaK-2pbJ
	for linux-riscv@lists.infradead.org;
	Thu, 09 Oct 2025 13:44:02 +0000
Received: from Mobilestation.localdomain (unknown [183.6.60.79])
	by APP-01 (Coremail) with SMTP id qwCowACX76EEvOdoFFc_DQ--.1956S2;
	Thu, 09 Oct 2025 21:43:36 +0800 (CST)
From: Yao Zihong <zihong.plct@isrc.iscas.ac.cn>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: ajones@ventanamicro.com,
	alexghiti@rivosinc.com,
	shuah@kernel.org,
	samuel.holland@sifive.com,
	evan@rivosinc.com,
	cleger@rivosinc.com,
	zihong.plct@isrc.iscas.ac.cn,
	zihongyao@outlook.com,
	zhangyin2018@iscas.ac.cn,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH v2 0/4] riscv: hwprobe: Add Zicbop support
Date: Thu,  9 Oct 2025 21:41:50 +0800
Message-ID: <20251009134318.23040-1-zihong.plct@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CM-TRANSID: qwCowACX76EEvOdoFFc_DQ--.1956S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZryUCrW7tw47tr47Jr1DWrg_yoW8Jw4rpa
	93Wrn3CF4kCw13CayxGr1UWr1rKwnYgw4UZFy8Xry8ZrWYyrWrAr9rKrZ7AFWUJF93tr98
	ZF4fGrWYk3W7A37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x0JUd-B_UUUUU=
X-Originating-IP: [183.6.60.79]
X-CM-SenderInfo: p2lk00vjoszunw6l223fol2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_064400_077103_3E9AE00F 
X-CRM114-Status: UNSURE (   7.55  )
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

Changes since v1:
------------------
- Bump RISCV_HWPROBE_MAX_KEY (modified 1/4).
- Add documentation for the Zicbop hwprobe bit/key (new 3/4).
- Add a selftest(prefetch.c) for Zicbop (new 4/4).

Add UAPI and kernel plumbing to expose the Zicbop extension presence
and its block size through hwprobe. The interface mirrors
Zicbom/Zicboz. This allows userspace to safely discover and optimize
for Zicbop when available.

Background: Zicbop is mandated by the RVA22U64 profile. Downstream may
combine the presence bit with ZICBOP_BLOCK_SIZE to make profile-level
policy decisions or enable Zicbop-specific optimizations.

Yao Zihong (4):
  uapi: riscv: hwprobe: Add Zicbop extension bit and block-size key
  riscv: hwprobe: Report Zicbop presence and block size
  docs: riscv: Document hwprobe for Zicbop
  selftests/riscv: Add Zicbop prefetch test

 Documentation/arch/riscv/hwprobe.rst          |   8 +-
 arch/riscv/include/asm/hwprobe.h              |   2 +-
 arch/riscv/include/uapi/asm/hwprobe.h         |   2 +
 arch/riscv/kernel/sys_hwprobe.c               |   6 +
 .../testing/selftests/riscv/hwprobe/Makefile  |   5 +-
 .../selftests/riscv/hwprobe/prefetch.c        | 236 ++++++++++++++++++
 6 files changed, 256 insertions(+), 3 deletions(-)
 create mode 100644 tools/testing/selftests/riscv/hwprobe/prefetch.c

-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
