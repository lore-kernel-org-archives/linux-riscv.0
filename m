Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 636F7C001E0
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Aug 2023 15:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Ws9UbxX8gXREzlHA6Jf7b8BC2SiqbBzESXwjBfxL5s=; b=ywIn6tMuDAI9XH
	rmhIsEZmAKYOAz3+GI6wRUE8h6XXebdYqNuK355ojjvpCIHSdvDXk/2YmiItGIzEPrpoSLJa4F/Pf
	Rm31de2/1mLnv79Q1i8gL1AsC+BXpYklbRGHIF1kJfkUhXZ3wm0K/Zii4N2zR6ffDV8rckJh2T9Fz
	YnlLBxka4eeDgJ5uDba5P1j17fudML0gwrRjafMM/gKORPLFdmgJsARFiyyhuI++JGsLvO47ZoOLD
	q/uQG9AIHdiheSGxgNU9w6bMWk1r+u+ScqRmiwITibCDugbHyaFsTQ5C+yUy/qINYKUfy9ppuEO2n
	4Ahnm5yokQ8vBf3NYntg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWItc-004YDI-0d;
	Wed, 16 Aug 2023 15:57:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWItZ-004YCf-0E
	for linux-riscv@lists.infradead.org;
	Wed, 16 Aug 2023 15:57:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 772996397C;
	Wed, 16 Aug 2023 15:57:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9B74C433C8;
	Wed, 16 Aug 2023 15:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692201435;
	bh=LGjCbUDyzoG/kGjnYUlAbDAgdkMgui9VlV8WjZyJXkM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JsaAbduB3E4/a8zOo4bX+udoWKDkN1kNjG4k/jSxIa+FFLMNG1PxqjrAi+aVJKpJa
	 8rDxKzFj7EUQtiKTi2ujPNaYinjMueSc5ieTUJZvs4b/1N8mujF2Cx+oS//ixgnsfz
	 dpKOAlWoIxFX7PuKWuW8FjpDLF9MsJ1XL5GbrvT7m85MtuPX4bcIE+QcQjPAEqj6bf
	 Q22cTiUcdNJvJThsRzBhdWC8BnhEMGQrDoWRaJ9d7Lr5pLKuxQxxHuckBMLH9VaV61
	 GxdJWDfyxFfxTshYPRSJEtCsEoriRyXKkSJOs4MRqIoZUb+QoTnLuSVeE1zcu7OBcH
	 2ZeaiMHzeNiIw==
Date: Wed, 16 Aug 2023 23:45:28 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Drew Fustini <dfustini@baylibre.com>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Robert Nelson <robertcnelson@beagleboard.org>,
	Jason Kridner <jkridner@beagleboard.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 0/2] riscv: Add BeagleV Ahead board support
Message-ID: <ZNzvGMmKufXxdOjt@xhacker>
References: <20230811-ahead-dt-v3-v1-0-aef2294bed86@baylibre.com>
 <20230815-aroma-graveyard-f1fcc61e5030@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230815-aroma-graveyard-f1fcc61e5030@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_085717_193724_99EA573A 
X-CRM114-Status: GOOD (  26.46  )
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

On Tue, Aug 15, 2023 at 02:15:46PM +0100, Conor Dooley wrote:
> Hey Jisheng,
> 
> On Fri, Aug 11, 2023 at 05:47:15PM -0700, Drew Fustini wrote:
> > The BeagleV Ahead single board computer [1] features the T-Head TH1520
> > SoC. Similar to the Lichee Pi 4A series from Jisheng [2], this adds a
> > minimal device tree file to support booting to a basic shell [3].
> 
> Am I supposed to take this, or will you? I still don't know where I
> stand with any of this and will default to assuming things are for me
> to take in the absence of clarity.

Hi Conor,

Since the patches in this window is small, so yes please help us to
take this series and the one of changing the dts license. I see Guo Ren
has acked it, I will ack too soon.

Thanks

> 
> Thanks,
> Conor.
> 
> > 
> > Changes since v2:
> > - Drop the MAINTAINERS patch as it is not important and I want this
> >   patch series to make it into the next PR
> > - Add Conor's R-b
> > 
> > Changes since v1:
> > - Add dual license to dts file as Conor noted this is typical
> > - Reorder new entry in thead.yaml to maintain alphabetical order per
> >   suggestion by Krzysztof
> > - Add A-b's and R-b's from v1
> > 
> > [1] https://beagleboard.org/beaglev-ahead
> > [2] https://lore.kernel.org/linux-riscv/20230617161529.2092-1-jszhang@kernel.org/
> > [3] https://gist.github.com/pdp7/91b98f5b8a632802e669d8c359f4f498
> > 
> > To: Jisheng Zhang <jszhang@kernel.org>
> > To: Guo Ren <guoren@kernel.org>
> > To: Fu Wei <wefu@redhat.com>
> > To: Rob Herring <robh+dt@kernel.org>
> > To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> > To: Conor Dooley <conor+dt@kernel.org>
> > To: Paul Walmsley <paul.walmsley@sifive.com>
> > To: Palmer Dabbelt <palmer@dabbelt.com>
> > To: Albert Ou <aou@eecs.berkeley.edu>
> > To: Conor Dooley <conor@kernel.org>
> > Cc: linux-riscv@lists.infradead.org
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: Robert Nelson <robertcnelson@beagleboard.org>
> > Cc: Jason Kridner <jkridner@beagleboard.org>
> > 
> > Signed-off-by: Drew Fustini <dfustini@baylibre.com>
> > ---
> > Drew Fustini (2):
> >       dt-bindings: riscv: Add BeagleV Ahead board compatibles
> >       riscv: dts: thead: add BeagleV Ahead board device tree
> > 
> >  Documentation/devicetree/bindings/riscv/thead.yaml |  4 ++
> >  arch/riscv/boot/dts/thead/Makefile                 |  2 +-
> >  arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts | 61 ++++++++++++++++++++++
> >  3 files changed, 66 insertions(+), 1 deletion(-)
> > ---
> > base-commit: 52a93d39b17dc7eb98b6aa3edb93943248e03b2f
> > change-id: 20230811-ahead-dt-v3-1d7e85fce20f
> > 
> > Best regards,
> > -- 
> > Drew Fustini <dfustini@baylibre.com>
> > 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
