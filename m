Return-Path: <SRS0=IS4U=WX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7A9EC3A5A3
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 27 Aug 2019 14:03:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F6EE206E0
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 27 Aug 2019 14:03:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hO08A5Tx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F6EE206E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6s3//3zWpJYyoJZNizEnefbh+ba9mx7MJScddk/RGEI=; b=hO08A5TxJBT2oK
	pmjtSzW78MYRAdins6HFwbHOeL+jtBbWxJyaOzBbtu7tuB66NcpDfYyFLNAYJ8koPJ0Qoi7kgA0kt
	sZuXZIku12rOiStyjKMCY2bL+APGzSG8pWeCkRgc3lH+8SkGj8d9FGJCZ9tQ2KqikeYBF2LVPMYmy
	zKfbtj2gzfUwdNiWdk/Mm3CbWtIOUd4LbmVQ/LlXfHAmz208bRSR8C0oCO1pGKFMN+6fVjv+SStDv
	EjNSUQlscm3E7AJQL+9Wvg9/7d7Q0a8z7bhRan6HhMZHCIWMSCmJJER9l5Bq0GAWI9qIuL6IjfH2a
	zUBdox3bU4o15fu7FzTw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2c3v-0003ul-Me; Tue, 27 Aug 2019 14:03:07 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1i2c3s-0003ua-DN; Tue, 27 Aug 2019 14:03:04 +0000
Date: Tue, 27 Aug 2019 07:03:04 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [RFC PATCH 1/2] RISC-V: Mark existing SBI as legacy SBI.
Message-ID: <20190827140304.GA21855@infradead.org>
References: <20190826233256.32383-1-atish.patra@wdc.com>
 <20190826233256.32383-2-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190826233256.32383-2-atish.patra@wdc.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alan Kao <alankao@andestech.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@sifive.com>,
 linux-kernel@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>,
 Alexios Zavras <alexios.zavras@intel.com>, Gary Guo <gary@garyguo.net>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

> +#define SBI_EXT_LEGACY_SET_TIMER 0x0
> +#define SBI_EXT_LEGACY_CONSOLE_PUTCHAR 0x1
> +#define SBI_EXT_LEGACY_CONSOLE_GETCHAR 0x2
> +#define SBI_EXT_LEGACY_CLEAR_IPI 0x3
> +#define SBI_EXT_LEGACY_SEND_IPI 0x4
> +#define SBI_EXT_LEGACY_REMOTE_FENCE_I 0x5
> +#define SBI_EXT_LEGACY_REMOTE_SFENCE_VMA 0x6
> +#define SBI_EXT_LEGACY_REMOTE_SFENCE_VMA_ASID 0x7
> +#define SBI_EXT_LEGACY_SHUTDOWN 0x8

As Mike said legacy is a bit of a weird name.  I think this should
be SBI01_* or so.  And pleae align the numeric values and maybe use
an enum.

> +
> +#define SBI_CALL_LEGACY(which, arg0, arg1, arg2, arg3) ({             \
>  	register uintptr_t a0 asm ("a0") = (uintptr_t)(arg0);	\
>  	register uintptr_t a1 asm ("a1") = (uintptr_t)(arg1);	\
>  	register uintptr_t a2 asm ("a2") = (uintptr_t)(arg2);	\

Instead of the weird inline assembly with forced register allocation,
why not move this to pure assembly?  AFAICs this is the whole assembly
code we'd need:

ENTRY(sbi01_call)
        ecall
END(sbi01_call)

>  /* Lazy implementations until SBI is finalized */
> -#define SBI_CALL_0(which) SBI_CALL(which, 0, 0, 0, 0)
> -#define SBI_CALL_1(which, arg0) SBI_CALL(which, arg0, 0, 0, 0)
> -#define SBI_CALL_2(which, arg0, arg1) SBI_CALL(which, arg0, arg1, 0, 0)
> -#define SBI_CALL_3(which, arg0, arg1, arg2) \
> -		SBI_CALL(which, arg0, arg1, arg2, 0)
> -#define SBI_CALL_4(which, arg0, arg1, arg2, arg3) \
> -		SBI_CALL(which, arg0, arg1, arg2, arg3)
> +#define SBI_CALL_LEGACY_0(which) SBI_CALL_LEGACY(which, 0, 0, 0, 0)
> +#define SBI_CALL_LEGACY_1(which, arg0) SBI_CALL_LEGACY(which, arg0, 0, 0, 0)
> +#define SBI_CALL_LEGACY_2(which, arg0, arg1) \
> +		SBI_CALL_LEGACY(which, arg0, arg1, 0, 0)
> +#define SBI_CALL_LEGACY_3(which, arg0, arg1, arg2) \
> +		SBI_CALL_LEGACY(which, arg0, arg1, arg2, 0)
> +#define SBI_CALL_LEGACY_4(which, arg0, arg1, arg2, arg3) \
> +		SBI_CALL_LEGACY(which, arg0, arg1, arg2, arg3)

When you touch this anyway I'd suggest you kill these rather
pointless wrappers as well as the comment above them.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
