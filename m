Return-Path: <SRS0=uc63=OT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AF60C04EB8
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 10 Dec 2018 22:14:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0216920821
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 10 Dec 2018 22:14:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sRLX0eBA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0216920821
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aurel32.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=7Ryv9/BI4S0a/VbMz7bSwYTFbF1E0wWMf/+QdX1qKts=; b=sRL
	X0eBALcrlW6Q5opKk+YLxK5XnND5q9AI5cEX9ZioQnyVyNCnue8MGbAXYd1ixlps42dlTMvqgPA7B
	9LomlyTvgq+cwfOjMA8DlKIfJ8NUWaLVn/WYnce5NsQPsp7gQlT+6BShXb0cuLMnipiq7OOBECqZP
	Q4iGPqaRs5zKikEkcDNf63ZGoJeL8VhzQlgJV6zI9gerDPlwzn+pQoXpyvp0AHifJviWsydVQt0+O
	IR1qtRI6pICr7B8HZ8JHKtWO10urUDvdIYheFjwwpg2OmjE2murBOYpAAnVV7VjQlc0H77WBv6ggH
	L+GsBrFf09i37Dy4NAX/13e8SI/SkNQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gWToa-0005YZ-5P; Mon, 10 Dec 2018 22:14:12 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gWToE-00059D-Gi
 for linux-riscv@lists.infradead.org; Mon, 10 Dec 2018 22:13:53 +0000
Received: from aurel32 by hall.aurel32.net with local (Exim 4.89)
 (envelope-from <aurelien@aurel32.net>) id 1gWTns-0001aO-VS
 for linux-riscv@lists.infradead.org; Mon, 10 Dec 2018 23:13:28 +0100
Date: Mon, 10 Dec 2018 23:13:28 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-riscv@lists.infradead.org
Subject: BUG: FP registers leak across execve
Message-ID: <20181210221328.fdl2eoe5cqxudgfs@aurel32.net>
MIME-Version: 1.0
User-Agent: NeoMutt/20170113 (1.7.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181210_141350_686584_EEF6760F 
X-CRM114-Status: UNSURE (   5.65  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============7342543508321656470=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7342543508321656470==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qegkrnjeax7tw52s"
Content-Disposition: inline


--qegkrnjeax7tw52s
Content-Type: multipart/mixed; boundary="tnebxbvatayan7w3"
Content-Disposition: inline


--tnebxbvatayan7w3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Debugging some glibc testsuite math failures, I have found out that most
of the time, the FP status register and the FP registers are not zeroed
as they should. This can be tested with the attached code. The best way
to reproduce it is to execute from Python (i guess Perl or another
interpreted language that support FP computation should work). When=20
running an FP computation before calling the program, the result of the
computation can be seen in f10.

The zeroing of the FP status happens in kernel/process.c in the
flush_thread function. It seems that the kernel restore that state only
if a context switch happens between flush_thread and the first FP
instruction of the executed program.

A possible workaround is to restore of the FP registers in flush_thread,
but that's probably not the best way to do that:


--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -93,6 +93,7 @@ void flush_thread(void)
         *      fflags: accrued exceptions cleared
         */
        memset(&current->thread.fstate, 0, sizeof(current->thread.fstate));
+       fstate_restore(current, task_pt_regs(current));
 #endif
 }


Aurelien

--=20
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                 http://www.aurel32.net

--tnebxbvatayan7w3
Content-Type: text/x-csrc; charset=us-ascii
Content-Disposition: attachment; filename="dump-fpu-state.c"

#include <stdio.h>
#include <stdint.h>

int
main ()
{
  uint32_t cw;
  uint64_t f[32];

  __asm__ volatile ("frsr %0":"=r" (cw));

  printf ("cw = %08x\n", cw);

  __asm__ volatile ("fsd  f0,   0(%0)\n\t"
		    "fsd  f1,   8(%0)\n\t"
		    "fsd  f2,  16(%0)\n\t"
		    "fsd  f3,  24(%0)\n\t"
		    "fsd  f4,  32(%0)\n\t"
		    "fsd  f5,  40(%0)\n\t"
		    "fsd  f6,  48(%0)\n\t"
		    "fsd  f7,  56(%0)\n\t"
		    "fsd  f8,  64(%0)\n\t"
		    "fsd  f9,  72(%0)\n\t"
		    "fsd f10,  80(%0)\n\t"
		    "fsd f11,  88(%0)\n\t"
		    "fsd f12,  96(%0)\n\t"
		    "fsd f13, 104(%0)\n\t"
		    "fsd f14, 112(%0)\n\t"
		    "fsd f15, 120(%0)\n\t"
		    "fsd f16, 128(%0)\n\t"
		    "fsd f17, 136(%0)\n\t"
		    "fsd f18, 144(%0)\n\t"
		    "fsd f19, 152(%0)\n\t"
		    "fsd f20, 160(%0)\n\t"
		    "fsd f21, 168(%0)\n\t"
		    "fsd f22, 176(%0)\n\t"
		    "fsd f23, 184(%0)\n\t"
		    "fsd f24, 192(%0)\n\t"
		    "fsd f25, 200(%0)\n\t"
		    "fsd f26, 208(%0)\n\t"
		    "fsd f27, 216(%0)\n\t"
		    "fsd f28, 224(%0)\n\t"
		    "fsd f29, 232(%0)\n\t"
		    "fsd f30, 240(%0)\n\t"
		    "fsd f31, 248(%0)\n\t"
		    :
		    :"r" (f)
		    :"memory");

  for (int i = 0; i < 31; i++)
    {
      printf ("f%02i = %016lx\n", i, f[i]);
    }
}

--tnebxbvatayan7w3--

--qegkrnjeax7tw52s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEUryGlb40+QrX1Ay4E4jA+JnoM2sFAlwO5QgACgkQE4jA+Jno
M2tJaQ//Snf88zZmYcPwgCrAU6TlreiYL6IfzLNoQDPpC25VMftQXDtcSsayUTtU
DQx5eeZhhMYSFNXgMhkSuWoswdV6pa0yNGLEuAVFZ4y1+mQcfh5vJ9jI6F80lhaJ
uQ5u9c66ExuOo37XQfZA2artFNe0ub9nhvBaAD20v9Iq/1o271GuV5/NlWwJGk/b
nIvb8ssWyIZj+B+1TVGmfFqNFaZvhbrF5vN38nTO4syPgSm7xaPLJhaywFjzfOxj
b7ammgMvFixJk7MbMU56oU593qEWh9t40NdK+FLoEqcBQUDU7fRT2qkqE0rv/voZ
70cLvtoMXZe5Q3KRYb7OZG1QkDuFH/1eR7+ZfoLy4+KCUa20y56VWkuSPglCiTDP
PKTUEI03kZAlKqy7PkL5bEMhzlJo3GoXc+ddWyQiGA1hHhx7GlAoKDTOPMtsVmyV
p2NfvhSDuQeo6fokk28qrEL5Eank1FqxuSr1xJrhrE5ddkw01gVfSKJ2sY47vD/T
5btE7niIxydnJ9FiZO1m265VVcf1r571w2nivkEfW1rGp8wcHLhnm190mB0PsK8n
PP03Jq0gwEbsI7WnVRXvXZ33SJJ9/8MDIiNqQR7REcDDqUmkeK6qsx9X/GYyymcL
LJ983vZfS9tK5D9cDBOiShUVxUan3CL5rFdbsjPYhC5GHGAyPGw=
=AU7x
-----END PGP SIGNATURE-----

--qegkrnjeax7tw52s--


--===============7342543508321656470==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7342543508321656470==--

