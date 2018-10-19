Return-Path: <SRS0=HMje=M7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C6D5ECDE3D
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 19 Oct 2018 16:52:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D27220838
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 19 Oct 2018 16:52:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oHztFA9d";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="U1nLwGYd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D27220838
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=GiI16XI32pqHqYuYzi95BUglbWIC9gwoyVTVGoSHDsY=; b=oHztFA9dRE9RI6bPi2TfD/xBn
	NtRDBCqmxZrB8Sjx5Zz4Iw20nUYJBgN3ShPfFQlgJtD7pkb4oLtnNbWIy7tAl6AG7qHpu9pGJTyjN
	saSOBkCOyTkIWFQA6YI/mv90L577hUWMWl2qhKrROirunWtGq8YqT+978J6DzvL6Rq54N4dkQuz5v
	d0CPsWDblNZCNDeupAQ4ZyioUrGfYgIopnD9/uquJWj5lejbXEM86zMNCG7itcBqutlLil2wp+UDm
	rA94ZxNNoDTe2Iqs/GfbZYWjQhP5IN5eIiZpmUwzD2ePb2CcqMSPT9vBMAG/kVcXSoMZyh2p02Ibv
	7LHEhGCWg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gDY0V-0005HP-QC; Fri, 19 Oct 2018 16:52:15 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gDY0S-0005GQ-8z
 for linux-riscv@lists.infradead.org; Fri, 19 Oct 2018 16:52:13 +0000
Received: by mail-pg1-x542.google.com with SMTP id d8-v6so4788406pgv.10
 for <linux-riscv@lists.infradead.org>; Fri, 19 Oct 2018 09:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=GVBU39LMN0G5blxzn+JVWLJqFsYI8KTtP2mkWhEjBzM=;
 b=U1nLwGYdAvV0rwH8h2ArpUg4Zar8WWuniQUvRVkEyuobx0Lvj2b3UfRK2cR0NryKSg
 tXg0U4Z39BswpgWFeFkLOWIZk+EfbDVczIJacL7BsEoO72Q2NthF0fGyIOZO1r/DQOLA
 vF5Nw6aZNIdCzUSYen5YJoOLykYo2udIQjnS9vsCGTNC968BywhADqdiI0EtEoDloBE3
 6RfvVEoQl2Wud0t+hEW37D8CygbnBOlL5FdxTDwebNpJSKyQk4pFTKLmu1Y2SVjRfUsy
 yEIG1ELyH9qDEKhMpH+ZvNbZSQMdwZq43r0MaLr2x50KitPo3SwROP7N8Ek0//+Mya4s
 1Z5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=GVBU39LMN0G5blxzn+JVWLJqFsYI8KTtP2mkWhEjBzM=;
 b=U8tR7Ke489YRXD4lpi52Jiai1WhhqOrs+SfJHPuyqwjHOVSzzkMX2bqkUWi856fE+z
 Qt1tqNYOMVpSJL+hlxHPX2aaVMGifLfgd2erSpLUjjTKw1xZX+sB0aUw9XvAw/VphD2Z
 JZlVVXRBaHgK6BNbA9Hg5MDdolFU7KCmyK9GhUaAlhxigwCT2YkOsbGFIHcGZO5RjBI+
 HGvBbFfKZzYwWwsmetGiQ1njc7ub5RXY6yoTG0wV4OqSaFXgvf0xOUTfvdxKU8/TW+D2
 C66nTpe8NY0/EQigRzMrVSaT+Yl7mGGHWO6KspVMxI4R0V2Cwe8U8mp3sycCF7u37Iw1
 me5w==
X-Gm-Message-State: ABuFfoiE4SHi+oSFM3HfO3i1NSH5O9AWjW+vW0uOgVVPZfk/yVDq3quc
 7LkfAuChAulat2g/XvVOArbs5MzqcLI=
X-Google-Smtp-Source: ACcGV63LsToWO/Ffzcekp9W0ci95dOVGvoqYpUyGMoULlXJa7sOn+WtuG52kmtVNOgM2todt1+QlPg==
X-Received: by 2002:a63:844:: with SMTP id
 65-v6mr32480005pgi.144.1539967920774; 
 Fri, 19 Oct 2018 09:52:00 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id t22-v6sm33978608pfk.141.2018.10.19.09.51.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 19 Oct 2018 09:51:59 -0700 (PDT)
Date: Fri, 19 Oct 2018 09:51:59 -0700 (PDT)
X-Google-Original-Date: Fri, 19 Oct 2018 08:30:45 PDT (-0700)
Subject: Re: [PATCH 1/2] dt-bindings: serial: add documentation for the SiFive
 UART driver
In-Reply-To: <20181018234352.26788-2-paul.walmsley@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Paul Walmsley <paul.walmsley@sifive.com>
Message-ID: <mhng-607b838d-f2e0-4c14-8274-9d696cbc7e78@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181019_095212_428467_6ED66E65 
X-CRM114-Status: GOOD (  18.00  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, paul@pwsan.com,
 Greg KH <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-serial@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181019165159.1IMJf0BunlWW_NGCkLhK4niAvh8K4etYnUT48JbHnO8@z>

On Thu, 18 Oct 2018 16:43:53 PDT (-0700), Paul Walmsley wrote:
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
> +- reg: address and length of the register space
> +- interrupt-parent: should contain a phandle pointing to the SoC interrupt
> +    controller device node that the UART interrupts are connected to
> +- interrupts: Should contain the UART interrupt identifier
> +- clocks: Should contain a clock identifier for the UART's parent clock
> +
> +
> +Example:
> +
> +uart0: serial@10010000 {
> +	compatible = "sifive,uart0";
> +	interrupt-parent = <&plic0>;
> +	interrupts = <80>;
> +	reg = <0x0 0x10010000 0x0 0x1000>;
> +	clocks = <&prci PRCI_CLK_TLCLK>;
> +};

Reviewed-by: Palmer Dabbelt <palmer@sifive.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
