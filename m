Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06EB4C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jan 2022 21:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=UgPxABJQDo6rOSbOLG6OWQ8qmJjzJPRL0b9TIki6DZg=; b=ltUkBqauM/ZFDlgEBzm/F4DfkW
	FuJPsirzvzrYbIOH5Fal6Bx9vmHFWEqBA7AK4T2fxJdA+Ye17HC7HF0vSuG1MpLKmRNZKV2SECOXm
	fWYP3GM7VSnvs1mW0B82t+rLJa0ihX74N7eytPKxhlOQo5SwAEEFTsH0DYoInNVRWAeai1iTsRAQr
	q5vSJrJxttSvsa8xT2VAY9d/y7d5lkjhSWTMvmIwvqihVmhEu+3lDnr0c2wAcFY4nVi2scjR4wA9n
	GIWtBGmr96DnD3WlUl5sGM19Z1R3ggam+qITVV6DG86hlbKYW+Zuj9L1I8aJOUbyPcnr2EWkhvh8V
	5bOLScsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5xFY-005KG8-9B; Fri, 07 Jan 2022 21:58:16 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5xFV-005KEL-2o
 for linux-riscv@lists.infradead.org; Fri, 07 Jan 2022 21:58:15 +0000
Received: by mail-pl1-x630.google.com with SMTP id x15so5921751plg.1
 for <linux-riscv@lists.infradead.org>; Fri, 07 Jan 2022 13:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=YwXvl9LyxPLT5KXmkZnhb1YhT1RhoPjqa4mfsaDtNLk=;
 b=vCOx5mxoPf5yDaezl0FLUSox3TvjNiTFVaS3YESthdUcIUX2XkP1LEQJz3KCfNEu4/
 dr5dFPmSJwo6+a60TPNeMwGKmfG7+V/ijQpoV2zFmRm0wjKZZQeE1wzBcPTixDmEUqxK
 M3ypkkcyHDB1SjRF+HkryUIKAQgySodaHoKr9XKCrzpAhx541sqP5yAtg/aMBhjtZnXV
 xG5GcMJEBdig7xMx6p8UF2xXquE5hd0GemBXAylcSEmp8+UsAeVGCmK2HRmUEHMa1UnB
 QBxfIj9gqYF22D5wyzqcSBBOQ3MZ/yxtk6O7W3G2Q4NsA1GN9MduSokiAeTfowGE15Pf
 SXOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=YwXvl9LyxPLT5KXmkZnhb1YhT1RhoPjqa4mfsaDtNLk=;
 b=LSdw58/uVc8lQXwYHL+RJzfSXPT2O4ZmeSvUwBX+nnXHgDE9ON8D5KBC6wky1cKtod
 B02mbKWEFkApGomm9D0JgyoGYtBu6FxAJ3cjo++bz/YHhXuLiahT2F0eNArqK3EXkbv1
 ia7jyalgi2QeAuRNTZyXa+p30yPf88rkPAOHM4poINSbQ+SOTsX/zGn/b1F+BItQsV3X
 7BZT/iJ/FdL1Zo6MkTcTFefXbX4H6WdLo7/YrevnFP/PIwC4CWto4msoK6cuVupEE+J3
 tQigo+6dcXXZoWg5MjBSiDHSaWE8q1zoi0hQbX67KPnWW6Kex9YFfUUlUPJOiK1HywHb
 GbuQ==
X-Gm-Message-State: AOAM533KGpibfVCJ0z7xSO5mwuhyLtrJjDApFd6B7vigc9HiGqnzWPgw
 bmYua+0XJutxzCIEmnQS+em/tA==
X-Google-Smtp-Source: ABdhPJwjdYvL9KC4dQqmY1X2DJSMm1IhfC/WV0RmK9svOcjiOdVLZeVIvOciLmiFA1ZiydXONVBgwA==
X-Received: by 2002:a17:902:a589:b0:149:dc8c:76ad with SMTP id
 az9-20020a170902a58900b00149dc8c76admr13027341plb.94.1641592692055; 
 Fri, 07 Jan 2022 13:58:12 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id p32sm5500061pgb.49.2022.01.07.13.58.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 13:58:11 -0800 (PST)
Date: Fri, 07 Jan 2022 13:58:11 -0800 (PST)
X-Google-Original-Date: Fri, 07 Jan 2022 13:57:44 PST (-0800)
Subject: Re: [PATCH v1 0/2] Provide a fraemework for RISC-V ISA extensions 
In-Reply-To: <20211224211632.1698523-1-atishp@rivosinc.com>
CC: linux-kernel@vger.kernel.org, Atish Patra <atishp@rivosinc.com>,
 aou@eecs.berkeley.edu, atishp@atishpatra.org, anup@brainfault.org,
 damien.lemoal@wdc.com, devicetree@vger.kernel.org, jszhang@kernel.org,
 krzysztof.kozlowski@canonical.com, 
 linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
 robh+dt@kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: atishp@atishpatra.org
Message-ID: <mhng-791652b4-53f0-48e4-a640-f4c418c9926b@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220107_135813_199584_1393C3EF 
X-CRM114-Status: GOOD (  22.27  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 24 Dec 2021 13:16:30 PST (-0800), atishp@atishpatra.org wrote:
> This series implements a generic framework to parse multi-letter ISA
> extensions. It introduces a new DT node that can be under /cpus or
> individual cpu depends on the platforms with homogeneous or heterogeneous
> harts. This version of the series only allows adds support for homogeneous
> harts as there are no platforms with heterogeneous harts yet. However,
> the DT binding allows both.
>
> The patch also indicates the user space about the available ISA extensions
> via /proc/cpuinfo.
>
> Here is the example output of /proc/cpuinfo:
> (with debug patches in Qemu and Linux kernel)
>
> / # cat /proc/cpuinfo
> processor	: 0
> hart		: 0
> isa		: rv64imafdcsu
> isa-ext		: sstc,sscofpmf
> mmu		: sv48

IMO this is the wrong way to go.  I get that the ISA string is very 
complicated to parse, but we've tried to come up with other 
representations of this we've ended up having that interface break when 
the ISA string rules eventually change.  We should just stick to the ISA 
string for these interfaces, as that's at least something everyone can 
agree on because they're defined by the spec.

That said, we should add the spec versions into this interface.  At 
least the user spec version is relevant here, but given that we're 
passing through some other priv-level details we might as well pass that 
though too.

> processor	: 1
> hart		: 1
> isa		: rv64imafdcsu
> isa-ext		: sstc,sscofpmf
> mmu		: sv48
>
> processor	: 2
> hart		: 2
> isa		: rv64imafdcsu
> isa-ext		: sstc,sscofpmf
> mmu		: sv48
>
> processor	: 3
> hart		: 3
> isa		: rv64imafdcsu
> isa-ext		: sstc,sscofpmf
> mmu		: sv48
>
> Anybody adding support for any new multi-letter extensions should add an
> entry to the riscv_isa_ext_id and the isa extension array.
> E.g. The patch[1] adds the support for sscofpmf extension.
>
> [1] https://github.com/atishp04/linux/commit/a23157264118d6fd905fd08d8717c7df03078bb1
>
> Atish Patra (2):
> RISC-V: Provide a framework for parsing multi-letter ISA extensions
> dt-bindings: riscv: Add DT binding for RISC-V ISA extensions
>
> .../devicetree/bindings/riscv/cpus.yaml       |  9 +++
> arch/riscv/include/asm/hwcap.h                | 31 ++++++++++
> arch/riscv/kernel/cpu.c                       | 16 +++++
> arch/riscv/kernel/cpufeature.c                | 58 ++++++++++++++++++-
> 4 files changed, 113 insertions(+), 1 deletion(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
