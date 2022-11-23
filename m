Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ACA2C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Nov 2022 06:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RnMlkFxi0DPKyviUDj5vPzrrMPviT+MQpBN7zFaP9o0=; b=mzlHBf8HRA40SE
	0YDyaGJGgnTg11tNngwRlygaK5Pe7XVURnHDOwCUU/bdpDz0Q4ZvY3UoSLFvI7juvlG9ETEVSe6qF
	Zrb3Bwz8i8d4WLXZLyuS2c1N9ZNDxa6+T24keWIS+do1PuyaEiUuwvNsXwbdQlxTbaKSr+6//OWE/
	nmqPLFeM9+w3yfW2m3L1hLYR377jrLq1U6t2SYoE2AZxe//VJT/fiuop1RTzhMJeYJaMzX33wMea5
	Yfs4K9CjJaNQBJqIiEpJeiIX5SRwqbA/VH9yL7y1lXUv1rjvOR7h0FDk/4cA0EcZd4QJ4qX9ag62A
	uLQ/DFOciXvSKhvONpLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxiyM-00Ea1u-GK; Wed, 23 Nov 2022 06:11:02 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxiyJ-00EZzC-BM
	for linux-riscv@lists.infradead.org; Wed, 23 Nov 2022 06:11:00 +0000
Received: by mail-ej1-x631.google.com with SMTP id me22so23914923ejb.8
        for <linux-riscv@lists.infradead.org>; Tue, 22 Nov 2022 22:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JGvVdP4Bfqpyp04bVG1cXRkrqOMcPwJMTXjgeo53p+s=;
        b=M/y/zA1uDiiVj/EruxGP9KEs1YbPQIbTnermjdkVNQA8VpLr5HM7sB4LKRxhfe1wD1
         K829fQNQUYNh2L7PFj7nPms2MQSu/jeuWHHlvXItKQBAFL0R/BZ2nxX7O7AyJ6Sf1Fvr
         kGh6l+kPGZLGJG0lu3mzhU9URnYS05SqttXrLo0EpFXNetQjRnuug6PlVwHSs/0VIE/F
         V4qduc2Nza7SHH7b8q+NERlhr9d6EagE2ckIj59VHKBtZkPTN21d7fHZwBUyugnfc1rD
         mLSarAjiScwhoCnrKL7a256NaI3CW2CniGIKfG1aBbENQIduMZvaF9SJqxOOZLH1t5Fd
         SEHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JGvVdP4Bfqpyp04bVG1cXRkrqOMcPwJMTXjgeo53p+s=;
        b=KlRH8HZjzY8BxPlHxjUTKTEs4sZXgb2dBnA93CYWyeU8TBT0dSvAw6PpsBKx9W7ZKy
         GZpqCXJ87thPLnn0YzM0EPx1Z1/uJme/uBb5YLopgprQaDDCtT3LeyciHBDhGygdyJAG
         qrmKVmwr0PJQcwlLbGfurqRqQfRV7/EyN9WZHpZIylyzqM+FEFgVpHGIz13Bnnw1Q9bP
         bPWVfCfKWiss5HJGJVAghrURkeEPQxC7W2Yc7y1+JhK/9nJoNGfmlD/L7at9IxhFc7WX
         691O/W7qvT1VUeKVUFaIvs9WA0uFTwNyiN1BQL4o3auAIHJgEf7IN4Rx0WEcjNxkeLXd
         riyA==
X-Gm-Message-State: ANoB5pkfMG4jFkGI11bRAvQXpnsoqqZB3YSHVNjxmVoP+hlV2gr2fcCn
	PpQY5iIPgtjLguO5pukMJSvIs9fuLKuHCemVKQ4TGA==
X-Google-Smtp-Source: AA0mqf6KC6rJnQPiXQL9dC06y5s4WgnywzBbCSISnORalCt40iRqvLUGpzy6QRwCNuvIN6mg5FLen5RfmQMvh+CuO7o=
X-Received: by 2002:a17:906:a0d7:b0:7b2:7af0:c231 with SMTP id
 bh23-20020a170906a0d700b007b27af0c231mr21851245ejb.240.1669183854972; Tue, 22
 Nov 2022 22:10:54 -0800 (PST)
MIME-Version: 1.0
References: <mhng-6299f108-11af-4e70-9981-d7e7b3be0b9a@palmer-ri-x1c9>
 <57114829-c205-dece-abdb-1100947286d4@sholland.org> <CAK9=C2WLOa_zgboFE5UCgnwMB-kbWMAVtmXsBxoswqY63-5QHw@mail.gmail.com>
 <a591599e-d133-e19a-4898-5645c3862daa@sholland.org>
In-Reply-To: <a591599e-d133-e19a-4898-5645c3862daa@sholland.org>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 23 Nov 2022 11:40:43 +0530
Message-ID: <CAAhSdy2VdX9VivbuRhjN0cPXTi=nFWdiPwFs+hUv6iMqZu-q5g@mail.gmail.com>
Subject: Re: [PATCH] cpuidle: riscv-sbi: Stop using non-retentive suspend
To: Samuel Holland <samuel@sholland.org>
Cc: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	conor.dooley@microchip.com, Conor Dooley <conor@kernel.org>, rafael@kernel.org, 
	daniel.lezcano@linaro.org, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, 
	linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_221059_602046_7DCE0EFD 
X-CRM114-Status: GOOD (  23.56  )
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

On Wed, Nov 23, 2022 at 11:08 AM Samuel Holland <samuel@sholland.org> wrote:
>
> Hi Anup,
>
> On 11/22/22 23:35, Anup Patel wrote:
> > On Wed, Nov 23, 2022 at 10:41 AM Samuel Holland <samuel@sholland.org> wrote:
> >> On 11/22/22 09:28, Palmer Dabbelt wrote:
> >>> I also think we should stop entering non-retentive suspend until we can
> >>> sort out how reliably wake up from it, as the SBI makes that a
> >>> platform-specific detail.  If the answer there is "non-retentive suspend
> >>> is fine on the D1 as long as we don't use the SBI timers" then that
> >>> seems fine, we just need some way to describe that in Linux -- that
> >>> doesn't fix other platforms and other interrupts, but at least it's a
> >>> start.
> >>
> >> We need some way to describe the situation from the SBI implementation
> >> to Linux.
> >>
> >> Non-retentive suspend is fine on the D1 as long as either one of these
> >> conditions is met:
> >>  1) we don't use the SBI timers, or
> >>  2) the SBI timer implementation does not use the CLINT
> >>
> >> And it is up to the SBI implementation which timer hardware it uses, so
> >> the SBI implementation needs to patch this information in to the DT at
> >> runtime.
> >
> > Rather than SBI implementation patching information in DT, it is much
> > simpler to add a quirk in RISC-V timer driver for D1 platform (i.e. based
> > on D1 compatible string in root node).
>
> It would be simpler, but it would be wrong, as I just explained.
>
> Only the SBI implementation knows if the SBI timer extension can wake
> any given CPU from any given non-retentive suspend state.

The SBI implementation would derive this information from platform
compatible string which is already available to the Linux kernel so
why does SBI implementation have to patch the DTB and put the
same information in a different way ?

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
