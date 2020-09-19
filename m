Return-Path: <SRS0=zSrB=C4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MISSING_HEADERS,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79431C43463
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Sep 2020 19:31:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11E5421707
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Sep 2020 19:31:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G8XczsNR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X9Qo5lgg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11E5421707
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Subject:Reply-To:To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gg1ICn+44KJfI3h8x7L6CTBVG+R4DAx6iQ7B7KoLTOk=; b=G8XczsNRa3KhScvHAKVKkhvt1
	xVuvUdmxZQi4q/yheAAAR/N8gRhXq70Mvj6B3vmJR+hP+MdbhUTvplAqbIqIhd/n5qjUSON5e7qnT
	ROZjKC1B25bKs8Vv9QkP3N9wPfzTGPxc8WlgFbOZ/CSShnhMaTy9cDaB8UTKWWpeZmu5jQc57ELJi
	/vdwKVqJzpY69RYl4z8yBBPs1DtRGOBBH1h7cyB/uo76yFNp+Y9IXwrdjFAipQOZ4FDy1LCv27CJz
	QrtaYgWPnzP0WtexMdoazXoknw50tXdDkQGq06jBoUaPu0wr21ekFTnARAe+2Y0AIMPleT6GDSm1v
	iHLeC5upg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJiZN-0003no-Ow; Sat, 19 Sep 2020 19:30:50 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJiZL-0003nI-RH
 for linux-riscv@lists.infradead.org; Sat, 19 Sep 2020 19:30:48 +0000
Received: by mail-wr1-x441.google.com with SMTP id m6so8869804wrn.0
 for <linux-riscv@lists.infradead.org>; Sat, 19 Sep 2020 12:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:cc:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=5skGPhsyazVZaiVuubVh94FSwyjMzK0r2M2FZd4FHB8=;
 b=X9Qo5lggFQxq3aLs9JzxKNHoJaXuDiF2f7pe6k1UVptbiACRu2eRGd3iCoO9k3nxTa
 9mZ5pxMZi6h/VmAY8QPmrW5QHWSk/I6mY7TzBqKOD55IdnAY8lFzuFQK4XaIRKoQQU5o
 KvZ8oQiPM/mALL2xdwJCwQRjR6FhEuN9aqq0hRjGcYrWNL4tv4meWa+Z/jVh0dpqGKxR
 BN2HcrNUVDLE5gUejuyc/7osCxdLsSNMuZOX9Up01ivDZGhVP1N6ID0PzOoivA+vrcvX
 F3OZsWO1Ux+2WWonTXl9KRzXgaYUiVp60h7ghopQfPA1Xctta5n4oRhG3+DBWvMNTwnE
 9jCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=5skGPhsyazVZaiVuubVh94FSwyjMzK0r2M2FZd4FHB8=;
 b=Np7gB/yS4AB3gmvRPHxnCCZZSlx4fin0roifG24mTT5f636iC8qI8E4vKFv0z8uk+6
 5i0jj86o3f7E1uCjAWrmJk9NDQEmF4aovD3TKTQgVZmCTZSkrLhtGQUSPiQOyjQX31pj
 hlGJ01N/sYpsk798KtpV5G3njIpRZJ/6lqmKZrxrngiPphGp57AUF9uMdEBTKs5yEkB2
 /v3dBANXdDAkUzEmLjyZvkt0YQQn9jOrNunM+AZVLEw8ABUJREE31jGzhLPLxuS84STP
 wWr6eEuFiXzU9U1eU7aVBvPcpckytkwA1AGNSn27SThr2zBDvgpDfGTqXrLDUcvjO25I
 z9XA==
X-Gm-Message-State: AOAM531wKpv8pxoBrhkrmuHnZ9+VN6/CSVm5YruPhY8sjtrbZ3Q9BFEv
 hnPmKvKDYiEmQDOhM6duqDoU+2TzTi7OjA==
X-Google-Smtp-Source: ABdhPJzeClNOewceoNGCFqcHL4YGkoYbNhFUHBTSnoKrv0AfJSkX/cb+mQZse8N2TlRNJvoShb0KMA==
X-Received: by 2002:adf:8405:: with SMTP id 5mr46656012wrf.143.1600543846790; 
 Sat, 19 Sep 2020 12:30:46 -0700 (PDT)
Received: from [192.168.43.148] (92.40.169.140.threembb.co.uk. [92.40.169.140])
 by smtp.gmail.com with ESMTPSA id b84sm12278004wmd.0.2020.09.19.12.30.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Sep 2020 12:30:46 -0700 (PDT)
Subject: Re: [PATCH v2] PCI: keystone: Enable compile-testing on !ARM
References: <20200906194850.63glbnehjcuw356k@lenovo-laptop>
 <20200906195128.279342-1-alex.dewar90@gmail.com>
From: Alex Dewar <alex.dewar90@gmail.com>
Message-ID: <7f78ef86-f2c5-258f-88b3-0cd79c0799ea@gmail.com>
Date: Sat, 19 Sep 2020 20:30:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200906195128.279342-1-alex.dewar90@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200919_153047_908820_EC562062 
X-CRM114-Status: GOOD (  18.70  )
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
Cc: Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Dilip Kota <eswara.kota@linux.intel.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Jonathan Chocron <jonnyc@amazon.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Vidya Sagar <vidyas@nvidia.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-riscv@lists.infradead.org,
 Thierry Reding <treding@nvidia.com>,
 Andrew Murray <amurray@thegoodpenguin.co.uk>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2020-09-06 20:51, Alex Dewar wrote:
> Currently the Keystone driver can only be compile-tested on ARM, but
> this restriction seems unnecessary. Get rid of it to increase test
> coverage.
Friendly ping?
>
> Build-tested with allyesconfig on x86, ppc, mips and riscv.
>
> Signed-off-by: Alex Dewar <alex.dewar90@gmail.com>
> ---
>   drivers/pci/controller/dwc/Kconfig | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
> index 044a3761c44f..ca36691314ed 100644
> --- a/drivers/pci/controller/dwc/Kconfig
> +++ b/drivers/pci/controller/dwc/Kconfig
> @@ -107,7 +107,7 @@ config PCI_KEYSTONE
>   
>   config PCI_KEYSTONE_HOST
>   	bool "PCI Keystone Host Mode"
> -	depends on ARCH_KEYSTONE || ARCH_K3 || ((ARM || ARM64) && COMPILE_TEST)
> +	depends on ARCH_KEYSTONE || ARCH_K3 || COMPILE_TEST
>   	depends on PCI_MSI_IRQ_DOMAIN
>   	select PCIE_DW_HOST
>   	select PCI_KEYSTONE
> @@ -119,7 +119,7 @@ config PCI_KEYSTONE_HOST
>   
>   config PCI_KEYSTONE_EP
>   	bool "PCI Keystone Endpoint Mode"
> -	depends on ARCH_KEYSTONE || ARCH_K3 || ((ARM || ARM64) && COMPILE_TEST)
> +	depends on ARCH_KEYSTONE || ARCH_K3 || COMPILE_TEST
>   	depends on PCI_ENDPOINT
>   	select PCIE_DW_EP
>   	select PCI_KEYSTONE


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
