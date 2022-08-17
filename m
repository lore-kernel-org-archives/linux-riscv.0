Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0C5FC25B08
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Aug 2022 04:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=AqF/tP4ekB/JDuENxM2xnEcDzFV9eUOwnlZewbt7IJg=; b=T15kcz3tbVjVMLU7ckzfHrSxzw
	lpGhgVG2E2BpqUlZG55IpSZ7zdvUVDCsC6qWCgFlyLC+G5y4S0jV4jSUczMHVgiJPlVer0FbpBoV1
	Wdi38G4TznD7XNQZSknizVWqkUqQl0YOnppj56JD0vJHSs1e+51C9Nv7qVulOxf4hwbfTGS7gFEHo
	BuMdt8Q5xbcTQFoN2Nt3KnKyFSFVpRe0VdSFSVLYxsIlsBjtoIVXdEyA/kv+ZkBSDshAH+xU5O3+e
	bSm1NrxVHCAZxLnBzl7HeraSZE4xd319B4VBNNUzC+Kx/E34QhuHtgEd2JvVQdleHdLDxb+P5joap
	ZmORUhcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOAgZ-00AMmK-6j; Wed, 17 Aug 2022 04:29:43 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOAgV-00AMil-00
	for linux-riscv@lists.infradead.org; Wed, 17 Aug 2022 04:29:41 +0000
Received: by mail-pj1-x1030.google.com with SMTP id d65-20020a17090a6f4700b001f303a97b14so781689pjk.1
        for <linux-riscv@lists.infradead.org>; Tue, 16 Aug 2022 21:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc;
        bh=l7bruH7M7kCtSBuzafzBrFu70kZSFm/jLPtQDrjL9yk=;
        b=q2td9uCN9OVfImZm2lfHuKG1sOYdDqpR/UnqrhhxftIYNW3puoZ3q/OzG3MJA0rEfG
         BEZg95xCoMnq2qf4B64PNJIuvkgrWqnsIcwpg9yAC45pzTF4JyXdGkCKHO+5AZXaniAX
         fMkl7or4DHSAANfQzrczFW0TpmpaJUv/bKXDpRfTir+sQlM8b8VbAOo2g0MhJXlqDwgj
         /0vq1sM6CAB8XffSDReLsdfpPGJ3oW1RDcdLQ0g0Z15I0gmpr0psNHHnfOLMSsBR6ktq
         To0lIflsaJYuUqoRXsxe4K5hsV3NXG4pjxmPHop6JigZyNo1r4ysYDxYr5f0+cO3xexa
         Nu7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc;
        bh=l7bruH7M7kCtSBuzafzBrFu70kZSFm/jLPtQDrjL9yk=;
        b=GCwNg9Y1kYk7YM4GR3tqTKSNDP0GFWdVD/osUzTdUvAXL5UzhSV9ekqEETSBcE+gtG
         tzF+FyDSGJMEcDKv5+Au79u84u2b41WyMAHoZGpB014j3BIoHt9Qe2cMr1uhjS8qIOsS
         +e/BDX6qjv4W0fhRkKghBw3HWBd3uDhCoAFA3qUjK5PytpUnAllqoYTPXuChmjv8FD+H
         J6bOqz4XbhoE0ALFoV9K7SWkHy6SeN1+yRwApD73KAuxt3p2zXh17hnTHbI115jnXon/
         D3eDw52nob+Ucd/cvqbUWJwEvwAD7/8LULbFnLcN99wXgeWnj7NGltnuDO5Yz25f3RrE
         I4KA==
X-Gm-Message-State: ACgBeo2qibSNMcxVyHTk9uhWBPpVRCiGtaMj7vjGBqgcxrcLxMaIRUkM
	DRchqNqQAlAWuJe5gb/9S0W96w==
X-Google-Smtp-Source: AA6agR7sr8hoPYZmOS6WDCPjtmFGhduiunUSfLYE/vb680nCFrOjRAhqzCy2Bxhj9tIvSeTGZs/cuQ==
X-Received: by 2002:a17:90b:1d44:b0:1f7:6f05:639e with SMTP id ok4-20020a17090b1d4400b001f76f05639emr1879028pjb.99.1660710577189;
        Tue, 16 Aug 2022 21:29:37 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id r15-20020a17090a0acf00b001f559e00473sm399449pje.43.2022.08.16.21.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 21:29:36 -0700 (PDT)
Date: Tue, 16 Aug 2022 21:29:36 -0700 (PDT)
X-Google-Original-Date: Tue, 16 Aug 2022 21:07:01 PDT (-0700)
Subject: Re: [PATCH] riscv: Ensure isa-ext static keys are writable
In-Reply-To: <CAOnJCU+Gx44ESHWyku7Kb6u5QnzjXiZcat5XmVWjksdFpcQ6nA@mail.gmail.com>
CC: ajones@ventanamicro.com, linux-riscv@lists.infradead.org,
  kvm-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, daolu@rivosinc.com, jszhang@kernel.org,
  Conor.Dooley@microchip.com, re@w6rz.net, apatel@ventanamicro.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: atishp@atishpatra.org
Message-ID: <mhng-dd00cb27-4162-48aa-834d-30fb90e194cf@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_212939_269359_EFA89CB9 
X-CRM114-Status: GOOD (  18.05  )
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

On Tue, 16 Aug 2022 16:41:46 PDT (-0700), atishp@atishpatra.org wrote:
> On Tue, Aug 16, 2022 at 9:31 AM Andrew Jones <ajones@ventanamicro.com> wrote:
>>
>> riscv_isa_ext_keys[] is an array of static keys used in the unified
>> ISA extension framework. The keys added to this array may be used
>> anywhere, including in modules. Ensure the keys remain writable by
>> placing them in the data section.
>>
>> The need to change riscv_isa_ext_keys[]'s section was found when the
>> kvm module started failing to load. Commit 8eb060e10185 ("arch/riscv:
>> add Zihintpause support") adds a static branch check for a newly
>> added isa-ext key to cpu_relax(), which kvm uses.
>>
>> Fixes: c360cbec3511 ("riscv: introduce unified static key mechanism for ISA extensions")
>> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
>> ---
>>  arch/riscv/kernel/cpufeature.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
>> index 553d755483ed..3b5583db9d80 100644
>> --- a/arch/riscv/kernel/cpufeature.c
>> +++ b/arch/riscv/kernel/cpufeature.c
>> @@ -28,7 +28,7 @@ unsigned long elf_hwcap __read_mostly;
>>  /* Host ISA bitmap */
>>  static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
>>
>> -__ro_after_init DEFINE_STATIC_KEY_ARRAY_FALSE(riscv_isa_ext_keys, RISCV_ISA_EXT_KEY_MAX);
>> +DEFINE_STATIC_KEY_ARRAY_FALSE(riscv_isa_ext_keys, RISCV_ISA_EXT_KEY_MAX);
>>  EXPORT_SYMBOL(riscv_isa_ext_keys);
>>
>>  /**
>> --
>> 2.37.1
>>
>>
>> --
>> kvm-riscv mailing list
>> kvm-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/kvm-riscv
>
> Thanks for the quick fix. Tested with kvm guests booting in Qemu.
>
> Tested-by: Atish Patra <atishp@rivosinc.com>

Thanks, I hadn't realized how static keys work but looks like having them as
__ro_after_init was always bogus.  Sorry to break stuff, looks like I should be
loading some module (probably KVM, as it's in the defconfig) during testing.

This is on fixes, I'm planning on sending it up later this week.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
