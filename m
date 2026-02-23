Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48428E98DFF
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Feb 2026 09:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FZIyEhB2XSgR8nQ7meZ5AX6VinVq6AheXsTYXHKtNTo=; b=MdnLuQRKvHFI7W
	++ukubfVJn0gtAoVaUSqCUlunFgO8sQ6142pqT5OQaqu4BXYRyWs0IijrTFBSIRzaCj4p/bc9c+E+
	1VP6bk5hh38qVeUvyA8ovQTVKk3olLcbbbBAgGPlpEsfhrw3y11DgBvKCICVxh+OukPPUZGS/RFNY
	Gvl5qzV/OwlfY3pNXenWLZ9qttLV9dH5hSg8GGxakLBldU5vvRk2sjEt4b/ICqsq67rcTbv+7JXwH
	+Yc90AtT/rHC2UHrYZGpSRLLMzXfnC6+xZl8LG0c6tBvmFzpPh5TP+8uq7yFEOcCc0evuSKt6P6kl
	vRAPuRgeW8ibc2NCFC6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuSS5-0000000HYga-2uQw;
	Mon, 23 Feb 2026 09:42:05 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuSS3-0000000HYfh-1fSU
	for linux-riscv@lists.infradead.org;
	Mon, 23 Feb 2026 09:42:04 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-48370174e18so21873975e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 23 Feb 2026 01:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771839721; x=1772444521; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uP6bWvtU8eeL2/gAQvmkB1Apc9H5g4lS1edf4fQ7WfI=;
        b=FMMqAQ4i8dq8MvxVqgTAlqW/kkuz1K4Uci5vONyv6xJNi9iwlHmIF8QSo5s6488klF
         AHj4/CEZFw3k52slLgJaFrB5QTEJKULYnvWbuTn3XZQ78GTH1Cx7DUNxKm1cJmzGMplq
         P/8qImQZ0wcjh1xbhgClZtN0r86Ce4fTNXYNzYqUSEhCWQYwt2JkRgvpyJZkQ2MbiTmn
         CNpUDKnkMvfqMF5fZ042oHnsENE+u/BJT2Vl3A/30u+1EUHFrHeHAbnH/r1r7wVddH6v
         pLds+7LybZfcJT1Mru1f1aiJ9yNYsZCygOepNCkwfaJExNbTtMsrFQbJoJ3+Y/FV+FIZ
         UA0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771839721; x=1772444521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uP6bWvtU8eeL2/gAQvmkB1Apc9H5g4lS1edf4fQ7WfI=;
        b=n1/+DvMiQCNCNBxufHf0AjiTGi6GoiakygX+YrWpybiyYxG2FVbRPRCshDGO08mlqS
         m1j5/gZikIyZYpmU/8e7CYXdCBWNguSfwxHWyQx7NYR1Hw7manCvBQUemzJNDZWynE3r
         suXHfC2fhJ5DBWuPrMsX66epFQ/RXM/bhQazD+zgcWZzvQt8GkVWHbO2QxiF0gGISK2m
         qpZiQjro+Ga7MSKJPJGcP3402PjZRmv0qnNg+egZrS6BNNnquegAL5WD3HGLpoGCYgie
         S5kLNqciZY3ftk6uMoakpSnYxCYYDdomgh8gCMPEvQp9XpBh8iz+tR7HySvzAODOZoOV
         jwuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIhibhR7sbP8EZHukCCGwX53YWoENwilCq6j69eurXVT8OH6AFkOQDRHElZwTw3AMIoyiGQYFOU0SzCQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3OHp+0YUITu0SixD8bjrlkiCtTf/LRv2MrRZsrcLtzb12sTek
	YjUi5rTM0DwywrJHTYPhvx279ojILunM7EEaQkeBDwHiBh+vuKOVNq7o
X-Gm-Gg: AZuq6aKjLfotM/eA60ITigluLmp8cMqBHKlEk1c7CDX1n+bSVee7lzNcNm8uqDHpjwK
	5cQ3amM74H5yfUB8vxjx8cGyP/Ng5LjLojPGEHou2I/nE7002vGGeGWc2nfrgaBka7SaBMAOgwb
	1dzintYa53amLvrQC66KBX6zT2/2JcqpS2CW+bxn+uYi6CbYZKlz7no1tn9O2IEHEGlK5esM+AE
	X1IYTcIayWqg51G8qtvUcptCGYfnHlrKnvsGvGsv4McTVjeDDPFi2Lf+ui+wVvvzIn9zveE5D37
	pv3u2zyUkSLA94Pu27za3LLpIpKgqNBFUwLPVvWhVzhJ2iwM4CEtQLtHlvpWuJdWBtiY8MSL97u
	IPQS/jCjsO8LP6xiuzmqRDKrSemeWDy92MdngeET/oVExDerg/xoxemPMsHB5Wyq7PWCpLosbS+
	R9GjqXk4dA8PgxnyqIvRvMAlmvdN20E4jHdbTWt6N+FHd3+gYK3AEvq8Xd+zCiUYWfy+wJ0Nkpz
	sY=
X-Received: by 2002:a05:600c:3b27:b0:483:702f:4641 with SMTP id 5b1f17b1804b1-483a95bd842mr121940845e9.3.1771839720960;
        Mon, 23 Feb 2026 01:42:00 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31f0330sm222508405e9.9.2026.02.23.01.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:42:00 -0800 (PST)
Date: Mon, 23 Feb 2026 09:41:58 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen
 <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael
 Ellerman <mpe@ellerman.id.au>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko
 Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander
 Gordeev <agordeev@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, Kees Cook
 <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, Mark Rutland <mark.rutland@arm.com>, "Jason A.
 Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>, Jeremy
 Linton <jeremy.linton@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v4 3/3] randomize_kstack: Unify random source across
 arches
Message-ID: <20260223094158.2197d7af@pumpkin>
In-Reply-To: <87ecmcwjh9.ffs@tglx>
References: <20260119130122.1283821-1-ryan.roberts@arm.com>
	<20260119130122.1283821-4-ryan.roberts@arm.com>
	<87ecmcwjh9.ffs@tglx>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_014203_565313_4F93D338 
X-CRM114-Status: GOOD (  16.48  )
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

On Sun, 22 Feb 2026 22:34:26 +0100
Thomas Gleixner <tglx@kernel.org> wrote:

> On Mon, Jan 19 2026 at 13:01, Ryan Roberts wrote:
> > I tested an earlier version of this change on x86 bare metal and it
> > showed a smaller but still significant improvement. The bare metal
> > system wasn't available this time around so testing was done in a VM
> > instance. I'm guessing the cost of rdtsc is higher for VMs.  
> 
> No it's not, unless the hypervisor traps RDTSC, which would be insane as
> that would cause massive regressions all over the place.
> 
> So guessing is not really helpful if you want to argue performance.

The cost of rdtsc will depend on the cpu architecture.
To get valid comparisons you need to run on identical systems.

Regardless, the cost of rdtsc could easily be larger than the
cost of the prandom_u32_state() code (especially if inlined or
without all the return thunk 'crap').

	David

> 
> Thanks,
> 
>         tglx


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
