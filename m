Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F8E7C25B79
	for <linux-riscv@archiver.kernel.org>; Thu, 16 May 2024 10:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fM+XeYr+64dU8Wz1ItC09v0wQ6kRiXvqRKAmiM2GafQ=; b=YSk3FsI/gozOj6
	CTgKbHDKVcbdjv09NaB10Y+VQKd5/ohG3+f1FQhB30/FsIyrLgDDKlJGjEieNJGC38r//20PDhGn/
	yoU5jrj25aQ3x/35KhHuHHCAmpBTRNVrrZDnGzQ3SWekIabGQ2Z2pXPdiYjRvQpk7t9a3it6E13Cp
	37kRyv1NNtadONA1sA02jAjKyUVU2ipMKfOw0Q8xfogEUhrg16F4IUGNAVFbHnG+0g05S+MYB6gqd
	WdIks+XSFwL9/fBzG4Zt3xko7I0UNQ9qPEohPuE1Ks0zQZvwQnNeYWMDNvIpwsnDuKaIT6vC0/cob
	NNYyFDNvOhkTahEwKbMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7YMR-00000004TxD-2YLN;
	Thu, 16 May 2024 10:29:19 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7YMP-00000004Tua-04rJ
	for linux-riscv@lists.infradead.org;
	Thu, 16 May 2024 10:29:19 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a5a5cb0e6b7so302947466b.1
        for <linux-riscv@lists.infradead.org>; Thu, 16 May 2024 03:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1715855350; x=1716460150; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BfiCrmzMav6jtyX7fjtUp23BCUfl5Tu6+xTotiNhCKs=;
        b=R3o8CG4mQMVuBkYmd4TlGzfzK3E+umwr5tUulsjew1UQTWC4P/XbMoRgoHqcO5vHuc
         BAEPJvyaibCYEp8DYRQnGpxISU9mj/jJa7dt0OFtBr82wiPszc4+sgd1SjRqTj4SiVfU
         Os45/KeL4jkGdz0Bp1EKaEoxpU1RvEbAT6JYRzDvQbPnlMnTEXpBC2rrQMfxgZgk3Wp2
         Bd8A6s7Z6EO7LsRQb25ffXIAr4fz6RE6w9JOYD/mJOpkX8VaSSnjARwmttcxOsIUkhgj
         v2yEp6RIiaY7pJOqO0I4hpxy+J1E0/KyzqTUa+GzI/jK/LW1oVGZtpKzJJ+Ef2vaJeGw
         ASLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715855350; x=1716460150;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BfiCrmzMav6jtyX7fjtUp23BCUfl5Tu6+xTotiNhCKs=;
        b=PWVer/eGnSs8yaRKSdaUeOI6foP81JHY60RdBRRV6O7hZ+Mdyor7IxAbeFmCdDQm87
         Dipq/69E0fdBxVprg9YkRT9Amrtc8h5bXvr24IYEd1kJC1uJp9/aPWuNWTSV0xUJQtU6
         DiPonI35DwP7KTZVdQOnzyZFK5YgCjuCaLzcyDObNh7/JouYjN0QDTXRnvBFRbohIsEP
         orCFen+u1GllS0YVqD47+mnTa4Zn6wz7J97WNpgsu9S/8BOoanZYfqfPrVraz56z2SVk
         7grBCO7EB6+yUTXWXnfo12GtuIo5Pz5yBoyFyr8wbG6+jyy6n7cjBe10CHNaqGUCcFmH
         m8yA==
X-Forwarded-Encrypted: i=1; AJvYcCWNNiWobOhX/a29cbzciFDJMKkYstB15oXcIsYndntRwY1JtmJDA78WIc00PTNda/Y5k/1GLgCYPRBWzDYVE2PsxP4iO+MTSXSDtK/eA29j
X-Gm-Message-State: AOJu0YxFeYL0nPCnpg2SJ1PNiNemxx0//Qo3OY0nKBZ7EQNY4qh/VQUK
	KoJTcwWEat1ONimDhPHZLUQMq0sdO4ufwibVXuZxaLAKoMCX/RlNY+dniaHVb3o=
X-Google-Smtp-Source: AGHT+IExcYKDOZgxgPbo+cpXP+U4PHqgxT6wQa+7CtqYbVSEZVHpbwAd44L/OPkoT6r42Zd20xyv2g==
X-Received: by 2002:a17:906:f898:b0:a5a:8ca4:6781 with SMTP id a640c23a62f3a-a5a8ca468bbmr456970666b.51.1715855349956;
        Thu, 16 May 2024 03:29:09 -0700 (PDT)
Received: from ?IPv6:::1? ([2a00:11b1:1012:4c5c:60c0:dbec:5b5e:a393])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42012a025dbsm166085975e9.23.2024.05.16.03.29.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 May 2024 03:29:09 -0700 (PDT)
Date: Thu, 16 May 2024 12:29:08 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor.dooley@microchip.com>
CC: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org,
 xiao.w.wang@intel.com, pulehui@huawei.com,
 Charlie Jenkins <charlie@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v1=5D_RISC-V=3A_separate_Zbb_optimisatio?=
 =?US-ASCII?Q?ns_requiring_and_not_requiring_toolchain_support?=
In-Reply-To: <20240516-speller-target-d453ad060486@wendy>
References: <20240515-hedging-passage-44fd394ab1be@spud> <20240516-7ff4001c9f2edd2a61775244@orel> <20240516-speller-target-d453ad060486@wendy>
Message-ID: <60EFC387-B19B-46A6-AD1B-D6DAC8108836@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_032917_084305_6625644A 
X-CRM114-Status: GOOD (  15.21  )
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

On May 16, 2024 10:59:44 AM GMT+02:00, Conor Dooley <conor.dooley@microchip.com> wrote:
>On Thu, May 16, 2024 at 09:59:44AM +0200, Andrew Jones wrote:
>> On Wed, May 15, 2024 at 04:27:40PM GMT, Conor Dooley wrote:
>> 
>> So the new hidden config is a shorthand for
>> 
>> #if defined(CONFIG_RISCV_ISA_ZBB) && \
>>     defined(CONFIG_TOOLCHAIN_HAS_ZBB) && \
>>     defined(CONFIG_RISCV_ALTERNATIVE)
>> 
>> which is reasonable to add, since that's a mouthful, but I'm not sure the
>> name, RISCV_ISA_ZBB_ALT, does a good job conveying all that.
>> 
>> If we instead just dropped the 'depends on TOOLCHAIN_HAS_ZBB' from
>> config RISCV_ISA_ZBB (keeping the 'depends on RISCV_ALTERNATIVE',
>> since nobody is really complaining about that), then we could change
>> this to
>> 
>> #if defined(CONFIG_RISCV_ISA_ZBB) && defined(CONFIG_TOOLCHAIN_HAS_ZBB)
>
>Yeah, I think this is a cleaner solution.
>
>> >  	asm goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
>> >  				      RISCV_ISA_EXT_ZBB, 1)
>> >  			  : : : : legacy);
>> > diff --git a/arch/riscv/include/asm/bitops.h b/arch/riscv/include/asm/bitops.h
>> > index 880606b0469a..3ed810a6123d 100644
>> > --- a/arch/riscv/include/asm/bitops.h
>> > +++ b/arch/riscv/include/asm/bitops.h
>> > @@ -15,7 +15,7 @@
>> >  #include <asm/barrier.h>
>> >  #include <asm/bitsperlong.h>
>> >  
>> > -#if !defined(CONFIG_RISCV_ISA_ZBB) || defined(NO_ALTERNATIVE)
>> > +#if !defined(CONFIG_RISCV_ISA_ZBB_ALT) || defined(NO_ALTERNATIVE)
>> 
>> nit: It's sufficient to check !defined(CONFIG_RISCV_ISA_ZBB), so no need
>> for this change or its #endif comment change below.
>
>Are you sure? I did test leaving this as-was and it broke the build for
>llvm-14.

Oops, sorry. I didn't look at the full context. You were right.

Thanks,
drew

>
>Cheers,
>Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
