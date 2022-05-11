Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 618E1C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 11 May 2022 12:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ua9jAKRd4mx/kKDEv+1YpxlNt9kIK3UaHPSe8AVJDBs=; b=wOTUOi35Ec3iaZ
	7O2Ab+PmL2aYzWwMQxuFr5o96nBzDKZtSdYtACE79PdrbLHLKX8z2pjghcCXabVDrdQWNeSfU1+MI
	efnP49nN2OZlgs8csWLGmSftaNj9WivHYyqX1NdU4ECCouVz6Z3DxTvjJrT8Pqh4r4ldgxNP/oe9z
	bWN5HFUmiFbLkeajntW9d8vcRBMPCddtIQgtu3v6yQymnBdHEWNerGo4dqpGHv9oFpJG732GX43uO
	GOD0M0n+QtaUz3P+SZ7q4CBdn0oyLNf3DG5yaL/yfPJbXkW1p5n9kSbs4Ai86yHopUeWLhh+5H5fS
	D3JB+YbJoeBksaacegFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nolRZ-006ma6-AO; Wed, 11 May 2022 12:27:53 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nolRW-006mZA-Jy
 for linux-riscv@lists.infradead.org; Wed, 11 May 2022 12:27:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652272067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hUCEDpMcELwjroIKSRZI8OB/5UA+ogwez3KA5XNPQjQ=;
 b=TwieXsqYkYmaZaxdocJQR4SiLRwlFY+1rfERYFxttyxDBve3Psyw0ef8QLlp2BW/bWq1u8
 7kTmtE15zxW3efzw0Nx9S3CrD224/2CLpD8jjNy+pThEfXlJyx1VW3ZNGRSwQ94tYR+z3D
 EA3tK+PMkFbS969T8TQXH+e/90+vEr4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-6iHZtpOePvadYigNKb1A5Q-1; Wed, 11 May 2022 08:27:37 -0400
X-MC-Unique: 6iHZtpOePvadYigNKb1A5Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 m124-20020a1c2682000000b00393fcd2722dso648930wmm.4
 for <linux-riscv@lists.infradead.org>; Wed, 11 May 2022 05:27:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=hUCEDpMcELwjroIKSRZI8OB/5UA+ogwez3KA5XNPQjQ=;
 b=PuSibVIl8gZC6Fho9EmIVi14g80fCoYzlSQkNY3M1SaGmnIaaa5xz9cfBmJ7SF95Sy
 PdgEoLMZ71AiB9CPLzNiyBdFV6fcwY3XNws+O2LCeVwQvE5SMj8Z7T+H8HRh7EkvfJFz
 aDaH86hoLGi9FqUIsut57HObzTFXrjR1zpqG6y2qj0FBhA0NOTiMJexpUhTMSuYEOPyq
 /JLR944a3RJjtGDh7EltH3FiLq6NTEkMpBjHn4RKyQlLb6/99RIupbbRXW00GSc30dDv
 A2phonwIiDBncDqx/L0uxdijo8vpABTG+IOAPwN5o1dYFDm0X05xPFdm2wweowqOvo5P
 OUTQ==
X-Gm-Message-State: AOAM5312Rpujvt8GQalSc1d9EbC9wx2bi13TZCbNKzaJKXaKJWTXJm5w
 twZKhAQ5qTkQG2HlPQys5gkbZNIme8qeZTPorut0ma8810GJyHBoNA3nnvxcxG9mQErModOCGJg
 6i2ahi8NXMnOFdgWuXpFchriIzfza
X-Received: by 2002:adf:f809:0:b0:20a:c40d:ae9a with SMTP id
 s9-20020adff809000000b0020ac40dae9amr22633091wrp.609.1652272055889; 
 Wed, 11 May 2022 05:27:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx4vhxqnTmWHdFk3+Z1Bppcfdj6GdhkeCnzL/pWI2XiCnosbdMq+/Y1YjqIsk754DQqSlF42g==
X-Received: by 2002:adf:f809:0:b0:20a:c40d:ae9a with SMTP id
 s9-20020adff809000000b0020ac40dae9amr22633063wrp.609.1652272055618; 
 Wed, 11 May 2022 05:27:35 -0700 (PDT)
Received: from ?IPV6:2003:cb:c701:700:2393:b0f4:ef08:bd51?
 (p200300cbc70107002393b0f4ef08bd51.dip0.t-ipconnect.de.
 [2003:cb:c701:700:2393:b0f4:ef08:bd51])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a5d6aca000000b0020c5253d925sm1534898wrw.113.2022.05.11.05.27.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 05:27:35 -0700 (PDT)
Message-ID: <4407c84b-a64f-51b0-fa96-388aaf3b3e35@redhat.com>
Date: Wed, 11 May 2022 14:27:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] RISC-V: Remove IORESOURCE_BUSY flag for no-map reserved
 memory
To: Xianting Tian <xianting.tian@linux.alibaba.com>,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 akpm@linux-foundation.org, anup@brainfault.org, wangkefeng.wang@huawei.com,
 rppt@kernel.org, alex@ghiti.fr, twd2.me@gmail.com, seanjc@google.com,
 petr.pavlu@suse.com, atishp@rivosinc.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 guoren@kernel.org, jianghuaming.jhm@alibaba-inc.com,
 Nick Kossifidis <mick@ics.forth.gr>
References: <20220511112413.559734-1-xianting.tian@linux.alibaba.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220511112413.559734-1-xianting.tian@linux.alibaba.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_052750_758886_10E8E9CD 
X-CRM114-Status: GOOD (  18.17  )
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

On 11.05.22 13:24, Xianting Tian wrote:
> Commit 00ab027a3b82 ("RISC-V: Add kernel image sections to the resource tree")
> added IORESOURCE_BUSY flag for no-map reserved memory, this casued
> devm_ioremap_resource() failed for the no-map reserved memory in subsequent
> operations of related driver, so remove the IORESOURCE_BUSY flag.
> 
> The code to reproduce the issue,
> dts:
> 	mem0: memory@a0000000 {
>                 reg = <0x0 0xa0000000 0 0x1000000>;
>                 no-map;
>         };
> 
> 	&test {
> 		status = "okay";
> 		memory-region = <&mem0>;
> 	};
> 
> code:
> 	np = of_parse_phandle(pdev->dev.of_node, "memory-region", 0);
> 	ret = of_address_to_resource(np, 0, &r);
> 	base = devm_ioremap_resource(&pdev->dev, &r);
> 	// base = -EBUSY
> 
> Fixes: 00ab027a3b82 ("RISC-V: Add kernel image sections to the resource tree")
> Reported-by: Huaming Jiang <jianghuaming.jhm@alibaba-inc.com>
> Reviewed-by: Guo Ren <guoren@kernel.org>
> CC: Nick Kossifidis <mick@ics.forth.gr>
> Signed-off-by: Xianting Tian <xianting.tian@linux.alibaba.com>
> ---
>  arch/riscv/kernel/setup.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index 834eb652a7b9..71f2966b1474 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -214,7 +214,7 @@ static void __init init_resources(void)
>  
>  		if (unlikely(memblock_is_nomap(region))) {
>  			res->name = "Reserved";
> -			res->flags = IORESOURCE_MEM | IORESOURCE_BUSY;
> +			res->flags = IORESOURCE_MEM;
>  		} else {
>  			res->name = "System RAM";
>  			res->flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;

I assume the "Reserved" part is essentially unused by the kernel correct?

-- 
Thanks,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
