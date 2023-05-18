Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF4B7C77B7D
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 12:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4reRZyk/kgy3b4Wjn703ejJ9o7bBBOIOD7FEMRPfZ7E=; b=g/nOb9nebXO2iI
	ZOsfFaaEyGM3XNngprhGpBeYoIh0/XnoCKyUyoRb0Oinpx7uPcBil6hTkeSxr/qFUB19r9UEy3F6w
	qQL1i0p9hbRYlHYkMtMN5FMt5OQO9G8t8PWbWMoxSNAAPPrhgi/JCXkcoOBfs0fkZaLLBmuJryNDc
	wCwoiW0f0pLyBDJcZqt1s8LnHBYpfolZtx+MD6ZbMXziuCD3Yc2FsXtUoebeG+I0V+hYDYFVoYYCU
	tE8XjJlRibpPCYsLXFQdAQVHRLIEsJ55RYgHmGsMLzRTB4ZmSA52gs5xpm9JbWihykEhDzYtV/zYI
	9UP4CdCyzTubjOknlEGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzcUN-00CvnO-06;
	Thu, 18 May 2023 12:12:11 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzcUK-00CvlS-17
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 12:12:10 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-75771dd7242so107265885a.1
        for <linux-riscv@lists.infradead.org>; Thu, 18 May 2023 05:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1684411926; x=1687003926;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b1LVde9eD9hiDa72aXFp01UeitZcx1XKK5VRIQwwJ4w=;
        b=f1WIjix4LVO2qoUadyymiNEwWX8LVYnKjiZJmHZsA00vpgp8OzN7fLeOXwmxyAsNjQ
         sHOCKYtaHjUeBnmA70xUS7m11Y8GXRs0HF7i7PVSFcwvUzQVx0yAXlGLYQrw7yq7y3KH
         MBoMqwZGJTzwuItitFkcFv88cqBCrBWri+DUGp8Fc0eAqXpc1sD7lY1vf9Zu0c1UnHTi
         g1NSzolGSvoeoheQrwHIwMvc3Rso4DvQpoRRtvFDk7J6iY3SLf6NCCF8S9IRrkOXhhUV
         HRuCy/CUe+KQ4Lk9dlGX7GSjHNglFJk4MTFkm4joUr1QsJe7so9IrOlgfq/tmei89LyY
         B2xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684411926; x=1687003926;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b1LVde9eD9hiDa72aXFp01UeitZcx1XKK5VRIQwwJ4w=;
        b=RGiCqJssvKTZj5k/B03OfkYnAi0W/Grzx45ALSObHCMINqYnkUfqVZAJD9MMruNlbI
         S5GDjrIAk+eRAvKjPdv7I9cDsXzYi45n+lOaeWWwCG1Kl7lk7ZYDN4ioKSF8565BdvpO
         N+331qo35iXbquDSNsaI30Z+wB/ekKfExSlHX5czMYS556GJZQnUPZOTorcDnfYCsq4y
         3QyzRciibbzAfb+riFdPfAOD1HtjQ46TPHALVNl1nIcmitbrv2YSLIbf07IkV8WFw4Qr
         lcNizd89aGt+XziY6ec40gdM+imphC50ZHiTGM3grLw/CyjANA2o/cBaH04XQwwEtBy9
         3ROw==
X-Gm-Message-State: AC+VfDyIOavX/FQK3dC9ltkzz8VIvOJIicJpSadB78+uq1vjz8VLqPyx
	cqI8R9JYIBRVQV39sdM/CZJjTA==
X-Google-Smtp-Source: ACHHUZ7wZ7lgCFFjWmWBQuc0tx+WGJVC/VREvoop6Vbqh2gPTjnAeer0zQN00cudqqAWi4mVPLtPKg==
X-Received: by 2002:a05:6214:2486:b0:5fd:7701:88c5 with SMTP id gi6-20020a056214248600b005fd770188c5mr5974330qvb.6.1684411925806;
        Thu, 18 May 2023 05:12:05 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-25-194.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.25.194])
        by smtp.gmail.com with ESMTPSA id w8-20020a0562140b2800b006215c5bb2e9sm476635qvj.70.2023.05.18.05.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 05:12:05 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1pzcUG-0055VE-PF;
	Thu, 18 May 2023 09:12:04 -0300
Date: Thu, 18 May 2023 09:12:04 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>,
	David Hildenbrand <david@redhat.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	"David S. Miller" <davem@davemloft.net>,
	Richard Weinberger <richard@nod.at>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 00/34] Split ptdesc from struct page
Message-ID: <ZGYWFIfyDtdpeWg1@ziepe.ca>
References: <20230501192829.17086-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230501192829.17086-1-vishal.moola@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_051208_385497_3A56137B 
X-CRM114-Status: GOOD (  10.07  )
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

On Mon, May 01, 2023 at 12:27:55PM -0700, Vishal Moola (Oracle) wrote:
> The MM subsystem is trying to shrink struct page. This patchset
> introduces a memory descriptor for page table tracking - struct ptdesc.
> 
> This patchset introduces ptdesc, splits ptdesc from struct page, and
> converts many callers of page table constructor/destructors to use ptdescs.

Lightly related food for future thought - based on some discussions at
LSF/MM it would be really nice if an end result of this was that a
rcu_head was always available in the ptdesc so we don't need to
allocate memory to free a page table.

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
