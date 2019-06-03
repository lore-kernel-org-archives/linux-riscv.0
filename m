Return-Path: <SRS0=uF1/=UC=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAD57C04AB6
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  3 Jun 2019 04:43:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B48E727B86
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  3 Jun 2019 04:43:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dYwKrowt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="WA9TJKkM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B48E727B86
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ci/k8Pmyulmpb5lexqAYLsfjdYpakt6cFmAFbIhjESU=; b=dYwKrowtSAK42C
	DBzSkBAfWbZio5XV9S3xTVV8YABQ40klXCKarxTzDTfSFBXFGzyNGB4xzNhsFFNXxr7H3PwyvwHea
	1DUtkWda0OqZ94EAqnr0/F9M4s3vLs+/spnP3ZKWrorPSVdIIaAoN43eXWzO3svlsfciRoxKqrF6w
	5i8k0qLRzhdgo+LqTJw1lTLQ92GWXncrMrtPKKAtCO9Ayk9hiiFvUuDXYM/fXzQY18C5SlCW2+0D4
	xnfvvpA4slbtEeWCJx4rvEp5sts4v62dZhvW0Vt6K4vCQM29t6vB6jn+bzZiiYgMMN5UI68q8EQa7
	a35N5O8D3/ap3bfA2pKw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hXeoH-0007Uw-Gz; Mon, 03 Jun 2019 04:43:01 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hXeoE-0007UG-Ld
 for linux-riscv@lists.infradead.org; Mon, 03 Jun 2019 04:43:00 +0000
Received: from localhost (unknown [106.51.109.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9297427B7F;
 Mon,  3 Jun 2019 04:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559536977;
 bh=b0KkH0Lj6BQEkhVygSpgJ3mJjqE4vfh/Xpt0AD6GEtE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WA9TJKkMLWxMsSGCBg+GIiPeAkLdPj9QPtUrqyFV53pUeJrwJFb1ZMwRBOM+2ZZPD
 soo2kg7BO7pclLmv7aHqs95DvajdGpITbc761avkiZAqaLQEOHm3X5z+tG+P0vi/Rj
 F0jqZWVzFFsLSpaYwDXwWsKnCEtflAKdlqscJcUw=
Date: Mon, 3 Jun 2019 10:12:51 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH] PCI: endpoint: Add DMA to Linux PCI EP Framework
Message-ID: <20190603044251.GS15118@vkoul-mobl>
References: <1558650258-15050-1-git-send-email-alan.mikhak@sifive.com>
 <305100E33629484CBB767107E4246BBB0A6FAFFD@DE02WEMBXB.internal.synopsys.com>
 <CABEDWGxsQ9NXrN7W_8HVrXQBb9HiBd+d1dNfv+cXmoBpXQnLwA@mail.gmail.com>
 <305100E33629484CBB767107E4246BBB0A6FC308@DE02WEMBXB.internal.synopsys.com>
 <CABEDWGxL-WYz1BY7yXJ6eKULgVtKeo67XhgHZjvtm5Ka5foKiA@mail.gmail.com>
 <192e3a19-8b69-dfaf-aa5c-45c7087548cc@ti.com>
 <20190531050727.GO15118@vkoul-mobl>
 <d2d8a904-d796-f9f2-8f4a-61e857355a4f@ti.com>
 <20190531063247.GP15118@vkoul-mobl>
 <400a7c28-39b1-f242-7810-a1d38aa51446@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <400a7c28-39b1-f242-7810-a1d38aa51446@ti.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190602_214258_964486_C3FE4765 
X-CRM114-Status: UNSURE (   9.38  )
X-CRM114-Notice: Please train this message.
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
Cc: "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
 "palmer@sifive.com" <palmer@sifive.com>, "kjlu@umn.edu" <kjlu@umn.edu>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 Alan Mikhak <alan.mikhak@sifive.com>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "wen.yang99@zte.com.cn" <wen.yang99@zte.com.cn>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Kishon,

On 03-06-19, 09:54, Kishon Vijay Abraham I wrote:

> right. For the endpoint case, drivers/pci/controller should register with the
> dmaengine i.e if the controller has aN embedded DMA (I think it should be okay
> to keep that in drivers/pci/controller itself instead of drivers/dma) and
> drivers/pci/endpoint/functions/ should use dmaengine API's (Depending on the
> platform, this will either use system DMA or DMA within the PCI controller).

Typically I would prefer the driver to be part of drivers/dma.
Would this be a standalone driver or part of the endpoint driver. In
former case we can move to dmaengine for latter i guess it makes sense
to stay in PCI

Thanks
-- 
~Vinod

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
