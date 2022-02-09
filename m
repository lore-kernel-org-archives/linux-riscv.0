Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50BF3C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Feb 2022 04:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hx70xP1KSEqYvw+i+dEboRBF5AXn0DYG7z2PNFUgApE=; b=Okoe4TjDQn0ABw
	oWr/bY9TESAf79hZMQFPSpddZSTBv79uWrJZcuBI/cFAA+EdBi6ENBI0PAwPfyxK7fYFgTMbfeKFj
	/ZhCO0N6VffZ9fTfRB/Kk2i85X7RC3wHEnF7OX8x59dBSpA2wQqCtLqc5c/BlG9oPE1BYjh7N+fG8
	8CTvltX006pJitQAneeeHkMclL+CIwO9kedOYT5GVxgB3PXQ3j+WKipDZ+1U8/cMCPihliSF7Ba9T
	gMZiVSvFG+7j58qOq+Ywee/lZWkyQ1ZZ60w6MMzx39UUwlonItoG+Eg3ZvK8XbyYvGidHlMcUUj/Q
	JzXJfq9vI8/bNmgunFaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHeFB-00GBVD-LJ; Wed, 09 Feb 2022 04:06:13 +0000
Received: from mail-oi1-f178.google.com ([209.85.167.178])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHeF9-00GBUY-Bi
 for linux-riscv@lists.infradead.org; Wed, 09 Feb 2022 04:06:12 +0000
Received: by mail-oi1-f178.google.com with SMTP id u13so1293884oie.5
 for <linux-riscv@lists.infradead.org>; Tue, 08 Feb 2022 20:06:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=b6SaNmycVybeDF6G9H1cZ2sPN7HYXMYSiZUwDNcdJwM=;
 b=1tL3NJizwHxKvSzJtsTAk8EfFe1QDY3z2lNbiP71k6cDO1ixKE41TxMTVvZEPnAB2v
 rd/JnyR5LZhLIW88xrHCImlNMKI0Z37ZJIjRP6lRqIKI0bLRdym5cQlY6b9fwNCzc2aG
 ZKrvpAAZa5ZMdotP5W9NCnTFwWtLyT4xmOq+ZVYi35u9xFvQkM5uiVyjVC3NoLyeIZed
 IpbmaFL37qWN0owA24cHVspiXWakHwdEMweTlWDFfpa0WZvWqtzVj2WFVDOBjEzIX3Yt
 ELA3P+zBc4ZrnB2U0PmF7sx6joBiaMFuguM0dN+27yHPbAKbpOmaEM80J4NzH1xd4q9n
 IraQ==
X-Gm-Message-State: AOAM532yO3dIhCyb1BrlOB5JCepooQjmPNwPsHlibkT6GnElYw84QEQL
 MYR310XOloMXARjdOnl7rg==
X-Google-Smtp-Source: ABdhPJw2/c9hvOCvmPL3xtMWamQugOcPTEH7IK/GU9FaJtJSa+90xaUuLZm6DsV+LDiNAcr17ndPVg==
X-Received: by 2002:aca:1011:: with SMTP id 17mr154742oiq.27.1644379570470;
 Tue, 08 Feb 2022 20:06:10 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id i21sm6856720oao.35.2022.02.08.20.06.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 20:06:09 -0800 (PST)
Received: (nullmailer pid 3634884 invoked by uid 1000);
 Wed, 09 Feb 2022 04:06:08 -0000
Date: Tue, 8 Feb 2022 22:06:08 -0600
From: Rob Herring <robh@kernel.org>
To: Icenowy Zheng <icenowy@nucleisys.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-serial@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 devicetree@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH 06/12] dt-bindings: serial: add compatible string for
 Nuclei DemoSoC UART
Message-ID: <YgM9sDyF+dx9JwOG@robh.at.kernel.org>
References: <20220127151647.2375449-1-icenowy@nucleisys.com>
 <20220127151647.2375449-7-icenowy@nucleisys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220127151647.2375449-7-icenowy@nucleisys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_200611_418591_0C1BD5A6 
X-CRM114-Status: UNSURE (   9.87  )
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

On Thu, 27 Jan 2022 23:16:41 +0800, Icenowy Zheng wrote:
> Nuclei DemoSoC design integrates the UART controller from SiFive.
> 
> Add a compatible string for it.
> 
> Signed-off-by: Icenowy Zheng <icenowy@nucleisys.com>
> ---
>  Documentation/devicetree/bindings/serial/sifive-serial.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
