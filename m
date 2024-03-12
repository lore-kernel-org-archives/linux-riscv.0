Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72808C54E5D
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 23:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g5knH4cXGmb6QtA8sX+gG+d/sKx5ncYjOv4ZxPt5e5o=; b=O5oGpyCQqxRzh1
	Aj6qbdXOUotjTbyhxz56i6uFeCRSQJM5CxzxmObbUZ5cyjDGER2vVM17c72aLAM5aYt8LM9KNlmPj
	bIUjfQJ5XVnNKtOZn5kTqSvkRST0UahdP2UKoWfsAmxf7syIEqcN/qA7Z+Lor4mvjIMycyyIi4Kjj
	vDIihclhHhmeUpkY8RKmVQYClkPv5rEk0vcuBxpF07/W6n93hVCvZVyIvjMYJAb7qT/fiaX2BLfhk
	RY9I9nHyAn29zTv7E2Qi1482tu9V18PVy0u77g5SPAOF7s3OOT39eA7BNbtFaEaWP6WlZ0/MUa1dC
	5wQ1VW1hx3ispynXS3Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkBzK-000000082fr-2bPD;
	Tue, 12 Mar 2024 23:56:54 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkBzI-000000082f5-0mgF
	for linux-riscv@lists.infradead.org;
	Tue, 12 Mar 2024 23:56:53 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-690cf6ecd3cso21900076d6.2
        for <linux-riscv@lists.infradead.org>; Tue, 12 Mar 2024 16:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710287810; x=1710892610; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zl9PC7FMZlnjsGfkV0mu1AuaGsWjNCYzUqWD8hwrZds=;
        b=TdVJHbsWaE/Qb16689UIqfrTxuupfbS8txEieNh/GJgW8ZnfN40Xa490vrfqJdDPW/
         CQ2AWA4CdVKyFInZlE/wEX36vJpRcymnv6yj9Q+n8xb7sIvAJhz2H0/IZTZTLGZSqkqh
         iVZhx7du+8K/lmOMPD52+C/HYEVjv9xFVgGn23OVYYI1gUG3uDLRVnbm+IWdiT52Jy8z
         wMR82Dut/i0S3bpR1zDp3pCmttmggUzud/ehxWgVrCasG3YcolN5rfJ+hhuLAc+YpPVZ
         wLnkk1gI7Kkj5p5CGqt1cMg26zkGpfqQwAVlb2rK2UY3LDhfl7F6o3DxfF3Uww8GFqEx
         wafg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710287810; x=1710892610;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zl9PC7FMZlnjsGfkV0mu1AuaGsWjNCYzUqWD8hwrZds=;
        b=TnqhiOVOdv3DQwSUO8hYPDQ+InIEjU5wUZKUDInHQqqt66qHqT0ap0oeqUcGF0B1mt
         gSLFxnDiYqT9T8gtE/cjpU/gWZzj90R5Bu8juGolVcMw7WNiRcr0sfB56mVSkfke6iW5
         8h31LXypEj2/XY8skmDc/oH+HIdhaUqYblaBK41P9G0zIEAotbGoJjP6G21scaKHJaap
         eQ7YnrKoq40uFmVQnDvZ84qJm78Vq6XoVa7M3VLPXDeGVKzCb1/dGPtJoeBqej3s87HB
         ba4rzNZHhq0M5OeQy734mnhEPscIyopuU/snXf2anZNPklgmJAJw3zW2uCJBXy8zpeJH
         m4Hg==
X-Gm-Message-State: AOJu0Yx0iH2f5TDGybyqkqyEV5R+hM3/12wXVZpaXrmUcypu4KoIxMIv
	P2tsomxiMcn9D2fyTkmfNqLtUm9Um3bubNgOTQgo5bjkM7B5Anqk4fypc0P0f4k=
X-Google-Smtp-Source: AGHT+IE8Dmw1Z80zDDEuGQisqIkLb3ATdKh/kIXXdSWtfBQ7CA9QAFZ+Fy8t43y0MFgM+taz+MT7xQ==
X-Received: by 2002:a0c:fc41:0:b0:690:7a4f:d670 with SMTP id w1-20020a0cfc41000000b006907a4fd670mr13082479qvp.8.1710287809872;
        Tue, 12 Mar 2024 16:56:49 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.8.176])
        by smtp.gmail.com with ESMTPSA id r6-20020a0cf606000000b0069046d929a3sm4080243qvm.145.2024.03.12.16.56.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Mar 2024 16:56:48 -0700 (PDT)
Message-ID: <1c24d9d8-36dd-4bf1-a1b0-afd371fbb809@sifive.com>
Date: Tue, 12 Mar 2024 18:56:47 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 2/4] riscv: Include riscv_set_icache_flush_ctx prctl
Content-Language: en-US
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Atish Patra <atishp@rivosinc.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jonathan Corbet <corbet@lwn.net>, Conor Dooley <conor.dooley@microchip.com>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 Atish Patra <atishp@atishpatra.org>, Randy Dunlap <rdunlap@infradead.org>,
 Alexandre Ghiti <alex@ghiti.fr>
References: <20240312-fencei-v13-0-4b6bdc2bbf32@rivosinc.com>
 <20240312-fencei-v13-2-4b6bdc2bbf32@rivosinc.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20240312-fencei-v13-2-4b6bdc2bbf32@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_165652_330609_3B8C63DC 
X-CRM114-Status: GOOD (  10.33  )
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

On 2024-03-12 6:53 PM, Charlie Jenkins wrote:
> Support new prctl with key PR_RISCV_SET_ICACHE_FLUSH_CTX to enable
> optimization of cross modifying code. This prctl enables userspace code
> to use icache flushing instructions such as fence.i with the guarantee
> that the icache will continue to be clean after thread migration.
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/include/asm/mmu.h       |   2 +
>  arch/riscv/include/asm/processor.h |  10 ++++
>  arch/riscv/include/asm/switch_to.h |  23 ++++++++
>  arch/riscv/mm/cacheflush.c         | 111 +++++++++++++++++++++++++++++++++++++
>  arch/riscv/mm/context.c            |  19 ++++---
>  include/uapi/linux/prctl.h         |   6 ++
>  kernel/sys.c                       |   6 ++
>  7 files changed, 169 insertions(+), 8 deletions(-)

Thanks for the updates!

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
