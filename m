Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9908C83F17
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Jul 2025 17:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pIRtnn3xI05oUc2d67R4J5IsOD3PSBBF7wOqQ3vwhVg=; b=k8Fb+dL5ok5845
	gBwoMcObFdw8NECysM177LBxVbH1kxm7Hswa1z5narrJdpAov3mSnr/OEz6R7fLNYFNZYuySfEoeG
	Xqanl73Ucqmek0VJw/z34vALtQpbfb9CP7AN7w9J8b+7NIj3+tEyBZivgWpGIqddqeQWCGkMAhQ2c
	30efCszLi/YypopW+5rWZ6abdhkjFi2Dvgh+M5tUgERnOZbOVE4dm1vfa9A/8bQQcjn1tNWWAn/kI
	BSGQhjBBF4HnTQoM7lzqDf8e6ZCDxpz2eAUdLmCUT4wdo3Thf2/XoTXdO09ElzLW3HMnCBUSP2VlB
	Ye2NK5UmYOF/54FOoKCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugRaO-0000000F5xb-08KB;
	Mon, 28 Jul 2025 17:24:28 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugQwq-0000000F0ov-1ZEX
	for linux-riscv@lists.infradead.org;
	Mon, 28 Jul 2025 16:43:37 +0000
Received: by mail-io1-xd35.google.com with SMTP id ca18e2360f4ac-87c09672708so81200639f.3
        for <linux-riscv@lists.infradead.org>; Mon, 28 Jul 2025 09:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753721015; x=1754325815; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ldQSwkThGxTZIExSscNpx1zCzTVrhc9kUZXUJm0UXLk=;
        b=YSAZ6+Us4zH+phTi6V74c5oEICicp4aTTDdnk+Tixk9glQAKIhxYv7evfxp7WOmaw4
         qLya2s64X7lqt4L5do2x0d1Z/ELlwwsHjM/LXe7ql0GqPRhN+KynOfvltwAUT8oOF+v4
         coKmUvXFs0qzssYpWsPlkARuqh7afNG8Mxo10NDkGxk8zucKlAlXIuiGviIXRdD22JID
         Fd/MOkYbu6DLus1G9SEu/HMExF7P9Ty1FIDmar766lCk3LOd02l3DWN/mOBcDrpY37il
         aSMymn3HRmvEKWder8vHrp3gb1jVmp4WouE9cVEMd70VHptQkfey7l/OOOTdLyDNO840
         P03Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753721015; x=1754325815;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ldQSwkThGxTZIExSscNpx1zCzTVrhc9kUZXUJm0UXLk=;
        b=GB1H3wQW5G1VG5SKxAqGHsEmbHQEPerksZr0AaeS12zojMIdyF3l/iG0SQhYL9v2kg
         41JSjtj0e23eyRLnWwEQJqcTfWY8NMiH2HkOTLfybow8nVPz0yfQ4xjntr8ABXqUVVvI
         yKxf9f1E61pJKaVupo2Nj970Q/QcUgb3cAVW8m6y37jdrStYVqSj09oJRVU9eRZj9W3f
         N3+Iy/4cU7jxNyPAM+HJ4VKribGmCYx052rXiu8I8zc0oST1b7j/ZYMcuDWu3ZZrguky
         8tH8Rfjezf9WREOvrsfit0sra1HKhjwGemOU2yvHEBDFmiFqRv5OEVBxfeXaK7sBhoVw
         CJ2g==
X-Forwarded-Encrypted: i=1; AJvYcCVKld7XrI6u+jGQuftWGlr/uQnUEpLVpqFyXpzSYoRlvkre/5xBO5TZBF9+jGUlJ71N2KQMZI+IqcG0eA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzdUST+B3aGfQIV3LKB0vc4rgJgFHrAQjv4AtgA8P2e6+5gVnWf
	G9EW3U5pf42JD3gj1lX5THz0svPLxrH0stwcf6X90CqBInKpWBOpamgq9YNuJf9qvfM=
X-Gm-Gg: ASbGncv+afr7nXGvvoDym6Xkz5oKJJk4X0yikTHv7hNVDDGwz5FOZ2ESofm9cx3mmFd
	D5QWg/gUWZeuMDMvBgP/2sOiC7APjs+9Zf5KGscR+aBsSeH+l44EfC00aCP013J/fIk+N/iv19n
	0x+qlsRjR7VgBUQnx2V4fi1pvf26ll8LQ3i4WoLy8dGxUorDsZfckA6aXe9IG22GJv5KYANCxhz
	cgRhHeXm8VuNEfibuxnONUOhrJNTelxEufkZ0EwVmo8n93K8ESBzYE3AwoaND6Bh1vUiqmJkE2L
	lYpMB84+kqjKK3nn5E7kNFWnWt2iz60+SaOfA7RkBLH0/31XRfl8Yz4jyBdimCBcXHlM5tu6kze
	F+MoO+LF8THitKvLaUnnzJFZmqLjewRncJJy0fZv1Nj3jhir5MMWay97kqinL7sc=
X-Google-Smtp-Source: AGHT+IEKf13G5VVtKix2Gq667g//FiBaGINonaogdX3yn8hZwcFv6711Pe8N6gMwP+Vbi5i7MjtaZg==
X-Received: by 2002:a05:6e02:1805:b0:3e2:9f1e:e291 with SMTP id e9e14a558f8ab-3e3c53125b1mr209554715ab.21.1753721014595;
        Mon, 28 Jul 2025 09:43:34 -0700 (PDT)
Received: from [172.22.22.234] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3e3cad13c7csm25861755ab.61.2025.07.28.09.43.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 09:43:34 -0700 (PDT)
Message-ID: <ef2b4526-3725-4a25-9118-ab77a1d91362@riscstar.com>
Date: Mon, 28 Jul 2025 11:43:32 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/8] regulator: spacemit: support SpacemiT P1
 regulators
To: kernel test robot <lkp@intel.com>, lee@kernel.org, lgirdwood@gmail.com,
 broonie@kernel.org, alexandre.belloni@bootlin.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, mat.jonczyk@o2.pl, dlan@gentoo.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, linux.amoon@gmail.com, troymitchell988@gmail.com,
 guodong@riscstar.com, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250726131003.3137282-5-elder@riscstar.com>
 <202507281558.lZ0NYtth-lkp@intel.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <202507281558.lZ0NYtth-lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_094336_526898_B4BD1217 
X-CRM114-Status: GOOD (  10.56  )
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

On 7/28/25 2:37 AM, kernel test robot wrote:
> Hi Alex,
> 
> kernel test robot noticed the following build warnings:

I have a fix for this, and will include it in v11 of this series
when I publish it.  I will wait to do that until I get additional
feedback.

The fix is to make REGULATOR_SPACEMIT_P1 depend on I2C, in addition
to ARCH_SPACEMIT || COMPILE_TEST.

					-Alex

> 
> [auto build test WARNING on d7af19298454ed155f5cf67201a70f5cf836c842]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Elder/dt-bindings-mfd-add-support-the-SpacemiT-P1-PMIC/20250726-211530
> base:   d7af19298454ed155f5cf67201a70f5cf836c842
> patch link:    https://lore.kernel.org/r/20250726131003.3137282-5-elder%40riscstar.com
> patch subject: [PATCH v10 4/8] regulator: spacemit: support SpacemiT P1 regulators
> config: alpha-kismet-CONFIG_MFD_SPACEMIT_P1-CONFIG_REGULATOR_SPACEMIT_P1-0-0 (https://download.01.org/0day-ci/archive/20250728/202507281558.lZ0NYtth-lkp@intel.com/config)
> reproduce: (https://download.01.org/0day-ci/archive/20250728/202507281558.lZ0NYtth-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202507281558.lZ0NYtth-lkp@intel.com/
> 
> kismet warnings: (new ones prefixed by >>)
>>> kismet: WARNING: unmet direct dependencies detected for MFD_SPACEMIT_P1 when selected by REGULATOR_SPACEMIT_P1
>     WARNING: unmet direct dependencies detected for MFD_SPACEMIT_P1
>       Depends on [n]: HAS_IOMEM [=y] && I2C [=n]
>       Selected by [y]:
>       - REGULATOR_SPACEMIT_P1 [=y] && REGULATOR [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y])
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
