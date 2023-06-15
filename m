Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19158EB64D9
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jun 2023 21:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M4mvFVZrNtVBSA7f+lJA6F/HdFAJ1pY/S7+j89quxCA=; b=tsEgbhbhxr/SjL
	29gvRV4ROtWamLQaahRoE2xBAy8+JTsD3esTdewI3B3YckyhxB4hONiwFtCSKzXpQbUMC01iFXkft
	tQGo9MY33Mt5aEOGcweCtcaVumXo7pogJEqxuN31sv0wx9MEQ2AKErkGi6N61w72e+rXJrspgKXYX
	7y0u0uZ2rrSjNoZtnvn/wnz8Ytap9RXg4AVsc0FlvWXJhkW9o0d2EyXTxrAKROnhD9SyfUb6zTQ65
	TC0g5VjWnBNIi+TarBuJDMcwzzcSrklGPTJGUXeXK1ox23DFvMK0e7i4P0QKAs5YpTGkUDILrlaY+
	55C+khnvuDinxoyMdYnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9uQB-00G82o-32;
	Thu, 15 Jun 2023 21:22:23 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9uQ8-00G80c-32
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jun 2023 21:22:22 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-57001c0baddso1227047b3.2
        for <linux-riscv@lists.infradead.org>; Thu, 15 Jun 2023 14:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686864139; x=1689456139;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=S2y2ag2VSA5iJWjnLMJgW21sD26IXOkwRb84bIEjNFc=;
        b=xQ0UEfbeHsvyF9P9GSzV8sPaDnCduWem82QRocOPVTimyNaz+TtzXunPSdeRzXvvAi
         vai/I3V4xnGwkuPBK2C8BxgXmG/grI3PNJPpvIXErHwA9uzmeBRdld+oVJisQfogsxl0
         vGLKSwM0YFacwx/AmX5Id6XW9gRfBLJoOHHDKed5GhoMi63Kk25c1kBjAvC4IVlUHe3e
         oelGGGI8RCOSrTPLR5K32xFZslyRFLZPbM5b3aFNmrO++aNzcuug8bpdMx1IF1HOO2ol
         NHDhCqI2eK44IOXmk4glSuyplwnvkIK/n7XkQCIImv5fgRh6qF4f64HAb8zfCbRE0z7D
         2CQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686864139; x=1689456139;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S2y2ag2VSA5iJWjnLMJgW21sD26IXOkwRb84bIEjNFc=;
        b=DPzDgC89t8axxa7UlKaDXk9EdOXBoekt4pgiamdUmwPKVksGia5RfGSIp/J50nHr11
         q4YjKJallhw9V9lBTLn32KOF9pb779LH57pGFmNjJOVY67dI8pDQoSGoKV4pngqj5ZAz
         SiUuChJxv7T1wYiIcuKDMsWLJQ2bECjPC/vowTzpfMpeMVWVw1COF1qpKB1ZkLLecPGt
         n2vJLKlplsjJJKohpzMAT+KX4idYdP8ACHpYNfxMOLeWAsgLx42KmldYydiTj10E5ki2
         cFQUE92LE3zF0bgH3xtpTrodHv6at8hl/0cAgjkolZDm0+Cu2BNWlK4iIvBKkNmyczrT
         dkog==
X-Gm-Message-State: AC+VfDwdcp5wlZZxpTxNEs074y9DJJNR72ARkOZpvmOKlksAu5XWvUWk
	sVj/VmOR5vjE5Fbkwa+G+080SA==
X-Google-Smtp-Source: ACHHUZ7Wn443nNp7TXnOUS1g0CwvPfeS1ec2zVwJBnOAceqd4kD8IQUnTLQfS40NfWgzNKeH64ll/A==
X-Received: by 2002:a81:83d3:0:b0:56c:ea2c:5cb2 with SMTP id t202-20020a8183d3000000b0056cea2c5cb2mr5787878ywf.49.1686864139515;
        Thu, 15 Jun 2023 14:22:19 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id s189-20020a0de9c6000000b0054f80928ea4sm4626438ywe.140.2023.06.15.14.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 14:22:19 -0700 (PDT)
Date: Thu, 15 Jun 2023 14:22:15 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Nathan Chancellor <nathan@kernel.org>
cc: Hugh Dickins <hughd@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
    Mike Kravetz <mike.kravetz@oracle.com>, Mike Rapoport <rppt@kernel.org>, 
    "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, 
    Matthew Wilcox <willy@infradead.org>, David Hildenbrand <david@redhat.com>, 
    Suren Baghdasaryan <surenb@google.com>, 
    Qi Zheng <zhengqi.arch@bytedance.com>, 
    Peter Zijlstra <peterz@infradead.org>, 
    Russell King <linux@armlinux.org.uk>, 
    Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, 
    Greg Ungerer <gerg@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Helge Deller <deller@gmx.de>, John David Anglin <dave.anglin@bell.net>, 
    "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, 
    Michael Ellerman <mpe@ellerman.id.au>, 
    Alexandre Ghiti <alexghiti@rivosinc.com>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Heiko Carstens <hca@linux.ibm.com>, 
    Christian Borntraeger <borntraeger@linux.ibm.com>, 
    Claudio Imbrenda <imbrenda@linux.ibm.com>, 
    Alexander Gordeev <agordeev@linux.ibm.com>, 
    John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
    "David S. Miller" <davem@davemloft.net>, Chris Zankel <chris@zankel.net>, 
    Max Filippov <jcmvbkbc@gmail.com>, x86@kernel.org, 
    linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, 
    linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
    linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
    linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
    linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v2 07/23] mips: update_mmu_cache() can replace
 __update_tlb()
In-Reply-To: <20230615155059.GB3665766@dev-arch.thelio-3990X>
Message-ID: <76b41825-30fa-b9e8-d043-2affcba24317@google.com>
References: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com> <178970b0-1539-8aac-76fd-972c6c46ec17@google.com> <20230614231758.GA1503611@dev-arch.thelio-3990X> <f5526f17-9d78-f7ea-427a-7e76bfeb6b8@google.com> <344a4da-3890-45fd-607e-b5f85ca6ad48@google.com>
 <20230615155059.GB3665766@dev-arch.thelio-3990X>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_142220_978888_1D801FBB 
X-CRM114-Status: GOOD (  19.67  )
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

On Thu, 15 Jun 2023, Nathan Chancellor wrote:
> On Wed, Jun 14, 2023 at 10:43:30PM -0700, Hugh Dickins wrote:
> > 
> > I do hope that you find the first fixes the breakage; but if not, then
> 
> I hate to be the bearer of bad news but the first patch did not fix the
> breakage, I see the same issue.

Boo!

> 
> > I even more fervently hope that the second will, despite my hating it.
> > Touch wood for the first, fingers crossed for the second, thanks,
> 
> Thankfully, the second one does. Thanks for the quick and thoughtful
> responses!

Hurrah!

Thanks a lot, Nathan.  I'll set aside my disappointment and curiosity,
clearly I'm not going to have much of a future as a MIPS programmer.

I must take a break, then rush Andrew the second patch, well, not
exactly that second patch, since most of that is revert: I'll just
send the few lines of replacement patch (with a new Subject line, as
update_mmu_cache() goes back to being separate from __update_tlb()).

Unless you object, I'll include a Tested-by: you.  I realize that
your testing is limited to seeing it running; but that's true of
most of the testing at this stage - it gets to be more interesting
when the patch that adds the rcu_read_lock() and rcu_read_unlock()
is added on top later.

Thanks again,
Hugh

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
