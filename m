Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4707BC0032E
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 19:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NcYra2I9hgxAQNlDbXS8Ny/SroD4H9goCu0+Sbzkz+8=; b=FWMS9DtB6bmkhg
	Ke5sqoLmdRFA7G80NIEIOJienJcOqPBqQCtK9C26c9C3WCRUZ/+sAxho1nUF5ZYqS5KmyYguOxuKW
	a7GUWTDEG7jjeMBpgk6B5zqky5JoICbLp9S76ojJuWtqCludb6Ou32XbylgH0Wh7Va7mv81SFsglk
	C+7X0EwYo5cEIs7hUbYpOmIgN0QlxA8NhRuZv/e4tpzxvji4nsIhA2W5T9ib2ZhUQEqvLi5ptjvTB
	CsaSwD3TRZ+GpOGetsAr6PqzvfLf02x/QGJqKjcvXgNQVSB3RBH471tvLCpt4h4xnAxSARELfDF/5
	PBvE/7vcpqnqBKOvWh0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvk2E-00D00z-30;
	Wed, 25 Oct 2023 19:59:22 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvk2C-00D00I-14
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 19:59:21 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1698263956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sT6BK5Z8FPdXb0R3Y4NYE9GeqC6Wv7eahDU+D60e1Ps=;
	b=UfFMIM7eQiozcUjqpRZh5qaxkLEq8/25fz8PmjlZuV6PIoFovao2Bbs1sW3O6KSyMaSrGK
	YZGvmLN3vsXfmUYzVQ6BV1J674CzA1EDPI1HwadW711XopPlJD2r2UmR0G3a313p3h9l19
	IZYw4JC/qYr0vkr0mwcrKY+gW5ZmopG2f1htxgsLdH/O5PadMrsoCiT4c7SXFw79gqTios
	YV9lR8jbxXDjU3KhWoNYZy0dj5Es19ds0W3hoOHQMb8ll/4qLnZyKrJTzggDTqG83UARCI
	MjbvIPxf3DCmqYONVcFQFnJUM6wSAKq8p+Gx83HGq/ybjtRGujc4q3EeQ3aKqA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1698263956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sT6BK5Z8FPdXb0R3Y4NYE9GeqC6Wv7eahDU+D60e1Ps=;
	b=UAS7JqC/0l/WnQ7ztOlbqaFHo826mHKYl/aPVpUn6S9Ppdw/RBzfQ1kws4/1EYbO9PUovO
	rJ/FsqYvfBY4irBQ==
To: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Frank Rowand
 <frowand.list@gmail.com>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v11 09/14] irqchip/riscv-imsic: Add support for PCI MSI
 irqdomain
In-Reply-To: <20231023172800.315343-10-apatel@ventanamicro.com>
References: <20231023172800.315343-1-apatel@ventanamicro.com>
 <20231023172800.315343-10-apatel@ventanamicro.com>
Date: Wed, 25 Oct 2023 21:59:15 +0200
Message-ID: <87bkcm5v8s.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_125920_519995_EDCB3698 
X-CRM114-Status: UNSURE (   5.81  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Oct 23 2023 at 22:57, Anup Patel wrote:
> The Linux PCI framework requires it's own dedicated MSI irqdomain so
> let us create PCI MSI irqdomain as child of the IMSIC base irqdomain.

Same here. Please don't add new incarnations of that and switch over to
per device MSI domains which is the most future proof mechanism.

Thanks,

        tglx


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
