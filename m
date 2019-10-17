Return-Path: <SRS0=e4j4=YK=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00AA5ECE58E
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 17 Oct 2019 15:53:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6D7221925
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 17 Oct 2019 15:53:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rpc56W6P";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="BVpF6LyR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6D7221925
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yp+0dFkvxV6nYFuSMqsbOo2v5egeEgyxowTnOLb1dww=; b=rpc56W6Pz3Zv3O
	tAGzBPjIcv8lh3U0aa1L6oqt+KwYfRDTro8KHlzK1j2Sxk5oNyxNxHHdiq894OvjSlwn5+Nib7Dc5
	c4pVh6xIw67/1NrLv+L7hqQJKmnTf1kxCegE3m+gcID3vvodsIa24hj8mkLIALpO/0qLIuWYY19SZ
	Pe0Bvx1sVhh8zXvwDNvr8y6KiJHvWqxbBdJMyNOP96eOouMrwLVRZzwY0FTZHB1kM5ZK93EQA59hb
	xcrLgvcIVItQ0urD0h6/d7o51qP2VObmyThwL8gsKbbHaqo/Cn8y20+R3LlDkRdRN4lRmLsUoBWX4
	2rFgo+zh/0i2zMpGVwEA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iL85k-0002Tn-UQ; Thu, 17 Oct 2019 15:53:32 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iL85g-0002OS-Hc
 for linux-riscv@lists.infradead.org; Thu, 17 Oct 2019 15:53:29 +0000
Received: by mail-lj1-x242.google.com with SMTP id l21so3125759lje.4
 for <linux-riscv@lists.infradead.org>; Thu, 17 Oct 2019 08:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cIzDy9DTfDNRhN7LSYB97ye4DVyGrDXll/MmImkgT6U=;
 b=BVpF6LyRGlHDFAruswmAHbv0+pLGUbDhV9wcN5xE8WS8g+zUh4x5jXcUYAsmzaIB6g
 YMEX8gjoO+3WdmFLQuP7Ko+nM3JcFnx6Odu1iLGo112V8bGqq9akNkXniU0XB2vYqP2h
 zo3E/L5G8PzgPvTprfyPmfiSP4luH/eHr1DuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cIzDy9DTfDNRhN7LSYB97ye4DVyGrDXll/MmImkgT6U=;
 b=HIE2u3hTTpQUkECsaUHzimH7hh3caoIDThPvHdzNwAQXOUYg3KKuI1cP/VRJjpAMR9
 uWF87W7zzqGgBA1fz2y11S5eKILZVrt5+1XkPWejR4bcKICSqlolX9pQKRnHSv9SJVau
 Miw0r78PIk3nWnsQWx3sbNRFGbUDinJ4rQi0F8lil6Yro9SGZxPMktVXMMxDnAJWorIW
 3PeSngjrV/9oVPS9hDTPUkQivkjz4nwFHRVtcNs09+BZ9oV9sMpWXZRTMQJBGUUjhJbR
 1gCpgH/ST0kbXVHD+MhrU+xch7KuTIT20Xtp0b9GxpHepLsJO+kKfHpe4DVcIm2a3Q4y
 CEwA==
X-Gm-Message-State: APjAAAUjlxSmhHsrtlBlh5pj1U9yVCoPnQ5ZUmINcAsaYNJ1na4cw0Yr
 RkKHKUyLuFhBYZ1pSKtFVXkporpfgjM=
X-Google-Smtp-Source: APXvYqyNKL1SxMtIAJMsrdySJUdfWAAgy0iL6DmiBTLffyn/RmC5jW2Umh1lFCCUnscIgFm40eqzmA==
X-Received: by 2002:a2e:8684:: with SMTP id l4mr3164029lji.87.1571327604896;
 Thu, 17 Oct 2019 08:53:24 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com.
 [209.85.167.49])
 by smtp.gmail.com with ESMTPSA id t8sm1141587lfc.80.2019.10.17.08.53.22
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Oct 2019 08:53:23 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id u16so2316229lfq.3
 for <linux-riscv@lists.infradead.org>; Thu, 17 Oct 2019 08:53:22 -0700 (PDT)
X-Received: by 2002:a19:5504:: with SMTP id n4mr2890741lfe.106.1571327602667; 
 Thu, 17 Oct 2019 08:53:22 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000830fe50595115344@google.com>
 <00000000000071e2fc05951229ad@google.com>
In-Reply-To: <00000000000071e2fc05951229ad@google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 17 Oct 2019 08:53:06 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjFozfjV34_qy3_Z155uz_Z7qFVfE8h=_9ceGU-SVk9hA@mail.gmail.com>
Message-ID: <CAHk-=wjFozfjV34_qy3_Z155uz_Z7qFVfE8h=_9ceGU-SVk9hA@mail.gmail.com>
Subject: Re: WARNING: refcount bug in find_key_to_update
To: syzbot <syzbot+6455648abc28dbdd1e7f@syzkaller.appspotmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191017_085328_614600_07AED754 
X-CRM114-Status: UNSURE (   9.30  )
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
Cc: aou@eecs.berkeley.edu, Palmer Dabbelt <palmer@sifive.com>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 James Morris James Morris <jmorris@namei.org>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 David Howells <dhowells@redhat.com>,
 LSM List <linux-security-module@vger.kernel.org>, keyrings@vger.kernel.org,
 linux-riscv@lists.infradead.org, "Serge E. Hallyn" <serge@hallyn.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Oct 16, 2019 at 7:42 PM syzbot
<syzbot+6455648abc28dbdd1e7f@syzkaller.appspotmail.com> wrote:
>
> syzbot has bisected this bug to 0570bc8b7c9b ("Merge tag
>  'riscv/for-v5.3-rc1' ...")

Yeah, that looks unlikely. The only non-riscv changes are from
documentation updates and moving a config variable around.

Looks like the crash is quite unlikely, and only happens in one out of
ten runs for the ones it has happened to.

The backtrace looks simple enough, though:

  RIP: 0010:refcount_inc_checked+0x2b/0x30 lib/refcount.c:156
   __key_get include/linux/key.h:281 [inline]
   find_key_to_update+0x67/0x80 security/keys/keyring.c:1127
   key_create_or_update+0x4e5/0xb20 security/keys/key.c:905
   __do_sys_add_key security/keys/keyctl.c:132 [inline]
   __se_sys_add_key security/keys/keyctl.c:72 [inline]
   __x64_sys_add_key+0x219/0x3f0 security/keys/keyctl.c:72
   do_syscall_64+0xd0/0x540 arch/x86/entry/common.c:296
   entry_SYSCALL_64_after_hwframe+0x49/0xbe

which to me implies that there's some locking bug, and somebody
released the key without holding a lock.

That code looks a bit confused to me. Releasing a key without holding
a lock looks permitted, but if that's the case then __key_get() is
complete garbage. It would need to use 'refcount_inc_not_zero()' and
failure would require failing the caller.

But I haven't followed the key locking rules, so who knows. That "put
without lock" scenario would explain the crash, though.

David?

              Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
