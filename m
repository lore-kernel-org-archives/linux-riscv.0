Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CF8DC4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 23:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Xt6KgZ+e1vts3lpcGtX/OBoNzFDyPXOwcrrqcPtipw0=; b=BJXShNomQk2hbRAVVDAVVdgUjQ
	U1KlvNoVcD7r/7VNxTyA0TkRWngUHQ8MMFMa9YXufvzuEdfAi7W4biTrcKm2DQLptac9NhxT0Bi9H
	XXCxjIjJc2B/TdV5NRS6fijO6u2Me2XKIY5G0c+1SggiBqRBCzud576zEdWETYKBmzkYa8nTYS4ti
	QArghVeH0APl437cd8sOgGrcSlq7pitOiW4kLCkFHlQLCAD394sHMu9tPCXToWvRhht+fZyMKMf1i
	N9MPlvTUm6qYdc/KZDB4SH7/7/cMeejXZn7YjkluyCNTwW5jdBXttkR32hO9VL/I9+tI/aZBE8cJ+
	K3L0xvPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3QLH-00F8bR-52; Thu, 08 Dec 2022 23:30:15 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3QLD-00F8Vh-JA
	for linux-riscv@lists.infradead.org; Thu, 08 Dec 2022 23:30:13 +0000
Received: by mail-pf1-x42a.google.com with SMTP id 140so2486419pfz.6
        for <linux-riscv@lists.infradead.org>; Thu, 08 Dec 2022 15:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9xjcdkPHdm6uKkgcgf2wZxDGHKg/K8iOgm6bCXEn/oQ=;
        b=rb5booq/HHdSewBCekfBW2j8iIo4ZxuYd7rba/kPyLbrSTVQ/N+gk8E8V90ISLagt8
         43UERn2GsQVbsvToJftGQMxF01nC8iLFbvTjt2YthHiu3RCEHoga3QFwA29gjNEdUxDa
         JFFyD2YYXauV+1tjc6UoWjtZWR8TKqzSiFae91cjyhBF3c2XgraZTyxU8MNxGRVpy8kr
         2u2QrGtPwQTk9tZamvfsyPStS/ootU8voYx9kWfrBxHa7aQZ3z+oUTSA4tyuI5pdBXVK
         jyKSEEbm07aXR9ii2qXKosDYfcc6OfcSkmTHMYWf49aGsqjXQ2fDRZYQkWLEvLIqu2y/
         qtUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9xjcdkPHdm6uKkgcgf2wZxDGHKg/K8iOgm6bCXEn/oQ=;
        b=HqnPRWeViuGFwJv9yb6UHDoULJW2D1uzaqA+m8M0ntJkJRqozr2qyhtUuCisbfPKzd
         dc10bww31S8I6w9Zp4k/SqnIw4o91DtuAaxQ1Ixe8Uc5TSuKElx60iP4n0iw31YLqD78
         Oq+pe76NpLiVxA9UDRMreLqfSip3pgTxnWhwK6C51gdxnpi4CriVvO4RzzjBHt5x7a1n
         RR55myX/74GU56wluobQXrnpy2EMlW600gCSZQnLmGGsIDyrmEDG+ltQM+w3zfMWdB3y
         PRJ+ALOPfbhRzuNr+0GjcPjczKFniO2S32HBdxjl2u36eRrW0GyAUqHLx0NobnjyAzaN
         o/Qw==
X-Gm-Message-State: ANoB5pm5VeZ6ya5/02Kdb2CaqKUeK6a8bm5xNy6NTh/uZihiGj8wiOmX
	hOe9rcdVEEP0porLAfjDpR+IQHfYlIvSVh+2
X-Google-Smtp-Source: AA0mqf4jlf5nNpHTGQ5fF5ipKRiwgNSh829jsjgr+RN3u82vvhuvmYKHy6QyXAd4yoda9cNA1qDUYw==
X-Received: by 2002:aa7:9555:0:b0:576:c9a1:ec35 with SMTP id w21-20020aa79555000000b00576c9a1ec35mr4679501pfq.17.1670542208857;
        Thu, 08 Dec 2022 15:30:08 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id c2-20020aa79522000000b00575acb243besm52081pfp.1.2022.12.08.15.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 15:30:08 -0800 (PST)
Date: Thu, 08 Dec 2022 15:30:08 -0800 (PST)
X-Google-Original-Date: Thu, 08 Dec 2022 15:29:52 PST (-0800)
Subject: Re: [PATCH V3] riscv: asid: Fixup stale TLB entry cause application crash
In-Reply-To: <Y3fxsWPLPlKGfMBj@curiosity>
CC: guoren@kernel.org, anup@brainfault.org, Paul Walmsley <paul.walmsley@sifive.com>,
  Conor Dooley <conor.dooley@microchip.com>, heiko@sntech.de, philipp.tomsich@vrull.eu, alex@ghiti.fr,
  Christoph Hellwig <hch@lst.de>, ajones@ventanamicro.com, gary@garyguo.net, jszhang@kernel.org,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, guoren@linux.alibaba.com,
  apatel@ventanamicro.com
From: Palmer Dabbelt <palmer@rivosinc.com>
To: geomatsi@gmail.com
Message-ID: <mhng-1d55338a-53a1-42eb-bf5c-91655fde2734@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_153011_873239_139973F2 
X-CRM114-Status: GOOD (  22.93  )
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

On Fri, 18 Nov 2022 12:57:21 PST (-0800), geomatsi@gmail.com wrote:
> Hi Guo Ren,
>
>
>> After use_asid_allocator is enabled, the userspace application will
>> crash by stale TLB entries. Because only using cpumask_clear_cpu without
>> local_flush_tlb_all couldn't guarantee CPU's TLB entries were fresh.
>> Then set_mm_asid would cause the user space application to get a stale
>> value by stale TLB entry, but set_mm_noasid is okay.
>
> ... [snip]
>
>> +	/*
>> +	 * The mm_cpumask indicates which harts' TLBs contain the virtual
>> +	 * address mapping of the mm. Compared to noasid, using asid
>> +	 * can't guarantee that stale TLB entries are invalidated because
>> +	 * the asid mechanism wouldn't flush TLB for every switch_mm for
>> +	 * performance. So when using asid, keep all CPUs footmarks in
>> +	 * cpumask() until mm reset.
>> +	 */
>> +	cpumask_set_cpu(cpu, mm_cpumask(next));
>> +	if (static_branch_unlikely(&use_asid_allocator)) {
>> +		set_mm_asid(next, cpu);
>> +	} else {
>> +		cpumask_clear_cpu(cpu, mm_cpumask(prev));
>> +		set_mm_noasid(next);
>> +	}
>>  }
>
> I observe similar user-space crashes on my SMP systems with enabled ASID.
> My attempt to fix the issue was a bit different, see the following patch:
>
> https://lore.kernel.org/linux-riscv/20220829205219.283543-1-geomatsi@gmail.com/
>
> In brief, the idea was borrowed from flush_icache_mm handling:
> - keep track of CPUs not running the task
> - perform per-ASID TLB flush on such CPUs only if the task is switched there

That way looks better to me: leaking hartids in the ASID allocator might 
make the crashes go away, but it's just going to end up trending towards 
flushing everything and that doesn't seem like the right long-term 
solution.

So I've got that one on for-next, sorry I missed it before.

Thanks!

>
> Your patch also works fine in my tests fixing those crashes. I have a
> question though, regarding removed cpumask_clear_cpu. How CPUs no more
> running the task are removed from its mm_cpumask ? If they are not
> removed, then flush_tlb_mm/flush_tlb_page will broadcast unnecessary
> TLB flushes to those CPUs when ASID is enabled.
>
> Regards,
> Sergey

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
