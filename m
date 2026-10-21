Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CA7606A31E
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 01:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=velGAtvk;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=bLC0fOxy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:From:Subject:Cc:To:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hkvpzepYikS09vXZ/9DeH5OHa7r1njx+biKn/oJmlQw=; b=velGAtvkukogi+gcDQBUVJS7PR
	bd192i2BG28V7abqrucYD84H2rlXKCluxcYzff/zpanuIKovoineQtDVwc1jqxpTtfoEM3RtOzgcj
	ZMC5RDC1pk+zJin5U0KGu6bIxPTdeYyHwUbnr9ARvw1mMQct1cVgC+vjGbP3tV4SzKYnhKj2IvJAS
	tnd15FdP4HgLZ/SNHfab120dF9i0mDnHulgNTWk+zoU/wkqdowQoTWuH7pYocSB3SAnH3P1eD62Fx
	EqZkYlnOvAq+YSMkgAh6K0ZiLg5EDOhW1PNNP+tL8BBbE4XCEKEUd8QHJ6cuFvxzfoSZyPHYdLB+Z
	hMyaYdMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJLO7-0000000AuJs-3FUl;
	Wed, 21 Oct 2026 01:45:07 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJLO3-0000000AuIr-1E68
	for linux-riscv@lists.infradead.org;
	Wed, 21 Oct 2026 01:45:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1792547065;
	bh=Db6MSaWC1nph+iBpAayOp34joceEe7XbWXKE1ts0440=;
	h=Mime-Version:Date:Message-Id:To:Subject:From;
	b=bLC0fOxyaX4MKdSENu7e9+j03/YTx3BooYzV1evUyuPG2Hzikk9N/ehFJYq4T+Fyu
	 3rplGtmnIALJ/0ZXTlPYtAuvtqaF5unngnsLZsrYJJ+bEra3YNHv2CSp/lZlBl32YX
	 RzbNb+wnbn7eIQJnRLVKBrwYavlGCckMkCiA5JTk=
X-QQ-mid: esmtpsz19t1792547059t267944fd
X-QQ-Originating-IP: wkbnyrRUZdB1FtN4w3MkwVwE+Bk+3i/yyO+zNhr61Xo=
Received: from = ( [58.254.68.16])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 21 Oct 2026 09:44:18 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17375456752936230907
EX-QQ-RecipientCnt: 9
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Wed, 21 Oct 2026 09:44:15 +0800
Message-Id: <DMA4WD1NGNRQ.1RNCFNAJJEZCB@linux.spacemit.com>
To: "Hung-Chun Tseng" <alan.tseng.cs@gmail.com>, "Philipp Zabel"
 <p.zabel@pengutronix.de>, "Guodong Xu" <docular.xu@gmail.com>, "Yixun Lan"
 <dlan@kernel.org>
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, "Alex Elder"
 <elder@riscstar.com>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] reset: spacemit: Fix the RCPU2 PWM reset registers
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20261017140805.3278709-1-alan.tseng.cs@gmail.com>
In-Reply-To: <20261017140805.3278709-1-alan.tseng.cs@gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MgQY1K25Ph0mNDr4xcVxjLikQJuk4JQTwcOknv0vsVAIeviAuFkWrD+H
	NXgq0XsbcTTGQ/eg4aJ88KsNcPwQ6SjhNRV16TUac05BDf2BhtEc0eLI4l93rxHhTL3NzEW
	avKlTx57PX1pNy++LVh5A7GFphSINJBCB22kQTduAPN03VGSWfskk+paIka3kon2M+xeZTA
	MF1vnhI6d2sM33P2qr3nvJpMiYh98OSIbaZirMtv15Bh8MvUfbzcBxUtsiIO8vWnY16zRh4
	oV6eflV24iJ/5BDuiW4HpWgvv1jRZDa9wklzHDLN101342rJAKH3SvQD5rvmMAa14qOJU5u
	gTWrBv6jnJsm7Ie793yuXJdifK9S6U2clAnO+ONDyGMeH4cI6lSuv1OJz/BoUj3vSEslE9j
	znmCKlfJZxK2pg6Mgfp+cctW62jKZcdCuW2c7e6PFRCjiXZT6JvoEwVzSgt3BW8IlKYMeXW
	IyQlFU5yYn7lXZ0QpoTdak4M3RaTX5xyqBwsO9ZMin/sk7w8kxLO5PNMoNEGHpxSZa8O7l6
	U8Fd+n7y2Q18bfDHp51XUD/HqFViJ6gnI32YL/Cy3j2SH9cIAtwcAOOXW2vc9AYTgBUxQvH
	yCDmtlU8KQRpyhD5uSTAi0s1B/cdTujDYryKzhZ9slZOoqTiCrpWXbtSXDbNOJT0SRhLFmK
	7NkF5cvZuher7IRRyoPcWDTeu4ls4eyYHbdyiU6hgvTNKjqclUxW57Dzy4IgazNYDK/HO9X
	+jSq21qjgvhOMVqiO+6yHyWs2dk73imEf3XTDl292QxdH+DGc9OCeC1KTH4g2cNVn62WWya
	r63yna/3tDaiNdthsLZnHror2nCs5QwapOoxtbHBi3PMCq7ziUSTL5UH1W+hY4FZOxA8EeZ
	5i8oqggQwAw3weWqZzpkI5s85RZ1M1kPmy6akQcZPb20s5IvFfY/Nhb/xQEACBL95eASHvH
	IgIEwqAugMIf4jf+fMTQ+nldIxYRizqvfNAd+10ymVdrzZgIKARpLamBkqwuJQOBSNuFD9k
	vGWirlEV2HSzSYtvIvqo4KF5sRv3PRO3t8GU9TW02B/ILfgqUjHTLNfxYibjabDMpu6Ovdv
	UxYSngSZpHy
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_184504_510093_1505FBFC 
X-CRM114-Status: GOOD (  12.48  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============5395982516349605960=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============5395982516349605960==
Content-Type: multipart/signed;
 boundary=387db457841ae1fd42730632a579d6a003c01250388a01279b4ff735ccb5;
 micalg=pgp-sha512; protocol="application/pgp-signature"

--387db457841ae1fd42730632a579d6a003c01250388a01279b4ff735ccb5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Sat Oct 17, 2026 at 10:08 PM +08, Hung-Chun Tseng wrote:
> Every entry in k1_rcpu2_resets[] uses RCPU2_PWM9_CLK_RST, so asserting
> or deasserting the reset of any RCPU2 PWM from 0 to 8 acts on PWM9
> instead. Each PWM has its own register, RCPU2_PWMn_CLK_RST at offset
> 4 * n, as k1-syscon.h already defines.
>
> On a Milk-V Jupiter running the vendor kernel, which uses RCPU2 PWM2
> for the fan, the RCPU2 registers read:
>
>   0x00: 0x4  0x04: 0x4  0x08: 0x1  0x0c: 0x4  ...  0x24: 0x4
>
> Only PWM2's register has its reset deasserted, which matches one
> register per PWM.
>
> Use the matching register for each reset. No in-tree device tree uses
> the RCPU2 PWMs yet, so this has no effect on current boards, but it
> would break the first one that does.
>
> Build-tested only (riscv defconfig, W=3D1); the fix could not be tested
> at runtime, as mainline has no RCPU2 PWM node to exercise it.
>
> Fixes: c479d7cf06c3 ("reset: spacemit: add support for SpacemiT CCU reset=
s")
> Assisted-by: claude-opus-5-5
> Signed-off-by: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

--=20
Troy Mitchell


--387db457841ae1fd42730632a579d6a003c01250388a01279b4ff735ccb5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCatgY7wAKCRCYCe+A+TM0
L1PbAP4pf6L7pzMnGbBsuKt7Kk9qD8b3b1bwtWQ0vmzVlbKVCAEAhGu+FJgNIwDK
GXteQYRh4Sb+q6X0GtcsqP9JAvvtVgw=
=aoHn
-----END PGP SIGNATURE-----

--387db457841ae1fd42730632a579d6a003c01250388a01279b4ff735ccb5--


--===============5395982516349605960==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5395982516349605960==--

