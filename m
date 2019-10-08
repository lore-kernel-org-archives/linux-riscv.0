Return-Path: <SRS0=zF8f=YB=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEAC0C47404
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  8 Oct 2019 00:14:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DB6C2133F
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  8 Oct 2019 00:14:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YrO7sz26";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="FPJb5Ts+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DB6C2133F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4t88xBIwEZT+hDBk0BfoPQ0b3knTBNGLzyy/HXsShc4=; b=YrO7sz2625b2q5
	mMuylxtWhAuuDHOqBcKzK/ZEu4IpLkvIl66+vlcSbS1pU15bZkES7H5jbGxdxqclPu6ZcDqaWkPUN
	Sj8Mz0zsj7iYNYcsA25IgN5VjHMC3fOnHwT4pFN9DPhFEYSZ6ypWMz9xxRYyceEgvUT93JWaBHJMA
	EgFygqBjr+EgvfUIH/+HGmkTQxUjC+jMdC5uquBEHnBDi9X9OkU7lQC1Sf3pKI84ajTE1Z9PJiYOM
	crL+tCyms5RhcEI1FVWa+S67EYBn3JIg61g7YUCdps8hwGeRrc0vGBXXt1mjG5pz/JO0P6hO1qE4I
	6tHLo4mfiMiPxoguVagw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iHd9S-00065S-P4; Tue, 08 Oct 2019 00:14:54 +0000
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iHd9O-000654-Nz
 for linux-riscv@lists.infradead.org; Tue, 08 Oct 2019 00:14:54 +0000
Received: by mail-qt1-x843.google.com with SMTP id n7so22150516qtb.6
 for <linux-riscv@lists.infradead.org>; Mon, 07 Oct 2019 17:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FwpM8H3Kl+cJemfHW/m+4vr117WhQgW7a+c+wjSzzUg=;
 b=FPJb5Ts+77eCWzrJlMAnTVzfuZ4L/kA/kxEkPQ2BpAeaKKjV6Kk4hiNHfgygdASBGK
 O3wZUl2Id4FC/E4896l2aGU0awsWEqXHs6U/O8g4QwhDaTnKNs3hbckbzOiByYn+XQlF
 YxkuHAwLPQL9GOWkDlabcI+wpr85ghTHUN0nzEZ1hBsay1xexD5tVwlkBJHo0ulCQc5s
 1jxFglCC65STrPI0kklzXaGml7Rt/TSh6w2/S3ecoRMPM3fCqhSemfXirvnIIDYpAXoo
 lW8PoQDB3ty9muyNUpYEMrxLf/NtsM6AYABJrwu1B9obuNLNkyB5ntSfTYyfdLFygu/r
 1O1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FwpM8H3Kl+cJemfHW/m+4vr117WhQgW7a+c+wjSzzUg=;
 b=ZSnClaPR46R8U8uUsQSypqR7GctoCxNtfTBSw5/0v+N08kyAANoUChBuv9wx6w+41C
 iwS1S9gxp1MssJEWSGGGzQiMSP1LIzNcZ1J25CDRB8S9ED8Clfq4QZUacHz84u8B+vNh
 d30gKuw+aAF82KlzsC2OXz8dAiTRhwFBEB0OshLAAeE9VXaNDg5eqlWWIMcJ78z1a+8E
 16hZtRFLn7Pz81VbyU2UDuuu18t7lAZQOGem3R8M1c8oFjkau9CA+NONflZBDhGs6MF7
 EykMd9Qu6L9EjnaK2kHPpxI0V1wXojYiibRc9lYWrsOkvPSeYe4PuNfYwQ2HpSIj6zeY
 By7Q==
X-Gm-Message-State: APjAAAV4RPKnP2T+wDffoOr4POh2jQ5luh4qUCBtWcQKb5OtFxjCsg3j
 smYfxFMUuj4/oXZfuolo2HCAnxZhrLceroU3/EeJFw==
X-Google-Smtp-Source: APXvYqwsH2zdf2taNwDiz2CNOAgmmiyiIrI+62A5GpN27uuj8bCp1QzW2t6+ikyd6gFkYj2hh7xeEcrFCZPXV5qKMbY=
X-Received: by 2002:ac8:2bca:: with SMTP id n10mr33477517qtn.242.1570493688925; 
 Mon, 07 Oct 2019 17:14:48 -0700 (PDT)
MIME-Version: 1.0
References: <1569199517-5884-1-git-send-email-vincent.chen@sifive.com>
 <1569199517-5884-5-git-send-email-vincent.chen@sifive.com>
 <20190927224711.GI4700@infradead.org>
 <alpine.DEB.2.21.9999.1910070906570.10936@viisi.sifive.com>
 <20191007161050.GA20596@infradead.org>
 <alpine.DEB.2.21.9999.1910070930270.10936@viisi.sifive.com>
In-Reply-To: <alpine.DEB.2.21.9999.1910070930270.10936@viisi.sifive.com>
From: Vincent Chen <vincent.chen@sifive.com>
Date: Tue, 8 Oct 2019 08:14:37 +0800
Message-ID: <CABvJ_xiHJSB7P5QekuLRP=LBPzXXghAfuUpPUYb=a_HbnOQ6BA@mail.gmail.com>
Subject: Re: [PATCH 4/4] riscv: remove the switch statement in do_trap_break()
To: Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191007_171450_791070_F9C18E30 
X-CRM114-Status: UNSURE (   8.18  )
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
Cc: Christoph Hellwig <hch@infradead.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Sorry,  I missed the comment. Christoph's suggestion is also good to me.
I will modify it as you suggested.
Thanks

On Tue, Oct 8, 2019 at 12:31 AM Paul Walmsley <paul.walmsley@sifive.com> wrote:
>
> On Mon, 7 Oct 2019, Christoph Hellwig wrote:
>
> > On Mon, Oct 07, 2019 at 09:08:23AM -0700, Paul Walmsley wrote:
> > >             force_sig_fault(SIGTRAP, TRAP_BRKPT,
> > >                             (void __user *)(regs->sepc));
> >
> > No nee for the extra braces, which also means it all fits onto a single
> > line.
>
> Good point, will drop the extra parens and remove the braces.
>
>
> - Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
