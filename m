Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0569C38A2D
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Oct 2022 06:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pddc6B+wdMTKUhqAI6K/8n2ZZohNDLMifhOH7AdzQj4=; b=wc25Nr2sO2+lBW
	wcBWFBqxxmTkyCKEDWvbK9jsugwkJEX6/70D6cu1IGuwP4qyb2Cmx4otPv3S5htyVKHX24/kj3nz/
	QlopwE5DM8jGYywLzMuqvF2KxALzTucjgIba7nAN3+vv6b+oVTewjGccydvD/YblLDBh+rsoKdlEh
	ux7z5HxOcunab/jYU7LJxnKL9eGfYFOzouQW1GcqUPXf2rALyxPI8eKLhBlA7VbNVkuwHoHjOzZWw
	ZkpjU2fgO1qv1onUN/d8X9sSd/vbGyNqJo8C+D8fbIybl4QklScbhAVYKkiJQFw1R7eXKnoqsH7du
	zaSYjdyIogFts2MBp82g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omrFz-00HLBs-Qx; Mon, 24 Oct 2022 06:48:19 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omrFw-00HLAy-Rt
	for linux-riscv@lists.infradead.org; Mon, 24 Oct 2022 06:48:18 +0000
Received: by mail-ed1-x530.google.com with SMTP id y69so8566554ede.5
        for <linux-riscv@lists.infradead.org>; Sun, 23 Oct 2022 23:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PYSiPbsgzjVIyMVYBaetvVySP6sEY2ApmiMZXLoNX/U=;
        b=E4qx7BLkl5zenKwNDK4RNitsxibVKOiEAn1VAHw8g0g+LTwe08UGFc6ZmEV7gBVj2+
         jGqP9JVF9EFJ/BhMTU4kXcEocOJZaLZkyx8wZGH3/738jaWgfD230zwh2vaUuMYIaAhv
         V6QHda6K5ExGWz/wdNL0UcBm+6S2X5kv8IioXXNo+FUN7niOQgWi644h7jvK0uh8Qe32
         DWdUG5oSSzx9l6+zPMlKwZVCDB9IrGPqxtKqmza20AGFNvtPv1VFxvzVMNpcss+O8yJk
         YFZL5nbUxVMRVfA91ErYZOKKgy+JNusbJyLQBZSPK7O8H1PtXBLEaGF45yo4mb2F63Zi
         1C/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PYSiPbsgzjVIyMVYBaetvVySP6sEY2ApmiMZXLoNX/U=;
        b=i18IjBDbVCK6TJJq3VetEuiZs6rrXpTf1yl+RrYURjC52nkwjnyAQx/zlHOvWIiLby
         fBSQq9Qpbl8U/9dcCAd+arPZqLCA1X3F0obv/Gz7WL/GR+ri2kc9pJkIqrxMBkmmZHNg
         VZVNyCfxPUHqXYtbSfMoS7XyPevcmne4v7qxP/x9Bf8o6GyjWVRnOvU9WZTy65vNJs25
         Yj06TBAI4Vab/IHZThFkq9lhdIDEN/C6655ZOMELZ4D5ueXZPT+mPevUtjmUiaimndfe
         XhuC8Iq3SPixlOJAYQ/5AtwT8PVm89ONp00AsBtPowPDh/7/8VkWycQsdFvz2D57j+lH
         fWYQ==
X-Gm-Message-State: ACrzQf0yPAAIETicFT19IWpldh2HjAIUVpOj8z/4TuIw3S7fnbdeePn7
	YUI9ASe3cJCzXHW0bsTz0Mei8w==
X-Google-Smtp-Source: AMsMyM6KmCqqILrlQtYT44ot8Nbex62824lrNqk8x4CZ0I4lPs3HzinnOXbTwmT5P2UW2AdFZYEkgg==
X-Received: by 2002:a17:906:dac9:b0:780:ab6f:591f with SMTP id xi9-20020a170906dac900b00780ab6f591fmr26406130ejb.77.1666594092522;
        Sun, 23 Oct 2022 23:48:12 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id et11-20020a056402378b00b0045c47b2a800sm17657712edb.67.2022.10.23.23.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Oct 2022 23:48:12 -0700 (PDT)
Date: Mon, 24 Oct 2022 08:48:11 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH 1/3] RISC-V: Improve use of isa2hwcap[]
Message-ID: <20221024064811.rtu4nsia23yuga7w@kamzik>
References: <20221021105905.206385-1-ajones@ventanamicro.com>
 <20221021105905.206385-2-ajones@ventanamicro.com>
 <Y1WV1MmtTwvTlrcg@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y1WV1MmtTwvTlrcg@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221023_234816_923396_D3C5D160 
X-CRM114-Status: GOOD (  19.37  )
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

On Sun, Oct 23, 2022 at 08:28:20PM +0100, Conor Dooley wrote:
> On Fri, Oct 21, 2022 at 12:59:03PM +0200, Andrew Jones wrote:
> > Improve isa2hwcap[] by removing it from static storage, as
> > riscv_fill_hwcap() is only called once, and by reducing its size
> > from 256 bytes to 26. The latter improvement is possible because
> > isa2hwcap[] will never be indexed with capital letters and we can
> > precompute the offsets from 'a'.
> 
> Hey Drew, couple questions for you - mostly due to naivety I think..
> 
> How do we know that isa2hwcap will never interact with capital letters?
> It pulls the isa string from dt and the no-capitals enforcement comes
> from there since one with capitals is invalid? I didn't dig particularly
> deeply into the code, but is there a risk that we regress some user that
> has a dt with capitals in the isa string? Or is that a "your dt was wrong
> and you're out-of-tree so that's your problem" situation?

Our ISA string parser here in riscv_fill_hwcap() ignores non-capital
letters, see arch/riscv/kernel/cpufeature.c lines 141, 165 and 196.
(Maybe we should be noisier about that in case there are DTs out there
with capitals which aren't realizing they're being ignored.)

> 
> Secondly, in the UAPI header, the COMPAT_HWCAP_ISA_FOO defines are
> computed as I - A rather than i - a. Should those be changed too for the
> sake of consistently using the lowercase everywhere, or do you think
> that doesn't really matter?

I think I'd leave it since it doesn't change the math and I'm reluctant
to churn UAPI.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
