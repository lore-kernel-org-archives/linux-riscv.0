Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F11C6FA82
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Sep 2022 14:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=jCMIOHLDW4H8v23tfqEhR0GMtkmMiQ3YObz1dVQjkh8=; b=iN4DGmvLtXYTpBpAfzVuY4Ujp9
	Kb9fp88gZ+D8FkFUltu0K5cm9VZ22cU7+s17ejlrzX/NJK1+K9rFIOI8yInKEerR6BBtXL50Gb3tv
	aPZUVHDzTbJXQhRPIrx3X+cwTMVMT7WMja/d5kq2oBD2a3X501shEJCTpgSnoEoFu4OEA5kcgnc54
	36qBI+nQgeahi1sz1TO8vaCX4xnr/dudfPAddhNFfcQwx7/ISdCfx+2IfJ0XrxYFUONfoKL7Z6wYp
	0sUpVabpKrT+oMtdSQH89UZL+Eqwas/s3jNBxJcyB7puFIrnIEhvQS3aacN2rXMBU13TnuCdBQuEI
	B3/BytOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZC2a-00Dzby-C9; Fri, 16 Sep 2022 14:10:00 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZC2T-00DzRo-4O
	for linux-riscv@lists.infradead.org; Fri, 16 Sep 2022 14:09:54 +0000
Received: by mail-ed1-x534.google.com with SMTP id b35so31706399edf.0
        for <linux-riscv@lists.infradead.org>; Fri, 16 Sep 2022 07:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date;
        bh=Wbo6PeFzbTslDNAkmvCAMMHbZD+/6vO1ee0ScMdwLlM=;
        b=mL7L1d9mfkWKJpZOnl7BMgFKqdXPtJ/YjfD11NySW0RzBwLJTDFvckUXSJR9fiTOVF
         uVzinfgsRbyHd0XBE3MfsFqyscwzNb7ju/t58XBUeyXM3N6mCulXDDbyC2VGTKLYRymJ
         n4qYmbmRGFNEO7He1ElhqG6/8nsK2MHZP6vqz0itMBSOEtyFELsc3btGHIAz4UBW86nV
         cwoclkDSB68+6WmGkXw8Zi05D22aH6RHSbPrzEE4WWnjL7qIaQEVqs85/JgEzivBOueH
         jPA7TTqn8hiGnuXSk+qyQwKojslpX4+dj9TuqwMrUIxpD4UrDB43j6AlOCsZx2akviWs
         OgrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date;
        bh=Wbo6PeFzbTslDNAkmvCAMMHbZD+/6vO1ee0ScMdwLlM=;
        b=hDvksJ5deaG6t34G3Ljeymk9GvHRrdFqrfDMveGMnEQ1ECCi0kvqvOXQQuU90HVdY/
         Pusj7oJN/MtzkKPslwpqWgBFYlS3naz7bduhYOsD1G1uMyk9bS4SfF5SzJVeDumYMF/z
         t3m/gGjpieHp94hJ7CrVxVhoandWYOVrhCWq5rVpIiNI/yFg+sbmfTo7Ft4eIBmXukWP
         mt3e7W6u4azKJ3IQm86PUZPmkZNhMvygbgQwpuN3WpU2TRrkzjCk7CGY3d50wrbSH+1J
         8LYOkeUiKfvjAtktNNMUniEco+b+n0MOfLItJIqgAnZsJUSamzknV5EdF09nyVzfgGKZ
         SwVg==
X-Gm-Message-State: ACrzQf0ZyfshtQIZ//R0JfGBlcgJC5Fob4r8CpjclyS0SrOzIEoBO8FY
	TcvdwPaG3bjzxbj01GBHAhsiBovD10YJYT/ePxk=
X-Google-Smtp-Source: AMsMyM53rj+iu3IcwCiwPiJNGueY0NkEiccJUi0x9cT+LfaO46nx2rbTvb/qK05kvfvK8IMFr4aNKQ==
X-Received: by 2002:a05:6402:1911:b0:451:6e0b:7eee with SMTP id e17-20020a056402191100b004516e0b7eeemr4164047edz.170.1663337388483;
        Fri, 16 Sep 2022 07:09:48 -0700 (PDT)
Received: from localhost (vpn-konference.ms.mff.cuni.cz. [195.113.20.101])
        by smtp.gmail.com with ESMTPSA id cx24-20020a05640222b800b0044ec3285b23sm13640306edb.58.2022.09.16.07.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 07:09:48 -0700 (PDT)
Date: Fri, 16 Sep 2022 07:09:48 -0700 (PDT)
X-Google-Original-Date: Fri, 16 Sep 2022 07:09:37 PDT (-0700)
Subject: Re: [PATCH] RISC-V: Add support for Ztso
In-Reply-To: <87ler21drg.fsf@linux-m68k.org>
CC: linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: schwab@linux-m68k.org
Message-ID: <mhng-3bec4d12-b497-4db7-9a9a-5fd2ede32efe@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_070953_200250_EB144C25 
X-CRM114-Status: GOOD (  11.65  )
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

On Thu, 01 Sep 2022 23:39:15 PDT (-0700), schwab@linux-m68k.org wrote:
> On Sep 01 2022, Palmer Dabbelt wrote:
>
>> @@ -31,10 +32,23 @@
>>  #define ELF_DATA	ELFDATA2LSB
>>
>>  /*
>> - * This is used to ensure we don't load something for the wrong architecture.
>> + * Binaries that assume TSO cannot be correctly run on non-TSO systems, so
>> + * prevent them from even being loaded.
>> + */
>> +#define EF_RISCV_TSO	0x0010
>
> That should probably be defined in <asm/elf.h>.

Sorry, not sure if I'm missing something here?  This is 
<arch/riscv/include/asm/elf.h>, we just don't have any ELF flags defined 
for RISC-V yet in the kernel because we don't use them.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
