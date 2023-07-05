Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CCFDEB64DD
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 14:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=ib4nayQEkWNVCRlRNZBM60BUZb90we+pQw6kc7ZMVYI=; b=oT7xc4cWj2yCTqDAEvG57hei8q
	EcebjKwfUjmP0JYM2vyBBhRsHHB4ef0tDSgWWMXlm81KFrylYpjf1epT4t/y4w2vO4F7OfBDG7Ncq
	jBatYadM2NA1TOjyId0yU9pxARGGC10bupNW8ofqBmAbbLk4zPeMsMbi/EfY8kfudNPeWk0yXsk2l
	ds3jnNk/iQOPVAl9sE48zwd0qpfYrl+8LAZiD5diG4MMCvKZhV2lxqoKZIttRPa+C57PByQN8p/m0
	enCfr1yoZ3Hw0iHoDMmI902q7BdXOD3x4RkH96tNZ8QqNgORzipNZ0LxkvkN8dRDYFJ8QaYGUNdi7
	a6ik8ExA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qH3K5-00G60x-2X;
	Wed, 05 Jul 2023 14:17:37 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qH3K1-00G5zX-28
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jul 2023 14:17:36 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-3a3a8d21208so2638179b6e.0
        for <linux-riscv@lists.infradead.org>; Wed, 05 Jul 2023 07:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1688566650; x=1691158650;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WDWjRluYFM3mzOmtAT5NxskA0RqCR9Q0xHAxLzDYI6Q=;
        b=1A0GhTw4X78yyD2diHuDymDRZR0tQNRmSpxLTIj7P8axsyHpQ76WpBlK7JScRTqEyi
         qKZbGWOykeW46T98BwEJLH7IUhH/2PRp++x/HCuE50ZHgdwfYkF5O/jP8oo2HCTLq3iz
         b94mo8vfnMuT2Xuna48eP7xM7D7fVhQj+B3YOtrgKhtLPwCQbfg6LITO61uqAyARvdmV
         nQ3oCq/Ymh1ELjOMes6j/DOkWslMYzhlnDVb/5jSrmDkTzaNkMx4plvYBIdhf3rp1SBG
         Yjl7RzSl95D8GYwyXeUS/Lgssb6pbH1Le4KEg1hZf5VlIqu08eWtq/q7ZbeVHuGvt7ZR
         wxcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688566650; x=1691158650;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WDWjRluYFM3mzOmtAT5NxskA0RqCR9Q0xHAxLzDYI6Q=;
        b=jC6We1cb4BsR8RlVqYXFUfaTX4sKqAWAHQLImdSptZ5Tjs/UyN0/yi3cxcii8Mgx5a
         i29Dkv7DkniwvqJt5QCWBxoly8i1fDJDeymQmpUtdORO5HbtcNpZitQpDLeVlzQBeeDG
         yKw489xJ0Hbxscyqcw3SfRA2DZICCQ+i21SmmhvJfT5SX3HsEfCxDuhtvsf3Xj3wJ37C
         d8PZrC3mVLaGT7D45ZpWBy5MmLU4L+nzIAFGLFe1vH7/x1Jp1hVzUXtwXV0UHFzWDjyJ
         Bc4TPNGvgjAbAOI09V1cBxUtllEDOEvjeAFp2fTLsxl3iR91KI97iAHY3Z8b5coTUzbR
         jP/A==
X-Gm-Message-State: AC+VfDxoYSEiHtFScIJ+N24SIpOdXYrgZQjt8dF02npxVi2JrzXpDMnc
	XwcNm2GG40BfkzZBh+Q+z6IpLA==
X-Google-Smtp-Source: ACHHUZ5XPlff29EhdpKAoQIvbVbYkIFGTC1KnDDcA8GRrYOAyjREHvoSgUZXyUCAixVctnbm/B8Qrw==
X-Received: by 2002:a05:6808:1312:b0:3a3:6329:4cb7 with SMTP id y18-20020a056808131200b003a363294cb7mr20423361oiv.9.1688566649962;
        Wed, 05 Jul 2023 07:17:29 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id fe21-20020a056a002f1500b0066ebaeb149dsm16562980pfb.88.2023.07.05.07.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 07:17:29 -0700 (PDT)
Date: Wed, 05 Jul 2023 07:17:29 -0700 (PDT)
X-Google-Original-Date: Wed, 05 Jul 2023 07:17:25 PDT (-0700)
Subject: Re: [PATCH v3 0/4] Obtain SMBIOS and ACPI entry from FFI
In-Reply-To: <20230705114251.661-1-cuiyunhui@bytedance.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: cuiyunhui@bytedance.com, Conor Dooley <conor@kernel.org>,
  Ard Biesheuvel <ardb@kernel.org>
Message-ID: <mhng-48837062-b9f6-4968-be9e-9d3b352be117@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_071733_920347_363747C5 
X-CRM114-Status: GOOD (  16.72  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, jdelvare@suse.com, aou@eecs.berkeley.edu, weidong.wd@bytedance.com, allen-kh.cheng@mediatek.com, rafael@kernel.org, geshijian@bytedance.com, lpieralisi@kernel.org, yc.hung@mediatek.com, pierre-louis.bossart@linux.intel.com, cuiyunhui@bytedance.com, linux-kernel@vger.kernel.org, rminnich@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, angelogioacchino.delregno@collabora.com, linux-acpi@vger.kernel.org, tinghan.shen@mediatek.com, lenb@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 05 Jul 2023 04:42:47 PDT (-0700), cuiyunhui@bytedance.com wrote:
> Here's version 3 of patch series.
>
> V1: The FFI (FDT FIRMWARE INTERFACE) scheme has reached a
> consensus with the Maintainers.
> Please refer to:
> https://patches.linaro.org/project/linux-acpi/patch/20230426034001.16-1-cuiyunhui@bytedance.com/

From looking at that thread it seems that the consensus is this is a bad 
idea?  Sorry if I'm just missing something...

> Changes v1->v2:
> Adjusted the code structure, put the ACPI part under the RISC-V architecture,
> and put the general part of obtaining SMBIOS entry through FFI
> under driver/firmware/.
> Please refer to:
> https://lore.kernel.org/lkml/20230703-71f67eb66a037f5c0fb825c6@orel/T/
>
> Changes v2->v3:
> According to the suggestions of maintainers, the code has been modified as follows:
> 1. Modified the commit log.
> 2. Added description of "ffitbl" subnod in dt-bindings.
> 3. Add stub function to the function
> 4. arch/riscv/ and driver/firmware/ use CONFIG_FDT_FW_INTERFACE to control
> 5. Modified the ffi_smbios_root_pointer() function logic and printing
> etc.
>
> Yunhui Cui (4):
>   riscv: obtain ACPI RSDP from devicetree
>   firmware: introduce FFI for SMBIOS entry
>   riscv: obtain SMBIOS entry from FFI
>   dt-bindings: firmware: Document ffitbl binding
>
>  .../devicetree/bindings/firmware/ffitbl.txt   | 27 ++++++
>  MAINTAINERS                                   | 13 +++
>  arch/riscv/include/asm/acpi.h                 |  9 ++
>  arch/riscv/include/asm/ffi.h                  | 14 +++
>  arch/riscv/kernel/Makefile                    |  1 +
>  arch/riscv/kernel/ffi.c                       | 40 ++++++++
>  arch/riscv/kernel/setup.c                     |  2 +
>  drivers/firmware/Kconfig                      | 11 +++
>  drivers/firmware/Makefile                     |  1 +
>  drivers/firmware/dmi_scan.c                   | 97 +++++++++++--------
>  drivers/firmware/ffi.c                        | 42 ++++++++
>  include/linux/ffi.h                           | 29 ++++++
>  12 files changed, 246 insertions(+), 40 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/firmware/ffitbl.txt
>  create mode 100644 arch/riscv/include/asm/ffi.h
>  create mode 100644 arch/riscv/kernel/ffi.c
>  create mode 100644 drivers/firmware/ffi.c
>  create mode 100644 include/linux/ffi.h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
