Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A941C636D6
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Feb 2023 02:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Rfvz+vM3KozYMbkCuLxLF4PllrIeiBJg/pJN5CLx7w=; b=rG3pkRvPEwNavh
	uelupf8ft1cRsgRloWhVa9LWq29tQCvKSi55BT/bbNkuVXyM8BlPnXuHBP5gVI5EvPa9X5+pEzDU9
	gKT+MMkR79CqAhuU9y7687DXDPpUi/9tAVb9E3WRb5LX4zoyr1KuPFuiL2HGmrtni8LFxID6cV7gj
	z7VbOaoRiQ1yd6h5O3RX9cUc+GIyMPPLyAUEgcZgAh8kpdE3t9E77YWiyIM//aZym3J0E8OxVq8B1
	U7Wd35KVcqqToEuvcRKOT4TlVJ6k8zxeL5tgEkf4dH8jQCp5pZuwvBjmBAjuglr48khRdptdL2reZ
	2lpZy8lEGAxg3J+rs4rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV1lr-00Enxk-Uo; Thu, 23 Feb 2023 02:55:47 +0000
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV1lp-00Enw1-EI
	for linux-riscv@lists.infradead.org; Thu, 23 Feb 2023 02:55:47 +0000
Received: by mail-vs1-xe30.google.com with SMTP id m10so10859469vso.4
        for <linux-riscv@lists.infradead.org>; Wed, 22 Feb 2023 18:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1677120942;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AZET/dAHnThSMI4ijShZNNiovoZM2A1RWGGjD4Jr3zI=;
        b=cQA7kltWBFhKaJFUORao4wek6jqjyO5D4kYl2n7nRPq3J23ED5n+McNlruyi43uuZl
         07VJ9zt4Nm++tPV3fZ0GPkp+rOqEcek1ldgMMLzR4f36/FF8Wx5t3CKAazBh3Z13hddI
         B6W1eOUUTqWrpMBR7j9rrOPL8xVjOZ680Q5kmvqASZuxgvTrFGqiAJ142h0x2kc0WyH5
         2yZF2L3He+AN7F3B9MVgRoQ6mGhm6rZ//a0QfDtrX3ML2Jo0k74YIAXyAXFaqd+V5q1j
         xruLkqG7LM1OPIR415ZcAjCnV4/6IEcL4uqzIcrQ9dhQgQhHI8v+wa3uUdGhv0LCzUEf
         gGwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677120942;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AZET/dAHnThSMI4ijShZNNiovoZM2A1RWGGjD4Jr3zI=;
        b=DAhc1yWQP+CNsTN4BZX/yV40A+AB1tWCV/NT5zxlUMe0a+JfV6XibgdolDf12/OEBK
         3FXYEODdbYMTI2iksMW8kTz9L+GSaBrL7hHCmvou0gffiw4IPob06+9Gkh0EkDmGLNrv
         VJvdLkqGXNUVClOtCyharq/w4UXnAP4IA9V93EjXkZm9wkgIZtzKBWoPN256QY0oE2LA
         7OMYJdh92Ace8YKrt2YiXGa7Fuutpqq5xksQVhSXEwwsLOSnz95uGQZCAJSRw7tdw7YG
         UTE4D5gLAokdQ7a9r9Z9pLfSrynDTikbVJKB6JmPatT1or+DIsxrKwBnk5MTLLcfTK28
         F0IQ==
X-Gm-Message-State: AO0yUKWluqsng1qmyGLOfZuDBX+e+DewmYzcGZawLH04XYtOadiFRm2D
	1S4tL/ByU1/Ow4R9tyRhz9N8uY65zN+oK0Zy+spgsw==
X-Google-Smtp-Source: AK7set+xIQn5l60WL9i2IviMkablDKXnJOMl8YCsfmyE5doLc73GdhGypaDze9dw46Wo8k5gVoLEbV4HXYtU7CRLrck=
X-Received: by 2002:a1f:7ccf:0:b0:406:1e33:3ddb with SMTP id
 x198-20020a1f7ccf000000b004061e333ddbmr1856299vkc.1.1677120942440; Wed, 22
 Feb 2023 18:55:42 -0800 (PST)
MIME-Version: 1.0
References: <CAOnJCUKHq_8msJtU-H1JvWJ8nY94J0tcarQMBsPNpBZO8sP6HQ@mail.gmail.com>
In-Reply-To: <CAOnJCUKHq_8msJtU-H1JvWJ8nY94J0tcarQMBsPNpBZO8sP6HQ@mail.gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 23 Feb 2023 08:25:31 +0530
Message-ID: <CAK9=C2Uy_0B6D2TGq35sfrGkp9s1Td=cEsidzDPTDhG7Nq5EWw@mail.gmail.com>
Subject: Re: Perf event to counter mapping question
To: Atish Patra <atishp@atishpatra.org>
Cc: linux-perf-users@vger.kernel.org, 
	"linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
	"mark.rutland@arm.com" <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
	Beeman Strong <beeman@rivosinc.com>, linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_185545_504330_66C7AE05 
X-CRM114-Status: GOOD (  27.83  )
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

On Thu, Feb 23, 2023 at 5:58 AM Atish Patra <atishp@atishpatra.org> wrote:
>
> Hi All,
> We are trying to figure out what is the best approach to define the
> perf event to programmable counter mappings in RISC-V.
> Until recently, all the programmable counter/event selector registers
> were writable in M-mode (highest privilege mode) only. The firmware
> residing in M-mode
> would discover the mapping from device tree[1] and the perf driver
> relies on SBI PMU[2] interface to discover the mapping between event &
> counters.
>
> There are new ISA extensions being proposed to make counters /event
> selector register in supervisor mode as well. Thus, a pmu driver
> can directly program the event selectors without relying on firmware.
> However, the kernel needs to be aware of counter mapping to do that.
>
> AFAIK, ARM64 allows all-to-all mapping in pmuv3[1]. That makes life
> much easier. It just needs to pick the next available counter.
> On the other hand, x86 allows selective counter mapping which is
> discovered from the json file and maintained in per event
> constraints[4].
> There may be some legacy reasons why it was done in x86 this way[5].
> Please correct me if I am wrong in my understanding/assumption.
>
> Here are a few approaches that can be used to solve it in RISC-V.
>
> 1. Continue to use device tree bindings
> Cons: We have to define similar entries for ACPI. It makes
> virtualization difficult as the VMM has to discover and update the
> device tree/ACPI as well.
>
> 2. Mandate all-to-all mapping similar to ARM64.
> Note: This is only for programmable counters. If the platform supports
> any fixed counters (i.e. can monitor
> only a specific event), that needs to be provisioned via some other
> method. IIRC the fixed counters(apart from cycle) in ARM64 are part of
> AMU not PMU.
>
> 3. All platforms need to define which subset of events can be
> monitored using a subset of counters. The platform specific perf json
> file can specify that.
> This approach provides more flexibility but makes the code path a bit
> more complex as the counter mask constraint needs to be maintained per
> event basis.
>
> 4. Any other approach ?

I suggest a 4th approach where by default the kernel assumes all-to-all
mappings and optionally perf json file can be used to override mappings
for certain counters. This approach is more like a hybrid approach between
approach #2 and #3. It work fine with KVM RISC-V as well because Guest/VM
will assume all-to-all mapping for logical HW counters whereas Host can have
specific counter mappings.

>
> Any thoughts on what would be the best approach for RISC-V. It would
> be great to repeat any past mistakes in RISC-V by learning from
> experience from the community.
>
> [1] https://lore.kernel.org/lkml/Y6tS959TaY2EBAdn@spud/T/
> [2] https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/riscv-sbi.adoc#function-find-and-configure-a-matching-counter-fid-2
> [3] https://elixir.bootlin.com/linux/v6.2/source/arch/arm64/kernel/perf_event.c#L899
> [4] https://elixir.bootlin.com/linux/latest/source/arch/x86/events/core.c#L876
> [5] https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1978937.html
> --
> Regards,
> Atish

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
