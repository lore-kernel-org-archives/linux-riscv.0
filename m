Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AA16C52D70
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Aug 2024 15:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=bq72ZioaLfazoVK+xiBCUL4uVI/ZzvSG6SygEgzRDzc=; b=PLBzy0/dt0gDGBl/QM5faxosEd
	deUw/L/UTHz4EZJ232++kXM8gQRkErDYyUCuaoB2E2ETrTrOLG09lUgmU3Z/bO8CkwyJt+CgexZEp
	aTgOqAEdEpgThBXbsbXL1ukrQ0vaGxFw9FPY5ZWeduizgZNGjYPdeYctd1BSmu9SrsOEPRQ5OSD+6
	VYh2RB/A5TxNbEuCz9xI+XIh+bwcAIgl17aH/acC+AbbOrhjnEKxJL8SB5OEwpNln5b+zlwDdMdLk
	zQ2ZH0kaF6B/rnhA5iYRzoOM0MfP+ZPYzr+IMlzhuFcRR0WK2jfjXHI1+ctbDtLErgTtzUfWxvz/w
	Q3k+g2pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbLyq-000000029bk-0dQZ;
	Tue, 06 Aug 2024 15:20:08 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbLyH-000000029RW-48NC
	for linux-riscv@lists.infradead.org;
	Tue, 06 Aug 2024 15:19:36 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1fc5b60f416so7227045ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 06 Aug 2024 08:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722957571; x=1723562371; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zfDlFqosrXLKfrNosA2JBe6CUch6c/VqYqOk4CYX594=;
        b=de8eoxcp65JEAh/Ld284SCOvcJMOUsuHrrgtAZ0rfdSqjH9/TDjV8nRDy32jdzGR9Z
         M6TAl9wpzB5D3W5b5v8FtQkAQ5nK+HObJaEnwGAA8LLoPBk0aEY+K0IaKmpKfrXr9rPO
         H4Q8tBVmF9Q172EY3AwbMFZKq4MPIcCWBh5d+sS7AIMSI/70ldceg/r1rb9//9+31FT/
         lXMMn2kl4QHek8TVnovxkWTHFKR8HfbqtWHUjYgq2+ygscex42gvjK2uC+XXRv9Xz+aW
         M2Xz+bY55dYg5dIokwnjnhWdYRp87vyzqxfNEYnGiJA+Y4qQSKkp+lENe2zUJUX8Kfin
         Go6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722957572; x=1723562372;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zfDlFqosrXLKfrNosA2JBe6CUch6c/VqYqOk4CYX594=;
        b=igvXj4r8+dGaklKMsj+1cFiXOuWf/C4MGYbe5T1L/UdpFmn8AtCdxVJntrhSx1SKfj
         MKBv/35iUjyyrFKT15t0i6A2G3RmQjrDBT9ZnFeQshAKI5dKBdg4lLBvD6L2aHyxBKKR
         xWjj3WWp/RPl5gEeVSMW0YA2zjAbh1k8ZeB+SUI3z+Q8W3qz24pM2sIJbAbtbFr3Dj9H
         3AnoIsOAhb7THaqXItbqD09g2NTeZGI7+fHmFmC4JXJPtLzo+ITaRcbiWhJjqIuUbAtv
         C4sGls5cMZh/Z71dTs/xrERqwpZwuXfrXY/cfjqUcKyB/xKfFFUI1xPfHxOE2DJDPb3e
         lrxg==
X-Forwarded-Encrypted: i=1; AJvYcCUiK1XMqLVyzWt3Klbyi6/M7NuIYyEILLES2SHT2Ou2a1uTP/HaWTRY3mfZovrbDocPMV1fV42saPSiVTGm+ngc+MyV1OEY1ml9wPilt8XM
X-Gm-Message-State: AOJu0YySkRuiHS+e1uwLxPQTbolGECoXJTwefU1rLhV/pe2bnp77HVBU
	Kzp37jK2czcfOCrRw+1xwj7vGOW/xAp2slyb3W7ia5Of6/F1h/j6JbL4xrysAPXgPz9RhQIAAdo
	WvA==
X-Google-Smtp-Source: AGHT+IG+kq4xSCmsszhC87T6ezpGfclhL8SLo9v6dzemvAwTfI9EBqVt37Vs+G2GK8dBxj5hzSimY+F6XI8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:e743:b0:1fb:54d9:ebb3 with SMTP id
 d9443c01a7336-1ff57309939mr9499665ad.6.1722957571476; Tue, 06 Aug 2024
 08:19:31 -0700 (PDT)
Date: Tue, 6 Aug 2024 08:19:29 -0700
In-Reply-To: <86ikwe2fph.wl-maz@kernel.org>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com> <20240726235234.228822-55-seanjc@google.com>
 <ZrFfgzRbiqT-Zi2O@linux.dev> <ZrFfvjy_-Tyx4xUV@linux.dev> <86ikwe2fph.wl-maz@kernel.org>
Message-ID: <ZrI_AdLhWZqNKC4z@google.com>
Subject: Re: [PATCH v12 54/84] KVM: arm64: Mark "struct page" pfns
 accessed/dirty before dropping mmu_lock
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, 
	Fuad Tabba <tabba@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_081934_034264_55343345 
X-CRM114-Status: GOOD (  15.09  )
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

On Tue, Aug 06, 2024, Marc Zyngier wrote:
> On Tue, 06 Aug 2024 00:26:54 +0100,
> Oliver Upton <oliver.upton@linux.dev> wrote:
> > 
> > On Mon, Aug 05, 2024 at 11:26:03PM +0000, Oliver Upton wrote:
> > > [+cc Fuad]
> > 
> > Take 2!
> > 
> > > Fuad, you mentioned in commit 9c30fc615daa ("KVM: arm64: Move setting
> > > the page as dirty out of the critical section") that restructuring
> > > around the MMU lock was helpful for reuse (presumably for pKVM), but I
> > > lack the context there.
> > > 
> > > On Fri, Jul 26, 2024 at 04:52:03PM -0700, Sean Christopherson wrote:
> > > > Mark pages/folios accessed+dirty prior to dropping mmu_lock, as marking a
> > > > page/folio dirty after it has been written back can make some filesystems
> > > > unhappy (backing KVM guests will such filesystem files is uncommon, and
> > > 
> > > typo: s/will/with/
> > > 
> > > > the race is minuscule, hence the lack of complaints).  See the link below
> > > > for details.
> 
> Should we consider reverting 9c30fc615daa then?

Aha!  After thinking through things more, I don't think a revert is necessary.
I _think_ the worst case scenario is that KVM would trigger this WARN in
filemap_unaccount_folio():

	/*
	 * At this point folio must be either written or cleaned by
	 * truncate.  Dirty folio here signals a bug and loss of
	 * unwritten data - on ordinary filesystems.
	 *
	 * But it's harmless on in-memory filesystems like tmpfs; and can
	 * occur when a driver which did get_user_pages() sets page dirty
	 * before putting it, while the inode is being finally evicted.
	 *
	 * Below fixes dirty accounting after removing the folio entirely
	 * but leaves the dirty flag set: it has no effect for truncated
	 * folio and anyway will be cleared before returning folio to
	 * buddy allocator.
	 */
	if (WARN_ON_ONCE(folio_test_dirty(folio) &&
			 mapping_can_writeback(mapping)))
		folio_account_cleaned(folio, inode_to_wb(mapping->host));

KVM won't actually write memory because the stage-2 mappings are protected by the
mmu_notifier, i.e. there is no risk of loss of data, even if the VM were backed
by memory that needs writeback.

And FWIW, given that multiple other KVM architectures mark folios dirty outside
of mmu_notifier protection and have never tripped over this, I think it's highly
unlikely the WARN will ever be triggered by a sane virtualization setup.

I can add something to that effect to the changelog, e.g. to document that this
isn't super urgent.  

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
