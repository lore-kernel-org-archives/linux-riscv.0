Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD6A1C5479D
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jan 2023 18:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6qCC117M4yIUKGecddz1wA4XzpwY7PimisGnntw99SU=; b=1HQ12h8mzAyKrj
	SvWLjaSq8g6f9EQn6xEqq7kK/c+W6a3rLoWuP5ZoOeIspUTL3HhRoEIJbTVHfZ6rBMoF+lMrFKFGH
	sypsSTPZf61hdQRcH8odw1nH+UdXfNIImEFEdjgX6JCTRtBJD9+xQx7R/KBZueuunX4WS8n+mS6Nf
	u3pHw7Z3E+UhJSycUJV61oe6XMkpeq0E4JN+mLeSY34h4qYr4lJNjvGi5bOnNC0iIWME6+vXLYAip
	E/UbjRqIIceq8eQKZBgzhG6yLxQSECqijIJ5HV6PcAN+uN+cJlqIsN65fSLlLNW+KE1xBgQxauPtI
	R+Rh+4qEsacJFU1jQ+fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pExJl-003TCK-WF; Mon, 09 Jan 2023 18:56:22 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pExJi-003T7V-SA
	for linux-riscv@lists.infradead.org; Mon, 09 Jan 2023 18:56:20 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id 16so9501563ybc.0
        for <linux-riscv@lists.infradead.org>; Mon, 09 Jan 2023 10:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=npK1pVWS9Y7zSvO0nWYdwcAA7TbeGlnyEckY5HPb/Qg=;
        b=EHKm0/F2buMoOsKhjWg0lWsOuJldy/zfoO9SoYjwOUBjEtYFI7vDu+I5lwSpjMbW6Z
         3ObtFaGnVjmdcg2O2Aret0FZO2bn7yqTJbEhANZLCO7TmNFgRBE+1H+8TwiSfzm06+sv
         NoXn+BRIUqVauOHPZ13p93njC8trw+pKMvKGKG+JOay5G96uMzNCvp6yocnoligPU/KG
         nsT5KAmMgHERAldXeigMGDd8xVH2mvsfpS/FV/+f0V+6HxueWNzcx2CaGaqz8pAq/Qe/
         1IhIl/jFSe8NXCzMDt2iiVq0nAJOXzbL0gSR4VpeaFp+Z0f01ufRbR7OxltlcKWyJfdN
         GLKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=npK1pVWS9Y7zSvO0nWYdwcAA7TbeGlnyEckY5HPb/Qg=;
        b=0GKUFZYTnQiNAhLFvx67fFiq06KQ60GF/g80luRAI/eLZjXf/0hDlMonSPtJi8oWa4
         pIdVkMgeGbeLpaysga66AT/9wKu7HwPBPKdBYHrkS7Rbz8gPkiL8TSXJl0TZYHfhaqlj
         gIjKzlpskAcCrHY8hdCEnH1zhJwSNPiIzIaaFQ7n0tF3rOJZpA7KkUfzl58zHLCIyPsX
         vMho6kwO1viw+TaObXKoYC9julVlWfqbiuvJXC5WoWSWTP7qV7Vc9iYZbVy6uCBRMwwr
         v6cpHpH5SBTdpTnYi1t8pCDd30sfAiXX7pKVxhasUxa9k+AoxG5PAHWyAr4lMezOdASk
         AEVA==
X-Gm-Message-State: AFqh2kpAdRIMej5CkFzCHH/0sk7ifRllaDuSWo/gmKPsOgIltDVwbn37
	RDlZKpCduSiUg//mpI9UK9lsFjvf9SIOA9sHUVQbGA==
X-Google-Smtp-Source: AMrXdXuGuwlSiliqUzNPwuP95duqjm2wzwipEY34JM0d62JWS00zM7bbMqGhGQDGetcNhy7upYl68Cx0Wdx6BZEJfKU=
X-Received: by 2002:a5b:1c8:0:b0:6fe:46c9:7479 with SMTP id
 f8-20020a5b01c8000000b006fe46c97479mr7514517ybp.191.1673290571936; Mon, 09
 Jan 2023 10:56:11 -0800 (PST)
MIME-Version: 1.0
References: <20221208193857.4090582-1-dmatlack@google.com> <20221208193857.4090582-11-dmatlack@google.com>
 <ce1ea196-d854-18bd-0e60-91985ed5aaea@redhat.com>
In-Reply-To: <ce1ea196-d854-18bd-0e60-91985ed5aaea@redhat.com>
From: David Matlack <dmatlack@google.com>
Date: Mon, 9 Jan 2023 10:55:45 -0800
Message-ID: <CALzav=fVbvKQMhSBD0AdrRTH+jDyRG0Hf5M-H7vCtRCR1Lk9sw@mail.gmail.com>
Subject: Re: [RFC PATCH 10/37] KVM: MMU: Move struct kvm_page_fault to common code
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
X-CRM114-CacheID: sfid-20230109_105618_934234_D3050FDC 
X-CRM114-Status: GOOD (  10.37  )
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

On Mon, Dec 12, 2022 at 2:27 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 12/8/22 20:38, David Matlack wrote:
> > +
> > +     /* Derived from mmu and global state.  */
> > +     const bool is_tdp;
>
> I think this could stay in the architecture-independent part.

I agree but until there's a use case for accessing it in common code
I'm inclined to leave it in x86's kvm_page_fault_arch.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
