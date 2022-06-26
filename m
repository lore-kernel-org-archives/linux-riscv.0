Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58752C43334
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Jun 2022 04:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pfWWeKSaXIybfH6yt/IWglnCIE5FF1PzTXGOw4YZpmY=; b=N5xghdr3wzcnZX
	6zC3AjZNNcImLsD0+RpOZeCpS23MNQoMAqEmcrMMJWMIg1l6M2is5CdQm/GGlGIdEsEdo0gx26cep
	fL0PuEKjNP2voQL1gfSTS4deoqomP7xcjNyQcyAic3qzeUCXLAtyIaHj9XE+sPM/NcAzDycKJ7TrQ
	hkKpJukubwVsxxATuiscTIkqo1LVQtet5Xty7xaCbT2kEW6VTCv16TeQMdSCj7/SMeJoISpo+wT/E
	JDnZjiYMEl1QBbHcdkg23vftVEh6eS9qS976uvPiJAbfiaN4sdy8yWO42IUZlK1a+L6Mk46dw9qdn
	6jZBQ6LyS3u9UCmw9YIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5Jxc-009Ww9-EL; Sun, 26 Jun 2022 04:33:24 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5JxZ-009WuD-II
	for linux-riscv@lists.infradead.org; Sun, 26 Jun 2022 04:33:23 +0000
Received: by mail-wm1-x32a.google.com with SMTP id v65-20020a1cac44000000b003a03c76fa38so2816020wme.5
        for <linux-riscv@lists.infradead.org>; Sat, 25 Jun 2022 21:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2kWtI1K8FBljQi8An/wyVTdiQqFYwSP32gsF9BQJ03c=;
        b=FrZZoDyueMWB46rAlqAH1OYPceblyGuoIYSuiJh9AP7soufPKW1Jm2zZlInD7vPgfI
         NdGX3xp4zNoqaACVAwsX+sYkPJm2kTFMCDSR2Ble7RTZVx4h5yM9Jw3Ne9acSpNBuH9a
         pOpSHXejHqY/PixidKUtyNYZ2wsP77du0gW5ht7HC/sE3XMHwI5ks7yjJVy8tNZRRnxp
         nuAYvLzeZTEeBv/e9XwsTzNXD+GY5Svw2Gqe0rRRmur2BeMr1Y6eEKv/zqvBj0HQta4H
         djnLpYv0J0I1qlh3c4tQJKQuPXbyVejuRk9BzjOClEUAiH/eUHlQ342iTEhIRspr6YYU
         0mEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2kWtI1K8FBljQi8An/wyVTdiQqFYwSP32gsF9BQJ03c=;
        b=mbkDGhiNqDb2IaEGwJNqImtgw3iFr8po1geIEv8CsZSxqzz9d0DT3s1lzlDfS0SqPN
         9Oedd5yeXhwLvwG6V7wPlyqy1PgsB1WiDdQNe6zGH+/JMRLZckGaTwkMoKAfMxdPIXSq
         lopEpO6IpPuU0iMWNQF7mftb3eLV8mDXUSg17iKef1NGOoErEdvz7DS+BiX3NGSrGj+U
         kM4OMU8DHqE07gkLuFx8GEUHXOKb07IRgLDZhwl5mDGPoQVSEn9VpTlcQXrpDZP04eRx
         ecrEsG4MQNJUm7Phc9PgAGcAJuE9IiojG8KB5LmHyxcrxxXmLDhDi1lq57fsm8E0yb81
         nbUg==
X-Gm-Message-State: AJIora/VqYwQ+twRnqy0jFqa04AuL3O8BSlEBYp0b5Eq9dAc9In4kVXN
	kT/XsOoag4Vzi6dwO00Bg7rB654KpQbB02LzTYPsVg==
X-Google-Smtp-Source: AGRyM1vAT0OOLfOI5Wn7s+3waQl1AufOpwQ7c6bUsnwcB4orgjTFZbOh+qBgJ1TE3EXFDt05Nh9wdwF8DhrwnXuYvd0=
X-Received: by 2002:a05:600c:1d0b:b0:3a0:3ab8:924 with SMTP id
 l11-20020a05600c1d0b00b003a03ab80924mr7671319wms.137.1656217999456; Sat, 25
 Jun 2022 21:33:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220521143456.2759-1-jszhang@kernel.org>
In-Reply-To: <20220521143456.2759-1-jszhang@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 26 Jun 2022 10:03:07 +0530
Message-ID: <CAAhSdy0mkwacNMVa_jFZmZ+NRPBa1TpKUQGpzr6Z9_wfoq1R4g@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] use static key to optimize pgtable_l4_enabled
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Alexandre Ghiti <alexandre.ghiti@canonical.com>, Atish Patra <atishp@rivosinc.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, kasan-dev@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220625_213321_651699_C257CAF0 
X-CRM114-Status: GOOD (  16.73  )
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

On Sat, May 21, 2022 at 8:13 PM Jisheng Zhang <jszhang@kernel.org> wrote:
>
> The pgtable_l4|[l5]_enabled check sits at hot code path, performance
> is impacted a lot. Since pgtable_l4|[l5]_enabled isn't changed after
> boot, so static key can be used to solve the performance issue[1].
>
> An unified way static key was introduced in [2], but it only targets
> riscv isa extension. We dunno whether SV48 and SV57 will be considered
> as isa extension, so the unified solution isn't used for
> pgtable_l4[l5]_enabled now.
>
> patch1 fixes a NULL pointer deference if static key is used a bit earlier.
> patch2 uses the static key to optimize pgtable_l4|[l5]_enabled.
>
> [1] http://lists.infradead.org/pipermail/linux-riscv/2021-December/011164.html
> [2] https://lore.kernel.org/linux-riscv/20220517184453.3558-1-jszhang@kernel.org/T/#t
>
> Since v3:
>  - fix W=1 call to undeclared function 'static_branch_likely' error
>
> Since v2:
>  - move the W=1 warning fix to a separate patch
>  - move the unified way to use static key to a new patch series.
>
> Since v1:
>  - Add a W=1 warning fix
>  - Fix W=1 error
>  - Based on v5.18-rcN, since SV57 support is added, so convert
>    pgtable_l5_enabled as well.
>
>
>
> Jisheng Zhang (2):
>   riscv: move sbi_init() earlier before jump_label_init()
>   riscv: turn pgtable_l4|[l5]_enabled to static key for RV64

I have tested both these patches on QEMU RV64 and RV32.

Tested-by: Anup Patel <anup@brainfault.org>

Thanks,
Anup

>
>  arch/riscv/include/asm/pgalloc.h    | 16 ++++----
>  arch/riscv/include/asm/pgtable-32.h |  3 ++
>  arch/riscv/include/asm/pgtable-64.h | 60 ++++++++++++++++++---------
>  arch/riscv/include/asm/pgtable.h    |  5 +--
>  arch/riscv/kernel/cpu.c             |  4 +-
>  arch/riscv/kernel/setup.c           |  2 +-
>  arch/riscv/mm/init.c                | 64 ++++++++++++++++++-----------
>  arch/riscv/mm/kasan_init.c          | 16 ++++----
>  8 files changed, 104 insertions(+), 66 deletions(-)
>
> --
> 2.34.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
