Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E00C5DF6D
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Aug 2026 11:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2WecMd+1vLiyKB57BH8uIxATc9JF8nZJBFfVuAPt7Zo=; b=N6ijllBUJBf4WO
	T+x6PSwzs8dK4V33nIrR/xDlaJvHczTUyzkaYmePf4WiV+qJA1YMVt/kh5ifmKzsNVxd2JD7NzMWa
	LmM4NY9XnMoTaKqcpoanVYg5wM2OUDfb8xAIqNgOyCJaxLs/WTKbST/othdS2dJzynSrnJfPTFnlY
	jYuSjW/CJZl+f/vMGnUQSTGXMFMh8miMDk+Fk8AXVKlbHlYYy9xAuZlgGZq13aParAj22tnvgmmxt
	3qtIN3MhjTtm6GndJCHACOuQ0ikg5rmBG/Jrm6KBbmh7C1zXcTKrn/RQUNwREXcasr4YrK7k1awp5
	Cl4Rp0nZmlUellcPwzJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwevu-00000009iOV-2OWK;
	Wed, 19 Aug 2026 11:58:14 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwevr-00000009iNm-2gDN
	for linux-riscv@lists.infradead.org;
	Wed, 19 Aug 2026 11:58:13 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1787140689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lZM57mlbpa0ycSUPEGb6oUYhL2Ovw+6EhWgqL5gJiHk=;
	b=iiRpRDrchuzJltAt5+xfeZA1GwZp2ENrNFDmHhiFp9SlqwcAs5pPTZtWA4BVBrnZ8khmfs
	DwuXf2kNSUsW5JQwjhDOLjJgM78rWcTDNo8rZx4XtRNGvuVac2bTR33XWJehW+iM/8SIgo
	D2VxI2zWKJsdZMBUADs977l3lig+hq6eshrnAKWkd6qorZhiLqKztSlW3CqHKgx/H9mgQo
	qGZ518Pap9gFNUUfR3b5JYpchH+p1FQJqBPjyyawsUN/BLKzkcb8Xt5JSGVLPARcqyfr7R
	TmxezK5eASKBzVnXLBnYUtgv8coOcKydSsyRRwfQJBDYTAeIauFP6AOJFYltJQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1787140689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lZM57mlbpa0ycSUPEGb6oUYhL2Ovw+6EhWgqL5gJiHk=;
	b=5M3FQLd/DYkJbg//q8RHlIqJ8VLAJfJX74mIZG2XtCDCOziB6G8ffYqWuNIxN7qkiE3TGs
	ACt36RB4mgSvlLDA==
To: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Nam Cao <namcaov@gmail.com>,
 linux-riscv@lists.infradead.org, yuanxiaofeng@eswincomputing.com
Subject: Re: [PATCH 2/2] riscv: kprobes: add nop and c.nop to the KUnit test
In-Reply-To: <20260819101419.1367-3-yuanxiaofeng@eswincomputing.com>
References: <20260819101419.1367-1-yuanxiaofeng@eswincomputing.com>
 <20260819101419.1367-3-yuanxiaofeng@eswincomputing.com>
Date: Wed, 19 Aug 2026 13:58:09 +0200
Message-ID: <87wltml3u6.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_045811_995527_1406C0F3 
X-CRM114-Status: UNSURE (   4.33  )
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
> +SYM_FUNC_START(test_kprobes_nop)
> +	.option push
> +	.option norvc
> +test_kprobes_nop_addr:
> +	nop
> +	.option pop
> +	li a0, KPROBE_TEST_MAGIC_LOWER
> +	li a1, KPROBE_TEST_MAGIC_UPPER

I split the magic number into _LOWER and _UPPER because I wanted to
validate that two instructions in two different code paths are both
executed.

For this simple case, we can just use KPROBE_TEST_MAGIC.

Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
