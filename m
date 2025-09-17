Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED24CAC598
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Sep 2025 09:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gJBpsyt3j6bChbAfIC8bRReszT539Yz8qmCWpHBxR8g=; b=fGyACyUT5d+ebI
	Ixff67kDJ/+16haHJx0rLk1l0NiOXcUbUGDYQyb8oAGE0rxIMojr3jKGgx6rTSBGOUEMZRafRU8yQ
	95PLI3iGMSA51RK6KW5r8TvbZs9vOfuyUfYqKSZqDo+BRcgv4EldlzVIA2iOGm1g2W7y+b8f30uiB
	aCGzE2ieyRebgrTeGkQh/LpLXZSGEy4zHg7cepkQr5wJv++B0zPEFCZNJnGRyLJZNQSiXZGP6KwDD
	UbjIg3ajz2WcaHlVNQufEdK6XQwkLPcN92Yo1a633Jn6qZAmT14ze1Bq74M15e6A6cY1j2gt8fDSW
	xmBayVUVdQXZbmtHqGGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyoLN-0000000AlnI-1oOj;
	Wed, 17 Sep 2025 09:20:53 +0000
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyoLL-0000000AlmI-42KI
	for linux-riscv@lists.infradead.org;
	Wed, 17 Sep 2025 09:20:53 +0000
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-3357b8aeddaso968484fac.0
        for <linux-riscv@lists.infradead.org>; Wed, 17 Sep 2025 02:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758100850; x=1758705650; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ox09wceLheN9CV/GNKAbltAUFRxxk0VbuNEPceF8/DQ=;
        b=mwP83ZzvPXbdgGGsojRX2XiNpF9Q0anZWBtuKt+hkIGsG+jpn1WyUum5krnFpZ4dAd
         h/MAfMrtLsvj0WAi7bNpattXHMdxTvk/8LW+Xg3Pu5GSHXl/xTvGE17rrFNS0CpeFJnG
         cesLQj8QLHXH8IpL58qSHe7NHYOW1qNdK6OA4BzoEsBI//CEvPS8ImLiJy7q5zFUo5fy
         4YYSSr+o6KZYvMdbOl4M4rCsMicYbZx0LGNU0fLDnDiOaYfENIl+DGktmwXMXKI0GA8u
         sYoyw09tAqVcxC+RkDodEyf3pqZt+gAAImH5RcvScAE0e6OuvSGecqpQxRyApeqAfmNE
         2PoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758100850; x=1758705650;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ox09wceLheN9CV/GNKAbltAUFRxxk0VbuNEPceF8/DQ=;
        b=TtV22PdY74TFvy7OoqruZ3xy7dg7WfP8iRMCJzWlRQPVvEfoqoCchknSI67etWGVTr
         Lfeb+cD+h4d/u1cpsxMaNazk3Pu86DUku4COfFsOWnhGDreJr04Lb6jgIs2H3BZwSduz
         5t6csXiC9rU5H4oeyneDq4O0cqtPfC9bnuPn43TwjsE0JgdC+Z6YRfg8vCm2c1QDryuV
         SwP7jGv/SOWUcQABbbSfRg95CtcdYKu+uITSji37mXOpgy5L0av0PwUPC16j3jQmyHaG
         zSPq6Cj1o3DardmJuRUpTGqKx7TLv5ujENBrSfvif+dUH42wrwY5n5mVSWZ3M897b7kW
         pSLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgLuMivMS/MwnseRbQlljB09wlJdKs2NPf3G8MObedIUQZhze8n+lFiZFhr1RtSbvtUJASBrShZfCt8w==@lists.infradead.org
X-Gm-Message-State: AOJu0YziWQi0qiO6ANxewAHtGK5PIfMKxw+nuKpaDjf4VXHYoCbAoSyI
	KCfwCyip3it/R6t4K6Wgk5bMZQ1QnJ8avOPr8xlI1m4NIZQKuvGv4KqXM3EXtlbecZVU8uVBhjN
	lQs2lYbdiTRRp3Spxr5tafvSaTii4kFU=
X-Gm-Gg: ASbGncuhWtskmL4RmUKOxihYxbeHMdpMtmI2vhKXWCJYZohQaB2ZLGpBQBYpGXIp8yj
	MFRSF8MD0XpZykLg1iKBdrnez/SuOEenbnRJiWegblXrzRBE+dY1WMZAbqMogBi2uHXRYeerefi
	aQ6HluQn9ZtEBj82gVtyQ2bASecLLUXDJQyDHJxgyUD5eHpVw0c0P4wdQ8pFGtThwzZVfvDvZhi
	XtU7g==
X-Google-Smtp-Source: AGHT+IEvi/vcvuNXEKryAobinAuQaOybDNziHzvdIl5fQxCUxTSrL6UDLu1P/TgPbjPopqUhtAHphiQym0mzQtaf3UA=
X-Received: by 2002:a05:6871:d618:b0:31d:6467:3ddd with SMTP id
 586e51a60fabf-335be8c863emr772149fac.3.1758100850540; Wed, 17 Sep 2025
 02:20:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250917033703.1695933-1-zhangchunyan@iscas.ac.cn>
 <20250917033703.1695933-3-zhangchunyan@iscas.ac.cn> <bc87f2a8-7a9c-4416-9106-bdf4b98e40a8@redhat.com>
In-Reply-To: <bc87f2a8-7a9c-4416-9106-bdf4b98e40a8@redhat.com>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Wed, 17 Sep 2025 17:20:14 +0800
X-Gm-Features: AS18NWA4SAC8zxdE-h5_sRhBzgX8xMPmN4jL9phgOErltDfEWb2iq0mEGYtEXpk
Message-ID: <CAAfSe-vjgcgFyvVoci8F9ra4JwbDcdbhsxjSL0j8=0CCKAzFHQ@mail.gmail.com>
Subject: Re: [PATCH V13 2/6] mm: userfaultfd: Add pgtable_supports_uffd_wp()
To: David Hildenbrand <david@redhat.com>
Cc: Chunyan Zhang <zhangchunyan@iscas.ac.cn>, linux-riscv@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley <conor@kernel.org>, Deepak Gupta <debug@rivosinc.com>, 
	Ved Shanbhogue <ved@rivosinc.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Andrew Morton <akpm@linux-foundation.org>, Peter Xu <peterx@redhat.com>, 
	Arnd Bergmann <arnd@arndb.de>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_022052_005843_1E5BFBC6 
X-CRM114-Status: GOOD (  22.15  )
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

On Wed, 17 Sept 2025 at 15:25, David Hildenbrand <david@redhat.com> wrote:
>
> On 17.09.25 05:36, Chunyan Zhang wrote:
> > Some platforms can customize the PTE/PMD entry uffd-wp bit making
> > it unavailable even if the architecture provides the resource.
> > This patch adds a macro API that allows architectures to define their
> > specific implementations to check if the uffd-wp bit is available
> > on which device the kernel is running.
> >
> > Also this patch is removing "ifdef CONFIG_HAVE_ARCH_USERFAULTFD_WP" and
> > "ifdef CONFIG_PTE_MARKER_UFFD_WP" in favor of pgtable_supports_uffd_wp()
> > and uffd_supports_wp_marker() checks respectively that default to
> > IS_ENABLED(CONFIG_HAVE_ARCH_USERFAULTFD_WP) and
> > "IS_ENABLED(CONFIG_HAVE_ARCH_USERFAULTFD_WP) && IS_ENABLED(CONFIG_PTE_MARKER_UFFD_WP)"
> > if not overridden by the architecture, no change in behavior is expected.
> >
> > Acked-by: David Hildenbrand <david@redhat.com>
> > Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
> > ---
>
> [...]
>
> Taking another look.
>
> >   /* mm helpers */
> > @@ -415,68 +475,24 @@ static inline bool vma_has_uffd_without_event_remap(struct vm_area_struct *vma)
> >       return false;
> >   }
> >
> > -#endif /* CONFIG_USERFAULTFD */
> > -
> >   static inline bool userfaultfd_wp_use_markers(struct vm_area_struct *vma)
> >   {
> > -     /* Only wr-protect mode uses pte markers */
> > -     if (!userfaultfd_wp(vma))
> >               return false;
>
> Isn't this indented one level too deep?

Oh right, I will fix these.

Thanks to you spotting them out!

Chunyan

>
> > -
> > -     /* File-based uffd-wp always need markers */
> > -     if (!vma_is_anonymous(vma))
> > -             return true;
> > -
> > -     /*
> > -      * Anonymous uffd-wp only needs the markers if WP_UNPOPULATED
> > -      * enabled (to apply markers on zero pages).
> > -      */
> > -     return userfaultfd_wp_unpopulated(vma);
> >   }
> >
> >   static inline bool pte_marker_entry_uffd_wp(swp_entry_t entry)
> >   {
> > -#ifdef CONFIG_PTE_MARKER_UFFD_WP
> > -     return is_pte_marker_entry(entry) &&
> > -         (pte_marker_get(entry) & PTE_MARKER_UFFD_WP);
> > -#else
> > -     return false;
> > -#endif
> > +             return false;
>
> Same here.
>
> >   }
> >
> >   static inline bool pte_marker_uffd_wp(pte_t pte)
> >   {
> > -#ifdef CONFIG_PTE_MARKER_UFFD_WP
> > -     swp_entry_t entry;
> > -
> > -     if (!is_swap_pte(pte))
> >               return false;
>
> Same here.
>
> > -
> > -     entry = pte_to_swp_entry(pte);
> > -
> > -     return pte_marker_entry_uffd_wp(entry);
> > -#else
> > -     return false;
> > -#endif
> >   }
>
>
> --
> Cheers
>
> David / dhildenb
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
