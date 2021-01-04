Return-Path: <SRS0=j3hv=GH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03EFDC433E0
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Jan 2021 20:46:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F9532225E
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Jan 2021 20:46:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F9532225E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6multJdwRK5xQ/R2fB4j2GERtoTCkipVyLGOIZEh9ws=; b=Qsp6QSBDpT1BAD8aFQ/QXq6Dq
	25sHZV+/4x0szDjCS1JAOhaTx/BCR95HUiJeu4mkxwETr0NV4bpz6bzotVGQRvNvWOqhrNVUri/+o
	id40PuhS+RKbfXDYkx6agIBUNqOHvvkTFzKz6Qc2nf4s6QvlsfM7BiGic9wgeAVFZ49E8qXvw7ZNu
	Av0iO8Up0z5deobFHd78lzs010VSWL1a9xR1pqI4iS5eDQCaTa7fC99XY9S4MpOXBQ9POMNX3s/7g
	eUSHLdniruMYfCxymCOreY02/eOMhv/TtoDJvMIANVzomC4KNCXFEbDm2LM5pKy4vOJhB3+shIAnj
	GlE4vM5Lg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwWkA-0006HQ-3f; Mon, 04 Jan 2021 20:46:22 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwWk6-0006H6-49
 for linux-riscv@lists.infradead.org; Mon, 04 Jan 2021 20:46:20 +0000
Received: by mail-il1-x12f.google.com with SMTP id w12so26556632ilm.12
 for <linux-riscv@lists.infradead.org>; Mon, 04 Jan 2021 12:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IrppK0VCBjYzjOQzTmckqOLYms882rhHM333L87kK38=;
 b=q0rkN0cttO0yd5JBszplTmk9/N3xko0JCaWXJPx5DwQlPEOP3NgOcLNUVQdRn7mk/J
 bM1PTznU+NTiKKXmQ1IDewgqN7PZeQXBKfCI4CbYh5fsGRWtBDdYybNDqdR1z251FP7S
 O139Cp9B2cLohW74sA5+Mk1bszbqAo3augbvw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IrppK0VCBjYzjOQzTmckqOLYms882rhHM333L87kK38=;
 b=sCiDwjVYV4Fn/LkakRdkfkn0c3/jU44tLzUnsq6CWvwMlQZHUwBCmkDz4RLI3wdaaB
 tWe+FDfT2HYo43SPDfdD3LGZy5l5731bH9e2jBP9G5JWSH3G37K8gBmPvfCBGGGLFZ04
 rycz6kKjbTKpB48CW5wq138aGbXiN3ipKGARbUPQuzlkAEuybS88CPEvMhL7Z5f+gnHO
 xxH0RDRQGzJk5b+XGh8BFo60tTuvvTFNXefzanaRb1EEEzS5Nt20Y9wQomNRlGJVJKOS
 kUNjl6bmXDVdgQc7koQm+9Vl0B3jMu+2r1rRp6M4e9G+GpayPDbXjYxT/obkEfmf3sPy
 rTZQ==
X-Gm-Message-State: AOAM533/eYlW6jX8HQ4hTwIR0FEoBMCVANRz+SQ5+pEEolb8tvA2m10U
 osQ/SJr7psSCS/iPXIMCt+haxNi65sEBBgSob4ooZgkMntVy3z8=
X-Google-Smtp-Source: ABdhPJzdiI6Ur2O5iWhaBzAM34+PvWh7l5pBF4xCVXDkznyaBkilJ434cHtycNocFWvtPhMIacBxA2LdUmzNXwWlIGk=
X-Received: by 2002:a92:6410:: with SMTP id y16mr73838822ilb.126.1609793174014; 
 Mon, 04 Jan 2021 12:46:14 -0800 (PST)
MIME-Version: 1.0
References: <mvmk0ssu8yi.fsf@suse.de>
In-Reply-To: <mvmk0ssu8yi.fsf@suse.de>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 4 Jan 2021 12:46:03 -0800
Message-ID: <CAOnJCU+JmDaU1f3hAbyjR4__TVHJbjnZZ8th25i5Q-et_UxXeg@mail.gmail.com>
Subject: Re: EFI booting crashes
To: Andreas Schwab <schwab@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_154618_324407_7D067F00 
X-CRM114-Status: GOOD (  13.45  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jan 4, 2021 at 5:29 AM Andreas Schwab <schwab@suse.de> wrote:
>
> Has anyone sucessfully booted 5.10 via EFI?  When I try that, I get this
> crash:
>

I just tested them with 5.11-rc2 with bootefi command from U-Boot on
Qemu. I booted both busybox and a Fedora image.

[root@fedora-riscv ~]# cat /sys/kernel/debug/efi_page_tables
---[ UEFI runtime start ]---
0x0000000020000000-0x0000000020001000    0x00000000be730000         4K
PTE     D A . . . W R V
0x0000000020014000-0x0000000020017000    0x00000000be734000        12K
PTE     D A . . . W R V
0x0000000020028000-0x000000002002c000    0x00000000be738000        16K
PTE     D A . . . W R V
0x000000002003a000-0x000000002003b000    0x00000000bff6a000         4K
PTE     D A . . X W R V
---[ UEFI runtime end ]---

The panic seems to have been caused by invalid runtime services mapping.
Can you give more details on the platform and UEFI firmware (U-Boot/EDK2) used ?
If you can share the opensuse image, I can try that as well.

> [    7.677382] Unable to handle kernel paging request at virtual address 00000000200a2388
> [    7.678710] Oops [#1]
> [    7.678873] Modules linked in:
> [    7.679242] CPU: 0 PID: 7 Comm: kworker/u2:0 Not tainted 5.10.3-1-default #1 openSUSE Tumbleweed
> [    7.679954] Workqueue: efi_rts_wq efi_call_rts
> [    7.680296] epc: 000000002002c33c ra : 000000002002c496 sp : ffffffe07eacfd10
> [    7.680656]  gp : ffffffe001367ab8 tp : ffffffe07eac0000 t0 : 00000000000002ea
> [    7.681031]  t1 : ffffffe07ea08c6c t2 : ffffffe000a025f4 s0 : ffffffe07ea9fd80
> [    7.681400]  s1 : 00000000200a2338 a0 : ffffffe07ea9fd98 a1 : ffffffe000c15080
> [    7.681756]  a2 : 0000000000000000 a3 : ffffffe07ea9fd80 a4 : ffffffe07ea9fd78
> [    7.682023]  a5 : 0000000000000000 a6 : ffffffe000c15080 a7 : 0000000000045b96
> [    7.682380]  s2 : 0000000000000000 s3 : 0000000000000000 s4 : 0000000000000000
> [    7.682795]  s5 : ffffffe07ea9fd80 s6 : ffffffe07ea9fd78 s7 : 0000000000000022
> [    7.683216]  s8 : ffffffe00140c698 s9 : ffffffe00003d580 s10: ffffffe00003d580
> [    7.683630]  s11: ffffffe07ea08c00 t3 : 0000000000000000 t4 : 000000000000010a
> [    7.684205]  t5 : 0009be2b8189352a t6 : 00000000000bafbf
> [    7.684543] status: 0000000000000120 badaddr: 00000000200a2388 cause: 000000000000000d
> [    7.685557] ---[ end trace 7579eddbb881c1ff ]---
>
> Andreas.
>
> --
> Andreas Schwab, SUSE Labs, schwab@suse.de
> GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
> "And now for something completely different."
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



--
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
