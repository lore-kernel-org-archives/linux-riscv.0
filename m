Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CF13C3DA4A
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Aug 2024 05:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JCDhubSRRsVqw6mQk8LeUl+oeowrSdf4/dyova8zzns=; b=NPJIki2jXpNqeS
	jzjHJ3E4ChlH8KTX4evfxnGThGu7YVDS2QEdeNaXKSWqmVO6/p1tDMR0atMdW3Fn81dxwEbmYpfkj
	pxckNgCRBLzKEPOVC/pCMFw6m5gSkERuKllvyJkMNaRMW82QhrpAiTvJr4UMCBGnHeB5gZxU0d7U6
	lUikSy2Fj2utjLspjH0AMvswrKe1Ew5Ym+CQTSf3tF5Mt9dPOESHeHS4qMYM3zQidt5nbTSjUKsNb
	y7MoCJwBiSzbRhqLkvHRPmolg1WInkQWXTIE6Q9VDycoEdyzhHB0Ex1r8ht6DoMkgB2ikTI1DZuCl
	73om4Zohe4nFkih+hDtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sa76V-0000000An5e-2qSD;
	Sat, 03 Aug 2024 05:14:55 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sa76S-0000000An4q-1ZzL
	for linux-riscv@lists.infradead.org;
	Sat, 03 Aug 2024 05:14:54 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-70d23caf8ddso7625281b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 02 Aug 2024 22:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=heitbaum.com; s=google; t=1722662090; x=1723266890; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BmvtDB3s2cR8UrreA9la38N0r8HdMO9IViXvEFHt/Nw=;
        b=RiV5KEkZ7JvBZ/2FaXXzgtrlMdIPCc1andykf8LEizg1LoMyIaTThGgYM1CimK4WLD
         bg/ct8w2WHmvlGx/j5HJvRn/FL/JneWCykw0lyN/pkG0sp62Op4iXQW5XmXFE7IejpCz
         dHoMJ6OWh9P4weMxKPCokrrLyiSsIk49KhyVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722662090; x=1723266890;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BmvtDB3s2cR8UrreA9la38N0r8HdMO9IViXvEFHt/Nw=;
        b=h85T6aeC/IvMHvJnF63kIxnLJt9JKTXQxysSu+N5cgXYOVnbbo4ZzBcCYGrN6QXTmA
         /yyEt7ACLEOB8lZgq3op71h7Fm5JbKvRKNnaW8DAagmlNEIJf4MNT6CnmpWWY3pddA77
         m2H5B4MFXFbMYmd7QCIzG9aUWU8MOI1vm8ZUgi2m1p9uUGJAW/ymaB29ErUcmRhIUe4m
         pbpA+yAB6TDnDwPLPXhWxro+oC06HWz9qfaihWqCROCEeMKlJKlGzsp1j47g1QN3qEOp
         R9PwXqcf00tJ1x8ZQ0uOQ0gEnvLO7UOaM+NCTkOlO9g1LL+fBk70YM3U7gPzJrv0wdGL
         cL3A==
X-Forwarded-Encrypted: i=1; AJvYcCWaMLIHTn5lu06YFs3KnCtd92MQiB+7xRD2YCqeImC/2OBE05/hfDs0poxRIzNEP5GqG/8n6188dcffsdDUS0+C9rMUqPo18k+cX4+VJLmX
X-Gm-Message-State: AOJu0Yyqc+O4r9zZH1b0vtaUdVdtKMZep07iF8zheogEBJpkWgCExceO
	fn4x7jz08iyGzByB4mi7wRnIwLmn7aFYgKRQv53vFHuSSEj8+d7GMt0ylVVc6rY=
X-Google-Smtp-Source: AGHT+IFtk7L8k8Q3OP5IS2+A9RpjMYCUcoWx/gWA5UpNjio/ITBkqtqn6ebqg37Slew3B08+KAqPog==
X-Received: by 2002:a05:6a20:a11f:b0:1c4:944c:41e2 with SMTP id adf61e73a8af0-1c699683bdbmr8888959637.51.1722662089837;
        Fri, 02 Aug 2024 22:14:49 -0700 (PDT)
Received: from faede8dcc269 ([122.199.11.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff58f57176sm26262095ad.80.2024.08.02.22.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 22:14:49 -0700 (PDT)
Date: Sat, 3 Aug 2024 05:14:41 +0000
From: Rudi Heitbaum <rudi@heitbaum.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Andreas Schwab <schwab@suse.de>,
	Florian Weimer <fweimer@redhat.com>,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-api@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, WANG Xuerui <kernel@xen0n.name>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev
Subject: Re: [PATCH] syscalls: fix syscall macros for newfstat/newfstatat
Message-ID: <Zq28wejX3U9J1_JV@faede8dcc269>
References: <20240801123305.2392874-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240801123305.2392874-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240802_221452_500066_F76447B0 
X-CRM114-Status: GOOD (  13.16  )
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

On Thu, Aug 01, 2024 at 02:32:33PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The __NR_newfstat and __NR_newfstatat macros accidentally got renamed
> in the conversion to the syscall.tbl format, dropping the 'new' portion
> of the name.
> 
> In an unrelated change, the two syscalls are no longer architecture
> specific but are once more defined on all 64-bit architectures, so the
> 'newstat' ABI keyword can be dropped from the table as a simplification.
> 
> Fixes: Fixes: 4fe53bf2ba0a ("syscalls: add generic scripts/syscall.tbl")
> Closes: https://lore.kernel.org/lkml/838053e0-b186-4e9f-9668-9a3384a71f23@app.fastmail.com/T/#t
> Reported-by: Florian Weimer <fweimer@redhat.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Hi Arnd,

With this patch to kernel 6.11-rc1 the error whilst compiling gcc-14.2 for
aarch64 with libsanitizer has changed from '__NR_newfstatat' to
'__NR_fstat', so some change, but still fail8ng.

sanitizer_syscall_linux_aarch64.inc:13:23: error: '__NR_newfstatat' was not declared in this scope
   13 | #define SYSCALL(name) __NR_ ## name
      |                       ^~~~~

sanitizer_syscall_linux_aarch64.inc:13:23: error: '__NR_fstat' was not declared in this scope
   13 | #define SYSCALL(name) __NR_ ## name
      |                       ^~~~~

Regards
Rudi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
