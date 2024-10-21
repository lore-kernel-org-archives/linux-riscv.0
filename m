Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B0A4D17122
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Oct 2024 18:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UHvDmD99W6pa/erPzjsS1V0FGCBF6sxCRbPF2cn1A4g=; b=phAJnbtLkW1LPO
	AWL/f+dmL0YPSE7Ur0XBy0e/HEHmycWk03gqAEdn/rX/lI386oUg//Zg2tWRJGCAwRUKnSit59REz
	Vyop7OEoZvNm/VSanVlHI5nyOv3PfIWoYqdR+M9LpXJVziY6XviFZ5JuEmSX0qlMEG+86ad6ttHGD
	mnTI+cRFRyN6DC5zK4U97coxZxg4CVSUb0FBsVPwChDKF1JrAQ07llbQDe+DnqGUHrlDBAajA96qX
	mOmXHbtoA+pXXAomOuetdd6j9ObHl856VP9OywSzSDR9wUa0Y5kajozQfC+ZjROl+Gp9OOtozt/rr
	i7EliTFi3zb6L2QQA3tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2wqN-00000008FXS-0tNr;
	Mon, 21 Oct 2024 18:09:27 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2wht-00000008DLK-339n
	for linux-riscv@lists.infradead.org;
	Mon, 21 Oct 2024 18:00:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 032A1A4378D;
	Mon, 21 Oct 2024 18:00:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D68FC4CEC3;
	Mon, 21 Oct 2024 18:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729533639;
	bh=fgWxk2nymv2R0eYb6z56JNmzGGen8Gh9a4cYgGr2o2o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L7Stmwr5YXDcTvbGjTGnDUQhQ2DXd6REQBki6PSTTHdv94HZ/tGU5QADRmyR6/KO2
	 Wx7uD/aWbFRkDtTA89ef5ijSaxuwn9ax3xd7PAbcFt5s3ZOWAaSx0RQHSjqRzWh6qF
	 JwMvmMZOMpkaZDUHu/VsW3bYGM/5ag/9anF+rupIcyf4dU92cFKTwpWC85WTUlBxqN
	 ZaUpxpXHqbiQswF98gew+ctCLeTYmQr4bH4CbTY9wQFD4R+JCDCJC4KyoyLPac1BdK
	 9+Dx4DtOkjFOo5OyVRCez/wc2e8WtLuZI514Qwzd1VUbYLJzJh+TUDGyPJ+5DMm4hZ
	 adGzwgSsVdX+A==
Date: Mon, 21 Oct 2024 13:00:38 -0500
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Inochi Amaoto <inochiama@outlook.com>, Yixun Lan <dlan@gentoo.org>,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: serial: snps-dw-apb-uart: Add Sophgo
 SG2044 uarts
Message-ID: <20241021180038.GA738756-robh@kernel.org>
References: <20241021072606.585878-1-inochiama@gmail.com>
 <20241021072606.585878-2-inochiama@gmail.com>
 <20241021-outlying-washday-8f171dedc703@spud>
 <r5ngs2j776jcy6sfirwzmtsoljotatfvgmlmv4sj4xksye2bff@xtn7adafbpfz>
 <20241021-rosy-drove-1ae3c8985405@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241021-rosy-drove-1ae3c8985405@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_110041_961173_CF5280E1 
X-CRM114-Status: GOOD (  21.26  )
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

On Mon, Oct 21, 2024 at 01:21:58PM +0100, Conor Dooley wrote:
> On Mon, Oct 21, 2024 at 08:18:58PM +0800, Inochi Amaoto wrote:
> > On Mon, Oct 21, 2024 at 01:10:52PM +0100, Conor Dooley wrote:
> > > On Mon, Oct 21, 2024 at 03:26:05PM +0800, Inochi Amaoto wrote:
> > > > The UART of SG2044 is modified version of the standard Synopsys
> > > > DesignWare UART. The UART on SG2044 relys on the internal divisor
> > > > and can not set right clock rate for the common bitrates.
> > > > 
> > > > Add compatibles string for the Sophgo SG2044 uarts.
> > > > 
> > > > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > > > ---
> > > >  .../devicetree/bindings/serial/snps-dw-apb-uart.yaml          | 4 ++++
> > > >  1 file changed, 4 insertions(+)
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> > > > index 4cdb0dcaccf3..6963f89a1848 100644
> > > > --- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> > > > +++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> > > > @@ -58,6 +58,10 @@ properties:
> > > >                - brcm,bcm11351-dw-apb-uart
> > > >                - brcm,bcm21664-dw-apb-uart
> > > >            - const: snps,dw-apb-uart
> > > > +      - items:
> > > > +          - enum:
> > > > +              - sophgo,sg2044-uart
> > > > +          - const: snps,dw-apb-uart
> > > 
> > > Why does each vendor have an items entry of its own? Seems like needless
> > > clutter of the file IMO, except for the renesas bit.
> > 
> > I just follow others when writing this binding. I think it may need
> > another patch to fix this problem, right?
> 
> Yeah. But I'd hold off to see if someone gives a rationale for it being
> done this way before sending that. I've not deleted this thread, and
> will send an ack if someone justifies why the binding is written like
> this.

No reason to be separate.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
