Return-Path: <SRS0=1yfy=AP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 102D3C433DF
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Jul 2020 06:40:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BD8B2084C
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Jul 2020 06:40:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O6ULJoQt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gdNwr1QZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BD8B2084C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3RGraVjovfHisYYqwYjQoqUu+4RoV/rKldEuBjK0TTQ=; b=O6ULJoQtoMRhbXaIYPOBYtj9S
	+Lsn0xt3/8pjOoME8WzQGd8M1AkVCcg2P7VkuhZFyunK3EzFFRGThlxQ6VbLENAkfpLj8TWbI3pGF
	foPZqB1Aebw0lRq7g7mjgUIWzBfxY3LcI59aIlN08e7GtFlguKW7sF86ctxLKvihxhNXHil+oDTIY
	q5lcx0TwT3FieOmkrGnHlmk3biD9Hvl+xK5nlpRn9udxv2y+e2VOXIDVf0E+7GS0mLoBQrNOjjHVX
	r7aRsdIwYCJNSMbzvrusOLUNRZ2yW9VJ54AD/F6XzR1EkwG/+Ippsi+o0dT43ejAeBnQmGoH8L0vy
	cU/3hmyIw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrbqR-00071b-3y; Sat, 04 Jul 2020 06:40:15 +0000
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrbqL-00070S-OD
 for linux-riscv@lists.infradead.org; Sat, 04 Jul 2020 06:40:13 +0000
Received: by mail-qk1-x744.google.com with SMTP id e13so30591456qkg.5
 for <linux-riscv@lists.infradead.org>; Fri, 03 Jul 2020 23:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3fbem6xgsUHpQEkkr1bl021QDup9/jlYvisDm0Lh+SY=;
 b=gdNwr1QZAC91+OD3FOIx7q1FSHbrZ7YbJPutNryHLdnGL2EaDZXgg1zzgnIYPTYV4q
 AAbRJOeNvsOa4+McC/gP+Vq/x1uKRcc4b5DSU2mpHbVBiKbsPQX+1napYFZ55jeaHpV1
 YQu9Gnn0oySDE+iCddiHSRxkpdnWbKC60kBf4dVFWKvEF8SQlM1PYcgYMSyuzngjVOWV
 AjtZ2fZDImi88LBn5niGQdzZK6/Ue4VjB383dhWSwHXeNIoU5Lpl42xqU9yY3Lz37g94
 kSBboDMTJn+JGwhchUz/w8fBVekEtuEUQmG9fUl4dGeQTHQBcuyuMWxybtFDwxof3X7J
 yHlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3fbem6xgsUHpQEkkr1bl021QDup9/jlYvisDm0Lh+SY=;
 b=bWUsJpAD0r0ibxAZ5BUnXUJRl1aBNi8Ib1Ivt18/cATNhtQQKpQu211NwenzETw9T/
 T8iFDsizByGVrSzKl+bUSY5F98Y7YaNVy1bes/dtaF9FIJEPD3CNhE9Gj6p0L/DaODQp
 8juFFOwMx9WY/RwGuxXpT1F88BrIRdBPzH0EXhVQzQ4UAvlFUPNQaHwkJDGqFF4ZLb9z
 LNFSJDA2bnQAqkqrZkO4FtuDIl6W2IvwgAKc2o/waSvikYfvYL1m1k8LvOy3DLYDEuLC
 8woH8rY1XSkjVDg7FBJ1gqVVrH8UnSLtBR/lOMM/sLBnZWEBH1I2Sh0stsG+2CQ+51wt
 vJvA==
X-Gm-Message-State: AOAM530EMPfeQWAz09AW/vUekhF62etl13vNjLpagCJ44JBvHOpE6po3
 Fhu8n6xUrUUWRdY6IdkHydRG6vxiyuOoscrfDkE=
X-Google-Smtp-Source: ABdhPJy7jzIt8rk0tJ5U6guhUCoxO+Lb/9yA05k7QhaWpyEYJTMhjhttaoUbaZnuIqKntrcFGwlzkq1eZ7HpYPc3mEQ=
X-Received: by 2002:a37:4289:: with SMTP id p131mr8989609qka.28.1593844806613; 
 Fri, 03 Jul 2020 23:40:06 -0700 (PDT)
MIME-Version: 1.0
References: <1593833659-26224-1-git-send-email-guoren@kernel.org>
In-Reply-To: <1593833659-26224-1-git-send-email-guoren@kernel.org>
From: Pekka Enberg <penberg@gmail.com>
Date: Sat, 4 Jul 2020 09:39:50 +0300
Message-ID: <CAOJsxLFF4o8AFWzPFJgwaeuA=Lb9VsjMXXfVmbhZBwLPcG=Asg@mail.gmail.com>
Subject: Re: [PATCH V1 0/5] riscv: Add k/uprobe supported
To: guoren@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200704_024009_847786_B4DDF7FD 
X-CRM114-Status: UNSURE (   6.92  )
X-CRM114-Notice: Please train this message.
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
Cc: me@packi.ch, Guo Ren <guoren@linux.alibaba.com>,
 Anup Patel <anup@brainfault.org>, palmerdabbelt@google.com,
 LKML <linux-kernel@vger.kernel.org>, linux-csky@vger.kernel.org,
 atish.patra@wdc.com, zong.li@sifive.com,
 Paul Walmsley <paul.walmsley@sifive.com>, greentime.hu@sifive.com,
 linux-riscv@lists.infradead.org, bjorn.topel@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Jul 4, 2020 at 6:34 AM <guoren@kernel.org> wrote:
> The patchset includes kprobe/uprobe support and some related fixups.

Nice!

On Sat, Jul 4, 2020 at 6:34 AM <guoren@kernel.org> wrote:
> There is no single step exception in riscv ISA, so utilize ebreak to
> simulate. Some pc related instructions couldn't be executed out of line
> and some system/fence instructions couldn't be a trace site at all.
> So we give out a reject list and simulate list in decode-insn.c.

Can you elaborate on what you mean by this? Why would you need a
single-step facility for kprobes? Is it for executing the instruction
that was replaced with a probe breakpoint?

Also, the "Debug Specification" [1] specifies a single-step facility
for RISC-V -- why is that not useful for implementing kprobes?

1. https://riscv.org/specifications/debug-specification/

- Pekka

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
