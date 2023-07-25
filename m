Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8494C0015E
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jul 2023 08:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R21I+nNUgrsyTg8AWZ+Fi8yKr9+tfy8hCiySuZNP+aQ=; b=1LWSbFQU+uajfP
	Wx+LZ9R7wwxv6kP8yzKrWl+C/cYgeEBzzIgrlJTIogxJDftTLkG5BNgnU5h8TfvoZvtMRzQAXF3fF
	3lXJ0FVZNQnR1DL50RoiTOLFDO6KpfZzdOQAdj/VOXiqk4a55DpM+IZICaZRf217v19voK/Nlw+DL
	8kLZGoOK4otzpMp733XLCvHOrB1Ouk2bz78qUOTvZw+/8zEZ/arTJrCbI0n8xahiZcj+C0Ia49FTH
	2OMFLdTETypsgbbHeivkbvYDaFgmYUHy9YmYJWu4Ig8VpSHelPh+ddn7E4zJy6BSKnV6efztJaG04
	1/0R6aUSyz4Omfqx9X4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qODfh-006nvh-0Z;
	Tue, 25 Jul 2023 08:45:33 +0000
Received: from [14.137.139.23] (helo=frasgout11.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qODfe-006ntc-26
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jul 2023 08:45:32 +0000
Received: from mail02.huawei.com (unknown [172.18.147.227])
	by frasgout11.his.huawei.com (SkyGuard) with ESMTP id 4R99L06KnPz9xrny
	for <linux-riscv@lists.infradead.org>; Tue, 25 Jul 2023 16:34:00 +0800 (CST)
Received: from A2101119013HW2.china.huawei.com (unknown [10.48.128.235])
	by APP2 (Coremail) with SMTP id GxC2BwB3Ijlwi79kXB38BA--.63760S4;
	Tue, 25 Jul 2023 09:45:05 +0100 (CET)
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
Subject: [PATCH v1 2/3] riscv/kexec: handle R_RISCV_ADD16 and R_RISCV_SUB16 relocation types
Date: Tue, 25 Jul 2023 10:44:26 +0200
Message-Id: <f75c763d86529a47eb23d46c5ef9bcbaaf118200.1690274483.git.petr.tesarik.ext@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1690274483.git.petr.tesarik.ext@huawei.com>
References: <cover.1690274483.git.petr.tesarik.ext@huawei.com>
MIME-Version: 1.0
X-CM-TRANSID: GxC2BwB3Ijlwi79kXB38BA--.63760S4
X-Coremail-Antispam: 1UD129KBjvJXoW7tFy7AF1rGw1DKr1rWr18Grg_yoW8GrW8pw
	4xGr48GFWDGr1Ik34xZaykC34rG3WDu3y3ta9Fy3W5Arn8JFy7CrZ2g3WUXF1jqr1FgFWS
	vFyIgr1rt3W8A3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmI14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
	e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
	8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
	jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0x
	kIwI1lc7CjxVAKzI0EY4vE52x082I5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17
	CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF
	0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMI
	IF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnI
	WIevJa73UjIFyTuYvjfUn3kuUUUUU
X-CM-SenderInfo: hshw23xhvd2x3n6k3tpzhluzxrxghudrp/
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_014530_971422_83E6857C 
X-CRM114-Status: UNSURE (   8.69  )
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

16-bit add and subtract relocation types are used by the purgatory code
when the kernel is built with CONFIG_RISCV_ALTERNATIVES. If they are not
handled, kexec_file_load(2) fails with:

 Unknown rela relocation: 34
 kexec_image: Error loading purgatory ret=-8

or later with:

 Unknown rela relocation: 38
 kexec_image: Error loading purgatory ret=-8

Note that alternatives are not yet handled in purgatory code; this patch
merely allows to load it.

Fixes: 838b3e28488f ("RISC-V: Load purgatory in kexec_file")
Signed-off-by: Petr Tesarik <petr.tesarik.ext@huawei.com>
Cc: Li Zhengyu <lizhengyu3@huawei.com>
Cc: stable@vger.kernel.org
---
 arch/riscv/kernel/elf_kexec.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/kernel/elf_kexec.c b/arch/riscv/kernel/elf_kexec.c
index 38390d3bdcac..f23fd419c402 100644
--- a/arch/riscv/kernel/elf_kexec.c
+++ b/arch/riscv/kernel/elf_kexec.c
@@ -444,6 +444,12 @@ int arch_kexec_apply_relocations_add(struct purgatory_info *pi,
 		case R_RISCV_SUB32:
 			*(u32 *)loc -= val;
 			break;
+		case R_RISCV_ADD16:
+			*(u16 *)loc += val;
+			break;
+		case R_RISCV_SUB16:
+			*(u16 *)loc -= val;
+			break;
 		/* It has been applied by R_RISCV_PCREL_HI20 sym */
 		case R_RISCV_PCREL_LO12_I:
 		case R_RISCV_ALIGN:
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
