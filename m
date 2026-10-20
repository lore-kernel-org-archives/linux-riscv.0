Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B811606A31C
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Oct 2026 17:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1tOTkNgh;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VBAD7cdN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	MIME-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=+VQPIQIGPRAr5cmxIDM9c1Z0k7X60VOJZ1MrqQpQyW0=; b=1tOTkNghZoEZrbWxWybUAe762V
	BrMRY9si4veD7xQt8uBWBNYqGNz0p6I8sWmzTeCXblUHrYT8QSsyDMQJWmuf6Z+5JDarplF2Wcb/T
	WERJnX1mOuejawOGxzl0NrUOc/j3XGBecA4/V3yPYZMI6vF0I1jG593jCwUZHqsjh7WXL/8XFIg5t
	xsidY6ZDCr5AbCfe1MAcJa4l/MwCl8vVk3pt0wQflqWv9UK+YoXuSw5X3gnpjz/mecuiPbzlwJiBH
	RAVYdAbXGZOhcykgBvLnPB+LTJGdWCjnTzO4ERYXWMnAaYlPH2Pk9GkT/SoALDoM203Kz3Gx/1Bc8
	OdhiB0aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJDHn-0000000AJO2-0ytj;
	Tue, 20 Oct 2026 17:06:03 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJDHk-0000000AJM6-1b24
	for linux-riscv@lists.infradead.org;
	Tue, 20 Oct 2026 17:06:01 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-8b0e1b91607so3881377b3.0
        for <linux-riscv@lists.infradead.org>; Tue, 20 Oct 2026 10:05:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792515959; cv=none;
        d=google.com; s=arc-20260327;
        b=Fsns4I7cy/tGNbBYnxjDoafgZRT2nzl9OuKQukeGL3ONbjXJCGtJwixpYe2pGCEwQS
         PazcRCkrp+WR8hiZNfHlKfEQ2KA/C2NPAScXX+AzjwhivSMRow+16vhcBjGG8L9oCP8l
         MPruprmED0k1DVZR9xzr7El9+UEGh0FjZ+QhLL481VtgoJz5XWwDSRsj0d9449GjqDCa
         Olguq4SqO5zw/UGk4SV9QSIYdP7yupxsHYWn0UZD4tRNmm0XF0nGlmaXE5zMY/7Ggt3e
         Hc0PpW5J/o2y799soehyuZKuK7lNfQy0zPxy9aJQF3TYsyDuU8YEBaZ7lnKMFJuTr9Lz
         LQeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=CawfSGUltcTxf3WieqiwxZVbLh4EPDpBCzdr6aE2BVo=;
        fh=x3LxJ0apPFRNKTGq6KJojlVaxbFHw4+AcpO0WkWOWdE=;
        b=aVIRLv+aBcBcnbcrVUJTGc6mzJbfZ5l4DWU2hOG2jxJWcTLEIE1Wlz/k7XQ4r8jL+9
         o2NrAK8vMXbnpXzkAlMfKz5rEBsU6cVNR/VSHu5QeNp0uPQiHtRcnoFsPSmnBGHZfAvI
         71gkIwZLIsMMn3bXGum0jE+8pgK+j3li2rzYstHRhjRMwcbtSo6AZKlYX9Cd+yX3B1HH
         kEXRwMeXNlDQrIFyzwrTpplPO6FqVr2G8l16/f6TJWS4S/hwoQlj/4ntY2aInivMQfnu
         /G+eq883gp9jyblrnVjVuzLbHag8QKEJy1sTvKBqGxUQSjGRbkJXjWcEZvaFMvFIIBej
         jKoA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792515959; x=1793120759; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CawfSGUltcTxf3WieqiwxZVbLh4EPDpBCzdr6aE2BVo=;
        b=VBAD7cdNrQdiJk1HJF3fZpnUeOQ3SKU4eOQWHlpi90Nhyq7XOOOhgt/7pSI0YZOpyO
         z19ZxvxoVFr1d1t90pIXAlVpiwIYjTE7r6DRJOw1vkdNlihjrnW2oHdP2q2pE7SHl6fV
         MBbf/rfHO+xu1XoB6iLajEduBzKCAS+P5mNA+02ArpTB7vpU62wjzLGzdo+Mn8UaAqrg
         pT1I4jfwe8BlPao7OPl7M4a+Zu396Av2ff0cME6ZxwuWsNEKAfHKnDQXgF1YdAwN0JjD
         NaKjm1GOQshTqFoZxIXeiLf+ZkTnfY7tTn5+2BpoXBdEZqSNt9btwtPgoxEGTZnMn+w8
         MMKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792515959; x=1793120759;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CawfSGUltcTxf3WieqiwxZVbLh4EPDpBCzdr6aE2BVo=;
        b=o+hXjzvXvBHwjel2xro2VY3hemdumzrsJLEmnp8sFauRGeVNjFqHvBy2PtxOCTGYr3
         nJ0AWl7TQTrEqXUVhgdXbQTFChkNRAw2+6lV4L9eSMkCNmnvgzg9mvjhsxQcz6j9bE2s
         umURycc/CbdnjV8eCgKmuHV26k/OlXOgkQDiJ89gumCunsIIe9Qu9JJz3Buqij+4USfc
         nHeFgc+nQx+eCY3I2reqATPVmV2lN1Ila9nDDtLnEnT4Sr6Jmxw4oj/TJ1VOER4nBLCZ
         2BuzmKHtAWqZFyJ9oAQOQY9fWCif3veJG7uHbYdLGlOfiIOPdBl4uVxhyQytSuRXcyCT
         E+kA==
X-Forwarded-Encrypted: i=1; AKwUvBwM2ENd0Mhg8RlDrgFmnoAu5TdcLMJeAgQN5gYiNh7GZcWmC9Csw4jp46ubFNsvETUwjmlJC826RWt6Pg==@lists.infradead.org
X-Gm-Message-State: AFq9FYJZubHYdWSTDlv8Gf4wpfQjAsZYyga4CxopHvOifqpPq9bFgv0D
	L7sSJibYPnU0+B/X8OH1dKbJDjoxGolN3M8fC3bS65KW9EBgOrH77ju6IWMa/LcKGoHBdEXPBLw
	g7+qreV5u1aEDlir+WvkZMAO9xMTJeWA=
X-Gm-Gg: AYBFou3MYsZ3rS6qk19AVKWZ1C9BElbKfeGIrEc1dqmajZ2rM5XOxxmByGUiRk98U+h
	UGF6jE67zvs0HYse93hqrOYvOXdwE5W8jmJX0hUlteosebKawmbbSSrvjnNZeY/6IAgS/AFnYs8
	0BpNy47SVBefwTIo0CFEdNaupOD0nzprTbFabEREKMZarCcV0iGGubv42R8Z43NxwPJ8Ox67C3b
	7fVYfD3A0kzTT+SuQ4gIBjqIWBX0XSSyU05CePqOFi38DIMnROBfeYNv3uTxtrszvGqCoC3kjOq
	To2rEHinXsK0SVAmN+DyWSBuDi0yTeq3xAQi+V58dKVnXaTXqUJI+Q==
X-Received: by 2002:a05:690c:6087:b0:8b0:da84:d1c1 with SMTP id
 00721157ae682-8b0f1f1a89fmr64960787b3.0.1792515958898; Tue, 20 Oct 2026
 10:05:58 -0700 (PDT)
Received: from 95991385052 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 20 Oct 2026 13:05:58 -0400
Received: from 95991385052 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 20 Oct 2026 13:05:57 -0400
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <20261019-bug-word-at-a-time-zeropad-kasan-v1-2-f21a3ed6a477@gmail.com>
References: <20261019-bug-word-at-a-time-zeropad-kasan-v1-0-f21a3ed6a477@gmail.com>
 <20261019-bug-word-at-a-time-zeropad-kasan-v1-2-f21a3ed6a477@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Tue, 20 Oct 2026 13:05:57 -0400
X-Gm-Features: AclHuK_DtrU2XCq8YwSMY07NqOt7wGt-hW6PGZPkgwrcRUr2dimhQIUPQ6PwL98
Message-ID: <CAPAsAGz89aKUHzm6U9PQZfkGq-GnWsm8AYHeo5+4u34LHk4uZQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] kasan/test: cover load_unaligned_zeropad()
To: Qiliang Yuan <odys.yuan@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, Marco Elver <elver@google.com>, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-arm-kernel@lists.infradead.org, Kees Cook <kees@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kasan-dev@googlegroups.com, linux-mm@kvack.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_100600_429949_E271B913 
X-CRM114-Status: UNSURE (   8.96  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Qiliang Yuan <odys.yuan@gmail.com> writes:

> On architectures with CONFIG_DCACHE_WORD_ACCESS, load_unaligned_zeropad()
> does the word loads of the dcache name compare and of path name
> hashing.
>
> None of the KASAN test cases reads memory through it, so nothing
> noticed that KASAN did not check these loads at all.
>
> Add a case that reads a freed object through load_unaligned_zeropad()
> and expects a report. Skip it with hardware tag-based KASAN, since
> arm64 turns tag checking off for this load:
>
>   kasan_load_unaligned_zeropad, x86_64, generic KASAN
>   without "word-at-a-time: check the first byte in
>   load_unaligned_zeropad()"                                 FAILED
>   with it                                                   PASSED
>
> Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>

Reviewed-by: Andrey Ryabinin <ryabinin.a.a@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
