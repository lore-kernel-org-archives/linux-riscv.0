Return-Path: <SRS0=VVci=OL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A60B7C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Sep 2021 12:07:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 693E160F44
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Sep 2021 12:07:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 693E160F44
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WAx5MDK0/+wJzdNDKfX3/xx4ucFG2NRmJ9W/kcdQ4HM=; b=EKs+T3pjQbj+zB
	ITo48lEjMJSaJEqdkeD2Tunpynefr8yifdmO8HBuBm5csbSSbOgzdSlvCQYoqZRvpaArqlTDvubjc
	0efrzlXZJbkiExLQCT/shGdcOKFLhsMzQYRjIlIVPDuNXZGUgQTQnrYeRM06Ny66rVM1dgJ482Vn/
	WuIsEgk8goEHv2FPqfoJAFruZ59ltdmqTUsdP1IkgDffTNF5jfSX8p83nw0UFCGG/oVVXoLkMlPIo
	L1H1pBc8xqxkv2ZirJ+IOyHmMZAz07fmBgK23pv21C7C4t5BuVsGsfewhDhuMmtPIazqt1yVQwY0X
	p7WExldIUnGcAPobLnTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSeY9-004Qkz-DV; Tue, 21 Sep 2021 12:07:01 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSeXv-004QiW-Jb; Tue, 21 Sep 2021 12:06:50 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 433B061183;
 Tue, 21 Sep 2021 12:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632226007;
 bh=qnWTodEwspkSMdWf5XON5Ep7daBqF5kbGbudj8UJ3BM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=lZuaHIP85m6Su6bcpsGY8R/fa+uz+o+SuX5yhWFd19IzrL2i778A5t5mmHSVLMUhI
 j4yfEn56wqx5qFOsqhhUxhjY0IkUxWl+MwuW1xvBcEvcPsHXGCnv697Ehs8z5wkg3s
 BxP/866bOfHMAzUepQfjwl4QVqvIrzZbeODvKN6XdoM59irl4EAVGggH7eVbSfH6M9
 jE/6RlDfr/Mm+d16gu0RJ8coKjo7MUkV+NIaYksqq6764y699JSAszeLHTUJUinRIY
 ZdOxOKK3R3sW6pJVKUoigKlxevo/AysjtiFDrLSRamtleJnxy7wmJpNAVpcYfx2oIP
 N65I9s8siNGUQ==
Received: by mail-oi1-f181.google.com with SMTP id t189so16830737oie.7;
 Tue, 21 Sep 2021 05:06:47 -0700 (PDT)
X-Gm-Message-State: AOAM5339+JaUifb+8TdN2Mc9IlofiODUfZRm/0Q8S+blEBkAcTsKXB2d
 2DGVUgJXaQ9I0gyRRjHefBfmbhfYLji2+3zSwp4=
X-Google-Smtp-Source: ABdhPJx1x7wQ2+Ve4iSZCDQmmYVEepXxo/5KRhWVQj/N//ixUTMX6irYoXDtuXoK84SNkd7MjELWyQDwt9BfbsPbMro=
X-Received: by 2002:a05:6808:1148:: with SMTP id
 u8mr1242229oiu.33.1632225995730; 
 Tue, 21 Sep 2021 05:06:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210914121036.3975026-1-ardb@kernel.org>
 <20210914135527.GC30247@C02TD0UTHF1T.local>
In-Reply-To: <20210914135527.GC30247@C02TD0UTHF1T.local>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 21 Sep 2021 14:06:24 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGPcHwdSjy-doB09LBLvrXtqYT4dyxE5hU=D=2m8Fg8zg@mail.gmail.com>
Message-ID: <CAMj1kXGPcHwdSjy-doB09LBLvrXtqYT4dyxE5hU=D=2m8Fg8zg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/8] Move task_struct::cpu back into thread_info
To: Mark Rutland <mark.rutland@arm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Heiko Carstens <hca@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Borislav Petkov <bp@alien8.de>, 
 Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Keith Packard <keithpac@amazon.com>, 
 Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Kees Cook <keescook@chromium.org>, Andy Lutomirski <luto@kernel.org>, 
 Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)"
 <linuxppc-dev@lists.ozlabs.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "open list:S390" <linux-s390@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210921_050647_724251_F75A6A11 
X-CRM114-Status: GOOD (  19.43  )
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

On Tue, 14 Sept 2021 at 15:55, Mark Rutland <mark.rutland@arm.com> wrote:
>
> On Tue, Sep 14, 2021 at 02:10:28PM +0200, Ard Biesheuvel wrote:
> > Commit c65eacbe290b ("sched/core: Allow putting thread_info into
> > task_struct") mentions that, along with moving thread_info into
> > task_struct, the cpu field is moved out of the former into the latter,
> > but does not explain why.
>
> From what I recall of talking to Andy around that time, when converting
> arm64 over, the theory was that over time we'd move more and more out of
> thread_info and into task_struct or thread_struct, until task_struct
> supplanted thread_info entirely, and that all became generic.
>
> I think the key gain there was making things more *generic*, and there
> are other ways we could do that in future without moving more into
> task_struct (e.g. with a geenric thread_info and arch_thread_info inside
> that).
>
> With that in mind, and given the diffstat, I think this is worthwhile.
>
> FWIW, for the series:
>
> Acked-by: Mark Rutland <mark.rutland@arm.com>
>

Thanks.

Any comments on this from the various arch maintainers? Especially
power, as Christophe seems happy with this but there are 3 different
patches affecting power that need a maintainer ack.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
