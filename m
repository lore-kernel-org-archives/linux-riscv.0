Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD730CA0ECA
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 07:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W/lQFquAaMlprnkISl0g+X/N+J/owwiW++89rKEdstE=; b=PgCi2S4S2NioQP
	67xFpAJ4K/q7HGXH/Aj5ydlfXR0qtr92uD0G16osq8PCltUGWyCb3qZC6niWnbnF6S3FCSRlyKtjv
	uISwz+DgdGW0oMyYKkiVdwcnNR+xV7wqNqzQBAln2NPOskRgMuezOYKwhtQHafHS/vaWjkdnHX8fE
	dIgu0IbRLHwBL8FJGy1Bn+N1jryVICtwSQiRUf63JTRjwFIMKJqxEmi0vpeqSBHd4A4Dyn/LhGtVl
	YVkEtoLGMxtSh0e0OtlgqHc54OYEK6ezhq9aXSOv2XmPgoQQ3aiVXY+pt0/wTYZnbT45au7m+i+8H
	lrkh7xd36AgFZCqLFjeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfxSR-002Ljo-1F;
	Tue, 12 Sep 2023 07:05:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfxSO-002Liv-15
	for linux-riscv@lists.infradead.org;
	Tue, 12 Sep 2023 07:05:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 082A1612AF
	for <linux-riscv@lists.infradead.org>; Tue, 12 Sep 2023 07:05:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A723C433C8
	for <linux-riscv@lists.infradead.org>; Tue, 12 Sep 2023 07:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694502305;
	bh=rdbAnWDmqOY+gzQ808fleTCy7T0WdyZbioJ9M88erQU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=P6prl/wEd//9SPT1qY531EGJqgOTlVEuToz0Mba3enuHKZdwa0Zn14U1WyxDlbewb
	 xRYsvNK0wwYNtjbh+TENHqzl00MaFXcMnYnUhyYsasFuiRnB20xh4Xg7sAojnRMEdR
	 dkAaN6ajP1N0jqDy1cxDvM7GCR2d44tvjbu1RfucNguC7f+YjEAyx/uHlL+WWW+sf0
	 ayHULCrsxopO5VAf/LbmDLfgtLWAtMpjNH8nnrLaxMFhxUCNiDYCUQXhs0e6k5sTkw
	 ZQ0TVGUXd9Ogp02cOsb0N9K8XQP093EMEOGwAeL0O+t+teE1s4D3PedDnXbT5WBExy
	 0it5naf4/Go8w==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ba1e9b1fa9so89645111fa.3
        for <linux-riscv@lists.infradead.org>; Tue, 12 Sep 2023 00:05:05 -0700 (PDT)
X-Gm-Message-State: AOJu0YyP6UB01JbJyS7yr3kE5ppU+tGoSseiQfvqyQKD5/awNgSyuAFd
	IdOQfB4wnOIK6nIQsZO5mf3SR/GCS8O+TajsA+0=
X-Google-Smtp-Source: AGHT+IHM2Q2GsUNR0wFWv4DEN2NdeYOxUGS5UgSXcN6uPWiGfeXVUbGdMGi/1xpRAr+xFot6bo4EPLs1rpqpexJAWUI=
X-Received: by 2002:a2e:9197:0:b0:2bc:c11c:4471 with SMTP id
 f23-20020a2e9197000000b002bcc11c4471mr10402795ljg.21.1694502303650; Tue, 12
 Sep 2023 00:05:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230711153743.1970625-1-heiko@sntech.de> <20230711153743.1970625-11-heiko@sntech.de>
 <20230721054036.GD847@sol.localdomain> <CCA32056-CCE2-4FB5-8CFC-62444CDDA89F@sifive.com>
In-Reply-To: <CCA32056-CCE2-4FB5-8CFC-62444CDDA89F@sifive.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 12 Sep 2023 09:04:52 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEGnZC6nge42WeBML9Vx6K6Lezt8Cc1faP+3gN=TzFgvA@mail.gmail.com>
Message-ID: <CAMj1kXEGnZC6nge42WeBML9Vx6K6Lezt8Cc1faP+3gN=TzFgvA@mail.gmail.com>
Subject: Re: [PATCH v4 10/12] RISC-V: crypto: add Zvkned accelerated AES
 encryption implementation
To: Jerry Shih <jerry.shih@sifive.com>
Cc: Eric Biggers <ebiggers@kernel.org>, Heiko Stuebner <heiko@sntech.de>, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, aou@eecs.berkeley.edu, herbert@gondor.apana.org.au, 
	davem@davemloft.net, conor.dooley@microchip.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-crypto@vger.kernel.org, christoph.muellner@vrull.eu, 
	Heiko Stuebner <heiko.stuebner@vrull.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_000508_566889_4E7A4EF3 
X-CRM114-Status: GOOD (  20.80  )
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

On Tue, 12 Sept 2023 at 00:50, Jerry Shih <jerry.shih@sifive.com> wrote:
>
> On Jul 21, 2023, at 13:40, Eric Biggers <ebiggers@kernel.org> wrote:
>
> > I'm looking forward to having direct support for these AES modes, especially the
> > modes needed for storage encryption: XTS, and CBC or CTS!  None of these AES
> > modes is actually implemented in this patch yet, though, so they can't be
> > claimed in the kconfig help text yet.  This patch is just a starting point, as
> > it just adds support for the bare AES block cipher ("aes" in the crypto API).
> >
> > (BTW, I'm much more interested in, say, AES-XTS support than SM4 support, which
> > this patchset does include.  SM4 is a "national pride cipher" which is somewhat
> > of a niche thing.  I suppose there are already people pushing it for RISC-V
> > though, as they are everywhere else, so that's to be expected...)
> >
>
> We have further optimization for RISC-V platform in OpenSSL PR[1]. It will include
> AES with CBC, CTR, and XTS mode. Comparing to the generic AES implementation,
> the specialized AES-XTS one have about 3X performance improvement using
> OpenSSL benchmark tool. If OpenSSL accepts that PR, we will create the
> corresponding patch for Linux kernel.
>
> [1]
> https://github.com/openssl/openssl/pull/21923
>

This pull request doesn't appear to contain any XTS code at all, only CBC.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
