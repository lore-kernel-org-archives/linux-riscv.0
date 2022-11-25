Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C75C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Nov 2022 20:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZuIcvFXF5zHTZmZ29MxxI7h5URSSdOKywPwHOm+6+vA=; b=IuusNtQmEOeystOLP/vrX7i11R
	OwHciPZxaZg5Kv8h1WIoYoyx8TKyJFRXDAPvoDxl4PALQ6AOjdYrs1aL7NBC36282MlJkKda9OPSu
	EGHy+j78OAOb93eWJyuUxF3LyqgYo9TCR9ZnWG1vGgX0crYUx84/84cYCUf+/mvoaiqJfAVxYGYd0
	F/RiZl/O6X87RcyiB9nHdDv0V1icKqSUnuUKmGm5Za08V5wB/xaNojfHhb100q+SGDSHwHb95XEw9
	YSy0QVm042iClW15inTt7WBG8uk444f25ZQ87UgVJ7Uauutfu1tr4jK4CJA/B3R2ob+6Iti+24OkD
	SfKSgpnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyf4o-001yEF-VV; Fri, 25 Nov 2022 20:13:35 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyf4l-001yBj-Tn
	for linux-riscv@lists.infradead.org; Fri, 25 Nov 2022 20:13:34 +0000
Received: by mail-pj1-x102a.google.com with SMTP id b11so4473295pjp.2
        for <linux-riscv@lists.infradead.org>; Fri, 25 Nov 2022 12:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MDP8+zBmfQHRcFiPOpCE4wMRSn6LEmNlkUH03ts3yr0=;
        b=hKyprivKiYzzTQ8oF/ulUkkdzfgIzRiVbIUuR89KKXYuG438MnyI88QGVMT8EcO1w2
         iGJr19FWFI0DRxsAW6fw4vpIkQ7sS6PXTXfZZq1dsZ8SqhlpjEIwCyTLHbfJZfJU0NHz
         A9pB4zYyQs3p5roKeN30feXEdRIwLbAtzEP6kNo1VcvYiCuoMkLyjctiWg1x9mPf17ho
         NYYRhaNm3fbQhLyiS+uTdSgESVpJmHagdOe0785ktd7t+ECJL/d1GE5bM1FqQXaguMLF
         YfRMpG8KvHZK7Rc/YcR7Ez16XYTPz6V4euDjSEZwjRgOx4SEiOvCCBU6zLUzj3B8bMPA
         0uZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MDP8+zBmfQHRcFiPOpCE4wMRSn6LEmNlkUH03ts3yr0=;
        b=oRIi5XNo8Riesl2K9skWTNho9J6Vgf8zmoDizawHpf5P1E7xutvp/XWtCtzTETh39G
         js9kq+lZ8L7him9l3cdJbFTTucGoDX3kO6pw0bf8YTfOVuHvSS8prYvtgiJgi/ysIZtP
         BsD0K9RPnjav3Y3qM9JSj9cWIrz7F8XIHJo+qJ6IzbxzojrugRz2XV4Zj10ri/Hmb6jD
         j4i+Bqt5qTKwk9QRjFtwKqRTrIDZ5X8YfVZ+Guf8/Fqjsko7O8dBMw5ml5ekUsuFCAf4
         WPaZx74Ss3PySVsuwvTyb2dSYSh86nZrkVvgidoYkFXfgJsfvXJYmkLJhAqVuqs/Oepo
         FBHQ==
X-Gm-Message-State: ANoB5pkyuc8WS8o/x9oxy+kkpV0oM8TjsVtP2MZeGeZbNvQWJbhlLG06
	S0a8p1x9jDfdi8WddmZahsQzMw==
X-Google-Smtp-Source: AA0mqf7aQtDeqUgEbaJZZey8FgHViRH5FRjF5BMRy/riw4u/ktLZOVEt+cQ+jwW38CL7F8wBpxdP0g==
X-Received: by 2002:a17:903:2601:b0:189:315f:d6fc with SMTP id jd1-20020a170903260100b00189315fd6fcmr19751432plb.35.1669407208245;
        Fri, 25 Nov 2022 12:13:28 -0800 (PST)
Received: from debug.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id b16-20020a170903229000b00186a68ec086sm3813166plh.193.2022.11.25.12.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 12:13:27 -0800 (PST)
Date: Fri, 25 Nov 2022 12:13:26 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: Guo Ren <guoren@kernel.org>
Cc: palmer@dabbelt.com, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH v2] riscv: VMAP_STACK overflow detection thread-safe
Message-ID: <20221125201326.GA2037421@debug.ba.rivosinc.com>
References: <20221124094845.1907443-1-debug@rivosinc.com>
 <CAJF2gTSU5sskjJTm6yL_X9aHdtVQ0MLzEY7FRRLT1mKH9qkWXw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTSU5sskjJTm6yL_X9aHdtVQ0MLzEY7FRRLT1mKH9qkWXw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_121332_196483_2600D807 
X-CRM114-Status: UNSURE (   7.14  )
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

On Thu, Nov 24, 2022 at 05:53:45PM +0800, Guo Ren wrote:
>On Thu, Nov 24, 2022 at 5:48 PM Deepak Gupta <debug@rivosinc.com> wrote:
>>
>> index df9444397908..a7da051159cf 100644
>> --- a/arch/riscv/kernel/asm-offsets.c
>> +++ b/arch/riscv/kernel/asm-offsets.c
>> @@ -38,6 +38,7 @@ void asm_offsets(void)
>>         OFFSET(TASK_TI_KERNEL_SP, task_struct, thread_info.kernel_sp);
>>         OFFSET(TASK_TI_USER_SP, task_struct, thread_info.user_sp);
>>
>> +       OFFSET(TASK_TI_CPU_NUM, task_struct, thread_info.cpu);
>Why not TASK_TI_CPU ?
No specific reason.
>
>>         OFFSET(TASK_THREAD_F0,  task_struct, thread.fstate.f[0]);
>>         OFFSET(TASK_THREAD_F1,  task_struct, thread.fstate.f[1]);
>>         OFFSET(TASK_THREAD_F2,  task_struct, thread.fstate.f[2]);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
