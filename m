Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B81F606A32E
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 06:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FNA6k2gy;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=SfTTZ+nW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	References:In-Reply-To:Subject:Cc:To:From:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8BwXCjgsn1guJaNExvm/+qYHeaNuEjKJODaqn+yCy2o=; b=FNA6k2gyxPVan2IHEbuPPCwEqP
	JDSJguI6tl9I2sLYy9NwdtSoem8Y5xpsymwOfSLCZfWmz8tR1zPepcBP844HmjDr7JCnFzmXKY685
	QftTaQA4htISt3m9v2Uu9MBBrbY9uOl/VarGx99pQZ6wPZt+zpgFOsn9OGrxOpKvsnaBm5kYqnTfj
	5yy6r+P2Z5LbAVekqmuQyFpcLyyBbWTZPVqQqgkvpQmvbePCZ2+OVcEDOg0x/h6hBRGhL2u98SWIS
	71hpvNxdTT8zTNkZ1ylSoCAM/8tWXk2BAfshdlNAbTdZmpg9Eehm11uiLivyJ3AJQKDbwxCGS8ydI
	BAvpCNJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfZ4-00000002h89-1YOY;
	Tue, 10 Nov 2026 06:42:42 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfZ0-00000002h5e-1SOt
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 06:42:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794292913;
	bh=KDDnULezz0lYOy8E8UC/jFsEQulCu5gvg3BMNhfnq08=;
	h=Mime-Version:Date:Message-Id:From:To:Subject;
	b=SfTTZ+nWCSvOOeAwOUskOv5JEMPVZjLIQCCbrbwhyiMgneIi7FR77dN84F0fJcrer
	 GzwtqFl11fTwd3QAxdzT2Lva41y+s4P0waKJTuWDjCxRWp7Xxg6m7ruxxR8RJ4FaWg
	 5/ypBkWJ1doLlZ4hurRBAhIgoLxhwo9cjzlhEmJ0=
X-QQ-mid: zesmtpsz1t1794292906t134bec0a
X-QQ-Originating-IP: oveHQlJZS5x70FgvyEUxF/FxqKq+xrb9z38Pxn3Oj8M=
Received: from = ( [183.48.247.17])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 10 Nov 2026 14:41:44 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4058580149435769383
EX-QQ-RecipientCnt: 12
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Tue, 10 Nov 2026 06:41:43 +0000
Message-Id: <DMRBR0ARCU5N.1WRTDA5GN4OG5@linux.spacemit.com>
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Anand Moon" <linux.amoon@gmail.com>
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, "Andi Shyti"
 <andi.shyti@kernel.org>, "Sebastian Reichel" <sre@kernel.org>, "Yixun Lan"
 <dlan@kernel.org>, "Aurelien Jarno" <aurelien@aurel32.net>,
 <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, "Alex Elder" <elder@riscstar.com>
Subject: Re: [PATCH v1 1/2] i2c: spacemit: Avoid sleeping during bus reset
 in atomic context
In-Reply-To: <20261110061429.2036-1-linux.amoon@gmail.com>
References: <20261110061429.2036-1-linux.amoon@gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: M75I2DDAzREFGJVAK34Vsh2hoI4LWS+DRTezaCk976dM47Snl/iyjo46
	CwL4ODDoBRITs4ehM/pdaQ+dvbp+H5KF/+NjV632gkX0jJpqHFG6RVU15O1hddOG7EEA5AH
	b3WiV5FPDbHIxURxuKjWhlULWewILpd26Yt3YMoTYg7yQza0jADBfq2Jk74+/WjyjEUl8du
	+oNwl+hyhikcePPslM8dpEZh7sMk3MsDFOG0qpzorOs+jBGoQN0C80VeAdEMUORmKXrajob
	U/09UOk0ElwPvGvq81Cm+TDHcBYN3Pc6YPqP3IwnQQbIvvPMtsrsM9Xp5QVCmFAxFW+OGpW
	8gxQbk4usL9rtWEF3qjRl85/CTMHoDZ32DlAIHTYFvAmu1wRaATybVO9JAJfQm8u4Rsgj/r
	lPRCniGWohwo+DueAlWCZJXpFlb9Jqe+0a5tYrHJCsAVsB7OrtPbNa9H+/xbp1UsW1w2gCS
	aQ1inlizQ+y6soiI5pCJMEv5GH+1NL+jWpDd33udAiM6MR3LUY20jb4RSCR1zLvAbtCZ10z
	0lltyKvYQ+RzrpYJKwEO7H3h2eB6uZh7A2YzfrL6CkgyIkiNrjCAJ2oYWNIQ+68G/f7rYC2
	D04GEkRHvP0UaDRUSP0wLHMbnb4dToS4Zzp6O7VVvXNI0AydwkQOvt4z4lM+kWE7g9sKAqK
	gJj3nwmC56jiBJtl5M7eY29ZYRFHvt40W+0hn0aR3NowcZcNVzKly/jUYnGsUOFNwvPdXAi
	FudLyrG5jUdOnaWczQce62oJAb99e3vXZ5AV1YanBVnLyPhOcTnvem/A6tV6EtlolO11K8I
	Wwv5spG19PShk2dk/d4L65X/1FYDyBAcROk7SU6dNvYFemPr/PnLbNOPRUHeYr0KpDB55wc
	8B2KXwcJt8CSoZ0cNCxYZYNIcMyB+s2Bur3WF8wFGx6dJ6VanZs+kguVxAkw1naOdg+SFEm
	8AbNHfgQAq4ZDLrUJqaS2LkorQ2EHPh0s1cD9s8bb/wcofxBCe5fefbPRlt1qVla4ceqtLn
	/AQPxGS4E9RCS1xGH6sFMAFfsQ9jvyi+rX257gUgtE3uon6MD5jWHpvsAxdDe2IKcOPmjO2
	Q==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_224239_236619_0A930D6B 
X-CRM114-Status: UNSURE (   7.52  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============6034725548820295417=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6034725548820295417==
Content-Type: multipart/signed;
 boundary=8b303d3f581878ca74b7956765d7a47b0d4702373ae20e17a1f1330f5a6e;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Content-Transfer-Encoding: 8bit

--8b303d3f581878ca74b7956765d7a47b0d4702373ae20e17a1f1330f5a6e
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue, 10 Nov 2026 11:44:26 +0530, Anand Moon wrote:
> The spacemit_i2c_conditionally_reset_bus() function uses usleep_range()
> to wait after triggering a bus reset request. However, this function can
> be invoked during atomic I2C transfers (such as power-off or restart
> handlers running in atomic notifier chains), where sleeping is illegal.
>
> Replace the sleep operation with the driver's internal helper,
> spacemit_i2c_delay(), which conditionally uses udelay() when running in
> an atomic context, avoiding "scheduling while atomic" bugs.
This usleep_range() was left behind when the PIO path and
spacemit_i2c_delay() were added, so please add:
Fixes: 5dd75dac1b35 ("i2c: spacemit: introduce pio for k1")

Otherwise, LGTM.
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

--=20
Troy Mitchell

--8b303d3f581878ca74b7956765d7a47b0d4702373ae20e17a1f1330f5a6e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCavK8pyEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC9IdAD/cSnhy/8EVYiM
iOg2ZBk126QEPmIPly5ZvxvY7dIXMt8A/3F0j9wcXPKP/DGUvY9SzSto1m3OYAr8
vnOgFrFuFiAE
=GBnh
-----END PGP SIGNATURE-----

--8b303d3f581878ca74b7956765d7a47b0d4702373ae20e17a1f1330f5a6e--


--===============6034725548820295417==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6034725548820295417==--

