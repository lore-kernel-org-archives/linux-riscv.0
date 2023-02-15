Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44615C636D4
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 22:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vfNKgXx/VdPhG52oYtS+1w2NY7SbuOTaWP8Gd4MiV3M=; b=h4DiR4kZ6Waqu2VG3ZVb91UrsE
	o+bf2WEAF4dlDr5XoGPKaC5mpSCKpq4ZMlJiqnCvNuTwBjcWk8zH2Ac3jDRuMwABmxxypStqi2mgB
	hkkxYpl/C5NOSJfQAMPpo5VftEVwNbOFhWlObudYdOyFQNTuJKTupOHo41KvXtooUKugQBVWaW7cU
	5FsysBjQzUDhBmSYXWOrP8Ys9A8Y86nA+BEie4+CmwFX8L7Jw+q4ufQGs6fl45uFO27qnSYdkMlxb
	owA/RwiWwv4SYWcsutl5W6faQy9arh4IjRffNXVg4VICBLHUMPH8SjAX1MI/nC3CaAA7cMDw4Y13x
	l83TH2/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSPxq-007eVt-K4; Wed, 15 Feb 2023 22:09:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSPxn-007eVE-A4
	for linux-riscv@lists.infradead.org; Wed, 15 Feb 2023 22:09:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D9DBC61DCA;
	Wed, 15 Feb 2023 22:09:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C7F2C4339C;
	Wed, 15 Feb 2023 22:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676498958;
	bh=Qqz6yS3ExjwKNY1LOZ57WHYVmDwA8NRKmkF1c3n4DgY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wx6Sh4+TpPW7RHv7Y2gPqBgcrpsNsCou4HUbe10xvxmTqvE8BFbXg/tlq2fK4P18+
	 WlFjc70udg2g/7oDBqhmK1aZ6LyU7BYjFOKfclopHBP/p1aaOeQ6b0NULsL4SWUhux
	 e0z8yQLKBfVc/JXJ119aAqyp1C4cJG4ICS+QZFsSmT6Je264NHb3V/qP+Rc9ALiwvh
	 eMKfw7OWifvGbVj9jA7qZj+2CnrW6goIyJAQK/VNBeqfsemPGxIWKIQz9DO4rxTY9D
	 2bklbGXH71ITCTjciEZj0aXG40fto5VWXdP/+dfpup8UegpMwKPfanblVtnKXHc9Eo
	 Qs+i5AxrF4KDQ==
Date: Wed, 15 Feb 2023 22:09:12 +0000
From: Conor Dooley <conor@kernel.org>
To: Evan Green <evan@rivosinc.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, vineetg@rivosinc.com,
	heiko@sntech.de, slewis@rivosinc.com,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Bresticker <abrestic@rivosinc.com>,
	Celeste Liu <coelacanthus@outlook.com>, Guo Ren <guoren@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	dram <dramforever@live.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 3/6] RISC-V: hwprobe: Add support for
 RISCV_HWPROBE_BASE_BEHAVIOR_IMA
Message-ID: <Y+1YCC7iKGfzhCCs@spud>
References: <20230206201455.1790329-1-evan@rivosinc.com>
 <20230206201455.1790329-4-evan@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230206201455.1790329-4-evan@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_140919_429858_B3A332AC 
X-CRM114-Status: GOOD (  12.84  )
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
Content-Type: multipart/mixed; boundary="===============0700944428223310087=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0700944428223310087==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mNM1TIv0ctRwSSPF"
Content-Disposition: inline


--mNM1TIv0ctRwSSPF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 06, 2023 at 12:14:52PM -0800, Evan Green wrote:

> +		case RISCV_HWPROBE_KEY_IMA_EXT_0:
> +			{
> +				u64 val = 0;
> +
> +				if (has_fpu())
> +					val |= RISCV_HWPROBE_IMA_FD;

The indent caught my eye here for a sec so my attention was drawn back
here. Would you mind adding a line of whitespace between these checks?
Cheers,
Conor.

> +				if (elf_hwcap & RISCV_ISA_EXT_c)
> +					val |= RISCV_HWPROBE_IMA_C;
> +				ret = set_hwprobe(pairs, val);
> +			}
> +			break;
> +


--mNM1TIv0ctRwSSPF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+1YCAAKCRB4tDGHoIJi
0uGtAQCbl6xjnQJVTf3forD97h5nVmEJHAI/kgAdmSnS/g91VQEAiv+nI/S86US6
MjLBBDqGuTNOMf3KxxztJ2Oi85UlSw8=
=83wP
-----END PGP SIGNATURE-----

--mNM1TIv0ctRwSSPF--


--===============0700944428223310087==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0700944428223310087==--

