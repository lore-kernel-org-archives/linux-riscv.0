Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F18DCCF9E5
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Oct 2025 21:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mJxKP+COJAsB+IErqRSyKoGGVaP9vxZzdrdYc3q4AOk=; b=dpzUo6hlFVeG2c
	8TIFqxyvf/IWjWcfyEXE23Zzgwkugc1az7G3ig/WMhUzXF9grmLdVS/l/pkAIQjKigytZGe/cAb7S
	43QhsHuJbHHxNL9ta79ePIXnouqvaH+Tr4NwmVjLP3ZeFtAahu0t4RALjshIiLzXOqBgimipa+IgE
	d5s2boLoO6gFRS2xRHF2DPZ2a1UkhqtbEf8Bq6dUdBCF2UBX3+EgRrXXgDudWpjaSfLMbWEgOZ8rR
	UhECPVB6XJZHJ28LkNpdy44seGQRWBe5V3iya2Bns0YN2DCTkiJrPss1UHveQEohtduMTG2TkHKr3
	SjaPuHA1QZiKoWZ530Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD8Tn-0000000Clvq-26hA;
	Sun, 26 Oct 2025 21:40:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD8Tl-0000000Clvh-2hMW
	for linux-riscv@lists.infradead.org;
	Sun, 26 Oct 2025 21:40:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7E2C66022F;
	Sun, 26 Oct 2025 21:40:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8121C4CEE7;
	Sun, 26 Oct 2025 21:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761514844;
	bh=hrAhullTtGBpi18RJq12aBGKxmGAG7DcyxLeBCASy5Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vKhKB+tmed0VAijfGV0sE1GPY3vki2cliuedET4rXwig8irwIsvwx06T94zIDy+AB
	 99Bpc+ZX1inw/DryDrXsTytAKX9pSt1NuiKMk0C85vE1Y6hMxst1qqYDUzoXku+5lT
	 C+fFwZHFBiLNiVKZ6nE/SlKsxtWcLiSkgh0F+dOwzYyajJ4oD0/0MOXes5Eku0nQ6E
	 FMsJw7QkawE1jPodpNFrNH6dK+3nuEzaoqSCEyL/+rIvlYDtL62OSng7y74RdVfAMd
	 ceKitmwv4I7jDlB4v6BobDDC2+7yBwoAcBOqRpaYTRWab21S3svt98aLYwYOzXtsVs
	 ggeZpJZJQE0Ow==
Date: Sun, 26 Oct 2025 16:40:41 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Paul Walmsley <pjw@kernel.org>, linux-serial@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-riscv@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>,
	Jiri Slaby <jirislaby@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>, devicetree@vger.kernel.org,
	Inochi Amaoto <inochiama@outlook.com>, linux-kernel@vger.kernel.org,
	Inochi Amaoto <inochiama@gmail.com>,
	Samuel Holland <samuel.holland@sifive.com>, sophgo@lists.linux.dev,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Conor Dooley <conor+dt@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v3 05/13] dt-bindings: interrupt-controller: Add Anlogic
 DR1V90 ACLINT MSWI
Message-ID: <176151483790.2985487.5387793525895332800.robh@kernel.org>
References: <20251021-dr1v90-basic-dt-v3-0-5478db4f664a@pigmoral.tech>
 <20251021-dr1v90-basic-dt-v3-5-5478db4f664a@pigmoral.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251021-dr1v90-basic-dt-v3-5-5478db4f664a@pigmoral.tech>
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


On Tue, 21 Oct 2025 17:41:40 +0800, Junhui Liu wrote:
> Add MSWI support for Anlogic DR1V90 SoC, which uses Nuclei UX900 with a
> TIMER unit compliant with the ACLINT specification.
> 
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  .../interrupt-controller/thead,c900-aclint-mswi.yaml    | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
