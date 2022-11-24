Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E11B3C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Nov 2022 08:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y9FqUEJor5+jN1/HNGRNlBHC8lSvKNgPvt0fHgUiHJg=; b=zHGNW9dW9wYpbkeQR880ksZyIU
	cC7MtRxAWy2lfOpMVUxgSPPxOQI38gATB9l/wf74U1re3lGUUylPRTjTcqna9Ktph/MGDl/Z5oABM
	5g6QIBXMlAUTI/0dBMLK26wyvFPx8xDkZySAHQ8/ZfgQn586puhpT8vSK5AMLMzbdhtqEoFOUyJmN
	7HTQ3ZXx3HHBh0gVgXk3oiELqtBTUv6/8rhfjH1vTuP0rUufYMMJQ/A4PFpr3mCMjFh/3KR4XSuaA
	fgJKAbhSFwco5f6ugr/E0woVoj1+p6Gv3fVmkUd0la6lHtFL147W4Xg/CkrBzh30OgpZYcns56BUr
	mgeBHxEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy7Yr-006WuG-Mq; Thu, 24 Nov 2022 08:26:21 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy7Yo-006Wsi-DC
	for linux-riscv@lists.infradead.org; Thu, 24 Nov 2022 08:26:20 +0000
Received: by mail-pj1-x1030.google.com with SMTP id y14-20020a17090a2b4e00b002189a1b84d4so1005347pjc.2
        for <linux-riscv@lists.infradead.org>; Thu, 24 Nov 2022 00:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iq+4pfpVj2YEkmw3BdrSeu5qIO7TFnvAEvQVd61pySI=;
        b=c9D3h9my8OzUH9sGDlOD2tEvIgNEtuRwLd5yV0iddgrBlQ6Vd/kkD/2cOnt/qJGtHl
         hwB+GCmeBHg6jpsWCCpSx9B1vLeir0CF3rStUqkQDDwL/W+c1tD34kFkDQsnUd7odEIl
         b3/WnZhkr8aFhMRhFpnrGwW3DZsGQd5f4vZxD77drUNjVnVvRgK+VkrfryBQc/skVA1y
         nY1yscS3s7/BCgvaMtXZLnowbEhUAX35ZJGD57/5oQSppZPBuEr3PM9mcJCeBJT0behS
         COV0ZMk8jSdHFpYzeGDAacRJr8FRCdnGkhjHPwM/tCiDTHY2Y3/u0bHyFADgqJ0jL8Dg
         vKog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iq+4pfpVj2YEkmw3BdrSeu5qIO7TFnvAEvQVd61pySI=;
        b=BKRBbLIS4gzbmYXSQVIsffyJ1aCewcmxxiH/26N20H99bNIqrJ9qe2t3Sm8b4ZruDZ
         w3Fh73P3ZShzlU5kKg73MtECqsT42K7zOeINwX1+jBhv7x1M0fEMXDrVfTTv5Y7UNeJt
         BdShi5zkF+wXfaMtL6PXVKW8lNt9tKQknFrGzsRFJXxITkoIEYL0w2xUtG56MxNW50Va
         boR18WY1pxY/eOQfxVqy5EFHzbVg9YsFJ5W64GdFZyIwB1Av4CyfTbOg3XwMw8FjLmxm
         80dYjpYbStJcjdpzwe5wkZF02umr/m6aiMtoviXlBCtA5PnJ8G/KqVyEiwkGErb1rulm
         MBQQ==
X-Gm-Message-State: ANoB5pmpvfeWSz4Rwhx+Y7EKO+kSoocIY77wggqkhJWKI+peiK2tTwMM
	2IreieVrKfR9xzRwMVk1DdkjeA==
X-Google-Smtp-Source: AA0mqf5MGYHuYsuRjUW2rJsuasqSdOayajlDgv8RqUu8ILUS+dhJ7O4r/rxC1MiPkD7GHc5HNv84eg==
X-Received: by 2002:a17:90a:a381:b0:218:6dc3:55b8 with SMTP id x1-20020a17090aa38100b002186dc355b8mr34448206pjp.189.1669278375137;
        Thu, 24 Nov 2022 00:26:15 -0800 (PST)
Received: from debug.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id x11-20020a170902a38b00b0017849a2b56asm638907pla.46.2022.11.24.00.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Nov 2022 00:26:14 -0800 (PST)
Date: Thu, 24 Nov 2022 00:26:12 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: Guo Ren <guoren@kernel.org>
Cc: palmer@dabbelt.com, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
	Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH] riscv: VMAP_STACK overflow detection thread-safe
Message-ID: <20221124082612.GC1149630@debug.ba.rivosinc.com>
References: <20221124005006.1788315-1-debug@rivosinc.com>
 <CAJF2gTSwMZQvSNxb2_5GNrVG0pwfXWsHmp8zZG=gFHnhc95bjQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTSwMZQvSNxb2_5GNrVG0pwfXWsHmp8zZG=gFHnhc95bjQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_002618_659319_286D4818 
X-CRM114-Status: UNSURE (   7.91  )
X-CRM114-Notice: Please train this message.
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

On Thu, Nov 24, 2022 at 09:32:19AM +0800, Guo Ren wrote:
>> +.macro asm_per_cpu dst sym tmp
>> +       REG_L \tmp, TASK_TI_CPU_NUM(tp)
>> +       slli \tmp, \tmp, 0x3
>> +       la \dst, __per_cpu_offset
>> +       add \dst, \dst, \tmp
>> +       REG_L \tmp, 0(\dst)
>> +       la \dst, \sym
>> +       add \dst, \dst, \tmp
>Another tricky asm code of using percpu, I don't know how the percpu
>maintenance guy thinks.

On this, if you can point me to someone, I would like to get their feedback.
While discussing this, one issue that comes in my mind is if the shift of 0x3 
is correct or not on 32bit systems. I don't know what's the size of each entry
in `__per_cpu_offset`. On 64bit it's 8 bytes and thus 3 bit shift.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
