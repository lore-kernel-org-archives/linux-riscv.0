Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6136FCD8CA8
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 21:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=umaHHTPkfdTXTjm2v/zAWatmQT0DiX1StYvCzZ8Owqo=; b=QfNNVvmCf5SQ6OT4J4ErVz2vlv
	jdBX7jL/Czw6yjLQXWnkZrFRA3DRpcFYRnoC85uvrfagNA3V5kACbblJLnPFRQFXTRq2qBlM9Y1oQ
	FRvU7JQF//Jjd4/ortZCH2dh+rVPLTH6L4Nl649EnBFC7dSrIczRvoUcdHTYPsb33mA++0+RnDlY1
	aFPDdWPcfpT9OIf8r5zB8xpeBjpO9iTLp5a0KawcMrC8g/9vvHIaVlk0BuiWz6mQOgqWsFlcRP01h
	FAPBbgMvCTh27v4kp0JQu8LEcwMLqvwvW7XGoF3aWy9itZ+fS4lO3ZJ1mQ1PY2mlfBeOwuuIozEPE
	vwspi4pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX3ee-00000006NlE-0zIz;
	Tue, 09 Jun 2026 21:06:36 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX3eb-00000006NkZ-34Ia
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jun 2026 21:06:35 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-36bb3551f6eso5321711a91.1
        for <linux-riscv@lists.infradead.org>; Tue, 09 Jun 2026 14:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781039193; x=1781643993; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1dX9Gf5auhZd7M2vITh4vuMczhC2UZxTRI4fFpUYnQg=;
        b=hT8LSwI7V24QmSzvglVnH9gN8dj7nMY7o9p2tcBGOtOYmaxGpS+m3Lo3xWskkbZO7F
         ywtvrklnSU1LVmd79Pi2P3tWwtCiGgimWBmaQLbWoYf92n1RMFqzZd4GaHnOdUobef1J
         IyLUCRDKklJ46tIABME6m9NhWYuhkSY1AuPWac1mG3XXibBpe33cVK0kF1aO0T8UqmlP
         1XMYlmsW/xX8cad4RUWYnQYfVwwTRZHI50TYsHDTohnU8ekipysbfQcOdIxZQTYl4u5R
         aZMvXA7n2m/i6bDyI4F0/I0G1ynVVhF8hDqYDt77arAqaJJnvgtRqFHOt1YNJ/brC/Lp
         TjNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781039193; x=1781643993;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1dX9Gf5auhZd7M2vITh4vuMczhC2UZxTRI4fFpUYnQg=;
        b=R5+L6nDGjcIhNmlu4ouPdXzfP3pdpDUbM6sg714bGwfBo97nQiRjNOlDQ3Q21dj1Z/
         qLZvG74gYXuNLN1SSMM4WKOQtpbV5acv4c53yPKszVJxRzcXAuSxaNjheLxhRtQel9Tm
         n7tUntbNJaohcy6X5/Sdj4UYUC0HE4fX15ueNxQtV3OyBmSDXWKrNqNxEyH2gXjsjxHi
         sRV4djjGAWOXANKm3OBN03jqP2MdySnTGsu/hX/amXFQjj7JvmOMGLP10MsuTQArzWIM
         CzHnNQGXUjqgdzT4Y3X2jpCiUfrilIL3B8cjTvRJvxQqgq+FwJoKlyhVK7CASlyu3BkD
         aVRA==
X-Forwarded-Encrypted: i=1; AFNElJ/jlHS+wyVnfb73fTWEx9ZoEw36EfpsZmkSg/YKZd29jB7jZ3NU0MO4RCKUZDQkynePsCGzc4F9PvMc9w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyqK46rdkebl2/RIjBklOdMQos5iW58FI/M5+vVye9ssgcoG1Dl
	NwPJYEmVPo/5zOtE2fpOAJQLAj2FW/4tEdov9YO7EkDBfkxMby1ETyA/
X-Gm-Gg: Acq92OGDLZiZ+Ujcl4CATwZtiCR6+RCiITf1W6fzPrGrNsBfYairgEkdbgf4BjgLF0u
	TVRKs7PdVWEHM8a23iQJ7AeHV6hpSarFPiKFsSaq0LYgofjirLWc2NzMu4qh4bTBKgW27Ih20Mn
	Fp83O1YUrT0vB3BMZz8h+Vjhf2IW9Z3p+4ACf73lo0T+I0OUpujHNkuFNHfo3IlxvpJ1gXGlJ+g
	QRtWAEWPgGCCC/WoQecjj4ZR7RUhJcFUfGg4slTUTPVOQH7Jfa+2FymzLcMOEK833kIucFyevcm
	FGla7X7O79LBr4dnpXp2PUAvmpABHJtowcZ9LxDtUWV5kiewFzlRtRUzDdrkbBwmodLyThLgGwo
	eX8majGRDBKl9ZNCOAm2F0Ll3vq7sqhShrJjDn3lfwE3hew1/jGj3p0Zc7z5gJRdtxE6n130qxA
	znkfC4FA==
X-Received: by 2002:a17:90b:5345:b0:35c:30a8:330 with SMTP id 98e67ed59e1d1-370ebff342fmr22737341a91.0.1781039192824;
        Tue, 09 Jun 2026 14:06:32 -0700 (PDT)
Received: from localhost ([2a12:a305:4::3060])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6bf903fasm20158546a91.2.2026.06.09.14.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 14:06:32 -0700 (PDT)
Date: Tue, 9 Jun 2026 17:06:24 -0400
From: Guodong Xu <docular.xu@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 1/2] dt-bindings: dmaengine: Add SpacemiT K1 PDMA request
 numbers
Message-ID: <6ycdvhpgygnelzp3ot63xtzcnlvac7emngvj7tviiclst4a7km@kjq7oqvecnxx>
References: <20260607-b4-k1-pdma-req-macros-v1-0-5b2a3955007c@gmail.com>
 <20260607-b4-k1-pdma-req-macros-v1-1-5b2a3955007c@gmail.com>
 <20260608-dazzling-hacksaw-dbe84766ec76@spud>
 <qxcpvj3eseclgonwuwx2szn2tj4uxci27mvpqwotj6uaiyj65p@7sx5tyzbfs2g>
 <20260609-freeload-luckiness-7a143eae62f4@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260609-freeload-luckiness-7a143eae62f4@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_140633_777422_CFCF3F8C 
X-CRM114-Status: GOOD (  27.07  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2026-06-09 20:54, Conor Dooley wrote:
>On Tue, Jun 09, 2026 at 02:55:59PM -0400, Guodong Xu wrote:
>> Hi, Conor
>>
>> On 2026-06-08 18:33, Conor Dooley wrote:
>> > On Sun, Jun 07, 2026 at 01:41:30PM -0400, Guodong Xu wrote:
>> > > Add a dt-bindings header that gives symbolic names to the SpacemiT K1
>> > > PDMA request lines of the non-secure peripherals. Device trees can use
>> > > these K1_PDMA_* macros instead of magic numbers.
>> > >
>> > > Point the spacemit,k1-pdma binding's #dma-cells description at the new
>> > > header.
>> > >
>> > > Signed-off-by: Guodong Xu <docular.xu@gmail.com>
>> > > ---
>> > >  .../devicetree/bindings/dma/spacemit,k1-pdma.yaml  |  4 +-
>> > >  include/dt-bindings/dma/spacemit,k1-pdma.h         | 56 ++++++++++++++++++++++
>> > >  2 files changed, 59 insertions(+), 1 deletion(-)
>> > >
>> > > diff --git a/Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml b/Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml
>> > > index ec06235baf5ca..0d4ac9849e27b 100644
>> > > --- a/Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml
>> > > +++ b/Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml
>> > > @@ -35,7 +35,9 @@ properties:
>> > >    '#dma-cells':
>> > >      const: 1
>> > >      description:
>> > > -      The DMA request number for the peripheral device.
>> > > +      The single cell is the DMA request number for the peripheral device.
>> > > +      See <dt-bindings/dma/spacemit,k1-pdma.h> for the list of valid request
>> > > +      numbers.
>> > >
>> > >  required:
>> > >    - compatible
>> > > diff --git a/include/dt-bindings/dma/spacemit,k1-pdma.h b/include/dt-bindings/dma/spacemit,k1-pdma.h
>> >
>> > Why does this need to be in a binding when there is no use of this in
>> > the driver? May as well be a header, particularly if these are numbers
>>
>> Thanks for the review. You are correct that these are not referenced in the
>> driver. My change to k1-pdma.yaml should be dropped.
>>
>> > with a set meaning that are lifted from the TRM, rather than made up
>> > numbers to make a driver work. The former seems likely, given you're
>> > indexing from 3 not 0.
>>
>> Yes, it is defined in the K1 manual [1], see 9.4.3 DMA Connectivity &
>> Assignments
>>
>> Link: https://www.spacemit.com/community/document/info?lang=en&nodepath=hardware/key_stone/k1/k1_docs/k1_usermanual/9.Top_System.md [1]
>>
>> I will fix that in v2.
>
>Just in case I wasn't clear (and I think I wasn't), when I said "may as
>well be a header" I meant a header in arch/riscv/boot/dts/spacemit.

Oh, got it. Makes sense. I will move it to
arch/riscv/boot/dts/spacemit/k1-pdma.h

Note that I already sent v2 before reading this, please disregard v2.

I will send v3.

BR,
Guodong

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
