Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7640AC6FA8F
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Aug 2023 18:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bVxudM4wZGuu5qK+0Mo5fMmLQH+TUpITl0r+mKEFXxA=; b=BHmndPW6fceWyt8utLvo7m1clM
	J8rxTUGj7mKkKT1yPvqbNW2sK2i4fFUmK00zmOKt8pbL2ySaEizF3ZGVWN8muhPgLje53/cS8Oved
	Cr3gGWESXls29Fyg1LHEwrVM9tGhW8V258DlxRqvsPavhbAZ/D/XWhl/hCiY7gGMVpPBQ3Z1DnjKe
	bxD1K242CM2vUDAICcUvGSScu7HdTzRZL2pSUb2OgIHLHHlW7KppXuwESQ5/HcGWDE7RJK9cBpEte
	BApdvE1t0ClqMrLgb/d739ycYgcrmTWWpacVbd3UC9ebtwliBpyZ+y7v9LLVGwG7QzZvDF85/zAcq
	wLCb6KTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZEht-003ZEr-2E;
	Thu, 24 Aug 2023 18:05:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZEhr-003ZEV-1u
	for linux-riscv@lists.infradead.org;
	Thu, 24 Aug 2023 18:05:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1A26A65FDA;
	Thu, 24 Aug 2023 18:05:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94152C433C8;
	Thu, 24 Aug 2023 18:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692900318;
	bh=b9Y4MPFolNjzn4rKwTbXRHQYatnX1u3FmDMhr2r9dz8=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=DfHVNSb5f04gpIp928ey9FDQppV9g16cxcCFbnmXLlzczV5Fr+m7iOZdD7NqfcnRr
	 jssafJzN3XCx7hMfYdBJ940V0KyasdFVTPIuylav+O153GUVHKylaA/Ja7l1Au6R4A
	 oIp2gev0SB+akKLnOOE8eDC7UEucEfPR6DlyDghDEV0+tTE2pHpq8/zxObGFf808Tw
	 wnL2MX0pTMGpsWPdDXEhLkLOfRYba7863JBLMANK8nqAthlHrmT9jF86A8jAZs40LX
	 GhY1yeWL4KALL9EuVn4TGJMkY8tSHhc72uHitMzFoLJatnVQJVCoy2f114QDwmew1Q
	 1AvL7+ZCgoXeQ==
Date: Thu, 24 Aug 2023 19:05:13 +0100
From: Conor Dooley <conor@kernel.org>
To: Mingzheng Xing <xingmingzheng@iscas.ac.cn>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	patchwork-bot+linux-riscv@kernel.org,
	linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, nathan@kernel.org,
	ndesaulniers@google.com, trix@redhat.com, bmeng@tinylab.org,
	guoren@kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH v5] riscv: Handle zicsr/zifencei issue between gcc and
 binutils
Message-ID: <20230824-cortex-mobilize-8b94e059e130@spud>
References: <20230809165648.21071-1-xingmingzheng@iscas.ac.cn>
 <169228562484.20811.14246462375671910714.git-patchwork-notify@kernel.org>
 <20230823-captive-abdomen-befd942a4a73@wendy>
 <20230823-facelift-ovary-41f2eb4d9eac@spud>
 <4677fc33-6e76-21e6-2a7f-f12670bc1ce2@iscas.ac.cn>
 <4177c0c5-4d36-75e1-84e2-c6ac82b74e50@iscas.ac.cn>
 <20230824-stick-neutron-839dfdfa0538@spud>
 <3ba51c81-7eca-b1b5-c89d-47b292b65641@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <3ba51c81-7eca-b1b5-c89d-47b292b65641@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_110519_668547_8E2867C8 
X-CRM114-Status: GOOD (  10.40  )
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
Content-Type: multipart/mixed; boundary="===============5975736111829813554=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5975736111829813554==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="U02fYEvSEIMc9kCR"
Content-Disposition: inline


--U02fYEvSEIMc9kCR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 25, 2023 at 01:46:59AM +0800, Mingzheng Xing wrote:

> Just a question, I see that the previous patch has been merged
> into 6.5-rc7, and now a new fix patch should be sent out based
> on that, right?

yes

--U02fYEvSEIMc9kCR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZOeb2QAKCRB4tDGHoIJi
0vDMAQCzGNlPBZZkzPnogVAMPBEN/UWcLLDix5fK5GC8O/NBdgD9Eq02Jx3LLTHQ
NQ7boHcY0bsiLyHDYsoS6SSG921AbgI=
=nZ9V
-----END PGP SIGNATURE-----

--U02fYEvSEIMc9kCR--


--===============5975736111829813554==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5975736111829813554==--

