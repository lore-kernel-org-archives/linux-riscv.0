Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C40F5C433F5
	for <linux-riscv@archiver.kernel.org>; Sat,  7 May 2022 08:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jk4Q11jGFtxkVxIyjREMBKZB7Ax99U6eP1c7xDeQcR8=; b=wppcWuO3FYjghr
	Zk+hzm/k1A+oiWX2GZZzXXXqrB/4zNLPdZRDhqdZpBZsrZdkiLj8iUtuU15KfU7h6L+RVU2/C+DYo
	oGQrrVjheMzcorwF+PDVQxFgPz5O5RdHr1N+wcTlA9KO5phM82KKR544sog7wr4befBQtD1tYzDU9
	9fLDbIrdNVe4DqC6oCXsiiOJy3bR/G+3qHT5Ew/CgPPGqJqZPcpBnvE6mh+KuMMvlCKG6oo1eqUnf
	NjXgECq21lzxJmxJCEb7eovxUKEBrxHsHpiz44Bw1LDGuaIRGzMkAAmXMm6dJPr1HdxpKEYpJL5pD
	pcg9gaFGlxq6+Rpwdaiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnFSJ-006SCG-Nt; Sat, 07 May 2022 08:06:23 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnFSH-006SBX-HG
 for linux-riscv@lists.infradead.org; Sat, 07 May 2022 08:06:22 +0000
Received: by mail-pg1-x533.google.com with SMTP id 202so7915982pgc.9
 for <linux-riscv@lists.infradead.org>; Sat, 07 May 2022 01:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=aWQfnp8p3Sa/CZYziUv8sJFvgH/DhWMow1Ki0jzKInQ=;
 b=d7sa/vJyLfF9BR72n72H6iTcORw0kbeaXS21B2+FXdbG66FYCW7FBC02LCRup2bO0T
 VbztyRzKE447Dsr5bQyIcT/N6Q1+c4/IXMaJT3GrJsKz9ltWgOCmeIOcoalYl/8o+V6Q
 JCxhKqmLoYC0fCUjLs/ACK38p33kuWfTfdyYo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aWQfnp8p3Sa/CZYziUv8sJFvgH/DhWMow1Ki0jzKInQ=;
 b=gey05rqiwXJeNm3Eymuv2Vd0d5hkh0Yq1OToPYgfFvHpHpflwxp4Supcptht7QWMWN
 E0ZYc92Izsm4CMpEkBac3pFlTRyNt7p6UOfFGnsmAAm0rLkR619bpNKB3QmWkdllDEqm
 yieQyhMW7mYgx1EL2zWeXoUbR+7rjjrymn+B3FQxp28yDkINoehpRQtbnMGUrDSIqWKi
 LFqoaQ2FxusfSq4mp7llQkyERHxrVA6mvrWXJufcr06Xgd2ui9ucbWEDjGZILc1bIZd6
 hS/ux8EchZboxeqXikqMTpHcPh/f0iLQXKGUpd3bVwLu20X0bajE07G8ZS6JjmSxiwkg
 MvOw==
X-Gm-Message-State: AOAM531d/gYL2LDNdtI3xehn7MEs/Pa/Fr09am9XsOwacvw8hXfGIqrK
 fnmOe/VpZEN+JobkzKI/b7df6w==
X-Google-Smtp-Source: ABdhPJyPh1ezOw2sy0EQ6kjmLgD1rSsrITTXAJHnhVIq/PJRePuQKh9Kel3rSaI68O428UlbxAszUg==
X-Received: by 2002:a63:6fc4:0:b0:393:9567:16dc with SMTP id
 k187-20020a636fc4000000b00393956716dcmr5757855pgc.593.1651910779774; 
 Sat, 07 May 2022 01:06:19 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 j192-20020a638bc9000000b003c14af505fcsm4564376pge.20.2022.05.07.01.06.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 May 2022 01:06:19 -0700 (PDT)
Date: Sat, 7 May 2022 01:06:18 -0700
From: Kees Cook <keescook@chromium.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jarkko Sakkinen <jarkko@kernel.org>, kunit-dev@googlegroups.com,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 live-patching@vger.kernel.org
Subject: Re: [PATCH v6 00/23] Rust support
Message-ID: <202205070056.ACC3C3D@keescook>
References: <20220507052451.12890-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220507052451.12890-1-ojeda@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220507_010621_629224_75F7FA21 
X-CRM114-Status: GOOD (  14.75  )
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

On Sat, May 07, 2022 at 07:23:58AM +0200, Miguel Ojeda wrote:
> ## Patch series status
> 
> The Rust support is still to be considered experimental. However,
> support is good enough that kernel developers can start working on the
> Rust abstractions for subsystems and write drivers and other modules.

I'd really like to see this landed for a few reasons:

- It's under active development, and I'd rather review the changes
  "normally", incrementally, etc. Right now it can be hard to re-review
  some of the "mostly the same each version" patches in the series.

- I'd like to break the catch-22 of "ask for a new driver to be
  written in rust but the rust support isn't landed" vs "the rust
  support isn't landed because there aren't enough drivers". It
  really feels like "release early, release often" is needed here;
  it's hard to develop against -next. :)

Should we give it a try for this coming merge window?

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
