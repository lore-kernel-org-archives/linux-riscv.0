Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A5DC4828D
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Feb 2024 19:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=C5usibmv7jdaPFpb6W4/Mrd1BVI2vlGSQSKSS8WwJJ8=; b=Xi8tH/Iq9nzOv6/j9w+JYYpUxa
	5H4/wstK1rIHRLJsJ2q81fjJEkrMdWJrPMVgPA0Ba5nCp+ZkQDebh+WKDWPjncFZU8HAVHq2syzTC
	wD5hJuJ+z7Fv6i86E1h8EsLHhYFCpKRbmsW2LKZl40HBg01P3HGAk052KaGm2Rv0pT80ShgRUUpkk
	GSLpu1pfP/cdV9AoikmFTAmlFtIpvoJz1N9AAQzVimX+uoVQZ9tdl4hm3KMSYMD105nUTnRQT8ypX
	ylwvy5YfPneNBrcuubeiKa1T3o8PzKv5idRhYmA38bi/EGvW0Awc+qcPwqcLWqa8WpEEQanhFvf2e
	XKU7M8/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXnhV-0000000Bcmj-3UaT;
	Wed, 07 Feb 2024 19:35:17 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXnhS-0000000Bcln-2IkY
	for linux-riscv@lists.infradead.org;
	Wed, 07 Feb 2024 19:35:16 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6e04eceebb5so708053b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 07 Feb 2024 11:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1707334513; x=1707939313; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5DNJ0YWZMQGJUiB/7nqMNUBTgtfVhRG2xEzHjBsppl0=;
        b=VAM7lQP/E4AmFFYcDq57DcQLMuHMrvLhJOVGPDHe/SAt45Yk9epksD+tb76HBo3z/h
         Ha4pdCxUCkNVkBuz7DqtH1ngimQth2kVj02fEoNOAVZAlluYmoBAVrKJeto68WRR0xMV
         +IdlVPRz+2bjBByEZqNs5CnQT6jr85cvTdSS8rDeEVpdICG7iFn0bORzLQa6vkt/2gGj
         Joe+EKgIw2HFknLhnNY5pUa6I+qldVhTeypmiHguBXy2GqdEJD49iXACCHMjJf2GNh0p
         TIo2RQ5b+A0qSx1rRiq9OsVFZmYYFxQEN5yqoQ3nEdlB4xx9qPvj7Gw9ELc9hK31gsXe
         birg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707334513; x=1707939313;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5DNJ0YWZMQGJUiB/7nqMNUBTgtfVhRG2xEzHjBsppl0=;
        b=X1zl3QI5M5JTgxlWWEeK3m29Ee0bsclpl8xggi4ddZ02hY2cfWIt8hic0jQ+gJfUA0
         hPRM/cFSaqgQKznO11jZ+WGgL0lsQhsf7l8ithFtqhwLnzMxvJNIHXEjEkn6y6eoZToa
         v2i53JBWnTRPZeamXqgzJp2m88EPgxVCXqBjScHFQqKcXGvL3ZkrL6GRCmanCui9WbEU
         TVUz+qBH1kQfcHucC2yOKYr4NGq9ipKEJ4vMnmofY6kenWDwgBJK6kUYgyN1/t5itX2l
         YaDLeBvD8lOFEkLIBxVa8b8gqT0n1m7EOE9tCLqfwYm3jowXF/GWcrlZRfXcsVIPzCtW
         M/7g==
X-Forwarded-Encrypted: i=1; AJvYcCVZltYYYPJ7HvdAXbFoLNiJC8GzTjaZ6L9BiXD03s/BgoNNscJDCzn3izsVnqicPU5ICzmby/0HI+ZyFRMtDtam+7uc6zsvKAKAMMZvlEU2
X-Gm-Message-State: AOJu0YzHoYHLp+kEZrMes2+ZcBRzaDBWEjSwRLRplc875uCqOA0oRYYx
	QsCMK8Q+5LDynw32Y9Jto8lG8zSbxb52fwXgaploYkaS3bG7KOOLHuiAOeAL+f8=
X-Google-Smtp-Source: AGHT+IHecxI00C0AysG9jk2vFisMXFVveXNnX/H4oDlFL2OOUFQ/AEV1QOpSJXJ9aHab8uyRYIlfKQ==
X-Received: by 2002:a05:6a20:a092:b0:19e:987c:78a7 with SMTP id r18-20020a056a20a09200b0019e987c78a7mr4101823pzj.32.1707334513324;
        Wed, 07 Feb 2024 11:35:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW7PM5eZAdnwqPrU9TC7lCb+5kyWOLdybcxqg3gwdxj5FVcxgrXFDgek0GyZpZ25vYnaquKPDeXQYeJBu03dxalZ1OiLKQbCmuOYYkKi4snVeuasLujaeCS7Vdcz9MwBWHwGg/DodlOcuuV0ckC/ciHANKGB2iQrxKivw32mbrxR+7hXyb9UvMJWdF5se7BjgDEgBM2AUxmSWE/Fn2OO3Zr5GH3aigEDwVXPiaRPTJizzIP
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id j17-20020a056a00175100b006d9b35b2602sm2024683pfc.3.2024.02.07.11.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 11:35:12 -0800 (PST)
Date: Wed, 07 Feb 2024 11:35:12 -0800 (PST)
X-Google-Original-Date: Wed, 07 Feb 2024 11:35:11 PST (-0800)
Subject: Re: [PATCH -fixes] riscv: Fix arch_tlbbatch_flush() by clearing the batch cpumask
In-Reply-To: <a21e4253-9ef6-4c44-917c-02742440d192@sifive.com>
CC: alexghiti@rivosinc.com, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, jszhang@kernel.org, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: samuel.holland@sifive.com
Message-ID: <mhng-e8dda78d-2d87-403f-a969-2b5ec99da094@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_113514_823573_7DC20073 
X-CRM114-Status: GOOD (  19.42  )
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

On Wed, 07 Feb 2024 11:23:55 PST (-0800), samuel.holland@sifive.com wrote:
> Hi Alex,
>
> On 2024-01-30 5:55 AM, Alexandre Ghiti wrote:
>> We must clear the cpumask once we have flushed the batch, otherwise cpus
>> get accumulated and we end sending IPIs to more cpus than needed.
>>
>> Fixes: 54d7431af73e ("riscv: Add support for BATCHED_UNMAP_TLB_FLUSH")
>> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>> ---
>>  arch/riscv/mm/tlbflush.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
>> index 99c3e037f127..c8efc3f87a0f 100644
>> --- a/arch/riscv/mm/tlbflush.c
>> +++ b/arch/riscv/mm/tlbflush.c
>> @@ -240,4 +240,5 @@ void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
>>  {
>>  	__flush_tlb_range(NULL, &batch->cpumask,
>>  			  0, FLUSH_TLB_MAX_SIZE, PAGE_SIZE);
>> +	cpumask_clear(&batch->cpumask);
>>  }
>
> This patch doesn't apply to fixes -- it looks like it was based on "riscv: Call
> secondary mmu notifier when flushing the tlb"[1], which has not been merged and
> would go in for-next anyway. Otherwise:
>
> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
>
> [1]: https://lore.kernel.org/all/20240124080325.2324462-1-alexghiti@rivosinc.com/

Ya and for some reason it trips up "patch -p1", which applies it to some 
other function.  I just merged it manually a few minutes ago and it's in 
the tester...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
