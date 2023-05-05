Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82528C77B7D
	for <linux-riscv@archiver.kernel.org>; Fri,  5 May 2023 07:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Opl9RxsGD/UZcUcEcaYmPy6LVSimYo9w0UL1i0gM0D4=; b=ItMsHArWshGM+3
	Qiifgx+TnEOI/pjGwhJWmBi08tNxdiQ0+l0vBNf43Sk8qJUIh6a6+KHcjDYZeZzhHuRLLGx08DbZX
	bAtKMZrRY6N8qbfZAkXhAc7eOpSKKK/P/8/N05RMaYRNMoOeX30NmpknDX+aIYMYU3Ol1qke86Dzb
	YVuQtAmfohY9ON5GLHMuTwvZr9BI8itCXQs5EoBtdJXDE6ZD+QY7o6NQORqnhm4j6jQcaPUgZoJVr
	nWuqgBmYyf0Uq1ji13/CXqUKnpyAeLRX1sceepW3M8EjedhVoze6z0j2Aqx2jkU6k64Y1bee7Ev+J
	N9NjvHYhUFJbuCWb9pIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pupXw-009tSi-0f;
	Fri, 05 May 2023 07:08:04 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pupXt-009tQp-0b
	for linux-riscv@lists.infradead.org;
	Fri, 05 May 2023 07:08:02 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-94a342f7c4cso247314966b.0
        for <linux-riscv@lists.infradead.org>; Fri, 05 May 2023 00:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1683270473; x=1685862473;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=acZih3Z5P1GvMk6rxHa2TGlvoAbE/u1yGsETutBmjyM=;
        b=nmgm9mWZMxRm3wN8THICSLuinBrnv0NZNia/fMrmDJrVvpRfgABbzxaT6RzgXQ0DI6
         4Y25PcXuuXudYhf94zzBP3TuyMkRx+B8ZPqwavwmtTSrBwmMBOeIOqsvg7/rsbNiqcW1
         e8lPH4tc7dDS8LQ2CxXr03OmV8CCAcEOrVjLbbDthcv4aBDLUNPd2dHTWFtMFC1+pHD8
         vxkMK5CqRL7zkzuFjW/DUp3ZX4A5Mh9KtBXHPXuSuyf09SPmBDYq1CF9Dkl7vnfXtWAl
         dZ7ZsGYak02l0yuiNRLxx0nBqr++5sLm0DOtb/Kmph4+qxCXF+DK2e6O32eBGvYyiZTU
         5DIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683270473; x=1685862473;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=acZih3Z5P1GvMk6rxHa2TGlvoAbE/u1yGsETutBmjyM=;
        b=hzWp5ppQZCgBRtpBnPja6HK5oFgnmEmwO6S+Rb6aX2Xi+b91F9pcSaFdeMZjYUD5Mn
         xRlb3pNm20qSIps9ExDn7FGmHZS3mdCTXzmX708dd3xFuvGpIFOlKeF8+pLDXRRwhL5M
         Ee81Jc+yF/xLBkCmxdjUAUJcNzyaLNse9R2u2PP2RinOM0PXD3/YBv39fMKlmZmjXa0a
         HQccKNElJQULz9LJsy9OAzYDceWnYSdiU0GsTxSBIdbc915+zPEzIpYATgJt50dyTv5l
         60fiDN4a/9e7cXIyEKfmYVua8Qh9Jt4hrYywr8ttClT5VlDyecpMZLsLqj2piTctLk+b
         qbhg==
X-Gm-Message-State: AC+VfDw6ePslvt+qN0thATSWl8992MfdWccLrIFF1fDol9A5e2sje7po
	OlkvI1/aC0py4KxR0K9Tz97qkg==
X-Google-Smtp-Source: ACHHUZ7vDUBzh5vengeEQ4dMb5tOl+lmF0yP4I5ysdYkOinYexZd6uL/cCabfXjU9Q0fTepFg/425Q==
X-Received: by 2002:a17:907:3e8a:b0:94e:c142:df98 with SMTP id hs10-20020a1709073e8a00b0094ec142df98mr344863ejc.60.1683270472944;
        Fri, 05 May 2023 00:07:52 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id gx28-20020a1709068a5c00b009534211cc97sm548707ejc.159.2023.05.05.00.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 00:07:52 -0700 (PDT)
Date: Fri, 5 May 2023 09:07:51 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v1 2/7] RISC-V: only iterate over possible CPUs in ISA
 string parser
Message-ID: <20230505-ecf405ab513637ed8e3a7435@orel>
References: <20230504-divisive-unsavory-5a2ff0c3c2d1@spud>
 <20230504-simple-chant-c33c14cc9e4e@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230504-simple-chant-c33c14cc9e4e@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230505_000801_223546_E224F0C4 
X-CRM114-Status: GOOD (  14.05  )
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
Cc: Yangyu Chen <cyy@cyyself.name>, Conor Dooley <conor.dooley@microchip.com>, palmer@dabbelt.com, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, May 04, 2023 at 07:14:21PM +0100, Conor Dooley wrote:
> From: Sunil V L <sunilvl@ventanamicro.com>
> 
> During boot we call riscv_of_processor_hartid() for each hart that we
> add to the possible cpus list. Repeating the call again here is not
> required, if we iterate over the list of possible CPUs, rather than the
> list of all CPUs.
> 
> The call to of_property_read_string() for "riscv,isa" cannot fail
> either, as it has previously succeeded in riscv_of_processor_hartid(),
> but leaving in the error checking makes the operation of the loop more
> obvious & provides leeway for future refactoring of
> riscv_of_processor_hartid().
> 
> Partially ripped from Sunil's ACPI support series, with the logic
> inverted to continue early on failure.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Co-developed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/kernel/cpufeature.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
