Return-Path: <SRS0=HRg9=H7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 423FDC433DB
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Mar 2021 18:17:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E378064E38
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Mar 2021 18:17:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E378064E38
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AfPIbqTTtIvSaUgT+jWSeUqbBc5DYehEmuX+9viyOYk=; b=qzeVglAy8nncUhDTsGP/qtxpH
	YK9pNVCxeGevGUIJ2OMaRDtNuyU0rw4P/xxR7J0qEpl2+cWO6VTUeSgpWuwoYCcmg8lJh+IQgeXsW
	lrKeKWehdxqJZvH//7IzZMpvtwYWEc2lWAuckudb4aXqTBTYYwGfJ3k9drViF/f0wLJtgZmQPQ5CZ
	dx+tKmL2+4Ijao2JPckpXwS1fVWnCFM7fpWCBWKr7iuJvDyA7qcRpndn94CXEnHgHUAlarWDCKrAg
	J5n4A2WTRHdnW40R4ZVwYP7OrStUmLo/XAI+PoFABH5AaXJR2TyCG/U6ykHe7dxKjfjPBg5gKwaxr
	UlFGWwa9Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGn6F-0006ou-Ql; Mon, 01 Mar 2021 18:16:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGn6D-0006o4-Jb
 for linux-riscv@lists.infradead.org; Mon, 01 Mar 2021 18:16:54 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id CCCA264F57
 for <linux-riscv@lists.infradead.org>; Mon,  1 Mar 2021 18:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614622612;
 bh=5LaD9ADSkEkgP7QrUcRDJkh/I05inHI630/l2uSZC7s=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Xj3voceO7qjuRme+f6V6zcpJcA8SGjqbWKVCuZaPCZOOJHlstNZOLwgfGGlyCdz+n
 GcD7n93UXpjUt9DeNNfbTa+/I8xCA/bsIjp8cKqu6X36eRzukovLg8FGa1595d2fDF
 zYpDGrgJdWYd4wO7J7ba9pn7zq33DkpB2sLYeotzERkaOinejBmSe3gYaRJgaxT8+0
 o2VIZU3JsFjbpvl3pErRUry8AgHMbr7TDEl/eEFX04+atf5VMU4kCVsTSb/ESZ2CEf
 TO6hiypWqeEc1wAZJt9qa4C6yaYv2H8hwkJwS8wmslWbo4e9F5PpiZlqqnYRsl/b7p
 YvX3dLRmbwHuw==
Received: by mail-ot1-f41.google.com with SMTP id h22so17386122otr.6
 for <linux-riscv@lists.infradead.org>; Mon, 01 Mar 2021 10:16:52 -0800 (PST)
X-Gm-Message-State: AOAM5320cig0GVxtKsfVh0d1iJ7f8EZHWhH1KwEmpO/ZtDC7zziLSOv7
 PAMq/DlYCwrKgBVFA4uafheVajwwF5oGqBHJxpU=
X-Google-Smtp-Source: ABdhPJx/+3Wd4V4m2zdo0L1WUUmE8TYasMjfOdRBDEfTdmBwIg9Z+LQKrLerGSEvmNlmBhaggwwlL+lzIaHn95l/FC4=
X-Received: by 2002:a9d:42c:: with SMTP id 41mr14088908otc.108.1614622612025; 
 Mon, 01 Mar 2021 10:16:52 -0800 (PST)
MIME-Version: 1.0
References: <350c7458-c77b-56de-de5e-8c96ce9c16ae@huawei.com>
 <CAOnJCU+v=O1u1yK0UD7JYJAhzGmFmCLQk4yP8aZuJX-QoT5UWg@mail.gmail.com>
 <89b97904-e069-35cd-0a42-217cafe17e15@huawei.com>
 <CAOnJCU+HWA2znErbiiqEVWMkKtEfsyhXEwGEy_x2PqDzff4PXg@mail.gmail.com>
 <6bf9e8b6-55bf-f480-c316-d69fe6018ca0@huawei.com>
In-Reply-To: <6bf9e8b6-55bf-f480-c316-d69fe6018ca0@huawei.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 1 Mar 2021 19:16:40 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGi3=pDA_WTXRuBifrxku728p_A55wsQ+MTAJDe2sZQNA@mail.gmail.com>
Message-ID: <CAMj1kXGi3=pDA_WTXRuBifrxku728p_A55wsQ+MTAJDe2sZQNA@mail.gmail.com>
Subject: Re: question about RISCV EFI stub support
To: Kefeng Wang <wangkefeng.wang@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210301_131653_783999_5DEE1ED8 
X-CRM114-Status: GOOD (  20.61  )
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
Cc: Atish Patra <atish.patra@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Atish Patra <atishp@atishpatra.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 1 Mar 2021 at 15:43, Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
>
> + Palmer, sorry forget add to cc list...
>
> On 2021/2/25 10:00, Atish Patra wrote:
> > On Wed, Feb 24, 2021 at 5:29 PM Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
> >>
> >> On 2021/2/25 7:35, Atish Patra wrote:
> >>> On Wed, Feb 24, 2021 at 3:14 AM Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
> >>>> Hi Atish and Ard,
> >>>>
> >>>> The commit "cb7d2dd5612a RISC-V: Add PE/COFF header for EFI stub" use
> >>>> c.li to
> >>>>
> >>>> add Magic "MZ" signature for PE/COFF header, which select RISCV_ISA_C,
> >>>> but "C"
> >>>>
> >>>> to the ISA is optional,  and if "C" is not support ,  EFI boot is not
> >>>> supported.
> >>>>
> >>>> Could we use ".word MZ_MAGIC" like x86 code or some other way to support
> >>>> "MZ" signature?
> >>>>
> >>> .word won't work but .short will. With .word, you end up 0000 in the 2
> >>> bytes which can be interpreted as illegal instruction.
> >> Yes, should use ".short" in RV.
> >>> I guess your larger objective is to make the C extension optional and
> >>> not enabled by default for the Linux kernel.
> >> "C" extension is optional, and the upstream kernel has the RISCV_ISA_C which
> >>
> >> could be configurable.  and I think the EFI_STUB should not depend or
> >> select it,
> >>
> >> and maybe we only want to support RV64G in some cases,  what's your option?
> >>
> > I think RISCV_ISA_C was enabled by default just to generate a smaller
> > binary size.
> > @palmer : was there any other reason ?
>
> Any comment about the too issue,
>
> 1)  directly use .shout MZ_MAGIC to decouple EFI_STUB and RISCV_ISA_C.
>
> 2)  don't set RISCV_ISA_C  to default y
>

But doesn't that break non-EFI boot with the same image? The opcode
still needs to be executable, and have close-to-NOP semantics.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
