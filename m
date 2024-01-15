Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 778ECC3DA79
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 15:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=trwRR55YC1+i2tk8nW+p0bAt8HM2+KCF78LLg+4JcwE=; b=dcX/NM3LDgDNxA
	MZWaNwiTaVhL+OE/56kdBE4EWNMA6dW2pYOPRzwggpl4HVgU3jzIR/VGImrCNBubycrQwczXnoyS0
	add705PMiwlYX8AxKGHmralxFecNrwegwJgMC1f/JvjmpHuTjWtdrRnXPJy33bg5i9AlUZ9CDrdS2
	eofqD4l7EhL/ZnItEmY8aSwklmMrPP4oKE54ouh4G4IKIvkTqXWpYyniWTHnKtAnRkk7PDAOC510h
	N9sluktKVl6bnuydRLFGmzB//Xynka9IY1b9kZIR+L18XR78wrjawsdAfWaCW889cjS2vEwssRRW1
	V4GBgpeIcEZOwn8FsMng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPP5O-009Rhz-30;
	Mon, 15 Jan 2024 15:41:14 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPP5L-009Rgz-21
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jan 2024 15:41:12 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a2ac304e526so842011866b.0
        for <linux-riscv@lists.infradead.org>; Mon, 15 Jan 2024 07:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1705333270; x=1705938070; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HlNB6mfBhuOkYDOMIlb5FsjRSMpn/oKooeekeL6PaCc=;
        b=LeWcKPMu8ue6qvaYRzeUxhSBy8DcZyRlWOPLzuImwz77bHhL7rHjQ4cSx3I4fqiB6q
         4UwOcPzOdsmP6ykrbrllg1hldsdtNuENPATE3K3OmAgTT9UOox2vXYmzzzrLWnWZEoPr
         eaFER9SKGAbuGB5r93Nbh9JUFhCPkBg2ga+8LIGd5uLz10Q516bIUsOz7yp8Jw3ho8Mj
         1qvrXrFiqM6uKUxr2kr76SuL7AENm4ufpZmwhuKnELyu2jlUqmmIbCrkNPYgQNqX7M6m
         QRPQ3207AivcysY3rr9DnDAmviPabtxHt5o+9gn8n/ew5chqRzW9Bd9HO86DZAqi5/bC
         a2QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705333270; x=1705938070;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HlNB6mfBhuOkYDOMIlb5FsjRSMpn/oKooeekeL6PaCc=;
        b=pwby0AULvKO38AGXChn3s6uG3N7L36AsKslEnSVs9fI+dyrxawf0AS8wSTJQ7ObWaC
         TybdNuDqQj7cfXa5noh4eM9iA87hTvQ74EQKPORg8e6oZ7Zo5FoHcQV8q6bbbBsw3t9+
         UYZFy0JdbzhQeLe4a1Y5pQaN7rIgxEAiEIzgiQryam4mLubg3UkewQPc6moGp0DmxRXS
         YeYpUrSlHccMJwN6xVuBumiPT7pMwzGaAJVupnP74iNQR6Dd3lS+vzD9RM4nOe+jRD4K
         uQYkfoCmfgxT3jGo41MB4HXVsB5gvAGNg9MzdNkRBJUJOc4ZOxvzkJogrgpH1N7D8jFj
         +Qxg==
X-Gm-Message-State: AOJu0YzOkF1KDVXedG5U6iGteS4V5IU673rfG3kKTQ4fCa/EUkuPyvQy
	RIA1Qil+a63WiG7m9+gMSV3mI2qE1bmA6g==
X-Google-Smtp-Source: AGHT+IGJ3Az+J+dIMt/KyGU5dufzzqP+n2WM/Bmp9nTCWuqxDlEIM+uy4FwEYLMi7yjInSoJX7ayBQ==
X-Received: by 2002:a17:906:6713:b0:a28:ce97:353d with SMTP id a19-20020a170906671300b00a28ce97353dmr2505542ejp.59.1705333269910;
        Mon, 15 Jan 2024 07:41:09 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id wk18-20020a170907055200b00a2808ee8ab1sm5405411ejb.150.2024.01.15.07.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 07:41:09 -0800 (PST)
Date: Mon, 15 Jan 2024 16:41:08 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>, 
	devicetree@vger.kernel.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 06/15] RISC-V: KVM: Allow vector crypto extensions for
 Guest/VM
Message-ID: <20240115-99866622cb962823aa8a4d47@orel>
References: <20231128145357.413321-1-apatel@ventanamicro.com>
 <20231128145357.413321-7-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231128145357.413321-7-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_074111_668789_9D75078B 
X-CRM114-Status: GOOD (  10.06  )
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

On Tue, Nov 28, 2023 at 08:23:48PM +0530, Anup Patel wrote:
> We extend the KVM ISA extension ONE_REG interface to allow KVM
> user space to detect and enable vector crypto extensions for
> Guest/VM. This includes extensions Zvbb, Zvbc, Zvkb, Zvkg,
> Zvkned, Zvknha, Zvknhb, Zvksed, Zvksh, and Zvkt.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/uapi/asm/kvm.h | 10 ++++++++++
>  arch/riscv/kvm/vcpu_onereg.c      | 20 ++++++++++++++++++++
>  2 files changed, 30 insertions(+)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
