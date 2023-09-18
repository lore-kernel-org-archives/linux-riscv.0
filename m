Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22588C46CA1
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 10:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w/BP2xfMt1tgIRYfXoEjRMxCSQDhXmRW/2JQ0Bq5w+E=; b=f768J9Xl78Jc8o
	/msIro6loVTliDNdIpniWx+cOnjWpGJEJfqmJ9aLxyhvPRxDmmZvV4pSb64oxHPkewkjccWHw4egC
	pGM8hGwQuIxmxgL/7aLGQCEL0Qx5tMG5jt2fORfvJ+qyDmJQeoJvkWIKCXtQozgsEGQaoh/EKa0Od
	jixDqbWCP1yYNBx2Z4Vj3kZjwF1GAfJbfjzA8kyp9zeNAKvTKUvje0jBb1sJhMaddQK26PgWBbMBj
	oCfC3tTfWAvDZzzDWjFfGjKTMrZF8u+kWyFCdqIKDD8ZmrsCh/Etu3/5oWb/Rf2xu81XH+l7KyxYt
	9N7CFCfJVpKxsYHSDDWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiBgo-00FF5P-2c;
	Mon, 18 Sep 2023 10:41:14 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiBgm-00FF3n-1J
	for linux-riscv@lists.infradead.org;
	Mon, 18 Sep 2023 10:41:13 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2c008d8fd07so15113171fa.1
        for <linux-riscv@lists.infradead.org>; Mon, 18 Sep 2023 03:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695033668; x=1695638468; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e8vZ+nMZg/id9myDO0t3UgVJxmZAPYOVVlhlm9+laak=;
        b=ZX0Okpa5xgpJQNJIWmSKLY4QWvGubjBWADQ3BF04T3Aa2j38799n1queX3AZeU7y/U
         FdhbKcfZpsg8xCFLQX4VoOLXafRVSC2ffjy4RT6BvEfotSUiZyuOrtG+66/eMffEiVQs
         7VOjBUE96MsmKoQ15O3QjHeOMLwygtuDzGi+4jMTLOXwmqAwH3VnpDBXgvpZ/EKvdaCk
         iGdO8YX/cZt09uuQ+/NDQZ0ytKC6OUqxZk0ExUA1gLks1JFCXjXS8+62bdHV9Lu8SfmK
         rlfbdgGWYFX1jUNdjI9vjhG5tKH1tiXXdTe1qpDcZiWHcCYR9nObt1XqcwpZ+x/+M7Dz
         AJ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695033668; x=1695638468;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e8vZ+nMZg/id9myDO0t3UgVJxmZAPYOVVlhlm9+laak=;
        b=nc5iLp1tzZjQ6AGjtVKRr9u7+NQstf24eawigdTpgo6KWtPX2F3JIH9FQQ7gJcIuhZ
         cY+KPLjpiXTV1CdnEhlv0Qo8PXm+X68GDLeb1AKODdrb+MLUIKiw533zrb+1zeQjq/Vx
         Jy0WuHieUd9nXT4uhADen70GLK13n+4TMHkasVHZnoyR5ezhfyf6MUdS8xVW4V1OfdJP
         u1XD4Pc0EE1010dATPZmGioeQVIuwGQbejb4S8DeOJ6hh/XdT+2WVt9edRvHinpl6lFf
         CDvu86SIbSEgYRVm/rLe+ShNfvjavbm4VH0Qcrp1LDJYKLKtJ1Nme4FRzbfIuRYAY6w4
         7QDA==
X-Gm-Message-State: AOJu0Ywey5exEzUVt/p8rMNKPMN7QdtJDvlZJ3WYRgYsImiRzNOIXaiZ
	dxguYkj4zTbkglyj7Si11z3kkydKE+2k30SuJ/0=
X-Google-Smtp-Source: AGHT+IHYQipn1lEfaVnoAR+B4BEowjtJ232usDZFUDz2i18WN/9JMJ6Z9VKi7x5PBPZ8b9/rjaOP0w==
X-Received: by 2002:a2e:6f0a:0:b0:2bf:f133:62e9 with SMTP id k10-20020a2e6f0a000000b002bff13362e9mr4026846ljc.17.1695033667751;
        Mon, 18 Sep 2023 03:41:07 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id qt11-20020a170906eceb00b009a19fa8d2e9sm6116650ejb.206.2023.09.18.03.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 03:41:07 -0700 (PDT)
Date: Mon, 18 Sep 2023 12:41:06 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	evan@rivosinc.com, conor.dooley@microchip.com, apatel@ventanamicro.com
Subject: Re: [PATCH v3 6/6] RISC-V: selftests: Add CBO tests
Message-ID: <20230918-062f2e7be4d5dab914648c91@orel>
References: <20230904170220.167816-8-ajones@ventanamicro.com>
 <20230904170220.167816-14-ajones@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230904170220.167816-14-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_034112_443739_D191B9C9 
X-CRM114-Status: GOOD (  11.50  )
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

On Mon, Sep 04, 2023 at 07:02:27PM +0200, Andrew Jones wrote:
> Add hwprobe test for Zicboz and its block size. Also, when Zicboz is
> present, test that cbo.zero may be issued and works. Additionally
> test that the Zicbom instructions cause SIGILL and also that cbo.zero
> causes SIGILL when Zicboz is not present. Pinning the test to a subset
> of cpus with taskset will also restrict the hwprobe calls to that set.

Palmer pointed out that there's no guarantee to get illegal-instruction
exceptions when Zicbom/Zicboz are not present. Indeed, the unpriv spec
states

"""
 The behavior upon decoding a reserved instruction is UNSPECIFIED.

   Some platforms may require that opcodes reserved for standard use raise
   an illegal-instruction exception. Other platforms may permit reserved
   opcode space be used for non-conforming extensions.
"""

This implies that cannot do the illegal-instruction checks for when
hwprobe reports the extension isn't present. That's a pity, but I
guess I should rip it out. Or, maybe I'll keep it, but only run it
under a command line switch.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
