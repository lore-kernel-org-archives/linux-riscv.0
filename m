Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7495FC64EC7
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Feb 2023 22:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IRNuilgYMxhibkntic2tNeB93mmgJR/hKYG8uiabrS0=; b=hLEBIxvpbwIX5rI4Sho4p0T5bJ
	wBnR+zK5Eee2Z2QB6hQjTH1lA3f4MaSpyQXCKmPTGkeF+GpJTyB6CzYWCONj+Mj8T6p5+jd7EBds1
	wUTlcI+A9y3t30Ek3EHJ3NC2WTJrINDlaTHBgHkVhQ8MRcwOtIEqiE/68EEBNgx56KRLVvEeEMA2X
	LTs5suwu3rmk3G9PEnEKLAuATHXXY8j9FHnKYX0RfND3n8nB0V3AlBp65Pl/KbBTi15xg2OdDIJ7R
	acAMmZRr8R1C7pU4jIOjhHU5m0RL1ZwZiu2vbTJh87qlPxzkr5Lwwmw0wwoIFn8iVV4hqaGqC3tss
	aaQ+NOiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX8IC-00ETIv-04; Tue, 28 Feb 2023 22:17:52 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX8I9-00ETIG-1Y; Tue, 28 Feb 2023 22:17:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 43C94B80ED2;
	Tue, 28 Feb 2023 22:17:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA23BC433EF;
	Tue, 28 Feb 2023 22:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677622666;
	bh=4cq2UPWzy/APUWnFh02yE84YUWWFXLX5iWYAk2r0d4I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pu3IxHfCMemeEKd5FjtVa2I8T+cf04nsN9MbQyzKfs4PoSWuKEBBOFikJO8YQcpMN
	 dzV57FcQxFDSqpi0S9o+spoTHCkmgC9fGxY8q2lSmyx3pY/1RSjIhmnHctL02+PpjW
	 dn7Y3zpKHX77cLxyEZ2kxJdnWuaUckT3g9b33znhXDdOmAJE3GtaHQdMQjMqu8+jlq
	 4KW/7IHIQDxYXuz5VE9cfRy9hJlTxZvjzrD4DFa852ocIZSAwhDXOoSPtrXwsXNJu/
	 VGOgVK05ksYlhRcrCfpu4WkII1duxBuic4gUn/TGxyQ52bng4Y44PV95uhNt8PpoN7
	 a997KIM3OuXFQ==
Date: Tue, 28 Feb 2023 22:17:40 +0000
From: Conor Dooley <conor@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	anup@brainfault.org, atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	vineetg@rivosinc.com, greentime.hu@sifive.com,
	guoren@linux.alibaba.com, Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Vincent Chen <vincent.chen@sifive.com>, Guo Ren <guoren@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Alexandre Ghiti <alexandre.ghiti@canonical.com>
Subject: Re: [PATCH -next v14 04/19] riscv: Clear vector regfile on bootup
Message-ID: <Y/59hMj+0D0QBrG+@spud>
References: <20230224170118.16766-1-andy.chiu@sifive.com>
 <20230224170118.16766-5-andy.chiu@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230224170118.16766-5-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_141749_237383_E9D58EB1 
X-CRM114-Status: GOOD (  10.01  )
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
Content-Type: multipart/mixed; boundary="===============5761407390267020470=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5761407390267020470==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Jd/LQnQT6zacPVri"
Content-Disposition: inline


--Jd/LQnQT6zacPVri
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 24, 2023 at 05:01:03PM +0000, Andy Chiu wrote:
> From: Greentime Hu <greentime.hu@sifive.com>
>=20
> clear vector registers on boot if kernel supports V.
>=20
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
> [vineetg: broke this out to a seperate patch]
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--Jd/LQnQT6zacPVri
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/59hAAKCRB4tDGHoIJi
0r2gAP9CPBOPRqz9ixv3kCCVBOI8vjmI+h1F+wd1K4Xde9fH5QEA1k+rhZY+2Vcd
gyVr8xijUqqPmEgxpLKCUI9H9dd2fwU=
=qN2n
-----END PGP SIGNATURE-----

--Jd/LQnQT6zacPVri--


--===============5761407390267020470==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5761407390267020470==--

