Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD2A9C54E67
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Mar 2024 17:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=scwaPgUKmDnpCUDkjKjHL1G/7VUImB8V4zGB0s1qCyI=; b=DryuUVe14rmRDUBW+TRlI/Okq/
	KCvIikolCsfIWEIEo1RIUzySTmaLTCcfMS9+IzfjwGuMjEv5QItT/2rbDKpuq3ZhJri0aOPU8Y76o
	IdI4E4+1PkUWDEUqan/lKN7f41NI8VFtab9XGH3uf1IPm2xfvqbfUjqjz9GrAfrFsqF7V1pqlFgFj
	jP7+/4LWweWni2ODGDzzEpHRB82JiEoeSioid19c6f4EwrRyOunea+pX1VgnCaA2N8sIm6bCxMqzg
	Q67IzQFD/PrK2054PvtViIlA2xdZQ/tRCMe7FrwXd2TXWQxbYLZO8SG/kEIEDVqKGc8jiN1OD4v2q
	ozBDkEew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlB7w-00000000xh6-0Tgk;
	Fri, 15 Mar 2024 17:13:52 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlB7s-00000000xe6-3Vr2
	for linux-riscv@lists.infradead.org;
	Fri, 15 Mar 2024 17:13:50 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6e6f6825102so1019338b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 15 Mar 2024 10:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1710522823; x=1711127623; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zc35f3DVjPDaoxA34gP7gqIyNIz6eucHoZmbR7gwzIU=;
        b=t/kXxFeJy7C7F38CMbNkIPPNoYXXMMsGdtKvlL/GGV+J2bGG1qxLecKObERz8u5XxP
         wENlI66BxWZnRQKBChMp43fwQXTyEtOVSJ47cgj/rp7wCH1gLPBmITYTJa2y/5ouwJ1G
         TtObACB1OUqISkKiVLSzfR3LGl01T/gHLGGrLME04tu1ggQhfAJTJBGITKJCadABpYWP
         SSuxukTrYdpSu2vt03Eu9XCdKxh/03GgjK9bbYNHOyHz3wzBNCOv+gLYWpCBaByJORZQ
         u4kmwuWndKzBTYziCnu+cNIPy1AyuAqQeA4B1Js3N1LOdM2vWjw/4tEDa/NitQiEPOSN
         8eoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710522823; x=1711127623;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zc35f3DVjPDaoxA34gP7gqIyNIz6eucHoZmbR7gwzIU=;
        b=ewBGXYxr9TeV1bxjXUz3JuIJ5ZGmcE0RzEfnPerdeAB2NRz2ewxLv5gMFgEbFFFE8k
         7VfPccQ6pxFA32Hb/ppsGKg0EijEr0JBi60Wd/1jd/fI9asv+sEI7V0b36UhudXV9XLS
         nrqQti//StM2/Npthc5KjVdskMln4xqGtOX3GbHLWPf0E4bJN/KEp1eC/eRrLnE5clPf
         wPZDTP05wPPwPAkPg4rsmfeop8x2Knb4+FbdVEStGq9V97VIRCcczfRlkKIdOELeY2WZ
         jmzN0ViJYbHCFWKaMCKzg4mLvHHF7g6I9tCkVLcS8xH/y3w19MrlOlpelrgDVvBoHoMp
         PAYg==
X-Forwarded-Encrypted: i=1; AJvYcCUxTadZOykfJjLQsvQYtQUKOZ6FQsZtVHWJmARxmgV3QORWR/RsteXcKE1DEgI0i1XFoIvPGOkMr5LJnb9IgdCi7ZvfbiCVd8tOgiQrMqqJ
X-Gm-Message-State: AOJu0YxYfzajAU/AEQPgHB+2ozxKqShNb8axKyavY5ZgUZ4VtrChwsHf
	6rPGl3jw8CZONju9thlAgA2ZiOntWtt4V8S82xdyjjQZ4W8xppeFGS1lQfFYmX9MefthHAO4s2r
	S
X-Google-Smtp-Source: AGHT+IHPwRwCrXAn3nRslKddvfiuhhbKJi8Iu271fDD/QcfPvpbSTe0krho6bBCJ9L1Q6iqwxpTGrQ==
X-Received: by 2002:a05:6a20:12c2:b0:1a3:50fb:4f7c with SMTP id v2-20020a056a2012c200b001a350fb4f7cmr1930770pzg.29.1710522822795;
        Fri, 15 Mar 2024 10:13:42 -0700 (PDT)
Received: from localhost ([50.213.54.97])
        by smtp.gmail.com with ESMTPSA id r12-20020a62e40c000000b006e6fc52ecd0sm1361552pfh.123.2024.03.15.10.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 10:13:42 -0700 (PDT)
Date: Fri, 15 Mar 2024 10:13:42 -0700 (PDT)
X-Google-Original-Date: Fri, 15 Mar 2024 10:13:31 PDT (-0700)
Subject: Re: [PATCH] riscv: Fix compilation error with FAST_GUP and rv32
In-Reply-To: <b7f3fb0c-6c26-42c7-858c-231f4982a761@infradead.org>
CC: alexghiti@rivosinc.com, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: rdunlap@infradead.org
Message-ID: <mhng-25af42ad-53f6-4f13-9613-8e1d463df758@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_101348_896158_DE5F0007 
X-CRM114-Status: GOOD (  13.93  )
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

On Mon, 04 Mar 2024 08:47:43 PST (-0800), rdunlap@infradead.org wrote:
>
>
> On 3/4/24 00:02, Alexandre Ghiti wrote:
>> By surrounding the definition of pte_leaf_size() with a ifdef napot as
>> it should have been.
>>
>> Fixes: e0fe5ab4192c ("riscv: Fix pte_leaf_size() for NAPOT")
>> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>
>
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> Tested-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

Sorry for being slow here, I just realized this was a result of a 
fixes/for-next semantic conflict.  So I've merged this (on top of the 
broken series) into for-next, but I'm going to hold off on sending 
Linus a PR in order to let it get through the testers.

> Thanks.
>
>> ---
>>  arch/riscv/include/asm/pgtable.h | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
>> index 25ca14f6942c..54d26a07fa63 100644
>> --- a/arch/riscv/include/asm/pgtable.h
>> +++ b/arch/riscv/include/asm/pgtable.h
>> @@ -439,9 +439,11 @@ static inline pte_t pte_mkhuge(pte_t pte)
>>  	return pte;
>>  }
>>
>> +#ifdef CONFIG_RISCV_ISA_SVNAPOT
>>  #define pte_leaf_size(pte)	(pte_napot(pte) ?				\
>>  					napot_cont_size(napot_cont_order(pte)) :\
>>  					PAGE_SIZE)
>> +#endif
>>
>>  #ifdef CONFIG_NUMA_BALANCING
>>  /*

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
