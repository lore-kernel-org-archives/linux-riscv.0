Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59FDCECAAA1
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Sep 2022 00:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=hVQh+n+VhWgmtamcXVvj7crTmLGWOH59zLhahzow5Tc=; b=Pkd6bZuYO0cTU92jJTqgvdlhTe
	sPhY6EUfLkcuU7rsQzJEFTxsf2mJlxEv/rSDHnlMah1hVO7gqEDBAuuKi0SMxPPFymZmyOEK+mchK
	msygP4CAojvgkdryquIjvvpGZGggV6+k8O+ewxnoigBMUYXI8bsARM6auLitoRJztqyFMvyRFzu+0
	nXqowrBp4CgvjlOSXLaZqYsbKPCU3NmDSNEYtJlBBrDY49lcuHBEOeGjr+40dmUOwP6kuFc5RrNR7
	g+pdLyKX26YW6Qg0tX8ZVM22Dh6mEkjnWJrTPbakWLtTZOHvaabxPL/uOKMX8gA1ynKFdnQbKv/sC
	TjyrzfhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZM2d-0014X4-E4; Sat, 17 Sep 2022 00:50:43 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZM2a-0014TQ-Mj
	for linux-riscv@lists.infradead.org; Sat, 17 Sep 2022 00:50:42 +0000
Received: by mail-ej1-x631.google.com with SMTP id dv25so52866503ejb.12
        for <linux-riscv@lists.infradead.org>; Fri, 16 Sep 2022 17:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date;
        bh=ovQ47vZovF8kMU8XowExonRrfnvEzMQFtu6wQPjgTpY=;
        b=S9pALlVHg0Hbx2iPGQFDjJWmaSsK3btrGX8KJi0u3C6QnzqRkZEzvdZltDg7IrSPDN
         BOgFkO90fpfZE2pB3y31iJ5kM/Y80uv49Wl3r5aAUAlbg8tlqjcrWIG55Mukv+OlHTOc
         q7ScK/6jbXuw+n7sfS+rmXdsglckcdAjsl1/MQdo8sTVMnkjI8eA6Y9YGnxUjDIj63Ep
         zvbduK9JP/cLCyvWtpXqAAma+kgQOG6BJcsye9J09c0htADEJjXZtXpDJMdag9nz+tCu
         fqZN2e4J/FkTHZhp1kIFYLPlipHyaxb6Op1QL5SDNo3KbOQDRMcIXFVwKJEgzZ8aVELI
         dimA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date;
        bh=ovQ47vZovF8kMU8XowExonRrfnvEzMQFtu6wQPjgTpY=;
        b=SOgUPeWkVu4URiJ/NTnGQs1vfbUrY/CJ+5cmgkHuNozvzTQYqnBPyNK3WNxC838oSq
         VVmrj8V55iIupgYFaSYzPTIubLZZmkgEo4KIN2XAN4ossfbmXccaXqhKm20T9Dq6YQGm
         WYoiuOaY20qDgP+F2Zm0UUCctbv8j0Vtv8f60wHh/5T4StZ5xOLrh+NDseoacXM8PfWa
         P5v/wISPbOI4yHIDPNRLzc2APErGPFXUjLPDTdWAxGyG42EYXTMUxWyMpglnJJDPrlyn
         3SthHuCVt1+5/h556DlujhgyRO50c2baIfwvknS4orEuGebKy8Q2HJg9C6e8MqRoP3fH
         Ik/Q==
X-Gm-Message-State: ACrzQf1TTQDfTgAZMUWNBBBDOGSSr+EiLYDozxQulrRhMLcL6T26lvxg
	GlLfZ1HCU9iKrXQOzses8mibdOc0JSw5cyO8o+0=
X-Google-Smtp-Source: AMsMyM7bnOhLQ0FRAoq5I5fvpfy+AFBYNZS0HnBpN3hS9RcMyrJUC2DJ/kYe2R4HJFOuutvI1Tda6w==
X-Received: by 2002:a17:906:8a41:b0:780:a367:db50 with SMTP id gx1-20020a1709068a4100b00780a367db50mr3763706ejc.118.1663375837515;
        Fri, 16 Sep 2022 17:50:37 -0700 (PDT)
Received: from localhost ([185.176.138.242])
        by smtp.gmail.com with ESMTPSA id c26-20020a056402101a00b0044792480994sm14310975edu.68.2022.09.16.17.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 17:50:37 -0700 (PDT)
Date: Fri, 16 Sep 2022 17:50:37 -0700 (PDT)
X-Google-Original-Date: Fri, 16 Sep 2022 17:50:25 PDT (-0700)
Subject: Re: [GIT PULL] RISC-V Fixes for 6.0-rc6
In-Reply-To: <CAHk-=wihdDOSVVi1gBYo+rcJ7dG6tvN7mEU=XLir8WiEdR1kQQ@mail.gmail.com>
CC: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-725db1f2-5b60-44d5-8ed1-71f3e7cdd8a7@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_175041_003431_E9800657 
X-CRM114-Status: GOOD (  20.23  )
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

On Fri, 16 Sep 2022 13:09:21 PDT (-0700), Linus Torvalds wrote:
> On Fri, Sep 16, 2022 at 8:31 AM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>>
>> I have one merge conflict as a result of a treewide fix, I'm getting some odd
>> output from just showing the merge (it's showing some of the fix too), but I
>> think the merge itself is OK.  My fix is to keep the write lock
>>
>> -       mmap_read_lock(mm);
>> ++      mmap_write_lock(mm);
>>  +      ret = walk_page_range_novma(mm, start, end, &pageattr_ops, NULL,
>>  +                                  &masks);
>> -       mmap_read_unlock(mm);
>> ++      mmap_write_unlock(mm);
>
> Yes, thatr's the proper merge resolution.
>
> HOWEVER.
>
> Looking at the *callers* of this new __set_memory_mm(), this is all
> completely bogus and broken.
>
> In particular, fix_kernel_mem_early() does that call under rcu_read_lock().
>
> You can't do that. Not with the read-lock, and not with the
> write-lock. You simply cannot (and must not) block while in a
> read-side critical section, and trying to take any sleeping lock -
> whether for reading or for writing - is just completely wrong.
>
> So I'm not doing this pull. The merge resolution is trivial, but the
> code is simply wrong.

Sorry about that, it's pretty brain-dead.  I'd love to blame this one on 
the lack of sleep over the past week or two, but I'm a bit too tired to 
commit to that.  Either way I'll go sort it out, but not for this week 
-- I don't think anything else was super critical, so it shouldn't be 
that big of a problem.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
