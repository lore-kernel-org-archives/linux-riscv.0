Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80C8DC001B0
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 14:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z/DhacS04AOdTOz2XyNBvGlH2o8Gm/ibEnDy4sVp4bU=; b=V9q9fT5X8ZnMFa7I193yjcefy1
	xP5a0H+c5P+2yosc6EhKspZ1/E8fQVLZgvjE//ga9jjD0VToOH8WS/kKS8T+bPAiDh0DmUrxIElPP
	dtHABBns9xJdo1ha38ur1S1pTJLio7b3shzpZ1WqWuwznhy2A2P8Z7YkZv25Es/Xpck8WBj7lloH7
	8phoM6oGivIhFdcSTPSunZqKMtsH8omAO66j+/PEoI0GSndZ4xUOKxtXQE0/ew1M3moJ5fCftGiCX
	T0MWMZN375kwQ93eVVURc+WFcU3KtZVr45rVUut2U1sFllCm7h7dKUjvaHq6YFT0t7gKUvZaopEDN
	m/AMFqOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTkTW-005Dl4-0A;
	Wed, 09 Aug 2023 14:47:50 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTkTS-005Dhc-20
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 14:47:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=I1GSnytRmZTqzC/nyChO2skID9DKQcFQyTz+BhnPZ5c=; b=mdK2OMQERm6meEpDQaTeUHUaTK
	LlBEk0VZuNy0Do19is0LMYE/zJwM1jI+CaydT3zRgxmifJVJlhbsEkbDrXGKOGMLfHHs5pQsa/kxy
	viEUii6Glb1TfAPoKPmHVApgDgj/oyQr2eJQc9emmNWe4HluLczPjajM9yTZLh62q9RxSvJC+Ui9v
	4KAnSLfOuHfA8lllP2rttS7urqGd2vlZjAoXHT02fvT6nIC3h2HZ05QYTkxq30FSGe3tMdHlgd+Dc
	z9qJUZt9dzv0MvYxAVhXctx82S0TB+W2qn3jB1/sCfA/rWe1uV1McP1aWt5PHfNS03oODce+s0no+
	1Fgaxm2g==;
Received: from ohm.aurel32.net ([2001:bc8:30d7:111::2] helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1qTkTJ-005OHj-FK; Wed, 09 Aug 2023 16:47:37 +0200
Received: from aurel32 by ohm.rr44.fr with local (Exim 4.96)
	(envelope-from <aurelien@aurel32.net>)
	id 1qTkTJ-00Ghcb-0F;
	Wed, 09 Aug 2023 16:47:37 +0200
Date: Wed, 9 Aug 2023 16:47:37 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-riscv@lists.infradead.org
Cc: Bo YU <tsu.yubo@gmail.com>, Andreas Gruenbacher <agruenba@redhat.com>
Subject: Re: potential riscv special bug maybe found
Message-ID: <ZNOnCakhwIeue3yr@aurel32.net>
References: <20230309151841.bomov6hq3ybyp42a@debian>
MIME-Version: 1.0
In-Reply-To: <20230309151841.bomov6hq3ybyp42a@debian>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_074747_111550_CCA97D5C 
X-CRM114-Status: GOOD (  22.44  )
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
Content-Type: multipart/mixed; boundary="===============4945712393406116992=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4945712393406116992==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="C6cEdScaYv1A1R0K"
Content-Disposition: inline


--C6cEdScaYv1A1R0K
Content-Type: multipart/mixed; boundary="5O7GWs0cfi58320W"
Content-Disposition: inline


--5O7GWs0cfi58320W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On 2023-03-09 23:18, Bo YU wrote:
> Hi,
>=20
> I am sorry if this is noise.
>=20
> Some days ago I noticed strace 6.2 was built failed on riscv64 due to
> test cases[0]. There is one program from strace can reproduce it:
>=20
> ```
> ./tests/read-write ```
>=20
> It will be hang.
>=20
> In fact, the issue has existed since 5.18. I `git bisect` and finally
> found out the issue was introduced by the commit[1]:
>=20
> commit 631f871f071746789e9242e514ab0f49067fa97a
> Author: Andreas Gruenbacher <agruenba@redhat.com>
> Date:   Tue Nov 9 12:56:06 2021 +0100
>=20
>     fs/iomap: Fix buffered write page prefaulting
>=20
> I do not think there is a problem with this commit, because it does not
> affect others arch expect riscv and after I reverted it, it will pass
> all test cases from strace(There is still one case failed on qemu, but
> this is another store).
>=20
> I try to debug something but failed.
> Would be appreciated it any help.

Please find attached a simpler reproducer extracted from strace, which
should make the issue easier to reproduce. It hangs on riscv64 and needs
to be killed with -9, while it works fine on amd64.

Regards
Aurelien

--=20
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

--5O7GWs0cfi58320W
Content-Type: text/x-csrc; charset=us-ascii
Content-Disposition: attachment; filename="read-write.c"

/*
 * Check decoding and dumping of read and write syscalls.
 *
 * Copyright (c) 2016 Dmitry V. Levin <ldv@strace.io>
 * Copyright (c) 2016-2021 The strace developers.
 * All rights reserved.
 *
 * SPDX-License-Identifier: GPL-2.0-or-later
 */

#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/mman.h>

# define LENGTH_OF(arg) ((unsigned int) sizeof(arg) - 1)
# define ARRAY_SIZE(a_)        (sizeof(a_) / sizeof((a_)[0]))

static void *
tail_alloc(const size_t size)
{
	const size_t page_size = sysconf(_SC_PAGESIZE);
	const size_t len = (size + page_size - 1) & -page_size;
	const size_t alloc_size = len + 6 * page_size;

	void *p = mmap(NULL, alloc_size, PROT_READ | PROT_WRITE,
		       MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
	if (MAP_FAILED == p) {
		perror("mmap");
		exit(1);
	}

	void *start_work = p + 3 * page_size;
	void *tail_guard = start_work + len;

	if (munmap(p, page_size) ||
	    munmap(p + 2 * page_size, page_size) ||
	    munmap(tail_guard, page_size) ||
	    munmap(tail_guard + 2 * page_size, page_size)) {
		perror("munmap");
		exit(1);
	}

	memset(start_work, 0xff, len);
	return tail_guard - size;
}

static void
fill_memory_ex(void *ptr, size_t size, unsigned char start,
	       unsigned int period)
{
	unsigned char *p = ptr;

	for (typeof(size) i = 0; i < size; ++i) {
		p[i] = start + i % period;
	}
}

int
main(void)
{
	static const char tmp[] = "read-write-tmpfile";
	long rc;
	long fdr;
	long fdw;

	unlink(tmp);

	fdr = open(tmp, O_CREAT|O_EXCL|O_RDONLY, 0600);
	if (fdr < 0) {
		perror("create");
		exit(1);
	}

	fdw = open(tmp, O_TRUNC|O_WRONLY);
	if (fdw < 0) {
		perror("open");
		exit(1);
	}

	static const char w_c[] = "0123456789abcde";
	const unsigned int w_len = LENGTH_OF(w_c);

	rc = write(fdw, w_c, w_len);
	if (rc != (int) w_len) {
		perror("write");
		exit(1);
	}

	static const size_t six_wide_size = 1 << 20;
	static const size_t fetch_size = 1 << 16;
	const size_t buf_size = six_wide_size + fetch_size;
	const size_t sizes[] = {
		buf_size,
		buf_size + 1,
	};
	char *big_buf = tail_alloc(buf_size);

	fill_memory_ex(big_buf, buf_size, 0, 0x100);

	for (size_t i = 0; i < ARRAY_SIZE(sizes); i++) {
		write(fdw, big_buf, sizes[i]);
	}

	close(fdw);

	return 0;
}

--5O7GWs0cfi58320W--

--C6cEdScaYv1A1R0K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAEBCgAdFiEEUryGlb40+QrX1Ay4E4jA+JnoM2sFAmTTpwYACgkQE4jA+Jno
M2vnvQ/4zU6N7veHS9xECuWI0TTlvqY0EiFVhDx41nf2+aMTlhPp8nJJScEBScli
sEor2PgfhsNFWQqiWegCP92pPhVzQda7UqYeT/RVj9tI/c+eVzgAiRpY/Ak1xkLJ
6CxgyQKpiVI82EIRaQtWanaOPV3JRWV3HfEl/ftNhv4tse8FRCA6dJi1aZc4zV6/
6cqDKmY058E0LFJsqwoETGN1FZVbRrbtyDKuRkPiKn1vXo/sS6G3WqC09YZCp2zz
pks8yaOohlT9Z8dmPa0mws/1JVNBg/PwlFWrsWS0jEg6jUB9TxXrBYB8dFKzPF8H
5u9kKObQdY00D5eRG4Lb6sYLGFBHqqAODITNd9TLP9oyoqb/qAiftliINY7RTSPJ
dPr2lMmb1EmRZ0KO/S5wv/oLE5wECKlI3+8q+dwzmjvxfz/8BxvO9URNLL6wVsdu
ZRb6/8X2JGRkeyrMpnY84BwvfvwtYXFskJfq0KYwCCSmVKAjI7SRwAEiYpxrus23
V3rWFm26uOiHHd7ccI9LfFfSKbkD5AtZ13Lp9rVr+OdOv1KfnwEBAYhKyJosQ33G
gZBUMHLFi6KJdpeW+SE1Cy44Nsu+dhtZAL4mDrAxlVQB3WuGfIlQA+afkcZ0MbIE
frp4Cs9R/rbN7Z64etVXCXV1NHnpU9howCGVaOuAuTgBIiZfhQ==
=to3p
-----END PGP SIGNATURE-----

--C6cEdScaYv1A1R0K--


--===============4945712393406116992==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4945712393406116992==--

