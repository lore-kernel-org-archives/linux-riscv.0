Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D642E7107A
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Sep 2023 14:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4WiTeC00vjqjtdrTYshpqCj/HMgqqnVwrvEORanv3pE=; b=OCn691Q2b1Zwd7
	le3Xxjp1fhIJcidaUJo1DQr0xa8JEWCquJeHUDhvlbOSw9rUvUgC3e2AZ0dUzSo4YIk4w+rj9DPfj
	JvRsAxpBW2trfsMEiJGOiZtAg57oedISkl3c4hGB+6FP02im+uOaijFpHFcMP34/Qov+Gx47ybuIH
	ugRRZhlz9jL3stDGPiYyTNQBngoMdMQLLeAJi1Ozp8P/Ci4PqHk0gf57ghbZyXUf4wKC5R2uElgMq
	Vw1BdgrEWUzGo53ZwcHLysAZYV4pFx9/ahVcqo8xipcomCJx35o6SI99z4pgzIAoyLTwkfUEKKGSC
	QXG2w74WHpvAgJmt59cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjKYu-006FVk-22;
	Thu, 21 Sep 2023 14:21:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjKYs-006FUs-2d
	for linux-riscv@lists.infradead.org;
	Thu, 21 Sep 2023 14:21:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695306102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OOwzuFe78Vbuyug87izQRXFFJhV23TSLZTUmERr8ACI=;
	b=bxwBTfLcpACaRDzwhxLYUNhSHf/UXh7Nmx5Ys2kiiBqwLjiH6M7tfsmn3WtrYREssD6a78
	+1AcpNdIFcUxO1wJ5cBESqcOf6KOBEY8MW9M5FdEJfctzIEk0nf4Zif5VVwpaDqESlrKgV
	MhZqP47+XzaPzduclNyM6EUhuZo8uFk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-412-nyUQIdkYP0yQyp_dzyfzPw-1; Thu, 21 Sep 2023 10:21:41 -0400
X-MC-Unique: nyUQIdkYP0yQyp_dzyfzPw-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-532eb7faea1so778615a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 21 Sep 2023 07:21:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695306100; x=1695910900;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OOwzuFe78Vbuyug87izQRXFFJhV23TSLZTUmERr8ACI=;
        b=OqU8dqzloATSbBasXoXp/uoNNtO2LWxrBv6+jbsJ3IFUJQEjkKSO9JVruYbghnqvDP
         3LExDL8AOTM7eCUrBvb8lSgOfnxuK7vMjaBRsrSr3KpkX/zkXuKmbVKGJFviFFp9rlUC
         C7ziB/aUHHSj+LV/LRRfYyfeTAORKozaLTTbkiT8neqrb218W4DT/Mg/fWz1cplo0OST
         Yy4Hbqb7s/klOa+jvoW1g6NwFkZWIMIVeev2PaLnEYE1E9ppKS/a6eH/cK5xesWOrP5w
         jYa3hkvQ4eUAncwOVlZYVEk5zyoMI4hhAIsNWpdCGfnOPxyReN7pnD/nQUJpfomjJERB
         7qnw==
X-Gm-Message-State: AOJu0Yw8oG57jLLENMACq8KSFZpGZO1Uc6uXDT4i4iMSl6jLG9bJEDsH
	bzVwJp5EfrQVHTxVEW6URzXjK7ZP1FZ7aIf/1zNAnsUCI36p6Z8aOOXIZHDHBD9p4Dub3cIpip/
	nEHRItPaVHOJ6KX4h2Agi/f0c9Omm8/SqbuBu
X-Received: by 2002:aa7:d843:0:b0:52f:9a8b:ea2d with SMTP id f3-20020aa7d843000000b0052f9a8bea2dmr5085972eds.20.1695306100484;
        Thu, 21 Sep 2023 07:21:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwy9Bm1IMREXwYw+IfTctkQhUlEOehm320GrGrs1Q8R4k4xZkWr3mKW2Q8KTCgOLnlB12CYA==
X-Received: by 2002:a7b:ce91:0:b0:3fe:4548:1892 with SMTP id q17-20020a7bce91000000b003fe45481892mr5090253wmj.16.1695306079163;
        Thu, 21 Sep 2023 07:21:19 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70d:3c00:9eab:fce5:e6f3:e626? (p200300cbc70d3c009eabfce5e6f3e626.dip0.t-ipconnect.de. [2003:cb:c70d:3c00:9eab:fce5:e6f3:e626])
        by smtp.gmail.com with ESMTPSA id f18-20020a7bc8d2000000b00401d8181f8bsm4919880wml.25.2023.09.21.07.21.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Sep 2023 07:21:18 -0700 (PDT)
Message-ID: <90d76803-9e77-516d-83ac-99233cbd43f1@redhat.com>
Date: Thu, 21 Sep 2023 16:21:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] riscv/mm: Fix the comment for swap pte format
To: Xiao Wang <xiao.w.wang@intel.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230921141652.2657054-1-xiao.w.wang@intel.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230921141652.2657054-1-xiao.w.wang@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_072147_006459_DBBB0A92 
X-CRM114-Status: GOOD (  13.97  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 21.09.23 16:16, Xiao Wang wrote:
> Swap type takes bits 7-11 and swap offset should start from bit 12.
> 
> Signed-off-by: Xiao Wang <xiao.w.wang@intel.com>
> ---
>   arch/riscv/include/asm/pgtable.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index e05b5dc1f0cb..e94a2998e81e 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -812,7 +812,7 @@ extern pmd_t pmdp_collapse_flush(struct vm_area_struct *vma,
>    *	bit            5:	_PAGE_PROT_NONE (zero)
>    *	bit            6:	exclusive marker
>    *	bits      7 to 11:	swap type
> - *	bits 11 to XLEN-1:	swap offset
> + *	bits 12 to XLEN-1:	swap offset
>    */
>   #define __SWP_TYPE_SHIFT	7
>   #define __SWP_TYPE_BITS		5

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
