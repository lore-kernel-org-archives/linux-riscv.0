Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA2BC4829A
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Feb 2024 10:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jASQULC464fht0ICIXcyHnTxJf2UMnt4QmbtwjBdzsE=; b=cZ/l3p7QeEPiwvvrhr3RcpoKrj
	p2vCRnmJWZeX2ZFWqbWlG6joHqIFfMQQzZZtOaFsQT7Fsr8a4l0C3yeJNfaT2cpyEn/CGMHsZymsI
	4wWnRL3W4kHAY9i2g127H8QYE1VLcuLPRMUGihZlH5qTr2xJOV4kL3RwjawXPItaabMyKAzsJpjSS
	flv2fgrPsllsp/IsVfCZoOeBQ4REFe5qFh6d28SzJ9q6hEEwwUbo19XnuEeT4M4Y2eZenzokHxhxb
	JmpxlEll9n0Xjmhf6Sy5KpUdsIb1stlCvx1qWzxZoFIeKkk9wTMDpW8vE6R8XEIDrWE4DZ0Kl81Q0
	miyJidFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYkgh-00000001WDx-3pN0;
	Sat, 10 Feb 2024 10:34:23 +0000
Received: from mail.envs.net ([5.199.136.28])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYkge-00000001WDV-3zmL;
	Sat, 10 Feb 2024 10:34:22 +0000
Received: from localhost (mail.envs.net [127.0.0.1])
	by mail.envs.net (Postfix) with ESMTP id 680A738A0669;
	Sat, 10 Feb 2024 10:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=envs.net; s=modoboa;
	t=1707561258; bh=5a4661pQcO2UmB9YG8h4KMvOlZHo5f/ZdvFHx3vRpxM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q6KVukH29RtPYwyml17BXgB1SmxkBYEw4zRKRdKhpkPRa67se3EdVj24xz81Ui0wV
	 bBNmdiX5dFJ/Xp/zyB26rb9gY+UsBhPlTzHR0/YSXlz0jXt7TQHToVwVdQ0m6D9VMa
	 vNmRfdEn5LTArmMr2SIjvZMADyomU00AaofZpWTreGX1i0gAO4bXRV+RE88WDG3Yb+
	 3kznEc0XPTY7aoYT1FMzoz8fmwpTlX6A52K2JY85jYorttEXIMeU9kV5yut/B+iGjv
	 JJDyZO87vAiyGH2IBxG1sPRLEIGjHz8ez6XEerXvaRVtRjAaM4QagCuKSpRExeFzYP
	 QWY4e7gG4PVlyVXAhnmaRRHCmLovC3fuoZCGm2lD0leXsnwnsZ7k2OVV9Zf3rYdEpx
	 /Uw5xIjxS5AAh33rNa7LVNAHvNU1hzgGBP06bFerJ9AAf8vZx63wEeS4681LKJA4Bq
	 1l68Gh2zHrzCxnj4kay9zKRabS4r95sXzhEeLLP6gVYWWKBuhrD8bFsA0JdWc53J6T
	 FGqpvGOMqiE8WlDTiWAI2lXoaCMeI1fDKKyf7P6rtFB+LzpPRZLquhDLkUmF97Tmog
	 +xitv9uyVWBsUPLRSOifICJt7QN451b4+c3v9BChHq9OmqaRl2JUMQP4TX3HTQhXpu
	 1H/k22hJKWvTVPg81yHEaMpo=
X-Virus-Scanned: Debian amavisd-new at mail.envs.net
Received: from mail.envs.net ([127.0.0.1])
	by localhost (mail.envs.net [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id BTTrmuQrF_Ze; Sat, 10 Feb 2024 10:33:36 +0000 (UTC)
Received: from xtex.localnet (unknown [103.84.217.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.envs.net (Postfix) with ESMTPSA;
	Sat, 10 Feb 2024 10:33:36 +0000 (UTC)
From: xtex <xtex@envs.net>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Dinh Nguyen <dinguyen@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH 1/2] kbuild: Abort make on install failures
Date: Sat, 10 Feb 2024 18:33:31 +0800
Message-ID: <4681093.vXUDI8C0e8@xtex>
In-Reply-To: <ZcdP7CC+OMbp5ZMi@shell.armlinux.org.uk>
References: <20240210074601.5363-1-xtex@envs.net> <20240210074601.5363-2-xtex@envs.net>
 <ZcdP7CC+OMbp5ZMi@shell.armlinux.org.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240210_023421_174552_EA93585E 
X-CRM114-Status: UNSURE (   8.72  )
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
Content-Type: multipart/mixed; boundary="===============4489851630989700918=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4489851630989700918==
Content-Type: multipart/signed; boundary="nextPart2124038.9o76ZdvQCi";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart2124038.9o76ZdvQCi
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: xtex <xtex@envs.net>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Subject: Re: [PATCH 1/2] kbuild: Abort make on install failures
Date: Sat, 10 Feb 2024 18:33:31 +0800
Message-ID: <4681093.vXUDI8C0e8@xtex>
In-Reply-To: <ZcdP7CC+OMbp5ZMi@shell.armlinux.org.uk>
MIME-Version: 1.0

On Saturday, February 10, 2024 6:29:00 PM CST Russell King (Oracle) wrote:
> What about #!/bin/sh -e on the first line, which is the more normal way
> to do this for an entire script?

Will do this in V2.

-- 
xtex @ Sat Feb 10 10:32:32 AM UTC 2024

--nextPart2124038.9o76ZdvQCi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRyMYBLBSxnDxWmdx25GAhu2ARbkQUCZcdQ+wAKCRC5GAhu2ARb
kfdKAPoCZsP7u1iukZo1ZGlB4JJK7jPZWKy/eD8aN/lnP9KNjgD/Ve0PtHuJoCdb
qNDGRUIqnxjTCIqNFhKrA1/d7wWfEQA=
=uBWc
-----END PGP SIGNATURE-----

--nextPart2124038.9o76ZdvQCi--





--===============4489851630989700918==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4489851630989700918==--




