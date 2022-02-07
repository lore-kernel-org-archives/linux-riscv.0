Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC98C433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Feb 2022 09:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ub4edoJajUnhNYC8pPdjeOGp8veCwLTwhi//N5ivJBE=; b=3rt47OWbjQb7i2
	yOGbviwgubn+GDRaCNoME3YD4FDQi2l2EDMtedqlEpZWcDR/IiyV0l3qecAGX4TNtypfCKzMQnUAi
	30kyk9a1HJfUM/qdPA5VDnclHVbVXTkCcJpB5+4rxC8yM4Nt5lsI6a2XH3iJO/Xn+5DTY3SJ/yyIY
	xsUJav2GVd0AY6PJ+Qrkk9NO/pO+qS6PoI06TGiXrE0soVLWsbL6guNgZR8f0hJ87/refA8Ds+jdJ
	edBUGhhOPg8wcuz2/NfMMlw7SmnnRAufw8pfR661qgkUTHzr3CUUrvp4Ty/PpV/Qxm6HPBz8Q6muK
	IOp0DVeg5v6xmxLnkD/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nH05R-009VmU-3u; Mon, 07 Feb 2022 09:13:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nH05P-009Vll-7m
 for linux-riscv@lists.infradead.org; Mon, 07 Feb 2022 09:13:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 50E98611AE
 for <linux-riscv@lists.infradead.org>; Mon,  7 Feb 2022 09:13:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B929CC340F1
 for <linux-riscv@lists.infradead.org>; Mon,  7 Feb 2022 09:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644225205;
 bh=loNDVX86jkz7vPamh6R+7NHKKkH44fLHUGIwxCxL54I=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=L3qKS4GcjeFf9L8rovgeNZ8vSs81DbEsRricgR8snuEiTtE5qtGwO+t5ejmjTWnE/
 3p5qPvPUFvK95lfF8emhaz9Oss/BNFFFwYykCdrz9e6TPUpmOwVmooJ8+wO5QH7Ysf
 UBXQXH8lt9nKYUW6VdDMBkxsj3L6CuTJh45w2MlfYSXy0zPcWm00VhtJm1omFzwI3h
 TPZ/mSKnuY0y5ADde8wKQl/t5N9IUhmAULM06+lV+2PHIaWkoqizwy0h3DmK68d7El
 rl6GKzy1PC6EOzhRP7JZi7CXUlFvmzQqG19UCKQw2b6TsJkAf1YbOuB6/uiGgbsy78
 oyw05Ak1bBqCw==
Received: by mail-ua1-f43.google.com with SMTP id c36so21589519uae.13
 for <linux-riscv@lists.infradead.org>; Mon, 07 Feb 2022 01:13:25 -0800 (PST)
X-Gm-Message-State: AOAM5322WKOJmlNTnrFstpjxjrVY5ueJ0U1Lb6Th9blMMaZIO6nLMis3
 zFjpo5no9pvfmBXwBJQzEcncDpa5NThlg52tMik=
X-Google-Smtp-Source: ABdhPJxu8H5EnszM02kixttFF4U4u7kjCty3W4zLrxfbfQuHtQaVYD+2dwHDNYwaLA6hLb+W2wZbCs1H8ChTqC6nLBg=
X-Received: by 2002:a05:6102:3bd9:: with SMTP id
 a25mr4173991vsv.8.1644225204809; 
 Mon, 07 Feb 2022 01:13:24 -0800 (PST)
MIME-Version: 1.0
References: <20220130135634.1213301-1-guoren@kernel.org>
 <20220130135634.1213301-3-guoren@kernel.org>
 <5b59a816-a1a2-1e75-9c78-8bc9be18f70d@sholland.org>
In-Reply-To: <5b59a816-a1a2-1e75-9c78-8bc9be18f70d@sholland.org>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 7 Feb 2022 17:13:14 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSki27uum+vPEsU50ktuBmkFC=XSr_KuAmKG2pwX2OwtA@mail.gmail.com>
Message-ID: <CAJF2gTSki27uum+vPEsU50ktuBmkFC=XSr_KuAmKG2pwX2OwtA@mail.gmail.com>
Subject: Re: [PATCH V7 2/2] irqchip/sifive-plic: Fixup thead,c900-plic DT
 parse missing
To: Marc Zyngier <maz@kernel.org>
Cc: Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 devicetree <devicetree@vger.kernel.org>, 
 Guo Ren <guoren@linux.alibaba.com>, Samuel Holland <samuel@sholland.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220207_011327_358091_A3892906 
X-CRM114-Status: GOOD (  19.24  )
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

Hi Marc,

On Wed, Feb 2, 2022 at 12:42 PM Samuel Holland <samuel@sholland.org> wrote:
>
> On 1/30/22 7:56 AM, guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > The thead,c900-plic has been used in opensbi to distinguish
> > PLIC [1]. Although PLICs have the same behaviors in Linux,
> > they are different hardware with some custom initializing in
> > firmware(opensbi).
> >
> > Qute opensbi patch commit-msg by Samuel:
> >
> >   The T-HEAD PLIC implementation requires setting a delegation bit
> >   to allow access from S-mode. Now that the T-HEAD PLIC has its own
> >   compatible string, set this bit automatically from the PLIC driver,
> >   instead of reaching into the PLIC's MMIO space from another driver.
> >
> > [1]: https://github.com/riscv-software-src/opensbi/commit/78c2b19218bd62653b9fb31623a42ced45f38ea6
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Cc: Anup Patel <anup@brainfault.org>
> > Cc: Marc Zyngier <maz@kernel.org>
> > Cc: Palmer Dabbelt <palmer@dabbelt.com>
> > Cc: Samuel Holland <samuel@sholland.org>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > ---
> >  drivers/irqchip/irq-sifive-plic.c | 1 +
> >  1 file changed, 1 insertion(+)
>
> Tested-by: Samuel Holland <samuel@sholland.org>

ping... gently. Any problem with the above patch?

--
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
