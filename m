Return-Path: <SRS0=oGbN=MC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5CA8C07E95
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Jul 2021 21:31:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C3E96135B
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Jul 2021 21:31:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C3E96135B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7RKOwpAe2WwB4GNi3FAtcTRF02v5BIpPYQLuyjwNIMI=; b=nhDKEoTWOr3x8p
	IcyvHrrQyamEDHO9UN9Tf1Jm+Hp5/C1pmD+PeUCfAzh6WdmlOlTd7znG/MRs7lPOhYmBItGmZdX80
	fCGX5BAusV1YQXYyK2EBWnHeVqM0V/aK4576LomVH6d+4PVMd3zixh89G7LHZXH3egrD7Zzn4ld1x
	T2CtIiS7hjmOXNUsno5JewmFpuZAFcbcKFrCgfPjNY5XnrzwD8EvmJpv7ISRuOBJyExaisAV3Ne8E
	NfAyzDpHH0Fv0Ok4UB0LCm3QTIiWnUnS9c+PomjVF7heRJSkxBc8EaCKr+hK0Q5gmwkL08E9EK9Zt
	HzG0QX6yhNV45QyVgl4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2KZ8-004BEF-CX; Sat, 10 Jul 2021 21:31:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2KZ5-004BDc-IO
 for linux-riscv@lists.infradead.org; Sat, 10 Jul 2021 21:31:12 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 318D661353;
 Sat, 10 Jul 2021 21:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1625952670;
 bh=BhBrfVjiyW6tp+kvAEQqA+E6E0jDxEmrABGM+LD2iDE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YumewwPz/9BP0RTGzpUxeqL4PJJ4OfJkwnfq1BY5RJzjIZuRPzCzTJQlke7FWeRex
 l+9/3WdNu6ozxDiKthf+6mHMStX4b4pkvnMW+/rCy5B1+t+v2Mx78IXMh809uXo2zb
 CslWQUnTE4guJikE8f/uBeNbhimRkTvWYDzXUYmY=
Date: Sat, 10 Jul 2021 14:31:09 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Matteo Croce <mcroce@linux.microsoft.com>
Cc: linux-kernel@vger.kernel.org, Nick Kossifidis <mick@ics.forth.gr>, Guo
 Ren <guoren@kernel.org>, Christoph Hellwig <hch@infradead.org>, David
 Laight <David.Laight@aculab.com>, Palmer Dabbelt <palmer@dabbelt.com>, Emil
 Renner Berthing <kernel@esmil.dk>, Drew Fustini <drew@beagleboard.org>,
 linux-arch@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 0/3] lib/string: optimized mem* functions
Message-Id: <20210710143109.fd5062902ef4d5d59e83f5bb@linux-foundation.org>
In-Reply-To: <20210702123153.14093-1-mcroce@linux.microsoft.com>
References: <20210702123153.14093-1-mcroce@linux.microsoft.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210710_143111_711822_C82643D8 
X-CRM114-Status: GOOD (  12.01  )
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

On Fri,  2 Jul 2021 14:31:50 +0200 Matteo Croce <mcroce@linux.microsoft.com> wrote:

> From: Matteo Croce <mcroce@microsoft.com>
> 
> Rewrite the generic mem{cpy,move,set} so that memory is accessed with
> the widest size possible, but without doing unaligned accesses.
> 
> This was originally posted as C string functions for RISC-V[1], but as
> there was no specific RISC-V code, it was proposed for the generic
> lib/string.c implementation.
> 
> Tested on RISC-V and on x86_64 by undefining __HAVE_ARCH_MEM{CPY,SET,MOVE}
> and HAVE_EFFICIENT_UNALIGNED_ACCESS.
> 
> These are the performances of memcpy() and memset() of a RISC-V machine
> on a 32 mbyte buffer:
> 
> memcpy:
> original aligned:	 75 Mb/s
> original unaligned:	 75 Mb/s
> new aligned:		114 Mb/s
> new unaligned:		107 Mb/s
> 
> memset:
> original aligned:	140 Mb/s
> original unaligned:	140 Mb/s
> new aligned:		241 Mb/s
> new unaligned:		241 Mb/s

Did you record the x86_64 performance?


Which other architectures are affected by this change?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
