Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F734C7EE31
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jun 2025 11:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pJWhK6mCA+45z6xU7zusXoPRmf018psSMtOLr8eV6Zk=; b=sa/73zS39akDoH
	LjzYHjgRw39zgRNrjyjLdsUut/REzLrzBGafCMEww1ti1J/L/MaOyKgxH0nDvElrU4hIJV3vB11ZK
	11eIRiBqirWoTLm8TgmlHpLDmcKHQgLTDpwrqe3IEwSXlb1SeEOocp6WbuOspXx6BEglRDXJBGtvB
	whTPqcuKHHqxSERHJoUN16IMsSpaFPRdIo6L0EOzIlAtg54Z5lFMytrMCBH5VvFDQKMwZCzEmHy3C
	L8euCETVj4jLilhDLvuXlAkKuECfgHX/QIzsg9u6dtuunSJ5MRxOnYa5GvPnVF78jxq8YHG5VRS2k
	4yWGrR5jzpbinsqIcx6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV78T-0000000ESaA-07pV;
	Fri, 27 Jun 2025 11:20:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV6wb-0000000EQJl-0jWy
	for linux-riscv@bombadil.infradead.org;
	Fri, 27 Jun 2025 11:08:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=a48amvWaBrmppZvZlzwfqLpxi2tXYrpQyg/hl/oSFIo=; b=DtXIJwt71g4OnFaduN1mmOz+oq
	6LJ5WxbUzP7NGLLLMx+FaBT6Y1dDb7Sp4+3onS+pTwQXxzwKS0Yn3rcPIkBbUSB8beUka0UsiKytk
	1lGwYg2Xs24QueSGtrboyKEjHxsKKX2LaufdfXSfAGscjecHwFEH+OjRDcszX0M9XwIJVyiCteweE
	wZZ5z2DCXf037s4DCP5zEIm6vqOXhM6dr7Z7DOcjXj+uTXu5wZEcSunUb2dquDDJB/rvJx1uI+8A0
	gJkALvpL/4LQUGgdr1yUIJWMHKC9HTVvUlNLgZ+MZ3K+eGd0t/vd2Wh51JVsBvVOrfe622iIgozRj
	UXbUyiww==;
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV6wY-00000006K1i-0co5
	for linux-riscv@lists.infradead.org;
	Fri, 27 Jun 2025 11:08:32 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3a503d9ef59so1471083f8f.3
        for <linux-riscv@lists.infradead.org>; Fri, 27 Jun 2025 04:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751022508; x=1751627308; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a48amvWaBrmppZvZlzwfqLpxi2tXYrpQyg/hl/oSFIo=;
        b=bC2CP+e3z+OWzQidy7cWDDaqt0DHF3gjsrSr49ZHwRUFAUhTXJejhMAHnVClHJsh4q
         5qCSw66ZymIQvPx5UsHFD/ubgjpUlB/BVSN/1zMlMurNRnJpF0IOiIyOs1LCevqaRFV5
         4eLs8AY91jnZNwQCeT/v/qBaUYuYP6+Pys1ttZc0ZmhHoopeAhwnhNTdtvUXZR8d4auE
         RSlXn/M3yPhLbG1z3jo/W12VK+ne4hbUH82TdWCaBdQPjhM+IdWmA3uQVMMerFkvH5dm
         FiyQbQ0lXaWfDS1egxOYPxnLmX1I7Zi4AYx6f4Fyur/oczejk1oGwMZPhNNx8B1Td4f1
         sMqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751022508; x=1751627308;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a48amvWaBrmppZvZlzwfqLpxi2tXYrpQyg/hl/oSFIo=;
        b=OhiEyuSc0II3S88O9XR7qAlG+nyLFWkR21c+beRDm4G0pDxYMnMjydOYFWo67PdgLk
         k2DI7NdjLmoKLOc4kjUYim+9moqPxoa/W2CsNYqDhcVPMxnYHCf71AvCBama5yBIn1ur
         WES+D6qLZYHRtujANWo9rOJumsMKCjdUeSEoafdQYc0ukO5jK0fQdIvyW+QjydihA5V/
         wy4uvyVQp4Nl8UGL//04g14U+KYAzQMYrrs0y2Jd6LQUlP8BmWNrwAPuyNp1q/Ue3QYO
         QsZH+1UY3GrVeA8Q/HWulyeUQdNuzN/LCRS1bDAYffcjZQI8fV7u/abTGhcXH3VdOjO8
         cG4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUVbbjEvV9Vqw17Vn+kqA4NTTGqQNbdEUlY6NhiLpf0EevlvFt4uDnVK+oj6iWuDeO6+7VLWq7VOQu1AQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+bF5zTvGl+VakqNNr5bQfHkHpxA02u63M7Dh5j7L0g+OXgnFm
	BSWbLaEEkA+bzHVx+QORZgKMFU7YStUxB5cnc3B4C4VjeM9SjYvaISl1X8zx0JaWg58=
X-Gm-Gg: ASbGncv7S45GX3xQ40EWwR48Wj4CxnobZhK+h5hU2O1vpG6L4C5GZFwQdTPcf4tjpm5
	wqL51cwvKYSdMFE7S89NYtA17qJIdv/NdRGVUuvgW7Btf6X8+leoskp/HqMruiRI0CSrjLjuaxk
	xdvw3+PowdPOU3VVrj3ed6dLxuiv2dexGfJX9x08thgbItvA8nmuoSjlUUM0yCf1y4RKOpr94I9
	BSeLC+pIvhwLby03gF3YR64YF5e8WBwpbd9aJhcIhH8Zucbeg1ZiVid70p/zYJ1U2jCUfr44uFh
	1s9LifGGUdEGUQQoycraqyfFDy+kwMfDnSRaipmCj7nkhTJbohLlfE694fHL
X-Google-Smtp-Source: AGHT+IE5/2rEcOurq0i4r3UBWagstXkpcBbzvpVFrD4zlfeAeRf1yuqnsNuKAi0pzOZ6VwxcyTisjA==
X-Received: by 2002:a05:6000:1a8f:b0:3a4:dd16:b287 with SMTP id ffacd0b85a97d-3a8f482bfdemr2459993f8f.19.1751022507363;
        Fri, 27 Jun 2025 04:08:27 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::5485])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e52ca4sm2423718f8f.58.2025.06.27.04.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 04:08:26 -0700 (PDT)
Date: Fri, 27 Jun 2025 13:08:26 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Cc: "alex@ghiti.fr" <alex@ghiti.fr>, 
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"conor@kernel.org" <conor@kernel.org>, "corbet@lwn.net" <corbet@lwn.net>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"devnull+aleksa.paunovic.htecgroup.com@kernel.org" <devnull+aleksa.paunovic.htecgroup.com@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "palmer@dabbelt.com" <palmer@dabbelt.com>, 
	"palmer@sifive.com" <palmer@sifive.com>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, 
	"robh@kernel.org" <robh@kernel.org>
Subject: Re: [PATCH v4 6/7] riscv: Add tools support for xmipsexectl
Message-ID: <20250627-4830df29795364099432e6ee@orel>
References: <20250626-af013235ad8d22421b2fe5b1@orel>
 <b579eb63-c465-45df-9558-a11c02fdb02b@htecgroup.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b579eb63-c465-45df-9558-a11c02fdb02b@htecgroup.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_120830_380117_9754FC29 
X-CRM114-Status: GOOD (  38.81  )
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

On Fri, Jun 27, 2025 at 08:40:53AM +0000, Aleksa Paunovic wrote:
> On 26. 6. 25. 12:49, Andrew Jones wrote:> On Thu, Jun 26, 2025 at 11:34:21AM +0200, Andrew Jones wrote:
> >> On Thu, Jun 26, 2025 at 11:21:10AM +0200, Andrew Jones wrote:
> >>> On Wed, Jun 25, 2025 at 04:21:01PM +0200, Aleksa Paunovic via B4 Relay wrote:
> >>>> From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> >>>>
> >>>> Use the hwprobe syscall to decide which PAUSE instruction to execute in
> >>>> userspace code.
> >>>>
> >>>> Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> >>>> ---
> >>>>  tools/arch/riscv/include/asm/vdso/processor.h | 27 +++++++++++++++++----------
> >>>>  1 file changed, 17 insertions(+), 10 deletions(-)
> >>>>
> >>>> diff --git a/tools/arch/riscv/include/asm/vdso/processor.h b/tools/arch/riscv/include/asm/vdso/processor.h
> >>>> index 662aca03984817f9c69186658b19e9dad9e4771c..027219a486b7b93814888190f8224af29498707c 100644
> >>>> --- a/tools/arch/riscv/include/asm/vdso/processor.h
> >>>> +++ b/tools/arch/riscv/include/asm/vdso/processor.h
> >>>> @@ -4,26 +4,33 @@
> >>>>
> >>>>  #ifndef __ASSEMBLY__
> >>>>
> >>>> +#include <asm/hwprobe.h>
> >>>> +#include <sys/hwprobe.h>
> >>>> +#include <asm/vendor/mips.h>
> >>>>  #include <asm-generic/barrier.h>
> >>>>
> >>>>  static inline void cpu_relax(void)
> >>>>  {
> >>>> + struct riscv_hwprobe pair;
> >>>> + bool has_mipspause;
> >>>>  #ifdef __riscv_muldiv
> >>>>   int dummy;
> >>>>   /* In lieu of a halt instruction, induce a long-latency stall. */
> >>>>   __asm__ __volatile__ ("div %0, %0, zero" : "=r" (dummy));
> >>>>  #endif
> >>>>
> >>>> -#ifdef CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE
> >>>> - /*
> >>>> -  * Reduce instruction retirement.
> >>>> -  * This assumes the PC changes.
> >>>> -  */
> >>>> - __asm__ __volatile__ ("pause");
> >>>> -#else
> >>>> - /* Encoding of the pause instruction */
> >>>> - __asm__ __volatile__ (".4byte 0x100000F");
> >>>> -#endif
> >>>> + pair.key = RISCV_HWPROBE_KEY_VENDOR_EXT_MIPS_0;
> >>>> + __riscv_hwprobe(&pair, 1, 0, NULL, 0);
> >>>> + has_mipspause = pair.value & RISCV_HWPROBE_VENDOR_EXT_XMIPSEXECTL;
> >>>> +
> >>>> + if (has_mipspause) {
> >>>> +         /* Encoding of the mips pause instruction */
> >>>> +         __asm__ __volatile__(".4byte 0x00501013");
> >>>> + } else {
> >>>> +         /* Encoding of the pause instruction */
> >>>> +         __asm__ __volatile__(".4byte 0x100000F");
> >>>> + }
> >>>> +
> >>>
> >>> cpu_relax() is used in places where we cannot afford the overhead nor call
> >>> arbitrary functions which may take locks, etc. We've even had trouble
> >>> using a static key here in the past since this is inlined and it bloated
> >>> the size too much. You'll need to use ALTERNATIVE().
> >>
> >> Oh, I see now that the next patch is handling the kernel cpu_relax with
> >> ALTERNATIVE and this was just the tools cpu_relax. We don't want to make
> >> a syscall inside cpu_relax though either, since it gets called in loops.
> > 
> > (Another follow up to myself...)
> > 
> > I guess with the vdso cached result it should only be a handful of
> > instructions, but it still seems odd to embed a call in cpu_relax.
> >
>   
> Hi Andrew,
> 
> Thank you for your comments!
> 
> > Thanks,
> > drew
> > 
> >> It'd be better to just call the standard pause (0x100000F) even if it
> >> does nothing. Or maybe there's some define that can be added/used to
> >> select the correct instruction?
> >>
> 
> We did try using an ifdef/else in v3, but since that would have to be marked
> non-portable, we decided to go with a hwprobe call. 
> Since the MIPS pause should behave as a nop on other CPUs,
> would leaving both the standard pause and the MIPS pause calls be an acceptable solution?
> 
> That said, I am not sure how this would behave on future MIPS CPUs in case they support both encodings.

We should probably avoid assuming that undefined custom instructions will
behave as nops everywhere, meaning it should remain guarded. This seems
like a problem we should try to solve before we get even more pause
instructions or whatever that need dynamic selection in userspace, but I
can't think of anything reasonable atm. For now, we may need to live with
vdso hwprobe calls in places like cpu_relax. I'll stop complaining about
this patch as I can't think of anything better.

Thanks,
drew

> 
> Best regards,
> Aleksa
> 
> >> Thanks,
> >> drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
