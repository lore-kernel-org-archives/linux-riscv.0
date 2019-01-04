Return-Path: <SRS0=RZUB=PM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D0DAC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  4 Jan 2019 01:05:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C81B217F5
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  4 Jan 2019 01:05:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pOTH+xk4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Cw8UQ6cn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C81B217F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=vD1C9TMbeackp6HWWNO7MlqoJBuKtT/HuPh2+SBeaoA=; b=pOTH+xk48E4q+QyFmZUkU2HtL
	T5+CwezTFzB7RT5YOV70fSWTDPX1x/5yVDIKf1Mmk9erHNivIbgMHxxjDxa5ZR2GVqnPP9bsbu8kl
	NW48FpPsG1Dh1hepDpoeX5Pc8uuuCe2yyjPqC0PKNu7trv7jiRb+/K03MOQF6vHXMxrdH/4/JRqUT
	fhqdQ5XCD2JciwTve/9HoFjLaUwvv018trF8ha8TSqlcLbLsxcFezEmWuMTYhf9amje5EIgJfe6Al
	u9rlnhuip63WB04oCnJigCyaS69OS4/TOnQNhmfPkwSMP1FX1Fwo3izp1c3dbWSVCDFK3GtK9+qYZ
	awnHY+7gQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gfDvb-0000M8-5P; Fri, 04 Jan 2019 01:05:35 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gfDvX-0000Le-7Z
 for linux-riscv@lists.infradead.org; Fri, 04 Jan 2019 01:05:33 +0000
Received: by mail-pg1-x541.google.com with SMTP id d72so16716666pga.9
 for <linux-riscv@lists.infradead.org>; Thu, 03 Jan 2019 17:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=dQs/81kQ9sItWsv3uUT9nCDzmSJ/uuIEXVPfmClASLU=;
 b=Cw8UQ6cnu5g1abxfqKbazN/+omtklQOyWhiI/0SMyZMjA9a6Givw3pbz7UBk6U7if7
 Rjr8JuGoMx27sJVU1MOlhl2h63z9DNx/G+4WRNhtPyCr2qFlkxY6pQHtAiqeyU7trmcZ
 TfLO35t3Ay+uoJUUzwmHOIbQtifgTNyF5itgDJM0gElthJrrJIUVXBIZKMYdM2R1nHm9
 fCYx6oe78gyW76p3ia/qRr/uBmwuidLY6gfaFb/tJWWQZoNJQjMByLmRRGpbvoN/rXmT
 xXuPLEXQJlpxZPMErSw85JFC80i3mgF89sxi+Qy3Ou79vzM8uPXpKKia72lKgdkQf0j4
 HuoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=dQs/81kQ9sItWsv3uUT9nCDzmSJ/uuIEXVPfmClASLU=;
 b=CZSbez5d0VjRI4MFN6W4wgeE78x+3HUNOK4QOBtqYj7MOcJRjnreewzoO0ROFQvW9N
 ybL8j1iHN/xqAI4dvxfma4AYmqpsr6o5R78iWNxJN9lR3AKORPN8acQqQQ411cGO4eq9
 B4sW9TBqjBDKutjGa3ZM1rAnlHTJKpyl8pEz31XfN15TBXadAcrGhBa/l3HZtgExUogz
 hmdwRCSZpa3GdWAIBzOqJayb2nL+aP1p2akEHQFoYgor24o4ALl2hgtv7OPm0O10wDyo
 pEFHfgQ8YKFCTUSutANaU1lgojwVlfeCNk2tE7Rw0/rKjZVMjRY0qihJzt0ujWloI48Z
 7NJA==
X-Gm-Message-State: AA+aEWb6n9VeRpLYcXyBKNAbzcqm63s7Zlnqr1mmvy4NMjlD85eAF7xo
 OOP2lhrlyABzx5Ca/kMxlE/0ZA==
X-Google-Smtp-Source: AFSGD/WqUrM/q+Etuc5TSYeJgKye4qIO6I3bDYFmE5Q9QD5tNspTEa6JXfQD8okAH/O5nnNnbX5lcw==
X-Received: by 2002:a62:938f:: with SMTP id r15mr50006567pfk.27.1546563929841; 
 Thu, 03 Jan 2019 17:05:29 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id v191sm130370820pgb.77.2019.01.03.17.05.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 03 Jan 2019 17:05:29 -0800 (PST)
Date: Thu, 03 Jan 2019 17:05:29 -0800 (PST)
X-Google-Original-Date: Thu, 03 Jan 2019 16:45:44 PST (-0800)
Subject: Re: [PATCH] riscv: remove redundant kernel-space generic-y
In-Reply-To: <1544969471-14224-1-git-send-email-yamada.masahiro@socionext.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: yamada.masahiro@socionext.com
Message-ID: <mhng-029a5523-f3c5-4e90-b679-4e10f1ba4c0f@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190103_170531_431820_A0C9E715 
X-CRM114-Status: GOOD (  14.00  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, alankao@andestech.com, linux-kernel@vger.kernel.org,
 yamada.masahiro@socionext.com, geert@linux-m68k.org, deepa.kernel@gmail.com,
 linux-riscv@lists.infradead.org, Jim Wilson <jimw@sifive.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, 16 Dec 2018 06:11:11 PST (-0800), yamada.masahiro@socionext.com wrote:
> This commit removes redundant generic-y defines in
> arch/riscv/include/asm/Kbuild.
>
> [1] It is redundant to define the same generic-y in both
>     arch/$(ARCH)/include/asm/Kbuild and
>     arch/$(ARCH)/include/uapi/asm/Kbuild.
>
>     Remove the following generic-y:
>
>       errno.h
>       fcntl.h
>       ioctl.h
>       ioctls.h
>       ipcbuf.h
>       mman.h
>       msgbuf.h
>       param.h
>       poll.h
>       posix_types.h
>       resource.h
>       sembuf.h
>       setup.h
>       shmbuf.h
>       signal.h
>       socket.h
>       sockios.h
>       stat.h
>       statfs.h
>       swab.h
>       termbits.h
>       termios.h
>       types.h
>
> [2] It is redundant to define generic-y when arch-specific
>     implementation exists in arch/$(ARCH)/include/asm/*.h
>
>     Remove the following generic-y:
>
>       cacheflush.h
>       dma-mapping.h
>       module.h
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  arch/riscv/include/asm/Kbuild | 26 --------------------------
>  1 file changed, 26 deletions(-)
>
> diff --git a/arch/riscv/include/asm/Kbuild b/arch/riscv/include/asm/Kbuild
> index 6a646d9..f7068f3 100644
> --- a/arch/riscv/include/asm/Kbuild
> +++ b/arch/riscv/include/asm/Kbuild
> @@ -1,5 +1,4 @@
>  generic-y += bugs.h
> -generic-y += cacheflush.h
>  generic-y += checksum.h
>  generic-y += compat.h
>  generic-y += cputime.h
> @@ -7,18 +6,12 @@ generic-y += device.h
>  generic-y += div64.h
>  generic-y += dma.h
>  generic-y += dma-contiguous.h
> -generic-y += dma-mapping.h
>  generic-y += emergency-restart.h
> -generic-y += errno.h
>  generic-y += exec.h
>  generic-y += fb.h
> -generic-y += fcntl.h
>  generic-y += hardirq.h
>  generic-y += hash.h
>  generic-y += hw_irq.h
> -generic-y += ioctl.h
> -generic-y += ioctls.h
> -generic-y += ipcbuf.h
>  generic-y += irq_regs.h
>  generic-y += irq_work.h
>  generic-y += kdebug.h
> @@ -27,34 +20,15 @@ generic-y += kvm_para.h
>  generic-y += local.h
>  generic-y += local64.h
>  generic-y += mm-arch-hooks.h
> -generic-y += mman.h
> -generic-y += module.h
> -generic-y += msgbuf.h
>  generic-y += mutex.h
> -generic-y += param.h
>  generic-y += percpu.h
> -generic-y += poll.h
> -generic-y += posix_types.h
>  generic-y += preempt.h
> -generic-y += resource.h
>  generic-y += scatterlist.h
>  generic-y += sections.h
> -generic-y += sembuf.h
>  generic-y += serial.h
> -generic-y += setup.h
> -generic-y += shmbuf.h
>  generic-y += shmparam.h
> -generic-y += signal.h
> -generic-y += socket.h
> -generic-y += sockios.h
> -generic-y += stat.h
> -generic-y += statfs.h
> -generic-y += swab.h
> -generic-y += termbits.h
> -generic-y += termios.h
>  generic-y += topology.h
>  generic-y += trace_clock.h
> -generic-y += types.h
>  generic-y += unaligned.h
>  generic-y += user.h
>  generic-y += vga.h

Thanks.  These just sort of collected there because I hadn't trimmed them.  Is 
there a script that checks these?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
