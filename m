Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD7F8C61D85
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Nov 2023 17:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9NPTIQuAIuUbegKhjxttbLSGCpdKT2CljgeXxpniZXU=; b=EmrMVSduTCxPaA
	cPeIYlGHSmQvsbQelIQ4rcg5IOK2HLyT+GfZX8MEZrLHpcyHzKED4+kOnUC1WZP+OXtzaf8Q5afYz
	0iZiFsVMOSjE6yFSCos5U+XuR9sJRUizoiUPZm3RrEyVOCsDv9yWvteQDeSLXj8wcxAJbxcvQTw1E
	opgIBpKif2MEdLNfAllIaQYK3hzoHJUHtfTfOgd4Pzs7ZiAdmQuLv5Gc9fMPm+sAzzg/dwEIXds5F
	dccSNKnC3WZLXUkD4sPFqPfgYPjlo5XEGH7YBmvkow0KABq+BzowPc1qsjSiqGhp4wOaFQgNig7/P
	220uz2Dm56QoyLP1D+WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5Uu1-00HQLJ-2S;
	Tue, 21 Nov 2023 17:51:13 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5Utz-00HQL0-0h
	for linux-riscv@lists.infradead.org;
	Tue, 21 Nov 2023 17:51:12 +0000
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-7b09035b850so174462239f.3
        for <linux-riscv@lists.infradead.org>; Tue, 21 Nov 2023 09:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1700589068; x=1701193868; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F3VZHmlNlu0O99ZtiO5dO2f9VsPMxl7hcUKuMcRux78=;
        b=MtOgIt2Xr+RN6DhwVQ4eaoSmOhnDohHnDSQc8pbQ3ItSR1VtaGNrjtGyrm8bKeoe9Z
         vcVQXFAZjcNSMR8sWFZXX8eEMxeDD09jUAZ+5ObVtgmug14zChdR0tOiUDoKoNiXpfpP
         WhWzs/OgSkkRGgeYqk38iw0Epk8nM/3OAeUD1PVNRFERYPpgvHk0G1685ShmcatJwfBy
         nXkMoFDGtZ8cs9beWANA8fmRLIs/Sj6ggTpwvZkpHxOWXcMsUvimHCXhOrG7zMf+nvO6
         7SiOjeyDSia9j0QN9fXEN9oK2U7iBFZcsijB6qABGaAbTf0rYCfZJau7uqiJf6C6bGiF
         0C+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700589068; x=1701193868;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F3VZHmlNlu0O99ZtiO5dO2f9VsPMxl7hcUKuMcRux78=;
        b=g7D+9zOKy+xTXlohV+lRJl1UH+qeehF1f0ilUDcujuMsLFgnG/bLhB6W0OSGzGp0PR
         StSbqRjaQ8GWP2Xy4wIpfor2idaULAUEgeRFci3/DQaGnRyWoqRzEHeACi3AFyXYRQHa
         anODjKzZOqf26fyGJ7c+1dDpCMO4GTQ5mMWj8QLnWEKJQTgFmYktHsVqt8zDwny8AvYp
         qbXdvoQe6kVaOuSunHVThaVCaJsQ9Penr9s1q5a+QsYOwQpI6ZREQWQs7fC/Tyyr+VCZ
         KaAqw/ZJSkPSSF33aeb4t2vqvgJovnyo4TIA0ppdkG+uFRLrD4LrakBh4zOzICUja/s0
         YVAQ==
X-Gm-Message-State: AOJu0YwVFNFj9E0tmLDCKDG2A2T7yGlEKCKikkASzo4LoRsHo9Xsb2Sh
	PadpfLhCsnplpUUAUyDEbDClUw==
X-Google-Smtp-Source: AGHT+IEIMVbZd/opiVLMX9t1gte/ruLkANfduOCEUWfGVPu+dBFO4cz1YKq267xfZYCyskPVuqaPog==
X-Received: by 2002:a05:6602:4f44:b0:79f:d4e6:5175 with SMTP id gm4-20020a0566024f4400b0079fd4e65175mr69374iob.16.1700589068654;
        Tue, 21 Nov 2023 09:51:08 -0800 (PST)
Received: from ?IPV6:2605:a601:adae:4500:9465:402f:4b0a:1116? ([2605:a601:adae:4500:9465:402f:4b0a:1116])
        by smtp.gmail.com with ESMTPSA id t5-20020a056638204500b00466526e1e02sm1663632jaj.135.2023.11.21.09.51.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 09:51:08 -0800 (PST)
Message-ID: <218f068c-40b5-4f93-b26a-c300054be11e@sifive.com>
Date: Tue, 21 Nov 2023 11:51:04 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] riscv: add dependency among Image(.gz), loader(.bin),
 and vmlinuz.efi
Content-Language: en-US
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 Ard Biesheuvel <ardb@kernel.org>, Simon Glass <sjg@chromium.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org
References: <20231119100024.2370992-1-masahiroy@kernel.org>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20231119100024.2370992-1-masahiroy@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_095111_311536_197C5167 
X-CRM114-Status: GOOD (  13.51  )
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

On 2023-11-19 4:00 AM, Masahiro Yamada wrote:
> A common issue in Makefile is a race in parallel building.
> 
> You need to be careful to prevent multiple threads from writing to the
> same file simultaneously.
> 
> Commit 3939f3345050 ("ARM: 8418/1: add boot image dependencies to not
> generate invalid images") addressed such a bad scenario.
> 
> A similar symptom occurs with the following command:
> 
>   $ make -j$(nproc) ARCH=riscv Image Image.gz loader loader.bin vmlinuz.efi
>     [ snip ]
>     SORTTAB vmlinux
>     OBJCOPY arch/riscv/boot/Image
>     OBJCOPY arch/riscv/boot/Image
>     OBJCOPY arch/riscv/boot/Image
>     OBJCOPY arch/riscv/boot/Image
>     OBJCOPY arch/riscv/boot/Image
>     GZIP    arch/riscv/boot/Image.gz
>     AS      arch/riscv/boot/loader.o
>     AS      arch/riscv/boot/loader.o
>     Kernel: arch/riscv/boot/Image is ready
>     PAD     arch/riscv/boot/vmlinux.bin
>     GZIP    arch/riscv/boot/vmlinuz
>     Kernel: arch/riscv/boot/loader is ready
>     OBJCOPY arch/riscv/boot/loader.bin
>     Kernel: arch/riscv/boot/loader.bin is ready
>     Kernel: arch/riscv/boot/Image.gz is ready
>     OBJCOPY arch/riscv/boot/vmlinuz.o
>     LD      arch/riscv/boot/vmlinuz.efi.elf
>     OBJCOPY arch/riscv/boot/vmlinuz.efi
>     Kernel: arch/riscv/boot/vmlinuz.efi is ready
> 
> The log "OBJCOPY arch/riscv/boot/Image" is displayed 5 times.
> (also "AS      arch/riscv/boot/loader.o" twice.)
> 
> It indicates that 5 threads simultaneously enter arch/riscv/boot/
> and write to arch/riscv/boot/Image.
> 
> It occasionally leads to a build failure:
> 
>   $ make -j$(nproc) ARCH=riscv Image Image.gz loader loader.bin vmlinuz.efi
>     [ snip ]
>     SORTTAB vmlinux
>     OBJCOPY arch/riscv/boot/Image
>     OBJCOPY arch/riscv/boot/Image
>     OBJCOPY arch/riscv/boot/Image
>     OBJCOPY arch/riscv/boot/Image
>     PAD     arch/riscv/boot/vmlinux.bin
>   truncate: Invalid number: 'arch/riscv/boot/vmlinux.bin'
>   make[2]: *** [drivers/firmware/efi/libstub/Makefile.zboot:13: arch/riscv/boot/vmlinux.bin] Error 1
>   make[2]: *** Deleting file 'arch/riscv/boot/vmlinux.bin'
>   make[1]: *** [arch/riscv/Makefile:167: vmlinuz.efi] Error 2
>   make[1]: *** Waiting for unfinished jobs....
>     Kernel: arch/riscv/boot/Image is ready
>     GZIP    arch/riscv/boot/Image.gz
>     AS      arch/riscv/boot/loader.o
>     AS      arch/riscv/boot/loader.o
>     Kernel: arch/riscv/boot/loader is ready
>     OBJCOPY arch/riscv/boot/loader.bin
>     Kernel: arch/riscv/boot/loader.bin is ready
>     Kernel: arch/riscv/boot/Image.gz is ready
>   make: *** [Makefile:234: __sub-make] Error 2
> 
> Image.gz, loader, vmlinuz.efi depend on Image. loader.bin depends
> on loader. Such dependencies are not specified in arch/riscv/Makefile.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
> Changes in v2:
>   - Fix commit log
> 
>  arch/riscv/Makefile | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Tested-by: Samuel Holland <samuel.holland@sifive.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
