Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8EE7F8D774
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Apr 2026 19:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y+sHYIdJlDPIPkUkLkCq1WIOA8Pbv4Uh4UkF+n2DF08=; b=nSchSvrsqB0aab
	h+2eG2fhC9oRBkRN0HHW/3ZUhVxexXQ9WHl98R7u0qbd7McZD2r8ILybP6oim25Wn0GvZ1N+lLsEA
	NcprGsERt+IsWpNcM1rdyRKPO/vRYcubdwzH1FFW/nfHSY9X7+V9As/gfsFPgea4Zxyg0X6fpglL0
	gDN/L2JTS+cYWgxzVnVxIuZptCWs/GVhs+Y0xCgVNUmAij2wcXfakG0AsCgw6i9kgt8Lh3oBphNew
	WUxXqNGC2EljvKZsQHqJLTiH4jomcTWcBmHLSyizwARrlleQHB7yqSOryRdtvgXa9oxpYPoAPjm6x
	zmY4SfU0+z0i14ZJUK3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDSSI-00000002tGD-3s54;
	Thu, 16 Apr 2026 19:32:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDSSH-00000002tFi-3fHS;
	Thu, 16 Apr 2026 19:32:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4CDE860128;
	Thu, 16 Apr 2026 19:32:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36E8AC2BCB0;
	Thu, 16 Apr 2026 19:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776367969;
	bh=92ERkl7IqZ3D3ZBskV2Dg9cLo0xCsyjyPbt0J7jJ1bo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Rw1vIfWy5g39RTrQBVfk7P8+0yZErGWNG5UA9/vEtpQjlFkvwDTSfy9DcHen7/CI1
	 yvB26rPsstyEixHeRP2kRFTYsbED9hoqdAx8pp9JCjVGtqsECj0BmLbEADz/j0Ea1z
	 cuKaCVwjWLvXDg/CryubhnWhKyfuiuUjmH8fhvqeL/w/0cvoWWHyuhgdCpeuqDPtkC
	 KhOKnJGX3lMBUei6zDvHwn/e429dg5HpUaKZZFagDf5a9Cwpgy1mEmtIvUBtm2UV8a
	 d3rsfZkg4WL5nt8ssrtLumcRxpUUuH7CR13mk1NCsH3yKQQbT7v7wh+ISgR1TJLd7z
	 vH5LnF1y8pygA==
From: Thomas Gleixner <tglx@kernel.org>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, LKML
 <linux-kernel@vger.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, x86@kernel.org, Lu Baolu
 <baolu.lu@linux.intel.com>, iommu@lists.linux.dev, Michael Grzeschik
 <m.grzeschik@pengutronix.de>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
 linux-crypto@vger.kernel.org, Vlastimil Babka <vbabka@kernel.org>,
 linux-mm@kvack.org, David Woodhouse <dwmw2@infradead.org>, Bernie Thompson
 <bernie@plugable.com>, linux-fbdev@vger.kernel.org, Theodore Tso
 <tytso@mit.edu>, linux-ext4@vger.kernel.org, Andrew Morton
 <akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>, Marco
 Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 kasan-dev@googlegroups.com, Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Thomas Sailer <t.sailer@alumni.ethz.ch>, linux-hams@vger.kernel.org,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Richard Henderson
 <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, Russell King
 <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, Catalin
 Marinas <catalin.marinas@arm.com>, Huacai Chen <chenhuacai@kernel.org>,
 loongarch@lists.linux.dev, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-m68k@lists.linux-m68k.org, Dinh Nguyen <dinguyen@kernel.org>, Jonas
 Bonn <jonas@southpole.se>, linux-openrisc@vger.kernel.org, Helge Deller
 <deller@gmx.de>, linux-parisc@vger.kernel.org, Michael Ellerman
 <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, Paul Walmsley
 <pjw@kernel.org>, linux-riscv@lists.infradead.org, Heiko Carstens
 <hca@linux.ibm.com>, linux-s390@vger.kernel.org, "David S. Miller"
 <davem@davemloft.net>, sparclinux@vger.kernel.org
Subject: Re: [patch 07/38] treewide: Consolidate cycles_t
In-Reply-To: <0758843e-8f75-4c82-b9c0-25fab502e62f@kernel.org>
References: <20260410120044.031381086@kernel.org>
 <20260410120318.045532623@kernel.org>
 <0758843e-8f75-4c82-b9c0-25fab502e62f@kernel.org>
Date: Thu, 16 Apr 2026 21:32:45 +0200
Message-ID: <87v7dqem5e.ffs@tglx>
MIME-Version: 1.0
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

On Wed, Apr 15 2026 at 08:43, Christophe Leroy wrote:
>> -typedef unsigned long cycles_t;
>> -
>> -static inline cycles_t get_cycles(void)
>> +ostatic inline cycles_t get_cycles(void)
>
> What is 'ostatic' ?

That's a really good question :)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
