Return-Path: <SRS0=1KMB=TN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A908DC04AAA
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 13 May 2019 17:25:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CE3F2084A
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 13 May 2019 17:25:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="br0UZ/ou"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7CE3F2084A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6drohYeaOjLn+90WfY5r5DItRYN278aht/LqsoLMGhE=; b=br0UZ/ouSP6V9X
	q8QSdqlKCfKy0JUf/HDplH9hzaBWozgRiieeKp9JJZoxMGYjTtxrSopB2GinLamBdyuhn6sTTCNqw
	+sNvh4I7D/4I/I9kra2XgTeZ3cq7MsqEc4V1lR99vfJf+NZbjrkFNimJfy24f1+qhPzw3twVo9+JZ
	O+SwCjG1JuVByKB9pGzvF0OUq8wG7sCAC2V+8VMHSQPfh0OzPVTlBoqN4pyLHbFSaXaUKGgf2k21j
	ibZwkpZSUe5iEZpxsk0uF05H/Fetd+XHibPIf9YcOZCxjLi6iKFVdDb7cJh8M3YLRGAWQALQ/JGkm
	nOtsWB6KNSOjpVMTayGg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQEhh-0005Jn-JE; Mon, 13 May 2019 17:25:33 +0000
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQEhe-0005JD-Pa
 for linux-riscv@lists.infradead.org; Mon, 13 May 2019 17:25:31 +0000
Received: by mail-oi1-f194.google.com with SMTP id m204so9982592oib.0
 for <linux-riscv@lists.infradead.org>; Mon, 13 May 2019 10:25:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=JwRFo3DhBvhvYNcEC/am2wCgLytVGaHJE4Tx7MDzOp4=;
 b=Qr6bobnPH/2dkdWY/cDEBZg8ajmFF4VVUaEn0IHUNkwT62kA1jEZTQPVEIEPJooeC9
 BpqWsCcPXkuUnhNMPwkkmX89F9HAAB9YuU9bXUCv7FQ/KtO4gMGq7t07zdSX9anjtapK
 TC1WE9o5m8hxCvMmbHdIA0ZgWT1ftXfolvTzGhZvRKdO0g+3dZxRT8f8dop1Ob7L8cO/
 vMCQfPlCZNIseLt1Y0VEa+YkT6y7KkOKReyzCEqwkp/UOu2XN79CM/5eYRDMNShSyeX8
 wWGmE4FGjHJPyf4k955Oob2UkWqoPF9tYADSHebrONUGLRrWm5zZOoTEK34DV8vahaWs
 oAgA==
X-Gm-Message-State: APjAAAVLgzw9fLFA3GN+hQTOHTp7MSF0KmCzOWP9srR1jToMcKI5VM+D
 kGUcGkmJDD4Ixp0z+DPxIQ==
X-Google-Smtp-Source: APXvYqxxLISshsUxt7n5yX3uJx6zHeqA0k1GVSW7x1WBiyHvDX5GZh3BlFLnxcOjpcl857OP85tr/A==
X-Received: by 2002:aca:4c83:: with SMTP id z125mr178279oia.60.1557768329660; 
 Mon, 13 May 2019 10:25:29 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id y18sm5207278otq.36.2019.05.13.10.25.28
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 13 May 2019 10:25:29 -0700 (PDT)
Date: Mon, 13 May 2019 12:25:28 -0500
From: Rob Herring <robh@kernel.org>
To: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH v3 1/2] RISC-V: Add DT documentation for SiFive L2 Cache
 Controller
Message-ID: <20190513172528.GA9362@bogus>
References: <1557139720-12384-1-git-send-email-yash.shah@sifive.com>
 <1557139720-12384-2-git-send-email-yash.shah@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1557139720-12384-2-git-send-email-yash.shah@sifive.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190513_102530_833794_F2BDE546 
X-CRM114-Status: UNSURE (   8.26  )
X-CRM114-Notice: Please train this message.
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, aou@eecs.berkeley.edu,
 palmer@sifive.com, linux-kernel@vger.kernel.org, afd@ti.com,
 sachin.ghadi@sifive.com, Yash Shah <yash.shah@sifive.com>, robh+dt@kernel.org,
 paul.walmsley@sifive.com, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon,  6 May 2019 16:18:39 +0530, Yash Shah wrote:
> Add device tree bindings for SiFive FU540 L2 cache controller driver
> 
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
>  .../devicetree/bindings/riscv/sifive-l2-cache.txt  | 51 ++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/riscv/sifive-l2-cache.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
