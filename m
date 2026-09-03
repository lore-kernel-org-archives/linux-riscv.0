Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E15C61DD3
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Sep 2026 09:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mdK5vK/Lk62fjuRAiwc91qqUAh3h/Z2K9iVL9ChRnrs=; b=13aDDU+eQ8uibj
	G5iDO7aZp9kLbzbug7D673HQwv7UcfY4xyELE1U3lHHKclNVPcpkeEBlk2j+lUtqTOFSgRAVen4Rg
	5Tnu/onSFT/nEfVI9jgBN3XqBz71D5Rd4bkuhOCG0oI/Y9M6NzABGOUCRsPl1Lgcxysx/swbPzgf4
	HB9UZRMDBmSB5azjFMWXX6x01FNoMvr8lihSj/hKocIoB6QK3zVcWxmLmiAJxBhaAma7LqIC2KQJM
	Xi+H2MyLU8s7+YoGpob1sqszduHmDLlkwgFVRxKXAe4i3eI6VOPSg/PDtDt4SMrgdK6/01nXQzw4R
	mEIioqDN0a4Wp/WxnyQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x23r4-0000000Gy3X-28Lb;
	Thu, 03 Sep 2026 09:35:34 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x23r1-0000000Gy2R-1cPx
	for linux-riscv@lists.infradead.org;
	Thu, 03 Sep 2026 09:35:32 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788428126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PM33iW7OW4NKtdKAErbkH3mAs7TCXum2IEh+cD8MfRM=;
	b=Y2/YIDW+aMlFj24h8P8hkDSlKQuRhCMAwS2aVaTaqlgEmHn74S+ViaMAe1yJ3/1BUg3RDN
	EsNi8sLuwP4NehdSJyvW/eWDXOt7/nWC+f3jyMPc4b0QDP2TEHJYS5drhsval1vnDLIUlb
	yXAFN/ujOnI6sY6LrXs/wp+86PTjCC82Bfv5ykpAiQs6jsetmHnEscjqNzYK+JcMkp+0iK
	f2u/A8r/Ce1vyIB7wbMO6UHjhFsgjGjL8iDmK2r+3AzPYkKg17OrNFS6XqHZlX46cchZfs
	sZugjgZwy0Zq+kQnwU4Tdl69vk6S/XMWEsUb+TX+pVdXdlw5xKlCOS7+jvvccw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788428126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PM33iW7OW4NKtdKAErbkH3mAs7TCXum2IEh+cD8MfRM=;
	b=RajjnPXIsYx7JpPK8elZtRhQvJja9POpxLrJ7NmXfYtrABSoKCr2z6ClMLkbp911LHuIOj
	71D80JH/O1UQO0Dg==
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] riscv: word-at-a-time: improve find_zero() for
 !RISCV_ISA_ZBB
In-Reply-To: <apZVwzxBD8Ih493W@xhacker>
References: <20260113122457.27507-1-jszhang@kernel.org>
 <20260113122457.27507-2-jszhang@kernel.org> <87mruh5h1m.fsf@yellow.woof>
 <apZVwzxBD8Ih493W@xhacker>
Date: Thu, 03 Sep 2026 11:35:25 +0200
Message-ID: <87a4py65k2.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_023531_575110_AFBAC07E 
X-CRM114-Status: UNSURE (   8.38  )
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

> On Thu, Aug 20, 2026 at 10:31:49AM +0200, Nam Cao wrote:
>> Jisheng Zhang <jszhang@kernel.org> writes:
>> > +#if !(defined(CONFIG_RISCV_ISA_ZBB) && defined(CONFIG_TOOLCHAIN_HAS_ZBB))
>> > +#include <asm-generic/word-at-a-time.h>
>> > +#else
>> 
>> Instead of this #if, would it be better to do
>> 
>> static inline unsigned long find_zero(unsigned long mask)
>> {
>>         if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB) &&
>> 	    riscv_has_extension_likely(RISCV_ISA_EXT_ZBB))
>> 		return !mask ? 0 : ((__fls(mask) + 1) >> 3);
>> 
>> 	return count_masked_bytes(mask);
>> }
>> 
>> and let compiler's dead code elimination does its job?
>
> This is impossible because the generic word-at-a-time.h implements
> the generic find_zero() itself, so there will be compile error.

Don't include word-at-a-time.h then? It compiles fine for me (obviously
count_masked_bytes() from PATCH 2/3 needs to be added first).

Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
