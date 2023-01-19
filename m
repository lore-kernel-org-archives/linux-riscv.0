Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA658C004D4
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jan 2023 17:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=svzviqGVoXDdIjsldzJGhr58UPiDVa8jEzEXEhQMQT4=; b=rQ7AnSbXFVwlyl
	+HA4rKaNKKn1c5TNGrFxDLQXNHuxcqSCubkVlNBMzY56W5jWk4a6Iw3PcaN3pRejMcazL6BmuWMjF
	NKFyTq0cZLJI0zhiX3cfE4A13yVvGWC1UWHLLlFFsZIkyIAIV2zs5MHKgZC6HTP8Y1DN29GL6gRYk
	8/Ug91E83ov7ad42dqCOUyz7ofgZaCGLJcXhx98SViDnhZNS+lYzBp7UqDFDxNx8XoyW4ckaGJ8xH
	4Fs4vOGt27CvqUYxouDlY3G89ifqE8AUxLrSq8E4BlhX8vtoZzIIS2SQmnZhiiIrsgXNXXj4SFmXO
	uZVDsTk5BlBhQplKBFQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIYeN-006FSv-3b; Thu, 19 Jan 2023 17:24:31 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIYe2-006FNm-Cc
	for linux-riscv@lists.infradead.org; Thu, 19 Jan 2023 17:24:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674149047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7ZLCun6ndTUYHIhway+dCjRST8plu+DLSlmudJ+9iGA=;
	b=gfVyp1Mt18iqXkDbByvibkAspsvGnAshkPiLWJIV2sshSPsKSeOUuZ4a/pOlw5TX6J5enl
	hYMjYr5s/t+3NCdtoUivwhtWA8P/y6DBjI7kFM0JmYbTwboFlvshwybw6hmzNuxEyDDJr4
	Nc7p6100xLIzYbVnuLFUeebBBcNuXQs=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-210-XOTjKLUxN6WXKgwFT_FePg-1; Thu, 19 Jan 2023 12:24:01 -0500
X-MC-Unique: XOTjKLUxN6WXKgwFT_FePg-1
Received: by mail-ua1-f71.google.com with SMTP id k12-20020a9f30cc000000b0059bd6246237so737615uab.7
        for <linux-riscv@lists.infradead.org>; Thu, 19 Jan 2023 09:24:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ZLCun6ndTUYHIhway+dCjRST8plu+DLSlmudJ+9iGA=;
        b=TSfJsE7Bja/iXNVRhcwntCxLDIE45R4A1P8DAPd7JB+VqFFkSjXwi+3Cl5hM5ecaj8
         Igav/I1s/0Yk+iU9pF3pvIrUlc7J1Qr/diCwQ40UnBr8KqYh3lJEPk6Ui36VYsN0NHGc
         52vqfClB8uzfWnEeK7+h9O8Ol2pko4s0bJVk10ybvLzTg+yro3IyuFaVtX6grOpmoWOQ
         VXml5VoaNh0h6lORZxFSJ6lvDWfM6Z3LRxNKm5zVJLoB83Dq1/tc8CLhHZdSwwjuP7AH
         p5xVQNDwaUeCWzEdIXKVQXrLBXAGBQTlDYA7BUi5rN3hARTHIQY4dzyV8F2PGJS7cxQP
         Hg0Q==
X-Gm-Message-State: AFqh2kpO/0yvgSCbZww1JII194y3YVZ3nZus1JsGUza2qBd5nVlcgWZT
	7Flve3Z3PECWmpAa0xq1z9NXdEy65Sa2wNz6fKGkIVY/KPb8qFtuFtSLXJJRHeuCP4agpS0pTdo
	UVyymyn8PuExCEO/yeIq1WPe9SQLPI/yoz9p+o91KHTi5
X-Received: by 2002:a05:6102:3d14:b0:3b5:2762:568b with SMTP id i20-20020a0561023d1400b003b52762568bmr1578179vsv.62.1674149041478;
        Thu, 19 Jan 2023 09:24:01 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtKcbEgINpJzFLAqIx7zgVheHf3U2vYRZ/ijgft8zgf2upp0swiwUYbMZZIryC08LRzFEnE4XMqgG5fhaMKrn4=
X-Received: by 2002:a05:6102:3d14:b0:3b5:2762:568b with SMTP id
 i20-20020a0561023d1400b003b52762568bmr1578157vsv.62.1674149041226; Thu, 19
 Jan 2023 09:24:01 -0800 (PST)
MIME-Version: 1.0
References: <20221208193857.4090582-1-dmatlack@google.com> <Y8l6egh2wWN7BUlZ@google.com>
In-Reply-To: <Y8l6egh2wWN7BUlZ@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 19 Jan 2023 18:23:49 +0100
Message-ID: <CABgObfaTEZ1_SaQ9ThbeMe8gX2y35ZGTFzgb9K9yZwz8dbOYdQ@mail.gmail.com>
Subject: Re: [RFC PATCH 00/37] KVM: Refactor the KVM/x86 TDP MMU into common code
To: David Matlack <dmatlack@google.com>
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
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Raghavendra Rao Ananta <rananta@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_092418_433305_503EE8D3 
X-CRM114-Status: UNSURE (   7.97  )
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

On Thu, Jan 19, 2023 at 6:14 PM David Matlack <dmatlack@google.com> wrote:
> Paolo and Sean, what are your thoughts on merging the Common MMU
> refactor without RISC-V support?

I have no objection. We know what the long-term plan is, and it's not
so long-term anyway.

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
