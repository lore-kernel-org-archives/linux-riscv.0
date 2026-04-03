Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84EC2E85389
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 19:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8ZRHBGQzfjUw1v7JX2bANr8DjWqCicjPs9PVGJaONE4=; b=d5Kv48y1p5ll9l
	j4a3iBmHUn6nlr1GYgBUZXelMggQHFQlHbSAHv1is2jIpQmxVbh/oh4FxAybkPm8kk3zEnUCih1Ni
	rGVOlUbGz0yuy3EppyIB5Kqei9QjAGeEcaZQvRjFfNCyrln6UEO9HVQwUTRXYBcqiNKZjgUia/A3M
	Pibcx3VRI9478REtP5yYgEGBLzyZsrLVHt+LrY4UkMUMn5Kj83WgjJ7KSIWCePWCen79YBFUWQqSi
	SVFpG5W9JBsXPwizjoBPXJf7MmsU77KkVsZ3mFZnKJblmdM51S6Bs8UwpxjYYnxO1UdTKR2rnOTu4
	kYAeSkkw4FeehOxszUMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8k9T-00000002TmR-1ZMC;
	Fri, 03 Apr 2026 19:25:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8k9R-00000002TmH-17ln
	for linux-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 19:25:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BFF9360008;
	Fri,  3 Apr 2026 19:25:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AE3DC4CEF7;
	Fri,  3 Apr 2026 19:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1775244350;
	bh=NmpXj9VMsBB2Tj36fh5OFZpo3WQh7MBaEHpGNX8D5ko=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PEr1KI2v+vmf3RugquLO2o7kiugPxMHsyzJdIIk/kzaqFqQUdIlQgJafieZjsz3Wh
	 +oSBE846cmkvs37cGmgyiB+CV1ldBUA00gJ8/I5ls51WjdMwvNzxEVgHyxxDXkLR36
	 qUhIL7XIlqzA5m7+IF6h9iuAU4UmHJVgEJLEWOf8=
Date: Fri, 3 Apr 2026 12:25:49 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, David Laight
 <david.laight.linux@gmail.com>, Kees Cook <kees@kernel.org>,
 "Darrick J . Wong" <djwong@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Nathan Chancellor <nathan@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v9 0/6] lib and lib/cmdline enhancements
Message-Id: <20260403122549.f05ed0edb667899d25de1e31@linux-foundation.org>
In-Reply-To: <20260403103338.1122415-1-dmantipov@yandex.ru>
References: <20260403103338.1122415-1-dmantipov@yandex.ru>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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

On Fri,  3 Apr 2026 13:33:32 +0300 Dmitry Antipov <dmantipov@yandex.ru> wrote:

> Adjust '_parse_integer_limit()' and 'memparse()' to not ignore overflows,
> extend string to 64-bit integer conversion tests, add KUnit-based test
> for 'memparse()', fix kernel-doc glitches found in lib/cmdline.c and
> adjust riscv32 linker script to export symbols needed for EFI stub.

AI review asked a few questions:
https://sashiko.dev/#/patchset/20260403103338.1122415-1-dmantipov@yandex.ru



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
