Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEA0BC83F2D
	for <linux-riscv@archiver.kernel.org>; Sun,  3 Sep 2023 22:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vry9mbhGOAqTB5FHXBIGV+hz5CrxG1RyjcV+P2SyceM=; b=Iw9Rx4FZU3dG7f
	4p3tMnXPwhfNj5B1h8lEl7pcVaK7Vr8XbIwZB8YxrVWMg+JflQPwOehHAUfXY63Z5D7EvzWMCScAc
	+BHKLjaf0wzOlSfEDbZ/zy2Ui4CPguPwxU0G+bQLlZKm2FKt3ckGCFg/+lVXu7i/RTmmNFZXJAlRE
	QSzJYlUUZXFCSZdHkNGDQO6nmt4oLFB7v+jGXpeYVuSy4Q/9snO+U0Dkq0u9swhgZyu3B7etd2ISu
	L7rYzewpGV5BiYRerntT8EeOb+kKqeibM1YbSnkXH39Pc2MM/w2OyjlyW0d3TFTa4UG/mLxjb8VxK
	9fmHveJkrt5F6WoTWwHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qcvit-002z1j-2J;
	Sun, 03 Sep 2023 22:37:39 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qcvio-002z0i-39
	for linux-riscv@lists.infradead.org;
	Sun, 03 Sep 2023 22:37:37 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1c06f6f98c0so6764155ad.3
        for <linux-riscv@lists.infradead.org>; Sun, 03 Sep 2023 15:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1693780653; x=1694385453; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=75zjcGnVwfUfJUqEwa2RDdihaMKUFMKRhK0oHtPsQNI=;
        b=aFACgJgO7IQ/9FJub4f6sDDnqaHDeqKsQdRp5zwMuwy0Gam3tHzO9zcVQkmH/wqe5e
         VhUjSATCZiX4NzDHMS06S2TWs4hn8joRY0bfYOIobNZjyPqHkhIIwb+EphEzCuOsQnTX
         yArzbjtsdnV7QZOuJ7D29bF6rGcrj62eIDFEL4P5Pm+R7sdFyPYEmlTHAG/k947oEcHm
         fw8i2s3r1IU/xPZU3gXNNR67x9Mpdmfb+TqBNGu8VDCyQiT0tpc8My5OWXXGsAOl+M/1
         Nne5uD/w9Jb6Pg07L4/FBvUEBwZMSy9n4lz+hpmE9G3wInY+8gXBc8Bh42eXDCTzAx/r
         HpXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693780653; x=1694385453;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=75zjcGnVwfUfJUqEwa2RDdihaMKUFMKRhK0oHtPsQNI=;
        b=XmsKDzYGUWOImrruhu+Wwe4xtanv6FHP7KDfRlB/Jl1e4QCvoh2uKr8bxeswVq6WAq
         i/9dDW6mXoDzmawrUHArmhaOG/kDcRlB3DMAzMoHYFmI0K5NsWRJ3o+RzohvyGL3ckGl
         3iaECvGIjXhxOci3/vB+zPRZ99q3/WNL5/6GGRdb5xRDo/4TRN0inJBKO5hjdaUcmn4T
         lviWBOnRiUW/m3ntkPAh7elQO1jmb10Z5cjsZi9ZZNH1J+0UxpAX6TofZoWVk7UUwauR
         +pDQlvSIWWaVnGvG9d9pFUhTqG9XXx5cDDycpZk4621kDiUyooXEwJUOpUagXARCgwa1
         tYLA==
X-Gm-Message-State: AOJu0Yz3CEPPiZ5YX0oJ/Rbh0eujWa2c9MjbqoUBjT7rRBFBQ6sRC/UZ
	cxncPDopbY4GKqegkCCIVqQ/oA==
X-Google-Smtp-Source: AGHT+IFDK+b96i9bQUuJGZtagPUV/w9JXYNNgJkrbO34Zg85edf5iKUpK9zgciN7b4RZ32LgaCKJZg==
X-Received: by 2002:a17:902:ab1b:b0:1bb:9c45:130f with SMTP id ik27-20020a170902ab1b00b001bb9c45130fmr7786838plb.69.1693780652704;
        Sun, 03 Sep 2023 15:37:32 -0700 (PDT)
Received: from x1 ([2601:1c2:1800:f680:e0eb:2a3d:8122:b588])
        by smtp.gmail.com with ESMTPSA id t11-20020a170902a5cb00b001b9cea4e8a2sm6282788plq.293.2023.09.03.15.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Sep 2023 15:37:32 -0700 (PDT)
Date: Sun, 3 Sep 2023 15:37:30 -0700
From: Drew Fustini <dfustini@baylibre.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Yangtao Li <frank.li@vivo.com>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, sboyd@kernel.org,
	mturquette@baylibre.com, linux-kernel@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	Wei Fu <wefu@redhat.com>
Subject: Re: [PATCH 2/3] clk: thead: add support for the T-HEAD TH1520 CCU
Message-ID: <ZPUKqsEglxC5+Ocb@x1>
References: <20230515054402.27633-1-frank.li@vivo.com>
 <20230515054402.27633-3-frank.li@vivo.com>
 <ZOsnYagqFz6atfw2@xhacker>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZOsnYagqFz6atfw2@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230903_153735_195212_338AB8F2 
X-CRM114-Status: GOOD (  21.94  )
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

On Sun, Aug 27, 2023 at 06:37:21PM +0800, Jisheng Zhang wrote:
> On Mon, May 15, 2023 at 01:44:00PM +0800, Yangtao Li wrote:
> > Add support for th1520 in the clock framework.
> 
> Hi Yangtao,
> 
> I didn't see any new version of this series in this development window,
> and we have already talked about it several times on wechat, so do
> you still plan to renew this series? If not, I will update it and may
> rewrite the code once next development window is open.
> 
> Thanks in advance

I tried this clock driver on the BeagleV Ahead board and I got the
following during boot [1]:

  __clk_core_init: ahb2 must implement .set_parent & .determine_rate
  th1520-clk: probe of ffef010000.clock-controller failed with error -22

I am guessing this has to do with how ahb2_clk is defined?

 432 static struct ccu_div ahb2_clk = {
 433         .div            = TH_CCU_DIV_FLAGS(0, 3, CLK_DIVIDER_ONE_BASED),
 434         .mux            = TH_CCU_ARG(5, 1),
 435         .common         = {
 436                 .reg            = 0x120,                      
 437                 .hw.init        = CLK_HW_INIT_PARENTS("ahb2",
 438                                                       ahb2_parents,
 439                                                       &ccu_div_ops,
 440                                                       0),
 441         },
 442 };

It passes ccu_div_ops in CLK_HW_INIT_PARENTS(). ccu_div_ops does
implement .set_parent but it doesn't implement .determine_rate. Maybe
that is the problem?

Yangtao or Jisheng: would you be able to share the device tree you're
using?

I added this based on the example in the device tree binding:
=============================================================
diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index 18761a06c866..8153bf73e8c0 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -313,6 +313,14 @@ dmac0: dma-controller@ffefc00000 {
                        status = "disabled";
                };
 
+               clk: clock-controller@ffef010000 {
+                       compatible = "thead,th1520-ccu";
+                       reg = <0xff 0xef010000 0x0 0x1000>;
+                       clocks = <&osc_32k>, <&osc>;
+                       clock-names = "losc", "hosc";
+                       #clock-cells = <1>;
+               };
+
                mmc0: mmc@ffe7080000 {
                        compatible = "thead,th1520-dwcmshc";
                        reg = <0xff 0xe7080000 0x0 0x10000

=============================================================

Thank you,
Drew

[1] https://gist.github.com/pdp7/b585a6dad5134fc8773e53ad48600fef

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
