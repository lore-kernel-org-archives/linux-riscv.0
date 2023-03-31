Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC17FC6FD18
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Mar 2023 11:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9uZAGQ6R1JnvsZi6zq7kcmAE3dmTmt1xvNGRWQQrYxc=; b=iZFAgwVKpZIeEu
	krCkcHXby/2qlZAx2/WZWgPnOsW/utxuOsmEO0u7yjv9hVyBeYEgmx3ofYW9RyIvf4HcL7riDrqLZ
	TnQ07k56iXvTJzI8MT2jfgg59+2bgYk1dzQLTBClZrz4GXmhyNhfklzlpJ7+qNZhA07e45PMZZpxB
	iSMCTNOS61kcuR8j22xkYnAMXkH3Xv8yhtpkVWuu4Oratc4AqfJi0SY0GK+gxvNY7kE2R8nyWcxZy
	2LJb2QtlyuGehb95TpYJcm+XAiuRn814qjOrufoYOeXEaG+09Hw34LBjAKc4YbkNU2XrPX9BY+h3Q
	f0KU1C3V/Z9LoxiMyzHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piCXC-0072Zr-16;
	Fri, 31 Mar 2023 11:03:06 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piCX5-0072Va-1P;
	Fri, 31 Mar 2023 11:03:02 +0000
Received: from ip4d1634d3.dynamic.kabel-deutschland.de ([77.22.52.211] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1piCWz-00038O-L4; Fri, 31 Mar 2023 13:02:53 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-riscv@lists.infradead.org, palmer@dabbelt.com, anup@brainfault.org,
 atishp@atishpatra.org, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org
Cc: vineetg@rivosinc.com, greentime.hu@sifive.com, guoren@linux.alibaba.com,
 Vincent Chen <vincent.chen@sifive.com>, Andy Chiu <andy.chiu@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>, Conor Dooley <conor.dooley@microchip.com>,
 Li Zhengyu <lizhengyu3@huawei.com>,
 Xianting Tian <xianting.tian@linux.alibaba.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
 Andrew Jones <ajones@ventanamicro.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Andy Chiu <andy.chiu@sifive.com>
Subject:  Re: [PATCH -next v17 07/20] riscv: Introduce riscv_v_vsize to record size of
 Vector context
Date: Fri, 31 Mar 2023 13:02:52 +0200
Message-ID: <7503786.EvYhyI6sBW@diego>
In-Reply-To: <20230327164941.20491-8-andy.chiu@sifive.com>
References:  <20230327164941.20491-1-andy.chiu@sifive.com>
 <20230327164941.20491-8-andy.chiu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_040259_494673_D7723198 
X-CRM114-Status: UNSURE (   9.68  )
X-CRM114-Notice: Please train this message.
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

Am Montag, 27. M=E4rz 2023, 18:49:27 CEST schrieb Andy Chiu:
> From: Greentime Hu <greentime.hu@sifive.com>
> =

> This patch is used to detect the size of CPU vector registers and use
> riscv_v_vsize to save the size of all the vector registers. =


> It assumes all
> harts has the same capabilities in a SMP system.

is this mandated somewhere?

Because for most other things we seem to want to check that this is
actually true.

So somehow I'd expect the kernel to at least check the VLEN on each
hart and loudly complain if those do not match?

> Co-developed-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>


Heiko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
