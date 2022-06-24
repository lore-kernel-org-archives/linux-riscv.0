Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A729C43334
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jun 2022 04:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vyhv2WNwGR9zQD9FxIXAnutqxzsVFATnmGu7LTxoNGI=; b=QGVjB8I4Eeu1Ey
	lRZ5gJj0Ziwjx0C5t5bvcAr1qkL55KcOfQ3OCsdirFEHWWQU0xMyWsxHgWOBMajhHaqagT46yhvsh
	edNQBTvclN9W4Okvy2jkO0c/K/MtJkTLT19YFwJY0POtL2Z1j02NughuOSv90/n2ZRc8q0Nxz5NuD
	Kb4w7aR6eEVRDaj6dFXKJ++Rsbzu3hoXuOWJDzUnbbFZDnq1wHfFzIjMv3aihq8wBvaVti5U3NLok
	/BFUJR6fmJsAhDGb5fc2KneGzwR/IRuJQcwex1AVRLHc0TQQcC0cQJVBsiJR5zii+SxYm5ubfmhhH
	mPiwuO5iwwaHlUdc+XZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4aU9-0008V4-V9; Fri, 24 Jun 2022 03:59:57 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4aU6-0008U6-Uh
	for linux-riscv@lists.infradead.org; Fri, 24 Jun 2022 03:59:56 +0000
Received: by mail-wm1-x330.google.com with SMTP id f190so295202wma.5
        for <linux-riscv@lists.infradead.org>; Thu, 23 Jun 2022 20:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LFof6xyQlBViIwxTOHjGB1w+r5Yn7jKYGLlVPj/RtTs=;
        b=Vhl7UlfH/nMtHrPMTkwdg+sFzADiAF4PEgmpUCFd+xSRDTtahQZoq4BDH7/EHpucBj
         u0k7a+wtysIimE171POiJ72ICnddu7YtjUh8zHbZ17l+rBhXY3pib+2m2TETutPBAN52
         Z/V8MZzZKNu7BYyFj5tO+HSYn6Kd+TFgdF4LcDoKP4ThnUsZQrHSM0M/+gJ76Rg4y7Yy
         8mlYv9eWrwdLP+hboln1eFcl29LJis8THLOFvCK+ZqlWrJ4yIOScV778AORXIYeTuuXp
         vFTifDkKEsQ2Nf6z1GnzkiU4YTSbaZzv/1GKJb4gyWTtCg1Xh+l4/GTu1YNhXiwL1VM1
         5nLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LFof6xyQlBViIwxTOHjGB1w+r5Yn7jKYGLlVPj/RtTs=;
        b=R30EoPd52HGBkpOAnw0DKQUIuacgKfVi1VC6Xj+0BC+I2yz0KrB7qGO0Z5+1Y0/BUp
         CSKbLBjySB64XHcPLhJq2sYxO4iyhufhsuBkWmZIhO2ZXJWDfm1WSsL6R6Y3w/a3nMdG
         upz0dcOThrBt7atSfbKq1kN28w+sXglCTL4S8aLq66K9EmUHRWS10/EpfG4SlQIyRzb9
         g/57tE+nYrAVdm/+tfXLyaTD1AM2FQQNpNkFYVss/CIBl6zfVYyvI3lBzRmXxFVNFXcI
         PzUSKjLxb5UjRudp0ABSR4YragsGIIrgX5/CJE1v99/ngzBLqYWLPVASe16K/OCsHocr
         Iv2g==
X-Gm-Message-State: AJIora+rUUJ4oauB2G1J3AkKvrUs7/BcSVLj2pkdEbsINGg5qo2QbOo/
	VL65oBXi1H/us9nCtS39XY1dx5pwtqhTF1D8aCNcPg==
X-Google-Smtp-Source: AGRyM1sLLznWELMcbZGSLGioDuvilsOBSPavnzFCVZAlL/PgMkJWZmTKO+ORiEVxRTtnwU+z8kfHoeJUW6vFifm6xw0=
X-Received: by 2002:a05:600c:1d0b:b0:3a0:3ab8:924 with SMTP id
 l11-20020a05600c1d0b00b003a03ab80924mr1282468wms.137.1656043191791; Thu, 23
 Jun 2022 20:59:51 -0700 (PDT)
MIME-Version: 1.0
References: <bca6d76d-1708-fede-8008-d2588a14b656@mail.ru> <8887d851-19b7-ee10-a89e-fb69d54ac41e@sholland.org>
In-Reply-To: <8887d851-19b7-ee10-a89e-fb69d54ac41e@sholland.org>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 24 Jun 2022 09:29:40 +0530
Message-ID: <CAAhSdy3CoRVs7Rn=TDBRrfqaNEr1R6h4r1cdgGR-QKCtg7QYrw@mail.gmail.com>
Subject: Re: Tickless timer regression in v5.18.3 on riscv
To: Samuel Holland <samuel@sholland.org>
Cc: Sergey Larin <cerg2010cerg2010@mail.ru>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Atish Patra <atishp@atishpatra.org>, Atish Patra <atishp@rivosinc.com>, 
	Sunil V L <sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_205955_029676_ED2D96BF 
X-CRM114-Status: GOOD (  24.54  )
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

+Atish (for Sstc patches), +Sunil (for ACPI support)

On Fri, Jun 24, 2022 at 1:21 AM Samuel Holland <samuel@sholland.org> wrote:
>
> On 6/23/22 1:11 PM, Sergey Larin wrote:
> > Hello,
> >
> > It appears that tickless timer regression was introduced in commit
> > 232ccac1bd9b5bfe73895f527c08623e7fa0752d ("clocksource/drivers/riscv: Events are
> > stopped during CPU suspend").
> >
> > Even though this is a fix for CPU suspend, it causes high idle CPU usage.
> > However, this usage is not reported to userspace, but can be observed in virtual
> > machines like QEMU or RVVM. So the kernel is not tickless now, disabling NO_HZ
> > has the same effects.
>
> The SBI timer extension is not a great clockevent source to start with. It
> requires calling in to M-mode/the hypervisor, both for setting the timer and
> (without Sstc) a trap for handling the interrupt. That is why its rating is only
> 100.

When Sstc is available, the clockevent device rating should be increased (400+).

(@Atish, can you update this in your Linux Sstc series?)

>
> Do your virtual machines have no other MMIO timer device? Practically any other
> clockevent device will be used in preference to this one. And if that other
> device does not have the CLOCK_EVT_FEAT_C3STOP flag, then idle CPU usage will
> not be increased.

I agree. RISC-V Platforms that don't preserve mtimer (MMIO) should have
additional timer in the "always-on" domain for idle wake-up.

>
> > Any ideas why this is needed since CLINT timers should be active in WFI?
>
> The CLINT timers will be active in WFI, but not necessarily in all CPU idle
> states. For example, the T-HEAD C9xx includes the CLINT inside the CPU's reset
> domain[1]. So a nonretentive idle state that puts the CPU in reset will stop the
> CLINT (in addition to resetting the circuitry responsible for delivering the
> timer interrupt).
>
> Also keep in mind that the SBI time extension is not necessarily backed by a
> CLINT. In fact, the SBI specification lists no real requirements for the timer,
> such as minimum/maximum duration or when the timer is allowed to stop. So the
> kernel has to assume the worst case.

Yes, when Sstc is available the SBI time extension will internally use stimecmp
for SW compatibility (recommended by the Sstc specification).

For assuming the worst case and always setting C3STOP in timer-riscv is fine
since we have very few platforms implementing CPU idle states but this will
change soon.

I suggest we introduce an optional "riscv,timer-always-on" DT property for each
HART. If all HART DT nodes have this property then we don't set C3STOP flag
in clockevent device, else we set it.

(Note: Our proposed ACPI ECRs all need this flag in HART capabilities table)

Regards,
Anup

>
> Regards,
> Samuel
>
> [1]:
> https://github.com/T-head-Semi/openc906/blob/main/C906_RTL_FACTORY/gen_rtl/clint/rtl/clint_func.v#L369
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
