Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0CB606A326
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 12:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LrejFZl1;
	dkim=fail reason="signature verification failed" (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=hXxZf016
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2IUutBBd5qmd/6L00sHthFyr5+i/EQ65M6Zz1tpI+p8=; b=LrejFZl1j3UEPMe+b252AnMtIQ
	rbnhh+yKUk8H6uVPakzoPNQLcliSzFEw2jwM4mEPzTkhZMx/Lh1R/0JaAC90KplNUy1tJ4Epexh0d
	cR9Nc8MzyJOA8W69woNSjIpH9FYIv8b9ejRHTtSe0Z89/1Un6zRNvC6pgSqED59T91omF0xlwkf28
	0Ti3b7Cf3CKhBT8VhoTv40bkSWCZJQccjRu53/fnrubyfIz2OGcMlx4ElJPtI4HWRyX9vUPrJ4DWZ
	uhCtNW6W9RkkcICOPBZGLlKlcEJ+trhHD2JRr4U06ghNOfShPzHie/KvThjvkKPjVvK5I+AN0kawL
	T9ddHuQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOaL2-00000005MNj-3WW5;
	Wed, 04 Nov 2026 12:43:39 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOaKz-00000005MM9-1FKS
	for linux-riscv@lists.infradead.org;
	Wed, 04 Nov 2026 12:43:35 +0000
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C646F3F783
	for <linux-riscv@lists.infradead.org>; Wed,  4 Nov 2026 12:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1793796210;
	bh=KGzmHEtMcujY3rqdKLq4G+eIWN6ovjCAqdXSAfenRsE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=hXxZf016eSpDLt2Tj7WemwTlgaYoJAkq6Gnn4YR8wAPGuhCc+DaizT+tFyH5FtiwP
	 4yNQ8o/4FWDplsPakemx50DMT29VDiZkDd9BJqKKne8N7NV5O53bS2CX615y52/Jge
	 Yu3T/n82kd7ZtvUv7VgzaWNDL8iWRANQ+nElMcskVKWxS/H3B7trM0SNLLW9gdD3yp
	 2+VHx1lf8Zuv9EptTCY8/iFUY0NIuVYqwitq+tRZErxXC+7AoSEg9yY4iPMGuRyi3n
	 LogNavYInIaRxf4jI+m//5nIIL1h4jWCbjOKxVbMNlqtkiB1xeBryqSGaeV5XPM7EV
	 CkPC5Y33prVGPJwW9sFZUTDaX0yEF0rsGzkswtNgvnWuZIIXsgof2LuzOKFBc+8EXd
	 ygJVRQjXuEqQi/kpioA+mVrsN4A1V+RhkRwQEQNFa/5fYnruPqNl8WtapgOE3cYl3d
	 K21dtAPA9MVslCuTjnPYv5wc8bScyhyYbB6WQvTO04/37hhKTjNpoWNodlHwE4Zk+o
	 n9dxpNKaTc4axn8y7H/MaNnv2ylzzZv9EAHeSNO5XmuKYzNLEn5f7PoFPtTzKv/nke
	 oAmSeiXFTqlZ+OmWrOo/oCPS8eSdxCNEHGRXt3dt4+ZvPyu+Oo6o0gDmQUZsEjszrU
	 Fl/gzuqZEr5HcLMdtNI9ZkQ0=
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-6b56a350f2aso368032a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 04 Nov 2026 04:43:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793796210; cv=none;
        d=google.com; s=arc-20260327;
        b=GMrECs8wbmYivqTM6aQuovtLkUo/+Xf9AGTVdMs0JM9DDqN9X5ZOI+wLePKMniVJId
         Djnq6pCVsjiUepA9ONAK1JRCLbSOYxFL5R6JQoeoTsf38CTMt67MLmJl2fgDPrOfJOS8
         XBcCmxXMksE4XWnsWKZXP5eqY+i5mib7YleJ0rNzr1A+Vy9e5kBvl1+rXcLunzb4IH7y
         ctY/0qJEpzhEvYqQGGM8zG17FsyA5gNERbAPboAv1vHZrOiX4U5s/SIGxzN54iDulu0W
         uBwoaDPJ52NzykB/KZiexcOh0pMg/JsHEDMzuGlk0kL+kS6Rd3pbKwCpeHwXG/vg0oD1
         c5Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=KGzmHEtMcujY3rqdKLq4G+eIWN6ovjCAqdXSAfenRsE=;
        fh=qtxrQGRZw0ppEiKuWhHgNvu4j5sWt6ngSVLbGJBT51w=;
        b=G5R8TIGnpZfgEmHNU17AaVJBKIG0r64azhkoyVBJd7vtteBlDIlHXpbsFncOmudbZw
         byo3QrUYwqCBNfdZxzwQO4UQE98ffPZcp4kiOimjek+009/WP0loRAQUjNuQ9waO25yt
         SiEEsyTJk//+u0aULJVCt6gtuLNJi0LHkl55SBu9LmJhE4DuqmLKClaFl+QJoTBacb6W
         680CRD+MM/7ZmTnTTl7POth+0TXk0LnNRSDGPgunIJj0bxKFkCGvE7RBs6LNmoPTreL9
         J8k+UGhFcRD2na/EqJ0acVBkrTQp7WJdRCN6dq/yrR/KTWPZ4wTbzKpsgnn1DnurCeRX
         905w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793796210; x=1794401010;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KGzmHEtMcujY3rqdKLq4G+eIWN6ovjCAqdXSAfenRsE=;
        b=FBQbFEF0bMDCxtKuzcbaG5Hi4YvO2s3lv7F3Dz5zerlNt8u/ENUphYSSOt7ZyKHk59
         QSpHFyBFvSJyHYjZcBUuH/GfjC0ZO+ghhC6lFrNmozB3BJw1XpVEUbVLMtaiFBKsIeLV
         IQ7jmo9L3QH7se+AtDpVwbflulC5KVjOelXX6DfSZ8gf2CpEALmtg+vaVPvPD0niAUwp
         Jlg9RUz1uOZJdWjMwJLH+Gc5mDXfz2oAW6PzTotpgigHzoB+ijAehxCYLiKdxNQYQY/f
         US/6nLnGDUrSjyRBkfCDU8+J9ViAs1bZ47F6epZ+hCGJUxVWx5RC+WExv+Yyhxvca6ic
         jK3g==
X-Forwarded-Encrypted: i=1; AKwUvBwtDnsTxTdvUWSAqyj7qRrVner0A16KJUU4oDWwtS8rsITB/FsjMKaNK4L/6neQkE4xmiuizJtl0F/mpw==@lists.infradead.org
X-Gm-Message-State: APuU4Z+6IzedA4WJ4vDzrxrPgUkLzgEmC8oF7XThSNX/66rrh55sfdLf
	tmu2q9pVBvPooaiTX4x21+8pJ32kh/xg1EzkrZQAupkJfjzjsYIZNvMpKXUD8pRHqP7p4NsakMj
	JucsyYH2P7j9xmlq1F//2vRKb0zTcmtEj3xeVDK2l0BbUEXOJKBy1z5aWmYwN0hzBfX2z/eYTOW
	PlPAxWeUkEGwhaqJvyb7KHpnCNwrbWEiXw2bQ33HWD/TtSxH0/evmPTbL4ZwWl
X-Gm-Gg: AYBFou3V8eY5K0Z0Zo77EXkeMd2HVYHUKFxxgV970KwCYzvSL/X5beD1rgvGrqmy5cj
	AUvDHIMBAEC7VWewsn8Lja9iTCiQuoCFkGwEayTkjLi3MT9k6q8lFICdbLZ+LymvWOeq6qmpeNa
	2VUu+W05u75seeOXkgSjl+dtiUKU/epSNcQceu7MtZJSIB/VV8CRbT+HZ8xPKq1YHGrPjKeuPQr
	+BWzNoauU0alg==
X-Received: by 2002:a17:907:9098:b0:c31:c767:ae0b with SMTP id a640c23a62f3a-c4cc31d0c6amr700108866b.0.1793796210241;
        Wed, 04 Nov 2026 04:43:30 -0800 (PST)
X-Received: by 2002:a17:907:9098:b0:c31:c767:ae0b with SMTP id
 a640c23a62f3a-c4cc31d0c6amr700107266b.0.1793796209840; Wed, 04 Nov 2026
 04:43:29 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261104-k3-bs01dcma-v1-0-794025247e4a@linux.spacemit.com>
 <20261104-k3-bs01dcma-v1-2-794025247e4a@linux.spacemit.com> <CAJM55Z9Yj87hqwMugqRsf_RL9np=KqzCj-J9RyutuWKd-w-n+g@mail.gmail.com>
In-Reply-To: <CAJM55Z9Yj87hqwMugqRsf_RL9np=KqzCj-J9RyutuWKd-w-n+g@mail.gmail.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Wed, 4 Nov 2026 07:43:03 -0500
X-Gm-Features: AclHuK9NNW0S9qfwpVQn7uKkEb-AwCUJMy4Mu66BWXEGz1K_BfAONgexdW5Tcwk
Message-ID: <CAJM55Z9nuO3MneQqBm3K2V2SjOXqXsZcDx9pMzVhxMJJ73xc9Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: Add K3 BS01DCMA support
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Guodong Xu <docular.xu@gmail.com>, Yangyu Chen <cyy@cyyself.name>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_044333_610083_69A9D427 
X-CRM114-Status: GOOD (  20.29  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 4 Nov 2026 at 13:21, Emil Renner Berthing
<emil.renner.berthing@canonical.com> wrote:
>
> On Wed, 4 Nov 2026 at 07:24, Troy Mitchell
> <troy.mitchell@linux.spacemit.com> wrote:
> >
> > K3 BS01DCMA is a board equipped with a SpacemiT K3 SoC, 16 GiB of LPDDR5
> > memory, a P1 PMIC, an EEPROM and QSPI NOR flash.
> >
> > Add initial support for the serial console, EEPROM, PMIC and QSPI NOR
> > flash.
>
> Hi Troy,
>
> Thanks for the patch!
>
> I just had a talk with Dong from Spacemit. He tells me the BS01DCMA is
> the name of a module similar to the com260, only it has a different
> form factor and each module consists of 2 separate K3 nodes. Similar
> to how the com260 module can be used in a small carrier board
> (spacemit,k3-com260-ifx) and in a 10-node server
> (spacemit,k3-com260-tq), I'd expect to see a
> common arch/riscv/boot/dts/spacemit/k3-bs01dcma.dtsi describing the
> module itself, and then an
> arch/riscv/boot/dts/spacemit/k3-bs01dcma-<something>.dts that
> describes the extra peripherals that can be accessed when the module
> is plugged into the server.
>
> Unfortunately Dong didn't yet give me the name of the server using the
> BS01DCMA modules that they showcased in Shenzhen.

Ah, it's called the Cluster Server RV2768
https://spacemit.com/community/development-kit/cluster-server-rv2768

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
