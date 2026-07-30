Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 116F8C54FD2
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jul 2026 02:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:From:Subject:Cc:To:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sBfjVxV753Hd9qB1uvPLaXin/i+BdQR1QIkyxLEsc9A=; b=WMh+7oS95/XOrTGr/dPO0DJOK4
	u3/jR/OH22rlQ0Xf3/gDsLi+ZiXadiGmdWs+K8hs20UC7qxJEdif0yXrXYoEmeIACMSHZfjJT52CG
	UN4KY/LCz6eWvfr0A7slASDt/XYb2Y3Jq0ZGEZDCdt3zl+JxquaH3u+Y7yBpUZqEaO/SS76VFCfoU
	amVieirejTHV+i0sAvsEfJudIEU1wx18qkpOr0KXa7gWl56flF5A/3CGV9nHxd/1U42F/iPn53qC1
	Kd2FzCT/9TQeAAgYbnCQ9Z60j+zEy/mo9vy+9oCeogP7oEYS0MQUJylyc8vSmw2lyzP96rSvABaqa
	Y93XkuKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpGhI-00000009MZc-2907;
	Thu, 30 Jul 2026 02:40:36 +0000
Received: from out-185.mta0.migadu.com ([91.218.175.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpGhF-00000009MZ1-3PHB
	for linux-riscv@lists.infradead.org;
	Thu, 30 Jul 2026 02:40:35 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785379227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5B2ge7eLjQjPjb19+CHal8Uxkv+UmEOOCeLjm8fv4Ac=;
	b=VAV1Wozjjbctt9UIbsrw6lWTDArWr2lROWoB6yGPbEY3OAPKi7jY3Hm4QDpoj0ezssOa9b
	x8y4w5g4hv4fGXvuuY7dIe1+gRNg9C+PePCodCFtDN4YtlA2D9SPeQFhy1LF1jOP5/7H5H
	y4Gf2OblrZcF+GSyPNTIt5j11WHC2SU=
Date: Wed, 29 Jul 2026 19:40:19 -0700
Message-Id: <DKBK42KDTZXZ.18MO9G0R9L8B9@linux.dev>
To: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>
Cc: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <spacemit@lists.linux.dev>, "Troy Mitchell" <troy.mitchell@linux.dev>,
 "Aurelien Jarno" <aurelien@aurel32.net>
Subject: Re: [PATCH v3] riscv: disable local interrupts and stop other CPUs
 before reboot/shutdown
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Troy Mitchell" <troy.mitchell@linux.dev>
References: <20260330-v7-0-rc1-rv-dis-int-before-restart-v3-1-5a0577fcd136@linux.spacemit.com>
In-Reply-To: <20260330-v7-0-rc1-rv-dis-int-before-restart-v3-1-5a0577fcd136@linux.spacemit.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_194034_077242_6FC9D0B1 
X-CRM114-Status: GOOD (  13.84  )
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
Content-Type: multipart/mixed; boundary="===============3926040398903337590=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3926040398903337590==
Content-Type: multipart/signed;
 boundary=554137b98fdb9fb3d0fba56055422f9db991cf28966e80a0180e40cc316f;
 micalg=pgp-sha512; protocol="application/pgp-signature"

--554137b98fdb9fb3d0fba56055422f9db991cf28966e80a0180e40cc316f
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Mar 30, 2026 at 2:58 AM PDT, Troy Mitchell wrote:
> From: Troy Mitchell <troy.mitchell@linux.dev>
>
> Currently, the RISC-V implementation of machine_restart(), machine_halt()=
,
> and machine_power_off() invokes the kernel teardown chains (e.g.,
> do_kernel_restart()) with local interrupts enabled and other CPUs still
> running.
>
> This implementation fails to provide a deterministic execution environmen=
t
> for registered handlers in the restart or power-off notifier chains. Thes=
e
> chains are intended to be executed in a strict atomic and single-threaded
> context.
>
> Specifically, under CONFIG_PREEMPT_RCU, rcu_read_lock() does not incremen=
t
> the preempt_count. If local interrupts remain enabled, the environment
> is not guaranteed to be atomic. This can lead to a context misidentificat=
ion
> within generic kernel teardown code, causing it to incorrectly enter
> non-atomic paths (such as attempting to acquire sleeping locks), which
> results in fatal "scheduling while atomic" splats or system hangs.
>
> Additionally, stopping other CPUs ensures the primary CPU has exclusive
> access to the hardware state during the final teardown phase, preventing
> unpredictable interference from other active cores.
>
> Align RISC-V with other major architectures by disabling local interrupts
> and stopping other CPUs at the beginning of the shutdown sequences. This
> guarantees the architectural expectations of the kernel's restart and
> power-off handlers are met.
>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
> Tested-by: Aurelien Jarno <aurelien@aurel32.net>
Hi Paul,

A gentle ping on this patch. When you have a chance, could you please
take a look and let me know whether this approach looks reasonable?

                                    - Troy

--554137b98fdb9fb3d0fba56055422f9db991cf28966e80a0180e40cc316f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCamq5kyEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC/WUAEAo/Ayg3TKHBDa
h9ruUla/m+yRTaS8PyNF80vaN+vWPBsA/3qm/T+HOqlqDGPdwk5MY23wPc7amVyX
g6ursIB/U4kO
=1YnG
-----END PGP SIGNATURE-----

--554137b98fdb9fb3d0fba56055422f9db991cf28966e80a0180e40cc316f--


--===============3926040398903337590==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3926040398903337590==--

