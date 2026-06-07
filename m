Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D94CD8C90
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Jun 2026 20:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r5nq6DiGJQ9HoRDxq4Z+QtP4nVVCfw811ZRB3SNrLSg=; b=jJrBmHnoYmy5n1G/kqEvA7Rtsp
	tu7rXAbcxFiBrJUoq7FA8RBFlWGRrPl4uxDCSjDoJgRwmSuohZIwZ98Z+zMuV+QnkjjLQfLEuMB9r
	bZbLWjl3ydKjJMiV584/BECA3euxVQokOM3EqniGsZE8U0xW7Il4pt073GU39lyWHmyskMgWAVLHc
	gMj8Tq3sPrqWq219CXKwhFNBU0vBkhBKWs2VIe78oZFhuHgvoBkiRxc4AW9OpXnS4kWDpTUOteiHk
	4A3aULFquhK8WDccdTL4+LIid940iqGnJ7wwjrDprNwTNZI77siuVNxu+iPBcKHZmGlqtNhGq55Vz
	v4pDn5Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWKGD-00000002Tlu-06C2;
	Sun, 07 Jun 2026 20:38:21 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWKGA-00000002Tky-0ism
	for linux-riscv@lists.infradead.org;
	Sun, 07 Jun 2026 20:38:19 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gYRnr4yqsz9tSw;
	Sun,  7 Jun 2026 22:38:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mssola.com; s=MBO0001;
	t=1780864688;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mIGX2vLPaySQ+YHOkpYztytA+Unn1qR/6yK9NhrEodo=;
	b=fDu1MHAQP9rk9bXNBg7aTb+lIOBQjMdRMGtXh5bRe3hiHklRPY8Yv92JczRWQ9ZOM22aRY
	oKqpu8VtyBR+mGcb05swEE71CBSPC38VnNLSOQib9qbU5ZzXZkp4M+q7hyVLZ01UOuZTT+
	ybXBgqoTuVVsS3z7z/1Z9aHzdgplEN+17yfv/dIGUxZpPL410WhUA6YHiQQ4gJEhl5MhBD
	BpDnIYPE4lO8iv/CiYDntxtTTwuoWvOWdOIWjNo6565dIYHweacdbAPeNL/olbql7DNeKo
	XjrOUd9FGDmu9HkgsLYbnRla3tFqmY5cJLWfZkwvCe7mBDhPggcQCBI6y7oGcw==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=temperror (outgoing_mbo_mout: error in processing during lookup of mssola@mssola.com: DNS error) smtp.mailfrom=mssola@mssola.com
From: =?utf-8?Q?Miquel_Sabat=C3=A9_Sol=C3=A0?= <mssola@mssola.com>
To: Paul Walmsley <pjw@kernel.org>
Cc: linux-riscv@lists.infradead.org,  corbet@lwn.net,
  skhan@linuxfoundation.org,  palmer@dabbelt.com,  alex@ghiti.fr,
  linux-doc@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] riscv: enable HAVE_CMPXCHG_{DOUBLE,LOCAL}
In-Reply-To: <f63eefc9-769d-409c-4099-274254432129@kernel.org> (Paul
	Walmsley's message of "Sat, 6 Jun 2026 18:50:55 -0600 (MDT)")
References: <20260605141247.253315-1-mssola@mssola.com>
	<f63eefc9-769d-409c-4099-274254432129@kernel.org>
Date: Sun, 07 Jun 2026 22:38:05 +0200
Message-ID: <87a4t6w0gi.fsf@>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 4gYRnr4yqsz9tSw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_133818_368280_B09A52B4 
X-CRM114-Status: GOOD (  31.93  )
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
Content-Type: multipart/mixed; boundary="===============3175845312397404393=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3175845312397404393==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

Paul Walmsley @ 2026-06-06 18:50 -06:

> Hi,
>
> On Fri, 5 Jun 2026, Miquel Sabat=C3=A9 Sol=C3=A0 wrote:
>
>> Support for atomic Compare-And-Swap instructions has been in the RISC-V
>> port of the Linux kernel for a long time. That being said, we apparently
>> never bothered to set HAVE_CMPXCHG_DOUBLE and HAVE_CMPXCHG_LOCAL in the
>> Kconfig, despite having all the framework to support them.
>>
>> Signed-off-by: Miquel Sabat=C3=A9 Sol=C3=A0 <mssola@mssola.com>
>> ---
>> This is a resend of [1], rebased on top of the latest commit from the
>> for-next branch.
>>
>> I have built this patch with multiple configurations and ran it with KVM
>> (the VisionFive2 board that I have lacks the needed extensions). All see=
ms
>> to work, but I do wonder if we did not enable these for a reason or this
>> just slipped through. So far in the code I believe everything is in plac=
e,
>> and I haven't seen any commit in the git log stating otherwise.
>>
>> [1] https://lore.kernel.org/all/20260220074449.8526-1-mssola@mssola.com/
>
> Thanks for the patch.  Your comments above are why I've been hesitant to
> merge it.  I'm not aware of any publicly available hardware that supports
> Zacas/Zabha.  No one has stepped forward to provide any Tested-by:s on
> hardware that hasn't been released yet.  You mention that you tested on
> your VisionFive2 board, but it would not have exercised those code paths.

No, I mention that I ran it _only_ on KVM, as my VisionFive2 board lacks
these extensions and hence I couldn't possible have tested this there :)

>
> Of course, we already have Zacas/Zabha support, merged back in 2024, in
> cmpxchg.h.  I assume (?) that it was tested in QEMU, but I don't see any
> comments about that in the patch series.  No one sent any Tested-by:s
> then, either.
>
> It would be good if you (and ideally others) could put this patch through
> some testing on QEMU with Zacas and Zabha enabled, before we merge it.
> The affected code paths for HAVE_CMPXCHG_LOCAL seem to primarily involve
> per-CPU counters and MM zone counters, so those would be the areas to
> focus.  HAVE_CMPXCHG_DOUBLE seems to do nothing useful other than
> preventing the AMD IOMMU driver from being selected if it's not present,
> so that part of the patch seems fairly useless.  In fact I'd suggest
> dropping that from the patch and just sending a separate patch to remove
> HAVE_CMPXCHG_DOUBLE from the kernel completely.

To be fair, on QEMU I only "tested" it by booting it, running a few
things for some time and ensuring that nothing got totally broken in the
process while taking a look at the kernel logs.

In any case, let me double check with QEMU with these extensions enabled
and I'll try to be more thorough about it. I'll do just that whenever I
have some spare time during the following week :)

As for HAVE_CMPXCHG_DOUBLE, removing it makes sense. Let me just take
another look and I will send a separate patch whenever I'm ready for it.

>
>
> - Paul

Thanks for your input!
Miquel

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJiBAEBCgBMFiEEG6U8esk9yirP39qXlr6Mb9idZWUFAmol1q0bFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyEhxtc3NvbGFAbXNzb2xhLmNvbQAKCRCWvoxv2J1l
ZbPMEAC7Y/Qp2rixtfdlr2FQG6bybg7g9iwMX1kUJvH3I7LtZHORk6OQ3N46OSmY
NR7FZVTWRilOz8C1YfIAt2tOuPFaMUSuLKnFJoTk4ENQVmeMt+FDxxA77qKYidq2
OZ0YulnWXcmteR/GOur88J+t2V4DzzBbJkLOMq8El4aiX3hWOhKbRgzcdxDg658Q
vbVSYwD06+1SqzpUqxPBOXDrSKjXVLHLiGxpkcLvNLuvsB/qP8xFfa1R+8sQFCZK
bILM9RR2Uhq7dZ4DWKiHuMNgvt328Wo5yneHS+2qfxWmtwg8d7Q9iM4vIw/V9fq3
xfH1dbByDUtXEV+0oL9276XfYfyfry3bh9Q0CoFdu+62h22u9TfhbKMuzhgoVdif
idzkep6eVRoRONUIlAAoSiW4qUGTQnWQHmQz8JCY4B7INDUnvSLrylKHioFPvrhf
otCB9/slsAOLK5eMKpnmFqHYPfHpIMv6wZVPGGKmzI/pRvgLbUutF1ldOY5rP4hx
Y+7dRm/7FjY5fjbIzflN58CUL8Zh+Avm72KH/lGnZnxpFd2zRYzpi+IB+p2trn4v
XwfqGxP2KCBSorspaeHSNNgiYtJzcQ5b3Mbw+smQRjRGglSMkmtFsNSwqrJTbnUv
6w4XcMyj7RD6BjvbFHw0eHKchFgUUv1zCa0SnNt53fNqQKWvWw==
=/8zA
-----END PGP SIGNATURE-----
--=-=-=--


--===============3175845312397404393==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3175845312397404393==--

