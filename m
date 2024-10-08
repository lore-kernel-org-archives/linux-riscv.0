Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF6CCCEF147
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Oct 2024 09:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9xGkIJ0+5ETXWPX67QqOWzKEcNBUtz1Vd3iRlPOzwqE=; b=16LMBQgswSgPgY
	xYmBvP/Fr77Gh6E46qsu7h4Xa4gojSRWIDGU/hkq/Je0tjXXsXFaEn0T5pPyuX3L+w1SIQ6+OmnVq
	Vh85gYx/dkiCZfnlOgyekIPHH/9Xar6j7p/Suk2MlMwDVJEc37L+AMlnJ8cBA1IHdpFv348X0NLii
	tL7XO54kgJz7itfcug5pnIuCdERrdl9hY9QOfRbNBHrA1XXt5wNIngy0YAPrGd4UURh3bEVM5P080
	5joDiRrqT6C7wGe0v/7roInwmrqnpX8KdExfVz9/0VxtQu3X4bA/gyqDwPGI91RvLK6SSigVbNIrb
	1WpeAOyXBOV6VOHW9rxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy6kG-00000005LVt-0yzp;
	Tue, 08 Oct 2024 09:43:08 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy6jI-00000005LL0-3IBF
	for linux-riscv@lists.infradead.org;
	Tue, 08 Oct 2024 09:42:11 +0000
Received: from ubt.. (unknown [210.73.53.31])
	by APP-01 (Coremail) with SMTP id qwCowAAH7nxf_gRnEkoDBQ--.54511S2;
	Tue, 08 Oct 2024 17:41:52 +0800 (CST)
From: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Charlie Jenkins <charlie@rivosinc.com>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chunyan Zhang <zhang.lyra@gmail.com>
Subject: [PATCH V2 0/4] A few fixes for RISC-V
Date: Tue,  8 Oct 2024 17:41:37 +0800
Message-Id: <20241008094141.549248-1-zhangchunyan@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: qwCowAAH7nxf_gRnEkoDBQ--.54511S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtF1DZw13Wr43Kw1xWw15Arb_yoWxKwb_WF
	WxK3s7GF4kua48CFy3X3W5WrZYy3yF9FWkAryYqr93AryUZF15JF4ktr1jvw1ru3y5Ja9F
	vFW5ta93Zr129jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb-AYjsxI4VWxJwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4IIrI8v6xkF7I0E8cxan2IY
	04v7MxkF7I0En4kS14v26r1q6r43MxkIecxEwVAFwVW8uwCF04k20xvY0x0EwIxGrwCFx2
	IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v2
	6r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67
	AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IY
	s7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr
	0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jzLvtUUUUU=
X-Originating-IP: [210.73.53.31]
X-CM-SenderInfo: x2kd0wxfkx051dq6x2xfdvhtffof0/1tbiDAcEB2cExhT4rwAAsu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_024209_220126_0EB11080 
X-CRM114-Status: UNSURE (   6.38  )
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

These patches are all simple fixes with no strong dependency though,
I hope that making them a patchset will be more convenient for merge.

The patchset are based on v6.12-rc2.

Chunyan Zhang (4):
  riscv: Remove unused GENERATING_ASM_OFFSETS
  riscv: Remove duplicated GET_RM
  selftest/mm: Fix typo in virtual_address_range
  selftests/mm: skip virtual_address_range tests on riscv

 arch/riscv/kernel/asm-offsets.c                    |  2 --
 arch/riscv/kernel/traps_misaligned.c               |  2 --
 tools/testing/selftests/mm/Makefile                |  2 ++
 tools/testing/selftests/mm/run_vmtests.sh          | 10 ++++++----
 tools/testing/selftests/mm/virtual_address_range.c |  4 ++--
 5 files changed, 10 insertions(+), 10 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
