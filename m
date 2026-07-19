Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB98CC44512
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Jul 2026 18:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+C88DedPtUfufqhZJmCCKwcBuFsMWIEbunC27Y7+Tdg=; b=Vzlgb+MjII2WLT
	VKYSzwPXhuWPW2rIFzOjwnwKBvXmi20B/GJYux59n8N6sJNYIeYsvNuUPNkbiQBm5HCX6szTlVAGb
	ZWX/snY2TXkdVT4CA92JJec/6xq2d4CrHfDTMxFMClxE4E5o+6pqX3pF3/IAOgqa/9Zg9Uz4nm1f1
	ZFYKEu8rlED7GRvREecN8YmLtGmyGYSA+uZVUaQT02g/LEft+3KRFYBLGSU262d7e9H6H9DPw6Urv
	TL7fU9gFbwnO8FMwv6w1cB+EwZkLaiJmq5E3sli1ZjuR0m/tkCNMX7Gz18h9i/zY2NFFxpZxJw3u3
	aBybUarWoJvtiQr3MjnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlWPC-00000005GyM-4BgZ;
	Sun, 19 Jul 2026 18:38:27 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlWPA-00000005Gxl-3DV4
	for linux-riscv@lists.infradead.org;
	Sun, 19 Jul 2026 18:38:26 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784486300;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XQqaVwgUii20BE/G5QlW0NSEzL9GyXjS/Ic5nXbiCgE=;
	b=SuniPVPEZv5YAGZpSR9VPVD4NKhdNuz4HCfshN+rLVWwvnmtrJSDM9kQOWd4mZ8Bqo6FFs
	WDlHUB8ifeJoiw+JsYULj84u8QWWUp742FXh/bXtCeDWoeuk9Wjfc00GFQwRX5tM0XfJKE
	7ZIDUTdZglWoOEfddRXOsrVrQUmI1jA9VbJhBzaBno94lxEGcmA6ih//dWAFnbHrqcb4k+
	a7h9P55pOMjGeAWSjZXBtQbkxC8bvGgOcT6GDvoArfOBCBO3nJwDf8baSv1XDV7PH7kq4D
	VHSmEFjWwsY/86IuFObGU5YVe6nneCoeGSrT1O+mVooJhGxuXE7nQkjJoZ/HGA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784486300;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XQqaVwgUii20BE/G5QlW0NSEzL9GyXjS/Ic5nXbiCgE=;
	b=fB1KGBRjYoeb6/Q7Kv3pYOen+VJ+wxpCVQh1A55n2bk9FpfPKiFVdtEFtYJEInNqQqIEL4
	qZbtX4qSdpEqzcDg==
To: Xiaofeng Yuan <xiaofengmian@163.com>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] riscv: mm: make EXECMEM_KPROBES writable without
 CONFIG_STRICT_MODULE_RWX
In-Reply-To: <20260719093024.33351-2-xiaofengmian@163.com>
References: <20260719093024.33351-1-xiaofengmian@163.com>
 <20260719093024.33351-2-xiaofengmian@163.com>
Date: Sun, 19 Jul 2026 20:38:19 +0200
Message-ID: <87fr1ebzac.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_113824_970524_88BD7A0B 
X-CRM114-Status: UNSURE (   4.44  )
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

Xiaofeng Yuan <xiaofengmian@163.com> writes:
> @@ -1457,7 +1457,9 @@ struct execmem_info __init *execmem_arch_setup(void)
>  			[EXECMEM_KPROBES] = {
>  				.start	= VMALLOC_START,
>  				.end	= VMALLOC_END,
> -				.pgprot	= PAGE_KERNEL_READ_EXEC,
> +				.pgprot	= IS_ENABLED(CONFIG_STRICT_MODULE_RWX) ?
> +			  PAGE_KERNEL_READ_EXEC :
> +			  PAGE_KERNEL_EXEC,

The indentation is messed up. It looked fine in v2.

Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
