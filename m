Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 873BCC4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Dec 2022 22:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OxTivGkGtaHJtHT/3UuxVFF3uhOCoZqzi4lG+RQ945U=; b=ZR/uis2x9IWNCd
	ED0mwHGc1gJIK8oBNkp3QFs5Vngz/YrGdBgpVd03bVAj2dIEoqvB2JwDj16fAeJ0HiRMbuUSa9LD5
	6SfFgdnim/X1UJYf4VggGYSJIj9bVp+Jn+HkR40Sw0pW8k+flTATKCRh6ZhdA1/1BmULr92kB4jij
	eBlZy9p/JsmHF42rzJ0fJkssPMwfUP6UJ3NXSEzkfZexgW7jCja0wmVvm6GfqiGtj0D+crr+EC000
	sZQr0f9A2lb6c9LKCeKCashMp3zzETanD7C7yLJPT2usVbodVShhVqIbuPNcpQ6V0wIGWDF7f/egW
	9Enk9AclWDRRT9iBVFtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4rW0-006hKn-Ed; Mon, 12 Dec 2022 22:43:16 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4rVf-006h7J-Mw
	for linux-riscv@lists.infradead.org; Mon, 12 Dec 2022 22:42:58 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-3f15a6f72d0so168325207b3.1
        for <linux-riscv@lists.infradead.org>; Mon, 12 Dec 2022 14:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xlakFXRE5WR+eI81tSHGT8mBX3C2kTQwJgOLsFBL4OY=;
        b=ndwFSRoXLSuq0mtL5gu3GohHZTtCmsXoG5LnB+4W5ntMQyw7hg7yWmVnEVKI/CMMjq
         KrRV2sbCGqD+H+xzIvKYj1uByps5sG637+06KzojhBb8JdEZSaKaduwj2AG/udwtUpyt
         ek+ZoO9A0+tsd50WkNyDpm1NuAuM3Y5dUIJvdzOEDIi6I+KRA7WOdHGwAFMZnvKcKJm8
         sMmoQVLveW58rH19lDfr14dd1014L5iT8SfRCYVc1nc0+/mzoEy8/Q6/90V5+D11cSnV
         VR0IEIuzVXTRNeTb22H3kEKuvjJHEQSBOYF1lXueeHZG7VZeReMvOUQqeeOQrxzxcfeM
         2TJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xlakFXRE5WR+eI81tSHGT8mBX3C2kTQwJgOLsFBL4OY=;
        b=3Hg2YQYzx2sncbS/GTrK769A5IN7tXlnJ0j4aY7T0c2/czU2jcwaAh5iDyP64Xa9i1
         COTzCiy5uGoDp/MtHIom5ih/kKDiHv85M1sIYm4MKCyeO0fA00aw8PejVUYOHtVtShUa
         7n/tOjAsSUvF4EX58oukBRX1p44Vk3h+KeiRruh2SBpHibfFVw2OTFuO/PxHf0w7du0g
         e1V8GUG/59vo1Goaq4cdNQKxF81Q6BzXXin65gmxRaUJcGwWyI4hq83JdCIxjaQtoYA1
         PzOH5pDebie1775NgORV2RVtYEvPZqhWg9J/G3XQPXJRFuKUq7Muk8FCdzp8sCzUtNEh
         sfAA==
X-Gm-Message-State: ANoB5pm3Z6ZamhB34GtGhJFzzIMKhMhzQYMCEe/ebNxbQHvq6FsEBtyw
	9XmlbFwy2JZDi1v+sPDRsaew/r9UAzF3BCNTmzGjmw==
X-Google-Smtp-Source: AA0mqf44l006Q6QVS5WsjpiBIi3T4SW6bvJpPAfR1juAzLaGPOaG7kqLyOnkKrJsuk2Vx7E4bBJKqTB5CVZjDntvdQc=
X-Received: by 2002:a0d:df0a:0:b0:35f:9c14:144a with SMTP id
 i10-20020a0ddf0a000000b0035f9c14144amr26604984ywe.209.1670884973326; Mon, 12
 Dec 2022 14:42:53 -0800 (PST)
MIME-Version: 1.0
References: <20221208193857.4090582-1-dmatlack@google.com> <20221208193857.4090582-34-dmatlack@google.com>
 <CANgfPd_069QPNby+mR4GuOWDNJtFk_=9EOffb0=2_V5TH-ZCDA@mail.gmail.com>
In-Reply-To: <CANgfPd_069QPNby+mR4GuOWDNJtFk_=9EOffb0=2_V5TH-ZCDA@mail.gmail.com>
From: David Matlack <dmatlack@google.com>
Date: Mon, 12 Dec 2022 14:42:27 -0800
Message-ID: <CALzav=fMX0g_n9pVFsLShZjEkPLquo2u_QpPMPzUMAGYtjZFOw@mail.gmail.com>
Subject: Re: [RFC PATCH 33/37] KVM: Move kvm_arch_flush_remote_tlbs_memslot()
 to common code
To: Ben Gardon <bgardon@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	James Morse <james.morse@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sean Christopherson <seanjc@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Nadav Amit <namit@vmware.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Vlastimil Babka <vbabka@suse.cz>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Suren Baghdasaryan <surenb@google.com>, 
	Peter Xu <peterx@redhat.com>, xu xin <cgel.zte@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Yu Zhao <yuzhao@google.com>, Colin Cross <ccross@google.com>, Hugh Dickins <hughd@google.com>, 
	Mingwei Zhang <mizhang@google.com>, Krish Sadhukhan <krish.sadhukhan@oracle.com>, 
	Ricardo Koller <ricarkol@google.com>, Jing Zhang <jingzhangos@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_144255_787161_44CEA91A 
X-CRM114-Status: GOOD (  16.93  )
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

On Mon, Dec 12, 2022 at 2:03 PM Ben Gardon <bgardon@google.com> wrote:
>
> On Thu, Dec 8, 2022 at 11:40 AM David Matlack <dmatlack@google.com> wrote:
> >
> > Move kvm_arch_flush_remote_tlbs_memslot() to common code and drop
> > "arch_" from the name. kvm_arch_flush_remote_tlbs_memslot() is just a
> > range-based TLB invalidation where the range is defined by the memslot.
> > Now that kvm_flush_remote_tlbs_range() can be called from common code we
> > can just use that and drop a bunch of duplicate code from the arch
> > directories.
> >
> > Note this adds a lockdep assertion for slot_lock being held when calling
> > kvm_flush_remote_tlbs_memslot(), which was previously only asserted on
> > x86.
>
> Besides the one lockdep assertion, is there any benefit to having this
> wrapper function? Open-coding "kvm_flush_remote_tlbs_range(kvm,
> memslot->base_gfn, memslot->npages);" is only a slightly longer line
> and, IMO, just as readable. I'm happy to see this cleanup, but it
> might be just as easy to drop the function.

The wrapper makes lines shorter, adds a lockdep assertion, and is just
as readable. What's the reason to drop it?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
