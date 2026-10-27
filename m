Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147EC606A31B
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Oct 2026 16:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PGUEim4S;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eaw/6xZS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iB7hRV7V9O3sSQjQoQr4L/Wad+siUixC5EgknFO7HOA=; b=PGUEim4SqmYuXyfDlCRAuSnIpt
	vIA6PXI+5xXBlI6pKL2PDDcgqIeXjWkKyqpCDVYTlUS8CLCSzKyI7D+kt7GWmoJrJhyolk87oxjp6
	IvBikntGl/UH2uOLppDpLejMI51lhujt21/3j8GUhftlDij8yyg3bikakdSx9whqpOFJqn1NIlLWr
	1x9Xe5UgOwr/XSGXQd9Mfa5v1JoPzgvg40NhLRetJb2Xnuq+WrhHOZ/+jXqFTWrONgDlQEarLSXbC
	W6rLFUU+0QwyvmDHqTKSPMbYGFjoxGA3uTX9Vnoojs1J+GK2JIQD/WVO0IXHu/odew/QoD7WZVnIs
	GKsf3VHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLjsT-00000005Kei-3puV;
	Tue, 27 Oct 2026 16:18:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLjsM-00000005KZJ-20dD;
	Tue, 27 Oct 2026 16:18:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9998A602C2;
	Tue, 27 Oct 2026 16:18:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17FA41F01825;
	Tue, 27 Oct 2026 16:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793117893;
	bh=gzqWKjNAt9lqP6pzm2jk44aYuqndLp4yTwvo+4KqEyE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eaw/6xZSvd/iUmSOi8x3BJdGmmK2e2Au+98Gmi/jqPb/fsxjYFyg2asyyhJnch6aW
	 wiiYi0eITIbZDq54HaW38SGswS0qGyltyrmNEvvLUgZrcg3MfWR9qehG4imuCVOpGL
	 JLBJMFg4bFYLFuqGqIHPNPdaHWv4b1hxzIOgmIltqxGKohsv70X69oBDXW+gIkAM9P
	 6ksq060/PG/zOz5Emn8kneLWdVFzz4b9Fry3mL204ZqJhnBuP6P3beekO0yFayQ3hq
	 GdLB0wZ1l9tZcPdFY3Dx++WAI2wf8fFk1D10texSvMGm5UdAm082/dyBMfy0jfVO2w
	 miwbGbIVbN6NA==
Date: Tue, 27 Oct 2026 16:18:04 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH RFC 01/18] firmware: arm_scmi: Allow SCMI transports on
 RISC-V
Message-ID: <20261027-quaint-demonic-poodle-6c1e10@sudeepholla>
References: <20261027-a210-scmi-v1-0-74d58ce85bd8@iscas.ac.cn>
 <20261027-a210-scmi-v1-1-74d58ce85bd8@iscas.ac.cn>
 <3d38c4a5-1a12-4af1-ac2e-413a457ce4c5@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3d38c4a5-1a12-4af1-ac2e-413a457ce4c5@amd.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Drew Fustini <fustini@kernel.org>, Radu Rendec <radu@rendec.net>, Yao Zi <me@ziyao.cc>, Paul Walmsley <paul.walmsley@sifive.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Vivian Wang <wangruikang@iscas.ac.cn>, linux-riscv@lists.infradead.org, Jiri Slaby <jirislaby@kernel.org>, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Jerome Brunet <jbrunet+clk@baylibre.com>, Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Jassi Brar <jassisinghbrar@gmail.com>, Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, linux-serial@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, gaohan@iscas.ac.cn, Sudeep Holla <sudeep.holla@kernel.org>, linux-gpio@vger.kernel.org, Daniel Lezcano <daniel.lezcano@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, Paul Walmsley <pjw@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, Stephen Boyd <sboyd@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Inochi Amaoto <inochiama@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 04:51:36PM +0100, Michal Simek wrote:
> 
> 
> On 10/27/26 16:36, Han Gao via B4 Relay wrote:
> > From: Han Gao <gaohan@iscas.ac.cn>
> > 
> > Mailbox and shared-memory SCMI transports do not require ARM execution.
> > Allow RISC-V platforms to use the existing SCMI core and protocol drivers;
> > architecture-specific transports retain their own dependencies.
> > 
> > Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> > ---
> >   drivers/firmware/arm_scmi/Kconfig | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/firmware/arm_scmi/Kconfig b/drivers/firmware/arm_scmi/Kconfig
> > index 783c24a20e29..1cfe2b572d18 100644
> > --- a/drivers/firmware/arm_scmi/Kconfig
> > +++ b/drivers/firmware/arm_scmi/Kconfig
> > @@ -3,7 +3,7 @@ menu "ARM System Control and Management Interface Protocol"
> >   config ARM_SCMI_PROTOCOL
> >   	tristate "ARM System Control and Management Interface (SCMI) Message Protocol"
> > -	depends on ARM || ARM64 || COMPILE_TEST
> > +	depends on ARM || ARM64 || RISCV || COMPILE_TEST
> 
> 
> I would prefer to remove ARM || ARM64 dependencies completely that you don't
> need to add RISCV there.
> 

Agreed. Before merging, we should trigger exploratory builds across multiple
architectures. This will help us catch any hardware-specific dependencies,
such as arch-exclusive IO accessors, that I might be overlooking right now.

-- 
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
