Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD14C7EE22
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 08:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uZl42gCcnVTkVjkDo/Nj6k/KDN3kgPuIu4NuteIt3l0=; b=AZ3OHHuhRsKKgw
	6U3s6tyTj8peKPfZGqHwr6+/fQoa3uVlzqTp2ksiZ0rjrzMWm3wv7hjRUR/GQBX+FDfH+CKJnGU8E
	6y3lXLnPMtHVgegQarzCbTwnNicwx5ADB6eO20eGbl5S99hxJxO4saDjgMcCjl+aUUtuZsjdwJTze
	Xbf9V8OHYIjiqNUyDPZ+TNin4MxZJAILP61KRlTbe32rO5T5nqsAeuVCmJrhAGtYWmuy5BoyirF8L
	d1NfIp3YOLr6GYAullyV/E2OufCHltJHsV8DxgPlvdgUPwDuZZb7SH4MppwIuaE6nhob37qEnS5Bj
	dceCamTpXft5JrbjQYjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwfH7-005Y43-1r;
	Wed, 10 May 2023 08:34:17 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwfH5-005Y23-08
	for linux-riscv@lists.infradead.org;
	Wed, 10 May 2023 08:34:16 +0000
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 866663F4A8
	for <linux-riscv@lists.infradead.org>; Wed, 10 May 2023 08:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1683707649;
	bh=LMsA6JxRTYWQXM4naAdveOz2WpVCJs1mzJM+iSTf9FA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=lC8ZEaQWeJdZZTqtPFw0bBGIiImREnnuAArKkOAeNpft1VvwoFgNZodFlnmgGi2SR
	 CxhBNFCwz69WKk35cBsauje9P0IZJ9KcdTesJJTLI3x9QCk16OaVgtsrpoTkdp/RwC
	 hg9F/cfk7EtaFJaZQe+N3GwIVMj8/A3uHOsFBMErTdql+8VlVFAof+b371POvF6zo+
	 A1msqVX6dtfl86SrbeJtoLC3NL+4Nrt0a7oiYOg34v3n6Hh+ArQhJM3GRoU/LaiTth
	 ul4qjdHVBv9eVIsPmIV4IOVW+yMcjUkMU6DKv0vN378XrR6X9hJXC6n0/OM+7nJzbc
	 d+OPQky9ouZEw==
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-3f397a1df12so12111641cf.2
        for <linux-riscv@lists.infradead.org>; Wed, 10 May 2023 01:34:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683707648; x=1686299648;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LMsA6JxRTYWQXM4naAdveOz2WpVCJs1mzJM+iSTf9FA=;
        b=eMt0FssWEJm2vJRWos2AIQQgEsZquxFL1M+yBCPXIoiwk1EMSB0m92W5t4B8vznwHH
         vfIWhVWM8SPfR8mO2IhisgGucjiMJX8yQA2U8WIkOYaW2oklY/BDN7A3QSe6lu2T8H6R
         MzEpdmi6/44xbGzJvbFI/YKrb+LRLEBcgfhKY0tgqJV0Tu95GtMVpKS+kyvXXyUlkUVb
         4oJESQYhGd3QPhtRGEGKUi0i4n6h/r/LqVduEEUxcbkXKC8Xf8C67Nx58gLz/UNzmFYk
         0RJ83wwXr4Ey9ojO82TW/fYI1lb8vr7nnQBbQVP0EOl+jY0WwJl2KUp1tpEptU/ILWwR
         YMMQ==
X-Gm-Message-State: AC+VfDwJJTvEP0Xp+FkYImcKZDPPtTlBv0OK60tVvj1U+WiPO019ErF/
	Vi0Wh9q6UoYBLFA2ScTp+VeUBut4x7hCwipfFVnIoz6sY9j4fI6mIGX7tBBObjWZeNklOZCjWRR
	0CVOh+MoLGEsaa5EHijrJBXvu97uNiS7ne6jUhO/QplKgdS/XrWFJPtZ3VxTmfg==
X-Received: by 2002:ac8:598f:0:b0:3ef:31c4:c8da with SMTP id e15-20020ac8598f000000b003ef31c4c8damr26088051qte.50.1683707648630;
        Wed, 10 May 2023 01:34:08 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5DZCX5r73TwM0f7t4oRTD7Y8E8pM8uSWayhN2OzbxOG+SFBnhHTqvrbsOT/q3EKUIZc2ylBzrCQUO23z5q8NA=
X-Received: by 2002:ac8:598f:0:b0:3ef:31c4:c8da with SMTP id
 e15-20020ac8598f000000b003ef31c4c8damr26087975qte.50.1683707647399; Wed, 10
 May 2023 01:34:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230506090116.9206-1-walker.chen@starfivetech.com>
 <20230506090116.9206-4-walker.chen@starfivetech.com> <a0932e84-3813-bbbe-762d-948d75fbcd8a@starfivetech.com>
 <20230509-overheat-pliable-00d60523637e@spud>
In-Reply-To: <20230509-overheat-pliable-00d60523637e@spud>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Wed, 10 May 2023 10:33:51 +0200
Message-ID: <CAJM55Z9AxMVw=ymfFBb=45nODq89O8dMebzRgo-XD0GKduDBYg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] riscv: dts: starfive: add tdm node and sound card
To: Conor Dooley <conor@kernel.org>
Cc: Walker Chen <walker.chen@starfivetech.com>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor.dooley@microchip.com>, alsa-devel@alsa-project.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_013415_411909_561854B0 
X-CRM114-Status: GOOD (  18.16  )
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

On Tue, 9 May 2023 at 20:05, Conor Dooley <conor@kernel.org> wrote:
>
> On Tue, May 09, 2023 at 08:52:48PM +0800, Walker Chen wrote:
> > Hi Conor/Emil,
> >
> > DT overlay is used to describe combinations of VF2 and hat.
> > Do you have any comments on this patch ?
>
> Up to Emil :)
>
> I seem to recall that he said at the linux-riscv sync-up call that we
> have* that he was not in favour of overlays for hats like this.
> I'll let him confirm that though, I might very well be misinterpreting or
> misremembering what he said.

What probably meant was that I didn't want a bunch of different device
trees for each combination board * hat. An overlay makes a lot more
sense. However, looking through the kernel tree there is a surprising
lack of overlays for hats committed already, so I suspect there is
some sort of policy around overlays already in place.

> Cheers,
> Conor.
>
> * https://lore.kernel.org/linux-riscv/mhng-775d4068-6c1e-48a4-a1dc-b4a76ff26bb3@palmer-ri-x1c9a/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
