Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C4BC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Nov 2021 11:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xN2vXdoYo7FBWOnf9+F/miEfVr7rfmCaxFY2ixiQTkI=; b=Djb6oZmWvKqpFc
	4dkBwEnxsMBzMOab4afuEle+86J4UhiqpB/0DC/MaoBbdsuySktowfdv/YkUb1HGC25Q3FqUbJD/e
	mR3YdxqGNtYpkiD09aQYqw1K6MWG6rGhvyVGpObgnsyczk7r9D0hUTmJ8Y7tcFo7xKViQilABMKkv
	TljYV8VpZeP+XfM+9IVaWTbL2FFOP5fS0+ijmJQzJCsRzUVtz0TZv5STyKHyuUCdGmVq+UI5tOSx3
	IG/bKaim0woFPu+mMuDyvhNvN7aPR+svVdSWxPEGdlrQ+QcseIFoNF3CPQUjKuASN42xlZZtB5t1m
	kJO/wL/B/f74EiLQzctQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpTuQ-001tVC-RQ; Tue, 23 Nov 2021 11:24:22 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpTuM-001tSR-QH
 for linux-riscv@lists.infradead.org; Tue, 23 Nov 2021 11:24:21 +0000
Received: from ip5f5b2004.dynamic.kabel-deutschland.de ([95.91.32.4]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1mpTuB-0008Cw-Pk; Tue, 23 Nov 2021 12:24:07 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Conor Dooley <Conor.Dooley@microchip.com>, linux-riscv@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Mark Brown <broonie@kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 Lewis Hanly <Lewis.Hanly@microchip.com>, Daire.McNamara@microchip.com,
 Atish Patra <atish.patra@wdc.com>, Ivan.Griffin@microchip.com,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux I2C <linux-i2c@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 linux-rtc@vger.kernel.org, linux-spi <linux-spi@vger.kernel.org>,
 USB list <linux-usb@vger.kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Bin Meng <bin.meng@windriver.com>, Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 04/13] dt-bindings: riscv: update microchip polarfire binds
Date: Tue, 23 Nov 2021 12:24:06 +0100
Message-ID: <2736394.7QafvNDC63@diego>
In-Reply-To: <CAMuHMdUs7UnADr2SfHBD4sGs3_giR0cmXnz=6qa4iAP1reDtgA@mail.gmail.com>
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <198eaf69-8f85-50a7-192e-5900776d044b@microchip.com>
 <CAMuHMdUs7UnADr2SfHBD4sGs3_giR0cmXnz=6qa4iAP1reDtgA@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_032418_947853_3206B13E 
X-CRM114-Status: GOOD (  21.38  )
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

Am Dienstag, 9. November 2021, 14:04:45 CET schrieb Geert Uytterhoeven:
> Hi Conor,
> 
> On Tue, Nov 9, 2021 at 1:08 PM <Conor.Dooley@microchip.com> wrote:
> > On 09/11/2021 08:34, Geert Uytterhoeven wrote:
> > > On Mon, Nov 8, 2021 at 4:06 PM <conor.dooley@microchip.com> wrote:
> > >> From: Conor Dooley <conor.dooley@microchip.com>
> > >>
> > >> Add mpfs-soc to clear undocumented binding warning
> > >>
> > >> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> 
> > >> --- a/Documentation/devicetree/bindings/riscv/microchip.yaml
> > >> +++ b/Documentation/devicetree/bindings/riscv/microchip.yaml
> > >> @@ -21,6 +21,7 @@ properties:
> > >>         - enum:
> > >>             - microchip,mpfs-icicle-kit
> > >>         - const: microchip,mpfs
> > >> +      - const: microchip,mpfs-soc
> > >
> > > Doesn't the "s" in "mpfs" already stand for "soc"?
> > not wrong, but using mpf-soc would be confusing since "mpf" is the part
> > name for the non soc fpga. is it fine to just reuse "mpfs" for the dtsi
> > overall compatible and for the soc subsection?
> 
> I really meant: what is the difference between "microchip,mpfs" and
> "microchip,mpfs-soc"? Can't you just use the former?

definitly agreed :-)

Having the board named as
	compatible = "microchip,mpfs-icicle-kit", "microchip,mpfs"
sounds the most sensible.

As Conor wrote, "mpfs" is the name of the soc itself - with mpf being
the fpga part, so that would follow what boards in other parts of the
kernel do.

Heiko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
