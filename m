Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7078C54EAA
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jan 2023 23:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ejVz4lFpAAK64r1Rv4Sz54+vsBxzzQcQ0LOHavn/3mY=; b=LXva7rqKYEQ1DmbwxfohI/LJaq
	+7CfI6xZVgdOjxTn8scfqTrHhEqfcBpHtXtYxOfZ+U3sQ5dqnMC/ea9dzwjGEUuqf9px9qBG/e6l/
	yVTF1IthvJ7WPHxh9BCIwsGlXResPq9g81BeDFlsKAFCQIUNxoiKe2WF+9BQtqUv9YwZ+yHapIGV8
	w6+7RVTn/qAZ8iq7eq4ialoPKJM85t6Ag+L4UAbCEGqVC/wQAlrKHW9Lz1zjWOwwhgXW1m2PaiZz2
	dE630FDkQVv6KdjlyciMA9jpRvHEVfTke8nOrNlM1bbFCc+bH+IKptY75syqAZDkSIonKc0r8FCWl
	MjN2yMeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLBWn-00CjeK-Gn; Thu, 26 Jan 2023 23:19:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLBWk-00Cjdl-6f; Thu, 26 Jan 2023 23:19:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B2D406197F;
	Thu, 26 Jan 2023 23:19:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2587C433D2;
	Thu, 26 Jan 2023 23:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674775169;
	bh=/xxnORces+7PQtmvaI57BF4HOd03bYSj1knJxgUH8bE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T+lZMixk8EP4tji07xe82tx6YmEqXcbjBAGrS69B7gZS9MR+7W1xvss+Q9sZDMYUi
	 NM036B4UMI4uoTZvk/1ETeOYaqRLX1EALJzUjmtmL3vlg5cxrqumJ7Yy8Y/DkJzKfi
	 J0XWmhxNeMjkG2IZ0yZobNo301H+LGHmyi3qx76U2hL5JCeVjlcyMFlDDwhQEq1Wse
	 Crs6WSVDZS1XeFxaOZB9mJIsIJ3E+n2YzMx3bKjY+ChGXGZplUFYquOApIkXxE/7uF
	 bMdv4tqlw7zcdc4437q28H2XJ6SSNEMYX8LxCEuzRLGKpnRYGCMPfuC+6QXX6w/PYj
	 wnd1coVWplnFQ==
Date: Thu, 26 Jan 2023 23:19:22 +0000
From: Conor Dooley <conor@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>
Subject: Re: [PATCH -next v13 14/19] riscv: signal: Report signal frame size
 to userspace via auxv
Message-ID: <Y9MKeqtT+PEe7KTY@spud>
References: <20230125142056.18356-1-andy.chiu@sifive.com>
 <20230125142056.18356-15-andy.chiu@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230125142056.18356-15-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_151930_306241_9520D1E5 
X-CRM114-Status: GOOD (  14.71  )
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, guoren@linux.alibaba.com, Heiko Stuebner <heiko@sntech.de>, kvm@vger.kernel.org, Andrew Bresticker <abrestic@rivosinc.com>, atishp@atishpatra.org, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, Zong Li <zong.li@sifive.com>, linux-riscv@lists.infradead.org, Vincent Chen <vincent.chen@sifive.com>, anup@brainfault.org, greentime.hu@sifive.com, Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>, vineetg@rivosinc.com, Paul Walmsley <paul.walmsley@sifive.com>, Nick Knight <nick.knight@sifive.com>, palmer@dabbelt.com, Eric Biederman <ebiederm@xmission.com>, kvm-riscv@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============2348459692110806695=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2348459692110806695==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="j/GNO2EbtRS4mZpS"
Content-Disposition: inline


--j/GNO2EbtRS4mZpS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 25, 2023 at 02:20:51PM +0000, Andy Chiu wrote:
> diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/=
processor.h
> index 44d2eb381ca6..4f36c553605e 100644
> --- a/arch/riscv/include/asm/processor.h
> +++ b/arch/riscv/include/asm/processor.h
> @@ -7,6 +7,7 @@
>  #define _ASM_RISCV_PROCESSOR_H
> =20
>  #include <linux/const.h>
> +#include <linux/cache.h>

What have I missed that is the reason for adding this header?

>  #include <vdso/processor.h>
> =20
> @@ -203,8 +205,10 @@ static size_t cal_rt_frame_size(void)
> =20
>  	frame_size =3D sizeof(*frame);
> =20
> -	if (has_vector() && vstate_query(task_pt_regs(current)))
> -		total_context_size +=3D rvv_sc_size;

Usual naming comment here about rvv.

Thanks,
Conor.


--j/GNO2EbtRS4mZpS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY9MKegAKCRB4tDGHoIJi
0mmDAQCjFEpuNXkD97JMxkxeRTvw1yqmWXkab5dzjD9uKZ9rcQEAuWAEOzLFUUdw
IHP/W6yZ16E6gVFkR9IRKYwwmzhdNAQ=
=uuYD
-----END PGP SIGNATURE-----

--j/GNO2EbtRS4mZpS--


--===============2348459692110806695==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2348459692110806695==--

