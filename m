Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A95CC3064D
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jul 2024 13:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gquzXRC5caP7gBH0MDOGuuml2vTcTtaL4KiDUs0BTTM=; b=Gmpn4xZYKaW+sggKVwu6ui4+tP
	4It7/IHHBDwNIL45c3wV5ZrZAIhkkNIE9pvp/RU9CP8nBnMEFGmZGMxp8zu+HqCm8oQu+R9v8g8rV
	6EVOlbBDLnTGKLcY0c9TLb7GDZN3WpA/LdWTZstdeKTGUZS3DupyHSF3U0tra7W6v12K+WxLMw8RZ
	nJoqs9Y58mNfARjaRF3t/FywRYv35Ux3KPR9VZxW+YYJa7YbXNXUEBh4czh12q6qsoV27aaF8Xd2J
	O82VDcj1JJXJT6J20qlcjxGZH9AUVdu20/3xy1sA3iWdZpIjULA8uOcMw/I+xOY8rzPCuLC4OLolB
	STCmJ7tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOdkB-00000006tI2-1TU3;
	Tue, 02 Jul 2024 13:40:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOdk6-00000006tHN-28ax
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jul 2024 13:40:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6498C61BF5;
	Tue,  2 Jul 2024 13:40:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B55ABC116B1;
	Tue,  2 Jul 2024 13:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719927621;
	bh=/GVZeyDyQK8AXbMqTZiufCNDNqS1Z4p3Wb4mdqN502c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=qYHVcnakAG4sRMAo3JTbas7o8n17yRD/nZuJ1NgivbBobs1otqujnKkYxtKxI/GSJ
	 sCsBmkjTg0/gEdsAFSJzIeGCkz73UVOArNxlMnoA4MvbdS0qf3VbGlTPQxwz6b0cVv
	 eHfj0CEcrplKTBEd5UziGc+4Tj75dsFsIbdV9npAI+iLVuNNxOdXXZojy/8tt7OADo
	 rFtS6qA5/nDbiztqdJugvEiljupR9AIKqmdRihLA2Z5pqyPPhWd2EuTUUH6ae/RjMx
	 aSPOrAA0Ja4EY7UXpZ8siBometN+7HGvwRqyeGBfMkLlBDxoNKc0+nQ59KKoUgDM28
	 1Bx1XfwzDqIIA==
From: Puranjay Mohan <puranjay@kernel.org>
To: Pu Lehui <pulehui@huaweicloud.com>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org
Cc: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Alexei Starovoitov
 <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Eduard
 Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, Yonghong Song
 <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, KP
 Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Pu Lehui <pulehui@huawei.com>
Subject: Re: [PATCH bpf-next v6 1/3] riscv, bpf: Add 12-argument support for
 RV64 bpf trampoline
In-Reply-To: <20240702121944.1091530-2-pulehui@huaweicloud.com>
References: <20240702121944.1091530-1-pulehui@huaweicloud.com>
 <20240702121944.1091530-2-pulehui@huaweicloud.com>
Date: Tue, 02 Jul 2024 13:40:03 +0000
Message-ID: <mb61pfrsrdia4.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_064022_614643_263070AD 
X-CRM114-Status: UNSURE (   9.04  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============6904853544207855653=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6904853544207855653==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Pu Lehui <pulehui@huaweicloud.com> writes:

> From: Pu Lehui <pulehui@huawei.com>
>
> This patch adds 12 function arguments support for riscv64 bpf
> trampoline. The current bpf trampoline supports <=3D sizeof(u64) bytes
> scalar arguments [0] and <=3D 16 bytes struct arguments [1]. Therefore, we
> focus on the situation where scalars are at most XLEN bits and
> aggregates whose total size does not exceed 2=C3=97XLEN bits in the riscv
> calling convention [2].
>
> Link: https://elixir.bootlin.com/linux/v6.8/source/kernel/bpf/btf.c#L6184=
 [0]
> Link: https://elixir.bootlin.com/linux/v6.8/source/kernel/bpf/btf.c#L6769=
 [1]
> Link: https://github.com/riscv-non-isa/riscv-elf-psabi-doc/releases/downl=
oad/draft-20230929-e5c800e661a53efe3c2678d71a306323b60eb13b/riscv-abi.pdf [=
2]
> Signed-off-by: Pu Lehui <pulehui@huawei.com>
> Acked-by: Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org>
> Reviewed-by: Bj=C3=B6rn T=C3=B6pel <bjorn@rivosinc.com>

Acked-by: Puranjay Mohan <puranjay@kernel.org>

Thanks,
Puranjay

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIoEARYKADIWIQQ3wHGvVs/5bdl78BKwwPkjG3B2nQUCZoQDNBQccHVyYW5qYXlA
a2VybmVsLm9yZwAKCRCwwPkjG3B2nflEAQCjAe+AxuQrgIDgc1bxgHeB/tv8iUpO
wMzYeE99NEwXSgD7BAY3XDTU5cNevHTPXgOmwwAXJX8st3eeEEzoBlhRzgU=
=SI05
-----END PGP SIGNATURE-----
--=-=-=--


--===============6904853544207855653==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6904853544207855653==--

