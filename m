Return-Path: <SRS0=v94U=NR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2251C432BE
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Aug 2021 14:17:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 933B060E90
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Aug 2021 14:17:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 933B060E90
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I8uusAGIt/Gb1l1+UyAHz3y1HWr+zjLhAakZq+3DQwQ=; b=t+ZtFeoRXNFhLF
	yIoLz9eoEx7b7jqHPyRfXKBWT1jrjGx19vaok34yumjRcmV6tzsWzipCbI7tDIrac3M4krJnYPnkZ
	d7HWCXLbkdIfpiXfjr3QkvMDukwzt52Eqc0/sYXTJLTrFY0n5y/E6vxbjeQu5lv1TtKhN3q9B6Q1M
	MOAWSceQVpRVCC12jMeew1D+tobhCAXTNsPQTYE8guG10MSKJ03vdNn7A/QXk1YUMsxBo+vtdZBO0
	HW9JEKGNxUoC27gX4J2BHf0dk8C7Pk5l7bbrM9Wm3q/qqPYI/hIZUlTE/ETLEnt5lUY0RY+qsqdCx
	ZYkRug6Qe0NUxfT431pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJGBg-00ALPC-Cy; Thu, 26 Aug 2021 14:17:00 +0000
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJGBR-00ALHn-Rr
 for linux-riscv@lists.infradead.org; Thu, 26 Aug 2021 14:16:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding; bh=8LeG+ayM3U5NRwK0VVcdLpHKizOeH76kOi
 ceUiVWas0=; b=HPVDEYvgzIeQaQBcLQe/qg9/rtz9zMAoAl7mr+2F72vkjHIoSe
 iQsGBdzrIRKCD7Su281jC1YWmH/lC+WM1EPvpP/xK19hZ/qucYtv6FcDUxE2bMe9
 vEwRaq5nCyzZ3pw4xrMqoNia9+6NMtGeJuh+pPKowLW0Mc5yC/G+RN0YE=
Received: from xhacker (unknown [101.86.20.15])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygBH+PxMoidhNqTGAA--.59142S2; 
 Thu, 26 Aug 2021 22:16:44 +0800 (CST)
Date: Thu, 26 Aug 2021 22:10:29 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] riscv: Enable BUILDTIME_TABLE_SORT
Message-ID: <20210826221029.39a77a02@xhacker>
In-Reply-To: <20210826220952.77a68a9e@xhacker>
References: <20210826220952.77a68a9e@xhacker>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygBH+PxMoidhNqTGAA--.59142S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GFy3Cr1fJw1DKr1UGFWfKrg_yoWDtwc_K3
 s7K3s7XFy3X3WSva4xWrs5Zr1YkayvgFyfArWSvry2934Uu3yfJasxtF15Wr18Wa1DXr4x
 u392qr1DGr1xXjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbrxYjsxI4VW3JwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
 6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
 8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0
 cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z2
 80aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAK
 zVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx
 8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7VAKI48JMxC20s026xCa
 FVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_Jr
 Wlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j
 6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Gr
 0_Zr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUv
 cSsGvfC2KfnxnUUI43ZEXa7IU8mhF7UUUUU==
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210826_071646_364317_27A0AF1D 
X-CRM114-Status: UNSURE (   8.24  )
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

From: Jisheng Zhang <jszhang@kernel.org>

Enable BUILDTIME_TABLE_SORT to sort the exception table at build time
rather than during boot.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/Kconfig  | 1 +
 scripts/sorttable.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 80a7aa9f74de..570689d3889b 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -40,6 +40,7 @@ config RISCV
 	select ARCH_WANT_FRAME_POINTERS
 	select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
 	select BINFMT_FLAT_NO_DATA_START_OFFSET if !MMU
+	select BUILDTIME_TABLE_SORT if MMU
 	select CLONE_BACKWARDS
 	select CLINT_TIMER if !MMU
 	select COMMON_CLK
diff --git a/scripts/sorttable.c b/scripts/sorttable.c
index 0ef3abfc4a51..f355869c65cd 100644
--- a/scripts/sorttable.c
+++ b/scripts/sorttable.c
@@ -349,6 +349,7 @@ static int do_file(char const *const fname, void *addr)
 	case EM_ARM:
 	case EM_MICROBLAZE:
 	case EM_MIPS:
+	case EM_RISCV:
 	case EM_XTENSA:
 		break;
 	default:
-- 
2.32.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
