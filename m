Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C344CC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Nov 2022 09:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Giw+LYPAbzjgF2ELInQl9Imv+/0lDbP0DVdd9UQLyQU=; b=FyBI8/ZYfsIg0D
	Z3YEbu2Mby6IVw/y/+jOOKqYiLfqSiw8dNwe4U7lDQd/RyDyX1ijykLWh3mkt34NKfrC3wZ3b5Ngu
	q5zYkgg2g1Ytu/VLWedF/dG8Q3EGzNHpf27vZilnYI9xTjamfTchgVZ5bu2QVfH7D/dRlVs2xLygo
	QkB9GtqcR/fZWAS+kbFH8+fIn8Gkp4BjCyZTgS+x28zF1LCvQLXaPnFMwNzP71E/S7CVrJQxMPD7q
	ZZXOc5bF1legrW80D+No3poHoaUmThZA34Aj4c2iRWFyhVuEYu6L/L0lV5Q7bb9qUuYZvuWDkgLaJ
	CQgsw9IyiWuhc33rejuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy89r-006qNp-64; Thu, 24 Nov 2022 09:04:35 +0000
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy89k-006qGe-HF
	for linux-riscv@lists.infradead.org; Thu, 24 Nov 2022 09:04:31 +0000
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-1322d768ba7so1322443fac.5
        for <linux-riscv@lists.infradead.org>; Thu, 24 Nov 2022 01:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GskdefzDhpEJdGPupN73trBGgVe2XcooqSs6tZjZg+E=;
        b=clwCIfMJqaJ0fQEwDkADVQu6BE0lfReVFb9n6+9d/WHIJrWK8pmsDFzcHSNh+q5FL5
         iKMqTRrVgT6nmZgmVV5KZe1LTGExe3COTBFaCFVkThZC3MzR6gY8ibDhMstZoLLjE1+j
         CXZ9MEW17ik+wp8O823aI2Z2hERUesuhNOmSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GskdefzDhpEJdGPupN73trBGgVe2XcooqSs6tZjZg+E=;
        b=zZc4VyrLGqkRPuPfftJI+ybzL+RreGPhesxCbQFOnuSzDteT6nazoVA3GWfukC8+u+
         YT+fe4mT+XBM6LlHlfwic/2boRRdW3dIZ/jn2cEwUkxip2XoPENa0NQot2cdqBftXcrU
         ad/GAzKvYiDn35QcrbSKdWu0hhWjqqwm/Buf2QNSsSibh1L5cw7L8DzN+axQWxlNVInA
         YFtpv35qDRNhw+0yENKRjthe2BH8MY5Mwc8/n/U2WNZ/M+FhaSPjBkBdrnJ8rdtcB2W+
         NsFWBrnuuZQUBsDZeCPTvbEpaYK7EK+fTmzns6sAoWbjL/o3YfNWbTG+LjYHtTd2f7Sw
         uc3Q==
X-Gm-Message-State: ANoB5pkxPsfMEgqPex9Y5UnY+/7nSCNEenlNmkhMRJj+BsITpHTwctfU
	sLshpt5zN1Mds3rtdwSkRCWBBrJ22oeYPvmSSKty
X-Google-Smtp-Source: AA0mqf48nDcZ5pOw8inOJMr+cmGIXfYN/bZRBYRNG8WluVWZ7S+k4L2pJQZvJLssjgZFGEwvT+XVs+wM4BU4BUdqbpM=
X-Received: by 2002:a05:6870:c18a:b0:142:870e:bd06 with SMTP id
 h10-20020a056870c18a00b00142870ebd06mr15305401oad.181.1669280666095; Thu, 24
 Nov 2022 01:04:26 -0800 (PST)
MIME-Version: 1.0
References: <20220718170205.2972215-1-atishp@rivosinc.com> <20220718170205.2972215-6-atishp@rivosinc.com>
 <20221101141329.j4qtvjf6kmqixt2r@kamzik> <CAOnJCULMbTp6WhVRWHxzFnUgCJJV01hcyukQxSEih-sYt5TJWg@mail.gmail.com>
 <CAOnJCUKpdV3u8X6BSC+-rhV0Q8q2tdsa8r_KTH5FWCh2LV2q8Q@mail.gmail.com> <20221123133636.gke3626aolfrnevy@kamzik>
In-Reply-To: <20221123133636.gke3626aolfrnevy@kamzik>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 24 Nov 2022 01:04:15 -0800
Message-ID: <CAOnJCULUH09HPZL6Ks-xUsiDLQPR6xOv2g+ic9Gd3uwea6hCyQ@mail.gmail.com>
Subject: Re: [RFC 5/9] RISC-V: KVM: Add skeleton support for perf
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, Guo Ren <guoren@kernel.org>, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Will Deacon <will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_010428_877698_7AD50ED2 
X-CRM114-Status: GOOD (  20.02  )
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

On Wed, Nov 23, 2022 at 5:36 AM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> ...
> > > > > -     csr_write(CSR_HCOUNTEREN, -1UL);
> > > > > +     /* VS should access only TM bit. Everything else should trap */
> > > > > +     csr_write(CSR_HCOUNTEREN, 0x02);
> > > >
> > > > This looks like something that should be broken out into a separate patch
> > > > with a description of what happens now when guests try to access the newly
> > > > trapping counter registers. We should probably also create a TM define.
> > > >
> > >
> > > Done.
> > >
> >
> > As we allow cycles & instret for host user space now [1], should we do the same
> > for guests as well ? I would prefer not to but same user space
> > software will start to break
> > they will run inside a guest.
> >
> > https://lore.kernel.org/all/20220928131807.30386-1-palmer@rivosinc.com/
> >
>
> Yeah, it seems like we should either forbid access to unprivileged users
> or ensure the numbers include some random noise. For guests, a privileged
> KVM userspace should need to explicitly request access for them, ensuring
> that the creation of privileged guests is done by conscious choice.
>

If I understand you correctly, you are suggesting we only enable TM
bit in hcounteren ?
We also need a mechanism to enable the hcounteren bits from KVM guest userspace.

I can think of the following approaches.

1. The CYCLE, INSTRET enabling can also be via one reg interface.
2. We can enable it during first virtual instruction trap if these
bits in guest scounteren
are enabled.

> Thanks,
> drew



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
