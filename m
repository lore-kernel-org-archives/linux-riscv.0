Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BFE6C433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Apr 2022 04:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XFEbsLWJkKkFgsy2yUQj0aHWK4OtHngUCX0CEcZlcwA=; b=pEnQbtw3Z46HGn
	u1zzRrvTa8F/Al9nq0BXeY0Ly3GVy9JZKox9GYuQ0ZbIZEHBmh9VxxrYqR2rS6Xq5Sv4Qx/Loij1e
	SdZqKRY47yCTpGJXgGC5tmVDHxUs7qSvI7Fo/gxPcyqqNJYWj/jCjmwBWlTByiAgmzeDgZTr1mvDn
	/BNX7k+a7qg5rvxH/89fa6dOudFiuQnpc4X4yM1QWRhQoSnSCJRHG66SufO9jTfmbEYoGWbkKHuFE
	0n8Qc5btc9XYyEKQiZahFCnwrLYu0qN9jPUMbNLiASJFkci4RTTrkBI9P3zjoJBkkJg/fyIfPFSMh
	DzxOyVj8ZVOcflUYbJVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbE4u-00D08R-UM; Mon, 04 Apr 2022 04:12:32 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbE4q-00D03b-PF
 for linux-riscv@lists.infradead.org; Mon, 04 Apr 2022 04:12:30 +0000
Received: by mail-lf1-x12a.google.com with SMTP id b17so7262523lfv.3
 for <linux-riscv@lists.infradead.org>; Sun, 03 Apr 2022 21:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WFqQvpKwz9t3MY+vODy7R6BwTMReD9EdP51jpYbflnM=;
 b=ZCKSOsE9fWMUmrSdwyyh4jD0q/OpYUH/QL2SGajWsM7FyBvZRcWnoBFFLEyb6//gy7
 xDoghElluMymqnJk7EtAkzfN1G7LsjBEA96ENW/BTeTClIugzQHyTzi1mHTE2sy83eob
 yLHXP6PoNhvGEzTi0TyBVnZR9bKLwwgF3MiMGPNIySFyYkdeO5IL59o0act2GAvKlxo0
 EtgPgILqxaGDU69VXLnG4iw2UGQEOTQUy6BPYGV2y0C37/eKGJYFaOyOCfGQ0fVGj0zy
 aqoU1quVMMvGtJ6XRxJi6f5lQX3vcnfB6bHHAm65w687o5MCbNeX5bgQs+LdwbadFljW
 OZTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WFqQvpKwz9t3MY+vODy7R6BwTMReD9EdP51jpYbflnM=;
 b=G6uerUPTuGECrGnyzQGyFO37ehqI66NYL+Es3hKevZe0b7ET3LrXkDzEsDrOaewuK/
 y501dy8VTU71STbS1UVYam+bl4qvwsyyGtaOrvGHG3cuwyDhLeE6P6MYxjhkvN2D3UF5
 bu8YB82oC47sq7pOyY/JgHpm1lE1JUWpGOLf4we+SF154HjyGxmOM5ycMRfzFcfMJsLQ
 4c9gLlr3oTDrNabFL12hCs4oXrLuFML2vx8zSDujJ+3qOa1/xIy+pn/lzoxXLqrelmVQ
 mfKHzfJGimujxr0d0iHSHrhvilPB/Qlo0swMERVHsnPELwUmjx8zz2Q0WkrZk7P4hLSj
 uFPA==
X-Gm-Message-State: AOAM531AQNjkFk8EdkxAt8YwO+UHhNwbIdFe68/W6SiAfJdroH34x6XM
 n8kii/Tg3ggJJzOIUmVBPdtR60Mwpcivfu2Pz6oJUw==
X-Google-Smtp-Source: ABdhPJyinho72oQzNrsFqpzY5lxEeLn5p7+NZqaJLckd4I6rzYec05uSBjtN9ScpP9d9s378wpp70bZ4EoRuAGjAbxs=
X-Received: by 2002:a05:6512:3ca9:b0:44a:fe96:fe0e with SMTP id
 h41-20020a0565123ca900b0044afe96fe0emr3042289lfv.77.1649045538414; Sun, 03
 Apr 2022 21:12:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220329072911.1692766-1-apatel@ventanamicro.com>
In-Reply-To: <20220329072911.1692766-1-apatel@ventanamicro.com>
From: Mayuresh Chitale <mchitale@ventanamicro.com>
Date: Mon, 4 Apr 2022 09:41:42 +0530
Message-ID: <CAN37VV4qnjyf96EA-uo7bs1jRavh-oB+eUk08i-6f0RiqCDC-Q@mail.gmail.com>
Subject: Re: [PATCH 0/3] Unexpected guest trap handling for KVM RISC-V
 selftests
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atishp@atishpatra.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220403_211228_875209_3701C1B1 
X-CRM114-Status: GOOD (  12.55  )
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

On Tue, Mar 29, 2022 at 1:00 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> Getting unexpected guest traps while running KVM RISC-V selftests should
> cause the test to fail appropriately with VCPU register dump. This series
> improves handling of unexpected traps along these lines.
>
> These patches can also be found in riscv_kvm_selftests_unexp_trap_v1 branch
> at: https://github.com/avpatel/linux.git
>
> Anup Patel (3):
>   KVM: selftests: riscv: Set PTE A and D bits in VS-stage page table
>   KVM: selftests: riscv: Fix alignment of the guest_hang() function
>   KVM: selftests: riscv: Improve unexpected guest trap handling
>
>  .../selftests/kvm/include/riscv/processor.h   | 12 ++++---
>  .../selftests/kvm/lib/riscv/processor.c       |  9 +++---
>  tools/testing/selftests/kvm/lib/riscv/ucall.c | 31 +++++++++++++------
>  3 files changed, 34 insertions(+), 18 deletions(-)
>
> --
> 2.25.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

I have tested the series on Qemu.

Tested-by: Mayuresh Chitale <mchitale@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
