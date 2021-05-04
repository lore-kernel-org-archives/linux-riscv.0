Return-Path: <SRS0=FKry=J7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CD03C433B4
	for <linux-riscv@archiver.kernel.org>; Tue,  4 May 2021 08:39:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80A8661004
	for <linux-riscv@archiver.kernel.org>; Tue,  4 May 2021 08:39:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80A8661004
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=phqbm4T2stgdUX6FD7NgnKwXYv+ye8NWlIwiKt29lDs=; b=Wu1B/fbYZmzV0w8A7KGUZrINg
	Iu5975hnEKqFUZignvJDeB9N0vYnFEJ36GZGjyUQiq4efoWhHhdblKFW7n11p9Rd4juzd/vj0Mbfh
	5Qt+YtVCOY/dPM0zpoK5z3yAiUV53kmhNA3t/LVPdPcD+3JXaKYQB3Q2kFLcbubHaURpUQYxQ32RI
	q73FOH2RlM1vq9STCTgypRNrsuPybe9cQkzhL+rVCEpzCqCMYPDjKuv9E8FyXuh54NLb6xwAMy8ep
	ZA3NoVK7LNI8U1o4XUKXC/4T31BYUzkVrg8ff24wRIamhrPSbIT3eofky0kbroJRzyIQLFV/6dfjg
	SCH/SFJZg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldqaF-00Flk3-5W; Tue, 04 May 2021 08:39:11 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldqZr-00Flcf-JF; Tue, 04 May 2021 08:38:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Y8qb2bfAFrI9QM8sR79PgwC4m456KUQvtxQw7QErVO0=; b=CsAdR+V5rElch2byMrcDryzOJC
 +sPDdGGG79/QI2VuLoRkpCcu0l3+PW1IziQr9RRgCPHuElzOlNQ1NQsyQeKPJ0nH1pkcaXD103BC2
 KCDzDVKTHR6D7ds8YIzZdI/o43DarvR2a+PrC8SvoRoCk/0qI3dfuQd4tRg+tMH3MKUXDmS0jjeBd
 7Yulg+lSDf4+ftrHpdeRr5C35cAjwrhczWdUOi6bgME4mtcqcWyjDTatyVVVSxoSRSJivmx4Y38ym
 eGPMOsgRfJn7l8O60FB5QSGrOg83QkZd++zAVJHmIldmqjwsKgf3KlLRbo9wz5TuJqnOo6UT8JtOT
 ttGP8F8Q==;
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldqZo-003ozt-Tb; Tue, 04 May 2021 08:38:46 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id e190so1576433ybb.10;
 Tue, 04 May 2021 01:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y8qb2bfAFrI9QM8sR79PgwC4m456KUQvtxQw7QErVO0=;
 b=heYaieXDiOzidFq+kRcjvjjBmYI/4xzMD4IZ1Yw76TNQUNkDgLOIYrp8Bys7niIi+O
 jvSzvlHAX5/hbPR7mdg8Mr3KtVFEXJixdX0zDUsRdWPm2M6sI96KtXYPzM4z98Sk6HbK
 IclA9mcqDUz7trpk3h4rJfxcBfa44/1jzoziaYOQVlXYek/pEzc7jPCbtcmkJIT+9VUH
 WT0HpfKiSiMrkqlHze4lvrBlnkSpkcOokMm27Bo95W5SsjuKtg5kMxCDmKeB7yAkY8kq
 yjjrUt79LeHM1TFBZ+4oGyOBeB8Esqx0U2hDdis4OHVxSJOXEo006EcEEdIvOFlYc3Lc
 5pTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y8qb2bfAFrI9QM8sR79PgwC4m456KUQvtxQw7QErVO0=;
 b=ffz9JDfDQQwEdz6amMPh5MM68+hserQxSkye+K2jbdcDX5xDgBrPIe1BxNW2Qa4yo5
 99Y6AiQXC1fNe5iccSt2LuaKmTqlv6aArAMUlQb/6dvGsfnC3JdTCh9dSPLWoAcF60G3
 SvCjKG5kr1QhqR6RXIU45qwvVBBaHwNCr6TNePYKotvMEfgZsLYot8oNfJQULp7gxMd5
 nhP+66fSHuHXxOe+DbYdx+jXhIxQPbv9AEqWf2H0IcR/YcutG/ZzB8k1UWR59Q3xoR6o
 sarHwwf9lvh7DVezKQZSNhJUp5LpRhIA7jK2XfmGmT6z8WW8K8/9FsTol8dqT+z8v+en
 hrmA==
X-Gm-Message-State: AOAM531KahfKph9zRaGgtR/ekbL986W66n7eo/mz8Eg7wExJlOBk/77r
 w70alRQ66t98cTkPq06EXeF4i8SsUDlgK8Ljy0I=
X-Google-Smtp-Source: ABdhPJwgJRTy4oD3Q4bEwMIiI0PESgNj4LF3XmVCbNwY/lWmcIYnmds0Q6QwiZMB0/f4EUTpPAx1ux8l25XkeS6oEUM=
X-Received: by 2002:a25:880f:: with SMTP id c15mr31896545ybl.247.1620117523381; 
 Tue, 04 May 2021 01:38:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210501151538.145449-1-masahiroy@kernel.org>
 <CANiq72k1hB3X6+Nc_iu=f=BoB-F9JW2j_B4ZMcv8_UpW5QQ2Og@mail.gmail.com>
 <3943bc020f6227c8801907317fc113aa13ad4bad.camel@perches.com>
 <65cda2bb-1b02-6ebc-0ea2-c48927524aa0@codethink.co.uk>
In-Reply-To: <65cda2bb-1b02-6ebc-0ea2-c48927524aa0@codethink.co.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 4 May 2021 10:38:32 +0200
Message-ID: <CANiq72mk84uay--BWOLT4zF12-rat9erohKazB8SpTPoVCTX1A@mail.gmail.com>
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: Joe Perches <joe@perches.com>, Masahiro Yamada <masahiroy@kernel.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Linus Torvalds <torvalds@linux-foundation.org>, 
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Will Deacon <will@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Albert Ou <aou@eecs.berkeley.edu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 Jonathan Corbet <corbet@lwn.net>, Michael Ellerman <mpe@ellerman.id.au>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210504_013844_973672_E68443DA 
X-CRM114-Status: GOOD (  12.49  )
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

On Tue, May 4, 2021 at 9:57 AM Ben Dooks <ben.dooks@codethink.co.uk> wrote:
>
> Some of us are a bit stuck as either customer refuses to upgrade
> their build infrastructure or has paid for some old but safety
> blessed version of gcc. These often lag years behind the recent
> gcc releases :(

In those scenarios, why do you need to build mainline? Aren't your
customers using longterm or frozen kernels? If they are paying for
certified GCC images, aren't they already paying for supported kernel
images from some vendor too?

I understand where you are coming from -- I have also dealt with
projects/machines running ancient, unsupported software/toolchains for
various reasons; but nobody expected upstream (and in particular the
mainline kernel source) to support them. In the cases I experienced,
those use cases require not touching anything at all, and when the
time came of doing so, everything would be updated at once,
re-certified/validated as needed and frozen again.

Cheers,
Miguel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
