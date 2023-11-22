Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B40C61D97
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 20:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BFZ986BPwjNOuQzppJQsvLgKsEFRbZ9eYxgL0sdx0Uc=; b=Y39soxmR8lLNLn
	+FaU7kzTu8y2wpCII3LEvOkD0LTFV1GyiTbUV/ZgdN6EegDRcJuzWQA3JUPO3ZtpX9fctGPMrBWBA
	PSJ1kLFcLpGY1gihpC67c9UJIwX+nfdcOuvWdLRArNIO2o4xwVj8UyA7siRmeWfOonjyroTquoDNC
	NE9uN79rIPQG/nUEoYmFi2JsINdLTpzd6mWMWdVGh+X417kaNGtsmef0pn1VeSo6Zpmo0qltHBNEG
	61A3rKnZRXVkF4tAGnRF0Ph1Og/H5iVtoeXOuAplxzmF9K7ABFDweOQZxm4nOjuP8v0uP3Z9p7eIz
	C/xJcdJM10dWMYB6qxfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5tWi-002zIu-0d;
	Wed, 22 Nov 2023 20:08:48 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5tWf-002zIF-2f
	for linux-riscv@lists.infradead.org;
	Wed, 22 Nov 2023 20:08:47 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-35b1d57d7dbso478545ab.3
        for <linux-riscv@lists.infradead.org>; Wed, 22 Nov 2023 12:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1700683725; x=1701288525; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vwn5XjAFVwzSFE87KSWGBC++RkG6QZotk9BZhXt0jBU=;
        b=JKkHodiP41gKVyTeWqAMLBzJHm+pE0DgcZbmjiB57AAdnMWdjamh6VWDN+GuyVWLks
         TboRHgZk8cX8A15J9Sstovs6gi0vmMdqjvfht3wAsSTPeH5dwg9NmC67UMK9BJ9ZJapD
         cOAiIlJfRy2gvAYJ7bCkkTiDm/GsR3w7BHlTtfZ8tF/DX5tEbybpyUSz5/kewQL7NgCm
         dUPwpXcJVkQ8Fa5K5JrIKl8zIuO3If53VKtzRZ1lE1zbNdB0yEFueDa4ztWoL/VYVAJv
         z9TP559Gc/j+2AGBQ71elbl8e1yNbuOTXIAYF0o9tboo8bb0cDJNbEwRxqfc66XnjB2F
         F5GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700683725; x=1701288525;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vwn5XjAFVwzSFE87KSWGBC++RkG6QZotk9BZhXt0jBU=;
        b=dlEFO3TSi7W3Qgw/FogQP7oiGZ9xukM464e02u8Op31lGlyWtBzLMJ8Xx5hoYCnxl3
         B1EaFlRn9LZ6b2HOJCrkMtkvt7d9r9ougk/KEwpbwCg41xS5JP9ZAekPnqOEHBNcG5Z5
         vkbNIJI+qz0CkHo59USL7lXINEWchD6qXOndz2xTZWHSsrdouR+7pCu5jSPC9oBwHow8
         VV7oaAWd/nYiP/9wC1MoUJGm6wl8zXtbmf2+vI+yoZR8RLMfqvfArBVzUnJocLaFL7QR
         lHyd1GcLVVHKJlWWZe5MBgXlXDfaY/kV7oD2dl6zuPG7dWR8MHn/AQ0B2IYHoStX501z
         LN3A==
X-Gm-Message-State: AOJu0YxCUs7z0N4OoHQoRkKZhXBafA8VSUgut+AAAm7OntYEszK+Xrzu
	UY5FS5cIHwN55bJ43DcCICIz+A==
X-Google-Smtp-Source: AGHT+IF2qTlIhwVKEGQ0JFu0xT0lbRPaHgpkk1nP2LZCxYCZLDSL39dT1xuRlbmj8kzVW+/OEqRihw==
X-Received: by 2002:a05:6e02:1345:b0:359:8ddf:5319 with SMTP id k5-20020a056e02134500b003598ddf5319mr3302057ilr.26.1700683725117;
        Wed, 22 Nov 2023 12:08:45 -0800 (PST)
Received: from ?IPV6:2605:a601:adae:4500:3d43:c8e2:1496:e620? ([2605:a601:adae:4500:3d43:c8e2:1496:e620])
        by smtp.gmail.com with ESMTPSA id e7-20020a926907000000b0035acf801fe5sm100939ilc.64.2023.11.22.12.08.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 12:08:44 -0800 (PST)
Message-ID: <11b0d7cf-b136-454b-a624-d9247bcd2e31@sifive.com>
Date: Wed, 22 Nov 2023 14:08:43 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/21] riscv: convert to use arch_cpu_is_hotpluggable()
Content-Language: en-US
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Salil Mehta <salil.mehta@huawei.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, jianyong.wu@arm.com,
 justin.he@arm.com, James Morse <james.morse@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-pm@vger.kernel.org, loongarch@lists.linux.dev,
 linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev, x86@kernel.org,
 linux-csky@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org
References: <ZVyz/Ve5pPu8AWoA@shell.armlinux.org.uk>
 <E1r5R4L-00Ct0d-To@rmk-PC.armlinux.org.uk>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <E1r5R4L-00Ct0d-To@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_120845_865165_CB86D7DB 
X-CRM114-Status: UNSURE (   7.42  )
X-CRM114-Notice: Please train this message.
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

On 2023-11-21 7:45 AM, Russell King (Oracle) wrote:
> Convert riscv to use the arch_cpu_is_hotpluggable() helper rather than
> arch_register_cpu().
> 
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  arch/riscv/kernel/setup.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Tested-by: Samuel Holland <samuel.holland@sifive.com> # On HiFive Unmatched


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
