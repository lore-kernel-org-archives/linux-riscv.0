Return-Path: <SRS0=iqkr=RH=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11F95C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  4 Mar 2019 20:35:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D470620823
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  4 Mar 2019 20:35:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j1PTp3AC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="CF4eeDQZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D470620823
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=6Jl5CQ6dIyZK5j7CsgDVET5GyDTh4brSCDxRvt7lLkA=; b=j1PTp3ACykBYWIjZJUOcoOXBn
	iBV4tSzv31NS4+HslPb/y+kxIQHr3ttVb80QgqS2VO6QdrjrfJ4xcJgLWRbHnFMsV/JNqTbKVEU/U
	Qe969BE99blsMBTxL2NDXLxp2XFsZHX9O0AomKnpb4Sb3T+6YKIWywfJofNmQ7KRk6UbAPcJHmJyv
	PN2CVlDTWPWF63+2DyZiF+zAT6H1YZ0WqDjKwoiJufzjrhLc7XbJayDGxSMvThGCcTWWzD4gsUdLs
	4Tz2zkhglNk8N5GCHC1bTnxMXEYw9y+nS3pQLntoPVQ/hnQWg3/rf3cVd5Yc7B+xzQBJP49M+W/yE
	vl0mw/ccA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0uIq-0007rp-9Y; Mon, 04 Mar 2019 20:35:12 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0uIo-0007rS-DY
 for linux-riscv@lists.infradead.org; Mon, 04 Mar 2019 20:35:11 +0000
Received: by mail-pf1-x442.google.com with SMTP id g6so3832880pfh.13
 for <linux-riscv@lists.infradead.org>; Mon, 04 Mar 2019 12:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=xNmRIXO0MDorylQ6to2ktdfK3KWc9juEpeOkY/XwoJA=;
 b=CF4eeDQZAKbaUGzJA9fQrzNzkO+NVHMbfRrNep/Zh7xnCdV2i2ErmB04CC6jBQqoqk
 hCfP4Dn9cDxs3zfMNFBlmeR7wANSPtqE4t6cu7eeKbr0YwyFvysVuUibBE9E7eAJ41tL
 GqWbKYsVAmzlSdSWYZMozNM/IyRS5pZiqMJ/orvBDADJAw59YjXJH/1MwGFNaLaubEMQ
 TZ4vC7oPA258zLV2nXE3/rplpdeR+ObDgk7ZXMiSm1XnCwHa5tOuu+qqtEGgp77hCQIR
 nkGnJjQ5KOtV6v4FEVwVjzBX962VYSQBtbyINOxVkyNAfPT132cTXxOpIJljqe0XDgy8
 lp/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=xNmRIXO0MDorylQ6to2ktdfK3KWc9juEpeOkY/XwoJA=;
 b=rhDZpfUbeFNt96RjfbK4y1r43R56N777QDjxMfrxPAz/4GOiWCZvCWZw6C0R5zjFRn
 2l0uRawopa1UgwuDcILmwoJI9maZlHXkJcy0SafT0ZOeW+BZQ5nYbM7FaAevfS6Cq+xz
 bQb+m7xpbCxONEU/otFscZ1LeAuiQK3j0XhxNfjOBjFkjooaQrD4dOWQEfTxyK0VaAkG
 mwllSzWZpc9SSWDgX5RsXz0UHrL0lEHTpa12lu7L6yykIxZjKZUM5IAXTME/QRhgxI0C
 7R/i66GyCaUVAIsa7FZGm73s2AZrH59ViUTjbCvs61DYiZ9qQJhIxu+7NuilTWSIixVG
 H2fA==
X-Gm-Message-State: APjAAAVcHbS5sESItVkZZDohdQ90nZ7o0TiQSlM8MhiW2ORr4Casqzi7
 zP4jr6j6SlpBq/ZRzSKsGIFpnA==
X-Google-Smtp-Source: APXvYqxja//u6kgFzU5DvfMkiEewZ3u55h1AEIkISeL6/xSWE/saZvaIZksEJL1uE6MRINFUnKohqQ==
X-Received: by 2002:a17:902:728f:: with SMTP id
 d15mr22290851pll.156.1551731709722; 
 Mon, 04 Mar 2019 12:35:09 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id k74sm13911823pfb.172.2019.03.04.12.35.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 04 Mar 2019 12:35:08 -0800 (PST)
Date: Mon, 04 Mar 2019 12:35:08 -0800 (PST)
X-Google-Original-Date: Mon, 04 Mar 2019 12:34:41 PST (-0800)
Subject: Re: [PATCH 0/3] riscv: Fix debug instruction check and support
 trap-based WARN()
In-Reply-To: <1551349891-22683-1-git-send-email-vincentc@andestech.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: vincentc@andestech.com
Message-ID: <mhng-76c68381-da6b-4b8c-97c9-e38d503b93bc@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_123510_491725_B8C53993 
X-CRM114-Status: GOOD (  14.82  )
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
Cc: aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, vincentc@andestech.com, ebiederm@xmission.com,
 linux-riscv@lists.infradead.org, deanbo422@gmail.com,
 Jim Wilson <jimw@sifive.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 28 Feb 2019 02:31:28 PST (-0800), vincentc@andestech.com wrote:
> The handler for the debug exception will call is_valid_bugaddr(bugaddr) to
> check if the instruction in bugaddr is a real debug instruction. However,
> the expected instruction, ebreak, is possibly translated to c.ebreak by
> assmebler when C extension is supported. This patchset will add c.ebreak
> into the check mechanism. In addition, BUG() is currently unable to work in
> the kernel module due to an inappropriated condition in is_valid_bugaddr().
> This issue will be fixed in this patchset. Finally, this patchset enables
> WARN() related functions to trap the code to help developers debug it.
>
>
>
>
>
> Vincent Chen (3):
>   riscv: Add the support for c.ebreak check in is_valid_bugaddr()
>   riscv: Support BUG() in kernel module
>   riscv: Make WARN() related functions able to trigger a trap exception

I'm finding this patch set a bit hard to follow, and I think it has more diff 
than is necessary.  For example, the first patch introduces a new die() only to 
have it removed by the third patch.  There's also some unnecessary 
non-functional diff, like

    @@ -149,12 +161,13 @@ int is_valid_bugaddr(unsigned long pc)
            if (probe_kernel_address((bug_insn_t *)pc, insn))
                    return 0;
            if ((insn & __INSN_LENGTH_MASK) == __INSN_LENGTH_32)
    -               return insn == __BUG_INSN_32;
    +               return (insn == __BUG_INSN_32);
            else
    -               return (insn & __COMPRESSED_INSN_MASK) == __BUG_INSN_16;
    +               return ((insn & __COMPRESSED_INSN_MASK) == __BUG_INSN_16);
     }
     #endif /* CONFIG_GENERIC_BUG */
    
    +
     void __init trap_init(void)
     {
            /*

I like the idea of the patch set, though.  Do you have time to clean it up and 
submit a v2?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
