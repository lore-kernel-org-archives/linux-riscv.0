Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45640E7D0A5
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Sep 2023 19:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:References:
	Mime-Version:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wtxUgWGeSVWKII8Oh/5UCcOyjwOr01hGNMM1wE4Gifs=; b=QH9SD6OE2mhU+x
	ZOUiq8bXpOOXoPt2H4N0gV85ATCZ7jE3p946qHTuw2U0N7wSXYa9uVYzw4ZHyFyppwjPGk9RuvRBx
	my1IfttPU3ZXG4dUE/RU+oKk525e36IgitfK7IdlEe5wbqOraVfOXEWBRacQDC7giRDsGGnF3NQh/
	koGnIr9NbyCnebF+S6DVP9K8e+WLUSLwu1PPOdkvomcaBdN4xdnTSHe2dzFhR8X6ZC64bPy0S3uTI
	M4kjDhMojJXMktCsUDuGsw7YitRX4PeZyImFFXXOoj/nuQC4mEOTXEC1iW6+VV43bXJmA0Z+ZhOyN
	T0WyTP0KRilyU5Pah4GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjP4Y-006un5-0I;
	Thu, 21 Sep 2023 19:10:46 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjP4T-006ukF-2s
	for linux-riscv@lists.infradead.org;
	Thu, 21 Sep 2023 19:10:43 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-59b5a586da6so25426927b3.1
        for <linux-riscv@lists.infradead.org>; Thu, 21 Sep 2023 12:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695323438; x=1695928238; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=msCRqftjzvMka6Rl5V/NvDEz768neF2Qswneru1ptF4=;
        b=Hqbcx064ZEUBN3AfvcXeYM+r/YiBYHCydpV5ETmsGxdkc4AzV88cgmYqRNd3aQD51K
         goXqDg9ObPSZUBsTv07bVEghsslb/wSKtRwEMquNhY3GZgRxDVQKPfDqGz7Y3AJbKi5j
         wIyH+O77IIeMAKyORU0QYprrNuucKQeh6MEzJB2gJthYIHPGKPrJci1lcH2vUMPIPwuv
         8bWhxzuzM3FI7DcnYE2wwSuHk+iqj+lavLSZWyYhd2zNGvla1n66aN3REX7mLnZnAhFU
         FPBi+7u/AHbYlbCkHTZJh62NWlb+Dqutfsi7RJ+wf7s2n0OL9VpI1fQE/AqZ0AVYVbaX
         FxcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695323438; x=1695928238;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=msCRqftjzvMka6Rl5V/NvDEz768neF2Qswneru1ptF4=;
        b=w9uPYisdZHWp039zhB+NWhubZxx9erRGMiXD8sLD2Pte7oIDn9tMEz4/cp0JgmiyTj
         atV8cW/kjRcvk/T7JrLLZDEYk+oaXTqxSeOIjipZLUYHSoJZwRL8Es6GU26F1DA40vG6
         uoMTpbihTNqCm2Lig+wHoIoVG1OlU4Enc/flgPC+FhYUdfygOgyM4jXynHuigttsVIEp
         Nv9QrRKYlMenutOmePGj0b02mIq0YkEzVIyBKXIerwKlDt3cJGHxitTLDsVKdrO8yFO1
         mB4ngn5o1sBVpsztlEj/3bjKox6L/UIBFhOfxw0aUmV5Jk+KgZ8kWO0Y6Ree8hgqImHn
         JbMg==
X-Gm-Message-State: AOJu0YxuHVnL4l6eYrlLliD1a7AGU42M9VDZ4OdS0vU8TvGmrreYyoSr
	VABEheEwrRO9snSnEONvaOLoLx8WEVY=
X-Google-Smtp-Source: AGHT+IHW881nAqFnjABVXUT4908B5v4pAo/onJespz4HnG5MCVd8NLEq9DsMcDxqDXD3hJb4Zo/K0u0JOVE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:70a:b0:58c:e8da:4d1a with SMTP id
 bs10-20020a05690c070a00b0058ce8da4d1amr8361ywb.2.1695323438500; Thu, 21 Sep
 2023 12:10:38 -0700 (PDT)
Date: Thu, 21 Sep 2023 12:10:36 -0700
In-Reply-To: <20230914015531.1419405-15-seanjc@google.com>
Mime-Version: 1.0
References: <20230914015531.1419405-1-seanjc@google.com> <20230914015531.1419405-15-seanjc@google.com>
Message-ID: <ZQyVLEKXbpJ9Wvud@google.com>
Subject: Re: [RFC PATCH v12 14/33] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Chao Peng <chao.p.peng@linux.intel.com>, Fuad Tabba <tabba@google.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Anish Moorthy <amoorthy@google.com>, 
	Yu Zhang <yu.c.zhang@linux.intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Xu Yilun <yilun.xu@intel.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Maciej Szmigiero <mail@maciej.szmigiero.name>, David Hildenbrand <david@redhat.com>, 
	Quentin Perret <qperret@google.com>, Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_121041_929982_27AAE86C 
X-CRM114-Status: UNSURE (   6.10  )
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

On Wed, Sep 13, 2023, Sean Christopherson wrote:
>  virt/kvm/guest_mem.c       | 593 +++++++++++++++++++++++++++++++++++++

Getting to the really important stuff...

Anyone object to naming the new file guest_memfd.c instead of guest_mem.c?  Just
the file, i.e. still keep the gmem namespace.

Using guest_memfd.c would make it much more obvious that the file holds more than
generic "guest memory" APIs, and would provide a stronger conceptual connection
with memfd.c.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
