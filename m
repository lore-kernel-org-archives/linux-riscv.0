Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05DCBC369AB
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Apr 2025 03:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9r92S0a/XsK8iEETYxmDlMfiCq/MQYrTnRu4ysof/nw=; b=VgMgHOuJs6jB8P
	t8/9coepsxNBw8eYOxb3jzErk47PfAa/+j9TNLPHLmZ3e6jtnh0aguWy9y+YThdY8rvwLq/4bmZO0
	l6JW8suAEmDoon2W9d5XSEXeCm9FABGJn+RmNYmEb1FeeFskxWjaxk6mzuy839P9TV+xOeCyx1w6N
	dB8fCKnWMJgcpO+UJUJKenX32n+5ZMZsIboSViKwrFfA+ixx9E4qI+XhQYqumq335CrjiOox5Cy9p
	EGTbj0zFi9ZwHfdYWQkrUDwjPfSDyEArfcP28r8fEx0OqCYKE9ylCDkaTUF60ks4AWtY/wkMpJKTb
	DUTMOQYPwalfys6edMQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5caa-0000000F00s-3toY;
	Fri, 18 Apr 2025 03:40:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5cYj-0000000EzhN-2uq3;
	Fri, 18 Apr 2025 03:38:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2542E61120;
	Fri, 18 Apr 2025 03:38:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DC94C4CEE2;
	Fri, 18 Apr 2025 03:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744947512;
	bh=JIccxkbUkJv2mhfcvak7GTlHD8kRGQhmDGq2CC/2MlI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YbV/7d47vHOJChB47qhZmb0CfoN/a3qx2MFQWBgheSbIGzLw0f2MlJ5Ku660xMDdN
	 T4loJYW/hWRNd0mew7guTwfHnu2tM8xDIubGn1ERQsyKxMx5ar2zFZUJ2Lrwbz6r98
	 yNZwbC1RlV+RdXfe82WOaIXpLWfmd2tlKB3jl32SbbQuj8P+fcZHE8UE6qTKi/BRn7
	 rRIzvkx8PAQGfQK9vD+DANxt4gQtM8rY6YozQ2Af70zxW9lO+cSmZlU7C5/oCMGSPk
	 yR8h1YTR/Hx45pr9O8JqluF6gUxSJfqBiXPtG8LY8J46QrYMhVbT8pMdKsD5QHusBf
	 izokyk+75mmyA==
Date: Thu, 17 Apr 2025 20:38:29 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, x86@kernel.org, ardb@kernel.org,
	Jason@zx2c4.com, torvalds@linux-foundation.org
Subject: Re: [PATCH 8/9] crypto: x86/chacha - remove the skcipher algorithms
Message-ID: <20250418033829.GC38960@quark.localdomain>
References: <20250405182609.404216-9-ebiggers@kernel.org>
 <aAHF0X2I5ydEJK1p@gondor.apana.org.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aAHF0X2I5ydEJK1p@gondor.apana.org.au>
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

On Fri, Apr 18, 2025 at 11:24:01AM +0800, Herbert Xu wrote:
> Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > -static void __exit chacha_simd_mod_fini(void)
> > -{
> > -       if (IS_REACHABLE(CONFIG_CRYPTO_SKCIPHER) && boot_cpu_has(X86_FEATURE_SSSE3))
> > -               crypto_unregister_skciphers(algs, ARRAY_SIZE(algs));
> > -}
> > -
> > arch_initcall(chacha_simd_mod_init);
> > -module_exit(chacha_simd_mod_fini);
> 
> Why did you remove the ability to remove the module?
> 

Well, I forgot that an empty module_exit needs to be kept around for the module
to be removable.  I'll send a patch that adds these back in, though I'm doubtful
that anyone ever removes these modules in practice.

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
