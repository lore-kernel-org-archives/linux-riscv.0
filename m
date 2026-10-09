Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B9F0CA601E
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Oct 2026 13:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1WUogrOH8/7wy97S0CYAlC3QS6Erts1s0Ae3eUFAa8M=; b=zCBFFBmv50nrof
	f0QYOmbQbqS4h3mNaxxuOwq2U11tX2z6UGdr/W0icaU/ARKoyhLdQT94j0cf90l90Bm/hRC+Z2t44
	Ng1QOq4Ukv4WAfB13//1AlEe0fbkViXjs0iceD8PEzf9ErBCu7Ql2xtd6zOGS+sDgAlJhe958yoBW
	DrZXgL8+7hAHjwy6VfuGarxfxy8SITftKV6XDntLWvPHT3T+735QsVgu6LsHPWz+nx7C6aQHUMSMm
	mMqxUG4cZvf2wIrgPx16+xj/hm7WCoh/KRTng+7KRiqWHs4GtIDd+mK+FMHMg/naArXHY9a+axSJm
	waZk9zBVPPnkOfcCxOxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFAdx-00000006Nk4-47Fi;
	Fri, 09 Oct 2026 13:28:13 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFAdv-00000006Nj2-2qFT
	for linux-riscv@lists.infradead.org;
	Fri, 09 Oct 2026 13:28:12 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1791552489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pCExuXxs2juJDgOffh/1mFcLPGhM9NfXkks0pqF4CIM=;
	b=dj5WjoqWu1McyjdLTr0i4ogVoPh6o+1dxROajgfhJqIrFGzFl0NLZ862jZr+QftDSVye74
	bT4ZLSmRBuWiWfFNSkf6VfwT4pB0h9nRh2JIGgGBEuoXERmQCGUljF1tfyvr8zWUcOFute
	PhXtbJ2ZUR1a0fnyxDGysRQ9wXOSrLPm9wZ7UEwZwkVrOyhF1vq7GN/UbycgR98cDscSfQ
	5tKU+zA/VRPHAxC0yyKOnEXvqYJneHsBh5eSN6d7kIG8STZe+RpTUm/TKtkXa+OJY3rupN
	YQBUjj+SLTGEdPXvCTqEi5xGS7Fr5xSRdeZapJz9UP/2HsiRAPeBNYnMymIxog==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1791552489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pCExuXxs2juJDgOffh/1mFcLPGhM9NfXkks0pqF4CIM=;
	b=pNq7oWP6LzbYXw+/N1r9k3pT8webHbFJcga499IUxY9OIADZzwJCEbhc6/M+T7cVyaR+t/
	w8u7d/2fVuePvwDg==
To: Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] riscv: word-at-a-time: improve find_zero() for RV32
In-Reply-To: <20260930124052.21986-3-jszhang@kernel.org>
References: <20260930124052.21986-1-jszhang@kernel.org>
 <20260930124052.21986-3-jszhang@kernel.org>
Date: Fri, 09 Oct 2026 15:28:09 +0200
Message-ID: <87pkxj2ec6.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_062811_864607_C0F7DA94 
X-CRM114-Status: UNSURE (   4.20  )
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

Jisheng Zhang <jszhang@kernel.org> writes:
> To remove non-necessary zero bits couting on RV32, replace the
> 'fls64(mask) >> 3' with '!mask ? 0 : ((__fls(mask) + 1) >> 3);'
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

Reviewed-by: Nam Cao <namcao@linutronix.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
