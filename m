Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6372EC6FD1F
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Mar 2023 23:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MfJWyP8ql9DSiDkmC29sxzKMBS0fHWaiFtME2FKmhUQ=; b=5BH1w4JfuLAGQo
	Q5hlSvh2UMvjcIDQ1ksSYBBiHZOeazFLePJgXBlzfg5dHwCiL14x1NnB2t0h1QOVw8zYu9v00mf6x
	Koj2LeLcXqB9+JY69GBXWRRFVedZtNTB36ZcnSBAQECWAGKaJNmYaJ24a5G0cRj1A+BuXNDZznqTe
	yOiVU69KV3qyG35bP08AZAf+skDUJnk/+2fYkkS3+rnqd+2YJiETXoF5NX5Vl2T4yVFO5frYhQpyk
	Uzuwfo2P8WkhYNDCnd4sHq8RFedj/lbgI7vkFsYFIaJuCCU720MgyAZSaw9uFEcit2w2u3y6S8pjb
	W2NJ7u7JdTaGsZcWh44A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pf831-000Av3-2H;
	Wed, 22 Mar 2023 23:39:15 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pf82y-000AsX-0u
	for linux-riscv@lists.infradead.org;
	Wed, 22 Mar 2023 23:39:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1679528352; x=1711064352;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=OGHCWQte3YjhGFJqMvAzpeC0UB5PdXMpxYWRoLzMsDk=;
  b=X6Y0aH0He2g2LYAaJvAvZVVrX+ftvDXeEYbYOdW9sk38SpmcYQ5pXQUv
   zQjqEe4+z8NzU33rgCvx0WbErdxSS4OgFDYGzPQqgYKrIs8fjF4VG6+JQ
   jaUcofcFI3hvAO2bnlJTPHYKATsLiuc9ZpHWyqv9yNAFIOKmkl9mRpg0j
   oICG+pdRly1CjRuSD8/xqiT3AdoiQSFkx6on4Rcq1DLI4SWR7bdOL9ZoL
   U9eovb8zD0tbH6B5HUNK4ryA0kNs22go9MJKQ/cABR+2c/gY6DVbKPJQu
   Z5PoN7tdRXJ9iQ5AEf1sw0dgC8q90k4Rl+2daNqOukXOCSnAxGeyanTIX
   g==;
X-IronPort-AV: E=Sophos;i="5.98,283,1673884800"; 
   d="scan'208";a="224559605"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 23 Mar 2023 07:39:06 +0800
IronPort-SDR: IgV+IgPZgkDcS/1d+b5VlciOO7J8f8q85STJ+XNfzOSUKoH+MOls1vuh+WBNy9mViIX9/VPIXC
 XIX9fhnO6k/6doUh1oMUUIa/cR2U17a0myKjeBKQf0anKftw5qpalP4KdbSYcvVamjK6m3yo5P
 HWMh0IRfI1Idq9vSEUgt/6qr2dW6vts2FnWqTXMhgJtseQbBcZv5q3zU2y2QojPX7UVhKmE3h+
 KSifDskbO3MZFTDRW3zQ8bz/uG4CFAf43AwTu9RGeuRu2K0pJMAYrmfzQILrJyKo/vQwCLFujW
 i0o=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 22 Mar 2023 15:55:23 -0700
IronPort-SDR: g32s3L+Hct/He37IWd1mO5M5tifg/8lOtCDdnzqVQFPxuT0pn3NscVUjLcIbNNJ5NVd+nZhu5a
 MTBhgsyNW/MDdAsRR7EgubRuRbvEQfD3RUK9VE8oXqo1C7cPc6HMp8xJjPQrFh0DA+SXPZLQOU
 Qo77GsgHuuLkAkdUZB3//tjYXD4TZaA8+KyunfiUleftMLta5XAu54bywviQX1ybybhmvs6WUV
 bSJg+dlIEN9Klk1ouQZSnj+mLBrwaVzkImINvpP7X/LMNTG1kL6+f6pc54RTD1fREPhZ9KNatJ
 KLI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 22 Mar 2023 16:39:07 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4PhlL21D5xz1RtW3
	for <linux-riscv@lists.infradead.org>; Wed, 22 Mar 2023 16:39:06 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1679528345; x=1682120346; bh=OGHCWQte3YjhGFJqMvAzpeC0UB5PdXMpxYW
	RoLzMsDk=; b=h9QS/6X7fJDm4CcTVHlExM/CvxKaQSHcJ3sMvlNeQIXATYROTa4
	ZSV+nLM79WCXq1AXsi8715n3y057dj2zZBTZOrGPgj9jkm1supLwusYWL+/prSZI
	mKf+YP1brVHXyAphtOar6qqhijH9KBR8i//9QjNisAvDcoaP8ZHx8+MfDD9yRlIq
	7KpzNJXuedKjhXsnAneHlHuEBq9aiR4Sv2avbjMPEZ/pxQHfL1Fnjv8S9jzQgYjO
	SRyztT4rEec+ORnjWXzFsMgcTgY8DXePtzO0bcTkiIX3hTkZboWSqZmd94itO88t
	SY88AkV3V1JB+53ucoVW86pRXi57DYvMVbQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id DcVCdTUEIeIk for <linux-riscv@lists.infradead.org>;
	Wed, 22 Mar 2023 16:39:05 -0700 (PDT)
Received: from [10.225.163.96] (unknown [10.225.163.96])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4PhlKy5gVBz1RtVm;
	Wed, 22 Mar 2023 16:39:02 -0700 (PDT)
Message-ID: <1f963db6-5404-e483-69ac-fe8eaf5bb478@opensource.wdc.com>
Date: Thu, 23 Mar 2023 08:39:01 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] dt-bindings: mfd: Drop unneeded quotes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Damien Le Moal <damien.lemoal@wdc.com>,
 Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, patches@opensource.cirrus.com
References: <20230322173519.3971434-1-robh@kernel.org>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20230322173519.3971434-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_163912_388208_63C8FA1A 
X-CRM114-Status: GOOD (  10.54  )
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

On 3/23/23 02:35, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

-- 
Damien Le Moal
Western Digital Research


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
