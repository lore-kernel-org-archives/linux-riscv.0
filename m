Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8029C61DF4
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Nov 2023 13:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z9njEnzO+2egQE6aaZBipMbUJ44nZV1xPtsoBJLFM8E=; b=jERhCMlspEWbGi
	/vPmUrsdzq4iG5gL166CMgFPE2pw44qtt/XRtjd5NbdPM0pApDC0ijRZIyX55qsAQ0PZsX145Ajuq
	fZSRjWYxJoYzojOwKRdxcuyE7wwiZlEgsUZ5rkqO/Mi6wDe7CbDxpgXY6Fv4czm7lqylrsBfjIKiM
	e9j9gyVG4cTaimRWrrg7i+6v8c3WdUPC3vUE13YxKj1z+/UVMVZlWO+FYRja5Zy5CIW+GOGYWpIRN
	RyAh8fiuWnpeBzx4nAVEVIlcdxG0iZO2WE7OzRCHDYAkXI1tYmnz1jLs71zhxsFV1GB6Sb8ze8Blh
	tqhOzdljl0EzDMAfoKvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6VsG-007Gih-0Q;
	Fri, 24 Nov 2023 13:05:36 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3] helo=gandalf.ozlabs.org)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6VsD-007GhY-2s
	for linux-riscv@lists.infradead.org;
	Fri, 24 Nov 2023 13:05:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1700831128;
	bh=6Y8qQKiNapfxIiyPU0awITssjjLEv8Lqe9dkOsuewfU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Muf2VTywqEgHzegB/nAYDtxju24jHb7b6xljhCIq+59yo1LqKOiMI8hHN6TIOQj/t
	 JOZD4Ol4zOUuz//nId6dzwBldfv9dLBQoc4UI5Dp3ykNfbtRGTdZzdEzf9Y6v0Wg1O
	 0VXZwf9FDnMLX+W/BaGAdfkK1N0pQBZKgeAA33boLATaOM+7T7QOo3aNyvWElDUhN2
	 jmnA8eUVZfkfo9aeoHFOMrzbRMCT4mu+SyCm18IPUmCOPybpxWQ4rJsG6sKGgTwQBt
	 ewBl8pQYuqBGWOSUCH2d7wN8BzI3M2I5i/g2OjApQ8plVpz84DtFeRrbzd0DwlcHVz
	 pa11Xh/2NXhTQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ScFZm6CGZz4xNt;
	Sat, 25 Nov 2023 00:05:20 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Peter Zijlstra <peterz@infradead.org>, Jonas Oberhauser
 <jonas.oberhauser@huaweicloud.com>
Cc: Christoph Muellner <christoph.muellner@vrull.eu>,
 linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Andrew Morton <akpm@linux-foundation.org>, Shuah
 Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Anup Patel
 <apatel@ventanamicro.com>, Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Andrew Jones <ajones@ventanamicro.com>, Guo Ren <guoren@kernel.org>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, Conor Dooley
 <conor.dooley@microchip.com>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Alan Stern
 <stern@rowland.harvard.edu>, Andrea Parri <parri.andrea@gmail.com>, Will
 Deacon <will@kernel.org>, Daniel Lustig <dlustig@nvidia.com>
Subject: Re: [RFC PATCH 0/5] RISC-V: Add dynamic TSO support
In-Reply-To: <20231124115430.GS3818@noisy.programming.kicks-ass.net>
References: <20231124072142.2786653-1-christoph.muellner@vrull.eu>
 <20231124101519.GP3818@noisy.programming.kicks-ass.net>
 <59da3e41-abb3-405a-8f98-c74bdf26935b@huaweicloud.com>
 <20231124115430.GS3818@noisy.programming.kicks-ass.net>
Date: Sat, 25 Nov 2023 00:05:16 +1100
Message-ID: <87plzzqp2r.fsf@mail.lhotse>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_050534_169517_8207823B 
X-CRM114-Status: GOOD (  17.14  )
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

Peter Zijlstra <peterz@infradead.org> writes:
> On Fri, Nov 24, 2023 at 12:04:09PM +0100, Jonas Oberhauser wrote:
>
>> > I think ARM64 approached this problem by adding the
>> > load-acquire/store-release instructions and for TSO based code,
>> > translate into those (eg. x86 -> arm64 transpilers).
>> 
>> 
>> Although those instructions have a bit more ordering constraints.
>> 
>> I have heard rumors that the apple chips also have a register that can be
>> set at runtime.
>
> Oh, I thought they made do with the load-acquire/store-release thingies.
> But to be fair, I haven't been paying *that* much attention to the apple
> stuff.
>
> I did read about how they fudged some of the x86 flags thing.
>
>> And there are some IBM machines that have a setting, but not sure how it is
>> controlled.
>
> Cute, I'm assuming this is the Power series (s390 already being TSO)? I
> wasn't aware they had this.

Are you referring to Strong Access Ordering? That is a per-page
attribute, not a CPU mode, and was removed in ISA v3.1 anyway.

cheers

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
