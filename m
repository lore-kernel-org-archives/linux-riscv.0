Return-Path: <SRS0=LC3o=LF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70468C48BE0
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Jun 2021 11:39:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3573B613CD
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Jun 2021 11:39:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3573B613CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AgbAXhA8eW7eOEr1//FXp0QDGvIxjD6AjZUGmjDfg8g=; b=M8XUgk8unJFatv
	DTIlAqwYUnfzklK1Th16gi9u/TFtpFIufPpAyqHA4Pil+OLiBkqnwViKfMXYYLkqbEoCzngftzUKG
	rrD5QO2yGDCljgp8HjjTNa0jVTgHOEtt/sGxpAZgRWj7LvFV3sbdAoIVQ8dab72pJETdfp8wOV++0
	GDEbS3YbVEyvfhANTYBWaj1gXso4ZbZfs8/VSWbAPjC1+XHf2flpm+ETHWjqfYigXK9hK6tuwBeWc
	2Cpamre2WL94BVjO0a7VltKMi+OkkunJ/FEUTpqR9juHW7VrtAP5dWcU71ik8slthJWCPn7HkssFz
	YIXNqY/gPWcAaJWJERQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrfVg-0054wM-TT; Fri, 11 Jun 2021 11:39:36 +0000
Received: from mail-qk1-f176.google.com ([209.85.222.176])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrfVe-0054um-9E
 for linux-riscv@lists.infradead.org; Fri, 11 Jun 2021 11:39:35 +0000
Received: by mail-qk1-f176.google.com with SMTP id i68so26977166qke.3
 for <linux-riscv@lists.infradead.org>; Fri, 11 Jun 2021 04:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qhYV4dmRiRSpgYWOGzvvHoyogPprGMAPvN/EL3Ivaw4=;
 b=Jo3ruZFqwjcjNLkGQCyayLv+4DS3xQ3R9Pxg8NQ30pVYxW23D+HA6kVT+LHbVqzMVm
 09KmjGNtlMrK2X3G9+i3urPLGOy4eVJxQsQMlkgHXCDXz6U9CIHwo0wPBf4u60EbdVTx
 r/vppEDFgiGl1n736YSaoy/tdFFPRAoWOgPaLe1VK2eDmNYPlOJ+HkN95I4I0X7Of0lo
 ksq88jWGAQqbQHRJDxe/QnCrth3VSmrbYJdtAAX0ufYgruNtTJH4uQK0MwD93tvzeeth
 ReeXRhcDk9VKMYNXe5cGn+R3RGBbVqsDWiSwMkrIkZdgVFJzvovQ1q6pUEC+8Jht25nX
 4rGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qhYV4dmRiRSpgYWOGzvvHoyogPprGMAPvN/EL3Ivaw4=;
 b=kPaJZXQz554WWZ+wpqPZkH+lh9UlHUPRiNkIt8YEOaJd0pR/slFcJX55Xdjw7GPYKM
 iKJgz2ypq79Ro+5H7LQwFivpxVeajhcNUggso30tKAkJGLjC4oqPAtJmUPCZfBkP6a+q
 s/0eQtuGO+/AYGkLXUA6ZyOPks4o4+sGOXgHMCN4oBcdJsFw0SnBNsE44VYBOrdfki4Z
 qLVxXOiQD2MedSgf/NjLfZa0GRq+MaN0x/YMYFEpr5T26r+zCaJYSUY5h+P8UORrY/Vk
 3rXys/aADPYwItG9LVbaAiwmPCb3V9P6x/X1CVdRf3ciAEYsVajYZK11P374BgwLGUPW
 I2ZQ==
X-Gm-Message-State: AOAM5310L99K8nsAuPJ5Q7T+r8LvWqQmO3SsP6uxmQ3ENXy+AvATzWej
 zRnfPUPOqDDXWAz8+jzdbHbxERLfNejTeW9cVpdIUg==
X-Google-Smtp-Source: ABdhPJztwHpLwTUGjxnjUd85Yk8W2utgZi5ro/yuiZhde0n6F6iX5b7WnVyIR+4sIuZ8yRZ/6zLYzy1ejNz0kAAG6EE=
X-Received: by 2002:a37:a2d6:: with SMTP id l205mr3313686qke.326.1623411509230; 
 Fri, 11 Jun 2021 04:38:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210529080340.2987212-1-liushixin2@huawei.com>
In-Reply-To: <20210529080340.2987212-1-liushixin2@huawei.com>
From: Alexander Potapenko <glider@google.com>
Date: Fri, 11 Jun 2021 13:37:52 +0200
Message-ID: <CAG_fn=XjoZAn+h3b9Yh0PgSNCWn6V2dgHoT-PHG_Z2Js6wUkgQ@mail.gmail.com>
Subject: Re: [PATCH -next] riscv: Enable KFENCE for riscv64
To: Liu Shixin <liushixin2@huawei.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Marco Elver <elver@google.com>, 
 Dmitry Vyukov <dvyukov@google.com>, linux-riscv@lists.infradead.org, 
 LKML <linux-kernel@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_043934_367199_34F37DF8 
X-CRM114-Status: UNSURE (   9.62  )
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

Hi Liu,

On Sat, May 29, 2021 at 9:31 AM Liu Shixin <liushixin2@huawei.com> wrote:
>
> Add architecture specific implementation details for KFENCE and enable
> KFENCE for the riscv64 architecture. In particular, this implements the
> required interface in <asm/kfence.h>.
>
> KFENCE requires that attributes for pages from its memory pool can
> individually be set. Therefore, force the kfence pool to be mapped at
> page granularity.
>
> Testing this patch using the testcases in kfence_test.c and all passed.
>
> Signed-off-by: Liu Shixin <liushixin2@huawei.com>

Looks like you're missing the Acked-by: that Marco gave here:
https://lkml.org/lkml/2021/5/14/588

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
