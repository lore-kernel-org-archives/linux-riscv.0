Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 164C8FA3740
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Oct 2022 08:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oIRWERx0xS9CwlQ6v7a6PJ/0TU/yJnDL7azzsqeXRRw=; b=f1CWkPY29ncGSm
	Qe3CxFfSCM9ZQ+xeq9xMDYoLsKcFvSQqK8azePxHLp4xUTiUXE7dhxI5VzLEa/epFNnxgOohn2lRw
	T2Z6/kGTxJgmFY1oh/PSxYL9FACn9CMDPOzt49ZJpfbrUamWQ3w84RYOLGkTS252Wl5vyHKUKq8EG
	6eViKKGzXzIHyJdf3I5L1VpdPGpdDZwAtgJ0rIp5b8eN8gjj3eY1fPgxnZLjf+HCF8MVjM+eAWeg0
	wZSg10aUrrF5PnfNghxFXOJNAVwu9dIfD5L45TSe2SVWb7hrkNrrl/xu5wt+KdamAkeP7scUoMuHL
	ixKpTeO5B7Cjaqnagkug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opQ09-009WJg-Ki; Mon, 31 Oct 2022 08:18:33 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opQ05-009WIW-Vu
	for linux-riscv@lists.infradead.org; Mon, 31 Oct 2022 08:18:31 +0000
Received: by mail-ej1-x630.google.com with SMTP id sc25so27391995ejc.12
        for <linux-riscv@lists.infradead.org>; Mon, 31 Oct 2022 01:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1Bs6wkt009/YQyQq2LcOqZCLZ8XN16dFfi4puDNe4WY=;
        b=XF3QbFXCzaEHdWCFAC4ex8kL9ewPA3EY+7MZjub+mRA9781zSIvsaD2K5LuaM3xU1N
         TlNyixPrXSQUdEjjqPxRdO6w8dPzVqCYNiYaB/BuNOXbhqn6EV3z257JnFIwjK8+RPda
         LOQRkE0E/bN9tab+RfvQ9BtVlB5oKcgVPgQIhw05X9qGYv/vWrR4Fv3nXDYFq2GI5r26
         O/RH3Y0sH/U5mdH1gijvOJEhOZk4FXf/9tFS1Utbp86GKEQBQ/fm8xpjLaLFQYk8e0Kk
         SZ21o35LWdSKcTh5t0Mas6Y3y72ZjwbBMgnSNEje5pZmxtC125Qlp9ZIKLc2kbYuckx/
         4eYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Bs6wkt009/YQyQq2LcOqZCLZ8XN16dFfi4puDNe4WY=;
        b=s5dVh6rCOI4SwZBo/hzHkhAS4zsqBbDKpG6ImzbD0FTFV7wkZP5kHnNdUN6NBwUiQK
         xcKo7o1w/WygEVVuUdsHac+kiuBlRvkJewkMCuwM6++yw/kOuLXGpDbxzJaw/MiCOjK1
         Lp3M6Fg3gKXg4rgZAg14VUBVx9zR7ZZxcfdPpjr1GZzxYxQM9g+iJIsQTqlgVopEWleN
         W6w0P1bPFrRB+YQUa96JwwiKZzMCagf07/CL9KVQJZGlLb/sTGNirWD8CQ1acK56+wKq
         tnNH2oC5jYJWinyHjrIgO6BOh/20mT5Ou8xkOkuYQ/r2+Qf7oGViClZwrVtFKGuSIVLD
         AzSA==
X-Gm-Message-State: ACrzQf3xt1d1xEbmkhGUvj8dZH9l2GGF3ZesQBqyLNM3+ed5PcYkMBus
	G0l2c1qgBTx4/XPnTp6WYdUibQ==
X-Google-Smtp-Source: AMsMyM7aUv6hwI3iUpz3dYGAUfnMVrlaEnxKhQ9Ufg55jGM1hBLZivuQ/yMDrYWRp5+fidcYyjFrdg==
X-Received: by 2002:a17:906:65c6:b0:73c:8897:65b0 with SMTP id z6-20020a17090665c600b0073c889765b0mr11893155ejn.322.1667204308571;
        Mon, 31 Oct 2022 01:18:28 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id o17-20020aa7dd51000000b004637489cf08sm501874edw.88.2022.10.31.01.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 01:18:28 -0700 (PDT)
Date: Mon, 31 Oct 2022 09:18:27 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <apatel@ventanamicro.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Atish Patra <atishp@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH 3/9] RISC-V: insn-def: Define cbo.zero
Message-ID: <20221031081827.ly5c2hdqjbxf3pwj@kamzik>
References: <20221027130247.31634-1-ajones@ventanamicro.com>
 <20221027130247.31634-4-ajones@ventanamicro.com>
 <Y17n0xRqGPihGkRJ@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y17n0xRqGPihGkRJ@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_011830_047853_AC9615F8 
X-CRM114-Status: GOOD (  12.40  )
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

On Sun, Oct 30, 2022 at 09:08:35PM +0000, Conor Dooley wrote:
...
> > +#define DEFINE_INSN_I							\
> > +	__DEFINE_ASM_GPR_NUMS						\
> > +"	.macro insn_i, opcode, func3, rd, rs1, simm12\n"		\
> > +"	.4byte	((\\opcode << " __stringify(INSN_I_OPCODE_SHIFT) ") |"	\
> > +"		 (\\func3 << " __stringify(INSN_I_FUNC3_SHIFT) ") |"	\
> > +"		 (.L__gpr_num_\\rd << " __stringify(INSN_I_RD_SHIFT) ") |"   \
> > +"		 (.L__gpr_num_\\rs1 << " __stringify(INSN_I_RS1_SHIFT) ") |" \
> 
> It'd be nice if these macros had aligned \s. I know the file is pretty
> inconsistent in that regard and I'm not asking you to change those but I
> think it'd be nice to do so for stuff that's just being added now.

My approach has been to tab them out without crossing the 80 char "limit"
and then when the next tab would go past 80, I use minimum spaces instead.
I realize checkpatch has changed to 100, though, so maybe I should apply
the same approach but with 20 extra characters, which will hopefully mean
tab always works.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
