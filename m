Return-Path: <SRS0=HL6o=A3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CDB2C433E4
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 19:00:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5786F207CB
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 19:00:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OgOXZmXV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="KnSzidzo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5786F207CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=XBroPoh4uCNrd/VOfB0l77VNpjtaDqSuQFYbXqWgsno=; b=OgOXZmXVNBN5s5Tu0M7ML5pLs
	NnzDEaWt+7TV3cbkPD4btvcEIily0XUosuvnrSaeVXL77oQNy06KIJMA/F+hZRR2+4kOmP88FPiuX
	27U3G7ENAYFfb581J2y2HlEwz5y+fJ17yClDTHVRBGEBmc5HHMqMZcqW65aPpgle0V10abQuZEGKr
	bY9aNLoN3ZwvssTxzbSiv/Y0RJTqHz95ciz7imHCg2wu5UNz5SgfVgrPML06eplI/KSIp86jY2iAb
	BS1ELz+Reb6Dt3wblULqUl7gt4/xwWo0haOyp9FujWgrOxyzJOr0aT1dcJ8mx5CtslRiA6TKe5U09
	swwA7gWEg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jw972-0006kX-U9; Thu, 16 Jul 2020 19:00:08 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jw970-0006jC-EL
 for linux-riscv@lists.infradead.org; Thu, 16 Jul 2020 19:00:07 +0000
Received: by mail-pj1-x1042.google.com with SMTP id k5so5114144pjg.3
 for <linux-riscv@lists.infradead.org>; Thu, 16 Jul 2020 12:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=JfJefRWjeb9DH1MrBUsvBscaMgupvBInX+3elN90M+E=;
 b=KnSzidzo66xdykVg2SLxktyn55MXR0V55tGOU4DaExdIhtIt3GeqanAb1iKPf9R7KE
 +2piaCrkav87qgcni5NLFfUDAKLxjdaJPx9WQJnAac+UYP6ESjs+6B8huzoSkq4mC2T3
 VUWb5deEwYeyRTHXqAK/Q+wDPKoivdAzPEnDP7MKYsI3tXH/rNF7N7r2+6M5zLpI5Ukp
 fnmBHBu9jGkYkc4McRpEiI3ISoIIvnA4QXAd8EFuUQROxCThFFTJaW2nb3DticgpBMGI
 qUkxoJJzHo097Q195B3t4fK4L83tbp2rQ3/Y5v0+xqURCSyJBlaw35OFl2xfIKTKYpzI
 W3bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=JfJefRWjeb9DH1MrBUsvBscaMgupvBInX+3elN90M+E=;
 b=jyQw+mtdc7IM7D2VgWD8Gt+U14Y+vF13UArwos1I3rL7BFfgS9q3YZohtmD2RLYzCz
 2rTsK2v1aGaG86oQTWOjE/BMqOk9oe+10xHr2ZCvOWF5skEYzbTOAD2d/pq2dY3xoL41
 35sP5x+X/Wsa0wq+4lNyO6gcAantM/n5umo4qcnvVYEVfRlWgQENhd8Zryon2E24+NAY
 y2dOW7VUsa2XzxoHbQMeUqXsnwBvGUa6jvJAvh3IHPmUfwJEIqzinCAnhxlKBWLEdXMa
 AipLpaEDxK/80gupILe4XShiIwPuDePD/UOxDLW+CK9vZ+vkZ/5gek5FcBBvpfb1bBnO
 mxKg==
X-Gm-Message-State: AOAM532sRNpZtmhOplcZ5iaucRRvdaQ/BKNSjW/Z9fhWFCcyHKYMZrjH
 XIiHj/wX+xLayjwqhSt5xVAqiw==
X-Google-Smtp-Source: ABdhPJz6CJzyKeJCf96A5qLRYs4FcPz9lfbS3DVtPeqeYK5pu2QxyfXQvlIhSQOHGR+IIdSxznfGCQ==
X-Received: by 2002:a17:902:8697:: with SMTP id
 g23mr4595359plo.94.1594926002609; 
 Thu, 16 Jul 2020 12:00:02 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id u73sm5753263pfc.113.2020.07.16.12.00.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 12:00:01 -0700 (PDT)
Date: Thu, 16 Jul 2020 12:00:01 -0700 (PDT)
X-Google-Original-Date: Thu, 16 Jul 2020 11:59:58 PDT (-0700)
Subject: Re: [PATCH] asm-generic/mmiowb: Allow mmiowb_set_pending() when
 preemptible()
In-Reply-To: <20200716112816.7356-1-will@kernel.org>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: will@kernel.org
Message-ID: <mhng-6528b0ae-d92c-41b2-b0fd-3be58c80f280@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200716_150006_506690_E02DD45A 
X-CRM114-Status: GOOD (  25.37  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-arch@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 kernel-team@android.com, linux-kernel@vger.kernel.org, guoren@kernel.org,
 mpe@ellerman.id.au, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org, will@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 16 Jul 2020 04:28:16 PDT (-0700), will@kernel.org wrote:
> Although mmiowb() is concerned only with serialising MMIO writes occuring
> in contexts where a spinlock is held, the call to mmiowb_set_pending()
> from the MMIO write accessors can occur in preemptible contexts, such
> as during driver probe() functions where ordering between CPUs is not
> usually a concern, assuming that the task migration path provides the
> necessary ordering guarantees.
>
> Unfortunately, the default implementation of mmiowb_set_pending() is not
> preempt-safe, as it makes use of a a per-cpu variable to track its
> internal state. This has been reported to generate the following splat
> on riscv:
>
>  | BUG: using smp_processor_id() in preemptible [00000000] code: swapper/0/1
>  | caller is regmap_mmio_write32le+0x1c/0x46
>  | CPU: 3 PID: 1 Comm: swapper/0 Not tainted 5.8.0-rc3-hfu+ #1
>  | Call Trace:
>  |  walk_stackframe+0x0/0x7a
>  |  dump_stack+0x6e/0x88
>  |  regmap_mmio_write32le+0x18/0x46
>  |  check_preemption_disabled+0xa4/0xaa
>  |  regmap_mmio_write32le+0x18/0x46
>  |  regmap_mmio_write+0x26/0x44
>  |  regmap_write+0x28/0x48
>  |  sifive_gpio_probe+0xc0/0x1da
>
> Although it's possible to fix the driver in this case, other splats have
> been seen from other drivers, including the infamous 8250 UART, and so
> it's better to address this problem in the mmiowb core itself.
>
> Fix mmiowb_set_pending() by using the raw_cpu_ptr() to get at the mmiowb
> state and then only updating the 'mmiowb_pending' field if we are not
> preemptible (i.e. we have a non-zero nesting count).
>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Guo Ren <guoren@kernel.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Reported-by: Palmer Dabbelt <palmer@dabbelt.com>
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>
> I can queue this in the arm64 tree as a fix, as I already have some other
> fixes targetting -rc6.
>
>  include/asm-generic/mmiowb.h | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/include/asm-generic/mmiowb.h b/include/asm-generic/mmiowb.h
> index 9439ff037b2d..5698fca3bf56 100644
> --- a/include/asm-generic/mmiowb.h
> +++ b/include/asm-generic/mmiowb.h
> @@ -27,7 +27,7 @@
>  #include <asm/smp.h>
>
>  DECLARE_PER_CPU(struct mmiowb_state, __mmiowb_state);
> -#define __mmiowb_state()	this_cpu_ptr(&__mmiowb_state)
> +#define __mmiowb_state()	raw_cpu_ptr(&__mmiowb_state)
>  #else
>  #define __mmiowb_state()	arch_mmiowb_state()
>  #endif	/* arch_mmiowb_state */
> @@ -35,7 +35,9 @@ DECLARE_PER_CPU(struct mmiowb_state, __mmiowb_state);
>  static inline void mmiowb_set_pending(void)
>  {
>  	struct mmiowb_state *ms = __mmiowb_state();
> -	ms->mmiowb_pending = ms->nesting_count;
> +
> +	if (likely(ms->nesting_count))
> +		ms->mmiowb_pending = ms->nesting_count;
>  }
>
>  static inline void mmiowb_spin_lock(void)

Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>

The arm64 tree works for me.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
