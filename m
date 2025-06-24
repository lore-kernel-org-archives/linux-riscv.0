Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB0BC7EE32
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 08:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bmcjh4z8nRckWuciuClmON1uA5tzLuS4AR4QUULitMo=; b=tO+s5s5UO9bCEL
	bPY+B6aycU0s6VrI/CWgRujiQh/DkGLNzzo670OXsRfA88gtWoGxgX/RdD2OL5uiZC97UyNazyh1u
	Co3rkW59LVcg1bl5T6wZyekE09GTzFbIJpaH2snUrdFnd7gVKp14tohKdNQeuaO3sli3Z++mhmkOX
	EZzaBCQwj0Y5GboVxoFlqODz5DwjgWsHTlgkbi1HvIiH7Xqt945iCz8u0SpYXbUzEAfYHVFVQqajm
	3PwjrWpR3nXaoO+yxLZwlgXl8+lERrrBB2XOtS9XGPbCA90o3dmqkItMkmtVLB6+z/LDaDR0VnwPm
	WbxrkywH9L71lb7N2AWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTyzk-000000050vl-1dDu;
	Tue, 24 Jun 2025 08:27:08 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTyie-00000004yOf-0pbG
	for linux-riscv@lists.infradead.org;
	Tue, 24 Jun 2025 08:09:29 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3a50fc819f2so101976f8f.2
        for <linux-riscv@lists.infradead.org>; Tue, 24 Jun 2025 01:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750752566; x=1751357366; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H4LRbvi/Gmtszalnm+pLeOpEJNzEX6Ie3DE8xLsBDqw=;
        b=jC7tPfCGdTMEeYDYsTiNkvjjWfKfhqd0vqmKyZf2ysyPXrlrsAjXR1/pHysn80Aq8I
         LgpjrOhsB1wvNKT7j6FmyXHzrB5UQb5GCSXU1sXbY7EWoeBuIRBeq3bSmMXLCWxCoNw8
         VvxKu1AcqSd/08LCY7Zfy3Kvvz2sGMQtB3Cstixuj1QNcPJaUM3CR5Lni088Jhmuko9o
         w7Tdlov9W1NajmimkO0H1cNexnVg4wBa0XqUQoZUK3I3HxUGBLlLx3gqwlsHucGCr4Ez
         dhYtnmd/gRZYl+oxfRvQXhZQjI4O6rQ8jmSFZIdw+K/Q6ulxgjKk+G0cb2UvHJ7zYIwF
         A0Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750752566; x=1751357366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H4LRbvi/Gmtszalnm+pLeOpEJNzEX6Ie3DE8xLsBDqw=;
        b=M/sZke7kmL6Eu303nODHLSWJ13TZg6IMsKENyIM1LpRayp4bMOgV/RKGjce1mT5bis
         L3VPpemG4mPJ1AhbmesrlW1o0QDr0ZnQjhygbYFjDXGXDjy2LMDH25mo7Y22SOiROvfk
         z+uEVp8fPra7BHR2UyqmUR02rusZ53SxvWic8uJANBMUm0bC3yKpI/nubERLHgyHrAnS
         1gqeao6lHx01DykWNvscOmmcWTqVW9ysr+/+8brkeL8yqEyu94Lo7IKGjTksFYpGCl4q
         TiiC28Oy0dfyA3a5HUy85Vp9oUIRxyrCgIBfjWTDA615yMhRq4TmFikZESJuAY63SGfe
         mZcg==
X-Forwarded-Encrypted: i=1; AJvYcCXNbsPp+v0zMxrVewvTHbnFw+LuLUU/nOJLFQY8uC7764oTQRPaYucmaJwUnk+iXfiz9dp1RYWxv9S/iA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxIN5RUPHQIYCnIR64U5xU+BnH6OzNw3drno7OVcm0p8dCKJ8NR
	1Z1FDomDuvAtmKS/XLr6dTV9q+cNdAV85j++0Lulyqnj/O6KNVG1BZoi
X-Gm-Gg: ASbGncv0OVOWCOzSQ14FowYHkCrGFAji6xiSJzusCXIsrD7hq61ic4AtUMSpQ8E18fH
	xzqoliOGLqwdfD4Or7M5iEDDRNrth9nceOnA7XZzXUkm3upXZ2jpYf3DOCswJJTGXoipgWo8Qf9
	FowbtgFSTpy1Ht1nJ0Nw5fxQy1f9vlYEsYg/+LC7PoHp3sbzstBsn25hvVVjSym3duIsuXNXD/y
	m7GHp0Yg3/3XMNNoFTjDmHdTSP8kB2i8pPOAVVbT5JVjOHWWxPOEctmPlBtc+wPeHz8FTmNMjJY
	7EuYsciZ7eiykhB+77l8I5rBubxMgOpaavslpco5vDygmTmlH6K+c1TWFSLA7vJj7Obs592lPch
	efhjrs1cTfOY7/Qlz968FEc1Q
X-Google-Smtp-Source: AGHT+IF8IKQNChSNIe1UoqKF0QyQ1YvhqMwCfYdXLtHOm+kn8HxQSARG/apae1/sAFWf4Eg7sjiYsw==
X-Received: by 2002:a05:6000:4313:b0:3a5:8977:e10f with SMTP id ffacd0b85a97d-3a6d12fc169mr13401694f8f.28.1750752566421;
        Tue, 24 Jun 2025 01:09:26 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45364703701sm134824385e9.27.2025.06.24.01.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 01:09:25 -0700 (PDT)
Date: Tue, 24 Jun 2025 09:09:23 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: rkrcmar@ventanamicro.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, Alexandre Ghiti <alex@ghiti.fr>, Atish Patra
 <atishp@rivosinc.com>, ajones@ventanamicro.com, cleger@rivosinc.com,
 apatel@ventanamicro.com, thomas.weissschuh@linutronix.de
Subject: Re: [PATCH v2 0/2] RISC-V: turn sbi_ecall into a variadic macro
Message-ID: <20250624090923.5521a0f2@pumpkin>
In-Reply-To: <mhng-C1133FA3-71C3-4ECC-B3BF-13DC7640464D@palmerdabbelt-mac>
References: <20250619190315.2603194-1-rkrcmar@ventanamicro.com>
	<mhng-C1133FA3-71C3-4ECC-B3BF-13DC7640464D@palmerdabbelt-mac>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_010928_239710_E8304D46 
X-CRM114-Status: GOOD (  13.65  )
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

On Mon, 23 Jun 2025 15:53:58 -0700 (PDT)
Palmer Dabbelt <palmer@dabbelt.com> wrote:

> On Thu, 19 Jun 2025 12:03:12 PDT (-0700), rkrcmar@ventanamicro.com wrote:
> > v2 has a completely rewritten [1/2], and fixes some missed trailing
> > zeroes in [2/2].  The fixes in [2/2] are important for v2, because
> > sbi_ecall doesn't fill the registers with zeroes anymore.  
> 
> The SBI spec says "Registers that are not defined in the SBI function 
> call are not reserved." and I'm not really sure what to make of that.  
> Specifically: does that mean implementations are allowed to ascribe 
> custom meaning to those parameters and might start doing stuff if 
> they're not set to zero?

Or does it mean they aren't guaranteed to be preserved?

	David

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
