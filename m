Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7FF5D6D25A
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Nov 2024 03:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+/HrWtxLpKXg/NtJUxNeKcUb9DRj0Vg47l6DtnPPUIY=; b=3yID6nwGbZ7xbI
	oEmcLuN9Bq/L5ZIBuJ6BC9UwsOsIg8w9qO7GGiG+nqMzYQokdfz7y+VXEAo6oLi29J7vjpsbXnp2D
	0h62gQ9Ih4/2ifzRDaqVTZAxM2RjC6rSzyUtrbnVarSUYaRsZpjyqHncuzQNR3oPCXWmxwV54XwA+
	M4/Ff9uk5gbszW+TE6unjSuQ2yg1X/JvWIEGfXXJxDjmX9QFwJSA1lti3GuZAPlhD9mkJOFc/Ja2l
	Isdg/4LcOkkvzA3atxkkjjntVgh2qQJLAw94xR4dm4V0nevHV3a4KKpNfn89f0V/43vLxP9keC30Q
	3pJCWU9fd2c1vJKwDtMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGV7l-0000000Eblv-0NM7;
	Thu, 28 Nov 2024 03:23:25 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGV7i-0000000EbkH-3Gg1;
	Thu, 28 Nov 2024 03:23:24 +0000
Received: from zq-Legion-Y7000.. (unknown [180.111.103.148])
	by APP-05 (Coremail) with SMTP id zQCowAAXHkob4kdnsFUcBg--.352S2;
	Thu, 28 Nov 2024 11:23:08 +0800 (CST)
From: zhouquan@iscas.ac.cn
To: anup@brainfault.org,
	ajones@ventanamicro.com,
	atishp@atishpatra.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH 0/4] RISC-V: KVM: Allow Svvptc/Zabha/Ziccrse exts for guests
Date: Thu, 28 Nov 2024 11:20:53 +0800
Message-Id: <cover.1732762121.git.zhouquan@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: zQCowAAXHkob4kdnsFUcBg--.352S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYt7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E
	6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28Cjx
	kF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8I
	cVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z2
	80aVCY1x0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26F4j6r4UJw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAG
	YxC7M4IIrI8v6xkF7I0E8cxan2IY04v7M4kE6xkIj40Ew7xC0wCF04k20xvY0x0EwIxGrw
	CF54CYxVCY1x0262kKe7AKxVWUtVW8ZwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GF
	ylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUZ
	yCJUUUUU=
X-Originating-IP: [180.111.103.148]
X-CM-SenderInfo: 52kr31xxdqqxpvfd2hldfou0/1tbiBgoPBmdHkZDh4gAAsn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_192323_198208_F2226BC4 
X-CRM114-Status: UNSURE (   3.10  )
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

From: Quan Zhou <zhouquan@iscas.ac.cn>

Advertise Svvptc/Zabha/Ziccrse extensions to KVM guest
when underlying host supports it.

Quan Zhou (4):
  RISC-V: KVM: Allow Svvptc extension for Guest/VM
  RISC-V: KVM: Allow Zabha extension for Guest/VM
  RISC-V: KVM: Allow Ziccrse extension for Guest/VM
  KVM: riscv: selftests: Add Svvptc/Zabha/Ziccrse exts to get-reg-list
    test

 arch/riscv/include/uapi/asm/kvm.h                |  3 +++
 arch/riscv/kvm/vcpu_onereg.c                     |  6 ++++++
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 12 ++++++++++++
 3 files changed, 21 insertions(+)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
