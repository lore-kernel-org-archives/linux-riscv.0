Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE5C7C4829E
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Feb 2024 00:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/vzMYLE06LLG8JlGc+TqYmEmuc0c7uLL2MHHiPRW1/I=; b=2qrhMggREFrxLP
	JE/yc49g66Z8/G0XFbX9+Is+9BSODWIzeI1eP4xJshiL5LfOBSmLDiVUIhXr4gxKkcHq/cAEatyYc
	n6s/bXbhjknq8ZqSJsIcsLZBjsVaw7LlK/cgv8l3SaZyGn6AmvfFpk5bEWPWPQV9RqeUz9VB79Fpi
	DLgb3qGBPdAsoufvfBim5KEHgFRu0m/w5ndT1lveDEXfFO7dFtDj56pOEyEOea+EHRZChrLbTpwbN
	ERc2UI1TkOQkeQMHUb/nZxGLD3wbcbUF1rZl0B9ALd7yzQuf9js5CzJC6QJIdWZYQCgTrNOuHC3QX
	APhJZE9ITEFE4jRjc/qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ramKC-00000000dvG-1Q3a;
	Fri, 16 Feb 2024 00:43:32 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ramK9-00000000dtw-1zji
	for linux-riscv@lists.infradead.org;
	Fri, 16 Feb 2024 00:43:30 +0000
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-7c4949a366fso51217439f.1
        for <linux-riscv@lists.infradead.org>; Thu, 15 Feb 2024 16:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1708044206; x=1708649006; darn=lists.infradead.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=906AztgBDa+u1AARHWRp02F7s/rxI61AgVNDIWi+eXM=;
        b=ZlBxkNlebxFeL3qw2a550GzlPD9dnR5X0TH8Om2p6WbrSaTh7fzN/I9i56l+ot+q8w
         FBL6g07fcdpw1hGvhZS8SrZ3JPoRlkxnDaUrl4UpPz3szthJ1UjO04lAnDtyhrxivaSY
         78lRRwy6BsMT7vI0GN7i3mmEiyDql7uJVAkFxXWmeBxI1X4IKTqUS6xrJvVSykrMy7X6
         OCWIOcpGO+dDbY07wpT6V5Gf9hTdbLS8dTxZbck6TyUaqKuC6lrgMJ0viFiZ9kj6p1yz
         0sOUjE1oXMtCfASfz1XLxfkIoFCwXm2gS+OXaJgYkY2Zv2Xo1GFd1OrOSf3UCjGcuPnq
         EMOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708044206; x=1708649006;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=906AztgBDa+u1AARHWRp02F7s/rxI61AgVNDIWi+eXM=;
        b=WmMVt9f/CIHabAHh4+RhPO6O5CH9g9WJgh25iqaxo1pJkl8qLFEk8YN1Ix9m9bhmAe
         JZ8PUfo1xRtN1ws8x7Rwa40NDhWL8r9O/A/+mmbVrsrEzCE1cKJS64bes2aVyIz0nedD
         PaQnvZb4RsKj46tUQnt/KEdwN7ffXFb3NdUMYQ7ZDCVP4WQieAKQwoujLk1gh16CQUhq
         kX+qrGYQWUiv364wZXtluhl+3PQETeBrtP6yqQJj3m4QBmtmZK86meEF6aHmmOQYCNJL
         V0s++bdxN9dEPPTe7NoMdwWmF0eScOSDCswBkc6CMT+/5Yykm/92uDzmdvVpO6cbyJo6
         Ewyg==
X-Forwarded-Encrypted: i=1; AJvYcCUnaN1XwpaCp793xzzIj7j8tjLzPQWxwmYisYOc4q6egnnL3Z9LEMMpaarK1QBP+Wg79MLMRHfFH07bBv5dUtSzzkvjxDaQJi9wilTsMccz
X-Gm-Message-State: AOJu0Yyup62Nrzpui5tey9gcZjR0r4KiSVNj8MScmKoGf8+ZHiNstESk
	Bwdd1YH9OfxGJInpiLWNbRDTVQUyY0/pvRdmB0Gjkh/O1lN6aSr8fDp1aRh4Ozk=
X-Google-Smtp-Source: AGHT+IERnpQSZ7MTb6KfYlV0kBQ6EVjYQL9pSnng2dDwidYnOh6AyMUrOQceP7bFABcYCPnVZeKZSw==
X-Received: by 2002:a5d:841a:0:b0:7c4:5910:8ab9 with SMTP id i26-20020a5d841a000000b007c459108ab9mr4153852ion.5.1708044206274;
        Thu, 15 Feb 2024 16:43:26 -0800 (PST)
Received: from localhost (c-98-32-39-159.hsd1.nm.comcast.net. [98.32.39.159])
        by smtp.gmail.com with ESMTPSA id l24-20020a02a898000000b004713ba1b284sm609266jam.44.2024.02.15.16.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 16:43:25 -0800 (PST)
Date: Thu, 15 Feb 2024 16:43:24 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
To: Samuel Holland <samuel.holland@sifive.com>
cc: Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Greentime Hu <greentime.hu@sifive.com>, linux-riscv@lists.infradead.org, 
    Green Wan <green.wan@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Update SiFive driver maintainers
In-Reply-To: <20240215234941.1663791-1-samuel.holland@sifive.com>
Message-ID: <114d9cf3-0ebd-56c7-f3e4-57ebc235df45@sifive.com>
References: <20240215234941.1663791-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_164329_721093_27613735 
X-CRM114-Status: GOOD (  12.00  )
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

On Thu, 15 Feb 2024, Samuel Holland wrote:

> Add myself as a maintainer for the various SiFive drivers, since I have
> been performing cleanup activity on these drivers and reviewing patches
> to them for a while now. Remove Palmer as a maintainer, as he is focused
> on overall RISC-V architecture support.
> 
> Collapse some duplicate entries into the main SiFive drivers entry:
>  - Conor is already maintainer of standalone cache drivers as a whole,
>    and these files are also covered by the "sifive" file name regex.
>  - Paul's git tree has not been updated since 2018, and all file names
>    matching the "fu540" pattern also match the "sifive" pattern.
>  - Green has not been active on the LKML for a couple of years.
> 
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

Acked-by: Paul Walmsley <paul.walmsley@sifive.com>

- Paul


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
