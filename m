Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E266CC6FD1C
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Mar 2023 12:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oxerFcDRH5ebD/QyjwRsZPyAQrP+XwPLvWIT0Q6zFNM=; b=N3IN7qF00XSa2r
	JoeYuefu0nc/Ri9qgRuCJXtHp1vKwk2XWGmbzoOUmLIXvkgvGWd4ge1F7QxQXR1ha9TvzLdYs2YxI
	QvrzZL0vOzP57ndlw8aKPLEA/u1mDTXqyLnU92Rrm42I3kZOeDF1nxi7O4SyzvsoTbXZo2nNPaaNe
	OCgKEgGnMOLHDKHTddLNoZoqz+Ou+bi66MIGUKwEltpeeutDtJnRQUZTQS8TWoT31BNkPA7ddm64r
	RCERC3I2tAS3jBa4Cqre7CNNgNZ5jroxqL57u7gfqOh+IyLHZF9oOntTo/fJNJPlAy0YqJT60n21Y
	jVC4xHO0VPtc3hcgkgkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pex9w-00Fr1D-3B;
	Wed, 22 Mar 2023 12:01:40 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pex9t-00Fr0T-21;
	Wed, 22 Mar 2023 12:01:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 38DC5B81C35;
	Wed, 22 Mar 2023 12:01:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BC6DC433EF;
	Wed, 22 Mar 2023 12:01:32 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="cGXuHR3k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1679486489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=31iz5njnxwIdR1+jjyeAyXciOwOhvxGbyonntQxMoEM=;
	b=cGXuHR3kuAudxj0LB1/F3WViZ6fW2Iq6KZCkF0vl0bd57zsF5NPpYfkxwx40HRLPSZn4oU
	sqfL0wsNoiu45GxMgUj5hEIIEj1R1kp193+SqUVJTLqAREnaBjGv2dKO+oOx14GozOEQz0
	5QkwjzhUJvBDeZXAZAmUePeIoAyuofM=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 99a7018e (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Wed, 22 Mar 2023 12:01:28 +0000 (UTC)
Date: Wed, 22 Mar 2023 13:01:25 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	regressions@leemhuis.info, regressions@lists.linux.dev
Subject: Re: [PATCH v5 06/13] riscv: fpu: switch has_fpu() to
 riscv_has_extension_likely()
Message-ID: <ZBruFRwt3rUVngPu@zx2c4.com>
References: <20230128172856.3814-1-jszhang@kernel.org>
 <20230128172856.3814-7-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230128172856.3814-7-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_050138_199061_36C45FF5 
X-CRM114-Status: GOOD (  18.75  )
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

Hi,

On Sun, Jan 29, 2023 at 01:28:49AM +0800, Jisheng Zhang wrote:
> Switch has_fpu() from static branch to the new helper
> riscv_has_extension_likely().
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/include/asm/switch_to.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
> index 11463489fec6..60f8ca01d36e 100644
> --- a/arch/riscv/include/asm/switch_to.h
> +++ b/arch/riscv/include/asm/switch_to.h
> @@ -59,7 +59,8 @@ static inline void __switch_to_aux(struct task_struct *prev,
>  
>  static __always_inline bool has_fpu(void)
>  {
> -	return static_branch_likely(&riscv_isa_ext_keys[RISCV_ISA_EXT_KEY_FPU]);
> +	return riscv_has_extension_likely(RISCV_ISA_EXT_f) ||
> +		riscv_has_extension_likely(RISCV_ISA_EXT_d);

This causes programs to crash on kernels that are compiled with
CONFIG_RISCV_ALTERNATIVE=n. Since CONFIG_RISCV_ALTERNATIVE isn't
selectable, this is a problem.

You can try this out for yourself using the WireGuard test suite:

    ARCH=riscv64 make -C tools/testing/selftests/wireguard/qemu -j$(nproc)

And you'll see the crash:

[    2.172093] init.sh[45]: unhandled signal 4 code 0x1 at 0x00ffffff945a2170 in libc.so[ffffff94562000+8c000]
[    2.174306] CPU: 0 PID: 45 Comm: init.sh Not tainted 6.3.0-rc3+ #1
[    2.174981] Hardware name: riscv-virtio,qemu (DT)
[    2.175639] epc : 00ffffff945a2170 ra : 00aaaaaae7332820 sp : 00fffffffd3e6c00
[    2.176287]  gp : 00aaaaaae73aff40 tp : 00ffffff945f1a50 t0 : 0000000000000000
[    2.176858]  t1 : 00aaaaaae7331f9c t2 : 0000000000000002 s0 : 00fffffffd3e6de0
[    2.177427]  s1 : 0000000000000002 a0 : 00aaaaaae73b7380 a1 : 00fffffffd3e6dc8
[    2.177990]  a2 : 00fffffffd3e6de0 a3 : 0000000000000000 a4 : 0000000000000000
[    2.178524]  a5 : 0000000000000002 a6 : 000000000000008b a7 : 0000000000000010
[    2.179081]  s2 : 00aaaaaae73327f0 s3 : 00ffffff945ef990 s4 : 00ffffff945f1988
[    2.179796]  s5 : 00ffffff945f1b48 s6 : 0000000000000000 s7 : 00000000000000e0
[    2.180366]  s8 : 00ffffff945f1d58 s9 : 00ffffff945ecb88 s10: 00ffffff945f17e0
[    2.185464]  s11: 0000000000000001 t3 : 00ffffff945a213c t4 : 0000000300000000
[    2.186106]  t5 : 0000000000000003 t6 : ffffffffffffffff
[    2.186520] status: 0000000200000020 badaddr: 000000000000b920 cause: 0000000000000002

I bisected it to this commit:

    702e64550b12 ("riscv: fpu: switch has_fpu() to riscv_has_extension_likely()")

Thanks,
Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
