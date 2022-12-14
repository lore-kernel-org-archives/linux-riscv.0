Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E6DAC001B2
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Dec 2022 09:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lh5Ospd8XwWsdXQ7cepXXOLa0anxi9c1v7VMk8KUTm8=; b=TZnOkmQfeLwzxY
	5ljUBw/vSStsPJ3CzdAviQ5cpwTC/LjgcgFXLLMlIc5NaeqtUGn50/xT/1X/9hdeaZvukmvUkdgwm
	FV7DkcYQgM5Sul8C+jOLX/0uo9B1MKdV4PjGgls5wBr93J8arg4vVao9DY2AYEt6IOo5mIdN75lhV
	Ymr7HESDEkypIPejOjhVUTcZJmVGY8YQzlU+9eWYa5lLx1y6DMPf42FQviu1DUD98kMXZP5Ac50/B
	O2bSJWW236tAygGVVysuqUhzHu74CxRaGuE8i4LU5PTj8bA6SPWJXDXBNmgNnzy6SAVs2Wqxu3sTN
	6CJBJLcCIiGSq4WNlMkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5OPK-00FHDI-1D; Wed, 14 Dec 2022 09:50:34 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5OP8-00FH6p-H7; Wed, 14 Dec 2022 09:50:23 +0000
Received: by mail-pf1-x42a.google.com with SMTP id n3so4046224pfq.10;
        Wed, 14 Dec 2022 01:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Jbas8k53VpTFWCNrs3oRHT/Z65GCtCU2WQLZf0mUIGE=;
        b=afwPx6LdFoKaH5nf+ag3bcmEMnN8QxYCsgHz0tCKFfNGbcAhKAKWcHJS4u0Xa02rh9
         1zx4dWkTQ16/1Xq2qNjpEn/3zEiV+mVtkVWXwDxrtry3ggQwYtHlzleK+hm+POGHPrEa
         VR30Iiq3fwVosu3uFcFlghm/CQnobNW0jBUmqmTqKDJ18p6Vv3nTnv+YJd9Q5V9R2qRW
         rK3qglYycZi9MnKCpxTmAdk5enZysYESnQUsKy4Dui9/9KOMamkgsKJVkSAwwlSq3qfb
         OyhJNSoWvttRx7SrdvyCvHkwHTBdaB7W4Z0D/jUtQ/E84c2kEM0PIZMnID4mjv788Xgs
         gp0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jbas8k53VpTFWCNrs3oRHT/Z65GCtCU2WQLZf0mUIGE=;
        b=UfbkIpZjuK5JZAKIzVIk2mQ3AR+iFAE046zsqp2EZDgax+KJnuolJI1DRy68uOdxRE
         9NkuN4FhMHOsHKfKpdhwcBbuup8zlsO1hAqn7XrFkwGZ4I6laTNOl58FIW9WOf35sXYD
         5Q3ML6Mrcb3t2dxuJuOuurL0Cttqvx/1faq4s0VYTjmlRpO8vVaqZWBV9ixDuxXMbepv
         QwjSWUFc4VNt89I+74tIQipWrsptNcGRpuuzpk6q0rsCX8r2TAzqG8ResGelGtkGzJLL
         1biA/Guc3Bo8xjew1t+322EG6SGAkHIjy7VkQo0Am3pf4DymteZXeJX4W5QSN3yTL/xu
         jWEQ==
X-Gm-Message-State: ANoB5plQeiKhmqrl8p2h90PR/P9y6VSZCK0gGQTtHckXJwRY2oIbahwS
	4Eg5MTs0O+jpNsisu4q9itlpHEq+4nGouzfgwEc=
X-Google-Smtp-Source: AA0mqf7w8TIU6K2l/8MuGzXNAAZ9FRqdURji/6nctthseH2MSfKX1yiUw7Qrbh0D1Res/crh8T4uAxCut4Jl7FykNkI=
X-Received: by 2002:a63:e4a:0:b0:477:6cd0:9a04 with SMTP id
 10-20020a630e4a000000b004776cd09a04mr75781850pgo.433.1671011420030; Wed, 14
 Dec 2022 01:50:20 -0800 (PST)
MIME-Version: 1.0
References: <20221208193857.4090582-1-dmatlack@google.com> <20221208193857.4090582-2-dmatlack@google.com>
 <22fe2332-497e-fe30-0155-e026b0eded97@intel.com> <Y5NvYmxpy6BPkmpW@google.com>
 <CALzav=eju4LYyX=ufNneSww+5sraYJ8cfQSi4LTOHfHWmddX9A@mail.gmail.com> <Y5dnWgJ0ine55/hN@google.com>
In-Reply-To: <Y5dnWgJ0ine55/hN@google.com>
From: Lai Jiangshan <jiangshanlai@gmail.com>
Date: Wed, 14 Dec 2022 17:50:07 +0800
Message-ID: <CAJhGHyBbjyKVEv3KcoOcPGQ28753FjR_rc9uNDEF3Dd-gNTRGQ@mail.gmail.com>
Subject: Re: [RFC PATCH 01/37] KVM: x86/mmu: Store the address space ID
 directly in kvm_mmu_page_role
To: Sean Christopherson <seanjc@google.com>
Cc: David Matlack <dmatlack@google.com>, Oliver Upton <oliver.upton@linux.dev>, 
	"Yang, Weijiang" <weijiang.yang@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Andrew Morton <akpm@linux-foundation.org>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	"Amit, Nadav" <namit@vmware.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Vlastimil Babka <vbabka@suse.cz>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Suren Baghdasaryan <surenb@google.com>, 
	Peter Xu <peterx@redhat.com>, xu xin <cgel.zte@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Yu Zhao <yuzhao@google.com>, Colin Cross <ccross@google.com>, Hugh Dickins <hughd@google.com>, 
	Ben Gardon <bgardon@google.com>, Mingwei Zhang <mizhang@google.com>, 
	Krish Sadhukhan <krish.sadhukhan@oracle.com>, Ricardo Koller <ricarkol@google.com>, 
	Jing Zhang <jingzhangos@google.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	"kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221214_015022_610957_9A7E4743 
X-CRM114-Status: GOOD (  11.61  )
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

On Tue, Dec 13, 2022 at 1:47 AM Sean Christopherson <seanjc@google.com> wrote:

>
> My preference would be to leave .smm in x86's page role.  IMO, defining multiple
> address spaces to support SMM emulation was a mistake that should be contained to
> SMM, i.e. should never be used for any other feature.  And with CONFIG_KVM_SMM,
> even x86 can opt out.
>


I think the name ASID in kvm/x86 should be used for vmcb's ASID,
vmcs's VPID, and PCID. Using the name ASID for other purposes
would only result in unnecessary confusion.

There is a bug for shadow paging when it uses two separate sets
of memslots which are using two sets of rmap and page-tracking.

When SMM world is writing to a non-SMM page which happens to be
a guest pagetable in the non-SMM world, the write operation will
go smoothly without specially handled and the shadow page for the guest
pagetable is neither unshadowed nor marked unsync.  The shadow paging
code is unaware that the shadow page has deviated from the guest
pagetable.

It means when SMM is enabled, shadow paging should be disabled,
which also means it has to use tdp and not to use nested tdp.

Thanks
Lai

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
