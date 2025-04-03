Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE0F1C3600C
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Apr 2025 16:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=pB5zl2S4ULCDcYVXg8Sd0pXx/uWV5XGXhqJ1s2FcnV0=; b=MOQLQzWCgmTBYnmpnm+bGThc1s
	0oPMv/40dd2CuRAMIVi6XnsGl0jn3RNSyx6ekq+MnKtFbslv9fiDQQNejSZoOKMhc8VNXkUZtIq5H
	7Rf7Kea8GXgvwa2JvhKQajYw1Zs+ymCylMn7imTyHH+1MdozkNbSOOqtfFkLCND57OMdsVleP8A1w
	PEBV7vLNBozaMxY4P+6bBeRgp17mXg8tCNmxKunB0nrQERMgxQuAP7oD1HPnjKQ8hRV3dO7fxYMsv
	/hFvStxc8vRyfmHsxXfx3Su2HiTXiecIOCf9T/PNyFshoi6uk5GVmjgdjPOhBnoSg9Zz2tO1LILE2
	DAqInybA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0NDM-00000009KZa-2LVj;
	Thu, 03 Apr 2025 16:14:48 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0NDJ-00000009KYi-2O03
	for linux-riscv@lists.infradead.org;
	Thu, 03 Apr 2025 16:14:47 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-af241f0a4beso1001761a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 03 Apr 2025 09:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1743696884; x=1744301684; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ef+pzV4C83e4SAj4to/6r+rMfPyJU1oBkUC+EMKeDMQ=;
        b=A5/OJbsKsPs31qdY3g0XJabLZDMNad2BGYCspTAg2WjEZKP+DflY0edohJJa2jMdnd
         kdjmjxoXwe081U1lZ23WbVKj8f7eRExRgburRmEF+IjY9T//CsSUAeAqWlPrU1ldQUn8
         /Mcqc8cFioWPV3PICn4KYk7pTe9RlmYfAv0fv2oa01ULem+uRb30UntbYJuJcpz3JdjY
         T4NBYH/I6J+MZPXSGW7SEngEZplGFCDGusAeXWGuPJ2hSiRU88rXeuv0hOTKsAkIdJws
         spWf1JHcZLHhKNP5KRlOIy4XkgJ8ISM6nRkKCtsbG/YtZnG6mIMAlCCzzINDHwzPLqhi
         M5jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743696884; x=1744301684;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ef+pzV4C83e4SAj4to/6r+rMfPyJU1oBkUC+EMKeDMQ=;
        b=Z50sCoYoIFZYHk+2Ou7UMnMRKANFxTozrS6yI2y+gtkcd0lYcPfY5vr/OPhNgqndGf
         lJABJV4Dd5t3ImyoHTJUicwl6bAaB5X4cjZwDyHTLCWzZmIJlsHEMpKk8qPZAf5fci7S
         gd7Re4IGj+zry0giLDbNDRqL16GuM6jypCkCegmOk2tIMWNl7HfTPiDlNvTx4v/4A6Xs
         qX9tRfTF5lb6g6XXWTRDyud8XANa7FgsSkojYjoPjaTW4Rg0M8FZdNVyAZmiUrjBYD8F
         TaR7UsMM9dHkS5hPyYoxrncEg3JBJiXGpgYwL/rzuaWKGQROrlW7LuOTj9P6693iE+O8
         oL0A==
X-Forwarded-Encrypted: i=1; AJvYcCWVT28gcX/dgng+7wC1y5QjF0OoqkvRDE3QbMJ8Bf3QT5qAxfiIdA+0GsjrEWarbPU8A6Ly4VP8vj8neA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzp5sjPqOO6pYafqSUYAR51BBV0XoXk4G5SdblvBWOxHjYiYr9L
	Hn/AUZ19lXQxjEhXpxC3DHG6+k/rqMVSSxcFJhD6dDEeFKfbsDWuBKwjjDsGEOk=
X-Gm-Gg: ASbGncs+Fxykdezbn9JOA/7Mffnm8ZDa00P9jClsG4Zeg8PAZbPao7pzCKzRHVY4uo5
	4SCUuWdJd6yvLHYYug6ipV9gFTA5QIoduCpfYfqKMrGwfB8Z7y83ROQl6muSN1OFfh4KS25bMsA
	X7dyefE1YDlsNOjGERR6glovvTx/tHRF3i8EpuQRb4GIzPkuHZLTYHOCjjytYtDIoV6SqUw2nib
	ruvn//div0UyaR2RTeqV5zbA79flJHG8Cp5WI3I5PnN/+hCVBmMK0P9B85wpIQLUpolTUI/5vsg
	BrBujo0lPxROqW+Li/Jgnpqf8C1+6u/mOaS1Yw==
X-Google-Smtp-Source: AGHT+IELGoM2vuGwvs+CKuvhAKIXpRljIuAtDQQP6mgRfQoQftDtOy8EjZTD2p4+jkf5EebMeV65Kw==
X-Received: by 2002:a17:90b:5444:b0:2fe:a545:4c85 with SMTP id 98e67ed59e1d1-306a4b7fc3amr116329a91.27.1743696884290;
        Thu, 03 Apr 2025 09:14:44 -0700 (PDT)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057ca47ec7sm2086347a91.15.2025.04.03.09.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 09:14:43 -0700 (PDT)
Date: Thu, 03 Apr 2025 09:14:43 -0700 (PDT)
X-Google-Original-Date: Thu, 03 Apr 2025 09:14:41 PDT (-0700)
Subject: Re: [PATCH v2] riscv: KGDB: Do not inline arch_kgdb_breakpoint()
In-Reply-To: <5b0adf9b-2b22-43fe-ab74-68df94115b9a@ghiti.fr>
CC: wangyuli@uniontech.com, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, chenhuacai@kernel.org, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, vincent.chen@sifive.com, palmerdabbelt@google.com, zhanjun@uniontech.com,
  niecheng1@uniontech.com, guanwentao@uniontech.com, chenhuacai@loongson.cn
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alex@ghiti.fr
Message-ID: <mhng-69513841-5068-441d-be8f-2aeebdc56a08@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_091445_873428_73D0F6C3 
X-CRM114-Status: GOOD (  22.14  )
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

On Thu, 03 Apr 2025 02:58:50 PDT (-0700), alex@ghiti.fr wrote:
> Hi WangYuli,
>
> On 02/04/2025 09:42, WangYuli wrote:
>> The arch_kgdb_breakpoint() function defines the kgdb_compiled_break
>> symbol using inline assembly.
>>
>> There's a potential issue where the compiler might inline
>> arch_kgdb_breakpoint(), which would then define the kgdb_breakinst
>
>
> I guess you meant kgdb_compiled_break.
>
>
>> symbol multiple times, leading to fail to link vmlinux.o.
>> This isn't merely a potential compilation problem. The intent here
>> is to determine the global symbol address of kgdb_compiled_break,
>> and if this function is inlined multiple times, it would logically
>> be a grave error.
>>
>> Link: https://lore.kernel.org/all/4b4187c1-77e5-44b7-885f-d6826723dd9a@sifive.com/
>> Fixes: fe89bd2be866 ("riscv: Add KGDB support")
>> Co-developed-by: Huacai Chen <chenhuacai@loongson.cn>
>> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
>> Signed-off-by: WangYuli <wangyuli@uniontech.com>
>> ---
>> Changelog:
>>   *v1->v2: Add the missing __ASSEMBLY__ check and substitute
>> ".option rvc/norvc" with ".option push/pop".
>> ---
>>   arch/riscv/include/asm/kgdb.h | 9 +--------
>>   arch/riscv/kernel/kgdb.c      | 8 ++++++++
>>   2 files changed, 9 insertions(+), 8 deletions(-)
>>
>> diff --git a/arch/riscv/include/asm/kgdb.h b/arch/riscv/include/asm/kgdb.h
>> index 46677daf708b..d9f6a8fc387f 100644
>> --- a/arch/riscv/include/asm/kgdb.h
>> +++ b/arch/riscv/include/asm/kgdb.h
>> @@ -19,16 +19,9 @@
>>
>>   #ifndef	__ASSEMBLY__
>>
>> +extern void arch_kgdb_breakpoint(void);
>
>
> The "extern" is not needed here.
>
>
>>   extern unsigned long kgdb_compiled_break;
>>
>> -static inline void arch_kgdb_breakpoint(void)
>> -{
>> -	asm(".global kgdb_compiled_break\n"
>> -	    ".option norvc\n"
>> -	    "kgdb_compiled_break: ebreak\n"
>> -	    ".option rvc\n");
>> -}
>> -
>>   #endif /* !__ASSEMBLY__ */
>>
>>   #define DBG_REG_ZERO "zero"
>> diff --git a/arch/riscv/kernel/kgdb.c b/arch/riscv/kernel/kgdb.c
>> index 2e0266ae6bd7..5873d3970360 100644
>> --- a/arch/riscv/kernel/kgdb.c
>> +++ b/arch/riscv/kernel/kgdb.c
>> @@ -254,6 +254,14 @@ void kgdb_arch_set_pc(struct pt_regs *regs, unsigned long pc)
>>   	regs->epc = pc;
>>   }
>>
>> +noinline void arch_kgdb_breakpoint(void)
>> +{
>> +	asm(".global kgdb_compiled_break\n"
>> +	    ".option push\n"
>
>
> Here you forgot .option norvc. But this fix as mentioned by Samuel
> should be in a separate patch.

I don't think we actually need either here: we're just looking at the 
address of kgdb_compiled_break, so it's fine if it ends up as a 
c.ebreak.

> Thanks,
>
> Alex
>
>
>> +	    "kgdb_compiled_break: ebreak\n"
>> +	    ".option pop\n");
>> +}
>> +
>>   void kgdb_arch_handle_qxfer_pkt(char *remcom_in_buffer,
>>   				char *remcom_out_buffer)
>>   {

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
