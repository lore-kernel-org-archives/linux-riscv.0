Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 524EAC05027
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jan 2023 07:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E4rSBTXiCEszgoUE4ZDz/lAGjtYwV5+K2nHmVjcFxBQ=; b=Tr7pz0vhKFEwMO
	kww2cfkyNPSefPS+1ucRpAtlDuCob4sBSgbUYdFtgt2jTdt2y023KBdAEWWZEx20/FcSpV9tAesY5
	VU+4+1EJk7Y3jP5UcrYbSbncBMkKKjhKHUxuw7evjLuD9VqS6J+MRIAzhUKX7Vn17XK7HvC2roezs
	3GH9n1fRw2+lR/4llIFviFEMa0eY13u6XbOjF203OOEdrGunlgKJXoWfXQzyuaQy2ZEPGl4SmCniU
	Z6bHG+JHpKxF4orIP5wAEJZedYF23CEY3lN3HagcC1TFzPKeQ9fFyucaFqi5+XSR/c7fx2xzY/vT/
	VqWQ+NPXW5W/W9UUICeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJrBK-00GCvV-Nk; Mon, 23 Jan 2023 07:23:54 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJrB7-00GCqQ-Je
	for linux-riscv@lists.infradead.org; Mon, 23 Jan 2023 07:23:43 +0000
Received: by mail-wr1-x42a.google.com with SMTP id r2so9848900wrv.7
        for <linux-riscv@lists.infradead.org>; Sun, 22 Jan 2023 23:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lHDUwD9h83rnJJNpiNqVvc264bAbkxnGNGF4uJhWa/4=;
        b=nTC0VsEDMVCq51+/vS2Hfn5Olr7QgbCq59wjcP1VLY3nsFBTsL9nVs3hLr3gZHz3F1
         6bDu2mSuvfmYwKklX5L966Rl9e+v/8jK7ZYfRQD3Dd92CaTGZuq9+wVT8mQIKi1TWh9m
         VpdsH0uJr6YEhYaoA8bPkoI2NXXNCO+xMcT2fNWjlqlg1XUp1u3GhTftq8WW4bXYfkUL
         PtCazKxBQ3+RiLYsQs8Y6K7Z9yyyL1MAwVxrrCY2VIriyGVrYhWWipgKfaHRxojpI6Lm
         onGXJ8MZBe3A9GJ1cvpgbJcxDdF+kOfBYIXST0clqK1FojNz13ueodHOL2y3Dsvp6/Sg
         yhaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lHDUwD9h83rnJJNpiNqVvc264bAbkxnGNGF4uJhWa/4=;
        b=2bfVaShufDsn0IV0M4gGauukp8r4cfS3Y/5WT3fMq4+kGaFNnKboBkegoVJn3Rdlc9
         kDEFXqgsBAuARzDvba95sSkjNVV1ok+9jvpXdHrKiNsWGMlFv+AA3bRpcFUPAso7kBxr
         HIQpwUxBDSRj1LI6L1Po8RLLTnL8p2raeccRgImsEcBab92vDwbjRFaCHnVR67wto/1E
         fGm3AjpT4dK1WJqP2/QJH1K2z3UflV7RTRxhX8rkkTHbrs+dTDFUo7mj51an4BAXNYdj
         ws9Wkn3RfMhvT6pDuSNAz3U5u+eNfnRVxpcVs/XChXgX8M0/5yPUinU3yX0Jbu9V1LTh
         /+8g==
X-Gm-Message-State: AFqh2krNHNFMHQsg3By985FY6dkvdE7zWQkPHfXLMuYvakV7fWk4tTzj
	Goy6v+rNj0FHmlbJRMlyW1tSgDyedx9MWS3W
X-Google-Smtp-Source: AMrXdXv8xVPK5ZnPEwN9D/XIIKFQAhkecskCNPxBbANGzQ04+rcnNPqSFlI5pwS7jAiL3p5FecVHwA==
X-Received: by 2002:a05:6402:49:b0:49e:33ce:144d with SMTP id f9-20020a056402004900b0049e33ce144dmr41323983edu.37.1674458609281;
        Sun, 22 Jan 2023 23:23:29 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id s1-20020aa7cb01000000b00463b9d47e1fsm21134322edt.71.2023.01.22.23.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 23:23:28 -0800 (PST)
Date: Mon, 23 Jan 2023 08:23:27 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>,
	Eric Lin <eric.lin@sifive.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v2 10/11] RISC-V: KVM: Implement perf support without
 sampling
Message-ID: <20230123072327.4k4ai6mwfy4uc6qq@orel>
References: <20221215170046.2010255-1-atishp@rivosinc.com>
 <20221215170046.2010255-11-atishp@rivosinc.com>
 <20230113114502.hiebgkujduwcmsuk@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230113114502.hiebgkujduwcmsuk@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230122_232341_749563_052F254B 
X-CRM114-Status: GOOD (  21.20  )
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

On Fri, Jan 13, 2023 at 12:45:02PM +0100, Andrew Jones wrote:
> On Thu, Dec 15, 2022 at 09:00:45AM -0800, Atish Patra wrote:
...
> > +	/* Start the counters that have been configured and requested by the guest */
> > +	for_each_set_bit(i, &ctr_mask, RISCV_MAX_COUNTERS) {
> > +		pmc_index = i + ctr_base;
> > +		if (!test_bit(pmc_index, kvpmu->pmc_in_use))
> > +			continue;
> > +		pmc = &kvpmu->pmc[pmc_index];
> > +		if (flag & SBI_PMU_START_FLAG_SET_INIT_VALUE)
> > +			pmc->counter_val = ival;
> > +		if (pmc->perf_event) {
> > +			if (unlikely(pmc->started)) {
> > +				sbiret = SBI_ERR_ALREADY_STARTED;
> > +				continue;
> > +			}
> > +			perf_event_period(pmc->perf_event, pmu_get_sample_period(pmc));
> > +			perf_event_enable(pmc->perf_event);
> > +			pmc->started = true;
> > +		} else {
> > +			kvm_debug("Can not start counter due to invalid confiugartion\n");
>                                    ^ Cannot                             ^ configuration
> 
> > +			sbiret = SBI_ERR_INVALID_PARAM;
> > +		}
> > +	}
> 
> Possibly a spec oversight is that we continue to try and start counters,
> even when we've seen errors. The problem with implementing that is that
> if we have both errors we only return the last one. I.e. one counter
> was already started and another counter resulted in invalid-param, we
> only return invalid-param. We also don't say anything about the number
> of failures / successes. I think we should bail on the first error and
> even stop counters that we started. Callers can then try again after
> correcting their input without potentially getting already-started errors.
> We'd need to change the spec to do that though.
>

Thinking about this some more, the spec doesn't prohibit implementations
from bailing on the first error, so we can do that. But maybe we don't
need to stop the counters we started. We can leave it to the driver to
sort out what got configured/started and what didn't when it gets an
error.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
