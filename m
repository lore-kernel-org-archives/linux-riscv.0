Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6AFCC5B552
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jun 2025 04:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fFHecqloBfKnjQ5AQlLQe+WNjCGXKIRQjb/2tDXlWW0=; b=t4av0K3F2AbgGQ
	bzl/X4zqraYz0qSyE07ispRDUX5pT2birz/E+pQKuo1/HKcyY1yDyoJBry8rOXzNY+ctgAxC305qB
	/5+PeOjhG/fQdWnDUr9PtY5AzW7EGlGQNwkBP+dk539JUsVG9Yi7eHJfMvignFUXwLjzIaP8Uzfv4
	3l2f7EWNPWLB/JJ6a0ibxIfQlnOAbbsFeBlPSq5CLv9FID3TiFyDt58nCzRqUnSyqGTsoSLLWEsQe
	dO6R9Umo6p1uwt97rLYtpZ/iaX5/5GCSuhpio9ZTX2cgTvWSFso+xvZOVBkpeqtVEy62FFfoOizDZ
	PQ2leeNh7fvCyycuc60A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOU83-00000003Otw-0y7f;
	Mon, 09 Jun 2025 04:28:59 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOU7z-00000003OtY-1WAd
	for linux-riscv@lists.infradead.org;
	Mon, 09 Jun 2025 04:28:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=AOtVxphg4n/ibYwLF+8lXDVsTdzzSnwNRh8d8Sl3NLA=; b=OzKwavf5shxn9SAjjh5HHd6wYq
	4+kEa7j1HYwsKQjJjmE/hhTlxn2T0+1zpSfGZWjwLJXBu5bwQkoBPaPGyU+kQmbZvCHnr/zDdpTnb
	3+9C1Q6VzxW6VxlhD43zhvT1zZrIMyb5Pqc2vgIYxwRc2thVGJWq4gnd94tAVn/4MvX+wBaW1LEmo
	xbawOco0tQ3nbFcbU14V6VEXp4iBq8IJ5NjEc3Vw4gG5wtB8ZApBgaxrFrwhVtGsN5nwMZsJQdH6s
	NSJXEtnw88AAMPVWa4lG8cj4flA/cTo2nFDSnN+gZJvH8L7bmsRh4yaFmI+8NGwfrk9U3v19tK360
	vlVSAK4w==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uOU7q-00BiVO-2Q;
	Mon, 09 Jun 2025 12:28:47 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 09 Jun 2025 12:28:46 +0800
Date: Mon, 9 Jun 2025 12:28:46 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: zhihang.shao.iscas@gmail.com
Cc: linux-crypto@vger.kernel.org, linux-riscv@lists.infradead.org,
	paul.walmsley@sifive.com, ou@eecs.berkeley.edu, alex@ghiti.fr,
	appro@cryptogams.org, zhang.lyra@gmail.com
Subject: Re: [PATCH v2] crypto: riscv/poly1305 - import OpenSSL/CRYPTOGAMS
 implementation
Message-ID: <aEZi_pADmu263g43@gondor.apana.org.au>
References: <20250608133118.162935-1-zhihang.shao.iscas@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250608133118.162935-1-zhihang.shao.iscas@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_212855_402259_C57F4BBC 
X-CRM114-Status: UNSURE (   7.12  )
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

On Sun, Jun 08, 2025 at 09:31:18PM +0800, zhihang.shao.iscas@gmail.com wrote:
>
> +static int __init riscv_poly1305_mod_init(void)
> +{
> +	return 0;
> +}
> +subsys_initcall(riscv_poly1305_mod_init);
> +
> +static void __exit riscv_poly1305_mod_exit(void)
> +{
> +}
> +module_exit(riscv_poly1305_mod_exit);

Please remove these functions.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
