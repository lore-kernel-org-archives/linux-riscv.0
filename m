Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86078C25B0C
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Aug 2022 09:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M7L8nIGZ2Ao2YZGafgJP7/Ia5Q/fz1YvnNf62PeOFGg=; b=Xq7etAD4Uc6shy
	drDyLvR1QTjhNiko3OiKFnapCt/55cefYNATEhGnB7Ffk5CmaHGWjIOSLRDTAH6BHw7Iehurt9DBi
	aYXmylx0rSGbBHqEjUD51suuI7wOE91qTc3lOxg4KYhsZ480zzY2BTpgMolTKDQtJk9fhxIuSU0Z1
	gw4uwOwjTJaFp8LdDDJOtOlO+WiJ6wSbBDYVicjSZnx6KaFHfGPM/9QNHQc17YcdbwzEcWceYsMUV
	eIzX3qyzYeHgFDxsDIj5YILnbACclKB+q+hQEOu9isLgJ90UmNNcE45HrIhtOrptA4daQmKij7ZUy
	mDaH1uAUqCcvyTRsrXHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKz74-00Cfrr-Hx; Mon, 08 Aug 2022 09:31:54 +0000
Received: from gentwo.de ([161.97.139.209])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKz71-00Cfnp-EG
	for linux-riscv@lists.infradead.org; Mon, 08 Aug 2022 09:31:53 +0000
Received: by gentwo.de (Postfix, from userid 1001)
	id 35513B0031D; Mon,  8 Aug 2022 11:31:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.de; s=default;
	t=1659951104; bh=cAm0EF/td7pugO5S6hgTN1A7+5y0vwo9DxRBgMuNTBQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LDa2NTnVzPd6kEC7wusjeNwIM0cuMz+3R/iBHFN4COgE+Cvgj1cZmXpjCByFf0QIq
	 k1VkgeRGA0gooFKtOpta6BdcHZVyI/UBTAoC8T+eX32jzrsgxg36fLzKrfELVcegef
	 gMyRlSrKoNOYki+D+fSwK5IoV1YmGlKOLicYOKUMWq1UbD/vrj/FA9mWLQbtGmhmcu
	 UeGsOcrH7QJM8PGolvvaZnngGc4xqBgjjTcRMbhT6m3XWbKQWXCf01gC/wlGkr6Fto
	 TMxpGipWiOdiz0iZIdLKCwU0354++VdoKcyTQYv/r9lV5s0u5w/i5w8VO0hiceiGzc
	 f2LOzG6aMZA8g==
Received: from localhost (localhost [127.0.0.1])
	by gentwo.de (Postfix) with ESMTP id 327D9B00179;
	Mon,  8 Aug 2022 11:31:44 +0200 (CEST)
Date: Mon, 8 Aug 2022 11:31:44 +0200 (CEST)
From: Christoph Lameter <cl@gentwo.de>
To: Guo Ren <guoren@kernel.org>
cc: tj@kernel.org, palmer@dabbelt.com, will@kernel.org, 
    catalin.marinas@arm.com, peterz@infradead.org, arnd@arndb.de, 
    linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
    linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [RFC PATCH 1/4] vmstat: percpu: Rename HAVE_CMPXCHG_LOCAL to
 HAVE_CMPXCHG_PERCPU_BYTE
In-Reply-To: <20220808080600.3346843-2-guoren@kernel.org>
Message-ID: <alpine.DEB.2.22.394.2208081119230.411952@gentwo.de>
References: <20220808080600.3346843-1-guoren@kernel.org> <20220808080600.3346843-2-guoren@kernel.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220808_023151_942228_7C870A9B 
X-CRM114-Status: UNSURE (   9.13  )
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

On Mon, 8 Aug 2022, guoren@kernel.org wrote:

> The name HAVE_CMPXCHG_LOCAL is confused with using cmpxchg_local, but
> vmstat needs this_cpu_cmpxchg_1. Rename would clarify the meaning, and
> maybe we could remove cmpxchg(64)_local API (Only drivers/iommu/intel
> used) in the future.

HAVE_CMPXCHG_LOCAL indicates that cmpxchg_local() is available.

The term LOCAL is important because that has traditionally signified an
operation that has an atomic nature that only works on the local core.

cmpxchg local is used in slub too in the form of this_cpu_cmpxchg_double.

But there is the other naming using this_cpu.....

Maybe rename to

	HAVE_THIS_CPU_CMPXCHG ?

and clean up all the other mentions of "local" in the source too?

There is also a local.h header around somewhere

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
