Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90CD3CA6019
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Oct 2026 13:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h3pRJiWBfFN4BAwo0eDTa9ixbNbpbl490kcURmqqLX0=; b=jPGyfb/+Sx3BDj
	iNhjP2sD/vB+sC3KcT/0ocUi1HMnS2SU7TV+LKb8OT5xvfjWT4wTMnwMFaMuetIj3SBoTKq7MwVJw
	u/4uU3vSH1958gz6ErjB0k//1wZMlfMQzEDQUQbud92dXvscBPuCDx010Zfq7QU9VES2rhCgnG8ab
	fC+JM0zZQNa+Wtek7h3t4qZ6D7TYu+r+8r5YYvpPXq4njf0ScTIdPIzsM1GyEPrA958UWNFwRKwIu
	YEM0JGhxXpB25UZJqvPBf378xfXEpFHO/w1kxTomDUzZ84Y39OEEhRPeBXqcH7Q9nDerhF78sF0m4
	ERE9sxR/Bq9fnveNUFAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFAVF-00000006MvI-1UOC;
	Fri, 09 Oct 2026 13:19:13 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFAVC-00000006Mth-2Cmc
	for linux-riscv@lists.infradead.org;
	Fri, 09 Oct 2026 13:19:11 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1791551945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kBE60rMCPEgiAkut9f/v34epmvZa38JP8A5EiZwjS2g=;
	b=adOaof7CNk4ivQU3Z5ThhiwJrMT31J1TusmhlHoQDnhPqobRbab+okjyz9g9G1AdJH2QFU
	zMNXj+UONh+rXs1qBGOqLlkwEM88QtL5ZkUbsadyL375R7A0DWanDZs/9hmmtWCJrqCcIP
	zxriTmkGkQYSMqK3I98NWYPuRk8vowSqlc/2fLjWLsUsZ6f8/Z30MqH/X7gEQhMRGrqATO
	a8UPNHgHwVr4F8HKcuEiEi1p3lO6NL07LP4rULuFRYUVFbGfgHyuPWDlfmwaXX0+HJ3nnZ
	Z1Fq2ndCawY87RNzOEkiGXhkSTYB6bAXQ+cH0MK2LaghDZEAPCqpdKuk/hDZOw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1791551945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kBE60rMCPEgiAkut9f/v34epmvZa38JP8A5EiZwjS2g=;
	b=BwUuYRvc/8zA9jROHv1dx8uouvZt6QIs0HFVeDHVg7aei2KJhr8OOvZ+HgAINYKqsYduQG
	wZh5TJlk0FBiMmDw==
To: Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] riscv: word-at-a-time: improve find_zero() for
 !RISCV_ISA_ZBB or no Zbb
In-Reply-To: <20260930124052.21986-2-jszhang@kernel.org>
References: <20260930124052.21986-1-jszhang@kernel.org>
 <20260930124052.21986-2-jszhang@kernel.org>
Date: Fri, 09 Oct 2026 15:19:04 +0200
Message-ID: <87se2f2erb.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_061910_715851_91457335 
X-CRM114-Status: UNSURE (   3.17  )
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
> What's more, the fls64() brings non-necessary zero bits couting for
> RV32. In fact, fls() is enough.

I think this is in here by mistake? There is no fls() in this patch.

Other than that, looks good:
Reviewed-by: Nam Cao <namcao@linutronix.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
