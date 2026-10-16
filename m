Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D17CC6B38
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Oct 2026 11:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=raqRcdYyEvykH/lK6lrEm7T/YoaV40BdBCLTHcIjPBU=; b=WfUcCmNEEsv1/3
	z5uP74JwdlTIMEBbBFrXIn46H/L0qbKDYVp2QJ3fy98n4Wx5ahBl1jiv/vyPPwsGBBP578+82BPkz
	sYJ28FxlLpKjgOBu0H5fPnimxbYJY8kD6vCYukDEzNqyimTU8kYisSJ8rhlsUZOsv9qgQRH6tKvAU
	9B92BZ4Cu2ePcmNe7qNQSf1jDpjnvpFsp+6snxyChCgj1MuMbjeue7xD1Vij6NTUXFY3XBnOqlq5A
	c0SUGC+ZvzEc9LVZIUfFWckkCWdm2hIQMoNVWEsZd72ucZE8PO5Kl+bLwoOCwVXqpAWqCvP1WJTdt
	Yd/W08IISMcrRaxg8MSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfrc-00000002kPa-37p6;
	Fri, 16 Oct 2026 11:12:40 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfra-00000002kOv-39Ad
	for linux-riscv@lists.infradead.org;
	Fri, 16 Oct 2026 11:12:40 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792149156;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BiAucDJOdHbgOxvk2bHgW2HCKHFZmpiOlKn7oPPHRW4=;
	b=nK+QqD3fJlSRw+Am2B7Edpl8sQ7cNZMoeR0LQseEP6yAwL+joPFL8pNV3lO9HHZBMZFBI+
	m9hv20PBtzsWSX4MnrwjqtF+P0zHK5CW+P5Vt5PnroxdxJriTaURy+yPb49VcyYpdf7goT
	SrQaR1mVQ8SZh64brkJO+EVifuDB1ovjN9INe5Vq8X2r+mZXSFoRItKHBAOBdWwj+Rxovx
	g63sqQUTWg0oSqExaV+mqvOL9Xcj3vSZYyXJqX+W0w+cHqSqHuii4uF483/QRErUuXeuAq
	tKt+H0Y8gTmUyZBSHHvSNbZunFodKPtgbz4KYQVmGva8f+V2m0o6UIL1Y/Dihg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792149156;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BiAucDJOdHbgOxvk2bHgW2HCKHFZmpiOlKn7oPPHRW4=;
	b=J2rA0tL6ohRzz70tVF2pdYnzyBo3YM7ZcHxpsKt+QF3kxgC0B+XR04GQANJmOiKcJRuAgd
	WuBqeegSorTFwWDw==
To: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
 Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
Subject: Re: [PATCH v3 1/2] riscv: kprobes: simulate nop and c.nop instructions
In-Reply-To: <20260902080817.681-2-yuanxiaofeng@eswincomputing.com>
References: <20260902080817.681-1-yuanxiaofeng@eswincomputing.com>
 <20260902080817.681-2-yuanxiaofeng@eswincomputing.com>
Date: Fri, 16 Oct 2026 13:12:35 +0200
Message-ID: <87mrsd5270.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_041238_931561_C31949F1 
X-CRM114-Status: UNSURE (   4.99  )
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

Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com> writes:
> +/*
> + * NOP and C.NOP have no variable fields, so all bits must match.
> + * NOP is encoded as ADDI x0, x0, 0 (0x00000013), C.NOP as C.ADDI x0, 0 (0x0001).
> + */

I don't think we need this comment. The other similar macros have no
explanation, and this information can be found in the riscv
specification.

With that removed:
Reviewed-by: Nam Cao <namcao@linutronix.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
