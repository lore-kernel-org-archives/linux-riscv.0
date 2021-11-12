Return-Path: <SRS0=QS6p=P7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6FD1C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Nov 2021 19:45:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EAD661078
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Nov 2021 19:45:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7EAD661078
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/UCiOxCibwRdyZ+1IpHhTawb8FYT8HZlRpIJ7MdHUHA=; b=PFDrejyBR9/Mg4
	HUGFh876eK/m33CD2eKjHxLGX/U82ftzCLd2sYr9h01VnFJcClgcS9sa8ezGF5B8sOf6ojUjQC7TG
	0N+mYuPVoOb7iESbq16CcpluYz+LCGkjI53CY9j0J0mN5gEj8K5xkQu9gMhsKruj5hFKBrwnOq2OM
	B0vt+OZC5BXuvLMaBiDTebXLMObzZWJX7TWLgZC+KUQimCGzuzD2IqfBMeoR4U0cGkE7t0HCjaiAv
	6i/j8qh8ehkbraCYcL5dXDAQIJW57++cXSSDoldLoWRtN3Ut5+sH9McFNkGsQECmRxoyJo/PTQfzr
	zfKXuC3uqL9FrqFgle7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlcUC-00BUmr-TN; Fri, 12 Nov 2021 19:45:20 +0000
Received: from mail-oi1-f170.google.com ([209.85.167.170])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlcU9-00BUmR-Ur
 for linux-riscv@lists.infradead.org; Fri, 12 Nov 2021 19:45:19 +0000
Received: by mail-oi1-f170.google.com with SMTP id bk14so19826516oib.7
 for <linux-riscv@lists.infradead.org>; Fri, 12 Nov 2021 11:45:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=o9jrDKQ4fjNCOUEJ8zhk4VvvXrOjUmo60wVpBZ9U9F8=;
 b=Ddeb59GbSTuqxENMgsLAFL6Ba7dSnpsCRKlWxeK+/IJq+r8vNkLIn6DlEvboU8ZrCz
 XRwOZQWNR8QR1MncVozLGi4HJA642su5uZMmzxKnwKM5JNI4otI0/kd3aV1vEmGQ3shf
 Xj1j2eXNvDKJ4Z6SG5Q9P0t0HgrPXNx+QiiJrg9DzEfT7YYmbpwnWa99WKQQVWEzQve9
 qJggHB/RjoS1eiQKdw8jr4Qx+yb/W+Zklt8RvnqzdvHD6q1EK4kYU9tp/KdUI/1EyUL+
 IT9Z4rzVpa3/XVRH59zYZ3omYKulBj3dYEZKn+pAPgX3+TStfiH0Oc7NXhSMJueq894e
 S42w==
X-Gm-Message-State: AOAM5316y9+SZwF2PoBUHWo5PRi2JVffAtxSP8aDJHDIm72uE4nEBNnM
 xMmG/2aX3TKfWa2S6CtKW9FtMfB6DQ==
X-Google-Smtp-Source: ABdhPJx7UiZWuIIzis3sJr5PzLy6sye+NuATX+XCzj4kjnL1/QRPGd1ZXk5+V8nbpJJnSbNEH1rxwA==
X-Received: by 2002:a05:6808:30d:: with SMTP id
 i13mr15277616oie.11.1636746317276; 
 Fri, 12 Nov 2021 11:45:17 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id 64sm1385919otm.37.2021.11.12.11.45.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 11:45:16 -0800 (PST)
Received: (nullmailer pid 3249418 invoked by uid 1000);
 Fri, 12 Nov 2021 19:45:15 -0000
Date: Fri, 12 Nov 2021 13:45:15 -0600
From: Rob Herring <robh@kernel.org>
To: guoren@kernel.org
Cc: Guo Ren <guoren@linux.alibaba.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: vendor-prefixes: add T-Head Semiconductor
Message-ID: <YY7ESxm59ARj1J8h@robh.at.kernel.org>
References: <20211103020921.3870764-1-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211103020921.3870764-1-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211112_114518_013980_4016FE2B 
X-CRM114-Status: UNSURE (   8.35  )
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

On Wed, 03 Nov 2021 10:09:21 +0800, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> Add vendor prefix for T-Head Semiconductor [1] [2]
> 
> [1] https://github.com/T-head-Semi
> [2] https://www.t-head.cn/
> 
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree <devicetree@vger.kernel.org>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Applied, thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
