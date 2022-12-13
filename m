Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6984BC10F1D
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Dec 2022 01:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YA4GK6GlhktsJvVTXiwh/kolRoUKHMGYzp5H3qdawdA=; b=Yuk7hO00gvzJuQ
	7+wWiZyeBsfk4NYY8IxnBosTYv9OVNHjkJ+Hr8Zymjb6NFhsSqf6nIWu10WUf6rKsjy+wInJ0VYp9
	ur+z1qFinVepIAaQARbjqv4asIvYMY6lyPwlli19jZvse+e5YX9bSNrHF27VXWq0SqoQW9v7W9DcR
	/ucdnafkBpDoFhyGknvpWtC0XSMeqLcI7xf0vDw/0Z2JZ2ay4p8edGMtj0z1wmADbv79UgjIMdn48
	/8HxMM6fOCnAp8C7z9HNlcAL9nncbqz57+2cpQLSdxo7isd3s1RKT6Ym/K5htwPxeJRRhX9WUyHW5
	kX9Dc6RgztFpqo9Mtliw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4tpD-008jY9-UV; Tue, 13 Dec 2022 01:11:15 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4tp9-008jV8-RD
	for linux-riscv@lists.infradead.org; Tue, 13 Dec 2022 01:11:14 +0000
Received: by mail-pl1-x630.google.com with SMTP id d3so13929956plr.10
        for <linux-riscv@lists.infradead.org>; Mon, 12 Dec 2022 17:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hinRxz3gZAj3ZK/aMCsc0q1wjnPrltO2NY/c3Ugkfq0=;
        b=BNMWSdc+G8UMrGiE9cfwTCPOtvSd4SGR5xx9j3KogRRggicjQJNSWnM6KzvI+ruZLT
         Z5/+c4GRAmzfjVgnsKmZRqnzwxy3jUi/VmUYCAee+psZ2RDnJgcc1z+MUbcUtpmBqhIZ
         n2Xll8zjiyxpmJ3nyLDrFyGmzI72Dw1KgllTInw6mNRJPlPPq+xSIjWfB9YG8CN/8PRG
         r3MG2HeXYjSqtpUEiCGlGf9/Jk4XWxaXIBwinsPc1K0QooX+vTYegu4v2wV32ww/FxE5
         7U3ovhcjmqh4WLC5088r7J3ACzaSHYWslRMcTvYMNLnN6V4ac7AvMNHAI+noZZdCx3Mm
         2p7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hinRxz3gZAj3ZK/aMCsc0q1wjnPrltO2NY/c3Ugkfq0=;
        b=CR3At5zi/OmXEvncS69yv73zIBPqU/f7/D6yVkhMyc9MSuK4Ciu4FuLfQwz7v4/nZC
         p/mskVu/4P5CjhVnMnepbl/LWGDXbnVS3YDgHYUZ1UE+kr610KjJMCs7u1nHQeqNJgle
         FBNqm4A5jdnqwSMULuXbk3roQmYa16sqzt5ykOCe7zjkf6BDBNalDkzpeR3Vrdts8V7i
         RJ78hJknvEi9k4S74gsaez5RCDGgEPvPOV+AtGhvz9iphX5EX07wI+S+qtk3vRefNHCx
         MTTKUkQ3sK2AfgQ/LYrbUQIo8AQ9woVBKGHERUzZuOn1vIas96dXGg2BBD7EpTVzQPfj
         gWUw==
X-Gm-Message-State: ANoB5pmIirvYuot7/+QXsBNIxXVZWAC1BNbNS7Xo0qZN/S7UIrTorwO5
	+06spS03g/AsG/iAHNoj7Y0uFA==
X-Google-Smtp-Source: AA0mqf4K7zeWWztu3csfWQBbFCCVxqGsIhKZt6mbUg55HAzsJAXNVoEUxec6VV36cFbnYl7q+RITOA==
X-Received: by 2002:a17:902:7001:b0:189:a208:d130 with SMTP id y1-20020a170902700100b00189a208d130mr18915329plk.31.1670893867860;
        Mon, 12 Dec 2022 17:11:07 -0800 (PST)
Received: from google.com (223.103.125.34.bc.googleusercontent.com. [34.125.103.223])
        by smtp.gmail.com with ESMTPSA id l11-20020a170903120b00b0017f72a430adsm7043661plh.71.2022.12.12.17.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 17:11:07 -0800 (PST)
Date: Mon, 12 Dec 2022 17:11:02 -0800
From: David Matlack <dmatlack@google.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Sean Christopherson <seanjc@google.com>,
	"Yang, Weijiang" <weijiang.yang@intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
	James Morse <james.morse@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	"Amit, Nadav" <namit@vmware.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Peter Xu <peterx@redhat.com>, xu xin <cgel.zte@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Yu Zhao <yuzhao@google.com>,
	Colin Cross <ccross@google.com>, Hugh Dickins <hughd@google.com>,
	Ben Gardon <bgardon@google.com>, Mingwei Zhang <mizhang@google.com>,
	Krish Sadhukhan <krish.sadhukhan@oracle.com>,
	Ricardo Koller <ricarkol@google.com>,
	Jing Zhang <jingzhangos@google.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: [RFC PATCH 01/37] KVM: x86/mmu: Store the address space ID
 directly in kvm_mmu_page_role
Message-ID: <Y5fRJr34/BnsE+Dv@google.com>
References: <20221208193857.4090582-1-dmatlack@google.com>
 <20221208193857.4090582-2-dmatlack@google.com>
 <22fe2332-497e-fe30-0155-e026b0eded97@intel.com>
 <Y5NvYmxpy6BPkmpW@google.com>
 <CALzav=eju4LYyX=ufNneSww+5sraYJ8cfQSi4LTOHfHWmddX9A@mail.gmail.com>
 <Y5dnWgJ0ine55/hN@google.com>
 <Y5dwQEJHNiTPE+jz@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y5dwQEJHNiTPE+jz@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_171111_942205_F8954A65 
X-CRM114-Status: GOOD (  13.79  )
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

On Mon, Dec 12, 2022 at 06:17:36PM +0000, Oliver Upton wrote:
> On Mon, Dec 12, 2022 at 05:39:38PM +0000, Sean Christopherson wrote:
> > On Fri, Dec 09, 2022, David Matlack wrote:
> > > On Fri, Dec 9, 2022 at 9:25 AM Oliver Upton <oliver.upton@linux.dev> wrote:
> > My preference would be to leave .smm in x86's page role.  IMO, defining multiple
> > address spaces to support SMM emulation was a mistake that should be contained to
> > SMM, i.e. should never be used for any other feature.  And with CONFIG_KVM_SMM,
> > even x86 can opt out.
> 
> +1
> 
> I don't think something is architecture-neutral by virtue of it existing
> in virt/kvm/*.

Put another way, just because something exists in virt/kvm/* doesn't
mean it is used (or will be useful) to more than one architecture.
Totally agree.  In this case, there never turned out to be any other
usecases for memslot address spaces.

As for role.arch.smm vs role.as_id, I'll post my response on the other
thread with Paolo. Juggling these threads is hard.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
