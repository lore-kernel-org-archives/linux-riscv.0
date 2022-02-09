Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A19C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Feb 2022 04:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+d7dw/+SPmqDn7qd+Il8v+lyHKA1WtWd/N2h35XmuH0=; b=kvpX/or1a5xp01
	WghH9GZiebdfbrPGEe7Md2UQzriiHuM+6KUbNRgyBfl9Y2B2TjEvz2gO2oyb1nwaoY8L2oHf/yq9X
	vxanMThn3gsbJSSwa5q0pjCr3Jqe/16CE+e2LgnTxe6+vswnq2qDBmrrCHFO4txt7XixLaRqjspXs
	9wXZvJPk/ZcbiQN7kFLiA31sB9zAeg5I2XvXwTotPCh88l9yoTwoEfvGEhUkCQpH3SLLUU78PQf49
	23llw9jRKtcYLJLjOMJe/io6sYFl1KxkxxPNgTRgblUDwHsVjfuS0H8BfQesv38lum30UEEI2i3Jw
	dA6Jm9KXN61gB2tU9apg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHeEp-00GBPy-Rr; Wed, 09 Feb 2022 04:05:51 +0000
Received: from mail-ot1-f50.google.com ([209.85.210.50])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHeEm-00GBOp-C6
 for linux-riscv@lists.infradead.org; Wed, 09 Feb 2022 04:05:49 +0000
Received: by mail-ot1-f50.google.com with SMTP id
 s6-20020a0568301e0600b0059ea5472c98so694212otr.11
 for <linux-riscv@lists.infradead.org>; Tue, 08 Feb 2022 20:05:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=o3YMeRwUz1ntDWPYVtPYMrCAxcHYKG6DDEiI0zJMrfg=;
 b=lb33FPRaBCwwj0cXrvZuunf+P/dSLumTMmw3SFA3agfXTbdVUoHB4PQb0TdGFwu4ac
 hYcz7ZuAXfqapHICCKRak+0SlRiq/Qrp57wZ+1UfaxmZyKCxQpnAWHwX9098HD9Rj8XQ
 8SCiII0lUOy3z8UVKg8avMSXWvRzwpSGSvaqOxyYnpZOMT5q4A1wQfeM+dqA4bkUcKO8
 6BtvGIV41xg6VWBbYgaCEArCXmdtCmXfN7bE9OJYyonktirGkB4X2r0GXWL7w7YCa7fG
 aoWfNbE8VssGRPYfweirS2eFTiXH1DqeW3ifu9RnHnXnEknzBlhYGC6A7fiF8lZI+iIa
 6AAw==
X-Gm-Message-State: AOAM533QA7HH2aaWe3VmcD4//z+cR7Djj7EyU34wI7Ktw16qIeRARscK
 DUyV3P/SIA1Yth2jTtty2A==
X-Google-Smtp-Source: ABdhPJz9jfeHHaiH+4zU1BTJWQ08GH8RdUKft2JUKLvjWaGoFuEonXdybnOG23G7sSVt+nWlCflSsg==
X-Received: by 2002:a9d:73da:: with SMTP id m26mr225820otk.72.1644379547459;
 Tue, 08 Feb 2022 20:05:47 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id s13sm6218679ooh.43.2022.02.08.20.05.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 20:05:46 -0800 (PST)
Received: (nullmailer pid 3634207 invoked by uid 1000);
 Wed, 09 Feb 2022 04:05:45 -0000
Date: Tue, 8 Feb 2022 22:05:45 -0600
From: Rob Herring <robh@kernel.org>
To: Icenowy Zheng <icenowy@nucleisys.com>
Cc: linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH 05/12] dt-bindings: interrupt-controller: add compatible
 string for UX600 PLIC
Message-ID: <YgM9mdKvrjlEKRN0@robh.at.kernel.org>
References: <20220127151647.2375449-1-icenowy@nucleisys.com>
 <20220127151647.2375449-6-icenowy@nucleisys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220127151647.2375449-6-icenowy@nucleisys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_200548_431107_8FDC7E14 
X-CRM114-Status: GOOD (  10.15  )
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

On Thu, 27 Jan 2022 23:16:40 +0800, Icenowy Zheng wrote:
> Nuclei UX600 series CPU has an optional PLIC (recommended when running
> Linux).
> 
> Add a compatible string for it.
> 
> Signed-off-by: Icenowy Zheng <icenowy@nucleisys.com>
> ---
>  .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
