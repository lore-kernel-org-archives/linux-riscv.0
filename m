Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E83C4321E
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Nov 2022 19:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B2AHN6MuaNQx8uhQeEE2ZIWXQhBVZ5g6Yrba4P5+YyQ=; b=wp6qZtptqoF12t
	BVYYRNpK8hUUsvmwmWqX7i9I7lcOXocS1ww7dzJAm2WLQytviuHSxYeFyHfckgYtMQFL82ObRXfZ2
	70nR11gQ7yEYIGwPFbM4L1jJOULzT3m3UC2tz79iCYczx8qmjlIuI4wxB24z1k96vAUCrfnCgGCqi
	O507+hPeX7n6mwf3LrZPzU5c7rT7+hnMrEXSRLsWgGE7j31YnyWtly42MTtwgIwSffbPooDw5fKNh
	nYLpmD637hsgOZ0oYzsuX6cptmeg/fFLICTKuyGVfGmhRjPA5/105pjUoQ0fzaXsU1sh0p9S/zSdz
	8I1nHg100TNIH8ywo8gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyINU-00BMEN-LC; Thu, 24 Nov 2022 19:59:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyINR-00BMCN-3p
	for linux-riscv@lists.infradead.org; Thu, 24 Nov 2022 19:59:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E1F26621C6;
	Thu, 24 Nov 2022 19:59:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFFBFC433D6;
	Thu, 24 Nov 2022 19:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669319955;
	bh=bFLQXR8VH88R8kmhqGLzNuOD6udDTK9anm5yIMqU7K0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ciuuASn+jApzGYUVqVuWHFW0ijSsRop/fx9htFcDBI1fHoxPYyvwhoFf3lOQEutwE
	 CIIjNVRswXuRM903adij7HNVDNrafVLc5btC8Tel1u5kdDCV4vsqE9hT7wx9tPimxb
	 zlUX6eh0fepFH/A/dC7Qhj+27sjcSwUbXFDVotDHr2iOKxpaXnu0W7gMjqLWisJzzg
	 fI8CWIVxerdn2oscsw+o8/dQL4+crnBK5TNlXJhHcPdjY0aKs4etonWZeKmZfjMKaf
	 f1gkaNrFD/LXK78XTdVk9SUK+NaRVQrSFZ+hY7Ln9cpVyPF2xN9MuQ3icEihVbkqsE
	 u5LV2rTzsKaDQ==
Date: Thu, 24 Nov 2022 19:59:04 +0000
From: Conor Dooley <conor@kernel.org>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
	Atish Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v4 0/7] AX45MP: Add support to non-coherent DMA
Message-ID: <Y3/NCKqNoN/yIsDw@spud>
References: <20221124172207.153718-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Y3/I4KzHnzyPo1Fe@spud>
 <CA+V-a8viAfvLnScDKADpKMRqNEaMdhf5kA1GqAdgaGAEo+XpBQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+V-a8viAfvLnScDKADpKMRqNEaMdhf5kA1GqAdgaGAEo+XpBQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_115917_215765_5FCC4BE8 
X-CRM114-Status: GOOD (  12.24  )
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

On Thu, Nov 24, 2022 at 07:52:28PM +0000, Lad, Prabhakar wrote:

> Hmm that looks interesting! I'll give that a shot with the latest tool-chain.
> 
> BTW is there a link to get the latest toolchain?

Uhh, I just build mine from https://github.com/riscv-collab/riscv-gnu-toolchain
Arnd puts toolchains here: https://mirrors.edge.kernel.org/pub/tools/crosstool/
I've never used one though!

> Oops I missed to mention the dependency here we need patches from [0]
> . Just patches 1-5 should be sufficient for this build (as including
> patch 6/7 gave me a build issue).
> 
> [0] https://patchwork.kernel.org/project/linux-riscv/cover/20221110164924.529386-1-heiko@sntech.de/

Ah right. I kinda figured that with the "don't review this" patch that
you'd pulled all of the deps into it.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
