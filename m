Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9103AC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Feb 2022 23:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=c76UkknOVZnvMLb+euTC3zc24aoE6az+qgMwfOziNqE=; b=WNHiJSCvZfbAoLqiw6oIK35qKA
	TG/UF7ELQkMbGcG0twA9O+HTIpyNqHDxtADkGiwFnmzNCUQatdrF/u6ulaTbfLTOxX2lwu+OXnGDG
	yqwhxGQRwvytDzKAVLiJkFwX6voVY2A44uBMmbN5tEHgy5cL0/lgEPgJmpJMN6XCb06iR07+UV4lM
	jZLAzSph9FYIbzl/b3w4Cl/ir+1AFv8q4A4RI5YtWs99aYVz+Ewhr9EteYJdVLVwLE277oA6b7tlb
	W3KLzxaW66tUv+mAlKAsqA2PVef47O5fIQKi8hItqKOEiDVC59cQ3EQChfYjb/4uENSSHqHQrvN/s
	u4nZzjYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMeNX-00Bt2j-Ul; Tue, 22 Feb 2022 23:15:31 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMeNU-00Bt23-Qb
 for linux-riscv@lists.infradead.org; Tue, 22 Feb 2022 23:15:30 +0000
Received: by mail-pj1-x1033.google.com with SMTP id
 nh8-20020a17090b364800b001bc023c6f34so460439pjb.3
 for <linux-riscv@lists.infradead.org>; Tue, 22 Feb 2022 15:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=5pE50TTDWFLueJKrt7WZSWbPDAQlxEYigig8ufnxSqw=;
 b=MomlBqvzX/EV4d871QSkrxnPcNmppWaV+rJ5eU0e7Zw3bAOk01v1rBmpiWbTUT9VH5
 BOtWmYtrGqVHpApv9N2nYi7AmBk5kNAH5vhT8k7DyGgeSyDvdMfN1p7qIXDw45Nx28ps
 Yg1gWSViHyjbxkE7Y8hmm1rsMV05a3io++T+1HgLp8ZIeZgQ6zS049SyP8s2fQhV25I1
 zHNdfoR2d7nzrwqXP5+Jh88vRj/Iq8wqiLRSYSCCrClUEK20e7HvBCq+2U2zos9KtiUa
 A4u6m6iHcuGFdPCRZuS7/GeAQZIAhL61rvkByDSvMD73FkAsVvC4QF+7wxrQugiShAz7
 koPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=5pE50TTDWFLueJKrt7WZSWbPDAQlxEYigig8ufnxSqw=;
 b=D0KMkQ5WyQEpeublO26p3C4BZ1KuSdCn5Zxmwu+fEwEqDAmjapBmd1RMWgAIHFfu4z
 Oet+2xBzTADGin7PXX7/qU5VPlzhK9FI5LDDxEb/i+mmSjKmiXyFdWxdkGfIpo0+aeVa
 zy8Kml+B2zgx9gq4/g9wcnVXGF7ArLn2w1lRpZavrZsncJbQLdyirigeixij1TpaM9eB
 wrimQxWryFdxXGZdtoRWh/yRLTLrG3N2cR0N1K9A8Ww2nMl5PGiCVo2RPCNU8MWKv0NT
 4HIDReAbnURVyYG0ddmvuhuhvSEVHXiTXfXBVRNH8XfzQfouQYV8OJ7vKnffTBuwF94s
 WR7Q==
X-Gm-Message-State: AOAM531seciwKwR7vbM449W28By9eLX6cPiHi8SFfhMsaMiS3DGkbQSx
 6oz1R2iZCzTAdt0PGWpN6H5KrXgeH41fJA==
X-Google-Smtp-Source: ABdhPJyyATbltkiRInaszXFhi6tfmEasdHLKV+OMPMQ0rqqSD4GjJ3HZPfOe27ft9wDuT8FYyHr8ow==
X-Received: by 2002:a17:90b:4cc6:b0:1bc:210d:b6fa with SMTP id
 nd6-20020a17090b4cc600b001bc210db6famr6416375pjb.104.1645571727708; 
 Tue, 22 Feb 2022 15:15:27 -0800 (PST)
Received: from localhost ([12.3.194.138])
 by smtp.gmail.com with ESMTPSA id h21sm17640393pfo.12.2022.02.22.15.15.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 15:15:26 -0800 (PST)
Date: Tue, 22 Feb 2022 15:15:26 -0800 (PST)
X-Google-Original-Date: Tue, 22 Feb 2022 15:14:36 PST (-0800)
Subject: Re: [PATCH v2 0/7] Module relocation fixes and asm/insn.h header
In-Reply-To: <20220131182720.236065-1-kernel@esmil.dk>
CC: linux-riscv@lists.infradead.org, kernel@esmil.dk,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 peterz@infradead.org, jpoimboe@redhat.com, 
 jbaron@akamai.com, rostedt@goodmis.org, ardb@kernel.org, alex@ghiti.fr,
 jszhang@kernel.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: kernel@esmil.dk
Message-ID: <mhng-8e6926b7-c690-4398-a70a-072b11d7e6fa@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_151528_933649_4CD24EC1 
X-CRM114-Status: GOOD (  21.45  )
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

On Mon, 31 Jan 2022 10:27:13 PST (-0800), kernel@esmil.dk wrote:
> Apologies! I messed up v1. Please consider this patch set only.
>
> The first patch removes a bunch of code from the asm/module.h which is
> included in almost all drivers through linux/module.h. Next are two
> patches to fix unaligned access when doing module relocations and do
> proper range checks for auipc+jalr offsets.
>
> I'm a little less confident about the following patches, so consider
> this more of an RFC for those. The idea is to consolidate the RISC-V
> instruction generation and manipulation similar to arm64's asm/insn.h
> header.
>
> /Emil
>
> Emil Renner Berthing (7):
>   riscv: Remove unneeded definitions from asm/module.h
>   riscv: Avoid unaligned access when relocating modules
>   riscv: Fix auipc+jalr relocation range checks
>   riscv: Add asm/insn.h header
>   riscv: Use asm/insn.h for module relocations
>   riscv: Use asm/insn.h to generate plt entries
>   riscv: Use asm/insn.h for jump labels
>
>  arch/riscv/include/asm/insn.h       | 121 ++++++++++++++
>  arch/riscv/include/asm/module.h     |  87 ----------
>  arch/riscv/kernel/jump_label.c      |  12 +-
>  arch/riscv/kernel/module-sections.c |  71 +++++++++
>  arch/riscv/kernel/module.c          | 237 +++++++++++++---------------
>  5 files changed, 306 insertions(+), 222 deletions(-)
>  create mode 100644 arch/riscv/include/asm/insn.h

These generally look good to me, though there's a lot of bit-field 
twiddling so I'll take another look before merging it.  There's a 
handful of minor issues:

* There's a fix in here, mixed into the cleanups.  It's generally best 
  to split those out.
* There's another copy of the insn patterns in our BPF JIT, it'd be nice 
  to clean that up too.  That can be a follow-on, though.
* It's 2022, but there's some 2020 copyrights.  If this really is old 
  stuff that's OK, I just wanted to check.

I'm usually OK just re-ordering patches myself, but I figured I'd have 
to ask about the copyright dates anyway.  LMK if you want to send a v2 
with the fix pulled to the front, and what you want me to do about the 
copyright dates (if you're going to send a v2 then just fix them, but if 
you're not then just telling me is OK).

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
