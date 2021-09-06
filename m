Return-Path: <SRS0=oCzz=N4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66F06C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Sep 2021 14:58:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 143C06023F
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Sep 2021 14:58:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 143C06023F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=a8TnNJ+izQcjhZJfPoUVLn02XppOCb/RV8CGSJ11PrA=; b=li5IsGKJp/lL0RgXPpoyqqIX7X
	0ontzwrUgf9+/aAii6M8xbJJdCiACM3FaCaB2CeSaPEscpX21Zl9pRIo4+MM6xzw5jgWjPgWsjmWL
	RgNaS2skLsSXzaNicHaPz4DZOEiS01e+FLW10MfNCXUxV1eaoX0k32/7lwkJ8AkTAFQDct9lCy0sP
	Lan09vNYaQ6K2W1o6/VMAaAQ3hvHB/aXg879yQi87ix0lzoRF9uK+1hMygO4LTAotvaJPyKz0rkz4
	hem2BGa8NTgafVsOi3S41n2aqk3PFjeP+um9F02aOLbP8dy+yTfHzGahvu9rKsySM/DMovsXkxm1V
	rW8c7j6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNG4W-001996-BP; Mon, 06 Sep 2021 14:58:08 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNG4T-00198N-VU; Mon, 06 Sep 2021 14:58:07 +0000
Received: by mail-pj1-x1030.google.com with SMTP id
 g13-20020a17090a3c8d00b00196286963b9so4431374pjc.3; 
 Mon, 06 Sep 2021 07:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=e7Lxz1rTUMVMiOxDU3ihYWK5WPfaNeZ9K8ew2EFVN6M=;
 b=LXgp52W5k+6e+E1lD/+fnmwROVu0im0ZTbRaTGFRUHoee98niPkmedBSPuoaU+C901
 xA0zVCRtm3ZstMaY0r+bfrLwX0h4lJRwjHZSrSd7VMiiQmuNR4VJb4KIkfYgNr45+6R/
 Ytm3SgdnIw+8vdyNM7Qrbyc2ZfHYtokHyF9mvUbjZBpqaG9aV9hVDtVpCH7AesyMXvxe
 UqoY/NFf7dqJ+B2r0NE5QZJnHLwexfdT+iciJQG7/AjInHtDs1ZoecQ7oAJRB4rOv/f9
 sTenECUfv5Z+O8xZpmI3XfSxkSvYjZ+DMUZOgmuBqGpnmkHpr4lFbj1WgmAnvQDDLG1o
 HBzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=e7Lxz1rTUMVMiOxDU3ihYWK5WPfaNeZ9K8ew2EFVN6M=;
 b=IkTx9itNQIZqwLpWy+bBX/YW9hIALd747bCWgKwrqh9hMEEvuwCuJouQuc/w+ZRXYw
 dS+3j4CjXrknLqlRP8lUh5ckKbqdOBfrZlhdWHGPqFQJTOmkuWkz6qC+uBsnulgaGe4i
 HCUd7bAmH9oSPEE2Fab8TLX19xvUwHdMsFs77lkc6WgyZoVjnG8CyLmSZEBIFusc8rWB
 q41OXJqNEhsv7e5HEEaFjG83ffoaIm9MkCC6515nlWMPhGG8Q5VknbjaqC1n+CPQg1sy
 KkaJze+kn7pj0BZoS57gjpuwkZtv/dJ/tdCwa5WJtbFw21ehNNiJTJKGZtxiLWPOsoRo
 C5fw==
X-Gm-Message-State: AOAM5300Nsfvfg8CeWnXjX27aDPSqGqjbg/D9kSv5acQAWzBwb8vZDVy
 fU27CE+QLNZz9exKffOqIEe7h6svbGYa1gJdhlI=
X-Google-Smtp-Source: ABdhPJx4U2UXdqmjv3wFeCTa6pX3ETSedWET7Gxlb8aTpJkm1WYcBE+shFcj4K1cKKYWsG7A6RIebw==
X-Received: by 2002:a17:902:8648:b029:129:dda4:ddc2 with SMTP id
 y8-20020a1709028648b0290129dda4ddc2mr11168934plt.4.1630940282178; 
 Mon, 06 Sep 2021 07:58:02 -0700 (PDT)
Received: from owniadeMacBook-Pro.local ([8.21.11.90])
 by smtp.gmail.com with ESMTPSA id p3sm7607183pfw.71.2021.09.06.07.57.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Sep 2021 07:58:01 -0700 (PDT)
Subject: Re: [PATCH v2] ftrace: Cleanup ftrace_dyn_arch_init()
To: Michael Ellerman <mpe@ellerman.id.au>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>
Cc: Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 "David S. Miller" <davem@davemloft.net>, Thomas Gleixner
 <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org
References: <20210906111626.1259867-1-o451686892@gmail.com>
 <87v93dn5qh.fsf@mpe.ellerman.id.au>
From: Weizhao Ouyang <o451686892@gmail.com>
Message-ID: <87b80cd6-f20f-a673-f438-faff5d7d4334@gmail.com>
Date: Mon, 6 Sep 2021 22:57:53 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <87v93dn5qh.fsf@mpe.ellerman.id.au>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210906_075806_045498_AF5C314C 
X-CRM114-Status: GOOD (  15.20  )
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


On 2021/9/6 22:22, Michael Ellerman wrote:
> Weizhao Ouyang <o451686892@gmail.com> writes:
>> Most of ARCHs use empty ftrace_dyn_arch_init(), introduce a weak common
>> ftrace_dyn_arch_init() to cleanup them.
>>
>> Signed-off-by: Weizhao Ouyang <o451686892@gmail.com>
>> Acked-by: Heiko Carstens <hca@linux.ibm.com> (s390)
>>
>> ---
>>
>> Changes in v2:
>> -- correct CONFIG_DYNAMIC_FTRACE on PowerPC
>> -- add Acked-by tag
>> diff --git a/arch/powerpc/include/asm/ftrace.h b/arch/powerpc/include/asm/ftrace.h
>> index debe8c4f7062..d59f67c0225f 100644
>> --- a/arch/powerpc/include/asm/ftrace.h
>> +++ b/arch/powerpc/include/asm/ftrace.h
>> @@ -61,6 +61,10 @@ struct dyn_arch_ftrace {
>>  };
>>  #endif /* __ASSEMBLY__ */
>>  
>> +#ifdef CONFIG_DYNAMIC_FTRACE
>> +int __init ftrace_dyn_arch_init(void);
>> +#endif /* CONFIG_DYNAMIC_FTRACE */
>> +
>>  #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
>>  #define ARCH_SUPPORTS_FTRACE_OPS 1
>>  #endif
> That breaks the build for powerpc:
>
>   /linux/arch/powerpc/include/asm/ftrace.h: Assembler messages:
>   /linux/arch/powerpc/include/asm/ftrace.h:65: Error: unrecognized opcode: `int'
>   make[4]: *** [/linux/scripts/Makefile.build:352: arch/powerpc/kernel/trace/ftrace_64.o] Error 1
>   make[3]: *** [/linux/scripts/Makefile.build:514: arch/powerpc/kernel/trace] Error 2
>   make[2]: *** [/linux/scripts/Makefile.build:514: arch/powerpc/kernel] Error 2
>   make[1]: *** [/linux/Makefile:1861: arch/powerpc] Error 2
>   make[1]: *** Waiting for unfinished jobs....
>
> It needs to be inside an #ifndef __ASSEMBLY__ section.
>
> cheers

Thanks for reply, I'll fix it up.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
