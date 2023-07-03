Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA12EB64DC
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 10:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CY/vhCNSh/NAKvSD77SopFNIBSBISTDnkf6QzPGm6sQ=; b=jXbAbuR+B7O9wQ
	OHU+M6p1gDa6cQR68JNSi35SBzQN7ereDNt0sfH8nkdoT2vuXIpN4ijmllg0Zfa1IRc89rMNwDn2F
	duakO2V3RkIAhnIpJgqN79HKEWjJYRY+oBO/eZf+s3dzTSL6CHElaksBupDxrIL+AS2Kdi+B2FLnW
	IfjZ5hPgpOXc9lKc7tVZUlSGx6siqI2vSb4+Hr+66rNg3kIesrJ/ODCfn4q41zkZklugJa2KGL4Is
	Y53VkAaS73/Brdtgk8WSaJO1ZX9bFrsC0S3CtOgCdDNK83ByuDdeg8pHeb65vdIMS80kyT01/bhfw
	C54f7C70uMg1AQGOiS8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGGoX-00AEyK-0G;
	Mon, 03 Jul 2023 10:29:49 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGGoU-00AEt3-2W
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jul 2023 10:29:48 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3fba5a8af2cso43081805e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 03 Jul 2023 03:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688380185; x=1690972185;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=msJWpyA7yo6ChYj6KxpLPwqEqEdFIUqzWnqvB6326h8=;
        b=uG7u5pKuhtwVbr2UgzP8QRIsfl1iHAteUv24U80QoHbW76XH60V8ImE2VNBLxQa9Qq
         kLRpwlK6YtuNENBihvqHpD6PyWaah6uVndRmhCfpY/XXqkgmtI/BwUInZ8BSkTfG/Dao
         18RUARVnFlz7VWwr0WMyVF8SsKwfdStnu625yEymLkZ2+Kj86OmvzzI8YUNG7JLtpSGp
         HEsvosPWjYgwvL8q8M9NlgK/Mj6nmGfLdNG759I8DxJ2cICoqAa9ihOBTlJF9w24ph2d
         TbkH2F7e9NyNZM63JA/5/MZmRvOX3RU0Jb+i7iMf+YaKFCuFhigY9yyshw65JxqmZDgQ
         EZpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688380185; x=1690972185;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=msJWpyA7yo6ChYj6KxpLPwqEqEdFIUqzWnqvB6326h8=;
        b=AISHZE2JVJGhQXHFi6Y8D7PKzFYMbRM0VU3Qcs4ojQOeeGSKTKTOrkbDOOyULTX7WX
         XQ8hNgq8OPu8q3MrFB25dBhsy0nwyp/hbnu/P8cNZ2QU5Y5P9C4MOisPL+/gF1pvOh9I
         ugE6RNO4q/gJZGmPqoYRdISXqFccW3Ki80QgogpT/T91R8BeaBt01xbGwvCfyD/m4q8a
         KJNLepYR2iaBQVMjZ3FGOdTPD6VvBU8d+CtWkzKCGU2qigkuXRdkxNMxJKxAkQufgZIw
         7XvOZUh6G7NCeqYONePdgqM2xnbEFO4BTNH3ynjo6Cl/aYn4Z1Hl/VOZlnhpbcqBiPH4
         m+TQ==
X-Gm-Message-State: ABy/qLZNi8Q/2pAAP689C25pKoCib7ciGvdDF91PQqRctv412K+uFtQ/
	w2MN24poEG+U/r0xmZG5AOtimQ==
X-Google-Smtp-Source: APBJJlHzl6eBn9aWNVBkstLjO2nceNNNQ/v7qgOzbBPVd6Bz/h0VoFqe818reHfXXfYJfj+v9+U3ow==
X-Received: by 2002:a05:600c:22c4:b0:3fb:d1c1:9b79 with SMTP id 4-20020a05600c22c400b003fbd1c19b79mr4086786wmg.30.1688380184737;
        Mon, 03 Jul 2023 03:29:44 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id q18-20020adfcd92000000b003140f47224csm12786759wrj.15.2023.07.03.03.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 03:29:43 -0700 (PDT)
Date: Mon, 3 Jul 2023 11:29:41 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: guoren@kernel.org
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de,
	peterz@infradead.org, luto@kernel.org, conor.dooley@microchip.com,
	heiko@sntech.de, jszhang@kernel.org, lazyparser@gmail.com,
	falcon@tinylab.org, chenhuacai@kernel.org, apatel@ventanamicro.com,
	atishp@atishpatra.org, mark.rutland@arm.com, bjorn@kernel.org,
	palmer@dabbelt.com, bjorn@rivosinc.com, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	stable@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH] riscv: entry: Fixup do_trap_break from kernel side
Message-ID: <20230703102941.GA4328@aspen.lan>
References: <20230702025708.784106-1-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230702025708.784106-1-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_032946_872662_1A22CE83 
X-CRM114-Status: GOOD (  11.56  )
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

On Sat, Jul 01, 2023 at 10:57:07PM -0400, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
>
> The irqentry_nmi_enter/exit would force the current context into in_interrupt.
> That would trigger the kernel to dead panic, but the kdb still needs "ebreak" to
> debug the kernel.
>
> Move irqentry_nmi_enter/exit to exception_enter/exit could correct handle_break
> of the kernel side.

<snip>

> Fixes: f0bddf50586d ("riscv: entry: Convert to generic entry")
> Reported-by: Daniel Thompson <daniel.thompson@linaro.org>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: stable@vger.kernel.org

I pushed this though the kgdb test suite that originally found the
problem (although it didn't occur to me when I reported it that
the problem was nothing to do with kgdb ;-) ). So FWIW:

Tested-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
