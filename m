Return-Path: <SRS0=o0tQ=NF=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D86CECDE46
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Oct 2018 20:37:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 533FD20834
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Oct 2018 20:37:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fuv2YZZ7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=paul-moore-com.20150623.gappssmtp.com header.i=@paul-moore-com.20150623.gappssmtp.com header.b="UQvFa6o8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 533FD20834
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=paul-moore.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ruOjWZUInRQp71DFAsuZrrrWKQC/NI3tmFDBcKp1BOk=; b=fuv2YZZ7mQdawB
	TUjmG6DA6lFLhRGUVXX8Zu1TrA/YfNsGj1BUi7vAylRLlAuDJG6nck8+bX5dkYfimGzsmv18bpxJT
	dH4Gx2RGeeKx8mv5tUse4CwW6eT1Rzgn8pvGHZRZZpAopvRojYS6miJjBu0fimfNNdebC2njPYrwD
	79ngiUie1hqpIEab/6/95syw6bfjzYMJkd9FC0M0mqyJziR22xAoZVgfdhBb9wuEiowY33pmCvXo7
	ZhIS4k/3eM6XFFGAuVJZe52qlAlD33GWLBt2RsG2xo/2xOj+QtjeqR1nIOBxbzTGeP5a4dFKOeOgB
	i9g8GmxLJWgYO1EsUrYw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gFmNQ-0008Gi-B1; Thu, 25 Oct 2018 20:37:08 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gFmNN-0008FR-52
 for linux-riscv@lists.infradead.org; Thu, 25 Oct 2018 20:37:07 +0000
Received: by mail-lf1-x141.google.com with SMTP id c16so7827196lfj.8
 for <linux-riscv@lists.infradead.org>; Thu, 25 Oct 2018 13:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qwqH7ghNRicmHmNn8jgoDXxPtuAHgcO+Zu5ALu+7dIc=;
 b=UQvFa6o8oFPjOEiJSKFKSTdILmiF+kjVao6/040Fpqp79qCxtTkkDV2CxL75qegIlH
 eP9kU1GGu9nX/Oi8oow3/iHcQdWWYuoxgqxv0PUZM26QjV9Yj7CRPftujB3VM5WaESIs
 VjA2Z4aq/QpFu9892sE3wcKMpptnvx+JftvBrJnXbC7W5/L6LdFWB/HqRasPsFhE+UW3
 hyB9CANtd22SZhR6kNShl+bel4AidQ2VK2PXfl4immH37h+apFy2lKItsKyYznIjcfJz
 QQ/0wbxYKzyJDd3N3lRJwObNpPHZeN0eLfRSrd3WJ5NRkrKcAY49QkCH5lXxlw/R247k
 TBGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qwqH7ghNRicmHmNn8jgoDXxPtuAHgcO+Zu5ALu+7dIc=;
 b=CwNxpDUzTu6WYUBJ+KEhNDFvIWR5qMrgwCB5MtDLOwaS+uqIZkES6klI1z2OF+q36z
 0A4WQimfxgFWhcsXKgP4jzJeo//zQauGfK6KVQ+eCGvQR9HJMrB9h3wj1RglzAU3SkGu
 PggqFjvkJJuwteP4Hpp8lXd2Wg8Vb8++p7rxhxxBDYfCfQyC2ams8kOpiucxhwUl+C6O
 fD8B9DWjN10J9x81+l4xAjJ0VD8faXeedHbFdsKCNTT49NXMC1BUMNjXPX3QT7xwOnyv
 S1CrNiUFbxxlzO5C56rU7IIMrfc1KXyWk61QIaxHB+pk7999eewxycV9R2g6AfvmkoPW
 PYig==
X-Gm-Message-State: AGRZ1gIyRMfemAoHagfOMZ85XPLLoeXRVTEILoLTfEl75op6q7v899nb
 y7U3YQpVNDX2egYbQK6aYnNPzNecg+7nzPmctSJI
X-Google-Smtp-Source: AJdET5f7fV+cRqfoVPAH4NhWEqidjIT/QQeQo1vp6GspyypWfF9p3/32tTdiffFsP8U8rURqmSphRQcGZHT+Ot++HAE=
X-Received: by 2002:a19:e601:: with SMTP id d1mr455742lfh.71.1540499812266;
 Thu, 25 Oct 2018 13:36:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAEn-LTqbEmWovu4t7Rs4C211+GRRU4V3B=+WmW0SOhX_b8db5Q@mail.gmail.com>
 <20181024204036.8799-1-palmer@sifive.com>
 <20181024204036.8799-3-palmer@sifive.com>
 <CAEn-LTovzRncSKCGv8wUTL6FkzcC+Hw1EBGe+Rc4GQyEgcK1uA@mail.gmail.com>
In-Reply-To: <CAEn-LTovzRncSKCGv8wUTL6FkzcC+Hw1EBGe+Rc4GQyEgcK1uA@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 25 Oct 2018 16:36:41 -0400
Message-ID:
 <CAHC9VhT015tz4qZZ=vM6FowsUXLv-RYeBrH4C8d6jvg=XHumHA@mail.gmail.com>
Subject: Re: [PATCH 2/2] RISC-V: Add support for SECCOMP
To: david.abdurachmanov@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181025_133705_211755_1F8903DF 
X-CRM114-Status: GOOD (  10.08  )
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
Cc: kstewart@linuxfoundation.org, aou@eecs.berkeley.edu, wad@chromium.org,
 keescook@chromium.org, gregkh@linuxfoundation.org, wesley@sifive.com,
 palmer@sifive.com, linux-kernel@vger.kernel.org,
 Eric Paris <eparis@redhat.com>, luto@amacapital.net, dhowells@redhat.com,
 linux-audit@redhat.com, pombredanne@nexb.com, linux-riscv@lists.infradead.org,
 tglx@linutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181025203641.0aJeU6K4tuGbdBIsZjzsT3vbLSwx08iuvBxjIvtWo90@z>

On Thu, Oct 25, 2018 at 2:31 PM David Abdurachmanov
<david.abdurachmanov@gmail.com> wrote:
> On Wed, Oct 24, 2018 at 10:40 PM Palmer Dabbelt <palmer@sifive.com> wrote:
> > From: "Wesley W. Terpstra" <wesley@sifive.com>

...

> Palmer,
>
> Half of the patch seems to touch audit parts. I started working on audit
> support this morning, and I can boot Fedora with audit traces.
>
> [root@fedora-riscv ~]# dmesg | grep audit
> [    0.312000] audit: initializing netlink subsys (disabled)
> [    0.316000] audit: type=2000 audit(0.316:1): state=initialized
> audit_enabled=0 res=1
> [    7.288000] audit: type=1130 audit(1529665913.772:2): pid=1 uid=0
> auid=4294967295 ses=4294967295 msg='unit=systemd-remount-fs
> comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=?
> terminal=? res=success'
> [    7.684000] audit: type=1130 audit(1529665914.176:3): pid=1 uid=0
> auid=4294967295 ses=4294967295 msg='unit=systemd-sysctl comm="systemd"
> exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=?
> res=success'
> [..]
>
> I am still working on audit user-space support for better testing.
>
> I suggest we first implement audit and then seccomp.

FYI, while small and far from comprehensive, we do have a test suite
we use for basic validation of the audit kernel bits which may be
helpful while you're working on the audit enablement:

* https://github.com/linux-audit/audit-testsuite

-- 
paul moore
www.paul-moore.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
