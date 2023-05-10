Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0765C77B7D
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 14:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+KoULTmiXDOfs9bx/5ISgFW/quV4C6+s0icd83dDGQc=; b=ukQiWUB7wFMo0I
	ueoc25Hv1yF3U8f6QEdsjnyJUo4NjugZQFf9n2wLNtrsDfpuIfbtO6OU7Zulx7r3bZwy/aLgCc6oY
	fgB9FhNA93jTNRwvvicia/gVg2mEcTtFh/ZrKO2No+KdfY98KxvWrtkVX2wCClEHx//b/jnsRyEZ/
	hoCu+L8SwsYTsaaU7Cy6ptNmKquc/PSIsa4Wz/q4FO6jnbJ/fEuDMkGoAqlSS51WownYbtAlJLx4U
	RGmdaVUyOX+MBRMYsDQnP3ZrVpm604LAn2LKl901ltR/TLqBvSnBacIDtfCltKoKyTg9XTEIpCzBL
	INFKr80R88lNaEIy3H0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwl72-006Owz-2E;
	Wed, 10 May 2023 14:48:16 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwl70-006OwU-1d
	for linux-riscv@lists.infradead.org;
	Wed, 10 May 2023 14:48:15 +0000
Received: from ip4d1634d3.dynamic.kabel-deutschland.de ([77.22.52.211] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pwl6g-0006T6-V4; Wed, 10 May 2023 16:47:54 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org
Cc: Evan Green <evan@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Andrew Bresticker <abrestic@rivosinc.com>,
 Celeste Liu <coelacanthus@outlook.com>,
 Conor Dooley <conor.dooley@microchip.com>, Jonathan Corbet <corbet@lwn.net>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Evan Green <evan@rivosinc.com>
Subject: Re: [PATCH v2 3/3] RISC-V: hwprobe: Expose Zba, Zbb, and Zbs
Date: Wed, 10 May 2023 16:47:54 +0200
Message-ID: <2605015.k3LOHGUjKi@diego>
In-Reply-To: <20230509182504.2997252-4-evan@rivosinc.com>
References:  <20230509182504.2997252-1-evan@rivosinc.com>
 <20230509182504.2997252-4-evan@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_074814_539791_8C4EF894 
X-CRM114-Status: UNSURE (   8.04  )
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

Am Dienstag, 9. Mai 2023, 20:25:03 CEST schrieb Evan Green:
> Add two new bits to the IMA_EXT_0 key for ZBA, ZBB, and ZBS extensions.
> These are accurately reported per CPU.
> 
> Signed-off-by: Evan Green <evan@rivosinc.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>

though a part of me wonders, what happened to Zbc ;-)



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
