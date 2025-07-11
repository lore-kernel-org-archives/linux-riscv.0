Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2FCFC83F22
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Jul 2025 11:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1KwcKFdLJaUMbxSlejiUfdImckoYaulmFfcd38zK5lg=; b=2DUxmcFXlIMP8c
	bKsr5RefGohJ9tMqWUTpTuXIQIV/2hwrfmcXKb/VKq108i3AvSswbwwJimTbBgfcruCkRgoh6pb0o
	0XiyCicm/9WzqhwmWvO/0/Dhz7x2h0k3TJI/Pf//t8P0UFoLUDGUpYr3IEsHT2YuOcNFricm7iGs/
	0D6GoAIFEVtq0EQAiNGN9B2XlCDO/04Ef5enXF+rkGO4oiax7OBkSMrYzT3OfeG4pxI6oLTYzoRAW
	lPes4ALD6R7KjH6MqRz7P0bXksY09+uIoC2j8qhNcitIMEtj2E37jk9+X+/+lo0i9sQN/3BWpOijC
	9iH2KJNBbCUS5z41vlUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaBib-0000000EZha-3rcI;
	Fri, 11 Jul 2025 11:15:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaAhb-0000000ERuW-3XNs
	for linux-riscv@bombadil.infradead.org;
	Fri, 11 Jul 2025 10:09:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=SjiWhzyqtm4aRS5AMalSXq7TZk2K7Vwdj40z3aQX2PI=; b=H+00AglGu1yE67KahaQGtSgft/
	f5dKu48ARqf5ssRejTQVzeZHRbe5efI+F7kHMW/CTDHDe0Z8ah0SU+x6++IFneBIX5POUTEQOZCjl
	o3tMACBhtkc4Wrgvr6dQesJX3mRXlwYG011T4kC8crKNx9RPJjs8fXCLEhKxH31FLmGWPjGrV5yXq
	y2rXq1cjzR90Z6Vfs24kvOU780vN/YeKOgy9ALHpakkYV8xFPfjZ+8wPamnwltE7BEQCEjUx5QajQ
	ElRaZn15GCXHNW2hJjxEavehrVLGXg/79K3lNaESTeHRC0pTWAms9A3uaCdzVj/BkYopTRSYpz50f
	U/t9Sd4w==;
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaAhV-00000009Eii-3TnQ
	for linux-riscv@lists.infradead.org;
	Fri, 11 Jul 2025 10:09:58 +0000
Received: from ubt.. (unknown [210.73.43.2])
	by APP-03 (Coremail) with SMTP id rQCowACXJ3nj4nBo8xESAw--.40582S2;
	Fri, 11 Jul 2025 18:09:39 +0800 (CST)
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
Subject: [PATCH V2 0/5] Add an optimization also raid6test for RISC-V support
Date: Fri, 11 Jul 2025 18:09:25 +0800
Message-Id: <20250711100930.3398336-1-zhangchunyan@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: rQCowACXJ3nj4nBo8xESAw--.40582S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Xry3JrWkXrW8WrW5Aw4UXFb_yoWfCFX_KF
	yrWF97Kw1DGF92gayayFs5AayUZrZ09ryrJ3WUGayUtr9rC392gws09w4xXF1UuFWrZF47
	Xr1rXF1xAr9F9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb-8YjsxI4VW3JwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z2
	80aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAK
	zVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_AcC_ZcWlOx
	8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
	MxkF7I0En4kS14v26r1q6r43MxkIecxEwVAFwVW8twCF04k20xvY0x0EwIxGrwCFx2IqxV
	CFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r10
	6r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxV
	WUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG
	6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr
	1UYxBIdaVFxhVjvjDU0xZFpf9x07jbxhdUUUUU=
X-Originating-IP: [210.73.43.2]
X-CM-SenderInfo: x2kd0wxfkx051dq6x2xfdvhtffof0/1tbiBwwAB2hw2WUj2gAAsR
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_110954_622501_8D25DC4C 
X-CRM114-Status: UNSURE (   8.21  )
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

The 1st patch is a cleanup;
Patch 2/4 is an optimization that takes Palmer's suggestion;
The last two patches add raid6test support and make the raid6 RVV code buildable on user space.

V2:
* Addressed comments from v1:
- Replaced one load with a move to speed up in _gen/xor_syndrome();
- Added a compiler error
- Dropped the NSIZE macro, instead of using the vector length;
- Modified has_vector() definition for user space;

Chunyan Zhang (5):
  raid6: riscv: Clean up unused header file inclusion
  raid6: riscv: replace one load with a move to speed up the caculation
  raid6: riscv: Add a compiler error
  raid6: riscv: Allow code to be compiled in userspace
  raid6: test: Add support for RISC-V

 lib/raid6/recov_rvv.c   |   9 +-
 lib/raid6/rvv.c         | 362 ++++++++++++++++++++--------------------
 lib/raid6/rvv.h         |  17 ++
 lib/raid6/test/Makefile |   8 +
 4 files changed, 211 insertions(+), 185 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
