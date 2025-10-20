Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6678CCD199
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 18:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vtk/gL1EaPFhKmar1AFIZtRGHznJKkzq0Jgaq4LDsJg=; b=u9/QoOXC8QUtl8
	/FvZsTywE75SzbqFjKtPI36RlmabK2G5lJRMXD9EnJ+5Ms/WEHMWuE4hFS5YhJVhWiso1YgUe+M4l
	Yv2HE8RSzOMCM1a0Z3eMyqKj167yAyfGR+5+dvEmLMZ9jzqKXjcfkb2hZj4fXYvrO1KdRmVSGHxR3
	uOJbTWpD3Q0zS+rWhFmqjeWFHgo6M/9b53xJCPWhOJbvub2doptQ8b58h2mmL43QN4jds6ZjmD9/Z
	0/UcHIlSPLw2aW5crkZMlCNUVFJkbPUfBmqDf1RjMghzetFxD/zvOvrbUSALktNIwkU5J8R2sdqWH
	pCcZro7Foe2AKuSMHNdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAuHW-0000000EaLd-2iB2;
	Mon, 20 Oct 2025 18:06:54 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAuHS-0000000EaKY-40jQ
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 18:06:52 +0000
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-930cfdfabb3so284959639f.1
        for <linux-riscv@lists.infradead.org>; Mon, 20 Oct 2025 11:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1760983610; x=1761588410; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1Cb9G+JdDcieHiAzL0OEVFR37yQ/b0GUUu4YH0d0n0A=;
        b=XMILn5Qu9VSSc629H51U8p1Dp0xMuUMTw3OTdvVa3erQ0bur1KqY9BWRlEwLW4Z+Bx
         6BVn/8tsr6nrJfgts2cMN3MMNxu27G17eO9cWuSZbygmteOxBftMzJq06uhZVhZUwdp8
         4RohgDHCvMi6fGA+vT5/xi1cttPhWZvx2CcOx/UsoDb2lLaF1ENol8HjtnNIdyf8Cllp
         onNTon9srPjcEHYCU2aDnugCcRNQAgRnkZZPhktWntpdTEmEUvk9Y8iG8yzmwSfuMsOD
         LU3Xzts2fzY1dQaSLy5cW9c8u2MGP+IZxIm0kz0MlY9c/PX9xmvap9kkH5oesnsCR1Hg
         mR8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760983610; x=1761588410;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Cb9G+JdDcieHiAzL0OEVFR37yQ/b0GUUu4YH0d0n0A=;
        b=L6FcKYMubbMASp+N6w01oIW9DRn4PRefGy+ShpIzrRuQhtYnX88BXfNCpRl8UKrYiB
         iz6cc/wSJa4rA/hfg0qb2HSxVVzAuWqge62RsrIOmE93MZGOgRYtW0BgFg7wBxLd2tIb
         TM7pz/pgcp26SGJIE0xz5jz5SE1Ww1hs7r2XOe3UVzIq9ScZ2gehPKAM7IQNa82n4S/y
         C22oOLbvMw5y2Ni1mBza+hBr+9p3CBsCeZcTL+U0jW4/5UYxuCQic4juqeK0YkTDxrzy
         02/LdoCtd6z8K/fAS+x7zdyi9rsI5Mf/ug5Bx1H1w3wZbKimkdOMGOI32ndcWzPJBa7n
         C0bg==
X-Forwarded-Encrypted: i=1; AJvYcCUQyFZU4PBfMVfJaxsezHTpBCXegjymWtmiqgDM3sZJ+RwNExNhM3cLppP9NjTq7tVaEU41th7jJd8ehA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxTcCgHuuq3YdHqkORhBD/b7hdK55ao3e2nWi856Kgd2URkv3pd
	nSPznClo2fJTrD7M6Uco8QuyjNEemFsM2CGH/09MxsJDfD5OorSQlWg3LjVD+0MQX24=
X-Gm-Gg: ASbGnct6dkJfNcrQJZ3aTwznB8hACNCJQGIPBW4Yn6Cu93CXdZmCvpBgdOrcGDFQ+JV
	SE790j3QdJESqtmvOF0uPFg59rLNb0ygnI2fuu2zGYlMIh9RBqLLpS0N7nyRA85qlpaPuKJnH9H
	x4LW7nOZeEQck/08UGIVGhK5YGc/YRSrEDCLT2dbqPddLLXzZXVa6bt+idT3fXDEt0cEBkk9XmN
	Wdk80zIvD+GP+xU+We5kLYx3kbU6kPyy+21u5wcAUaRLF4EoPfl70OqlY3jAKBpTyRoeLRruInF
	39TcxYtNoM75AL/v5z4HpmOWQsPps43UzsbD4xLBCzk9RtisZNmUgrvGRvacMmWylJ5Q06Diess
	b1rvOAkfqOt+Yl5FPIVyMl93qhwtdlOw8yWWcyyGp4ZCcds1jqD07gJQ9UkHSnoFPCJiBzcmJ8G
	nrivSJmAaGMW87bUYO9sVSS7C0lXvadiRp5qIkT7SoozFTUgub8A==
X-Google-Smtp-Source: AGHT+IFDdymJB2Qui1FemWWgGTvX6CFYwAWlPQ4NJbUO3JNIaIrN8E7GPCA9FCFosUo4bQy4mXpGxw==
X-Received: by 2002:a05:6e02:1563:b0:42f:a72e:e179 with SMTP id e9e14a558f8ab-430b43675e3mr253211025ab.11.1760983609985;
        Mon, 20 Oct 2025 11:06:49 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5a8a961e88csm3172542173.15.2025.10.20.11.06.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 11:06:49 -0700 (PDT)
Message-ID: <09484591-e1e4-45a8-8451-afa8feeaf5a7@riscstar.com>
Date: Mon, 20 Oct 2025 13:06:48 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] dt-bindings: spi: fsl-qspi: add optional resets
To: Conor Dooley <conor@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, han.xu@nxp.com,
 broonie@kernel.org, dlan@gentoo.org, guodong@riscstar.com,
 devicetree@vger.kernel.org, linux-spi@vger.kernel.org, imx@lists.linux.dev,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251020165152.666221-1-elder@riscstar.com>
 <20251020165152.666221-2-elder@riscstar.com>
 <20251020-henna-headache-fae4440ec7a8@spud>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251020-henna-headache-fae4440ec7a8@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_110651_000932_CFDC7F89 
X-CRM114-Status: GOOD (  14.04  )
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

On 10/20/25 12:44 PM, Conor Dooley wrote:
> On Mon, Oct 20, 2025 at 11:51:44AM -0500, Alex Elder wrote:
>> Allow two resets to be optionally included for the Freescale QSPI driver.
> 
> This is a binding, please don't mention the driver here.

OK, I will reword it in v2.

>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
>> index f2dd20370dbb3..0315a13fe319a 100644
>> --- a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
>> +++ b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
>> @@ -54,6 +54,11 @@ properties:
>>         - const: qspi_en
>>         - const: qspi
>>   
>> +  resets:
>> +    items:
>> +      - description: SoC QSPI reset
>> +      - description: SoC QSPI bus reset
> 
> If none of the fsl devices have resets, this should be added alongside
> the new spacemit compatible and not permitted for the other compatibles.

I thought that, being optional, this kind of constraint wasn't
strictly necessary.

Anyway, I'll find out first whether the resets are even required,
and if they are I'll rework this the way you suggest.

Thank you for your very quick review.

					-Alex

>> +
>>   required:
>>     - compatible
>>     - reg
>> -- 
>> 2.48.1
>>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
