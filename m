Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 129AFC433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Feb 2022 20:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JuP+SThGA36p6Dtl5N0rWBDouPE68s8Gpu1YTO6X7lM=; b=pzxRlCt6RB/fKk
	znCOEcJalt8lfFrphkMAf6PopGUrPEzk3lF9sU8l3cnFzVR/0KE/YHUSn7Qib5tukBYdFrZhkZpS9
	cVOEobWc1YJYD75Q+p/KNM5Nea+M1XAToHTyiasI+uzYzLeyvF1yQWPYs922d55vmZ2ArKEGYo9OU
	rQZNUyQpNnvOu9t/TPw2hV+FSyDgkTME6lFef7fP0Wz01Lx9oQYg4zNmCMuI+JpP3HUzIdgdw9AdR
	EHL86lkf0+qUX4n+46cyooBuokdEb1adMq8qxInf6ZD/k30Cy/nOROOgNSqeh8oY69616bfuS7Vo6
	DlUEzj0kP3fmhtlThBMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHAKZ-00BeXg-AW; Mon, 07 Feb 2022 20:09:47 +0000
Received: from mail-oo1-f45.google.com ([209.85.161.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHAKW-00BeWm-Pq
 for linux-riscv@lists.infradead.org; Mon, 07 Feb 2022 20:09:46 +0000
Received: by mail-oo1-f45.google.com with SMTP id
 u25-20020a4ad0d9000000b002e8d4370689so14992418oor.12
 for <linux-riscv@lists.infradead.org>; Mon, 07 Feb 2022 12:09:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ttZ5bEvqZjIQmVs2OzberAWTk47diq+NL3G4lhS0EoU=;
 b=kMoFnXEMjxBhJ1S8wa8NjiHBoZ+QKEzpP+pyzyhhnZhGvy7gmWF5d+6LBuloB3yNzh
 pLItuGOGCxt4Q0W6SzuTTaCgQJbVNnvk/d6pOwocUc/tBPZeDKNhYEqdE1TyVglV5QV5
 H4kB5fqa6KnUi7okeIleqblc6svtN4ixGXgRr7FfdILQG7UeRYuO1DzYseg7jcQCo5DN
 rZAO7HMINx6y5110WFRyivqxmQkIiVeQuLWIRkmX04YVjgz05c/BYxF4O2gDGUrEncSC
 yOuq2djHzTKFQ+XuH2v8sbeOiZhq5QDZy/JO9JzkTh/oXV2E1l43BdQDHEgK+OsZOEXR
 xfcg==
X-Gm-Message-State: AOAM531BYxC0QSwvlWhEUGvKxd7qbrVQegKoZNc2Rk3I+NJxqkK+I0Y8
 V4H/diVKP4owdkqlZJMEog==
X-Google-Smtp-Source: ABdhPJxQvqoRhiuE4eZoltL7bwVfENjxLmaf/fmvJxmAzjJWBu2Pt3FTdl2kIbPQ5qyr6OxY2RuXcA==
X-Received: by 2002:a05:6870:13cd:: with SMTP id
 13mr198485oat.344.1644264583555; 
 Mon, 07 Feb 2022 12:09:43 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id a19sm4404440otf.27.2022.02.07.12.09.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 12:09:42 -0800 (PST)
Received: (nullmailer pid 823748 invoked by uid 1000);
 Mon, 07 Feb 2022 20:09:41 -0000
Date: Mon, 7 Feb 2022 14:09:41 -0600
From: Rob Herring <robh@kernel.org>
To: Zong Li <zong.li@sifive.com>
Cc: robh+dt@kernel.org, dmaengine@vger.kernel.org, geert@linux-m68k.org,
 green.wan@sifive.com, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, vkoul@kernel.org, devicetree@vger.kernel.org,
 bin.meng@windriver.com, Palmer Dabbelt <palmer@rivosinc.com>,
 krzysztof.kozlowski@canonical.com, conor.dooley@microchip.com,
 paul.walmsley@sifive.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: Add dma-channels property and modify
 compatible
Message-ID: <YgF8hR7YO3B3QI+S@robh.at.kernel.org>
References: <cover.1644215230.git.zong.li@sifive.com>
 <30430019105af445d52b7a48331c106f8e6d6816.1644215230.git.zong.li@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <30430019105af445d52b7a48331c106f8e6d6816.1644215230.git.zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220207_120944_871083_F069E599 
X-CRM114-Status: GOOD (  10.73  )
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

On Mon, 07 Feb 2022 14:30:38 +0800, Zong Li wrote:
> Add dma-channels property, then we can determine how many channels there
> by device tree, rather than statically defining it in PDMA driver.
> In addition, we also modify the compatible for PDMA versioning scheme.
> 
> Signed-off-by: Zong Li <zong.li@sifive.com>
> Suggested-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>  .../bindings/dma/sifive,fu540-c000-pdma.yaml  | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
