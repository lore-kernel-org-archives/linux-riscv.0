Return-Path: <SRS0=CnAn=LI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BCFDC2B9F4
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Jun 2021 16:08:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED1126120E
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Jun 2021 16:08:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED1126120E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cerno.tech
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jfX4g+z/B9y5tOWMo/mUjH0TM2mAtf5oXPdFs7e5ixU=; b=xivGQCFjVbm0MX46TIOyyx8kmR
	6uMjXI43BnSj1GZO9UFF8U7ChkH6uDQ3XoEIwReTwht4/FijA/17n3AMTiBjUQqZ21pSREeJhfiDs
	uNXDnuFQ8XCmthYoYb7udT/k8aERmoU/Yzg2/Ii8mpuhWRs7awv6gLQ4XNJEQFjPkHUPACNw9yJud
	RDzc7P7AUIkosybWFghED/O3/mCc4FTfScmBRhfEiWU+RhevxqwtwUkF0SaGr2jRVy+JcVp0VrGTb
	bhREIMPT9kMNdX8F4fdGDmXncoWP+FeeL2odfT9ncvLV0avj9sr2k2jbowXINL4pNABES6M7ZQgj8
	O+fmFjPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsp8L-00F06e-1B; Mon, 14 Jun 2021 16:08:17 +0000
Received: from new4-smtp.messagingengine.com ([66.111.4.230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsob0-00EmF6-5T
 for linux-riscv@lists.infradead.org; Mon, 14 Jun 2021 15:33:51 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id ABC9F580963;
 Mon, 14 Jun 2021 11:33:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 14 Jun 2021 11:33:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=/m73zM5bRc8SxBckYjWBihWHS+D
 cE2aCLZ0aiG4SCFI=; b=oyoiP7lI+Yi6LLPsCPhJYATK9cDoDcCY489i+0VzeW/
 WfpkMeksaDwytsWlHjCPMBWfT/VBJ27rz5KEVOMj7F1Q8nLs90T0aA8hHS42h0sl
 Yd1fP/nTwEPz0JAu1OlGzrIPud3GID6Hk21Gje5sHYINYUazH7SY95JI4FKsDohX
 wr+Ch8TXpfesOCTrdgZjw10ccVLlF2okXtX3IW2LF0wH3Ycgtuw5R9qUAJ0ReEeV
 z6AMSqCOHOmpR8YQJPKuCcVk2pNlbLqCgScUF6DASTOM7TknMgSO6gfPi/ul2JVS
 gQtR/6XAMs9Eg4q9bRBjGu9Ooi8ENlkUnwToq/gDB7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=/m73zM
 5bRc8SxBckYjWBihWHS+DcE2aCLZ0aiG4SCFI=; b=ZxDrcIIIgxF2AYmqpi7goX
 MgpmD3qgbpIVzx8IVEeqwP/v8ZK8xqWtl6LAMWhQ3kZpm8XSIfBpP/J1Kza25XRc
 //MU/WTKGioqPUTIYNCj1LgKuCyfuM5Q6Pc+G5dThFcuMgSH0ygBMb9pGVDPNh+/
 6gjeifeXtbo54QBuOAkgKX4G4LkdopNaPNE5d1KFBc6k69I5Yv8z+hIQb1eP6PS6
 X5nRboMHRjSKpa+ezGCuIuaPVdkaQ/lixVNbYzagQIOt00h6lGMteU1jbMUeXejC
 mit+XTpRDpetJ2DtG+4DqoIGtUNRVLm9hyktW1zwcbisk7bUT6w7xc5cuWWaNXIw
 ==
X-ME-Sender: <xms:1nbHYPM1DKytrC09E4LrE2M4iG0h6VvIxFgKGRaSTXVb73RWTLeAuQ>
 <xme:1nbHYJ9mpfftksenOFWdTdY9IYnuyas2VOIk4CxRY_NgCA2pSo_DH986aamc08NNB
 cbU45SS7o6luMPPcwI>
X-ME-Received: <xmr:1nbHYOTjk3_ybJdixn3jocfiLgiFzmJtnCbeXAOHdRe4PcZuQ5nUO5OCCufyRas4WqImzaI5Pu7W3EqUHQL_ulv3jLZdzsvBr3Uo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedvhedgkeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:1nbHYDtMykP2Pafz3TYJv7sDXf7ZBNNZzlQBfwVYWakN6HJUAr8n4g>
 <xmx:1nbHYHc7R0ozKFh5Qf3GgsgrejnwdrXP4tzIE3YI_3Ck0vxhNl0wqw>
 <xmx:1nbHYP3XWyRjeMjO1SWVJIL3MGp2JVnqpmWWzCPU5y9zOpDd91zICA>
 <xmx:2HbHYC0w4GS3G5rmcXce06pn57foNGRiIJmKvZWQtNcp3zszr6OTsw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Jun 2021 11:33:42 -0400 (EDT)
Date: Mon, 14 Jun 2021 17:33:41 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Guo Ren <guoren@kernel.org>
Cc: Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 Arnd Bergmann <arnd@arndb.de>, Chen-Yu Tsai <wens@csie.org>,
 Drew Fustini <drew@beagleboard.org>, liush@allwinnertech.com,
 Wei Wu =?utf-8?B?KOWQtOS8nyk=?= <lazyparser@gmail.com>,
 wefu@redhat.com, linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>,
 Atish Patra <atish.patra@wdc.com>, Christoph Hellwig <hch@lst.de>
Subject: Re: [RFC PATCH v2 09/11] riscv: soc: Initial DTS for Allwinner D1
 NeZha board
Message-ID: <20210614153341.z2nkx6sazaahhjfd@gilmour>
References: <1622970249-50770-1-git-send-email-guoren@kernel.org>
 <1622970249-50770-13-git-send-email-guoren@kernel.org>
 <20210607072434.3g3bqxdlpxjirg6k@gilmour>
 <CAJF2gTStppyEoLD-ZToeHYdnzNoFhH2+3Lhd76=M8OFKS=Syow@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJF2gTStppyEoLD-ZToeHYdnzNoFhH2+3Lhd76=M8OFKS=Syow@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210614_083350_315375_BEF01F9D 
X-CRM114-Status: GOOD (  12.24  )
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
Content-Type: multipart/mixed; boundary="===============2310608015159505922=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2310608015159505922==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="57v6yqtbd77tvyfk"
Content-Disposition: inline


--57v6yqtbd77tvyfk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 07, 2021 at 04:07:37PM +0800, Guo Ren wrote:
> On Mon, Jun 7, 2021 at 3:24 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > > +             reset: reset-sample {
> > > +                     compatible = "thead,reset-sample";
> > > +                     plic-delegate = <0x0 0x101ffffc>;
> > > +             };
> >
> > This compatible is not documented anywhere?
>
> It used by opensbi (riscv runtime firmware), not in Linux. But I think
> we should keep it.

This should have a documentation still.

Maxime

--57v6yqtbd77tvyfk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYMd21QAKCRDj7w1vZxhR
xSH4APwP68R0c/83yQvYSsRfAXKMipDvM+sVGT0uphG7+6JyJQEAhDC6yd2FpJ0y
Re9TWov4hPAnvz5HPAFkSktsoX1hBwA=
=p0a+
-----END PGP SIGNATURE-----

--57v6yqtbd77tvyfk--


--===============2310608015159505922==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2310608015159505922==--

