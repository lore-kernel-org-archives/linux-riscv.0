Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5506FCA5FD2
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 20:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qJPc3HHhd7BRgApe037xr8HX26eB4n4PxnSkw7FE6Ro=; b=RM8MY8/ZoJ629j
	j9QxDV3GD3r9HZLYYyiBP2aDqCGcjrcgSA8e1FY95nTjgxSHj+/+XVWScCdgr7T4pkOV+jFHG9Zmx
	zB1qAk6rVxJesEBYpEEYYsSSG7wS5sBytlLJC4gwzwFj8vQ9v8CtkWWIOiGWbe0yfVIzVe6yU2/5N
	1ldJdnX8cQWDgi2CvDS/cLDQ6AyYP+lvYCW0s9vGnwY5NkhrekkSJLG3O4PmVj0wPPP8G1s/TxJ02
	JXtgGxN69IU2nSQs74Ooeo2gABPhRboo11PBDy9akXhKYqxiU5sNkjjmLdvlhfa5w82esJVT3PyPh
	i8ML/aLUyTzNOWRnmGag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCNNk-0000000A9me-2aBY;
	Thu, 01 Oct 2026 20:27:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCNND-0000000A9Zq-3eG1
	for linux-riscv@lists.infradead.org;
	Thu, 01 Oct 2026 20:27:46 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691FsoPI2687142
	for <linux-riscv@lists.infradead.org>; Thu, 1 Oct 2026 20:27:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GWv0CTeZ2vuMvNSD1JU+sMxbnaSK0ikbtxrvqbpR3Rs=; b=Lv/W6KlsSr9yxAAn
	dIhtQW+4fOCWHSoO4mKFjwSH183LXVWCVQYci4MBw814SIY/fUZtOlKKvwnFcaiO
	Pz16z+0GWLgaC/4miTtjHNtdxcyNBam/+JMVqXV0mxDEgEUn0SgXMKhPDl261sIp
	iWcwPxnyamU3FwREfmG/2fNLQRgHLxKSDInF+OKVA5YhDHLJW8CefDRS39b1Cc5C
	1TdxYxkerQijPeKKDpZQ+/P57cV5GlO6cq0Za6SnQTwyCybHQmPLsVcdD4RZBBe+
	ZcuGooTQcaIv3eexa9JODYKQWetQvkNqPkcVkGaWuwcrjJdZh2ylV4JPxypgEkRX
	uyUu+A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1t9a99f7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 01 Oct 2026 20:27:20 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-385d2703b64so1023944a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 01 Oct 2026 13:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790886439; x=1791491239; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GWv0CTeZ2vuMvNSD1JU+sMxbnaSK0ikbtxrvqbpR3Rs=;
        b=eKvH4tNDT0xFSvaIL6rRcE9MVA16pEaotruov8Y6HUT/H0g1dkxCEEpfqtGn/TJRGO
         S44cJ6a5uuP1uEkMQtUKv+8ZjmfMf3/oHhDPSOfqA63nuoaeGrj4Lio1c2D1uekxGMQm
         XWVKph9AesGCjg3N5MYt2BAeLRre5/HhvaLM9C9866VMTR4livKg9XMnFRZMcP12JW3z
         fg86A13CybBVa4OjGY/XM4/N1wWdAl7rYFKRttfAuZs2kHPO6NyAFbmf8FbpIROd+YhD
         ao3ZPIX3BpWM5k58daymWXtxM53h4lGMMa0sq2C+++xcni7dYY4ZKpfnDYA6uwu1K/z3
         K6DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790886439; x=1791491239;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GWv0CTeZ2vuMvNSD1JU+sMxbnaSK0ikbtxrvqbpR3Rs=;
        b=mHOFrPqAkjJdB2Q+gCpRkhMj/6BIYeWgtwYwnrbTg6KIHb578RqFNDEeLf6BAzZ9U6
         21vix/Frwts319UsuE8SYpnEVuFpdL7aJqWD96+aBsRxbYhHIVQdFooUCyFIe4txL0ZD
         zHnBWdchIuMyvCfIYyx98eo4+KU0D83XCB59ECaaV9/dl1dU3v1aBSjOnKjRnAPtj3+C
         FlHB5JMVFGphl+1UjAvdmKOpNS9MkS5KNq9VUYaCiwzK4/C1ME1QGAq+A99PTiK3X8X7
         /xDdiz2BtJaEQRmMkZWYDvw24hGbOmurJPD8z3hvRdJHFhyVmldHS2cUFCJYmTRXeKBG
         SZ/Q==
X-Forwarded-Encrypted: i=1; AKwUvByAxGvKInSUhXIbdgQcv0Hn8hBS8rgnMIZ523+AI292rsuUOHmKXDChD60mdP3vrnPjVnNAd07YmzuXbA==@lists.infradead.org
X-Gm-Message-State: AFq9FYKOimT4BrGpegGyJKqn/CFYJdxm60Uqd5k+uVazOng8O7hSJ7tp
	SrGqrNOfvCGqofJd5N+00DFJlUBJ6MWvRT7wPjH0rbOvjspQ/OSR597mychiK3WmCL6V4OBmVWl
	GFjzWGFpeasGEdh/c55bvV0Dp3WkTSVXgOKp07wSZOHGJhul2wiupXJPORW1O8e7ReVGFNg==
X-Gm-Gg: AYBFou1fGvWukSFmF1/ZD4D/KeDO7A7OP4aMnVd409O5iC4ZkDGXuUeIROVPku/wp/c
	jEieS3U5xls1YnZqvV2w1/ikerPc85Q8oCU0RAyJJSUI13GQdG8ghNgSLgpN+MPe+niX+vW+2QH
	lg8eY2ZcwlJRxLN4PL1R2BCpxVYSQp3TaO8vw0qg7p9cH/0WojiSLrGu34wmwfIk60l/5v+9t/V
	0XfNKamKYCdveJU8/WTsJ+Zzh9a/9FSdZPN6Xm0HWrqWvgHsQfCMov2ttYZE1vwvXfw5J6kUAgy
	Mu8iiLysYZPFO9/dWdSdh18DvmaTfLrpliiMeW52yhYvVTGUDQlDAh/NumMAJ3mskAA9lUUFF6W
	u5VJnA+gLYx6VmvLjOWjPLVUW2Yc+Z2BU
X-Received: by 2002:a17:90b:4ac6:b0:3a4:c673:764a with SMTP id 98e67ed59e1d1-3a6cecac6b7mr358821a91.42.1790886439215;
        Thu, 01 Oct 2026 13:27:19 -0700 (PDT)
X-Received: by 2002:a17:90b:4ac6:b0:3a4:c673:764a with SMTP id 98e67ed59e1d1-3a6cecac6b7mr358807a91.42.1790886438569;
        Thu, 01 Oct 2026 13:27:18 -0700 (PDT)
Received: from [192.168.1.86] ([206.83.119.45])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f439f9f9sm5933422a91.1.2026.10.01.13.27.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 13:27:17 -0700 (PDT)
Message-ID: <27748440-8d0c-4163-bc73-842b77791017@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 06:27:12 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] tee: optee: build the Arm-specific code only on Arm
To: marouene.boubakri@oss.nxp.com, jenswi@kernel.org
Cc: sumit.garg@kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        peter.lin@sifive.com
References: <20260924105145.532787-1-marouene.boubakri@oss.nxp.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <20260924105145.532787-1-marouene.boubakri@oss.nxp.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA4MSBTYWx0ZWRfX1C7HC2sF+1MB
 M+ZB5OruAdkyDH8/KRCEQ+JNuS7rj6+Y296/IVBuSh3Ob9gnyGhi4dHQaiUkMyODyl+IXXy6m/t
 XIGqvga4qCBrjj2ddLq0246ZDQ2Xoi8=
X-Authority-Analysis: v=2.4 cv=N++8hG9B c=1 sm=1 tr=0 ts=6abec228 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nLoy2YM07uCa/jC45NrMpw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=8AirrxEcAAAA:8 a=uypRWGK5JkTHnb3kk54A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: XhD3jGECQhzdVc5T2mriOAmlrFQGpxyu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA4MSBTYWx0ZWRfX2UaBay9+FgFn
 y7Z8RcKBX3FkUuz8CwxTThAA6VZ65gu+DT+tTFJ4IwMZQXk1yAoU8CG1Z++yiM/tAlv0FUpIHkS
 1aMU8MwniMApi/O6FM52rfGJnS2mtTsOF9ouX3HcNHDy6X3CrPIbXjD0GuLwQfhCUdK/UyDJ49G
 XHg24R2tAcSdIJHBY6e4SwQVHuqpeFyasK9T0nNrVO3a61ACy/BIq+GuaW/CsF8hsXw1kJFUC/B
 E+klfkhi37hPH7rnhtGuI2SC56V1YMVKfWegy/mecSmgb2pL+IpqZO+D4f/j5v0yp1K0OWNN95t
 CSsiytoMQBgfwSeBj4LeBgd4mWnIrL6L9Otv8f47XzTXupdAJjUpu5STxu8cn+1R3TQ3z8Tuzn7
 BVIj5ki3qQ0tTJ/lA+oUjjrdJn8bBS81+nf4eSsyGvE0EabEJgFEeuXorNoarYST/rAHMOLsXw/
 7dWjLNAcX9JHAVFToJw==
X-Proofpoint-GUID: XhD3jGECQhzdVc5T2mriOAmlrFQGpxyu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_132744_722880_4A3569A3 
X-CRM114-Status: GOOD (  42.85  )
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

Hi Marouene,

On 9/24/2026 8:51 PM, marouene.boubakri@oss.nxp.com wrote:
> From: Marouene Boubakri <marouene.boubakri@oss.nxp.com>
> 
> The OP-TEE driver reaches OP-TEE through the SMC ABI or the FF-A ABI,
> both specific to Arm, yet builds both unconditionally together with the
> SMC Calling Convention definitions they rely on: ffa_abi.c is always
> compiled and only its registration is conditioned on
> IS_REACHABLE(CONFIG_ARM_FFA_TRANSPORT), and optee_private.h includes
> <linux/arm-smccc.h> and defines the SMC and FF-A specific types for
> every file of the driver. This is fine as long as the driver depends on
> HAVE_ARM_SMCCC, but it keeps the driver from being built for an
> architecture without SMCCC, such as RISC-V.
> 
> Build smc_abi.c only when HAVE_ARM_SMCCC is set and ffa_abi.c only when
> the FF-A transport is enabled, and provide stubs for their registration
> otherwise, so that it fails with -EOPNOTSUPP as the FF-A ABI already
> does when the FF-A transport is not reachable. Keep the SMCCC header,
> the SMC invoke function type, the SMC and FF-A specific structures and
> the SMC RPC register parameters in optee_private.h under the same
> conditions, and drop the unused <linux/arm-smccc.h> include from
> notif.c.
> 
> Make OPTEE depend on ARM_FFA_TRANSPORT || !ARM_FFA_TRANSPORT, as it
> already does for RPMB, so that the driver is limited to a module when
> the FF-A transport is one, rather than built in without FF-A support.
> ffa_abi.c is thus built exactly when the FF-A transport is reachable
> from the driver, and the IS_REACHABLE() checks in
> optee_ffa_abi_register() and optee_ffa_abi_unregister() are always
> true, so drop them.
> 
> OPTEE still depends on HAVE_ARM_SMCCC, so smc_abi.c is still always
> built. The only visible change is that OPTEE=y can no longer be
> combined with ARM_FFA_TRANSPORT=m: such a configuration now resolves to
> OPTEE=m, with the FF-A ABI available.
> 
> Signed-off-by: Marouene Boubakri <marouene.boubakri@oss.nxp.com>
> ---
> Changes in v4:
> - Make OPTEE depend on ARM_FFA_TRANSPORT || !ARM_FFA_TRANSPORT so that
>   the driver is limited to =m when the FF-A transport is =m (Jens).
> - Update the commit message accordingly.
> v3: https://lore.kernel.org/all/20260922131735.524635-1-marouene.boubakri@oss.nxp.com/
> 
> Changes in v3:
> - Dropped the RPMI ABI placeholder and the RISC-V enablement patches,
>   this is now a single patch (Jens).
> - Key the FF-A parts of optee_private.h on IS_REACHABLE() instead of
>   IS_ENABLED(): with OPTEE=y and ARM_FFA_TRANSPORT=m kbuild drops
>   ffa_abi.o from the built-in optee.o while optee_ffa_abi_register()
>   was still declared, which does not link.
> - Drop the now always true IS_REACHABLE() checks in
>   optee_ffa_abi_register() and optee_ffa_abi_unregister().
> - Describe the current FF-A conditional compilation accurately in the
>   commit message.
> - Posted as a new thread with a proper subject prefix.
> v2: https://lore.kernel.org/op-tee/20260915020235.507302-2-marouene.boubakri@oss.nxp.com/
> 
> Changes in v2:
> - No code change, the testing section of the cover letter was completed.
> v1: https://lore.kernel.org/op-tee/20260914175435.118303-2-marouene.boubakri@oss.nxp.com/
>  drivers/tee/optee/Kconfig         |  1 +
>  drivers/tee/optee/Makefile        |  4 ++--
>  drivers/tee/optee/ffa_abi.c       |  8 ++-----
>  drivers/tee/optee/notif.c         |  1 -
>  drivers/tee/optee/optee_private.h | 39 ++++++++++++++++++++++++++++++-
>  5 files changed, 43 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/tee/optee/Kconfig b/drivers/tee/optee/Kconfig
> index 50d2051..891dac6 100644
> --- a/drivers/tee/optee/Kconfig
> +++ b/drivers/tee/optee/Kconfig
> @@ -5,6 +5,7 @@ config OPTEE
>  	depends on HAVE_ARM_SMCCC
>  	depends on MMU
>  	depends on RPMB || !RPMB
> +	depends on ARM_FFA_TRANSPORT || !ARM_FFA_TRANSPORT
>  	help
>  	  This implements the OP-TEE Trusted Execution Environment (TEE)
>  	  driver.
> diff --git a/drivers/tee/optee/Makefile b/drivers/tee/optee/Makefile
> index ad7049c..183cdde 100644
> --- a/drivers/tee/optee/Makefile
> +++ b/drivers/tee/optee/Makefile
> @@ -7,8 +7,8 @@ optee-objs += rpc.o
>  optee-objs += protmem.o
>  optee-objs += supp.o
>  optee-objs += device.o
> -optee-objs += smc_abi.o
> -optee-objs += ffa_abi.o
> +optee-$(CONFIG_HAVE_ARM_SMCCC) += smc_abi.o
> +optee-$(CONFIG_ARM_FFA_TRANSPORT) += ffa_abi.o
>  
>  # for tracing framework to find optee_trace.h
>  CFLAGS_smc_abi.o := -I$(src)
> diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/optee/ffa_abi.c
> index 633715b..08236d8 100644
> --- a/drivers/tee/optee/ffa_abi.c
> +++ b/drivers/tee/optee/ffa_abi.c
> @@ -1212,14 +1212,10 @@ static struct ffa_driver optee_ffa_driver = {
>  
>  int optee_ffa_abi_register(void)
>  {
> -	if (IS_REACHABLE(CONFIG_ARM_FFA_TRANSPORT))
> -		return ffa_register(&optee_ffa_driver);
> -	else
> -		return -EOPNOTSUPP;
> +	return ffa_register(&optee_ffa_driver);
>  }
>  
>  void optee_ffa_abi_unregister(void)
>  {
> -	if (IS_REACHABLE(CONFIG_ARM_FFA_TRANSPORT))
> -		ffa_unregister(&optee_ffa_driver);
> +	ffa_unregister(&optee_ffa_driver);
>  }
> diff --git a/drivers/tee/optee/notif.c b/drivers/tee/optee/notif.c
> index 6e85f2f..6801422 100644
> --- a/drivers/tee/optee/notif.c
> +++ b/drivers/tee/optee/notif.c
> @@ -5,7 +5,6 @@
>  
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>  
> -#include <linux/arm-smccc.h>
>  #include <linux/errno.h>
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
> diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee_private.h
> index aefe1e6..02d6f79 100644
> --- a/drivers/tee/optee/optee_private.h
> +++ b/drivers/tee/optee/optee_private.h
> @@ -6,7 +6,6 @@
>  #ifndef OPTEE_PRIVATE_H
>  #define OPTEE_PRIVATE_H
>  
> -#include <linux/arm-smccc.h>
>  #include <linux/notifier.h>
>  #include <linux/rhashtable.h>
>  #include <linux/rpmb.h>
> @@ -15,6 +14,10 @@
>  #include <linux/types.h>
>  #include "optee_msg.h"
>  
> +#ifdef CONFIG_HAVE_ARM_SMCCC
> +#include <linux/arm-smccc.h>
> +#endif
> +
>  #define DRIVER_NAME "optee"
>  
>  #define OPTEE_MAX_ARG_SIZE	1024
> @@ -42,10 +45,12 @@
>   */
>  #define OPTEE_DEFAULT_MAX_NOTIF_VALUE	255
>  
> +#ifdef CONFIG_HAVE_ARM_SMCCC
>  typedef void (optee_invoke_fn)(unsigned long, unsigned long, unsigned long,
>  				unsigned long, unsigned long, unsigned long,
>  				unsigned long, unsigned long,
>  				struct arm_smccc_res *);
> +#endif
>  
>  /**
>   * struct optee_call_waiter - TEE entry may need to wait for a free TEE thread
> @@ -119,6 +124,7 @@ struct optee_supp {
>  	struct completion reqs_c;
>  };
>  
> +#ifdef CONFIG_HAVE_ARM_SMCCC
>  /**
>   * struct optee_pcpu - per cpu notif private struct passed to work functions
>   * @optee:	optee device reference
> @@ -149,7 +155,9 @@ struct optee_smc {
>  	struct work_struct notif_pcpu_work;
>  	unsigned int notif_cpuhp_state;
>  };
> +#endif
>  
> +#if IS_REACHABLE(CONFIG_ARM_FFA_TRANSPORT)
>  /**
>   * struct optee_ffa -  FFA communication struct
>   * @ffa_dev:		FFA device, contains the destination id, the id of
> @@ -170,6 +178,7 @@ struct optee_ffa {
>  	struct workqueue_struct *notif_wq;
>  	struct work_struct notif_work;
>  };
> +#endif
>  
>  struct optee;
>  
> @@ -257,8 +266,12 @@ struct optee {
>  	const struct optee_ops *ops;
>  	struct tee_context *ctx;
>  	union {
> +#ifdef CONFIG_HAVE_ARM_SMCCC
>  		struct optee_smc smc;
> +#endif
> +#if IS_REACHABLE(CONFIG_ARM_FFA_TRANSPORT)
>  		struct optee_ffa ffa;
> +#endif

Does this need to be a union if we filter the members?

Best Regards,
Amir

>  	};
>  	struct optee_shm_arg_cache shm_arg_cache;
>  	struct optee_call_queue call_queue;
> @@ -290,6 +303,7 @@ struct optee_context_data {
>  	struct list_head sess_list;
>  };
>  
> +#ifdef CONFIG_HAVE_ARM_SMCCC
>  struct optee_rpc_param {
>  	u32	a0;
>  	u32	a1;
> @@ -300,6 +314,7 @@ struct optee_rpc_param {
>  	u32	a6;
>  	u32	a7;
>  };
> +#endif
>  
>  /* Holds context that is preserved during one STD call */
>  struct optee_call_ctx {
> @@ -422,9 +437,31 @@ static inline void reg_pair_from_64(u32 *reg0, u32 *reg1, u64 val)
>  }
>  
>  /* Registration of the ABIs */
> +#ifdef CONFIG_HAVE_ARM_SMCCC
>  int optee_smc_abi_register(void);
>  void optee_smc_abi_unregister(void);
> +#else
> +static inline int optee_smc_abi_register(void)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static inline void optee_smc_abi_unregister(void)
> +{
> +}
> +#endif
> +#if IS_REACHABLE(CONFIG_ARM_FFA_TRANSPORT)
>  int optee_ffa_abi_register(void);
>  void optee_ffa_abi_unregister(void);
> +#else
> +static inline int optee_ffa_abi_register(void)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static inline void optee_ffa_abi_unregister(void)
> +{
> +}
> +#endif
>  
>  #endif /*OPTEE_PRIVATE_H*/
> 
> base-commit: 827751b699b79a6e569983359c02dce67f81b94c


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
