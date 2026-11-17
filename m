Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266A4606A323
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 00:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QxV68aG8;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=epJ76Q5N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3PaR+K9yfuXcFNsgA2uxq6Duuu5+g1kOGK0D5NdFedU=; b=QxV68aG8vYc7ScmLfGSAGTYeYq
	5GWx5fkIg+zvny/gRVzLAz/bPeheVs9MuyzBuJDTrhkeHvnHfWltWedDM2KeXPrwm4qZM/oLjClxe
	ZP4/9uiteGVQwMKGm0SFZvJLyekV64k8ZYSPHHQO2Jq8QkU/17cVGOTF1RluhF9UXTW8oz0K9Ns1F
	bcq+92MKj3MMhLeUWOS/CdR5wBMTOlbWajHTFTPPzUINgm0OLJw7EvQP+BMLiPS3WHi8sfW80iMQM
	MqfWADqx68laulArjH7KcSrXrWaD8IYhv9utz7D4Rqi/m3BpfQ797ZlT/Iit83u4VKkdk0hmpV48L
	HjwXd0ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT7WL-00000004H4l-1unS;
	Tue, 17 Nov 2026 00:58:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT7WJ-00000004H4Z-388P
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 00:57:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id ACA2B60D15;
	Tue, 17 Nov 2026 00:57:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D74971F000C4;
	Tue, 17 Nov 2026 00:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794877078;
	bh=KgDSpxzJb3bAALuMtGoPjTr7eQ9Jv9niChI7HXsF3Z4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=epJ76Q5NwE05ch2nHZjELnmbx2glge7NHXjaE2gHfeTw43Gp+kfzoNCgilb9C+DsC
	 eqaGWYfMSCv19UUGWTyP55mgIipVnYtbXVEr3jUx4W0csz5AF/xXx7cUgTQef0U6WD
	 Jw/VLhGoxb/1++54nSFdEZeDZ7kklgfhCvvIftnOdyuPuliWMKUap3zpJlTLJSdcTp
	 rQ5yQOOCziYFiJ0BM0lDSy5CRhF1amTipv4C6RkeqvXyw4VPeV0Yz8bpeeRJDJuJmg
	 OiyPiNZeDYB4Xj0+e6Qpy9qgIvdq5VUFjxtPDK6sjH9/PM/4PCibmRWS/jFERSsFuZ
	 2vwlQALqlYjxA==
Date: Tue, 17 Nov 2026 00:57:55 +0000
From: Yixun Lan <dlan@kernel.org>
To: E Shattow <e@freeshell.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] riscv: dts: spacemit: k3: use com260 8gb memory
 configuration
Message-ID: <20261117005755-GKD100890@kernel.org>
References: <20261115195112.32120-1-e@freeshell.de>
 <20261115195112.32120-2-e@freeshell.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261115195112.32120-2-e@freeshell.de>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi E Shattow,

On 11:50 Sun 15 Nov     , E Shattow wrote:
> The boot loader may override this configuration based on stored ID value
> in EEPROM TLV and if it does not then the smallest common sold
I think bootloader will detect memory size during DDR initiliazation phase,
and then update the DT configuration, I haven't checked vendor code, but
plan to implement this in mainline u-boot..

While the change itself looks good, to have always smallest valid default..

> configuration of 8gb is the most compatible option.
> 
> Signed-off-by: E Shattow <e@freeshell.de>
> ---
>  arch/riscv/boot/dts/spacemit/k3-com260.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
> index 054bfff7413a..c18680b963a4 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
> @@ -14,7 +14,7 @@ / {
>  
>  	memory@100000000 {
>  		device_type = "memory";
> -		reg = <0x1 0x00000000 0x4 0x00000000>;
> +		reg = <0x1 0x00000000 0x2 0x00000000>;
>  	};
>  
>  	reg_5v_sys: regulator-5v-sys {
> -- 
> 2.53.0
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
