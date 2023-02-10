Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C21C05027
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Feb 2023 08:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E5lBPXKW6iYXisaHrisWqQI0LZWBIs/KqFtyRt5FII4=; b=rt8OfbxVjuVu0w
	GL494of08yJwnEv/Ses3Mjkq76fw7XkL+jrtCTNYwb2myzBtqDMOJfDfoea5w1TIu5cCHZVHbw/eK
	egUBGz7/yIpirZQsjsmW4frBanG7Wj7/Da3UIb+gaL8avISSOHcVbilxldDm2zWfcrQoun1wuuhvq
	OcnfdDXhq/a0oP9JFh4DbKvkZ/QnOwPhQme3ntVjVLBTxnhUU2QWAyHNJK+LqqqiWbDChYXw3Kq7k
	WzWWfRjGTwAHHko65ZLhykdNhbi95+lI3Iv/+CXTK77hPe5mBbfhTg+7a8cj289jV9WrHI+sOqMxs
	DJSPnHcRfDRN5wUPLBGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQOPL-004iR4-Gy; Fri, 10 Feb 2023 08:05:23 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQOPJ-004iOQ-04
	for linux-riscv@lists.infradead.org; Fri, 10 Feb 2023 08:05:22 +0000
Received: by mail-ej1-x632.google.com with SMTP id rp23so13601908ejb.7
        for <linux-riscv@lists.infradead.org>; Fri, 10 Feb 2023 00:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YmDT4zBOv7f5zRYd/LGifmvLvDTU12OHORT99G1LfOU=;
        b=Y9zpKSImEri04j45mKwlwM/eZAqNEzxYls5b0gDiTbUkhmHKXlUzSnJAcc5CQWEr1y
         Gvxk6Rn8WpZDY1RCzcyXg0pGMkFBcxINtHSMZddcKPjXhYD/5P9Vwx0B36agZT1hFOdK
         Tk+l2ypqlkeKXymvELryxGdGfP8SU7yMZ7mtkQWwAWyA4HjkRBjK9GimVT15ktAd7/Oh
         aeQm352qT3lkhQBbvoy3mHbFadvAjOtuWoiy//uiv87Phz1YA8rfk3jO+7mHXoMxKSmE
         4yKgJLHbveUe+iYTefT9cqX41+4+/1w3RqLyz4NibTN5cNtR8aeUux//zDuSnBsvyW7k
         vNEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YmDT4zBOv7f5zRYd/LGifmvLvDTU12OHORT99G1LfOU=;
        b=hRxz+GTnEWuswFgKhcCCfmMlPBxk/TR58eFniLY5eUdt1P1x0Bilbdi18jHGFoNjUP
         Hr1MAToVLnk3Gsk/jI/CNZpbW4JyLjZiDJd9MPLqDO4J0WV6388oi/rqtVbRu2riETRe
         m44CjGiEGmMd6ewmNAAWaMaqb+UNpEoy38PAeWeVI+/pRogcfd8CySqvZvD53YGs0cpj
         ruMDZMLVcAcvSTOgnfBwkDtEbJRFZNOjIH6AmQUcatvDROhHCs1Bh8SmfT8mFthD2Ahf
         GfdntNCXQUmZlpWKR6f4+9EsJrtXkz4XZlvq1vAfG9jxtqvWKb1lOHUzlEmVK/zFZXZ/
         xSRw==
X-Gm-Message-State: AO0yUKUc1xQIHJk2j0hchQzPHZf67NVZRAXzWPeQdZuN+aivoB1WC0RG
	wgPD7xvWY3N64+Fjvl5IjDVI0A==
X-Google-Smtp-Source: AK7set/GmZ7x5k7vkcggDqpyfSq4+49rR67zA9Au4+fWjYyYJduZ7NpbIFaApG4e7v1zNQg0P0/Okw==
X-Received: by 2002:a17:906:edbb:b0:887:2248:efd5 with SMTP id sa27-20020a170906edbb00b008872248efd5mr16697995ejb.77.1676016316810;
        Fri, 10 Feb 2023 00:05:16 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id o12-20020a170906768c00b007bff9fb211fsm2031989ejm.57.2023.02.10.00.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 00:05:16 -0800 (PST)
Date: Fri, 10 Feb 2023 09:05:15 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, 'Anup Patel ' <apatel@ventanamicro.com>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Krzysztof Kozlowski ' <krzysztof.kozlowski+dt@linaro.org>,
	'Atish Patra ' <atishp@rivosinc.com>,
	'Heiko Stuebner ' <heiko@sntech.de>,
	'Jisheng Zhang ' <jszhang@kernel.org>,
	'Rob Herring ' <robh@kernel.org>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Conor Dooley ' <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 6/8] RISC-V: Use Zicboz in clear_page when available
Message-ID: <20230210080515.lbguxxg4efxudjzg@orel>
References: <20230209152628.129914-1-ajones@ventanamicro.com>
 <20230209152628.129914-7-ajones@ventanamicro.com>
 <Y+VFAUZ2smkKO0EZ@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y+VFAUZ2smkKO0EZ@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_000521_054759_A182AC07 
X-CRM114-Status: GOOD (  28.09  )
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

On Thu, Feb 09, 2023 at 07:09:53PM +0000, Conor Dooley wrote:
> On Thu, Feb 09, 2023 at 04:26:26PM +0100, Andrew Jones wrote:
> > Using memset() to zero a 4K page takes 563 total instructions, where
> > 20 are branches. clear_page(), with Zicboz and a 64 byte block size,
> > takes 169 total instructions, where 4 are branches and 33 are nops.
> > Even though the block size is a variable, thanks to alternatives, we
> > can still implement a Duff device without having to do any preliminary
> > calculations. This is achieved by taking advantage of 'vendor_id'
> > being used as application-specific data for alternatives, enabling us
> > to stop patching / unrolling when 4K bytes have been zeroed (we would
> > loop and continue after 4K if the page size would be larger)
> > 
> > For 4K pages, unrolling 16 times allows block sizes of 64 and 128 to
> > only loop a few times and larger block sizes to not loop at all. Since
> > cbo.zero doesn't take an offset, we also need an 'add' after each
> > instruction, making the loop body 112 to 160 bytes. Hopefully this
> > is small enough to not cause icache misses.
> > 
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> 
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > index 74736b4f0624..42246bbfa532 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -280,6 +280,17 @@ void __init riscv_fill_hwcap(void)
> >  #ifdef CONFIG_RISCV_ALTERNATIVE
> >  static bool riscv_cpufeature_application_check(u32 feature, u16 data)
> >  {
> > +	switch (feature) {
> > +	case RISCV_ISA_EXT_ZICBOZ:
> > +		/*
> > +		 * Zicboz alternative applications provide the maximum
> 
> I like the comment, rather than this being some wizardry.
> I find the word "applications" to be a little unclear, perhaps, iff this
> series needs a respin, this would work better as "Users of the Zicboz
> alternative provide..." (or s/Users/Callers)?

Right, "applications" is an overloaded word. "users" is probably a better
choice. "callers" isn't quite right, to me, since it's a code patching
"application" / "use". Do you think the function name should change as
well?

Thanks,
drew

> 
> > +		 * supported block size order, or zero when it doesn't
> > +		 * matter. If the current block size exceeds the maximum,
> > +		 * then the alternative cannot be applied.
> > +		 */
> > +		return data == 0 || riscv_cboz_block_size <= (1U << data);
> > +	}
> > +
> >  	return data == 0;
> >  }



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
