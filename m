Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC1EFC4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Dec 2022 09:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TsiOdHyNEekU4/yGnGMSI/bbB/ssrX9NT78IQhSp7Lg=; b=0FIrHI+GdQ/sWQ
	NPOZW0Bj6+udjJxen+GTGqD9ySaeFmYuM7TOgYSib9+Y2WYZAEcW6XnUNR4FxH/u7DDBbMnT2joyg
	xdr+Iji4yh5I5W/D5z1iOMVDfM+IrbhlKOZDFGPZzcFzNzhGo+K/6IbSIlfqO5YIOyLhwsYIHdFOF
	KGeQAOhDcfoxTftYSVAjThzrlyaej84pO7goJYrqdgzKBrDgk9EIUKG6zZEBo0XAgca3wz7v2HPi4
	swzg/FqxRZWX4EP8Or3pP+f/GDsEuazISpf+or0lNhIe6NuBYdEKr9pv5LGsJ+ZEY+zxdn4a3H/L6
	eMMVuRPLIsxTIWmMfd1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p122c-00EpKD-QE; Fri, 02 Dec 2022 09:09:06 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p122Z-00EpGJ-VB
	for linux-riscv@lists.infradead.org; Fri, 02 Dec 2022 09:09:05 +0000
Received: by mail-pl1-x62c.google.com with SMTP id b21so4084673plc.9
        for <linux-riscv@lists.infradead.org>; Fri, 02 Dec 2022 01:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uKuDlheAQlnav8x6wCebRhCDj6K0PqB5VyLpGNot6uQ=;
        b=eFwIUrE3URGqzTcbT11JFGw5DbAFWjIjzCgyRMl0GxK7ZXbtVyfPH0OAB3TkwmySWk
         P0BSDycSCFzmhA/x4pSDiB43sdeXm6W2om7k1lPF398sOj5HuuzvtmZLI37LzY7WMFHa
         kTrQWMX1D3uDeVgjyOolV4R5aCpMR0HTr+xrI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uKuDlheAQlnav8x6wCebRhCDj6K0PqB5VyLpGNot6uQ=;
        b=Txdg4gkqVpDlvGom9tgp1ilSaVd0DjvTI32duD4Pcx02oCZwHSDIEJzLwcRZJiPAi1
         SeCWxbcCdBMwbQkbr/aQyN/uMh0F1HTA5PfyRQEJIgen3OzfIpLApl6quvhcz4yCR2re
         MohtusQPttKGkQj7lkYvZRPbiwFUFiSWULmMFWu4KCIqDdUHUbrqRufxfOg/+VLdjmnY
         dTlEXf0JvFkheeekexoqB82xQ9B7NQQ0k2tJnXg/wMEc7VSQX5tSM7oGwt0KPg6AdcmV
         dJMrvyXOWNvHolkxdvU9uwlzvzEw8N67A6VsEgeuR6o0XPk1L1TODWrISAy/03NgXgPi
         zLYg==
X-Gm-Message-State: ANoB5pnQ3hCWGU11JN9IIeEN7jIQAk3PifUh5kYpXHVc/MhBbbOWk2eg
	W77uYc7i+Snl1y3h6RkRuM3Zkh6etlTK86Us5J+O
X-Google-Smtp-Source: AA0mqf5lRB9PRRAJMtQEDr+mr8TWCBn4M2WVdZNdbbxOIDDfHUKFDXZnwg7nqSUeKoYfsoVMfdSLiL6t+V+z6jscN0A=
X-Received: by 2002:a17:902:f095:b0:189:b352:a236 with SMTP id
 p21-20020a170902f09500b00189b352a236mr7016505pla.75.1669972139006; Fri, 02
 Dec 2022 01:08:59 -0800 (PST)
MIME-Version: 1.0
References: <20220718170205.2972215-1-atishp@rivosinc.com> <20220718170205.2972215-9-atishp@rivosinc.com>
 <20221101153112.hpst2bohsdvqours@kamzik> <CAOnJCU++M5jd6toy1J8T+FPGJWSUaw8s9X7sxZY25naPoZeJJw@mail.gmail.com>
 <20221123142254.2mc3j27kgw37jblv@kamzik>
In-Reply-To: <20221123142254.2mc3j27kgw37jblv@kamzik>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 2 Dec 2022 01:08:47 -0800
Message-ID: <CAOnJCULCHZXLG18BNw=Fn8UaNb8hSMuvLAsA+j_4mX+_B27MYg@mail.gmail.com>
Subject: Re: [RFC 8/9] RISC-V: KVM: Implement perf support
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, Guo Ren <guoren@kernel.org>, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Will Deacon <will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_010904_027000_1D66BDA1 
X-CRM114-Status: GOOD (  22.13  )
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

On Wed, Nov 23, 2022 at 6:22 AM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Tue, Nov 22, 2022 at 04:45:16PM -0800, Atish Patra wrote:
> ...
> > This brings up another generic error returning problem in KVM SBI
> > land. Usually, SBI error code numbers do not
> > align with Linux error codes to accommodate other operating systems.
> > However, most of the SBI error codes
> > have 1-1 relationship with the Linux error code.
> > Thus, kvm internal code returns a Linux specific error code and
> > vcpu_sbi will map those to SBI error code using
> > kvm_linux_err_map_sbi.
> >
> > However, this will not work for SBI_ERR_ALREADY_STARTED/STOPPED as
> > there are no corresponding
> > Linux specific error codes. We can directly return the SBI error codes
> > from vcpu_pmu.c and modify the
> > kvm_linux_err_map_sbi to pass through those. In that case, we can't
> > map any linux error code that
> > collides with SBI error code. Any other ideas to handle this case ?
> >
>
> It seems like we should drop kvm_linux_err_map_sbi() and add another
> parameter to kvm_vcpu_sbi_extension.handler for the SBI error. Another

That will just move the problem from the generic SBI layer to
extension specific layer.
The root problem remains the same as we can't expect the individual
extension to return
a valid linux specific error code.

Maybe we can relax that requirement. Thus, any extension that has
additional SBI error codes
may opt to return SBI error codes directly. For example, PMU extension
implementation will
directly SBI specific error codes from arch/riscv/kvm/vcpu_pmu.c. In
future, there will be other
extensions (e.g TEE) will have many more error codes that can leverage
this as well.

Does that sound reasonable ?

> option is to continue mapping SBI errors to Linux errors, e.g.
> SBI_ERR_ALREADY_STARTED == EBUSY, but that may not be too easy in
> all cases and the errors become ambiguous, as we can't tell if the
> Linux implementation generated the error or if the SBI call did.
>

We can't distinguish between SBI_ERR_ALREADY_STARTED/STOPPED in that case.

> Thanks,
> drew



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
