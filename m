Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A93DC001E0
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jul 2023 08:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TMCWFd6NhElFHG51gqio7RtqnQhl+Fk4R+dMvgDLAfM=; b=ove3SCcA+us07q
	SwxfVRF22uIsGfFWmvJDPq/EsiLlK1GyVrmTy+QoWdCCdwq58Vp5gphViL+zUac6RRpJ1MuVZ/yqQ
	zyGr6zGyUlQ9hrOrzV0u0FEimsk1CUa1Ytzmmg69ikumGU3F4P1sq/1OFBG+B7Izh5W06/aWC9tV4
	xbADuSPoipe6PWE4zl0yBv5WOm2+M6GIFCp+GmetifzOQSqhQqZaQ6D6f5VQqqm98AnG65jf0/T8z
	u+DlBfascgztOY45hy1MAvWxbNTSx4a5wgdatzFzWcfVXb7/Dx/Dgq+ccsiil9aNEeu27CXLfFzOV
	dh2ZWNKxHhVjBd+znNLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qODfN-006nqG-1s;
	Tue, 25 Jul 2023 08:45:13 +0000
Received: from [14.137.139.154] (helo=frasgout12.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qODfJ-006npb-2X
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jul 2023 08:45:12 +0000
Received: from mail02.huawei.com (unknown [172.18.147.227])
	by frasgout12.his.huawei.com (SkyGuard) with ESMTP id 4R99HR4V6Zz9xtSG
	for <linux-riscv@lists.infradead.org>; Tue, 25 Jul 2023 16:31:47 +0800 (CST)
Received: from A2101119013HW2.china.huawei.com (unknown [10.48.128.235])
	by APP2 (Coremail) with SMTP id GxC2BwB3Ijlwi79kXB38BA--.63760S2;
	Tue, 25 Jul 2023 09:44:43 +0100 (CET)
From: Petr Tesarik <petrtesarik@huaweicloud.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Li Huafei <lihuafei1@huawei.com>,
	Liao Chang <liaochang1@huawei.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Alyssa Ross <hi@alyssa.is>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Kees Cook <keescook@chromium.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Li Zhengyu <lizhengyu3@huawei.com>,
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: Roberto Sassu <roberto.sassu@huaweicloud.com>,
	petr@tesarici.cz
Subject: [PATCH v1 0/3] RISC-V: Fix a few kexec_file_load(2) failures
Date: Tue, 25 Jul 2023 10:44:24 +0200
Message-Id: <cover.1690274483.git.petr.tesarik.ext@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: GxC2BwB3Ijlwi79kXB38BA--.63760S2
X-Coremail-Antispam: 1UD129KBjvdXoWruw1fGr48Cw17uFW3XFWrKrg_yoW3AFbEgF
	W8trZYqr1UtFn8XFZrKw4FqFW0krs5tFyjgwn8trW7t34UWry5Z3ZY9Fn2vr1UZrZ3W3sx
	ZrZ8Zr95Jr17tjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbh8FF20E14v26ryj6rWUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCY1x0264kExVAvwVAq07x20xyl42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87
	Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUnF4iUUUUU
X-CM-SenderInfo: hshw23xhvd2x3n6k3tpzhluzxrxghudrp/
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_014509_964262_9D6C45A1 
X-CRM114-Status: UNSURE (   7.03  )
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

From: Petr Tesarik <petr.tesarik.ext@huawei.com>

The kexec_file_load(2) syscall does not work at least in some kernel
builds. For details see the relevant section in this blog post:

https://sigillatum.tesarici.cz/2023-07-21-state-of-riscv64-kdump.html

This patch series handles additional relocation types and removes the need
to implement a Global Offset Table (GOT) for the purgatory.

Petr Tesarik (2):
  riscv/kexec: handle R_RISCV_ADD16 and R_RISCV_SUB16 relocation types
  riscv/purgatory: do not link with string.o

Torsten Duwe (1):
  riscv/kexec: handle R_RISCV_CALL_PLT relocation type

 arch/riscv/kernel/elf_kexec.c | 7 +++++++
 arch/riscv/purgatory/Makefile | 9 +--------
 2 files changed, 8 insertions(+), 8 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
