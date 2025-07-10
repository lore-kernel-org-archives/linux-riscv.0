Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F325C83F10
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jul 2025 01:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AP9c99VUc+0mw/akI7n4Bd8UljDvqHYYph9cHtRiu8c=; b=yGBn1wb0xuV0nM
	1Gs1DFqsXPdb9i47uEGOMPRal3uKbVqEqtd52S1lJTdKaSCWV4EzGnYwAoqeB04dLr5tjYrYqDsVJ
	u4nDuaaoqvM079ceyax6DbFNJm8w2/Z2T8WCWbpj/5rUVA+wxzOE8OWRsmEXlVJ+/0bXxDhUpJxrC
	MXZsbOEzeIOfxpSzc3mZu4pyNFrHOD//Uw7XHjTuHTU6apDaVCkSGaGJcFnBK80aAP4RkuutdBtzY
	YUX00nBUhl8L9Dl64+tuG6LsQa9imO5Lrs4fdM+poZD0uyzfuBV7iEO+idIQfzhnQOat93LagoyxN
	vLRqj4XX1kdIP8c/E32Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZgLP-0000000ARAj-1BzN;
	Thu, 10 Jul 2025 01:45:03 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZgLN-0000000ARA6-1cow
	for linux-riscv@lists.infradead.org;
	Thu, 10 Jul 2025 01:45:02 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-40a8013d961so158233b6e.0
        for <linux-riscv@lists.infradead.org>; Wed, 09 Jul 2025 18:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752111900; x=1752716700; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KpbUI1og+WbCg0ZLSD0ymybRvQZPRR2w3JRs6++rOrc=;
        b=QKlxpkMaE8u5uMERuvXKzXnQIwnD+YAwAw6G4siwYD5crLJpWSzNGe6jzu5PbdO5yh
         Nt3+Ev26L5vya6SStz9i0eUx+rpbBUeXsb9FwaGRY28FbJQizpYsZEEfbp+fkrESGCVJ
         SnSXlraYOWlyqINJzm2BhikyIwbjM1ZUR+wJz57hVBDbqi2fnqCWaiQSeHIu+VKD9bqD
         KQY5F5B1CTYEVhcj3qPsaD5pbY4LBI7PxSKg15Xxi0VqX14LBc1SB8jg7qsvO4offgoo
         VlNTQPQaFMT7kRd5WF2VOLctAaCD4QTyg58a7BPgTgbu3zr++27rsr/yvO4YC6+Mfb5q
         wQxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752111900; x=1752716700;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KpbUI1og+WbCg0ZLSD0ymybRvQZPRR2w3JRs6++rOrc=;
        b=BYQo4fyvmPOJWIfT/qiUBQkPVkhRt1rAlYFvofhSrjFLDluwcog6+RWs1RKsoSmv+t
         xFltdi8U6k0ieBZSHVy/UJekwRS6TcEPO0CG7QOYvPeucsaIaLhIr5RKrAf3H/S1nlWQ
         tsgz0bQak7d3NKGfCp3raoJufvS5LINLw5rAzCXrL9wUZT7Aa6Pxtq6h8VRQVi23n7FO
         KuJTAAhNzmukpLPvotC4wC2hecX8729jCHyJuUhr8FK6QyERPH8rYqlo3Lubbc6bZjJ/
         IKY43G7vH4IKbAWsCuhCfXF1Y+QCFl5dohQDLjRQMPr9FmJiGDB7r2r3gA31PrIbFIkr
         0IVg==
X-Forwarded-Encrypted: i=1; AJvYcCX3jTJ1d0f9EQhGobrDkBccgZA4zgjeLEmERfQEvQetbmKXfYmaNvq1elZn2VHFNVODjEovLEJ4My0iRg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0UBhRbY1rvvCQ9XC5vHHBg5UTIuGcdVqk2uBTwX9IcnFUVFWu
	B9onD1/XWLRBNMWHEbUPTWLJGVpXjniCxk1eoDNhFj9LrLn1ecFeMnPgkyfJW39TKPtGYNogPdS
	+G8wz7p04V3Vk1t56TVfDlqsML3KRbGw=
X-Gm-Gg: ASbGnctPzdrgUKQDcqBx1mdwxH6l9a7m+ya73JTaE+LKfeGo9FovtrVlMUJxLqZaKER
	RMtZCdaK9G+p7/ZaIcdMiNEt6gYz6h8GxefiJI1FMjCGVSrqXoA37vl5viP+FCpbs7dqbX3M4N5
	hOteR25IcU9RnnSCPGSGTxDvNWoEILA4tDnD+GqiA4yJknKhZNwf2ifmSQm9tdxoAqinETJLSZY
	7k=
X-Google-Smtp-Source: AGHT+IHZnHuOYbgM4o20piIG+wjZN6Ae24TgWByOcCOSK6jsx/DzIizD83ptEp+E7b+w0L5u6UoTRCXAexH7DkA+j3E=
X-Received: by 2002:a05:6808:319a:b0:401:ea7b:e535 with SMTP id
 5614622812f47-413adec70b2mr1594888b6e.22.1752111899833; Wed, 09 Jul 2025
 18:44:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250610101234.1100660-1-zhangchunyan@iscas.ac.cn> <8a1b1610-02b1-46a8-9a10-c19c1580c017@ghiti.fr>
In-Reply-To: <8a1b1610-02b1-46a8-9a10-c19c1580c017@ghiti.fr>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Thu, 10 Jul 2025 09:44:24 +0800
X-Gm-Features: Ac12FXy5RekAAJElSH1GjaYFg2lQc5TLrPYlv66sNpWZ556eU9tAfMub6Xg2bbU
Message-ID: <CAAfSe-s1g8h+HpYz8FmW4n7h+hhi5W0_N-jpfAD5Ldai8NjwHw@mail.gmail.com>
Subject: Re: [PATCH 0/4] Fix a segmentation fault also add raid6test for
 RISC-V support
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Chunyan Zhang <zhangchunyan@iscas.ac.cn>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Charlie Jenkins <charlie@rivosinc.com>, Song Liu <song@kernel.org>, Yu Kuai <yukuai3@huawei.com>, 
	linux-riscv@lists.infradead.org, linux-raid@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_184501_427481_FE078A33 
X-CRM114-Status: GOOD (  21.83  )
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

Hi Alex,

On Wed, 9 Jul 2025 at 23:18, Alexandre Ghiti <alex@ghiti.fr> wrote:
>
> Hi Chunyan,
>
> Patch 2 was merged via fixes, do you plan on resending a new version for
> 6.17 that takes into account Palmer's remarks?

Yes, I'm preparing the patches these days, just haven't figured out
how to set NSIZE properly for user space.

I probably should split the patchset, send out one today.

Thanks,
Chunyan

>
> Thanks,
>
> Alex
>
> On 6/10/25 12:12, Chunyan Zhang wrote:
> > The first two patches are fixes.
> > The last two are for userspace raid6test support on RISC-V.
> >
> > The issue fixed in patch 2/4 was probably the same which was spotted by
> > Charlie [1], I couldn't reproduce it at that time.
> >
> > When running raid6test in userspace on RISC-V, I saw a segmentation fault,
> > I used gdb command to print pointer p, it was an unaccessible address.
> >
> > With patch 2/4, the issue didn't appear anymore.
> >
> > [1] https://lore.kernel.org/lkml/Z5gJ35pXI2W41QDk@ghost/
> >
> > Chunyan Zhang (4):
> >    raid6: riscv: clean up unused header file inclusion
> >    raid6: riscv: Fix NULL pointer dereference issue
> >    raid6: riscv: Allow code to be compiled in userspace
> >    raid6: test: add support for RISC-V
> >
> >   lib/raid6/recov_rvv.c   |  9 +-----
> >   lib/raid6/rvv.c         | 62 +++++++++++++++++++++--------------------
> >   lib/raid6/rvv.h         | 15 ++++++++++
> >   lib/raid6/test/Makefile |  8 ++++++
> >   4 files changed, 56 insertions(+), 38 deletions(-)
> >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
