Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A769ECEE339
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Nov 2025 16:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1QzIHJdCiZZgeYl8Xa9WBW+q98Y7rwhP1wIqti2BkDk=; b=r4WlOGeCeMH5q7
	MA6U191svDHQskfDX7YzluO3iTxgheuU+b0WjplMj1hdtpt0fZG4gOZMsyOAzKB5Pv6qED3ZTGmJy
	12PbNLyozO1PoZ3TfS7SOmtidmqxnfWbdS0GNuryK1qAGzg6LfeYNLhs8Tt6n8WXNmI4M8ENrBvia
	mePdAZ0KloFKbQM3vT/R2emIlKzjpBEFs9ZfoNXVjjK0E/Wdnm4zGXuRUs5q6Ji2wpgdqFzwmNFav
	EGzL2nupveE3H3sYU0uM+vs151+1W+9ueUnZ45s38ssshfT9J9m1s9DPELYpYK6KUU7xF2nF+akIj
	GuojmQ4OMM97dzlEug+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOWR-00000000ixI-01op;
	Tue, 18 Nov 2025 16:25:39 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOWN-00000000iwL-0y0H
	for linux-riscv@lists.infradead.org;
	Tue, 18 Nov 2025 16:25:37 +0000
Received: from Mobilestation.localdomain (unknown [183.6.59.216])
	by APP-03 (Coremail) with SMTP id rQCowAAXpdffnRxpmMQ0AQ--.31198S2;
	Wed, 19 Nov 2025 00:25:22 +0800 (CST)
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
Subject: [PATCH v5 0/2] riscv: hwprobe: Add Zicbop support
Date: Wed, 19 Nov 2025 00:23:23 +0800
Message-ID: <20251118162436.15485-1-zihong.plct@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CM-TRANSID: rQCowAAXpdffnRxpmMQ0AQ--.31198S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw4ktr43uFWfGr4DAw17Awb_yoW5Jr13pF
	Z3XrnxGF4DGw1fCa9rCw1xWr1rKwn5WrWUJrW8ArykZa1UAryrJw1xKrZ3AFW7ArZxWr4Y
	vF4xWa15uFWDA37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
X-Originating-IP: [183.6.59.216]
X-CM-SenderInfo: p2lk00vjoszunw6l223fol2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_082535_646152_F173F444 
X-CRM114-Status: UNSURE (   9.01  )
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

Changes since v4:
------------------
- Fixed style problems. (Andrew Jones)
- Updated the selftest gating logic: the cbo.inval test is now also
  enabled when `--zicboz-raises-sigill` or `-z` is supplied, instead of
  being skipped when these flags are present. (Andrew Jones)

Changes since v3:
------------------
- Dropped the test for Zicbop absence, as prefetch instructions are
  architecturally defined as hints and should never raise SIGILL.
- Removed `--sigsegv` and `--sigbus` options; these faults should never
  occur on compliant implementations, and the test now handles them
  unconditionally for reporting purposes. (Andrew Jones)
- Split the previous --sigill option into two explicit 
  `--zicbom-raises-sigill` and `--zicboz-raises-sigill` to enable
  extension-specific tests. (Andrew Jones)

Changes since v2:
------------------
- Squashed the previous UAPI/kernel/doc patches(originally 1/4, 2/4, 3/4)
  into a single hwprobe patch for simplicity.
- Selftests:
  * Dropped the `memory` clobber from the prefetch inline asm since it is
    pure hint.
  * Fixed style problems. (Andrew Jones)
  * Merged the standalone prefetch test into 
    `tools/testing/selftests/riscv/hwprobe/cbo.c` (Andrew Jones)
  * Switched to `getopt_long` for option parsing. (Andrew Jones)

Changes since v1:
------------------
- Bumped RISCV_HWPROBE_MAX_KEY (modified 1/4).
- Added documentation for the Zicbop hwprobe bit/key (new 3/4).
- Added a selftest(prefetch.c) for Zicbop (new 4/4).

Hi all,

This patch adds UAPI and kernel plumbing to expose the Zicbop extension
presence and its block size through hwprobe. The interface mirrors
Zicbom/Zicboz. This allows userspace to safely discover and optimize
for Zicbop when available.

Background: Zicbop is mandated by the RVA22U64 profile. Downstream may
combine the presence bit with ZICBOP_BLOCK_SIZE to make profile-level
policy decisions or enable Zicbop-specific optimizations.

Yao Zihong (2):
  riscv: hwprobe: Expose Zicbop extension and its block size
  selftests/riscv: Add Zicbop prefetch test

 Documentation/arch/riscv/hwprobe.rst        |   8 +-
 arch/riscv/include/asm/hwprobe.h            |   2 +-
 arch/riscv/include/uapi/asm/hwprobe.h       |   2 +
 arch/riscv/kernel/sys_hwprobe.c             |   6 +
 tools/testing/selftests/riscv/hwprobe/cbo.c | 165 ++++++++++++++++----
 5 files changed, 152 insertions(+), 31 deletions(-)

-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
