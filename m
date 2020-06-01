Return-Path: <SRS0=95at=7O=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35651C433DF
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  1 Jun 2020 09:04:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09C2F206C3
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  1 Jun 2020 09:04:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GVXf1sIU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="G4MsMH42"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09C2F206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qAz7FdbteggojnYL9vTkQP9imWaLlqymYnH3m/Qusy8=; b=GVXf1sIU/xOBew81vL8suLIdC
	/0Os7LHHC+cr0rl8gMACvfho0DoC5aSXHDPlKMqZl9eX50q71iDqJtDbTGxx/j2mhWfIXPXoJNv7m
	dqsiZEaUPopeZJT0iCs+peUKFCiymGuNJcnvO03xpZWgonhqgrbdSzH89ksy7EN432GMHqoB9U/BU
	Kk9Kq0v5Xaz++yshZemjm1AxnxQsXWvn8Xc8Og1IS6jcsCHJiFoo5DST3yGsX9GdWQIb64rPy9pnR
	9hTgP7OJ8IZf1i6eF2fN7UXkuZtteDOxrX/NbFFg44qfzsjf8jWOYf78bFFMrF2tLiaE3SKgNhz7h
	E8N6cjklQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jfgMX-0005Ch-K8; Mon, 01 Jun 2020 09:04:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfgMT-0005C6-An
 for linux-riscv@lists.infradead.org; Mon, 01 Jun 2020 09:04:03 +0000
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 994BB206C3
 for <linux-riscv@lists.infradead.org>; Mon,  1 Jun 2020 09:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591002240;
 bh=mZoOdPkZk2DZjNiEBBJ1O/bqy4RJwqz6WBO326FTpN0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=G4MsMH42DDGit6Gl8Vjd2CxT8nM3oWx1Vxe6rkMvvJ3CQT+Xvq8TqNG/boesTxR/V
 8mjdJM7Ilj1GzwKDJNl1inYXXVpUqMge3S1JNgE79Bp4BLPn8CI0g2ddlqoNs7Z97D
 /+wC97HLcIwbuPaX/wwyFFPm5XzgnJ5ivC05eQrI=
Received: by mail-lj1-f174.google.com with SMTP id z13so7166606ljn.7
 for <linux-riscv@lists.infradead.org>; Mon, 01 Jun 2020 02:04:00 -0700 (PDT)
X-Gm-Message-State: AOAM532Ium2O77TT/CmsAleTBkSFjhMQAQ0K+uSG13T9T8OoLLgRyQeW
 lRvWEf+GIWPyIMTGeVn3VJ64u14zP/v29FblJFc=
X-Google-Smtp-Source: ABdhPJxH0heF7O0h7klVCXpBPsCHEbZ7tp+mLB6EAx9L0OfYC3vopYfjOHTZky7cAvnqnlkafk0AyihHiaUpokploJ4=
X-Received: by 2002:a2e:a0cc:: with SMTP id f12mr5807926ljm.250.1591002238945; 
 Mon, 01 Jun 2020 02:03:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1590474856.git.greentime.hu@sifive.com>
 <fe966314eae51a5089033f7186ac86c39719e0a0.1590474856.git.greentime.hu@sifive.com>
In-Reply-To: <fe966314eae51a5089033f7186ac86c39719e0a0.1590474856.git.greentime.hu@sifive.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 1 Jun 2020 17:03:47 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQ=S+tbxVOoL3w3DjQ1H0UP6L7F++i-OAcaeY+QNmd=mw@mail.gmail.com>
Message-ID: <CAJF2gTQ=S+tbxVOoL3w3DjQ1H0UP6L7F++i-OAcaeY+QNmd=mw@mail.gmail.com>
Subject: Re: [RFC PATCH v4 05/13] riscv: Add new csr defines related to vector
 extension
To: Greentime Hu <greentime.hu@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200601_020401_421470_CAD9D1C3 
X-CRM114-Status: GOOD (  13.54  )
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
Cc: Guo Ren <guoren@linux.alibaba.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Oleg Nesterov <oleg@redhat.com>, Vincent Chen <vincent.chen@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Since it has been redesigned with new version spec, please change the
first-author :)

And add me as Co-developed.

On Tue, May 26, 2020 at 3:03 PM Greentime Hu <greentime.hu@sifive.com> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> Follow the riscv vector spec to add new csr number.
>
> [greentime.hu@sifive.com: update the defined value based on new spec and
> remove unused ones]
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> ---
>  arch/riscv/include/asm/csr.h | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index 8e18d2c64399..cc13626c4bbe 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -24,6 +24,12 @@
>  #define SR_FS_CLEAN    _AC(0x00004000, UL)
>  #define SR_FS_DIRTY    _AC(0x00006000, UL)
>
> +#define SR_VS           _AC(0x00000600, UL) /* Vector Status */
> +#define SR_VS_OFF       _AC(0x00000000, UL)
> +#define SR_VS_INITIAL   _AC(0x00000200, UL)
> +#define SR_VS_CLEAN     _AC(0x00000400, UL)
> +#define SR_VS_DIRTY     _AC(0x00000600, UL)
> +
>  #define SR_XS          _AC(0x00018000, UL) /* Extension Status */
>  #define SR_XS_OFF      _AC(0x00000000, UL)
>  #define SR_XS_INITIAL  _AC(0x00008000, UL)
> @@ -31,9 +37,9 @@
>  #define SR_XS_DIRTY    _AC(0x00018000, UL)
>
>  #ifndef CONFIG_64BIT
> -#define SR_SD          _AC(0x80000000, UL) /* FS/XS dirty */
> +#define SR_SD          _AC(0x80000000, UL) /* FS/VS/XS dirty */
>  #else
> -#define SR_SD          _AC(0x8000000000000000, UL) /* FS/XS dirty */
> +#define SR_SD          _AC(0x8000000000000000, UL) /* FS/VS/XS dirty */
>  #endif
>
>  /* SATP flags */
> @@ -114,6 +120,12 @@
>  #define CSR_PMPADDR0           0x3b0
>  #define CSR_MHARTID            0xf14
>
> +#define CSR_VSTART             0x8
> +#define CSR_VCSR               0xf
> +#define CSR_VL                 0xc20
> +#define CSR_VTYPE              0xc21
> +#define CSR_VLENB              0xc22
> +
>  #ifdef CONFIG_RISCV_M_MODE
>  # define CSR_STATUS    CSR_MSTATUS
>  # define CSR_IE                CSR_MIE
> --
> 2.26.2
>
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

