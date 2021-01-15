Return-Path: <SRS0=UwrA=GS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 164D0C433DB
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 15:39:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC467207D0
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 15:39:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC467207D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:References:In-Reply-To:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4sfM01hUJTaXlJPX68fBhyFeG9ZmUhgAGDcgwdbLjrA=; b=YHabn07pIHEjfisL6gynpmwPF2
	spGWZNdvOCmsIQZcymbtNHV6ML7f0585Y1f8hM0T/MOMGKRfMHfDStEwdGiOB0OUlVrjIRJ943yDJ
	A7Q2PUdqMO9xdvdJ4IEDix/mbE24kK/Yz0DYiXgxwIc3EREFta/zzeDNMbXDGPEZc4UaMRBVG7+FN
	Y5LKtVeK8xGJAM0PSRLtCMV6Y95CLw3nlDTCKKmCXoOUfs9qXn18sN5yQogmYR85KbUVqL4dv8Lxo
	Wq0QpM1j979/upCyRwshCAomiSQaTgvVMuhcpxOhDrqGvD+b3aM4bTIXI+RidwuY0i27yByg/vpba
	9ZTBoMEA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0RC1-0005U2-2w; Fri, 15 Jan 2021 15:39:17 +0000
Received: from mail-oo1-f44.google.com ([209.85.161.44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0RBx-0005SD-9U
 for linux-riscv@lists.infradead.org; Fri, 15 Jan 2021 15:39:14 +0000
Received: by mail-oo1-f44.google.com with SMTP id y14so2283497oom.10
 for <linux-riscv@lists.infradead.org>; Fri, 15 Jan 2021 07:39:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=94xkx+0r8OoT6ih6r+wvNCHlyCkX38ZU2pCIwQ+F1Os=;
 b=aj3R0VR3p76yOZbKeopRBc558Y+Eo/pNqkSYebAjvVkm5xvqtudNlQj66wCstcEHXg
 ZuMoG5o5gw1HmQL33ZxKHvxRu/Mce59npIetjwZGO8ubMcvCJp/uUSeOkFHDYBAera1D
 W+1iVY6ml/rAccLJK0z3JyXrdb3yH7rBmIxiy8ZyeUJIvDSHmZdlSHRVV+pgoiwiHzlY
 vtCYrKkK1Xt76WTWUK6GfrFXo/y5igxGHmzQm1R3koTP6tDCHvbsQZVDkzrpz3Mz9k3R
 8i9d0qDX28goEW3vhL9i9L0gW4/B+BQ905I6GwxC1bW6MDaiIED0LO+dFsBpDqV3lS1F
 RjQQ==
X-Gm-Message-State: AOAM533DVIQjUO6WbHt/AL63uvoHyckJuhAEu0jX4+8rptL22e0xFygz
 BSh/ND6IQxNOW4BCxNzC5A==
X-Google-Smtp-Source: ABdhPJyL8zfTEZXUqiakxcaGWlJvzJbNssl5LSkAF2uY0V4vq3RryGCrQkMEp0nP8mwv9xJpwOdUwA==
X-Received: by 2002:a4a:a11a:: with SMTP id i26mr8681904ool.54.1610725150668; 
 Fri, 15 Jan 2021 07:39:10 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id z189sm1728067oia.28.2021.01.15.07.39.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 07:39:09 -0800 (PST)
Received: (nullmailer pid 1311459 invoked by uid 1000);
 Fri, 15 Jan 2021 15:39:04 -0000
From: Rob Herring <robh@kernel.org>
To: Damien Le Moal <damien.lemoal@wdc.com>
In-Reply-To: <20210115140352.146941-9-damien.lemoal@wdc.com>
References: <20210115140352.146941-1-damien.lemoal@wdc.com>
 <20210115140352.146941-9-damien.lemoal@wdc.com>
Subject: Re: [PATCH v12 08/17] dt-bindings: fix sifive clint compatible string
Date: Fri, 15 Jan 2021 09:39:04 -0600
Message-Id: <1610725144.899521.1311458.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_103913_374258_E90DAC4A 
X-CRM114-Status: UNSURE (   9.94  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Sean Anderson <seanga2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 15 Jan 2021 23:03:43 +0900, Damien Le Moal wrote:
> Fix the Sifive clint compatible string definition to make the value
> "sifive,fu540-c000-clint" optional, allowing a DT to specify only
> "sifive,clint0" for its generic implementation without any tweak.
> With this change, a Sifive clint node can now be defined as explained
> in the compatible string description.
> 
> Cc: Anup Patel <anup.patel@wdc.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  .../devicetree/bindings/timer/sifive,clint.yaml          | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/timer/sifive,clint.example.dt.yaml: timer@2000000: compatible: 'oneOf' conditional failed, one must be fixed:
	['sifive,fu540-c000-clint', 'sifive,clint0'] is too long
	Additional items are not allowed ('sifive,clint0' was unexpected)
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/timer/sifive,clint.yaml

See https://patchwork.ozlabs.org/patch/1427053

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
