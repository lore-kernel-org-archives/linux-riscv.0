Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6B63C76196
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Apr 2023 22:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aU923Xp3F37IiiYs00GFXydtewqzVxESa3Ue0XQoHtY=; b=cOBgK/B/JkwJMj
	9n94Twp3lzlJnWlrolV3WPSpy+ngeSB2QdoeHbAnFudEhThvxg4nxLKOTm4yKuT7xRtpNKygepn+y
	idHIHHZFs4CnQxh/i4vUKugkYJFGrzU0hm201NzQU1rVkjnxgP++jOAyu/YwuCEsbRdie0OOkcyCy
	K1Zzur7hX7WJs5E7K3YA2NaEIUJujDOCWttkyq7eEr+y5Rtf2vQrCtX757o6sqtlzJku1avAYenSg
	WnxJrINNEVboB40q/M1msqs8YcegCXePl5FkOTd9vMu9XfeWS8ie7soQ+2uRIrnD89ELCAUL5lnQf
	QyaExw9Cft+Fdu5lPQkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pijZz-00BNpe-2Y;
	Sat, 01 Apr 2023 22:20:11 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pijZs-00BNoP-2Z;
	Sat, 01 Apr 2023 22:20:11 +0000
Received: from ip4d1634d3.dynamic.kabel-deutschland.de ([77.22.52.211] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pijZe-0004pj-V9; Sun, 02 Apr 2023 00:19:50 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-riscv@lists.infradead.org, palmer@dabbelt.com, anup@brainfault.org,
 atishp@atishpatra.org, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, guoren@linux.alibaba.com,
 Kees Cook <keescook@chromium.org>, Nick Knight <nick.knight@sifive.com>,
 Andrew Bresticker <abrestic@rivosinc.com>, vineetg@rivosinc.com,
 =?ISO-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
 Vincent Chen <vincent.chen@sifive.com>,
 Conor Dooley <conor.dooley@microchip.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>, Eric Biederman <ebiederm@xmission.com>,
 Andy Chiu <andy.chiu@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 greentime.hu@sifive.com, Zong Li <zong.li@sifive.com>,
 Andy Chiu <andy.chiu@sifive.com>
Subject:  Re: [PATCH -next v17 14/20] riscv: signal: Report signal frame size to
 userspace via auxv
Date: Sun, 02 Apr 2023 00:19:49 +0200
Message-ID: <37344569.XM6RcZxFsP@diego>
In-Reply-To: <20230327164941.20491-15-andy.chiu@sifive.com>
References:  <20230327164941.20491-1-andy.chiu@sifive.com>
 <20230327164941.20491-15-andy.chiu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_152006_957523_E9F597C5 
X-CRM114-Status: GOOD (  14.10  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Am Montag, 27. M=E4rz 2023, 18:49:34 CEST schrieb Andy Chiu:
> From: Vincent Chen <vincent.chen@sifive.com>
> =

> The vector register belongs to the signal context. They need to be stored
> and restored as entering and leaving the signal handler. According to the
> V-extension specification, the maximum length of the vector registers can
> be 2^16. Hence, if userspace refers to the MINSIGSTKSZ to create a
> sigframe, it may not be enough. To resolve this problem, this patch refers
> to the commit 94b07c1f8c39c
> ("arm64: signal: Report signal frame size to userspace via auxv") to enab=
le
> userspace to know the minimum required sigframe size through the auxiliary
> vector and use it to allocate enough memory for signal context.
> =

> Note that auxv always reports size of the sigframe as if V exists for
> all starting processes, whenever the kernel has CONFIG_RISCV_ISA_V. The
> reason is that users usually reference this value to allocate an
> alternative signal stack, and the user may use V anytime. So the user
> must reserve a space for V-context in sigframe in case that the signal
> handler invokes after the kernel allocating V.
> =

> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Bj=F6rn T=F6pel <bjorn@rivosinc.com>
> Reviewed-by: Guo Ren <guoren@kernel.org>

Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
