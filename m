Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA5FCEACEF
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Nov 2025 16:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=d2pESlC9KlrHe4lR5AUXvP10QDZGvq1+E0tUzGNzCoY=; b=NaZ5qxpAdZdIGG
	9o5QcQ7V6Z72bpzkAMltvO7KUtQoM5b5cH8/D2GKCnB6UJo3zggQbOtsO/kKYug1nbn2nzWEtBreM
	t8zgvosnARFjEx2Gl4TSU37UT0He9kd3CQ7M4dOQivf0nByXIbuXKWB8ekxuY2k3f//DL4gvcnpyC
	1UOdoXve7UElhTkR8WA6Z/v2mOn5Lx5ZksblItTowqHHD2MmjZqIdQ2Odx7dXpCtr0m5IpXjd+YnB
	rO6Nd1uRWVYDZzv4HhMSj2u/mebK0aWB6hgkNG4EV4Lo9OQdbi25H5IFLokakzj5gef19tpE3kaO+
	gjIGU7L5N8DeKd4juKNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL2Au-0000000GP1q-2Rj3;
	Mon, 17 Nov 2025 16:33:56 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL2Ar-0000000GP1E-1t5f
	for linux-riscv@lists.infradead.org;
	Mon, 17 Nov 2025 16:33:56 +0000
Received: from Mobilestation.localdomain (unknown [183.6.59.216])
	by APP-05 (Coremail) with SMTP id zQCowABXT2BiThtpY5sTAQ--.27246S2;
	Tue, 18 Nov 2025 00:33:41 +0800 (CST)
From: Yao Zihong <zihong.plct@isrc.iscas.ac.cn>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: ajones@ventanamicro.com,
	zihong.plct@isrc.iscas.ac.cn,
	zihongyao@outlook.com,
	zhangyin2018@iscas.ac.cn,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH v4 0/2] riscv: hwprobe: Add Zicbop support
Date: Tue, 18 Nov 2025 00:32:38 +0800
Message-ID: <20251117163333.31182-1-zihong.plct@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CM-TRANSID: zQCowABXT2BiThtpY5sTAQ--.27246S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw1UKF4rCF1UXrWxXr45trb_yoW8uFWxpF
	Z3Xrn3GF4DGw1fCa47Cw1xWr1rKwn5WrW8JrW8ArykZw4UAryrJr1xKrZ3AFW7JrZxWrZ0
	qF4xWrWY9F4UA37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
	6r4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r1j6r
	4UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWI
	evJa73UjIFyTuYvjfUonmRUUUUU
X-Originating-IP: [183.6.59.216]
X-CM-SenderInfo: p2lk00vjoszunw6l223fol2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_083353_858944_85157CF6 
X-CRM114-Status: UNSURE (   8.20  )
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

Changes since v3:
------------------
- Dropped the test for Zicbop absence, as prefetch instructions are
  architecturally defined as hints and should never raise SIGILL.
- Removed `--sigsegv` and `--sigbus` options; these faults should never
  occur on compliant implementations, and the test now handles them
  unconditionally for reporting purposes. (Andrew Jones)
- Split the previous `--sigill` option into two explicit 
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
 tools/testing/selftests/riscv/hwprobe/cbo.c | 168 ++++++++++++++++----
 5 files changed, 155 insertions(+), 31 deletions(-)

-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
