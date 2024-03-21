Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D354BC54E58
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Mar 2024 15:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0gFdWQruo0+vActW9Iw8BQXyqddjEGapqeLwdRHYqeo=; b=WW5kLtLAWibM0C
	+kiX5g6yIwusaHbf1ejWyYWnr1DMT/kHZbIO873tHzx04iDJlFp8jlAzhWnSD68ErKGDC0O8v1iIe
	dZpTK3xQs0OrOjTkTLqpGORkC8QuQ99OBCKR/3z0pot7Vb4rPDQBPHS0yawmVk1Bgr+xBoWuHYfzb
	RaLdjt/wF1hFw08iaXQoGi1xTGDVWXBRV74ctgmMyLM9KPYPtKV/JFzTAuKukJHcBPxPxfQun8JaC
	0a5K3Dgbs6X90xi/xjkPwUGXlvRKeb/D6j4s5kBsYVl1WeLRGVde1FsM2R3AENVlA0WaMAJ1+sGjS
	CG8xj7KUloA+KO7KthSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnKZl-00000003aim-0qFN;
	Thu, 21 Mar 2024 15:43:29 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnKZh-00000003afy-2xpx
	for linux-riscv@lists.infradead.org;
	Thu, 21 Mar 2024 15:43:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B14B6CE1177;
	Thu, 21 Mar 2024 15:43:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54983C433C7;
	Thu, 21 Mar 2024 15:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711035802;
	bh=hcmA9gs9RYuhDOaFn/YqNZim89/qCEQpQfnOASTguRg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Axc3UfCIVerTSzM8Sea19oDrCGHiFljkZORppz0uVtVkmLjYoJjaexWPMcRKVClei
	 L91oxSGZWnupsGwInl73sIPTAU9wot+ItcyodvKGj/hR1dVdz5sCgi8cutVoF7wLfW
	 CB47sgVpikJznDVYJrzSMdGgrvsT4We85YIT+AZV3gzthqfS4L37CTQ9IP3++gnHir
	 Yb8kuUp0fW10OsFAVzeklzo3Mksuq5aOOB+2NFSTsWsRsdVPHnfVZ9haetAa9X+GOq
	 uZuPNbLSIma+bq7apYw9cILpvi46N+hm0MMcHyCxLIKneymKh+5Kb1JjKsltIwYLHl
	 BUgjLfx3KIRyw==
Date: Thu, 21 Mar 2024 08:43:20 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Matt Coster <Matt.Coster@imgtec.com>
Cc: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
	Karolis Mituzas <Karolis.Mituzas@imgtec.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Carlos de Paula <me@carlosedp.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] scripts/package: buildtar: Output as vmlinuz for riscv
Message-ID: <20240321154320.GA616931@dev-arch.thelio-3990X>
References: <4edd1c5e-aacb-4513-97ae-e6b2130476fc@imgtec.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4edd1c5e-aacb-4513-97ae-e6b2130476fc@imgtec.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_084325_968009_4234F9A1 
X-CRM114-Status: GOOD (  14.85  )
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

On Thu, Mar 21, 2024 at 11:58:51AM +0000, Matt Coster wrote:
> From: Karolis Mituzas <karolis.mituzas@imgtec.com>
> 
> This matches the behavior for arm64 [1] and prevents clobbering of
> vmlinux-${KERNELRELEASE}.
> 
> [1]: commit 0df57d90bfd6 ("kbuild: buildtar: add arm64 support")
> 
> Fixes: 7d0bc44bd0ea ("kbuild: buildtar: add riscv support")
> Signed-off-by: Karolis Mituzas <karolis.mituzas@imgtec.com>
> Signed-off-by: Matt Coster <matt.coster@imgtec.com>
> ---
>  scripts/package/buildtar | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/package/buildtar b/scripts/package/buildtar
> index 72c91a1b832f..a36aca2a27cc 100755
> --- a/scripts/package/buildtar
> +++ b/scripts/package/buildtar
> @@ -96,7 +96,7 @@ case "${ARCH}" in
>  	riscv)
>  		for i in Image.bz2 Image.gz Image; do

This patch seems fine but it does introduce a slight inconsistency with
the rest of this script, as vmlinuz implies a compressed boot image but
Image is not compressed. Probably does not really matter but I feel like
it is worth mentioning.

>  			if [ -f "${objtree}/arch/riscv/boot/${i}" ] ; then
> -				cp -v -- "${objtree}/arch/riscv/boot/${i}" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}"
> +				cp -v -- "${objtree}/arch/riscv/boot/${i}" "${tmpdir}/boot/vmlinuz-${KERNELRELEASE}"
>  				break
>  			fi
>  		done
> -- 
> 2.44.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
