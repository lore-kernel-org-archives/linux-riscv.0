Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 789B6CCD199
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 15:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m1V+lwzu99xaKUf1PUrGzRJHIC0mbQkj2FXBqzy8avs=; b=4J/qlxrO371ZEx
	xlt4magkIbXbfh/qt9BmozRR2e9UcZ5Arl9rzad7qSmyzyPyJl7jX8NAhy1omQLEUggSRM8uzLwHh
	LeSfD0jH9PpkTSK5/2ReKbo+4RQxlJ7J3hdiHFSadvOWmMNINWA7sZ4G59uIrV5Xp9eZfRqHMe1CA
	f76UrZfqsdwKzKGCuky5+JpcS7HmRRHFRJZR2SZPK+EBWRDmnU2OcPUWADyQl//ZZhHcX51Xryu/W
	hdmFKsDxkfxk59IdVFLC51nTTAW5fqcTUZh0e3AeFwnHIBY2MUBAbaq1dSISjt7m1rhzETLUUintS
	X8+aRBtmJT+tFtIjP07g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vArq6-0000000E8WG-1cqB;
	Mon, 20 Oct 2025 15:30:26 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vArq2-0000000E8Sx-1Rzo
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 15:30:24 +0000
Received: from Mobilestation.localdomain (unknown [183.6.59.216])
	by APP-01 (Coremail) with SMTP id qwCowAD3TaCCVfZo_ecYEg--.3482S2;
	Mon, 20 Oct 2025 23:30:13 +0800 (CST)
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
Subject: [PATCH v3 0/2] riscv: hwprobe: Add Zicbop support
Date: Mon, 20 Oct 2025 23:29:12 +0800
Message-ID: <20251020152924.64551-1-zihong.plct@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CM-TRANSID: qwCowAD3TaCCVfZo_ecYEg--.3482S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uw47ZF1rZrWfXFWUGw17KFg_yoW8Xw1fpF
	Z3Xrn3WF4DCr13Ca47Gw17Wr1rKw1vgrW8ZFy8WrykXrWYyry5J347trZ7AFWxJryagrZ0
	vF4fGrWY9F47A37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
X-CRM114-CacheID: sfid-20251020_083022_761491_C8FBC37A 
X-CRM114-Status: UNSURE (   7.48  )
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

Changes since v2:
------------------
- Squash the previous UAPI/kernel/doc patches(originally 1/4, 2/4, 3/4)
  into a single hwprobe patch for simplicity.
- Selftests:
  * Drop the `memory` clobber from the prefetch inline asm since it is
    pure hint.
  * Fix style problems. (Andrew Jones)
  * Merge the standalone prefetch test into 
    `tools/testing/selftests/riscv/hwprobe/cbo.c` (Andrew Jones)
  * Switch to `getopt_long` for option parsing. (Andrew Jones)

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


Yao Zihong (2):
  riscv: hwprobe: Expose Zicbop extension and its block size
  selftests/riscv: Add Zicbop prefetch test

 Documentation/arch/riscv/hwprobe.rst        |   8 +-
 arch/riscv/include/asm/hwprobe.h            |   2 +-
 arch/riscv/include/uapi/asm/hwprobe.h       |   2 +
 arch/riscv/kernel/sys_hwprobe.c             |   6 +
 tools/testing/selftests/riscv/hwprobe/cbo.c | 188 +++++++++++++++++---
 5 files changed, 175 insertions(+), 31 deletions(-)

-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
