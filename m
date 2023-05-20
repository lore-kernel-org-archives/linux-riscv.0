Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA459C77B7D
	for <linux-riscv@archiver.kernel.org>; Sat, 20 May 2023 09:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=57T8/cgFnCy+Q8duKDQyzG7bglFRk2vW63NonOIcLrs=; b=pk5uSzoThy9hxM
	RTur9FpswtKQFv0JJ+xblpCvo8qHyvuUNO6oj7vM9KPeSf8gUDfIfTUw7Zr00yJI3pfmr090x0/E+
	TpBm09zkxrrUp16a33Zmi/wH7pPpPgpgI2eX+6zsfWgliHop+pScwEGSGwW+jTPSIGVqmEJ2IB3Wj
	xwd+3WrxT3H/yn0klIzBqWdZjmP8miqDmPDQDKWhQDSc4MT8K/omdKVoPPMWND3ky1RRsUaIUqXUe
	j2zM8xQKSZ1l6LSoVQmG4NapAVos6KVtuJdFHDmgplrYJ/7pslFmm4Vlqkjov/25kZdZcWGs3PyUV
	GdN7+651SdoXcM+z0FiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0Ixi-0019AP-34;
	Sat, 20 May 2023 09:33:18 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0Ixf-00199o-34
	for linux-riscv@lists.infradead.org;
	Sat, 20 May 2023 09:33:17 +0000
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 34K9X7q5027290;
	Sat, 20 May 2023 11:33:07 +0200
Date: Sat, 20 May 2023 11:33:07 +0200
From: Willy Tarreau <w@1wt.eu>
To: Zhangjin Wu <falcon@tinylab.org>
Cc: aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, palmer@rivosinc.com,
        paul.walmsley@sifive.com, paulmck@kernel.org
Subject: Re: Re: [PATCH 1/2] tools/nolibc: riscv: Fix up load/store
 instructions for rv32
Message-ID: <20230520093307.GA27287@1wt.eu>
References: <20230520085052.GC27206@1wt.eu>
 <20230520091144.30599-1-falcon@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230520091144.30599-1-falcon@tinylab.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230520_023316_852672_3764065F 
X-CRM114-Status: UNSURE (   9.17  )
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

On Sat, May 20, 2023 at 05:11:44PM +0800, Zhangjin Wu wrote:
> Hi, Willy
> 
> This is a full commit message for this patch:
> 
> When compile for rv32, we got such error:
> 
> ---
> 
> nolibc/sysroot/riscv/include/arch.h:190: Error: unrecognized opcode `ld a4,0(a3)'
> nolibc/sysroot/riscv/include/arch.h:194: Error: unrecognized opcode `sd a3,%lo(_auxv)(a4)'
> nolibc/sysroot/riscv/include/arch.h:196: Error: unrecognized opcode `sd a2,%lo(environ)(a3)'
> 
> Refer to arch/riscv/include/asm/asm.h and add REG_L/REG_S macros here to let
> rv32 use its own lw/sw instructions.
> 
> ---

That's fine, thank you!

> I will send a new version with the above full message for you, wait for a
> while, very sorry ;-)

Don't waste your time resending, I can perfectly take that one and
put it into the series.

Thanks!
Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
