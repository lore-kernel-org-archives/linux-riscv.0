Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA861EB64DD
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 11:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hjmz6T17L0LBZK93uDJiTrbCRhxSaNGJXSDxjOowRwA=; b=C5f5DaJN5NTp+H
	NiCqpAl4d9yd+P39xw8gUy/67xTsm3Ej8Ay8Ex9BJCYB6gTUl6H4mrwfLl/t8JReUf1C6dVs10hEW
	rye2P4LH9O9EhXAYrbU7CgpKTOD+9ogWyMT1AvDG308VoEQrgempDoJLCmx7sRyLq3USpgCpfxLWa
	F8To/fhBEwJ09lb/BXbTr0Wly7YtWbaALkl7JUN17cixCSy+QKMmWU/MUMwFWR7D0+fTh3WqUIiqn
	nBZOOAXUKDKYo3+h1pcjpSxvAMHvSH8l7xBS5MSBQWXiJ68Qaz7inoOij2Hq1yUB6KshF8eUVIyli
	NcSmPMDnfoDpvgfcke8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJuTb-0034zZ-07;
	Thu, 13 Jul 2023 11:27:15 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJuTY-0034yJ-0e
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jul 2023 11:27:13 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4fb7b2e3dacso1062821e87.0
        for <linux-riscv@lists.infradead.org>; Thu, 13 Jul 2023 04:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1689247630; x=1691839630;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nWVD6bmDClvFRSgHCqYkZ5kEEDPyjY+6kQqvXpehczU=;
        b=j/blvGSuhTbKnMAFRDQrUhXSn7yLTC9w5s3t9kf5BYVoM41vuBu8nhJM1yEoiNy/s1
         JUtxwRufax24YEQIZ/laS6QLGwY3lEI2C22vqcmse5vLWB1d/TI4ZDT7mz93CQRUfhGE
         owXMNbR70I/imqd/XPLkAqateUcTQTgMvDIU7Q1JL5deufkRwQ6m15r1n0KYsVOE55MX
         AIBMvGiVrv4EE/L30kEZatMNJOm9Hszz6vHSUlc0mUOikUj+IZF8LSxGMjQm70WOMzWd
         4pdKISsaafvfgDnksoyulNqcnCxO9npdk5c9I6kukKHuY8E0cmQHV6yepjPtpmL7Tk57
         xvIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689247630; x=1691839630;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nWVD6bmDClvFRSgHCqYkZ5kEEDPyjY+6kQqvXpehczU=;
        b=A5OafKkglTZDsJHLeukFMsyxzu1RqoERwMyVK3tASUcSSHJvr7jVOULi8H2BRLos1O
         wHOM5Nd6as2A7A1YnVuiJggjNZ3wxUB3qMQBxKimtsvYxb5TTyoa4Zb+r8+cgJ0Sl7Go
         J7WNU4KntnZGBN0O9Ugo7QL07fC2oiWqndUcaZ7j/PPwnDDUnWOHon4j+pvn+tEA1WU7
         YkZREu+KvyP8kYFz6w77azFEeGf2l08UM1R0NdQft67kjJbdU2aoPPid7/SK8vksRyhs
         rk9Z85uxOON7iPRxQ9H1x+PTR9WR/lak28QcVwDWxP40lVdkUf/XqnXaJZTav1Wk56Di
         LEBw==
X-Gm-Message-State: ABy/qLYB1qhrcuA4IYaAEonyNy4TkoJQMOZFvim6KObNUxcCJPvCETdT
	6Hi4nwSVamm2ekLK8TbYAtIyHA==
X-Google-Smtp-Source: APBJJlFcPWkOYad3AO0C0/TthvEo+nczdd4M++HotWO7WY0hZba3ezfYNG1fTr+XKQATieG5UOrGWA==
X-Received: by 2002:a05:6512:46d:b0:4fb:90f7:6769 with SMTP id x13-20020a056512046d00b004fb90f76769mr865262lfd.21.1689247629831;
        Thu, 13 Jul 2023 04:27:09 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id w22-20020aa7da56000000b0051e1a4454b2sm4134322eds.67.2023.07.13.04.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 04:27:09 -0700 (PDT)
Date: Thu, 13 Jul 2023 13:27:08 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Heiko Stuebner <heiko@sntech.de>, 
	Samuel Ortiz <sameo@rivosinc.com>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] RISC-V: KVM: Extend ONE_REG to enable/disable
 multiple ISA extensions
Message-ID: <20230713-3dd9e72ecd9f7926a2035f59@orel>
References: <20230712161047.1764756-1-apatel@ventanamicro.com>
 <20230712161047.1764756-3-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230712161047.1764756-3-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_042712_249419_4F666DA6 
X-CRM114-Status: UNSURE (   9.48  )
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

On Wed, Jul 12, 2023 at 09:40:42PM +0530, Anup Patel wrote:
> Currently, the ISA extension ONE_REG interface only allows enabling or
> disabling one extension at a time. To improve this, we extend the ISA
> extension ONE_REG interface (similar to SBI extension ONE_REG interface)
> so that KVM user space can enable/disable multiple extensions in one
> ioctl.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/uapi/asm/kvm.h |   9 ++
>  arch/riscv/kvm/vcpu_onereg.c      | 153 ++++++++++++++++++++++++------
>  2 files changed, 133 insertions(+), 29 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
