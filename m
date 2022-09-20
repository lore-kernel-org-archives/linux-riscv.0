Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7FB5C54EE9
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Sep 2022 17:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O5U10OrQKBsccLDfBw8pQuBckrdl+itA6503hpyB7GM=; b=0+iwTo+c+PrPjM
	YfpBk81gxMM7uAOs9haZlnkHs5/aSDOg/CXA3c+ot1BXS7u/hSMnwJ3cZM3XVzABMCErvwBLSzgeY
	N7OCfrICNJjRmrRGcHQ3f++IjqrDECBrz5PJjgsEkp/WGJQNua0lEbLhinNGx+H7npQdywr/KQE0l
	ySco3PaaViUXYTK+N/exYbn6fv3eT0u3V4pNMLKC9w+h7Z/zkrvRItNGrCDzfaFTeQBnOfPqQrQCc
	mhad7Hi+zYX008po1EtIbaNzJ4yBXMa8U/OBhP6m2aIlQqnn1GvfDsOli4iB/fxubIoZmxxTnR/7O
	Ha+/tlrv3Xa2ePBjrGGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oahMz-005ZAh-0N; Tue, 20 Sep 2022 17:49:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oahMw-005Z9B-34
	for linux-riscv@lists.infradead.org; Tue, 20 Sep 2022 17:49:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8949362BAF;
	Tue, 20 Sep 2022 17:49:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C292C433C1;
	Tue, 20 Sep 2022 17:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663696152;
	bh=85Re93+D9nWBQDkgwZDyip0c7k+U9prWgqkp2PLRQ7c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cus5+79BZEaCzE4coHosBBLd78NWbEIBBMNWhey+dgjPEt1bsD0xND1xCPtKp/4ip
	 v4kwWs2VXT7o0SNyUlcPi7CpL/e+D8oK4iMTJkTOrhnpbRSyNBYopQwco2hr3/+zK5
	 U0x956phkKUn2699f8ATJv42/nH4EBuEepfJgTqYoK5C2GI4KJAfcpMFWv+h5MXcz+
	 fbz71GU7uBAb0w2ZolnQk58Gjwcu0wvrv6kFfsCaoCbrURPA7jNyloBpps6Tp6fD1y
	 RJxbWxiuaykxPYVAisl9cHeOCmi52pj2OwxoOAuKGGpPg8yheMMlqbRdItwTW0d/3+
	 /itvAvqdz4v4A==
Date: Tue, 20 Sep 2022 18:49:08 +0100
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org
Subject: Re: [PATCH 3/3] Documentation: RISC-V: Mention the UEFI Standards
Message-ID: <Yyn9FJ4iuzJTfO1T@spud>
References: <20220920140138.27210-1-palmer@rivosinc.com>
 <20220920140138.27210-3-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220920140138.27210-3-palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_104914_574874_26A3B929 
X-CRM114-Status: GOOD (  26.88  )
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

On Tue, Sep 20, 2022 at 07:01:41AM -0700, Palmer Dabbelt wrote:
> The current patch acceptance policy requires that specifications are
> approved by the RISC-V foundation, but we rely on external
> specifications as well.  This explicitly calls out the UEFI
> specifications that we're starting to depend on.
> 
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
> This also came up during the Plumbers BoF.  The other discussed options
> were to wait for an ACPI/UEFI specification to be published or to just
> not wait at all, but this middle ground matches how we handle the RISC-V
> specifications and it seems like there was broad agreement on it.
> 
> As usual with policy stuff I'll wait a bit for others to have a chance
> to chime in, but I think the wording on this one is at least easier to
> reason about than some of the others.
> ---
>  Documentation/riscv/patch-acceptance.rst | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/riscv/patch-acceptance.rst b/Documentation/riscv/patch-acceptance.rst
> index 8087718556da..08cb92324eaf 100644
> --- a/Documentation/riscv/patch-acceptance.rst
> +++ b/Documentation/riscv/patch-acceptance.rst
> @@ -20,9 +20,11 @@ Submit Checklist Addendum
>  -------------------------
>  We'll only accept patches for new modules or extensions if the
>  specifications for those modules or extensions are listed as being

> +unlikely to make incompatible changes in the future.  For

Nit, but the wording here is awkward since it sounds like the module or
extension is the "actor". How about:
s/make incompatible changes/be incompatibly changed/

> +specifications from the RISC-V foundation this means "Frozen" or
> +"Ratified", for the UEFI specifications this means a published ECR.
> +(Developers may, of course, maintain their own Linux kernel trees that
> +contain code for any draft extensions that they wish.)

Could we just drop the brackets from this sentence?

Either way, policy wise/idealogically this again looks good to me, so
with or without the wording changed:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

>  Additionally, the RISC-V specification allows implementors to create
>  their own custom extensions.  These custom extensions aren't required

Thanks,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
