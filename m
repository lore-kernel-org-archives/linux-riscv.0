Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DAD5EB64D9
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 04:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VG2JL77SHZdH4N8vxGKcgU/PmH7IFmf/tOT+X32fR6A=; b=WS1LJA/cidlgMx
	U8b6pQmluEb1vVa0okxA9Ni2yHCyauR2Sece+GrdMnl03GHgDYzk65lFIbGuYFBYcexB8r2cOmHsO
	5K0dDy65XLGDiXWi4bfaOTQ0m3df0c5THh0FaKcKh1Ljq+QqbS8sp6bdbsJ0hrGSAkaXMJqkEKgZ5
	A7D6HwuiDynPP5+2d2FJh/1um0GCk9tzhsdeb3yYhKfPxnAee8OupfuikL/a4LYznYCwgL0i3d8wU
	/ObhgtZueo+AkX8NO2jh5A3W6tIXL7pPZ6ljRNQTJ7cJwvdNjNHauGoHnx9iA267pbW5hWc0Qaw8x
	hbkDva74czDlPg5JS1oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qE0Z1-00BjUP-1D;
	Tue, 27 Jun 2023 04:44:27 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qE0Yy-00BjRc-36
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jun 2023 04:44:26 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-573491c4deeso42692927b3.0
        for <linux-riscv@lists.infradead.org>; Mon, 26 Jun 2023 21:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687841060; x=1690433060;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dVtrcXbE5qXWKdJhq2ArhetT4KPRpQBwbjTOuMnTdxE=;
        b=501HLYHctmk8sIJeTmzxhRx3/mgKpv1jRi1zyxe6IKd5PzvxEUvUlafEKoDqL6yZVr
         8LPzltfzYfOsnNGE3T6BklB22lAMitCgdhFuhtcXDNR8cn90bt0hxS6/rFyMCnKABSjm
         /oRswCkgkHFa78/d8yQxqLAP7w+UcywLgaNVEk0kQUj/E5gzTgG4U1Ib/QTJ68K6B1lq
         DHiArvPKR0yaKTV4AcdaFGyA0a3QVzlRHTqcAyQmjJhyBDsZIisDj9Axezm4VTj3plhb
         Dus4mDTAcMi1b8nttzH3dDwb6//iZcVcKmqu+MryYnw/GG09jfr1xcEP4Qfwx6utRJkj
         zVzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687841060; x=1690433060;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dVtrcXbE5qXWKdJhq2ArhetT4KPRpQBwbjTOuMnTdxE=;
        b=Rr8yFvdwj6SMbOKbwLAegzxhwFsQmrqaGAJs9IKy7bl5F2kdECN7W0nc4e1iOLMwKr
         M/w6zbu1RuKKyk57J54m0gTq5nzJqhRrSrFX4FHaFnN81bfnv5G5y/DIJI5+KLMFEepV
         uim4uDgk3aJWDjfgZbx1pm/wn3X7z7O4zAueqcVWaUOWLAo1yoQteWiheN87Fk8GrQSJ
         eoFvTpWH2Iob5n93B91aqWKd/s0YwEEek7aT3qbxgU0YAbp5Y+WDE3eCEr8BOpvrspNo
         /Dpx7aesWplcSSGaSRsbILMst02SoBfTtnaHZMIGTSTvd8gvBjG0w7Mji/fdk67UGojZ
         CxXA==
X-Gm-Message-State: AC+VfDw66V1dKZVxhFj7NT1Wh2q2cb7lFY4mgZe/i/6JySt97N1v7gYW
	i9skDoOFjyf/u5yNHAQB75EG1Q==
X-Google-Smtp-Source: ACHHUZ4LBcIHJ/ynOcwzWzKYI9Mk2cjEWGfgZGpKdMoBZ7/XKupPMOzNiMbSCmgeKveyN334gs70/g==
X-Received: by 2002:a81:7bc2:0:b0:56d:43cb:da98 with SMTP id w185-20020a817bc2000000b0056d43cbda98mr29864359ywc.29.1687841059932;
        Mon, 26 Jun 2023 21:44:19 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id j8-20020a252308000000b00bf44703efd3sm1487805ybj.6.2023.06.26.21.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 21:44:19 -0700 (PDT)
Date: Mon, 26 Jun 2023 21:44:08 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
cc: Andrew Morton <akpm@linux-foundation.org>, 
    Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, 
    linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
    linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
    loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
    linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
    linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
    linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
    sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
    xen-devel@lists.xenproject.org, kvm@vger.kernel.org, 
    Hugh Dickins <hughd@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
    Huacai Chen <chenhuacai@kernel.org>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, 
    David Hildenbrand <david@redhat.com>, 
    Claudio Imbrenda <imbrenda@linux.ibm.com>, 
    Paul Walmsley <paul.walmsley@sifive.com>, 
    "David S. Miller" <davem@davemloft.net>, 
    Richard Weinberger <richard@nod.at>, 
    Yoshinori Sato <ysato@users.sourceforge.jp>, 
    Dave Hansen <dave.hansen@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, 
    Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v6 00/33] Split ptdesc from struct page
In-Reply-To: <20230627031431.29653-1-vishal.moola@gmail.com>
Message-ID: <e8992eee-4140-427e-bacb-9449f346318@google.com>
References: <20230627031431.29653-1-vishal.moola@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_214424_998407_45F44738 
X-CRM114-Status: GOOD (  10.85  )
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

On Mon, 26 Jun 2023, Vishal Moola (Oracle) wrote:

> The MM subsystem is trying to shrink struct page. This patchset
> introduces a memory descriptor for page table tracking - struct ptdesc.
...
>  39 files changed, 686 insertions(+), 455 deletions(-)

I don't see the point of this patchset: to me it is just obfuscation of
the present-day tight relationship between page table and struct page.

Matthew already explained:

> The intent is to get ptdescs to be dynamically allocated at some point
> in the ~2-3 years out future when we have finished the folio project ...

So in a kindly mood, I'd say that this patchset is ahead of its time.
But I can certainly adapt to it, if everyone else sees some point to it.

Hugh

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
