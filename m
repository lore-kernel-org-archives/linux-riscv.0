Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10ABEC8302F
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jun 2025 22:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Bc6u2n3r4kZyAsmwGaDsVoOGb6mPFIopWFLR3yldrqU=; b=29aMNa09zryc56dzDdJBD8O0+t
	8R6+846BlkAKF900YDZf9DCKLfeB/kuhDMwRfjdSy43hRim6NVMmWaF2LpNqvV3SRBtDXWku2PQU6
	web7qRXgHz6OZGOFA3ku+TTi+IBKwnXCv9ACnYVVvq3lW6t4fOI60PtR3/maOhEnRt6T5wJVFhkw0
	6y5jXZ3QnvuTlbC+kd7pSV8o/weJK85iv/XcZIAm43G61c29aURIjQ+vIWegr9goSP1n60vp+EcO1
	uOCG/Y+rrUWrkKUIa0lm2uRDu7XEuUkgrz7JU17RB/dFxGZ+ToOoZ680lAlRFJ2/0JwwggM8V94Cs
	8IAkvr8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWMtT-00000003aKN-1XLl;
	Mon, 30 Jun 2025 22:22:31 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWMt1-00000003aHZ-2SOo
	for linux-riscv@lists.infradead.org;
	Mon, 30 Jun 2025 22:22:05 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-23633a6ac50so62685695ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jun 2025 15:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1751322122; x=1751926922; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q27Lyqj7tm/2CIsdVUBHnoGs4hlAqirUyp1XE3Nqk7Q=;
        b=nzHevVM0lcRlBFognfvVzL5OgzTfhOdSrHjfQzmWW7Tl5qbRm/Sdw2oT7Sgw+GuZTr
         GjMfmHhdskEi7U4Mu3QEjBAxNz/kB2u7fuoV3w/YT1Q6VFDcosh/3zqBN6RDA4H4OK6W
         uXqlGHlpEcpeDBfTt8OZRA4KS7XJhh1ygMQbOrDHB3qRauZUIYVJaWc1K77LIfIUMaAO
         YXvZpeOeaH0wSe6gPxwLx5RIJYI2ANBrJrbRbvWCey9KHVUilPuPp3hhcy4Bj9G5/g1u
         2CAhQ8ayD9IhqZmji+zq1U62toH1LCVnKNu5QXwrcbDHggViCEdBrjwVFp7H0f/8NYkk
         4JlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751322122; x=1751926922;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q27Lyqj7tm/2CIsdVUBHnoGs4hlAqirUyp1XE3Nqk7Q=;
        b=LtvE4aTyDpnIKnG1aISO/BpZ1nR3D1a8ImoiMS86gAQBCT0BNV8/rQPST2ZGBCNs3J
         n9q4dyfaSVhL6A5Ad0Wzd8P70HmKgXbaS3vVVNGp3WIySfo5EbLczcNnsdxDFv8yuJBz
         EDH7i8P5Uq1AjKAYgOjgmkkHneQ+/qlFyirIFEpA6onYeCn3nTvz9QReoKH/buaxAKwy
         SJ2EXtgpyBjitR8a5RXh2+Tcj1jdAtbJz8onNfTrSN/TA/FTINHZfk2ONRREEbhl+dtU
         yZVDlgh2Qipqmym4AIEo3c09oznP62n6K4ZMoYaG+NS6kqLVYInlWuHtTjdBqnzsRcwb
         v3pg==
X-Forwarded-Encrypted: i=1; AJvYcCWpqRTflKfxz4RT2bVa8cE8RQ1UQJbcHZU8/6D7NiO6qGx4tmvQ5xZJdI23Mi9zfeCLG8DRHu7egeqeiA==@lists.infradead.org
X-Gm-Message-State: AOJu0YznxMkiUDb1AspiM1ybhtwFuUXcrYZpy+ONcJCKkVgCQ8BnYmWL
	XkIKM5M6CPfRBEj7E832VGHGjwFIdiJpiqg2qJlGXF1pra8GjFQRq/dQ2otVan/Dbc4IgDCe+26
	Tr5Tc1Qk=
X-Gm-Gg: ASbGncuLFRwD97IAVhhxBu8rr+3ax3yYCRt/SosqW0pExjs8HtydfmUwzsBQkO3aPVm
	4ZpCdEFr+hPBWpHZyg12JPwwZ8QbFsi+KZD5HDxvOej+CFZobl+VsEdxQAlMeJl4Ip3MLDlsIbw
	1+MSmiLN8mcpvXynYCFAOsuol5oOMbu90H07o7XpJoP0kqtMi3k1OyTIok+2aA/Fj9v+tMPy27l
	9p8bY9kLpxVMNOI1sTlQbGljr/YePtTR76hBHSlLgTMh6b4uRmI1QFTRwelCLDzpe8C+22NQnIe
	EqdFT6HrEKOTQx4j8Qe0DbaaZpTq4OQ/pec4cIkm343gv4ImXxoYeVkJpBbc
X-Google-Smtp-Source: AGHT+IF/9/W/RobbWdwapPYgKRdpaogHaPHhcEoCtTmVtsHtpGyQZz83d6v6lkerOgwvII/tZ2AWiQ==
X-Received: by 2002:a17:903:22d2:b0:234:8f5d:e3b6 with SMTP id d9443c01a7336-23ac3bffd40mr175587995ad.3.1751322122339;
        Mon, 30 Jun 2025 15:22:02 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::4:9aba])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-23acb3c6e14sm87155465ad.228.2025.06.30.15.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 15:22:01 -0700 (PDT)
Date: Mon, 30 Jun 2025 15:22:01 -0700 (PDT)
X-Google-Original-Date: Mon, 30 Jun 2025 15:21:59 PDT (-0700)
Subject: Re: ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(security.o at 937376)
In-Reply-To: <20250630064442.M5D7FRfm@linutronix.de>
CC: lkp@intel.com, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
  linux-kernel@vger.kernel.org, alexghiti@rivosinc.com, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: namcao@linutronix.de
Message-ID: <mhng-111A4C41-B987-489A-9D99-754124522DB4@palmerdabbelt-mac>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_152203_862120_6316C673 
X-CRM114-Status: GOOD (  20.79  )
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

On Sun, 29 Jun 2025 23:45:06 PDT (-0700), namcao@linutronix.de wrote:
> +Cc: linux-riscv@lists.infradead.org
>
> On Sun, Jun 29, 2025 at 02:25:33AM +0800, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>> head:   aaf724ed69264719550ec4f194d3ab17b886af9a
>> commit: 890ba5be6335dbbbc99af14ea007befb5f83f174 Revert "riscv: Define TASK_SIZE_MAX for __access_ok()"
>> date:   5 days ago
>> config: riscv-randconfig-001-20250628 (https://download.01.org/0day-ci/archive/20250629/202506290255.KBVM83vZ-lkp@intel.com/config)
>> compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e04c938cc08a90ae60440ce22d072ebc69d67ee8)
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250629/202506290255.KBVM83vZ-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202506290255.KBVM83vZ-lkp@intel.com/
>>
>> All errors (new ones prefixed by >>):
>>
>>    ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(net-traces.o at 1014596)
>>    ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(e1000_main.o at 992876)
>>    ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(core.o at 912236)
>> >> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(security.o at 937376)
>> >> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(sock.o at 1012256)
>>    ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(ioctl.o at 1015736)
>> >> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(socket.o at 1012196)
>>    ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(ring_buffer.o at 910076)
>>    ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(hugetlb.o at 919016)
>> >> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(btf.o at 913916)
>>    ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(page_alloc.o at 918536)
>>    ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(slub.o at 918836)
>>    ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(spi.o at 992036)
>>    ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(vmalloc.o at 918296)
>>    ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(syscall.o at 912296)
>>    ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(trace.o at 910136)
>>    ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(skbuff.o at 1012376)
>>    ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(vmscan.o at 916376)
>>    ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(xprtsock.o at 1024196)
>>    ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(filemap.o at 915776)
>>    ld.lld: error: too many errors emitted, stopping now (use --error-limit=0 to see all errors)
>
> I'm not sure what lld is saying here. It seems this problem has always been
> there, the revert commit just made it appears more.
>
> These errors should still be investigated, but I think the revert commit is
> fine.

Ya, I agree.

> I see CONFIG_CMODEL_MEDLOW=y, so probably has something to do with
> arch/riscv/mm/init.c is compiled with -mcmodel=medany, while the others are
> compiled with -mcmodel=medlow. I leave it to smarter minds..

LLVM has a blurb that says

    // Linking object files with different code models is undefined behavior
    // because the compiler would have to generate additional code (to span
    // longer jumps) if a larger code model is used with a smaller one.
    // Therefore we will treat attempts to mix code models as an error.

which is just wacky, so I'm moaning about it over here 
<https://github.com/ClangBuiltLinux/linux/issues/2097>...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
