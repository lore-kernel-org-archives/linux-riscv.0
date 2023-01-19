Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67834C46467
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jan 2023 18:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lp/pOJKcN6JKhk2Z0WNuVkoXIeaymnD7GZTbdlNWaMU=; b=GDW9O34ck79wEe
	s8A5zT5oep+1TsTfa8n8/+SDGDWTrXtgbsIOssrIlDB67m6dsWF+BzDCot5YMmUj/BuQ5NuLKDPbq
	D9Bdl1AoXrkrk7+KhFJf0CqZuhUi3b5WXXz8nmJEAlBOFYKzXQ1rCtCn6h14koN3tiF0mqwVs/oxx
	+vza32GvtrM7uWb3mtwZzaNtMNxH0gxcEiq+uBDD1MJGc/45Nfhw6gUlq75g2UDZQaDKzAkmD5wNI
	8MTONRwAfMeShEJhllQ6qkrlXEVKzJRKCWe9WUKzqh9C2rQ9Ao7PMcKo/1o9fqeKUMYzQc1nf7TxE
	/oWxY90b61TJ9u9QK4zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIZce-006YO7-Sm; Thu, 19 Jan 2023 18:26:48 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIZcR-006YJm-0e
	for linux-riscv@lists.infradead.org; Thu, 19 Jan 2023 18:26:38 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id p15so41700ybu.7
        for <linux-riscv@lists.infradead.org>; Thu, 19 Jan 2023 10:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6VWrds5+dcyT0rgINmTYYWINCVZd2T1PEujEHrsOcLw=;
        b=A6TDGupcab5kBFctEX907rvmeNwH7TSFDFaHTIVyeD6PCreG08fGa15PQ7ZMqoS+1m
         Kxbe26YgQAvS6hpbgLxITj1eUcRA8mIo1x+Mapl67QqS5wyfrfuzRCU1tnxWZ0TS289l
         w3u3MCioCSxlocWRtMKRdepquBJ0iHc8nYrd/K5h7zL2JXs5cWFUvxAeTGvuzHlMKRgk
         egdpFD/bkXLZwSYHG+Z0kzwbLNaNF2PleWXHewOXJKxTE0H7QO7vqhNkuBSN+9K0BgW4
         CUQWNgNvG4kQ6jAFI0ws+04L11xvj5+5tglT7p+FQ3rESyEpFyu6RBShjx3VyQd9khW6
         qgnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6VWrds5+dcyT0rgINmTYYWINCVZd2T1PEujEHrsOcLw=;
        b=ZKz8tFVzQnDxQDYEKNx/tRgJxS/ZQTDiPjNxoPESds+09jhehJb502J2OsA9FWZpVY
         GPhJP+NycoGM0R3JMo5il48gb7VZ6z7UaRfxfJBo/t+XkcYy3ZLNGObCLyaMmHrgAMV5
         eZiiVN4FH7crwx+eZrR8eetp2z13yW6wgHwWSXxW2iFcwBYDzCAgL+/mjtcx/A01gi7A
         IQfxaY28aJmLmCNOxqO1Mxqj00EmVzQcGwvmgrszXXi9XzIbD/+XnwoV4+vejVhVpLN6
         ar4UQ2ZtcMnuJFKt6AktwvfWpeN7P0e3FETWwJO+EzVwi7vUrEnKUw6blobpDap3B3fA
         06NA==
X-Gm-Message-State: AFqh2krsjqsaMC5l3Ia19C8gdcXD9gy9ybC0RMDmbQiAcNa7rO4ZtcU9
	WCoS1u5VAReYw6+UWhUyJ9KQbbiC8OL4PCtL57ivPw==
X-Google-Smtp-Source: AMrXdXtwLTB5KOOpcHVBzvFcacNzq2MmR9bQGZt/ij36G6vo5gOSujCeJE0W7g6T7dRw7IL5u3KJsp+ZIGFjXU2FYsA=
X-Received: by 2002:a25:1984:0:b0:7fe:e7f5:e228 with SMTP id
 126-20020a251984000000b007fee7f5e228mr146711ybz.582.1674152793200; Thu, 19
 Jan 2023 10:26:33 -0800 (PST)
MIME-Version: 1.0
References: <20230119173559.2517103-1-dmatlack@google.com> <20230119173559.2517103-5-dmatlack@google.com>
 <Y8mJQH4VqC76sX7k@google.com>
In-Reply-To: <Y8mJQH4VqC76sX7k@google.com>
From: David Matlack <dmatlack@google.com>
Date: Thu, 19 Jan 2023 10:26:06 -0800
Message-ID: <CALzav=fN40q2QCcBuUdTg2z2sJLeRo9u4UCaW5grX5LC-bKqkg@mail.gmail.com>
Subject: Re: [PATCH 4/7] KVM: x86/mmu: Rename kvm_flush_remote_tlbs_with_address()
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>, 
	Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	Raghavendra Rao Ananta <rananta@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_102635_081926_9D62E7B1 
X-CRM114-Status: GOOD (  11.53  )
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

On Thu, Jan 19, 2023 at 10:17 AM Sean Christopherson <seanjc@google.com> wrote:
>
> On Thu, Jan 19, 2023, David Matlack wrote:
> > Rename kvm_flush_remote_tlbs_with_address() to
> > kvm_flush_remote_tlbs_range(). This name is shorter, which reduces the
> > number of callsites that need to be broken up across multiple lines, and
> > more readable since it conveys a range of memory is being flushed rather
> > than a single address.
>
> FYI, this conflicts with Hou's series, which I'm in the process of queueing for
> v6.3.
>
> https://lore.kernel.org/all/cover.1665214747.git.houwenlong.hwl@antgroup.com

Ack. I can resend on top of Hou's once it's queued.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
