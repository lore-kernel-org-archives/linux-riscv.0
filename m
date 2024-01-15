Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 712D9C47258
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 15:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WtWQQGiNxUSwljECRhorKvsq5T5tx2YPgKOEqnWwKgw=; b=PShGzTvvtdqr28
	8NSC7z3PfPJ3xxQzJZS4NEGvoHw9DUm6InmS6TOkP2II4iQNI6qKF7EpfEyHDqjc2Jvw6YmdPSviR
	dsOdx95QFCf1cbAoqisk+MLH6E/fPxNgOJVnOQGKuFL+t0rHWkj8t3l8O3YE2bZmdJ2ADtuGWs8NV
	zGDEkqjyDSn2YHhOfrTk2TW3Q8W6MlT1dc8GnOu4SYux8qASwY9xIGEPysHG7AOJPQe9WGtf61cnY
	KZNiPWXyWVqwpR8ZFymcQLoAPl96kAfgvgfi7o6yXAJrXPTy22SNIY4k5P20QICq6nP1CyFZ+RlCC
	gHIu4Ft4RQjdVYcHQhtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPPKD-009VIp-2G;
	Mon, 15 Jan 2024 15:56:33 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPPKA-009VC8-1J
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jan 2024 15:56:31 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-40e69b3149fso31287135e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 15 Jan 2024 07:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1705334186; x=1705938986; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pSX8YdFzGW82k1HdFW0Ew9PXwzmjRfEttmlS+50xEwQ=;
        b=CUzF/Q9Z1sKEWB4mzYDsKFcw3rkyyQk7r3bL5NpwDZs4h7M6pJraKusk9Q4n+pVLKa
         gX4KF8K62TlihTv29xbnf9T4nJ2JTFtmKkQR10T31ErXX2G6KPFDsV8wGcXNagKehSVF
         H330/pWKoGZJcy9VDGALQTF9209zgeJu7b9Rg88L5Nxr2uW+cHkNx7DyY/q/cUul6GPS
         C6zBRp9tDwVPubS5V2A5fvT7dCtr3pbq128W1rlPIFJOvJ0H/MSmuKUcnRQGsVoqsnfL
         pt371NKkqPRVEDJMrzDYKMKxZ+VaV7PYZVjYb10UdKHzdA/OHI8NqorpiFc6MtLq1AGd
         aqRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705334186; x=1705938986;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pSX8YdFzGW82k1HdFW0Ew9PXwzmjRfEttmlS+50xEwQ=;
        b=OBVd84cI9nwNOFP88oMuytrrbeErBcQlw2yKT7oXspTHUZABrC7SZxg3kwJLvs3tdJ
         EYcfihV3MzHiumMEVP+riE40foUxZ7ceCztYvljIEL/nKup/9MfED58m1I3fje0MqEeh
         /LBzntUHjiyDrqMS0LPw5rBet4Jy/XwrO3RfYa8IhPZZwiGKD0E8LmKmN/25CCc36G+M
         ImBlmxruaYJ0jyrpDdJXcZNW5nulpWScL4e0St1GtWd6Uoy9+i5KD+N+1KwK5CpG6w6M
         TsWuvR+QsIcxflxeyLwwj+HhRNA9/jj3QnPMG4jdbPg8z4Teig9YDzQEzxIxcWbn3UAC
         Q0jg==
X-Gm-Message-State: AOJu0YyjaUGAPATFQHgnSTg1d7fvHnQllbOU61bB7GNte16MOx23eAXx
	5rngp6p7sg10FPsRH+JHPmShfZ+3XQws5Q==
X-Google-Smtp-Source: AGHT+IEruJdVb7p+/kL6fqf0kR36CRwMRTN2BNXTkrz1F06Va6YdQFwiI8onEGvjOtajrh0pa0AUQQ==
X-Received: by 2002:a05:600c:5246:b0:40d:ecd9:bb99 with SMTP id fc6-20020a05600c524600b0040decd9bb99mr3395375wmb.124.1705334186521;
        Mon, 15 Jan 2024 07:56:26 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id m23-20020a17090607d700b00a233efe6aa7sm5410163ejc.51.2024.01.15.07.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 07:56:26 -0800 (PST)
Date: Mon, 15 Jan 2024 16:56:25 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>, 
	devicetree@vger.kernel.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 12/15] RISC-V: KVM: Allow Zvfh[min] extensions for
 Guest/VM
Message-ID: <20240115-51aee57d7e62ee212cc86f31@orel>
References: <20231128145357.413321-1-apatel@ventanamicro.com>
 <20231128145357.413321-13-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231128145357.413321-13-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_075630_444912_211731DF 
X-CRM114-Status: GOOD (  10.27  )
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

On Tue, Nov 28, 2023 at 08:23:54PM +0530, Anup Patel wrote:
> We extend the KVM ISA extension ONE_REG interface to allow KVM
> user space to detect and enable Zvfh[min] extensions for Guest/VM.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/uapi/asm/kvm.h | 2 ++
>  arch/riscv/kvm/vcpu_onereg.c      | 4 ++++
>  2 files changed, 6 insertions(+)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
