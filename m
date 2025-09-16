Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97F12CAC599
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Sep 2025 13:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rIGulGCENCHXjSzxTDNl3/Ua63JPzuiDDa9Iv5edj1o=; b=gGWXtkby4cpUFA
	wKC8VUNR1cBUCyhIJaBpA7Oy88YakHaqH9PzpAJlg29Z6ev2dxxj2lq4GMnwG9lgz8XXTcafU2X+6
	cTpAIizEUPcN/BH11mqGyICF6QnjJmqJ+kdb9KtDq78ImQ7SNg8Yl7vm2kbDB3kmX2M2pSm+/48so
	Q+2yQRerNfBW/46B+m3FVbgzKX4T+hgBRDOLR1nEubtHQWLldSPy8EUAoKOQfwPIWBNfX7kdNIKWr
	+iUGRwED0j1k8JMh7o7UZAxN4Fuf3d6hO+2R0M+RO735jbbCh1vmoQDN0FkdhcQpHJmWv7PxTsCIY
	/MHfVzj2gd3LGwOO7XkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyVp7-00000007xDe-3Pe5;
	Tue, 16 Sep 2025 13:34:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyVp5-00000007xCV-2Tjb
	for linux-riscv@lists.infradead.org;
	Tue, 16 Sep 2025 13:34:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3B36C404F6;
	Tue, 16 Sep 2025 13:34:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E376EC4CEEB;
	Tue, 16 Sep 2025 13:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758029659;
	bh=iIqAO6WgRjC+zh76V3WMiojvREdZ40UZ4E3S/teNB/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jPi5McCRA7fPfhCA/bg7s2uhMT0Eapl0OFyhii8xgYH2qsWZW9epG0OgYUWHnrzv+
	 4fVCRSUkeFNz4sfozuwPzd/oGToZl2ZiTy7w4vIzmEF1NOyEMWkmwci+CTvvQJ7Dir
	 7kat2Ojjy5GB/UOZ28lr7jxBjmos+qNZmOThuKFNkpVbVGvdp8EFb/peo6DdmDO9Oc
	 8c7JK7D/sGsuGLB6bBrmocICesgzPpGoykKff0Pw2BrcxpXFJXrcza82WK3CaEJNsC
	 MTsR7MIRfsvWLroBrA0pLv80f+S87rrWBHdncP/bpgv7GmwJa9crgb1dn01Eg337xG
	 CnASMvShQ4g4g==
Date: Tue, 16 Sep 2025 08:34:18 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Drew Fustini <fustini@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
	Michael Ellerman <mpe@kernel.org>,
	Michael Neuling <mikey@neuling.org>, Andy Gross <agross@kernel.org>,
	Joel Stanley <jms@tenstorrent.com>,
	Drew Fustini <dfustini@tenstorrent.com>,
	linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>,
	Nicholas Piggin <npiggin@gmail.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org,
	Joel Stanley <joel@jms.id.au>, Conor Dooley <conor@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH 2/7] dt-bindings: riscv: Add Tenstorrent Blackhole
 compatible
Message-ID: <175802965741.3650693.16028674427033969349.robh@kernel.org>
References: <20250913-tt-bh-dts-v1-0-ddb0d6860fe5@tenstorrent.com>
 <20250913-tt-bh-dts-v1-2-ddb0d6860fe5@tenstorrent.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250913-tt-bh-dts-v1-2-ddb0d6860fe5@tenstorrent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_063419_648537_343DF7B6 
X-CRM114-Status: UNSURE (   8.87  )
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


On Sat, 13 Sep 2025 14:31:01 -0700, Drew Fustini wrote:
> From: Drew Fustini <dfustini@tenstorrent.com>
> 
> Add compatibles for the Tenstorrent Blackhole A0 SoC PCIe card.
> 
> Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
> ---
>  .../devicetree/bindings/riscv/tenstorrent.yaml     | 28 ++++++++++++++++++++++
>  MAINTAINERS                                        |  8 +++++++
>  2 files changed, 36 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
