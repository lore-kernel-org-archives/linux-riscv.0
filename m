Return-Path: <SRS0=Z6yX=OZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39968C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Oct 2021 00:51:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4AC6613B5
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Oct 2021 00:51:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E4AC6613B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3TQduFOnuIDcV8m4z8kZwbnYNGE22ukkoDOGR3pzMSI=; b=oOSGaFxXeBKWsg
	+Ki9nxDRLSUMp7YP9PkN8sKe+8alCDX8+zAOJIun3mz9NdawMQk8FRWxBaPNDKXe+jnO8cfSkNBka
	jFbn6wOMkXTEygorbd289QouoTVlufIxr8b3elO1ZtFGMVRyma5TD2UaXFsplxyonIRl7cayHP9xF
	R/nTuEccc8BxytDtpClSStCvNpYNRtW32FvNKhfeW4DwBBjLlqoweucf6YIfQysgQeJBUs6kAIa2F
	OGkHbCam5Q3V1HXUjgIh68Nb8KML8rmWzXqITPhQEzRUs1RX6DJS4afcd1Umy5NjrGWKecQrzXtNr
	cHdXYsc8IxtQr4DuUfQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXYfT-008U1R-Kj; Tue, 05 Oct 2021 00:50:51 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXYfR-008TwA-K3
 for linux-riscv@lists.infradead.org; Tue, 05 Oct 2021 00:50:50 +0000
Received: by mail-pg1-x531.google.com with SMTP id r2so18199533pgl.10
 for <linux-riscv@lists.infradead.org>; Mon, 04 Oct 2021 17:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=SEKA9eUvQTNrOEU0fVe9Oqo1M4Yd25Z/pj7b5KUJKIM=;
 b=WWWCnRoDUJPBY3ffxH06sF9uD9/8LAHeZ8/v8jzQmn3oDFDRtqjZjLRsuPlQTzwuXD
 1wH/q28vROmEvvplL7fs98Bp3waAHcYjtqW6AL3lannRpc98Vd0HSVMK6FTYvIGyyezB
 N1TvpFzrCX7j9hw6W9zfVzJLtyXZo9WiPYBvA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SEKA9eUvQTNrOEU0fVe9Oqo1M4Yd25Z/pj7b5KUJKIM=;
 b=ED8Yd2SIZeb6tlCjBprY8P4UVl+gMKXM218bk8KLDHXHjrEXzMZP82coaeZT2v+Qvr
 QGqsKsNG6g6Z83N22WenouQCpt7MBHfKhQnFC6p1eRtVLDxqoD7tWTccSSxNn9pTHigv
 YpuXQ2jcBScebzhYMjuSO3sibpEXLaNcqZCzL3QWaX3hQr+hZ/cTYtwYuKXNJ4KPBH8E
 vEAg1iue/n26H4sULJsLRWLqr9/3fB6kEX7Jl3cTIRryE7kPB9+4+CGGvv0bprxsnYDG
 W9IhPLGlZa2GwQWF0kSfudZrV44hDmmqvJ40K/03yRfjOHF8S1o3TP7BedCOtWDoKWan
 JR9w==
X-Gm-Message-State: AOAM530Ger8btOVr1oeqGV40ODNT7Y+XRftX07tpxjwKxSBRsjcBkLgl
 6lHoiyn69ymu4cuBfi1l6AJypw==
X-Google-Smtp-Source: ABdhPJxtStb/HuVbBznifn02CPo2ct45dVitFgpYgXK80binzVlQ/40jVorsYKbUDcKXdgARfQO4bg==
X-Received: by 2002:a63:b448:: with SMTP id n8mr13690353pgu.31.1633395047522; 
 Mon, 04 Oct 2021 17:50:47 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id i128sm5884418pfc.47.2021.10.04.17.50.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 17:50:47 -0700 (PDT)
Date: Mon, 4 Oct 2021 17:50:46 -0700
From: Kees Cook <keescook@chromium.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: ndesaulniers@google.com, akpm@linux-foundation.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux@rasmusvillemoes.dk, nathan@kernel.org, masahiroy@kernel.org,
 joe@perches.com, arnd@kernel.org,
 Stephen Rothwell <sfr@canb.auug.org.au>, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH 05/10] riscv: remove Kconfig check for GCC version for
 ARCH_RV64I
Message-ID: <202110041750.C90595D1@keescook>
References: <202109130923.E294BFD5C@keescook>
 <mhng-387507df-2708-4ea1-9854-780fcb35eb1d@palmerdabbelt-glaptop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-387507df-2708-4ea1-9854-780fcb35eb1d@palmerdabbelt-glaptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211004_175049_743170_51523E03 
X-CRM114-Status: GOOD (  14.39  )
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

On Mon, Oct 04, 2021 at 05:40:42PM -0700, Palmer Dabbelt wrote:
> On Mon, 13 Sep 2021 09:23:45 PDT (-0700), keescook@chromium.org wrote:
> > On Fri, Sep 10, 2021 at 04:40:42PM -0700, Nick Desaulniers wrote:
> > > The minimum supported version of GCC is now 5.1. The check wasn't
> > > correct as written anyways since GCC_VERSION is 0 when CC=clang.
> > > 
> > > Cc: Paul Walmsley <paul.walmsley@sifive.com>
> > > Cc: Palmer Dabbelt <palmer@dabbelt.com>
> > > Cc: Albert Ou <aou@eecs.berkeley.edu>
> > > Cc: linux-riscv@lists.infradead.org
> > > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> > 
> > Yeah, good catch for Clang too.
> > 
> > Reviewed-by: Kees Cook <keescook@chromium.org>
> 
> Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
> Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
> 
> Only this patch ended up in my inbox.  Where you guys planning on keeping
> this whole series together, or did you want me to pick this for the RISC-V
> tree?

Linus already merged this series (see d20758951f8f28c0ee1b2a8a6bb8189858083895)

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
