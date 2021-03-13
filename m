Return-Path: <SRS0=xwO/=IL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 765EEC433E0
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Mar 2021 22:35:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED82664ED0
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Mar 2021 22:35:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED82664ED0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hnr9Cc0y2nuV5EOB/Mfl8Y0tIEYYzwZpU3h8++UR2iI=; b=a3Cip0QGetJXZfHk5A0Zii8s9
	TzHMBtsP5d462075YR14CsG41ANpLv+L1WroRDMCiXmHcmxlfuwDqyc9ARULnMcGAnEknhYU3AaQp
	ZLcByxxZwq8RnSTKG5JB3mI/n8g4FjK3mhW83SyFhUzpsbeinmic/omK/wXT3UQvfa2WvtdtKXdll
	qJqNmK1IQ43R8ZGluew9yM1JKYi0GBKJB19z0voR+DmNJGY2M5yyUTa0rlI/O59hSEIb8eNlnNjwn
	RdI9CCf4IJEn0Cd6uS/hMQFNV3uWaX2UkbD2d0hXZEVh5+mVkZXvbWyusv/GG61oRBwM0opNkKYNK
	AqTTr90PQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLCr4-00Dg7d-Sw; Sat, 13 Mar 2021 22:35:31 +0000
Received: from mout.kundenserver.de ([212.227.126.131])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLCqw-00Dg5t-Jy
 for linux-riscv@lists.infradead.org; Sat, 13 Mar 2021 22:35:25 +0000
Received: from mail-ot1-f46.google.com ([209.85.210.46]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N6srH-1ln7Yu2s51-018Mji for <linux-riscv@lists.infradead.org>; Sat, 13 Mar
 2021 23:35:19 +0100
Received: by mail-ot1-f46.google.com with SMTP id
 31-20020a9d00220000b02901b64b9b50b1so3306502ota.9
 for <linux-riscv@lists.infradead.org>; Sat, 13 Mar 2021 14:35:16 -0800 (PST)
X-Gm-Message-State: AOAM532VeSEwxwiLYeHUqQxOhc1hl9oLD02fAhvSLem5388cw9+7N+Im
 SB6WYOeN2XJL2YdqziB4BJ1mPL2TLTN1iPNKI+8=
X-Google-Smtp-Source: ABdhPJy1hCZSOZgjWjUIiV7y81YWmhIh+++bR5CYo5jf0Rk/VdQv1W4rLs5PJp++TQ7iq07uGhi7ibXsnePfk6JNHFs=
X-Received: by 2002:a05:6830:148c:: with SMTP id
 s12mr8850529otq.251.1615674915810; 
 Sat, 13 Mar 2021 14:35:15 -0800 (PST)
MIME-Version: 1.0
References: <20210225080453.1314-1-alex@ghiti.fr>
 <20210225080453.1314-3-alex@ghiti.fr>
 <5279e97c-3841-717c-2a16-c249a61573f9@redhat.com>
 <7d9036d9-488b-47cc-4673-1b10c11baad0@ghiti.fr>
 <CAK8P3a3mVDwJG6k7PZEKkteszujP06cJf8Zqhq43F0rNsU=h4g@mail.gmail.com>
 <236a9788-8093-9876-a024-b0ad0d672c72@ghiti.fr>
 <CAK8P3a1+vSoEBqHPzj9S07B7h-Xuwvccpsh1pnn+1xJmS3UdbA@mail.gmail.com>
 <50109729-9a86-6b49-b608-dd5c8eb2d88e@ghiti.fr>
In-Reply-To: <50109729-9a86-6b49-b608-dd5c8eb2d88e@ghiti.fr>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 13 Mar 2021 23:34:59 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1Nh4KUD85Fg_vFHf2fLMOqZThBgzyduLgfEtjGf-pm4g@mail.gmail.com>
Message-ID: <CAK8P3a1Nh4KUD85Fg_vFHf2fLMOqZThBgzyduLgfEtjGf-pm4g@mail.gmail.com>
Subject: Re: [PATCH 2/3] Documentation: riscv: Add documentation that
 describes the VM layout
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: David Hildenbrand <david@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Andrey Ryabinin <aryabinin@virtuozzo.com>, 
 Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 kasan-dev <kasan-dev@googlegroups.com>, 
 linux-arch <linux-arch@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>, 
 Linus Walleij <linus.walleij@linaro.org>
X-Provags-ID: V03:K1:jQs4epBbYp8tJNnPBMf64qASWANhbJsz5evtByO5we90Tr2t80m
 J9g5i7ltNtW0ZFfo8+KegF5LYve5KFlH4plTgBrq+bros7WWVs93l2o4gqJfvZEEI0Lwx6m
 iEfDFqK5pYPXYvMffoYdzn/Kl0ZlrdMGd5qyVMAbhIyw5f8AHvuEx+5iSMfx+UH/dMQpw8r
 ZzFXMUIv3s8Pco0/PMRcQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:H0jNgB1t5pA=:hjLWeemiu1ZUoYfIEDrOJQ
 fFSNmI7lpT6Z4xxlUHC68P/4+P7jjrxLIkh8Bkj7h0NRc2lSZgNdOSvjrRZkbKwNOOSQg7spU
 XmN61VNV96OTFPjogKwQnlGGqKIuroigtEvpfOibpeGvYUZA+TM4GTAowPgWkl9BRQX0rApyV
 xhfBvZMrNkeiH3ue5Wm01439DnPpqToRvwBhE/iO7TuMyb9mPOnyip79MD9YkGl6fuA8/r8vi
 OsRXyBx1BrpLVIXSLILwBapYzryYD4acM4TUjt8nEcUhJtu630bKjpyhwHDbQha8lQXaKLG/k
 8TGSXs9N30wu1BL0vqBMBH9sUZy+E2qkn3VUtDC+topS9CEFFgxtoMXNEC+IDME3JashaZJOi
 X+UGEtsx9Esz7B0lz4LigztJBZ5eniUKpEyizk663SZ83pTeLn0GDkCyfuduHKBmqS/VrmiYm
 tBv+UZk9OTsEq9YxISq9/QGDII+6FxNCoyaTHpG6ZtaWKavpZSjPKZXauDjQo0z1pgDMNNQVb
 0aKgMjXbHCjQZ8CRArwNQP0kxd1JqjcxRDAfJ/FKk0VxvTqZ/+U5crCoceqb6us5g==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210313_223522_796516_889C9AEB 
X-CRM114-Status: GOOD (  11.09  )
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

On Sat, Mar 13, 2021 at 9:23 AM Alex Ghiti <alex@ghiti.fr> wrote:
>
> Yes I considered it...when you re-proposed it :) I'm not opposed to your
> solution in the vmalloc region but I can't find any advantage over the
> current solution, are there ? That would harmonize with Linus's work,
> but then we'd be quite different from x86 address space.
>
> And by the way, thanks for having suggested the current solution in a
> previous conversation :)

Ah, I really need to keep track better of what I already commented on...

      Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
