Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EF14C433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 21 May 2022 20:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=CaxXSSq6PIUFUC1AYL88AiN5aS35Fk1LpF883WjWHYg=; b=Up/P3mG+QdEIa8gJujeZXaCrT0
	dJC1fJpUfBrP0u5MJ4hAgxq9Z8fS5pQTTkvvkXyUDFJ7jJKaIrab/EJrcvLnY3uFXVY+Px3sv+Nke
	Nwt5bgK16uWsc8D2aqJG5PnaTEWImHdXGnR9Zca5W/+I4XtocJnWOqx4wAZ4JRIPTyKbil8gVNH98
	ykXbt33zSd5MEq322/WKwEZMQBUmVplz9tTe8YLxx0eo9u5T9S9nA+Drb9J0+kDFD6sPXfBwV3fM8
	Ee4SbmiZ+FIb4zU2JfUoFbHvBMwTPEjcMsqCN9R4mUc4f1G9J7izzuacD63QiFYt/CAcNhbKjL3Y1
	ziFKTohQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nsVzq-00HUVu-UA; Sat, 21 May 2022 20:46:46 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nsVzn-00HUT9-L8
 for linux-riscv@lists.infradead.org; Sat, 21 May 2022 20:46:45 +0000
Received: by mail-pl1-x629.google.com with SMTP id q4so9966867plr.11
 for <linux-riscv@lists.infradead.org>; Sat, 21 May 2022 13:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=jwrHtlvoewbRftN79d2AI6EqYNBZAOLiqwA2wLK3D6Q=;
 b=yo8vdBEEiaXPv5TVCm0uGTi08S+UDkH4S3uyX9hcU/H+SJpdwMgG9PHXxNMH935f8p
 i6WWIGk0SNGhSfs9+xDFfvLPpCyMsN7BJOMKx+NydgVIrFWYPAl/cJq8TvoHYVSyenAV
 3Sr5r9+2K9vLEva0N0rYD3b6SRPvMnmnYdvR6giHbX0V9JkXCEks1Tk992WQb3kHQuhq
 SHWeBGgkpxSuwi+4l6G2aU8i7VPrsS+kAkZerHVF2EIB3wqnUPvxvoA2Hhp4wW+C+Jhq
 WnJdklRqz1jR3uWC3DnY9EVCjhSdTtn3iMvzaTwu3cHwa7Ynpk2dzzILWv1JaPqHLeWv
 /MOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=jwrHtlvoewbRftN79d2AI6EqYNBZAOLiqwA2wLK3D6Q=;
 b=laql7+VMS5Ddbw7Q1+a+VglXd+Mbf3OsgDzWGZiOelSMdnQJOBESilC06M/fE/xKsa
 gLi9dltBDB+Y8OJkrUKV/LvFeNEoN4Vns4Ei8IrGhUMkbgB9X0MNzvpxWKQkSS/Utqdk
 dYP7uEyiPSi8ILXS9AEx2JKhva/u7qucQu6vyhdYeo/xJxGOEyhK3SnlzHR8ZhPkWCNk
 QdnVhPX3ibwZX5JUR9zCMdYHBJHuqsOFijY+sbtmJsJkOy+kxd1xZWWFW4f/fvcEPl5P
 bisNRaBa5TSg0dbvxxxalwTbqm/BNgFQvH2oa5Ey9rsxJXnOTqomJzvJrg/xy2PmanjZ
 Yxug==
X-Gm-Message-State: AOAM530192yt1cZYej7ccjytPR/Pn1PxdUjJ58CfwNU9sm9Gk5vKErHO
 3Wbjnjp8upgtCED0EQvcoKS5PA==
X-Google-Smtp-Source: ABdhPJyRUhZLqKij6roy84fqUWFg5odT9HuZcCTJ9XBMKxnsSy3XKYFHF6vGp9GIlcchCijVMYJctg==
X-Received: by 2002:a17:90b:4ac9:b0:1df:af66:1f3 with SMTP id
 mh9-20020a17090b4ac900b001dfaf6601f3mr18398951pjb.106.1653166001503; 
 Sat, 21 May 2022 13:46:41 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 t13-20020a63b24d000000b003fa321e9463sm9039pgo.58.2022.05.21.13.46.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 May 2022 13:46:41 -0700 (PDT)
Date: Sat, 21 May 2022 13:46:41 -0700 (PDT)
X-Google-Original-Date: Sat, 21 May 2022 11:33:11 PDT (-0700)
Subject: Re: [PATCH v2] RISC-V: Add CONFIG_{NON,}PORTABLE
In-Reply-To: <YlgX5Jy1pjPPI+/u@x1-carbon>
CC: Arnd Bergmann <arnd@arndb.de>, linux-riscv@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Niklas.Cassel@wdc.com
Message-ID: <mhng-0cc9ae4c-55ee-425b-9e83-41d3f3d4ad5f@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220521_134643_936804_B0285BCF 
X-CRM114-Status: GOOD (  15.62  )
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

On Thu, 14 Apr 2022 05:47:33 PDT (-0700), Niklas.Cassel@wdc.com wrote:
> On Wed, Apr 13, 2022 at 06:40:10PM -0700, Palmer Dabbelt wrote:
>> From: Palmer Dabbelt <palmer@rivosinc.com>
>> 
>> The RISC-V port has collected a handful of options that are
>> fundamentally non-portable.  To prevent users from shooting themselves
>> in the foot, hide them all behind a config entry that explicitly calls
>> out that non-portable binaries may be produced.
>> 
>> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>> 
>> ---
>> 
>> Changes since v1:
>> 
>> * Fix a bunch of spelling mistakes.
>> * Move NONPORTABLE under the "Platform type" sub-heading.
>> * Fix the rv32i dependency.
>> ---
>>  arch/riscv/Kconfig | 28 ++++++++++++++++++++++++++--
>>  1 file changed, 26 insertions(+), 2 deletions(-)
>> 
>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> index 5adcbd9b5e88..3d8eb44eb889 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -213,6 +213,21 @@ source "arch/riscv/Kconfig.erratas"
>>  
>>  menu "Platform type"
>>  
>> +config NONPORTABLE
>> +	bool "Allow configurations that result in non-portable kernels"
>> +	help
>> +	  RISC-V kernel binaries are compatible between all known systems
>> +	  whenever possible, but there are some use cases that can only be
>> +	  satisfied by configurations that result in kernel binaries that are
>> +	  not portable between systems.
>> +
>> +	  Selecting N does not guarantee kernels will be portable to all knows
>
> nit: s/knows/known ?

Thanks.  Turns out I've got a bit of an issue here and this results in the
defconfigs breaking, so I've got ahead and sent a v3 that includes the
necessary bits to make those work along with this fixed up.

> Kind regards,
> Niklas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
