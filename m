Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B356CC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Dec 2022 22:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZevGh8VJ3tSzlDDpeFaQDbK60NyfIYdFBZGx0xJTk18=; b=AnfibCJPihggqQ
	kIqVV8bgGbAjPCwbp7Mrvc71BSLpQgLvbUB7+FleZ+OygoTwfQCRp4vrrzAyv+rzB85Nwz1FML2+j
	1ZhLSogzhHhs6qqVlDpA4gzb3IGA6BNtAooXa04xRQQ4ojhgT/Flb/P/4A/xALWaYOjZK9kXekluh
	rNbNkdPWOyc7AfdmV6dPFDg/gJZSyWOHPrU79QXmC5QDWWx4FpWiKNJctzrTei41m67uxtsGIhHC/
	+5rqlk6eJv+PWPrubHI+W2PyNSPjrIsW36o6wRAhmjh3teE29Qy9tJjEOuS3IOhJUUxsBuMJSs/mM
	gqRZUQzOB/6Kf8qcMqLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4rcc-006mpC-DY; Mon, 12 Dec 2022 22:50:06 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4rca-006mnE-5f
	for linux-riscv@lists.infradead.org; Mon, 12 Dec 2022 22:50:05 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-3b10392c064so168781247b3.0
        for <linux-riscv@lists.infradead.org>; Mon, 12 Dec 2022 14:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=emGR11sDGj23bwB4iDGKY/Jt07F7a624TvyLlINCb/4=;
        b=iIA/1zCE2/PdX7UwUpsCHVx2/4soMLJq+umSYNq1TIMKZ3vYOufggcHfzl2zpb3L95
         3KzRsMM6KMDNwv2INU26jqyRM70qj97aTjffNJqHOpklQjdDCkuFG/H5HyjOFryrkHsC
         WuUbOIXYNWL4NRA6iZCQSLbRHyxsEBOt+Yw5NkOMax5mZSsMG+NRAdlVCNMmHaLUJBr6
         RC6kxVfoGDnQ5XX0CU2kxeJuCxvyy75M74Im9VLDAzaDFpiYYonazefbFsiv+O87XQTC
         OANFKz6exzf3vgq07bR18r0zHtd6tggWQPlgrfF8L6R2GCpm+TNCBwJ2GvYSdlpZvSIY
         NaNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=emGR11sDGj23bwB4iDGKY/Jt07F7a624TvyLlINCb/4=;
        b=hON26Pjj+S3UJA3IhudUztqOWltNci90KA8n3mCJpwIhUaBu5QqZ1kMRhsYZBJVp/y
         xms0r7HBbGCO+6oaYx8BaWPyZVWFuHewO0d6dWbte1ad0l1rjN7SwfUlVfQrHmYXw8wG
         9SK027lM7QWv2VH3TjatIqmtcjmLrn/8D7VkaM9sozDIjgn3ivsFJd4t5bXmpFUHJfn0
         Zk178ggGM/rf3ykpicuIewP/YUChsJabbpoalbWP7lOLsMUBMmKH92ImcYyc5y86ZDCa
         U079MiOEgN8rDn/t+/Y3ec6F5Vzd/Ikq8lhf1lraS9fdpSohFtguEgOAnyL3aePDWzdJ
         CibQ==
X-Gm-Message-State: ANoB5pnxkANoUzY2/+ZbY4G+lfajKQqnkXQ+Ah5fI9Gx0XeLN3HM5B6O
	Odq0/WHPLaIR1okf0wt2i2ofV7c/YdNxC7SGqOZOOg==
X-Google-Smtp-Source: AA0mqf7BLbzUXAWE3wffbmFiHSNF9Kd+b9tfc4w51Pba8kylanBVygPwVEaOBfOQoKTOkaa76ZxA34hsT2ZYbKl8ZbE=
X-Received: by 2002:a0d:df0a:0:b0:35f:9c14:144a with SMTP id
 i10-20020a0ddf0a000000b0035f9c14144amr26607842ywe.209.1670885401042; Mon, 12
 Dec 2022 14:50:01 -0800 (PST)
MIME-Version: 1.0
References: <20221208193857.4090582-1-dmatlack@google.com> <20221208193857.4090582-7-dmatlack@google.com>
 <0e159e42-ebca-c0d5-f2ae-29fa2344e720@redhat.com>
In-Reply-To: <0e159e42-ebca-c0d5-f2ae-29fa2344e720@redhat.com>
From: David Matlack <dmatlack@google.com>
Date: Mon, 12 Dec 2022 14:49:35 -0800
Message-ID: <CALzav=efGBpf7joCwRjkF2B2VOmauuktSzRdoyWTRwVkQr1Tbw@mail.gmail.com>
Subject: Re: [RFC PATCH 06/37] KVM: MMU: Move struct kvm_mmu_page to common code
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sean Christopherson <seanjc@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Nadav Amit <namit@vmware.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Vlastimil Babka <vbabka@suse.cz>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Suren Baghdasaryan <surenb@google.com>, 
	Peter Xu <peterx@redhat.com>, xu xin <cgel.zte@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Yu Zhao <yuzhao@google.com>, Colin Cross <ccross@google.com>, Hugh Dickins <hughd@google.com>, 
	Ben Gardon <bgardon@google.com>, Mingwei Zhang <mizhang@google.com>, 
	Krish Sadhukhan <krish.sadhukhan@oracle.com>, Ricardo Koller <ricarkol@google.com>, 
	Jing Zhang <jingzhangos@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvmarm@lists.cs.columbia.edu, 
	linux-mips@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_145004_217430_8C786C5C 
X-CRM114-Status: GOOD (  12.10  )
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

On Mon, Dec 12, 2022 at 2:32 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 12/8/22 20:38, David Matlack wrote:
> > This commit increases the size of struct kvm_mmu_page by 64 bytes on
> > x86_64 (184 bytes -> 248 bytes). The size of this struct can be reduced
> > in future commits by moving TDP MMU root fields into a separate struct
> > and by dynamically allocating fields only used by the Shadow MMU.
>
> I think it's already possible to use a union like
>
>         union {
>                 struct kvm_mmu_page_arch arch;
>                 struct {
>                         struct work_struct work;
>                         void *data;
>                 };
>         };

That would potentially corrupt
kvm_mmu_page_arch.nx_huge_page_disallowed and
possible_nx_huge_page_link, both of which still need to be used by the
TDP MMU on x86.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
