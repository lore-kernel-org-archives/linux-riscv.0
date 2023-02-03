Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A79B9C61DA4
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Feb 2023 08:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aKfMo577tH6YPs7K1cZwcNYlXumnrKPNdKDLNzBjIhw=; b=X4DjI3Uf4IMEJk
	XYklHqCB5gQVim5rYotyCWLzCRU2MpHTQvqg3iBKBdwJU2sGfZUpCmlfgtZLjY8WD7qy7NNtGgFGc
	UMqZKRfYFY5TYyFvqVA9ZoB7N7NmfQA5GW02sLerheqldujsDtg7HlxW8aqWn/JP6ThiN51sRULx6
	DqOaaunL5WGflPuUjP/6oyDvrhHIVwGxtzsNyYNkiwAvCef0cQi0bXzptdBIMrkf/BFQNko9SSIZ1
	3U0D0D6ymsEPcovt9e0pLV5ABNyUyvh0xpxK8lDPyRaDbhU9uy1KN/R7aAiXelHSVHg9iq+7wmE0p
	ULKMDK52ksDaHwHc7sVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNr3Q-000vhx-Lm; Fri, 03 Feb 2023 08:04:16 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNr3N-000vel-Lo
	for linux-riscv@lists.infradead.org; Fri, 03 Feb 2023 08:04:14 +0000
Received: by mail-pg1-x533.google.com with SMTP id 7so3102990pgh.7
        for <linux-riscv@lists.infradead.org>; Fri, 03 Feb 2023 00:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=W7HGUCnUWkPRHR5V5XRcjLIGICmpSMabqz1JQFqqS94=;
        b=JBBEC6y4/nuMSIaIZgkJV5xOCCCZNW1vt9C2vNxqEJIucI00kPNjVd5Daefpk7DzOv
         x2VG2RpPPkvIlff95IA3onxoVqlKlbC8ZOtvVypSHcJ7/bTr+JYtDF9M65nFXwgsGDcs
         XCap0AA+foJ3Mfr+CiQtJ/IgHRhYeoYPmVkBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W7HGUCnUWkPRHR5V5XRcjLIGICmpSMabqz1JQFqqS94=;
        b=oArGGO2vg9NRlC7P2wJHuK+SjKnULzq9L0DtsDw4Nw7u36CrOZi/q/dPLA0XOTwICC
         RmBsKuIEmhgnovQqszJ0gKKkLV2N6e0xyetd2p/5Y0T2nPH5T5+01vjE21x93q9ddznI
         NK0XUoQmqhUZXcYPYs0a495ilPRyI8QthoPD/lsd2aiYSOGJNisaCWkWS97VdUNSsTAr
         ICO44UoOl7sAS8Yw+3GFrU2VIdj/BbukJBaMS6rYBIn8o0Bq9I06gvYveT6XX8OzDuL4
         1cVqsXINOqDDtiPfaKLU3U8DkzEyCipXti8Ef03DcxQdNLUOpavJDUiK05WCAmv1+dIP
         +zQA==
X-Gm-Message-State: AO0yUKUhB2EvZNxm1G1PLKBHOO6rJ4NXQ8ojTkmRAekgqg83koEBvRZa
	szB5GD5CMlpBGaZ8Acb5mh+RprJq7Hcgx97XeRA4
X-Google-Smtp-Source: AK7set+xhG1pRqTN1k6V9hR0hMBl60+BvgwGrS8ytdStZKITVce/S9xwAQz2khlmGuFIkG5V0Peh3QOqNcKe4ShjZuA=
X-Received: by 2002:a62:e30c:0:b0:592:8390:8b97 with SMTP id
 g12-20020a62e30c000000b0059283908b97mr1853972pfh.15.1675411452011; Fri, 03
 Feb 2023 00:04:12 -0800 (PST)
MIME-Version: 1.0
References: <20230201231250.3806412-1-atishp@rivosinc.com> <20230201231250.3806412-8-atishp@rivosinc.com>
 <Y9ufoeZ/4obZDJz6@wendy>
In-Reply-To: <Y9ufoeZ/4obZDJz6@wendy>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 3 Feb 2023 00:04:00 -0800
Message-ID: <CAOnJCUKVXGXsFBUE753-HOr_CtN-5Nsq+yBQj1eT13WyU2r54g@mail.gmail.com>
Subject: Re: [PATCH v4 07/14] RISC-V: KVM: Add skeleton support for perf
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrew Jones <ajones@ventanamicro.com>, 
	Anup Patel <anup@brainfault.org>, Eric Lin <eric.lin@sifive.com>, Guo Ren <guoren@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Will Deacon <will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_000413_742518_B6988686 
X-CRM114-Status: GOOD (  15.92  )
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

On Thu, Feb 2, 2023 at 3:34 AM Conor Dooley <conor.dooley@microchip.com> wrote:
>
> On Wed, Feb 01, 2023 at 03:12:43PM -0800, Atish Patra wrote:
> > This patch only adds barebone structure of perf implementation. Most of
> > the function returns zero at this point and will be implemented
> > fully in the future.
> >
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > +/* Per virtual pmu counter data */
> > +struct kvm_pmc {
> > +     u8 idx;
> > +     struct perf_event *perf_event;
> > +     uint64_t counter_val;
>
> CI also complained that here, and elsewhere, you used uint64_t rather
> than u64. Am I missing a reason for not using the regular types?
>

Nope. It was a simple oversight. I will fix it.
Do you have a link to the CI report so that I can address them all in v5 ?

> Thanks,
> Conor.
>
> > +     union sbi_pmu_ctr_info cinfo;
> > +     /* Event monitoring status */
> > +     bool started;



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
