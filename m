Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE9CEB64D7
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 19:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=qIgPbtF0a9bVOEQjNOvjQNUIU8EI24jYxX9T81tG9uM=; b=i5P/sMIuLot1SQk+2P77pZOK4U
	HTS+a3yEu1U/atIi35Dr4CA7StrmHN7oy5EttTIZJee9sWHer8wouAFYguTF68x/H89ymhtUuNaMF
	Efd7FkFBXfEYF9TNVs0iRAOmmx066gjCGesi4KZhYllK2b+GrXU6lZ3u18dWUS/IUYw+h9fi2i/XE
	+wUqLUbtr6yk2SYHHCfbO0e52wTVTGbgkeSXonQN9ikV2F8tNkWvGWCfFvAhCRvIhJZ3mto4+5qSQ
	H73etCqXqch/YOw/cWlv4ck8ICszobuvya863MzENwhWvHrZFFg/qIQQrKyd+9+fiFtyHnmqssyVV
	FbBi2hEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBgjQ-00C98S-2S;
	Tue, 20 Jun 2023 19:09:36 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBgjN-00C97Z-10
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jun 2023 19:09:35 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-25eb777c7f2so2143932a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 20 Jun 2023 12:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1687288170; x=1689880170;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ytH528+6WpSb0dZHhh81EzPmGbD3lujTa1m5kVVR73U=;
        b=Vg7aRJiobSB8vabvycHKxt9jE2Zod2WVtG+dK8ZV/AkXk074E7eGpkxQ8ePIp35vEh
         pDsjlWfj3tK6z0wZ1HtQ8O9vrEklZ2CoKxKPcwPuA4QWzQySfxnycGv48wnVht6n8CvJ
         Jnb8/hsYpeX2PHzTgFGK+NhgCTcZsLANNcuWlJbyPsMElPzb+C+K/8znFfqWHlQfiGaU
         W8L7VIjSSTD9MJqC4BlkBIyfwMgVdyHOjJvo+EKKJdMZA1saAfIZ/vIYB0k6WoCIXKMM
         u/LmeBaQIKzhff8qH3wnigbi9pDYb2AizucCgP+oYvfFdENBb4xiPdWRKh8DdlTNSCtd
         ROfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687288170; x=1689880170;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ytH528+6WpSb0dZHhh81EzPmGbD3lujTa1m5kVVR73U=;
        b=lsU7SAGzp/gTKxcN9jw0BtkKAmjYOClsJcQ9zcsfAtKmw32ws+bIrBLYfTVD3n/KCd
         e68KwAXzvl5p6d0ZiDauqeLRE17FJpJGmcSji/01wcpP6wHLMz1nIF2MQ9YMnV3Dk+ha
         rsxuT28OyCsLfF8Jh6kNPMciOD/vaKWtLcjdU79EXi3YWIf/yhhs6VsNOaOWINpd4M1V
         VIQ2wzppnuMSZG3lzcMeap49J5As6j3+rqpgN2oKXGuqIvBy60oo184PuR2J2wItThA7
         ruQ6Pc0moYz9Zckqrye1EVI41f2NlHSqwzrESAHwzh+VAgm7vIwKQh2A9TkihuTMp+OH
         5XaQ==
X-Gm-Message-State: AC+VfDwhk0g2k9Kk8QTEOUXXKWvxUGe5Dgw7t1v+03gSdSAWpTP8Ikeu
	b91lM68YO/glWrAHYu4xWwbC6g==
X-Google-Smtp-Source: ACHHUZ72JLPQLZAYpsNebvtJdqti/7re0M1kuGAadWiHswxLCmxzbR3HDZS0v6hY64vy34weYmzHGQ==
X-Received: by 2002:a17:90a:43e5:b0:25e:d013:c22c with SMTP id r92-20020a17090a43e500b0025ed013c22cmr5639863pjg.47.1687288169637;
        Tue, 20 Jun 2023 12:09:29 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id l2-20020a17090b078200b00259b53dccddsm1813287pjz.34.2023.06.20.12.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 12:09:28 -0700 (PDT)
Date: Tue, 20 Jun 2023 12:09:28 -0700 (PDT)
X-Google-Original-Date: Tue, 20 Jun 2023 12:08:47 PDT (-0700)
Subject: Re: [PATCH v5 1/4] RISC-V: add Zbc extension detection
In-Reply-To: <20230612-unstable-tilt-1835f84363b1@spud>
CC: heiko@sntech.de, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  herbert@gondor.apana.org.au, davem@davemloft.net, Conor Dooley <conor.dooley@microchip.com>,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
  christoph.muellner@vrull.eu, heiko.stuebner@vrull.eu
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-919a6ed5-c8b0-4311-9a8f-8c204b81a8e0@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_120933_593729_B94F8B88 
X-CRM114-Status: GOOD (  18.57  )
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

On Mon, 12 Jun 2023 14:31:14 PDT (-0700), Conor Dooley wrote:
> Hey Heiko,
>
> On Mon, Jun 12, 2023 at 11:04:39PM +0200, Heiko Stuebner wrote:
>> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
>> 
>> Add handling for Zbc extension.
>> 
>> Zbc provides instruction for carry-less multiplication.
>> 
>> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
>> ---
>>  arch/riscv/Kconfig             | 22 ++++++++++++++++++++++
>>  arch/riscv/include/asm/hwcap.h |  1 +
>>  arch/riscv/kernel/cpu.c        |  1 +
>>  arch/riscv/kernel/cpufeature.c |  1 +
>>  4 files changed, 25 insertions(+)
>
> Plumbing into the hwprobe stuff would be nice, but that's not a
> requirement for getting stuff merged :)

IIRC we talked about this on IRC, but IMO we shouldn't require something 
be user visible for it to be merged in the kernel.

>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> index a3d54cd14fca..754cd154eca5 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -523,6 +523,28 @@ config RISCV_ISA_ZBB
>>  
>>  	   If you don't know what to do here, say Y.
>>  
>> +config TOOLCHAIN_HAS_ZBC
>> +	bool
>> +	default y
>> +	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zbc)
>> +	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zbc)
>> +	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
>> +	depends on AS_IS_GNU
>> +
>> +config RISCV_ISA_ZBC
>> +	bool "Zbc extension support for bit manipulation instructions"
>> +	depends on TOOLCHAIN_HAS_ZBC
>> +	depends on !XIP_KERNEL && MMU
>> +	default y
>> +	help
>> +	   Adds support to dynamically detect the presence of the ZBC
>
> Nit: s/ZBC/Zbc/
>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>
> Cheers,
> Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
