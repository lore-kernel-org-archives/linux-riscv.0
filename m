Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6004FFD0653
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Mar 2026 08:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T/64fjeMgNqFO8YV8r6et8EesS57jXn4mUlejR/ecZw=; b=a9O2Ah9CKumNtmU+QTG6zyaJcN
	Dmmp+FNUY9liG2yeOV9tkIcsiz4gJEb4FViWF5XzaJenyJPMi0fZNoLUT+3ugOdLcdycD/bH9FdbP
	U/SPgJ89HKEy3S9EhROkwyhBKGg6hC41Y14YlvbQy049KxHIkA/rjE7uqMHQ11XmAaiX5m163i8QR
	0843aJppOQ3Z4pzNonI+wAjPiAqRD6RdIp3Ko8pPWr1I4fnk0Sia5d8aQPGsj9gZA4aeZgXvAAKbq
	CZUYA46h9XoA0IZaH6YV6QDjdQj0WX8xrSczNZPU0j/x09OKMjdObBNHLZK3xoNGpgXjVDuHTYB3q
	YQCXKCtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0El2-0000000B90D-2M5A;
	Wed, 11 Mar 2026 08:17:32 +0000
Received: from mout-p-103.mailbox.org ([80.241.56.161])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0El0-0000000B8vk-0M0X
	for linux-riscv@lists.infradead.org;
	Wed, 11 Mar 2026 08:17:31 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4fW3Wc4NXZz9tm7;
	Wed, 11 Mar 2026 09:17:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mssola.com; s=MBO0001;
	t=1773217036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HVbE7XCLIawi/u9FQSgHONTfHdNScTIl0ofsK2VWYUE=;
	b=yrcn6O9pdFCOWtGFWrBB+buvKZi54udD+r2gZM39Gb8RLr3b2ka5DE8dNbgun7lE7f35Jk
	J/bCSrb2jQlq6BzOm5W/5HHrU8rlKmK3vzE6eVRpiZt/SxmQkQqSe3Q5LqxCWrONedkjD8
	8iG0pkIfGxLbH90+I7PGTcaKDqEFioQr/3M18HjhZu4D/VRROXo/WDc5U5dLka8FtqI3Rw
	GXVF8TTS61jv4YVRjbrAJJWBGeSvZj/h+IRuLM6/diI6cWPETE5lmVCWhQJEOpuhFljk8r
	ZLZx21Pox+Xo3UBSq3w3wu8ryghhya28xZ9ptpwqUBl/20xhNV91/zZ7XpxdOQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=softfail (outgoing_mbo_mout: 2001:67c:2050:b231:465::202 is neither permitted nor denied by domain of mssola@mssola.com) smtp.mailfrom=mssola@mssola.com
From: =?utf-8?Q?Miquel_Sabat=C3=A9_Sol=C3=A0?= <mssola@mssola.com>
To: pjw@kernel.org
Cc: palmer@dabbelt.com,  alex@ghiti.fr,  corbet@lwn.net,
  linux-riscv@lists.infradead.org,  linux-doc@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: enable HAVE_CMPXCHG_{DOUBLE,LOCAL}
In-Reply-To: <20260220074449.8526-1-mssola@mssola.com> ("Miquel
 =?utf-8?Q?Sabat=C3=A9_Sol=C3=A0=22's?=
	message of "Fri, 20 Feb 2026 08:44:49 +0100")
References: <20260220074449.8526-1-mssola@mssola.com>
Date: Wed, 11 Mar 2026 09:17:10 +0100
Message-ID: <87sea63hmh.fsf@>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 4fW3Wc4NXZz9tm7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_011730_342518_3A484913 
X-CRM114-Status: GOOD (  19.48  )
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
Content-Type: multipart/mixed; boundary="===============2139031190715120589=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2139031190715120589==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Miquel Sabat=C3=A9 Sol=C3=A0 @ 2026-02-20 08:44 +01:

> Support for atomic Compare-And-Swap instructions has been in the RISC-V
> port of the Linux kernel for a long time. That being said, we apparently
> never bothered to set HAVE_CMPXCHG_DOUBLE and HAVE_CMPXCHG_LOCAL in the
> Kconfig, despite having all the framework to support them.
>
> Signed-off-by: Miquel Sabat=C3=A9 Sol=C3=A0 <mssola@mssola.com>
> ---
> I have built this patch with multiple configurations and ran it with KVM
> (the VisionFive2 board that I have lacks the needed extensions). All seems
> to work, but I do wonder if we did not enable these for a reason or this
> just slipped through. So far in the code I believe everything is in place,
> and I haven't seen any commit in the git log stating otherwise.
>
>  Documentation/features/locking/cmpxchg-local/arch-support.txt | 2 +-
>  arch/riscv/Kconfig                                            | 2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/features/locking/cmpxchg-local/arch-support.tx=
t b/Documentation/features/locking/cmpxchg-local/arch-support.txt
> index 2c3a4b91f16d..28d5fa8c3b4f 100644
> --- a/Documentation/features/locking/cmpxchg-local/arch-support.txt
> +++ b/Documentation/features/locking/cmpxchg-local/arch-support.txt
> @@ -20,7 +20,7 @@
>      |    openrisc: | TODO |
>      |      parisc: | TODO |
>      |     powerpc: | TODO |
> -    |       riscv: | TODO |
> +    |       riscv: |  ok  |
>      |        s390: |  ok  |
>      |          sh: | TODO |
>      |       sparc: | TODO |
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 7e76b6316425..7c6726a8d738 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -151,6 +151,8 @@ config RISCV
>  	select HAVE_ARCH_USERFAULTFD_WP if 64BIT && MMU && USERFAULTFD && RISCV=
_ISA_SVRSW60T59B
>  	select HAVE_ARCH_VMAP_STACK if MMU && 64BIT
>  	select HAVE_ASM_MODVERSIONS
> +	select HAVE_CMPXCHG_DOUBLE if RISCV_ISA_ZACAS && RISCV_ISA_ZABHA
> +	select HAVE_CMPXCHG_LOCAL if RISCV_ISA_ZACAS && RISCV_ISA_ZABHA
>  	select HAVE_CONTEXT_TRACKING_USER
>  	select HAVE_DEBUG_KMEMLEAK
>  	select HAVE_DMA_CONTIGUOUS if MMU

Gentle ping :)

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJiBAEBCgBMFiEEG6U8esk9yirP39qXlr6Mb9idZWUFAmmxJQYbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyEhxtc3NvbGFAbXNzb2xhLmNvbQAKCRCWvoxv2J1l
ZV+qD/42BfFHtrdjJOAGKsZ6+cKha1oRmZ5yMeHtoUCpaZKNRMTiErjvTmWP1JYW
xgRS/ygXR7uCk/6AMU/TDodVYoSAYf0aiUgUY31MVwdiAuKS47QFNcudT/amOPBj
ShwZmq1jlwC/ed8RwrrPw37q/u5IqGIcBKzrJiOo/WLxqWmhQWHBuEHXS31wMlHC
JcYsQ3fVaEjvgx1kJAxsVWZWyNC0xB4uhu/RqC8TzdI2EG2tVceDidlWMDdJytUo
rNS+Mxs8r94vXfVE4aijycvCu00KLuP3g7PjqTK6oB+2OYJNEJhJjvCC5jKPP6bu
o3KR+Tqg649SV4jPSbK1dgT2ky3YSeSPK2hd6511z0wnQ9fq90Fj1nJYNkgg1Wz3
w4+BVCOodwN9zmMPHrjyhkhm1B2/JB8gnDgD62VVVUhtVqHQXklbYgn2yeZpFgZg
gMp6qfFW9dpaSxGnV9OwYy/ufm4E6ixa9wsWuNH7VbV1ipP0iNhZZXMoDRlLot2D
ZsLQh9V7RDKUks5Qdf+FRzMVHaHIDk3lZlfbIwCn75LfZvsrIaRfQf8wCZGqnPBA
Len36N5XxlyqTq3/qtObyZMgLErVW6Z0qkB8IQtYAgTs2isLNul/2PrMY8Q1nuIF
cwKS/l8y0E8Pbh/4TE09kkDWKhjin4PlhPFUoVY672ptWzPQvA==
=vK1m
-----END PGP SIGNATURE-----
--=-=-=--


--===============2139031190715120589==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2139031190715120589==--

