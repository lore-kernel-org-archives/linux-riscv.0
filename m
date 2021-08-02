Return-Path: <SRS0=JNkM=MZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4873C4338F
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Aug 2021 02:37:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F67961050
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Aug 2021 02:37:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9F67961050
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+PTiADkBKdnOSoSKkZx/MVFHNVpOr3QpgvYuq9rqb+4=; b=r5Qz7iSnbnTbl9
	veYYzi6cH3PBObDO7TdZps2WcHl398p0Qchw+hzqkdSz231buei6Z6uBKifavtlTaJyaju6C4uSIR
	7eS7ehyZapzl1AauP529c8dGbc8lpyHPQAi+KXFe3qGms3fBuynw1W13X1Wvek+nVF7F0a31BCQbb
	tcpL6+lNYlgonp0H4eiXTWqooVoErdzXyfnUcJPmnsrUVxwc1I0UTQjOjIenk0emJDLnvP+Un0lou
	QBcSncdD7RTw4Hlgau/V4YKNtzDeJM7FlpGUti6womDikuLE35Rwhp4ORa6Per8b+gdlVjUWGDwMm
	i62UVBJRHAhzLrwbQzMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mANp4-00Ehxh-UP; Mon, 02 Aug 2021 02:36:58 +0000
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2] helo=ozlabs.org)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mANoY-00Ehut-Ps; Mon, 02 Aug 2021 02:36:28 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4GdMZP2s0Lz9sT6;
 Mon,  2 Aug 2021 12:36:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1627871780;
 bh=3h+pDmgdaEzjLhKsKsWflOl3eTtWNpO0qlqcc3HN5gw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=a1WosJ0KTXjCRMYjN+wSNFc6ThlMWt6oNtTvbiU08VVh18S12fqbdg7dtDkTBwLa5
 mW8V1Rs4z1BYZuL+pODWPRcD9vbuP8wr01nokBcoTqy49p0SZolAkJwet6ROF0SgEd
 HIz4pn3qWuGGanDbWuW4js0/5hgiIlpoNRE/cyUZxz2eu0jNe7yDYVqAQscP9GPFnE
 qSf68THatsIhId+0A9UWQp8CymuJZBASivoSVD4ldWSNoXSko1yGGp69QbvPTzYUiQ
 G0ZV6Ba/iniZMiL5MNvLUDtAPk+yDPaeM5eVp48+0XyP3sN+LVB9D69GzgsiEom2l/
 2x/ybfb3/4spg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Masahiro Yamada <masahiroy@kernel.org>, Andy Lutomirski
 <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Vincenzo Frascino
 <vincenzo.frascino@arm.com>, linux-kernel@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, Will Deacon <will@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Palmer Dabbelt
 <palmer@dabbelt.com>, Catalin Marinas <catalin.marinas@arm.com>, Benjamin
 Herrenschmidt <benh@kernel.crashing.org>, Guo Ren <guoren@kernel.org>,
 linux-mips@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org, Albert Ou
 <aou@eecs.berkeley.edu>, linuxppc-dev@lists.ozlabs.org, Russell King
 <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, Paul
 Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH v2] arch: vdso: remove if-conditionals of
 $(c-gettimeofday-y)
In-Reply-To: <20210731060020.12913-1-masahiroy@kernel.org>
References: <20210731060020.12913-1-masahiroy@kernel.org>
Date: Mon, 02 Aug 2021 12:36:08 +1000
Message-ID: <87v94ozi7b.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210801_193627_139106_F5C49C16 
X-CRM114-Status: UNSURE (   9.93  )
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

Masahiro Yamada <masahiroy@kernel.org> writes:
> arm, arm64, csky, mips, powerpc always select GENERIC_GETTIMEOFDAY,
> hence $(gettimeofday-y) never becomes empty.
>
> riscv conditionally selects GENERIC_GETTIMEOFDAY when MMU=y && 64BIT=y,
> but arch/riscv/kernel/vdso/vgettimeofday.o is built only under that
> condition. So, you can always define CFLAGS_vgettimeofday.o
>
> Remove all the meaningless conditionals.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
> Changes in v2:
>   - Fix csky as well
>
>  arch/arm/vdso/Makefile              |  4 ----
>  arch/arm64/kernel/vdso/Makefile     |  5 +----
>  arch/arm64/kernel/vdso32/Makefile   |  3 ---
>  arch/csky/kernel/vdso/Makefile      |  4 +---
>  arch/mips/vdso/Makefile             |  2 --
>  arch/powerpc/kernel/vdso32/Makefile | 14 ++++++--------
>  arch/powerpc/kernel/vdso64/Makefile | 14 ++++++--------

I noticed this the other day and was puzzled why we still needed
the conditional, thanks for cleaning it up.

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
