Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 433FEC61D97
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 01:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uv6r57Ju+O4F56IlYYOtRtRcgH9hGeGONMVd/tNsjLk=; b=t0T9jjeG73vJYr
	pydi6zi6Sb0rHqJ/zFqM/U4d2JJXAWIeX1qSmCu10ikYXjrXPNAMMLjnaSa0M7pBKKF2m31KBhe5f
	i3aZvBX4B0sX3e9K6VFWUQetn5kgqPbVC0xUWNpr2+fG87leqipxHm4VrvUuCBq9/sDPiPg2Ce8W4
	NKc3d3OK2WkoRtkNEmjCg5A1iaih7/vQobCh3gHQBvTQVZ4+bTZxMNl5vf8Ln+B5KKwr+cJsiUiKN
	tG39pRoAUHDJh70XB+fsCIkojfRJqhJ5WBdNzqpEDjBGvwod1RC/I5Im+TEXOKH5nBaIbM/NRT5nM
	hODOYX35Dq+3d3I/rNmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5bp2-000OL4-1Z;
	Wed, 22 Nov 2023 01:14:32 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5boz-000OKN-2S
	for linux-riscv@lists.infradead.org;
	Wed, 22 Nov 2023 01:14:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 52952B81C06;
	Wed, 22 Nov 2023 01:14:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23AF8C433C8;
	Wed, 22 Nov 2023 01:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700615664;
	bh=rphzolO4qNFSWg1tDMw1cULkepLmztnO/fdyF7aCD/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nrVWFy+llDoq6D7PZjaiAXmmUgR9/2t/fPiONPKKVbSp1ki43ndsX1+mM//dArRI3
	 Ercyb0mb3CzQ0WKOE43JoMhsoS9OpGRcDGytKRRFCP+CMxPV01k2rshgGA+x/Ujagq
	 mTvwLEBrZ6NTCoc/QEM/nqWhsm5dgsQfD6olfUePK/Ser1rEPQl80RBASM8XG5PVQO
	 f4i6CRxJX+jNaY+OSmCbB/eCvsDC03m4Bz8QgmKAH4OWa2y/iOQ6awZG89h2k5UbJh
	 0zhl1vnz0yYOI6+nWUfrjudkfiS66CNcLlqJWvgSyClI5XK9kx+1yKHmiPXRiWIOv1
	 SPG+qtA42ri5g==
Date: Tue, 21 Nov 2023 17:14:22 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Jerry Shih <jerry.shih@sifive.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	andy.chiu@sifive.com, greentime.hu@sifive.com,
	conor.dooley@microchip.com, guoren@kernel.org, bjorn@rivosinc.com,
	heiko@sntech.de, ardb@kernel.org, phoebe.chen@sifive.com,
	hongrong.hsu@sifive.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org
Subject: Re: [PATCH 06/12] RISC-V: crypto: add accelerated
 AES-CBC/CTR/ECB/XTS implementations
Message-ID: <20231122011422.GF2172@sol.localdomain>
References: <20231025183644.8735-1-jerry.shih@sifive.com>
 <20231025183644.8735-7-jerry.shih@sifive.com>
 <20231102051639.GF1498@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231102051639.GF1498@sol.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_171429_936952_F248E727 
X-CRM114-Status: UNSURE (   6.91  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Nov 01, 2023 at 10:16:39PM -0700, Eric Biggers wrote:
> > +	  Architecture: riscv64 using:
> > +	  - Zvbb vector extension (XTS)
> > +	  - Zvkb vector crypto extension (CTR/XTS)
> > +	  - Zvkg vector crypto extension (XTS)
> > +	  - Zvkned vector crypto extension
> 
> Maybe list Zvkned first since it's the most important one in this context.

BTW, I'd like to extend this request to the implementation names
(.cra_driver_name) and the names of the files as well.  I.e., instead of:

    aes-riscv64-zvkned
    aes-riscv64-zvkb-zvkned
    aes-riscv64-zvbb-zvkg-zvkned
    sha256-riscv64-zvkb-zvknha_or_zvknhb
    sha512-riscv64-zvkb-zvknhb

... we'd have:

    aes-riscv64-zvkned
    aes-riscv64-zvkned-zvkb
    aes-riscv64-zvkned-zvbb-zvkg
    sha256-riscv64-zvknha_or_zvknhb-zvkb
    sha512-riscv64-zvknhb-zvkb

and similarly for the cra_driver_name fields.

I think that's much more logical.  Do you agree?

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
