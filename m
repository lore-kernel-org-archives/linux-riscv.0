Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 460D9C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Mar 2022 04:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:Message-ID:To:From:CC:In-Reply-To:Subject:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=LS0jT6hiDKwuq9Q7HhNbNob3AbXFkjt3qUgLU2GdNpw=; b=0NBlmTVJD7e+NF
	sp3IUSs4NX347KriTAIJgtXkWarssKANJk10sE9JfzGhqlxn+2LgJgPx/MjFPxariTW/KkxoSNgzp
	ui0MzzfGPNRerOd4iI+/BnuwEqTgxs9M6iBl+GQzAYK3X1SwyhnC6gt1nnbvmoe1wS1L6fzjbe6hc
	eNWMnh4cB+Dunt1yrhcm2jCWJst8DAdoVsl1o7FudJ5aX3XRXrNbr000V4IuGTHyTjRdM0Rsn4Cp1
	0q8VH0gqziRvM6UVe72SkJusdqdGKnb1gSICrSA2W0EFFDBG5Sn6iZLjlvibrbs0NojDRbiMdb/ox
	WLSSokwd9c0oQT9RD24w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPzIo-008SiE-3s; Fri, 04 Mar 2022 04:12:26 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPzIk-008Sh7-EO
 for linux-riscv@lists.infradead.org; Fri, 04 Mar 2022 04:12:24 +0000
Received: by mail-pj1-x1030.google.com with SMTP id
 mr24-20020a17090b239800b001bf0a375440so4272596pjb.4
 for <linux-riscv@lists.infradead.org>; Thu, 03 Mar 2022 20:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id;
 bh=+d5M5Lb/1zkG36m0uGpnpPesPt+KsHy1eBe0GK/XMwc=;
 b=CkkA0/mouPXvKxUd3YxzJ5m4xo9WUwlpAqWfyuwr/cbcBOjnHVzlZDM/xlZ0d0ENSM
 C7Fau+6H4rDje2AS8qTyaRNBj0uG3HGJYm6En5wqXqUSJdhdyMT5DxkioaTFUj+N3BuN
 smwMX2GXVkvuLQdPCkswKlU4EIfzUgIfUWeyC9hQon88WOEvS959J1CK3ax4iKdMdLep
 dLCJk9yemy28QBa4T4aw5o5v+rrvInjenaF5XCOnXy0IavdHPXL9lNgc8COhqKe+xseg
 pazVacQhjHalPdfpGCt5KxRDVsn2ZVRB2lXWGaAAZyKrXJwyBO9EJISn5anl8gbJjOOK
 YAsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id;
 bh=+d5M5Lb/1zkG36m0uGpnpPesPt+KsHy1eBe0GK/XMwc=;
 b=7Qcz4uIIAlDA91pfetEthDFQd4hmQLhd6F5J9ZjwFz11kNxe9pmsXUbplshWe87UD1
 JgDI43cgdPK3qtJwRtjCjqUnjOHgz7PjHyBjNKhA3DoesSHf8y43mTQrZE3GsYipgKQJ
 5itUa6rjFVbSaK/FbHqcdBnxRsl9XzISAGdjGh9aMaTUsKtAP8InPxfEhVc3XXx13CXC
 V1XnznASkDdSNxrwihyg01Lc5D2T3I7ctsmwoGtS66rbTPw4TbSbOnEF8QbV6Rnwl++o
 bSfMdDZ0r23f4nOaVxJHGCf7KhzDg0cEoERdVJvKqVbkNtfF7Y1IuUBebbcwMkoQnChs
 mMLw==
X-Gm-Message-State: AOAM533iNYkn+M7T8dpLvK6YNpJENWW8RT+UeCMBYFTs/vNla+jFtg3T
 sVySQDKx14p27PIQq/HS4omFuA==
X-Google-Smtp-Source: ABdhPJwk/aE9ZV2E0IeEwWLejVf0b7LnvK5v9Cia+nWX3T1a9QlOU8bJXE16cd5hnokM5m6R/5MLXw==
X-Received: by 2002:a17:90a:7385:b0:1b9:6492:c107 with SMTP id
 j5-20020a17090a738500b001b96492c107mr8682494pjg.103.1646367140345; 
 Thu, 03 Mar 2022 20:12:20 -0800 (PST)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 z7-20020a056a00240700b004e1cde37bc1sm4075952pfh.84.2022.03.03.20.12.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 20:12:19 -0800 (PST)
Date: Thu, 03 Mar 2022 20:12:19 -0800 (PST)
X-Google-Original-Date: Thu, 03 Mar 2022 20:03:24 PST (-0800)
Subject: Re: [PATCH -fixes v3 0/6] Fixes KASAN and other along the way
In-Reply-To: <mhng-ffd5d5c5-9894-4dec-b332-5176d508bcf9@palmer-mbp2014>
CC: elver@google.com, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, ryabinin.a.a@gmail.com, andreyknvl@gmail.com,
 dvyukov@google.com, 
 nogikh@google.com, nickhu@andestech.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: glider@google.com, alexandre.ghiti@canonical.com
Message-ID: <mhng-ef0f4bac-b55e-471e-8e3d-8ea597081b74@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220303_201222_513055_528AC5E5 
X-CRM114-Status: GOOD (  37.11  )
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0378854823588874817=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0378854823588874817==
Content-Type: text/plain

On Tue, 01 Mar 2022 09:39:54 PST (-0800), Palmer Dabbelt wrote:
> On Fri, 25 Feb 2022 07:00:23 PST (-0800), glider@google.com wrote:
>> On Fri, Feb 25, 2022 at 3:47 PM Alexandre Ghiti <
>> alexandre.ghiti@canonical.com> wrote:
>>
>>> On Fri, Feb 25, 2022 at 3:31 PM Alexander Potapenko <glider@google.com>
>>> wrote:
>>> >
>>> >
>>> >
>>> > On Fri, Feb 25, 2022 at 3:15 PM Alexandre Ghiti <
>>> alexandre.ghiti@canonical.com> wrote:
>>> >>
>>> >> On Fri, Feb 25, 2022 at 3:10 PM Alexander Potapenko <glider@google.com>
>>> wrote:
>>> >> >
>>> >> >
>>> >> >
>>> >> > On Fri, Feb 25, 2022 at 3:04 PM Alexandre Ghiti <
>>> alexandre.ghiti@canonical.com> wrote:
>>> >> >>
>>> >> >> On Fri, Feb 25, 2022 at 2:06 PM Marco Elver <elver@google.com>
>>> wrote:
>>> >> >> >
>>> >> >> > On Fri, 25 Feb 2022 at 13:40, Alexandre Ghiti
>>> >> >> > <alexandre.ghiti@canonical.com> wrote:
>>> >> >> > >
>>> >> >> > > As reported by Aleksandr, syzbot riscv is broken since commit
>>> >> >> > > 54c5639d8f50 ("riscv: Fix asan-stack clang build"). This commit
>>> actually
>>> >> >> > > breaks KASAN_INLINE which is not fixed in this series, that will
>>> come later
>>> >> >> > > when found.
>>> >> >> > >
>>> >> >> > > Nevertheless, this series fixes small things that made the syzbot
>>> >> >> > > configuration + KASAN_OUTLINE fail to boot.
>>> >> >> > >
>>> >> >> > > Note that even though the config at [1] boots fine with this
>>> series, I
>>> >> >> > > was not able to boot the small config at [2] which fails because
>>> >> >> > > kasan_poison receives a really weird address 0x4075706301000000
>>> (maybe a
>>> >> >> > > kasan person could provide some hint about what happens below in
>>> >> >> > > do_ctors -> __asan_register_globals):
>>> >> >> >
>>> >> >> > asan_register_globals is responsible for poisoning redzones around
>>> >> >> > globals. As hinted by 'do_ctors', it calls constructors, and in
>>> this
>>> >> >> > case a compiler-generated constructor that calls
>>> >> >> > __asan_register_globals with metadata generated by the compiler.
>>> That
>>> >> >> > metadata contains information about global variables. Note, these
>>> >> >> > constructors are called on initial boot, but also every time a
>>> kernel
>>> >> >> > module (that has globals) is loaded.
>>> >> >> >
>>> >> >> > It may also be a toolchain issue, but it's hard to say. If you're
>>> >> >> > using GCC to test, try Clang (11 or later), and vice-versa.
>>> >> >>
>>> >> >> I tried 3 different gcc toolchains already, but that did not fix the
>>> >> >> issue. The only thing that worked was setting asan-globals=0 in
>>> >> >> scripts/Makefile.kasan, but ok, that's not a fix.
>>> >> >> I tried to bisect this issue but our kasan implementation has been
>>> >> >> broken quite a few times, so it failed.
>>> >> >>
>>> >> >> I keep digging!
>>> >> >>
>>> >> >
>>> >> > The problem does not reproduce for me with GCC 11.2.0: kernels built
>>> with both [1] and [2] are bootable.
>>> >>
>>> >> Do you mean you reach userspace? Because my image boots too, and fails
>>> >> at some point:
>>> >>
>>> >> [    0.000150] sched_clock: 64 bits at 10MHz, resolution 100ns, wraps
>>> >> every 4398046511100ns
>>> >> [    0.015847] Console: colour dummy device 80x25
>>> >> [    0.016899] printk: console [tty0] enabled
>>> >> [    0.020326] printk: bootconsole [ns16550a0] disabled
>>> >>
>>> >
>>> > In my case, QEMU successfully boots to the login prompt.
>>> > I am running QEMU 6.2.0 (Debian 1:6.2+dfsg-2) and an image Aleksandr
>>> shared with me (guess it was built according to this instruction:
>>> https://github.com/google/syzkaller/blob/master/docs/linux/setup_linux-host_qemu-vm_riscv64-kernel.md
>>> )
>>> >
>>>
>>> Nice thanks guys! I always use the latest opensbi and not the one that
>>> is embedded in qemu, which is the only difference between your command
>>> line (which works) and mine (which does not work). So the issue is
>>> probably there, I really need to investigate that now.
>>>
>>> Great to hear that!
>>
>>
>>> That means I only need to fix KASAN_INLINE and we're good.
>>>
>>> I imagine Palmer can add your Tested-by on the series then?
>>>
>> Sure :)
>
> Do you mind actually posting that (i, the Tested-by tag)?  It's less
> likely to get lost that way.  I intend on taking this into fixes ASAP,
> my builds have blown up for some reason (I got bounced between machines,
> so I'm blaming that) so I need to fix that first.

This is on fixes (with a "Tested-by: Alexander Potapenko 
<glider@google.com>"), along with some trivial commit message fixes.

Thanks!

>
>>
>>>
>>> Thanks again!
>>>
>>> Alex
>>>
>>> >>
>>> >> It traps here.
>>> >>
>>> >> > FWIW here is how I run them:
>>> >> >
>>> >> > qemu-system-riscv64 -m 2048 -smp 1 -nographic -no-reboot \
>>> >> >   -device virtio-rng-pci -machine virt -device \
>>> >> >   virtio-net-pci,netdev=net0 -netdev \
>>> >> >   user,id=net0,restrict=on,hostfwd=tcp:127.0.0.1:12529-:22 -device \
>>> >> >   virtio-blk-device,drive=hd0 -drive \
>>> >> >   file=${IMAGE},if=none,format=raw,id=hd0 -snapshot \
>>> >> >   -kernel ${KERNEL_SRC_DIR}/arch/riscv/boot/Image -append
>>> "root=/dev/vda
>>> >> >   console=ttyS0 earlyprintk=serial"
>>> >> >
>>> >> >
>>> >> >>
>>> >> >> Thanks for the tips,
>>> >> >>
>>> >> >> Alex
>>> >> >
>>> >> >
>>> >> >
>>> >> > --
>>> >> > Alexander Potapenko
>>> >> > Software Engineer
>>> >> >
>>> >> > Google Germany GmbH
>>> >> > Erika-Mann-Straße, 33
>>> >> > 80636 München
>>> >> >
>>> >> > Geschäftsführer: Paul Manicle, Liana Sebastian
>>> >> > Registergericht und -nummer: Hamburg, HRB 86891
>>> >> > Sitz der Gesellschaft: Hamburg
>>> >> >
>>> >> > Diese E-Mail ist vertraulich. Falls Sie diese fälschlicherweise
>>> erhalten haben sollten, leiten Sie diese bitte nicht an jemand anderes
>>> weiter, löschen Sie alle Kopien und Anhänge davon und lassen Sie mich bitte
>>> wissen, dass die E-Mail an die falsche Person gesendet wurde.
>>> >> >
>>> >> >
>>> >> >
>>> >> > This e-mail is confidential. If you received this communication by
>>> mistake, please don't forward it to anyone else, please erase all copies
>>> and attachments, and please let me know that it has gone to the wrong
>>> person.
>>> >>
>>> >> --
>>> >> You received this message because you are subscribed to the Google
>>> Groups "kasan-dev" group.
>>> >> To unsubscribe from this group and stop receiving emails from it, send
>>> an email to kasan-dev+unsubscribe@googlegroups.com.
>>> >> To view this discussion on the web visit
>>> https://groups.google.com/d/msgid/kasan-dev/CA%2BzEjCsQPVYSV7CdhKnvjujXkMXuRQd%3DVPok1awb20xifYmidw%40mail.gmail.com
>>> .
>>> >
>>> >
>>> >
>>> > --
>>> > Alexander Potapenko
>>> > Software Engineer
>>> >
>>> > Google Germany GmbH
>>> > Erika-Mann-Straße, 33
>>> > 80636 München
>>> >
>>> > Geschäftsführer: Paul Manicle, Liana Sebastian
>>> > Registergericht und -nummer: Hamburg, HRB 86891
>>> > Sitz der Gesellschaft: Hamburg
>>> >
>>> > Diese E-Mail ist vertraulich. Falls Sie diese fälschlicherweise erhalten
>>> haben sollten, leiten Sie diese bitte nicht an jemand anderes weiter,
>>> löschen Sie alle Kopien und Anhänge davon und lassen Sie mich bitte wissen,
>>> dass die E-Mail an die falsche Person gesendet wurde.
>>> >
>>> >
>>> >
>>> > This e-mail is confidential. If you received this communication by
>>> mistake, please don't forward it to anyone else, please erase all copies
>>> and attachments, and please let me know that it has gone to the wrong
>>> person.
>>>
>>> --
>>> You received this message because you are subscribed to the Google Groups
>>> "kasan-dev" group.
>>> To unsubscribe from this group and stop receiving emails from it, send an
>>> email to kasan-dev+unsubscribe@googlegroups.com.
>>> To view this discussion on the web visit
>>> https://groups.google.com/d/msgid/kasan-dev/CA%2BzEjCuJw8N0dUmQNdFqDM96bzKqPDjRe4FUnOCbjhJtO0R8Hg%40mail.gmail.com
>>> .
>>>
>>
>>
>> --
>> Alexander Potapenko
>> Software Engineer
>>
>> Google Germany GmbH
>> Erika-Mann-Straße, 33
>> 80636 München
>>
>> Geschäftsführer: Paul Manicle, Liana Sebastian
>> Registergericht und -nummer: Hamburg, HRB 86891
>> Sitz der Gesellschaft: Hamburg
>>
>> Diese E-Mail ist vertraulich. Falls Sie diese fälschlicherweise erhalten
>> haben sollten, leiten Sie diese bitte nicht an jemand anderes weiter,
>> löschen Sie alle Kopien und Anhänge davon und lassen Sie mich bitte wissen,
>> dass die E-Mail an die falsche Person gesendet wurde.
>>
>>
>>
>> This e-mail is confidential. If you received this communication by mistake,
>> please don't forward it to anyone else, please erase all copies and
>> attachments, and please let me know that it has gone to the wrong person.


--===============0378854823588874817==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0378854823588874817==--
