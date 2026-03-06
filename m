Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37950FCC04D
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Mar 2026 18:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=frIXax75f3V+t2plSzsoY8pG1TdIFymZKJSi/1xIViQ=; b=Jy7Zs13/HWaSfr
	ptT9wjFgPCMjGSU0AVDUmktgJE5giVYH9xz7LhHIYO1APYJV/bIn52SMfRjn4y4pUggoERS6hdX0u
	ZjTK59HUi4yyW8yAjKPZPWzLemoFWpwCZG3Ep7kSOMmmnzcTq+9wBraENRRhocQt8NfdQrRUOKqLj
	Jzd6sv9Dhs3vueKqd1+9Q6ukNuZMFmyNU6RfTTW8PhGEqduwEnUxpfO4WQ5W3kDWGy5G8FK5KmAgi
	ziEGdPDf5PyZHTsiN57Sij171M4Yb0uv0cMcbykMpN4PgxX6n5Axq44nfBafcj1M/ViSJtwxCVaQ6
	nExkQOzG9SixsfPrgqiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyZYo-00000004IuA-1D0E;
	Fri, 06 Mar 2026 18:06:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyZYl-00000004Itq-08n1
	for linux-riscv@lists.infradead.org;
	Fri, 06 Mar 2026 18:06:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5134E437F6;
	Fri,  6 Mar 2026 18:05:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA847C4CEF7;
	Fri,  6 Mar 2026 18:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772820358;
	bh=IygDcXKohU1K+tHMhM4KsbtkEUocwFSeiRZwcISIc38=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BFd1W30DQloIPhj2BsMXh4t6JPkRYpJGLbKt0KNmLQJdKzl8E5UdujOxOT1zzRJyg
	 peTl0Yzaob1wjDi7gGg+IBlSMe7JtfEL9rlpjpEVJrlcm9vy4me3EvH+ltd5ZO0y26
	 lZHiGIPsPLfSg5h4gaqL6OklQnG+//IMHssSZ9INP3vzP4zWdaK6Q8Yj0xQMbydEbu
	 HUA4gUFlj43LJVTdg6CQe1xY47f/wU70JaMBUxeR65vLVf7/0w89JbL0FKaf+9d9HD
	 PkMNKubuMC5JL99gG9oNCJDBUoH95TQ2XwC38P4pQtqQSYFRfJ8TP4NqwwjoN9Lu//
	 ZMU+hSQ8uamYg==
From: Conor Dooley <conor@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Guodong Xu <guodong@riscstar.com>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/3] riscv: cpufeature: Add Supm extension id and validation
Date: Fri,  6 Mar 2026 18:05:44 +0000
Message-ID: <20260306-contort-pendant-8ae839e37152@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260125-supm-ext-id-v2-0-1e3b9714c860@riscstar.com>
References: <20260125-supm-ext-id-v2-0-1e3b9714c860@riscstar.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=697; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=LaY49zJBvbvl6tvTaufJTQzDycrEND5DwMf0LJ8MZEQ=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJmrxSsu3GuW+3KmyGvPS15bO8Fne2wm7mdhcysz3CC85 mm50Nm6jlIWBjEuBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAExkgxcjw7Y1vs1XZnmwR8b3 HGWPczNbsCDsf1Tzf8ZVwc46TBu0+IEqCqes5c1fdqCC773tKxG37CsTvUNviD7YvNmkoDN1kgo bAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_100559_097311_B34CB4FA 
X-CRM114-Status: UNSURE (   8.45  )
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

From: Conor Dooley <conor.dooley@microchip.com>

On Sun, 25 Jan 2026 09:36:05 +0800, Guodong Xu wrote:
> Supm as an extension indicates pointer-masking support for user mode
> (U-mode). It relies on Ssnpm or Smnpm for the underlying hardware
> implementation.
> 
> Major change in v2 is added dependency check for Supm in bindings.
> 
> As a ratified feature, define a dedicated RISCV_ISA_EXT_ id for Supm.
> However, since Supm is targeting U-mode, it should not be added into
> devicetrees that describe hardware running privileged system softwares.
> 
> [...]

Applied to riscv-dt-for-next, thanks!

[1/3] dt-bindings: riscv: Add Supm extension description
      https://git.kernel.org/conor/c/5932c871e067

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
