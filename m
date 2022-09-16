Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B77ECAAD8
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Sep 2022 20:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D4lx11bWH3OmwrKxoxU69IiqvshJKhRCjoqIrfCiiwI=; b=hER7krFJC3Guk6
	srVij/C8Db3MZV3G/fSs5T++aqvwmLdefS4HZhXmhE/x9Ua5TpE0Ud7bezIaWLF1ntuSDXaI6Y2Ih
	3TIkaZNYPCvMySmZVmEWkiAW5CvXuDWQGhbo6a8cXk6n+ACom7239v8aXakBx58Hk7ieV94/uV2tw
	7nZYZhj67bc79WFyWGh5uU3W0m9FtKuCeU26pvuVClNK5wn2F7V2Y2w7Ph4ToibmFBRm/aqZgwEKc
	psziJEs2dRGbvP7w4YXNE5oFJL3aE+xcpipCQJBBNVt9GaOXGSwZYJyX9rd3n2C9eKyb6PkdC+rIY
	czn+mJkEuOLFD9Kfg6tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZHeo-00GZIg-IE; Fri, 16 Sep 2022 20:09:50 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZHel-00GZGP-9L
	for linux-riscv@lists.infradead.org; Fri, 16 Sep 2022 20:09:48 +0000
Received: by mail-lj1-x234.google.com with SMTP id l12so27210548ljg.9
        for <linux-riscv@lists.infradead.org>; Fri, 16 Sep 2022 13:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=TsMblmh+whw0Y6G/T+5phEJp9Ji8yHMxQQQ7u1lRyXY=;
        b=Ncmgb346gJscq3aycEEXnWjiY0CHuVAHV0RlaoWLU+j1MTRJpDoAsoEjr92c1ImEQE
         wUR2uXMmhrSr2EcRxP/0WQVj2BSKwChTvWjlVAhXdp87Y7fbMjzsZxXfpGgOfEtIIVq+
         iI+UrAMASxvdzeBx3yA0yusS+tMecl61oCiMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=TsMblmh+whw0Y6G/T+5phEJp9Ji8yHMxQQQ7u1lRyXY=;
        b=k38QgsvQq22W4sMbbTW2RCzVbcg0NWGYocfeSO0gFE+D+kCAQzflWK83P3yK2Mbulp
         p+bL349kTZtZ9+zF1zknk95VI+ArjrWkmEWPrOfy+SL5LDAwtoN55Wyw9B2FN/DlQb8p
         vsr/vq04cpCklY+SSDaxOzljwfcU5jpTTtX5+zzpaYwhQSbl+A5LOvC+mN2n6M1jml35
         bv0BRi4A7hAMV7/EGCgmigFArRCfaTqqkx+EZkMF+jmmBTGQ2awqEjW+6NJJ24dWhGGy
         Tg8Nz4MAQET5l/Bhiz/PwVXCFBsFJMVDOUDUsbEZ9EddV3GnuSth3Moxcv3xYNS271tV
         w29g==
X-Gm-Message-State: ACrzQf3A8PxdknSe/zg1+T/C4OXJtEDuS6kNtw35ZZlVZwf650z2ICFW
	+I2L/SrKwazBrS9jWr3Gizo7UxQW+3mEhRHI9ug=
X-Google-Smtp-Source: AMsMyM6mrGUv1KlzLhI6+A/9dsoe52RYA27XIKb+Ax83wngsXjl/9YgyippK7o/vNkTqTEPosZHVtQ==
X-Received: by 2002:a2e:818f:0:b0:26b:e97e:d830 with SMTP id e15-20020a2e818f000000b0026be97ed830mr1845401ljg.420.1663358980642;
        Fri, 16 Sep 2022 13:09:40 -0700 (PDT)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id n4-20020a05651203e400b00492d064e8f8sm3653655lfq.263.2022.09.16.13.09.39
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Sep 2022 13:09:40 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id i26so37266805lfp.11
        for <linux-riscv@lists.infradead.org>; Fri, 16 Sep 2022 13:09:39 -0700 (PDT)
X-Received: by 2002:a19:4f45:0:b0:49a:63c9:190d with SMTP id
 a5-20020a194f45000000b0049a63c9190dmr2001777lfk.61.1663358979664; Fri, 16 Sep
 2022 13:09:39 -0700 (PDT)
MIME-Version: 1.0
References: <mhng-f5d21762-1321-4d35-927c-d47e0749abc0@palmer-ri-x1c9>
In-Reply-To: <mhng-f5d21762-1321-4d35-927c-d47e0749abc0@palmer-ri-x1c9>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 16 Sep 2022 13:09:21 -0700
X-Gmail-Original-Message-ID: <CAHk-=wihdDOSVVi1gBYo+rcJ7dG6tvN7mEU=XLir8WiEdR1kQQ@mail.gmail.com>
Message-ID: <CAHk-=wihdDOSVVi1gBYo+rcJ7dG6tvN7mEU=XLir8WiEdR1kQQ@mail.gmail.com>
Subject: Re: [GIT PULL] RISC-V Fixes for 6.0-rc6
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_130947_349372_75F6AE14 
X-CRM114-Status: GOOD (  12.24  )
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

On Fri, Sep 16, 2022 at 8:31 AM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>
> I have one merge conflict as a result of a treewide fix, I'm getting some odd
> output from just showing the merge (it's showing some of the fix too), but I
> think the merge itself is OK.  My fix is to keep the write lock
>
> -       mmap_read_lock(mm);
> ++      mmap_write_lock(mm);
>  +      ret = walk_page_range_novma(mm, start, end, &pageattr_ops, NULL,
>  +                                  &masks);
> -       mmap_read_unlock(mm);
> ++      mmap_write_unlock(mm);

Yes, thatr's the proper merge resolution.

HOWEVER.

Looking at the *callers* of this new __set_memory_mm(), this is all
completely bogus and broken.

In particular, fix_kernel_mem_early() does that call under rcu_read_lock().

You can't do that. Not with the read-lock, and not with the
write-lock. You simply cannot (and must not) block while in a
read-side critical section, and trying to take any sleeping lock -
whether for reading or for writing - is just completely wrong.

So I'm not doing this pull. The merge resolution is trivial, but the
code is simply wrong.

                Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
