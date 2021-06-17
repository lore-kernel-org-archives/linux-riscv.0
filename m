Return-Path: <SRS0=17fP=LL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FF21C48BE8
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Jun 2021 01:24:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58F24601FE
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Jun 2021 01:24:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58F24601FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=67w7cICrACpfAX+H4sLiXBerECpUG+Pbwpgk4oqrGIg=; b=K4jWOi/KChasiYceLA+fW8FAkt
	CD4UnkYFuHfFOccO6ghbEcp8GhwCkTtBFwhf6RWn1HEWgw7yfQtjl3el2qxzZHPSZsc2Vtoy596+L
	eKbQbbRy8q5Tq2h38jlEV4FcFocq6fDq0ucSdbhRaud6fPmi9xJPU//SRslVCxfGH1rKFANKGbNRS
	M3HShGC1Ti2XLmpN1Dcyk0rvHeZ7lwlu8nj0jkcCKGJxt7O4lHxZXOXS7QxEERGXqjVDgJe8Zdeps
	JAwrichrGY/MW8uOeDtYypCAqgQNTEctNSjQiykSOfL1SBzG32VJAiXhH8YcILpXz6Stv/tEQKss5
	s02RFdOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltglO-008Oy5-21; Thu, 17 Jun 2021 01:24:10 +0000
Received: from ozlabs.org ([2401:3900:2:1::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltglB-008Owj-Sk; Thu, 17 Jun 2021 01:23:59 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4G547t2Dcmz9sRK;
 Thu, 17 Jun 2021 11:23:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1623893019;
 bh=Lcb2dMbhechCmOAsVMjFJF1Q5m5ZN1yIgPu4v2lWEzQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FFuIqQ0d1IO7+8c2R7C3UaIAbs4XmgHZMW3/k0A6cst4tmWTj9zRbGKt0endBnJfv
 i+gOLWVxcLe5F6nNFxQsnf4C0RpOSfPvPfYqM31AayDVqzt5E+lsZ5mqz9xsfoqJUw
 64tp+I+skZgMSfoaB9sXjrumzoqZ1RCW5gWRnXTD9+uNlsbta/JxUtXin7p0//9y6T
 ZliYQGiLHKP2r5dduauCHB1vQet6wt7Ln2L3PcD/WDuhbXqtivyPnecha9VHZW/wnm
 MtULaIvomxoZSUmYwSsDNBnfB4p6wi9JywyqsN8SvtDFUrD/MNK/27rsIp+PY6kJ8i
 tNGPZO4W/Facw==
Date: Thu, 17 Jun 2021 11:23:37 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, kernel test robot
 <lkp@intel.com>, linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-riscv@lists.infradead.org, kbuild-all@lists.01.org
Subject: Re: +
 mm-rename-pud_page_vaddr-to-pud_pgtable-and-make-it-return-pmd_t.patch
 added to -mm tree
Message-ID: <20210617112337.465c2607@canb.auug.org.au>
In-Reply-To: <20210616160904.cf834ee8c9e7a26008aa833e@linux-foundation.org>
References: <20210615233808.hzjGO1gF2%akpm@linux-foundation.org>
 <202106162159.MurvDMy6-lkp@intel.com>
 <87zgvpnbl7.fsf@linux.ibm.com>
 <20210616160904.cf834ee8c9e7a26008aa833e@linux-foundation.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_182358_187462_0C707E8A 
X-CRM114-Status: GOOD (  11.39  )
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
Content-Type: multipart/mixed; boundary="===============2971817266277973654=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2971817266277973654==
Content-Type: multipart/signed; boundary="Sig_/a/+9AWFMGRAeBWcsE/82QFB";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/a/+9AWFMGRAeBWcsE/82QFB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Wed, 16 Jun 2021 16:09:04 -0700 Andrew Morton <akpm@linux-foundation.org=
> wrote:
>
> On Wed, 16 Jun 2021 19:41:32 +0530 "Aneesh Kumar K.V" <aneesh.kumar@linux=
.ibm.com> wrote:
>=20
> > We may want to fixup pgd_page_vaddr correctly later. pgd_page_vaddr() g=
ets
> > cast to different pointer types based on architecture. But for now this
> > should work? This ensure we keep the pgd_page_vaddr() same as before.  =
=20
>=20
> I'll drop
>=20
> mm-rename-pud_page_vaddr-to-pud_pgtable-and-make-it-return-pmd_t.patch
> mm-rename-p4d_page_vaddr-to-p4d_pgtable-and-make-it-return-pud_t.patch   =
      =20
>=20
> for now.

Dropped form linux-next today (along with my fix from yesterday).

--=20
Cheers,
Stephen Rothwell

--Sig_/a/+9AWFMGRAeBWcsE/82QFB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDKpBkACgkQAVBC80lX
0GzE6Qf9F9328LVgfB4V5Iv/4uPQk5jfyblmoxIn6ZJqV0uqu+dplGIY4vT0wwV5
K1aQ3HB1ESIFEAiSXffgkj3zETi5BkR8O32X08gwXq7yYbHEWZ+pQvJfSFzU6g9g
j6xql8TjMtYUFuvNT5QWrz38nRKB5IGvAA9YDxYsJPX6RKlCjWyIkF9Iooscg5s3
2lTSr2KZ8hUXF++sM1VXUCtksGbcZsdsugOGYpi1VBwvIT+Jc/WUSO3pp5Hrb02y
gDFtYDryQiN/XIdjYCDqLWjhQ7cnjTZJY0q9j5pUjFvQdgrgmT/5n63BxxegqQ65
vUoFVdDhDmKUeJ1s8LTXpvIliUuZWg==
=zFs2
-----END PGP SIGNATURE-----

--Sig_/a/+9AWFMGRAeBWcsE/82QFB--


--===============2971817266277973654==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2971817266277973654==--

