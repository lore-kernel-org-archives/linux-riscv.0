Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F313C46CA1
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 15:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=e2i6R/tEPpjk9bV95hj04OVUybg6pqO2P9CwfnPaihU=; b=UkmwzBPrFTYKzk12FVBmpJ9/4q
	GzMioq1zMaI2pVfvucR5Pxnq+Q+ZXiwEKvCAoW/tdIg9/LgZNOBf4ZR6JHDteocDb/M+vNLyssaU/
	6Iy3ZgoKQ5FDPEWpyWp2EwQNRjO9soa0BILqszJkoA3O/4yT6buC9J08sLX0122+llK2tuCSFhZfH
	WCeJsolfoWrtx0M4cJ2aioBOv71Tkgnt1G3bpNwzhT2jUFpL2YVOsvtf8yr1rriHx41iyJ209yt9x
	/HV5sYFO+goyoiFQ4f70t5NbdEmPx1kPBDuPg/7SAXMkYfesJUg3vhruUV+Yu47ifnfVALmKasMri
	VVAHpsKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiFyh-00FjBL-1X;
	Mon, 18 Sep 2023 15:15:59 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiFyd-00FjAq-35
	for linux-riscv@lists.infradead.org;
	Mon, 18 Sep 2023 15:15:57 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-68fe39555a0so4267928b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 18 Sep 2023 08:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1695050154; x=1695654954; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CUs6HFUnfwlH9m43lQt0THXuuy+kd2UR6dIGxA62cAs=;
        b=Dw0Hc36XZAUHyr35zMFV+5o8OUZIClvu54MyCbDBhirp8n8na7D9uVA5Ac1F/KXX8X
         9Erf7tIqthwbR/FPKYyNeWqVoeeokg/rmxnpe1z0nH68rHppyCbOX9U/DIJe7HiJ6DGm
         P3+sifWC7Cc/bJpSFxOX0ONgDnvaIFvt0eZeMbL8GRdoMIXu6+tSgAdTQbV5RlDLAQlJ
         N/VnZiLo4oC/60mMJSNik57Z3mUOmmFLCZ2mMyHZtwIXDC7XvX+tJXCcSb3d29WH8Cvw
         o71TzlUh4ubNFmePfB/EHOB0pwqLJO6oLRSZcldX4bOsYmHkaygHhYpKVpdk4xdw6DNd
         /cqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695050154; x=1695654954;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CUs6HFUnfwlH9m43lQt0THXuuy+kd2UR6dIGxA62cAs=;
        b=ThTtX1eiWh5G9DlpCbvnwXo2YbVXk8CM/hw4aFMRA7FEumlWSafyT682EvqvO+pMmQ
         eRqDNLew42ZhQFeLqx0cYpDNQxTdTS17mBS+22Tc/6V7NK44udvgDd2sOpFV7meoLgLB
         7r5yuH5FVPrXB9ocOFyZmNGJAEupFRdcYZvVp5hnAnwGhbhzDObA4f2yzHdBK7QhRWnl
         holdkv3O0Ue08izP1m3c41OrvMP+pohqebctRiFVKsIm8VjqevSIrBfEt/65TWaY1o9J
         jqqSK5nSQgwqvrSulpjfNBinYCimcweCRjUwZu0SdEA3hq3QqWyG8NGa+DHM5SF8T4Gd
         SJZQ==
X-Gm-Message-State: AOJu0Yw/I5zrkjpLf3iEM/Su+UmseTQrORbixYU2A09xOpkK7JWHfL+G
	LMtIgBatCISg1t4RPifGxGvKtQ==
X-Google-Smtp-Source: AGHT+IF23OfeDgvn3PaP8Rc+ZEGLG07Md7s0qSdiD/SAlLyTTBbT1M04aGusIe9cDbvs031kJ3ObWA==
X-Received: by 2002:a05:6a00:1996:b0:68f:dfea:9100 with SMTP id d22-20020a056a00199600b0068fdfea9100mr11570653pfl.21.1695050154110;
        Mon, 18 Sep 2023 08:15:54 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id n17-20020a639711000000b0057412d84d25sm6842180pge.4.2023.09.18.08.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 08:15:53 -0700 (PDT)
Date: Mon, 18 Sep 2023 08:15:53 -0700 (PDT)
X-Google-Original-Date: Mon, 18 Sep 2023 08:15:51 PDT (-0700)
Subject: Re: more RELOCATABLE + errata code model issues
In-Reply-To: <20230918-retool-presoak-e47ed2f2b8d3@wendy>
CC: alex@ghiti.fr, prabhakar.mahadev-lad.rj@bp.renesas.com,
  linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Conor Dooley <conor.dooley@microchip.com>
Message-ID: <mhng-ffed6e42-d66a-47c8-b652-cd5d9fced9ab@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_081556_217334_E0F2969C 
X-CRM114-Status: GOOD (  20.82  )
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

On Mon, 18 Sep 2023 03:36:03 PDT (-0700), Conor Dooley wrote:
>
> Hey Alex,
>
> LKP reported [1] some issues with relocatable kernels & code models.
> You didn't touch the commit that caused the issues, so you didn't see
> the failure report I guess, but Prabhakar is looking for some guidance
> on what he should do to resolve the problems. Copy-pasting from his
> mail:
>> > All errors (new ones prefixed by >>):
>> > 
>> > >> ld.lld: error: relocation R_RISCV_LO12_I cannot be used against
>> > >> symbol 'riscv_cbom_block_size'; recompile with -fPIC
>> >    >>> defined in vmlinux.a(arch/riscv/mm/cacheflush.o)
>> >    >>> referenced by errata.c
>> >    >>>               arch/riscv/errata/andes/errata.o:(andes_errata_patch_func) in archive vmlinux.a
>> > 
>> I did reproduce this issue locally. The andes errata is not compiled as medany. The config is RELOCATABLE + MEDLOW. I can see the cacheflush.o is compiled with medany flag.
>> I can fix the build by adding a medany flag as below:
>> +#ifdef CONFIG_RISCV_ALTERNATIVE_EARLY
>> +CFLAGS_errata.o := -mcmodel=medany
>> #endif
>> 
>> But I am not sure if this is correct approach. Any pointers on this?
>
> The T-Head errata have something similar, so seems like fair game to me.
> Any thoughts?

We're using medany as a cheap way to get PIC, so anything that's 
pre-relocation will need medany.  We don't really have a good way to 
check that, medany isn't supposed to be ABI (we're really just abusing 
it here for PIC).  Thus none of this gets checked at build time, and I 
won't catch any errata pre-merge because I'm in QEMU.  So this is all 
kind of fragile.

So maybe there's a better way to do all that, but for now just adding 
medany seems like the way to go.

> Thanks,
> Conor.
>
> [1] - https://lore.kernel.org/all/202309111311.8tcq3KVc-lkp@intel.com/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
