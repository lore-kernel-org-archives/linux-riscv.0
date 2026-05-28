Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28A42CD5BD1
	for <linux-riscv@archiver.kernel.org>; Thu, 28 May 2026 11:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kuQvfXVsuzsaK6C3sIHAr8iepG8cwrFFikOF6j4r3Fc=; b=MhADWt51sqVl+nxmI0o3jj53vz
	sx+NZ8Ur4lpQJs71iSuW3DsxpnnLZUjjKOabEMz14dfqgGv6DGGiOGiRzR3Ql5/AtbP4s+tNrD78L
	FexTfS9i3b7Qq8VjAx2nGuluqPjUh31+otCmdVrgql1olCz5mtBiIeUVTwZTwAIpBcqovmyXRP7pG
	H3THlwuWECEnNIdqAAZdurSa/qDNMayOUr8/UgCYKJyccSaJmdBR8DdVughkj6HoPS9pyLXBO4z7y
	TAQD8jNOJDqNC1LYhQqujtRki6uIeHhw/z6PT7wSm9yt45Yh2fHJOtRfAMpl8hmq7+d09V5yTm8uJ
	FORLKjxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSYhj-00000005eOo-2uH6;
	Thu, 28 May 2026 11:15:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSYhg-00000005eOK-21I9
	for linux-riscv@lists.infradead.org;
	Thu, 28 May 2026 11:15:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 59D3F43FB5;
	Thu, 28 May 2026 11:15:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8A9A1F000E9;
	Thu, 28 May 2026 11:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779966907;
	bh=RaSwjjwY7L43Pt4ifGaOyS+rmXcHainlqC5wj7d6FGs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mgOTK2Tft+6PLu9lmoRUPtk/Covdhptd2aIBEiCAbB4KS+mC/Ggcdk3AYo9nn0YID
	 pyVmK6rCiJjlQxkPIspfbl4dVtNfa8cFVsZQO7dUENjzAEAc3qYSWTgNObGZwFZmJP
	 jWCQSvrQRM6x80T+mns2eIF4XBmQDWAGojFXUpS/8RFeHg3lh8wzPRPYY2JaJpi1GP
	 9pUR7jfLS2AueVJQlSKr3Sn/9VAow19enmSF6f/DrWQkGxe0t+Woid6fiPnQXUuUyu
	 2BXImcsBz2vlDi2d1GbpHZj9FF0tyGmwGElNHBlSVCzqiM+UviFgLkdC/1KnhbloZ9
	 mX7PxqDoHeHcg==
Date: Thu, 28 May 2026 12:15:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Zong Li <zong.li@sifive.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, debug@rivosinc.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, david.laight.linux@gmail.com,
	re@w6rz.net, catalin.marinas@arm.com, szabolcs.nagy@arm.com
Subject: Re: [PATCH] riscv: cfi: reduce shadow stack size limit from 2GB to
 512MB
Message-ID: <6fac30db-c87f-4242-a858-54d4467ade85@sirena.org.uk>
References: <20260522093634.3530233-1-zong.li@sifive.com>
 <CANXhq0pfU1+Qv-SdJRzwvSDQw010+QovUH-OuG4tcwwsjf90MQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANXhq0pfU1+Qv-SdJRzwvSDQw010+QovUH-OuG4tcwwsjf90MQ@mail.gmail.com>
X-Cookie: Someone is speaking well of you.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_041508_560923_752D488D 
X-CRM114-Status: GOOD (  16.77  )
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
Content-Type: multipart/mixed; boundary="===============1757367002352734947=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1757367002352734947==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="umKIjHoEp01llVfM"
Content-Disposition: inline


--umKIjHoEp01llVfM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 28, 2026 at 09:07:04AM +0800, Zong Li wrote:

> Because the RISC-V shadow stack stores very similar data to GCS, I
> also reduced the RISC-V shadow stack size to 2G in my recent patch.
> You can find the reasons for this change here:
> https://lists.infradead.org/pipermail/linux-riscv/2026-May/091308.html

> In the same thread, we discussed if we could make the size even
> smaller. Thank David for his helpful analysis on this topic.

> Since GCS has been merged for a few years now, we'd like to learn from
> your experience. We want to make sure we are not missing any important
> impacts or issues. Therefore, we would really appreciate it if you
> could share your thoughts with us. This will give us the confidence to
> move forward with the patch

Nobody has reported it causing them a problem, but there's not really
much practical use yet due to hardware availability so that might change
and I'm not sure how much inference you can draw there - there is much
more test use than production use at this stage.  I would be astonished
if anyone wanted the shadow stack to be bigger, the more likely problem
is excessive VA usage but we felt it was better to err on the side of
using too much memory.  The general feedback from userspace people was
that they weren't too concerned about issues.

--umKIjHoEp01llVfM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoYI7UACgkQJNaLcl1U
h9DhlAf+NNLL/XYPMhBMBlBhdSv8JTY9UApiXNcNa3NVxS0sy6e7VkWLkBio++47
pLNaTi1nSoBZYKb7K9UL8WIlH/cV+5GUYp04DCLl6yM4GgClFmsFEt7EWwatb0hS
v/RIn7n53SGPKE4B+/lVPQ2uiG+djViOth3rpGH7S3Phz9asS/MvfG2siYgP+Udt
BGtULtKTPVFJlZ/ROG0xh82CuHfHrxTuXa7KMjasGi/V6sytBKZEcOYEEe1gp3Rx
tOiDsFQlPFh1fHmmrf96ZUICZosEOfv5wt9zvgE8p5v+ufzqBjHdzuZ2ES2bWdc5
fMoRLXJshcTxKDLX45nohEtSnSrLcA==
=JDS8
-----END PGP SIGNATURE-----

--umKIjHoEp01llVfM--


--===============1757367002352734947==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1757367002352734947==--

