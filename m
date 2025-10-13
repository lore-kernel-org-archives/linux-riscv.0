Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB879CCD185
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 20:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8lXgzZd8GFFTDny1dAPYsF2cQmD9ijnAeACOFtQBiOI=; b=h2pHOfUDmc0uaL
	RrWNc5yq3FzNJdpnyg0K4BlTX2+dQHxgjAuUc2t6kjORs7dqD55OVd6Eq5X7iaZmx2y+IQhClNnsw
	oPq+HK0vR3KMSHOC+k7JU+c6S3jzILcy+cLYdoRQeetriVFu9jgNqUszxOZP29A/qlZnXa55Sbebu
	kk1jJzgw7uAQZhV7VS+Lwa5aAbwZZMm0yJlmWJQHkLnUgUGGLYqF4VNMa9UZhy1MBERmIjSIM7aWT
	2CmG17LhkDNx8EVTCLy2l/UGQTnFZHd18/ho0wrudj79/lKVKVIxO07DtO/uNIhnED7ERx/6aXOgY
	zrp9SMBSbH3Uzh/qHg4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8PAP-0000000EMRH-1kSo;
	Mon, 13 Oct 2025 20:29:13 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8PAM-0000000EMQC-3QXa
	for linux-riscv@lists.infradead.org;
	Mon, 13 Oct 2025 20:29:11 +0000
Received: by mail-io1-xd30.google.com with SMTP id ca18e2360f4ac-93bccd4901aso469014439f.2
        for <linux-riscv@lists.infradead.org>; Mon, 13 Oct 2025 13:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1760387350; x=1760992150; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Lt6afCrReoA0JetcvxGjdIUfBcXG8UG+CLV9XrNIQkA=;
        b=pXlTm2/NMtGwk4tu6pdXKq+6L0LqpaQFXzTYlH2emQBMHhYiGLopmw9qyieIqgZQih
         4vfSpkQhrlngxMyKLBw6obK4YCfFjS4G4yU1CekQr0YKUgKgAH3qZjXE/wTaa3crBrSI
         NtcOSctzqqzAVrcMjThBY/PLYZPmIHwxJ5CjBpnSyDG3y5+cFBreVnH0ltzktKMEQRir
         abQtHVtAgp6aYmus3HWU5aZuK29XkeWR0KFKYy/QFyUW7Kro3S8sFD593uIViqMLU8hn
         /m+xyQ4AkP4ByiaoiVepNv5aMQ2FIldgtJWbLHEr5Sox4exCzkYQrJWcDWqDG4+QQvkm
         snBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760387350; x=1760992150;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lt6afCrReoA0JetcvxGjdIUfBcXG8UG+CLV9XrNIQkA=;
        b=jigXeG6Mq/oUYa4Ty10w+kBSmjgf4GJmQsJoAqZXAtn9W9y9GvrhHVEHoocnK/pSWu
         4sTAzhGb/aN5cCsh0phyLPklaWTd5cv+/YjiAv1MzlGfDwtlGsjNhLC/llOTo6sUlpOi
         BhErYWNUzUTZjGiJ0WyMAiA+b1wTuUDbcbcJroJFr3OV2qZ3m5fkwb89bde+rF6BxuCZ
         QIGyB/u2TBZh6L2Z4U7rn/bZedAiFfaXU0QHdP7DhWOGMMlWgQUxfjBeDBP4bpgY9yDK
         V0DN1TSYLNZEz1OUGW+a3G0eXpN4kQU3M6JS+4F5djWVW1Xx/3097LRCrwR2vGTz0SH8
         CQAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxMnTR7iaAAW3vndPJOcvbtKpbcyNJ9oBVsJMLHeIsMrRXVh1jS0dlZTIX3eoXiSs2UQsnMkBsmEFZrA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwhXU1cOGIWQ1OCRM94axzYggOzl3bR4Pz6kUGamfPxYJAKIOIV
	uptA/zSvpknG9SPvpETNwMWJVePY0/+ggoJG+UYUACydHpWGna0z36VxixBsIScri5c=
X-Gm-Gg: ASbGncv3xrbxQys3nGGP+BYE5fMPnlJ/GOe1wVTLWMMABZ6yr3iYpCDUw5J0GK6a8eH
	okQN/fk5rJgQLCSX06YaFGXee+Xjw5m5bbAx729ZZMAhQnae8+LDDZ6Q1rS4RcmZ3CERc0YLNtq
	U25VTzexRNu1QuA87XeiAt276bx3oYVHE+RzKvCKYHEp4zdMTvEFYYjKAUL7X05YXJs+dh8Lncg
	J4762alJI25kCdKJGRSYlz8IGn6+JzetUeQ6ferNA+4sv0q1F3Ffmid9yL0gKxbtLTLapTiYjL0
	kVfsxHl1obiowQhBo4Mn6MrP7lBa6vCvF75vqIRDSyVMU5KY137+LqONzugdCJp9WJcXWwFNw3V
	UlqHfIrmqka027aUqpZ+sxpCQW3Jli4wDZVZqjBxe6LU=
X-Google-Smtp-Source: AGHT+IFAEeOFIgQZsxlTo4ZFQ5S1ZlK+bDlxrvpTDcY38SUWGb8pL41ejoZdXoSRHGQSxWChB02oUg==
X-Received: by 2002:a05:6602:6d14:b0:926:a24b:dce5 with SMTP id ca18e2360f4ac-93bd18a2e74mr2738341339f.8.1760387349638;
        Mon, 13 Oct 2025 13:29:09 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-93e25a97830sm418857239f.23.2025.10.13.13.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 13:29:09 -0700 (PDT)
Date: Mon, 13 Oct 2025 15:29:08 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <pjw@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Himanshu Chauhan <hchauhan@ventanamicro.com>, 
	Anup Patel <apatel@ventanamicro.com>, Xu Lu <luxu.kernel@bytedance.com>, 
	Atish Patra <atishp@atishpatra.org>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Yunhui Cui <cuiyunhui@bytedance.com>
Subject: Re: [PATCH v7 0/5] riscv: add support for SBI Supervisor Software
 Events
Message-ID: <20251013-c5eb76e005d982fa4c8ce2bc@orel>
References: <20250908181717.1997461-1-cleger@rivosinc.com>
 <86817f9a-c601-81e8-b95b-0f2396275f95@kernel.org>
 <628d357c-f462-4dc8-92f2-99006b73e0c7@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <628d357c-f462-4dc8-92f2-99006b73e0c7@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_132910_880040_1740E8DB 
X-CRM114-Status: GOOD (  12.12  )
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

On Mon, Oct 13, 2025 at 08:53:01AM +0200, Cl=E9ment L=E9ger wrote:
...
>  I would have prefer a bit more reviews and testing before going through
> since SSE can be quite intrusive at execution time (even though the
> classic IRQ path should not be impacted, I expect mostly feedback/bugs
> from the SSE handling path itself). We'll see in a few days if people
> find such problems.

I've been planning to compare this series with the code we merged into
kvm-unit-tests since the kvm-unit-tests series is where I put the effort
into reviewing wrt the spec, etc. On a skim of this series I see several
similarities with the kvm-unit-tests code so I should try to actually do
that comparison exercise, but I'm not sure when I'll get the time...

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
