Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC575C4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Dec 2023 11:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=13/+TWlLvF+sU4V7qztB9UsDZ7gHxCuGQmkR85EsrIQ=; b=4QpP57czpfx2m4
	oLLLgDQjdQTzpHfS1haEnSF3ZX3s/VtMrS8dpGGY584UivXT1Lt78TwR5Yt6i+RMvCwZxzpTitngi
	Y2rtbDYyScMSF/dlveHE6ynxqxlJKmgcnRC3TOAkKam99ivfKWSK5CwbbE+IMpNJL/rU9YIFzKUQW
	Z7ZNEkKhucLut/PCUV8WgtEzIQdCm3WAyVoooZ9J+l8HBNU/COmcHXYZfC2RsX/mz05oVgWB2wfPB
	HumQWjqg6WPOIJSXWNnqH+K6cp3fmfnY3jzToZCIkA0jZH2SYATBHhD9kjm2nFlYQdpePYhULAJ8h
	IhBcdv4FwBt3YAA5F7NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r91Lx-00DI64-08;
	Fri, 01 Dec 2023 11:06:37 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r91Lt-00DI5O-2D;
	Fri, 01 Dec 2023 11:06:35 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1701428792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HEhlj+ipjqr4tEgJOcMvjQsGJg7PSMW3Lo0ITUjqyJ8=;
	b=gVfDLjU5umc+p3JXfSXFKIMVGVVvh/YAfNpBHT1q4t9H27RaW8vqhGxIzPvK5LwXvQwvdF
	/JYPTDKNgMJUwy1VQmekKDtiuw9J5MRT8kLobRdLxKlvOUfGx43e57Db2Cd7dAx9syetOZ
	BU7cmbjv5BmHUc0EAy6VO+z0aR26jT/u8M8FH2BQ6+zo9e37Okp4KeSLznfNh/tj+3D+nn
	JUnzrC6xa7Oy2ZtOmEpsPXJWO6wneo3/X5sumqAOekkfTiY5vVbLzAykjFEs+lfH/gjvHp
	2hQwTTxf7jJz2QGhGaXroHm9dcH/i6GePiLaIo9jyy0ijxHr/8RoxXDlbrf0jw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1701428792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HEhlj+ipjqr4tEgJOcMvjQsGJg7PSMW3Lo0ITUjqyJ8=;
	b=supcOG+ERH+rcQKMhNStZbjQi0qWHuaxf3SWtVLs0rM9jaVZ7Iy5x6/vAzCqSSHennIM26
	dvRnrytMPd0gRKCA==
To: Russell King <rmk+kernel@armlinux.org.uk>, linux-pm@vger.kernel.org,
 loongarch@lists.linux.dev, linux-acpi@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 kvmarm@lists.linux.dev, x86@kernel.org, linux-csky@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-parisc@vger.kernel.org
Cc: Salil Mehta <salil.mehta@huawei.com>, Jean-Philippe Brucker
 <jean-philippe@linaro.org>, jianyong.wu@arm.com, justin.he@arm.com, James
 Morse <james.morse@arm.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH 08/21] drivers: base: Implement weak arch_unregister_cpu()
In-Reply-To: <E1r5R3H-00CszC-2n@rmk-PC.armlinux.org.uk>
References: <ZVyz/Ve5pPu8AWoA@shell.armlinux.org.uk>
 <E1r5R3H-00CszC-2n@rmk-PC.armlinux.org.uk>
Date: Fri, 01 Dec 2023 12:06:31 +0100
Message-ID: <87sf4mxjuw.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231201_030633_885499_3950A2AA 
X-CRM114-Status: UNSURE (   7.16  )
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

On Tue, Nov 21 2023 at 13:44, Russell King wrote:
> ---
> An open question remains from the RFC v2 posting: should we provide a
> __weak stub for !HOTPLUG_CPU as well, since in later patches ACPI may
> reference this if the compiler doesn't optimise as we expect?

You mean:

extern void foo(void);

    if (!IS_ENABLED(CONFIG_FOO))
    	foo();

The kernel uses this pattern for years and if someday a compiler starts
to fail to eliminate the call to 'foo()' for CONFIG_FOO=n then you
already get hundreds linkage fails today.

So adding one more in later patches won't matter much :)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
