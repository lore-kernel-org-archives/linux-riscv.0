Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC799C3DA7F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Aug 2024 10:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=h1ERqHgU9sE6xLQyT/eLEaD1b4zBn5WPhdBfoNAO4v0=; b=kdufUhS8xOtO9O11SG3K3zy3vT
	DWzohzlGo0vB5yAJ+sfhl5jQ1uajvyrBvT/f7Rhr6xPU2AYnCOEdWYFHVqjP/YaFRCa/xhu27Y7pQ
	dFwy/d3biyLbzYu6wts+VsEnw6oQgV0dt3e+FX0nZG2UE2cSShw+TosLuPbnVNLpEe3JXuBIPJTa4
	zmziol7bu2mdxo373b9eKhRm6WGTgAlyvQB5JGKclkvcTVJLhwkYFCnIVUEazgymhtjM/j1yq9sWD
	yxnrfT40C5qilvejwfim1l7raRFTAmTLJ3f7jePHUAMYYIU+zex9pK8/RHtf36Bf3ynIsFo2ji0E4
	wjw5PJeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seXk4-00000009bvL-0zwN;
	Thu, 15 Aug 2024 10:30:04 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seXk0-00000009bsn-27bL
	for linux-riscv@lists.infradead.org;
	Thu, 15 Aug 2024 10:30:03 +0000
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id DAFC33F1F4
	for <linux-riscv@lists.infradead.org>; Thu, 15 Aug 2024 10:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1723717797;
	bh=3xaxNhe1FqV8WHQsaw+Wa818Bwsy57jjLMJR4J0o3wQ=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=rU0Z6WXsl1HCUwKhybLUkcoe69KMjaB6uHJtm8xcQZL+6RHS5GORTwCa+KZvsDoBP
	 d3DOUN120tTam+oF3qBVDOid9cQglbiYZCVhPli+rcZ69gJwMLgdh/ssut4/cTsj5Z
	 PtiATyaRZkWQBcgmaV05yGaMVX6G8FYV5YyPEg5fAyZQQ4PvPvDZUzsKmIVXI3eCyf
	 GTsX177iHMs6Gwrhnw3RUDKtefpNeraTEmQPw3Eivs2UyLl+Xo16czPW76I1htusN5
	 mm8EJQswV4QLKA/EoJbTiYwl7+SgH/Z3xSeqgH/xB+UOcnzB+je1MSls0veOkgZShQ
	 V1XEe2ZkJZB6Q==
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-4f513e1d1e2so270336e0c.1
        for <linux-riscv@lists.infradead.org>; Thu, 15 Aug 2024 03:29:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723717797; x=1724322597;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3xaxNhe1FqV8WHQsaw+Wa818Bwsy57jjLMJR4J0o3wQ=;
        b=rkvgPUGHV8ErxIws601IiFY4ggxA8p+t8hJnhtmAsKH2+FOYW14MWYXJHNudYhEz7w
         Y56TK23C5C+3hQzBcMFYpixq3qK1xb9jBRKYS4nyDj3keR4yh5RNexTR5SvhBouyXYm2
         wnzXP5QVBiaXClI9znVp0Z1gS97eoqLNA7l1hcg3YC+8SQElU/RHsFvbiX9SAUeOKV/5
         pG3lrC4jVZrIjaTZQl4KxQkXP1RXIDkUQj2b9rASbgFvqOG7IEkK4nw93nIKm8eEn8mZ
         XVpFUbck7BvJcnNVdFaW485hI7FJ2C8bFsaWpo9HElOIIoZTh2mxJ5s19L3rSrcitD17
         HyUg==
X-Forwarded-Encrypted: i=1; AJvYcCVdLQwYF0cB8xr1LoTVSPx9Xfcq+9F3x9xw5QJ1jkySu1ZdQTnH0bVaRaqF/tjR0qW/7fmY98gDIIKCWhOfpQqsXd2gkt7ys6u9pfcCIiGe
X-Gm-Message-State: AOJu0YxqMM7YmQ4uUuhSGghY8VAmuB4ikLogp0QssBp3BTvlfq2K7FbX
	hg/8yTSEwCr/QYIrYjCm1mTgMEKm3LZORusqWDgWzky8J0b+HDwYa1C+Mrhl6OrbajdrH46U60J
	KE5x9u8f+X37PhgWTAEEoi+9lH6VlfWso0+Ko2NnjkzwwRn7qyHO8Db5Mc07Uvub1Cg3FMiZUP9
	PLs+NpdA/eMvZXM/0K+C0q8DA8pR4MgapoFLogYRYiqd01BbDnxWSHcZb5
X-Received: by 2002:a05:6122:2a42:b0:4f5:26df:690c with SMTP id 71dfb90a1353d-4fad2337764mr6784887e0c.12.1723717796809;
        Thu, 15 Aug 2024 03:29:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGbkgj1Ik7pHRKdoLY3IN9m4oes3YiWU6MuLMMuW/zMuvzd5NfyPIy7S7pQruSLB4yXpDd+rhID9Ek2/6S04k=
X-Received: by 2002:a05:6122:2a42:b0:4f5:26df:690c with SMTP id
 71dfb90a1353d-4fad2337764mr6784856e0c.12.1723717796323; Thu, 15 Aug 2024
 03:29:56 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 Aug 2024 03:29:55 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <87jzgjnh9z.ffs@tglx>
References: <20240814145642.344485-1-emil.renner.berthing@canonical.com> <87jzgjnh9z.ffs@tglx>
Mime-Version: 1.0
Date: Thu, 15 Aug 2024 03:29:55 -0700
Message-ID: <CAJM55Z8WERQgs=QMyFGWvAHOpwcnOAudBqovaEuDudPSXCvL5Q@mail.gmail.com>
Subject: Re: [PATCH v1 0/9] Fix Allwinner D1 boot regression
To: Thomas Gleixner <tglx@linutronix.de>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Anup Patel <apatel@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240815_033000_695807_A4218EA3 
X-CRM114-Status: GOOD (  29.41  )
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

Thomas Gleixner wrote:
> On Wed, Aug 14 2024 at 16:56, Emil Renner Berthing wrote:
> > As described in the thread below[1] I haven't been able to boot my
> > boards based on the Allwinner D1 SoC since 6.9 where you converted the
> > SiFive PLIC driver to a platform driver.
> >
> > This is clearly a regression and there haven't really been much progress
> > on fixing the issue since then, so here is the revert that fixes it.
> >
> > If no other fix is found before 6.11 I suggest we apply this.
>
> So this mess has been ignored for two month now?
>
> From the pastebin in the initial report:
>
> [    0.000000] irq: no irq domain found for interrupt-controller@10000000 !
> [    0.000000] Failed to map interrupt for /soc/timer@2050000
> [    0.000000] Failed to initialize '/soc/timer@2050000': -22
>
> This comes back with -EINVAL. So the timer cannot find an interrupt,
> which makes it pretty obvious why the system stops to boot, unless there
> is some other timer available.
>
> This is obviously related to the SUN4I_TIMER because that message went
> away when it was disabled according to the next pastebin.
>
> Obviously that can't work because the SUN4I timer driver is using
> timer_of_init() which cannot handle deferred probing.
>
> Daniel: There was a partial fix for the sun4i driver, which you said you
> applied:
>
>   https://lore.kernel.org/all/20240312192519.1602493-1-samuel.holland@sifive.com
>
> But that thing never materialized in a pull request.
>
> And of course everyone involved ignored the problem since March 13th
> 2024, i.e. almost half a year.
>
> Seriously?
>
> Can you RISCV folks get your act together and ensure to fix things you
> broke on the way? Especially when Emil reported this nobody pointed him
> to this patch and nobody noticed that it's still not merged?
>
> It took me less than 15 minutes to find that patch and the correlation,
> but this is absolutely not my job.
>
> I'm seriously grumpy about that. This is not how it works. If you break
> stuff, then you take care to fix it before you shove more changes into
> the tree and waste my time.
>
> I'm very much inclined to take the reverts right now, send them to Linus
> for -rc5 tagged with cc: stable and ignore/nak any irqchip related riscv
> patches until the next merge window is over.
>
> Emil, can you give that sun4i fix a test ride please?

Hi Thomas,

Thanks for looking at this! Unfortunately the above patch isn't enough to fix
the issue:

https://termbin.com/7sgc

It still hangs after the "[    0.176451] cpuidle: using governor teo" message
until the watchdog reboots the systems.

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
