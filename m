Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC9FC87FC9
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Jul 2025 04:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3NFFwWDqrjj0JammV3GkMFkhwmuKwOCujK0o/F582TM=; b=xpleaYuewRng8u
	A4cXwuJZngExk0f+bt5OxusAcG57sYPPL8Z3j4S9E58mQcXMd669ZIW3suaQYgx6Hl0GYXk4lggsb
	veHZs2HigASMUbN7wJvhyYNreZQqRbbQ3X7Qhju8VsDAIZCSMbeRw1EcwdBeQxbQWGWOSBeSgcIOb
	cX4Otil2hxjcI4wexq+Dx36HBPaTaVh6WlqzSMQBxddFgCQ45krXDAsMDg3lx+CyMkwpOsmLJBCgL
	skUhdsLWABkX5qLWzc8r6jHP7jRiQkBjyoRJA45PN+gZTZJx80Fy6GZXKL324ELD1fP8CuKCV0bZK
	9lJFDTl4YQNEaZfp88aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugykJ-00000000gwC-0dHM;
	Wed, 30 Jul 2025 04:48:55 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugykG-00000000gvs-3Pe5
	for linux-riscv@lists.infradead.org;
	Wed, 30 Jul 2025 04:48:53 +0000
Received: by mail-io1-xd2b.google.com with SMTP id ca18e2360f4ac-86cdb330b48so41159939f.0
        for <linux-riscv@lists.infradead.org>; Tue, 29 Jul 2025 21:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1753850931; x=1754455731; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VPl1wFVqasFlsqib0+/3K33ZAFpU1sORgwmap3qJ55s=;
        b=obnzMnrp5w56ccpTqWiFGrcL+hJJb1jXAKFVjwtt7QA8uzP/BcBAdxgaKzTwPXWE5U
         1gL+J/j837R56Nh+tTWg4qyxamENpPkq1O38WqbTIwgvncTZbPlwzMN960qF4aNmwBWP
         2lA70v/pVFrdKK1x7pmT5xzaOLn6+wpadFwevGePqSAYOFtIAMEK/OVDTA5zyAZNv3BR
         rr8DX+Dj3Ihi/Ig3sa5EvwFRws15GOkWyt6kNOmH4FqKRtOC0G9PiYgpiGSF4ZXBdnFd
         bVIEUEMa+nQyxoH1OYbhuZEy7JFEH/27kKmGd7jad2EPDGPAG/+vxsrCL1LUK2FdjYW+
         UHNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753850931; x=1754455731;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VPl1wFVqasFlsqib0+/3K33ZAFpU1sORgwmap3qJ55s=;
        b=eGMmDhStqLt8e3hXV81HGsjACTXo2oDfxav6Mti9/dsV19WlNCKNImIlb5rTWi+cnp
         ++nOauhw5q/5mv+xm1zq2YZk65y1hT70Ao1L21xGi0Yaf8gjGtcFvu7AzKfXmXwqryN6
         et5wZVbX7TVNN99vpN3h1irsDUGadRQl5kH6IBjSJaPdyWL7mCrSjCBlfMb+/Chatomn
         mfXgJbsioeY7O6hWrUZvwoxuc4ciMBWAgrn4tDybBCClcfMLjJQLHZOzRxwOaCMt9qT7
         ax4smtO9ktv3JzeMGjU7QjU2QVYwluaMD5z5ZB8vnNU0ajslJngAC8J7Rss1Vinhg+vs
         3+QA==
X-Forwarded-Encrypted: i=1; AJvYcCU6Q6q+FIU4Xt31zsh8TKDa40DhAcFmiBX7CuKqv7EpUPbRs5gqORJVK1ir9NTVjQQyIV2ro0dCc/K9hg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzadFlZkrEvXNFjoj3Zzm8emXPlXOndSTZPR2mWbP6IL05tFuHR
	bs01qImpL/lYV1HqVzLm7UX0OPO7XGakVQvRQh3LU4XrA9uM7ZP4zKTBha2R7C16hZQ=
X-Gm-Gg: ASbGncu5uLtPRPNCp8CmZ5OCGa42y25YCEOPj2XbFPioGVBJDDGPeU4fLBgKy3d/tqb
	RLFoU6fj6wU0HnuW22n6dkbypRPSbPfV1yD1skdpjmf/hQKMszZchwlh4kYznHTt1Egdu51nODp
	3MIKSkrDP6ukK38ZBwUJpw7j+R0ZEAvhI9Peni6ya62DBdkl8klA4NVzEb7xIBrsI6VglkxA3TE
	AAc0tp6gNSG08eefic4vPUv5xkAgSuq9JQtxN/op5tdQdj9IO6qjOR1vI4fWsD/WT9lUnV0xqHX
	3cVFyvZDqKcxNizKUkQP7Cice68bY2ArEpxTEuV3zSu6QjCQU0jKgrwRo2PZHuV45hv2yczweY/
	m3idpnAgV3Q9AkLN2cAx/TDSkI9pGKQ==
X-Google-Smtp-Source: AGHT+IEsXPHu9g+BneDfRP9LOcvRJRqJp98NpR+/ErEyM7y7imVQRsQERm1/6PmyACRIulSbKbv+yQ==
X-Received: by 2002:a05:6602:340e:b0:880:f66f:b896 with SMTP id ca18e2360f4ac-88137c61a84mr417789039f.11.1753850931495;
        Tue, 29 Jul 2025 21:48:51 -0700 (PDT)
Received: from sunil-laptop ([106.51.198.219])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-880f79b3631sm281156439f.14.2025.07.29.21.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 21:48:50 -0700 (PDT)
Date: Wed, 30 Jul 2025 10:18:41 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	linux-riscv@lists.infradead.org, kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: Re: [PATCH 0/2] ACPI: support BGRT table on RISC-V
Message-ID: <aImkKUw4OVyiLlXe@sunil-laptop>
References: <20250729131535.522205-1-heinrich.schuchardt@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250729131535.522205-1-heinrich.schuchardt@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_214852_854299_17211603 
X-CRM114-Status: UNSURE (   9.57  )
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

On Tue, Jul 29, 2025 at 03:15:33PM +0200, Heinrich Schuchardt wrote:
> The BGRT table is used to display a vendor logo in the boot process.
> There is no good reason why RISC-V should not support it.
> 
> Remove the architecture constraint.
> 
Thanks!

For the series:
Reviewed-by: Sunil V L <sunilvl@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
