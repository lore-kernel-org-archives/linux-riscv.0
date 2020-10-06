Return-Path: <SRS0=uiah=DN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 936B4C41604
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2020 18:43:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D713920760
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2020 18:43:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LQvXKsfW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D713920760
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=73uo2e8r3lKG5w9IsJJ7D211QITFyaBPu67sjXIZdkU=; b=LQvXKsfWJzO8SR1QGtyDlBQ14
	psBVVxcxUmlR8wC2MZXUbJ2D/IYGJ5/T/D20BWpuNc4rZxLdJf4lOGo8Uh5VmBBWGi1WGiAcVfaNb
	M1Lf+QB7ymr5DLdnQAWqSxpN3zKZbL/7QHU9TcO2ZJvmBvA7ysrGt27F3UKGe3NZurbahjwijR0XJ
	UfTTT9IF7o2kIalggSnVlIyQXSRORNREXitCkgb+DPJ6Bgd3XUBaO6xWaGonhorI1ijbzM1nWjmiP
	tNqG+LaK4S+vTfBnqKHEF8r7FjWUZgFI1ZXLcSJ7taTtZVHOYu+acjLpDwQCOCN5ODj27cyYE+gs+
	nDVJ1pe8w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPrvL-0005ZX-KF; Tue, 06 Oct 2020 18:42:55 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPrvI-0005Y4-7O
 for linux-riscv@lists.infradead.org; Tue, 06 Oct 2020 18:42:53 +0000
Received: by mail-ot1-f65.google.com with SMTP id t15so2870576otk.0
 for <linux-riscv@lists.infradead.org>; Tue, 06 Oct 2020 11:42:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KYQZSGGUfzjIz2aYKUs4zyuEx7lVqSUr955zVXov5rY=;
 b=oiMja3fPgFYLBQKT0j5PQHBk5sKd7XMAv9rIT+/XSUYg83RzDTr6v9KqC0uwhUW817
 t6Jr+NDdgj/26W/lAZh4zQJ7HzXsp+JSiu3hDKoUElxko92T+00P8IjWCdKVFiwvt7Hq
 V8aXn7K448ecwHptHMI0kTIXF8gzwuxglYFni9xo5zBrJ40IhSeATRxtne63ziEa4OPv
 ksSl5OIOrQO4mXDcDR5leCeDUKgDh32i/CPL06X8pnOEhdA45kHXWk3D7AdM99AVrmWF
 /Pdpc2QsJ3rS0KY5F42X4YpyETIob2kbhZGqE7gbQGw6XD+OMZ3I/x6cz/8T03jmVckV
 Oteg==
X-Gm-Message-State: AOAM5329TXwNnhkd0iQLVJPOEGYLy96fgNTUeDmH6Vt4hOiKajKNKhsK
 00bSZELvXkBJb3VWYTZd3A==
X-Google-Smtp-Source: ABdhPJzom6MO5LWQIj8s1jNk3KH+WH7DxMxNrz6HBIoFb0hig8R0gSLa3cSfIY9gZ7i9CWnFNxoOpw==
X-Received: by 2002:a05:6830:134c:: with SMTP id
 r12mr3616282otq.240.1602009767007; 
 Tue, 06 Oct 2020 11:42:47 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id b1sm1413987oof.8.2020.10.06.11.42.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2020 11:42:46 -0700 (PDT)
Received: (nullmailer pid 2610374 invoked by uid 1000);
 Tue, 06 Oct 2020 18:42:44 -0000
Date: Tue, 6 Oct 2020 13:42:44 -0500
From: Rob Herring <robh@kernel.org>
To: Sagar Kadam <sagar.kadam@sifive.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: fu540: prci: convert PRCI bindings
 to json-schema
Message-ID: <20201006184244.GA2610231@bogus>
References: <1601393531-2402-1-git-send-email-sagar.kadam@sifive.com>
 <1601393531-2402-2-git-send-email-sagar.kadam@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1601393531-2402-2-git-send-email-sagar.kadam@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201006_144252_278110_A759B657 
X-CRM114-Status: GOOD (  10.82  )
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
Cc: linux-pwm@vger.kernel.org, aou@eecs.berkeley.edu, jason@lakedaemon.net,
 devicetree@vger.kernel.org, sboyd@kernel.org, maz@kernel.org,
 mturquette@baylibre.com, paul.walmsley@sifive.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-clk@vger.kernel.org,
 yash.shah@sifive.com, thierry.reding@gmail.com, palmer@dabbelt.com,
 u.kleine-koenig@pengutronix.de, linux-riscv@lists.infradead.org,
 lee.jones@linaro.org, tglx@linutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 29 Sep 2020 21:02:09 +0530, Sagar Kadam wrote:
> FU540-C000 SoC from SiFive has a PRCI block, here we convert
> the device tree bindings from txt to YAML.
> 
> Signed-off-by: Sagar Kadam <sagar.kadam@sifive.com>
> ---
>  .../bindings/clock/sifive/fu540-prci.txt           | 46 -----------------
>  .../bindings/clock/sifive/fu540-prci.yaml          | 60 ++++++++++++++++++++++
>  2 files changed, 60 insertions(+), 46 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/sifive/fu540-prci.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/sifive/fu540-prci.yaml
> 

Applied, thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
