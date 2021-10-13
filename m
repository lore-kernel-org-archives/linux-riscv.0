Return-Path: <SRS0=U004=PB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BFB8C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 13:14:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CAF6610FC
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 13:14:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2CAF6610FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AQvBum7muI2UKWMho6HI0TVL9/9g++xYZPKtJxcw7bo=; b=vAiI8heduSKIyY
	q9PGLhVeJbvgllHGHqdDHR7KTc6nRbp3wpMxc6xCDlAZbuqbXjWbE9hBAvL2R1F11GXRcS60N0oY+
	oE66lqEpmVCBc22AdBNlAFf+kNS4X55u6nhoWb2ApjGf2VmqcBYiTy1vY+emWghoOVwvLdJJvudEA
	WHVoHsV12gEh5DfJg8IwxkGtmm1Jr8g0MJZaiOJR00Z/oE10me2LK6bMha6SI9TJBDNZi2r0eZbn6
	7OSYL+OWYto2I7CLsTqm80e/q8nsk28NHKPhRSuUYe+G66qlsn+413CtZO2aUebYtWYWaeD2lRHMB
	vJC+Ol4HWzduDYkt1aMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mae5i-00GoWf-6D; Wed, 13 Oct 2021 13:14:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1madaR-00Gddr-Ts
 for linux-riscv@lists.infradead.org; Wed, 13 Oct 2021 12:42:25 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 919FC610C8
 for <linux-riscv@lists.infradead.org>; Wed, 13 Oct 2021 12:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634128943;
 bh=p8tzbQGHncvPUz9CxEELw2NXc20g3D1UwuPJy5Lcb8M=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WGE7WWZYV9kJaZUrA2fCICy/Wfo8rSrpB1w2OyRrOHP9igb5M3dESjyPwJDpTbDZW
 82B1PHyMgoxpnw20K26+meotRUn/7w5++QDsrNHQXHbaF/d9LOvaLEyjvztIBBTVt3
 xsDun0YVMCxGsNx4pPJ5iG+yVa0dUTt/qegfMX3xmtAesjkrbpO8MtLWPYnjRzIExv
 +EMyZoc0Ukk9nutafYKyLBZHs2hnGWOcsx7KkyNkVk1oFbWKb/4s0DRrjkqdtNaNNM
 gGfZ99OM/Gi4psi7PXw/5hBu5JiMGJbnwmx4OT6/EW0HlajG3R4I+1vnYi7n2HtqkB
 /+BY93Y6rQh6Q==
Received: by mail-ua1-f49.google.com with SMTP id e7so4102140ual.11
 for <linux-riscv@lists.infradead.org>; Wed, 13 Oct 2021 05:42:23 -0700 (PDT)
X-Gm-Message-State: AOAM533Bd4+xTgw278oHlIKdQr6REwZoVzVPBkTNJcKa7AG+Zvn6IkQn
 kCaZh4gIu6F5ruFGkG/GiGqFvnURQc/7LhGHfFs=
X-Google-Smtp-Source: ABdhPJzDEcif+sB2unKqRYwClPkyoh1+OuVI4uCqADCHESp1eW7nKG2gDYZLYxzqpSU5/eQqKEBvUoPGcNrIMIspZfY=
X-Received: by 2002:a67:d88c:: with SMTP id f12mr38800185vsj.33.1634128942575; 
 Wed, 13 Oct 2021 05:42:22 -0700 (PDT)
MIME-Version: 1.0
References: <20211013012149.2834212-1-guoren@kernel.org>
 <5eb20b41ca611f410cf802d4d4a9e945@kernel.org>
In-Reply-To: <5eb20b41ca611f410cf802d4d4a9e945@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 13 Oct 2021 20:42:11 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQmNvtK+9hZWCqHY6rVLZ=wJyo+DvWBG7+o8+c+xSDngg@mail.gmail.com>
Message-ID: <CAJF2gTQmNvtK+9hZWCqHY6rVLZ=wJyo+DvWBG7+o8+c+xSDngg@mail.gmail.com>
Subject: Re: [PATCH V3 1/2] dt-bindings: update riscv plic compatible string
To: Marc Zyngier <maz@kernel.org>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@wdc.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>, 
 Rob Herring <robh@kernel.org>, Palmer Dabbelt <palmerdabbelt@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_054224_023582_DECC1C9E 
X-CRM114-Status: GOOD (  12.44  )
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

On Wed, Oct 13, 2021 at 8:39 PM Marc Zyngier <maz@kernel.org> wrote:
>
> On 2021-10-13 02:21, guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > Add the compatible string "thead,c900-plic" to the riscv plic
> > bindings to support SOCs with thead,c9xx processor cores.
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: Palmer Dabbelt <palmerdabbelt@google.com>
> > Cc: Anup Patel <anup@brainfault.org>
> > Cc: Atish Patra <atish.patra@wdc.com>
>
> Please add a cover letter when sending more than a single patch.
>
> This isn't complicated, and git will do it for you if you kindly ask.
Okay

>
>          M.
> --
> Jazz is not dead. It just smells funny...



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
