Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D7BC352A1
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Dec 2022 08:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qFQSFPWQRjagLF1OYdggy3Zseu0BAkoxZAe4NhcrCSE=; b=YavA8PIT7hWNz9
	jDrkz41QEFdVCbPtPl3YR91ssH82lxzNeVoFxGyQDztFEgk/DCa8J9+rgVnaSY2btsULuOhpkeban
	J88s8vg219hzx/dlU9NTxRbCtCbO7Pn6jIjRcObdM1klZbg0oVn3zgzuWyoQ7JDPzxgPHGNZQ6Sf9
	PRPD3cCkRw3E2K7BR+tP+GDt84B9xt6QTB/0aZ7nbGiNFceCuLGaYzi1P/GuLOFXKanOdiTQFZfd8
	ZUf10FnRNrM0vBabLiuoHrfzIlcYfu7qTU6/NBO+hCaNx1bEQNJNjhtxTyoGjKcNfLEs7gcqWgfLz
	nj7sdHduh4wg1Z3VPTdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2q7M-00FVlE-BJ; Wed, 07 Dec 2022 08:49:28 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2q7I-00FVZx-52
	for linux-riscv@lists.infradead.org; Wed, 07 Dec 2022 08:49:26 +0000
Received: by mail-pl1-x632.google.com with SMTP id k7so16403047pll.6
        for <linux-riscv@lists.infradead.org>; Wed, 07 Dec 2022 00:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Zl9k/tZmp2M3o9vWoGulbXjLnLmB2CSaqWgooXVeYYU=;
        b=tS2oNFlGx3C9xWFvpfeDWnftFCAWWLKgbr873HqhSro9BiCPD60udKR9UZPKNu5BmF
         wxgal9hkNwdvLGlCaWURux1nPfYpfkkWQY77B0nevM1n8Vyqlw99ObdNrgmFt7aFnOId
         IesF4ChxLOecr2GdWMtehTpdPG0JOKGtIiaR8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zl9k/tZmp2M3o9vWoGulbXjLnLmB2CSaqWgooXVeYYU=;
        b=4Su8qYzUPWGy5jTbvA+f68ALlE4NarzQHuPPvAHMJQyC5B/KelKeqHYIK0IoogC8Es
         bu2YTL1DAVQVyq/i98T9iWc3mR+dEuXyLKHnBrwu7TQqem7UBD43ofcy1Bfva9lw8mxS
         BZfdkfUL3sBwAEnx7tl56bYQu6fD7TalbZTGD68Yd4exesb8pdPZ3JPTduiNbp3egx48
         nEUTZ/HyIxeCt5zpbxFmyd72toql3eMtTcMlU5G+T5hXr9+9NAg/S6q61zjhNPXTQTDB
         LZ0c/QhgSvKlXnpgBiU33mtRGFvEIMh0udiMx61DKw0+KskHl5ydMweHLSPeXnGevOv0
         LC+Q==
X-Gm-Message-State: ANoB5plJDf76klCcvpI5OGyqh1hxrE+lheQ+wLS9/Z+4MGW2ZG8JNK/H
	XHlnhF8QKn/AJVcfugsjrH3NZQye5vJ5FoPivAJLmHS/ctIa
X-Google-Smtp-Source: AA0mqf5h6+Kn6yPACpEkecizghlMvEO4Hy7piJ4SZ6qUbMT3xofyJmjyHj356aso6Re5g/af83ZCSQykzu7oCurn1Ec=
X-Received: by 2002:a17:902:f095:b0:189:b352:a236 with SMTP id
 p21-20020a170902f09500b00189b352a236mr29549866pla.75.1670402961343; Wed, 07
 Dec 2022 00:49:21 -0800 (PST)
MIME-Version: 1.0
References: <20220718170205.2972215-1-atishp@rivosinc.com> <20220718170205.2972215-9-atishp@rivosinc.com>
 <20221101153112.hpst2bohsdvqours@kamzik> <CAOnJCU++M5jd6toy1J8T+FPGJWSUaw8s9X7sxZY25naPoZeJJw@mail.gmail.com>
 <20221123142254.2mc3j27kgw37jblv@kamzik> <CAOnJCULCHZXLG18BNw=Fn8UaNb8hSMuvLAsA+j_4mX+_B27MYg@mail.gmail.com>
 <20221202113708.5sxbpnayj75xg6jp@kamzik>
In-Reply-To: <20221202113708.5sxbpnayj75xg6jp@kamzik>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 7 Dec 2022 00:49:09 -0800
Message-ID: <CAOnJCULeEupPNkttCxf5VRoKkff_pdXkZU8SfN-QSu9w-wz4Lw@mail.gmail.com>
Subject: Re: [RFC 8/9] RISC-V: KVM: Implement perf support
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, Guo Ren <guoren@kernel.org>, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Will Deacon <will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_004924_231328_F07F0BE5 
X-CRM114-Status: GOOD (  38.19  )
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

On Fri, Dec 2, 2022 at 3:37 AM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Fri, Dec 02, 2022 at 01:08:47AM -0800, Atish Patra wrote:
> > On Wed, Nov 23, 2022 at 6:22 AM Andrew Jones <ajones@ventanamicro.com> wrote:
> > >
> > > On Tue, Nov 22, 2022 at 04:45:16PM -0800, Atish Patra wrote:
> > > ...
> > > > This brings up another generic error returning problem in KVM SBI
> > > > land. Usually, SBI error code numbers do not
> > > > align with Linux error codes to accommodate other operating systems.
> > > > However, most of the SBI error codes
> > > > have 1-1 relationship with the Linux error code.
> > > > Thus, kvm internal code returns a Linux specific error code and
> > > > vcpu_sbi will map those to SBI error code using
> > > > kvm_linux_err_map_sbi.
> > > >
> > > > However, this will not work for SBI_ERR_ALREADY_STARTED/STOPPED as
> > > > there are no corresponding
> > > > Linux specific error codes. We can directly return the SBI error codes
> > > > from vcpu_pmu.c and modify the
> > > > kvm_linux_err_map_sbi to pass through those. In that case, we can't
> > > > map any linux error code that
> > > > collides with SBI error code. Any other ideas to handle this case ?
> > > >
> > >
> > > It seems like we should drop kvm_linux_err_map_sbi() and add another
> > > parameter to kvm_vcpu_sbi_extension.handler for the SBI error. Another
> >
> > That will just move the problem from the generic SBI layer to
> > extension specific layer.
> > The root problem remains the same as we can't expect the individual
> > extension to return
> > a valid linux specific error code.
>
> I'm saying we return both from the extension specific layer, particularly
> because only the extension specific layer knows what it should return.
> KVM's SBI handlers currently have a return value and *out_val. *out_val
> maps directly to SBI's sbiret.value, but the return value does not map to
> SBI's sbiret.error. But, all we have to do is add *error_val to the
> parameters for the extension handler to get it. Then, cp->a0 should be set
> to that, not the return value.
>

Ahh. Yes. That will solve this issue.

> >
> > Maybe we can relax that requirement. Thus, any extension that has
> > additional SBI error codes
> > may opt to return SBI error codes directly. For example, PMU extension
> > implementation will
> > directly SBI specific error codes from arch/riscv/kvm/vcpu_pmu.c. In
> > future, there will be other
> > extensions (e.g TEE) will have many more error codes that can leverage
> > this as well.
> >
> > Does that sound reasonable ?
>
> I think we need both the Linux return and sbiret.error. The return value
> indicates a problem *with* the emulation, while the new parameter I'm
> proposing (*error_val) is the return value *of* the emulation. Normally
> the Linux return value will be zero (a successful Linux call) even when
> emulating a failure (*error_val != SBI_SUCCESS). When the return value
> is not zero, then there's something wrong in KVM and the return value
> should be propagated to userspace. We could also set the exit_reason to
> KVM_EXIT_INTERNAL_ERROR, but KVM_EXIT_UNKNOWN is probably fine too.
>

Agreed. I revise the series accordingly. Thanks!

> >
> > > option is to continue mapping SBI errors to Linux errors, e.g.
> > > SBI_ERR_ALREADY_STARTED == EBUSY, but that may not be too easy in
> > > all cases and the errors become ambiguous, as we can't tell if the
> > > Linux implementation generated the error or if the SBI call did.
> > >
> >
> > We can't distinguish between SBI_ERR_ALREADY_STARTED/STOPPED in that case.
>
> That's why I only suggested using EBUSY for STARTED. Mapping STOPPED
> was left as an exercise for the reader :-)
>
> Thanks,
> drew



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
