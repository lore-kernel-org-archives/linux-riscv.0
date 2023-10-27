Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 770F7C25B47
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Oct 2023 07:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pOoGY9fIog85S2lVqu2mzvrZZeneZWnftj1H2MlH+T4=; b=RVu48R84nChgG6
	CIunCZ66f8aZOXvyGwHBFde7KYAzjW20Uc7O4Z3DlqHjGfXbULI1qQgvJf4LXH6DirI/RjwEm3X+w
	zjRo9JRuP4/yZKjXd6pvPVyrXOIOMdaEuo33CU3g9K4sZdkvfsmKoELiovJrvC1APl2WuduziV3LX
	4W5LGI+dC9UtT3dDTCVMkxCYFzyO0GtxoogfftNK5J9L6XqCI5x9yQrIUfFeknrmh24vKlslP8K0a
	U6Zm5OK7b8LzRd3mJSWgbFuAYq+LQET4TUgdd2u71SqCt7AAo4IP7HYivdw3PWcMk0D28Zn6wa4fp
	DCOiom6Pfy/x9WBNgpNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwHku-00FrLy-1u;
	Fri, 27 Oct 2023 07:59:44 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwHks-00FrLJ-1J
	for linux-riscv@lists.infradead.org;
	Fri, 27 Oct 2023 07:59:43 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1698393580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aOK7A0+CdflYOBnvO1eKKbv3VLmXZEl1oDj0wejWb7w=;
	b=U3KBVLxElVmocznmPNDgJZtMo4VLmm2nd4LaDnabibfZIjHeIXVWV6H/8HzLdMtAdQXCi5
	DzyHMeICFUFGqr6AK5eZ8Uv49cXILfyzxHIzbyoZR4U6oi8+jRb79gYZQReiG7Hg1Bvjt4
	7aknQauCBlKL3NR3GyI7Ixp+b2fxXQXqUvkY0eU2a+L/Pi4pSbhQByPWlkKn7326JhAeQ8
	2+1iwInpzWBCPbVzI0uXAXKj2CBvOP6bvgVZ/cZPcY2Kenz99llr0oYsEMphhc3aWOJUt+
	hkxUoE/TMxHOkgCGYNLQXKQEB5rcZ1yaLRniTeo/6xWPCqZYuH9ilqHnRaUQrw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1698393580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aOK7A0+CdflYOBnvO1eKKbv3VLmXZEl1oDj0wejWb7w=;
	b=p+PouVqqHVKIXhO4ioC+yLKjjEE/QX88ImmuCIA9EcgteoMBReRCHxJhi3s8GuV2dIYbqI
	JMnXP5hdx90+uDBQ==
To: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH 1/3] RISC-V: Don't fail in riscv_of_parent_hartid() for
 disabled HARTs
In-Reply-To: <20231025142820.390238-2-apatel@ventanamicro.com>
References: <20231025142820.390238-1-apatel@ventanamicro.com>
 <20231025142820.390238-2-apatel@ventanamicro.com>
Date: Fri, 27 Oct 2023 09:59:40 +0200
Message-ID: <87y1fo3383.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_005942_585274_E6475E16 
X-CRM114-Status: UNSURE (   9.00  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Oct 25 2023 at 19:58, Anup Patel wrote:
> The riscv_of_processor_hartid() used by riscv_of_parent_hartid() fails
> for HARTs disabled in the DT. This results in the following warning
> thrown by the RISC-V INTC driver for the E-core on SiFive boards:
>
> [    0.000000] riscv-intc: unable to find hart id for /cpus/cpu@0/interrupt-controller
>
> The riscv_of_parent_hartid() is only expected to read the hartid from
> the DT so we should directly call of_get_cpu_hwid() instead of calling

We should? Or maybe not?

Please write precise changelogs and use imperative wording as documented
in Documentation/process.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
