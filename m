Return-Path: <SRS0=1/OQ=MG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2807C07E9A
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jul 2021 13:51:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8301961374
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jul 2021 13:51:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8301961374
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=21jovh6ZlIvscUDnPBwLAeZ6z5GW0XXhAqkuxCz3Yww=; b=1iRB17oVZnKl1t
	sGCxufHigKji0BmWuS7py0PEY9iB/ENYf6K1GBzwtEbvQkgYHloeIk2zRcVzWZlvOckXfbdv5Q1k8
	g8+iiMx/sb+1mVqP4v01vXXDwkWE3wltgngwdKh6aXD6lzCqecRLFvK8+S3/OC8dZfQOk9dlzjZcB
	pd4Qij4gIQDdNDKvL/je/baEUNVX6Fj7OXfCF2ZYpSirVj8teImbBISrIeQN5JaIMCtBX1nNXEZ2b
	IAFFMuqOXfNRpGDZyMSklQp8fJL4EUhN7KdLR+Q9PYWz44ujIHOmIPFN1v8ztJii0KTDr5kkwq69D
	CBBzhpnHqTY4adQjTW3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3fIF-00Dj19-UR; Wed, 14 Jul 2021 13:51:19 +0000
Received: from mail-io1-f49.google.com ([209.85.166.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3fI2-00Diys-VW; Wed, 14 Jul 2021 13:51:08 +0000
Received: by mail-io1-f49.google.com with SMTP id x10so2124123ion.9;
 Wed, 14 Jul 2021 06:51:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=50++kkpNpej8/NTD9q8DshcKL4G56n58bwfZ59/K0OU=;
 b=jrcsGC01UoVQEI7W9E1wJ/sL3SgR9ospvbmVVDdHrSk+Rv7leeAQHKeOr94VPYZtlx
 kKrYEgwlx7vwKqjJtYJwX77K69/3I4FV2wpLqiTyiSaOHl8C9X2aJr/eKXcuggLGngf9
 R/ZgzS+rAjccAz8Q6y2VT7lTbNyMlt0JFMrZ4IgiYtl/kKejH7dLc9OlO+zSPtENAOsk
 GmudsJbpy7/qGySxlMhDNobvox5KmUbpEo/oLi0AfFNNAiK9p62fGittf4yyh/p2fcEf
 idLVi9QvwfMjToLcb2WqqriA6YmeiblI0njBiRd1iMEzQ/auHQ7JomDK2P/pfXZ5VpBP
 xKDQ==
X-Gm-Message-State: AOAM532Q9FaK+9Y7JFTnLeC6m20STKKZGjZWILfUQ6jbHGsnNIMg+iIN
 joAnPlene/1mfJ4WTpfhpw==
X-Google-Smtp-Source: ABdhPJz5/RWe5S4IxADEtcsCGrwyKwDJjXmmQQVnQ78apEZMiVvJE4pVvZlqoWl7Or2AdYCn9IOTUQ==
X-Received: by 2002:a02:7093:: with SMTP id f141mr8988326jac.24.1626270666077; 
 Wed, 14 Jul 2021 06:51:06 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id s2sm1323967ilq.45.2021.07.14.06.51.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 06:51:05 -0700 (PDT)
Received: (nullmailer pid 2459772 invoked by uid 1000);
 Wed, 14 Jul 2021 13:51:01 -0000
Date: Wed, 14 Jul 2021 07:51:01 -0600
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Russell King <linux@armlinux.org.uk>, Nicolas Pitre <nico@fluxnic.net>,
 Ard Biesheuvel <ardb@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Nick Kossifidis <mick@ics.forth.gr>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Frank Rowand <frowand.list@gmail.com>, Dave Young <dyoung@redhat.com>,
 Mike Rapoport <rppt@kernel.org>, Baoquan He <bhe@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, kexec@lists.infradead.org, linux-mm@kvack.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 02/10] memblock: Add variables for usable memory
 limitation
Message-ID: <20210714135101.GB2441138@robh.at.kernel.org>
References: <cover.1626266516.git.geert+renesas@glider.be>
 <04c4d231fb03a3810d72a45c8a5bc2272c5975f3.1626266516.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <04c4d231fb03a3810d72a45c8a5bc2272c5975f3.1626266516.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_065107_058913_7462F58B 
X-CRM114-Status: GOOD (  19.00  )
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

On Wed, Jul 14, 2021 at 02:50:12PM +0200, Geert Uytterhoeven wrote:
> Add two global variables (cap_mem_addr and cap_mem_size) for storing a
> base address and size, describing a limited region in which memory may
> be considered available for use by the kernel.  If enabled, memory
> outside of this range is not available for use.
> 
> These variables can by filled by firmware-specific code, and used in
> calls to memblock_cap_memory_range() by architecture-specific code.
> An example user is the parser of the "linux,usable-memory-range"
> property in the DT "/chosen" node.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> This is similar to how the initial ramdisk (phys_initrd_{start,size})
> and ELF core headers (elfcorehdr_{addr,size})) are handled.
> 
> Does there exist a suitable place in the common memblock code to call
> "memblock_cap_memory_range(cap_mem_addr, cap_mem_size)", or does this
> have to be done in architecture-specific code?

Can't you just call it from early_init_dt_scan_usablemem? If the 
property is present, you want to call it. If the property is not 
present, nothing happens.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
