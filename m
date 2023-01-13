Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80FE2C54EBE
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jan 2023 07:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ogVcLkED5sewpjH45AeaMIpnugiJZlr36Q2W9S9z9KI=; b=R2pZTUv9kM2R9r
	busDbsnykO1qETboxW7TvmoBTE6F3gwsYqofxwZ3ddgIimyM7/9ZCY+iKQgPmWmRBGlGxN78NOUN5
	2Jucp1Uy1nYFtBA4mDxV04X8hOhI3+qOz0TPDZwWcENekJb6WZm+CSvEum9n8kwl4jM0+f8AhemDA
	fQ6LY7xNIIBmG9vI9Uq1UXdxD+cewmv4u7xP5omgev9T4uozbeAneWT9OmiNOiEm5Cl/cy6yYrSpp
	bhYy8/SS7Bhu/l4VpK8qYgG3wdLklnjB+WmLzZuFR1yMw7FvmRn5Yo3hm9RThHXiP9eBgOFLlI2M0
	CrY7OCKbZqqL40Ooai2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGERW-000ykz-Fy; Fri, 13 Jan 2023 07:25:38 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGERT-000yjg-I1
	for linux-riscv@lists.infradead.org; Fri, 13 Jan 2023 07:25:36 +0000
Received: by mail-ej1-x633.google.com with SMTP id tz12so50272344ejc.9
        for <linux-riscv@lists.infradead.org>; Thu, 12 Jan 2023 23:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Lhi8jYvVrdulmGHgT4JCBN4U+J8RgOrkfiv27l+MC9E=;
        b=Mju254kQFDcnKmBgFm5I71D0xdTlvOv0r31tdnHhhM+zFUREh+EuS544iYShoeSGHZ
         naTLqjHTCOwLn2zB0rMfercAA8oAORGrw94CWaJ6iqDn8FO9uR58oW3JbfqncFW7vMmk
         MrVaxTDSvqYquqNijOrkV6W44rSeWs356dr6Aed+L+xXDP2U4WnLzjUlCl5mfUTTDl+0
         dyrUgN/CwrHOPSeBI96eNEY+UNRyB1HtF6wujgM/BT7zvDdHThRJKdKNUsWbwJZ5OzIp
         DsSKH/K9NOdkP9fO1yZJyYe20HcXmWtfhLTX57XnEhNyGGYVVy5VS64bfHeOhFz12u98
         I8cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lhi8jYvVrdulmGHgT4JCBN4U+J8RgOrkfiv27l+MC9E=;
        b=diDKAhlUPqUMoN1K8kIezzP2ClzKKcZr69okfuHmKdU7Wo75J9LbCSpBXBNPhtV6Pt
         K+IpMxr3Xl7+SHvVp6gsRc7S/zmKudumgl1hVMOy4iJjE8Hq+ootggErsVV2KpHdU01M
         TLJ5s+dTK12tIUVezJMPjkgLcUSSwXFIvEg6ZRA8wAxh946Y7tHuuWC/gA+bJNtOD6mw
         k7iSusGpWm4WnL+0qKzQ6HDjis1nFg4dSTlYt1cqIwKdfg17i5Pd4ddth2AdqoTuCVjs
         P6xivBSICSIIHcIU93vsYcKRrFW7EYCD60ahcrIOoQ8fWSE5jFhmYCJj90J/9ug8fy/W
         YaPA==
X-Gm-Message-State: AFqh2kqXrYt0P96G2pCoGH0CUo1quY2JJ2Bcqo2oRwbexa3v9Qo1iR12
	eKfbWu6zazHVNesTkMFM2K2SEA==
X-Google-Smtp-Source: AMrXdXveedehEvO/75X4SdeCprtpnLol1R+4zKE3VpgAB7bVmaqC650NTja+r40AXk8ju/+o6bkgAQ==
X-Received: by 2002:a17:907:d684:b0:7c1:11fd:9b98 with SMTP id wf4-20020a170907d68400b007c111fd9b98mr70594615ejc.27.1673594733313;
        Thu, 12 Jan 2023 23:25:33 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id kx1-20020a170907774100b0084d368b1628sm7098072ejc.40.2023.01.12.23.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jan 2023 23:25:32 -0800 (PST)
Date: Fri, 13 Jan 2023 08:25:31 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Kumar Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>,
	Eric Lin <eric.lin@sifive.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v2 03/11] RISC-V: KVM: Return correct code for hsm stop
 function
Message-ID: <20230113072531.xgg5e3rwdjvx7afy@orel>
References: <20221215170046.2010255-1-atishp@rivosinc.com>
 <20221215170046.2010255-4-atishp@rivosinc.com>
 <20230112102839.rsabb2bah5lkkx4e@orel>
 <CAHBxVyFokVx0C+a8LvYrftE=JwuDAHgPRmhMQFtV9LHGqMuJgA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHBxVyFokVx0C+a8LvYrftE=JwuDAHgPRmhMQFtV9LHGqMuJgA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_232535_614691_E192359A 
X-CRM114-Status: GOOD (  19.91  )
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

On Thu, Jan 12, 2023 at 10:25:06AM -0800, Atish Kumar Patra wrote:
> On Thu, Jan 12, 2023 at 2:28 AM Andrew Jones <ajones@ventanamicro.com> wrote:
> >
> > On Thu, Dec 15, 2022 at 09:00:38AM -0800, Atish Patra wrote:
> > > According to the SBI specification, the stop function can only
> > > return error code SBI_ERR_FAILED. However, currently it returns
> > > -EINVAL which will be mapped SBI_ERR_INVALID_PARAM.
> >
> > I presume the mapping referred to here is kvm_linux_err_map_sbi().
> > If so, then -EPERM isn't correct either. That maps to SBI_ERR_DENIED.
> > The only thing that will ensure we get SBI_ERR_FAILURE (-1) is
> > anything not handled by the kvm_linux_err_map_sbi switch, as we
> > need to use the default.
> >
> 
> It returns SBI_ERR_FAILURE in the next patch when kvm_linux_err_map_sbi
> is removed. Maybe I should drop this patch. The next patch does the
> correct thing anyways.

Yeah, I saw that, but then we silently fix a bug in the next patch.
I like that this is a separate patch, but it should do what it says
it's doing :-)

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
