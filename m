Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C463FC4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 15:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:Mime-Version
	:References:In-Reply-To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sa7fMH/GOQPWc0dpUAkfrJlj15hUnVQOPhW6LPiDUE4=; b=Yw/fYQr5mNMQF7
	PEcdli7AOXa7V9CBsVPluoRe6FQDV2U34mGZrEMPFEj12lpvpcUW5+2HnGINsW+S7pOkb0bwtYo/l
	SI4d9uEKTLkae2jHHr+xM5Dz6ESEBcOa3Xx89PYSBmMSsSwVrN4RhFGiQrQFdYdd86PmE3QIrL00i
	zDnjwE8Qc1/ZiipJDmZlSOdKHPW6pMbkutMVeVDnqeAZaBLul6dALYd+2j4VbU29YifccpLQjBNoD
	DHKLHdGHXvMqiGqnohmAHjENNNfBnSw+jdhpke/B6471DC5z6Sk6DXPtNpUdEUNhQryd7uaoCAV01
	Nr/nkJK+fa5hP8NwwBtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8iat-00BAS1-2w;
	Thu, 30 Nov 2023 15:04:47 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8iaq-00BAQV-2d
	for linux-riscv@lists.infradead.org;
	Thu, 30 Nov 2023 15:04:46 +0000
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 1014B42240
	for <linux-riscv@lists.infradead.org>; Thu, 30 Nov 2023 15:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1701356679;
	bh=FPCmM4heOBQnergRut0J3YYhJg2qbq6GVBQzZL89KsE=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=DWcOd9pgYGYNNTb2JEJbg0XbrOTKbR4KJcModmgUtD9NZxgAdBWmrZZvyBSQB/h3o
	 8nX9djW5iMKoAunv4Ks3PTBY92QVW3auxYFfUddQ5U/+os9+T4XympjezhbwBB2xNP
	 JGkSFCioeHnYgVIeXyzXN8SSapQqAGAbESybos9hyd8YmFXPbeE99HGZ3YWEfwMZTC
	 OWpdSRaZQfliDVg5KTlN8lTg87/nOOEtJnEMWOqxFDFysSzMV6JSRKctWDU5kqmSDH
	 eqypT2Db5ktyZwpqksLRTJ3+pWhekjfWYfwCvmJyFEMll0b36SbkmgSckKUBRaF185
	 aAfGJZOlL9XLQ==
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-41bef8f8d94so11218501cf.0
        for <linux-riscv@lists.infradead.org>; Thu, 30 Nov 2023 07:04:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701356677; x=1701961477;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FPCmM4heOBQnergRut0J3YYhJg2qbq6GVBQzZL89KsE=;
        b=PYTcbMLvSMfzXZbP8KF7p5hhv/6Xwc8o2G4umN1lkQfu07VjsLkNS9Aqfhwbgkomdy
         PksBUudeKrHu/sZBy5g+aZUO+TPd4W+TrVfObqN3QyxifdBsJMzchx/4mDQWIl0VEWwg
         16C8BDl0Vu+AE3wxrx+iyDK+cH0QvQPdqcIA3nfRpSUa+mQPbrIxezN5H5bD6CTDBLg9
         MVwblUs71ln6BOYF84j+ElyivtqVHvnMqJo9p0V3xD56Bu/l2Ejxfi4ZCg/H3xKkbmnk
         GWXsvrDZgwHWoRLFIfAV6OT1keIMG4nexI34Bz7KsWpvfMykEK4LMvzwUVj2EGwu5QNK
         Aa1A==
X-Gm-Message-State: AOJu0Yx88VyhlICOJekwwiRZoiuZdx0UHVWESpfIhHzhemAapH/5GEM4
	oxcsnM+a44pX027s1ys8m+VraaR2nOWlV4MOUmhZc0wiT+vn9vigTxW+W7e1ueMKHtWyRvIn01z
	pQdlcR06t45H3dTu/Pzx7QVx23X/VNUZH9HxhkMHt9etnx/Ljix16CdA85GzSlQ==
X-Received: by 2002:a05:622a:22a8:b0:423:991e:8589 with SMTP id ay40-20020a05622a22a800b00423991e8589mr20147204qtb.33.1701356676664;
        Thu, 30 Nov 2023 07:04:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH9k158ZXjtgNdDUlZzVCNCmNLqRi+AOk+q/iadsE/+/aYALRFnyCxg84z0xW9r9HHy2iLKzeqhcclFfe7hrr0=
X-Received: by 2002:a05:622a:22a8:b0:423:991e:8589 with SMTP id
 ay40-20020a05622a22a800b00423991e8589mr20147170qtb.33.1701356676224; Thu, 30
 Nov 2023 07:04:36 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Nov 2023 16:04:35 +0100
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20231130-skating-shindig-af43058fc8ff@spud>
References: <20231126232746.264302-1-emil.renner.berthing@canonical.com> <20231130-skating-shindig-af43058fc8ff@spud>
Mime-Version: 1.0
Date: Thu, 30 Nov 2023 16:04:35 +0100
Message-ID: <CAJM55Z_EPMuCbX-_8ABKwT27xdtDX7X2y_nv+o4knVL0DoK2xQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/8] Add JH7100 errata and update device tree
To: Conor Dooley <conor@kernel.org>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_070445_134770_2959866A 
X-CRM114-Status: GOOD (  15.76  )
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
Cc: devicetree@vger.kernel.org, Emil Renner Berthing <kernel@esmil.dk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Conor Dooley wrote:
> On Mon, Nov 27, 2023 at 12:27:38AM +0100, Emil Renner Berthing wrote:
> > Now that the driver for the SiFive cache controller supports manual
> > flushing as non-standard cache operations[1] we can add an errata option
> > for the StarFive JH7100 SoC and update the device tree with the cache
> > controller, dedicated DMA pool and add MMC nodes for the SD-card and
> > wifi.
> >
> > This series needs the following commit in [1] to work properly:
> >
> > 0d5701dc9cd6 ("soc: sifive: ccache: Add StarFive JH7100 support")
> >
> > [1]: https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/log/?h=riscv-soc-for-next
>
> This stuff all seems fine to me. I'd like Palmer to take the first
> patch, or I suppose I could take it alongside the cache driver changes
> with an Ack.

Thanks, makes sense. In addition to the missing Signed-off-by I also forgot to
update the commit message for patch 4/8, so let me send a v2.

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
