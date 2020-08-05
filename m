Return-Path: <SRS0=W16s=BP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1867C433DF
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Aug 2020 17:11:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB325206F6
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Aug 2020 17:11:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RRw+FjwX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oziJJooK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB325206F6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3BC0uzi17sV0zctqeldq4u189pk9lXWN7YeXoNWXW3w=; b=RRw+FjwXmrFm72KGcJHK9Fq7v
	4Jr2W6toOaKjswVObQfcgAjjhCjLbFarrDHoB3k181PtNnuEo0yIGDlV5u9SXXkibpavWm4a3olLg
	gyTYAAhvoSfIAEJerXd1+JmCMeYX8896Wg9ZYkfgqlxEufW89D1YF/xT+BMwqvVH29X62nxBOcLYR
	ipBGUGaO9ni0EkNs9AsbYQy418iP8tVjdcyQ872239VfH2CULzG5ccM+UbwzhQDaj6oHdycraIBxd
	k30GhWHzCzYw/kKhEn6g1kzWu/9AOTLlrwclOYX4CbzabEcf4fvUN5Jp8UBWtRY51Lo7rMDeGV9e3
	0yGyfVkIw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3MxA-0007Uw-Fd; Wed, 05 Aug 2020 17:11:48 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3Mx5-0007Sb-9i; Wed, 05 Aug 2020 17:11:44 +0000
Received: by mail-lj1-x244.google.com with SMTP id t6so35623044ljk.9;
 Wed, 05 Aug 2020 10:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wXACrCF85ppHwQuHqdOjCkc1N78NkRlSijLNjTow210=;
 b=oziJJooKYyQ5sG761r04I5LKIuXOAb4zkqQY0rWC/xo2s+cTYTs9U7RyQWnqJ5pq1v
 Nbi4cMvrIp/CIcHu8pIr+eoqlm0BvwqSZf/j11GWMus1IVdOI8eFA+JP3OpxAqxrqH8K
 4U3LrHkbnbOlDfybyMuly/WmuqEo0ptHsHBq2XUlda4WU2cHiLw7ZD+AnmV8uuOJ/jgu
 3gjhgLG0ATcZI4I3fwTk7ZEPoMTcfQVSsz4xqNOlCB6RK7j7M3zBxlIMpYdsF8DV3rrq
 yNVU9YFhsTtYiIivGSgzfm9XcHZ9fq/Ugzzwuzkf0diKBR/hJ5MKs2YpE9NsOoFGUM2c
 kG+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wXACrCF85ppHwQuHqdOjCkc1N78NkRlSijLNjTow210=;
 b=rVWhDPWwnZMsC8vZLBKB96b22BZgtl0GCcKCTKghzX+j0gw/wMMyB+348AoR5piT1f
 P+Fl3bth/xhulWxNL2KLWSLyY+duTHaI2LExDdNa4jrfE8M3G1am18vTVPW7ku96qcTN
 FFQ/mLDBCcxvMpa1cgm/y6qY+DUSGLbqbLw70pEDpcIntJWLFFM0CrSR5KQsjp4X7Kt2
 Ade9U4zxHkB7mEW4ueT3d7pIl9sCf5eBF+tWlOC26ekMPa8fAhuzXBaespX47IdQtJts
 Ws2s4Ebrtq0jN9ZJLVBZXpRPNecfqw8wm0yhzurSgtsrmySjhkoky/1c9dxED0LHxJ/u
 9qbA==
X-Gm-Message-State: AOAM533BrGgRoDd9xhNpp7GIhYGSLnaIgOhxC0xhAwlY8y8ONINHLbLN
 CpwiOixI7Qpk7uH+QgwQjq0oAS1E6/bM2OxRFOQ=
X-Google-Smtp-Source: ABdhPJwaicIhf8YdyAekvXwX7eOOzcHPiY2LvmIo6u440HJ6sOevFi0lA9FP0nbD1iVE8pjbKUmnQK8GBjMj1kpsXT0=
X-Received: by 2002:a2e:b814:: with SMTP id u20mr1829339ljo.202.1596647501750; 
 Wed, 05 Aug 2020 10:11:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200802163601.8189-1-rppt@kernel.org>
 <20200802163601.8189-17-rppt@kernel.org>
In-Reply-To: <20200802163601.8189-17-rppt@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 5 Aug 2020 19:11:30 +0200
Message-ID: <CANiq72k-hZwbnttADQhi3+NrHkLDVe95jxLAPvLbvSOW41+HaQ@mail.gmail.com>
Subject: Re: [PATCH v2 16/17] memblock: implement
 for_each_reserved_mem_region() using __next_mem_region()
To: Mike Rapoport <rppt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200805_131143_397122_986EC87F 
X-CRM114-Status: UNSURE (   9.88  )
X-CRM114-Notice: Please train this message.
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
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Emil Renner Berthing <kernel@esmil.dk>, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-arch <linux-arch@vger.kernel.org>, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Baoquan He <bhe@redhat.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Ingo Molnar <mingo@redhat.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Stafford Horne <shorne@gmail.com>, Hari Bathini <hbathini@linux.ibm.com>,
 Michal Simek <monstr@monstr.eu>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Linux-MM <linux-mm@kvack.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 iommu@lists.linux-foundation.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Aug 2, 2020 at 6:40 PM Mike Rapoport <rppt@kernel.org> wrote:
>
>  .clang-format                    |  2 +-

The .clang-format bit:

Acked-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>

Cheers,
Miguel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
