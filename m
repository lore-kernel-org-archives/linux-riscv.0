Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ECDBC77B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 24 May 2023 18:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mlPILeXR4Rv67hXpV7nJUG1yjWs4Elg1knZ4OsAtqFI=; b=LXOheZ1/WyoWpg
	OSqK5keSsOw5KwWILbYlt8eL+CAKArxf5/77xPA/aupdlYZfE4HrswRwjYdiqr8qULKWrwRpo9eYn
	Fx2AGDz/w9uY0gqgOz51hMEUhGPHwmItfwOexWb5xDonakfhtvZRqiFhZcOoHz1TiAIzJn9RzzcK3
	RHz5rpCry+g5ue80AXMxbqGkjCTdEAnW1tuOVz9w8Z8CIIIGe7y2kEjBC+1q3ieoo9LAEEAtVgyH/
	sWcPyPfvxsyjgb1UiRIznH3AFWUGHBBuardN0n4I+UjnzSYBe6nGZxvE2w7DZDnQ/EW/QJdYq9lpv
	JKJYX0lzC0ZF9A55cKOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1tXr-00EPYZ-1L;
	Wed, 24 May 2023 18:49:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1tXn-00EPWk-36;
	Wed, 24 May 2023 18:49:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2D5D76402E;
	Wed, 24 May 2023 18:49:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DB2DC433D2;
	Wed, 24 May 2023 18:48:57 +0000 (UTC)
Date: Wed, 24 May 2023 19:48:55 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>,
	Will Deacon <will@kernel.org>, Michal Simek <monstr@monstr.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, x86@kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Paul Moore <paul@paul-moore.com>, Eric Paris <eparis@redhat.com>,
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@linux.com>, Pavel Machek <pavel@ucw.cz>,
	Peter Zijlstra <peterz@infradead.org>,
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	audit@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
Subject: Re: [PATCH 13/14] thread_info: move function declarations to
 linux/thread_info.h
Message-ID: <ZG5cF6pYCoaLEvFH@arm.com>
References: <20230517131102.934196-1-arnd@kernel.org>
 <20230517131102.934196-14-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230517131102.934196-14-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_114908_062537_8DE1A6F8 
X-CRM114-Status: GOOD (  15.00  )
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

On Wed, May 17, 2023 at 03:11:01PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> There are a few __weak functions in kernel/fork.c, which architectures
> can override. If there is no prototype, the compiler warns about them:
> 
> kernel/fork.c:164:13: error: no previous prototype for 'arch_release_task_struct' [-Werror=missing-prototypes]
> kernel/fork.c:991:20: error: no previous prototype for 'arch_task_cache_init' [-Werror=missing-prototypes]
> kernel/fork.c:1086:12: error: no previous prototype for 'arch_dup_task_struct' [-Werror=missing-prototypes]
> 
> There are already prototypes in a number of architecture specific headers
> that have addressed those warnings before, but it's much better to have
> these in a single place so the warning no longer shows up anywhere.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

For arm64:

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
