Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C38C2BB85
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jun 2024 06:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BX3KKxXo3tt3LHLDYWsHbDokzxU8mPvrkwBli4OuBIM=; b=VWD+C+KmBMRac5
	XfKrfR4rVI2R8eLBvULhnE5GzQ/8OnzGcmxi/sEgzAwq+3nLEavPaC2+TN7AKM2lbDVVGFUJpmy4B
	3kekunjyCcqTonY9fZUoDMV69Zxcj8tuT91rObvEAo4aokOBDKmv5PPZMEcXbu1wCW8fDOpPyMhE6
	Zr6GijyuOmuM+c+gMZGqJFWZveJRuzAVrl1n6CiGPaps/kNrYcZUCIqgumO+WTHR0GU9I67l55spK
	5Cev1d+y3PizCr6tme8xpFcNRqklWnlMnz3tvtJ/nMC9M/YLB8sWw7PBEqgP6svLvhPhwKFDPCARI
	ykm69Uiepfv+Rt6N0VYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJozT-000000005H1-3tvc;
	Wed, 19 Jun 2024 06:40:19 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJozQ-000000005GQ-39V3
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jun 2024 06:40:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718779217; x=1750315217;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=BWCauMt68vFjBRrLNx3G2KlJT+7wCHlFSe+2GGiOfq8=;
  b=iRHIQzmAakj9K9a9m/FMOInYBl1B1gI+kcIGPN4DVzf956lUfyEg31nu
   c7M74fEZBLNGLyBahycXeiII6bPknx5ozvdTHdBNQ8+YPyM8kZUHuf473
   8Sbx8CmOFWNDSp0zLlRNC+guuCiVSkoAsrDimtekJPxz2t8IIevJ0r5xM
   W50fu3yNABsSf9I3wUzfmG7uqbI+82coUQQmZSMHgZoLMLI7ShEPPajHC
   wl/0cOjVUi/aVi1nRYzHIQfVoyIm26z24r/zvkU8heKW4isMI6gItCjMa
   JgRuJXLXXw33vY7cebWcDrNLVA7KBN5OjaK9KsgDsAc0YfVowEywxFUpc
   A==;
X-CSE-ConnectionGUID: n9vRWhF+TDyX5PFfFXr+rA==
X-CSE-MsgGUID: megJ8rXIT5qmumkhzEQIAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="27102384"
X-IronPort-AV: E=Sophos;i="6.08,249,1712646000"; 
   d="scan'208";a="27102384"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2024 23:40:14 -0700
X-CSE-ConnectionGUID: j25NWx8hS6GtZnxJJ/Z/UQ==
X-CSE-MsgGUID: p6/cW7vCSMW49szzklmGNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,249,1712646000"; 
   d="scan'208";a="65045346"
Received: from marquiz-s-2.fi.intel.com (HELO [10.237.72.58]) ([10.237.72.58])
  by fmviesa002.fm.intel.com with ESMTP; 18 Jun 2024 23:40:09 -0700
Message-ID: <f427b28c-420b-4174-a670-70f626f8061e@linux.intel.com>
Date: Wed, 19 Jun 2024 09:40:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: i2c: dw: Document compatible
 thead,th1520-i2c
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Drew Fustini <dfustini@tenstorrent.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Conor Dooley <conor.dooley@microchip.com>
References: <20240618-i2c-th1520-v3-0-3042590a16b1@bootlin.com>
 <20240618-i2c-th1520-v3-1-3042590a16b1@bootlin.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20240618-i2c-th1520-v3-1-3042590a16b1@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_234016_894578_B82024CC 
X-CRM114-Status: GOOD (  12.51  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi

On 6/18/24 10:42 AM, Thomas Bonnefille wrote:
> Add documentation for compatible string thead,th1520-i2c which can be
> used specifically for the TH1520 SoC.
> 
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>   Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
> index d9293c57f573..60035a787e5c 100644
> --- a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
> @@ -33,6 +33,10 @@ properties:
>             - const: snps,designware-i2c
>         - description: Baikal-T1 SoC System I2C controller
>           const: baikal,bt1-sys-i2c
> +      - description: T-HEAD TH1520 SoCs I2C controller
> +        items:
> +          - const: thead,th1520-i2c
> +          - const: snps,designware-i2c
>   

Your comment below makes me thinking is this change needed? So is it 
enough to specify "snps,designware-i2c" for the compatible string in 
patch 2/3?

"It appears that the TH1520 I2C is already supported in the upstream 
kernel through the Synopsis Designware I2C adapter driver."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
