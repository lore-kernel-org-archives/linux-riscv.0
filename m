Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12D87CCA47B
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jul 2022 07:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7EMgV4KipsREHexlsLzbmALV3QErWrbRu4fJ4cy050M=; b=iw3yrZWIl0CXZP
	s9cZ4jbEsK8MSwyJwbRMnRyPon9M9rhGRt1RKMV62NM9CT74Z6TPqsFU2OgLOFjfnHikfR2t26u2M
	DMuAWGBU+AXow1hfOCocwTaeC85IK1IFc+jLbQayCHRvbpXPofIG6NkgWn4ewfbJyKxK/9Qekn9Qj
	iDqsCIyfiStCAsNIPxSTUz7N7esNgUOMYxsunonVDuERe6Vc49a552t+iuJTr0mo5Gu/f/SqsJwO3
	Howx8qopiPN18Cuhz2Ua9CW36hihKpVSQigVDT2xYirfr8IWcfucfylirV7+PZ0PIqFnRiNpLfwvz
	LG2zNjkv97eZb7Ns/z4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBtI6-00BqJ8-DO; Thu, 14 Jul 2022 07:29:42 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBtI0-00BqCI-OJ
	for linux-riscv@lists.infradead.org; Thu, 14 Jul 2022 07:29:38 +0000
Received: by mail-wr1-x431.google.com with SMTP id r2so329310wrs.3
        for <linux-riscv@lists.infradead.org>; Thu, 14 Jul 2022 00:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=LCn+jms5JkY0G8CnCXAGF7BMpKxIl3NF3yeP0gufuOs=;
        b=Bxi8OJBllRQnNitC18OML2cjQoA55QsscoukDgYK2sDduwX2fLKUkGbGwe6vU3DHoI
         NZTJ6/Fc+dIZgcWaaUtCFXfOF0sqALYrzlMpuLKIoxVarFATFoNdikUC4D8KMm9u9XAS
         gBu0JIPPvfViytxTa1Yy7ydsuRUan94nfnLFnHiMV8vQLuixIrLwW+2zgAlDgDRCDMJQ
         8VfZyaOVSstEbT0j9THl+HI3pEWdA3AV+XMo9P3Nde0byHsrqF4Feds2q+oPjcr5HRGx
         5Gkoacj+94ozXkA/Sp/oBd6tYbgyvpg5pQ+m0Ofa7JxXVk+cS/7bGOs+WzadohHEFtkW
         4Rgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=LCn+jms5JkY0G8CnCXAGF7BMpKxIl3NF3yeP0gufuOs=;
        b=1ekXuvRrFdJZcYNBo/rXMcyxQkwSEpu/r+kAUytBTl6xiOZvMy3uRApii/GLvizYG3
         /6bidVRF6EeJ5DnYB16p6rF0hUC00jrRIUBT3tux/cjxkIGMNmebnW8hfZj0F4Ogui7m
         Lydu0ZZgkQjkAQXQ7LAuhgM6Exe13ZeNFSQVjmdzR12hDn1llhx3ESrCODInIrNmaxIN
         twvgZDEU5fqaNhJXX0g1mVzEk0W/yjf4Avtg3AZpvRvMH0FDDWO8mH5rffhEyIMhdDcm
         2mTKphTHOBJgjTet4QoyA5uSKt2BZIEJmwz7t4+wOV6Ilwaku+ttCUADKB+UwQD9LACc
         lT6w==
X-Gm-Message-State: AJIora9+5agtyMx7s11A/EXL/uhqwdY255x867B6bqQW8WQdi0ZYh+cW
	gClygLnKyRBRvxw1AOuwfILao3977IvrlThC
X-Google-Smtp-Source: AGRyM1sqVWJWDxO8BKRI2e5MZHhBa0c2AFlvI2HUbQubBlb6D9uNjIaB7z4jFO5pAGZ/KGlXwKr1UA==
X-Received: by 2002:adf:e30d:0:b0:21d:aee5:8ba3 with SMTP id b13-20020adfe30d000000b0021daee58ba3mr6831607wrj.541.1657783771615;
        Thu, 14 Jul 2022 00:29:31 -0700 (PDT)
Received: from [10.35.4.171] ([167.98.27.226])
        by smtp.gmail.com with ESMTPSA id h14-20020a1ccc0e000000b003a2e7c13a3asm897964wmb.42.2022.07.14.00.29.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jul 2022 00:29:31 -0700 (PDT)
Message-ID: <b97e3fd0-87dd-0ad1-2a4b-e1050c063e07@sifive.com>
Date: Thu, 14 Jul 2022 08:29:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] RISC-V: cpu_ops_spinwait.c should include head.h
Content-Language: en-GB
To: Conor.Dooley@microchip.com, linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 sudip.mukherjee@sifive.com, jude.onyenegecha@sifive.com
References: <20220713215306.94675-1-ben.dooks@sifive.com>
 <97c2c085-a869-74d1-4acb-ceb1cc3b09b4@microchip.com>
From: Ben Dooks <ben.dooks@sifive.com>
In-Reply-To: <97c2c085-a869-74d1-4acb-ceb1cc3b09b4@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_002936_849045_D7F5F135 
X-CRM114-Status: GOOD (  10.06  )
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

On 14/07/2022 07:33, Conor.Dooley@microchip.com wrote:
> On 13/07/2022 22:53, Ben Dooks wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> Running sparse shows cpu_ops_spinwait.c is missing two definitions
>> found in head.h, so include it to stop the following warnings:
>>
>> arch/riscv/kernel/cpu_ops_spinwait.c:15:6: warning: symbol '__cpu_spinwait_stack_pointer' was not declared. Should it be static?
>> arch/riscv/kernel/cpu_ops_spinwait.c:16:6: warning: symbol '__cpu_spinwait_task_pointer' was not declared. Should it be static?
>>
>> Signed-off-by: Ben Dooks <ben.dooks@sifive.com>
> 
> Hey Ben,
> With this applied I still see a:
> arch/riscv/kernel/cpu_ops.c:21:29: warning: symbol 'cpu_ops_spinwait' was not declared. Should it be static?
> 
> Seems to be in the same ballpack, so maybe you could fix that one too?

I've done that as a new patch in case it needs to be moved.
Not sure head.h was the right place nor where it ended up.

-- 
Ben

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
