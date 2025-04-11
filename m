Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39475C36010
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Apr 2025 07:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tQJpm8kJ8xPhnuq9CRoibwmfqfe0zYO0h3CeQK/8RtQ=; b=lSPZYf82I2FLT4
	bD1eMSSOpvFHLqPMWKllC48Qbid3G1ExfnINblDfmA7HrLuloNGcRsa1PrjYNyfIy+/aSAVUEnznj
	JM0PLJZj/N8TIJUiKiT2z+sA/ywxBVs3lGwFNVJbnTKRIrOTv8LbdAne1IjV7IbVGABAJXoPuU1Z1
	2tLmQSDIj0exK1AsXjgguKW+WU6sdR4nNhj0zCDxdRoWYg7WM6RMur4rZUE1sYrmCkwXldQ9QcbBg
	JcJ5YWtrAoAv110VMNxVr86M00u62KV2XdNbB/Vb9Yn5T/a01hKG2fx/6+KUx0sT4xBSPNZygKZe+
	1k8hJOjs5/9mjjnhy5Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u38qv-0000000Cslq-1LGB;
	Fri, 11 Apr 2025 07:31:05 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u38qD-0000000Cru4-2LEU
	for linux-riscv@lists.infradead.org;
	Fri, 11 Apr 2025 07:30:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1744356560;
	bh=uxOm8SHlcWyXtuWQU8WpjfV173mQ5imseKmaQ1ocr88=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=D9oHE0fh6+FHg4F59HaiX+S7cuQhV/h/ToLgup8qbkjmTLVLMdpVD76kPX4PXWiTa
	 plByWVk+Nj9fF1y9QMbJLZvaZGP7zKlY1mWWz5jAATbePWhK16l6PEcaGraWROnbJ7
	 sIDRV5eGfjDQQqQk1GB4cNZRtoCZL5ZbzUWktt3c=
X-QQ-mid: zesmtpip3t1744356550t30aef910
X-QQ-Originating-IP: 5kBarLaAeNoTnPMhtr/u+NgnIMHwSLfBXYa7qBdeBa4=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 11 Apr 2025 15:29:08 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 14869536792913685592
EX-QQ-RecipientCnt: 14
From: WangYuli <wangyuli@uniontech.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: wangyuli@uniontech.com,
	chenhuacai@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	vincent.chen@sifive.com,
	palmerdabbelt@google.com,
	samuel.holland@sifive.com,
	zhanjun@uniontech.com,
	niecheng1@uniontech.com,
	guanwentao@uniontech.com
Subject: [PATCH v4 0/2] riscv: Rework the arch_kgdb_breakpoint() implementation
Date: Fri, 11 Apr 2025 15:29:04 +0800
Message-ID: <D5A83DF3A06E1DF9+20250411072905.55134-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NMRvUBB6DcheiGY8OQyajK5PCKdIR0ZhnYkrsbCGSmh6clcbRt+51l5u
	9yvZ+4L53ph8OOo65AxpaHfSIk+gsoQk9WenpjudxVJxwwW4vwejcrEJQ2ZXBbiZccSQxnL
	LRTWIli1AjY7n6me62/X5GUj/iBiGF/klpXYwkITXIuLewPPQ07cPvOD8M2fAK9oBCPuiN0
	6G4gInK9hGw65OhxJNqB0m9Wjyd11ilhXXXk+5EHuKwxjzGKiQd6bHhr9ZZF0iThR40Sv8J
	SEY5Ij4E6nb7Mb7WuQ4PPNrS/NHuIW568fbO5MfMAQsNHYu/JdSI6MQEq0dq3HmHfITylQc
	mBbWOGcf7E5vG9UZTGF89JBQpyduY5r+xyGHuf0h5wXK6V5daQIVN/xpWgs+0XN7jiib9nn
	vyNZSYrWyt6Nxll5k9fSYX1DvzVAHQApzE1iiU9UdX72ssOtpvom+Tu7Ans60OhoCrXCYPQ
	/4KI5LE0tMMN3iETeX9dFLV0IfpeIqNXjSSL/m5FvKw79vsEnShrSVk0YFQOGgr0ZSJz7ML
	hGtHi+Tz1MR1OG82RyHQjFsZcfGnHDF+RZwKpVtd7IWajkVlJSc+LAmr5zuvlSCOyb2wxzq
	Z7JmEmdH+q6tFJGFhNVMRkAWpnPNTczUb0O9w1auYmyptQKlPfmWzfCRrOtTBtf6nM6M3SA
	tF3N9QJ5wvA4av8nzaTrC6kxCmbHQi7fHUoAB+VHNrMsVWOoq4bg6hLeLNlDJPYyTfnHiih
	8uHTn+pAlFfg3kedBs/QnqPfCgzQgQDZ1F9y4Eq60Wfq2yZ05ZYpYtcKkenGKZdBaEPVh+k
	GBYUuOU+ei8dxpNHeIqhyVoka0BloWcAivtdn/oPOVT1LBMeEaNUTMCLZG7swwa6VrJm5oT
	OaARNsjTelSiQARorpkoskfOPUnr9rLRt4WenN0kLAQ1KoFfM/93erNrKukrnACSn8Cy2ua
	BQCQHwSvzKpk4Lez9QpNKIeYQNWv0Ukg8JEQ8PmHU4lnctG88ZUn4vpKyDrxXgkTLkdvtZo
	raTnt5Ug==
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_003022_400712_F244966A 
X-CRM114-Status: UNSURE (   6.71  )
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

1. The arch_kgdb_breakpoint() function defines the kgdb_compiled_break
   symbol using inline assembly.
    
   There's a potential issue where the compiler might inline
   arch_kgdb_breakpoint(), which would then define the kgdb_compiled_break
   symbol multiple times, leading to fail to link vmlinux.o.
    
   This isn't merely a potential compilation problem. The intent here
   is to determine the global symbol address of kgdb_compiled_break,
   and if this function is inlined multiple times, it would logically
   be a grave error.

2. Remove ".option norvc/.option rvc" to fix a bug that the C extension
   would unconditionally enable even if the kernel is being built with
   CONFIG_RISCV_ISA_C=n.

WangYuli (2):
  riscv: KGDB: Do not inline arch_kgdb_breakpoint()
  riscv: KGDB: Remove ".option norvc/.option rvc" for
    kgdb_compiled_break

 arch/riscv/include/asm/kgdb.h | 9 +--------
 arch/riscv/kernel/kgdb.c      | 6 ++++++
 2 files changed, 7 insertions(+), 8 deletions(-)

-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
