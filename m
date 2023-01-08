Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0645AC54EBD
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Jan 2023 21:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T0htmio+35tvusNJvhhOSto1RPM4Z0TIvG9Cr59DuEc=; b=Xe33duh8kqcJZr
	qWvwzdNPMCWGqNaAtsKC3ZP8hWo1rt72vQswSCaHJKphEBrO2STlm9st02dGuWBuTegHaFKlQ8q+Q
	CYmc4NvWxwrdlgC383dIc0VIoQGLc9KKb2MnfHVVtYNvewfbjfQk3/QC01kXC3ebJL8OHa5dxl9wV
	IMt4Tpa4gI8vnbhMVCCM5SLl+fORuhve2KeCScbhqn3A32nUGTzQcTyRXfeF9ZK4cLxXevEP5MaSD
	+PI6kBwXp6oKuRIK6MffWLYfRaYnm8BoQYE3jQTCTKS7pYiEWHBuLyoIO/00obJ9pfXbB49S0O6n+
	o16HYikmw2b63G124ubQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEdXW-00Fvlj-Vl; Sun, 08 Jan 2023 21:49:15 +0000
Received: from mail-qv1-f42.google.com ([209.85.219.42])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEdXU-00Fvkd-0f
	for linux-riscv@lists.infradead.org; Sun, 08 Jan 2023 21:49:13 +0000
Received: by mail-qv1-f42.google.com with SMTP id m12so2948166qvt.9
        for <linux-riscv@lists.infradead.org>; Sun, 08 Jan 2023 13:49:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dXCsyxif2yL7a8wGYb819nDDXeZSm3UGb9NtadKhdBI=;
        b=cjEHMzvuhOOCec1E5IIy4HuUx+ceVNipXGJ31T6DgrWhObJSPkkiGWXmdwChWS5gS5
         9mh7yzHdjFQ4FeSuJupR70yFgKjOSaS+RxGduuNBUi2QysF1wcZ139DLf0k/OHsUtskR
         m6ttxo/fuZEWAn2omIk0jqjYzJh50VPb5B8PQC/QRk1oLA8yiHLUjoKe2et07a/Q8Adk
         FD49iyPvatd6CG4t9KDabuObGFfWrKoa+nrXXwuXy0mKYEImoxSD5AD8pEUdwWxl2tT+
         X7ijatZo87XdI/5+U5K6oTrV/bVuJ56X6svvTT3jKPF5ayxoHCQo8Xgx22aVOuJVShPC
         oofg==
X-Gm-Message-State: AFqh2kp7QxBy0zz4/NZC7hhALpJ/R6xQCelOxcvP+MLAK3GcBgR5zfy0
	kPQvHO9wxS+cGj3ume906Q==
X-Google-Smtp-Source: AMrXdXsGVlFem7qt1wF5RhNU3PoZj1JztlOL5eeskVLDXOJLHgkObcBFo0c3IKdwZWrKRJQfw4H2fw==
X-Received: by 2002:ad4:4152:0:b0:532:2d6c:5deb with SMTP id z18-20020ad44152000000b005322d6c5debmr3471180qvp.27.1673214550599;
        Sun, 08 Jan 2023 13:49:10 -0800 (PST)
Received: from robh_at_kernel.org ([2605:ef80:80a5:9b51:39ae:24d1:33f3:811e])
        by smtp.gmail.com with ESMTPSA id x10-20020a05620a448a00b006faa2c0100bsm4294554qkp.110.2023.01.08.13.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 13:49:10 -0800 (PST)
Received: (nullmailer pid 325792 invoked by uid 1000);
	Sun, 08 Jan 2023 21:49:07 -0000
Date: Sun, 8 Jan 2023 15:49:07 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Alex Shi <alexs@kernel.org>, devicetree@vger.kernel.org, Yanteng Si <siyanteng@loongson.cn>, Ley Foon Tan <leyfoon.tan@starfivetech.com>, linux-kernel@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>, linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, palmer@dabbelt.com, Rob Herring <robh+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v1 2/2] dt-bindings: riscv: add a capacity-dmips-mhz cpu
 property
Message-ID: <167321454620.325726.1419996484202189237.robh@kernel.org>
References: <20230104180513.1379453-1-conor@kernel.org>
 <20230104180513.1379453-3-conor@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230104180513.1379453-3-conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230108_134912_239212_E2297E90 
X-CRM114-Status: GOOD (  10.98  )
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


On Wed, 04 Jan 2023 18:05:14 +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Since commit 03f11f03dbfe ("RISC-V: Parse cpu topology during boot.")
> RISC-V has used the generic arch topology code, which provides for
> disparate CPU capacities. We never defined a binding to acquire this
> information from the DT though, so document the one already used by the
> generic arch topology code: "capacity-dmips-mhz".
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
