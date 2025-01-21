Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F75C02182
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jan 2025 20:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZQ4qxdtrjwZThT6e7CkeSP/WweM/3TP40jrCsHgOMMg=; b=xUmRsw5isPNWEq
	QaHjRYogTNlL2FB32D+sX+R4nLggXDdLDLwU/qcTS/CW/CLlqWKaTP7ZlTtR/iE5l+PyfG6YOKIyo
	h0Uhd8Bs1SFuzMazwAA/2FKc2GpdJoxqr0PIXy0gcuYmTKqTChT5Al8i9JfNWuXyMWVMa3+pLNwnb
	qfov2l+fTOt0DAryk0KJbxbPiEUhJTUYle4EOFavcTtKz2ZhO3uFmd8eoLmGe1M67yiXyH4n3ZifX
	p184hKn0/uImRMyX1EPoAzTXchloNzsOYgqQn8MUfXDpUhbZoCDS30HgbKeG9R3wKt/YnhWwqVRbq
	zFSOl65CQebxXY4+XVGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taLGW-00000008kjW-0BRQ;
	Tue, 21 Jan 2025 20:54:28 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taLGT-00000008kjA-2zSi
	for linux-riscv@lists.infradead.org;
	Tue, 21 Jan 2025 20:54:26 +0000
Received: from localhost (unknown [116.227.99.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 97DBC340C57;
	Tue, 21 Jan 2025 20:54:23 +0000 (UTC)
Date: Tue, 21 Jan 2025 20:54:13 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 0/2] serial: 8250: move mmp|pxa uart earlycon code and
 add xscale earlycon
Message-ID: <20250121205413-GYA35009@gentoo>
References: <20240711160720.3488-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240711160720.3488-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_125425_771293_8D1FEACC 
X-CRM114-Status: GOOD (  14.27  )
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

Hi Greg, Jisheng:

how is this patch going, hope it isn't lost..
generally this patch looks good.

On 00:07 Fri 12 Jul     , Jisheng Zhang wrote:
> There are two other drivers that bind to "mrvl,mmp-uart": the 8250_of
> and the 8250_pxa. The previous one is generic and the latter is binded
> to ARCH_PXA || ARCH_MMP. Now we may have pxa programming compatible
> HW to support, making use of the generic 8250_of seems a good idea.
> However, there's no earlycon support if we go with this solution. So
> move the mmp|pxa-uart earlycon code to core 8250_early.c.
> 
> patch2 adds xscale earlycon support too, only build test since
> I have no xscale machine any more.
> 
> Since v1:
>   - split the patch into two as suggested by Greg
> 
> Jisheng Zhang (2):
>   serial: 8250: move mmp|pxa uart earlycon code
>   serial: 8250_early: add xscale earlycon support
> 
>  drivers/tty/serial/8250/8250_early.c | 11 +++++++++++
>  drivers/tty/serial/8250/8250_pxa.c   | 16 ----------------
>  2 files changed, 11 insertions(+), 16 deletions(-)
> 
> -- 
> 2.43.0
> 
Reviewed-by: Yixun Lan <dlan@gentoo.org>
-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
