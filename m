Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD4A3CDB465
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 06:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QlW11G9sp1Mjk8VBHz1U7wbS+3OYarA6/LKlcz/dzwI=; b=A13T7WA3+60G6T
	L4HRjEGWkaFP6PdwMgbBBW+0MSByKaH6Vw06ZwUf5gHSzCD0sDlqFXXzhhlTJ3IWNqX1tn2RNMnm/
	arvGPeK6/sQ6cGmBQDkivJnn1Kg09qWCGL2Ze4Ld/qrBogOl4gBkx7okhUHdv8jECNlQd2/TWF2pl
	90sCybW2O1Bgc+H8AAV4QI75kR9rVORTVlL7NJe+Gcn4S5vjHllX+rcaplvN0og09qKkQrIeRL8Uw
	UxWD3GqL3y3zzV/Y72VftDm6z8hTn96hPGe1w7zkkyDK5VVJX0DkTiCvctXn8eUm4MbcLDDlY9i5E
	foUAaTGhqiBCkS+pLyaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsGoT-008VVN-0Q;
	Mon, 16 Oct 2023 06:10:49 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsGoP-008VUq-0a
	for linux-riscv@lists.infradead.org;
	Mon, 16 Oct 2023 06:10:47 +0000
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 39G69rND080135;
	Mon, 16 Oct 2023 14:09:53 +0800 (+08)
	(envelope-from peterlin@andestech.com)
Received: from APC323 (10.0.12.98) by ATCPCS16.andestech.com (10.0.1.222) with
 Microsoft SMTP Server id 14.3.498.0; Mon, 16 Oct 2023 14:09:53 +0800
Date: Mon, 16 Oct 2023 14:09:46 +0800
From: Yu-Chien Peter Lin <peterlin@andestech.com>
To: Conor Dooley <conor.dooley@microchip.com>
CC: <linux-riscv@lists.indradead.org>, <conor@kernel.org>,
        Rob Herring
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Paul Walmsley" <paul.walmsley@sifive.com>,
        Palmer Dabbelt
	<palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Chen-Yu Tsai
	<wens@csie.org>,
        "Jernej Skrabec" <jernej.skrabec@gmail.com>,
        Samuel Holland
	<samuel@sholland.org>,
        Daire McNamara <daire.mcnamara@microchip.com>,
        Geert
 Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "Emil Renner Berthing" <kernel@esmil.dk>,
        Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
        Fu Wei <wefu@redhat.com>, Chen Wang
	<unicorn_wang@outlook.com>,
        <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-sunxi@lists.linux.dev>, <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v3 4/6] riscv: dts: renesas: convert isa detection to new
 properties
Message-ID: <ZSzTqgVNSD9Q7V6H@APC323>
References: <20231009-approve-verbalize-ce9324858e76@wendy>
 <20231009-smog-gag-3ba67e68126b@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231009-smog-gag-3ba67e68126b@wendy>
User-Agent: Mutt/2.2.10 (2023-03-25)
X-Originating-IP: [10.0.12.98]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 39G69rND080135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231015_231045_676979_4519957D 
X-CRM114-Status: GOOD (  13.56  )
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

On Mon, Oct 09, 2023 at 10:37:48AM +0100, Conor Dooley wrote:
> Convert the RZ/Five devicetrees to use the new properties
> "riscv,isa-base" & "riscv,isa-extensions".
> For compatibility with other projects, "riscv,isa" remains.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  arch/riscv/boot/dts/renesas/r9a07g043f.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
> index b0796015e36b..eb301d8eb2b0 100644
> --- a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
> +++ b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
> @@ -24,6 +24,9 @@ cpu0: cpu@0 {
>  			reg = <0x0>;
>  			status = "okay";
>  			riscv,isa = "rv64imafdc";
> +			riscv,isa-base = "rv64i";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";

We do have zihpm, and OpenSBI can also probe its existence.

Boot HART ISA Extensions  : zihpm
Boot HART MHPM Info       : 4 (0x00000078)

By the way, we will append "xandespmu" here.
I hope this is an appropriate way to add a new custom extension.

>  			mmu-type = "riscv,sv39";
>  			i-cache-size = <0x8000>;
>  			i-cache-line-size = <0x40>;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
