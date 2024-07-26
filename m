Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C0BC3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jul 2024 16:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UC7Fl5v1CTnsEI/WMaSvCT9vJZGYX2uKfTrCVbnj/pM=; b=k30lRTVawgoerT
	GxxCT2xzcsK0Iz8VELuXLuZPtxknNQl4Lb10pzc2/oifhWGcC/oKdjyz1Vl78NWwdnj42ViIuuUns
	z4V9LLo+yR6VMio536ji8oKF5wAmnSj3OCu0Lf2dIiCjcllyaY5QiOb/PPU69DY82s8rMLtchDHi9
	EYTwZJABukXfJpQb1Lh2qJq0tsdzVg/2QmWsJppJGqbUw+U5c3c2jJjKr4Q62Y+WNsi5NN29J4Jrq
	IX0aMsR7FQSxqSHhXnN1S04EO/emuduloixXdMsU/MpGlk4+N9fPP7tY9JRuX4xK5YeRRhaOFkQcL
	tORF/UNSgqzEaf4Q3xvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXNxQ-00000004RJV-3eDY;
	Fri, 26 Jul 2024 16:38:16 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXNxN-00000004RG5-2JXs
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 16:38:15 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1fc569440e1so7956485ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 09:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1722011892; x=1722616692; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a0HpN9HmDodrUSDORXqRofIB4AnVMlhB5oPbGsDNiZk=;
        b=DNi6dYVK07uz6gRsbURaDCBAtBzcJVotmtNM3wFGaVRpmpz+PxX5Saezq2XjRYx1hl
         4KaUL5uwYdjSJcg8Zon/JmSO1E69BFxReSZQF1DK7faUQ/UqMbUV9ajOwwK4kqaphbYH
         FrdUk1ENdUdxklIgiwtEaDiOGKyV9sswbe7VPcJt8xRiPGQ62Fh/tpw15HuqF9AXUeTV
         yo17vUVqqcaF6DdoqXQcvDufvm61Ld3ZvrMv7yderYl7CMOR5KXq14LlecL13p7Lfz/j
         APGGqC2lqzMW1czSFecz2ELqgJRYqfk0U6RRX3dSzW5O049OJdJS9IZfdpunIup+TOwN
         KoTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722011892; x=1722616692;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a0HpN9HmDodrUSDORXqRofIB4AnVMlhB5oPbGsDNiZk=;
        b=cqEY65pH1qDTCDGNllfuG4ZwuaZqZSQeR5zP89KcIJc0f6TUi7czUYBCpb7E5MZBB3
         T/Q9vkpvE7GVSrLhfqJROm0oPUV0z9kzDZ4wJg8qf5dAd6t1lNzBPFEmVcwezTZp4BAe
         zUX+AP7TkSqTpNH/K8KWY79mMdMHlssvpBPgs9YO9dKquDI7NNwAPIn00lfSPdDj8Au2
         gSKROCCSVLdIv9x6mn33ew+omusCGj+u5KuTT2r0YR2t3dVVyUtPAT5sj+CSQ719mgI4
         IXIjeMwX1iouoD7kFMZs5BivfpSqJaeYclfH0/WRkAyGzCIFnZaMVmx9NQnnmiHI2kJb
         TiOA==
X-Forwarded-Encrypted: i=1; AJvYcCWF54PHHy6dqFnGBIqlT9l3bsH4pnuSAu8lwfmuBjlpntHRQxjHXpkbdqrOwN/KfJo7xW3r3gzi2zWz7vi25PTrT5+hfJhHFRBaLE77EeLM
X-Gm-Message-State: AOJu0YxQSRViRlxoFT+5ubyeBI2frOBrQykZ49btUrmOWQmNpKsV0fKm
	kI01VJoRWBvDhXQ4pCpwgMEfhCHq6TNPqgs97G7ZTPR7PuAT06XLn4t5p5/HXd4=
X-Google-Smtp-Source: AGHT+IGgSdGMTreHVjBjvhyywbGtPKuHA78vW4E4X9Wxkh8LiuFv+1u6kKBI9jhD+IpTldIfmpl/Bw==
X-Received: by 2002:a17:903:234d:b0:1fd:80f0:e859 with SMTP id d9443c01a7336-1ff047e4564mr2287615ad.2.1722011892159;
        Fri, 26 Jul 2024 09:38:12 -0700 (PDT)
Received: from x1 ([2601:1c2:1802:170:dd1c:823c:f5e3:153f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7edd91asm34682265ad.131.2024.07.26.09.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 09:38:11 -0700 (PDT)
Date: Fri, 26 Jul 2024 09:38:09 -0700
From: Drew Fustini <drew@pdp7.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor+dt@kernel.org>,
	Drew Fustini <dfustini@tenstorrent.com>, Fu Wei <wefu@redhat.com>,
	Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh@kernel.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Yangtao Li <frank.li@vivo.com>, linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 1/7] dt-bindings: clock: Document T-Head TH1520
 AP_SUBSYS controller
Message-ID: <ZqPQ8X51S6PrzQxI@x1>
References: <20240623-th1520-clk-v2-0-ad8d6432d9fb@tenstorrent.com>
 <20240623-th1520-clk-v2-1-ad8d6432d9fb@tenstorrent.com>
 <57ef2eef45f2de15e6607da266b37b2a.sboyd@kernel.org>
 <CAJM55Z8iF8yV5JK5v6ZtQqS5AaWwCZ7uwhSYb7hdxh0juDFdqg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJM55Z8iF8yV5JK5v6ZtQqS5AaWwCZ7uwhSYb7hdxh0juDFdqg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240726_093813_760135_C1AF89D4 
X-CRM114-Status: GOOD (  14.47  )
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

On Fri, Jul 26, 2024 at 03:45:36AM -0500, Emil Renner Berthing wrote:
> Stephen Boyd wrote:
> > Quoting Drew Fustini (2024-06-23 19:12:31)
> > > Document bindings for the T-Head TH1520 AP sub-system clock controller.
> > >
> > > Link: https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20System%20User%20Manual.pdf
> > > Co-developed-by: Yangtao Li <frank.li@vivo.com>
> > > Signed-off-by: Yangtao Li <frank.li@vivo.com>
> > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > > Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
> > > ---
> >
> > Applied to clk-next
> 
> Thanks, but this driver seems a bit incomplete. With this applied the Lichee Pi
> 4A no longer boots without the clk_ignore_unused kernel parameter.
> 
> /Emil

Is this the case when you apply the dts patches from this series?

The dts patches won't go in until 6.12 so I don't think the presence of
the clk-th1520-ap.c itself in 6.11 would break existing systems.

That said, I have been using clk_ignore_unused. I had been thinking that
made sense because the full set of clock controller drivers like
AON_SUBSYS (always on), AUDIO_SUBSYS, DSP_SUBSYS, etc, are not present
yet in mainline. However, the T-Head vendor kernel does have drivers for
all those clock controllers and I was suprised to see that the vendor
kernel fails to boot when I just tested removing clk_ignore_unused.

As for clk-th1520-ap.c in mainline, I'll investigate further which clk
disables seem to causing the boot failure when using the dts from this
series. I suspect I may need to add nodes that will cause the necessary
clks to be enabled by their respective drivers.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
