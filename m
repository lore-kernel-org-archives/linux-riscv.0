Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D48BBC77B7C
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 12:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jLMpQP4s1qnYtF/6D27nbT2znMR68S4QiX7f2RLuqV8=; b=VA99O9jcDWHXBf
	ZWqOTxrRr4Zf3m9vk85hXz0Xm2FfxU6X81TkN+XvY9HtetI5yb+WXQAg6Y2MfCcLSHUupY6IpZB1L
	5UK8NXVnQ2O0Ik2qy9ClN7WOjWU8G9TQ7m/0qSlsbe+aXnQZzwKKAaK0e3Qwdxtpu2Fg0zI/xc+Ey
	wCqIgRsAFxVXUzPXWaMIW1P8BrzBVxszBHBg4Mgbu+/XpLVDP9a216f4AOygmX90eMWz8PMgNIs5s
	f8RSamHBOhQG48lkk2TYsH4o9x6LL91vPNbfYpmWAqs3Q20QYktaJNB+736oKJUh1+2m66oMe0pbB
	0NuFwzN9QwUDqlPB5LOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU31i-00000005cMn-1kot;
	Tue, 24 Jun 2025 12:45:26 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU2x7-00000005bui-0ZQ7
	for linux-riscv@lists.infradead.org;
	Tue, 24 Jun 2025 12:40:42 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3a4e749d7b2so934567f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 24 Jun 2025 05:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750768839; x=1751373639; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4BUkMXYeiLB2X2X6RyKrmWWY0LEGjeorwnNRCnSQkn8=;
        b=QS80zKpGuWfFDypF9DxeONDZKsnM6yG9GlDoLrciDxxqVVIqRyFiYtJi1aN00eYIAn
         b3+a1LfAJdIbQ09T8dEzkP0eXzfWIwGrCKE1gO2YYDDc5hlJuyCsAosxZruTVaiaMewb
         yjEv8bHgnCEqb3FWqNzCky7GJxyRX2b829NEYXoIGWhVhEv54vXkAVzSWMz2e4BeVXWl
         BneOikIUXtWYsdhWXm2TPBipnMkJwWF9ddy8AK0sfs5Q4eL2M5sDw/amKGh+yLpRMDj1
         fwXrM1qxY+xM9J5I/NZeyxpWolo0ILDTwVqOg/XwK0QgnBOvom3cppCifRxjMkt0l9nH
         o8Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750768839; x=1751373639;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4BUkMXYeiLB2X2X6RyKrmWWY0LEGjeorwnNRCnSQkn8=;
        b=Cj07xAGhLcgm2Zzlo1WI/LidYCRZhAcbptZzDl5bSVGMcT1RE1pEHFsDoe91bSj4tR
         VueC2uz1ww3UUrDOBFeJT62Y83+XhwNKNnEMA2uoNWmIRZIA37vgBT4mX+ZVWnA5GtF5
         yYpC6HaNCiANkiX9BjS74jZTX54b9BATwuZrBI56bjpjIANhSzSzoIoAJqeO8wRyqbC6
         UFe1xIAl35lQa60NE75FtpjBPc0TQk8Y3DeeXucM4/xaElDroTOdzJEFLpTwXZfyLTDw
         5WuiCTixrZVYU2tXbcQDDAQUQMy6AiwE69CanLrEaXk5iVA0w9pM8cHwHjfvob3+FR0G
         omCw==
X-Gm-Message-State: AOJu0YyrNJVVTnvressjwF/l0VdW2vyGwZe5NaHaa4JQrSAq644pNv/e
	1dU9zDeBUnA2ak+nnZSunqq7nxmZPK9zJ2U28VcR6ATi//rI8B7e/qEZQJY6BFF0r1Y=
X-Gm-Gg: ASbGncsj0HELmNqeyOhilp8JwkNWaGicjv3m0b1xkmGY7bRQ2o+SL/kv3Ye+fHuC02V
	g3WJ4AuFOTixk0vdC+unZhCAcj72bCoYwUWzJwKfy7135Iz3zUgfS7c4vmEr95GGGU04pwEFYuE
	A51bAdn9DIsrnh1y96jaCRKSON9XrZNY3MeEkLMeUI8Me/B4ac5yXSq/3801py9FvLI4+R56exB
	VR5TuS4hSV9+cP84g5WW5YIdBp07fuKJbipLkdInt87Npu2uKU93DXTgmxoHDPdZK/xv1kPnhe7
	HW3D3QTcmui0HOChrQp53uFcaW/OQxTZjHu5+UBaN3XFH4J9EA08B6qCpBRS0Wt76mgcCw==
X-Google-Smtp-Source: AGHT+IF8B1WW4U7x6j+EHfMn1Eh1HNElh7tkerO1BXSChz4AjPz7+BmbvR0LGTv8ywPf/lT//RsyfA==
X-Received: by 2002:a05:6000:2512:b0:3a3:584b:f5d7 with SMTP id ffacd0b85a97d-3a6d12a4f93mr5267059f8f.5.1750768838760;
        Tue, 24 Jun 2025 05:40:38 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:b00d:6d5f:6e67:f5e8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4536fefd2b4sm83300675e9.36.2025.06.24.05.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 05:40:38 -0700 (PDT)
Mime-Version: 1.0
Date: Tue, 24 Jun 2025 14:40:37 +0200
Message-Id: <DAURR8R4IVN1.3U4UFSWQD6JZL@ventanamicro.com>
Subject: Re: [PATCH v2 0/2] RISC-V: turn sbi_ecall into a variadic macro
Cc: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, "Atish Patra" <atishp@rivosinc.com>,
 <ajones@ventanamicro.com>, <cleger@rivosinc.com>,
 <apatel@ventanamicro.com>, <thomas.weissschuh@linutronix.de>
To: "David Laight" <david.laight.linux@gmail.com>, "Palmer Dabbelt"
 <palmer@dabbelt.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250619190315.2603194-1-rkrcmar@ventanamicro.com>
 <mhng-C1133FA3-71C3-4ECC-B3BF-13DC7640464D@palmerdabbelt-mac>
 <20250624090923.5521a0f2@pumpkin>
In-Reply-To: <20250624090923.5521a0f2@pumpkin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_054041_185167_7AB6C4AF 
X-CRM114-Status: GOOD (  14.42  )
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

2025-06-24T09:09:23+01:00, David Laight <david.laight.linux@gmail.com>:
> On Mon, 23 Jun 2025 15:53:58 -0700 (PDT)
> Palmer Dabbelt <palmer@dabbelt.com> wrote:
>> On Thu, 19 Jun 2025 12:03:12 PDT (-0700), rkrcmar@ventanamicro.com wrote:
>> > v2 has a completely rewritten [1/2], and fixes some missed trailing
>> > zeroes in [2/2].  The fixes in [2/2] are important for v2, because
>> > sbi_ecall doesn't fill the registers with zeroes anymore.  
>> 
>> The SBI spec says "Registers that are not defined in the SBI function 
>> call are not reserved." and I'm not really sure what to make of that.  

At the beginning, SBI says that only a0-a5 can contain ecall arguments,
and then each function indirectly says which registers actually contain
arguments.  a0-a5 that don't contain arguments are not reserved, just
like all the other unspecified registers.

>> Specifically: does that mean implementations are allowed to ascribe 
>> custom meaning to those parameters and might start doing stuff if 
>> they're not set to zero?

SBI explicitly reserves registers if they are intended to be used in the
future.  The result of the ecall must be exactly the same regardless of
the value in unspecified (not reserved) registers.

We can't really tell what an SBI implementation will do with unspecified
registers, but the most sane thing would be to ignore them.

> Or does it mean they aren't guaranteed to be preserved?

No, they are preserved:

  "All registers except a0 & a1 must be preserved across an SBI call by
  the callee."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
