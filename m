Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C94C77B7A
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 13:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2S1ndeig2aL1BtDtCtJq9Cwdm9K3KcD5pomMfv6x04A=; b=j8MXMN15kK0JQ1
	k3Qj+XSM04CE2hLE0XOvsbREKkFWD1YtN15Yb6HfkKEpnv8iSZJpEK14BOJfravvwZTmMwD++jbKu
	Hrafdol4aLA+J5EPy8CU0/jITeufBXoZSeCXb6OIHgkwBsAPhjYKS3PAyItZmw4KJpS7dHtTr0W35
	Fuas3W1SKfZ12CDo3b8Wcvx4ZSLNRVkJMpRtQMIMrC2HvJBqqws4N18/gSVuMrCEL9YczdiQV2f2W
	QYeOkml738q+xxUadO7nMrjTCKvA0mQZL0hTfYEqs62H+hAMyKfjwi9XSmc6zCc3Mj7NYbYC64c+W
	mjkraGA/dGOrj8vNXYYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzdRO-00D2i9-0R;
	Thu, 18 May 2023 13:13:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzdRM-00D2gx-0R
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 13:13:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AC49164F67;
	Thu, 18 May 2023 13:13:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57254C433A8;
	Thu, 18 May 2023 13:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684415586;
	bh=bke8fOXFDjV1zILAGkdyjNPTOfL1ZR2nFogEIcEnLNk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GAMuo5pzwMOpvpmRdsBO4B//KtrUXd+imzrD5Mh3DDlBHufx0EB8V67w+qPAZFV1z
	 dsqcutlrg70o3jltbUb8FdXkMkK0WOJiUziB5H/f9M6hsBAsHfvZAoRpxHo/Hnk2D8
	 OMPuo3LdhV3xqOxptOa0dkbeZEbo4AKYiMSGU5osum00FOUUMxAffoFb8mVcVMhH8J
	 XeXitd2dU/FrKFfnDAI3T+wzVF1rTw/2U5SFNj5R+JMAsFe0U4ohwdoDLHRxLQ1L/i
	 uM55dAsOlzVyslN7sFhhHr/n12ybWoBzk/8MLAWevVB0GKpEtGKqK+xTAD0/MU2Z6q
	 0jXdFydmOx8Sg==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	tglx@linutronix.de,
	peterz@infradead.org,
	luto@kernel.org,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	chenhuacai@kernel.org,
	apatel@ventanamicro.com,
	atishp@atishpatra.org,
	mark.rutland@arm.com,
	bjorn@kernel.org,
	paul.walmsley@sifive.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	rppt@kernel.org,
	anup@brainfault.org,
	shihua@iscas.ac.cn,
	jiawei@iscas.ac.cn,
	liweiwei@iscas.ac.cn,
	luxufan@iscas.ac.cn,
	chunyu@iscas.ac.cn,
	tsu.yubo@gmail.com,
	wefu@redhat.com,
	wangjunqiang@iscas.ac.cn,
	kito.cheng@sifive.com,
	andy.chiu@sifive.com,
	vincent.chen@sifive.com,
	greentime.hu@sifive.com,
	corbet@lwn.net,
	wuwei2016@iscas.ac.cn,
	jrtc27@jrtc27.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Guo Ren <guoren@kerenl.org>
Subject: [RFC PATCH 12/22] riscv: s64ilp32: Add ELF32 support
Date: Thu, 18 May 2023 09:10:03 -0400
Message-Id: <20230518131013.3366406-13-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230518131013.3366406-1-guoren@kernel.org>
References: <20230518131013.3366406-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_061308_208555_C5254DC5 
X-CRM114-Status: GOOD (  11.35  )
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

From: Guo Ren <guoren@linux.alibaba.com>

Use abi_len to distinct ELF32 and ELF64 because s64ilp32 is xlen=64 and
abi_len=32 (__SIZEOF_POINTER__=4). And s64ilp32 is an ELF32 based the
same as s32ilp32.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kerenl.org>
---
 arch/riscv/include/uapi/asm/elf.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/uapi/asm/elf.h b/arch/riscv/include/uapi/asm/elf.h
index d696d6610231..962e8ec8fe05 100644
--- a/arch/riscv/include/uapi/asm/elf.h
+++ b/arch/riscv/include/uapi/asm/elf.h
@@ -24,7 +24,7 @@ typedef __u64 elf_fpreg_t;
 typedef union __riscv_fp_state elf_fpregset_t;
 #define ELF_NFPREG (sizeof(struct __riscv_d_ext_state) / sizeof(elf_fpreg_t))
 
-#if __riscv_xlen == 64
+#if __SIZEOF_POINTER__ == 8
 #define ELF_RISCV_R_SYM(r_info)		ELF64_R_SYM(r_info)
 #define ELF_RISCV_R_TYPE(r_info)	ELF64_R_TYPE(r_info)
 #else
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
