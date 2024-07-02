Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E84C3064D
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jul 2024 09:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JoxmmYuL6v7/r1WVHPXGh7TfO3Aid+3E+Y4V0j6a8xg=; b=ayB/RmFwQDfevx
	b/wbSJSzlnB88Ge+mJweO7J2Ses2xLwT8MjkrQxuoXCtehb39eFVBXwzNLQhp9MWup/wiRhvhWVV2
	3A0VIX3gF0sChwoIrWY+kmQhmNosULeLcXWe5fLgJnyrmS7SpgOqQOmCpE/Y3LFNlIuEH7YAAqeEI
	Jaq0nlM+QP7wksKTkESj0a02agPeZDKWDp0sWQxX8SEC7nw9ieOpKLCrsKYfRVdtBoppEgQ0sncog
	v91bIcHx91iB76GCTPlZQ52wL73XjtmlLsXJDXODYB9t2bvqQiinSwMWeJphZ0oDIhjUs8CR49R5m
	iS+iLDcO28EhmNltJ9rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOa6h-00000006ECv-3xGt;
	Tue, 02 Jul 2024 09:47:27 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOa6e-00000006EBb-0vk3
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jul 2024 09:47:26 +0000
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTPS id 4629kkj0053530
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Tue, 2 Jul 2024 17:46:46 +0800 (+08)
	(envelope-from peterlin@andestech.com)
Received: from APC323 (10.0.12.98) by ATCPCS34.andestech.com (10.0.1.134) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 2 Jul
 2024 17:46:46 +0800
Date: Tue, 2 Jul 2024 17:46:42 +0800
From: Yu-Chien Peter Lin <peterlin@andestech.com>
To: Conor Dooley <conor@kernel.org>
CC: Samuel Holland <samuel.holland@sifive.com>,
        Charlie Jenkins
	<charlie@rivosinc.com>,
        <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-sunxi@lists.linux.dev>,
        <linux-doc@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
        Conor Dooley <conor.dooley@microchip.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Paul Walmsley" <paul.walmsley@sifive.com>,
        Palmer Dabbelt
	<palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Jisheng Zhang
	<jszhang@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec
	<jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Jonathan
 Corbet <corbet@lwn.net>, "Shuah Khan" <shuah@kernel.org>,
        Guo Ren
	<guoren@kernel.org>, Evan Green <evan@rivosinc.com>,
        Andy Chiu
	<andy.chiu@sifive.com>, Jessica Clarke <jrtc27@jrtc27.com>,
        <tim609@andestech.com>, <dminus@andestech.com>,
        <ycliang@andestech.com>
Subject: Re: [PATCH v3 03/13] riscv: dts: allwinner: Add xtheadvector to the
 D1/D1s devicetree
Message-ID: <ZoPMEaq8wKzXhFuA@APC323>
References: <20240619-xtheadvector-v3-0-bff39eb9668e@rivosinc.com>
 <20240619-xtheadvector-v3-3-bff39eb9668e@rivosinc.com>
 <0cc13581-5cc4-4a25-a943-7a896f42da4c@sifive.com>
 <20240701-prancing-outpost-3cbce791c554@spud>
 <7ab7d629-6993-4cad-b5b7-62bddfc74a49@sifive.com>
 <20240701-pyromania-spinster-709a6c8cc460@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240701-pyromania-spinster-709a6c8cc460@spud>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Originating-IP: [10.0.12.98]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 4629kkj0053530
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_024724_555231_EBB7AD93 
X-CRM114-Status: GOOD (  45.90  )
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

Hi Conor,

On Mon, Jul 01, 2024 at 05:31:01PM +0100, Conor Dooley wrote:
> [EXTERNAL MAIL]

> Date: Mon, 1 Jul 2024 17:31:01 +0100
> From: Conor Dooley <conor@kernel.org>
> To: Samuel Holland <samuel.holland@sifive.com>
> Cc: Charlie Jenkins <charlie@rivosinc.com>,
>  linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
>  linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
>  linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, Conor Dooley
>  <conor.dooley@microchip.com>, Rob Herring <robh@kernel.org>, Krzysztof
>  Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
>  Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
>  Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
>  Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
>  Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, Guo Ren
>  <guoren@kernel.org>, Evan Green <evan@rivosinc.com>, Andy Chiu
>  <andy.chiu@sifive.com>, Jessica Clarke <jrtc27@jrtc27.com>,
>  peterlin@andestech.com
> Subject: Re: [PATCH v3 03/13] riscv: dts: allwinner: Add xtheadvector to
>  the D1/D1s devicetree
> 
> On Mon, Jul 01, 2024 at 11:11:55AM -0500, Samuel Holland wrote:
> > Hi Conor, Charlie,
> > 
> > On 2024-07-01 11:07 AM, Conor Dooley wrote:
> > > On Mon, Jul 01, 2024 at 10:27:01AM -0500, Samuel Holland wrote:
> > >> On 2024-06-19 6:57 PM, Charlie Jenkins wrote:
> > >>> The D1/D1s SoCs support xtheadvector so it can be included in the
> > >>> devicetree. Also include vlenb for the cpu.
> > >>>
> > >>> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > >>> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > >>> ---
> > >>>  arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 3 ++-
> > >>
> > >> The other C906/C910/C920-based SoCs need devicetree updates as well, although
> > >> they don't necessarily need to be part of this series:
> > >>
> > >>  - sophgo/cv18xx.dtsi
> > >>  - sophgo/sg2042-cpus.dtsi
> > >>  - thead/th1520.dtsi
> > > 
> > > Yeah, I think I pointed that out before with the same "escape hatch" of
> > > it not needing to be in the same series.
> > > 
> > >>
> > >>>  1 file changed, 2 insertions(+), 1 deletion(-)
> > >>>
> > >>> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> > >>> index 64c3c2e6cbe0..6367112e614a 100644
> > >>> --- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> > >>> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> > >>> @@ -27,7 +27,8 @@ cpu0: cpu@0 {
> > >>>  			riscv,isa = "rv64imafdc";
> > >>
> > >> The ISA string should be updated to keep it in sync with riscv,isa-extensions.
> > > 
> > > This probably looks like this cos I said that the kernel shouldn't parse
> > > vendor extensions from "riscv,isa". My rationale was that we have
> > > basically no control of what a vendor extension means in riscv,isa so 
> > > we shouldn't parse them from it (so marginally worse than standard
> > > extensions, where it means what the spec says except when it doesn't).
> > > 
> > > Given how we implement the parsing, it also meant we weren't implying
> > > meanings for vendor extensions ACPI-land, where we also can't ensure the
> > > meanings or that they remain stable. That change is in a different
> > > series:
> > > https://patchwork.kernel.org/project/linux-riscv/patch/20240609-support_vendor_extensions-v2-1-9a43f1fdcbb9@rivosinc.com/
> > > 
> > > Although now that I think about it, this might break xandespmu... I
> > > dunno if the Andes guys switched over to using the new property outside
> > > of the single dts in the kernel tree using their SoC. We could
> > > potentially special-case that extension if they haven't - but my
> > > position on this mostly is that if you want to use vendor extensions you
> > > should not be using riscv,isa (even if the regex doesn't complain if you
> > > add them). I'd like to leave the code in the other patch as-is if we can
> > > help it.
> > > 
> > > I added Yu Chien Peter Lin here, maybe they can let us know what they're
> > > doing.
> > 
> > OK, that makes sense to me. Then please ignore my original comment.
> 
> Should the xandespmu thing be an issue, I'd suggest we just do something
> like the following, in place of the new switch arm added by Charlie:
> 
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index ec4bff7a827c..bb99b4055ec2 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -628,6 +628,17 @@ static void __init riscv_parse_isa_string(const char *isa, unsigned long *bitmap
>  		if (unlikely(ext_err))
>  			continue;
>  
> +		if (*ext == 'x' && acpi_disabled) {
> +			/*
> +			 * xandespmu predates this "rule", so special case it for
> +			 * hysterical raisins
> +			 */
> +			if (strncasecmp(ext, "xandespmu", ext_end - ext)) {
> +				pr_warn_once("Vendor extensions are ignored in riscv,isa. Use riscv,isa-extensions instead.");
> +				break;
> +			}
> +		}
> +
>  		match_isa_ext(ext, ext_end, bitmap);
>  	}
>  }
> 

Thanks for the hands-up!
We don't use the deprecated riscv,isa to specify xandespmu, so no
need to address this special case.

Regards,
Peter Lin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
