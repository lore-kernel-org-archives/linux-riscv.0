Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 633FECD98F2
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jun 2026 15:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aGMjQJPNKth9qezIRp/wAzsPlnm8ZmvQA4vRSBZXM9s=; b=f51axiYNMyHODy
	wsTksE4u16/HhCzUqz9R8Kr+n0J38Z+q29Zc8QKrjIZkZe35fu5nG+ABZKh/lPgth2kkar575yksg
	VUR7V+DP+jN/7qa20v1ioFRDRzrUEKWAVMI/C4fuWTsTlfxj2mh3q+BVhPwPAqCkIV3zjUEREClqm
	NZwbx7rKOyG4QvwBKP7/Z+9+DDq+2YPurAJjDec/R4VxdSuYoPUEy4gVDXTiLcmQ47IADvI7d3etK
	IgzrsM2+X7kvq5/ywCl593PighaAUIrxk3jWe0HmXpz58Hg7vqNFItejuCtlVV6CFw2L9r9dyqzS7
	Tdj2VXa7pKSz3vdTJ1uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waEiR-00000001UUU-0C09;
	Thu, 18 Jun 2026 15:31:39 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waEiM-00000001UTt-2PFW;
	Thu, 18 Jun 2026 15:31:38 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1781796692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RAAaHoeh/MJumT7Jl018zpIQtLKmhwOXGGNn3ZLlRog=;
	b=f4b+IXkQhTwpjwvjeIS1sST2BLVtsjL1UEdnmxNOL3lPDXGXN8p4pBZTulWxnvylYeKVFG
	uGbMKdwi+CpjyDB9PBq7i6vVXxyG8S7BCgaClErdpvv1yr9NTz2M+bFLuy8zG75x1SYbaS
	I5Y9y3yuOPT48X3zoEALahwLSuvgH0Q8Z9+txzIcZmx49i0Hh3TBkpmj6sAJTM29MEshDP
	D2zBkkEYZ1hnAs7p/LoLBujaAGEGCdM4L0Z33LPyovOnyyDwz00riz8cpvuLnW8BW887CI
	zRIBZp7UkIF0mKRU2sNooS78DgPMPr5zjfTxECII4a6DfL3Lt7WcjsCvWBnliQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1781796692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RAAaHoeh/MJumT7Jl018zpIQtLKmhwOXGGNn3ZLlRog=;
	b=t2jc4irZweu5KNBW2cs9NoLMghLuOSyOya4gG6B0vbJPWT7FpL5OwzHy+GB23sGgly2aig
	sV+QDO9IaCT6MHAA==
To: Charlie Jenkins <thecharlesjenkins@gmail.com>
Cc: Charlie Jenkins via B4 Relay
 <devnull+thecharlesjenkins.gmail.com@kernel.org>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti
 <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Atish Patra
 <atish.patra@linux.dev>, Conor Dooley <conor@kernel.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Shuah
 Khan <shuah@kernel.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 04/16] riscv: kprobes: Use generated instruction headers
In-Reply-To: <ajOezhejx7PcOw_x@blinky>
References: <20260407-riscv_insn_table-v1-0-54b4736a1e77@gmail.com>
 <20260407-riscv_insn_table-v1-4-54b4736a1e77@gmail.com>
 <87jys5egum.fsf@yellow.woof> <ajOezhejx7PcOw_x@blinky>
Date: Thu, 18 Jun 2026 17:31:31 +0200
Message-ID: <87fr2jq2zw.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_083134_779881_8BDCB804 
X-CRM114-Status: UNSURE (   6.37  )
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

Charlie Jenkins <thecharlesjenkins@gmail.com> writes:
> Since I was checking against the previous version it's not possible to
> do a straight one-to-one conversion to the kunit. I think it might be
> possible to do something similar but I will need to mess with that to
> determine a good way of doing it.

Perhaps not to the existing kunit, but a new kunit which calls the
simulate_*() functions directly. Just an idea.

Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
