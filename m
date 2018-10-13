Return-Path: <SRS0=D72f=MZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93961C6787C
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 13 Oct 2018 01:44:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64ECE20868
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 13 Oct 2018 01:44:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T7L5fX8x";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="TX0jPv1m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64ECE20868
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qoYh9BOVv7phem1TEVjrfpmc6olMfxROlmh64wBVG+M=; b=T7L5fX8xvS+uY3
	/3E1+oKrDzHoWvqBaT7LwyQciWLy2tD2Recul6XFtM7RCfZSeKuHVDCNdlwAo1JkM857/+WxfZdG1
	fmfGmI4MQdYbgl+bmZ1/wcy1uqLqe8tAGb4HGZnefLzaFsbvEvD+axT60brJYTaE1WBRHXyXmopJH
	qhQ6KBcEq53fPnFTZbm8XFdkAam46ilifphj9lNxrU/7RcFhVMczXxR1iv4eqtrBaEJZh3ba/vSxV
	E1EJfDdelfJTBJJUcu8fUl1nOGmkTpzz7LzP3YKnSpMNrTdO0jSZ0nqaO0qXhVJbx7aUJCoIBBFEh
	7EJeqKAlMZOL/LHS8zWg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gB8z2-0007z7-0F; Sat, 13 Oct 2018 01:44:48 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gB8yx-0007wr-CX
 for linux-riscv@lists.infradead.org; Sat, 13 Oct 2018 01:44:44 +0000
Received: by mail-pg1-x542.google.com with SMTP id a5-v6so6595885pgv.13
 for <linux-riscv@lists.infradead.org>; Fri, 12 Oct 2018 18:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=EOwbPFoajGZi3/uQe5h542M6UYdoOEkmWBYBoXp9OV8=;
 b=TX0jPv1mV+ruD3G3qgqRA9UMXe+0i0YS6UXGUy6KTVLywoPyxQGhhjXFi4dn2iQI3x
 x/BukZ3beT2AFdW61n55JqI5ANyPOWfr1rNKfv8VAcertpXgkQEbv+tQZOTO68qVwDHs
 51gxQI0b3N3xdtlX+SiDVTyY2dpjIIcZ8JErQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=EOwbPFoajGZi3/uQe5h542M6UYdoOEkmWBYBoXp9OV8=;
 b=rtKYCVGsCubQAkZ/qVk+nrOE1s+SCG3S0FJ29C2Op2rOItJJlECXolRra3STD0FunD
 a1nDrMSHc/8S6VjYtFSUIsLuNqnHUeWOkGV7eorY8MBuSDo9UftjyeHvRVXDD93RwRvD
 Ii0bIvoTqL0wDvTIkz7PnK6Fpjy5s8RaNv/9oawNfA+EXE7p2kipcwMVdgbOpHF6u4qR
 YNyNONKXVV7hrLF376NjHpBmMNMQ0qMguprY9zyqGAZ5voP//5w+9ZbaY4DRQ+j4rc0U
 Pw/oTHC6Q9SQjLKJkVaPW/uMsTO9GEW0JTpMr8yr+s+BPmyT+731Er5McE6SeD8FXK/o
 SoyA==
X-Gm-Message-State: ABuFfojt1OU3h0XZWEQfQf02I5NqtdaKVvTGrj8YF2ksz2I2ch5TSiIs
 APSXcApEF+Y+juOjesLL8y9+xg==
X-Google-Smtp-Source: ACcGV63XxXW9pGHxVnF8xzzLyeXhR7XaYBjfw87dDDQ+CF+OqnNRmShTWlj1H1kUQbwXg/j2G4ghiQ==
X-Received: by 2002:a62:968a:: with SMTP id
 s10-v6mr8356398pfk.191.1539395071806; 
 Fri, 12 Oct 2018 18:44:31 -0700 (PDT)
Received: from localhost ([2620:0:1000:1601:3aef:314f:b9ea:889f])
 by smtp.gmail.com with ESMTPSA id r81-v6sm6155322pfa.110.2018.10.12.18.44.30
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 12 Oct 2018 18:44:30 -0700 (PDT)
Date: Fri, 12 Oct 2018 18:44:29 -0700
From: Joel Fernandes <joel@joelfernandes.org>
To: Daniel Colascione <dancol@google.com>
Subject: Re: [PATCH v2 2/2] mm: speed up mremap by 500x on large regions
Message-ID: <20181013014429.GB207108@joelaf.mtv.corp.google.com>
References: <20181012013756.11285-2-joel@joelfernandes.org>
 <20181012113056.gxhcbrqyu7k7xnyv@kshutemo-mobl1>
 <20181012125046.GA170912@joelaf.mtv.corp.google.com>
 <20181012.111836.1569129998592378186.davem@davemloft.net>
 <20181013013540.GA207108@joelaf.mtv.corp.google.com>
 <CAKOZueuNvWvn18vffJWpbpg7h-uScT8gXrrudTB2pnT4M2HJ_w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKOZueuNvWvn18vffJWpbpg7h-uScT8gXrrudTB2pnT4M2HJ_w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181012_184443_448707_2181176A 
X-CRM114-Status: UNSURE (   7.13  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-mips@linux-mips.org, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 catalin.marinas@arm.com, dave.hansen@linux.intel.com,
 Michal Hocko <mhocko@kernel.org>, linux-mm <linux-mm@kvack.org>,
 Lokesh Gidra <lokeshgidra@google.com>, linux-riscv@lists.infradead.org,
 elfring@users.sourceforge.net, jonas@southpole.se, linux-s390@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, linux-hexagon@vger.kernel.org, deller@gmx.de,
 hughd@google.com, jejb@parisc-linux.org, kasan-dev@googlegroups.com,
 kvmarm@lists.cs.columbia.edu, mingo@redhat.com, geert@linux-m68k.org,
 aryabinin@virtuozzo.com, linux-snps-arc@lists.infradead.org,
 kernel-team@android.com, fenghua.yu@intel.com, jdike@addtoit.com,
 linux-um@lists.infradead.org, Julia.Lawall@lip6.fr,
 linux-m68k@lists.linux-m68k.org, bp@alien8.de, luto@kernel.org,
 nios2-dev@lists.rocketboards.org, kirill@shutemov.name, gxt@pku.edu.cn,
 chris@zankel.net, richard@nod.at, linux-parisc@vger.kernel.org,
 Ramon Pantin <pantin@google.com>, jcmvbkbc@gmail.com,
 linux-kernel <linux-kernel@vger.kernel.org>, Minchan Kim <minchan@kernel.org>,
 linux-alpha@vger.kernel.org, lftan@altera.com,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 David Miller <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181013014429.cGLzb4EEo_4sFusgIe6p6LXfkCOh0PmxqRgH1hfbFqU@z>

On Fri, Oct 12, 2018 at 06:39:45PM -0700, Daniel Colascione wrote:
> Not 32-bit ARM?

Well, I didn't want to enable every possible architecture we could in a
single go. Certainly arm32 can be a follow on enablement as can be other
architectures. The point of this series is to upstream this feature and
enable a hand-picked few architectures as a first step.

thanks,

 - Joel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
