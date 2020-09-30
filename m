Return-Path: <SRS0=Qujn=DH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0CD8C4727C
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2020 18:21:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 768A120759
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2020 18:21:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MYlA7S3s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 768A120759
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kCrzycGlYkyuTk3mlaT7dFUIfKv168oxCcNI1JZ0vT8=; b=MYlA7S3sbrUueUJAFVgSqetod
	EtYRCQsc0OG5jSmlRtviGgJtPHJW9n5p5VZpo80jMOlq1KyO6cHfeFE+FRu8biiDLrQ8n4/q/WceI
	1CTZVaFqSyTu6Iq+14AYULA0cBR26BhbcleIBdFbqusd0TLCoF4b28aZU+TDP9Ghl8IWKVQ1xzM+A
	pqcv9bDq3PQOd6Try9g/HBrtgRkZ4BzfVVwv2m0HiEeDOA+41JRDZ/I5MvRVwJAPo5OznjqHsxaFp
	xemuMu3xq00sSqtH5WtA1ex+v0b5IWrwl7op3TykChydC5VC/ZnijFHrs9MLw2UZdWMAVuYWsWTJS
	yEUxdbHGg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNgjY-000215-2H; Wed, 30 Sep 2020 18:21:44 +0000
Received: from mail-ot1-f68.google.com ([209.85.210.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNgjV-000204-Hi
 for linux-riscv@lists.infradead.org; Wed, 30 Sep 2020 18:21:42 +0000
Received: by mail-ot1-f68.google.com with SMTP id y5so2775252otg.5
 for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2020 11:21:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Hd2ocInfi4avQ8AdBOhBE6fs1Q1midhjtlq5o5WVWcE=;
 b=BcHgeaWPkmKoE4farIYq02JcpgTW3zz2f7w2DnTo1l0972vHPDPQbhfaLg825eNI+S
 NuYLXxDuZ1LqwBZyJx73KxpfV+x9co1rC9Xx5tkbFJS5hY6hyOvqVMVb7/iJRtpDYak7
 dO5hTWTceLDK1XJA+F0VDkO4/bd+flApGcrr9aRO4J9WE/0gmu4pSVOcNp3vAy9bzAfk
 rBXCBAvXuKVphMhOXbKK/AYkjB+FqEvejSQm+3tuS6T8rpJCTrHJ3zIRCaECZhxvkF2y
 otgxvPIhdtr7774abQfPzsMF8etAUAg/G7tvnF2UuVRSwK1wYptb7kkkXxpowUa6b9w1
 9Iwg==
X-Gm-Message-State: AOAM530PHM6xI1+kbOc0PPlrfP4G3JhO1bvu+Mxk8HwzkZ3+6Iv6L2La
 MnEnZyV5Ih51gEjM3IfFRw==
X-Google-Smtp-Source: ABdhPJxyEnxtE5TN21dfNl5HNX7z/8XKKNKHcxJqiex1hzRxLB7plOS8FUvEWWricA3DV1qIvpltSA==
X-Received: by 2002:a05:6830:210f:: with SMTP id
 i15mr2412279otc.327.1601490100656; 
 Wed, 30 Sep 2020 11:21:40 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id g21sm629885oos.36.2020.09.30.11.21.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2020 11:21:40 -0700 (PDT)
Received: (nullmailer pid 3176490 invoked by uid 1000);
 Wed, 30 Sep 2020 18:21:38 -0000
Date: Wed, 30 Sep 2020 13:21:38 -0500
From: Rob Herring <robh@kernel.org>
To: Alex Dewar <alex.dewar90@gmail.com>
Subject: Re: [PATCH v2] PCI: keystone: Enable compile-testing on !ARM
Message-ID: <20200930182138.GA3176461@bogus>
References: <20200906194850.63glbnehjcuw356k@lenovo-laptop>
 <20200906195128.279342-1-alex.dewar90@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200906195128.279342-1-alex.dewar90@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_142141_618101_62B94718 
X-CRM114-Status: GOOD (  12.21  )
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
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Dilip Kota <eswara.kota@linux.intel.com>, linux-pci@vger.kernel.org,
 Jonathan Chocron <jonnyc@amazon.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, Vidya Sagar <vidyas@nvidia.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>,
 linux-riscv@lists.infradead.org, Thierry Reding <treding@nvidia.com>,
 Andrew Murray <amurray@thegoodpenguin.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, 06 Sep 2020 20:51:27 +0100, Alex Dewar wrote:
> Currently the Keystone driver can only be compile-tested on ARM, but
> this restriction seems unnecessary. Get rid of it to increase test
> coverage.
> 
> Build-tested with allyesconfig on x86, ppc, mips and riscv.
> 
> Signed-off-by: Alex Dewar <alex.dewar90@gmail.com>
> ---
>  drivers/pci/controller/dwc/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
