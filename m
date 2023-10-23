Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF705C001E0
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 10:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CjljtFmAS0RD4fpxoDoR//EGKCwrB/kMEoWzWVpc15Q=; b=Xh17irTprSk9T6
	2W/G+r1c26LpgGJvjeJgdmVPwFMbDzo5YlF6DqlWrdEAhNuQYh4GNzRCfiLeL+1IRzlvWNP85/cy8
	/u/RRkKVpjiBYvMUtriLhYR+C/OQEXbGL6hi60+3Wf4tGBVTgcxby0VZVj/8HSLGfwFAKXd80j4cr
	OStc9yBst2kaGZxUo9zzxY6Pa8jrrwIYbBzMLGJoPG/KsI+nM7HBa0+gJB+QBFqW67fnhmd3x2hWh
	kUXn5HhdAhZ//+qpQGFxGpqoczcEZZRyK+M+1Rqlv4mxAapIygHfJ7CAkdwr9+LXDAGyWnznCgqdY
	NB98HnCvMBahzUbTQMzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qurmo-006zNl-0w;
	Mon, 23 Oct 2023 10:03:50 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qurml-006zMP-1J
	for linux-riscv@lists.infradead.org;
	Mon, 23 Oct 2023 10:03:48 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-54041e33845so1599828a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 23 Oct 2023 03:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1698055425; x=1698660225; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PlK135OBaI7US5u50OHdZS8GXFt6KDacCwj3egjonHM=;
        b=EHkO/M4CZpyI2YIZgiDA70qlMcbreCxwBjPJKILZ0llZcheALzvThutbLmwBkz1R+i
         HwjPHDf7GUAt/x4VawJkcABwei10fXBrRVSZgqt34kHcHk5otV7fvRG91AEwCd9wHjoh
         +XIZVlN2pPveKhQjWeL1hPyg2XPrtZDhh2cZWgPEOr28UWVMC+CGI2pk1MaSRgWjlUcM
         PeuYFlgEDQI6MLxJR4zuKVMf5DPyDrU5tGyIisd4gtndfQ3u2yFkHQiLeXv23IxlgAuf
         zzM69Ojh2nw707sBnSThyOd77COyHu7KUiuuUbxbgbIB/Z8dcqGiadRf68KvISSUvJpg
         Hy4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698055425; x=1698660225;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PlK135OBaI7US5u50OHdZS8GXFt6KDacCwj3egjonHM=;
        b=Mf/inU2EYUvK4gDs4u9ee3PBKuAhj0p8gU4BRWkZVB0Fw+3xE9WlmSm06tuuGr4nV7
         t0VNKIsEJPIzK42lxIGAGV1MOHtfS3jwyFnyVz09b35CC8wo2zAIipmXey6rH7+owlLf
         +YcwA3iVavvdYwtZ22CnFk7gPZ14msX8/IV/HwBuwjITnD0acBAeQn9Xu3LavZ6EFlma
         VMgE8k6hFvtXSxPjRTw7xjbeAVVg7iVp4EXnsrrzwIWNAQr4miWecigkxdiHvL4hEqJg
         XfnC+aBOqFPj4ob5XCj5m6bp17E8SDutjAObrcMn9kJHdl/EcMAsQl7Rn4jZZCUld18A
         H66g==
X-Gm-Message-State: AOJu0YwBjYRNTdEYEqxzDRg5UjB8cSkdOSNgYqFVnjmxokOR4st8VB5L
	R7hJlmoal9018o89pnNxQmO1gw==
X-Google-Smtp-Source: AGHT+IFRfdui73pEXWIt5PF13FM7uWu3c1hEOSC66KBzZbNTtT/nXpui8/s+R6Q0DQh+G3ba6gRH+Q==
X-Received: by 2002:a05:6402:42c4:b0:540:37d6:c1f3 with SMTP id i4-20020a05640242c400b0054037d6c1f3mr3183808edc.11.1698055425598;
        Mon, 23 Oct 2023 03:03:45 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id v28-20020a50d59c000000b00536159c6c45sm6147002edi.15.2023.10.23.03.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 03:03:45 -0700 (PDT)
Date: Mon, 23 Oct 2023 12:03:44 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
Subject: Re: [PATCH 4/5] riscv: kvm: Use SYM_*() assembly macros instead of
 deprecated ones
Message-ID: <20231023-33c38ae1672a9006fb91671b@orel>
References: <20231004143054.482091-1-cleger@rivosinc.com>
 <20231004143054.482091-5-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231004143054.482091-5-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_030347_440695_26B6C951 
X-CRM114-Status: GOOD (  10.12  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Oct 04, 2023 at 04:30:53PM +0200, Cl=E9ment L=E9ger wrote:
> ENTRY()/END()/WEAK() macros are deprecated and we should make use of the
> new SYM_*() macros [1] for better annotation of symbols. Replace the
> deprecated ones with the new ones and fix wrong usage of END()/ENDPROC()
> to correctly describe the symbols.
> =

> [1] https://docs.kernel.org/core-api/asm-annotations.html
> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> ---
>  arch/riscv/kvm/vcpu_switch.S | 28 ++++++++++++----------------
>  1 file changed, 12 insertions(+), 16 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
