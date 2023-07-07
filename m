Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61252EB64DA
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jul 2023 16:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=BSs3xVJp/cJF/nRDZYiii17sHAOYWYBAwy26zxSixf0=; b=hTwiTSwv5p8idMXugc1hSvqWA9
	AFR8xibqdaBWy27cW/7Cylm97Mu83iPhkOJIvXa+8LauSweh+ZgH2NGYDbmevk5GlniabXaH7kXVq
	HYzksYSbAO1Dz6ckcbloWjHyqBLLpAjORc9k66yXwBBYqVn6nARNNrKeXu203UTwJpqarY6r0fQQR
	WpklFyKGxWkXdbCKXew5o7C5liJPjz2FLxl/1kHX/30pHflN3/VHdsBFimLtXXLgVM4MTvBJS2/hw
	KHHkOeA+gVQSoBngIB2shKfO8lFexDNHkCfY6VA9PyyCkaOPz8V27wWTUALGi9BFKaHxczXaPt8ah
	lTHmhAxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHnvJ-0058H1-1l;
	Fri, 07 Jul 2023 16:03:09 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHnvG-0058Ee-35
	for linux-riscv@lists.infradead.org;
	Fri, 07 Jul 2023 16:03:08 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1b8a44ee159so11003335ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 07 Jul 2023 09:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688745784; x=1691337784;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C0VqBIALrcd8mBVd81Rng9Cgue3ve8H7Klx3ry8qJ1c=;
        b=JDBQ1wBiD3a/sXWfUQ730dyrmw5jo68RcTwMpLltrbxz8+GeU755yZR0/7MvzTfuWl
         v8LUr/cVcvYriYHNLBs/fwF5/b0b6LHK87tJa4Dlj51kbIs7XfEhTWs31ctvE1/Od6WM
         ofZNxuU/8+aHUkM50iufvfEdhtD51/gCKLx+rOSvxliHoybfdHN4AIK3eNP9+AQpUANI
         1waIVPvdS08wDE/OQmi2sulIZOLT14DwcoYQo/TI/PKnvhSmQPlwIN8b7pojE4pvJ341
         7yLNXGbZk6hcVAwmHkva/1Ge+2gI4OhBl6Jn+XEEfKSSyAtfZDfaZ27rjsD9uYB+7YJr
         31nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688745784; x=1691337784;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C0VqBIALrcd8mBVd81Rng9Cgue3ve8H7Klx3ry8qJ1c=;
        b=TsudgIiAX8GXrRRTwDT3PPZnNlGesfx2KTOZtD84irj/diaNzvuPqIa2Q9CC3jB1dW
         0IzhbBsp9UxQC3nAS/z2DVLhqYIeU3+pvDFhNRVolVvSyCuSZcYly0x5vqATnWN+dxBi
         rWBG2QYNyOYOZ0VuTl+IdWRheMv6sV1pSyATU/FqaF+J2AyRJbt3Xe/j6FK5GQaU8K+N
         bL6NwaDrT/AJA6aRUFDJd3JKPeMkNpkt3R4tSxPFfcsFDaLfW8jHwYQib1CtNw29K51s
         TUKFlSsz6TK4A34U7Cp2/9AfTs1O5vrJ8XHXk5BRDGIlXL2cR+Bwj3uIeJSFj8iNyHmT
         GziA==
X-Gm-Message-State: ABy/qLZsjF2CxhneRG2KsKj4fg8gDagtWOa4BLVQJNV3Ea1UqWfC9Of0
	VvVaNKCkpn2kaqSrWCRGYbesEmEZJITuEuFtBZ8=
X-Google-Smtp-Source: APBJJlGwnL8Qj3bmfjdd9ej0p9JbpDKKaBE7bfwbyGePcVWmqfQqXEQFnZpLqWjudNruERaqtEacZg==
X-Received: by 2002:a17:902:ab01:b0:1b8:1fe3:bd2c with SMTP id ik1-20020a170902ab0100b001b81fe3bd2cmr3895162plb.20.1688745783547;
        Fri, 07 Jul 2023 09:03:03 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id n11-20020a170902e54b00b001b03b7f8adfsm3437356plf.246.2023.07.07.09.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 09:03:03 -0700 (PDT)
Date: Fri, 07 Jul 2023 09:03:03 -0700 (PDT)
X-Google-Original-Date: Fri, 07 Jul 2023 09:02:55 PDT (-0700)
Subject: Re: [PATCH] module: Ignore RISC-V mapping symbols too
In-Reply-To: <3e905882-7f96-4fc0-aecf-6054ed00372e@t-8ch.de>
CC: mcgrof@kernel.org, rdunlap@infradead.org, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: thomas@t-8ch.de
Message-ID: <mhng-1edd26e8-9307-4579-b50b-beceef92ccb9@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_090306_996306_E737234F 
X-CRM114-Status: GOOD (  11.67  )
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

On Thu, 06 Jul 2023 23:06:19 PDT (-0700), thomas@t-8ch.de wrote:
> On 2023-07-06 22:40:01-0700, Palmer Dabbelt wrote:
>> RISC-V has an extended form of mapping symbols that we use to encode
>> the ISA when it changes in the middle of an ELF.  This trips up modpost
>> as a build failure, I haven't yet verified it yet but I believe the
>> kallsyms difference should result in stacks looking sane again.
>
>> [..]
>
>> diff --git a/kernel/module/kallsyms.c b/kernel/module/kallsyms.c
>> index ef73ae7c8909..1e988e542c5d 100644
>> --- a/kernel/module/kallsyms.c
>> +++ b/kernel/module/kallsyms.c
>> @@ -12,6 +12,12 @@
>>  #include <linux/bsearch.h>
>>  #include "internal.h"
>>
>> +#ifdef CONFIG_RISCV
>> +#define IS_RISCV 1
>> +#else
>> +#define IS_RISCV 0
>> +#endif
>> +
>>  /* Lookup exported symbol in given range of kernel_symbols */
>>  static const struct kernel_symbol *lookup_exported_symbol(const char *name,
>>  							  const struct kernel_symbol *start,
>> @@ -289,7 +295,7 @@ static const char *find_kallsyms_symbol(struct module *mod,
>>  		 * and inserted at a whim.
>>  		 */
>>  		if (*kallsyms_symbol_name(kallsyms, i) == '\0' ||
>> -		    is_mapping_symbol(kallsyms_symbol_name(kallsyms, i)))
>> +		    is_mapping_symbol(kallsyms_symbol_name(kallsyms, i), IS_RISCV))
>
> IS_BUILTIN(CONFIG_RISCV) or IS_ENABLED(CONFIG_RISCV) ?

Thanks, this is fixed in the v2.

>
>>  			continue;
>>
>>  		if (thisval <= addr && thisval > bestval) {
>
>> [..]

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
