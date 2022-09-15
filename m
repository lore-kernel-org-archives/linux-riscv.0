Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 876A4ECAAA1
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Sep 2022 18:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=SCgO4HhdbWgYtTLqbJwPISFNePyw6JOIJvVaWqfeVGE=; b=re03+d46+zCPhNgsQ+jWtykiY7
	OG9nuPOfOZ9KJfSzVIW1Tq6fkJ75V241YOzulOFzc3kACdAFEDWx1C7yUoYSOL1I57Vcp4lNHrrMe
	LULTsPt5ZzH6M8SIun0j0xuf8v+82Hqt8DmOAGeltMReAJ272030CPbh4G+zfG+otvS/7xsQXQ3Y+
	K7m2f5p2C6rb769Ty03TyHHlzm+4R7j+PPLQa/FgIXF/4i+DuslfG0JVp9iudgJHhq0msGJ22xp+W
	e2JNv0LqEPMMOCb4fPWew1q8heOBJbVbrszfVJuQQBLoJ3z15pLtHxmTCs69uubInPv30dQFnvm5S
	IBrT/3Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYtuO-00FhkJ-M3; Thu, 15 Sep 2022 18:48:20 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYtuM-00FhiW-Nq
	for linux-riscv@lists.infradead.org; Thu, 15 Sep 2022 18:48:19 +0000
Received: by mail-pg1-x529.google.com with SMTP id g4so18168676pgc.0
        for <linux-riscv@lists.infradead.org>; Thu, 15 Sep 2022 11:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date;
        bh=h5DTL7oH+KVv8W9OANhLDq/eEU8+rMvltJTQ0sX4/88=;
        b=ptRUiqRv6pME8tf8IehTSm6eyeTK1pWfLivueDJzy2ZeV+SnLfNPhxce8bDYX4xmaB
         RfaYVaZ5IgMFohUnhXsaIvCWtbvRR4+kuzBYNMTYVNpgYPkww76pl1YGga1oQ7De+NoT
         nEeE9KtCvlmNmdkC1eu3JKJwqZ1zPDKQQwrnNLzoYOkhKSf8UB748dTR0Yk1A3PNekn1
         jxwF+GA+MzgrqE2qctcRstNJqLmVFBS7nHnnnVGmMedpw+sNyezu4sb8VBa0vP3C5eHo
         V7wgjBh9E3X/iH2JwiLDgEAAhVHPgGkEWnmTiAsSxuEqpJ4mu/hTpBOE18BHfpJWpcan
         ChKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date;
        bh=h5DTL7oH+KVv8W9OANhLDq/eEU8+rMvltJTQ0sX4/88=;
        b=PXhjc13ba5kFI4r0WrVBMgKd7qAEFgRBqY9a9dOXxLd74SDlwph7qXf0T8pw7TLvmZ
         nKruv6dT7enVqsSjepFUgnc1txlJB/jQUwzZPitreqb4BipRN9hc01M/ECoT6PJ6FRDf
         WupCt/3sUubqoQQq5tQuOlfaU/vmav8av6GJNpySQmKWkhdtmTH19hhFa2HYNe3pnpLY
         Xn0Q1D8LmgQOWI9QehnaT+4rm09DJAH7mqll2GZee/VFF0RBG0uCZ0Ej8VkOQ8cB+pBi
         3T3181TyLNICXC8Sa7gaR9fcT6LV9I4FaR2kAHEtrbscDJjdIur3Hw1aq+YPvedu/TvX
         r+PA==
X-Gm-Message-State: ACrzQf3Wrk6VuduBFJjIxkB+W44gzBIgHGZEaNwWb/1mA/oxQaLj6qwV
	qGL5IV0griALyaBqmqFNug0f2g==
X-Google-Smtp-Source: AMsMyM5UV3TrmubAJVX1TGGUkZKk1VLk+6jJeU7s7s0T92cTpmf7yEMkLPuVeAcbI5b3SclEX1amdQ==
X-Received: by 2002:a05:6a00:b42:b0:544:a61b:75e3 with SMTP id p2-20020a056a000b4200b00544a61b75e3mr1212077pfo.26.1663267696990;
        Thu, 15 Sep 2022 11:48:16 -0700 (PDT)
Received: from localhost ([172.58.176.196])
        by smtp.gmail.com with ESMTPSA id e12-20020a170902b78c00b0017870f471f6sm1914488pls.226.2022.09.15.11.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 11:48:16 -0700 (PDT)
Date: Thu, 15 Sep 2022 11:48:16 -0700 (PDT)
X-Google-Original-Date: Thu, 15 Sep 2022 11:14:57 PDT (-0700)
Subject: Re: [PATCH] riscv: fix RISCV_ISA_SVPBMT kconfig dependency warning
In-Reply-To: <3122575.5fSG56mABF@phil>
CC: linux-kernel@vger.kernel.org, rdunlap@infradead.org, rdunlap@infradead.org,
  wefu@redhat.com, liush@allwinnertech.com, guoren@kernel.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: heiko@sntech.de
Message-ID: <mhng-92e4749c-ea48-4fb3-961d-581e948e1bf9@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_114818_802990_26F30D0B 
X-CRM114-Status: GOOD (  15.73  )
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

On Tue, 13 Sep 2022 05:00:08 PDT (-0700), heiko@sntech.de wrote:
> Hi Palmer,
>
> Am Samstag, 9. Juli 2022, 03:49:29 CEST schrieb Randy Dunlap:
>> RISCV_ISA_SVPBMT selects RISCV_ALTERNATIVE which depends on !XIP_KERNEL.
>> Therefore RISCV_ISA_SVPBMT should also depend on !XIP_KERNEL so
>> quieten this kconfig warning:
>>
>> WARNING: unmet direct dependencies detected for RISCV_ALTERNATIVE
>>   Depends on [n]: !XIP_KERNEL [=y]
>>   Selected by [y]:
>>   - RISCV_ISA_SVPBMT [=y] && 64BIT [=y] && MMU [=y]
>>
>> Fixes: ff689fd21cb1 ("riscv: add RISC-V Svpbmt extension support")
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>
> I think this should also be applied as fix?
>
> Thanks
> Heiko
>
>
>> Cc: Wei Fu <wefu@redhat.com>
>> Cc: Liu Shaohua <liush@allwinnertech.com>
>> Cc: Guo Ren <guoren@kernel.org>
>> Cc: Heiko Stuebner <heiko@sntech.de>
>> Cc: Paul Walmsley <paul.walmsley@sifive.com>
>> Cc: Palmer Dabbelt <palmer@dabbelt.com>
>> Cc: Albert Ou <aou@eecs.berkeley.edu>
>> Cc: linux-riscv@lists.infradead.org
>> ---
>>  arch/riscv/Kconfig |    1 +
>>  1 file changed, 1 insertion(+)
>>
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -362,6 +362,7 @@ config RISCV_ISA_C
>>  config RISCV_ISA_SVPBMT
>>  	bool "SVPBMT extension support"
>>  	depends on 64BIT && MMU
>> +	depends on !XIP_KERNEL
>>  	select RISCV_ALTERNATIVE
>>  	default y
>>  	help
>>

Thanks, this is on fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
