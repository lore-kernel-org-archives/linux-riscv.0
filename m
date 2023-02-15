Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1159C636D4
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 22:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z1PROFlS4YqZW6f4fmkLgLvI9UmjgrQD1vuXJy9Y6iA=; b=f3bMsCORuFRIQDoJEUZEtVMhr6
	/F6t6bkVbn2Mqd+B/LMB5MePnKD8rXeILx7/H4281BZrL4d5SxckrsA9WVmKD6MaBFSoDzlHyvPVD
	4COHBVHPYEmYLp3+dnFDdEKZ79taGzSVmTxOtVVJzoSYbO/+74+FljUj5I4cZdLeCcSxmEnzQHbF4
	FTIk+F55a65tqZe1NyRMHzvdowShxt/16YzTM8MbsjpH1uM+gtG12p0n0pwR2LKMXNuCzOOAJiKJA
	qXR0OEwaqcprttf9LCgzUUS8+jsgir25iemb0b3ICvYxLBgpwyN2c8eyAQekUo3p/y4relav3mv4M
	6glxcwqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSQPa-007iHw-On; Wed, 15 Feb 2023 22:38:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSQPX-007iH4-R0
	for linux-riscv@lists.infradead.org; Wed, 15 Feb 2023 22:38:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2858961DD0;
	Wed, 15 Feb 2023 22:37:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39DFDC433EF;
	Wed, 15 Feb 2023 22:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676500678;
	bh=NvXLo4zERJELs3A0OEbINEn9B1MOqPEhBbBoM1rX5Sc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cg1aZIRXEngBsn1Qg0rZaUeexAmJiiImPjpo2Ks+7c0VvaIrFt6Abyu9m+0Mvk70d
	 RKB7m11YqKvzWlqEjRIV/X3QfTm/vGyCctgxWP0XlFvcebgjjqwBwfB8qVA5vFKokK
	 nwohXTC168+65/ECwiM6zxf61BoS0n1keoteZkRhAkpoA22BXd3AVM89KvZ1bA3uqh
	 e29Ajs4P22ZsPV7nHO6qgz5ejXyn6PDND7HURaQeeaDHMNl1I9TpiPGg+I4xGvXIy9
	 GuIRiyxCe7NA4M8vH4mEFVlF62VlIUs4y267CBDD9W4F4F1XmzBV3xNW8wF6LfjKQj
	 WV0MAuX2lPtEQ==
Date: Wed, 15 Feb 2023 22:37:51 +0000
From: Conor Dooley <conor@kernel.org>
To: Pu Lehui <pulehui@huaweicloud.com>
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yhs@fb.com>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>, Luke Nelson <luke.r.nels@gmail.com>,
	Xi Wang <xi.wang@gmail.com>, Pu Lehui <pulehui@huawei.com>
Subject: Re: [PATCH bpf-next v1 1/4] riscv: Extend patch_text for multiple
 instructions
Message-ID: <Y+1evzv1PkuETdVm@spud>
References: <20230215135205.1411105-1-pulehui@huaweicloud.com>
 <20230215135205.1411105-2-pulehui@huaweicloud.com>
MIME-Version: 1.0
In-Reply-To: <20230215135205.1411105-2-pulehui@huaweicloud.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_143759_935706_7952BF97 
X-CRM114-Status: GOOD (  10.54  )
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
Content-Type: multipart/mixed; boundary="===============8584190701720102687=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8584190701720102687==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zfz/HF4ZANB5RmXZ"
Content-Disposition: inline


--zfz/HF4ZANB5RmXZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 15, 2023 at 09:52:02PM +0800, Pu Lehui wrote:
> From: Pu Lehui <pulehui@huawei.com>
>=20
> Extend patch_text for multiple instructions. This
> is the preparaiton for multiple instructions text
> patching in riscv bpf trampoline, and may be useful
> for other scenario.

In the future, please use the full width for your commit message (or
fix your editor if it thinks fifty-something chars is the full width).

Otherwise, looks grand...
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.


--zfz/HF4ZANB5RmXZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+1evwAKCRB4tDGHoIJi
0otNAQD6dzDRBTtWgsltvV157r3eLCncHyAAlAEHTxf6GkoQwgEA1I7d2AKYYUF1
7I9rFNKoujbABR5RcyUYKdUBGnSVjAc=
=mAMb
-----END PGP SIGNATURE-----

--zfz/HF4ZANB5RmXZ--


--===============8584190701720102687==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8584190701720102687==--

