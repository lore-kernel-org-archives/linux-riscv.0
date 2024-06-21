Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A0BC2BBCA
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2024 12:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5DMSaVfDpOAQNw/uktTh2Z5dPcpH0Tqny7YfbofCeEw=; b=mmgM1R/TqC/8kU
	3j/eEzEk0DLUTUskyizlvlpqQ4FOEQr8c0EQ4B/8MNlPrVPZQ+CpPWnnHGfcb1dxnNYYPH8rvcX9k
	rDPvsMOpqu0VDPNc/Ch8B/PBnevWILCZym4ZhJ+BdWkHMqstDbe87TrQD1zlAJradUqKJJpREZ4cn
	UaqvJ/tgrmq3EY/dY/iUFkeZZGs2B69I7tueOWmd9uuHk0d9/tixet+WR6qnUUq6aY2gyGwUau2d8
	oUcoqJk9cQ5VBuEK9DX/m8+bohDBxwPx4x8cp0dUg46Z4KpZQcFLrqq3ZPPhx/oQtcOL2BO05ZT/h
	FcAFplaWjut6OKtuKDUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKd2k-000000093Pe-2QBv;
	Fri, 21 Jun 2024 12:07:02 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKd2h-000000093Oc-3rZ2
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jun 2024 12:07:01 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a6fd513f18bso50384766b.3
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jun 2024 05:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1718971618; x=1719576418; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VHJrI7Vqw3c5XD9sXg5PVJnoydMCRn6WSSge8PKtjyc=;
        b=ck/PRbWpfeojU3MEs4EAgljlZpLiM9MB4pgrbXy+zO+93G5lvNL+daLk3M726w6i22
         xhfK9E0qc4nJfZEJIg39QZytBLq6++RmIRTSlpzl4RRLIobvTE8rPZrUF+LGlsIgHbSg
         e9cxadg2oK4RfYehpzEHKudQmjv2MDdiktcy3w3KF7yZeFlk4L5S8K1Se/J4Z+krJ0Qx
         gJT34aKL4NvzMn/REiQvSNSB3YLdStSH+Iaw0n2MPQgd2705uA8cSeT0QENgcNQe3BlM
         26hOGZekjNfz2BTYYzCyZRWgZCS2HVrGKSE5k6cj9GpSVIfKFguDZ4ij9N1loLEX7ZAF
         d8WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718971618; x=1719576418;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VHJrI7Vqw3c5XD9sXg5PVJnoydMCRn6WSSge8PKtjyc=;
        b=ZYJkvgoKjZZbnXVbMG5aWsaHIOpKSknKURbTC4UgfSH/TjZHFLZ4RH7+Jp+KFzplcl
         E7HqSVWPty3wqZcMOy2Td6O1aOy6iiUKQkY7OOklUQ3NlwybzPhkCV4QPLzRmTPmrAV4
         g0Atpt+TjhRRoax8rF5w70J67sdREvbqXg+HF6/PMPLvExmsrMR5J7lh/OkiPz2jzF2X
         1KR1pY2/x+lWHuoxvK09rC70Cvw+fPD8vd5NFekUw/bE4QQVyyIhztL72As2Bu9wlcTe
         QxLFi0JAGGNJNqARL0fHQHRqn+Xchwg1UgayGon8LvqDCj6r2JVoJbwF0LR8Y2Pti8Ra
         luvw==
X-Forwarded-Encrypted: i=1; AJvYcCUJbRP0vRUVyzMY2qrXV0YWALb2/Q7WQy9aai+nk7uKbFjXUop8+yNri08nuJGAQYc6nfmDzNlBS5eZn2MSb9SpGdb/9P8xyFZZrtfflKRd
X-Gm-Message-State: AOJu0YzU2Rzo6UBemPBDkMfz0FTAD47KnD2ukTPSiRZ497sxz1ST4eKb
	8dXlB5L60qbWEh0Om4R08i7d5kSlU/+cMwA/EVG7Qkj83mb16pjpZqbbHUt1350=
X-Google-Smtp-Source: AGHT+IF2EHP5Y+0/X+QcGd8dEyDcv5ub1PMssgA7iavpB36MSQ3omIYrrSlu92gh8QjYHzsmEitT+g==
X-Received: by 2002:a17:907:a0d2:b0:a6f:b5dd:1a49 with SMTP id a640c23a62f3a-a6fb5dd1b35mr532165866b.3.1718971617469;
        Fri, 21 Jun 2024 05:06:57 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fcf5490d9sm76845966b.115.2024.06.21.05.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 05:06:57 -0700 (PDT)
Date: Fri, 21 Jun 2024 14:06:51 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Yong-Xuan Wang <yongxuan.wang@sifive.com>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, apatel@ventanamicro.com, alex@ghiti.fr, greentime.hu@sifive.com, 
	vincent.chen@sifive.com, Jinyu Tang <tjytimi@163.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>, wchen <waylingii@gmail.com>, 
	Samuel Ortiz <sameo@rivosinc.com>, =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Evan Green <evan@rivosinc.com>, Xiao Wang <xiao.w.wang@intel.com>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"Mike Rapoport (IBM)" <rppt@kernel.org>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Charlie Jenkins <charlie@rivosinc.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v5 1/4] RISC-V: Add Svade and Svadu Extensions Support
Message-ID: <20240621-a69c8f97e566ebd3a82654c1@orel>
References: <20240605121512.32083-1-yongxuan.wang@sifive.com>
 <20240605121512.32083-2-yongxuan.wang@sifive.com>
 <20240621-d1b77d43adacaa34337238c2@orel>
 <20240621-nutty-penknife-ca541ee5108d@wendy>
 <20240621-b22a7c677a8d61c26feaa75b@orel>
 <20240621-pushpin-exclude-1b4f38ae7e8d@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240621-pushpin-exclude-1b4f38ae7e8d@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_050700_012862_A0231425 
X-CRM114-Status: GOOD (  40.76  )
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

On Fri, Jun 21, 2024 at 12:00:32PM GMT, Conor Dooley wrote:
> On Fri, Jun 21, 2024 at 12:42:32PM +0200, Andrew Jones wrote:
> > On Fri, Jun 21, 2024 at 11:24:19AM GMT, Conor Dooley wrote:
> > > On Fri, Jun 21, 2024 at 10:43:58AM +0200, Andrew Jones wrote:
...
> > > > It's hard to guess what is, or will be, more likely to be the correct
> > > > choice of call between the _unlikely and _likely variants. But, while we
> > > > assume svade is most prevalent right now, it's actually quite unlikely
> > > > that 'svade' will be in the DT, since DTs haven't been putting it there
> > > > yet. Anyway, it doesn't really matter much and maybe the _unlikely vs.
> > > > _likely variants are better for documenting expectations than for
> > > > performance.
> > > 
> > > binding hat off, and kernel hat on, what do we actually do if there's
> > > neither Svadu or Svade in the firmware's description of the hardware?
> > > Do we just arbitrarily turn on Svade, like we already do for some
> > > extensions:
> > > 	/*
> > > 	 * These ones were as they were part of the base ISA when the
> > > 	 * port & dt-bindings were upstreamed, and so can be set
> > > 	 * unconditionally where `i` is in riscv,isa on DT systems.
> > > 	 */
> > > 	if (acpi_disabled) {
> > > 		set_bit(RISCV_ISA_EXT_ZICSR, isainfo->isa);
> > > 		set_bit(RISCV_ISA_EXT_ZIFENCEI, isainfo->isa);
> > > 		set_bit(RISCV_ISA_EXT_ZICNTR, isainfo->isa);
> > > 		set_bit(RISCV_ISA_EXT_ZIHPM, isainfo->isa);
> > > 	}
> > >
> > 
> > Yes, I think that's reasonable, assuming we do it in the final "pass",
> > where we're sure svadu isn't present.
> 
> I haven't thought about specifically when to do it, but does it need to
> be in the final pass? If we were to, on each CPU, enable it if Svadu
> isn't there, we'd either end up with a system that I suspect we're not
> going to be supporting or the correct result. Or am I misunderstanding,
> and it will be valid to have a subset of CPUs that have Svadu enabled
> from the bootloader?
> 
> Note that it would not be problematic to have 3 CPUs with Svade + Svadu
> and a 4th with only Svade in the DT because we would just not use the
> FWFT mechanism to enable Svadu. It's just the Svadu in isolation case
> that I'm asking about.

I wasn't thinking about the potential of mixmatched A/D udpating. I'm
pretty sure this will be one of those things that is all or none. I
was more concerned with getting the result right and I had just been
too lazy to double check that the block of code you pointed out is
in the right place to be sure there's no svadu. Now that I look, I
believe it is.

> 
> > Doing this is a good idea since
> > we'll be able to simplify conditions, as we can just use 'if (svade)'
> > since !svade would imply svadu. With FWFT and both, we'll want to remove
> > svade from the isa bitmap when enabling svadu.
> 
> Right I would like to move the various extension stuff in this
> direction, where they have a bit more intelligence to them, and don't
> just reflect the state in DT/ACPI directly.
> I've got some patches in mind once Clement's Zca etc patchset
> is merged, think I posted one or two as replies to conversations on
> the list already. An example would be disabling the vector crypto
> extensions if we've had to disable vector, or as you suggest here,
> dropping Svade if we have turned on Svadu using FWFT. I think that makes
> the APIs more understandable to developers and more useful than they are
> at the moment, where to use vector crypto you also need to check vector
> itself for the code to be correct. If I call
> riscv_isa_extension_available(), and it returns true, the extension
> should be usable IMO.

Sounds good to me.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
