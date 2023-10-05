Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41FD0E7C4F5
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Oct 2023 06:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kAryiVl8cGIXVcV2/bksWNr+5XwXUOYnEXrIM3cM+xM=; b=YndUbRVcCLf/9r
	IZ0kRSdxCHfclU7xv7sIcazc2wVFl5QFM+h/rxCZmo8+wm4o6dkNlFGJ5B7W6JPBKEhhTD6e44lc/
	4HOavS0CXokgqK0rBPhf/Q2/cnrWCZizfK8jK8ANXSut9zBMriXXgltGPGIRwJLopMveTIlIPwJ6V
	wWoRau7lrkpnTI3LBc0xtec8NdEkP4ZpsAQf1YDFU9Rc8fftVHDHuIuG/tpYPZRKd7o28zXEnTs7i
	9kpL6jHbYG4kYmOKYldKZefCl15nstLBMEdnpbqy4uKXTME4QYhVavV5xZ9mfgiKv0Y2+5QcU3QuZ
	CnGo6Wp9LrYMFOhY3zIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoIIm-001YSR-0Y;
	Thu, 05 Oct 2023 06:57:40 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoIIi-001YQy-2k
	for linux-riscv@lists.infradead.org;
	Thu, 05 Oct 2023 06:57:39 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id D28EE68BEB; Thu,  5 Oct 2023 08:57:26 +0200 (CEST)
Date: Thu, 5 Oct 2023 08:57:26 +0200
From: Christoph Hellwig <hch@lst.de>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH 0/6] RISC-V: Add eMMC support for TH1520 boards
Message-ID: <20231005065726.GA5760@lst.de>
References: <CAOCHtYhnx1EpBM+o3xhdsicx5uqLidojK3f0HQ+VfyVv1ZXnVQ@mail.gmail.com> <CAOCHtYi5Ab5ppCmaQV3QuKQcpmJX+sHdAmtuEXhfq8xf5fFCYQ@mail.gmail.com> <ZRuamJuShOnvP1pr@x1> <ZR1M3FcdXrDmIGu2@xhacker> <CA+V-a8ugwqkQxnX-wwWCHVtBBtG=aVv=MZTc53LbpxtFA=N1_A@mail.gmail.com> <bc2b0b30-ab37-f336-c90e-eab570d393a2@arm.com> <c2ea3f34bb919293b850fab6ed42b61e3517ba35.camel@icenowy.me> <a568a9dd-bab2-1e23-c4d5-9f6475bdcc3b@arm.com> <CA+V-a8s1S4yTH19PVNSznAgUFoHRNoye9CfwjW6iy6PbQ9thew@mail.gmail.com> <CA+V-a8vbWW6=HTfR+FCPOB0bAa8M3Bbm_k=7+XbjOc3ybo6VNQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+V-a8vbWW6=HTfR+FCPOB0bAa8M3Bbm_k=7+XbjOc3ybo6VNQ@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_235737_031633_3EBBE713 
X-CRM114-Status: UNSURE (   9.52  )
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Jisheng Zhang <jszhang@kernel.org>, Drew Fustini <dfustini@baylibre.com>, linux-kernel@vger.kernel.org, Linux-MM <linux-mm@kvack.org>, Guo Ren <guoren@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-riscv@lists.infradead.org, Christoph Hellwig <hch@lst.de>, Geert Uytterhoeven <geert+renesas@glider.be>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, Arnd Bergmann <arnd@arndb.de>, Han Gao <gaohan@iscas.ac.cn>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Jason Kridner <jkridner@beagleboard.org>, Paul Walmsley <paul.walmsley@sifive.com>, Robert Nelson <robertcnelson@gmail.com>, linux-mmc@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>, Conor Dooley <conor@kernel.org>, =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Xi Ruoyao <xry111@xry111.site>, Robin Murphy <robin.murphy@arm.com>, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

No.  The global pool is a last resort only for nommu and other very
limited setups.  It should never be enable in a general-purpose kernel,
and if your hardware requires it is a failed designed and should not
be supported in a general purpose kernel build.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
