Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51CEFEBFD1E
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Apr 2026 09:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rW7fvZoO7rUp5nkQetLOXTLkeTlJOp2a/Bj6RYpH2GU=; b=wuexA1u8vzV8R5
	2uce86a/NZBnHkFf3We8ZbVWTj91tya65NghOW6mRv4Y9oPnjg52bzhPnxN4FThoCAqBpq1UB1Y8E
	h1uxdmzszVAB0WAmVWsDCz9KPeWLGJW3WtU4Rya840i07nr7iFZso4MoS51j1xReUwCVw0BkUKCsh
	06jw8DfYap9QlhMhKLubDa0FYyEjgMm1MulOr1IOVoNl2D1OZzcLzIirekiJUOLeeB1/m/cO2mR4U
	C0riMPVBj8BdOyadEA5pG7v9aN5/Hvmck1MNL7AtThmfX7D+pJXZiB0Z/REz/GebQ9Ml76YSOKLgX
	EqYjsojz7AnFOD2RVqIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCDAN-0000000FKCd-478I;
	Mon, 13 Apr 2026 09:01:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCDAM-0000000FKCF-1MwG;
	Mon, 13 Apr 2026 09:01:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3123160172;
	Mon, 13 Apr 2026 09:01:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57513C116C6;
	Mon, 13 Apr 2026 09:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776070868;
	bh=NmWTXdFZa2PXaXxihxiBwP6/fcqhMPMR8Odd5UUj3qI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bfyW73rEx6WunGZVvr1kdbuQhIZW0auQdr185ZFOdqezYfVI8EqIl4RV+jZMHErnf
	 HHqywW91vp7CVLzZ8tl9LuEsJL2nKmijW0OQ98WRnNBsFsW1LYo4ZFpZLLA1RAeRqi
	 fLF9xsDW37jcs+y2EAiBEgZnfjWYwDz/hvRsB2Ow2oVioAmoaeXLVkxbmWKx3ILDyy
	 OFKArZB3La00uc7rhVgunFkOn3bZFgPE1fuUov3rdMuNp+wqIMsO2YWxMIl1vusQFL
	 bBAU79v+8ddAl2Ytb2JX6K5ckn/0H32ur+wYUjKyGCCdFu1O+cEC54vJcUyB4ZJ+rF
	 y0fFboG7dTA8g==
Message-ID: <67c579d4-4e7e-4b3a-a2b9-7ba669664bdf@kernel.org>
Date: Mon, 13 Apr 2026 11:00:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch 14/38] slub: Use prandom instead of get_cycles()
Content-Language: en-US
To: Thomas Gleixner <tglx@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: linux-mm@kvack.org, Arnd Bergmann <arnd@arndb.de>, x86@kernel.org,
 Lu Baolu <baolu.lu@linux.intel.com>, iommu@lists.linux.dev,
 Michael Grzeschik <m.grzeschik@pengutronix.de>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
 linux-crypto@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
 Bernie Thompson <bernie@plugable.com>, linux-fbdev@vger.kernel.org,
 Theodore Tso <tytso@mit.edu>, linux-ext4@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, Marco Elver <elver@google.com>,
 Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Thomas Sailer <t.sailer@alumni.ethz.ch>, linux-hams@vger.kernel.org,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 linux-alpha@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org,
 Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>,
 linux-openrisc@vger.kernel.org, Helge Deller <deller@gmx.de>,
 linux-parisc@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>,
 linux-riscv@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>,
 linux-s390@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 sparclinux@vger.kernel.org, "Harry Yoo (Oracle)" <harry@kernel.org>,
 Hao Li <hao.li@linux.dev>
References: <20260410120044.031381086@kernel.org>
 <20260410120318.525653921@kernel.org>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
In-Reply-To: <20260410120318.525653921@kernel.org>
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

On 4/10/26 14:19, Thomas Gleixner wrote:
> The decision whether to scan remote nodes is based on a 'random' number
> retrieved via get_cycles(). get_cycles() is about to be removed.
> 
> There is already prandom state in the code, so use that instead.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: Vlastimil Babka <vbabka@kernel.org>
> Cc: linux-mm@kvack.org

LGTM.

Acked-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
