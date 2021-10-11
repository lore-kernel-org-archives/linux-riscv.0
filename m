Return-Path: <SRS0=mni0=O7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 723B2C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Oct 2021 14:42:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 113DE603E9
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Oct 2021 14:42:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 113DE603E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=i4EVSJQOMuhh9CwHDEgQGeG+x6nXZIytHE9Qvnegw6Q=; b=aTmpfClThvVSX69mWvbe+5nXpR
	GEZOiS77NbZLmWcJJzHVaSjqgTQFWg0RRPhXgowtNBqBhhs4210J9gZrZ+Mp1tS+vFAuYxi38el12
	ppg5IOWw87GI+Vy6a41BMLfuOsz2inBvBnXzbitNr5Ex4RiOZRug41NqDG3/lqyk9lLlORIONrHaA
	ClWuhDryIj93Jv1JRMI4yiiSHintuRcx1qRu18Uy/cckkNC8DdQ8n/L2xTR9PqKdVGRoqJ3Kx6kVc
	r0kn0zcYvISj/etTWrDHmfEy/4wJ+NOcb0wP06tmkIihcURleDiucGhRxyRF4JXgSHAoS8vFd+83+
	MCLZI3lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZwVW-009ny8-9r; Mon, 11 Oct 2021 14:42:26 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZwVS-009nxC-PI
 for linux-riscv@lists.infradead.org; Mon, 11 Oct 2021 14:42:24 +0000
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 99E184000F
 for <linux-riscv@lists.infradead.org>; Mon, 11 Oct 2021 14:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1633963337;
 bh=AoXkKdPc50NjSPLw27+j/N8Av0BiVK6rZpmczmLnEM0=;
 h=Subject:To:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=UNgdrKHzV7Zdkzkgye4GHtI5vqwBGftSFBT1Cbd+xwpvSPSDS1ebTWQta5JwDFzH5
 SSGm8ZEZ0NbaS7gmSate7Tl0LJW/nLHYYX4EdaJK6mqK1H/SRzjVhm036ITOnGG2hM
 ONq0I0xDIeHRX77pVSiGShAamAyFzhtqD4twuHomWRE1gPQ5jocv6z4JbZ/4Hm2m3W
 tCSHVBIhDsOmuKD2zkrBcVFFfFc6jfakVQi0gw+33NOn251pGUMQOFM7/epRibWkRp
 c+fJFCMlmi5MdiEmyF/Q8mCVU8YmkjNkUObodSBs6i07C5K3yJrLAYBPZ7WLIWC22L
 49Pc1za/UJBLA==
Received: by mail-lf1-f71.google.com with SMTP id
 v2-20020ac25582000000b003fd1c161a31so12834795lfg.15
 for <linux-riscv@lists.infradead.org>; Mon, 11 Oct 2021 07:42:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AoXkKdPc50NjSPLw27+j/N8Av0BiVK6rZpmczmLnEM0=;
 b=iyrkndhQDwC2RmnNGwu4O/70vJt0ADPxJ3l6M4aBtcDqIfgIFiREzT9nkboZi61CVI
 TzT+cQFN0LlnTz7598Pgj0ZyigNN6S6yu5fbMRvwxSFBEl1sf+oT3uUq10d3J4jNAiUc
 d3f0mIDTj4sbi9KvAmAS5FkuGZ8sFddUFBYn9RE0OW9WOy1GCF/6DBUxKS6HjN8QWb3E
 X8U18pqgKkQClAVSaZWgpskN6ZP0M3xOrSaVO/Dk9m2FDZITKkPWwU/k9fHGOQCghFtO
 qPKf4c9phg5hOhUbu9VlyYHaiafC4fUZ+WUwFlBQmqVIfPAQ10v1QncC5hXIkRaXfXv6
 zZmw==
X-Gm-Message-State: AOAM530B3AvnJjb35AqEV7YtqqRAhIslMROpeESkpdaa7CKTxlPlKGNV
 uDFIOMzAn76bi5e/FQocOZor1waN1g54GKb99+xlZlPJYIz68QiwoQH+B0AtMfEHIe4Xg+OenKR
 NjIUA3tmkM//xuxo6HxO5UvEjqrKoIjfQDC0wwKd8CZ23ZA==
X-Received: by 2002:a05:6512:2143:: with SMTP id
 s3mr3975445lfr.451.1633963336890; 
 Mon, 11 Oct 2021 07:42:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw6C5CiMHBYXhStZdUpN9ywy+Iz1BO+sH+SuCmHSgG0aTeSfmV0rE0BIJ5Bf4A/wVV1ffC7gw==
X-Received: by 2002:a05:6512:2143:: with SMTP id
 s3mr3975418lfr.451.1633963336668; 
 Mon, 11 Oct 2021 07:42:16 -0700 (PDT)
Received: from [192.168.0.20] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id r14sm750676lfe.13.2021.10.11.07.42.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 07:42:16 -0700 (PDT)
Subject: Re: [RESEND PATCH v2 2/5] riscv: dts: sifive: fix Unleashed board
 compatible
To: Rob Herring <robh+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210920130248.145058-1-krzysztof.kozlowski@canonical.com>
 <20210920130248.145058-2-krzysztof.kozlowski@canonical.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <bd0e7803-c234-6cc8-ae08-c3af255fa638@canonical.com>
Date: Mon, 11 Oct 2021 16:42:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210920130248.145058-2-krzysztof.kozlowski@canonical.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_074223_125541_53925B99 
X-CRM114-Status: GOOD (  14.00  )
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

On 20/09/2021 15:02, Krzysztof Kozlowski wrote:
> Add missing sifive,fu540 compatible to fix dtbs_check warnings:
> 
>   arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dt.yaml: /: compatible: 'oneOf' conditional failed, one must be fixed:
>   ['sifive,hifive-unleashed-a00', 'sifive,fu540-c000'] is too short
>   'sifive,hifive-unleashed-a00' is not one of ['sifive,hifive-unmatched-a00']
>   'sifive,fu740-c000' was expected
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> 
> ---
> 
> Changes since v1:
> 1. None
> ---
>  arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Anyone maintains RISC-V boards? I got no replies for the first patch,
then for the second version and finally for the resend.

If no one is interested, I'll pick it up.

Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
