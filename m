Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C2C7C6FA82
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Sep 2022 09:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eNj58uhBmXIkBM/1tIyIguEJ74EJ5nt/HP4VjRzFx5w=; b=g0avqYgOWHsDOw
	XMZRxEQch0FqdnWie2I+omJXrjX/O5KC7Tru/7rL2gXqvRcw1MxPZONWA2usyiiHrqtpsOASIQVI3
	NkwjhtFpWz8xBAR8F1n4FSm0UgQ4T+wvjPIRaAp/AZZqQkAbd78h4g4TrAkssPDQkY2ZjtftYK9Y7
	8tUesammFeUvwbftcN8QTXhuc17u5CITkww4vMmUrkMZNAj5A7ussp1XezBlYBNLbz8P0ADhtwhun
	3xqwlqx5fg7u6z4hq1rx9nO2aAkQNLjk+/jigY+lZQUm5j6WGdRCx0dhPZj4dz0WW6rHQ7EqSNhAr
	W+y0odX1A+02GXcVgGjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocONM-00CWqU-VR; Sun, 25 Sep 2022 09:56:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocONK-00CWpC-GT
	for linux-riscv@lists.infradead.org; Sun, 25 Sep 2022 09:56:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4AC0E60A6D;
	Sun, 25 Sep 2022 09:56:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8342FC433C1;
	Sun, 25 Sep 2022 09:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664099795;
	bh=m5ZvaOY1yNIGujLkDMj9U05VMTl6/h4zxsF9bxZObFU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dcJrbxOjw+FvjJN38b1OZUgznru2uPnxI+odurUM8zH73fiXkSauXV+aIi5jviBAE
	 bsbcrtKuVJS0M6+ZEx3C8zVwPfQXWv3mJkcpls3Fg1vtzJBVgUIcUGp+VqCQxtemaa
	 4mFDd1qQTQWoU0A2nelVn72rRlji1N62P3Usnr2uu9SFWkmVKplZN6HWUh6qvfdi0o
	 ZqSaDyeKEU7OBr/UxojjAyDIcn8UtmgoG7TGQdJbV0vcVi2e0YMJTi8vEZCgAergcc
	 zhjmMpmYJ2mBTRvwKmzv4gn+Or1IGzrsuZfjLxpt2B4P7fH8cnRpcyBPj9wBi2vR0D
	 yR7b9bXQQLOkg==
Date: Sun, 25 Sep 2022 10:56:31 +0100
From: Conor Dooley <conor@kernel.org>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] riscv/vdso: typo therefor
Message-ID: <YzAlz6BJhNC5fX/Y@spud>
References: <20220925004757.9089-1-heinrich.schuchardt@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220925004757.9089-1-heinrich.schuchardt@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220925_025638_604775_1E6E9DBF 
X-CRM114-Status: GOOD (  18.11  )
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

On Sun, Sep 25, 2022 at 02:47:57AM +0200, Heinrich Schuchardt wrote:
> The adverbs 'therefor' and 'therefore' have different meaning.
> As the meaning here is 'consequently' the spelling should be 'therefore'.

Heh, had to go look that one up!
https://www.grammarly.com/blog/therefore-vs-therefor/

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> 
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> ---
>  arch/riscv/include/asm/vdso.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/vdso.h b/arch/riscv/include/asm/vdso.h
> index af981426fe0f..a7644f46d0e5 100644
> --- a/arch/riscv/include/asm/vdso.h
> +++ b/arch/riscv/include/asm/vdso.h
> @@ -10,7 +10,7 @@
>  
>  /*
>   * All systems with an MMU have a VDSO, but systems without an MMU don't
> - * support shared libraries and therefor don't have one.
> + * support shared libraries and therefore don't have one.
>   */
>  #ifdef CONFIG_MMU
>  
> -- 
> 2.37.2
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
