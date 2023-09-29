Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7325AE81815
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Sep 2023 21:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QhqA3QN6eQJxz3ZY1Z/DKgMCmZ2coxQbwz5Dpl44+LY=; b=ZCMujbIzegiJUj
	CSGuo8XHKeccmEV2vT9kjWKdppLSjepfqlYgCJ6JzClBGWkgxhB0TJpFrCzOxCkkiz8Y6FPDTQV4t
	6udqKwRSLME1bU66vCD4AnxDP7DIsGEA5QiNEmdXjMuw7y6a4XYrCP9KD4Y7avahUS8NMBNKmPGvS
	tKmOXJR1ZvVzlAnM8GHCO+fDUIqdrE9L3p5ObjLV1EHZTkWzCdx0NXcAujgvmk1V3zOhSGXNQEumF
	YiUBaMU9fTu7s3ABebZ9as6YzN85hyTzBRLcTcnIuD7NqaK5KwkbJeYdwaL+Nzat9nvylYhLZHS7R
	B0N4WYJWwdDgs3nXZ7iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmLS1-008cmw-2x;
	Fri, 29 Sep 2023 21:55:09 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmLRy-008cki-0Z
	for linux-riscv@lists.infradead.org;
	Fri, 29 Sep 2023 21:55:08 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1bf55a81eeaso111953765ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 29 Sep 2023 14:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696024502; x=1696629302; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8kFisjx+D089Bl0n+c9sa0dcFrh55Nv3CjkrAPKvHaQ=;
        b=aeRnZex62BAtIfmqfb/uS+R8FJCRq5JnIpM6nNrVILV2rRMulWOACfvzqQw5wXihUM
         mx3Hzn5TC2wxNgVB9QQLMkKlEv5Zf5CIVtuFDVHHKbycwI5auL2+WehKqx5SQP2ZiQWC
         16nOhzjHsQ7ebn5i+9KBAJ9/c3t8lEgz7dlbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696024502; x=1696629302;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8kFisjx+D089Bl0n+c9sa0dcFrh55Nv3CjkrAPKvHaQ=;
        b=iQYXV6q0lYfhxXpxu5rWKVTA+5VHmTsBe8NglKCQch79SwPJMhp6h0uT9yytfwEO1t
         jgLYLcK6/RmmYOYwBjekfwUTr04ZP4pX0uTNurODeF4Fm+k7kY/T4UolUR4hDCf1U/7u
         cy4+opihi0oazSV0Tz3sgQC+BgDObE4iKHJFW+mQtqEtOYyhqHs20NpXoloNRBisxPBU
         LGqz5JgJet2UEI1Viby7C2BYJe1G/pXL7606i3v+Iv9GIbDLtNfOnhg+etr0Ua8KxCcK
         r4yd0mCXRIy6wAJZkNQUp33MoRI31L00hU7SnOwBK5FQAl43rPGITtcfDQPucPgakbQA
         cKcA==
X-Gm-Message-State: AOJu0YyqJUOhogdCA6WP9Ac2gDmOZDBErNdm6xb96IbgoJq+glJY/TCj
	YGY/G3AgHFhgwWsWIWGPmKcnlA==
X-Google-Smtp-Source: AGHT+IGnbAGwryCCvO6jabCBmevCmJ/0eVxJN4Y82GDsZjB3QfXDLV1KZNYrwCXcUGHGoTsq/uDbWQ==
X-Received: by 2002:a17:902:ecd0:b0:1c0:c86a:5425 with SMTP id a16-20020a170902ecd000b001c0c86a5425mr6564288plh.19.1696024501806;
        Fri, 29 Sep 2023 14:55:01 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id l13-20020a170902f68d00b001b54d064a4bsm17338377plg.259.2023.09.29.14.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 14:55:01 -0700 (PDT)
Date: Fri, 29 Sep 2023 14:55:00 -0700
From: Kees Cook <keescook@chromium.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] mm: Change mmap_rnd_bits_max to __ro_after_init
Message-ID: <202309291454.436E19663@keescook>
References: <20230929211155.3910949-4-samitolvanen@google.com>
 <20230929211155.3910949-5-samitolvanen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230929211155.3910949-5-samitolvanen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230929_145506_211533_ADD721D0 
X-CRM114-Status: UNSURE (   9.95  )
X-CRM114-Notice: Please train this message.
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

On Fri, Sep 29, 2023 at 09:11:57PM +0000, Sami Tolvanen wrote:
> Allow mmap_rnd_bits_max to be updated on architectures that
> determine virtual address space size at runtime instead of relying
> on Kconfig options by changing it from const to __ro_after_init.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Just the kind of thing __ro_after_init was made for. :)

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
