Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE8FAEB64D7
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jun 2023 08:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CP7R9W548xlIaHmrvwbtPikZVz/FlQPH6WY1bigf0Mo=; b=IMSgKdlwT+KndO
	opHfqfrBqOf4LHzNkueerIeb6Bn/1+1MQ2thF8yUQM3D5xYDxUoTsL/K0PsvnXchCTuYoBqtquhyg
	DriGcawso1x1Ls/vaQNIgu99GpDTH8usVm7rfVovRY233EFrh2ekmvW5D22RPgi05bLbaI6x75Reb
	7N12UW+5RtDZx0qoqghg1ya3FWGPcqrTZvWups7aV7m4HlHnxWcD5EN6O2qcBvFblEUb+aI8E12/S
	LA/597bhEH81SpXFWepPAsPmitVUxasCaGeBJ1Adkc3fTM63QLm9XBE5EkugsB1kzrV5KKUH+D6s3
	MeTzCV9Xi2ttqfYj1rYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBtNP-00Dijv-1n;
	Wed, 21 Jun 2023 08:39:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBtNE-00Digc-20;
	Wed, 21 Jun 2023 08:39:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=B/kQWkjvna+zET+D/Chla9iq3voJ38M0hXLOA0/SIH4=; b=Vjy82Iyd513mCKgd6nvocgkz0s
	gWrf1WN66Kb8nO5PHeG4ql5VhEp7O2dbOxSBeltSr+Uvguvfch1tSkRk9LucckLAJyGZIcv8comjU
	aW4KUAF47IVeyknNKeNwJmy5saghhLHar6f9ZB1Uq1dyfcatmO6YGmkfrsJXw0GmzzgFCwSp7hmEz
	C+WSXkWmBnppNGdtd5YACwlKFwXHxQzFfIojLkLG2s56y4vaNjLneZndm9OtPH+zh4RcgeTM6x1ub
	abJektdWJZ/SRGLphqyygHcuPJCn6XLkyn8xfzOw6dhO4rRBpWEqlhYW92lt4jAmYFIQalDpoaiHT
	62Or0PNg==;
Received: from mail.loongson.cn ([114.242.206.163])
	by desiato.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBtN8-00HJss-11;
	Wed, 21 Jun 2023 08:39:30 +0000
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Dxvscvt5JkqxEAAA--.111S3;
	Wed, 21 Jun 2023 16:39:11 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Ax3c4st5JkmlAAAA--.2097S2;
	Wed, 21 Jun 2023 16:39:09 +0800 (CST)
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
Subject: [PATCH v2 0/2] Unify uapi bitsperlong.h
Date: Wed, 21 Jun 2023 16:39:06 +0800
Message-Id: <1687336748-4898-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf8Ax3c4st5JkmlAAAA--.2097S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Zr48Jr1fWw43WFWDury7twc_yoW8ur1DpF
	93ArnxWF45CrWayw1rta4jqryUJ397Gr4jgay2qry8XrWIvF1UGrsYkrs3Ca47JayUXFn5
	urn3Gry5G3WDK3XCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU2DUUUUUUU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_093928_082252_AE02579A 
X-CRM114-Status: UNSURE (   7.65  )
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

v2:
  -- Check __CHAR_BIT__ and __SIZEOF_LONG__ rather than
     __aarch64__, __riscv, __loongarch__, thanks Ruoyao
  -- Update the code comment and commit message

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
 include/uapi/asm-generic/bitsperlong.h             | 11 +++++++++
 tools/arch/arm64/include/uapi/asm/bitsperlong.h    | 24 -------------------
 tools/arch/hexagon/include/uapi/asm/bitsperlong.h  | 27 ----------------------
 .../arch/loongarch/include/uapi/asm/bitsperlong.h  |  9 --------
 .../arch/microblaze/include/uapi/asm/bitsperlong.h |  2 --
 tools/arch/riscv/include/uapi/asm/bitsperlong.h    | 14 -----------
 tools/include/uapi/asm-generic/bitsperlong.h       | 12 ++++++++++
 tools/include/uapi/asm/bitsperlong.h               |  6 -----
 11 files changed, 23 insertions(+), 129 deletions(-)
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
