Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F4B0C88E5C
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Sep 2026 05:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q/lmxToEPvsxCpNoAERxQeLuECapqh/VD9vkDYU7de0=; b=otceBXw1eQlTf+
	dXSICDJ2mWEC3lLEN9YT8lHGQUG556T7lWT7vq//Rr+QqMwRYvG1kyBTXWO8vAw2RYjCt6t38Eovc
	qrLdg2Ptf66NtvCo1WpZyS/ovMORx6t9jd+gupOFoVjkYAECRMZtjnJTtoU4E9Il8sDYgjGAEYJCk
	09rAbL9M3Sxr4XARzKNP0O58CZVyYz6dLEkEgV38jpl+fCtcjlqIU+S+aaEjCExnHOwuGgbBQnMV1
	Bqi9R4+TjqCp3DF2m2vnCzTg9CIJkrpROfyIsT3FilNgXFhLLIXN9Me6TmKWg4PHnRdPpKljbUwjo
	i0G70keOpxoIB5mhK5lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6iDw-00000008O10-2U2e;
	Wed, 16 Sep 2026 05:30:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6iDu-00000008O0U-2ANT
	for linux-riscv@lists.infradead.org;
	Wed, 16 Sep 2026 05:30:23 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FLYmIA840719
	for <linux-riscv@lists.infradead.org>; Wed, 16 Sep 2026 05:30:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PeWBUFQKpi9k7BVFmzgyqFxO12My8fWkOb1uwjidszI=; b=UYrXbv/VQwW3H57t
	Z0UA/w7bnzdwE+dSanmAzsdRk6gI/sj++H+ff/fO+Q9t7k2dHX8ErySsMR/cjeqj
	l+/Za20c21hYA/wfmv93J2ezDeIYAwmDKRlgOhe6F7ofLpdRItYwUuja43nD3qn4
	QMy3qBmPT+SYvdotWXdNsjSPEF5e8zujzBlTA+u7OGgjGAnG4fWgPM76B6Z4CkfT
	zqhtTcqmvLvb/7iptDndqOl8lyC4qQHLaHNSCKRfQpKV3ed9fO1OmvVUZAqxMgVV
	913Y3Rhehxxm4XZXl4d+tGPrrR5ROnpYYFlF5b1CNfBV6tC/wMiyAxJHUvmVa6/+
	r0UoLA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqdyw9gp7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 16 Sep 2026 05:30:21 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39e087a17dfso2204320a91.3
        for <linux-riscv@lists.infradead.org>; Tue, 15 Sep 2026 22:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789536620; x=1790141420; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PeWBUFQKpi9k7BVFmzgyqFxO12My8fWkOb1uwjidszI=;
        b=AjFjdzx5Edm7EhSPn7d4JN2DeocaN/PY/X8EC/3ygFx/TtTMGpYud0Z7rWRhIQ+7KB
         jEKzOTtPz2zSZBwiUsGvlpCcJYJbu14ChhRFVAJg6wMd0t5TCSSLiBj5agHDCadDNM4f
         HGmBOzi2E2jGKeM92o3jQW7ZwwOCzRyy1YtNeu4VxyH9z4YtW6zH4CJ9gfiBeMhMak37
         4ty+RVi9A03nIZgXVBauWMt5KnvF8Zb/MkydQTKAWeATSyYq0vx5LveUSNqGRa4Cp1ur
         oMqfHzRRtfW9tHex231R42WQlmKoPcwC3GOkNl1jM7+LtAfxtImbQB1bqvdZxvSmcC/F
         tHcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789536620; x=1790141420;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PeWBUFQKpi9k7BVFmzgyqFxO12My8fWkOb1uwjidszI=;
        b=RhxtjjVLkhNmNpTOu+djJvjhTg45UDJtESzvs0OA7jld+ULilQXWpQkWHF6bFFPQqT
         zGdEdh6PdHtYBn9g8FxqRE8x5tktiNi9tax2msIA3A4+0JG9udLy/xU3YjYfDxxWLJWe
         ioUqfDuNo/c9wIJypItvAKGJHzsqV/maLf/nVPVvrSzKjB0QGfHaCsJqV5DKoXVnV//n
         KJZb7VZ5T518wpTcz1HmB8jG6Mt4eARClDygamxy9S7fx7JRHXoSbDJ6r9XyXEq7V6N3
         uh28e88vJYp6aBbVFKR11gGoqqexAneC7qmgNABO01LGcD00WW6P2SezdCEIIurzT/Ky
         uMnw==
X-Forwarded-Encrypted: i=1; AKwUvBy5LbrIW3a3tD2pyDvmhNkCXqg+kzUmSZpFjCui74/iBV9dv/STv8iKBUBtiVYocn/gFZ9EK/5XSpMCug==@lists.infradead.org
X-Gm-Message-State: AFuF++l3OCFh760H9VqVC/L+OW7Dy1mNSKKvf6HEPsJnrTYlQFiKjeur
	T7hLdVRRgnkYnL2pPEjGZe4+7zFSzCKzfvLGuEVddZcTSCQO3wWIJqZ/YGUK9Sxy7mcmbuww6Hn
	pEsOnr3NXiyRAR6zKp4h6txSYmsWSImS6RtYxf/7feoH9Nks5aQJ2i7J9uD1CqyLkLMEfFeo=
X-Gm-Gg: AYBFou1F3oDjnUNh48KB2dfxgijgrMBDaUpGzGDkSGStadixAItjeBakyLkwEpSYOEJ
	AXIWIWvuSl60iQMc8pA0QQZ9QfvYmVpal6+xaENpoqDqXR0MET6DinTbO/Xd5Ax1m63gp6hNkJV
	eWizPxEGjo3gG+eEO2lj1Y8yVRoyOFu2hwqsLpvTnhlfy6my/frcaDe8/yO3Yx87BpPcVkNzkxX
	pHaFaNgR5o2Q/pPCQA754d9Nz+jIlQE/sKayUr9S37mM56e4z751hFKFiHLLewpDahN/+A7Yjla
	ipXgkib21klxFywcdnLqYFaawoUpw2H1cwGv2S18wYnoIXpvyEfJZxtuL5kjuTSuc0JereoUsvY
	0WBHyHlijIPy2OtFBKRZ2ARgnU3RjZBwXYqiqKA==
X-Received: by 2002:a17:90b:224b:b0:38e:57a3:f218 with SMTP id 98e67ed59e1d1-39e1e4246f7mr3005298a91.13.1789536620499;
        Tue, 15 Sep 2026 22:30:20 -0700 (PDT)
X-Received: by 2002:a17:90b:224b:b0:38e:57a3:f218 with SMTP id 98e67ed59e1d1-39e1e4246f7mr3005220a91.13.1789536619995;
        Tue, 15 Sep 2026 22:30:19 -0700 (PDT)
Received: from [192.168.86.250] ([76.176.48.107])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395d13ee7sm3425309c88.8.2026.09.15.22.30.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 22:30:19 -0700 (PDT)
Message-ID: <a9d9aac7-cb2d-46fe-a220-40f61f615b89@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 22:30:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/5] optee: riscv: add RPMI TEE service group
 transport
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rahul Pathak <rahul@summations.net>, Anup Patel <anup@brainfault.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org
References: <20260912-rpmi-tee-service-grp-dev-v1-0-1d1d35c2a859@oss.qualcomm.com>
 <20260912-rpmi-tee-service-grp-dev-v1-1-1d1d35c2a859@oss.qualcomm.com>
Content-Language: en-US
From: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
In-Reply-To: <20260912-rpmi-tee-service-grp-dev-v1-1-1d1d35c2a859@oss.qualcomm.com>
X-Proofpoint-GUID: C_2eIogE8NP3hrYUkBOgW5fLbg79P0yX
X-Authority-Analysis: v=2.4 cv=aJ1lOr9m c=1 sm=1 tr=0 ts=6aaa296d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=lsoD3MMNObdLvy1227ExmA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=v3eslg5cZyQnhgVqE9oA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDA2OCBTYWx0ZWRfX/6iVIZ8h6n8E
 PDbYb/PDJJGGr2trvhS/+jjEtSe8jGPrB0XLCbQuPlMDi4XiuzdQW7fSlj7j1Qgm1Kbrb6qbjk+
 5kApv4GQs8n9TVFBK3fBJrKCfg2c76kRvNT88atdJ56PU4+YUu5CXxtkYESPBwCwRTPvnqXfMUD
 Fv1D2mNs8lSjE5Kuwg8H5dPmEaoDoTFK4zMUjJ0xlVj2YoThyCbiPVx9pYR+1d9/KcJjNJ6fsX8
 XAUE9+ngks/vEn6y/4I1scuCz38d99lrSvC7cZvBX5Epfoe9v8LyscE0v4ePeijGXALaunu3WwP
 VdcYHn7hgvEkfmfGXBwuyLVJZkk0W+fzYk+YKilYgU7ccG6NerVGt1cB37cCtrOqOo8EirIl1+d
 T6QGY9WHbCrc4YicT3VspJ0FMCpan092fhRs/4jEo8kUJ/UdPvAqpGn/X47pb0cVvHHTUph0LYT
 Qquc9NPzKKomDemOf7Q==
X-Proofpoint-ORIG-GUID: C_2eIogE8NP3hrYUkBOgW5fLbg79P0yX
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDA2OCBTYWx0ZWRfX6bRGOP0rXkLs
 8LUeOezSSKrQQkl9c9SeLulnty8NdM1rPIjMNXSvNMyOBOJ5IaZcnqexrxoP/iDaSAUGpuvoKBN
 eX48uLMNLGKlRVfuox9s6+tXYGKVKMo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 clxscore=1011 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_223022_584055_862DE5EC 
X-CRM114-Status: GOOD (  27.99  )
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

On 9/12/2026 3:15 AM, Amirreza Zarrabi wrote:
> Add an OP-TEE transport for RISC-V using the RPMI TEE service group over
> the SBI MPXY mailbox framework.
> 
> Request one mailbox channel per hart and use the channel corresponding to
> the current CPU when issuing a TEE request. Probe the RPMI TEE service
> group and required memory-sharing capabilities before registering the
> transport.
> 
> This provides the basic transport and discovery support needed by the
> following patches.
> 
> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> ---
>  drivers/tee/optee/Makefile                 |   1 +
>  drivers/tee/optee/core.c                   |   8 +-
>  drivers/tee/optee/optee_private.h          |  34 ++++
>  drivers/tee/optee/optee_riscv.c            | 312 +++++++++++++++++++++++++++++
>  drivers/tee/optee/optee_riscv.h            | 141 +++++++++++++
>  include/linux/mailbox/riscv-rpmi-message.h |   1 +
>  6 files changed, 495 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tee/optee/Makefile b/drivers/tee/optee/Makefile
> index ad7049c1c107..925b8ec7ef68 100644
> --- a/drivers/tee/optee/Makefile
> +++ b/drivers/tee/optee/Makefile
> @@ -9,6 +9,7 @@ optee-objs += supp.o
>  optee-objs += device.o
>  optee-objs += smc_abi.o
>  optee-objs += ffa_abi.o
> +optee-$(CONFIG_RISCV_SBI_MPXY_MBOX) += optee_riscv.o
>  
>  # for tracing framework to find optee_trace.h
>  CFLAGS_smc_abi.o := -I$(src)
> diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/core.c
> index a52c1f498b99..63f1725e646e 100644
> --- a/drivers/tee/optee/core.c
> +++ b/drivers/tee/optee/core.c
> @@ -220,6 +220,7 @@ void optee_remove_common(struct optee *optee)
>  
>  static int smc_abi_rc;
>  static int ffa_abi_rc;
> +static int riscv_abi_rc;
>  static bool intf_is_regged;
>  
>  static int __init optee_core_init(void)
> @@ -245,9 +246,10 @@ static int __init optee_core_init(void)
>  
>  	smc_abi_rc = optee_smc_abi_register();
>  	ffa_abi_rc = optee_ffa_abi_register();
> +	riscv_abi_rc = optee_riscv_abi_register();

Isn't it growing rapidly now? We have two register calls for the ARM,
one for the RISC-V. One more region specific ISA I am aware of and it
may have op-tee support in future? It is time we fix this logic
in the better way. 
 

>  
> -	/* If both failed there's no point with this module */
> -	if (smc_abi_rc && ffa_abi_rc) {
> +	/* If all failed there's no point with this module */
> +	if (smc_abi_rc && ffa_abi_rc && riscv_abi_rc) {

This is started looking ugly in my opinion. 

>  		if (IS_REACHABLE(CONFIG_RPMB)) {
>  			rpmb_interface_unregister(&rpmb_class_intf);
>  			intf_is_regged = false;
> @@ -270,6 +272,8 @@ static void __exit optee_core_exit(void)
>  		optee_smc_abi_unregister();
>  	if (!ffa_abi_rc)
>  		optee_ffa_abi_unregister();
> +	if (!riscv_abi_rc)
> +		optee_riscv_abi_unregister();
>  }
>  module_exit(optee_core_exit);
>  
> diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee_private.h
> index aefe1e6f5689..8d22d65e087b 100644
> --- a/drivers/tee/optee/optee_private.h
> +++ b/drivers/tee/optee/optee_private.h
> @@ -171,6 +171,31 @@ struct optee_ffa {
>  	struct work_struct notif_work;
>  };
>  
> +/**
> + * struct optee_riscv - RPMI TEE communication struct

do we need to name it optee_riscv? we don't use optee_arm anywhere in this
code I believe. 

More later...


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
