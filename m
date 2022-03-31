Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D42C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Mar 2022 00:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yTILwla9jSfy8Tqmb1E1mqSZC+t2P5LqXWjwptevjQ0=; b=xgB8y/mOSGm5Gc
	KSMQ4tAXLapmjxg1ZjvoTn+ZCTQuBr99AjoiZYNftn+Wbx6Zdfj+xBhdMH0niqOJrmHfvmBX796OS
	KeV5PZpsLSCJOl7T1FFDR11xs9fLHdxAwpb73kiBgplG4IKGu/6atLtpiOB8nzHbL/bkqGvk7aHyA
	b9zMZcag3SgZFh7YeJXtgQE7x4zPeqzkRKw0yEgcZdGJlQ6rk/JcWDd0/RoeKgsSTFxht/U6E41sL
	aY2o7x0LcSVWhzP1qOJ9t9029GcuxbdIefb9HDwNChkvsQPGpavnfgyFIyOI7LryBKgd8P8+xKvPQ
	AhDzoMP4eX13IuKn3XrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZieN-000CW3-PP; Thu, 31 Mar 2022 00:26:55 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZieL-000CVH-6z
 for linux-riscv@lists.infradead.org; Thu, 31 Mar 2022 00:26:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1648686412; x=1680222412;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=MAEmACm8JL0agnrolT58m2LejPScBLQM6qttzu2LRgs=;
 b=omitOGv6I4iGrLMzat13EgiL13UAeUi3DhzfcdigS0HVCVJ2jdZp2Sui
 zlpyyAngyPSka5dXXnkVdhRvGdj0Tr85aL5OrWJGRsou4P5pZ0whGOhNz
 V93Lg95oR2EiyuyEQk7PzF+uZ3q/pRy8UdJQifFeIJabWoKF7feay90EO
 MoxYXcM2/UDQ1FEIQSqorZ+q0tIlHQsWSwo45d/hc2b1GPNONcuhERqVJ
 BZNAo9tsz1QpXEipJUBmR9Ba3L7PfxPiUKF6XxXjckCpyBaWS4f5Q2BZP
 QzoJzqOKdDmFjR4RjNn9NSycDR+j4qIr4sk8J3rHbU1WM+kc9G7bMW6Iz A==;
X-IronPort-AV: E=Sophos;i="5.90,223,1643644800"; d="scan'208";a="195566409"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 31 Mar 2022 08:26:50 +0800
IronPort-SDR: IOCOTmX19EPCM595VBhieuOnyQnhNB3uztTZZGJyJEqchMNk/4PdnDsRy0bk/doUmFb2F1tRAT
 0LnlZgJHCMBoIcBkmWluVwDa0Y+heaOVURkORTX01tM9S77oGjsEEM8f9KeJnSwHm/9DrdQmCH
 jNgISWAvZVJCl21lIuyk2y7AiYxc+SY2EmMl6cIcxEYSONp0j65XtlPTuTqQlKP9Agk2A433x1
 S3aO71JdyeBg/N32KvBytLIIKsauxJYOZwNRkFMT4DKGWu98cFM6XMkhS+aT7LXTuLzOetFGfj
 8Ssgl4MXCBOEuApmSNTj1dPk
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Mar 2022 16:58:31 -0700
IronPort-SDR: 8ZQpgXKZahpHNFgyqBMVxGe82J4vm4wy2U0CzTp8FLLrIJlbK183rm/ndFGTOPyhaxIWIwijme
 QSb4JT8gdAiMOMQ7RuGfJgBRzL04n36fRYiuHKMpYCwb2C4xsgqKqmXdsD45YHsC9CVyEEGEyr
 k4xuAbGizVOkc0MufLVdFovxaTZKMwuEJ4AK4WlgMqt90DhfA1cpfGYcNdxA32qhB5/coJoKra
 6XEewjESUPLeI5BGu3Y1PKaEVB6ignRuSXOE2pn520f94HBRD2Y+ByJAaTEjLRbh/6PaDF3mdi
 WNk=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Mar 2022 17:26:50 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KTPHs75Qyz1SVp6
 for <linux-riscv@lists.infradead.org>; Wed, 30 Mar 2022 17:26:49 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1648686409; x=1651278410; bh=MAEmACm8JL0agnrolT58m2LejPScBLQM6qt
 tzu2LRgs=; b=qxj2JM1oqz6ef2yg3vL9qh1vgfRq6qU0Di8N8SBh1TcBte6a++U
 ZpHWB4ue5q9sorZiD0QV/xA0QJhQFI1PBrGLF6w9gvBARO3ZTfDktkrA2KlEMc36
 8lFNT17fn5TbSOEiIo6DFExIUQ+SXrOnEMTkCdxTgBT1rWvgB0CU3/VtuwtHyLEp
 WZ3sFad7gbszGMoySo5S9xqlscKX9u0AWrbY2CKfuNWmYROhVRITYiNvNAFnGJEB
 +a6vwYKZmmU48PBIFYYc+9rDUqaoLSsV8HkXl04m70aaC+G8r84sj5Be43AVn8vP
 tFgpawLFR/EIlSx0sGB3VpfBDCJkQDG/6SQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id i5jTlzukCMws for <linux-riscv@lists.infradead.org>;
 Wed, 30 Mar 2022 17:26:49 -0700 (PDT)
Received: from [10.225.163.121] (unknown [10.225.163.121])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KTPHp5RGLz1Rvlx;
 Wed, 30 Mar 2022 17:26:46 -0700 (PDT)
Message-ID: <d8a35bea-f4a0-b54d-9d2a-d1cc9b3d3e53@opensource.wdc.com>
Date: Thu, 31 Mar 2022 09:26:45 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/3] RISC-V: K210 defconfigs: Drop redundant MEMBARRIER=n
Content-Language: en-US
To: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org,
 Niklas Cassel <Niklas.Cassel@wdc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu,
 anup@brainfault.org, heinrich.schuchardt@canonical.com,
 atishp@atishpatra.org, mchitale@ventanamicro.com,
 alexandre.ghiti@canonical.com, axboe@kernel.dk, linux-kernel@vger.kernel.org
References: <20220330234739.1956-1-palmer@rivosinc.com>
 <20220330234739.1956-2-palmer@rivosinc.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220330234739.1956-2-palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_172653_429713_1FAF6A01 
X-CRM114-Status: GOOD (  23.88  )
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

On 3/31/22 08:47, Palmer Dabbelt wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
> 
> As of 93917ad50972 ("RISC-V: Add support for restartable sequence") we
> have support for restartable sequences, which default to enabled.  These
> select MEMBARRIER, so disabling it is now redundant.
> 
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> 
> ---
> 
> I'm not actually sure this is the right way to go: presumably the K210
> defconfigs had MEMBARRIER=n for a reason (maybe just size?), so we might
> actually want to move to RSEQ=n instead?  As usual: I don't test on the
> K210, so I'm not exactly sure what the constraints are.

Not sure either. It is like this now because I think this was the default
at the time the config was created.

Niklas,

Can you test this please ?

> ---
>  arch/riscv/configs/nommu_k210_defconfig        | 1 -
>  arch/riscv/configs/nommu_k210_sdcard_defconfig | 1 -
>  arch/riscv/configs/nommu_virt_defconfig        | 1 -
>  3 files changed, 3 deletions(-)
> 
> diff --git a/arch/riscv/configs/nommu_k210_defconfig b/arch/riscv/configs/nommu_k210_defconfig
> index 3f42ed87dde8..2438fa39f8ae 100644
> --- a/arch/riscv/configs/nommu_k210_defconfig
> +++ b/arch/riscv/configs/nommu_k210_defconfig
> @@ -21,7 +21,6 @@ CONFIG_CC_OPTIMIZE_FOR_SIZE=y
>  # CONFIG_AIO is not set
>  # CONFIG_IO_URING is not set
>  # CONFIG_ADVISE_SYSCALLS is not set
> -# CONFIG_MEMBARRIER is not set
>  # CONFIG_KALLSYMS is not set
>  CONFIG_EMBEDDED=y
>  # CONFIG_VM_EVENT_COUNTERS is not set
> diff --git a/arch/riscv/configs/nommu_k210_sdcard_defconfig b/arch/riscv/configs/nommu_k210_sdcard_defconfig
> index af64b95e88cc..9a133e63ae5b 100644
> --- a/arch/riscv/configs/nommu_k210_sdcard_defconfig
> +++ b/arch/riscv/configs/nommu_k210_sdcard_defconfig
> @@ -13,7 +13,6 @@ CONFIG_CC_OPTIMIZE_FOR_SIZE=y
>  # CONFIG_AIO is not set
>  # CONFIG_IO_URING is not set
>  # CONFIG_ADVISE_SYSCALLS is not set
> -# CONFIG_MEMBARRIER is not set
>  # CONFIG_KALLSYMS is not set
>  CONFIG_EMBEDDED=y
>  # CONFIG_VM_EVENT_COUNTERS is not set
> diff --git a/arch/riscv/configs/nommu_virt_defconfig b/arch/riscv/configs/nommu_virt_defconfig
> index e1c9864b6237..5269fbb6b4fc 100644
> --- a/arch/riscv/configs/nommu_virt_defconfig
> +++ b/arch/riscv/configs/nommu_virt_defconfig
> @@ -19,7 +19,6 @@ CONFIG_EXPERT=y
>  # CONFIG_AIO is not set
>  # CONFIG_IO_URING is not set
>  # CONFIG_ADVISE_SYSCALLS is not set
> -# CONFIG_MEMBARRIER is not set
>  # CONFIG_KALLSYMS is not set
>  # CONFIG_VM_EVENT_COUNTERS is not set
>  # CONFIG_COMPAT_BRK is not set


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
