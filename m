Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A45EAC761A6
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Mar 2023 21:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hHzW6j6tAR6puU209zX0jbZ2pQIrkjVSFBhlYIwIYTA=; b=23ocMBOiRJh5P5
	tu6u7dl9QQdzQIVVOOGsx546+8gl642f6xQCXnVunnxmhLLEMdcuHaYdFm5uMUgt6cct6xta1/QlN
	duvQAGXUeRPykKO7ZtwpkQipsaMJSEH+zj4tsH8wywHay++aJwTT9sPDxcqk1EYvvGQkI2b5Z3urh
	6npudigkPayXB8d+5CKpY0s/o/Ucf+MEB4Ekka7OaSRoejEb27f8j7rC/DmtCNp9QbYQ7RU0aAf+x
	JaGnNM2nGHhJE6gA7gA9rfh+xnMHaab+nRBGxXHQ9cUpm7KdRoxHgLwbCjy3MxDo8O2fatlqB+KlC
	p2EosUnl5NSGd7LLoIkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phdiC-001vWx-0f;
	Wed, 29 Mar 2023 21:52:08 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phdi7-001vV8-2B
	for linux-riscv@lists.infradead.org;
	Wed, 29 Mar 2023 21:52:07 +0000
Received: by mail-wm1-x32e.google.com with SMTP id l37so9746208wms.2
        for <linux-riscv@lists.infradead.org>; Wed, 29 Mar 2023 14:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1680126716;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mR/Zj1PB00aaXey9QznQEyL9cgsnbEviFfaDBojU/PA=;
        b=X0RSiXgHE7YkzJiBvPfuECvjvZh/j9OCTlp5vS9G1kUZuHyE1mJThY46uxE8TkBE8F
         26YKvU03kRSEEbihp0nG/r6HBhciobPuGf3L9XG5lP7LIGmFx1xuZOCywjcKmPOmTu8N
         GYJA3eb2b0Q6VlUVpDCKV/9pvTj9LkixTX22pUdw50wCneJbfivXkkSI84dON9P5F9zR
         aPsg4Jeh3iGHabX4d9hb5dRKHYvbcqGCgHjWCSflhUWkYsO9R2cu9K7Yx5HZpgAK9C+P
         FR/T+Ct46EkosCoWvECTXbDfM4FfGO3jzQMNS58kzGepVwnhUrHOmPZqrc1qrzv6vlJT
         efvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680126716;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mR/Zj1PB00aaXey9QznQEyL9cgsnbEviFfaDBojU/PA=;
        b=n2TjbB1gCS5ipR4zuiUu9qBfN5knktpDON8eRd0e9imsclg4lGhCcATsV36OUIUPsH
         /5yrFwsVcGffNG+xSDWPm3ABME1UQL/RPjT1Ko3qG0391CjZvqwDYC3OQOJN8f0cnEdp
         PCThMTPTTRABa24MBCcFsic1Fe1R4S20trT4oQ4zsHz8QX6kUy7s/JGPrBJl0ExMxAEp
         Da7lC3X+K7JoSzp9S5AQ3gsSpBKJbPIBTXDcLUURWW7aR6qEOJj1Kf1rldQ8HQG5a6xn
         eXMMuXPOTueIk5JwITOZR3iKJCaHAlMNU1wgHsPZRfUQLlDskJKdUZDALyBUxGwWB9OZ
         pJxA==
X-Gm-Message-State: AO0yUKVDXEYukk9T2Ii9hoHoSSSBKfGdAdWQxBHMMUZi8JYE+rX3QdI/
	W9pqrcxRYgDLAQCO01GYEjm1xQ==
X-Google-Smtp-Source: AK7set8QoMq1gGRgzzGqEiUi0STo43D8VYRH41LQHDT7NbD/gZR3RJOV/DBadJ5PrJGjWGmEaVtwcg==
X-Received: by 2002:a7b:c413:0:b0:3ee:4531:8448 with SMTP id k19-20020a7bc413000000b003ee45318448mr17263952wmi.39.1680126716518;
        Wed, 29 Mar 2023 14:51:56 -0700 (PDT)
Received: from smtpclient.apple (global-5-144.n-2.net.cam.ac.uk. [131.111.5.144])
        by smtp.gmail.com with ESMTPSA id a18-20020a1cf012000000b003ed4f6c6234sm3437896wmb.23.2023.03.29.14.51.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 Mar 2023 14:51:55 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH 08/21] riscv: dma-mapping: only invalidate after DMA, not
 flush
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20230327121317.4081816-9-arnd@kernel.org>
Date: Wed, 29 Mar 2023 22:51:54 +0100
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Vineet Gupta <vgupta@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>,
 Brian Cain <bcain@quicinc.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Stafford Horne <shorne@gmail.com>,
 Helge Deller <deller@gmx.de>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 "David S. Miller" <davem@davemloft.net>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Christoph Hellwig <hch@lst.de>,
 Robin Murphy <robin.murphy@arm.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 linux-snps-arc@lists.infradead.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-oxnas@groups.io,
 linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org,
 linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org,
 linux-xtensa@linux-xtensa.org
Message-Id: <837F1B2F-7090-4F9F-A894-594ACF6A8DB2@jrtc27.com>
References: <20230327121317.4081816-1-arnd@kernel.org>
 <20230327121317.4081816-9-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_145203_734907_13710641 
X-CRM114-Status: GOOD (  20.91  )
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

On 27 Mar 2023, at 13:13, Arnd Bergmann <arnd@kernel.org> wrote:
> 
> From: Arnd Bergmann <arnd@arndb.de>
> 
> No other architecture intentionally writes back dirty cache lines into
> a buffer that a device has just finished writing into. If the cache is
> clean, this has no effect at all, but if a cacheline in the buffer has
> actually been written by the CPU,  there is a drive bug that is likely
> made worse by overwriting that buffer.

FYI [1] proposed this same change a while ago but its justification was
flawed (which was my objection at the time, not the diff itself).

Jess

[1] https://lore.kernel.org/all/20220818165105.99746-1-s.miroshnichenko@yadro.com

> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> arch/riscv/mm/dma-noncoherent.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
> index d919efab6eba..640f4c496d26 100644
> --- a/arch/riscv/mm/dma-noncoherent.c
> +++ b/arch/riscv/mm/dma-noncoherent.c
> @@ -42,7 +42,7 @@ void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
> 		break;
> 	case DMA_FROM_DEVICE:
> 	case DMA_BIDIRECTIONAL:
> -		ALT_CMO_OP(flush, vaddr, size, riscv_cbom_block_size);
> +		ALT_CMO_OP(inval, vaddr, size, riscv_cbom_block_size);
> 		break;
> 	default:
> 		break;
> -- 
> 2.39.2
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
