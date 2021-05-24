Return-Path: <SRS0=jEvo=KT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48E3EC2B9F7
	for <linux-riscv@archiver.kernel.org>; Mon, 24 May 2021 23:16:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09AB761414
	for <linux-riscv@archiver.kernel.org>; Mon, 24 May 2021 23:16:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09AB761414
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NtIdRVMhCYGrlSZpWAcTCVCUCYClMUmVkhzlrKvR4YU=; b=Bdve8nHT4y8Rta
	qsepXdYyfMUAp0YhRIr4vVh37EjEQ4/D1mMyuiuJBDfHKJJ5zkwZ4+oqi05peJ07NL0OdbvedoQgp
	sEceUUDisv5WoaSPstHkDDpuczJWx/i1TBIkBMIlCHz+mBRpcCM0sBGQ02IPrWqqsPJEPSQX8Aj4f
	JK56JySRZtnfsdgKWPveUUuLcGyyo6nApDZdi2iopni3beGkGJCseCgWczLFWGPiPs34qdNoewBlm
	ifrg1JcCEaLk/gosmNxz+6PGIKA/sM0BzfrMBo9IDiI+eEXzBVUgD5ulqiarR762gvediZPQxAoon
	KvIvzuZWPnRys0+Uv5eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llJnx-002J0P-9m; Mon, 24 May 2021 23:16:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ll5rb-000lh1-7P
 for linux-riscv@lists.infradead.org; Mon, 24 May 2021 08:23:04 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BDB88611EE
 for <linux-riscv@lists.infradead.org>; Mon, 24 May 2021 08:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621844582;
 bh=+TDQoVOokc8WBAFuv0fWAuKnZ09Bvva98Z+VkeSiyYI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=V7BHr2cHba8OquErjEX+iEHS40AtGDmaVhe5QzR9Csdt4vq7ORsDL78UFibSuLxk/
 8vEePM0DgKoR0c8ymNZ16ZtQHrnAbKGMYgi6jLqivEGbLUXOPcpup3aQf21ixsPYuR
 3Jy2uUBrj47v2RTPFhuuaKLOphOCOGFlnt9rc/bJVo5S35GOmMZxy3eJ9PL/Ez7972
 9HJ+ks6cJRZQ1u3k7GEOKKRX6ee9BGoy2ruJCIWZdP2TgAeNLSRy2HLPA98BZFDOl7
 NAHUuEoWM/DAfVqIlYp1FWYlAyUvA71alreGu1DM66bKGrZ4IUqJJyDPb7NbXxqCoX
 Jxec/u3jfcm9Q==
Received: by mail-lj1-f170.google.com with SMTP id w15so32444607ljo.10
 for <linux-riscv@lists.infradead.org>; Mon, 24 May 2021 01:23:02 -0700 (PDT)
X-Gm-Message-State: AOAM530W0AD3Y9l3cIw8CBEf8XaOdShvjjlFU2aOdNin8BrmEjDs+Eop
 yhf73E9X7sZX0UYQuxEVaqh7L9EESTpMMlQOjEA=
X-Google-Smtp-Source: ABdhPJy3T3I9cqfLxcQ7H+a6WA92Atu9K4L0xECjGYqHAmb3IFmhkBTnK9bvoOswUChqlODJlN6h0jYJZUhV36hqF2Q=
X-Received: by 2002:a2e:b557:: with SMTP id a23mr16493146ljn.238.1621844581046; 
 Mon, 24 May 2021 01:23:01 -0700 (PDT)
MIME-Version: 1.0
References: <1621839068-31738-1-git-send-email-guoren@kernel.org>
 <CAAhSdy3ORUGqyL-9oMQCKYCXnG8M=xrZ8q+AiWg8s+v6zsk=_A@mail.gmail.com>
In-Reply-To: <CAAhSdy3ORUGqyL-9oMQCKYCXnG8M=xrZ8q+AiWg8s+v6zsk=_A@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 24 May 2021 16:22:49 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQOimKQR8nL3SKgC6OP8OcsagFCADfehg4TEt96D9xVpQ@mail.gmail.com>
Message-ID: <CAJF2gTQOimKQR8nL3SKgC6OP8OcsagFCADfehg4TEt96D9xVpQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] riscv: Fixup _PAGE_GLOBAL in _PAGE_KERNEL
To: Anup Patel <anup@brainfault.org>
Cc: Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210524_012303_329227_B53914FA 
X-CRM114-Status: GOOD (  19.49  )
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

Hi Anup,

On Mon, May 24, 2021 at 4:03 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Mon, May 24, 2021 at 12:22 PM <guoren@kernel.org> wrote:
> >
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > Kernel virtual address translation should avoid care asid or it'll
> > cause more TLB-miss and TLB-refill. Because the current asid in satp
> > belongs to the current process, but the target kernel va TLB entry's
> > asid still belongs to the previous process.
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Cc: Anup Patel <anup.patel@wdc.com>
> > Cc: Palmer Dabbelt <palmerdabbelt@google.com>
>
> First of all thanks for doing this series, I had similar changes in mind
> as follow-up to the ASID allocator.
>
> I went through all three patches and at least I don't see any
> obvious issue but I think we should try testing it more on a few
> existing platforms.
We've tested it on Allwinner D1 C906 and C910 SMP*4 for a long time,
just hope it won't affect u540.

(In fact, C910 has used ASID allocator for more than two years with
our own kernel-tree. I remember we've talked about it in 2019
plumber.)

>
> Reviewed-by: Anup Patel <anup@brainfault.org>
>
> Regards,
> Anup
>
> > ---
> >  arch/riscv/include/asm/pgtable.h | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> > index 78f2323..017da15 100644
> > --- a/arch/riscv/include/asm/pgtable.h
> > +++ b/arch/riscv/include/asm/pgtable.h
> > @@ -135,6 +135,7 @@
> >                                 | _PAGE_PRESENT \
> >                                 | _PAGE_ACCESSED \
> >                                 | _PAGE_DIRTY \
> > +                               | _PAGE_GLOBAL \
> >                                 | _PAGE_CACHE)
> >
> >  #define PAGE_KERNEL            __pgprot(_PAGE_KERNEL)
> > --
> > 2.7.4
> >



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
