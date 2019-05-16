Return-Path: <SRS0=H4VQ=TQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA0BBC04AAF
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 16 May 2019 20:59:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA3922070D
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 16 May 2019 20:59:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VPV7KmD5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="YZ8c/cm5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA3922070D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U0ey+TulvfA2TB3c3YpiYiHWHGIaZFIhGtfVB4bV22s=; b=VPV7KmD5s69RyH
	StjFAUWYmyVZ40uZGOiCzID1pCTKxlqFTRoO+U/mqdp3cSoINrl7kHYol4LRcfZcLXbn7T2gzisWy
	n8v273P2sH4ABINkk0MlWx5H7vNG9CBn49hoqe7dP/Fbx237t8IAPsRCBs+9j7JbN1UqiAYR49gG/
	o7CR5NAIaJh8fHx7JKlHVVnSm9duFJ3wjPM8mb9vHk6Q2ZB5SUHHbxDuuG7hgvcff9t8jrYg6F5DK
	NpgVsDTmcRpbolmYPDn4r//9OShj+W6VwKE1KrPawZQc04cWVyA7+T6NGko4LnJqNwscjj4WeaHCG
	FTBbz0Rwgvk8xs66pjBg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hRNTe-0004jI-IU; Thu, 16 May 2019 20:59:46 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hRNTc-0004ib-5b
 for linux-riscv@lists.infradead.org; Thu, 16 May 2019 20:59:45 +0000
Received: by mail-lf1-x144.google.com with SMTP id h13so3708917lfc.7
 for <linux-riscv@lists.infradead.org>; Thu, 16 May 2019 13:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6oAPPlUpIkCtQ/levc8RsxEk+htcahssCA/GznIL0Us=;
 b=YZ8c/cm5aMA7k3clC9oPBSrTRPSLiXxoGN+/rRTEEZuA1eKzCtY+bAPltIYlKN4zli
 WJVE0BF2AxNUuBeHaqBEKA6z6gR46laXsGrUbQXk6EdimWFAv+u89zWsDjZL7k1NccgW
 DlnxbLwfAWIL+QPoKXeDP9PbQ4U0PizyusWaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6oAPPlUpIkCtQ/levc8RsxEk+htcahssCA/GznIL0Us=;
 b=cbySHzuJZ1ZD+CwAS6roNpdI7tFOxT7yOCfwwE9a0iwNkIIViY0pOpDnju9baucxpX
 YlPN7n3U8mgb3z4FjW1O9KFZBZobA+3Cf5qGlH37GdAjCUn++dgp0ZoDiJx6mglHEzzN
 OIMP8kbjJFNCSbfuyqJ5xtLsfLOKG36oROGxCij8niAcIj2zCOiPay/1tLsGtj2aBeIC
 iLncNJZt8Nb1+h7/6PA6HXU/Kqd04eNvOwLTuitzoHmem0818Wapif0Z3qFVW18Mlaow
 4R7GMpZlgwFRL1YFKi6FgAIsjpWq4k4qq4Pdq7YPY3L8GSbKQx03i5D+O8+POCDtLqGy
 K/VQ==
X-Gm-Message-State: APjAAAXS/IPY3G2q4BRvRioBQZsOjej/kH6uxDCG/kBe3IjBo/eo3CzD
 30rIDYkUF0/XAwdJDw7TESL+SojsSf4=
X-Google-Smtp-Source: APXvYqxwCzHnoi0Idc0Ow10D1V2nwcfXZx5WTsQWbdBgqPAeCdiPtmNVMAaC7Qmkmvr2UlsBK7L/UA==
X-Received: by 2002:ac2:528f:: with SMTP id q15mr7554980lfm.37.1558040378690; 
 Thu, 16 May 2019 13:59:38 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com.
 [209.85.167.45])
 by smtp.gmail.com with ESMTPSA id c10sm1149064lfh.79.2019.05.16.13.59.38
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 16 May 2019 13:59:38 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id n134so3680670lfn.11
 for <linux-riscv@lists.infradead.org>; Thu, 16 May 2019 13:59:38 -0700 (PDT)
X-Received: by 2002:ac2:510b:: with SMTP id q11mr23412586lfb.11.1558040376948; 
 Thu, 16 May 2019 13:59:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a2+RHAReOZdo8nEvqDeC1EPj83L2Ug4JuVRiUh943AuNw@mail.gmail.com>
 <CAHk-=wgiv5ftb+dq7N8cN4n2YX3VkyzeQccywn07Xu9xhOLTSw@mail.gmail.com>
 <CAK8P3a2EEuxh3uhsqauEC_vROZ7tQHhFwxgiLUnrgtpMdb3kuA@mail.gmail.com>
In-Reply-To: <CAK8P3a2EEuxh3uhsqauEC_vROZ7tQHhFwxgiLUnrgtpMdb3kuA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 16 May 2019 13:59:21 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiH=vGjsW9MdWFGsgto2W+71sA4XJ7CSubpXkbpC_bGKA@mail.gmail.com>
Message-ID: <CAHk-=wiH=vGjsW9MdWFGsgto2W+71sA4XJ7CSubpXkbpC_bGKA@mail.gmail.com>
Subject: Re: [GIT PULL] asm-generic: kill <asm/segment.h> and improve nommu
 generic uaccess helpers
To: Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190516_135944_212699_3E215479 
X-CRM114-Status: UNSURE (   8.70  )
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
Cc: linux-arch <linux-arch@vger.kernel.org>, linux-riscv@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, May 16, 2019 at 1:34 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
>
> I have reconfigured it locally now and pushed an identical tag with a
> new signature. Can you see if that gives you the same warning if you
> try to pull that?

No, same issue:

   [torvalds@i7 linux]$ git fetch
git://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic
tags/asm-generic-nommu
   From ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic
    * tag                         asm-generic-nommu -> FETCH_HEAD
   [torvalds@i7 linux]$ git verify-tag FETCH_HEAD
   gpg: Signature made Thu 16 May 2019 01:28:54 PM PDT
   gpg:                using RSA key 60AB47FFC9095227
   gpg: bad data signature from key 60AB47FFC9095227: Wrong key usage
(0x00, 0x4)
   gpg: Can't check signature: Wrong key usage

That's the same key you used previously.

I think you have to do some gpg edit-key magic or something, and then
the key need to be refreshed.

But I really despise the usability of gpg, so what do I know?

              Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
