Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3909DC433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Nov 2022 21:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cIMShAUsi1XKOAl80rCFAaW2d2A8CoR94A+zPlkyR7U=; b=2awIwvSJBDAmfT
	lpCOy7RCLFFNOZpAiCN0w1U9VRH9BBZvw7lH7tm62cwwxfFq3FWKFr9o45CPy+VJE0xfE1wOEUwi2
	WdlkH3ADV1EY9SgIHPSiNCHhdfNmsiwQr4S6O3vYNKYaq6HjPqjI8lo1u2l5xeJ8vBC/LqOCpx8c1
	J0J14Z/twqyfJhFxGVj/6qGjgym0ZC3MuNN5+MKNY1q7zRTGgj+h6eDuCU2WmiLJuwGBl4whEUIzs
	comfkLWgF0QegPBMndMO4aCV8cZoRjcjQqhWmP/iVXpoGcNtNThcZFhhDJC+ffAo7D/fv3V457LTv
	9khQpzR2ih0MP43RMy4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxwzc-002Ro7-CI; Wed, 23 Nov 2022 21:09:16 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxwzZ-002RnH-Mb
	for linux-riscv@lists.infradead.org; Wed, 23 Nov 2022 21:09:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5EFB0B824C0;
	Wed, 23 Nov 2022 21:09:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 958DAC433D6;
	Wed, 23 Nov 2022 21:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669237751;
	bh=pl7Qiqa3fxBm6Q+/LK3Xnpo0DhZBZ76AOO6EJVopoXI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VjAogGXCl7hgXsWnZY97PqUFczkd2/EWuPp0xSd1ogZ48HbJBUcOSyjmatPjRCiMl
	 u2QsbsBpsWUo6FQS9jNnS0nJymO/UZrePE1U2X8x4HFo7y7r0KdHaYV8vxSclEMlIo
	 JDus8bYmd7liwPTBszcu1C63JWbpKh763yXht1CoJ+s6qKUDjl44O3kUwvcnqagjxg
	 2nnjeO0bbwI9BJIZSYz1FyEsr5zxEDgC8iGim+il1kODAwo3v2vidw0dW5DYylspKB
	 Vu0Mb0+VjJ67b4V+vIFTN+4ORdHKhvZdnV40/Wl0SBPwtbxGJ8Q6Apk5heAnv38klx
	 1T6kT9u0u7kLQ==
Date: Wed, 23 Nov 2022 21:09:06 +0000
From: Conor Dooley <conor@kernel.org>
To: daire.mcnamara@microchip.com
Cc: conor.dooley@microchip.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, lpieralisi@kernel.org,
	kw@linux.com, bhelgaas@google.com, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v1 1/9] PCI: microchip: Align register, offset, and mask
 names with hw docs
Message-ID: <Y36L8nnZw46mm8x/@spud>
References: <20221116135504.258687-1-daire.mcnamara@microchip.com>
 <20221116135504.258687-2-daire.mcnamara@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221116135504.258687-2-daire.mcnamara@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_130913_905210_816667A9 
X-CRM114-Status: GOOD (  14.99  )
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

On Wed, Nov 16, 2022 at 01:54:56PM +0000, daire.mcnamara@microchip.com wrote:
> From: Daire McNamara <daire.mcnamara@microchip.com>
> 
> Minor re-organisation so that macros representing registers ascend in
> numerical order and use the same names as their hardware documentation.
> Removed registers not used by the driver.
> 
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  drivers/pci/controller/pcie-microchip-host.c | 122 +++++++++----------
>  1 file changed, 60 insertions(+), 62 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-microchip-host.c b/drivers/pci/controller/pcie-microchip-host.c
> index 0ebf7015e9af..80e7554722ca 100644
> --- a/drivers/pci/controller/pcie-microchip-host.c
> +++ b/drivers/pci/controller/pcie-microchip-host.c

> @@ -137,7 +78,8 @@
>  #define ISTATUS_LOCAL				0x184
>  #define IMASK_HOST				0x188
>  #define ISTATUS_HOST				0x18c
> -#define MSI_ADDR				0x190
> +#define IMSI_ADDR				0x190
> +#define  MSI_ADDR				0x190

Trivial, trivial comment - I think it would look more intentional as:
#define  MSI_ADDR				IMSI_ADDR

Otherwise this seems grand to me, modulo the SoB issue.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
