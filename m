Return-Path: <SRS0=wr6O=IR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 218DAC433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Mar 2021 04:43:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8C0F64F45
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Mar 2021 04:43:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8C0F64F45
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SUuoY62OxaGkw+QEbliqmEkFQcgD5gSygGltQChZdyc=; b=aQt20BtUO5PISowwe1SV7hy4y
	h1BYpLPESrTDMzoIAoklhVsY5Kg7l42KVsqO+ab9h23qgu5G/H9ucQd82h9iWZsRPkeq8akHweLuC
	T9OjXfdAyfx39GbbezXWHdr6+CKk9rLscXJKDYe1+PAJNCh48wyYy21PEfCCnKcYi32div/NqYYjA
	epfmT+s6mqnlfvLCJaIwm4nFnF5kvIi4tiEMj+iIFg+WW1lu6zNWnxNmScOc0dvYH0ooEtK1LySXF
	Im3buvSOj5butPj7EH45TqtZmpclX1gqXD48aN+2K/LONlLMOl5mi1O4VWkyz7RcSf+P2O/r1kP7G
	0TYJLpJQw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lN6yX-006VD2-15; Fri, 19 Mar 2021 04:43:05 +0000
Received: from mail-ej1-f49.google.com ([209.85.218.49])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lN6yR-006VCa-O1
 for linux-riscv@lists.infradead.org; Fri, 19 Mar 2021 04:43:01 +0000
Received: by mail-ej1-f49.google.com with SMTP id k10so7541914ejg.0
 for <linux-riscv@lists.infradead.org>; Thu, 18 Mar 2021 21:42:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gJ5epElvIHRCLOPs35R9kJU3e4MLpSScnXNFgNaIdtY=;
 b=MdqMZxOS1W+JLh4Bq6cLIRf1LPlMJmocveg2YwYdRVx28cx9B8zMIFaNr4WkyqWJGB
 iWK88grCDgJb4PuCMvAg3lxk3gk9BLQkqylV9qfETZUXXUmS2a9FmIgfwanNitIi5Uoo
 DHjTZdfYSsnFiS6BNXo/t+wgo7tNk0Bv46QFmgGcJBxm3nAQcdPQzSLoIq2P9ofEB+cs
 ARU/wyzb+N4SGsFkcyyD/Rtv8M/NXO+5DodrIDsNWrATT1y4mgpCFvkmYCM43n9COrSq
 f4wDpgj9sDIyQUXtP2CyHjwdVEwB1DvvFdgO5f5+spvOyFGOHieCC+8cP0/Fd3a0ejtJ
 v6ug==
X-Gm-Message-State: AOAM532lOFIh0EcCsm3zy1er1F1NLR9fNW8ySwenQiUIqhRXpm0tXqzx
 PPBjUEqZoyXm6f0yVnGqE4E=
X-Google-Smtp-Source: ABdhPJzipLn7AqsZvQHSyVxSUVKaCdMwqPG/fT+kq7UV0ELtkfHgKd6G55CioOG9UmFa84eaKaQdiQ==
X-Received: by 2002:a17:906:3882:: with SMTP id
 q2mr2184109ejd.540.1616128979183; 
 Thu, 18 Mar 2021 21:42:59 -0700 (PDT)
Received: from rocinante ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id s20sm3296292edu.93.2021.03.18.21.42.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 21:42:58 -0700 (PDT)
Date: Fri, 19 Mar 2021 05:42:57 +0100
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Greentime Hu <greentime.hu@sifive.com>
Cc: paul.walmsley@sifive.com, hes@sifive.com, erik.danie@sifive.com,
 zong.li@sifive.com, bhelgaas@google.com, robh+dt@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, mturquette@baylibre.com,
 sboyd@kernel.org, lorenzo.pieralisi@arm.com, p.zabel@pengutronix.de,
 alex.dewar90@gmail.com, khilman@baylibre.com,
 hayashi.kunihiko@socionext.com, vidyas@nvidia.com,
 jh80.chung@samsung.com, linux-pci@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, helgaas@kernel.org
Subject: Re: [PATCH v2 5/6] PCI: fu740: Add SiFive FU740 PCIe host controller
 driver
Message-ID: <YFQr0bHa6nIgas2S@rocinante>
References: <cover.1615954045.git.greentime.hu@sifive.com>
 <27f491c113e1bb369d25aca02571b34422986142.1615954046.git.greentime.hu@sifive.com>
 <YFQqpojmJyX0l6lx@rocinante>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YFQqpojmJyX0l6lx@rocinante>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210319_044259_983150_B904BBD6 
X-CRM114-Status: UNSURE (   8.54  )
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

Hi,

[...]
> > +	/* Wait for wait_idle */
> > +	ret = readl_poll_timeout(phy_cr_para_ack, val, val, 10, 5000);
> > +	if (ret)
> > +		dev_err(dev, "Wait for wait_ilde state failed!\n");
> 
> It would be "wait_idle" rather than "wait_idle".
[...]

Apologies, meant to say "wait_ilde" in the "rather than" part, but went
ahead and somehow used the correct spelling. :)

Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
