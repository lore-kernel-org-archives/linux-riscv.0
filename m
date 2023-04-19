Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A08C77B75
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 14:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:MIME-Version:Date:Message-Id:
	Subject:References:In-Reply-To:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L2jp4KSFziBvU1AqUFdtYEZSJLG3iZgiVOOIM5Pvms8=; b=wCHGVUclkF/QfT
	Itu/E7CBeTiEpf2+NRysoY3dMmgoPlnmdak23bcBQTsdDUDUStxMw2MKhMNFaDryzNjPNi7FJdjcz
	K9XqZhmYXYptShOmgNLgy2hZ2HqodzrsXUZVRhWkYkK4h2C87cJlj9kgBXEpT0oz2kqQ0jtJIDjGb
	hymuQBFCfPAH1jFe+0ZESKKzoTmcTqUOVHC/Au/tNR9zZPsEf/+Pmz6CsSMD1weyx1ZRNSbU9TjtI
	KAklbGRx/W2FUAeN8lk9n+GQWehdY/BOoQzvUnPajlrvLdzHYDufXq8zu7qXxs1T/tCzRxnm2SJlk
	h27ztSN0AvLLzMG6L6Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp8hv-005dzA-2W;
	Wed, 19 Apr 2023 14:22:51 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp8hp-005duc-2J
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 14:22:47 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-63b73203e0aso16455073b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 07:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681914162; x=1684506162;
        h=to:from:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4QMI2Yn+3Tt8Q1/CbQZqi01Ckjh+S0S8nE0G1uS1/Is=;
        b=T1EEo/1lNhWtIaj43BCGws+YmfqMTA6iMuWVagfEnT1xJA8qVwOPm1UGiTLe2NOFuM
         xMk7buI+T1c0Hf3+C2uqsQgEJHHaSuEgENbG5BOdgXzQw6qmKvjFm/lHzItwlc4j30pI
         v5SNg4zDHJJ59SreaJer2v7hZf5LQBP2OmSziT6uC7+pvGZBrGJz+CCb8kKTTjdQju9a
         kku5NeVrvk8S8WAibKcjPeWqbCmN/DAxVz0JiSKkYT179rZ/V1dOmkVPAKGqsIK5NZaW
         QXp9BfFBDt3hvjxhkTunOLMevN/GsODpZQqgxG1z5sdsJdhqmd9J2xXVcjSyZmaKNRaM
         NxGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681914162; x=1684506162;
        h=to:from:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4QMI2Yn+3Tt8Q1/CbQZqi01Ckjh+S0S8nE0G1uS1/Is=;
        b=fRfaWYxOj/UfXMeLcpjGzwHFJvPsYDxpvAKcEnFbDSvum5BA6ntE7vtx/soxjjQTzy
         f5k59ebXkk+reZQWrLKDPLwTnYEj22CLkglSEKjmO7S9tyS08S5+EGINO6qIfespzmwA
         fB/nN28HyoZHXcDlXldfBY8+Owfb6CD6WHfHY1O2uo8pr83oRKCrnTsdFofanuOH6mce
         MIwBOwg0kB6YJFh6z0Z0Z2jdVlRTdxSZXmDu8hSYrleB3MER+7ZZ7z9U63axQIktUeWB
         2u+F6sJZLFilkBpXrJfkrwiZSR/l2G7/UiMUjI+OQLiechLFfgd+XV7C+hChecWXqbBz
         simA==
X-Gm-Message-State: AAQBX9e4hwBhvR7YKyBlULDrwud+bgVa4kkAqWUk8+cHFkA1iV2E3C19
	FTA33I3cMiGKftzShF+m8twFeA==
X-Google-Smtp-Source: AKy350bsDoupaU7w23Gv+/Ur91Sz+5sUWiyttfG5xjuFIADCUHqGvSKNWHn052OZEniozc8lOEgaOQ==
X-Received: by 2002:a17:90a:9285:b0:246:5787:6f5d with SMTP id n5-20020a17090a928500b0024657876f5dmr3052189pjo.10.1681914162496;
        Wed, 19 Apr 2023 07:22:42 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id q12-20020a631f4c000000b0051b8172fa68sm7616348pgm.38.2023.04.19.07.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 07:22:42 -0700 (PDT)
In-Reply-To: <20230324155421.271544-1-alexghiti@rivosinc.com>
References: <20230324155421.271544-1-alexghiti@rivosinc.com>
Subject: Re: [PATCH v9 0/3] riscv: Use PUD/P4D/PGD pages for the linear
 mapping
Message-Id: <168191414582.1929.5343150179757042159.b4-ty@rivosinc.com>
Date: Wed, 19 Apr 2023 07:22:25 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
  Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
  Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_072245_750312_5A9C0FA9 
X-CRM114-Status: GOOD (  11.84  )
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


On Fri, 24 Mar 2023 16:54:18 +0100, Alexandre Ghiti wrote:
> This patchset intends to improve tlb utilization by using hugepages for
> the linear mapping.
> 
> As reported by Anup in v6, when STRICT_KERNEL_RWX is enabled, we must
> take care of isolating the kernel text and rodata so that they are not
> mapped with a PUD mapping which would then assign wrong permissions to
> the whole region: it is achieved the same way as arm64 by using the
> memblock nomap API which isolates those regions and re-merge them afterwards
> thus avoiding any issue with the system resources tree creation.
> 
> [...]

Applied, thanks!

[1/3] riscv: Get rid of riscv_pfn_base variable
      https://git.kernel.org/palmer/c/a7407a1318a9
[2/3] riscv: Move the linear mapping creation in its own function
      https://git.kernel.org/palmer/c/8589e346bbb6
[3/3] riscv: Use PUD/P4D/PGD pages for the linear mapping
      https://git.kernel.org/palmer/c/3335068f8721

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
