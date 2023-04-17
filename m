Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF8C5C77B76
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Apr 2023 15:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xftNCJvSboGEL+XjUPdH+Tkju0JAm9g3au376aMTa94=; b=lUb2fYkaCwIj9g
	sfwjaszvRpGuuFgNSBb8faaltRCOSGj72CLMi+PaZMm+QEcp+ji0BmvLWuBE8Ko1l0m77bebvNr1l
	oDufDxO4ag/OPbS0FBUliYfaXV3Xf2tQrNS7mjcoUgXK9dt11R5GS7hfRp1L0EqfVVHHrc5AuPPma
	KzjU1wN3DROavglosXtHM0XyjS+UPXYBedAV+puP8j7SlxDQNyymramY/nko0z2ZGuUJeo+gvB402
	eAKR7sQH2t/iDD3frFy8pjqBiO+epC3GgSjzHLB68pTZskizGxnJu2ag2yektPIntIL/XHVeRGP9Q
	FNB0WiaQHQIH2VSPe2jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poR9H-00GxQJ-2R;
	Mon, 17 Apr 2023 15:52:11 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poR9F-00GxPD-1D;
	Mon, 17 Apr 2023 15:52:10 +0000
Received: from ip4d1634d3.dynamic.kabel-deutschland.de ([77.22.52.211] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1poR98-0004wv-Ls; Mon, 17 Apr 2023 17:52:02 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-riscv@lists.infradead.org, palmer@dabbelt.com, anup@brainfault.org,
 atishp@atishpatra.org, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org
Cc: vineetg@rivosinc.com, greentime.hu@sifive.com, guoren@linux.alibaba.com,
 Vincent Chen <vincent.chen@sifive.com>,
 Han-Kuan Chen <hankuan.chen@sifive.com>, Andy Chiu <andy.chiu@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
 Nicolas Saenz Julienne <nsaenzju@redhat.com>,
 =?ISO-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Andrew Bresticker <abrestic@rivosinc.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Alexandre Ghiti <alexandre.ghiti@canonical.com>,
 Andy Chiu <andy.chiu@sifive.com>
Subject:  Re: [PATCH -next v18 05/20] riscv: Disable Vector Instructions for kernel
 itself
Date: Mon, 17 Apr 2023 17:52:01 +0200
Message-ID: <3758917.VqM8IeB0Os@diego>
In-Reply-To: <20230414155843.12963-6-andy.chiu@sifive.com>
References:  <20230414155843.12963-1-andy.chiu@sifive.com>
 <20230414155843.12963-6-andy.chiu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_085209_410829_CDC58E7C 
X-CRM114-Status: UNSURE (   7.43  )
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

Am Freitag, 14. April 2023, 17:58:28 CEST schrieb Andy Chiu:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> Disable vector instructions execution for kernel mode at its entrances.
> 
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Co-developed-by: Han-Kuan Chen <hankuan.chen@sifive.com>
> Signed-off-by: Han-Kuan Chen <hankuan.chen@sifive.com>
> Co-developed-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
