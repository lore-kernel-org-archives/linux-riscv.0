Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 441ECC433EF
	for <linux-riscv@archiver.kernel.org>; Sun,  8 May 2022 18:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ujMjuA9OIbEwBiSSDviOZxt6BdDXU0MTkU3am+lkvNM=; b=og3+JR/xBsb03+
	xzg3d8xuhge621e6XmSphXcfkpmlfHNjeGFoc1qq+5me99MsqV2oq8iUn/DWeCPjDeNdXXe6AA/fS
	F/DeY66cG3CE4znfyMgV1UerU+Ez76paZT6B3ZW4psz48OEcUdbDthsSBs8hyiJtrVxE1EIcaSKCg
	tKh94w4sANMS1839NcCeW6IksbpUIJdgrdOc6s8Y2OY9BBrdHPXGgu1ccLqWUWrHK1ap1dmvUzlIu
	K/TnH1f0vzdApdKXvRwIWUoEGeqUeTAfVWBqeayL2U2PLk1hr03bLoHXWcFrfDay36C2DarmJFdda
	8HvDbpRqxu+/+oIHGq6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnlIU-00Ap6n-6r; Sun, 08 May 2022 18:06:22 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnlIK-00Ap5W-Rl; Sun, 08 May 2022 18:06:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=dXIZlnwHK15rrJZENweUDVLbVsO7X3h09BOXkfnZAVs=; b=BeB2FaaWyCXFJfYPOVlGrRxyyh
 JkDouCOTyf7MkyluZIxxnUmR87Z/DW0C77jKJIqfoUoI4nPE1ilfTi9PvRLwTXhJhdLROFvWDHHMp
 000VX4SrbogSTZvQ4ISTjHh4zNfXVtbK/k9ItAde5GaNKad/et01ucOFYnGCdxFOMk8ivYtMYUiOa
 LxiuMlpYfAy3bAi35IgiKblbkjCiRIRjJVG9azAjXg28jNJSRdKKWlpLRQquoU1LzZCBVcNqNjl2k
 T6r3MF4ww2+rXqRroJFYp5Aw18fci0MKTzKr92fIKjYfvoNR8En2Q9Oq1MQTSBonEX0blOhFfkm3u
 xJL5hOLA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nnlIH-002hid-TS; Sun, 08 May 2022 18:06:09 +0000
Date: Sun, 8 May 2022 19:06:09 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Kees Cook <keescook@chromium.org>
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jarkko Sakkinen <jarkko@kernel.org>, kunit-dev@googlegroups.com,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 live-patching@vger.kernel.org
Subject: Re: [PATCH v6 00/23] Rust support
Message-ID: <YngGkZTy+byxnD5n@casper.infradead.org>
References: <20220507052451.12890-1-ojeda@kernel.org>
 <202205070056.ACC3C3D@keescook>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202205070056.ACC3C3D@keescook>
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

On Sat, May 07, 2022 at 01:06:18AM -0700, Kees Cook wrote:
> On Sat, May 07, 2022 at 07:23:58AM +0200, Miguel Ojeda wrote:
> > ## Patch series status
> > 
> > The Rust support is still to be considered experimental. However,
> > support is good enough that kernel developers can start working on the
> > Rust abstractions for subsystems and write drivers and other modules.
> 
> I'd really like to see this landed for a few reasons:
> 
> - It's under active development, and I'd rather review the changes
>   "normally", incrementally, etc. Right now it can be hard to re-review
>   some of the "mostly the same each version" patches in the series.
> 
> - I'd like to break the catch-22 of "ask for a new driver to be
>   written in rust but the rust support isn't landed" vs "the rust
>   support isn't landed because there aren't enough drivers". It
>   really feels like "release early, release often" is needed here;
>   it's hard to develop against -next. :)
> 
> Should we give it a try for this coming merge window?

I'm broadly in favour of that.  It's just code, we can always drop it
again or fix it.  There's sufficient development community around it
that it's hardly going to become abandonware.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
