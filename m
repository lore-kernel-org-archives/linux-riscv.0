Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6108C25B50
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jan 2023 11:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qNAPogVPR4kfRuHz6geYMvDzPZnZW0vo7srZhmC6PtA=; b=4291720ydftWd6
	i5MG8jnD59t2R1oUrqxkZWVhQ89cugIQfEPCLAIw0O7g2oEVq4+YJyF6nPji6rZ8sSeDBhRRkDUpL
	tcQHF4ieMt/t/AY+Y3TisrNyrmUmIyesKv6DvZAH5l8CyQFp4Gp3WqZVO890FEVvbX0C6SCvAqS5Q
	cQVEIlTzDcFjcS2zGazTT9JBq1Py7Uz2ISCio5Z7vwDCzmtvFzn6HleQgiGJ+3Znxw1JgHhYaeBvj
	T5qyPbIGb7J/6SOYZFdmAeh/vpILkOtGya7GQqywK2XdS//M2PfHCsO+xqxEoXfB7DgpV2v2KH/aY
	pAibh9qalkvV40YmGdhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJuuM-00Gx1h-9R; Mon, 23 Jan 2023 11:22:38 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJuuJ-00Gx0W-HN; Mon, 23 Jan 2023 11:22:36 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pJusC-0007Mj-85; Mon, 23 Jan 2023 12:20:24 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-riscv@lists.infradead.org
Subject: Re: [PATCH v12 01/17] riscv: Rename __switch_to_aux -> fpu
Date: Mon, 23 Jan 2023 12:20:22 +0100
Message-ID: <5335635.Sb9uPGUboI@diego>
In-Reply-To: <20220921214439.1491510-1-stillson@rivosinc.com>
References: <20220921214439.1491510-1-stillson@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_032235_601673_43FB3DB0 
X-CRM114-Status: GOOD (  12.25  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Guo Ren <guoren@linux.alibaba.com>, kvm@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@rivosinc.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Nicolas Saenz Julienne <nsaenzju@redhat.com>, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Vitaly Wool <vitaly.wool@konsulko.com>, Davidlohr Bueso <dave@stgolabs.net>, Yury Norov <yury.norov@gmail.com>, Nick Knight <nick.knight@sifive.com>, "Paul E. McKenney" <paulmck@kernel.org>, Anup Patel <anup@brainfault.org>, Huacai Chen <chenhuacai@kernel.org>, Myrtle Shah <gatecat@ds0.me>, Eugene Syromiatnikov <esyr@redhat.com>, linux-riscv@lists.infradead.org, Tsukasa OI <research_trasio@irq.a4lg.com>, Ruinland Tsai <ruinland.tsai@sifive.com>, Guo Ren <ren_guo@c-sky.com>, Greentime Hu <greentime.hu@sifive.com>, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Li Zhengyu <lizhengyu3@huawei.com>, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Barret Rhoden <brho@google.com>, Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Frederic Weisbecker <frederic@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Dao Lu <daolu@rivosinc.com>, Alexander Graf <graf@amazon.com>, Atish Patra <atishp@atishpatra.org>, Alexandre Ghiti <alexandre.ghiti@canonical.com>, Peter Collingbourne <pcc@google.com>, Janosch Frank <frankja@linux.ibm.com>, Chris Stillson <stillson@rivosinc.com>, Christian Brauner <brauner@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Colin Cross <ccross@google.com>, Alexey Dobriyan <adobriyan@gmail.com>, Han-Kuan Chen <hankuan.chen@sifive.com>, Vincent Chen <vincent.chen@sifive.com>, Changbin Du <changbin.du@intel.com>, Palmer Dabbelt <palmer@dabbelt.com>, Eric Biederman <ebiederm@xmission.com>, kvm-riscv@lists.infradead.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Am Mittwoch, 21. September 2022, 23:43:43 CET schrieb Chris Stillson:
> From: Guo Ren <ren_guo@c-sky.com>
> 
> The name of __switch_to_aux is not clear and rename it with the
> determine function: __switch_to_fpu. Next we could add other regs'
> switch.
> 
> Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>

Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
