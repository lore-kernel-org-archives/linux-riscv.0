Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CEC0C4707B
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jan 2024 13:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X1LsEnsMavhvyh8EwOHZQ74sSxddYhaDho5hjjiw3ac=; b=g3WeRzL31pJy6qBA17DuXZTpiQ
	ihMk/VdNJHNpbAWdhTHrsRAJqSwLjP5QHODbnraFWkWfzJXEPM83CEwc2X1+5t7jUov3CYpNxjsvO
	nPxLEL1pJu+PJkqR0dEOnNtkWn9MlGFAdM3xLPWctFiZXp5zOlg20DDb1VxSnfNS7vYiBpioc4Zr6
	cK95BD3xOrT7Pi995bJ+DN4wAsWlK1z0EfgkuqxqTedly0DaVIsxeeQtsJ3uaR2WyRNWCK1ED0uxX
	nQc0dyARNjihgN2LZnPK8IUh/eE9d85P3abqE/ZHvWByCsf2Dw4bohRxurdZW8+URlE2URk32ELgw
	xCfOG7kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQSOo-002qlb-0d;
	Thu, 18 Jan 2024 13:25:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQSOl-002qjX-22
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jan 2024 13:25:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2180A60CA3;
	Thu, 18 Jan 2024 13:25:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E907C433C7;
	Thu, 18 Jan 2024 13:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705584331;
	bh=guoJtA9OAPfX8Levtcyoev0UUVHna9BBFm5XMj+qEDY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cdMrPIDG9W19aLWkMkzZBbb13b+2sOamRIcggOU0QIQXwxeEn0S4sHPGG40kn1Jfj
	 qDDUYpVaweEq9Jh2G5rpxQI+qmJGEutVRctAgZMS82qXiPt7fV5jd0uuGZ+cdfIJw+
	 PN5s8E50deqa/8l5+XbAK4mKisaIHcVZ8o2ac3eyGBUiN3vyNVwTgPoMaZd5WyT+Ui
	 IyJiS/UsvEWuzwwG7TmXs3BfK40QgtivnySV74gzMspz2vcPQIhMpMFWHkAYfv86RJ
	 6ZgjEI/HfkUf4+hubsIgNlo1s4wi49bPG66Dz/NaEMrI/iA9naIBE+pI0MtK0inKHM
	 OZLbUAFB5DeSg==
Date: Thu, 18 Jan 2024 13:25:28 +0000
From: Conor Dooley <conor@kernel.org>
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: linux-riscv@lists.infradead.org
Subject: Re: Current status of RISC-V init_cache_level()
Message-ID: <20240118-enjoyment-defuse-3b5a2b76afb7@spud>
References: <CAEEQ3wn=TkGULh=kqUxxi913_AVrRW1Edb6tTe7CuKS=YkP1BA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEEQ3wn=TkGULh=kqUxxi913_AVrRW1Edb6tTe7CuKS=YkP1BA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240118_052535_712467_3FDC2445 
X-CRM114-Status: GOOD (  16.00  )
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
Content-Type: multipart/mixed; boundary="===============5440975244488817208=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5440975244488817208==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MClZy42moEzyeMRV"
Content-Disposition: inline


--MClZy42moEzyeMRV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 18, 2024 at 07:40:42PM +0800, yunhui cui wrote:
> Hi Conor,

Firstly, please don't send me off-list mails about such things
and instead, please reply to the relevant threads on lkml.

> There is no cache subdirectory in /sys/devices/system/cpu/cpu0/, so
> lscpu cannot see the cache information. I found that the reason is
> that init_cache_level() is not implemented on RISC-V.

What version of the kernel are you using? I had a brief check to make
sure something had not gone awry recently and I could see them on my
system. What do the cpu nodes in your DT look like, assuming you are
on a DT system?

> The history of the patch can be found by searching, as follows:
> https://www.spinics.net/lists/arm-kernel/msg1024976.html

I don't follow. This was the first iteration of a series that was merged
about a year ago and it moved the risc-v specific cache level
initialisation code to a common location and re-uses it for arm64.

> How is the progress of this patch?

A later iteration has been merged. Please use lore.kernel.org instead of
spinics - you can search for patchsets more easily (eg by filename) and
you could see it was merged in a later form.

Thanks,
Conor.

--MClZy42moEzyeMRV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZakmyAAKCRB4tDGHoIJi
0pBxAQCl8lYS7YVjKheJliHYzTBkZR6A6JIhnmn7zvreX/QGXwD9GosFUN1kEZdc
bghQG1Ylt1kyoA30HDs0wFLSTxZznw8=
=7jZ0
-----END PGP SIGNATURE-----

--MClZy42moEzyeMRV--


--===============5440975244488817208==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5440975244488817208==--

