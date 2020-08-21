Return-Path: <SRS0=uNJT=B7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96D09C433DF
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Aug 2020 19:35:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56AE62072D
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Aug 2020 19:35:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nbplMvTn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="C295IkxU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56AE62072D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Rz1218eIt3UiyPN/IY1Ld/awMeWIVWIqF+PStR9nJtQ=; b=nbplMvTn87xos2+sdskPzvIES
	exAKJVNBbvwHn37GEafzA74qkAamzIOsh4OgKQc4rmu4s6+IVSOllKBocFPRxHfNhseAoPCUs8h4a
	2lKadgkBWT3JgWxW0F4D5bZi+FXxzVZgoq9V++Kn+hJOIwrDep2Vh9CkTxpjwqf13R+cXZza0NNSz
	5OUZtuq7YgQO9vb1jfG1SZWysYASVhPsSV+gGuuVBTkiBGjZEyo7aP6DZSdXa6v0i90U4/88TzC5x
	tS+c4ahKl5Xr4P9f5TwYwHgUUn/q8bdhzNCjtCFh5OLz60qBfIlyj63/NhQ8Lv0s3//w9PUhILeMu
	D4rCdSIdw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k9CpB-00066N-Un; Fri, 21 Aug 2020 19:35:41 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k9Cp8-000661-Sl
 for linux-riscv@lists.infradead.org; Fri, 21 Aug 2020 19:35:39 +0000
Received: by mail-lj1-x243.google.com with SMTP id i10so3100068ljn.2
 for <linux-riscv@lists.infradead.org>; Fri, 21 Aug 2020 12:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RpYvCfsbuFRsxqMSwlesgwmxN2eUawgX7RpVp5hfrDM=;
 b=C295IkxUljYll1HbkYhxEMp3xp6hSjmv/Tdx8HJLRkcuK8a4r0PNmiha4PC7CGZvmd
 9HClEXcf/+XX+P9j6WioxaJNVnsub/fX5hgMate/ImLkubHanJMhrCLhJNOOjbPNe+f+
 JXCwa1tvJQLfSU9Wb2GcJnhYY6XYK3GsG62BM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RpYvCfsbuFRsxqMSwlesgwmxN2eUawgX7RpVp5hfrDM=;
 b=pWv3AUiY08tqCXjOPFW/o2LoyHcJLKy+oWPofW0BWsdPEhPA1IyTBB/MvekULXQwy5
 oyeJ7ucjAnxGuLqy/maWuv6Sqpt0qAbMUKKeE5JhiULpsArZjOFVWPwqsQDo6C6KGlFp
 mgVNv7OeYSzmxb+asUGUMdxccPY1pRJadCkb9d8Aw3n8PqNeGDhJPnjl6Np0hP90ATJE
 C2D+Jju+YoGQFgNLACLivtPoHzWzDxjfWvp/eiQrYCIAQA7mBfqIdq8R0mlPfFz8zYvs
 4WDWnJ7FdiHAdPiJBMPzSxLOwp+GHfs/mnK8Lh7VrD13ZO2rJO7b9CmUn4xkKSV2Z5Kd
 9LbQ==
X-Gm-Message-State: AOAM533ekSjTKG8TW5wjyAv7r/EIU0Z2OKhJswr9t95ed6YUirKXsznf
 dx36WV+x1VqLkdVvUbIARUQvasoBoz+Lhg==
X-Google-Smtp-Source: ABdhPJwvmILKfzUBfvP6McUhQG9X+QpGUoJ1EMJ/399T7bh/ZNbEVSZsz+SGr0JLDq3bIM9umWl/ug==
X-Received: by 2002:a2e:b892:: with SMTP id r18mr2047890ljp.249.1598038536999; 
 Fri, 21 Aug 2020 12:35:36 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com.
 [209.85.208.177])
 by smtp.gmail.com with ESMTPSA id 185sm554241ljf.82.2020.08.21.12.35.36
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Aug 2020 12:35:36 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id y2so3112542ljc.1
 for <linux-riscv@lists.infradead.org>; Fri, 21 Aug 2020 12:35:36 -0700 (PDT)
X-Received: by 2002:a2e:92d0:: with SMTP id k16mr2060856ljh.70.1598038535798; 
 Fri, 21 Aug 2020 12:35:35 -0700 (PDT)
MIME-Version: 1.0
References: <mhng-32c8d053-acbd-4c72-b41d-8d6042ac639d@palmerdabbelt-glaptop1>
In-Reply-To: <mhng-32c8d053-acbd-4c72-b41d-8d6042ac639d@palmerdabbelt-glaptop1>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 21 Aug 2020 12:35:20 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi_tf4qsiBj5UD0GG3wz8Hi5NrHzqdrx+CwtfAY+_UiGg@mail.gmail.com>
Message-ID: <CAHk-=wi_tf4qsiBj5UD0GG3wz8Hi5NrHzqdrx+CwtfAY+_UiGg@mail.gmail.com>
Subject: Re: [GIT PULL] RISC-V Fixes for 5.9-rc2
To: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200821_153538_999019_D9252ACA 
X-CRM114-Status: UNSURE (   9.12  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Aug 21, 2020 at 11:26 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> * The CLINT driver has been split in two: one to handle the M-mode CLINT
>   (memory mapped and used on NOMMU systems) and one to handle the S-mode CLINT
>   (via SBI).

This looks more like development than fixes.

I guess I don't care deeply enough about it, but please don't do this.

            Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
