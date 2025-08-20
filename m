Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D302CA0EFF
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Aug 2025 14:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dPwXcu/4Zmq6VwD/vXcG6HfcVm9W+bh1pKYX0ToF73M=; b=fx3zqtjQCwTU6s
	+dkV8MntXPprPSngqz7JcKaraKa4pZa/qba1E/ml3ULcxolQMJwzziB61zaHVcFzhiqf71+OrpjZa
	nWbR9niyx+jqXyMv12jVSvkrBMJnLKzRekdqLysxKeO0QswD6edWL/8/q9b8Gg3s+DN33K3tqMxsp
	G/w4ubQ3T6ZmyVQPTIypPQI9gSMJf0QCHGU+LEb1cuuTzO4C7xl3ykZRKBiJougwuOQC76hu2ubT/
	GuEZQ+0hXlLAmitbYtIFbxXp7mFtpc5OAS4LO6q7Ddq3ewQbODEUzLPXXNtQ4BEgk4bk9TrrFH6I7
	j/7S7tJ+hwxVmdKoSzRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uojw7-0000000E6n3-2AHZ;
	Wed, 20 Aug 2025 14:37:11 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoj7Z-0000000DsQa-2Rey
	for linux-riscv@lists.infradead.org;
	Wed, 20 Aug 2025 13:45:00 +0000
Received: from [127.0.0.2] (unknown [114.241.87.235])
	by APP-01 (Coremail) with SMTP id qwCowABHN6tT0aVogOTBDQ--.24665S2;
	Wed, 20 Aug 2025 21:44:52 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Subject: [PATCH 0/6] riscv: Add helpers use_alternative_{likely,unlikely}
Date: Wed, 20 Aug 2025 21:44:44 +0800
Message-Id: <20250820-riscv-altn-helper-wip-v1-0-c3c626c1f7e6@iscas.ac.cn>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEzRpWgC/yXMQQrCMBCF4auUWTuSpMRKryJdxDi1A20aJzEKp
 Xc32OX34P0bJBKmBH2zgVDhxGuo0KcG/OTCk5Af1WCUsepqFAonX9DNOeBEcyTBD0dUyo2ts9b
 4toP6jUIjf//d23BY6PWu+XyMcHeJ0K/LwrlvyuWsOxSvYdj3H9RSMLCUAAAA
X-Change-ID: 20250820-riscv-altn-helper-wip-00af3a552c37
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yury Norov <yury.norov@gmail.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Vivian Wang <wangruikang@iscas.ac.cn>, Vivian Wang <uwu@dram.page>, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Ayd=C4=B1n_Mercan?= <aydin@mercan.dev>
X-Mailer: b4 0.14.2
X-CM-TRANSID: qwCowABHN6tT0aVogOTBDQ--.24665S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uF1Uuw4UGF17Aw48Jw1kKrg_yoW8WFy5pF
	43Gr9xZFyrGFyfKFZIvr1jqr1Y9rZ3Kw1aqFnIgrykJw4avryUZr1qkryrAFyYqFykZ34I
	kr1rZw1rGF1DC3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIda
	VFxhVjvjDU0xZFpf9x0JUd-B_UUUUU=
X-Originating-IP: [114.241.87.235]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_064457_997822_52D2AC89 
X-CRM114-Status: UNSURE (   6.59  )
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
between two code paths with the alternative mechanism. Introduce helpers
similar to arm64's alternative_has_cap_{likely,unlikely} for this, and
convert the existing code to use it.

I did not use the name alternative_has_cap_{likely,unlikely} since riscv
alternatives are not all CPU capabilities.

In each case, I have tried to preserve the existing logic while picking
between "likely" and "unlikely".

These patches are also available at:

https://github.com/dramforever/linux/tree/riscv/altn-helper/v1

---
Vivian Wang (6):
      riscv: Introduce use_alternative_{likely,unlikely}
      riscv: pgtable: Convert to use_alternative_unlikely
      riscv: checksum: Convert to use_alternative_likely
      riscv: hweight: Convert to use_alternative_likely
      riscv: bitops: Convert to use_alternative_likely
      riscv: cmpxchg: Convert to use_alternative_likely

 arch/riscv/include/asm/alternative-macros.h |  73 ++++++++++++++++
 arch/riscv/include/asm/arch_hweight.h       |  42 ++++------
 arch/riscv/include/asm/bitops.h             | 112 +++++++++++--------------
 arch/riscv/include/asm/checksum.h           |  13 +--
 arch/riscv/include/asm/cmpxchg.h            | 125 ++++++++++++++--------------
 arch/riscv/include/asm/pgtable.h            |  15 ++--
 arch/riscv/lib/csum.c                       |  65 ++++++---------
 arch/riscv/mm/pgtable.c                     |  22 +++--
 8 files changed, 247 insertions(+), 220 deletions(-)
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
