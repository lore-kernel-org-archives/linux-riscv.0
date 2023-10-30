Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48724C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Oct 2023 08:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cvZI1czgPHfvl9zRWagdFTDGoai5SwQpV44+SyFBScg=; b=0XZU//c1PLDHRT
	8JDKybVVIoBtAcBHWd+8lg4L1MlDuRvzOvzX9UhY9afyZuVRFvfrJMKHGDRSh6CWuH2jI5QT8ox1o
	VD1RX9L/SITeusbJ23GMfaSEpHip+7DM+/uoT/auTrUSlL+Ff8RpEEWlzOWvAqnF4lQTYzB5SRBi4
	658xGucQ2DIlGgAhulh4eUuSUEpqINbEnV3VY4TZorlsLnFGc0qc2sodIff3PvWwXAKmy+NehhAez
	8SRBB+ifMaM3v2lySVCBTkRsev4dIlirSOS7aRhWqUTMOT/gJ3vPPaJ9x8qLTn213q/NxyOa40hbd
	K1atPQvy3mgz0H6ybIDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxNU8-002pH5-12;
	Mon, 30 Oct 2023 08:18:56 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxNU5-002pGR-1r
	for linux-riscv@lists.infradead.org;
	Mon, 30 Oct 2023 08:18:55 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-9d274222b5dso194442766b.3
        for <linux-riscv@lists.infradead.org>; Mon, 30 Oct 2023 01:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1698653931; x=1699258731; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ASGohF6wcQzyEKbt+mevQcb55fbQucBQCkmpGWTsGto=;
        b=a6VGr3ctKUJ/SnY7pZ5ZjwmDFk1whPnMobV/Rg4sBibcsTeq2bIWF0pd6NTrPCuwDq
         crBkbnimZupaqvsN9CvrqztCOaeel2RltGBm7VnQE0S5AZ437b72GrB/1PxCD98CFB0T
         gneqCBFBFYD2EyH7GVCGvuH3NSnyLSgHl/MW/EDcfYrq2Rs8K9TQ+Dn5TfU3ScAKWxLz
         O4jOzG7Y8q97LnbscUG3f9KK30gO55MrUuiLdn7eIrWIULZOxRSDamv1Ovy94g0RIm84
         iu+b7X0EkOYo6wRhDU4OblZiDl81ayULjpSGOiC5KkH7m3R0xofa2wSC7r3b/j3BxU+m
         hYZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698653931; x=1699258731;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ASGohF6wcQzyEKbt+mevQcb55fbQucBQCkmpGWTsGto=;
        b=VMESYv25of17CiYcofVA97nWUENs065yRKoOmL0Ktvr20i0sl/6MA0I0ezntUaeXGg
         67pHNgX8LBJy7MSQZvgcOCwMxvcAj8mgQ7IZ/3O1MmRrRp5N0hCd/n5Wgq6H1b6Ib2eh
         qdan0tJfYMsG4pkT4VpuPwSJk1PSC+EFX9TW6+RdYthBiKlJayCrvkCLYtNdUYzrinta
         NvNzKu60sRSBRMGa/FGYTS8D/W/GRYyS0KwwByEHIgldkSRF9NzD01gedJIaIUl4dN7g
         vyZ5+geEhO8ugOsV2a3rtECVfN/0EEGfFcQlXutmPBC8RwsISHzSgb9RjPcq1cqGZKO8
         7ikg==
X-Gm-Message-State: AOJu0YzlDvNrk/gcp9erycLXZ1v1rAQml2Jh1dflH5lJuI3zdvcwr9Vj
	8gze0ozh1cC9gcLlEEIjy4WmJw==
X-Google-Smtp-Source: AGHT+IGdqsotN4dfRUTxJ2PytrYg4PIok+Da6/rxiuFLYsQNc0JOO256uP9qD7cm9yibCS0EteAn8w==
X-Received: by 2002:a17:907:7ba0:b0:9af:9c4f:b579 with SMTP id ne32-20020a1709077ba000b009af9c4fb579mr9498421ejc.18.1698653931212;
        Mon, 30 Oct 2023 01:18:51 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id n11-20020a170906b30b00b00989828a42e8sm5528320ejz.154.2023.10.30.01.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 01:18:50 -0700 (PDT)
Date: Mon, 30 Oct 2023 09:18:49 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
	linux-riscv@lists.infradead.org, apatel@ventanamicro.com, palmer@dabbelt.com, 
	devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH] dt-bindings: riscv: Document cbop-block-size
Message-ID: <20231030-d3db6c3f8cf46bbdd8191d65@orel>
References: <20231029123500.739409-1-dbarboza@ventanamicro.com>
 <20231029-kitten-provider-1602fa805c35@spud>
 <680a2f25-59e7-4757-ba93-1de7fe1279e3@ventanamicro.com>
 <20231029-sappy-ought-98fecff551fc@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231029-sappy-ought-98fecff551fc@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_011853_645237_548B037D 
X-CRM114-Status: GOOD (  34.36  )
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

On Sun, Oct 29, 2023 at 10:21:55PM +0000, Conor Dooley wrote:
> On Sun, Oct 29, 2023 at 04:49:30PM -0300, Daniel Henrique Barboza wrote:
> > 
> > 
> > On 10/29/23 11:53, Conor Dooley wrote:
> > > Yo,
> > > 
> > > On Sun, Oct 29, 2023 at 09:35:00AM -0300, Daniel Henrique Barboza wrote:
> > > > Following the examples of cbom-block-size and cboz-block-size,
> > > > cbop-block-size is the cache size of Zicbop (cbo.prefetch) operations.
> > > > The most common case is to have all cache block sizes to be the same
> > > > size (e.g. profiles such as rva22u64 mandates a 64 bytes size for all
> > > > cache operations), but there's no specification requirement for that,
> > > > and an implementation can have different cache sizes for each operation.
> > > > 
> > > > Cc: Rob Herring <robh@kernel.org>
> > > > Cc: Conor Dooley <conor.dooley@microchip.com>
> > > > Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> > > 
> > > Firstly, odd CC list. Please CC the output of get_maintainer.pl in the
> > > future.
> > 
> > Ops, my bad
> > 
> > > 
> > > IIRC, I mentioned defining this to Drew when he was add zicboz, but he
> > > didn't want to add it - although he seems to have asked you to document
> > > this. Drew, change of heart or am I not remembering correctly?
> > > I think he cited some interpretation of the spec from Andrei W that
> > > implied the Zicbop size would be the same as one of the other ones, but
> > > I cannot find that on lore atm.
> > 
> > The reason why I'm here is because I want to add Zicbop in QEMU riscv,isa.
> > I'm pushing a rva22u64 profile implementation there and Zicbop is mandatory
> > for it. In the process I added a riscv,cbop-block-size DT because, well,
> > if both Zicboz and Zicbom have their respective block-size DTs, then it's
> > expected that Zicbop also has one. Or so I thought.
> > 
> > Drew then replied in the QEMU ML [1] that riscv,cbop-block-size isn't
> > documented and we can't add it as it is. So here we are.
> 
> Yeah, I did read that.
> 
> > If riscv,cbop-block-size isn't needed because Zicbop will use the cache
> > block size of Zicboz or Zicbom, that works for me too - I'll add a note
> > in QEMU explaining why there's no riscv,cbop-block-size and everything
> > is fine.
> 
> I just wanted to remind Drew why we didn't add this in the first place,
> given I had seen that he suggested that you add it in the QEMU thread.
> And in the hopes that he would be able to dig the link back up to
> Andrei's comments, given I wasn't able to find it/couldnt remember
> recall where it had come from.

Hi Conor,

Thanks for the reminder. I had forgotten my own opinion on this :-)

I found the messages. In [1], I advocate for the block size DT property,
but then, in [2], I reply to myself saying we could probably wait until
we have a prefetch block size that differs from the management block
size, due to the "reasonable" interpretation of the spec that management
and prefetch block sizes are the same.

I think I could go either way. The nice thing about adding the node is
that it's self-documenting. While we could document that Zicbop will use
cbom's block size (and if we ever added a cbop-block-size, then we'd
change the documentation to state that cbom's block size is Zicbop's
fallback block size), it might be better for things like hwprobe to just
have them separate from the start. FWIW, ACPI already has a separate table
entry for Zicbop's block size.

I guess after letting this ping-pong back and forth in my brain a few
times the ball is currently resting on the "let's add cbop-block-size"
side.

[1] https://lore.kernel.org/all/20230914-892327a75b4b86badac5de02@orel/
[2] https://lore.kernel.org/all/20230914-74d0cf00633c199758ee3450@orel/

Thanks,
drew

> 
> > What we can't do is add stuff in the QEMU DT that's neither
> > documented nor acked in the DT bindings.
> 
> That's a welcome change.
> 
> Cheers,
> Conor.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
