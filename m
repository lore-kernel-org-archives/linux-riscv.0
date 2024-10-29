Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A320DD3A696
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Oct 2024 19:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ri3ySWGZf4ztiopKIjr8bcvZ9ODvB+XBmjCguNc9nis=; b=yfebHKkj/QmnVukPdhGDFWhU38
	7ti+m3prI6IyKXLP+H0dOcoaYqHmHByPxgd15ID5gqO48hfsvSLO7uygJ63gi9sswoqC86wz2ZuaQ
	RRd2cMxI3D1f4Ybn4PaAONLmppDycAuxyxaa216muooI/eufggzeABvEb/XBR+rgJxyFMuYhRrL/I
	0bk8k2uKtEaeZwjvmouWQSUp5ip1OD4lf8S8Id59VO2EqeSZG2/D/iaHh1Ui3uo4f9NGBKAax6XLZ
	OiCP1GdHprQOCCAT5vfO8i/3o2Cw5tsAKsahtxJfEurMSe3jW1Uw/cbapH+1nDQrybxBZZqkYTwsg
	lpp5Szgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5ruc-0000000FfF5-1ita;
	Tue, 29 Oct 2024 19:29:54 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5ruY-0000000FfDR-3ZBo
	for linux-riscv@lists.infradead.org;
	Tue, 29 Oct 2024 19:29:52 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-7c1324be8easo131177a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 29 Oct 2024 12:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1730230189; x=1730834989; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p453f5qLRHQrUMFO6yBtyDQCP3AS0fkH5n591K5O5UY=;
        b=d1WaszXNhuKcb3u8WWYBOe3WF6aS2qIkNZbXrFmLsBpuTk3q+L3NSk9LPOaZ40Khbm
         AqVamuiG2P/vJ58BKQrPrJr0EjbQhO/XL/biZbeO6LXHgDCIj3FL08wocwLdRiOtJ75X
         tNz7m7XrFSxXjcIRontU8ka8EPM9WB6B692Zm5di/L4zr/0PHdRT7t6AT5GxNiOO4+Xv
         Oli7V+m16OmgrlBNhegoEZ//k/iwGGQaR76Ys0vdInePrNgWrD4upOM70ElNC69pr7Sm
         0MEXcow2XAy2TkAg8eAf9xawMekg3ssCCYBHE0pxqoVqvyxuSQj8YvyOrM6k6PDlGumv
         anOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730230189; x=1730834989;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p453f5qLRHQrUMFO6yBtyDQCP3AS0fkH5n591K5O5UY=;
        b=gnYrWS4XrPRXvrZ38Nurl/rCzPWV1fgWYIOTIRMd1yo9po5E0ECTqwxP47ctauGVj0
         9931xtT3WJbK6qM07tlSFBFOaZScVCfoLuBZ0MEeySxkAghgppmYjEa7T0DeaTF6KRHA
         nMB7YgBlNKmFrdiMjS8ccNg04JcyUOuM8Dt/HX6DG8MK/DcesQFHsfnQ+on1VNWDPBYj
         PHemOD2kcQ0RWaxLpLSLfJSAc0NDdcCZI0e6EqlG3MgaEugUwNbx6au8PfpOJhtRKIqO
         JdTBTh97+CzklRTYlDx3tlRICA6uAKpPWWGQ4npCg8uPUhRyriEcqVq9XrrROg1id6+H
         oWhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJ9NQZCAQTjva5f2ACSd1vaxU9E3EpkgW280urFpC5bXseoYqEWD8BBzA2VGeZ9ec5iur3Wcr9MQudDA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzCWlkj6hvAnwV1apicoNtH52zNT4B8J8/qVQ+BY28/WqGnoIrw
	k0L87pX45qlYtCtEFQrtzKUiahUf6c9shyCBqzoEPu3Zy/KLSkmvDhNz9g7ob1M=
X-Google-Smtp-Source: AGHT+IFhFlcCcvQjHhliRyZXirlOj5VprFQBCQ8QKlxSPQtXsUC/wqBDa3PY5cBoAFjEcgQ0R7Ad7Q==
X-Received: by 2002:a05:6a21:181a:b0:1d9:15b2:83e with SMTP id adf61e73a8af0-1d9e1f0b721mr5535203637.7.1730230189067;
        Tue, 29 Oct 2024 12:29:49 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057a3fdf2sm7909099b3a.214.2024.10.29.12.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 12:29:48 -0700 (PDT)
Date: Tue, 29 Oct 2024 12:29:46 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Max Hsu <max.hsu@sifive.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH RFC 2/3] riscv: Add Svukte extension support
Message-ID: <ZyE3qjpOXJYPRVlX@debug.ba.rivosinc.com>
References: <20240920-dev-maxh-svukte-rebase-v1-0-7864a88a62bd@sifive.com>
 <20240920-dev-maxh-svukte-rebase-v1-2-7864a88a62bd@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240920-dev-maxh-svukte-rebase-v1-2-7864a88a62bd@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_122950_899961_25036C7F 
X-CRM114-Status: GOOD (  10.50  )
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

On Fri, Sep 20, 2024 at 03:39:04PM +0800, Max Hsu wrote:
>Svukte extension introduce senvcfg.UKTE, hstatus.HUKTE.
>
>This patch add CSR bit definition, and detects if Svukte ISA extension
>is available, cpufeature will set the correspond bit field so the
>svukte-qualified memory accesses are protected in a manner that is
>timing-independent of the faulting virtual address.
>
>Since hstatus.HU is not enabled by linux, enabling hstatus.HUKTE will
>not be affective.
>
>This patch depends on patch "riscv: Per-thread envcfg CSR support" [1]
>
>Link: https://lore.kernel.org/linux-riscv/20240814081126.956287-1-samuel.holland@sifive.com/ [1]
>
>Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
>Signed-off-by: Max Hsu <max.hsu@sifive.com>
>---
> arch/riscv/include/asm/csr.h   | 2 ++
> arch/riscv/include/asm/hwcap.h | 1 +
> arch/riscv/kernel/cpufeature.c | 4 ++++
> 3 files changed, 7 insertions(+)

Reviewed-by: Deepak Gupta <debug@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
