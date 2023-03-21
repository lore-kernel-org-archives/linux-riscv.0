Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F6F4C6FD1D
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Mar 2023 20:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TmB7jOczuZ1vWn+E+q32epabAf59payGda/7qAnyVBA=; b=Yw2ltd+KGV1Xyt
	64BLHoMObenOQWWitQhTYWOS9YTuMtVJbYU3Gq/Id7tdHsvq4ZTjkIM63S5YQjNgZgOxOWnD1yvr9
	KUUzHyxu/cUJ8jbThAZmwRBYAk7Ocj5I9g4m1eFrBe1gq9WruTbWCw0WbIjgJ+FVaNgGN4l3rGEJu
	aX1PvbHNJOOMKx6LgVsoesJHNn1MFknbbbmZRw65NzRL1o2uK6RT4pKePKrgxtkmTaeKK/v1J4Fk1
	C0uAQ/MVsZXpesTWc2990Vv0UE6nWxapUxiO6DBkF8iEnywqldFweswIDcKt4icv1/StER0N6+ewd
	kWZNaspYexkGbq1UaaUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peiWV-00Dg9K-2O;
	Tue, 21 Mar 2023 20:23:59 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peiWQ-00Dg6Q-1b
	for linux-riscv@lists.infradead.org;
	Tue, 21 Mar 2023 20:23:57 +0000
Received: from ip4d1634d3.dynamic.kabel-deutschland.de ([77.22.52.211] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1peiWF-0003yL-0g; Tue, 21 Mar 2023 21:23:43 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Palmer Dabbelt <palmer@rivosinc.com>, Evan Green <evan@rivosinc.com>
Cc: slewis@rivosinc.com, Conor Dooley <conor@kernel.org>,
 vineetg@rivosinc.com, Evan Green <evan@rivosinc.com>,
 Conor Dooley <conor.dooley@microchip.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrew Bresticker <abrestic@rivosinc.com>, Arnd Bergmann <arnd@arndb.de>,
 Atish Patra <atishp@rivosinc.com>, Bagas Sanjaya <bagasdotme@gmail.com>,
 Celeste Liu <coelacanthus@outlook.com>, Guo Ren <guoren@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Tobias Klauser <tklauser@distanz.ch>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 2/6] RISC-V: Add a syscall for HW probing
Date: Tue, 21 Mar 2023 21:23:41 +0100
Message-ID: <10720737.nUPlyArG6x@diego>
In-Reply-To: <20230314183220.513101-3-evan@rivosinc.com>
References:  <20230314183220.513101-1-evan@rivosinc.com>
 <20230314183220.513101-3-evan@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_132355_354804_AF0BEC4A 
X-CRM114-Status: GOOD (  10.40  )
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

Am Dienstag, 14. M=E4rz 2023, 19:32:16 CET schrieb Evan Green:
> We don't have enough space for these all in ELF_HWCAP{,2} and there's no
> system call that quite does this, so let's just provide an arch-specific
> one to probe for hardware capabilities.  This currently just provides
> m{arch,imp,vendor}id, but with the key-value pairs we can pass more in
> the future.
> =

> Co-developed-by: Palmer Dabbelt <palmer@rivosinc.com>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> Signed-off-by: Evan Green <evan@rivosinc.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
