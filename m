Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C94C001B0
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 17:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dyG4D95ZpLMhtCeV1U70bOtbHUKlVgahShjQX6NICQw=; b=GpO7Ltj5TaAZDww/PmbOIWcJhk
	qwh+Q4N9USX89Dcasv8pTtAEa3eBp91CzkQCfWn3P0bXqnMYRAmFuWDS7gbEOqkUqwzmCh3kWeJsR
	JM0SzXPioqcfc+lOBQjB3JVVgnB68DgcmifBVKlrsqe9zDpCEhj01NBNXRrtxjAHxu/HDt6xY65DK
	XLlbv3VUzQw2hVxwxWhXRXJbFmbAB/PZjQjjUk6nQcEoNOMpUC91BKVC+iZGrgDcPAp2ZloZjikEm
	M0pWbI2apTm+zogcLnna9ov/82Zhr76wl2ASxKQ1oPNyTvmPIAMM4gwQyMWE3TDL27eL9PALNbwzg
	a/wd6zdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUWGM-00BHDJ-2G;
	Fri, 11 Aug 2023 17:49:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUWGJ-00BHCQ-0v
	for linux-riscv@lists.infradead.org;
	Fri, 11 Aug 2023 17:49:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 94A8F6784A;
	Fri, 11 Aug 2023 17:49:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0096C433C8;
	Fri, 11 Aug 2023 17:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691776162;
	bh=+iQXHItDODUlFfOTI2OyFGjt3MA8HTMz94UVE6ry1Wg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kJ5MPwpgSeCgnue+FA4fUi8f6Nd4tIntpi24Lc8Iui60IMe90YlMqiU591zHqBRjA
	 Qwa+QJ+nHbrSFZkVbWsmdQ4rtS9I9Zqp/h5/MhS2Fm2/dZO0wwm7mA96yaN0hBITQS
	 6N8q5lh8nZ7taaJ790HDknnLrE3ghFa565eqNXlAdyresUTlak4Qcm1ISpLj9e1SV6
	 SOaVgk7H1l2W2m4uVt70bMjdiKdV1ZU3yU/zrOgt/YwJJYIWk2Go/0kvZQHGOkABh0
	 nAhpdA7UCf6sy5CtsGcQShaJtmMXz9ea8y7lLOpymydX2VPeC1pccFJIQrii+MySdh
	 o75ENHqAe7PBA==
Date: Fri, 11 Aug 2023 18:49:16 +0100
From: Conor Dooley <conor@kernel.org>
To: Drew Fustini <dfustini@baylibre.com>
Cc: Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Robert Nelson <robertcnelson@beagleboard.org>,
	Jason Kridner <jkridner@beagleboard.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 0/3] riscv: Add BeagleV Ahead board support
Message-ID: <20230811-unashamed-county-a3f662479f46@spud>
References: <20230722-upstream-beaglev-ahead-dts-v2-0-a470ab8fe806@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20230722-upstream-beaglev-ahead-dts-v2-0-a470ab8fe806@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_104923_363406_1020960A 
X-CRM114-Status: GOOD (  12.09  )
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
Content-Type: multipart/mixed; boundary="===============2302325782422412168=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2302325782422412168==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GAKQfoOYysCMruvI"
Content-Disposition: inline


--GAKQfoOYysCMruvI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey,

On Mon, Jul 24, 2023 at 10:20:37AM -0700, Drew Fustini wrote:
> The BeagleV Ahead single board computer [1] features the T-Head TH1520
> SoC. Similar to the Lichee Pi 4A series from Jisheng [2], this adds a
> minimal device tree file to support booting to a basic shell [3].

What is the status of this series?
Does Drew need to repost with the MAINTAINERS patch removed?
Do you want me to queue this with the MAINTAIERS patch removed Jisheng?
If so, I'd like to do so soon so I can get my PRs into Arnd a reasonable
amount of time before the merge window opens.

Thanks,
Conor.

--GAKQfoOYysCMruvI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZNZ0nAAKCRB4tDGHoIJi
0rHFAQDuq66qhwdVKxSwdgf+z+Q235mkVHPAJ/QzdCSuC1+dGwEAv7tD84MghMKJ
HLqO8TqgPQyKJNHgyAgBBBBWWquwDAo=
=sj9+
-----END PGP SIGNATURE-----

--GAKQfoOYysCMruvI--


--===============2302325782422412168==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2302325782422412168==--

