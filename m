Return-Path: <SRS0=vGgu=OS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67773C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Sep 2021 00:17:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CA97610A2
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Sep 2021 00:17:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2CA97610A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=67a2AtG09xmNJ/qFlOkKiQj/T581VKDtd7xkWsIKBVo=; b=xkTf3qKTYghQ1b
	9FGKvPsaYXxgId8NFHdhZZ5PVV0xwovWN/+eQ24/li77C3rfPeQPiyswU40HLP1tbSHWUyjc0w45C
	ilpYC4f+HNwWkTuvY9XONZGhpU3XuGtgMLtDV6Ux+W9ZcOtJ1yV9vFj9IS4mxRJfNCJcM5LDOnaK3
	JbDfYm6jB1Ts4Z95OXZsZcfnu7EoscS+4D5AmqX0wbBEU5zNEkuvpVNenHzGCbjUB0jgfZ6HdkiQ1
	zrZqCeKh+jOoHtzRqK1mNqIze3U/uHZIpBfFjtlvcCHsu+beDdEMt9P3e/N/TOZMM8rzsLYbrDMBM
	+B9LVerWzBi0ikIWlXqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mV0nV-004zb1-Hf; Tue, 28 Sep 2021 00:16:37 +0000
Received: from gandalf.ozlabs.org ([2404:9400:2:0:216:3eff:fee2:21ea])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mV0nH-004zYY-VR; Tue, 28 Sep 2021 00:16:25 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HJKmX5spJz4xLs;
 Tue, 28 Sep 2021 10:16:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1632788176;
 bh=40Qjcb8alQIKNQ7ovWDvb3uMDNOj6u2mSouvybd+c8U=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=YE4vK5P9YiusbQolaISGGqbw4MSmlgr0kC9O4dDE4vhOWZ2Fmo0BVq9wmxsDcZ3hV
 W80h/uxllRg+IcULCeIMjbu3sqqPuAPrhZu9NMVfNoCPQsrpi2y4ER2uyYZY/53m0D
 fzEBhgCmKTGrvLM/c7bXFjD8K1vu/5nMylk9VLD1Z2g4eAhWey750rJgPZlLTesnu1
 rIaQj9Am5NVESisHbWmUMdEJgSwf5cPVGlWxWbpytvh99D8VzQKASAnBo3Awc53QqK
 yX8rx2Tk57NXkKKqSY+WGSvevVjmx5jEYC5fZ/F48e11+PeLesWlKR8my9tSeWcRt+
 yTiwhk81hk9gQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Ard Biesheuvel <ardb@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Cc: Keith Packard <keithpac@amazon.com>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Paul Mackerras <paulus@samba.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Christian Borntraeger
 <borntraeger@de.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra
 <peterz@infradead.org>, Kees Cook <keescook@chromium.org>, Andy Lutomirski
 <luto@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Arnd
 Bergmann <arnd@arndb.de>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:LINUX FOR POWERPC
 (32-BIT AND 64-BIT)" <linuxppc-dev@lists.ozlabs.org>, linux-riscv
 <linux-riscv@lists.infradead.org>, "open list:S390"
 <linux-s390@vger.kernel.org>
Subject: Re: [RFC PATCH 4/8] powerpc: add CPU field to struct thread_info
In-Reply-To: <87ee99lii7.fsf@mpe.ellerman.id.au>
References: <20210914121036.3975026-1-ardb@kernel.org>
 <20210914121036.3975026-5-ardb@kernel.org>
 <CAMj1kXEojbQbNzCP39KT4EzFAyW3J1Tfm_stCZ+fGo8_SO90PA@mail.gmail.com>
 <87ee99lii7.fsf@mpe.ellerman.id.au>
Date: Tue, 28 Sep 2021 10:16:10 +1000
Message-ID: <87pmst1rn9.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_171624_198506_26097FCE 
X-CRM114-Status: GOOD (  14.50  )
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

Michael Ellerman <mpe@ellerman.id.au> writes:
> Ard Biesheuvel <ardb@kernel.org> writes:
>> On Tue, 14 Sept 2021 at 14:11, Ard Biesheuvel <ardb@kernel.org> wrote:
>>>
>>> The CPU field will be moved back into thread_info even when
>>> THREAD_INFO_IN_TASK is enabled, so add it back to powerpc's definition
>>> of struct thread_info.
>>>
>>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>>
>> Michael,
>>
>> Do you have any objections or issues with this patch or the subsequent
>> ones cleaning up the task CPU kludge for ppc32? Christophe indicated
>> that he was happy with it.
>
> No objections, it looks good to me, thanks for cleaning up that horror :)
>
> It didn't apply cleanly to master so I haven't tested it at all, if you can point me at a
> git tree with the dependencies I'd be happy to run some tests over it.

Actually I realised I can just drop the last patch.

So that looks fine, passes my standard quick build & boot on qemu tests,
and builds with/without stack protector enabled.

cheers

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
