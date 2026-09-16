Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF007C982C9
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Sep 2026 21:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=28wmkP+KyNonI2GycZHcqUUNO9cTkeFgmfXNNci7s58=; b=R1MXBfNZ5Mv6uj
	0MCnKl1wucHEfS2rRZRB3roip916CSc6ZrDutVMyKy37SXKwPb0WMRs8k6qp08pTKuVeDZ+8xJbW4
	2htYSxjhrzd2vYq2OegOSfxM4x3JOdga05apAEIwEFd9CLR17EV0SabznINOEbgYU0AK1IH/WPuzi
	WFnPCiauGnM8UCa+Xm7Vtf3DRsJpNH49/dE8WV80ZeXZ/mXTpiFNmmEkITb4Xp5FR/J0yQ9lM7ND1
	B6haKbux6CllpgHAB9W8uUquqCYGjty6mZf5jWDoQnaEArVCCZIbSyhljT7tB42xCg8cRY6nwjtaB
	MamdW5/BqmA2kcczVK4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6x6f-0000000A8or-3AF5;
	Wed, 16 Sep 2026 21:23:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6x6d-0000000A8oT-1x5b
	for linux-riscv@lists.infradead.org;
	Wed, 16 Sep 2026 21:23:52 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GFeq7b4056976
	for <linux-riscv@lists.infradead.org>; Wed, 16 Sep 2026 21:23:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w/qTLVLi8JrEbZ5Wtjo59+5wUP++p74xd9zORAOvt3Q=; b=B9zVUleqVc0IwYvo
	2kVS9RooIb9ERrcP5PS6AJMR0gaiIevixWLq5qN/3aBKETxjM+rhRBUTzcok5Whb
	svM4ZTgwJPuPkCaNElgopGA52rcmgpqGQ7XVErtlmAIEq+GzVMbMCz6NH7EA7DIx
	JFvOfToWEO0K8/39zGLSg9eniwoyvlbxaElKoqjDbAnPej0Q6e50+et7aoofhuox
	XHRPcOIRMlbXXmowCW3mvxB+TDmnEzDZfJDrqhJKvE0PKJOxQYHIl9qkUCr6fnmg
	4vxlh7AoQbWeNSsdY4heO8bk0K6uRVpYox3qdPrQXH1kiaweWsoA9yWTsJkLltAR
	0ei0/Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqpu2uhg1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 16 Sep 2026 21:23:50 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc4b524ce78so91544a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 16 Sep 2026 14:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789593830; x=1790198630; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w/qTLVLi8JrEbZ5Wtjo59+5wUP++p74xd9zORAOvt3Q=;
        b=g9+OrvCPoRhlA70h8fz/3+Qd+NQHW5hgJKaDQrfMSj0/AyV4CQWKaYtfWa7qUIiDAp
         a+coZHh5daO0UmjC8HNn3xKH9zr8gQZHZZfl2u0YjmL+gsybjvdK3PZpq1mckPNMWyFk
         S2T4cvlZepdwCZAjHBuz3RyHVZLvylYJGW67vmdFTLrMQSlNCLL/DHwMPCP44T/M+orq
         es1fbRlBRmcq7x3ikK5bqQfiinXpO9qt3Dypvo9Qh8+rfAPjYUVwJHgg4pPCxKQW+6PY
         P4cbEd6LT8IzttAgmpBj0P0DON1jXqTAxVIbMODMOySv9zWy+nycghXlUp0nhpHkVxMv
         gQog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789593830; x=1790198630;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w/qTLVLi8JrEbZ5Wtjo59+5wUP++p74xd9zORAOvt3Q=;
        b=AHZDex/LILuePqsfZ57PeB+8V7Qw0GX5to4Y3NK0mDydfOVuKXBHkTSWKmppcBstPm
         x7ZIneafOp5kiL8kT8lwdutvol3dQ6yHg5E+MRtLSxIc7+c7cYTtNZ9Mr4R/4iER3YTm
         QZdndB199+DUCMvtHbMuCW0U0qWQoMXC+ppgeIU6PUQfcsh2RlBly3wMPpFQ7KNDJ7Vi
         Y2IG3lsINnvjocXa2qRqhs4aCAXS9reBJVefmgvo1Bm5g3ZAsIU2NHT3BLWsg1J4w2US
         uN2dtZJekNSTBfyLg9LdeqE8NFAEYLqv6+RlG/ZTZt7dr2FF2iReSP6sSmz/cyiCfQYS
         huaA==
X-Forwarded-Encrypted: i=1; AKwUvBz+LvtXumng29QsOwzfa+fjwSbrwhiML4gwj8MbLgpSwVwfd1jqBLiI5SEBC05xqsMfGgQ5ZDTScI1wHw==@lists.infradead.org
X-Gm-Message-State: AFuF++nneR+snBoplrluVlkd9orVVEU8RTvdk6ugbU5h8i2qb3NPs4dW
	iIV4T5xQzUeYJTAeuF4ETrzUBJJ4kis2GlXq6bpKUtUQf0Qu9Voa6EcnjCCYeRkvypjM3lMa34j
	F5wrFRzshczSUVbHZLYoGnZFLlpbFvf/3WEMag2vUPuUwWTByqEotNwS/uYvGz4np+xV4vQ==
X-Gm-Gg: AYBFou1BR/PkY6ZMI6cw05QLIPMvBbKoLfN6cjMAEDkFf65cjm3l4tLg+bkYHkheIku
	NDrIrwnpeda4EOlMOF/YvNma0EHNcLFlG8ST2ihlAvJ0lcVuMQ4Rqczd11+iNvd4/eUnOney8XM
	nhQPJNcYZ4RqIoZZvR2SJOzpFX3l1nyCJWYZ9G1PsaCk0wORCUqL4g39TU/SJLuH7JTEWOeb8UM
	P5uAbUREk3gszw3tuYQuOKOYpcGlHNirDz5/IeonzQ4qcU2YwlLxklVqCaa646fJia5EMH6uFnp
	g60Bkk20Gu/L0HyuxZdEhGJ1lPuTVmNsMTbOJxkAjWM48fu6DqaywYwBOmD39RDFs1fSxcJ+Sgo
	w20tN2ptyfCThDT882Tq2I7+AKiqjdOjx
X-Received: by 2002:a05:6a21:6b10:b0:3da:3bdb:b22a with SMTP id adf61e73a8af0-3dd5f71a912mr10826738637.20.1789593829888;
        Wed, 16 Sep 2026 14:23:49 -0700 (PDT)
X-Received: by 2002:a05:6a21:6b10:b0:3da:3bdb:b22a with SMTP id adf61e73a8af0-3dd5f71a912mr10826675637.20.1789593829396;
        Wed, 16 Sep 2026 14:23:49 -0700 (PDT)
Received: from [192.168.1.86] ([65.181.15.100])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50a7a3526sm2253425a12.0.2026.09.16.14.23.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 14:23:48 -0700 (PDT)
Message-ID: <786a1460-c660-4de7-bb07-debdbd6a4661@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 07:23:40 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/5] optee: riscv: add RPMI TEE service group
 transport
To: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>,
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
 <a9d9aac7-cb2d-46fe-a220-40f61f615b89@oss.qualcomm.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <a9d9aac7-cb2d-46fe-a220-40f61f615b89@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: IreisyxDRLZiZwNGgFz6qQrYCYoFIR_k
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aab08e6 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=RYJI0oIToGyOemi2SthaJQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=-u4usqK0Ikitso02ChQA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: IreisyxDRLZiZwNGgFz6qQrYCYoFIR_k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDI5NyBTYWx0ZWRfX3yHzSc5StM8s
 C8DZK+Lw7aTMGHawySTtzZwF/WE9ix20Pfz4i2xDr58qwQJfbgIpfUnwNInSb8Jx90K3HzOu1AQ
 DDYjLSKP0VX61XmnSse/ubzMY5nbK/bcBI0yfQIxo/kZjNGCV/EzDDM92slJussOuhzeq5V4X9K
 4aWbtuorwgyIP1OZzdiPwAIwBKZaM6J+LvzefsDWwEJ8TXpbFGk5218glssulgXpTIFV0JsWAkV
 Q1RiCLT7nbtKm1AlOHdqZERR5PHBgNyTD8VAnfgBQbfE+Jf4Qmup4T4GrOWhLubQwb/nNY0GQcN
 cGK1CNQl7uAdQsRVIrg45bbuuNWZfv7Y8l060jXQLETcEq5qdhU1uH+JZpQEBOfJ6QigWoyrKYv
 G+/BS/dishycwmDUNqaTk3V6aEmQRMdc+7ps+GKOEr7pKnvCjs/ExpvQ1Nz/VgdzL55TV7Cz7Gm
 a4S0V8pn7WMuK+fU1FQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDI5NyBTYWx0ZWRfX8imhRPqlFP3f
 +vKQ6qhMmOUZUa7MIcMnrrc06tvx40dQ95OWs0Qt6ABwkcxPIo2psQjYAfc/7sCgmtE8wHsbR/5
 cQEtbc3TS0uCD0QguabxAeuw6PDE/RQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160297
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_142351_525697_DEAB5026 
X-CRM114-Status: GOOD (  29.06  )
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

Hi Trilok,

On 9/16/2026 3:30 PM, Trilok Soni wrote:
> On 9/12/2026 3:15 AM, Amirreza Zarrabi wrote:
>> Add an OP-TEE transport for RISC-V using the RPMI TEE service group over
>> the SBI MPXY mailbox framework.
>>
>> Request one mailbox channel per hart and use the channel corresponding to
>> the current CPU when issuing a TEE request. Probe the RPMI TEE service
>> group and required memory-sharing capabilities before registering the
>> transport.
>>
>> This provides the basic transport and discovery support needed by the
>> following patches.
>>
>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>> ---
>>  drivers/tee/optee/Makefile                 |   1 +
>>  drivers/tee/optee/core.c                   |   8 +-
>>  drivers/tee/optee/optee_private.h          |  34 ++++
>>  drivers/tee/optee/optee_riscv.c            | 312 +++++++++++++++++++++++++++++
>>  drivers/tee/optee/optee_riscv.h            | 141 +++++++++++++
>>  include/linux/mailbox/riscv-rpmi-message.h |   1 +
>>  6 files changed, 495 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/tee/optee/Makefile b/drivers/tee/optee/Makefile
>> index ad7049c1c107..925b8ec7ef68 100644
>> --- a/drivers/tee/optee/Makefile
>> +++ b/drivers/tee/optee/Makefile
>> @@ -9,6 +9,7 @@ optee-objs += supp.o
>>  optee-objs += device.o
>>  optee-objs += smc_abi.o
>>  optee-objs += ffa_abi.o
>> +optee-$(CONFIG_RISCV_SBI_MPXY_MBOX) += optee_riscv.o
>>  
>>  # for tracing framework to find optee_trace.h
>>  CFLAGS_smc_abi.o := -I$(src)
>> diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/core.c
>> index a52c1f498b99..63f1725e646e 100644
>> --- a/drivers/tee/optee/core.c
>> +++ b/drivers/tee/optee/core.c
>> @@ -220,6 +220,7 @@ void optee_remove_common(struct optee *optee)
>>  
>>  static int smc_abi_rc;
>>  static int ffa_abi_rc;
>> +static int riscv_abi_rc;
>>  static bool intf_is_regged;
>>  
>>  static int __init optee_core_init(void)
>> @@ -245,9 +246,10 @@ static int __init optee_core_init(void)
>>  
>>  	smc_abi_rc = optee_smc_abi_register();
>>  	ffa_abi_rc = optee_ffa_abi_register();
>> +	riscv_abi_rc = optee_riscv_abi_register();
> 
> Isn't it growing rapidly now? We have two register calls for the ARM,
> one for the RISC-V. One more region specific ISA I am aware of and it
> may have op-tee support in future? It is time we fix this logic
> in the better way. 
>
> 
>>  
>> -	/* If both failed there's no point with this module */
>> -	if (smc_abi_rc && ffa_abi_rc) {
>> +	/* If all failed there's no point with this module */
>> +	if (smc_abi_rc && ffa_abi_rc && riscv_abi_rc) {
> 
> This is started looking ugly in my opinion. 
> 
>>  		if (IS_REACHABLE(CONFIG_RPMB)) {
>>  			rpmb_interface_unregister(&rpmb_class_intf);
>>  			intf_is_regged = false;
>> @@ -270,6 +272,8 @@ static void __exit optee_core_exit(void)
>>  		optee_smc_abi_unregister();
>>  	if (!ffa_abi_rc)
>>  		optee_ffa_abi_unregister();
>> +	if (!riscv_abi_rc)
>> +		optee_riscv_abi_unregister();
>>  }
>>  module_exit(optee_core_exit);
>>  
>> diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee_private.h
>> index aefe1e6f5689..8d22d65e087b 100644
>> --- a/drivers/tee/optee/optee_private.h
>> +++ b/drivers/tee/optee/optee_private.h
>> @@ -171,6 +171,31 @@ struct optee_ffa {
>>  	struct work_struct notif_work;
>>  };
>>  
>> +/**
>> + * struct optee_riscv - RPMI TEE communication struct
> 
> do we need to name it optee_riscv? we don't use optee_arm anywhere in this
> code I believe. 
> 
> More later...
> 

The naming convention, and even the file structure, will change in v2.
This RFC currently mirrors the _internal_ FF-A implementation, which is neither
required nor ideal. We are moving away from that structure.

Best Regards,
Amir


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
