Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB367C43219
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Nov 2022 10:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pLs0AiMjILeygroUeYHFZ1LPkNsCOxMUE1JM3RH2WXk=; b=vAvNXvNBMa55JJ
	s2S6yVeDPypOgB5VkN7+2vZSvd2woFM3OpBl3IBBeHGC2R768ko+lGdv6wpxNeHEJaEUfUYYBYmwg
	SB3AfweQckA44kR9BBSCSUs8VtOH7b0gUWvMEEgyUe8OfGRauq9wzITSfDizgqjKytca1e+LMt779
	mcmmBTHpzIZ0RS4pfSsaneoKnusuytO+UuWTwZ+XZzQzsxZMkyywhLzl/kwU1FtpUa8nNI6KZz+xy
	Y1YoVp7UEKCNrU5nPqJl8wngtL+vqVbuh4hieRH0JI2CmYin7mCGL066OLf68kALVESyYndND8isU
	Qeyd1WGxlpar1BXJTmHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy9sz-007psY-8d; Thu, 24 Nov 2022 10:55:17 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy9sw-007pqt-7e
	for linux-riscv@lists.infradead.org; Thu, 24 Nov 2022 10:55:15 +0000
Received: by mail-ed1-x532.google.com with SMTP id s12so2029703edd.5
        for <linux-riscv@lists.infradead.org>; Thu, 24 Nov 2022 02:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cDjZkRfpYrY5I/MR6Qn4PLWFtgP7s/Bq564G/WDROg8=;
        b=QO7D86gaGFb5ZRyhP30L+tC9SacJbP+BnjiLVrXG1Hp1YNn8JYwTlPi5lxcrIDPR+a
         dnPFJq1vznqQ8DZIYdMjtsTvyr6fy+fBcUwdKOZA5MOZ5EHTRGfcCK8b150A8FCivC2l
         /xTKmQi1XygjlmKoT3qKOmrwHR+KDqrBvYfq3BMC/SfAV5Tye7wieU17VkZO08MCIh2u
         r7W0oOo4lwfhlVeMoeiKznszaFzh4unoLaPEcwyT5s7/rELHPpC5uIlZsRRONGgs9aF0
         6atYfxlJSfwUXrZXo4kSH9QxNUwE3yOArldb/1+BjRqS56mPUocvI5YnZlCn67l4bOCl
         Jh6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cDjZkRfpYrY5I/MR6Qn4PLWFtgP7s/Bq564G/WDROg8=;
        b=JYk0pHfYr7+gPGHJKPcT/xlrKr6UH21DorIiSJvmURoRLSqCT6Z9FHwMvF0bDSPeYL
         S5oyGdd78CB4dioK+cI31f1GGj2e+Wz3d0X069gYX02glgtxktTvqbrE6RMYKxTTIk7z
         nRbkU8KyQLbehxmXpt3d97AmME46GfpOgAIYDOQo7fzTI2gagPihglVPW2oKvS9gURST
         kAomzte+hsB7iDqbSEVluQdD+2x6P5JPlitt/IMFcKg5qnR2i6XZQGBGtkO/ZEtBXX+d
         BACL5OhMt0JH2R3t1bQud65NHdA5Z4M0ndZ+ANz2Tn6GeKrzDzCYaYc9ryONlRM8909J
         8JIw==
X-Gm-Message-State: ANoB5pmJag8KsmPoPqSs4rw5jCFGzhvcm9gTFw3PM3QLKH80LnktShHQ
	twRwuQMPapwVP4FHZ3U4U+F8vA==
X-Google-Smtp-Source: AA0mqf6K3vDrC0uZkJNyI9i4bspr18Xc3wQ9f3KL4neh3mJKaDF3CSz4f3mCXc4rH7HQpdqr59HPug==
X-Received: by 2002:aa7:c9d0:0:b0:458:ed79:ed5 with SMTP id i16-20020aa7c9d0000000b00458ed790ed5mr13691602edt.374.1669287311864;
        Thu, 24 Nov 2022 02:55:11 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id x22-20020a1709064bd600b0078d3f96d293sm306881ejv.30.2022.11.24.02.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Nov 2022 02:55:11 -0800 (PST)
Date: Thu, 24 Nov 2022 11:55:09 +0100
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
Message-ID: <20221124105509.3kwnardcxvbbkf67@kamzik>
References: <20220718170205.2972215-1-atishp@rivosinc.com>
 <20220718170205.2972215-6-atishp@rivosinc.com>
 <20221101141329.j4qtvjf6kmqixt2r@kamzik>
 <CAOnJCULMbTp6WhVRWHxzFnUgCJJV01hcyukQxSEih-sYt5TJWg@mail.gmail.com>
 <CAOnJCUKpdV3u8X6BSC+-rhV0Q8q2tdsa8r_KTH5FWCh2LV2q8Q@mail.gmail.com>
 <20221123133636.gke3626aolfrnevy@kamzik>
 <CAOnJCULUH09HPZL6Ks-xUsiDLQPR6xOv2g+ic9Gd3uwea6hCyQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOnJCULUH09HPZL6Ks-xUsiDLQPR6xOv2g+ic9Gd3uwea6hCyQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_025514_298761_2BCBD789 
X-CRM114-Status: GOOD (  26.30  )
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

On Thu, Nov 24, 2022 at 01:04:15AM -0800, Atish Patra wrote:
> On Wed, Nov 23, 2022 at 5:36 AM Andrew Jones <ajones@ventanamicro.com> wrote:
> >
> > ...
> > > > > > -     csr_write(CSR_HCOUNTEREN, -1UL);
> > > > > > +     /* VS should access only TM bit. Everything else should trap */
> > > > > > +     csr_write(CSR_HCOUNTEREN, 0x02);
> > > > >
> > > > > This looks like something that should be broken out into a separate patch
> > > > > with a description of what happens now when guests try to access the newly
> > > > > trapping counter registers. We should probably also create a TM define.
> > > > >
> > > >
> > > > Done.
> > > >
> > >
> > > As we allow cycles & instret for host user space now [1], should we do the same
> > > for guests as well ? I would prefer not to but same user space
> > > software will start to break
> > > they will run inside a guest.
> > >
> > > https://lore.kernel.org/all/20220928131807.30386-1-palmer@rivosinc.com/
> > >
> >
> > Yeah, it seems like we should either forbid access to unprivileged users
> > or ensure the numbers include some random noise. For guests, a privileged
> > KVM userspace should need to explicitly request access for them, ensuring
> > that the creation of privileged guests is done by conscious choice.
> >
> 
> If I understand you correctly, you are suggesting we only enable TM
> bit in hcounteren ?

Yeah, and also that I think it'd be nice to revisit this for userspace.

> We also need a mechanism to enable the hcounteren bits from KVM guest userspace.
> 
> I can think of the following approaches.
> 
> 1. The CYCLE, INSTRET enabling can also be via one reg interface.
> 2. We can enable it during first virtual instruction trap if these
> bits in guest scounteren
> are enabled.

Those sound good to me.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
