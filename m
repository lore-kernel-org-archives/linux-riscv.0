Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9AB60A2630
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 19:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=afmmph5g
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GsJe79DxwEnIo3JW9CbApvZqhQHQ2Pq6efPUXqTT5Cg=; b=afmmph5gZ2vgCNMHK4xiq9PjGa
	VtkmTlPJjVcZtQYsDrYy0Zz2y6qQR0FRP5PR7uQyVkBxvIqEuaehiZlPtSK0z+oQxpjrGj3mpALqZ
	hFalPyY7qLcMTtugCTcfYkgYE4hE8Xy37VqH/HjtsbXLJ7YhpGQ8WgwQCIQVyJ7Bs3xWF+KS1PWZq
	cul+M6DLWBCs+CW9b+3LpG9OEOsfaAdgWMClYfeRfut068OUtTuzHTSeZU+SH2ZWt5+pYQsLAIExc
	W/AHsIvK2CPEOjfIVbHEkQSgkJVD+s3RlN+LxzqI3fL3goRy5diJ00A0moLp/iCj2+ACTZDxACNSJ
	tAZz1Fng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRaBo-0000000AvQX-390t;
	Thu, 12 Nov 2026 19:10:28 +0000
Received: from mail-vk1-f173.google.com ([209.85.221.173])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRaBk-0000000AvNr-00Oz
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 19:10:26 +0000
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5ebf39def3aso81214e0c.3
        for <linux-riscv@lists.infradead.org>; Thu, 12 Nov 2026 11:10:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794510623; x=1795115423;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BiDOWQWnXjiTVlwWz8It4XU8j0IkMRXtLOxSJ2sBmUk=;
        b=Sm0CrU3uBdgWXlE+ol6JpyuIi+ebHsWIBgRpysIOVASorv+YLiTtQ9cDVDuMVqIk0B
         BkYnBWF46Qz/DYBxK/8HwOShpXBXTwq8tj72hMIuC3EKin4kPsZ3l+YqAZs5uRVb2FyX
         gC00mJK7yUcASOAl5Atyr4PjFh9F0oWNKetOM9JL72oZpnWtdGuX71OAwAPNp4uhU2NR
         mUvN+lOQrMYCsEARZL1KXX/l5T3LViPwKIGKsuxxkL/HGR0krX1HhnOgZjeIPjRtOmJ2
         ZQAAEIvKD7YcGnDZbRULQcwo4nKJjiO2ClIKXE3dB1kREUP/kwQ49SXgIIar7P8XP40s
         YIsg==
X-Forwarded-Encrypted: i=1; AL+hErGpdqejKpKmNg39mWG/NXXimy/7EpxOjUqZK5Ae813qrayuhWG4eql0zVokV7e83lRxy6z7N3l/XclaEw==@lists.infradead.org
X-Gm-Message-State: APuU4Z9gCaGJciAzXYZdDXu+A0pGptisW0kFUtPkmuRPqdEZYyg2873C
	7VKJO/P7jFOpnqDhsvPCXjoU1A2ts2Bitp+FYzY/A1t9xQNiEbHb0AIhqpYm1/2SYWk=
X-Gm-Gg: AYBFou2/nqHrei9Te48NX/uc4gsJcuJKvWNye/kvaX5LiHKNl/mV9dUyaYTiIJkk22z
	6bQcty5aldZlpj5W+8aFiZ34ENzFK2e0P+4dk0fay5mzh6YoszpTQ+pz2DGtG7URc8ZA7pkqLTh
	QgqAVtxTZVaBLG7YusASp9hVriikkgJTq7mBjeDAOuvhBTwoh20JZTAF+mmHe8mKZadefZsQlDT
	yQFPAXKwo1mmHRu/c4BfD3xe2DMvYek8fFP3HGTnJxRq2P968iOFMNzs712TV43eVdX1gl4sE1L
	2bs5aA1xi4mkqKQS5TjNhm2yx+L/mZNjF0N6sy4DboHDUx0dqHpAqYlJT652jza9OBXqbkkUkrj
	R9tSRF2NbQKgxSaT23f5FbrRy6uOzgSkad206HrYPN9/+1Sp+WQED5VYLdM758oT4JJOG3mPynn
	fQ26TWOp8OY1Od0cvVE6rdcvhpj/+OX715Dn49o7ou/GQcsYgAjpBnFN5TWOBfKU47NhySl842y
	vetEcRHDylxJ1HIQcXjJBgJsGAA8g3X5UojCaJWPheRpU18durXZkFTJCqdy7ioGX3lwAOCPZw7
	VuA4FWjsnTkePMyvpR1uNHE+qByJpFIGydUpkbcTTnlx486nic2awr1Z5VwSJZcwhEiwQ9Rk8LD
	PqL/BywxCvdye
X-Received: by 2002:a05:6122:4214:b0:5ee:200a:8cda with SMTP id 71dfb90a1353d-5ee34a54d34mr38365e0c.7.1794510622683;
        Thu, 12 Nov 2026 11:10:22 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee341e3d1esm87696e0c.10.2026.11.12.11.10.22
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 11:10:22 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-7cc81984fceso32319137.0
        for <linux-riscv@lists.infradead.org>; Thu, 12 Nov 2026 11:10:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEKCEgG0lzHt/QjBudm2/pDtnm1sRr86kPwrAY5Jmf65i1edSen9LsGLE/MEHvhrzE0N+hwH+HoA5RRiw==@lists.infradead.org
X-Received: by 2002:a05:6102:5ccb:b0:7ce:5952:125d with SMTP id
 ada2fe7eead31-7d64db29605mr42432137.36.1794510618289; Thu, 12 Nov 2026
 11:10:18 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261112-work-procfs-oldmem-v1-0-ecdcafd99265@kernel.org> <20261112-work-procfs-oldmem-v1-1-ecdcafd99265@kernel.org>
In-Reply-To: <20261112-work-procfs-oldmem-v1-1-ecdcafd99265@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Nov 2026 20:10:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXgM_TMX7HrpsvDaQi96Ht-K6KTBu5PPRRBpcCegf3Q9g@mail.gmail.com>
X-Gm-Features: AclHuK-k7G9fpVKu6BhCbcWfXavvnldoQZhCl9e2eioRf49lg5T7xpzAfc2z5gM
Message-ID: <CAMuHMdXgM_TMX7HrpsvDaQi96Ht-K6KTBu5PPRRBpcCegf3Q9g@mail.gmail.com>
Subject: Re: [PATCH RFC 1/4] powerpc/crash_dump: check ioremap_cache() in copy_oldmem_page()
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, Breno Leitao <leitao@debian.org>, 
	Chris Mason <mason@kernel.org>, Thomas Gleixner <tglx@kernel.org>, x86@kernel.org, 
	kexec@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org, 
	David Hildenbrand <david@kernel.org>, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_111025_464174_62F98EAA 
X-CRM114-Status: GOOD (  18.91  )
X-Spam-Score: -1.6 (-)
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 12 Nov 2026 at 17:39, Christian Brauner <brauner@kernel.org> wrote:
> copy_oldmem_page() maps a page of the old kernel that isn't in the
> linear mapping with ioremap_cache() and copies from it without checking
> whether the mapping worked. If it didn't, the copy reads from an offset
> into the NULL page. That oopses unless the copy happens to be a user
> copy, whose exception table entries turn the fault into a short copy.
>
> Return -ENOMEM like the other architectures do. read_from_oldmem()
> turns that into -EFAULT like any other short copy.
>
> Reported-by: Chris Mason <mason@kernel.org>
> Fixes: 54c32021eb6f ("[PATCH] powerpc: Add arch-dependent copy_oldmem_page")
> Cc: stable@vger.kernel.org
> Reviewed-by: Breno Leitao <leitao@debian.org>
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
