Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69365CA0ECA
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 08:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vNLFL2hB1YBmnTjwiRpYimnKRslrgSnwb22HmBefNi8=; b=JodhJ5TreeB+QoF0wD702wzF5q
	FxQbBoGpQBAA97948unGsWZvrC8KbCL03/w9rbHV/53YOrRjsVrD4Kuiw6raHzq/bfmAgOe6m/08d
	y1pnzAJ4XUgWC9vrWAXj0ekgLLgPgc811bPSmZbH7LGECI/mEMINdNM6XCC1O0R6Ys+8LJSRmpjZ0
	UopOphNEpV6zWx+9O8G1MNGHBx3pSyfKTLUbsMXXU17DXBi6U9yuFUyJhck69EhUyBqPSIssevb7e
	6YdXsiJUkY1zvKFQxXtHdhaeSr2B8RBXixy9LpXcwrhzHRlBggfKfMpdvqPBwPXqnmBOhfX/Dj+sC
	KqrK89qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfyRP-002WGH-1L;
	Tue, 12 Sep 2023 08:08:11 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfyRK-002WDW-1h
	for linux-riscv@lists.infradead.org;
	Tue, 12 Sep 2023 08:08:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1694506086; x=1726042086;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4dV0kV+KXW7UJb+9tqUaPdb1gu1yn8BbHk8/t4Bxq1g=;
  b=OGY6tiyqYvAAy4S3U0LN0f+j584IghS8IEJwV+AVO5EnZa7+Y2F/sUFA
   AnLKYVbFFnURJnaoVb5Vv01WJ8Il+m06GtjNFT9D2b27lAarGgjOizkiF
   bZb9Oxedbyl1ZRjS8YtWXI5CKhc5YXwGoCCb6do2jlC27dbhRAgd25/wV
   7Zz45N7skl03I7AkuVpSmSP9pxVUTU17hrhmMkWFVI0rQQ2JzQ2S5XzH4
   q1gb+nLu3jjA9GcoRGBhRY0fCrUmjSaFQecH/avJpA4qSZMlFPXT0B7Ba
   GY944NAZpxuQfcjMwZGn2a/VYXYF8Qb8nRBGFIviMqvWZQxKyJO6voQFa
   g==;
X-CSE-ConnectionGUID: 7hms3/EVQU6kwoNgywT1gw==
X-CSE-MsgGUID: Wxbwhb0NT0acycYnDfqITw==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; 
   d="asc'?scan'208";a="4155476"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Sep 2023 01:07:57 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 12 Sep 2023 01:07:49 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 12 Sep 2023 01:07:44 -0700
Date: Tue, 12 Sep 2023 09:07:28 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Guo Ren <guoren@kernel.org>
CC: Conor Dooley <conor@kernel.org>, <paul.walmsley@sifive.com>,
	<anup@brainfault.org>, <peterz@infradead.org>, <mingo@redhat.com>,
	<will@kernel.org>, <palmer@rivosinc.com>, <longman@redhat.com>,
	<boqun.feng@gmail.com>, <tglx@linutronix.de>, <paulmck@kernel.org>,
	<rostedt@goodmis.org>, <rdunlap@infradead.org>, <catalin.marinas@arm.com>,
	<xiaoguang.xing@sophgo.com>, <bjorn@rivosinc.com>, <alexghiti@rivosinc.com>,
	<keescook@chromium.org>, <greentime.hu@sifive.com>,
	<ajones@ventanamicro.com>, <jszhang@kernel.org>, <wefu@redhat.com>,
	<wuwei2016@iscas.ac.cn>, <leobras@redhat.com>, <linux-arch@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<kvm@vger.kernel.org>, <virtualization@lists.linux-foundation.org>,
	<linux-csky@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V11 00/17] riscv: Add Native/Paravirt qspinlock support
Message-ID: <20230912-snitch-astronaut-41e1b694d24f@wendy>
References: <20230910082911.3378782-1-guoren@kernel.org>
 <20230910-esteemed-exodus-706aaae940b1@spud>
 <CAJF2gTRQd_dNuZHNwfg3SwD0XERaYXYUdFUFQiarym40kpxFRQ@mail.gmail.com>
 <20230910-baggage-accent-ec5331b58c8e@spud>
 <CAJF2gTS8Vh5XdMUcgLA_GJzW6Nm3JKHxuMN9jYSNe_YCEjgCXA@mail.gmail.com>
 <20230910-facsimile-answering-60d1452b8c10@spud>
 <CAJF2gTSP1rxVhuwOKyWiE2vFFijJFc2aKRU2=0rTK9nDc8AbsQ@mail.gmail.com>
 <20230911-nimbly-outcome-496efae7adc6@wendy>
 <CAJF2gTTSDtnc7WRAZ0eLjiwZHZFbOcPZaQ_c8LiLcctBNsKCaA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJF2gTTSDtnc7WRAZ0eLjiwZHZFbOcPZaQ_c8LiLcctBNsKCaA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_010806_700976_42929FD6 
X-CRM114-Status: GOOD (  16.29  )
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
Content-Type: multipart/mixed; boundary="===============5552928454597884201=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5552928454597884201==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="j7Df9CobqEwFv6J/"
Content-Disposition: inline

--j7Df9CobqEwFv6J/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 12, 2023 at 09:33:57AM +0800, Guo Ren wrote:
> On Mon, Sep 11, 2023 at 8:53=E2=80=AFPM Conor Dooley <conor.dooley@microc=
hip.com> wrote:

> > I added the new "riscv,isa-extensions" property in part to make
> > communicating vendor extensions like this easier. Please try to use
> > that. "qspinlock" is software configuration though, the vendor extension
> > should focus on the guarantee of strong forward progress, since that is
> > the non-standard aspect of your IP.
>=20
> The qspinlock contains three paths:
>  - Native qspinlock, this is your strong forward progress.
>  - virt_spin_lock, for KVM guest when paravirt qspinlock disabled.
>    https://lore.kernel.org/linux-riscv/20230910082911.3378782-9-guoren@ke=
rnel.org/
>  - paravirt qspinlock, for KVM guest
>=20
> So, we need a software configuration here, "riscv,isa-extensions" is
> all about vendor extension.

Ah right, yes it would only be able to be used to determine whether or
not the platform is capable of supporting these spinlocks, not whether or
not the kernel is a guest. I think I misinterpreted that snippet you posted,
thinking you were trying to disable your new spinlock for KVM, sorry.
On that note though, what about other sorts of guests? Will non-KVM
guests not also want to use this virt spinlock?

Thanks,
Conor.

--j7Df9CobqEwFv6J/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQAcMgAKCRB4tDGHoIJi
0qK3AQDulJZGiGgA+E47R8Ud6R5oEN/4EtWOAnkckiastVsR5QEA6lHxhL+c0RXG
ffHqBpd4a2z2HVNcuw9EEcI8bR26oQE=
=j90q
-----END PGP SIGNATURE-----

--j7Df9CobqEwFv6J/--


--===============5552928454597884201==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5552928454597884201==--

