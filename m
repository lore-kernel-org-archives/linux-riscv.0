Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18046C71132
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 10:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7l2bG5ETrTOEUFCGVquFFTGQklUtQo+UCNOSD+Ev9ZA=; b=YkYCusDIIVYhyw
	yjiEUARivcxwo6MMEaPHp4YfG2Frb+o7pA7ogr8e6VPwHdba9+X0bv28mMkY9WegYEvnj3zw83q+Q
	xYdskxVx1s3QcUcr+PPeWgsCwSAmupHedy0TMi40Aolc5XkkMaPvtteo5koGln46k+h0r1Q8Nx/AT
	jdJFKXlT5G66dv5s5LrtGTY2xzoDABrAXmeLXFw3Jn0Q4D7xBPfb7tObhjWQcknUdR+tCuMBRsBq6
	c+Wr6cPHDPf1gXCrKE0XQTQdk1yuiFw8pCaWB5hpSNtZk91wlxRhGkBe3lgMet3wKhFhePWJh2Jn7
	3sO5m8K2WMGiIWb9nJnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOwg3-00000006Znq-1vju;
	Tue, 10 Jun 2025 10:57:59 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOvya-00000006T7h-3M6q
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 10:13:07 +0000
Received: from ubt.. (unknown [210.73.43.2])
	by APP-05 (Coremail) with SMTP id zQCowADXJRQjBUhoCfqKBQ--.1934S2;
	Tue, 10 Jun 2025 18:12:51 +0800 (CST)
From: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Song Liu <song@kernel.org>,
	Yu Kuai <yukuai3@huawei.com>
Cc: linux-riscv@lists.infradead.org,
	linux-raid@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chunyan Zhang <zhang.lyra@gmail.com>
Subject: [PATCH 0/4] Fix a segmentation fault also add raid6test for RISC-V support
Date: Tue, 10 Jun 2025 18:12:30 +0800
Message-Id: <20250610101234.1100660-1-zhangchunyan@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: zQCowADXJRQjBUhoCfqKBQ--.1934S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKr17Zr4UtrWkZFW3JrWkZwb_yoWfZwc_Wa
	yxGFWqkF17GFWvvay3AF1kA3y8Cr4avry8Z3W8Jay3Jry3CrW3KrsIgrW7X3WDZFy8ZFnr
	Xr1rAFWxZrnF9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb-8YjsxI4VWDJwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z2
	80aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAK
	zVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_AcC_ZcWlOx
	8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
	MxkF7I0En4kS14v26r1q6r43MxkIecxEwVAFwVW8twCF04k20xvY0x0EwIxGrwCFx2IqxV
	CFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r10
	6r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxV
	WUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG
	6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr
	1UYxBIdaVFxhVjvjDU0xZFpf9x07jjfOwUUUUU=
X-Originating-IP: [210.73.43.2]
X-CM-SenderInfo: x2kd0wxfkx051dq6x2xfdvhtffof0/1tbiBgoJB2hH3sPHqgAAsd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_031305_204833_4F514D7A 
X-CRM114-Status: UNSURE (   9.56  )
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

The first two patches are fixes. 
The last two are for userspace raid6test support on RISC-V.

The issue fixed in patch 2/4 was probably the same which was spotted by
Charlie [1], I couldn't reproduce it at that time.

When running raid6test in userspace on RISC-V, I saw a segmentation fault,
I used gdb command to print pointer p, it was an unaccessible address.

With patch 2/4, the issue didn't appear anymore.

[1] https://lore.kernel.org/lkml/Z5gJ35pXI2W41QDk@ghost/

Chunyan Zhang (4):
  raid6: riscv: clean up unused header file inclusion
  raid6: riscv: Fix NULL pointer dereference issue
  raid6: riscv: Allow code to be compiled in userspace
  raid6: test: add support for RISC-V

 lib/raid6/recov_rvv.c   |  9 +-----
 lib/raid6/rvv.c         | 62 +++++++++++++++++++++--------------------
 lib/raid6/rvv.h         | 15 ++++++++++
 lib/raid6/test/Makefile |  8 ++++++
 4 files changed, 56 insertions(+), 38 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
