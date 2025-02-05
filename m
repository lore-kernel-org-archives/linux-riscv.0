Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B84C02192
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 19:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=66DIFEka4J1e7vppoGD2Z2XAUxWCd+mmlD+/VxcGmto=; b=1L6nJwRGUuJgKE
	0pSyIjnGWy7xSZPxvOq6L0f6aDvT0c3F/5Tl+RisB7VWplZAuGBpTMkThIBS1Ll7JzPUNbXYeVg7+
	jNEfxZz+vjx4B+KU2/eENfGlcJyPCPeQN7gqQnP/Uy6GCqJ1ZeleGxPtxGCAD4RcJJ8+8hF+rHCnC
	QbkA4BEpwviwQxtfUBwEK8legY6ES/BcN95xF8Rbtn4GpIatH5pXKu41bhN114g2cFDAjjgVwuxUT
	ilRD9vx8DTOqEMgLy/IF4+bnemJap8XohfXKmHcJZA1+tqMNqdKLJtiOaVTVjzYEhAfzlIFbhbegR
	uIdEEJadO5mb+5N8MIlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tflNj-00000004SCA-3jvQ;
	Wed, 05 Feb 2025 19:48:19 +0000
Received: from omta040.useast.a.cloudfilter.net ([44.202.169.39])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tflNh-00000004SB2-1mg6
	for linux-riscv@lists.infradead.org;
	Wed, 05 Feb 2025 19:48:19 +0000
Received: from eig-obgw-5001a.ext.cloudfilter.net ([10.0.29.139])
	by cmsmtp with ESMTPS
	id fi3NtD7fq1T3hflNVtJOv0; Wed, 05 Feb 2025 19:48:05 +0000
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTPS
	id flNTtiPPbHEACflNUtQRAL; Wed, 05 Feb 2025 19:48:04 +0000
X-Authority-Analysis: v=2.4 cv=HdLfTTE8 c=1 sm=1 tr=0 ts=67a3c074
 a=30941lsx5skRcbJ0JMGu9A==:117 a=30941lsx5skRcbJ0JMGu9A==:17
 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=7vwVE5O1G3EA:10 a=DfNHnWVPAAAA:8
 a=HaFmDPmJAAAA:8 a=eXBiEjBhb-fYyGQ4tMMA:9 a=QEXdDO2ut3YA:10
 a=rjTVMONInIDnV1a_A2c_:22 a=nmWuMzfKamIsx3l42hEX:22 a=hTR6fmoedSdf3N0JiVF8:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=w6rz.net;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=8j1K6FAoEkl2PfNcREOsthr+nw54d02avdm2huO3uYM=; b=AeUc6gFGydkfFWzsttzHYnc0Rv
	e24aVJmCxwJJKYXojO2e2nJ5WmzbqdGJeKuKdyJh65HofoXmYEkniZZzM6Q+Uws8N2ERAhmP+hWqC
	xtPNDSeKs091bxu55NO0t5Ng57mOj7AnWNM6l/KeGrsttYQoxVQ8cm2dMxB0lk1IUqVuYlSLs0WSJ
	Bwm2G25h6pLH8MqHdSgOW328XtfzVa/kXcMJonOhk89N93OWHtW+B0bV+ihUI54eLhj/KWplpJ6H2
	PzM5f4nd/G7jbGFjfEGmioyPhBjZq6ZhA+iHHqkCXCdfPVxn9JrK2GH/gVIRp32dQP9CBc1RrmLg5
	0g1unjBA==;
Received: from c-73-223-253-157.hsd1.ca.comcast.net ([73.223.253.157]:44952 helo=[10.0.1.116])
	by box5620.bluehost.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <re@w6rz.net>)
	id 1tflNT-000v4b-0A;
	Wed, 05 Feb 2025 12:48:03 -0700
Message-ID: <9b6b27f2-f1c0-4d60-8535-86d057e51c6a@w6rz.net>
Date: Wed, 5 Feb 2025 11:47:59 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] riscv: Use of_property_present() to test for
 non-boolean properties
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 linux-riscv@lists.infradead.org
Cc: Steffen Persvold <spersvold@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org,
 Jeremy Linton <jeremy.linton@arm.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Yunhui Cui <cuiyunhui@bytedance.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 =?UTF-8?Q?Miquel_Sabat=C3=A9_Sol=C3=A0?= <mikisabate@gmail.com>
References: <20250205143903.413959-1-emil.renner.berthing@canonical.com>
Content-Language: en-US
From: Ron Economos <re@w6rz.net>
In-Reply-To: <20250205143903.413959-1-emil.renner.berthing@canonical.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - box5620.bluehost.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - w6rz.net
X-BWhitelist: no
X-Source-IP: 73.223.253.157
X-Source-L: No
X-Exim-ID: 1tflNT-000v4b-0A
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-223-253-157.hsd1.ca.comcast.net ([10.0.1.116]) [73.223.253.157]:44952
X-Source-Auth: re@w6rz.net
X-Email-Count: 10
X-Org: HG=bhshared;ORG=bluehost;
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfK/JLBGxV1g7jBlF6kz7m3ecyMuGQkgpO8HBGpNfJMBe9gMiF9E7PG7I9HQg3vNmSNaaeWfeqoYMMj1Wp2XqBSt2H1zKFJMp/OnpJS0yEzpL5E2pJxc1
 bIFiGiUNOEaq93jQ2Hm0G/oV168lQFBWzcOvXzM4Jm/QShwWtUBNP2HN4JfHW4lZ0DG0whvZ0/Z9qPG0Ifz4xcDdnDLwqL27RWQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_114817_595225_F5BA2E9B 
X-CRM114-Status: GOOD (  10.46  )
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

On 2/5/25 06:39, Emil Renner Berthing wrote:
> The use of of_property_read_bool() for non-boolean properties is
> deprecated and since
>
> commit c141ecc3cecd ("of: Warn when of_property_read_bool() is used on non-boolean properties")
>
> a warning is displayed when used incorrectly. Fix it by switching to
> of_property_present() as recommended in the same commit.
>
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> ---
>   arch/riscv/kernel/cacheinfo.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cacheinfo.c
> index 2d40736fc37c..26b085dbdd07 100644
> --- a/arch/riscv/kernel/cacheinfo.c
> +++ b/arch/riscv/kernel/cacheinfo.c
> @@ -108,11 +108,11 @@ int populate_cache_leaves(unsigned int cpu)
>   	if (!np)
>   		return -ENOENT;
>   
> -	if (of_property_read_bool(np, "cache-size"))
> +	if (of_property_present(np, "cache-size"))
>   		ci_leaf_init(this_leaf++, CACHE_TYPE_UNIFIED, level);
> -	if (of_property_read_bool(np, "i-cache-size"))
> +	if (of_property_present(np, "i-cache-size"))
>   		ci_leaf_init(this_leaf++, CACHE_TYPE_INST, level);
> -	if (of_property_read_bool(np, "d-cache-size"))
> +	if (of_property_present(np, "d-cache-size"))
>   		ci_leaf_init(this_leaf++, CACHE_TYPE_DATA, level);
>   
>   	prev = np;
> @@ -125,11 +125,11 @@ int populate_cache_leaves(unsigned int cpu)
>   			break;
>   		if (level <= levels)
>   			break;
> -		if (of_property_read_bool(np, "cache-size"))
> +		if (of_property_present(np, "cache-size"))
>   			ci_leaf_init(this_leaf++, CACHE_TYPE_UNIFIED, level);
> -		if (of_property_read_bool(np, "i-cache-size"))
> +		if (of_property_present(np, "i-cache-size"))
>   			ci_leaf_init(this_leaf++, CACHE_TYPE_INST, level);
> -		if (of_property_read_bool(np, "d-cache-size"))
> +		if (of_property_present(np, "d-cache-size"))
>   			ci_leaf_init(this_leaf++, CACHE_TYPE_DATA, level);
>   		levels = level;
>   	}

Works good on VisionFive 2 and Unmatched.

Tested-by: Ron Economos <re@w6rz.net>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
