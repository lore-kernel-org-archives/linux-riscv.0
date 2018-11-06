Return-Path: <SRS0=W42x=NR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08F39C32789
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  6 Nov 2018 20:06:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDBB5204FD
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  6 Nov 2018 20:06:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jXkUcMUg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=paul-moore-com.20150623.gappssmtp.com header.i=@paul-moore-com.20150623.gappssmtp.com header.b="r/77uaws"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDBB5204FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=paul-moore.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w700MVv5V5swQYTgVQnRkCX+iTz6GPBfiePgb/cOpTI=; b=jXkUcMUgFGqYbG
	Yg3To6dk1+4nMeOEFz8JYAm5/aj6dcigc5hlIgx6fuRYzTbyUXG6vfuTHni8p3FIl7ozvyr727Ab6
	ikEtBt8bbEJf7mWdUuzr4rCr8r1sB2ubMrH3imeSDYtpvpe8JvRBWH+ngwwkNtWgJvZQ5TZ36s+6s
	1Uz6QwDwz5uzerQGC7jeUuXvHyQgwj4udHeHAn2neR4te5qGo+kNgUolmC+sDfuwt4R5R3Ka0bkal
	V7qjaplIrjrgMAA64Lm40vml5P/AqzliULcp2ZqOMMjUCf8ndheBRvS6oe6XMqzkci9YdiRUzydpC
	1Eo2nSmokShAv4wKIF3g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gK7cL-00084i-FW; Tue, 06 Nov 2018 20:06:29 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gK7cH-000846-Fw
 for linux-riscv@lists.infradead.org; Tue, 06 Nov 2018 20:06:27 +0000
Received: by mail-lj1-x244.google.com with SMTP id t9-v6so9447095ljh.6
 for <linux-riscv@lists.infradead.org>; Tue, 06 Nov 2018 12:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o7KNBT5u2FpdE9ddKtjUHG9Vamfl6XScoxgvK/qV5gY=;
 b=r/77uawsFZbyZTeCVUbPwrZv505elxTg42SrdWG576eXWyWEWgygXWj8fF+jFAXATB
 qvPlpEAZoJ9aeYgfrElrw7mzcJsBGFcLCIukhSnZMpcejSxyAMROAZaAgVlnUZ93JPkt
 w/OuU+lN6ufozZzv9+Wf+23i0QPwXaLBGLqjZJz3BGUIv/woCes5f2Uh4eLRMbFxuB0I
 QdU6uNeTlIFWGNkVhXeykDCCdaswbO1FJaAMJLrRtE7VF3hGiXHg6ZiweUquEUw2S7c7
 mXlKJ39i4hY7/tM1NoiVHvJO0o4ai8i7B/H22Ms1FFDW1I0QN8a5jwtfjFpXbheP0HQU
 tbxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o7KNBT5u2FpdE9ddKtjUHG9Vamfl6XScoxgvK/qV5gY=;
 b=DKy1y9MUSU1cAdoffKAwdIKwOY+GlI/Rj4Yahk3X0V6N5/ikR18OAi8GAZUvXAKIik
 NLuhfyqcggZe6VIH1yxLXV1lYF+mrBh+6vaN02lRdRvCZfDJANRyeFiN+ky28dH/ltYg
 0bYz2uUzcLGQZbBupK1ntCnVtZyk8SJ+MWINPp5VVqCPN0L+BMTGU9tNqyizrY0utp7f
 AkSQ9iDc9pKfB8+grYU9pguvpYu73FyGHuD5XyT20uFKZTy5VU0wxfKarnzGV3AUPaqx
 EGAIGOWnHaPi6edb0tbiJ2aM5Pw6FPD1bJR+5AT8xJ0+NmJM9wWHT4x5MqnvuQXRT7yV
 nBNg==
X-Gm-Message-State: AGRZ1gLh7za6UYBoxDfYPrXHu33GeAo97ekMSbYqAjNdzPfJmPqOVgfv
 pGWsbziwlqtz7RdJQfO2ERDoUBZs697+J6HF2LbE
X-Google-Smtp-Source: AJdET5dkPxfA4aC5IeVlYNHaCx9ZzDlDvaPPkxZ6LDJnTWV+2dTY88dy4CRRtzq/LQ2q+2zfFr1Ck5t5rL92DAjejBw=
X-Received: by 2002:a2e:8884:: with SMTP id
 k4-v6mr17773328lji.145.1541534772365; 
 Tue, 06 Nov 2018 12:06:12 -0800 (PST)
MIME-Version: 1.0
References: <20181029104854.17432-1-david.abdurachmanov@gmail.com>
In-Reply-To: <20181029104854.17432-1-david.abdurachmanov@gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 6 Nov 2018 15:06:01 -0500
Message-ID:
 <CAHC9VhSaGo0BmX5AsTcnppiVz2Lz8BFkjRA0jg_uuPix3Ziiog@mail.gmail.com>
Subject: Re: [PATCH 0/2] riscv: add audit support
To: david.abdurachmanov@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181106_120625_526133_E3BF467D 
X-CRM114-Status: GOOD (  13.44  )
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
Cc: linux-riscv@lists.infradead.org, palmer@sifive.com,
 linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu, linux-audit@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181106200601.5560VZbjlSnu9rNnGeq4HFZeSfLuIBgd3UrX8nXg77c@z>

On Mon, Oct 29, 2018 at 6:49 AM David Abdurachmanov
<david.abdurachmanov@gmail.com> wrote:
> This patchset adds system call audit support on riscv (riscv32 &
> riscv64).
>
> The pachset was prepared on top of v4.19 tag.
>
> audit-userspace changes were submitted. See:
> https://github.com/linux-audit/audit-userspace/pull/73
>
> Tested the following manually:
> - auditctl (checked several different example rules from internet)
> - aulast
> - aulastlog
> - ausearch
> - ausyscall
> - aureport
> - autrace (compared some syscalls to strace: order and return
>   value/input arguments seem to be correct)
> - /proc/self/loginuid (required by DNF [package manager])
>
> I looked into audit-testsuite and with some adjustments results are:
>
> Failed 4/14 test programs. 19/88 subtests failed.

I realize that the test suite failures are likely not due to your
code, but rather shortcomings in the test suite itself, but I think it
is important to resolve these problems before we commit the kernel
changes.

You mention Fedora 29/RISCV below, is that the distro you are using
for testing?  Also, are you using a stock kernel config from the
distro or your own?

> The failing tests were due to missing CONFIG_IP_NF_MANGLE ...

Assuming a general purpose like Fedora, that seems like an odd
omission.  Any chance you can rebuild your kernel with the mangle
table?

> ... 'id -Z' not printing categories (don't know why) ...

Are you seeing the MLS/MCS sensitivity level, s0, or are you not
seeing any of the MLS/MCS fields?

> ... not having loadable kernel module support enablled ...

Much like the netfilter config, any chance you can enable this in your kernel?

> ... and syscall_socketcall not being relevant for new arches.

We will probably need to make that ABI dependent in the test suite.

> audit-testsuite with adjustments:
> https://github.com/davidlt/audit-testsuite/tree/riscv64
>
> Depends on:
> [PATCH 1/2] Move EM_RISCV into elf-em.h
> http://lists.infradead.org/pipermail/linux-riscv/2018-October/001885.html
>
> This should solve DNF issues in Fedora 29/RISCV.

-- 
paul moore
www.paul-moore.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
