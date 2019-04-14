Return-Path: <SRS0=nPG2=SQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D2B5C10F13
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 14 Apr 2019 14:29:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D8362084E
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 14 Apr 2019 14:29:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XOfBWkEW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=alien8.de header.i=@alien8.de header.b="Ai6QHIky"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D8362084E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=alien8.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WXh2rJUgNj6W0FQ0gUHLy+pla/kzos3ugkSjrwHUGQg=; b=XOfBWkEWZ+Sokv
	h7IhWFvhs3t5lunAJP3QYkhsiOc3D7R/QXQruq30XHq47Tmdxtnmkhc1u9TbF6NPXHFwL3Gp81fc3
	yIlGTQ2EzFfXTOqH/qmHilyaZv5DUpMhO2PDD1hzxXeKOdPpXn6/Z7zCMPgKuC6nY8ZpDeCLZzVv2
	W/1F7gJdHM6WxUjvmsQdV15X4j8SmjAwbBldvEJ34GX5Iw6utfUcyx1OWwDK8V1d6OqZGbCOIDMnU
	2JwEp1KRPWH0Cjhje219yxoq2sVMl6N8kD42VisAQ/5Mx1zilt4qzMgKJt3k5v0lfULyhKd8nSvyy
	lL6PiuvugGUou3R/xQdw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hFg8e-000805-LG; Sun, 14 Apr 2019 14:29:44 +0000
Received: from mail.skyhub.de ([5.9.137.197])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFg8a-0007zI-OA
 for linux-riscv@lists.infradead.org; Sun, 14 Apr 2019 14:29:43 +0000
Received: from zn.tnic (p4FED3D80.dip0.t-ipconnect.de [79.237.61.128])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 63AA31EC0104;
 Sun, 14 Apr 2019 16:29:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1555252169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=0tP6hoqtQENoly861EN4P78bPYJcM/3W36gOx1YTfWw=;
 b=Ai6QHIkyw2+/p1QNjJ0JSEz5HX+07Bkj/1NoSgV8QMZclo819VtGsPRNCr9/nRJejMd12r
 jlod7Ujap5RMfGuMyu0ATt4c7LJodVRyjOmaYD6czyFJv0xYsl/mQWwq2/nCKynWzcv7hI
 VKyuCuGiLsz/5jx9wTrWhbH8DpgCQj0=
Date: Sun, 14 Apr 2019 16:27:09 +0200
From: Borislav Petkov <bp@alien8.de>
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [1/3] x86: Update DEBUG_TLBFLUSH options description.
Message-ID: <20190414142709.GA569@zn.tnic>
References: <20190410224449.10877-1-atish.patra@wdc.com>
 <20190410224449.10877-2-atish.patra@wdc.com>
 <20190411065617.GA29422@infradead.org>
 <580d95d1-224f-a372-c656-1d2cbb19d868@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <580d95d1-224f-a372-c656-1d2cbb19d868@wdc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190414_072940_935288_BF33F3C9 
X-CRM114-Status: UNSURE (   9.07  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Palmer Dabbelt <palmer@sifive.com>, Anup Patel <anup@brainfault.org>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>, Gary Guo <gary@garyguo.net>,
 "H. Peter Anvin" <hpa@zytor.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Ingo Molnar <mingo@redhat.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Apr 12, 2019 at 01:14:54PM -0700, Atish Patra wrote:
> On 4/10/19 11:56 PM, Christoph Hellwig wrote:
> > Given that this option enables generic code (which you reuse for RISC-V
> > later in this series) please also move the config option to
> > mm/Kconfig, proabbly keyed off another ARCH_HAVE_DEBUG_TLBFLUSH
> > symbol that the architecture can select.
> > 
> 
> Sure.

And when you do that, instead of deleting the help text, make it
generic. Otherwise, there's no explanation anymore, how that option is
supposed to be used through tlb_flushall_shift.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
