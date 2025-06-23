Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11FF4C77B7C
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 00:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=IHEBoyoDUggHZuuK5t9hTj86KeimpnhatICk4jLVeRY=; b=O34COfp86DwebllblH8Uzxr+fb
	ZPFiZt+eglLH/05q/uYRqdJsI2Y87y6RHGUTdDAMF7GHpg+kLwtq68ysYr/TWEsQCa4bUGIEgAPhR
	Cas90LlWTC13uia8uAaB2zn5cNLPkL2ySd5zrcmcQN3N8BMeY7KoFfmGFUZVWSyHInQ3WphNNlDPG
	m4datJ7F5PAwiOBU1rrVvOG+gFyMFWtR0d9k0XzlI/LttpKkpPhOXwvCktnR911mR7emT5bcVKP+K
	PQRKsBEKudQ//2nj1lD4OIQsvTjJvN5ibP3/k3yz4bl/KtTPNv5w4MO+qYMzY/ohHN0KJY5CbdUH1
	i0NzFXrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTrbk-00000004IYP-1fkp;
	Tue, 24 Jun 2025 00:33:52 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTqgp-00000004AxJ-1zyn
	for linux-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 23:35:05 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2350b1b9129so34747265ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 23 Jun 2025 16:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1750721702; x=1751326502; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3C1HBX/7TnNGVwZTeosVdWMVJ7HcYu8ETqN6upndI5g=;
        b=ni77Zy4x3z6/6lL9ETb7qGMU4/1zbUMtKZUqTwGfy+7Ey1BYiCHCleGn+37PcQrCwt
         ooJZ7zLF/n+ClI35RA++yY4xFSB+qEMUPZtzRjSZ41D8xAxXiOqNpDvI4g/E9PO69Rje
         19i23iFBkZURiJbi6E/hGD/pGarBaQ6xOnQcyLi5J5OaRoVNDxhduKdLAGzZCZ0QXBoV
         tkV2HUurozIWMWjunpkEEbPgNZW53LcjyDHy5HMtIYPpHBdM6+oSGaYT/sZ0NyGJa3US
         b+TrW3ehlT3No6hkjtAiWCoowdcezPqxs7fRiGHo3+2iStjzD77KPSTz3s84VzqMQLOZ
         hjzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750721702; x=1751326502;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3C1HBX/7TnNGVwZTeosVdWMVJ7HcYu8ETqN6upndI5g=;
        b=ZdCXJKQyhUVFrUP0h/tZoPmKaW/kCytBtNfAYzru9CryNzigdNRhEh+rIerl5n43Xs
         5X6Cpyzc/skmib0nOlmWV4XuWqlOyfmQyUu/EaTNSv3R82jxbTWLwXTxQSFKOuAA5w++
         rOHbID3rvze+qWRTiiwRM4PWLX3uYxU1/fYO+cb3DYGkZxxpbJXZM81lgffi8uVfSy/B
         GibK6ADb9DelLAXT/aG4dZdZjbFmhaiYWFIZXeF/2wzT1suPYw/y9dYnX9l2GcKjbrII
         PmYht/GmUJjjmIcny1Bc9D+YY9wbZHH9G2Wtl+E357WelObtAQVmiprlqU3x5OknOzQd
         HBOg==
X-Forwarded-Encrypted: i=1; AJvYcCUG33QkEmDYsxrZZHZ7klXhzK6Dbfn54PRFGisRJDRtT2wtw31TCdnvlvTrTtFGeKsXHtbUJEMbTy4Ngw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyuih22JeoYoi37CCnS/BXSssJyYSi/Ches5RrZEkvYX116H+r/
	ALN/QJMwAa5AVcrgMR3inhc0iGHRm05RnVTFrzbC9a9CwYfNVLHsLitfex0JUKWaAhM=
X-Gm-Gg: ASbGncvtQbMq/XkQOqAKUBbOCyI6pSGRDq9NaRVp3vmjPILxOiCOtnsZPST39opCYaP
	Al+jflqn/ycNDXAY2fxHwH3t2xQ2T69F5Wlca85GjUXbZnLOm0PoYEGTCYi8h01Cw3FAOOlM6FY
	y0WWRdNBkcrPJhKcIuLnx0h/qdM/1hIRR5UGsg7yvpkW7w/JQFt+g0fGxQv1Io2tFH01vp8Q6PV
	JI7vMyhuDziTEexLz6a2mDHap2J+MhMGl1rwXrQHr5/SG0FXdSFM4XiGsNeYooHcmaAtNvD+F7s
	CbS4k1/xKmazfKl8x2FXTxtLUKzZSEDflVEio2MGX4kBCeoWUqfFRcbo4Ce7bdc3fhII35k=
X-Google-Smtp-Source: AGHT+IEWQhK1ybI3F/dHuMp7BGaRHJD1DU/MK1xVISPFslSP0vZBJeLT7Qmd8Fs0FSYtyxoSaqreEQ==
X-Received: by 2002:a17:903:287:b0:235:ed02:288b with SMTP id d9443c01a7336-237d98f1a1emr169782885ad.30.1750721702579;
        Mon, 23 Jun 2025 16:35:02 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::4:8d10])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-237d83d0bedsm92289545ad.67.2025.06.23.16.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 16:35:01 -0700 (PDT)
Date: Mon, 23 Jun 2025 16:35:01 -0700 (PDT)
X-Google-Original-Date: Mon, 23 Jun 2025 16:34:57 PDT (-0700)
Subject: Re: [PATCH] riscv: export boot_cpu_hartid
In-Reply-To: <20250619-rummage-cache-93f48564b7fb@wendy>
CC: klarasmodin@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, Alexandre Ghiti <alex@ghiti.fr>, valentina.fernandezalanis@microchip.com,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor.dooley@microchip.com>
Message-ID: <mhng-38FFE919-5F5F-4F1E-A06E-85946E791E4B@palmerdabbelt-mac>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_163503_520794_B5983431 
X-CRM114-Status: GOOD (  19.83  )
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

On Thu, 19 Jun 2025 03:25:16 PDT (-0700), Conor Dooley wrote:
> On Tue, Jun 17, 2025 at 02:58:47PM +0200, Klara Modin wrote:
>> The mailbox controller driver for the Microchip Inter-processor
>> Communication can be built as a module. It uses cpuid_to_hartid_map and
>> commit 4783ce32b080 ("riscv: export __cpuid_to_hartid_map") enables that
>> to work for SMP. However, cpuid_to_hartid_map uses boot_cpu_hartid on
>> non-SMP kernels and this driver can be useful in such configurations[1].
>> 
>> Export boot_cpu_hartid so the driver can be built as a module on non-SMP
>> kernels as well.
>> 
>> Link: https://lore.kernel.org/lkml/20250617-confess-reimburse-876101e099cb@spud/ [1]
>> Cc: stable@vger.kernel.org
>> Fixes: e4b1d67e7141 ("mailbox: add Microchip IPC support")
>
> I'm not sure that this fixes tag is really right, but I have no better
> suggestions

Seems OK to me, the driver is what causes the symbol to need the 
definition, so that patch is the first place we'd need this (unless some 
other drivers want it, which wouldn't be surprising).

I'm throwing it at the tester, it should show up on fixes soon.

Thanks!

> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>
>> Signed-off-by: Klara Modin <klarasmodin@gmail.com>
>> ---
>>  arch/riscv/kernel/setup.c | 1 +
>>  1 file changed, 1 insertion(+)
>> 
>> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
>> index f7c9a1caa83e..14888e5ea19a 100644
>> --- a/arch/riscv/kernel/setup.c
>> +++ b/arch/riscv/kernel/setup.c
>> @@ -50,6 +50,7 @@ atomic_t hart_lottery __section(".sdata")
>>  #endif
>>  ;
>>  unsigned long boot_cpu_hartid;
>> +EXPORT_SYMBOL_GPL(boot_cpu_hartid);
>>  
>>  /*
>>   * Place kernel memory regions on the resource tree so that
>> -- 
>> 2.49.0
>> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
