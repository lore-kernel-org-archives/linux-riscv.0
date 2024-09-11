Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3324EE57C0
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Sep 2024 15:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=yOfHDC5T4Xn/rRvKUy3k+5MPp2Z9PYGDPvTrrupVUGA=; b=YIVGtfH/sPjjUUkrADl+NpxNu7
	IsWWDJJ3vEjZX69QTHQIBnvomnLs/nFcW2L5bIgGfgtG3Fm++RM4EUpdEKj8f/eYiYa/xTAKeieso
	3lhBqNGyUrtXZ3XzvTJixYnntmScSpcNFCBVZ4q/TEnYh1MeoiOYSsEs81ScqWiqVdGoOwO7XolbT
	PDrXb9q5fv4fHUKvewA/9NC4YMefI/UOMU/epdWMMnG4hioEIJrIshmL5/twZV23I8WvljL5hz/hW
	FuJ6aepRBH1wARmyPpBWYFhpZyRNrDvarMKGTnwCbaY4DiNqk5oEC9uNx0ryNgrje9jJiLPZ0DuGh
	JVNLmsCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soPgZ-0000000AFkD-0iQu;
	Wed, 11 Sep 2024 15:55:15 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soPQe-0000000AC1X-1ZMz
	for linux-riscv@lists.infradead.org;
	Wed, 11 Sep 2024 15:38:50 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-717911ef035so5342165b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 11 Sep 2024 08:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726069127; x=1726673927; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cy9rXS7F3MWBG42PuD8MXgNVZRn+jWhK5VWH+Xap2gM=;
        b=DGb0kcqsmvBYuCWoiWwxAwGluM5jhxqEx4cI3VOx/Gdl9Ntc/jwCevXv9dgkZsYQii
         3T3AH81329TVWmx4lDQxHcoEtOer14JY9A+Lg588s+kf9T2qmYxuL1P/GqaHE4QdENVA
         4nPeI9rk9exwfuHaA9sKFH/Q7/OttjDa1UAJqBikBXE3/KL3uwFTtdb3Hss/G5cl4OKa
         Aw1SItd7wt6du+JfbjzEQIeyIg6+4loMJGuqp8c+1KDp5PDT5GpjM0jcbmkgAih+gwLB
         DhsyOoKA+DhNnkNmOKBvdFVkL6OxaFkPNZa3xl7hgVy0AqoNjUqSqul2GEoMGKwZ1uxQ
         hOTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726069127; x=1726673927;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cy9rXS7F3MWBG42PuD8MXgNVZRn+jWhK5VWH+Xap2gM=;
        b=deSzaUoFidSUqB+4p/27oYoI/Q55z1axItG/LOjDedsyGlHpjy0oKdU+D/xMdEMgDg
         DJziGMR1HaR8dWwSjeOiwdupyzGVKiSdJQLaQgwQrEcm0glExd8XQwzjp+j9ZXBmy6yD
         Rn5dpekis2En5LLP5zc4rW2r54qelpna3Eq23U0JfSlRXL4faVxmTP+cJdJDiMQGhzGe
         1gZPxIVq5VGhDDbA73pD02HtNLJU+CgtsMcgFqJsLOzlzDXSbMJ2KaXRvSs+sjw9E9Ru
         FoQKowN6pUfAsBCzt0BMZgLe4CkpvdC7HObXr/VpPcOcZEuJ4MViTCD3XGxPgCbYjRIz
         xaxA==
X-Forwarded-Encrypted: i=1; AJvYcCVZ10FlQPggLNVyWDtu5ZdSbACiRG7u6f5kf+wBuBYSu81K5tZ3OCVBre6pvAz+HUyzPsbzfIdVsw4hxA==@lists.infradead.org
X-Gm-Message-State: AOJu0YynaH6A9n5K6bobBATegjKiH2WLK+rgUoW749iYdeHULj9nssHa
	QUIVnaKsaq1SBXZXBNG2oa5vlm3vMOuV2Wx4QEENiNwJSXVx3Y6uyiMdiybOfoY=
X-Google-Smtp-Source: AGHT+IH3YGpgUFpEBW6C5xGtli3mKPV+hUGYXvcbI1qVyLA3K8dnS2if2xzoBac50osXtDbGP4qDYA==
X-Received: by 2002:a05:6a00:1911:b0:718:d8dc:308a with SMTP id d2e1a72fcca58-718d8dc340dmr23321510b3a.12.1726069126476;
        Wed, 11 Sep 2024 08:38:46 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71908fc8205sm3138457b3a.21.2024.09.11.08.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 08:38:45 -0700 (PDT)
Date: Wed, 11 Sep 2024 08:38:45 -0700 (PDT)
X-Google-Original-Date: Wed, 11 Sep 2024 08:38:43 PDT (-0700)
Subject: Re: [PATCH 0/2] riscv: Fix race conditions in PR_RISCV_SET_ICACHE_FLUSH_CTX
In-Reply-To: <172606863202.959689.8576514936896750298.git-patchwork-notify@kernel.org>
CC: Charlie Jenkins <charlie@rivosinc.com>, linux-riscv@lists.infradead.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, alexghiti@rivosinc.com,
  Atish Patra <atishp@rivosinc.com>, samuel.holland@sifive.com, parri.andrea@gmail.com,
  linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: patchwork-bot+linux-riscv@kernel.org
Message-ID: <mhng-a59299d0-889f-4b11-b765-cc8460da7427@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_083848_674924_50E7EF02 
X-CRM114-Status: GOOD (  14.64  )
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

On Wed, 11 Sep 2024 08:30:32 PDT (-0700), patchwork-bot+linux-riscv@kernel.org wrote:
> Hello:
>
> This series was applied to riscv/linux.git (fixes)
> by Palmer Dabbelt <palmer@rivosinc.com>:
>
> On Tue, 13 Aug 2024 16:02:16 -0700 you wrote:
>> There are two race conditions possible with
>> PR_RISCV_SET_ICACHE_FLUSH_CTX. The first one can be seen by enabling
>> DEBUG_PREEMPT and using this prctl which will warn with BUG: using
>> smp_processor_id() in preemptible. This can be fixed by disabling
>> preemption during this prctl handling. Another race condition is present
>> when the mm->context.icache_stale_mask is changed by a thread while a
>> different thread in the same mm context is between switch_mm() and
>> switch_to() during a context switch.
>>
>> [...]
>
> Here is the summary with links:
>   - [1/2] riscv: Disable preemption while handling PR_RISCV_CTX_SW_FENCEI_OFF
>     https://git.kernel.org/riscv/c/7c1e5b9690b0
>   - [2/2] riscv: Eagerly flush in flush_icache_deferred()
>     (no matching commit)
>
> You are awesome, thank you!

I think the bot just got a little lost here, I applied the v2 from over 
here: https://lore.kernel.org/r/20240903-fix_fencei_optimization-v2-1-8025f20171fc@rivosinc.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
