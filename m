Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A550C7EE2E
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 11:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=H8mxwwxZXF4N40dhHgIPm39QoyLqSe3R6l2/yfdgOZI=; b=T8J9XmVKL2QyyZ
	T/lJdj0eqRHv+AY4B/C/Jujsdy8V6boHzkw0pCiku+GMVDzMEnOv8pA1xBOLlC6UXXpy7Xf2S7CQF
	luajqAFwjDacv7NuJIyR09vB88Jtyd0azZCNepjwAX6cSGzb1yeFzUMs+hEJBhcwiwAnpaGdSDnwz
	Bi24BjNIwti3VAdiMpQEqZ46aUSuJe6dK45tNA8A2h4WHtLBxcK4VdbHPdsNHF4mOzMs9uDUXgYH7
	ZlXiNP6a7mgG8PNX27Wrc+cty1xcAzUNIIf/iIcYbl1uU0Ih79KBNuQ4sfPfOo57AEepHHU/wCTkF
	DRSCUs8J54kJ7fIbTkGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8fJ7-003hNz-0w;
	Mon, 12 Jun 2023 11:01:57 +0000
Received: from mail.loongson.cn ([114.242.206.163])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8fJ1-003hIb-2z;
	Mon, 12 Jun 2023 11:01:55 +0000
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxrOoU+4Zk_rUDAA--.8006S3;
	Mon, 12 Jun 2023 19:01:40 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxfcoQ+4Zk19QVAA--.54161S2;
	Mon, 12 Jun 2023 19:01:37 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-arch@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn
Subject: [PATCH v1 0/2] Unify uapi bitsperlong.h
Date: Mon, 12 Jun 2023 19:01:32 +0800
Message-Id: <1686567694-20099-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf8AxfcoQ+4Zk19QVAA--.54161S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7WF17Jr1xtF4fKrWkCw1fZrc_yoW8CFW5pF
	93ArnxWF45CrWayw15Ja4jqryUJ3yxGr4jgay2qry8GrWIvF1UJrsYkrs7Ca47JayUXFn5
	ur93Gry5G3WDK3cCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jOuc_UUUUU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_040152_639046_397B8012 
X-CRM114-Status: UNSURE (   6.23  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

v1:
  -- Rebase on 6.4-rc6
  -- Only unify uapi bitsperlong.h for arm64, riscv and loongarch
  -- Remove uapi bitsperlong.h of hexagon and microblaze in a new patch

Here is the RFC patch:
https://lore.kernel.org/linux-arch/1683615903-10862-1-git-send-email-yangtiezhu@loongson.cn/

Tiezhu Yang (2):
  asm-generic: Unify uapi bitsperlong.h for arm64, riscv and loongarch
  tools arch: Remove uapi bitsperlong.h of hexagon and microblaze

 arch/arm64/include/uapi/asm/bitsperlong.h          | 24 -------------------
 arch/loongarch/include/uapi/asm/bitsperlong.h      |  9 --------
 arch/riscv/include/uapi/asm/bitsperlong.h          | 14 -----------
 include/uapi/asm-generic/bitsperlong.h             | 10 ++++++++
 tools/arch/arm64/include/uapi/asm/bitsperlong.h    | 24 -------------------
 tools/arch/hexagon/include/uapi/asm/bitsperlong.h  | 27 ----------------------
 .../arch/loongarch/include/uapi/asm/bitsperlong.h  |  9 --------
 .../arch/microblaze/include/uapi/asm/bitsperlong.h |  2 --
 tools/arch/riscv/include/uapi/asm/bitsperlong.h    | 14 -----------
 tools/include/uapi/asm-generic/bitsperlong.h       | 11 +++++++++
 tools/include/uapi/asm/bitsperlong.h               |  6 -----
 11 files changed, 21 insertions(+), 129 deletions(-)
 delete mode 100644 arch/arm64/include/uapi/asm/bitsperlong.h
 delete mode 100644 arch/loongarch/include/uapi/asm/bitsperlong.h
 delete mode 100644 arch/riscv/include/uapi/asm/bitsperlong.h
 delete mode 100644 tools/arch/arm64/include/uapi/asm/bitsperlong.h
 delete mode 100644 tools/arch/hexagon/include/uapi/asm/bitsperlong.h
 delete mode 100644 tools/arch/loongarch/include/uapi/asm/bitsperlong.h
 delete mode 100644 tools/arch/microblaze/include/uapi/asm/bitsperlong.h
 delete mode 100644 tools/arch/riscv/include/uapi/asm/bitsperlong.h

-- 
2.1.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
