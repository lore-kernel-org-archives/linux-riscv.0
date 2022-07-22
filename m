Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B9E9C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Jul 2022 21:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EGCsEW1/Dt6JZ6BSRL8ShuZqrYdjm8asPBUt8GOcm4g=; b=TeIndE+FaBGmRZ
	xcsub4EZ+hGsDavpwp509gXLF+oQzcgMwdvQ5kW7w7TxbKn5RpG/kvLbmkeiiXJnEpH1BRNw7j/MB
	n3vy3EJmETcdk46OGJ8zE3DktE4MvGP/a/cZDHlKmS8VV3hcnXNQdjeUychRfTlpXNd1xfkerm7GM
	F9yN2Ujltmd/VMFYLXugWH2+bq4wKzOcwHswtqjKVpabAF6j09k8gVyCrT9FqWG7YQAsjSUT/L/Z6
	9LjaadWdlcHzKQvtLsPjkvzzuSF2oL04Xd7rTR7+G7i1Hk8Wwqm2RvfAq84ufRzJ0Mr98DKcSxDae
	7ZgLMMjAplC0jbM2KH+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oF0R2-00BbBu-Tb; Fri, 22 Jul 2022 21:43:48 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oF0Qr-00Bb5c-Dq; Fri, 22 Jul 2022 21:43:38 +0000
Received: by mail-pj1-x1031.google.com with SMTP id gq7so5415212pjb.1;
        Fri, 22 Jul 2022 14:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=i4Qp1mKbIG2ruYUdux/tc/3csBK1hzMenyp+t9FkaYk=;
        b=FRbsnnig1i03refpFl63/oYlraRh54F+mJVHhcNi2f4eeFNzYIp7qg4GQM9aN6VAp2
         y6oOij7gj/FKdqLi7xJGownmX/nVVSlkLkcRP75s/8ETfXBivanzKdoecGl451+B0G9M
         5Nm04yoIVcl2UXc68JS+DR0lVc8Z63qI7A40Lz++GlqZboTjktogd+sTIiNnfSuSNn9q
         54OdXFAby1g0IEQgkOUzixoj7dWll3RbROqD2LO1TrdZnsfhqyGqOe0CQY2nPgO3u0ms
         tPCQMgLaB24XcjaXETs320r93j1KKENMbYJFui4dpYkNrKd9EbgKu9aoYklJNW8c4r8F
         NDJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=i4Qp1mKbIG2ruYUdux/tc/3csBK1hzMenyp+t9FkaYk=;
        b=WoAyDVQZ9CMjqMMbPQY7RIAt/OK/G8bN0vCwuyR2Um8QGhY31nyJ2I0ugUYSl3iE92
         sSIR9/TWWaSmxyifH3K1QBxsR3o3FmY/dR+jBV7yRo4TZzdSE/1pAZYDKuJBXwLWuZrd
         OVbtx8Q2+q/cqIY44XMVfqmCYdp+wc7Ig4EN2glVLef2U+1H2g7wi7ORaSJCuPzDpyNY
         XzfUHlTnTNU0PBH3lnjW3pt+TTxrzu5tpRvjnoCGfaO24cJxfm+gwnlpNOm12rwmJrxT
         0FMq+zijy94u70BlrkSbOW77sLRu4Q3DF2l7qOLOPUuw4jYjDC80q+ZC2f1TY+u1h6K8
         FB0A==
X-Gm-Message-State: AJIora+G7fMc2Dage+Pu9c/UeoKi18lNcnUwmA9pnc8o8PusdnF/az/G
	/ivs0S3tSFtZ9lNPCJI3glw=
X-Google-Smtp-Source: AGRyM1tDESdKAY40zEtiRQTmyQgc9zR+ckOecpVbQSNki8M4gmNYammHVylV0yXZ2taDdNJJIYKkvw==
X-Received: by 2002:a17:90a:bb12:b0:1f2:59a7:657a with SMTP id u18-20020a17090abb1200b001f259a7657amr1726131pjr.151.1658526213902;
        Fri, 22 Jul 2022 14:43:33 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
        by smtp.gmail.com with ESMTPSA id g8-20020aa79f08000000b0052b6277df9esm4344616pfr.43.2022.07.22.14.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jul 2022 14:43:33 -0700 (PDT)
Date: Sat, 23 Jul 2022 06:43:31 +0900
From: Stafford Horne <shorne@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Bjorn Helgaas <helgaas@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
	Pierre Morel <pmorel@linux.ibm.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	linux-csky@vger.kernel.org,
	linux-riscv <linux-riscv@lists.infradead.org>,
	linux-um <linux-um@lists.infradead.org>,
	linux-pci <linux-pci@vger.kernel.org>,
	linux-arch <linux-arch@vger.kernel.org>
Subject: Re: [PATCH v5 4/4] asm-generic: Add new pci.h and use it
Message-ID: <YtsaA2Zjqa/XZZou@antec>
References: <20220721134924.596152-5-shorne@gmail.com>
 <20220721173733.GA1731649@bhelgaas>
 <YtnMEwh3U3Ng9q4a@antec>
 <CAK8P3a3T0GvYyRgw=ojD_wts_pfdzfqXS8iNfUYuByBvLF9SGQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a3T0GvYyRgw=ojD_wts_pfdzfqXS8iNfUYuByBvLF9SGQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_144337_486317_4C1D3F80 
X-CRM114-Status: GOOD (  23.60  )
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

On Fri, Jul 22, 2022 at 09:53:07AM +0200, Arnd Bergmann wrote:
> On Thu, Jul 21, 2022 at 11:58 PM Stafford Horne <shorne@gmail.com> wrote:
> > On Thu, Jul 21, 2022 at 12:37:33PM -0500, Bjorn Helgaas wrote:
> 
> >
> > Thanks, you are right, I think some of the earlier functions may have needed it,
> > which is why I had it earlier.  But now that we have removed those we should be
> > able to remove this.
> >
> > That said, I think some of the architecture includes could also be removed.  On
> > OpenRISC we are able to get away with only having the global asm-generic/pci.h
> > so we don't need a wrapper pci.h header at all.
> >
> > However, I don't have everything setup to build all of those architectures so I
> > was being a bit conservative to remove headers.  I'll see what I can do in the
> > next version.
> 
> No need to worry about linux/types.h, this is pretty much included everywhere
> already and neither the risk of extraneous includes or missing ones is
> something to worry about. I'd just remove it if you do another respin, or
> we can leave it in if Bjorn wants to just apply the v5 version.

I will respin a v6 as we didn't get a reply on this.  Bjorn are you planning to
apply the series before the upcoming merge window?

Originally I was thinking to merge these with my OpenRISC PCI support patches as
OpenRISC depends on this.  However, the series is getting a bit more involved
for OpenRISC only.

Once you get it merged I will like to rebase my OpenRISC PCI support patches on
you branch.  Hopefully, we can make it by the merge window.

Also, Palmer has a conflict with the series and his RISC-V for-next branch.
He would like to have a tag or branch to be able to merge into is branch to
resolve the conflict.

-Stafford

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
