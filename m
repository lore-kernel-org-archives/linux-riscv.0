Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E474C77B60
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Apr 2023 22:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3ohGeY6mo43pAaNv2M5yVg2iAu5wCdlBteHVMypKay8=; b=pdwkXWtBuRSuU3
	C5XcYCGfce1VZvPfsyjz63bH/iTjMM7RnWtgCDcxVGRAOjdIMd+sLRg/hqagUHQKVKpvP9CLA05kq
	tKSNQdM1UNyJGsnLMudgrXLLiFKRfT3OmH/aTa+FFVcGN8xjwrAnuUBrYaZMjYM5pHO6E+SPWv9Sn
	sBv9MDVUSnfHRTbUL4WLwAopeIOhHK7dXFQdkscHjNuAWHQwHuiN1pTlFE9pLjOiTfO47BCGxP4kL
	1gwXXPnXpd5KOGqY330BBTWLDF6IMbsC4Ba6z0LOMWc6oiWHbnIcutA7aDfpig8eFXIr8pWdXE8+i
	vbg2zD58prkmK4nF9p0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pijb6-00BNy2-2x;
	Sat, 01 Apr 2023 22:21:20 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pijb0-00BNx9-2E;
	Sat, 01 Apr 2023 22:21:18 +0000
Received: from ip4d1634d3.dynamic.kabel-deutschland.de ([77.22.52.211] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pijay-0004qt-Lt; Sun, 02 Apr 2023 00:21:12 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-riscv@lists.infradead.org, palmer@dabbelt.com, anup@brainfault.org,
 atishp@atishpatra.org, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org
Cc: vineetg@rivosinc.com, greentime.hu@sifive.com, guoren@linux.alibaba.com,
 Andy Chiu <andy.chiu@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Vincent Chen <vincent.chen@sifive.com>,
 Andrew Bresticker <abrestic@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>
Subject:  Re: [PATCH -next v17 12/20] riscv: signal: check fp-reserved words
 unconditionally
Date: Sun, 02 Apr 2023 00:21:11 +0200
Message-ID: <5898720.alqRGMn8q6@diego>
In-Reply-To: <20230327164941.20491-13-andy.chiu@sifive.com>
References:  <20230327164941.20491-1-andy.chiu@sifive.com>
 <20230327164941.20491-13-andy.chiu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_152117_751997_80A09747 
X-CRM114-Status: GOOD (  11.10  )
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

Am Montag, 27. M=E4rz 2023, 18:49:32 CEST schrieb Andy Chiu:
> In order to let kernel/user locate and identify an extension context on
> the existing sigframe, we are going to utilize reserved space of fp and
> encode the information there. And since the sigcontext has already
> preserved a space for fp context w or w/o CONFIG_FPU, we move those
> reserved words checking/setting routine back into generic code.
> =

> This commit also undone an additional logical change carried by the
> refactor commit 007f5c3589578
> ("Refactor FPU code in signal setup/return procedures"). Originally we
> did not restore fp context if restoring of gpr have failed. And it was
> fine on the other side. In such way the kernel could keep the regfiles
> intact, and potentially react at the failing point of restore.
> =

> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Acked-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
