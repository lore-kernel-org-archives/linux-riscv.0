Return-Path: <SRS0=Au/l=E2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60EA9C2D0E4
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Nov 2020 20:50:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFD222223F
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Nov 2020 20:50:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rTAHi7Wu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFD222223F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BaDgNxUDX7e+56pkKJJPuo8TiUp9ZsIma1HcWgWyetA=; b=rTAHi7Wu5lbb9fXkA0qNbM4vC
	uv94fRWJ7oJXRbK6tnbsgeJhMvpJq+fpeEE1HzZMuA8cVQ6Xkn3BhQjYY6piPLppZp+a+ZY7mQnZ3
	d8SNAgf9DVGom6ObjTYqr6eW1xIpDt4Y53ppGBP3E+UKw0kj6aJi3C7ItVdn1QEQN9RPk3kxtCRMK
	JP/6tALjGA7hn+/rEwE7UBE2pIO5J5Bg5BfQ1j+4qj4y7122AruW/nNYtpJZ4J7zZ0zmY2PeaW1Ng
	Sgwfdoba/Q9eAdveadJ1t6o0n09Tfu+n3Vq+XQ1K17fmXwsjwhtaQjHqCKaDGzOFiJ7bPnxr3aNMK
	dVCrJLo/A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kgDLq-0005fP-Ie; Fri, 20 Nov 2020 20:49:50 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgDLn-0005et-6u
 for linux-riscv@lists.infradead.org; Fri, 20 Nov 2020 20:49:48 +0000
Received: by mail-ot1-f65.google.com with SMTP id k3so9977378otp.12
 for <linux-riscv@lists.infradead.org>; Fri, 20 Nov 2020 12:49:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=W7lQrzdAOjkKYyj6xhzZ9osezKgm+xTXKqwpCCfV6ww=;
 b=lC+I43q/V16z4YnWE3MmrrbS7kHu7UUnvYn7YIs+MA+hij6+9SVjtCwa5HCERlxl+R
 BzXfl8ZWBJJ01BEzhWGWmpNupI2/imZdBQ0HWo9iSEVot7NuL3tczZJWSr16G/hfdto1
 cfPiwjbcuwvwi4qQ1wW/AuTU57spqIvzHHE56vJ7qhxYkyU6+8qVf/2K2ZAZBmYiD7hk
 MRcdLl6VHdKyx4Fc9std8h8mDmgrZc+nCExYxOP76YgabRXnjIQmVXeXz8+q1Vh4A+d+
 xLGTcdrHc/x8Ok30UudKcGFzjoKmrA6cjXvuDANOMasAI89tb/LRuoFPgTaIXDqh5GjG
 uCyw==
X-Gm-Message-State: AOAM532I6rwKH6X7LkNpFa+fLixzE/RHz18cYELVQTIQRtbefgt0UeLc
 faRrYzqKjOIRwORWTOapeg==
X-Google-Smtp-Source: ABdhPJwFwQxEgu2ijMwd81pNY9gb8+AhQXIzEh1VSXJFHzyloDGMOlwyz4HZvt2VyCMHaMMpYB9Prg==
X-Received: by 2002:a05:6830:1d8c:: with SMTP id
 y12mr262185oti.34.1605905385906; 
 Fri, 20 Nov 2020 12:49:45 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id l1sm1880646otj.17.2020.11.20.12.49.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 12:49:45 -0800 (PST)
Received: (nullmailer pid 1716977 invoked by uid 1000);
 Fri, 20 Nov 2020 20:49:43 -0000
Date: Fri, 20 Nov 2020 14:49:43 -0600
From: Rob Herring <robh@kernel.org>
To: conor.dooley@microchip.com
Subject: Re: [PATCH 3/6] dt-bindings: add bindings for polarfire soc mailbox
Message-ID: <20201120204943.GA1716438@robh.at.kernel.org>
References: <20201119170432.18447-1-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201119170432.18447-1-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_154947_305668_1DDBEBBE 
X-CRM114-Status: GOOD (  11.71  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, jassisinghbrar@gmail.com,
 lewis.hanly@microchip.com, david.abdurachmanov@gmail.com,
 daire.mcnamara@microchip.com, anup.patel@wdc.com, robh+dt@kernel.org,
 atish.patra@wdc.com, aou@eecs.berkeley.edu, palmer@dabbelt.com,
 paul.walmsley@sifive.com, cyril.jean@microchip.com,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 19 Nov 2020 17:04:32 +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the MSS system controller mailbox on
> the Microchip PolarFire SoC.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../mailbox/microchip,mpfs-mailbox.yaml       | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.example.dt.yaml: example-0: mailbox@37020000:reg:0: [0, 922877952, 0, 4096] is too long
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.example.dt.yaml: example-0: mailbox@37020000:reg:1: [0, 536883596, 0, 64] is too long
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml


See https://patchwork.ozlabs.org/patch/1403152

The base for the patch is generally the last rc1. Any dependencies
should be noted.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
