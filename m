Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F1D1C25B78
	for <linux-riscv@archiver.kernel.org>; Wed, 15 May 2024 17:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rsOckX6vFE/QUGkm0BsAVW1hf2Fwk4zwTMhCaED3UOo=; b=W3o82B+7+TvM9S
	o+eRe/aXOdZwu5CJc4WyA6SUEfuUOHoFVc3R9+1yAuSsSPDBfEeFnkYfunVOEsXtSvd9mwdZB68zb
	Ok8/t3FK74+23j9mNNdhL0kSZa2AzT6wccvhIS6Alo4mnvE74/CvcQodpSJTyrqwjohyLMGcDRF/r
	uvqatMnNi+glO4PlRbaL9XZjR1wjEWL+XX2vn+XAZD1akr1YGt2EGDmEjtIoVBdGn5gAEA9vj+Aar
	28x01dc1n8uVM6oJoyR7YjnWiKd5GQiwSH6OlrnytAwdxf7rKCJaAdr327VgoLFX0Hk/ABKRhMAAC
	WLFs//9HOs50K/phMKUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7IHD-00000002J15-1XD3;
	Wed, 15 May 2024 17:18:51 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7IHA-00000002IyA-09Gk
	for linux-riscv@lists.infradead.org;
	Wed, 15 May 2024 17:18:49 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1edfc57ac0cso59796295ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 15 May 2024 10:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715793526; x=1716398326; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sMRgIxRDxTtgBIlS3j2j7+NXryr0xF0JVKBnk0pt4+o=;
        b=nYJwUGgBGwJj9M0a4CBbkkXik6Y/Spt0X8S4A5L8TqRmb5TVwW3qgl+ATU8/rlmZGv
         mKGjM7Zgp7+hk60+T/Whq5/X9Tf+60UuTYNyUoy/2FwftAwoCu153B1FGKCjBPGvH9s6
         AntiCA8BByBFZp41Fu6Zy727/m2WAtKl34ceBUdKJPKiQ5ko/XF4h6r/fLhwbmcSvDwO
         IR9wq9buSeYgJcwZd9P5xyZ6uROf+pPvKFvyPeTmWMsd8simBvy6jSK/FIlGtCIeyzWh
         PfBGh7JbjNkshpb6Nxyx1m26+F8YNvynj+WQMq2nMObJ2H+jtmSKGl8B7y6a5b1f2KDE
         82nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715793526; x=1716398326;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sMRgIxRDxTtgBIlS3j2j7+NXryr0xF0JVKBnk0pt4+o=;
        b=xRrr9D60DdoeM7rVOlckYI9zj0zbUzNsusMdAdEPmHwHmyZgoCKNoMOPFXWdlbG+Un
         lnx7Gn0f2hE2xkrqXcyN7XjeHfwgeBbbyzBc1DZpkC+75u3JxpzgIBS/+6tSDgStTxfp
         bTOaA6ETVHriilgYqo1AsJ3utQ/B6M+v58xSQJhmgt9YZDJWAaIY4J0ittAyEf76OMAo
         QSuKX5uSJijcvpfAmsETh7BGh7qBuce1qD63RYrKtpJo6YfT2hQOl8QmG5j0ehNJ7qbr
         BH94t4qdgYPyEutStvV5XFR+9+8kKF7inEb0+K+VF/rqrV2Ylr46ZjVZU0h9O+KN0axh
         HCnQ==
X-Gm-Message-State: AOJu0YzlRG6DDsbwQgK2M9Y6q+WlEfGGWuN+TZ21gG7iOrfWPJN7E6gy
	anDx0NLp6cW3il9Z9TpH6NpACS0EhmLdkiPZF2S5RZ1sFMje2U/IsLCzzkFMmW/GsZPMZpe/Ecn
	s
X-Google-Smtp-Source: AGHT+IE5hyJawzSf8ZM4GI4gk91af4sKnGyPtAY3fL7zCfLOuNGd4lOCiIQTpvmplgfpjQtAiPBA+A==
X-Received: by 2002:a17:903:1cd:b0:1ee:8fb7:dce9 with SMTP id d9443c01a7336-1ef43d18246mr199563625ad.15.1715793525935;
        Wed, 15 May 2024 10:18:45 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:144c:7973:ee0f:85cd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bf30b2dsm120929815ad.148.2024.05.15.10.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 10:18:45 -0700 (PDT)
Date: Wed, 15 May 2024 10:18:43 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] RISC-V: fix Andes errata build issues
Message-ID: <ZkTuc4fxXcS/g7hC@ghost>
References: <20240515-comic-sketch-3b40e6676f55@spud>
 <ZkTnlEnoFFrQdXi2@ghost>
 <20240515-slander-stranger-683758537aee@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240515-slander-stranger-683758537aee@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_101848_106943_CB9D6823 
X-CRM114-Status: GOOD (  29.02  )
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

On Wed, May 15, 2024 at 05:56:30PM +0100, Conor Dooley wrote:
> On Wed, May 15, 2024 at 09:49:24AM -0700, Charlie Jenkins wrote:
> > On Wed, May 15, 2024 at 05:09:34PM +0100, Conor Dooley wrote:
> > > From: Conor Dooley <conor.dooley@microchip.com>
> > > 
> > > Commit e47c37c24024 ("riscv: Introduce vendor variants of extension
> > > helpers") added includes for the new vendor_extensions.h header in
> > > the T-Head and SiFive errata handling code but didn't do so for Andes,
> > > resulting in allmodconfig build issues when commit 589e2fc85850
> > > ("riscv: Convert xandespmu to use the vendor extension framework")
> > > added a user of a macro defined there.
> > > 
> > > Fixes: 589e2fc85850 ("riscv: Convert xandespmu to use the vendor extension framework")
> > > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> 
> > 
> > I was going to fix this in my next version but was waiting for the
> > reviews on the thead stuff. I wasn't anticipating these patches to be
> > able to jump the queue :)
> 
> Yah, the reason for that is I asked him to take the non-vector parts of
> the series as 6.10 material so that we'd have less stuff movin' around
> in cpufeatures.c so that Clement's Zc* + validation changes wouldn't run
> into a bunch of conflicts etc. Same reason that I pushed for getting
> Andy's vector subset stuff merged today, but that mighta been before you
> hopped in.
> 
> Cheers,
> Conor.

Yes I was a couple minutes late to the meeting, whoops. The subset of
patches that was pulled into for-next is odd to me because there is some
of the thead enablement code as part of the vendor extension enablement
so that there was a user for it. Since the subset on Palmer's for-next
does not have the rest of the thead code there is only a
half-implementation of the thead code, it allows the kernel to probe for
xtheadvector but it doesn't probe anywhere.

In my opinion, a better solution would be for me to get rid of the thead
code entirely from those patches. So that there is still a user, I can
replace the thead code with the andes versions.

Since Palmer already pulled in those changes maybe it's too late. There
is not a critical problem here, but it seems like it's bad practice to
introduce code without a user.

- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
