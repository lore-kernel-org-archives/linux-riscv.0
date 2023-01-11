Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D64BC46467
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 22:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/xW+zY7rGzYkspZY5jpH52m8EzsUGsMaGC5q8sFVh8k=; b=SIDmfd7ZNtfoBa
	EbjbMs3QfK2LE6qhCCKoEYgGQv+1U0Tgc1d14teGmbQns+fy740uBytHQXXBqTe2ZCf/3S3Yz8Vnm
	7EJd0A9r5KSE4Z4EXKGpC2uNUVQ2jQCJnbGeT+OLK2izEldRYW/dEony8BoGQ/t5qxxJ/0CqcrMKn
	RAdgQ+JgDpz1zvue3RVOtsfxAVrjHNt0BDFd0nu9LZjl/CcF4h1WHtpK0Nkhj0MN1gfFuluLod/T2
	RKd/JUqEo3r+qchX07E8dCKHyq1uliZgYGZ9N4JryM1RuFwqVjZuzYwThiJceoiAFFHu4qRckl6ye
	gPNKmV9wZYbj6+5V1ulA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFjre-00D7hA-UQ; Wed, 11 Jan 2023 22:46:34 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFjrU-00D7dz-4Q
	for linux-riscv@lists.infradead.org; Wed, 11 Jan 2023 22:46:25 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id p188so16710958yba.5
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jan 2023 14:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7XUNRQSkmgxBwPtlFe+tY4O7Zk2hAxIaFzmJ+ZbBo5g=;
        b=FlburyiZ8GT2QW0nv2OtZ0LUE1v2vF0Y/pHEWD9oGzHjZ4h/FjWKkwyFdBbDcaNnUP
         2Ie9tt3h4rkQPD0tXq/TDTvxnd6ZigemFV6kwDmtr8N+ST9EWS/PCcr60+Ix/1/nGs5f
         AsS3qP6KlbbwLtD/WwC5f8YbOx3QguruaU1rcVfGrW/ie+zf83l970YFUufIsjbNIiUq
         sOpWBWkriYTJY68Ckrn/LOIFaYAJD092cfmRDNVLZVBMwe/94H2PMXzYvDpzZX5913qn
         pafqeUDZuj3eeU+GBKGCKPCf9+dxdSStYgPnHgAplUUBx6hqL3oUwA4GwRhTGZB6hRam
         i74Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7XUNRQSkmgxBwPtlFe+tY4O7Zk2hAxIaFzmJ+ZbBo5g=;
        b=hDSAK/V4w3U7wMIlg/DRnyWtmvDnYnsG80Rinxy87gIlD0SW42KhT3+3nmw0uMKNX5
         8rnOPC6/ghhQ51vJ9Q+uEF1YxO29TK4e+TC5WTybHXeomDXr/Ir3SLGXnL+Yfpzai7O8
         O1yb1alJ+XrRGwy3G/A1L8z1DCn44wBRNpkygOU4kp/DiCK5nQix2wIOPUm4gocbVdSV
         Zwr/Ac9Sq8UYG8x67m+VDXvYhjBYW/RYGsZJlqupKQ73KzVSmnQ/xMQyEB9YWe/YNvj2
         G77fLTAkkfVfko0enHqzEMwvTx+xS2ggjH4e+kW7RVGDg5a+i3+1C92KHbwSM44RBKbp
         WAsg==
X-Gm-Message-State: AFqh2kpR3PXUKcGg33/2L51MBhLGqQooRzOhsl48WwkUnf9c4pKX5Wds
	i5G94+HFIy5Oua335BfUD8CyAe/KQsi3TdepnGKLZg==
X-Google-Smtp-Source: AMrXdXvjcRQ0s93N60oB4UG+s8wkaJANmmRe0uXkJseN3DOope/rh00sX6ExARGo71QZgK8ljnJFa82hwhnRQq3QYv0=
X-Received: by 2002:a5b:189:0:b0:723:96ad:6761 with SMTP id
 r9-20020a5b0189000000b0072396ad6761mr8600316ybl.326.1673477179137; Wed, 11
 Jan 2023 14:46:19 -0800 (PST)
MIME-Version: 1.0
References: <20221208193857.4090582-1-dmatlack@google.com> <20221208193857.4090582-5-dmatlack@google.com>
 <b0e8eb55-c2ee-ce13-8806-9d0184678984@redhat.com>
In-Reply-To: <b0e8eb55-c2ee-ce13-8806-9d0184678984@redhat.com>
From: David Matlack <dmatlack@google.com>
Date: Wed, 11 Jan 2023 14:45:53 -0800
Message-ID: <CALzav=eQVLAH2coTU1FaOFstFp-AqQBb0JCycrRcP5qjqfMwEg@mail.gmail.com>
Subject: Re: [RFC PATCH 04/37] KVM: x86/mmu: Invert sp->tdp_mmu_page to sp->shadow_mmu_page
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
X-CRM114-CacheID: sfid-20230111_144624_178802_82EF0FDD 
X-CRM114-Status: GOOD (  10.94  )
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

On Mon, Dec 12, 2022 at 3:15 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 12/8/22 20:38, David Matlack wrote:
> > Invert the meaning of sp->tdp_mmu_page and rename it accordingly. This
> > allows the TDP MMU code to not care about this field, which will be used
> > in a subsequent commit to move the TDP MMU to common code.
> >
> > No functional change intended.
>
> Let's use a bit of the role instead.

Will do in v2, thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
