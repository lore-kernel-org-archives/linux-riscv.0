Return-Path: <SRS0=5I1x=EZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9C6EC388F9
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2020 09:29:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 292D32468D
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2020 09:29:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CeQTof1o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 292D32468D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sf-tec.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aVBb2vRrTvp0UaL8kiuE72kkuwOhKGcKnCK3yIZdOfA=; b=CeQTof1oo5URX7ZXpq9NbxHDO
	oMyz4T3FriawQ5S7q30U0GFJMz8nA/7hM7aBNVx4ZgEjfyrWr83IDX1H21nhOSfk5Gg4O1eoyWRRi
	Fg2Ws/sX2slSPfUzYg7tgvEUC1kQ0jog/6GTNyBpvhS8cGr0cbQ44cNYYuY3NtQN6QjSj7Grm94+k
	MuVbozlW8CsU7boTai/D7C0+gAC9bf0frB2SZLtqGSiywEXWrsXCPwBYMTcA9fT5eM90p2vvS49kW
	8NRzWVtVqvpKI5hTxMo3k8zyJmIbCDBxUVDvIBRB83z9xPdAi09a5WwXnwapZ4ijLc+aviGSvseTo
	3rlWvChlQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfgG0-0007OV-Ds; Thu, 19 Nov 2020 09:29:37 +0000
Received: from mail.sf-mail.de ([2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfgFo-0007Ka-0o
 for linux-riscv@lists.infradead.org; Thu, 19 Nov 2020 09:29:27 +0000
Received: (qmail 21243 invoked from network); 19 Nov 2020 09:21:15 -0000
Received: from mail.sf-mail.de ([2a01:4f8:1c17:6fae:616d:6c69:616d:6c69]:57158
 HELO webmail.sf-mail.de) (auth=eike@sf-mail.de)
 by mail.sf-mail.de (Qsmtpd 0.37dev) with (TLS_AES_256_GCM_SHA384 encrypted)
 ESMTPSA for <alex_y_xu@yahoo.ca>; Thu, 19 Nov 2020 10:21:15 +0100
MIME-Version: 1.0
Date: Thu, 19 Nov 2020 10:21:12 +0100
From: Rolf Eike Beer <eike-kernel@sf-tec.de>
To: "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
Subject: Re: [RFC PATCH] treewide: remove bzip2 compression support
In-Reply-To: <20201117223253.65920-1-alex_y_xu@yahoo.ca>
References: <20201117223253.65920-1-alex_y_xu.ref@yahoo.ca>
 <20201117223253.65920-1-alex_y_xu@yahoo.ca>
User-Agent: Roundcube Webmail/1.4.8
Message-ID: <a9a7fc22ea6fb6bdeb3274fe05a7f0d9@sf-tec.de>
X-Sender: eike-kernel@sf-tec.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_042924_350611_B9308FB2 
X-CRM114-Status: GOOD (  13.49  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-s390@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-kbuild@vger.kernel.org,
 torvalds@linux-foundation.org, linux-xtensa@linux-xtensa.org,
 linux-sh@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, openrisc@lists.librecores.org,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Am 2020-11-17 23:32, schrieb Alex Xu (Hello71):
> bzip2 is either slower or larger than every other supported algorithm,
> according to benchmarks at [0]. It is far slower to decompress than any
> other algorithm, and still larger than lzma, xz, and zstd.

> 
> diff --git a/Documentation/x86/boot.rst b/Documentation/x86/boot.rst
> index abb9fc164657..b74d14caabe6 100644
> --- a/Documentation/x86/boot.rst
> +++ b/Documentation/x86/boot.rst
> @@ -781,10 +781,10 @@ Protocol:	2.08+
>    The payload may be compressed. The format of both the compressed and
>    uncompressed data should be determined using the standard magic
>    numbers.  The currently supported compression formats are gzip
> -  (magic numbers 1F 8B or 1F 9E), bzip2 (magic number 42 5A), LZMA
> -  (magic number 5D 00), XZ (magic number FD 37), LZ4 (magic number
> -  02 21) and ZSTD (magic number 28 B5). The uncompressed payload is
> -  currently always ELF (magic number 7F 45 4C 46).
> +  (magic numbers 1F 8B or 1F 9E), LZMA (magic number 5D 00), XZ (magic
> +  number FD 37), LZ4 (magic number 02 21) and ZSTD (magic number 28
> +  B5). The uncompressed payload is currently always ELF (magic number
> +  7F 45 4C 46).
> 
>  ============	==============
>  Field name:	payload_length
> diff --git a/arch/arm/configs/aspeed_g4_defconfig
> b/arch/arm/configs/aspeed_g4_defconfig
> index 58d293b63581..f2f5dcd0e59c 100644

I would keep the magic number, and just tell that it is not supported by 
newer kernels anymore if at all. It's just handy to be able to look into 
the most recent documentation and see what the values are for. If you 
look at an older image and don't find the magic number my first impulse 
would not be to look at older versions of the documentation for things 
that were removed.

Maybe something like:

"Formerly supported was also bzip2 (magic number 42 5A)."

Eike

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
