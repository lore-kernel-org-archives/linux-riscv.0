Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD2DC433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Feb 2022 18:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RMFQm78ZUmlGB0Hl53K/iXa/BnMCMU2AAuTrPuyakSE=; b=xcnTDQiNFy3KAA
	vzQZ/3xCkeDQlwC8h5sQUSItkcC1wH1I0Kk3vmi7EzKmD6UAWz/V9whr4MrIzNihVPsxNs+bfirxt
	H65MPwDuPgwXvTTSQeoa7ltA8Bc6HS7V1+mtOwNw2F7PylCclq1d0SyLwy3nqfLbT+bhm7EMgpn05
	Qf8WAtI6JqWBAZ/51xv/2zUbMdmHG4fiusB1vGKnSgMeMJKaPn5mixaoYR5ioYczS7q91waTj7HGD
	/4ToaO1v+BepDnCwgrOUri0Kz1IDhfcBjxjimy9vx1uiJVXBa+8L8ORzJwH4jR9p2bihnRK21H6y0
	TVF8sTpeEt6Ok6JdPZnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHs9B-001FqD-Fj; Wed, 09 Feb 2022 18:56:57 +0000
Received: from mail-oi1-f181.google.com ([209.85.167.181])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHrzs-001CSX-8X
 for linux-riscv@lists.infradead.org; Wed, 09 Feb 2022 18:47:22 +0000
Received: by mail-oi1-f181.google.com with SMTP id t199so3405812oie.10
 for <linux-riscv@lists.infradead.org>; Wed, 09 Feb 2022 10:47:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Vi9Au0Crkys221dhKz7ZSE2Xq4A6zOmUcKMnPw7BPg0=;
 b=ljbvlYpKWk/Idghsj/4XcioGz4aWAOZVQMd7UN0lE6NTl9VplvEwPbhtLb7M8NhJ0o
 DLGAMiXpGgyMUXQhRR+VgxaRghZW1adgWLPqeziga4Pg694cWE72JMdRIofHHJr2LSqP
 4z7OUKpNeEw1f5iXNweryC9XQnGj5k9ZDQl3QQCKrR8FNm1UT5cOHvDQxw8Jh+T/NYOZ
 ZIDj76BXHVch97CI/rPD/4Jg6uiclK0H8Y/0wN4xPIjY7lvRwuX3xHdC1cO7sRNOW5gh
 cDLzTdTtuSel8gTJqH8mxAlhfyYdsjcM4Ri1dgJY2u304FjWaT+/+W9OebjHcvGv4oRA
 04Iw==
X-Gm-Message-State: AOAM531YknYKNUB2mpD5i6kRL28T5d5YDygYdXCe2rndkn7WTH2W3Fc8
 F1kcMWCANdfmlQSxCprizg==
X-Google-Smtp-Source: ABdhPJz2/34m/qedqsW5DnC2O+nTKA3JCDJGbT7oI2zsMJoDh9v3/cY/jxcuG92UIOEWq8AUGvWeXw==
X-Received: by 2002:a05:6808:1899:: with SMTP id
 bi25mr2020002oib.38.1644432438872; 
 Wed, 09 Feb 2022 10:47:18 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id g9sm454209oac.3.2022.02.09.10.47.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 10:47:17 -0800 (PST)
Received: (nullmailer pid 675998 invoked by uid 1000);
 Wed, 09 Feb 2022 18:47:16 -0000
Date: Wed, 9 Feb 2022 12:47:16 -0600
From: Rob Herring <robh@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: hch@lst.de, linux-kernel@vger.kernel.org, maxime@cerno.tech,
 huffman@cadence.com, liush@allwinnertech.com, xinhaoqu@huawei.com,
 behrensj@mit.edu, anup@brainfault.org, jscheid@ventanamicro.com,
 allen.baum@esperantotech.com, philipp.tomsich@vrull.eu, aou@eecs.berkeley.edu,
 wefu@redhat.com, arnd@arndb.de, andrea.mondelli@huawei.com,
 paul.walmsley@sifive.com, linux-riscv@lists.infradead.org, robh+dt@kernel.org,
 cmuellner@linux.com, drew@beagleboard.org, rtrauben@gmail.com,
 samuel@sholland.org, palmer@dabbelt.com, atishp@atishpatra.org,
 mick@ics.forth.gr, devicetree@vger.kernel.org, gfavor@ventanamicro.com,
 wens@csie.org, guoren@kernel.org
Subject: Re: [PATCH v6 11/14] dt-bindings: riscv: add MMU Standard Extensions
 support for Svpbmt
Message-ID: <YgQMNKXytqFZFiib@robh.at.kernel.org>
References: <20220209123800.269774-1-heiko@sntech.de>
 <20220209123800.269774-12-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220209123800.269774-12-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_104720_360433_AE8FF107 
X-CRM114-Status: GOOD (  10.92  )
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

On Wed, 09 Feb 2022 13:37:57 +0100, Heiko Stuebner wrote:
> From: Wei Fu <wefu@redhat.com>
> 
> Previous patch has added svpbmt in arch/riscv and add "riscv,svpmbt"
> in the DT mmu node. Update dt-bindings related property here.
> 
> Signed-off-by: Wei Fu <wefu@redhat.com>
> Co-developed-by: Guo Ren <guoren@kernel.org>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> Cc: Anup Patel <anup@brainfault.org>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
