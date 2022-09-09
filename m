Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6791ECAAD3
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Sep 2022 15:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:References:Cc:To:
	MIME-Version:Date:Message-ID:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KV4Ex7tdJqDhfYr5qd+dHT5s0ge5MCzruOgOPtGVnTM=; b=qDu34z4e18QJNs
	qxkmGcd8nGUcjp7dJFbv6tkmMaF0Wry3kAh8kxj8LXWpch5MkxEN4NNK8lOomTQUvDOMKA0Z9gGC6
	PvTsGscbGuvOO+S1RuPGLtLx1U+CTmap3sDegIOlhxLl+J3Z3aXj9T2pviUwruDW8Z1byM8AuO5NW
	PPGRvf+B44EaRowOKRhzUsvT32eJ/Qsaj7Fyzuw/0r5YpyAKfHyBpioo5ALmYJz7g/2ocng/Ikm6W
	KCJZr724Q4CdSaIk4x54f6HUQrYJzIblF7aKLlaZZRbXdpJbvbH4XIQIOy2bw4zGH4jMbAbeV9J9+
	D4gRMn53JpL8l7Y2tTBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWgCQ-00HXzQ-9g; Fri, 09 Sep 2022 15:45:46 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWgCN-00HXyP-Bm
	for linux-riscv@lists.infradead.org; Fri, 09 Sep 2022 15:45:45 +0000
Received: by mail-pf1-x444.google.com with SMTP id y136so2033892pfb.3
        for <linux-riscv@lists.infradead.org>; Fri, 09 Sep 2022 08:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:from
         :to:cc:subject:date;
        bh=19pT6mSAXVcVHpyyWc7CNF/SuAeFS3YlMdIwKH0tki8=;
        b=hWAGFj2k+XvyuRO6GXPx7k7QJ/4EsCz5P6s6krGgrnTcDbG3OR5Po58L6Hcc8yWinr
         iIjYkuss4tVo4VMhyDPR5mR/qiCfU8EjMCTmpf7gBb+c0tyNpHe9GooniPfXKTyeHy2O
         ncTGloCFD+JBMTgMd7iDpB31Myv657EWzeKQ4lWIWDVEbzyMLivM4ahYTyzWYCklySY1
         I+u2Sqoo2F7wVHKDLjqm5cc8VdFqVQnYbjczLZAFM5+tB5e7hN/HL9EjbEVgolVEpzxj
         5nVa6SGXzlhuWMJRYiC5btUuiGnWaNMGYu9+4p9Wss1WbyNB6y4Zw2WxFevbWohvtj1e
         KGEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date;
        bh=19pT6mSAXVcVHpyyWc7CNF/SuAeFS3YlMdIwKH0tki8=;
        b=wvejFuaTGexi2uJx/j+Y2uQmWhOvQ5lbRiZoNCim/3TqJKJWvAA9whDvWy8N2jH9z6
         RV0LDHnMs4klcDyTxxcQg6IjMPVYvI7cniGCFlZV0EN3xJCzgFVye9YGZXy7ALNuOMx0
         e/hNI8LWtDqHEt+LSqFJWWUR+NpMjtfGmt3aRIFdQhH2BJiEeZfwNITaFrW1nhJiPtqo
         xcSWEOEZy2xOcOgNQUW2AK6hicku9ACA2pjocUYezoS/hGE/HxrRfzLIMsrnxHPVMeFp
         spwUlb3uaVuzXbCLycaQooWMAfiEQg89wYlb2MzgaAmuGJnKr/+MG3x9CU4LnjG0cX22
         fSeQ==
X-Gm-Message-State: ACgBeo3DVaGeCGHVVRG9LclSu1nJefhdarqussfsEukBf29hNKa1HCVB
	EBwW8fyyTBVcMHz3m5oPgVY=
X-Google-Smtp-Source: AA6agR6hrnElk2+x6ewuzRgQNm161XHy8SwV6bA2DomG9D4bKogKNui0z0qrv9U6flX7QPabs7V3Zg==
X-Received: by 2002:a65:6b89:0:b0:41a:69b1:8674 with SMTP id d9-20020a656b89000000b0041a69b18674mr12548548pgw.417.1662738339763;
        Fri, 09 Sep 2022 08:45:39 -0700 (PDT)
Received: from [127.0.0.1] ([38.94.111.114])
        by smtp.gmail.com with ESMTPSA id s9-20020a170902ea0900b0015e8d4eb26esm634799plg.184.2022.09.09.08.45.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 08:45:39 -0700 (PDT)
From: Celeste Liu <coelacanthushex@gmail.com>
X-Google-Original-From: Celeste Liu <CoelacanthusHex@gmail.com>
Message-ID: <3e2b9452-f010-3113-9da8-99ef658c3aab@gmail.com>
Date: Fri, 9 Sep 2022 23:45:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Content-Language: en-US
To: Andrew Bresticker <abrestic@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra
 <atishp@atishpatra.org>, dram <dramforever@live.com>,
 Ruizhe Pan <c141028@gmail.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220908170133.1159747-1-abrestic@rivosinc.com>
 <20220908185006.1212126-1-abrestic@rivosinc.com>
 <2f5059f6-b024-1ee8-b961-5aa0b4e4c116@gmail.com>
 <dfd6cfd9-5985-030f-4c77-f9037dcebe90@gmail.com>
 <CALE4mHoDbh2Aq7eotzKAeqy80n29LWkuP+gjv8ADH7pTJAYQhQ@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: Make mmap() with PROT_WRITE imply PROT_READ
In-Reply-To: <CALE4mHoDbh2Aq7eotzKAeqy80n29LWkuP+gjv8ADH7pTJAYQhQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_084543_451268_F3337886 
X-CRM114-Status: GOOD (  10.21  )
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

On 2022/9/9 23:16, Andrew Bresticker wrote> 
> I think leaving the PROT_WRITE-implies-PROT_READ as being specified as
> architecture-dependent is reasonable, but of course portable programs
> shouldn't rely on this behavior. There are CPUs out there that support
> write-only mappings -- MIPS with RI/XI comes to mind and indeed
> mmap(PROT_WRITE) on such CPUs results in write-only mappings.
> 
> -Andrew
> 

Ok, I have no question now. This patch looks good to me.

This feature shouldn't be relied upon indeed, as it depends on the specific
hardware implementation.

Thanks for your explanation!

Yours,
Celeste Liu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
