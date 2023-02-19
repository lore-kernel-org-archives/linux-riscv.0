Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD0BDC636CC
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Feb 2023 21:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=alu2FmRPPqU38kxMLU4Sn8CgemcAnZnh1j7GJZKVA+E=; b=GXRdRJqdf70Xke
	MKL1/QKIYzAzAX/vVqvAeLfTSRj4qJTeNRZ7pdKXiPtxZm6S/ddXhVOCgv5WSd4I5WBhgpeIwjV+j
	fqTCx6PVhkPwAJuN7+vrWHo7VvTWLTSrK09PhrMa2tDKO/z5HUyIqt/wY2XWSeVXUmn+IBScGjsHs
	4Q3tpXDQJy+BBaOkrKv0JK3nnfY4frLnfvVTeyIFk3X5ieOB67uj58epYJ29Z7QIrHoPuvQO3CoxC
	Sqxcgil4pew0RBEGZDTOfF1PKI9TjKaIIlrQlptBIIfr2/jf/z3QNL4QnseD4DMUiiaHOXD7m4kXu
	H6Y5819Uw9aXLOpJ1uqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTrJ7-002Kw1-CZ; Sun, 19 Feb 2023 21:33:17 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTrJ3-002Kv2-9a
	for linux-riscv@lists.infradead.org; Sun, 19 Feb 2023 21:33:15 +0000
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 3F34C3F720
	for <linux-riscv@lists.infradead.org>; Sun, 19 Feb 2023 21:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1676842391;
	bh=8R8frgxkiDD95gIO0fe6fOdEBdEu/5r0X1kDOciAmuU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=PfenvKkMGeDkOenyAHNlK2lSLmgW+fQd0bd8pgUBXhAHitI9Jw9s3/AgsvjBRz0j5
	 EjsRYUjU7Y80IJBM+DnmzV/kXhCHtqNkNYTyseOqJguSCQYJVf+PRK6OiIEkz/RvIq
	 CB4hW/aYqOPlBaEcA7T6/chiK7DOHW+VRjjTts2QdCcokWKUdVe7CJ+1xOL9MPrdNF
	 6SbDZyk28sAlJyXS8ck+f85zpHC5yLkg7Jbs6cSBsUrMNKEbkFWYmWazifVoWLnNnT
	 cGeuE7O8r4P6LArIqisdTJxQTvc4cb5FvBxzNbrupVVXxz9zhtSFe92t+X1ZRm6qPx
	 x8b0elCdM9JJA==
Received: by mail-lj1-f199.google.com with SMTP id j3-20020a2ea903000000b002945cfdc512so389934ljq.20
        for <linux-riscv@lists.infradead.org>; Sun, 19 Feb 2023 13:33:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8R8frgxkiDD95gIO0fe6fOdEBdEu/5r0X1kDOciAmuU=;
        b=3cY/JDfNSnpelWtkLtgn8eMGPokXTxNdyLem+WX8OOihC7pOsU+ekuYYbV2Si2gddC
         a15B2hC0q3mELvJPUWaFVbCw/+52d7c2fmalAulTNzvvwQy2EmYp1sFbu3BvmwLpOYup
         QUsBw21JAx76BH4qYAjkcgSlAQxxHrTU0HPMHsZkUN1yLrdBzn6IPyF+kOaj4YINl4Jz
         mEzmi5f8vxr17Ofei8lCvxTjceLW9dxMblNbJMU1YWcZfmIPXQYrT3wwe6wne4/XpC6o
         2IDvKGfhGN98qA8ehKoMOvBVhKh+PHhNw0C7HESDXc5FLpbs2eQZ+nlVNI8Xp9UcWCe9
         2zbQ==
X-Gm-Message-State: AO0yUKUe30POjN1veG0mKW4lJcKaWewMH1q1w7NpmEBM9zouVX/qOwYn
	Ya+MT/rmKaSIStf2Yp8AuE5VOn279YwOh7auhahyXqMFHHe1wP3ZRsX8W+zPGVu3veIvmAdyo62
	OWVuztTQ2cOGvFc59bEPZCl/62M6RtnUBbx51sCmtPoOIiOxS96imMXk/nDCy+A==
X-Received: by 2002:ac2:43dc:0:b0:4db:1aa4:fe08 with SMTP id u28-20020ac243dc000000b004db1aa4fe08mr25274lfl.1.1676842389569;
        Sun, 19 Feb 2023 13:33:09 -0800 (PST)
X-Google-Smtp-Source: AK7set/jqCxE7vysa+nLkM379Amt8o48UAX1vdCWM3PBOuY188t0gNT9otYGX3LH6uHIPrqc4/KhbzdCFeHafmAK5zQ=
X-Received: by 2002:ac2:43dc:0:b0:4db:1aa4:fe08 with SMTP id
 u28-20020ac243dc000000b004db1aa4fe08mr25246lfl.1.1676842389272; Sun, 19 Feb
 2023 13:33:09 -0800 (PST)
MIME-Version: 1.0
References: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
 <20230211031821.976408-5-cristian.ciocaltea@collabora.com> <Y+567t+kDjZI+fbo@spud>
In-Reply-To: <Y+567t+kDjZI+fbo@spud>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Sun, 19 Feb 2023 22:32:52 +0100
Message-ID: <CAJM55Z_poY3dVu9fQ1W1VQw3V=8VdVKc1+qUcdHduM1aAveJUQ@mail.gmail.com>
Subject: Re: [PATCH 04/12] soc: sifive: ccache: Add non-coherent DMA handling
To: Conor Dooley <conor@kernel.org>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Lee Jones <lee@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Richard Cochran <richardcochran@gmail.com>, Sagar Kadam <sagar.kadam@sifive.com>, 
	Yanhong Wang <yanhong.wang@starfivetech.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
	daire.mcnamara@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230219_133313_902745_D93EF7ED 
X-CRM114-Status: GOOD (  18.97  )
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

On Thu, 16 Feb 2023 at 19:51, Conor Dooley <conor@kernel.org> wrote:
>
> Emil,
>
> +CC Daire
>
> On Sat, Feb 11, 2023 at 05:18:13AM +0200, Cristian Ciocaltea wrote:
> > From: Emil Renner Berthing <kernel@esmil.dk>
> >
> > Add functions to flush the caches and handle non-coherent DMA.
> >
> > Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> > [replace <asm/cacheflush.h> with <linux/cacheflush.h>]
> > Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> > ---
>
> > +void *sifive_ccache_set_uncached(void *addr, size_t size)
> > +{
> > +     phys_addr_t phys_addr = __pa(addr) + uncached_offset;
> > +     void *mem_base;
> > +
> > +     mem_base = memremap(phys_addr, size, MEMREMAP_WT);
> > +     if (!mem_base) {
> > +             pr_err("%s memremap failed for addr %p\n", __func__, addr);
> > +             return ERR_PTR(-EINVAL);
> > +     }
> > +
> > +     return mem_base;
> > +}
>
> The rest of this I either get b/c we did it, or will become moot so I
> amn't worried about it, but can you please explain this, in particular
> the memremap that you're doing here?

No, I can't really. As we talked about it's also based on a prototype
by Atish. I'm sure you know that the general idea is that we want to
return a pointer that accesses the same physical memory, but through
the uncached alias. I can't tell you exactly why it's done this way
though, sorry.

/Emil

> Cheers,
> Conor.
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
