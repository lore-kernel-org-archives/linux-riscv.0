Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A23B3C88E72
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 20:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DqnoCavpkEvTwuSOIHG+KWes8tIEyTCbdyfSgcf9D4k=; b=SJJjUVrYGZEcYt
	KE5uYA1UcvlSEJ2Isv9jO+8MHmQlHD2Pr9EPKIAD/Hi5/Iay/u3q2obbEDG7yYMZ75uFvjHXKLTLT
	xQw4ssKNknFiXt6bzpwlFkY52nWAzfHwAczeIIByolB+46DwVHcdGyQ3fLZ9prnc/ZmxTeQuJhJfY
	lJMIZ7TX6d7iLyPgWyfEdLvMmXU6GslBdG7eZ6CK7eYU5Gbv8GA9EjZfiWvrcWabzlPbPg0KK/lHU
	w5KndyQa6Wt2+QoPgTirCAWMA0EwYP0jMtv6iGkXXcbIB9ZuwaoMQSp6a9K7rSAfY73+shh7/F8K0
	NFicOw292LEaj7wK5ixg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7J3q-0000000CUky-0GGj;
	Thu, 17 Sep 2026 20:50:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7J3n-0000000CUhE-36Kl
	for linux-riscv@lists.infradead.org;
	Thu, 17 Sep 2026 20:50:24 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HH5IXp1007166
	for <linux-riscv@lists.infradead.org>; Thu, 17 Sep 2026 20:50:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8YpNY/Bau2C9H4OXWV+XfoUZdnr4CV3FIhXIPLaLRpw=; b=bDMSa4iSiT8ItOZL
	qDlgE27bojSoam9G3l2wvgy1LHpWPkfn/+L27JL7XSP8tIMNBAM+VShnfQHvx7Sx
	HklycHyYEAS+3ywN8aA4DhZgIuPY9gcZiWa+ZsZWTxoYqwzkYWakBN/wBGvr3ExG
	UXvuMj/DMufQL1miacolNxE7jnHau+Fc4lsKaoVMm8hC1WEMYUL4bDNwOx/mmfIM
	WFqRC3Nxyqq5aUKNEqWDCMW9/M2bY8K7PCsh1b3z0cIefy6TcappZDautpQo2jPe
	GeupFN0+uoSdyO2Obeczcr4nrwTxCH7Z/yd85WiPhbNaIMSqp7chdUYyaDhQP7Yx
	j0JWsg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grjttse6j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 17 Sep 2026 20:50:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936aa34873bso7792485a.3
        for <linux-riscv@lists.infradead.org>; Thu, 17 Sep 2026 13:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789678222; x=1790283022; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8YpNY/Bau2C9H4OXWV+XfoUZdnr4CV3FIhXIPLaLRpw=;
        b=d9/q0GUW1/SGZgjRAaaAmysPhh5hqrDNgaCIo46/59PGgqdbYI9NDv+4cdmntB2IE/
         ChE42kRm6QEbADbJ6glyXkZ7wsQBYYs/ls40PPlWuzhmOzxbH3hnZR0XLo0tuRg9/CbO
         UJEHJB0VSf2i+rp/teYrNDo5l94uMYpP5LlIKvNxcpjx4unVoialxfP0uDjer/EU+W4C
         wh2aCvR6wazKiyc2PW7OozWJ3AzXDWbCFTwHtncr2bKaIl+a6pKdQpgrs8hO64SvDGTl
         zMl8bjQzcZORjSpOZjr7Und+6uHqagWWyBh9d45Nz/F4obqqffff86ofZFg07bjNUBcR
         zjag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789678222; x=1790283022;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8YpNY/Bau2C9H4OXWV+XfoUZdnr4CV3FIhXIPLaLRpw=;
        b=ClQfIn1QlnYrg7bnt2xGsHEtJbCIkUcj8pB2JAPufg3ZW964WEQNvd4ykSFOEN5y1t
         4a1T9P/IzXhkG7HuHUUrUmKEUZZvLvMeWac3tqWqlf0TCZe6HrR7zYdybeEf/FdrhYSi
         OySz4Eo2ltf99en/Ra9D7RNkVZDPdocQ/Wm/84Tw1Yr1GzDHaCiDahab3yV2ZOBa03Al
         AKk695WHWBW+Wupa0ZXI/9MkzaxiWnADGA2Dh7Zsx0H91GBWmq1MpOoC64jpjjizIRan
         wjXX3HVwG0RHFvZAF25DGkXR0QQPVj9mdAOXIdSLMHZUkxri8DNJ4ziZb3UV2x7Pa2O/
         7xRw==
X-Forwarded-Encrypted: i=1; AKwUvBy8gTPXgwU4PccfNo/9I6jZKeOCZYGys84toQKO/ZUz2Ek1clF9B4D5JodXMcs4djyOD9S4anNW3psYvg==@lists.infradead.org
X-Gm-Message-State: AFuF++lsp0aY2QGlISfg4ytaW19t6CxvW61Isa0rq7j71Wiiuoe0ifrO
	Z8weHVt3WdbvxJ9W4Z8cOiJgaObsw13HAmPEEM2qSaM7Sf3QzX2KcBFXztq2J9Z44dyGExmEDLa
	S3bqIUVwIKk7zZEkXLq+YBg1CGjQjvUTjppY8VForzHUqaDCS0rGyAKRGOtzXADlnBpYYam4=
X-Gm-Gg: AYBFou1pgDBLMhLG7warslOB1Smu3w2hrrVpdKe9MqiXNir5v/YDeu6SPHpOJ7MS/qK
	QJkhetpSSUBnHkQxl7VND7nz+Qw25iBc4HJyTcZ8L/mVZiOCe3HL7pGvibGJJorDVBfnTK9l5Ra
	WN0FX1BpnDeWjEnKorHlQ1nkbN/IIb9urgpQcOn0AqZz/ppwtpAyhPWF9npKB5OXXhrm9bUoT+v
	1I1Ujx8+HiseKoFCTeuBhDvPA0Xtn8jCv1pUT+0N2ZpzvmJB/BDvr0i1CuW2oOLMmwJvKgBd0rE
	Q4yBSq3VZLlft4U1Mxy7Y2gE9bWav1dK8yFiSq9T+iDUSHQWvEunNJJfR0+PD4blt5EDI+qj+m1
	4PjhwnbcAotRIBta0wi4kXKF7eea8NsAFW6aEHTjX99YbE0Oq30GfJA==
X-Received: by 2002:a05:6a20:4306:b0:3d3:adbf:777d with SMTP id adf61e73a8af0-3dd8c4cc8b8mr304652637.25.1789677513390;
        Thu, 17 Sep 2026 13:38:33 -0700 (PDT)
X-Received: by 2002:a05:6a20:4306:b0:3d3:adbf:777d with SMTP id adf61e73a8af0-3dd8c4cc8b8mr304613637.25.1789677512941;
        Thu, 17 Sep 2026 13:38:32 -0700 (PDT)
Received: from [10.73.236.146] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c00ede586sm14590388eec.10.2026.09.17.13.38.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 13:38:32 -0700 (PDT)
Message-ID: <71568eb6-8123-4ed3-a2d3-4e33e4880bf4@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 13:38:31 -0700
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
 <a9d9aac7-cb2d-46fe-a220-40f61f615b89@oss.qualcomm.com>
 <786a1460-c660-4de7-bb07-debdbd6a4661@oss.qualcomm.com>
Content-Language: en-US
From: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
In-Reply-To: <786a1460-c660-4de7-bb07-debdbd6a4661@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDI5OSBTYWx0ZWRfX9F+Jo8nbze6B
 U+LeYV8rAI+wjPLlp7s6NOTARbZAIyi5Dx7bpIZlYyNCu9m4HwPEhupIiFtWvSJS1mIxilAIUaI
 LKkFDwic9g0GXZflfqHrQANuRp9V2iKcWzyvo8hqZHVcwFGrDJaB9U+pGk3EXqaADHge9+nfW5f
 iQube80s2UnmGPnpmj5miRGNmxDG7VDQjZv0amLnN3EdURYgDYSjJqJ5MQBVjsLUHBNI10VocSH
 GpCSmjpkDB5uK3e6fYbQ2ltg/F8Wl6vMqpxmPUoA7upJFDYltg9og0eG5CAmUKbw6BPfi5nkJOD
 HAVslxz6NGqf2lS5PocYpeFsX3bgnyRnqXdSxravy1lNx2D4qbCQ1x3kpObXgI1NiWENLpHOuzc
 zpzNizX6+hN52Z7MTVks9T/osF28twnNRa6xCG4qG7U5vhgAeddOIrzDfDWtVJJHYQPf5Xg86aX
 sD3CfF/neRJQzFLFoew==
X-Proofpoint-ORIG-GUID: cW8AoVTEzSVl7lOrcYECVlu49Px3dZyS
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDI5OSBTYWx0ZWRfX5Hg5UkQVs62w
 sx2KLqcZWbOLyxZUspRHTCS+zdH/O8lOSw4fmGJnpPCpm6GamGYacbhHvQZgcHtP8VLBs3bFPhh
 9QzveIeyz+cZ7aj8l/m7sBvmy0WH/ik=
X-Authority-Analysis: v=2.4 cv=IP2XmQvG c=1 sm=1 tr=0 ts=6aac528e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=5Hg3Q6Ij0jR0fJQLcq8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: cW8AoVTEzSVl7lOrcYECVlu49Px3dZyS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170299
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_135023_825418_402C0078 
X-CRM114-Status: GOOD (  25.16  )
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

On 9/16/2026 2:23 PM, Amirreza Zarrabi wrote:
> Hi Trilok,
> 
> On 9/16/2026 3:30 PM, Trilok Soni wrote:
>> On 9/12/2026 3:15 AM, Amirreza Zarrabi wrote:
>>> Add an OP-TEE transport for RISC-V using the RPMI TEE service group over
>>> the SBI MPXY mailbox framework.
>>>
>>> Request one mailbox channel per hart and use the channel corresponding to
>>> the current CPU when issuing a TEE request. Probe the RPMI TEE service
>>> group and required memory-sharing capabilities before registering the
>>> transport.
>>>
>>> This provides the basic transport and discovery support needed by the
>>> following patches.
>>>
>>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>>> ---
>>>  drivers/tee/optee/Makefile                 |   1 +
>>>  drivers/tee/optee/core.c                   |   8 +-
>>>  drivers/tee/optee/optee_private.h          |  34 ++++
>>>  drivers/tee/optee/optee_riscv.c            | 312 +++++++++++++++++++++++++++++
>>>  drivers/tee/optee/optee_riscv.h            | 141 +++++++++++++
>>>  include/linux/mailbox/riscv-rpmi-message.h |   1 +
>>>  6 files changed, 495 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/tee/optee/Makefile b/drivers/tee/optee/Makefile
>>> index ad7049c1c107..925b8ec7ef68 100644
>>> --- a/drivers/tee/optee/Makefile
>>> +++ b/drivers/tee/optee/Makefile
>>> @@ -9,6 +9,7 @@ optee-objs += supp.o
>>>  optee-objs += device.o
>>>  optee-objs += smc_abi.o
>>>  optee-objs += ffa_abi.o
>>> +optee-$(CONFIG_RISCV_SBI_MPXY_MBOX) += optee_riscv.o
>>>  
>>>  # for tracing framework to find optee_trace.h
>>>  CFLAGS_smc_abi.o := -I$(src)
>>> diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/core.c
>>> index a52c1f498b99..63f1725e646e 100644
>>> --- a/drivers/tee/optee/core.c
>>> +++ b/drivers/tee/optee/core.c
>>> @@ -220,6 +220,7 @@ void optee_remove_common(struct optee *optee)
>>>  
>>>  static int smc_abi_rc;
>>>  static int ffa_abi_rc;
>>> +static int riscv_abi_rc;
>>>  static bool intf_is_regged;
>>>  
>>>  static int __init optee_core_init(void)
>>> @@ -245,9 +246,10 @@ static int __init optee_core_init(void)
>>>  
>>>  	smc_abi_rc = optee_smc_abi_register();
>>>  	ffa_abi_rc = optee_ffa_abi_register();
>>> +	riscv_abi_rc = optee_riscv_abi_register();
>>
>> Isn't it growing rapidly now? We have two register calls for the ARM,
>> one for the RISC-V. One more region specific ISA I am aware of and it
>> may have op-tee support in future? It is time we fix this logic
>> in the better way. 
>>
>>
>>>  
>>> -	/* If both failed there's no point with this module */
>>> -	if (smc_abi_rc && ffa_abi_rc) {
>>> +	/* If all failed there's no point with this module */
>>> +	if (smc_abi_rc && ffa_abi_rc && riscv_abi_rc) {
>>
>> This is started looking ugly in my opinion. 
>>
>>>  		if (IS_REACHABLE(CONFIG_RPMB)) {
>>>  			rpmb_interface_unregister(&rpmb_class_intf);
>>>  			intf_is_regged = false;
>>> @@ -270,6 +272,8 @@ static void __exit optee_core_exit(void)
>>>  		optee_smc_abi_unregister();
>>>  	if (!ffa_abi_rc)
>>>  		optee_ffa_abi_unregister();
>>> +	if (!riscv_abi_rc)
>>> +		optee_riscv_abi_unregister();
>>>  }
>>>  module_exit(optee_core_exit);
>>>  
>>> diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee_private.h
>>> index aefe1e6f5689..8d22d65e087b 100644
>>> --- a/drivers/tee/optee/optee_private.h
>>> +++ b/drivers/tee/optee/optee_private.h
>>> @@ -171,6 +171,31 @@ struct optee_ffa {
>>>  	struct work_struct notif_work;
>>>  };
>>>  
>>> +/**
>>> + * struct optee_riscv - RPMI TEE communication struct
>>
>> do we need to name it optee_riscv? we don't use optee_arm anywhere in this
>> code I believe. 
>>
>> More later...
>>
> 
> The naming convention, and even the file structure, will change in v2.
> This RFC currently mirrors the _internal_ FF-A implementation, which is neither
> required nor ideal. We are moving away from that structure.

Thanks. 

I also don't like the growing registration calls and complicated "&&" checks
above. 

---Trilok Soni


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
