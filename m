Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6AE606A320
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 23:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=l5Gi5Zhp;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E9wdoBeI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1clnFFY7Clmu/yZapmqlGaqm3Hpi+4leyb4bkPE2a9g=; b=l5Gi5Zhp97i/mrBBpIECH92L+m
	ieCZ3awOeFg1gkhkkl6eQwU+A139cURUlbuWC8kGmOHdOTM648SCIOg59DJnItSEgX8OuRRatA1Og
	uuPx7/CeYykU083HqRxzrVyofZiZuna7H3MpYiSrt0PgL6tCZoRMatU7QorMBFR2+cuI/CwNBxovz
	JoFi0eQSnsYMhKxUZSGRtN56MQIDIkSnSSMesNYARDezgaTbhpT7i/ug+D/FWFDFyy1l0LAbbi0Ka
	NJJIv30JycyJXOYL52xdOGIHzrIrfaRV+i9pGN1aNlwq1DWnZVnk51Cits1bth3XuXcfqZTudGlMl
	1nqWLTxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMZWe-0000000AXY2-435p;
	Thu, 29 Oct 2026 23:27:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMZWd-0000000AXXt-1iik
	for linux-riscv@lists.infradead.org;
	Thu, 29 Oct 2026 23:27:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9E8AB412EF;
	Thu, 29 Oct 2026 23:27:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 927621F000C1;
	Thu, 29 Oct 2026 23:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793316434;
	bh=lSRz3HvItzCZqhNF30mlwnIBVEYrLAXRuap3P041BZo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E9wdoBeIMEgNrJ/M87gFdpcU26QwzTU4gRwo7mNkWk8y2pJDcaudPPLCEjm7k4mbY
	 +NUTULgwncND2jF7rMxDbuolnyw6sbTZyHiFY2GliQgfCEp09B+31r/+IGkXXsUN18
	 q9Lk9iMZb5hAHHptS1qG2THSbEVDFb5ZhIdABOjKnbrCongO85yCBkhrTP6pWVxiJR
	 hTygE53NLulPMCw37qbj/qlndT/nkqhNSkKn1b+0W1IWr9GxQxChSDJVpHAJQVNypa
	 fnluTvrm3LHRvIOPNAL8uLC9BRaUeVtIhXCGJ7+3d3m9QHmghlrf3UcnRjO/N36kpj
	 ojSqmGJA474DA==
Date: Thu, 29 Oct 2026 23:27:09 +0000
From: Conor Dooley <conor@kernel.org>
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-efi@vger.kernel.org,
	acpica-devel@lists.linux.dev, anup.patel@oss.qualcomm.com,
	ardb@kernel.org, james.morse@arm.com, lenb@kernel.org,
	palmer@dabbelt.com, paul.walmsley@sifive.com,
	robert.moore@intel.com, sunilvl@oss.qualcomm.com,
	tony.luck@intel.com, zhangzhanpeng.jasper@bytedance.com
Subject: Re: [PATCH v5 5/9] riscv: Add functions to register ghes having SSE
 notification
Message-ID: <20261029-pond-tribune-6e7a7f66b7cb@spud>
References: <20260924073714.1650588-1-himanshu.chauhan@oss.qualcomm.com>
 <20260924073714.1650588-6-himanshu.chauhan@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260924073714.1650588-6-himanshu.chauhan@oss.qualcomm.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============3187829783446127655=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============3187829783446127655==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6NxvPHBpBf4dT3ef"
Content-Disposition: inline

--6NxvPHBpBf4dT3ef
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Acked-by: Conor Dooley <conor.dooley@microchip.com>

--6NxvPHBpBf4dT3ef
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCauPWTQAKCRB4tDGHoIJi
0soNAQD5B+qEK3gQyhSLjuOiXTqGo8e2fRHLKAUlPFmcrq5V4AEA/OoNMbWJ87z6
s82IA6MAgUDpTysT+Qgkk0p+eUjSmg0=
=sYju
-----END PGP SIGNATURE-----

--6NxvPHBpBf4dT3ef--


--===============3187829783446127655==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3187829783446127655==--

