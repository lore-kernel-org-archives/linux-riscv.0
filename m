Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B04C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Oct 2022 11:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wmlKoIvPRE5DbA+/4MWF2cd6Nkg0xfzGVj+DEPRaDbI=; b=PH56+69erJZqIZ
	xhSBxdIHcPC2adxgWS0ygY8C5qE93RDBUdadKLB5A/W53VBs+qp2+an3owExQs6WYV1LaSUn9y6qX
	JSq+CfSEF6ZC5QD3cL2agdvO6MG6vYU+agty11jbRdERVz0C91GwL4A5BoMoS3UfMHm4U5BqZjG37
	LPTnQcCdItdvzA8gHZVtOXwz32OH3irhNR/BZro1Q6f+E3nERhZ53z9mZErRjnUgTqHQipXjCAXEl
	ilhsM4s1shrbDpRiwk50f5YcGr2P+ByiOZsVwxJ09ZxdSiUkVeP5bN7QYKciAD1FeVNRzGQ2qXXg3
	5PxFmmIITJXlAkCmVP+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiwZS-00BZXm-Qa; Thu, 13 Oct 2022 11:40:14 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiwZP-00BZWa-QW
	for linux-riscv@lists.infradead.org; Thu, 13 Oct 2022 11:40:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1665661212; x=1697197212;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qwBNvrTGhKx7haBmbfNDVoNRn8CE3KTouJoIXdepuVk=;
  b=Xiwx/LN8VpHzoQF62My05RtBrY7g4Ql5DRwSRErytDj7zlHyeZD7vTSo
   CSocimqtK/MMryqNRcz1fFQ3zfFoLc8QoY4VQR9FyV8YXGtw3APH5Q43h
   q7gj1wC1xiXYQALfD7zl6mbsGFhZVFklxHzH6zEo/T2tCLuC6vlruc9/p
   zzH1t63wEka8bxbUNKu2VLHnr8lvD9qgefsJr7p6ew5IJwZWxjBAq1T+P
   Ql5rDCHSuvxHclMQYMrUgvSBNXjGzxmvxFFwlPyMI7qoeAcKgTtDZEu+j
   CfiqtnpTHTb5C1LeOjjq2qoYpgKyAy+cNYAVN+/TG496WulqbTTC5vsCe
   A==;
X-IronPort-AV: E=Sophos;i="5.95,180,1661842800"; 
   d="scan'208";a="178539448"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Oct 2022 04:40:05 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 13 Oct 2022 04:40:03 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Thu, 13 Oct 2022 04:40:02 -0700
Date: Thu, 13 Oct 2022 12:39:39 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
CC: Conor Dooley <conor@kernel.org>, Atish Patra <atishp@rivosinc.com>,
	<corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <linux-doc@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux@rivosinc.com>
Subject: Re: [PATCH 4/4] Documentation: RISC-V: patch-acceptance:
 s/implementor/implementer
Message-ID: <Y0f4+xfKls4qB1Ea@wendy>
References: <20221013045619.18906-1-palmer@rivosinc.com>
 <20221013045619.18906-5-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221013045619.18906-5-palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_044011_944663_90EE4D14 
X-CRM114-Status: GOOD (  16.39  )
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

On Wed, Oct 12, 2022 at 09:56:19PM -0700, Palmer Dabbelt wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
> 
> Implementor does appear to be a word, but it's not very common.
> 
> Suggested-by: Conor Dooley <conor@kernel.org>

The overlords would probably rather this email got the credit but
doesn't really matter for S-b tags.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>  Documentation/riscv/patch-acceptance.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/riscv/patch-acceptance.rst b/Documentation/riscv/patch-acceptance.rst
> index 9fed6b318b49..89c7d8abd4bb 100644
> --- a/Documentation/riscv/patch-acceptance.rst
> +++ b/Documentation/riscv/patch-acceptance.rst
> @@ -26,7 +26,7 @@ specifications from the RISC-V foundation this means "Frozen" or
>  ECR.  (Developers may, of course, maintain their own Linux kernel trees
>  that contain code for any draft extensions that they wish.)
>  
> -Additionally, the RISC-V specification allows implementors to create
> +Additionally, the RISC-V specification allows implementers to create
>  their own custom extensions.  These custom extensions aren't required
>  to go through any review or ratification process by the RISC-V
>  Foundation.  To avoid the maintenance complexity and potential
> @@ -38,5 +38,5 @@ RISC-V extensions, we'll only accept patches for extensions that either:
>    for which a timeline for availability has been made public.
>  
>  Hardware that does not meet its published timelines may have support
> -removed.  (Implementors, may, of course, maintain their own Linux kernel
> +removed.  (Implementers, may, of course, maintain their own Linux kernel
>  trees containing code for any custom extensions that they wish.)
> -- 
> 2.38.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
