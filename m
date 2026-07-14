Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5865C44501
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 07:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OTv4Z93XDs2NDqWNzUYQE/UiQXazAs48XN74BryiuhU=; b=G+BFuapkzr6V1t
	UlmCYUSQZ22uJ4PoEJdjWQNi+GcJWxFOfg1/VpLGsa8VKscHlg3LfECQhdf25lfXB2VmAHJ53cgq8
	rIWsYBWQcknMdN/R26OQf+S03cmCPbhPSNqROqmbf7IAoohV75hJnkPNUWETQkZK4j502rwu8WwsJ
	HGuyXF+nGepDP5nZN9x3iG0ST1uYUCZhXiJ1FJRaSU8p8r0TVJXcPsAkcyYTNjeVz9ou/10Ex+xfI
	yqCTCSRsNzt/gn7D978TaS7BhizkqRAI7Z64o6urdTTdCg/V0+EPORFWWDhZkhmZhY+auqkHdHspN
	hNWjljnMh2v1byBu1D0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjXpk-0000000BDeV-4Bwr;
	Tue, 14 Jul 2026 07:45:41 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjXpi-0000000BDdO-31lo
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jul 2026 07:45:40 +0000
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.101.100])
	by APP-05 (Coremail) with SMTP id zQCowABXq84X6VVqEs8pGA--.61698S2;
	Tue, 14 Jul 2026 15:45:28 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	MoeLeak <i@leak.moe>
Subject: [PATCH v2 0/5] Add remaining IO expansions on Lichee Pi 4A
Date: Tue, 14 Jul 2026 15:45:10 +0800
Message-ID: <20260714074515.1959352-1-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CM-TRANSID: zQCowABXq84X6VVqEs8pGA--.61698S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZr17KF1kAw13KrWkCw47XFb_yoWfGwbEva
	4IgFWayw4rJFWftFW3Jr18WrZ5GrW7uw1UCFy8Zr17Ja4DuFs8WFWqga4Ygr1FvrWSkFn2
	kr1Utryxtr9rZjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb3kFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x0JUZYFZUUUUU=
X-Originating-IP: [112.94.101.100]
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_004539_131879_FCD499D8 
X-CRM114-Status: UNSURE (   6.11  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Icenowy Zheng <zhengxingda@iscas.ac.cn>, Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This patchset is split off the "Add TH1520 USB support" patchset,
dedicating to enable the IO expansion chips, because the situation
becomes complex when one of them (but not all) was added for Wi-Fi
support.

I fixed a small issue of the existing I2C1 device node, and then all
original patches are aligned with the existing I2C1 node for
consistency.

Emil Renner Berthing (2):
  riscv: dts: thead: Add IO labels for the IO expansion on I2C1
  riscv: dts: thead: Add remaining Lichee Pi 4A IO expansions

Icenowy Zheng (2):
  riscv: dts: thead: th1520: remove pclk for I2C1
  riscv: dts: thead: lpi4a: sort nodes

Thomas Bonnefille (1):
  riscv: dts: thead: Add TH1520 I2C nodes

 .../boot/dts/thead/th1520-lichee-pi-4a.dts    | 141 +++++++++++++-----
 arch/riscv/boot/dts/thead/th1520.dtsi         |  53 ++++++-
 2 files changed, 157 insertions(+), 37 deletions(-)

-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
