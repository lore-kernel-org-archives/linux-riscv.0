Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECDB9CCD184
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Oct 2025 10:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5FBiloEIKvcYSnOEvBzKCN75ljJVzZFhN3EfdO/ypGw=; b=GSKDS6y0q4vjBN
	+8rufVvOv2ZASjSK0HIptO3XRCtQP6N8HGKiuzAa4LG+l1BgDt37fWLuSaJKiRui0HcKogSn79i8q
	BbbX5V0DqMi5EerwfjrVv/4JhVtRERRZcNbCzk0/9Yrmz16fHFVPUEY+oGAvvXFIMHvZn3FvlkAyG
	YVfRxt2L222yt3BINbmuTE548/LqWzpRacw5aUSpW/LSP+mZyvOISGwX+HvEcT3ZrmhwhKOIYLUkH
	YUcs7XoafA6WpOD1YRHKxxufl/DgVd8iColtAZNlfVVDawLosLiGsPze7Y4RTRu8XeUbppzNrnzJp
	XlpyQJ/P+hqCr0/RDCLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB9iu-0000000Gdxx-0upX;
	Tue, 21 Oct 2025 10:36:12 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB9ir-0000000Gdwg-3fys
	for linux-riscv@lists.infradead.org;
	Tue, 21 Oct 2025 10:36:11 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1761042966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S+dbGUmxbEbdMP/TWbhqHELpgBFElFNdyMVOi0l1Qzc=;
	b=OEVnb6g1A4hxFzOx1dfcjSznDJOK5W6O+8YHkdabHDbum0Iqa+AQFjJ2tAvO+FwJ7j60M1
	JpNPjCq5xwkp4ZaYxwkXj4uMfQfB2zUqAM93k2dhrF2oN0LycPreJyg+FlzGQDa9bw35bV
	FWOvTzK2hgTzXqvXmGeBwl6V7hOihfsC2DBvMT5Xlb+h6CuE6SX6WBnQEfmP0ucTN8EyDI
	PEddOs1z8L7eMTVA62XA8d33cR4ikvEeTe4xgHggWBhmgl5izsvVwxLdQ8jWM4gKFX8MRA
	2ny8fs6bBjNoJB+EeSuoFte2S40qft+8+0fKLcV8A6YMK3J4VCAfjc/XhRcLgg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1761042966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S+dbGUmxbEbdMP/TWbhqHELpgBFElFNdyMVOi0l1Qzc=;
	b=YQdZEiU611GfzujG9zA5c99LvJyju8e/PyGZ9pBxWGOX73Jldv0y1iFFV6nrEq568p7xZZ
	Ew85d7OHK613UoAw==
To: Vivian Wang <wangruikang@iscas.ac.cn>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH 0/2] riscv: tests: Make RISCV_KPROBES_KUNIT tristate
In-Reply-To: <20251020-riscv-kunit-kconfig-fix-6-18-v1-0-d773b5d5ce48@iscas.ac.cn>
References: <20251020-riscv-kunit-kconfig-fix-6-18-v1-0-d773b5d5ce48@iscas.ac.cn>
Date: Tue, 21 Oct 2025 12:36:05 +0200
Message-ID: <87sefc1qzu.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_033610_071964_2F776785 
X-CRM114-Status: UNSURE (   3.95  )
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
Cc: Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org, Vivian Wang <wangruikang@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org, Yao Zi <ziyao@disroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Vivian Wang <wangruikang@iscas.ac.cn> writes:
> Fix an allmodconfig warning on v6.18-rc1:
>
>     WARNING: 3 bad relocations
>     ffffffff81e24118 R_RISCV_64        kunit_unary_assert_format
>     ffffffff81e24a60 R_RISCV_64        kunit_binary_assert_format
>     ffffffff81e269d0 R_RISCV_JUMP_SLOT  __kunit_do_failed_assertion
>
> While we're at it, rename the test to remove the word "test", in order
> to conform to the style guide.

Reviewed-by: Nam Cao <namcao@linutronix.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
