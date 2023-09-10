Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9DC8EE14D8
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Sep 2023 08:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wVsqk7lnQw0YL1YC2nEKXMmu15nbZwGcjkkcQvpGb8Y=; b=4BCGhW9fcevTMTXWYa6UPM5vgE
	H4PJdHXY90UWfUUlefM1fHz4vhYxhly7vzC5GUPsbMVrfgIwXhlUKC0vlyaGeQjVs9jTHbv/46Hle
	DOJ1FCaa1Z91tYBL3f0QP6dFHb0MXyVezoirDQFeVbz0P+li7Nv1/99gPqj4Lu2ECtKGbIUrq93XZ
	/qcQP31Ng3r0wfPfJGhxF3Y447biMJm+27P4qLVph2BpkiISPznuJxnT3Z1JDo7d2gDhA2OB3PqEw
	EFb2EGtOWBgrQYgF2gB3a5tyun4tSxV1XNm85XgHcMDkb8KVTTQOYoO6YTxzYm+FHTKgrddMx2IDw
	l9wkGwyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfGHC-00GK8S-0W;
	Sun, 10 Sep 2023 08:58:42 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfGH9-00GK7T-1C
	for linux-riscv@lists.infradead.org;
	Sun, 10 Sep 2023 08:58:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BC84BB80A06;
	Sun, 10 Sep 2023 08:58:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A56C4C433C7;
	Sun, 10 Sep 2023 08:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694336316;
	bh=ie3mkzGb78frh1QxUYvyoQn4GH0ST3RCcUoT31fNuUk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dtepG0xn8dCUF6d/nvOR4p1KA2z2RoXleNgidaXdsI9NMFCQI2q0CfrdT8VA/xygA
	 m9gdZoMzTl7LlfrvfDZn6IxiU6Z84Y/BqBFsUPlsu0QWk5zOpwIhLbNJNPd1yrYzr2
	 5k7/NNn7whYrqyhR1WWdaINPnEJEnlj69/XbcRYYcrLpaGrnuh18sYNheT5vmRdjM7
	 cUcFoumVx1hEASilEz09Br0aei9/BXf8xgSxmpfUnHESm2+yiSSEwFeT5AhDSpyqmX
	 7jW3wC4u+YKTQdvs/mFwr44+sYiPOYiubMpijZThv68+ydMS+N0VFyZl1GyC0crQc8
	 NhSBcQJFlrsGw==
Date: Sun, 10 Sep 2023 09:58:28 +0100
From: Conor Dooley <conor@kernel.org>
To: guoren@kernel.org
Cc: paul.walmsley@sifive.com, anup@brainfault.org, peterz@infradead.org,
	mingo@redhat.com, will@kernel.org, palmer@rivosinc.com,
	longman@redhat.com, boqun.feng@gmail.com, tglx@linutronix.de,
	paulmck@kernel.org, rostedt@goodmis.org, rdunlap@infradead.org,
	catalin.marinas@arm.com, conor.dooley@microchip.com,
	xiaoguang.xing@sophgo.com, bjorn@rivosinc.com,
	alexghiti@rivosinc.com, keescook@chromium.org,
	greentime.hu@sifive.com, ajones@ventanamicro.com,
	jszhang@kernel.org, wefu@redhat.com, wuwei2016@iscas.ac.cn,
	leobras@redhat.com, linux-arch@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org,
	kvm@vger.kernel.org, virtualization@lists.linux-foundation.org,
	linux-csky@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V11 00/17] riscv: Add Native/Paravirt qspinlock support
Message-ID: <20230910-esteemed-exodus-706aaae940b1@spud>
References: <20230910082911.3378782-1-guoren@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230910082911.3378782-1-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230910_015839_551949_C3A2482D 
X-CRM114-Status: GOOD (  10.13  )
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
Content-Type: multipart/mixed; boundary="===============8894826133700932790=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8894826133700932790==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ORxaGwMyxaL8VJte"
Content-Disposition: inline


--ORxaGwMyxaL8VJte
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Sep 10, 2023 at 04:28:54AM -0400, guoren@kernel.org wrote:

> Changlog:
> V11:
>  - Based on Leonardo Bras's cmpxchg_small patches v5.
>  - Based on Guo Ren's Optimize arch_spin_value_unlocked patch v3.
>  - Remove abusing alternative framework and use jump_label instead.

btw, I didn't say that using alternatives was the problem, it was
abusing the errata framework to perform feature detection that I had
a problem with. That's not changed in v11.

A stronger forward progress guarantee is not an erratum, AFAICT.

>  - Introduce prefetch.w to improve T-HEAD processors' LR/SC forward progress
>    guarantee.
>  - Optimize qspinlock xchg_tail when NR_CPUS >= 16K.

--ORxaGwMyxaL8VJte
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZP2FNAAKCRB4tDGHoIJi
0vtHAQDkzGM0Ps4GL3DcCukAmWgFu5NhrG8JrAccsQivkfwJiQD/VS20Hau/Evtj
7e/AK20nyAL4aPqBlnjOO0LuZ9X5mQI=
=80fi
-----END PGP SIGNATURE-----

--ORxaGwMyxaL8VJte--


--===============8894826133700932790==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8894826133700932790==--

