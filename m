Return-Path: <SRS0=g6PI=EJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70882C388F2
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 11:15:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA8CA22403
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 11:15:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qK4GXMFh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=shutemov-name.20150623.gappssmtp.com header.i=@shutemov-name.20150623.gappssmtp.com header.b="izMTq7qx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA8CA22403
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vhRV7dAsapttIllP+RWJe/Ki0dXBPTBiTQzTqi2leAs=; b=qK4GXMFhPRQgFzGGY4zCt4jo+
	9nboe485CjHMmwp2LCalE65a7CR9RtAmwZ6qraHn+nRejgu6cPOYiH89O7Fexe5N2i+efDNIQzIAZ
	Xr1Kvzb5/si9xg/ouCMrskmsEgA0GadXtxcDgFxDWJ9TlClptUq+tIUHscrrPzl7+00k4ROit0RvR
	KHpTT2dgy1ykjSO2xyu4jbvAMMwTpnp87+L6hwu8YpwXUx/mn9AyJuJeRnTiNSICShpyebq3WMHQL
	078CckER3Xi6A2FwXxObtGomvnk8SsBtolxMCoZ8zL3OwUrMRp/CSMxhhxT8RZyW1pvGZ6h7/WFMk
	xPezqB0hg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZuHk-0003cw-Am; Tue, 03 Nov 2020 11:15:32 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZuHd-0003aA-8m
 for linux-riscv@lists.infradead.org; Tue, 03 Nov 2020 11:15:28 +0000
Received: by mail-lj1-x241.google.com with SMTP id m8so12548319ljj.0
 for <linux-riscv@lists.infradead.org>; Tue, 03 Nov 2020 03:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ncuj71puAub1y9k++6jjBlDK0kArgOgR8TXfNbxvsd8=;
 b=izMTq7qxXBvApfWEFsxvjdUJPgrZuhTimURmEAxHbNo4gFnz/aLq2b7VWGISw5z4df
 T4qAkIJ/wVC4TwenAjvns/G4eV3KtASB7SoA8G7okZ0DlaEStNAMb73QDSEutPwz7Cxr
 9dwIgPWHz7UWHdA9P9qEfMywjEVY/N8zUXbSYG6q36rmSFiE581fBMYfvokjD/8gAh06
 qYdTpEzw9QcJY1be9GP/o6iEFZwXPue/WXhcJtWuRvtKWCdMX7XpnZXp5E2hc11zR/K7
 2suAPN+eebeKUXh9rBamFs3h05hvuWg15bi4K5NGwazMJ1rOL7mta6TyCdehAzblBry8
 3fFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ncuj71puAub1y9k++6jjBlDK0kArgOgR8TXfNbxvsd8=;
 b=O9keAODfg3bPmJJ4s6cWtvQWdkF+z9iIg9rjYBW/4HF9nJBUcHRpXUOaC4TYMtEiEF
 QgjTtwZpqGvSQ8JyErH4V25mnwCMW0A+ufN4kKzfKa8x9Q0ZDh9iXuVkWjxOSgxIIUgs
 umwKbapIeIwTxZ2uAsu8YZlNcS1QMw/R36w5ce4tgfy3gxsCssHOLOckKHQ5lNCGSwUQ
 5iuuxUXMGFNDVTVwRcc2TFAYLEy4CVnVW6bDYkeSD9NVayVPAvYeaFKg97QoT7eh+L9e
 7GUPpJiDFHGbIUyQCyrp65Yf9a4ituIngeLEZ3+lFkrh3Fo1pJrNwxktNYmfUp4S33Wo
 pXlQ==
X-Gm-Message-State: AOAM530IAKNh9Uz/hhpLNLZyX6PlKhNCdcg8mvRbASV/Q0RPhbpQV37F
 G9+qPCzUDprIoM+mnRA3iD1JPw==
X-Google-Smtp-Source: ABdhPJxjF5BnQdEHGsyL0gaT34gDeSETHtrYJVXOHHeYBc231eIiqfI8v+rYFTL2Y/vLhKT27dJQgw==
X-Received: by 2002:a2e:b60e:: with SMTP id r14mr8731933ljn.77.1604402123506; 
 Tue, 03 Nov 2020 03:15:23 -0800 (PST)
Received: from box.localdomain ([86.57.175.117])
 by smtp.gmail.com with ESMTPSA id q22sm3657427lfj.145.2020.11.03.03.15.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 03:15:22 -0800 (PST)
Received: by box.localdomain (Postfix, from userid 1000)
 id D700710231C; Tue,  3 Nov 2020 14:15:23 +0300 (+03)
Date: Tue, 3 Nov 2020 14:15:23 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v3 0/4] arch, mm: improve robustness of direct map
 manipulation
Message-ID: <20201103111523.zt5q5ypnnccdlque@box>
References: <20201101170815.9795-1-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201101170815.9795-1-rppt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_061526_579854_44C49411 
X-CRM114-Status: GOOD (  11.46  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, Pavel Machek <pavel@ucw.cz>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Christoph Lameter <cl@linux.com>, Will Deacon <will@kernel.org>,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Len Brown <len.brown@intel.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-pm@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 David Rientjes <rientjes@google.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 linux-arm-kernel@lists.infradead.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org, Pekka Enberg <penberg@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Nov 01, 2020 at 07:08:11PM +0200, Mike Rapoport wrote:
> Mike Rapoport (4):
>   mm: introduce debug_pagealloc_map_pages() helper
>   PM: hibernate: make direct map manipulations more explicit
>   arch, mm: restore dependency of __kernel_map_pages() of DEBUG_PAGEALLOC
>   arch, mm: make kernel_page_present() always available

The series looks good to me (apart from the minor nit):

Acked-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

-- 
 Kirill A. Shutemov

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
