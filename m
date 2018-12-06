Return-Path: <SRS0=vQx5=OP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C087AC04EB8
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  6 Dec 2018 17:13:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92C3F20878
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  6 Dec 2018 17:13:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y9H8f78P";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ubVUa2h/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92C3F20878
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KouWmTrFbZrpGSzSVy0hQkPJd0XJ7JVMHNyhuuTXe2s=; b=Y9H8f78Ps5/DfQ
	rTOBBwTrnwMhx66Xu9Uu80qSP+wOQE6dtvp4n5MPAQ2IFlWbFj/R/rsSjh8vQPBtqXpf1k6xK52Cs
	EPbobwgv6e4IhMVxaFJXG9qvn/YTQH72OW2Lh/eW2nonOPALj0n8VzQr2YXixw5ZbDC+WgvvaJ4hK
	lCdwlkccGDu1erTfBx6IKEA9KK9l+Z/j3eLSdtrvRPaJy+veVHayKiJn7p989K2tDbLKrxMoWjm41
	3QmZyyi+nK52QsmIdUkmoynHFlp3yMYIFbCx9J2z/ni82kVe2IzcpuQ0U7lCAOqnA/8/ULxjKcajs
	mc8yQdLAEeSTqFyrixWg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gUxDD-0007m0-Vv; Thu, 06 Dec 2018 17:13:19 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUxDB-0007lF-Np
 for linux-riscv@lists.infradead.org; Thu, 06 Dec 2018 17:13:19 +0000
Received: by mail-ot1-x342.google.com with SMTP id w25so1064164otm.13
 for <linux-riscv@lists.infradead.org>; Thu, 06 Dec 2018 09:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u6A0R4UMIWpK2qb6dozgV9FrCdbsazP6YEg3wAf6S7E=;
 b=ubVUa2h/R0L7xrZ92dHenhp7r72ArPn0tBpuldMbN9F/ziHEh1ErameJxJEsTPNv5G
 Asw2Q9RxAsQaYqWor0LUnJqsIs3HYUEwu48MRPqkAu9owzTbXzkeh8BN4JEHOJmqhecZ
 GBcwsgmLdXd8D7wQPfAV+oBCMbYXTqn5EeFlar70b4PO9k6DVs6wRtjETHEloCUsSsr5
 yAJke7tYKiAZDrCNDFnYeFqF3NC6U0+nk8bzQXP/fw5rBVNw/JRHkGReVWIJBMLCOpFO
 xH5vOCY7oxV2OXQI0PGU/6V8xYf5q3heEpTN9L094iQdJ79gakugJDRt5DXbLxFLcW5z
 kdQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u6A0R4UMIWpK2qb6dozgV9FrCdbsazP6YEg3wAf6S7E=;
 b=Y9STNoMD2jn4dbnN8OCHvWOssbErDivOvjIfsfJQ/877FFZQXlFR3Fz5lJDt0Y5Mnu
 V7UKdAobtAYJV2AWY+xVZK2v/3DRfr0UX9DG0oIJOjzDlqDcOd043TFVnvCRBqiMsU24
 FLzJ5W38FFX5ot7wBUCWse5h0J0BDrZytYzpns2CASbDH2JukC3Y1WS2tVFNLU32SNLq
 tE15MQYgWeIa7cNd974Dy6pGHedD+7f3QK01U7mH77XybyxFc8TFvIoKcThvoICbOrpf
 wDX9AMm2KMf1DFHOx8EQs7xcjKqZmCKIfra5WgqEWY3FKYTy7cn49fGTAlGisxMHmvvo
 E3rw==
X-Gm-Message-State: AA+aEWY3XyaHRNLoZzjJGUPe0BvteB+8eFd4QFKLKdqVe6CjoKDtMNep
 Ohltqbm3D/8iaK20e0d7TI3MMPhSQnPaPnMCNKQ=
X-Google-Smtp-Source: AFSGD/U/M20i9kXNyL8YT14AYoKoro57rNRPqDpPEhabNQcMFl6HIPwPRKDVJ35DYyXl2/47O5TghyG6a3sKzZhdU7c=
X-Received: by 2002:a9d:7cd9:: with SMTP id r25mr17646182otn.110.1544116385932; 
 Thu, 06 Dec 2018 09:13:05 -0800 (PST)
MIME-Version: 1.0
References: <20181206150156.28210-1-david.abdurachmanov@gmail.com>
 <20181206150156.28210-2-david.abdurachmanov@gmail.com>
 <CAGXu5jKevZHDW8hRAAh_muFUXsg-WOVCYh3HczjY5qKtR=wYNg@mail.gmail.com>
In-Reply-To: <CAGXu5jKevZHDW8hRAAh_muFUXsg-WOVCYh3HczjY5qKtR=wYNg@mail.gmail.com>
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
Date: Thu, 6 Dec 2018 18:12:54 +0100
Message-ID: <CAEn-LTpVeULecL3JGRDjQcdZTh9yfqXsrirrxcAamYdX2jRkew@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv: add support for SECCOMP incl. filters
To: Kees Cook <keescook@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181206_091317_776862_4E63706A 
X-CRM114-Status: UNSURE (   9.78  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, Will Drewry <wad@chromium.org>,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 luto@amacapital.net, Green Hu <green.hu@gmail.com>,
 linux-riscv@lists.infradead.org, deanbo422@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Dec 6, 2018 at 6:07 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Thu, Dec 6, 2018 at 7:02 AM David Abdurachmanov
> <david.abdurachmanov@gmail.com> wrote:
> > The patch adds support for SECCOMP and SECCOMP_FILTER (BPF).
>
> I built this against linux-next but it's missing seccomp.h. Was that
> accidentally left out of the commit?
>
>
>   CC      arch/riscv/kernel/asm-offsets.s
> In file included from ./include/linux/sched.h:21:0,
>                  from arch/riscv/kernel/asm-offsets.c:18:
> ./include/linux/seccomp.h:14:10: fatal error: asm/seccomp.h: No such
> file or directory
>  #include <asm/seccomp.h>
>           ^~~~~~~~~~~~~~~
>

I forgot to add it...
Will fix it.

david

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
