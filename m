Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F25EB64D9
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Jul 2023 19:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aeSG3ejgnR946Zl1+/EtaEmy9XfT6IZp8GyanwMb7eE=; b=yi61SnxsxhSLWF
	VPRApF0kGL1Uarh4GccovnQZc/jvjjrZMPJZ9iPQiDh9h07OHsE0hF2LjtE/ix4YZsaSlHqcjG+L/
	YPuqQB8lHF2QDHMgQVAl7vEEhKndOCii1DOtcwyEF8Vz78kEgVSLzaPPhGBqUsfW4MXEEy6EkPnmg
	uGMmC4NVHfZ41UGKOU8+BT05CCGWjYmUilNiiWOBilfEr3PAjX6wHbdNAu71OKYn6eFtEpUkcwAoL
	6+BerMpHjH52AydoCONoV7A4znPmeqefDwxTobgszGcP6OG6sOY9xilZkew/NnhvyKrYjOO2+GPre
	Rxxhu66XWpJPlpHnFVzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qG2Zo-008S0c-2e;
	Sun, 02 Jul 2023 19:17:40 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qG2Zm-008Rzz-17
	for linux-riscv@lists.infradead.org;
	Sun, 02 Jul 2023 19:17:40 +0000
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 362JHXHa017494;
	Sun, 2 Jul 2023 21:17:33 +0200
Date: Sun, 2 Jul 2023 21:17:33 +0200
From: Willy Tarreau <w@1wt.eu>
To: Zhangjin Wu <falcon@tinylab.org>
Cc: thomas@t-8ch.de, arnd@arndb.de, david.laight@aculab.com,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 10/14] tools/nolibc: __sysret: support syscalls who
 return a pointer
Message-ID: <20230702191733.GI16233@1wt.eu>
References: <cover.1687957589.git.falcon@tinylab.org>
 <72d948095d22c3ba4e69d98877addcea49a326c6.1687957589.git.falcon@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <72d948095d22c3ba4e69d98877addcea49a326c6.1687957589.git.falcon@tinylab.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230702_121738_832686_841D75FF 
X-CRM114-Status: GOOD (  19.80  )
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

On Wed, Jun 28, 2023 at 09:39:56PM +0800, Zhangjin Wu wrote:
> To support syscalls (e.g. mmap()) who return a pointer and to allow the
> pointer as big as possible, we should convert the negated errno value to
> unsigned long (uintptr_t), otherwise, in signed long, a potential big
> pointer (whose highest bit is 1) will be treated as a failure.
> 
> tools/include/nolibc/errno.h defines the MAX_ERRNO, let's use it
> directly.

It might or might not work, it's an ABI change that, if validated, at
least needs a much more detailed explanation. What matters is not what
errno values we're willing to consider as an error, but what the
*syscalls* themselves return as an error. If a syscall says "< 0 is an
error equal to -errno", it means that we must treat it as an error,
and extract its value to get errno. If that errno is larger than
MAX_ERRNO it just means we don't know what the error is.

Syscalls that return pointer use that -MAX_ERRNO range to encode errors
(such as mmap()). I just do not know if there is a convention saying that
other ones also restrict themselves to that range or not. If you find
some info which guarantees that it's the case for all of them, then by
all means let's proceed like this, but in this case it should be mentioned
in the comment why we think it's valid to do this. For now it's presented
as an opportunity only.

Also, the rest of the commit message regarding uintptr_t (which we don't
use), bit values and modular arithmetics is extremely confusing and not
needed at all. What matters is only to know if we need to consider only
values -MAX_ERRNO..-1 as error or all negative ones. If so, then it's
obvious that ret >= (unsigned long)-MAX_ERRNO catches them all, as the
current mmap() function already does with -4095UL.

I just don't know where to check if we can generalize that test. In the
worst case we could have two __sys_ret(), the current one and a second
one for pointers. But I would suspect we could generalize due to ptrace,
as there it makes sense to be able to detect failures, even unknown ones.
I just need something more convincing than an intuition for a commit
message and to take such a change :-/

Thanks!
Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
