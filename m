Return-Path: <SRS0=MB+m=T5=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2BC4C28CC0
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 29 May 2019 20:16:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8FA924137
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 29 May 2019 20:16:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CwvxYnoz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bwKrSUcA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8FA924137
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0w6CD2gfWQ1UELVLG0/RICT6LlUFN1Zo+xXtdzkSudI=; b=CwvxYnozOzk77A
	zhc4zBulyBCJpEHkJkirHXEkJ1jNk3gEwSjFWq8Frmb0B3ZGBceScuFpjyPyNehn6pGWv3fwyxxJX
	8pqM61iavWu6ahSkSZh7hAQ5jcu9j/8l5wXikJMuRmAOLo/6dYRSbX0wKGNe6FAKWnl/i8MzpXy2K
	IrAnCTjzqZksq/Tf8D468/q76qN1JqEKCustl8/BxOe4GTjdxtCzfEdivnRR2wY73WaLGn+yKJwny
	DTWLYpfIOTVvCRtDOryDvCxjkxlfYsfCvolIM1upPEpls+zycvmWQQpZt52wzj180H/wb8Gr12K6Z
	454n62go5WEgA5q+wc5Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hW4zk-0001uy-6C; Wed, 29 May 2019 20:16:20 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hW4zc-0001nG-HY
 for linux-riscv@lists.infradead.org; Wed, 29 May 2019 20:16:13 +0000
Received: by mail-pg1-x542.google.com with SMTP id 20so544661pgr.4
 for <linux-riscv@lists.infradead.org>; Wed, 29 May 2019 13:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=byH71jcEnWiZocWjFrPDlTMOE7pd8EPRHoYGyukaY04=;
 b=bwKrSUcAFY5li8JHROxevBRkVdZvfftmbN2jvX4D8l/n4Q/b0ePv+zprqpG2KluSLn
 rSYJBFUhtygfnfgM4xMNPYR/Vp/NGpVKFovwEIHmtk8emThGP6iRNZH+rg7exn2dW3QV
 qTeu7YoFimL+W4CSITeRLNxas0G8YpYTWwbHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=byH71jcEnWiZocWjFrPDlTMOE7pd8EPRHoYGyukaY04=;
 b=VWH3UaRkANG9W/lOrQ8J8o0eWbPXrDzOwaOTAQ+uZUqM0JT9+asgrq4MXVcW+2GxAC
 u5RJpt4NwijrOFMydkOzgySe77aSVES1+7a7THYIqYbTdwUgEkoNy1TVoFeBdnbbuhNw
 H47nRguZ/qhIlxpCovGtbQcaxV8ofLfEpI3PMJYIWcEhdN0mrDhYK0siXJD1/80a7ADo
 FzWLaFhTSdiSBsj0WUG9CIzffvYjaDPhPwU1lUsCKbLaGTWQCzgaoCa4G+m89g4uYRK0
 clsLxkTS8BVH1Q34U3sbtIERDq71mHgKk0qrAt/O1gphlIud2wwug7tOyB6kw3XYCjmW
 vCfA==
X-Gm-Message-State: APjAAAX+oRSnHC6Yu2kInTy2U8a98aJutXUjGFnIZpSVrlM4FYpWK+BU
 zshZiMkRmaeMtmSvJgURCnuBIQ==
X-Google-Smtp-Source: APXvYqwOtLbXvQF12v2iQzcTzlTPHXYwr/VbPiH/+9zX0lzSfnaAmA5ZoEnSGfNESsFHQ7AnnjhQoA==
X-Received: by 2002:a63:f44b:: with SMTP id
 p11mr139393871pgk.225.1559160971649; 
 Wed, 29 May 2019 13:16:11 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id u6sm227693pgm.22.2019.05.29.13.16.10
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 29 May 2019 13:16:10 -0700 (PDT)
Date: Wed, 29 May 2019 13:16:09 -0700
From: Kees Cook <keescook@chromium.org>
To: Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH v4 00/14] Provide generic top-down mmap layout functions
Message-ID: <201905291313.1E6BD2DFB@keescook>
References: <20190526134746.9315-1-alex@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190526134746.9315-1-alex@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190529_131612_613588_AD586749 
X-CRM114-Status: GOOD (  12.43  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 Catalin Marinas <catalin.marinas@arm.com>, Palmer Dabbelt <palmer@sifive.com>,
 Will Deacon <will.deacon@arm.com>, Russell King <linux@armlinux.org.uk>,
 Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Paul Burton <paul.burton@mips.com>,
 linux-riscv@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 James Hogan <jhogan@kernel.org>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-mips@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org,
 Luis Chamberlain <mcgrof@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, May 26, 2019 at 09:47:32AM -0400, Alexandre Ghiti wrote:
> This series introduces generic functions to make top-down mmap layout
> easily accessible to architectures, in particular riscv which was
> the initial goal of this series.
> The generic implementation was taken from arm64 and used successively
> by arm, mips and finally riscv.

As I've mentioned before, I think this is really great. Making this
common has long been on my TODO list. Thank you for the work! (I've sent
separate review emails for individual patches where my ack wasn't
already present...)

>   - There is no common API to determine if a process is 32b, so I came up with
>     !IS_ENABLED(CONFIG_64BIT) || is_compat_task() in [PATCH v4 12/14].

Do we need a common helper for this idiom? (Note that I don't think it's
worth blocking the series for this.)

-Kees

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
