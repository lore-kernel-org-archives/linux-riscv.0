Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 930BBC433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jun 2022 04:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=yucanKFrFlMu8xQZnt0jhB6zVtkuEtXsTrsW7I8+VjE=; b=PiWQwKmRzmjfEvOxnpKkRhZXSq
	LNcCGoWQ4OFnPaz5wqTTdY69cIMtIGD9ErJ0gwYhDDPHBRhzgWgdPL/dCAa/nO3bB3AcY4I0XHBhE
	sqYVnYtmt3lflDkwpUixG6qN3KpNrHjt+55IKddLL6EfHAJ7mz8PgDdGerr0Aj7Ph90yUSugsR5De
	gtNqrISX3T4P555TFiy13Fhap78Dx5xwoz2+H08q7i2Q2aF5jtjmhyM1w8V4KTETM9QI/FYVNu4IS
	DrpD0+xw8YP3ybED7V873dZ6wmMETg5yT3gpGBkfG7km4VsGnxHF820XTHpTVFPl8n+JtPnwe8ies
	wTF5/lUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwcQ2-001M2Z-3M; Thu, 02 Jun 2022 04:26:46 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwcPz-001M1N-Vq
	for linux-riscv@lists.infradead.org; Thu, 02 Jun 2022 04:26:45 +0000
Received: by mail-pl1-x62f.google.com with SMTP id n18so3535504plg.5
        for <linux-riscv@lists.infradead.org>; Wed, 01 Jun 2022 21:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=07OKdl+NR+lEY+BPv6L1IZEtN57lA0Mz6uUlDluxQyE=;
        b=Qrmeo5c948/IdijZouKusOBj8+3ApTb48cCYu5OOEdxGq7X+xEraJzHzO9puKeByBf
         P13j9MpgJWHCXk9eZQ/Diw53LN4YtWN5svBN4a9aApyyPK6fDxbGdSzss6G4Sehyr+59
         BUw/GFmNdhx3Kzr6rUp8kzFfFiNcvOfmhKJ8c9TgACi0J8q944ZjJd18oJiAzOctnRcA
         b61rR7COJEsB/u2FtIwsne+MVvw/eetYgYmIfsCLlR9rlHHKDF59TtMqmXa2bV/338Yg
         9xKys9CoZ+t+obTEHMx4ZaG8nWD5Qd6+iSnehoCUS+7x7BQqN3RlGJZaqCs0yR7ZFVMz
         wA9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=07OKdl+NR+lEY+BPv6L1IZEtN57lA0Mz6uUlDluxQyE=;
        b=OtBERVp5HbQBs3GRdfLmPUQcel0I0cxGUPmLATc/EWpV4dxk6H5B7C7wa5NIBwg0co
         MSXH2zba8ID/yDdnmYxH8b2YMMlIYBn4xEOvcY+KSSJbl3WfWlf5PKs+GXkK6+SYwLaN
         hwllAYFoJHNH3CEEIIbza5mcN5mGNBchWKn9EtqCHR7rW0CyYNfrbIHIu/X7GlD0GcEs
         HwbhvyBqGVREID9/mouDWhwIA3+J/MPkuJsGpiI02U4TTLqTbogwB39QgVLthJuqXAib
         0A3+29IGAJXsjS4Ij37t5DosygUX+3cohmdfP7izArhv69r03GJfJ1YMCqAdQB1ZIk4d
         bChg==
X-Gm-Message-State: AOAM533WKuFdfmP/nV79HSbr8NNY9z9YmzbUDADQI/KUaBh4COQimBqx
	hTIyzt/Ctyws3F4CwZYLKQL09Q==
X-Google-Smtp-Source: ABdhPJxJZEw2/wu1mLFm7uXm2h9zayuqLLNGNyNu5dUcwkEWMsKxztPJejEVkOOycK4a8cW19zPQeA==
X-Received: by 2002:a17:90a:aa8c:b0:1df:359a:1452 with SMTP id l12-20020a17090aaa8c00b001df359a1452mr3057296pjq.75.1654144000765;
        Wed, 01 Jun 2022 21:26:40 -0700 (PDT)
Received: from localhost ([12.3.194.138])
        by smtp.gmail.com with ESMTPSA id 137-20020a63018f000000b003fbfd5e4ddcsm2218899pgb.75.2022.06.01.21.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 21:26:40 -0700 (PDT)
Date: Wed, 01 Jun 2022 21:26:40 -0700 (PDT)
X-Google-Original-Date: Wed, 01 Jun 2022 21:26:06 PDT (-0700)
Subject: (RISC-V KVM) Re: [PATCH] RISC-V: fix typos in comments
In-Reply-To: <20220430191122.8667-6-Julia.Lawall@inria.fr>
CC: kernel-janitors@vger.kernel.org, atishp@atishpatra.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Julia.Lawall@inria.fr, anup@brainfault.org
Message-ID: <mhng-523319d8-fda9-4737-9c43-d54bcfd7a7f2@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_212644_051979_E4C5F8BF 
X-CRM114-Status: GOOD (  19.07  )
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

On Sat, 30 Apr 2022 12:11:20 PDT (-0700), Julia.Lawall@inria.fr wrote:
> Various spelling mistakes in comments.
> Detected with the help of Coccinelle.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
>
> ---
>  arch/riscv/kvm/vmid.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kvm/vmid.c b/arch/riscv/kvm/vmid.c
> index 2fa4f7b1813d..4a2178c60b5d 100644
> --- a/arch/riscv/kvm/vmid.c
> +++ b/arch/riscv/kvm/vmid.c
> @@ -92,7 +92,7 @@ void kvm_riscv_stage2_vmid_update(struct kvm_vcpu *vcpu)
>  		 * We ran out of VMIDs so we increment vmid_version and
>  		 * start assigning VMIDs from 1.
>  		 *
> -		 * This also means existing VMIDs assignement to all Guest
> +		 * This also means existing VMIDs assignment to all Guest
>  		 * instances is invalid and we have force VMID re-assignement
>  		 * for all Guest instances. The Guest instances that were not
>  		 * running will automatically pick-up new VMIDs because will

Anup: I'm guessing you didn't see this because it didn't have KVM in the 
subject?

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

if that helps any, I don't see in anywhere but not sure if I'm just 
missing it.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
