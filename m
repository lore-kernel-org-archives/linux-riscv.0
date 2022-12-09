Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F1AC4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Dec 2022 05:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fy4sn7ZtTC/h9tTtqbX2QZcZ5Xo9FRioPZCMFZ/B/Cc=; b=0MP6SUFtZsspGG
	ZeyIv4/ncKgsA/LwjIOvtAAgIWzWW/UM0PyYyfbF9z5eDDXHE7KwCL+F7F9DI60ZqDyTb/qx4qZl2
	gra3ftZHA/H7AfbBO6ZK1YXdWfyvAmuvvrnz0ASfJSbiXxPIiA0RHV810kMdyi7H1X4x2pVCV4QHQ
	4nB5+GJhatCamYJzwZkbHUGMgvL+DivD/BIxsKSmLIrFRItwEx26opSHrKUJij5RCNGgg2BjRzrXS
	1xj9Kbh9lcR97K1FBc4LLgGUzo18SCpG5RNT1Qf+Qdwl8TEjao9WHmK23ps6Dxs9K2D8K1jBM6L2e
	sGjh4I48OvORqvG45CSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Vk8-004Knd-4q; Fri, 09 Dec 2022 05:16:16 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Vk5-004KnA-4U
	for linux-riscv@lists.infradead.org; Fri, 09 Dec 2022 05:16:15 +0000
Received: by mail-pg1-x530.google.com with SMTP id 142so2835194pga.1
        for <linux-riscv@lists.infradead.org>; Thu, 08 Dec 2022 21:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6TNCQdSlF+qsMghK/FM4K8rIWZD0ncbkYlLlxttfovI=;
        b=suiv9qug5Adb0eMaIprUh9NKoS/B+KQyfcJI7OYZ/zf81FqIIIL1VZU6HxxomuHzvI
         iEIA7fjtmzYPo9EnLHZcNpHdXvvZbfEgNAJrj5D4BIW9gZ1dCYGhJO8vJzuqv1BYaoby
         tmpLQQPeVpTK5PKU0oK6PcxSYvLNkLcVqlE5oSSAfGwLBRktfF05dhP/tOuX04b/85u0
         hypBKWMmn0geGAsxmepvy6s7I2NgqliOO+Of3Ez995nOfGa6aRrbVyYMZ3vpEd+dDExA
         LM79ti2lm2qshfDCsKPQba9vnvodXKkX+XzvT/pEh3OInKDhIPVhgNDhgJD2YfXLnLLu
         mXDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6TNCQdSlF+qsMghK/FM4K8rIWZD0ncbkYlLlxttfovI=;
        b=8Do9GYVtVtj52GC5hsIs5rqB1igCyhtEheoJX9r7bZrD0IRzXxRrN/5muBG/P7Rf3S
         4Y5qVbgBGyvCXNPS2dGsplxnAgcbfYcYOuvnnw4MMapGgAWjQCawibOFelfAU82unt0Q
         pNLyU7yO2SCcwMzzLO/21e1/z6ijk8OWeQAAkZ9O2iSANcDbgaVZRGN2tNiU45AGE5Av
         ioFMLZdmRKE9fCt9sbj1Wj5F58hh92RWNYJATGyAkShuF9aAGkvgbefdr7pl6hseuCEd
         vhqFqvpVBLYYZn8LYISJmU9aKhztWb16/1TASOxq0b1WABl8WX4ORghUiLuPfC7WnaOA
         QtIg==
X-Gm-Message-State: ANoB5plBToRRr9s9NIWEU3+YihwWFXm4GcVKqicZ+DFhnaHtUJBZZJBZ
	vHgfXByHK1kiCs9VQGgFFiJGvA==
X-Google-Smtp-Source: AA0mqf7l7oU3d/2VxdeXfJvnF8MqC2v+sx+S7UVRsn3hq8tf/RxnvOplkk1cnP11s5aAbL44ozs/QA==
X-Received: by 2002:aa7:8589:0:b0:56d:74bf:3265 with SMTP id w9-20020aa78589000000b0056d74bf3265mr3720542pfn.19.1670562969384;
        Thu, 08 Dec 2022 21:16:09 -0800 (PST)
Received: from [192.168.50.116] (c-24-4-73-83.hsd1.ca.comcast.net. [24.4.73.83])
        by smtp.gmail.com with ESMTPSA id x11-20020a62860b000000b005623f96c24bsm368221pfd.89.2022.12.08.21.16.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Dec 2022 21:16:08 -0800 (PST)
Message-ID: <b1dae947-d52a-d28e-5ddc-c1ad6d29828c@rivosinc.com>
Date: Thu, 8 Dec 2022 21:16:06 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: RISCV Vector unit disabled by default for new task (was Re: [PATCH
 v12 17/17] riscv: prctl to enable vector commands)
Content-Language: en-US
To: Chris Stillson <stillson@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 Vincent Chen <vincent.chen@sifive.com>, Andy Chiu <andy.chiu@sifive.com>,
 Andrew Waterman <andrew@sifive.com>, Darius Rad <darius@bluespec.com>,
 Arnd Bergmann <arnd@kernel.org>, lkml <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, =?UTF-8?B?QmrDtnJuIFTDtnBl?=
 =?UTF-8?Q?l?= <bjorn@kernel.org>, Florian Weimer <fweimer@redhat.com>,
 GNU C Library <libc-alpha@sourceware.org>,
 Conor Dooley <Conor.Dooley@microchip.com>,
 =?UTF-8?Q?Christoph_M=c3=bcllner?= <christoph.muellner@vrull.eu>,
 Aaron Durbin <adurbin@rivosinc.com>, linux@rivosinc.com
References: <20220921214439.1491510-1-stillson@rivosinc.com>
 <20220921214439.1491510-17-stillson@rivosinc.com>
From: Vineet Gupta <vineetg@rivosinc.com>
In-Reply-To: <20220921214439.1491510-17-stillson@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_211613_411043_C794F320 
X-CRM114-Status: GOOD (  11.30  )
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

Hi Darius, Andrew, Palmer

On 9/21/22 14:43, Chris Stillson wrote:
> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
>
> @@ -134,7 +135,6 @@ void start_thread(struct pt_regs *regs, unsigned long pc,
>   			if (WARN_ON(!vstate->datap))
>   				return;
>   		}
> -		regs->status |= SR_VS_INITIAL;
>   

Perhaps not obvious from the patch, but this is a major user experience 
change: As in V unit would be turned off for a new task and we will rely 
on a userspace prctl (also introduced in this patch) to enable V.

I know some of you had different opinion on this in the past [1], so 
this is to make sure everyone's on same page.
And if we agree this is the way to go, how exactly will this be done in 
userspace.

glibc dynamic loader will invoke the prctl() ? How will it decide 
whether to do this (or not) - will it be unconditional or will it use 
the hwcap - does latter plumbing exist already ? If so is it AT_HWCAP / 
HWCAP2.

Also for static linked executables, where will the prctl be called from ?

[1] https://sourceware.org/pipermail/libc-alpha/2021-November/132883.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
