Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A94E6C3DA7A
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Dec 2022 20:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sb0b/0VfPy2MwQtt0l5T8f3RTv0TKWn/Ub2oj2jNouc=; b=LRj3fkyuPbo6iz
	tlzTRtt6l4iWGiKKCSUUcyUlCnsXrJJRmOOcMmHZlft3y5UXu/ye2biA8/wYpLB06tV/ZAf1K6cs5
	/TPpUxLJiiaUoYb7HCnUV52/WmKj9IQhm6BBfSPC6nDnjuACUAFo6lkPULBkQC3RmLd0+Qb228s38
	kdVIdTD76hYE9fqBDO9wKzsf7u/tn0mNo47ZP/GIAj+qidKQvSOZVuyBHhoNrwaaDsLHWijP0tMSY
	PNPzye+Xm4+6E4SalGkKCO+NTANpBY1xJJrTF063GvWwvZ8tQG2FGN0I6sIY2wAttShhi9wOAXVWN
	tu9HdutRhNgfzGvu/jLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7j0C-003kYw-8H; Tue, 20 Dec 2022 20:14:16 +0000
Received: from mail-oi1-f173.google.com ([209.85.167.173])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7j09-003kWW-67
	for linux-riscv@lists.infradead.org; Tue, 20 Dec 2022 20:14:14 +0000
Received: by mail-oi1-f173.google.com with SMTP id c129so11603656oia.0
        for <linux-riscv@lists.infradead.org>; Tue, 20 Dec 2022 12:14:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AnKxS9++m3VIKn4BrdHqH0OFOMVypdbQeiV0WBt+YU0=;
        b=ckec/2VehnVOLZvkjDTzY7p4mKwc3h3XHZHcbUCYOtRHhEZmxAmN+2DQC2f09Ho+pA
         OsLQuwJI5RqzSoxGb5yDmUB7/F4N3yhrzR5SSWDfugNI4UpcTNMNQ/h8PVq3rQQuCpoU
         l8uZlmDnB98j32jqYIiFfu7PjJMs9e1DXBkoSLKaAh6Dhc/i8N6SslJ/bci72vgkXMA0
         1fJhCQKs2v5iSXnJrXkHJrvi2BSqhgk0IWfQ7THqIdIbwbImXXeN/a+lidAR9bSZjbRf
         +uAxgj5foXEY4hq8hnNfX9rACOf0NG1BTwpYFYlhIxH4M/iwwzbwPsOFMQOJmxvSY20l
         FRlg==
X-Gm-Message-State: AFqh2krThRI36cVV8B94CDz6jRc3nOWQE04hGubEISa1rHQIPa59xOlm
	kBA/KhPylvRyEx3znK0wLA==
X-Google-Smtp-Source: AMrXdXsMarBdy80fqc/N1EbfSl24Enyv6FsBTMobEKk2odxW9aKQmv48o3LiTIAsZ69hNotOG9ETdw==
X-Received: by 2002:a05:6808:dc5:b0:35f:5651:7850 with SMTP id g5-20020a0568080dc500b0035f56517850mr5247634oic.2.1671567250964;
        Tue, 20 Dec 2022 12:14:10 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id be4-20020a056808218400b0035418324b78sm5954236oib.11.2022.12.20.12.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 12:14:10 -0800 (PST)
Received: (nullmailer pid 1011832 invoked by uid 1000);
	Tue, 20 Dec 2022 20:14:09 -0000
Date: Tue, 20 Dec 2022 14:14:09 -0600
From: Rob Herring <robh@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>, Emil Renner Berthing <emil.renner.berthing@canonical.com>, Philipp Zabel <p.zabel@pengutronix.de>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 08/11] dt-bindings: clock: Add StarFive JH7110
 always-on clock and reset generator
Message-ID: <167156724933.1011771.11780111815689299075.robh@kernel.org>
References: <20221220005054.34518-1-hal.feng@starfivetech.com>
 <20221220005054.34518-9-hal.feng@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221220005054.34518-9-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221220_121413_273981_E2A91F99 
X-CRM114-Status: UNSURE (   9.53  )
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


On Tue, 20 Dec 2022 08:50:51 +0800, Hal Feng wrote:
> From: Emil Renner Berthing <kernel@esmil.dk>
> 
> Add bindings for the always-on clock and reset generator (AONCRG) on the
> JH7110 RISC-V SoC by StarFive Ltd.
> 
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  .../clock/starfive,jh7110-aoncrg.yaml         | 76 +++++++++++++++++++
>  .../dt-bindings/clock/starfive,jh7110-crg.h   | 18 +++++
>  .../dt-bindings/reset/starfive,jh7110-crg.h   | 12 +++
>  3 files changed, 106 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-aoncrg.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
