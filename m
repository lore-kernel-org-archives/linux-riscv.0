Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1205107BCE6
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Mar 2026 21:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AOx6SGWtJlG1Ubl0OnzdM45LjZncLIq8ygd0Pi+QPOM=; b=Y6DOv/zvJiYtIy
	B3fGAX5kqKiZ0mYe6cYqQmJAlSRek6lPQYvaiqB76oypmJKhtsnFpP8IjXYUdpRBepvHCv5XnSKvh
	2RetPWNAIAKQRDcFaenGbLLzPO8FWz5zbaqbJvrtLnNNVtcztLSIRqLQO5K2bg1NOWq5cNLNQzA/L
	weZE0HjY7UJRN+XQp/2Wo1kRotY0BY7zKjFPr5G2gaoJAfxqnf/DKsogbvZKDLH/YUWjNnoXUr5mm
	nyxhi8BhSyHuvHN2Lk/x+OqVQmT8jBelDSHUfwNJ4neSAORndOvEXKVdbY3B1uGijDNqw1UPhjQnx
	NWtHc9xOmYORdgJV2pyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1A5T-00000001Ddq-0Puu;
	Fri, 13 Mar 2026 21:30:27 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1A5Q-00000001DdK-3ytg
	for linux-riscv@lists.infradead.org;
	Fri, 13 Mar 2026 21:30:26 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-2be1b5fe11cso4225653eec.0
        for <linux-riscv@lists.infradead.org>; Fri, 13 Mar 2026 14:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773437424; x=1774042224; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TlrfzWsjPUE6veDC3r0tKtgFvPrhedUitAlzl2kQ2Yk=;
        b=lshGkt1W44DiP/pwv+DufaFiu0nAS8+qPOyn7MsBJmcRUx3A1d2brfgevKBY1W+bjg
         8KUAnq5YqHGVMGs6Oz55dbblgNzPCJVCNWPIApzli8Y69cTwrSAnFl3t6QnGHIR8noBu
         E8Yr0QVcXUlJeyAzv+TTC+5OSR/wEG1bytXDl6f2szjF4H9yWuU0FEujVY0Es0Hszo1n
         qWYa8AX0zhSdrNdIqboFv5hRyvA+qoaDaDxX3GJOJRRYytVNz+HapmYS4jxEDLvbaKZ8
         S1LHo/6gLABTcsKNbuZU3rRJaVKqgrsaAWPmYpIlYseChGQJzUqIGLwg626VATL3OsvI
         2v8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773437424; x=1774042224;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TlrfzWsjPUE6veDC3r0tKtgFvPrhedUitAlzl2kQ2Yk=;
        b=swoYLUOjwYhS3btEaaSbB3vOb66tSyqrpnvXuJK1Xpul9ngDMz5XR14bipJ/SjIIdO
         glafSgnkD44c7SabuJWnCePTynnrse//N16pQT9RoXYW9CDihpvm0OvWG307k5x2Dztx
         7z8b0ffYGcqVv3xFnWyyDsNGUZxYYFHybYyqxLkOinKsR5s7qO28BaEZN1gEbN0txGIT
         UsdkFq4sXLy6dLqtR5Y3XTmruqGyiikdvSeSz7YbYIjEsx57RY5jhF7zm6AECc+iSYQP
         3SwtHGxVKNUIhBoQ7H9ZgadO/TZk9ZlXANavTMfAacJQxpCU7EcAnk+kRrq4vw7YQJbi
         JvOQ==
X-Gm-Message-State: AOJu0YwTEyXav6DYApvJfXDIBoWl0m6h41o761Op3rMd9XdIN1jIgKps
	a2Zwo7UW+ebH94OkWPRhPHw3aDYUJBn7TEKcBwnLFCJqRc2+oaMddOge
X-Gm-Gg: ATEYQzxFk1R7sYwDhOit2qIaAIXLPzCQse3Oqi+4SqWap6Yc5PYay9Yezko62eky1hw
	QN54uDNgZgBAc9fK2c22F+4MiGruaxmizCJUKliG2C5VZtfz//iqlZx5joHM1ZtIRC+d7PXLZ0m
	YSJSs+gpZi+VFrZJ1PSCdcG2J67flx/7dqE3k8fuUhnO+byvq5HgBvzYkFQf/DIznWzyeLj6O5s
	0bXZ7/QBcKHLZCHQ0V/+GKlQ1/wYNFrgR0jrS7iF7OHR7mGDj1FlFFo6YBLk1GV747fzUyEo5dI
	qN22IkxABu+Ww3JWx7lMsO/tHHp/gDfGLXcOemDfBFnaWwxRNparS8YfzayhUC+bSQkCEKEL6LG
	IvTAzIxPFhu0vvb/r5IqNCxKg5gTkGXHPh3w51B1PR9/N3V1JN/Z8Z7wdL1XlUKOWYujuA47Mje
	tWMV7mSpUp87Rmou/5twHInepTvpLGUUd0mKSvH5lVYr7U4zY=
X-Received: by 2002:a05:7300:b54a:b0:2bd:b325:8d91 with SMTP id 5a478bee46e88-2bea5542097mr2083037eec.29.1773437419216;
        Fri, 13 Mar 2026 14:30:19 -0700 (PDT)
Received: from [172.16.0.242] ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2beab527170sm4197910eec.21.2026.03.13.14.30.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 14:30:18 -0700 (PDT)
Message-ID: <5129988d-a75f-473f-bb9b-b8da006d52c1@gmail.com>
Date: Fri, 13 Mar 2026 14:35:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 4/6] riscv: select RISCV_ISA_XPBMTUC in STARFIVE and
 ESWIN SoC
To: Conor Dooley <conor@kernel.org>, Bo Gan <ganboing@gmail.com>
Cc: linux-riscv@lists.infradead.org, samuel.holland@sifive.com,
 david@redhat.com, palmer@dabbelt.com, pjw@kernel.org, gaohan@iscas.ac.cn,
 me@ziyao.cc, lizhi2@eswincomputing.com, hal.feng@starfivetech.com,
 marcel@ziswiler.com, kernel@esmil.dk, devicetree@vger.kernel.org
References: <20260313084407.29669-1-ganboing@gmail.com>
 <20260313084407.29669-5-ganboing@gmail.com>
 <20260313-backrest-shamrock-0c651c405686@spud>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <20260313-backrest-shamrock-0c651c405686@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_143024_992392_CC1153AB 
X-CRM114-Status: GOOD (  11.77  )
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

Hi Conor,

On 3/13/26 06:28, Conor Dooley wrote:
> On Fri, Mar 13, 2026 at 01:44:05AM -0700, Bo Gan wrote:
>> Enable the XPbmtUC feature for Starfive and ESWIN SoC
>>
>> Signed-off-by: Bo Gan <ganboing@gmail.com>
>> ---
>>   arch/riscv/Kconfig.socs | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
>> index d621b85dd63bd..0584511707c7c 100644
>> --- a/arch/riscv/Kconfig.socs
>> +++ b/arch/riscv/Kconfig.socs
>> @@ -14,6 +14,7 @@ config ARCH_ANLOGIC
>>   
>>   config ARCH_ESWIN
>>   	bool "ESWIN SoCs"
>> +	select RISCV_ISA_XPBMTUC
> 
> Nah, you can't do this. Either RISCV_ISA_XPBMTUC is user selectable or
> it is mandatory for these platforms and selected. Don't mix and match
> please.
> 

Sure.

>>   	help
>>   	  This enables support for ESWIN SoC platform hardware,
>>   	  including the ESWIN EIC7700 SoC.
>> @@ -56,6 +57,7 @@ config SOC_STARFIVE
>>   	select PINCTRL
>>   	select RESET_CONTROLLER
>>   	select ARM_AMBA
>> +	select RISCV_ISA_XPBMTUC
>>   	help
>>   	  This enables support for StarFive SoC platform hardware.
>>   
>> -- 
>> 2.34.1
>>

Bo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
