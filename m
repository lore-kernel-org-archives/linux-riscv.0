Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A5ACCDB465
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 17:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p6X9j5aB2MfaqKe7q8+neTzjwoP3B0VJEG8Qx+MjUl4=; b=1xeKUO0fj/cy/h
	F1m/iVXHYOD0aDaVFdSKNgS24izUDZjPU/5tS0UI51D+dY7V4HWXOzZR2SE9NUyif5KCfIUfKE7y6
	Mh/AVkJS4l4PW1dZix5OKUZxU8ZJJJt+3ZNtHoYxu0XCy7+HrF4Xu0w39aXV++Xt1cKUqWVBn5Glz
	5kDUe7vHcB5pwEmD1tBPQadLeJQowXWzsC2Uv0GRMllh3Zp0KU/HZwdY917GMUNF1G9XIP30WBg24
	DRottDbSO6eKQG5+fFThGsTDhnIkjaW1RjcSEzbviWXVcme/jutvLaSSJaFn7hKGiMT32gd3x98SQ
	5IFv2/US2V6t9PLZ2+gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsR75-00ADHw-1i;
	Mon, 16 Oct 2023 17:10:43 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsR71-00ADHE-1i
	for linux-riscv@lists.infradead.org;
	Mon, 16 Oct 2023 17:10:42 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-692d2e8c003so4377839b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 16 Oct 2023 10:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697476237; x=1698081037; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dEgoT4wnSbfKqiobyL8tOMupICht6HOuE8CfHQmqQMc=;
        b=m6pt5M2ipaeZmeBnPEdbLAbLkK3jup5Vt7oP6sIVwEP8iaZZhgxtVDCDcsMzMoWbi8
         jITO4pN8yn72AQ7YyO9SYq5okIt4KI+a3hJ6dEGQcCk5aHqsAkUNRpE0rzRO1l7KmaEH
         /uDuCekjKqkeCo51k5wsEBhcDfY7DV8dL9SK6Ir1lHiToS/plthk9bNbQ9pz+6N5GWnp
         7BAQdPHuYV194DfumTjOTYx2n49JxLyBPzvFayvQ0apQLX8UmkxqdJX1l2dl4J1YO2iO
         uChthIXdgtzacjwp1efMWIf9QDqporqYDe3del0trOoIqda+fLndIkJ5f2c1zwWaGxCj
         kz2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697476237; x=1698081037;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dEgoT4wnSbfKqiobyL8tOMupICht6HOuE8CfHQmqQMc=;
        b=f7OlnSX+l+BJ3ebtr1bggpquUf2MsshZU/wRqQwVNw64+Sv28gGI/yJ3LUUg3KB+6G
         +NI15SXaiwoDwaxX5fYysyIDyzJUYHuyoZQZfBDtQxNEsdmLDwCfpvTP1myMdXiLBf+D
         2bTnjC1wHzbPN+3t8gf24RLtl2qwKa9u5fBEJwpINIfWWkqvR3DRyKI8my93xBZWfAhQ
         8hf8ucAmWxwH18z5pCVAzsyfdfx+VM2yaRzQuKxIQfWpVDDax9cxjhwbISyHKI7G1vYY
         YVKKhxDjJtPHHaX5DJ3FQoRcySiK1wruFhg+ipIYNhpx5b5Y4y0QHn7RZKwTR1BPzEVD
         45Pw==
X-Gm-Message-State: AOJu0Yx7j78KXEZiQjjnyWSLltAIku3Syvn4WOkAvFUJK9YlA+B3TOBc
	1Okl10sGZVW7/HA6v5Oz/HxN8Q==
X-Google-Smtp-Source: AGHT+IGguDhVITJIvhBzWf+6Op1xFKO1SJ/TmEkeSW6nK5Opr8475dRlcc4zfVYS/Ev4Bc6d7YnIDA==
X-Received: by 2002:a05:6a20:6a03:b0:15a:6733:24e2 with SMTP id p3-20020a056a206a0300b0015a673324e2mr12179788pzk.25.1697476236976;
        Mon, 16 Oct 2023 10:10:36 -0700 (PDT)
Received: from x1 ([2601:1c2:1800:f680:619d:5ad3:44b1:eec4])
        by smtp.gmail.com with ESMTPSA id k64-20020a632443000000b0057c44503835sm5910283pgk.65.2023.10.16.10.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 10:10:36 -0700 (PDT)
Date: Mon, 16 Oct 2023 10:10:33 -0700
From: Drew Fustini <dfustini@baylibre.com>
To: Conor Dooley <conor@kernel.org>
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: dts: thead: set dma-noncoherent to soc bus
Message-ID: <ZS1uiXORq2IRPnId@x1>
References: <20230912072232.2455-1-jszhang@kernel.org>
 <20230912-trailing-pampered-52738ec6f009@spud>
 <ZQHSLdPufI6CXApg@xhacker>
 <20230913-faster-spotted-9df41a0d7787@spud>
 <20230920-pesky-stalemate-88f5036b8084@wendy>
 <ZQwL6fxi6IkUEIMc@xhacker>
 <20230921-4a1fe80384e083c67f38dc27@fedora>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230921-4a1fe80384e083c67f38dc27@fedora>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_101039_783904_AD227531 
X-CRM114-Status: GOOD (  30.12  )
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

On Thu, Sep 21, 2023 at 11:08:28AM +0100, Conor Dooley wrote:
> On Thu, Sep 21, 2023 at 05:24:57PM +0800, Jisheng Zhang wrote:
> > On Wed, Sep 20, 2023 at 09:36:19AM +0100, Conor Dooley wrote:
> > > Hey Jisheng,
> > > 
> > > On Wed, Sep 13, 2023 at 04:44:18PM +0100, Conor Dooley wrote:
> > > > On Wed, Sep 13, 2023 at 11:15:57PM +0800, Jisheng Zhang wrote:
> > > > > On Tue, Sep 12, 2023 at 05:27:31PM +0100, Conor Dooley wrote:
> > > > > > On Tue, Sep 12, 2023 at 03:22:32PM +0800, Jisheng Zhang wrote:
> > > > > > > riscv select ARCH_DMA_DEFAULT_COHERENT by default, and th1520 isn't
> > > > > > > dma coherent, so set dma-noncoherent to reflect this fact.
> > > > > > > 
> > > > > > > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > > > > > > Tested-by: Drew Fustini <dfustini@baylibre.com>
> > > > > > > ---
> > > > > > > 
> > > > > > > Since v1:
> > > > > > >  - rebase on v6.6-rc1
> > > > > > >  - collect Tested-by tag
> > > > > > 
> > > > > > Does this mean you're expecting me to take this?
> > > > > 
> > > > > Hi Conor,
> > > > > 
> > > > > I think I will take this and send PR to soc people. The reason
> > > > > I send v2 is the rebasing on new rc1 and v1 wasn't in linux-riscv
> > > > > mailist due to typo;
> > > > 
> > > > Great, thanks. Please ask SFR to add your tree to linux-next.
> > 
> > Hi Conor,
> > 
> > I'm not sure how to do this. When MAINTAINERS patch is merged, send
> > an email to Stephen Rothwell, are these steps correct?
> 
> Sorta, yeah. You don't need to have the MAINTAINERS patch merged first
> though, just send him a link to your tree and the branch name(s) & he
> will include it in linux-next.
> 
> > > I lost my main x86 box over the weekend (looks like probably a dead
> > > motherboard), so I may have missed a response to this.
> > > 
> > > Did you see this email? Additionally, can you add that git tree to the
> > > maintainers entry for the thead devicetrees?
> > 
> > I just created a tree in
> > git://git.kernel.org/pub/scm/linux/kernel/git/jszhang/linux.git
> > 
> > But it needs time for cgit to take place. I will send a patch
> > once it appears.
> 
> Looks to be there for me now. Thanks for doing this!

Hi Jisheng, I'm writing the cover letter for v2 of my th1520 mmc series
and I am wondering if this dma-noncoherent patch is in any tree yet?

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
