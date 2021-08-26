Return-Path: <SRS0=v94U=NR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4033C432BE
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Aug 2021 06:21:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9464360F14
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Aug 2021 06:21:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9464360F14
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v0zHTtfFJ8YnmOVDPtHoVnljdopNlFJ8OswVhr4kHRw=; b=nqZiS9wrpCQHJB
	OnmnoDAvbhnsG46IH9qRaXclskE6NT6PaSZ/x9EvQRQRdn8LCiaZLQyG63tbc4wr/4eHUCDuFqA9m
	Ajw0SXgSXtYRZhLbc/340ivARqZHG0b4jo+Oo/i3mQY4u+ZcicWUIb6f5Nqd+TuKN+kmRRczRLcAS
	3oJuhzSxkmJW+4Fu5bcQAI7BILbKuc6OxfBL3eKughLNXZgbK72owFX5WdvEb1xDqHf2QNWoipjJW
	vyo6U44Wjh3hi9FTlQ8iiomfWTU1MBCAhN2t0rqTZDzeIIhVnZnCvOAWEuykJKaC62nCj4SWyxpLj
	SuimGhLzKI9Jjkivx5yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJ8ki-009HZB-GJ; Thu, 26 Aug 2021 06:20:40 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJ8kf-009HYT-Rz
 for linux-riscv@lists.infradead.org; Thu, 26 Aug 2021 06:20:39 +0000
Received: by mail-ej1-x629.google.com with SMTP id lc21so3766047ejc.7
 for <linux-riscv@lists.infradead.org>; Wed, 25 Aug 2021 23:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T99lzSum7lx0H0eLIVXXXKSQFMXc/FiDCDjfW8+qt7E=;
 b=YDQw6YYp1Q+e3JAJKpV9SIj7NSipKUumvtRA5vDaUyUqVu1CCLC2NGhimLqq7QMf0v
 L3ocVOOeZLwCwpW/48Hzdm8AZkEJALbzsqjgihIcJX0KvJxMghcDqWiIcQVvAioFk/72
 O7AC3T//xi9If/k69Y1bE7j2t9INx5OZf5Z4yppNioTqpyFRqboAbs5nwZ959Aa8/WzY
 I75w/WOU+XLuHlyFZAhj2zSVda9b4Xs4359xSfwiycM//qcFkOGeJGL13cnq6DKRc9zz
 sF5lxFXBJNxrP9AF6jfwciaT5EuluTmkRTeoEGDQVQJMeu0rwi1FvJBx107EBg6Cva+0
 rf0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T99lzSum7lx0H0eLIVXXXKSQFMXc/FiDCDjfW8+qt7E=;
 b=Ta0Gfz7Tu49kIHU4hblb2iBghc/mGo4uMnVFoj1qSv57FlXPkid+q8tdfMrQtswOyk
 4Lc5DzXNCm8YpLD4t1seJddS9Dg1KVxfkr8Uuz9JBBulZPQ9cvK/CUbC3mYIezQCCQVQ
 TPfudSZRTAIfLJrwRhU1O27sNYlNJOlYEjBuCN22VxodtzlAOpEeutOiDhRJnOll6sI/
 9Br9poLJG0QBXjliTKpLRl2l6HFIm8+FWUG8Yal3TO+D6KtkBQxvvrW4qHR8rr8qct6m
 lnXxwWSpR5SjwIbbR3k+i8k/4lgYu4EBbm3VPzAYTrvYGLgiXTBmji5+WorBQNRtbEyP
 KUlQ==
X-Gm-Message-State: AOAM532DFCB7pjnoyju5p8uDS2Nez3C9Cq2rcS7Ape34hxSw7i9GZb+d
 WoKQLIVCq3V8qghLbch/Bt+BFyV8CUHhAVZqThg=
X-Google-Smtp-Source: ABdhPJxRTpCTLDh6BG6miJ50+ZZxnnE6C1yC+UQeTxlO72m2FHwt/XN411Ij8QRRbVFXpEB6/fvhXunrINI5rqogxog=
X-Received: by 2002:a17:906:3a57:: with SMTP id
 a23mr2534109ejf.469.1629958826448; 
 Wed, 25 Aug 2021 23:20:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210826060509.2470960-1-palmer@dabbelt.com>
In-Reply-To: <20210826060509.2470960-1-palmer@dabbelt.com>
From: Pekka Enberg <penberg@gmail.com>
Date: Thu, 26 Aug 2021 09:20:10 +0300
Message-ID: <CAOJsxLFyxKOBmzOGCojxWRsrOB1k7jy8P+kNTUtLH6DgdrOZCQ@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Fix VDSO build for !MMU
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Guo Ren <guoren@linux.alibaba.com>, abdulras@google.com, 
 LKML <linux-kernel@vger.kernel.org>, kernel-team@android.com, 
 Palmer Dabbelt <palmerdabbelt@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210825_232037_952283_0545F0B2 
X-CRM114-Status: UNSURE (   9.31  )
X-CRM114-Notice: Please train this message.
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

On Thu, Aug 26, 2021 at 9:09 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> From: Palmer Dabbelt <palmerdabbelt@google.com>
>
> We don't have a VDSO for the !MMU configurations, so don't try to build
> one.
>
> Fixes: fde9c59aebaf ("riscv: explicitly use symbol offsets for VDSO")
> Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>

Reviewed-by: Pekka Enberg <penberg@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
