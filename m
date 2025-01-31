Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CDCEC02190
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Jan 2025 03:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sTr/3slRT3ZIFcdmKKoE/wfu8WCyTgtFWF0X195zJEQ=; b=KSAYEHH+lMPy/g
	Ph4mRoQNGvU2JXBOKYMxNFLxtrDSfjOhhdPUlmo9WornQx9TOGWHwqJhv6OT0xutZ4uy7YxKgL9DK
	R7TDlekYIHPrhgy8bLEv0bb3wFMncn9Hm0TA2S0JvRNswk4QzfI7bKhpJhW/DoHP+vVYCh6v+C5ax
	G/vcH6C9mEQ3FUW+nMVHzPsh5Iix2dX50LXPC6gyvbo1vdcKk3eEk4YmPRLV0GJZ+SkKE/7ePOe1O
	+1c+xSM3kY6l8fZ6ovTeVXYw7aYEZEFy+RSWRXCCqqXpiXd0Xll5cq2ZaGMLZpj/71jRBBJk3p90g
	h35wjt1GYd4vohXzJS2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdi5Z-00000009yWo-1Qbo;
	Fri, 31 Jan 2025 03:53:05 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdi5M-00000009yU8-0ogX
	for linux-riscv@lists.infradead.org;
	Fri, 31 Jan 2025 03:52:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 84A21A40395;
	Fri, 31 Jan 2025 03:51:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2514C4CED1;
	Fri, 31 Jan 2025 03:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738295570;
	bh=njGK8iN76Oh6efZ3eYndONqjWO4nZts2aTh5Qwm06q8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VrcwTeejcr447esdjqdHAx+u0A096YrEtae4pPOXUX6v/4HlcjMMuhlgf08XkFwfq
	 /SB6sLEReFfHqWgtzhzqtHGqS+n+h5mJGj3pGaghrIoqBWXxoMZKpHmNuwU/ANs7Fc
	 RY+NplL3jeitTomUjc/cn7n7lQRbJBB6F5/pwZMiKtB8d/G2smmsf5eCOxfnGclwx0
	 oNg2JdNNSjIid5OJnKjujl+ABhvagUCm50SKMgZm2cI1meugqP+47T+STlmoFmMHZk
	 DIYnUFzTqQlm9XMoDa6PmiIzanShM/BG94Anw8xP0ILOapPlplA2Ifmd0+xP6TRNHs
	 +VDRhuJZK0FPw==
Date: Thu, 30 Jan 2025 20:52:45 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] kbuild: Use --strip-unneeded with INSTALL_MOD_STRIP
Message-ID: <20250131035245.GA47826@ax162>
References: <20250122-strip_unneeded-v1-1-ac29a726cb41@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250122-strip_unneeded-v1-1-ac29a726cb41@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_195252_307496_4AADA5CE 
X-CRM114-Status: GOOD (  18.68  )
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

On Wed, Jan 22, 2025 at 07:17:26PM -0800, Charlie Jenkins wrote:
> On riscv, kernel modules end up with a significant number of local
> symbols. This becomes apparent when compiling modules with debug symbols
> enabled. Using amdgpu.ko as an example of a large module, on riscv the
> size is 754MB (no stripping), 53MB (--strip-debug), and 21MB
> (--strip-unneeded). ON x86, amdgpu.ko is 482MB (no stripping), 21MB
> (--strip-debug), and 20MB (--strip-unneeded).
> 
> Use --strip-unneeded instead of --strip-debug to strip modules so
> decrease the size of the resulting modules. This is particularly
> relevant for riscv, but also marginally aids other architectures.
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>

Is there any sort of regression risk with this patch? If so, another
option may be to give another level to INSTALL_MOD_STRIP like 2 so that
INSTALL_MOD_STRIP=1 continues to behave as before but people can easily
opt into this option. No strong opinion because I am not sure but was
not sure if it was considered.

Regardless:

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  scripts/Makefile.modinst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
> index f97c9926ed31b2b14601ff7773a2ea48b225628b..c22f35f6b9db3cac3923b9e787b219f752570642 100644
> --- a/scripts/Makefile.modinst
> +++ b/scripts/Makefile.modinst
> @@ -80,7 +80,7 @@ quiet_cmd_install = INSTALL $@
>  ifdef INSTALL_MOD_STRIP
>  
>  ifeq ($(INSTALL_MOD_STRIP),1)
> -strip-option := --strip-debug
> +strip-option := --strip-unneeded
>  else
>  strip-option := $(INSTALL_MOD_STRIP)
>  endif
> 
> ---
> base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
> change-id: 20250122-strip_unneeded-cab729310056
> -- 
> - Charlie
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
