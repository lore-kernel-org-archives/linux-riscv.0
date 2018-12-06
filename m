Return-Path: <SRS0=vQx5=OP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 488B0C04EB8
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  6 Dec 2018 17:12:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17CA720878
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  6 Dec 2018 17:12:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OwxHKh5W";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zu40SnPv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17CA720878
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WNUKY9BKl9vmstPbhOk39NIZ9ejIEQrzhVz5WFLhVHI=; b=OwxHKh5W0/SfNZ
	ZWhMfFu5CwVVqJyFE/DvK+L/5u3XOG2cz7RJ24PFV9C/se5nspnGCAJ068T6CDwnQbkVkRnh5/N6l
	1N4C4LwYSN97riPAEYKBlMhdNBQw2RJSnoqMmhPZ6d7DVeZ6X2/Y7s4sH6hSfiw9XZ3w1K3KgFcbu
	aCeV53vvnQpDpMXEHuPP6Z/EHFehkJ/KZ4E39UgsM4ZS6vZjHEqIfV0i1JT3zdAIpHahE8/syGzui
	kUINpIv9Fgt/v9aCVUe1uVLJ3foQMHAOWfRDpm21UEXusQxiZ5uE5G1dfzJQcuaPcncTW6EKND6m0
	bzrfwSxJM9kIfmVRIXnA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gUxBx-0007h6-B9; Thu, 06 Dec 2018 17:12:01 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUxBv-0007gO-3L
 for linux-riscv@lists.infradead.org; Thu, 06 Dec 2018 17:12:00 +0000
Received: by mail-oi1-x241.google.com with SMTP id h25so1029219oig.1
 for <linux-riscv@lists.infradead.org>; Thu, 06 Dec 2018 09:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yePnYrJcSAK4+esNkdVus29dgqVz98C+LdFXdrYcJ2I=;
 b=Zu40SnPvPAgYkNLRi6XWyUPDjcC2xLzjl532BmUBc9IPPWh9JASbbEDwMFGCrfgma3
 810WW6DI6HL/jKX+5L7e3K1wAk4+2rJG+9p10U1NzYuAV6qDCv0wgck1Zf8EdieGf0pN
 scIqOZ2orJhVnv3KHGCKK4kUMg9gol2dNO2oh4uzaK9QYlzB1VyZTQoLSYUeywrN2C9R
 MHodWTUaT851288P7JAdz4A+kM+cuqmvBvz4W1+M+rS+zNRtqrUL1E9WEm0s5PY3BCnK
 KKwXNXhrBIC1mzMSG+KO1jgu8bVu2xdRchbxlKyX8i/rlGjh63payS1JsCyU7g2JP7OT
 46fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yePnYrJcSAK4+esNkdVus29dgqVz98C+LdFXdrYcJ2I=;
 b=iZO5XK58rcngs7H6/IIfwTAZprNQxqBk10EvqGVriROrSRlkRE/3+kzZ5AQ3CjzRnw
 fc4w7qLPBZ+LZ/wP5TUZgu0d3R8sMxiTFYotjmkFd6RXPzlUBHggLwVwTo3MxdbiYQYH
 8iiYLtcHNI1TBloaKt3u41hbh85xQtiPhXZ9IKSlpOGySMWPy9yMX4z1BNq3m9DrwdEj
 JmXQrCPufE+iiKT8NhHO9kVBZZIcunpv//YxRIf4JyStWeBjf2nmTEe2+YrYRSi2hnQz
 5sEKC4ui/MFfgC+vgjgHKkmfNp+u9fHoYkqd+5F1KpUoqietN/T31nskP3RWan8+gThL
 zHYA==
X-Gm-Message-State: AA+aEWZVmfXCdsT8+vy7GVE1ZMRqagwU4fKVlcwu7CRSlF+7T7SE8tur
 GEq+ycsvjvMpNv54SbihLN4br2aASJI/EVmlOEQ=
X-Google-Smtp-Source: AFSGD/WYfZRds1halERBVJ7cdKbIJFnsj94Pm0hDVnUt4nrBih1ZGVKtRm8PsZUBgOIKES58273YDq5UuAxkVqPJJNY=
X-Received: by 2002:aca:e3d3:: with SMTP id a202mr17025964oih.79.1544116308027; 
 Thu, 06 Dec 2018 09:11:48 -0800 (PST)
MIME-Version: 1.0
References: <20181206150156.28210-1-david.abdurachmanov@gmail.com>
 <20181206150156.28210-2-david.abdurachmanov@gmail.com>
 <CAGXu5jKfnE_RJL7aA5x-qqYdA9zoTTtKwahg0r5fyW5GqFLgdA@mail.gmail.com>
In-Reply-To: <CAGXu5jKfnE_RJL7aA5x-qqYdA9zoTTtKwahg0r5fyW5GqFLgdA@mail.gmail.com>
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
Date: Thu, 6 Dec 2018 18:11:36 +0100
Message-ID: <CAEn-LTr5tUHCQfCaoJn1KBz1Yqs03MMO_n=Em-X87LK3b-AkOQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv: add support for SECCOMP incl. filters
To: Kees Cook <keescook@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181206_091159_146353_ECEF4115 
X-CRM114-Status: GOOD (  11.11  )
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

On Thu, Dec 6, 2018 at 5:52 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Thu, Dec 6, 2018 at 7:02 AM David Abdurachmanov
> <david.abdurachmanov@gmail.com> wrote:
> > The patch adds support for SECCOMP and SECCOMP_FILTER (BPF).
>
> Can you add support to tools/testing/selftests/seccomp/seccomp_bpf.c
> as well? That selftest finds a lot of weird corner-cases...
>
> > diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
> > index 1c9cc8389928..1fd6e4130cab 100644
> > --- a/arch/riscv/include/asm/thread_info.h
> > +++ b/arch/riscv/include/asm/thread_info.h
> > @@ -81,6 +81,7 @@ struct thread_info {
> >  #define TIF_MEMDIE             5       /* is terminating due to OOM killer */
> >  #define TIF_SYSCALL_TRACEPOINT  6       /* syscall tracepoint instrumentation */
> >  #define TIF_SYSCALL_AUDIT      7       /* syscall auditing */
> > +#define TIF_SECCOMP                    8       /* syscall secure computing */
>
> Nit: extra tab needs to be removed.

Will fix it.
I need to cleanup my vim configuration for tab with.

david

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
