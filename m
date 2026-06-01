Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF03FCD5BD1
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 08:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FfsOlGREnDxHB7gQfcyRz5IMWYK/yFn7ylwqhR+aEtc=; b=spNgssBNFrgdVK
	/FlKE1XlOBTDZ3v9fkRXdvase2BE8Ul/l43CzLYWdY73wjhgZh3qcXlX/WNTugWiUcM1gpCfAous6
	bl070HK7z8663yyboM15cOwQ5EET9rr6tkSkwBqH2SX5eVMLqrA9bVFiRxHU8yG6VGz06f7Nd6Nn9
	69EI/RYpkAtiLrBIDPhgHQqP2zAuiOr/M79N77hx2ocXUbJVcNFdcJ0Cov4DJ3NEXdqjIfdvvAL3h
	G2cX0RwdXQfP/wURBiAHxtDVpIZ5AgXJjJ5Sqvk4l0Ej63ndgU98X9Zhx6FV5P+7bYUg44W1vTveQ
	r5cD9JeSmYxenhdHadag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTxyy-0000000AM5M-1LZF;
	Mon, 01 Jun 2026 08:26:48 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTxyv-0000000AM41-0roM
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jun 2026 08:26:46 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780302400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZnBL8c3Fosuccw3/yCWY9wS1O+3elQnCWd96ulX8Q1w=;
	b=oo2RK4AlbXrHv1sAjqck0swz56b4O0k6mI94Zcj2TEu4VFn3KdphfJRiB5pfF+wWEfrdgj
	tNpkg/+I91YSxGx9schTSAvPX9AuTySMqXHTtfRcQ22AWdJSE8lnQ7IwyTi443GsKt9WUK
	9hnI4jD05y+bCOHRFGeTvXA4Yr7BZTo+niyhvRBAdF1Ps5mXT0svGuhpvKfVT97gwH6Lhs
	8Fccdyr75ZbVlAeXc0uhWQW5pAYWCdve/A8v1ye5RK7KwxP9YSsXEo4W29r+Syn21c6gqg
	VjL6JsEc8uJsDkhpUzSCntDWlsL+rTqzLK+YFr2RFOU254ElFGqwvkvnO3em+Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780302400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZnBL8c3Fosuccw3/yCWY9wS1O+3elQnCWd96ulX8Q1w=;
	b=YcvtwXJicJP5nKdWELv75z4AI/R4MJ9Qehb15so7UwW7Au8sSoiCA+Pm5a1j/ZAKe+D5wz
	xFrBPXTXQ1oX8fDg==
To: CABe3_aH6jYyoC=Jx91qATP2kOoY42NUtesyZpGbWGoQTw75OAA@mail.gmail.com,
 cmirabil@redhat.com
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, haxel@fzi.de,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, pjw@kernel.org, vitaly.wool@konsulko.com, Kunwu Chan
 <kunwu.chan@linux.dev>, Zhouyi Zhou zhou <zhouyi@gmail.com>,
 igor.b@beldev.am, Jisheng Zhang <jszhang@kernel.org>, Albert Ou
 <aou@eecs.berkeley.edu>, Frederik Haxel <haxel@fzi.de>,
 charlie@rivosinc.com
Subject: Re: [PATCH] riscv: Remove support for XIP kernel
In-Reply-To: <05290c17-d55f-4e60-a77e-c36c3f14a89a@redhat.com>
References: <CABe3_aH6jYyoC=Jx91qATP2kOoY42NUtesyZpGbWGoQTw75OAA@mail.gmail.com>
 <05290c17-d55f-4e60-a77e-c36c3f14a89a@redhat.com>
Date: Mon, 01 Jun 2026 10:26:40 +0200
Message-ID: <87pl2awtrz.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_012645_381942_9C861DCE 
X-CRM114-Status: UNSURE (   2.55  )
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

Jesse Taube-Perrotta <jtaubepe@redhat.com> writes:
> TLDR: Is re-adding XIP to no-mmu rv32 a possibility

Paul explained the requirements to keep XIP:

https://lore.kernel.org/linux-riscv/609b889a-8bb1-d2b5-8de6-ddeec27cac04@kernel.org/

Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
