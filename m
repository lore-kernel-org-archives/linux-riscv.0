Return-Path: <SRS0=SYmu=JK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F413AC433ED
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Apr 2021 15:15:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB453613B3
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Apr 2021 15:15:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB453613B3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wg+NJWIOIJXR87N05lLY+FDaLnjDtcdzklBU2wF6rTo=; b=cdTZvSeY5Ibs08Airro9Xn11v
	66sHAw/pXUTKddomWCzY/rLprY4cqNcLe9R2+5QNwNOCtR2WVqRRj/HAY9Il3hFi/jEbcYZ3y0stt
	ac8URqzVZ2ICAitoy0xteG3EELFnnY2iysEbkI7k5Aej1AIN1yfMT0qMsdtiashPQ4PwEuu+Bu20M
	VY2yoTMPYrwQVwJU7sPVbx/9OB3Z780AqRhtqwkmDPzE5Gavuk5wsJKNjFTRYmr6ACUFdzC25VWbu
	ncnWHIRVv+E/ogVtaBYOLfCHxmhKDUQ6SCHItx6/l18BRAbmuAo1wIMgwZ7cHR+cjEQC6wamc2tPs
	RgVozTnkQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWKkf-009bnN-Oi; Tue, 13 Apr 2021 15:14:56 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWKiA-009bYJ-Re
 for linux-riscv@desiato.infradead.org; Tue, 13 Apr 2021 15:13:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=22TlbBmLcZtJdq+EGatr2lL7zH0xUnGZei/eZL48P9I=; b=f+sxNew3tSSurdCXTTrQLa173G
 trQf5kX6s3J6srieXweR5ogMnxtFd3phpttgPe8W8kQGUkQQqQc4b/VjIIhEHW/XBazIuIsmvhGY7
 zh/gBZURee19j7gy9FSpJR31hxrW+/wze4F41bPm6zbqSAIsClnHAXXI2NtzL8Gkb6VGMXGHvLQJd
 cMcRLmGkZ30/OmJuamGEQXDFEADVP45eUn4z3I/WuQPbNXKxNLivx1lZNl7l5LN8fLZT8UJ9C/lMd
 pFV4CRGmH6DUXZVmsa1Aqu1AeNn5pz4Rg7zI7fMw1rFkuuwm1Km/WY6aPReo44Xrcc1zDl5kzMXwC
 ITWCjJGg==;
Received: from mail-oi1-f177.google.com ([209.85.167.177])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWKi8-0078Gj-I7
 for linux-riscv@lists.infradead.org; Tue, 13 Apr 2021 15:12:17 +0000
Received: by mail-oi1-f177.google.com with SMTP id k18so12417966oik.1
 for <linux-riscv@lists.infradead.org>; Tue, 13 Apr 2021 08:12:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=22TlbBmLcZtJdq+EGatr2lL7zH0xUnGZei/eZL48P9I=;
 b=AW+NlzJu284mUNsL2Thx39qtxOPJ7l7ObDSJFglDjZ8QrYngx78B3gbYnZXnu9prH7
 MzkDYqNiUKTIexc4V03t5BThuHnQKCt4HvJ1pKQVLQ+vvqQZBnNZp440APt11QX4fmJr
 rRw7kWXDRV7kfvRNdc8xTh2xIC9S5fXOs4/KgrnF+FGE+OfsWzpQxa6bnLCI8DC8hl+5
 daNsZBRJ44J2e+/+d2abPt3EViwqV8mmsUqgyFDlEGOjmDzdTjY//zGvQ49XwA7XvF7j
 29KIvi6+LorJ5TUW7R00K1JAD+v7u1vhAUiLxQYYvT2d15LbTIuENlMCHtJ+2TJ2Mnk+
 bdkA==
X-Gm-Message-State: AOAM532xTTaC8gAUsVrYJBU8Ru7EZLAOcI/ELv2Vv+pzAuBHQabTNQbR
 7VIsXPZ7tQOd/Jf+G2RsUA==
X-Google-Smtp-Source: ABdhPJyIaSH+KUgDkSq0CLMTGB179U2mn6l1vPdGqztSpb5/2veBtPqLM/Saoij4gtSzzvS5TSMuqg==
X-Received: by 2002:aca:c304:: with SMTP id t4mr351454oif.125.1618326735162;
 Tue, 13 Apr 2021 08:12:15 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id n25sm544750oop.13.2021.04.13.08.12.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 08:12:14 -0700 (PDT)
Received: (nullmailer pid 1689345 invoked by uid 1000);
 Tue, 13 Apr 2021 15:12:13 -0000
Date: Tue, 13 Apr 2021 10:12:13 -0500
From: Rob Herring <robh@kernel.org>
To: conor.dooley@microchip.com
Cc: lewis.hanly@microchip.com, j.neuschaefer@gmx.net, cyril.jean@microchip.com,
 damien.lemoal@wdc.com, jassisinghbrar@gmail.com, anup.patel@wdc.com,
 devicetree@vger.kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 daire.mcnamara@microchip.com, robh+dt@kernel.org,
 david.abdurachmanov@gmail.com, paul.walmsley@sifive.com, atish.patra@wdc.com,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 1/5] dt-bindings: add bindings for polarfire soc mailbox
Message-ID: <20210413151213.GA1689282@robh.at.kernel.org>
References: <20210412160358.19309-1-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210412160358.19309-1-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_081216_614828_55798BBC 
X-CRM114-Status: UNSURE (   8.77  )
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

On Mon, 12 Apr 2021 17:03:58 +0100, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the MSS system controller mailbox on
> the Microchip PolarFire SoC.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../microchip,polarfire-soc-mailbox.yaml      | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/microchip,polarfire-soc-mailbox.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
