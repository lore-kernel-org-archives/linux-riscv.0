Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2680AC4321E
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 23:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jzNTDQIXYYkYGkDZfmXc3CBhN4uyMK/mNjnsz0NOoH8=; b=mWSlNLEvIQH+Ic
	fSIwjERdDHoPoUlHWwsNYF35GyT7bOXTwWxSKyKkewha0oz2b42s0vetQBKLYYCt2C9Gklh8Y8BpL
	iocDj9bn4vhhNPOPzhSOTa781kYv5etA2jVPTnjv8BxHQsuef1zz90UYIhWaItzzU/Xw0AGXu5wt/
	Zz61JOsC/U+9b+WFm85nzXD/FURoW9EAwEr8SvbT1l0PFhsLjN8pVjeHQFIu6QdbJMZ8SgpgUfu/p
	+CSSagdGHrfMdXML1/pdRsA8ApAWfQ5nKAVcYYxSKRCh7fkpwzeeBTJn/y0ezLLJaYMsk3vUTfdI7
	OiSRYgEQ/zXoNJQv5OXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p09bN-00BbJK-9G; Tue, 29 Nov 2022 23:01:21 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p09bK-00BbIl-FW
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 23:01:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2D933B8199B;
	Tue, 29 Nov 2022 23:01:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CA58C433D6;
	Tue, 29 Nov 2022 23:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669762874;
	bh=DqNp+S4PRvzM4wAongt7ROCNa2xK//B70WCXJgR4f4s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RBh2yDXGzInJq76iupWevLKEhyZs0ouhadymt89tlRZi1ysQ7rXEMeZbmdNueQzbK
	 YQ//QHB3VSEuiYol6BA1mgRSLVPhz2luGR8epeVI85OVLsH2PBvnA6DROeu3WE1jCW
	 Uuvgr/V0/Vye6GmfHML38/0NvQA4t44baKp7tFw4/FA8hUbdfL+199LjxDBJK+DIcE
	 a+g5p5c/QlDQlnjgv9jrMCPtO8YqKoVtcA1iHWl0HRvqwpv47N/u2X0f1dNgYZJE/n
	 bN0IlXfMV2hmPESztzy72/8z91KQLTZqWKqB4+FHcLeowYjuGCCR9bHkjWc1KwXZcd
	 Te3YZN+gaCPtA==
Date: Tue, 29 Nov 2022 23:01:10 +0000
From: Conor Dooley <conor@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com,
	philipp.tomsich@vrull.eu, ajones@ventanamicro.com,
	emil.renner.berthing@canonical.com,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v2 02/13] RISC-V: detach funct-values from their offset
Message-ID: <Y4aPNs4clTTSvmF8@spud>
References: <20221128102632.435174-1-heiko@sntech.de>
 <20221128102632.435174-3-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221128102632.435174-3-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_150118_826160_7D7AD527 
X-CRM114-Status: UNSURE (   6.41  )
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

Woops, I built this commit in isolation and:
/stuff/linux/arch/riscv/kernel/kgdb.c:32:32: error: use of undeclared identifier 'MASK_JALR'
DECLARE_INSN(jalr, MATCH_JALR, MASK_JALR)
                               ^
/stuff/linux/arch/riscv/kernel/kgdb.c:32:20: error: use of undeclared identifier 'MATCH_JALR'
DECLARE_INSN(jalr, MATCH_JALR, MASK_JALR)
                   ^
/stuff/linux/arch/riscv/kernel/kgdb.c:33:30: error: use of undeclared identifier 'MASK_JAL'
DECLARE_INSN(jal, MATCH_JAL, MASK_JAL)
                             ^
/stuff/linux/arch/riscv/kernel/kgdb.c:33:19: error: use of undeclared identifier 'MATCH_JAL'
DECLARE_INSN(jal, MATCH_JAL, MASK_JAL)
                  ^
/stuff/linux/arch/riscv/kernel/kgdb.c:34:32: error: use of undeclared identifier 'MASK_C_JR'
DECLARE_INSN(c_jr, MATCH_C_JR, MASK_C_JR)
                               ^
/stuff/linux/arch/riscv/kernel/kgdb.c:34:20: error: use of undeclared identifier 'MATCH_C_JR'
DECLARE_INSN(c_jr, MATCH_C_JR, MASK_C_JR)
                   ^
/stuff/linux/arch/riscv/kernel/kgdb.c:35:36: error: use of undeclared identifier 'MASK_C_JALR'
DECLARE_INSN(c_jalr, MATCH_C_JALR, MASK_C_JALR)
                                   ^
/stuff/linux/arch/riscv/kernel/kgdb.c:35:22: error: use of undeclared identifier 'MATCH_C_JALR'
DECLARE_INSN(c_jalr, MATCH_C_JALR, MASK_C_JALR)
                     ^
/stuff/linux/arch/riscv/kernel/kgdb.c:36:30: error: use of undeclared identifier 'MASK_C_J'
DECLARE_INSN(c_j, MATCH_C_J, MASK_C_J)
                             ^
/stuff/linux/arch/riscv/kernel/kgdb.c:36:19: error: use of undeclared identifier 'MATCH_C_J'
DECLARE_INSN(c_j, MATCH_C_J, MASK_C_J)
                  ^
/stuff/linux/arch/riscv/kernel/kgdb.c:37:30: error: use of undeclared identifier 'MASK_BEQ'
DECLARE_INSN(beq, MATCH_BEQ, MASK_BEQ)
                             ^
/stuff/linux/arch/riscv/kernel/kgdb.c:37:19: error: use of undeclared identifier 'MATCH_BEQ'
DECLARE_INSN(beq, MATCH_BEQ, MASK_BEQ)
                  ^
/stuff/linux/arch/riscv/kernel/kgdb.c:38:30: error: use of undeclared identifier 'MASK_BNE'
DECLARE_INSN(bne, MATCH_BNE, MASK_BNE)
                             ^
/stuff/linux/arch/riscv/kernel/kgdb.c:38:19: error: use of undeclared identifier 'MATCH_BNE'
DECLARE_INSN(bne, MATCH_BNE, MASK_BNE)
                  ^
/stuff/linux/arch/riscv/kernel/kgdb.c:39:30: error: use of undeclared identifier 'MASK_BLT'
DECLARE_INSN(blt, MATCH_BLT, MASK_BLT)
                             ^
/stuff/linux/arch/riscv/kernel/kgdb.c:39:19: error: use of undeclared identifier 'MATCH_BLT'
DECLARE_INSN(blt, MATCH_BLT, MASK_BLT)
                  ^
/stuff/linux/arch/riscv/kernel/kgdb.c:40:30: error: use of undeclared identifier 'MASK_BGE'
DECLARE_INSN(bge, MATCH_BGE, MASK_BGE)
                             ^
/stuff/linux/arch/riscv/kernel/kgdb.c:40:19: error: use of undeclared identifier 'MATCH_BGE'
DECLARE_INSN(bge, MATCH_BGE, MASK_BGE)
                  ^
/stuff/linux/arch/riscv/kernel/kgdb.c:41:32: error: use of undeclared identifier 'MASK_BLTU'
DECLARE_INSN(bltu, MATCH_BLTU, MASK_BLTU)
                               ^
fatal error: too many errors emitted, stopping now [-ferror-limit=]
20 errors generated.
make[5]: *** [/stuff/linux/scripts/Makefile.build:250: arch/riscv/kernel/kgdb.o] Error 1

:(

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
