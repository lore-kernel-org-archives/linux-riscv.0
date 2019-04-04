Return-Path: <SRS0=qC9n=SG=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F193C4360F
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2019 14:02:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2F842082E
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2019 14:02:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uBU7rtsJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2F842082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ih+Ti+jmvHTT3J+5U9Bgr4Qe2vu6bM69141Vw2T3/ZI=; b=uBU7rtsJHoQPliU35I9pHBLK7
	9TdeonRUFdMbq15PLa7qdZg2i3vRl0P7RvRWtPbx7qVwqlzSuSX5KALoyE2uCUstF183Lr3rI9O8/
	iZKYKdvIxCXTMoDxPF37M+amIPAElZQ8KIl8b3WnFQOIO4YTeGf6BMEndyvheqjB4lAjmyXRgxUnf
	T5WX/lJyJHSvtnNwOLNhO2OWpvQqjuPlleilJ0EtPDL1i8xbqp4ZS5O9ZVYcUhXKFXipMgq4v9N0l
	FvBrP1/z6pyodC88eA3cIe5JhLB5TtDx+j1pVsm1g3KFyPXpVx19wZ1IJTwy41/XE4anIcUhi0OaF
	e8z9wZnZA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hC2wc-0004lW-V5; Thu, 04 Apr 2019 14:02:18 +0000
Received: from vmicros1.altlinux.org ([194.107.17.57])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hC2wY-0004lE-1E
 for linux-riscv@lists.infradead.org; Thu, 04 Apr 2019 14:02:17 +0000
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
 by vmicros1.altlinux.org (Postfix) with ESMTP id 940DB72CCF7;
 Thu,  4 Apr 2019 17:02:10 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
 id 8B1F07CCE4F; Thu,  4 Apr 2019 17:02:10 +0300 (MSK)
Date: Thu, 4 Apr 2019 17:02:10 +0300
From: "Dmitry V. Levin" <ldv@altlinux.org>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 3/6 v3] riscv: Fix syscall_get_arguments() and
 syscall_set_arguments()
Message-ID: <20190404140210.GC4962@altlinux.org>
References: <20190401134104.676620247@goodmis.org>
 <20190401134420.958530155@goodmis.org>
MIME-Version: 1.0
In-Reply-To: <20190401134420.958530155@goodmis.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190404_070214_262170_FB687853 
X-CRM114-Status: UNSURE (   9.14  )
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
Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Peter Zijlstra <peterz@infradead.org>, Palmer Dabbelt <palmer@sifive.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Oleg Nesterov <oleg@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>,
 linux-riscv@lists.infradead.org, Ingo Molnar <mingo@kernel.org>,
 linux-arch@vger.kernel.org, x86@kernel.org, Ingo Molnar <mingo@redhat.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 Roland McGrath <roland@hack.frob.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Will Drewry <wad@chromium.org>, linux-kernel@vger.kernel.org,
 Andy Lutomirski <luto@amacapital.net>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: multipart/mixed; boundary="===============0404870148569530965=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0404870148569530965==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VywGB/WGlW4DM4P8"
Content-Disposition: inline


--VywGB/WGlW4DM4P8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 01, 2019 at 09:41:07AM -0400, Steven Rostedt wrote:
> From: "Dmitry V. Levin" <ldv@altlinux.org>
>=20
> RISC-V syscall arguments are located in orig_a0,a1..a5 fields
> of struct pt_regs.
>=20
> Due to an off-by-one bug and a bug in pointer arithmetic
> syscall_get_arguments() was reading s3..s7 fields instead of a1..a5.
> Likewise, syscall_set_arguments() was writing s3..s7 fields
> instead of a1..a5.
>=20
> Link: http://lkml.kernel.org/r/20190329171221.GA32456@altlinux.org
>=20
> Fixes: e2c0cdfba7f69 ("RISC-V: User-facing API")
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Andy Lutomirski <luto@amacapital.net>
> Cc: Will Drewry <wad@chromium.org>
> Cc: Palmer Dabbelt <palmer@sifive.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: linux-riscv@lists.infradead.org
> Cc: stable@vger.kernel.org # v4.15+
> Signed-off-by: Dmitry V. Levin <ldv@altlinux.org>
> Signed-off-by: Steven Rostedt (VMware) <rostedt@goodmis.org>

According to
https://lore.kernel.org/lkml/mhng-8e9b547b-7fe3-43d2-9dea-b217de923605@palm=
er-si-x1c4/
the following tag could be added to this patch:
=20
Acked-by: Palmer Dabbelt <palmer@sifive.com>


--=20
ldv

--VywGB/WGlW4DM4P8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJcpg5iAAoJEAVFT+BVnCUIDIAP/3GSr42HPH1rGGfez7Mp3k1o
M+8EC8bLlrRNLd2j5aoPWq+nkh+cWTnfv0b8ti6L7mvbQn5234wD/bDsE7Gu0XXA
msxnRFf810p+74KGQRkPVsBzchSE6lP3y3uvKTsB80UGMPI+B7T17PMxCbFjpFPT
a5wX7cJ2aAimU3h36wwKA5x65oJk18cI4/+hu4bXKRiUkYNMtbHKS+oqAGgDNuax
awzYF8Ii6Kd7PP+dIIf/Uc00FKdv8wLIgOcAXrM65QyrpyQDwfmdvH9r4mf2P/IK
D0FsyQt45fBMwSocQltMJUqB264I7BWT6JnqftwsEZlmREHG0zg8egOb7BvMJJXZ
ijSzX1SXiiv58EKUDqchjA/8T7mgPr0VybnWDPXN/RAbCyIFxtd8jQ6hpB8IoTri
oRazU1t9KuJ+m5TTEixoNmu64NsRL0eyqgAsIeLP4qSHDKGAYBM2ZR/eqTFGtvgK
Dk6XbKWaVkQRPFp9EDO/1W/cSo2XJiKV+viSl3DrbxdfCXpZ5PGz+vU+ICRvm/eF
Hnw2Qe0ZPAQtmjzDD83fRLYiImN6UuULnXzFM5STsQIFwRscGDGVI39F+0tESXI9
1+4lzzn0lZL1t9pMIdHAu+o/eyqu2O5pD3rQVBweGT+3LQ9dhoTTl14U6XSjUHOl
0DoNd/EsPdwSIOTAT/QG
=0m93
-----END PGP SIGNATURE-----

--VywGB/WGlW4DM4P8--


--===============0404870148569530965==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0404870148569530965==--

