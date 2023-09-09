Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDEBAEEB565
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Sep 2023 00:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=dUcJUYv8pg6DBGam9z8/iIkP7SdhnYrI/D2Y+IVjLW8=; b=lv7C5AaN/DbYYCi5cFor05Dw+X
	jsH7v/nRiJUYwihhpbDZPD5sk9VBso3AEeJ4SZI+sjOGrGwJe75OrpC3XpdWYbw0bHlSD26APUMA7
	67zUZ7CXDzcBLMtfvd4aBrVTzqZzZ6ocyoSfdSjhQ5UgX2P22ciafd52Tn50zVTWcBTqSeAPEOygc
	FDOcDlnpGF3OtJKccOSmXoL7J4aBOoomlfHQ9cH1CyWlokSTwtysrUnv71kf9nmRHyV89zOGOruUu
	ar1kPqLY40M0gp3Q2qi4gONv5dE3mbJFslN2RMLhl0alFkpb6oJlUTOgLmNjE+O8g3DGv2K8A5eyD
	oLiINGfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeldl-00EjiZ-2Z;
	Sat, 09 Sep 2023 00:15:57 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeldg-00Ejgh-2z
	for linux-riscv@lists.infradead.org;
	Sat, 09 Sep 2023 00:15:55 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-59285f1e267so68622507b3.0
        for <linux-riscv@lists.infradead.org>; Fri, 08 Sep 2023 17:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1694218550; x=1694823350; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gaKhly8Aj9nDlRectFKYGw3FxO6EGE4C2aH6vsrGIcs=;
        b=qutWUr86GDlHJcLp0rlAN/h9slQkU0TCMNndyshMb967OD0pOGggyCcnDA7Gp3uiYJ
         JUKwXGVa1z2NEwwgeRqmckfrhJw4boLia8ZH2v9BT219LjfsMZ8x7CE6FpO70w25gAT8
         djM1veOB8j2LWnBXK/ufOKiBK55ZJMtrHZ4LQVZxrLlKa3B4ZPEl+nQbFiZhJvLQETak
         QVSEkyca4hEeah4I3THcA1lWlzN0LfykcT3HRG+0PSMBq8/4olZJcaHCG3gOqEMjNCaY
         eiCs3kMqns9OwIMAtPnT+1k5cTF4O885WSqDOvnYU2HK7PIysoERV/drCnaB2+cxbCMY
         +IoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694218550; x=1694823350;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gaKhly8Aj9nDlRectFKYGw3FxO6EGE4C2aH6vsrGIcs=;
        b=HyxmtuwvtjMmpeO77GY5X3RYH4rqojfIfu8vNoL4kzOJQ8WJinzfSkCX5l4roqYLIW
         bAnUQTcRPQ3w+pF0EHsPHT2LZpDFhgRKYLDrk4zXv49M5PoyehaXmQ6k1OzG6aa9wTvb
         06Rx3tPEjFkgVsRAIA8MwD5WoX2RD5Q5uULUwgzswsCU1p6HdqNTha7nTwo+Fs8O8jKl
         HTF8dqAGNK+r3Ix269yB/IbgRArS8K3VzUz3DtWL11jQt/RmRZNkZPLrC4rcGjLAwWpE
         z4AA+TWsT8slRkS6dNdEmqN2HGhOMFfg8RHu8mQatjUu8tYD1+YQeximl8X/0Kj+nHl6
         Lvbg==
X-Gm-Message-State: AOJu0YyRUMN+aN8gOIYrP6YvvQrydeXF9mMIlcX8q3cHuvnAufN31WYr
	KJg4AiSW3RBoiRG1KHfZzuzFfZC3Di8=
X-Google-Smtp-Source: AGHT+IF1C60bg2DJN40Ko3jIsOcOxP0NOjMSP0DFTt+pfC3PQMs+2qr1EtNSX5EQJ2FP9+vXkLa3AHa75+U=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:9848:0:b0:59b:5a5b:3a91 with SMTP id
 p69-20020a819848000000b0059b5a5b3a91mr89060ywg.2.1694218549752; Fri, 08 Sep
 2023 17:15:49 -0700 (PDT)
Date: Fri,  8 Sep 2023 17:15:33 -0700
In-Reply-To: <20230908074222.28723-2-vbabka@suse.cz>
Mime-Version: 1.0
References: <20230908074222.28723-2-vbabka@suse.cz>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
Message-ID: <169421599820.98577.9267896589643015779.b4-ty@google.com>
Subject: Re: [PATCH gmem FIXUP v2] mm, compaction: make testing
 mapping_unmovable() safe
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Vlastimil Babka <vbabka@suse.cz>
Cc: ackerleytng@google.com, akpm@linux-foundation.org, anup@brainfault.org, 
	aou@eecs.berkeley.edu, chao.p.peng@linux.intel.com, chenhuacai@kernel.org, 
	david@redhat.com, isaku.yamahata@gmail.com, jarkko@kernel.org, 
	jmorris@namei.org, kirill.shutemov@linux.intel.com, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	liam.merwick@oracle.com, linux-arm-kernel@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, linux-security-module@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, mail@maciej.szmigiero.name, maz@kernel.org, 
	michael.roth@amd.com, mpe@ellerman.id.au, oliver.upton@linux.dev, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, paul@paul-moore.com, 
	pbonzini@redhat.com, qperret@google.com, serge@hallyn.com, tabba@google.com, 
	vannapurve@google.com, wei.w.wang@intel.com, willy@infradead.org, 
	yu.c.zhang@linux.intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230908_171552_967038_7806ACC8 
X-CRM114-Status: UNSURE (   7.35  )
X-CRM114-Notice: Please train this message.
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

On Fri, 08 Sep 2023 09:42:23 +0200, Vlastimil Babka wrote:
> As Kirill pointed out, mapping can be removed under us due to
> truncation. Test it under folio lock as already done for the async
> compaction / dirty folio case. To prevent locking every folio with
> mapping to do the test, do it only for unevictable folios, as we can
> expect the unmovable mapping folios are also unevictable. To enforce
> that expecation, make mapping_set_unmovable() also set AS_UNEVICTABLE.
> 
> [...]

Applied to kvm-x86 guest_memfd, thanks!

[1/1] mm, compaction: make testing mapping_unmovable() safe
      https://github.com/kvm-x86/linux/commit/4876a35647b9

--
https://github.com/kvm-x86/linux/tree/next
https://github.com/kvm-x86/linux/tree/fixes

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
