Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E43BEC71159
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Jun 2025 22:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ktRGeqoflbPFKK/j1iESNl+ayNwb9xGahs9DItjTq64=; b=4PqONuZpXbdXwa
	XoFdKWgwDjuSgHe9hlSUJ6BHWiMpwhAGFFZ1v2U+xpQ9/V7K31eHrWKeMIfVkme6Kfo1Dp9581HXQ
	5CDvltj3+hu3FmmKm9I0nJmU5luS13CCgBpO9koDIpp+hLqFZk6jMJ1qMWSAuXT/YvxRyNubEy7JS
	83154hEyOe6ENbyoB/oeGKj6lQeY0/9xrgNBJQ6q47Qycq0phaeXYyZte76KPftwQxqWMaTUF7wWT
	txn9cKUsmC9iWVYn09H6jthbwpniuyPaPkSGPIYxQkBRvLUrHAClZbUZnmKiyFkk6gQT3fvusfrol
	sYbDk/aiVbndA27GVcjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRIeB-00000005kTo-2T8n;
	Mon, 16 Jun 2025 22:49:47 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRId9-00000005k8b-0Art
	for linux-riscv@lists.infradead.org;
	Mon, 16 Jun 2025 22:48:44 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-b2f645eba5dso4265758a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 16 Jun 2025 15:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1750114122; x=1750718922; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M5MKlGMo/Y/oFCdx2nlJ74RnHZKCLouEEWcf+WQNQXM=;
        b=gsxl+m/yTTPSU4ngRJkaxlwVMz0AY54rlNH2Z1vyTPRuB3qUuu/KhLXIfZDjhxbI3m
         8wvQOJDysKU1/GqOjo36xyCBz1X6n9Go350IGQMu77zpGd93yqGbUuIr9ouSKKwwcBdP
         LmwPW5++LcnQJ3slcGJC9kp2YJn5Iq6AwL2JoaF+sec32rgfut+YTilKIIzX+TtXG3hi
         Q9b1h45GJvsVTCHLk6fb3tcpo8TKJM+1QPZYC5117jnbVZUQr0FByIgKjjWOYUReIPT7
         dTb/2A8GMcI6T1wVL1MulkhzaSedfk0TNrRqqwDDWB5FG9TexhaUhyl15wDf5qKS3Nzq
         2oTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750114122; x=1750718922;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M5MKlGMo/Y/oFCdx2nlJ74RnHZKCLouEEWcf+WQNQXM=;
        b=lYQeJ7TucWtOTA5hzsalXTqJ/3v4wITlYKBezLG2UqXbs7kdlDETiOA4raI1YtcuwA
         4ZA7zud2XqjwBrJgyneiWM6oQqRHr+nzbaxFHaMgufKcW6MI+KfcyDkR3s8U43hQFTJB
         FdjrI3Wm+/KYnfyVQeHWA+hutS4uONLaFCO6JVR1SlM4H6Y9/6ykreTmt8WhoRjqbK27
         IrwpHPY8ZtJWAVGDEt9KrEYtkng5GnKK679zPZwPU81+o0pMpSuObW7iwDReqRefhIMr
         JvdeaBIS8yjYgJFaZhXoxtv/tgUYCf5zTDc00CFpm3A9Zig3MT8Q+Huv18kZqD8ZXkZs
         c66A==
X-Forwarded-Encrypted: i=1; AJvYcCWLVrBjAST4mLPFTlTxCN9ZR9YapNd42J/1Htlparm2IEi2eNPEdX/snhURwwtcUmfryjyhFvj6kZVa3A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0v3apw8HCOGZ09B5hk0EFLglALOzgpnT8R9Hy8rSI05Jh9oLK
	Bp5HYfwJaCO9NELtWmIG43jXqsp1x8OwGeNRvP/uCYYQLaKbH0D5BmCGs7prb4Iis/g=
X-Gm-Gg: ASbGncv+YSmosTIYCNSIveH/vNDb5TeIi8qflxQ/ElGRSV+coeWzLS5T+mmP67tgUwZ
	4vCwyaDd4zKjgpq/oXiz1Eqwxk36yH7qAzCzcX2hUPH3+sXl1ZEDI+UcYw4Bcvl93R1R5mvraWY
	X9sjyuAI7JU9dE5Fs3JuBY77vFpxuNEN1zJbgfBN51Ybo4weTBy5s5vyBVw3NqUv0110mFA4xpb
	IROK5mfSh6uHaR8n4P6mxPIGXUqvYXx7m9BgoJqNfaOXHPlYbN5lH8+gp2EmNmTGJBwdjFmmlxC
	upUDyUQTpJwOkSXeXQImApIh0SmFCKwqYkEvTumRrfRKO9QdcT09FC0ZKTcu9e83VzNp0Bc=
X-Google-Smtp-Source: AGHT+IHQRKfHIsYPzKRwIbkrl0eLIF3m6gVqJfgafBqJvoMu254KkIVFJW52LWiByhMuvZMNxSr5/A==
X-Received: by 2002:a17:90b:4f49:b0:313:17d0:b066 with SMTP id 98e67ed59e1d1-31427cfacb2mr499738a91.7.1750114121737;
        Mon, 16 Jun 2025 15:48:41 -0700 (PDT)
Received: from x1 (97-120-250-80.ptld.qwest.net. [97.120.250.80])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d8a17fasm66871805ad.65.2025.06.16.15.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 15:48:41 -0700 (PDT)
Date: Mon, 16 Jun 2025 15:48:39 -0700
From: Drew Fustini <drew@pdp7.com>
To: palmer@dabbelt.com
Cc: bjorn@kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] RISC-V: Clobber V registers on syscalls
Message-ID: <aFCfRxG+XB13VFBF@x1>
References: <87v8fjjmyn.fsf@all.your.base.are.belong.to.us>
 <mhng-6bb8dac2-33c3-410f-82ce-36554e497e9c@palmer-ri-x1c9>
 <aFCbF/g+wxOwI3af@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aFCbF/g+wxOwI3af@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_154843_202600_C7D0AA29 
X-CRM114-Status: GOOD (  32.85  )
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

On Mon, Jun 16, 2025 at 03:30:47PM -0700, Drew Fustini wrote:
> On Mon, Jun 19, 2023 at 12:05:43PM -0700, Palmer Dabbelt wrote:
> > On Mon, 19 Jun 2023 12:01:20 PDT (-0700), bjorn@kernel.org wrote:
> > > Palmer Dabbelt <palmer@rivosinc.com> writes:
> > > 
> > > [...]
> > > 
> > > > > > +		riscv_v_vstate_off(regs);
> > > > > > +
> > > > > 
> > > > > Not off, right? Isn't it __riscv_v_vstate_clean() that you'd like to
> > > > > call? Something like:
> > > > > 
> > > > > static void vstate_discard(struct pt_regs *regs)
> > > > > {
> > > > >        if ((regs->status & SR_VS) == SR_VS_DIRTY)
> > > > >                __riscv_v_vstate_clean(regs);
> > > > > }
> > > > > 
> > > > > Complemented by a !V config variant.
> > > > 
> > > > I think it's just a question of what we're trying to do here: clean
> > > > avoids the kernel V state save, but unless the kernel decides to use
> > > > V during the syscall the register contents will still be usable by
> > > > userspace.  Maybe that's fine and we can just rely on the ISA spec,
> > > > though?  I sent another patch to just document it in Linux, even if
> > > > it's in the ISA spec it seems worth having in the kernel as well.
> > > > 
> > > > That said, I think the right thing to do here might be to zero the V
> > > > register state and set it to initial: that way we can prevent
> > > > userspace from accidentally relying on the state save, but we can
> > > > also avoid the trap that would come from turning it off.  That lets
> > > > us give the hardware a nice clean indication when the V state isn't
> > > > in use, which will hopefully help us avoid the save/restore
> > > > performance issues that other ports have hit.
> > > 
> > > FWIW, I think that's a much better idea than turning V off. I also like
> > > that it'll preventing userland to rely on pre-ecall state.
> > 
> > OK, anyone else opposed?
> > 
> > We're kind of in the weeds on performance, I think we'd need HW to know for
> > sure if either is an issue.  Seems best to just play it safe WRT the uABI
> > for now, we can always deal with any performance issues if the exist.
> 
> I've tested the impact of riscv_v_vstate_discard() on the SiFive X280
> cores [1] in the Tenstorrent Blackhole SoC [2]. The results from the
> Blackhole P100 [3] card show that discarding the vector registers
> increases null syscall latency by 28%.
> 
> The null syscall program [4] executes the vsetvli vector instruction and
> then calls getppid() in a loop for 1 million iterations. The average
> duration of the syscall is 201 ns with a branch based on v6.16-rc1 [5].
> This is with the current upstream behavior where do_trap_ecall_u() calls
> riscv_v_vstate_discard().
> 
> I then created a new branch [6] which disables riscv_v_vstate_discard().
> The average duration of the syscall drops to 143 ns.
> 
> Would some sort of tunable be acceptable to allow the user to opt out
> of the v state discard? Maybe a kernel cmdline argument?
> 
> Thanks,
> Drew
> 
> [1] https://www.sifive.com/document-file/x280-datasheet
> [2] https://tenstorrent.com/en/hardware/blackhole
> [3] https://github.com/tenstorrent/tt-bh-linux
> [4] https://gist.github.com/tt-fustini/fa793a35c34f07059d8a7427e1cd8e84
> [5] https://github.com/tenstorrent/linux/tree/tt-blackhole-v6.16-rc1
> [6] https://github.com/tenstorrent/linux/tree/tt-blackhole-v6.16-rc1_no_vstate_discard

Adding Palmer's current email address.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
