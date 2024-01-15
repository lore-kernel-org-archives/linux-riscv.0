Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6B3BC47258
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 15:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hq8+p5zPdtpSYwO6iOuQcXyIUH/ID+4+xP7zhU5bJo8=; b=mcjdn6knVCktV/
	rWmBbx8hqRGU1Mz50e8YdI3/58+wsa653iZCNp1cDrUIsvrInls9UJgTjbmWftJGaM+hys+OJHuwC
	06wLPIa05ekZCZy+ZxCrCdhMC0SNMu3gmbOMaMerbu++4pJJ7bNJDzYLUgpWY2xfJdXFd0et6GCGX
	VYr+kMAkmxfCr9uNJ0lD5toLSHbmBLH31BwUBr3u+QBRbRCSk0mp9RKQ6mwUVCRDLGePM8ajIGsFp
	JUTf/vqwSnOXaJUEjcNFhJaT5OpS8RYcNnED56lTQ7BYEFNzTahHI10jZ7l3ngL0NKYC4wAqIhCG/
	cjQPK26Dxn1pBeahfv+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPPJu-009V2R-33;
	Mon, 15 Jan 2024 15:56:14 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPPJr-009UyC-0L
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jan 2024 15:56:13 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a2d348d213dso213210966b.0
        for <linux-riscv@lists.infradead.org>; Mon, 15 Jan 2024 07:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1705334168; x=1705938968; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N+FWP52nAagysrVb6ATyYzWCbthUEld2opRqU4Opd68=;
        b=aAD1ftsvq0XKFVnkiXNnSfdrYjFjwh38h0WpsM7e+vwuuh/7JKfvWy73Ci4tw575wU
         TtzoyvuOk+ix7M2IsWT2baSIqQc3HltQL8XxVTDv+QTKifcdYRRX/NvRsAbu+kWP2Jhe
         Qq0RkdtmyAisR8lt5faBKG/TffQ/4szE9SFNin3oQJIirTb3q8T5zurXb3GsFtj+bwoy
         TAEZcSbnHkxIpNaM6TuCJ/OuQmQLgdiLq0WaFujzqDGaKUSXA0o00PQg9kJiBwmLL0Id
         kiJbrmD23cTfdWqVBk6LqbCS0EqRMZOGLGvpdSjlLyFEuGxEM2vL4Il7szSVTKGEd05u
         +h4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705334168; x=1705938968;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N+FWP52nAagysrVb6ATyYzWCbthUEld2opRqU4Opd68=;
        b=ryRbWsKo4Tk4ZKZa2A95i0jN8UjIp4EEF6KmrOdeovgJW4VqVr3nUtQPpgRKyqdLEe
         w6lT4jg9DLQQT8nnQ3lOzrZ3CeWVqCbJB6avby2IZbSyD3RjNoz3/n2gl9nKvzKOs5xA
         O5k5jN90sd3rKTHAZAmLjPnh3pjKoFTUK7+xyWh+WCtvFwDogjKPVEtndcKf0olOVV4+
         U7fVFlcJ1IoTtEzgjeh9qU9I47ssZ4OPW/fuJHiADArrEctn5o9yEUoXJ/drdDP7TgM5
         DZs2dvzpnC7vlU+ANd1CHy9op8TypoyjazUgQnWaLYzD9RFzNj5bkUGvjOrsqTaSMeaJ
         RNhg==
X-Gm-Message-State: AOJu0YywOQ/JWFuTVTuDk5bH0Gt2rzDdUCxhTtVKaf+AcT0A7oN/SlzI
	fCq1AlqytYymKfV3zHikm5lNm/HFHPP/rA==
X-Google-Smtp-Source: AGHT+IGVzxObySjbrHXjQqBB+OXIeisu2vuqG55GXhVs4Z4pPd7aisPFZga9dsKJCg64OYSUiCnjYg==
X-Received: by 2002:a17:907:707:b0:a28:98f4:2799 with SMTP id xb7-20020a170907070700b00a2898f42799mr3424248ejb.48.1705334168313;
        Mon, 15 Jan 2024 07:56:08 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id xo16-20020a170907bb9000b00a26aa5c5a60sm5491885ejc.19.2024.01.15.07.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 07:56:08 -0800 (PST)
Date: Mon, 15 Jan 2024 16:56:06 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>, 
	devicetree@vger.kernel.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 10/15] RISC-V: KVM: Allow Zihintntl extension for Guest/VM
Message-ID: <20240115-86ac7741a7b0dcecef1a01bf@orel>
References: <20231128145357.413321-1-apatel@ventanamicro.com>
 <20231128145357.413321-11-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231128145357.413321-11-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_075611_142203_B2FACAF9 
X-CRM114-Status: GOOD (  10.25  )
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

On Tue, Nov 28, 2023 at 08:23:52PM +0530, Anup Patel wrote:
> We extend the KVM ISA extension ONE_REG interface to allow KVM
> user space to detect and enable Zihintntl extension for Guest/VM.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/uapi/asm/kvm.h | 1 +
>  arch/riscv/kvm/vcpu_onereg.c      | 2 ++
>  2 files changed, 3 insertions(+)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
