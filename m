Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B91BC3DA61
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jul 2024 21:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fwHS7oqPFv71g6FYu7i5F8dIYL3RP3u2wVofrept9XY=; b=tQlOrY32Xp3TfK
	dJB7xIPXnByX4wkZ5umbyA97fpVEwSXTY7CIdQuj7Ecnia+vEU14OcVrfYJTH9LlXdTOMblsqQG1l
	FNC7xrwcmca393SkbUl4mKuKWr3nZ9amE5B09z/zZdZOvZbrjbi1a/dN3SdAGoJIhM4JOWHUqzwkL
	aMw1ebIuLKNl62P9wRluIbV5+v3E0b5DYFvWihWQopSJ9MhwuAQQQ+A5AIS20EYHmWo7nclBu6bNF
	O4/h9VfjP4wzoNVQPFensc8RYvr69SLq//6xTlYysa6JCzUYU66QGrkYh/I3spHMqr4aAMxSRVIif
	eya1ldNft3AnbN95wGkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUYlx-00000000k3N-1J5L;
	Thu, 18 Jul 2024 21:34:45 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUYlu-00000000k2s-37iD
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jul 2024 21:34:44 +0000
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-8076cee8088so40898239f.0
        for <linux-riscv@lists.infradead.org>; Thu, 18 Jul 2024 14:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1721338481; x=1721943281; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IUtCKtIzqGuY0q5cwXIOFhLdAMxypBe1qmgcMDT+NXI=;
        b=OfEUY9+wxfK5uFxdONyDEmBa+4U1dweP2b51idwbIN2mlOf4ZIQVx9yoyfArsVEKpR
         gVbb+PcvoWMy27PO2ZFvmSTsmANKZrw/1dBCnoMZ3klN8QepCR9n3hVHdyvLjux2JVqR
         TdbgC+sKitORvcsp+6r0cbmqmc0BS/KJ4Zm/HnIfvVZGouYtCFKYJaVrooXIJcqos718
         Wuxcj4lahiov/JcThUYyiAk3SWjwMaCOD+ajC7J893G06AGOMtOgnnqYqmuHJa9VKY2K
         Unsmyt5v2I0KchPO5Y99dXI11LqdWw1hiFwTZKliu2PhLVaf2R/XEZHn+Vqm10dLQOuT
         hD1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721338481; x=1721943281;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IUtCKtIzqGuY0q5cwXIOFhLdAMxypBe1qmgcMDT+NXI=;
        b=FJRajMBwb6inIhMvsuOD2wpGeyRhI7KRyTZdUDgvgf6Jbnb2OYFWkf4IW0EDgyx8Uh
         cltYFr75R6TmzVISZrhdSc9Up9aVNOWzRXhaBdCJlLxytm/Q1/lSETM1wc0q5UjnOiYo
         OYGU+ENo2Acmfnc14ycjx2JmR03IqCT7YExNZzPUzNV2qxeKGfpv85uhnLbJLwjVMast
         qaDuIHMnrd0BCiBAR2X2i3eolU4rJEXMmvOj89LECv5YM8KmaJBVRQpdSlCrjaV4+kOX
         21882cAaezeak5CFx2BvoqZyDU/nFk0xyDbRYuaSOomSGsGr0UDuIGnFXWFDBTR1nP/p
         PP3Q==
X-Forwarded-Encrypted: i=1; AJvYcCX8sTjRmWbGLEYw2MDqz74RF/iAjcv5usCOPUVauvSGMblLyF9YPWU6tzHmO8fmIl9yWSMQcLvNNDpIzW3r1ul3XcRDHIoZu2G3rh8RAHJe
X-Gm-Message-State: AOJu0Ywd+n+/EKc21v/Cs2GCC/b7HmLelRQGlAtBjLWB+u6t1wRGrtnF
	I5DVggd56K+ouie9WCy+UJwl3E4b8g89TtazdnbLWmvedoy1QzvQuylYW8o83nYjwKRDsxkAdse
	d
X-Google-Smtp-Source: AGHT+IGlIiHvpq47W3PGwq6TDOaf2pcHH3RyIU5b5agJJADcI2hIKDn1U46oKogXvzuHTqteosSwEg==
X-Received: by 2002:a05:6602:1503:b0:7f9:217c:c109 with SMTP id ca18e2360f4ac-81710bd3fe7mr956517739f.9.1721338481365;
        Thu, 18 Jul 2024 14:34:41 -0700 (PDT)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-819aba121f9sm3552839f.6.2024.07.18.14.34.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jul 2024 14:34:40 -0700 (PDT)
Message-ID: <75ba30e5-3371-4ca9-9dbd-af7f78907c30@sifive.com>
Date: Thu, 18 Jul 2024 16:34:39 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -fixes] riscv: cpufeature: Do not drop Linux-internal
 extensions
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
Cc: Albert Ou <aou@eecs.berkeley.edu>, Andrew Jones
 <ajones@ventanamicro.com>, Andy Chiu <andy.chiu@sifive.com>,
 Charlie Jenkins <charlie@rivosinc.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?=
 <cleger@rivosinc.com>, Conor Dooley <conor@kernel.org>,
 Evan Green <evan@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-kernel@vger.kernel.org
References: <20240718213011.2600150-1-samuel.holland@sifive.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20240718213011.2600150-1-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_143442_817147_B1A1F454 
X-CRM114-Status: UNSURE (   9.99  )
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

On 2024-07-18 4:29 PM, Samuel Holland wrote:
> The Linux-internal Xlinuxenvcfg ISA extension is omitted from the
> riscv_isa_ext array because it has no DT binding and should not appear
> in /proc/cpuinfo. The logic added in commit 625034abd52a ("riscv: add
> ISA extensions validation callback") assumes all extensions are included
> in riscv_isa_ext, and so riscv_resolve_isa() wrongly drops Xlinuxenvcfg
> from the final ISA string. Instead, accept such Linux-internal ISA
> extensions as if they have no validation callback.
> 
> Fixes: 625034abd52a ("riscv: add ISA extensions validation callback")

Apologies for the incorrect subject line. This fixes a commit in for-next, so
this patch is targeting for-next.

> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
> 
>  arch/riscv/kernel/cpufeature.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
