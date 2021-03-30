Return-Path: <SRS0=oB3y=I4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE718C433DB
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 05:54:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5056461928
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 05:54:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5056461928
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=JDEVwHVq7kbCOL0uJyvBeyi9QNROGfpndaFNUdFdkkU=; b=OUpuLzpSeNKEvSVRQPuqK73bH
	xul+Yy6hbrWln0yEUU5oH5S2ZTCrM5ypV97eM1Wo/wiURh53sI0HHqUBqggp949MuRHV14fBAAT5M
	qgHUYrGyVItUf8+o75dQCXY7VopQLBf7GSNn+pFBzvfcJBQSqZWWWA/nsTOQFyLYF3mec3S7dRP7i
	ta5Udr+qMKXg1ppOQfkxjDe3tQF0SMEYClxU02ynlx8dh5DhCospgZ7Sujl9T6mVDXywqGRaIfmSi
	/IQRNBfDod4PpAvRkU0U6NS0NEgf8ilYYbIoGO7pRFCFwc85fgnDNrtZPy4k7WVWanruCgxrRb4xw
	WffjiLqYg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR7Kg-002ndB-E3; Tue, 30 Mar 2021 05:54:30 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lR7KX-002ncF-6Z
 for linux-riscv@lists.infradead.org; Tue, 30 Mar 2021 05:54:23 +0000
Received: by mail-pg1-x530.google.com with SMTP id m7so10917422pgj.8
 for <linux-riscv@lists.infradead.org>; Mon, 29 Mar 2021 22:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=C/GOnzGh3SqlPD+cVcmlRhjiUhMBfsMKLeWTg6MJ7jY=;
 b=j6+00ZGEEZ1AP2f/5GfoGcA0GsMEI6/C21ZD0lbg/XP4wPkwJoYipktdJubitpgDP+
 wgcah0URjkl6AYXpG9cgWLRGXBLiMfR52o6o689Vreh0v+Lt7OvC8x1fB/5TTyRzxVF8
 +IX08t8qK8hY6fl+cjZgCAcCHu+878OR2plvgVpyscHGsghufy9UmaGd89FOrEUlPan9
 nG9gH1rRhXzv6eObqA1GS+3olKEarHx9O2bHn0GxV3LgaIXJwqlzB7vaHg7mDPBfn74V
 M9q/5gFNLQPxJVxCGZV+Bo3GZhwX1ibxendhmE+iRq4Ugx4AwkIkXrvScKbd4CD2siGj
 TIaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=C/GOnzGh3SqlPD+cVcmlRhjiUhMBfsMKLeWTg6MJ7jY=;
 b=kQHISTdKY1KeWTwZi+JrY8sFoVCCG/xMKlot+uGDgHIh75UlixYU/IdMU9whxeln1Z
 +MBMCodIQv/vk10M40tzY3gb5t4tmnRfRuQ2lLXSiePgWXkAHiWMX8JRhW9k9M9qwYZN
 O86rfvQWxCS/LIjYAhcBfiaBCoQa+Y3iWuXgj264FAf9Mmgss7gG64lB2YEPr8wVpYBH
 ZuYrnME9SZLswFiuMMg+8oRvYrUP4pvr+0sdBEwcayQtA6N6OfxAupWL2ar8f9Bm2zTl
 6mvQV9/t9xiJ4V/BYUrOd0kQpIYddR9m3mw31LE23om+uhhvv2jgmHjxpdKso4SAiFnP
 grEw==
X-Gm-Message-State: AOAM531fJ+zDn/+3dIjEolsm4RrxyAkKpSnY/r0j4YBdqQJdvMPjHOeb
 EMUcR7YyTnHUZ+TFAmRKp1/M8A==
X-Google-Smtp-Source: ABdhPJw/6ycpvDSr4lA7omfOMiOjOM0m49OLwTpyVDudwQ7+YSNbP232TmXlPl85GjuTFN0yM22rIg==
X-Received: by 2002:a63:1921:: with SMTP id z33mr27276370pgl.211.1617083659752; 
 Mon, 29 Mar 2021 22:54:19 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id x22sm12044732pfa.24.2021.03.29.22.54.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 22:54:19 -0700 (PDT)
Date: Mon, 29 Mar 2021 22:54:19 -0700 (PDT)
X-Google-Original-Date: Mon, 29 Mar 2021 22:54:11 PDT (-0700)
Subject: Re: [PATCH] ftrace: Fix spelling mistake "disabed" -> "disabled"
In-Reply-To: <20210317094223.34797d5d@gandalf.local.home>
CC: colin.king@canonical.com, guoren@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
 x86@kernel.org, hpa@zytor.com, linux-csky@vger.kernel.org,
 linux-riscv@lists.infradead.org, 
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: rostedt@goodmis.org
Message-ID: <mhng-54032ff9-fc8d-48fb-87a0-ff075313d077@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_065421_463606_074B022E 
X-CRM114-Status: GOOD (  17.70  )
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

On Wed, 17 Mar 2021 06:42:23 PDT (-0700), rostedt@goodmis.org wrote:
> On Tue, 16 Mar 2021 21:21:08 -0700 (PDT)
> Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
>> Thanks, this is on fixes.
>
> What does this mean? Is there a tree that spelling fixes go through now?
>
> I had already pulled this patch into my queue for the next merge window
> (and it's still in the testing phase with other patches before going to
> linux-next).
>
> Should I drop it?

Oh, sorry.  It's on the fixes branch of the riscv tree 
<https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git> .  
It's what I sent up to Linus every week, this one already went up.

I must have not been looking closely enough, for some reason I thought 
this only touched the riscv tree.  I wouldn't have taken it without an 
Ack if I'd noticed, I guess just because it was only a comment spelling 
change I hadn't checked the paths.  I'll try not to do that again.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
