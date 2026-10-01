Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB37DCA5FD4
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 23:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sBY2EZK263tZfdsiUL4S6WBfqlXh288UIjpkFSABWaA=; b=QoBNS4F5fe5CJm
	aZTD0gm+MC9e8Jyd9hNE+XJfZGcTcxQKxqUR7ViBT9TCo1ZuJz26nJXPh654TdKva1O3tZWbiEvKX
	AQ3YTtfrCBIn4iNhbVZ2Kfd50w2tONGii4HHhvXscyiO1CvovHCtEasswzwHY+1Z70II2Bt9DE+0Q
	VUu5CNoszxANdJdWdvZ2JvNehSvCiu22L4CXaWf/K/ViEZpCS07hDY3WSwIZsA5VryOqfQXSjHgWt
	3wQ5KsDEYu1LOsNtRKzwAkBMde390Ss7PJ6HiM4ICrUgMXQLwDHn+6LpiShHJlU4TXa/rbPnbAmGS
	stKYmQgEUVJoRQW6xhNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCQF6-0000000APQR-0J2U;
	Thu, 01 Oct 2026 23:31:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCQF3-0000000APQ6-3gAL
	for linux-riscv@lists.infradead.org;
	Thu, 01 Oct 2026 23:31:11 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691NFY9E3214554
	for <linux-riscv@lists.infradead.org>; Thu, 1 Oct 2026 23:31:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RXmAiNVkT/5aUTPM3qYEmat2B87mxcwDRDaqVNDqBwo=; b=bEw3KEpRuUesEUjX
	rTrx1i82lIr2CdzJo5Q0AKzg4/h9b6AxLEajY1KqyxBsCHmWRpTMX3vQ2R0BhP8X
	XXnBTaSZcVbIT1CoYxkydFmnvXX9bFE4Dqr9/czA7HvKZTs7PxGj7N0X4tyERiGH
	p6/GAmiaNcJqq4Xpcm/EcR3dKwjV11pXO010F/7+1Fxdn+HDMaf0TriCrelgZqSq
	a1cvxTUITlAfcdfq6q/ozB5AqV5JdMp7rhfjw4i28DDdgKTwTmCF0cqFqObLZhnW
	c3vnV8LnDZjrKuCOCKKpSFVd5WqJYNIe4tccoHSIZKqwJJ7xd8l2/Cu++8lGpN/P
	Of+UyQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1rvqaccq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 01 Oct 2026 23:31:09 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d7443e0f0bso98512225ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 01 Oct 2026 16:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790897468; x=1791502268; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RXmAiNVkT/5aUTPM3qYEmat2B87mxcwDRDaqVNDqBwo=;
        b=MnuF3gi96LyXiEibRma0BqnkXeqYcMw1cSfwcNuB5w183DoaYNmA8feQ7fjMz/4Xio
         zEl3zgAsfMNwRuPXy/bbTGFhkbW2rGwdh7E4V/7w/W1qjYbbI5bOe7mlQdhkvY46o4w/
         KqA9Ga1rc0CO6II8js9d2iwfij5OYq2LZWuI1+qH+qJl9D0ZT6Sm5FaP5yUoooZxXkN3
         BOXGBLIHmOfmI3hYTelEtH3MDrVmoeu/L2G3TQf5uDcYS23dXEWc0wEFBWqo9SpBq/3v
         i/xYQl5KKMHkJGpflEJzwJBlf4DCqVArk2U0vYZWJ0Na/E0QWrC2RiVe4QqqerFIiHNi
         vN/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790897468; x=1791502268;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RXmAiNVkT/5aUTPM3qYEmat2B87mxcwDRDaqVNDqBwo=;
        b=d3CRqweZna509j6mDfdfA/jKxy04QEAlF+aAExOqeWf4uyc0rEx8YhkU2Al+8vmvMr
         zqBf7iGRY6GA2WSyImhrDk2FXjw+xKIZb7k9USN2eZsRcrjyPRq9XnDbM2DqqKje6acU
         BSY3hmDXPVODdk2RRWUAysgqT/RI6cLC4mC4gCVTmXS3l9hMbVE/1CDNHidMPmG94fdk
         iqhcA+X8qT7dNjDIoiziIMXa6u3B6a46XnZ7r29Dm8u2BROSQB60pY0d9P/L319ch3Mj
         R+zgjiIBvdjOnCPkB6FGDhdBuIsVnBf4huTT25KchXyu8xeqfu2z/sQwiBRqOHzopeEC
         ZFpQ==
X-Forwarded-Encrypted: i=1; AKwUvBwX1uw/RJJfOhkL+XNEAlCzNsSVVco94lo2x0VZIwhR+4Ce14zziqtZme5755hLAyEVrzCyBwImMP9epg==@lists.infradead.org
X-Gm-Message-State: AFq9FYIrlR67/kX5VeDHYBJeX2lc3ajGczAlPNiuWf9iOu0PQjZaT60D
	aWSo8PwZxpEg3Ys+w9SNrbG2Z7hhXeISzHL1BuruE2DjAKVcwlP9NddIRjGus+XGGREzfnxj/n1
	OzEu1g4OKr7ubIYlhhIrj2HZHt6yUh28I8lnXH0pLgEDXfoyFjldN7ylhhIp6W81m+UERiQ==
X-Gm-Gg: AYBFou0H8NU9JP8Xmo2/MQxb0R5K5kMu52Ft2G6yRbtKtrOlhfUUqIExYiKcBzA4Yyu
	aCHQX+NYDQtATU25aXtZSosI1XVy4An/wMDJkou6T3/3ixpOyU0LS4l8cWDoULXYLzKlBctfG2J
	nWT2gTV7yksKPbu+I1R/1TZDAl7PBiZz7KncvqEqRTcRl7REz8WfhyXlnFel605PwgMnyMI+j7k
	DqS+gyS5iZKxwfqdNSeOXviSscxBwDaCnINc1baJdmLtD7aQacOpUqOqlz+6ART1BD1WCwZxi30
	xN4ISV1Y8VjZkz0ohoWT6HAx9BobzguDOqqxSScoky+ERYInS5tU64e+aiZiRyFoEHsOb3VOhdJ
	nXpcR3cexsBjH0Y4kusOdYKCmWrIpkmto
X-Received: by 2002:a17:903:1a67:b0:2dd:c100:a5de with SMTP id d9443c01a7336-2e49b67e1e9mr7921135ad.50.1790897468316;
        Thu, 01 Oct 2026 16:31:08 -0700 (PDT)
X-Received: by 2002:a17:903:1a67:b0:2dd:c100:a5de with SMTP id d9443c01a7336-2e49b67e1e9mr7920945ad.50.1790897467727;
        Thu, 01 Oct 2026 16:31:07 -0700 (PDT)
Received: from [192.168.1.86] ([206.83.119.45])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f6ab2b9sm1766635ad.36.2026.10.01.16.31.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 16:31:07 -0700 (PDT)
Message-ID: <be313b42-64ea-4c0d-b0cd-bbdba92d82f9@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 09:31:02 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] tee: optee: build the Arm-specific code only on Arm
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
To: marouene.boubakri@oss.nxp.com, jenswi@kernel.org
Cc: sumit.garg@kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        peter.lin@sifive.com
References: <20260924105145.532787-1-marouene.boubakri@oss.nxp.com>
 <27748440-8d0c-4163-bc73-842b77791017@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <27748440-8d0c-4163-bc73-842b77791017@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA5MyBTYWx0ZWRfX6BtxotZ2gNQt
 ePlELNKE0j+nucL9vy8sAgllpj35SOxv3DTuVw6njh0BvquJIf7HKV7F8xBOOu+9S5tp9+VR7Qv
 DGwPz23uQqFp8/lEmFnbgP7x2SYF1TOzuYkCfjpmPUn7e2fBbSXwztIMm4nG94UGWtp6kJWQnQj
 e1c2DZIa6WoUbs9ZgxVHfNSQyjXpp9wIW0RpzXK3mtcPCDszKvLJznThMZmUd6vRMl3WmhlW+w9
 vUx7+Js52NxS+30s6JsqiguWVFWDboUUtA878aQ71yi0TIZgfxk2Zd+C4hF6ZD/Akz88xiwFu5g
 DNzEotdEl7cuVX2VZWSDfcfdCuSSosLXLLZKa022O01Rr1by7Ax1RZz4VVpHPNBVHRSYBteXkWE
 vOvAwrwx/OkNUcuw8RC9zjWDofgB+2piYR7aFW3AD6hvKbnCYukeNwK3vTwYpcbTOuMkoCgEp9T
 0ECLlW/VhWv6jfYZzYw==
X-Authority-Analysis: v=2.4 cv=JIauIMKb c=1 sm=1 tr=0 ts=6abeed3d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nLoy2YM07uCa/jC45NrMpw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=8AirrxEcAAAA:8 a=4o7CPISBijJ24BUE3mwA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: _3C1PssqM99hwSJZxyi5a_h7CtFlZ7DK
X-Proofpoint-ORIG-GUID: _3C1PssqM99hwSJZxyi5a_h7CtFlZ7DK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA5MyBTYWx0ZWRfXwzpdGKyGlb34
 9lQP3m8NKoMLipiael16n/TRd0A0xPHfVDJy2CEwjKSqjNmgZSTM28CXY6o+B33/ftdilgFvu63
 tXPT+pO/KJY+N41uluFYwL4b1ZCKqYg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_05,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_163109_950820_4E47F383 
X-CRM114-Status: GOOD (  32.24  )
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


On 10/2/2026 6:27 AM, Amirreza Zarrabi wrote:
> Hi Marouene,
> 
> On 9/24/2026 8:51 PM, marouene.boubakri@oss.nxp.com wrote:
>> From: Marouene Boubakri <marouene.boubakri@oss.nxp.com>
>>
>> The OP-TEE driver reaches OP-TEE through the SMC ABI or the FF-A ABI,
>> both specific to Arm, yet builds both unconditionally together with the
>> SMC Calling Convention definitions they rely on: ffa_abi.c is always
>> compiled and only its registration is conditioned on
>> IS_REACHABLE(CONFIG_ARM_FFA_TRANSPORT), and optee_private.h includes
>> <linux/arm-smccc.h> and defines the SMC and FF-A specific types for
>> every file of the driver. This is fine as long as the driver depends on
>> HAVE_ARM_SMCCC, but it keeps the driver from being built for an
>> architecture without SMCCC, such as RISC-V.
>>
>> Build smc_abi.c only when HAVE_ARM_SMCCC is set and ffa_abi.c only when
>> the FF-A transport is enabled, and provide stubs for their registration
>> otherwise, so that it fails with -EOPNOTSUPP as the FF-A ABI already
>> does when the FF-A transport is not reachable. Keep the SMCCC header,
>> the SMC invoke function type, the SMC and FF-A specific structures and
>> the SMC RPC register parameters in optee_private.h under the same
>> conditions, and drop the unused <linux/arm-smccc.h> include from
>> notif.c.
>>
>> Make OPTEE depend on ARM_FFA_TRANSPORT || !ARM_FFA_TRANSPORT, as it
>> already does for RPMB, so that the driver is limited to a module when
>> the FF-A transport is one, rather than built in without FF-A support.
>> ffa_abi.c is thus built exactly when the FF-A transport is reachable
>> from the driver, and the IS_REACHABLE() checks in
>> optee_ffa_abi_register() and optee_ffa_abi_unregister() are always
>> true, so drop them.
>>
>> OPTEE still depends on HAVE_ARM_SMCCC, so smc_abi.c is still always
>> built. The only visible change is that OPTEE=y can no longer be
>> combined with ARM_FFA_TRANSPORT=m: such a configuration now resolves to
>> OPTEE=m, with the FF-A ABI available.
>>
>> Signed-off-by: Marouene Boubakri <marouene.boubakri@oss.nxp.com>
>> ---
>> Changes in v4:
>> - Make OPTEE depend on ARM_FFA_TRANSPORT || !ARM_FFA_TRANSPORT so that
>>   the driver is limited to =m when the FF-A transport is =m (Jens).
>> - Update the commit message accordingly.
>> v3: https://lore.kernel.org/all/20260922131735.524635-1-marouene.boubakri@oss.nxp.com/
>>
>> Changes in v3:
>> - Dropped the RPMI ABI placeholder and the RISC-V enablement patches,
>>   this is now a single patch (Jens).
>> - Key the FF-A parts of optee_private.h on IS_REACHABLE() instead of
>>   IS_ENABLED(): with OPTEE=y and ARM_FFA_TRANSPORT=m kbuild drops
>>   ffa_abi.o from the built-in optee.o while optee_ffa_abi_register()
>>   was still declared, which does not link.
>> - Drop the now always true IS_REACHABLE() checks in
>>   optee_ffa_abi_register() and optee_ffa_abi_unregister().
>> - Describe the current FF-A conditional compilation accurately in the
>>   commit message.
>> - Posted as a new thread with a proper subject prefix.
>> v2: https://lore.kernel.org/op-tee/20260915020235.507302-2-marouene.boubakri@oss.nxp.com/
>>
>> Changes in v2:
>> - No code change, the testing section of the cover letter was completed.
>> v1: https://lore.kernel.org/op-tee/20260914175435.118303-2-marouene.boubakri@oss.nxp.com/
>>  drivers/tee/optee/Kconfig         |  1 +
>>  drivers/tee/optee/Makefile        |  4 ++--
>>  drivers/tee/optee/ffa_abi.c       |  8 ++-----
>>  drivers/tee/optee/notif.c         |  1 -
>>  drivers/tee/optee/optee_private.h | 39 ++++++++++++++++++++++++++++++-
>>  5 files changed, 43 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/tee/optee/Kconfig b/drivers/tee/optee/Kconfig
>> index 50d2051..891dac6 100644
>> --- a/drivers/tee/optee/Kconfig
>> +++ b/drivers/tee/optee/Kconfig
>> @@ -5,6 +5,7 @@ config OPTEE
>>  	depends on HAVE_ARM_SMCCC
>>  	depends on MMU
>>  	depends on RPMB || !RPMB
>> +	depends on ARM_FFA_TRANSPORT || !ARM_FFA_TRANSPORT
>>  	help
>>  	  This implements the OP-TEE Trusted Execution Environment (TEE)
>>  	  driver.
>> diff --git a/drivers/tee/optee/Makefile b/drivers/tee/optee/Makefile
>> index ad7049c..183cdde 100644
>> --- a/drivers/tee/optee/Makefile
>> +++ b/drivers/tee/optee/Makefile
>> @@ -7,8 +7,8 @@ optee-objs += rpc.o
>>  optee-objs += protmem.o
>>  optee-objs += supp.o
>>  optee-objs += device.o
>> -optee-objs += smc_abi.o
>> -optee-objs += ffa_abi.o
>> +optee-$(CONFIG_HAVE_ARM_SMCCC) += smc_abi.o
>> +optee-$(CONFIG_ARM_FFA_TRANSPORT) += ffa_abi.o
>>  
>>  # for tracing framework to find optee_trace.h
>>  CFLAGS_smc_abi.o := -I$(src)
>> diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/optee/ffa_abi.c
>> index 633715b..08236d8 100644
>> --- a/drivers/tee/optee/ffa_abi.c
>> +++ b/drivers/tee/optee/ffa_abi.c
>> @@ -1212,14 +1212,10 @@ static struct ffa_driver optee_ffa_driver = {
>>  
>>  int optee_ffa_abi_register(void)
>>  {
>> -	if (IS_REACHABLE(CONFIG_ARM_FFA_TRANSPORT))
>> -		return ffa_register(&optee_ffa_driver);
>> -	else
>> -		return -EOPNOTSUPP;
>> +	return ffa_register(&optee_ffa_driver);
>>  }
>>  
>>  void optee_ffa_abi_unregister(void)
>>  {
>> -	if (IS_REACHABLE(CONFIG_ARM_FFA_TRANSPORT))
>> -		ffa_unregister(&optee_ffa_driver);
>> +	ffa_unregister(&optee_ffa_driver);
>>  }
>> diff --git a/drivers/tee/optee/notif.c b/drivers/tee/optee/notif.c
>> index 6e85f2f..6801422 100644
>> --- a/drivers/tee/optee/notif.c
>> +++ b/drivers/tee/optee/notif.c
>> @@ -5,7 +5,6 @@
>>  
>>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>>  
>> -#include <linux/arm-smccc.h>
>>  #include <linux/errno.h>
>>  #include <linux/slab.h>
>>  #include <linux/spinlock.h>
>> diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee_private.h
>> index aefe1e6..02d6f79 100644
>> --- a/drivers/tee/optee/optee_private.h
>> +++ b/drivers/tee/optee/optee_private.h
>> @@ -6,7 +6,6 @@
>>  #ifndef OPTEE_PRIVATE_H
>>  #define OPTEE_PRIVATE_H
>>  
>> -#include <linux/arm-smccc.h>
>>  #include <linux/notifier.h>
>>  #include <linux/rhashtable.h>
>>  #include <linux/rpmb.h>
>> @@ -15,6 +14,10 @@
>>  #include <linux/types.h>
>>  #include "optee_msg.h"
>>  
>> +#ifdef CONFIG_HAVE_ARM_SMCCC
>> +#include <linux/arm-smccc.h>
>> +#endif
>> +
>>  #define DRIVER_NAME "optee"
>>  
>>  #define OPTEE_MAX_ARG_SIZE	1024
>> @@ -42,10 +45,12 @@
>>   */
>>  #define OPTEE_DEFAULT_MAX_NOTIF_VALUE	255
>>  
>> +#ifdef CONFIG_HAVE_ARM_SMCCC
>>  typedef void (optee_invoke_fn)(unsigned long, unsigned long, unsigned long,
>>  				unsigned long, unsigned long, unsigned long,
>>  				unsigned long, unsigned long,
>>  				struct arm_smccc_res *);
>> +#endif
>>  
>>  /**
>>   * struct optee_call_waiter - TEE entry may need to wait for a free TEE thread
>> @@ -119,6 +124,7 @@ struct optee_supp {
>>  	struct completion reqs_c;
>>  };
>>  
>> +#ifdef CONFIG_HAVE_ARM_SMCCC
>>  /**
>>   * struct optee_pcpu - per cpu notif private struct passed to work functions
>>   * @optee:	optee device reference
>> @@ -149,7 +155,9 @@ struct optee_smc {
>>  	struct work_struct notif_pcpu_work;
>>  	unsigned int notif_cpuhp_state;
>>  };
>> +#endif
>>  
>> +#if IS_REACHABLE(CONFIG_ARM_FFA_TRANSPORT)
>>  /**
>>   * struct optee_ffa -  FFA communication struct
>>   * @ffa_dev:		FFA device, contains the destination id, the id of
>> @@ -170,6 +178,7 @@ struct optee_ffa {
>>  	struct workqueue_struct *notif_wq;
>>  	struct work_struct notif_work;
>>  };
>> +#endif
>>  
>>  struct optee;
>>  
>> @@ -257,8 +266,12 @@ struct optee {
>>  	const struct optee_ops *ops;
>>  	struct tee_context *ctx;
>>  	union {
>> +#ifdef CONFIG_HAVE_ARM_SMCCC
>>  		struct optee_smc smc;
>> +#endif
>> +#if IS_REACHABLE(CONFIG_ARM_FFA_TRANSPORT)
>>  		struct optee_ffa ffa;
>> +#endif
> 
> Does this need to be a union if we filter the members?
> 
> Best Regards,
> Amir
> 

Ok, got my answer. We need both support in the binary, like before.
Thanks,

- Amir

>>  	};
>>  	struct optee_shm_arg_cache shm_arg_cache;
>>  	struct optee_call_queue call_queue;
>> @@ -290,6 +303,7 @@ struct optee_context_data {
>>  	struct list_head sess_list;
>>  };
>>  
>> +#ifdef CONFIG_HAVE_ARM_SMCCC
>>  struct optee_rpc_param {
>>  	u32	a0;
>>  	u32	a1;
>> @@ -300,6 +314,7 @@ struct optee_rpc_param {
>>  	u32	a6;
>>  	u32	a7;
>>  };
>> +#endif
>>  
>>  /* Holds context that is preserved during one STD call */
>>  struct optee_call_ctx {
>> @@ -422,9 +437,31 @@ static inline void reg_pair_from_64(u32 *reg0, u32 *reg1, u64 val)
>>  }
>>  
>>  /* Registration of the ABIs */
>> +#ifdef CONFIG_HAVE_ARM_SMCCC
>>  int optee_smc_abi_register(void);
>>  void optee_smc_abi_unregister(void);
>> +#else
>> +static inline int optee_smc_abi_register(void)
>> +{
>> +	return -EOPNOTSUPP;
>> +}
>> +
>> +static inline void optee_smc_abi_unregister(void)
>> +{
>> +}
>> +#endif
>> +#if IS_REACHABLE(CONFIG_ARM_FFA_TRANSPORT)
>>  int optee_ffa_abi_register(void);
>>  void optee_ffa_abi_unregister(void);
>> +#else
>> +static inline int optee_ffa_abi_register(void)
>> +{
>> +	return -EOPNOTSUPP;
>> +}
>> +
>> +static inline void optee_ffa_abi_unregister(void)
>> +{
>> +}
>> +#endif
>>  
>>  #endif /*OPTEE_PRIVATE_H*/
>>
>> base-commit: 827751b699b79a6e569983359c02dce67f81b94c
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
