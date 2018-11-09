Return-Path: <SRS0=6doD=NU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3992C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  9 Nov 2018 22:28:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FDC220827
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  9 Nov 2018 22:28:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g3NtJDmk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="t42oK6fB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FDC220827
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Y6LoX4DGxVcrqiPPo6QiROM6luoTPrWlLQSFAsS22lo=; b=g3NtJDmkJQFxZb8agmuqE9GqK
	AG7WN+ziioXrcwI0ubwDSzBQLxO8KWdDS6Rpjs6FgJH3XZH/YEE5+9T/Kt/o7QP+/LgCWxIBC9sIJ
	O5bN7KFm6cQSky/izVPTzhLbDwuUymt/uYoo3SnqQ+h37I9XrPwplYC6Urn0OTdx6zVtP/bAeNNQW
	9/cwEFY3T2aHNmtQQbVEBnANQJM8iYlSyEverq5B3jJ6edrW93oEge93xvF+IDvW0YUzXyNyAmuGw
	WBFfQeWwrHb/t1DjvL45N9JqlmuFid05ms5oXJcRudQqJz+D7A/tLKtIdXklfXdzRP+kaL+jzuBRu
	H1ORvYLDA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gLFGp-00045l-Ep; Fri, 09 Nov 2018 22:28:55 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLFGo-00045e-85
 for linux-riscv@bombadil.infradead.org; Fri, 09 Nov 2018 22:28:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ExMApZdNxDV8gHxD9PHF3HhDQlV8iTZvjCWVTkD2ad0=; b=t42oK6fBf/N55YmjaGisi2yFZ
 E+1QL7GZAGLIzLPlWzZLt+Ac2vCTsY7iIOGLYpCI1QjeWTqt9O2RGlCG8N3k9ZjEJ2czhR4mCFG3i
 HjQXdBa4K2I+8cbB4wWdBEJCaEPVLXkrYrITv416QsUdAH6VIRQDkkWyys15Ei2T81rzvh0m2tazP
 zI/1/F6lwQXVxhV28b+VMiHfZBf9MCn7JVY1U7gGnhs4/NWDbHrTXKIXuw26v984047ThnIzNR+Rw
 0XvD1C6t02LIY6hFra19sj6uS1IdFLcQeuyWNDVJlrUzOXmtuK8Ac8u67jloMr3pzmaCY/v0ttuXa
 mEbIcBgAg==;
Received: from vmicros1.altlinux.org ([194.107.17.57])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLFGk-0008D2-Vg
 for linux-riscv@lists.infradead.org; Fri, 09 Nov 2018 22:28:52 +0000
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
 by vmicros1.altlinux.org (Postfix) with ESMTP id 9A35172CBF9;
 Sat, 10 Nov 2018 01:28:39 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
 id 8E7D77CD1FF; Sat, 10 Nov 2018 01:28:39 +0300 (MSK)
Date: Sat, 10 Nov 2018 01:28:39 +0300
From: "Dmitry V. Levin" <ldv@altlinux.org>
To: David Abdurachmanov <david.abdurachmanov@gmail.com>
Subject: Re: [PATCH 12/13] riscv: define syscall_get_arch()
Message-ID: <20181109222839.GB2054@altlinux.org>
Mail-Followup-To: David Abdurachmanov <david.abdurachmanov@gmail.com>,
 Andy Lutomirski <luto@kernel.org>,
 Palmer Dabbelt <palmer@sifive.com>, aou@eecs.berkeley.edu,
 Paul Moore <paul@paul-moore.com>, eparis@redhat.com,
 Elvira Khabirova <lineprinter@altlinux.org>,
 linux-riscv@lists.infradead.org, linux-audit@redhat.com,
 linux-kernel@vger.kernel.org
References: <20181109031303.GA20906@altlinux.org>
 <20181109031712.GL21511@altlinux.org>
 <CAEn-LTpbzdpeWv8wqo_ptBw2t3Ypzzp0JcB+TGMG4NZbEGBnkw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEn-LTpbzdpeWv8wqo_ptBw2t3Ypzzp0JcB+TGMG4NZbEGBnkw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181109_172851_254232_DD58AEF1 
X-CRM114-Status: GOOD (  11.59  )
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
Cc: aou@eecs.berkeley.edu, Paul Moore <paul@paul-moore.com>,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 eparis@redhat.com, Elvira Khabirova <lineprinter@altlinux.org>,
 Andy Lutomirski <luto@kernel.org>, linux-audit@redhat.com,
 linux-riscv@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1710914698300877911=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181109222839.mcB1SgVLKRGXcn_tWSmcigBEjcDsrNOjToUmUcQWat4@z>


--===============1710914698300877911==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XF85m9dhOBO43t/C"
Content-Disposition: inline


--XF85m9dhOBO43t/C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 09, 2018 at 07:59:13AM +0100, David Abdurachmanov wrote:
> On Fri, Nov 9, 2018 at 4:17 AM Dmitry V. Levin <ldv@altlinux.org> wrote:
> >
> > syscall_get_arch() is required to be implemented on all architectures
> > that use tracehook_report_syscall_entry() in order to extend
> > the generic ptrace API with PTRACE_GET_SYSCALL_INFO request.
>=20
> I have posted audit support patch for RISC-V in October. Pending review.
> It defines both AUDIT_ARCH_RISCV32 and AUDIT_ARCH_RISCV64.
>=20
> See thread: http://lists.infradead.org/pipermail/linux-riscv/2018-October=
/001933.html

I'll take your version of RISC-V related change of include/uapi/linux/audit=
=2Eh
to this series, thanks!

P.S. It would be great if you replied to me as well.


--=20
ldv

--XF85m9dhOBO43t/C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJb5goXAAoJEAVFT+BVnCUIjBAP/RryYu/a/aHNZcoZXIOFxfXE
02HB/UcnCDdFjXcibkWZz79BRfjsi5GwRYqsFqA+xnGT2/yXP0lw8Onl39rUHQg1
dX9qIy0u9hFwf43eQqTRHoX4v1+k/l5c97Zoejzj/3sMYW2RVzp7zNdYaYLlwkVl
w0tO1ant3BmWvU5zGAASeOlBr0js28afy/5tHYQs6pJ7x6SjeVYSEDvLIhh50R2s
OMNivE9N0NQpDJqRmptrpcsWUnS/EcCGii/SWIjILjO7mHA+krjhURnN0T8zBEKJ
LMg50l7N8v+l3RXL3jZd5qX9pF+g9C5RApFAJqeFqUd0TGypKQEuvw7CnJH2qNpv
3sgdlKlueiB8YdyFXYq2iMq+dSS9xSW+Jo5jsxYARToBFO2fI4CZUoEWux6NIpZ5
9N+hli3P8Q1K0Fl2skEikclyeIE61+2f9n3n73qWLOyp0H4qn6ZjNeDGP0Vsp1c5
KT2p07b1UV+XvY04qPMXyuft/FUeGYRiVLqu2okTxjaIx7QLqAp0HDbugUHGGNRx
8ClhF55ByoNDPvbX8WvmXhHtCK8BhMABxL+iRQl26nzQbKdsuFq8ulAr3Kb+NWsu
etwtV96eA+snnob1tLTq/fwj5wq1PQAbrJdnFsb/6TxcspM5ia8VmjuVuFeW/Ofj
S3kY9ZU0UqCUkTNXF6oQ
=GUwG
-----END PGP SIGNATURE-----

--XF85m9dhOBO43t/C--


--===============1710914698300877911==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1710914698300877911==--

