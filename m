Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A60C5475B
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Feb 2024 00:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YJzSgkrxq6EZp7zzt1g+HoY0WqJQ4Sujs+5kdb+tkBQ=; b=meIUGLQp1wuAT9
	DaQGxwPja7OgWrjXiJVCEjwDoNXlPbP/+ghEAglzN9rPG1HicS304BdIUF+1K0fjs72vONTsI+KkO
	vUwLmudNchkrRPVpN7RurI9DDSLF5tZCKd3LpL0I0W3mvptkYhpBT7+YkPNzFY7XpVQMogk+tV1pr
	iuWATqA4B17V5CLltmbPhEXQfAZK0PzIMVSRAzyccStxB1pvKHN8BdycVx/IVDk0cIf5uTUKytgKO
	TeUrdeJFnDyQFpLk/9tLrg2KTQ8rrxNrw40ISy5dK+gGeO48PM8DmHHABngTvhm6hMYjI0n03ro/v
	VwVjCk9sFkEFbWRaxuxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfUVq-0000000BS5W-26bW;
	Thu, 29 Feb 2024 00:43:02 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfUVn-0000000BS4m-3tUA
	for linux-riscv@lists.infradead.org;
	Thu, 29 Feb 2024 00:43:01 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5669bf9013eso147175a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 28 Feb 2024 16:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709167378; x=1709772178; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZmS4IRRjqluuahGyeQvOvUbUjo8O7pcJJoCmMytKQ98=;
        b=Y7DZRKT1OQ/jl/ZVx1BbAqB9OrZGzo2SKAO0ofrBXscfSRalROiWXYF2oy38g9aUZ5
         e9rnSRuP6omqpOcFtVtdCtVRrqDywLZEX4T4F81hTNqUtVKg4qp45y0Mi4CUCyMpdzMS
         qS+CLojIqm9YkzI5mYcPJpIQEdV+aiEXNhPCYpYR2p+GAlYUW/G5khflsNKPVmkHuiyI
         PxAjYOBrNSHaYXmbs47cYYJOVOEfFobCKnE9F7naDqM/yCH0LqMDzrBnRGj6RjgGnYj6
         pZNvh6ukhwNWPUQbihOckB9uEetph6eSvPUXr7k2ptDbXThnCFOHCvaATMXtnSqXfTnd
         MhZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709167378; x=1709772178;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZmS4IRRjqluuahGyeQvOvUbUjo8O7pcJJoCmMytKQ98=;
        b=aTBZaiTzIRKvtCnD4xrWeff2fr64bLEGL143R2T0i5XzS0YquCMG04indhRVQMLS0w
         +D0pyki4PQCoEOrQxySEicVL1+wbiErnBBFgR411iced1NQj3QTaWOmRyesbMxVLIHeL
         AtOzcSh9qd0vRb2Y2wc4Ov+u7GGXCywzj5RASQYOCAo1d4lxafPLXg7IccGrVFboS5mO
         5BMqpVkHyyWZjesiIYerT5/GyhGKdoHHJ5lyLICmEfIZ90gws8QHUe9NhUZuvbUPrRwm
         Ef9TAzyfYjDBZM0ij+lG9iusN98uKF41+cxrcxcqZegWk3BjKWBN84ZDFD64E0LGu95/
         mruw==
X-Forwarded-Encrypted: i=1; AJvYcCW27ckTAQF12NJrFfBnwpmnkOgiRVOsPu4RLXEZ4nA1/Lb7TWbV39S3FZ3ujRR53N7D9N8HWBHLQU0QMAFIWI9ecXpeHCkDZZRLyBKG+XxQ
X-Gm-Message-State: AOJu0YyMqH3F3SpTFD6F3hxQHh48AcbCR+E09bSR3ruBVkKhVy1brvfd
	Pv1lpDguYMjYO2d2huwmfn+zL5zuvm5Otj6pi9XqPOTSKQWyE2oO
X-Google-Smtp-Source: AGHT+IEdA/lIroyr34aN4pYdmsq1xe9ghJmBWdnL6YBNd1En/M75YkACZP1NP7ZEJ0WAd80er8iU0w==
X-Received: by 2002:a05:6402:268d:b0:564:d715:1d67 with SMTP id w13-20020a056402268d00b00564d7151d67mr400310edd.17.1709167377835;
        Wed, 28 Feb 2024 16:42:57 -0800 (PST)
Received: from andrea ([31.189.122.3])
        by smtp.gmail.com with ESMTPSA id i16-20020a50d750000000b005667b411c38sm74791edj.65.2024.02.28.16.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 16:42:57 -0800 (PST)
Date: Thu, 29 Feb 2024 01:42:55 +0100
From: Andrea Parri <parri.andrea@gmail.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrea Parri <andrea@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>
Subject: Re: [PATCH 2/2] riscv: Fix text patching when IPI are used
Message-ID: <Zd/TDyyG/5sxrPWx@andrea>
References: <20240228175149.162646-1-alexghiti@rivosinc.com>
 <20240228175149.162646-3-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240228175149.162646-3-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_164259_998558_DCDF28F5 
X-CRM114-Status: GOOD (  12.64  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Feb 28, 2024 at 06:51:49PM +0100, Alexandre Ghiti wrote:
> For now, we use stop_machine() to patch the text and when we use IPIs for
> remote icache flushes (which is emitted in patch_text_nosync()), the syst=
em
> hangs.
> =

> So instead, make sure every cpu executes the stop_machine() patching
> function and emit a local icache flush there.
> =

> Co-developed-by: Bj=F6rn T=F6pel <bjorn@rivosinc.com>
> Signed-off-by: Bj=F6rn T=F6pel <bjorn@rivosinc.com>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Modulo the removal of the hunk discussed with Samuel,

Reviewed-by: Andrea Parri <parri.andrea@gmail.com>

Some nits / amendments to the inline comments below:


> +		/*
> +		 * Make sure the patching store is effective *before* we
> +		 * increment the counter which releases all waiting cpus
> +		 * by using the release version of atomic increment.
> +		 */

s/cpus/CPUs
s/release version/release variant

The comment could be amended with a description of the matching barrier(s),=
 say,
"The release pairs with the call to local_flush_icache_all() on the waiting=
 CPU".

(Same for the comment in patch_text_cb().)

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
