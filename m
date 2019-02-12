Return-Path: <SRS0=gFXo=QT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41657C282C4
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Feb 2019 21:59:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C88C222B1
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Feb 2019 21:59:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t32FVnNi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="DMBC3Yoq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C88C222B1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=Hgn1PLfNaE5TdH6TTV0y0K/6CHT35lBWzEKo4dee518=; b=t32FVnNipxSon/3Nl8dF8oqfr
	wEBqOd9M09LLHRAD3dnalRd+XT72RkQHC20YvEsndHrO2Sz3669D0eS+oUo2e2Cue/Kv9spQw3fRO
	F7dDGvib6EgVCehmTyjf2ONwEIUd18EjYdgl8izcWw1amPQ9yh81qPm5lcBKGJadjp6WNlNVTV/Go
	EULY5LhN3wM5GrZRAk0DpzDgq6WkBVUDxk8Q0IDt8M+X81pzab41+mlAK+F+BqKdIAtoJXhJX60Ga
	mcjtDAFZ2yUSUxYOgnXINsaTzLJaUy6VRtcQUX4B6Jn2f5FVNwFZVRY/v7CV4Q+L4yVs0AvWkthOO
	vrVyNO3nA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtg5V-0005pC-WC; Tue, 12 Feb 2019 21:59:34 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtg5T-0005om-8v
 for linux-riscv@lists.infradead.org; Tue, 12 Feb 2019 21:59:32 +0000
Received: by mail-pg1-x542.google.com with SMTP id r124so112871pgr.3
 for <linux-riscv@lists.infradead.org>; Tue, 12 Feb 2019 13:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=6toEUE81rkzlisBawc99kYqY8lCwU87CEBqPAzAeows=;
 b=DMBC3YoqAOw1lzNH8Dot7WlXuXZ27GLCD8yGG9T2djYzwHJMRSq8ZhbeR930os5gee
 0CkauvCBb4gtsCfG76UWKp4qAXcc6fC40AuJEHzah0zNaD9nOpNeporKbtZhl23aWpEj
 QlwJiTiaRQ9CMa3Hw6JfiPaxe3+stbwFeTdbF+Y9AyG0SgpUM3DzQtGMsgIt1/BBzsbq
 9SRBnSY+y9qukACHzceKVv2grYYqeMykLFT0kGDtTxDe1mNcFPH0WOeXVbRsDQfb/pLn
 pSGWhdsxbP0m/t+a9gvihAPu+aQLmrtz6vHVCpE7Ecf1xFtfxakOk8besfk73RX282/m
 sRcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=6toEUE81rkzlisBawc99kYqY8lCwU87CEBqPAzAeows=;
 b=Og9GTPOpDzM/QOJGGI8qDUQNOOxBFj9Pmf88J1+o17wlGYT25PkEhdGuPL47Z7l7Wp
 m6sngTeuFUAKHAuo8SUW88xBT5FdX5f/t+Ac/IWJN0jdi+VfkPnMP9NEIDHBz5Wmb7e/
 7dKJvaqpXZP276g6GrUqC0kUZL2nwz04n6lvexueljpnQTamjJFK5U7v/dEaAV+vg/3x
 Pt3xuNC7INL4HYzIRuatHwU5kuWvH0faA3rPcs98ZGHThBPO/UPOVCBcNIBvYIv28PFg
 IiUKxwiczKG//9zWwLrAOrs5Ivj4FW1RuJM4ljq0+rPqsVsCN/XQKLfgqJlbUWUvBu+0
 kd/A==
X-Gm-Message-State: AHQUAubPvKFtIB7+QKH2zqDZze9fF+gRk0tGlA5VblMad7qLXhGQ6jDE
 B8uQYYMJSR/EOfJ+THxU9fX/QQ==
X-Google-Smtp-Source: AHgI3IbK4IweKb4P4CB7mav+R8q43ycip8S1wtYfiNc9w96n/KoZMIgL/oCU97P+sf2kgldLM3iKNQ==
X-Received: by 2002:a65:628e:: with SMTP id f14mr5609328pgv.193.1550008770362; 
 Tue, 12 Feb 2019 13:59:30 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id g136sm25685069pfb.154.2019.02.12.13.59.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 Feb 2019 13:59:29 -0800 (PST)
Date: Tue, 12 Feb 2019 13:59:29 -0800 (PST)
X-Google-Original-Date: Tue, 12 Feb 2019 13:59:27 PST (-0800)
Subject: Re: [PATCH v2 6/6] RISC-V: Implement keepinitrd kernel parameter
In-Reply-To: <20190119132650.9978-7-anup.patel@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Anup.Patel@wdc.com
Message-ID: <mhng-be5cef72-ac95-4f24-8b45-4c884085d2cb@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190212_135931_326945_0C0DEED9 
X-CRM114-Status: GOOD (  18.40  )
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
Cc: aou@eecs.berkeley.edu, Anup.Patel@wdc.com, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <Atish.Patra@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, 19 Jan 2019 05:28:59 PST (-0800), Anup.Patel@wdc.com wrote:
> This patch implements keepinitrd kernel parameter. By default,
> keepinitrd=1 but users can pass "keepinitrd=0" to free-up
> initrd memory at boot-time in free_initrd_mem() function.
>
> The keepinitrd kernel parameter is already implemented by
> unicore32, arm, and arm64 architectures and it is documented
> at: Documentation/admin-guide/kernel-parameters.txt

All I see is

"

        keepinitrd      [HW,ARM]

"

which is pretty lacking for documentation and should be improved...

I'm happy to take this as it stands for the next merge window, as if you hadn't 
mentioned documentation then I wouldn't have looked :)

> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  arch/riscv/kernel/setup.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index 9cd583b6d1cd..46e547dd8245 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -97,8 +97,20 @@ static void __init setup_initrd(void)
>  	initrd_end = 0;
>  }
>  
> -void free_initrd_mem(unsigned long start, unsigned long end)
> +static int keep_initrd __initdata;
> +
> +static int __init keepinitrd_setup(char *__unused)
> +{
> +	keep_initrd = 1;
> +	return 1;
> +}
> +
> +__setup("keepinitrd", keepinitrd_setup);
> +
> +void __init free_initrd_mem(unsigned long start, unsigned long end)
>  {
> +	if (!keep_initrd)
> +		memblock_free(__pa(start), end - start);
>  }
>  #endif /* CONFIG_BLK_DEV_INITRD */
>  
> -- 
> 2.17.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
