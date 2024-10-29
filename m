Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AFB2D339A3
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Oct 2024 07:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VoO4vkgLJyGGC2IBNgWLmLk9SE6GFrI9pDoqt5nPFX4=; b=u8SOx/EvUy4SYD
	PpZZGj0BMfvNJNzh2B2RHX6f8HsyqOlPDjD+PClzumPv3QYHQ+ZYS7S9AxBawsUx7CwVRbSMizb+W
	I4g/dm8q2wWJ5wOjfM1XAyy7WszftQWlVNiI+gQZ4JtbaL3tmsjTiU5vyGTqKq59YkwO+/mdzZ3Ac
	qFMYXuW+ZcdTCqf7hCSH8Jg1Gu0qk9rMJQaaflxUVQuxf1NugZH9ZMbv9JpuQiJG5bhTkzOllBG7l
	tBII1vXT0q4I94XIZPI4whlPTX3EM86oIx6JDkys+edSaEu5FQ5v1ldBFG1ZSfp9zBLq3P9UVs46v
	FnYzu4VJk6ZEkZN0Bf7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5gys-0000000DZYk-2VvR;
	Tue, 29 Oct 2024 07:49:34 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5gvT-0000000DYtX-0VC5
	for linux-riscv@lists.infradead.org;
	Tue, 29 Oct 2024 07:46:07 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1730187960;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8ocksU4RpVjVurxFAx+JTZsKtC/IfAmmtb1MA+uZcAo=;
	b=cjjF4eRg2GOvVf6wvheFfn4WnNcXE7pBA/yTUbkb5/0+f1w1E9JgPmB5BgeTrirHqeGw5s
	o6edotnjAfJGGT7NayRxbP9rbd0P19ubVvb1LZlOg0cEmpZyMPHRmNIKCynB5mqq9V9Skr
	2mm+783Ob8qCw6bEKrcNhAM8hqwAFB2hYT7UeYizARgCrar0CON1jjhWWsG+LbC4qYcMBJ
	xiaGdtnddI/QxwOPRlylBjYFHqBucgbY5Hlyx+5c1iYDmreWC+mBVFp+RRzLr3YbGICTe3
	UOLo0f8PpJ14jASC9FOJdTM/0kd8wtcZHuFSqqxxtGEhpM5tapmauJ7HOXRqOQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1730187960;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8ocksU4RpVjVurxFAx+JTZsKtC/IfAmmtb1MA+uZcAo=;
	b=7jVzdxDg/7sUfxRa0SpbynMf/6HBZ6o3TVpLElNB3+/Hkj50ji1N0JZjF0ZDBx7c1z/cn8
	WcxB2PVbuwjnjWBw==
To: Inochi Amaoto <inochiama@gmail.com>, Chen Wang
 <unicorn_wang@outlook.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Peter Zijlstra <peterz@infradead.org>,
 Inochi Amaoto <inochiama@outlook.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Yangyu Chen <cyy@cyyself.name>,
 Hal Feng <hal.feng@starfivetech.com>
Cc: Yixun Lan <dlan@gentoo.org>, Inochi Amaoto <inochiama@gmail.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 2/3] irqchip: add T-HEAD C900 ACLINT SSWI driver
In-Reply-To: <20241022040218.450573-3-inochiama@gmail.com>
References: <20241022040218.450573-1-inochiama@gmail.com>
 <20241022040218.450573-3-inochiama@gmail.com>
Date: Tue, 29 Oct 2024 08:45:59 +0100
Message-ID: <87jzdr2vyg.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_004603_309953_E0E7AD59 
X-CRM114-Status: UNSURE (   8.57  )
X-CRM114-Notice: Please train this message.
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

On Tue, Oct 22 2024 at 12:02, Inochi Amaoto wrote:
> Add a driver for the T-HEAD C900 ACLINT SSWI device, which is an
> enhanced implementation of the RISC-V ACLINT SSWI specification.
> This device allows the system to send ipi via fast device interface.
>
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>

Can someone from the RISCV folks please confirm that thtis is good to
go?

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
