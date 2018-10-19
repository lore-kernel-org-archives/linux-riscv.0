Return-Path: <SRS0=HMje=M7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAA39ECDE3D
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 19 Oct 2018 20:46:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE3B520869
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 19 Oct 2018 20:46:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hFzE0y8B";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="WuWMGrna"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE3B520869
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eC9ZcE/O1RA1lAt9mCVumh0HJwrbImJslmnBK98A3HE=; b=hFzE0y8BgMc+cr
	vcmPg6UIlH7w5LXIc7LIikBkK7gKi/LgTyAd4HZkdC8mu80LtGihq3DgCqX9Js7NfnfocqMesQ8yA
	ZqDlx6nA3i4GE9Et+uB9uUmPkwvmAmomoOEBqZBUQNGvsBjSRkWYU3QQ5mB/UYcf2bm2RAXX2GDWo
	ytlhFCJMZkVvoSVpyXoMv2NRx6CkLe9TzQeuhazT3HSra8oln/MeBMJQAqGO5EwmG9yzvCIbKg8UT
	EbixWfv1o2xDFhe63LqZoVFdiLFrjuw6PKzCsgDSpkRUM+J0XWuH0AxwJyMQjrL6OeNygItUS46Qe
	aQaQRHow9eJxSP62SExQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gDbf7-0004HM-7X; Fri, 19 Oct 2018 20:46:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gDbf4-0004G0-6S
 for linux-riscv@lists.infradead.org; Fri, 19 Oct 2018 20:46:23 +0000
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6EA9921486
 for <linux-riscv@lists.infradead.org>; Fri, 19 Oct 2018 20:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1539981969;
 bh=KtDel/ZHHd/BUBoAB/LL1/KWAd74w36v51PrmtIIIkQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WuWMGrnamerbaMAFKKjF3L3lr7D8zYx2dPs/2wGFeFiJYGnGTjLA1WOZGvUDVDNUo
 JPawMAhj8HLSBakxdn+u9v69VV7Q8N/bloz+On5928sNtzTcbOl18dqWzRWH0DQ8RT
 F1rQgY4WRDZnfO6w12R/OZSpVVe0V4SSWYI1XTgs=
Received: by mail-qt1-f174.google.com with SMTP id b4-v6so39830643qtc.7
 for <linux-riscv@lists.infradead.org>; Fri, 19 Oct 2018 13:46:09 -0700 (PDT)
X-Gm-Message-State: ABuFfogFJZ/qq4xcrjyUM+8WKBTavRX8a/4gwcq8+V/NWCdgfDhcpRzm
 eg8qpMl4jy5Mgu7X4Obobl+GUvtDBUrgyZGe7A==
X-Google-Smtp-Source: ACcGV63TcOLG9K6e2N45hwpngnZqwcDEdM85U4M6pmMhrdKiUOfyhqlKL2qMID1pi37TOo9/Z/5XJXfkWIVxZsfsiRU=
X-Received: by 2002:ac8:2d33:: with SMTP id
 n48-v6mr33372959qta.38.1539981968661; 
 Fri, 19 Oct 2018 13:46:08 -0700 (PDT)
MIME-Version: 1.0
References: <20181019184827.12351-1-paul.walmsley@sifive.com>
 <20181019184827.12351-2-paul.walmsley@sifive.com>
In-Reply-To: <20181019184827.12351-2-paul.walmsley@sifive.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 19 Oct 2018 15:45:57 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJBSqaxnETdJg1Mdp+H2ay+WKT0JaxLe6D4Fwo_99qUkw@mail.gmail.com>
Message-ID:
 <CAL_JsqJBSqaxnETdJg1Mdp+H2ay+WKT0JaxLe6D4Fwo_99qUkw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: serial: add documentation for the
 SiFive UART driver
To: Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181019_134622_272114_F3EB633F 
X-CRM114-Status: GOOD (  19.44  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Paul Walmsley <paul@pwsan.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181019204557.L6kwXLlQxRpyqVIN3S2B3ygd4fCTo7NdsotOP97Bjyc@z>

On Fri, Oct 19, 2018 at 1:48 PM Paul Walmsley <paul.walmsley@sifive.com> wrote:
>
> Add DT binding documentation for the Linux driver for the SiFive
> asynchronous serial IP block.  Nothing too exotic.
>
> Cc: linux-serial@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Palmer Dabbelt <palmer@sifive.com>
> Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
> Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> Signed-off-by: Paul Walmsley <paul@pwsan.com>
> ---
>  .../bindings/serial/sifive-serial.txt         | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/serial/sifive-serial.txt
>
> diff --git a/Documentation/devicetree/bindings/serial/sifive-serial.txt b/Documentation/devicetree/bindings/serial/sifive-serial.txt
> new file mode 100644
> index 000000000000..8982338512f5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/serial/sifive-serial.txt
> @@ -0,0 +1,21 @@
> +SiFive asynchronous serial interface (UART)
> +
> +Required properties:
> +
> +- compatible: should be "sifive,fu540-c000-uart0" or "sifive,uart0"

I assume once again, the last '0' is a version? As I mentioned for the
intc and now the pwm block bindings, if you are going to do version
numbers please document the versioning scheme. Palmer mentioned the
compatible string is part of the IP block repository? Where does the
number come from? What's the next version? Major vs. minor versions?
ECO fixes? Is the version s/w readable? How do you ensure it gets
updated? All that should be addressed.

Otherwise, don't do version numbers because we have no visibility to
what they mean.

> +- reg: address and length of the register space
> +- interrupt-parent: should contain a phandle pointing to the SoC interrupt
> +    controller device node that the UART interrupts are connected to

Don't need to document interrupt-parent here.

> +- interrupts: Should contain the UART interrupt identifier
> +- clocks: Should contain a clock identifier for the UART's parent clock
> +
> +
> +Example:
> +
> +uart0: serial@10010000 {
> +       compatible = "sifive,uart0";
> +       interrupt-parent = <&plic0>;
> +       interrupts = <80>;
> +       reg = <0x0 0x10010000 0x0 0x1000>;
> +       clocks = <&prci PRCI_CLK_TLCLK>;
> +};
> --
> 2.19.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
