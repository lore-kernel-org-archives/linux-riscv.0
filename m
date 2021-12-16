Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BBF7C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Dec 2021 21:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u9u4w4YO3hgAroeZi3tXFwAOfCZ/t1qKt3Vww9OiNYA=; b=rs8FcFqlt/qgNY
	1UZTLztUtH4JgLdKXJefQoTY4+ks3iD/aRIQDx4DxQkoGAYS55ZnxG45Hvx8/kiAEnlzKCdCVpcAd
	aKLExyMphP+lvocbO92C/mWe/qqSgLHPZ6iKYNxjNFJ8om117bSgeKZqWzFAXcl2LwWKsuKeT1izs
	96soodObffuSMK8Vs0uBxbP2waBLSVI2cOsg+iGRPQJKICQ4chKFiN6T4Qc/tiumHmuVV2N54BZ6X
	20jGSmaYxb6oePWc9EmSjfl8dvWDuMdjGxM6468TlSrRRkX5Eyq+Z22aqg6ykQKZVSu9OPGB5WFOQ
	4b9G1a9SVFYi2jKZUJ1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxyKb-007gLH-BY; Thu, 16 Dec 2021 21:30:29 +0000
Received: from mail-oi1-f179.google.com ([209.85.167.179])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxyKX-007gHr-Ug
 for linux-riscv@lists.infradead.org; Thu, 16 Dec 2021 21:30:27 +0000
Received: by mail-oi1-f179.google.com with SMTP id q25so875061oiw.0
 for <linux-riscv@lists.infradead.org>; Thu, 16 Dec 2021 13:30:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xQLFTn5sOGEEmLerVKH572h9vk+6RxOTr235biGe564=;
 b=blZVOJ6LKrlg/R0EpjCpRHrY/dYSEEIbcAWOWLVFjaq2TuNjWMRibOo3uQapmZTXnx
 RUNFUkUHcZimV3NIibHGahizq44WajcXtGfs+XSNNdf54nRmt+y5v0bwzUamY8bal5jz
 66lCMl6s3cSZH+pRgMZLidPxHeuSNd8fC2cKkKbPtO+DX/xdG7+P3OeHcya2loYYqDc8
 g8lEufV4ZW/B21jn28mwp+8FMxHNM+Nr/EYmhOTIgcELus+yI5eEXkLwGrI+s8Ba06VC
 Cv/WQqgJwayCjfJhuIdahHylYmedMkenwSocRga4WhuF5U1WYXu9Fp0YRwC1E/br3PfM
 Zr6w==
X-Gm-Message-State: AOAM532fiuP8HLbBhQQ6zFdp4Ha+rRd38GHgarHFMsE2fajuSx6ckl0d
 xa0qVEtScsUH1POCCNWoZw==
X-Google-Smtp-Source: ABdhPJzUo9Ri1qNW0PL/FnJB/g+cONcHN/H/7uk4i9o4D+VheVbl/XNnwO+1pldebFqsoNQkzwWWQw==
X-Received: by 2002:a05:6808:15a:: with SMTP id
 h26mr5576944oie.36.1639690225385; 
 Thu, 16 Dec 2021 13:30:25 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id x13sm1239730otr.58.2021.12.16.13.30.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 13:30:24 -0800 (PST)
Received: (nullmailer pid 799173 invoked by uid 1000);
 Thu, 16 Dec 2021 21:30:24 -0000
Date: Thu, 16 Dec 2021 15:30:24 -0600
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup.patel@wdc.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: timer: sifive,clint: Fix number of
 interrupts
Message-ID: <Ybuv8I1TW54i0NDm@robh.at.kernel.org>
References: <cover.1639662093.git.geert@linux-m68k.org>
 <d66c5aa3744c877e43fe93537b03ed9fbb2642c0.1639662093.git.geert@linux-m68k.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d66c5aa3744c877e43fe93537b03ed9fbb2642c0.1639662093.git.geert@linux-m68k.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_133026_013190_6CDF7237 
X-CRM114-Status: GOOD (  15.66  )
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

On Thu, 16 Dec 2021 14:43:47 +0100, Geert Uytterhoeven wrote:
> The number of interrupts lacks an upper bound, thus assuming one,
> causing properly grouped "interrupts-extended" properties to be flagged
> as an error by "make dtbs_check".
> 
> Fix this by adding the missing "maxItems".  As the architectural maximum
> is 4095 interrupts, using that as the limit would be unpractical.  Hence
> limit it to 10 interrupts (two interrupts for a system management core,
> and two interrupts per core for other cores).  This should be sufficient
> for now, and the limit can always be increased when the need arises.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> v2:
>   - Split in two patches,
>   - Improve patch description and document limit rationale.
> ---
>  Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
