Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 920D6E7C4E5
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 17:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=0PVsYJu4j4M/KxwhXwt+az256Yarjysw45mEK1NQUtA=; b=ln1
	HAWCW7TkYSCKrpvxWAGPHttyp3DMlEK4sTZrq/Azjjw0z0XommyEtoH+d9X2q2fJdALM6TlrWZ40O
	AsKjDnsH+4MVoplomh5KK/JjIlir6CPVAhuP0ZVx/oHDjvjrFa4kDbTY4bMR919sUq9mo8+YWvAH6
	/lSFfR9vKkG0T1Q9mDlNks2dIuKXFtJVqCTqfC9AL1s12d+N30sqpPO95C4Xg6ufp2WxNXUJndb6h
	cGcLkdbLm28haAmTDUrqZ0awiXALN66ZZrKGlzBqobHM7McZS6cd5Nonr5y+frfNxJ0LUPMP5DzPC
	naFTTHDxQKTj/KjYK4MA/L7QMVMyodQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo5GX-000XwW-0d;
	Wed, 04 Oct 2023 17:02:29 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo5GU-000Xvl-2S
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 17:02:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 40BA9B81F73;
	Wed,  4 Oct 2023 17:02:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 967B1C433CA;
	Wed,  4 Oct 2023 17:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696438944;
	bh=/jwS8DV3jsMCn4Bp8MLvmgTr4VDd3Ub42uJVGkJX6hs=;
	h=From:To:Cc:Subject:In-Reply-To:Date:From;
	b=FO0o3KMQIq5odmdGVS4GdB9w+/9pTPhf6vIZ4Fa0+F9RA+3A7B3QYkPjiLBkTiw8T
	 sWUa9WDXpryvCkoPR49IQkgDkJH/zr3WhcAkR3/EOUDet9pzsHF9zT3U3uUQPzHF8W
	 uBFuRxg0vOklVC/DVJuOGWuY+GXQsOhauWKZSqAuDtMOVxlcHrM+FcR5dRyzomtbFY
	 7uR6Tq3zQ9hPhkI6YCFezizQ0EH2UFMURoDC9f3qDTYoaq1S7OMww0v+2TD3h85qLB
	 4Nx0mrOUlNSbrmzT9d1bq6ufRZ/1W5WMOvUIFPFer0lB0P3oNSFusLYJz1+i0B1zxa
	 dM0vJJCfFXICg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: =?utf-8?Q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>
Cc: =?utf-8?Q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, Atish Patra
 <atishp@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>, Evan Green
 <evan@rivosinc.com>, =?utf-8?Q?Bj=C3=B6rn?= Topel <bjorn@rivosinc.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Ron Minnich
 <rminnich@gmail.com>, Daniel Maslowski <cyrevolt@googlemail.com>, Conor
 Dooley <conor@kernel.org>
Subject: Re: [PATCH v2 3/8] riscv: report perf event for misaligned fault
In-Reply-To: <20231004151405.521596-4-cleger@rivosinc.com>
Date: Wed, 04 Oct 2023 19:02:22 +0200
Message-ID: <87cyxuuxr5.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_100226_949704_2570249F 
X-CRM114-Status: UNSURE (   3.56  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Q2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPiB3cml0ZXM6Cgo+IEFkZCBtaXNz
aW5nIGNhbGxzIHRvIGFjY291bnQgZm9yIG1pc2FsaWduZWQgZmF1bHQgZXZlbnQgdXNpbmcKPiBw
ZXJmX3N3X2V2ZW50KCkuCj4KPiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdl
ckByaXZvc2luYy5jb20+CgpSZXZpZXdlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3Np
bmMuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
