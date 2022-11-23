Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A29D3C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Nov 2022 13:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l0h3g8TeiAXu6wWUwF6ISMmUwIMAbfxYGBxiTMyV8rM=; b=fc5ROwwBxkq2f2
	oy2ddA98ZVXdkYNFZNHCk21UVfYeohCLC6lz7KtLacTr2Yc4QkcwWc1fLM10AbUtq4KvRpFPnpghF
	8RfdSjEODThYzNkwsXjr0OuF8EWJO1iBDamLm87yHlpj3TqOnPxVl1vsEOVwyzuvn0OLVI0XGMl5B
	QZZLWnGdxUfd96YAwutGDRO7nDDbuMqmYE1i16a6qEUiitvsMM++CuQ8Yr4RER+spv9oxowy2yHdN
	DCN8IagYodX2PityUEcMLWcOES0+kdF1QSgRns0/WX3AemGhUB1kQeUrdwNczNkGITg/iXMYpcxCY
	7N44uO5PTE0Gu0xHUzbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxpvn-00HIKx-2R; Wed, 23 Nov 2022 13:36:51 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxpvc-00HIFt-9I
	for linux-riscv@lists.infradead.org; Wed, 23 Nov 2022 13:36:41 +0000
Received: by mail-wm1-x330.google.com with SMTP id t25-20020a1c7719000000b003cfa34ea516so2769296wmi.1
        for <linux-riscv@lists.infradead.org>; Wed, 23 Nov 2022 05:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hMgYAJPhRyqpy0UXUjrB3ea5pmGtcKs5Fqde6i7Nj3I=;
        b=SW/c4hJbN8TTlANr3vNJK5slrOe41QSdJUahynWVeaw6FftkA/D1M969Dg4QQXXFV6
         GR2ncUeFn5gUnpSLm6ukuUfqPRt8Ca4GwFzVx9Kdzq5hv9btgU1O4mgNhNWS120gfd4E
         hzaahcWhaeXT2YCmHJla7yl6H+7EiZUPOEHwDL2bfk0rgRD23d+NsVTa20B/jl47MT0K
         ibpDPRWjVRGb0nAkvvNu8cHQ10x6ukbxL0Ju/cGV7YIkfjWS3aFRog5lEI72USAC78W/
         Z9tLCNOjeOpkptob1pUoV036dzwMl4nLBstCpxxDpTnNFL8FxohNFTje5WAaqKKOv9Bn
         GBSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hMgYAJPhRyqpy0UXUjrB3ea5pmGtcKs5Fqde6i7Nj3I=;
        b=UoUgYjjnYr1UAXrCllAmbLQWU9wFaaLC+qqEryCnCmP9PuuNrVX7P1olAKDgwPsLbv
         JAPaqUDWnbPmX34blYdNigpKX/WHnE8P9AwDbQmUfApRXebzLECWrUtzMdA6w0438mEn
         nunS8QY6TWv4xihqHa6mQ48LDn3fjw7zyXRPyGZ/v0MAhax664mWe+eQrRF30xyvXsrR
         WO6i+hm560LNOzPhjtigiijaiJzMFZa5XC/XF/nf82YFY9DnLYduCgMdy9W/DpLuVAT+
         eePm1uvG8jTzB66ab/va1iSypB67FxQtQBc3fRME2pfZdnijXmUzRvtMj94x+zvCvcPf
         aYFQ==
X-Gm-Message-State: ANoB5pl+aHAy4ncN1yM1+YK9PcTPGSZeGw1ckJkC1NE33bh6SPcvfnue
	hFeGqHT10Su68l9u+yFrg6QQRA==
X-Google-Smtp-Source: AA0mqf53LRFa5Bbp5he9If0mv7pYNlmgIJ7+W+KuA3BYsVtGKFjDhkCi0Sb0k6NCu1LaVjh9Ww7qBw==
X-Received: by 2002:a05:600c:1ca4:b0:3cf:7125:fc1d with SMTP id k36-20020a05600c1ca400b003cf7125fc1dmr6594039wms.70.1669210598097;
        Wed, 23 Nov 2022 05:36:38 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-748-2a9a-a2a6-1362.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:748:2a9a:a2a6:1362])
        by smtp.gmail.com with ESMTPSA id h17-20020a05600c315100b003cf483ee8e0sm2511573wmo.24.2022.11.23.05.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 05:36:37 -0800 (PST)
Date: Wed, 23 Nov 2022 14:36:36 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@atishpatra.org>
Cc: Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [RFC 5/9] RISC-V: KVM: Add skeleton support for perf
Message-ID: <20221123133636.gke3626aolfrnevy@kamzik>
References: <20220718170205.2972215-1-atishp@rivosinc.com>
 <20220718170205.2972215-6-atishp@rivosinc.com>
 <20221101141329.j4qtvjf6kmqixt2r@kamzik>
 <CAOnJCULMbTp6WhVRWHxzFnUgCJJV01hcyukQxSEih-sYt5TJWg@mail.gmail.com>
 <CAOnJCUKpdV3u8X6BSC+-rhV0Q8q2tdsa8r_KTH5FWCh2LV2q8Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOnJCUKpdV3u8X6BSC+-rhV0Q8q2tdsa8r_KTH5FWCh2LV2q8Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_053640_329536_AAC01B36 
X-CRM114-Status: GOOD (  16.99  )
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

...
> > > > -     csr_write(CSR_HCOUNTEREN, -1UL);
> > > > +     /* VS should access only TM bit. Everything else should trap */
> > > > +     csr_write(CSR_HCOUNTEREN, 0x02);
> > >
> > > This looks like something that should be broken out into a separate patch
> > > with a description of what happens now when guests try to access the newly
> > > trapping counter registers. We should probably also create a TM define.
> > >
> >
> > Done.
> >
> 
> As we allow cycles & instret for host user space now [1], should we do the same
> for guests as well ? I would prefer not to but same user space
> software will start to break
> they will run inside a guest.
> 
> https://lore.kernel.org/all/20220928131807.30386-1-palmer@rivosinc.com/
>

Yeah, it seems like we should either forbid access to unprivileged users
or ensure the numbers include some random noise. For guests, a privileged
KVM userspace should need to explicitly request access for them, ensuring
that the creation of privileged guests is done by conscious choice.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
