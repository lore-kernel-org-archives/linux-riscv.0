Return-Path: <SRS0=JPD3=TA=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B89DC43219
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 30 Apr 2019 06:20:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 099C02075E
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 30 Apr 2019 06:20:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H81Vaicl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="ZV5D5lv7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 099C02075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4pUuUAWf5jsAPEqWd1g7VJog1asUAJAGaWwi2F276Rw=; b=H81Vaiclu5BSe5
	bwCOXmxPTE223hfYZB4zvSJeC7DtMFR3UGq8aUK70PO1Rt1E0bBRHqbAkiNoc13d7QqfWbCzByO4+
	W2NEQP0A5/mbnO642RBRzJ9cM9sOqY5sv6fTEgx4U2w27Q94I4Tadzp96ZWhJ9RrV2DEL1nJmgMBM
	IU4jL0LdIsGcosgwR1ApydGot9M8TLYrndjaUddZZLnCzC8DBFgnE1teC/T3+kQTPCH7dwj1rsVpB
	G+4k9cl8TEPyTA58qXQz+SJQfqCVC6YOWBq8O4Nh7eRVzzwWf3hc9zmRe95flqg2Jxvmlim7Lnm/O
	Ocbj5+0zo35nHCDsImbw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hLM80-0006BS-9a; Tue, 30 Apr 2019 06:20:32 +0000
Received: from mail-it1-x141.google.com ([2607:f8b0:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hLM7w-0006B2-Uv
 for linux-riscv@lists.infradead.org; Tue, 30 Apr 2019 06:20:30 +0000
Received: by mail-it1-x141.google.com with SMTP id q14so2912891itk.0
 for <linux-riscv@lists.infradead.org>; Mon, 29 Apr 2019 23:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=AV9ZTDDQcqZfQOAe4qT7E6y4JoSwEYhZS+A0aSnML+s=;
 b=ZV5D5lv7eg1gyd5O6CJUMoMHBVvq2u/J+sCgxVwj6ybz2prZuez6tDOWXyJvseqqkr
 rk8o/IZDvwanTWSyqZJzkmRHFdO3SxjxNOYlC03qHde8Dytq4GaJWkoTiBd3mNxxLjVC
 fbhU25q+UCIxArF7Ul6wjlFrFJLHoiXWpSO6WLmP3JY3I+L7HVx4Vf++usyiXWWqKSdX
 kzSQUxn1Mln3B+Hh4t9Dtxzk35DOM/lJzAKzkAtqgdJTrgfuVv6CvbiJQYlGv/kTKYCz
 cSedb2oBBkwXyqS1e3uop4Kx0YnI0HnjikQUbMXUB92QCMiOG6ugiB3w88DjZZ7nvcOZ
 UuTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=AV9ZTDDQcqZfQOAe4qT7E6y4JoSwEYhZS+A0aSnML+s=;
 b=O605m8BuJSLUJ86lHyiROc3HQQpfntY4m6FN9LlwVaEQMdMVH9rF1ugHCW6yydeaxI
 n/i7F1y1rgMZRpSm794BKZdRmCt58eZx2RmlTYcJi/eH+rEKvHz4lpkIg+JLI1dn7Qrh
 5aXGDGv0KvQI2YOLHZyQs3mwB6/1DoPuelxEJ/LYFLE0XSWGvktAiUdnRgThZ6+TgZKE
 yXgk0pqeh9RXPVfhjxV/pkJYmFniRDyWijv2PT6TjriHco7EP+Se5uk9gfje7VzPKWv2
 ueMpSmOiUqn4z5g8Nqe2wpH+NuUftFKPCEvt343MWHllp6NEyvcEIn55PCL1T9OMwANm
 KoGQ==
X-Gm-Message-State: APjAAAVYz9FF9MjCVMWdL7EBBsYjEUvQ+qX/WZL74gfD5biOqv9CHcQ4
 Ov/oM69gytufEd+zccxk5I4hZQ==
X-Google-Smtp-Source: APXvYqzH1CSf//UWvt+BdmDERbKBSmcenZ2fnx2isCJPie+haSmfsZdhwXMx57NQC5bbn4rBB4DslQ==
X-Received: by 2002:a24:d003:: with SMTP id m3mr2198104itg.132.1556605227707; 
 Mon, 29 Apr 2019 23:20:27 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 e4sm7828414iof.62.2019.04.29.23.20.26
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 29 Apr 2019 23:20:26 -0700 (PDT)
Date: Mon, 29 Apr 2019 23:20:26 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [PATCH v3 3/3] clk: sifive: add a driver for the SiFive FU540
 PRCI IP block
In-Reply-To: <256b9312-4740-e7b1-84ac-c0cc1ff4bc77@wdc.com>
Message-ID: <alpine.DEB.2.21.9999.1904292258000.7063@viisi.sifive.com>
References: <20190411082733.3736-2-paul.walmsley@sifive.com>
 <20190411082733.3736-4-paul.walmsley@sifive.com>
 <256b9312-4740-e7b1-84ac-c0cc1ff4bc77@wdc.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190429_232029_061196_8145AD10 
X-CRM114-Status: GOOD (  18.98  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Paul Walmsley <paul@pwsan.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Stephen Boyd <sboyd@kernel.org>, "Wesley W . Terpstra" <wesley@sifive.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Megan Wachs <megan@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Atish,

On Sat, 27 Apr 2019, Atish Patra wrote:

> On 4/11/19 1:28 AM, Paul Walmsley wrote:
> > Add driver code for the SiFive FU540 PRCI IP block.  This IP block
> > handles reset and clock control for the SiFive FU540 device and
> > implements SoC-level clock tree controls and dividers.

[...]

> > +static const struct of_device_id sifive_fu540_prci_of_match[] = {
> > +	{ .compatible = "sifive,fu540-c000-prci", },
> 
> All the existing unleashed devices have prci clock compatible string as
> "sifive,aloeprci0" or "sifive,ux00prci0". Should it be added to maintain
> backward compatibility?

As you note, just adding the old (unreviewed) compatible string isn't 
enough.

> Even after adding the compatible string (just for my testing purpose), I get
> this while booting.
> 
> [    0.104571] sifive-fu540-prci 10000000.prci: expected only two parent
> clocks, found 1
> [    0.112460] sifive-fu540-prci 10000000.prci: could not register clocks: -22
> [    0.119499] sifive-fu540-prci: probe of 10000000.prci failed with error -22
> 
> Looking at the DT entries, your DT patch has
> 
> +		prci: clock-controller@10000000 {
> +			compatible = "sifive,fu540-c000-prci";
> +			reg = <0x0 0x10000000 0x0 0x1000>;
> +			clocks = <&hfclk>, <&rtcclk>;
> +			#clock-cells = <1>;
> +		};
> 
> 
> while current DT from FSBL
> (https://github.com/sifive/freedom-u540-c000-bootloader/blob/master/fsbl/ux00_fsbl.dts)
> 
> prci: prci@10000000 {
> 			compatible = "sifive,aloeprci0", "sifive,ux00prci0";
> 			reg = <0x0 0x10000000 0x0 0x1000>;
> 			reg-names = "control";
> 			clocks = <&refclk>;
> 			#clock-cells = <1>;
> 		};
> 
> This seems to be the cause of error. It looks like this patch needs a complete
> different DT (your DT patch) than FSBL provides.

That's right.  That old data was completely out of tree and unreviewed.  
It's part of the reason why we're going through the process of posting DT 
data to the kernel and devicetree lists and getting that data reviewed:

https://lore.kernel.org/linux-riscv/20190411084242.4999-1-paul.walmsley@sifive.com/

> This means everybody must upgrade the FSBL to use your DT patch in their
> boards once this driver is merged. Is this okay?

People can continue to use the out-of-tree DT data if they want.  They'll 
just have to continue to patch their kernels to add out-of-tree drivers, 
as they do now.

Otherwise, if people want to use the upstream PRCI driver in the upstream 
kernel, then it's necessary to use DT data that aligns with what's in the 
upstream binding documentation.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
