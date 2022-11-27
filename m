Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DA88C43217
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Nov 2022 17:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=90+FYGw37j8xZwzFboIFq90nfI+Npj/iZFnfNWVrKMM=; b=C0gr7GUWFEBtWR
	RYsL28GbY7N7P9li+y+KTABCeWOoidYcnHADUpWx+iW9CGuDv2qENriu8fngN91YxxsOOfqXBvxMe
	l9pM9xQBZvtfeh+3/tORMw2FJ+LTaR3cOmu4qFK1FPMA/P++uaPEbsD0fMq2xCN79YcjyiUGLwzec
	KUG99nJIP/TeBiLGfMNBx5nJTbFayvgYxdb6RzLiz2y5rvAjGLWLZB2kK4JYAh46N24IVOKSf2arO
	po/7Xu8W37c4Mg+HVjMtd2hhM/2nyr6TYnMv6iZl9fQr7gR+DejT57r1DiyS1yfruA8sKOLah8xHT
	YLIm9FedQ41SImUSf+Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozLZL-00ChLP-Ni; Sun, 27 Nov 2022 17:35:55 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozLZI-00ChIF-Ea
	for linux-riscv@lists.infradead.org; Sun, 27 Nov 2022 17:35:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 3006CB8095D;
	Sun, 27 Nov 2022 17:35:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55508C433C1;
	Sun, 27 Nov 2022 17:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669570547;
	bh=hmMSrdZQRZh8vLDgc2r5Hj6yJHQNACP222q36LVyHeQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rzqzjaoFO1pCq7Zv9JCPZYOvn2NluPSyi+TvYx70iCHWr+ATTwd1/iULM+biiKY/6
	 4lGFhyWwYMUpQ70LofK7OIyJV9k3FplewgMkB9pvpOiXNQhED05KCIyWGwZ1uz/YD6
	 Jxfkt4hvPSYqZ+TLO2Hk58XuvLAuKKfOi8R2JIpSwEByeUmqKGNjDdru93u6+4wXlY
	 GfQplffVhozVK/aArNOkVuKmSZC1yq+cHatwE6CE5hyXzIbh035TXZrNMXdoVY/2BS
	 1YoUl5LJhIctScVrblNiI82hnvMfnOSaUCUhgOgjVR6zxFlmQEQJVVhrkvNYSDecYg
	 xX68OpiCzZBrw==
Date: Sun, 27 Nov 2022 17:35:42 +0000
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH v2 8/9] MAINTAINERS: riscv: add entry for Bouffalolab SoC
Message-ID: <Y4Of7s6UGpD0/Iga@spud>
References: <20221127132448.4034-1-jszhang@kernel.org>
 <20221127132448.4034-9-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221127132448.4034-9-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_093552_676502_E3793579 
X-CRM114-Status: GOOD (  17.14  )
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

Hey Jisheng,

On Sun, Nov 27, 2022 at 09:24:47PM +0800, Jisheng Zhang wrote:
> Add Jisheng Zhang as Bouffalolab SoC maintainer.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  MAINTAINERS | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 00ff4a2949b8..a6b04249853c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17729,6 +17729,15 @@ F:	arch/riscv/
>  N:	riscv
>  K:	riscv
>  
> +RISC-V BOUFFALOLAB SOC SUPPORT
> +M:	Jisheng Zhang <jszhang@kernel.org>
> +L:	linux-riscv@lists.infradead.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/riscv/bouffalolab.yaml
> +F:	Documentation/devicetree/bindings/serial/bouffalolab,uart.yaml
> +F:	arch/riscv/boot/dts/bouffalolab/
> +F:	drivers/tty/serial/bflb_uart.c

I think I asked last time but I didn't see an answer on lore or my
mailbox - if you intend sending Arnd PRs for this stuff, please add a
git tree here. Otherwise, LMK and I'll bundle it with the other "misc
riscv devicetree" stuff.

Thanks,
Conor.

>  RISC-V MICROCHIP FPGA SUPPORT
>  M:	Conor Dooley <conor.dooley@microchip.com>
>  M:	Daire McNamara <daire.mcnamara@microchip.com>
> -- 
> 2.38.1
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
