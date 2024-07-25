Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2763C3DA5D
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jul 2024 20:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E1gvtzkdM6DeRoLpRcZqHagDDD1ngbWZ2UUqI0UJkYM=; b=N3vU/5y8ht34tj
	NeOr4P9pD5S1QTCZRASk+p0g/w1kt1PxUKXGrhB9X/rVoY4yGOae6zb3sxbmKUqh6kosIdqAsK38T
	7Qdmr1Reop7X01P8er9LKCbsxppXwP1cIvWm6zCuPMw/PZBBX8LCXgtn2uAy3b4Nwde4SgRirPyJo
	D9O0JG/8Vx9Z/g/OavSSKdzp1Kv0MQY0N9PysWPzZuQIyI2PpTfTHP/C0EFZXOlSWmGlInOTMHlrD
	J38d12kMIlWaFSDqqYdvfTlZzyOHvuyMJEHN9QlJCXizAOobOByPqedDy7tCpwxsGDAZ04u1bC46A
	Cedw8SdJ0IHObkZRBhmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sX4vV-000000021BX-3FAY;
	Thu, 25 Jul 2024 20:19:01 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sX4vT-000000021Az-2iru
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jul 2024 20:19:00 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a7aa4bf4d1eso115813866b.0
        for <linux-riscv@lists.infradead.org>; Thu, 25 Jul 2024 13:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1721938737; x=1722543537; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HYXza095pMOoHpnczk24pBNsoS9nyihsTN3J/3umgZw=;
        b=XLGpYa6h5XKeCfsBRXyfoSHzSpc90escaC414BjpjOYnpoongWpOL+MVYB6MC1qEQd
         S95ddTdrsfeRg26XTLl72UKWIEWFf+rXJ4YMxh8Hg8OV2TE9ypSPQ6NKiBFjcOTIpHSL
         aSU2sxpPrRm42Nelq6h+t2ZH8OqbrfnLiLm5M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721938737; x=1722543537;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HYXza095pMOoHpnczk24pBNsoS9nyihsTN3J/3umgZw=;
        b=HWJHwgiF/ACnoFm8RSGPe2CiT7iY7hhxg8pq5qOIrTm+h94aVw0186J5z+ASJJSgJk
         nDcrmY/9nLncjwUP2mx6U6bMwyxperbEdBrEhOAU1Q8iVnBVH2ycJ/E9obn8EaQEG3ey
         hRY49YBJFXMUsB2PE2UqNaJtDSMFThBloyxqihHEcYLyY6vQikbzTINfIPTir3e1XfT9
         4BwJyM9VIBtXEHKlkOzQpBK5Z4qX0yDM1iSOvIWzpmGGVrOJwoZR18Ys6929D07zbF5Q
         buMjm0bZuILlzYurA5gcLPcmQuKbAaewI16vR2GCIwVCeWCJxZ8QGw3MZLSgLlhHNMQq
         i9sQ==
X-Forwarded-Encrypted: i=1; AJvYcCVF9GIEod1ffxHaCqPPfV0yUP79HC3iPa5jUOFqTZiBSYWwBryTbytGzZ9E9oPdDqyJs/Cm8wxVbdhnCEjAnzRMU7QcoggN2FB7xoYmC+96
X-Gm-Message-State: AOJu0YybJZeewS1KdO0YyVfU6B6ojQlDRPbDFCXimVRxdjMmPW/5kFzR
	Twdo3frdrn0NC9S8lh8UHhuAQAeiNs49Jn7Gy2iea1FP/gGDKjOvtgLJL6DSc9E5Ez5qQUBGBl9
	J0h0=
X-Google-Smtp-Source: AGHT+IE3xCt1BYHWn9OWFIzh3ycQItTxUXGxCtQrPq3zBKMG9gmsz+GgTYHVNTWOCGpw1ysWIaaApg==
X-Received: by 2002:a17:907:7d92:b0:a7a:a0c2:8be9 with SMTP id a640c23a62f3a-a7acb3eecbcmr283408366b.18.1721938737004;
        Thu, 25 Jul 2024 13:18:57 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acad902e2sm105622966b.146.2024.07.25.13.18.56
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jul 2024 13:18:56 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a7aac70e30dso114729466b.1
        for <linux-riscv@lists.infradead.org>; Thu, 25 Jul 2024 13:18:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXkpLKYxx4hYJPbR7jazGIUSQ2WpZknz+Y7xDPmozR8jRGT4WpNUsDPHu6f+PDdTU7OR4Fz3zA9aR16KOL/PdAiFWWWCaMRcHP35h65XwaB
X-Received: by 2002:a50:a686:0:b0:5a1:1:27a9 with SMTP id 4fb4d7f45d1cf-5ac63b59c17mr2468749a12.18.1721938304541;
 Thu, 25 Jul 2024 13:11:44 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20240724210020eucas1p2db4a3e71e4b9696804ac8f1bad6e1c61@eucas1p2.samsung.com>
 <20240724210014.mc6nima6cekgiukx@joelS2.panther.com>
In-Reply-To: <20240724210014.mc6nima6cekgiukx@joelS2.panther.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 25 Jul 2024 13:11:27 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiHHDGQ03qJc+yZKmUpmKOgbz26Tq=XBrYcmNww8L_V0A@mail.gmail.com>
Message-ID: <CAHk-=wiHHDGQ03qJc+yZKmUpmKOgbz26Tq=XBrYcmNww8L_V0A@mail.gmail.com>
Subject: Re: [GIT PULL] sysctl constification changes for v6.11-rc1
To: Joel Granados <j.granados@samsung.com>
Cc: =?UTF-8?B?VGhvbWFzIFdlae+/vXNjaHVo?= <linux@weissschuh.net>, 
	Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <kees@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Dave Chinner <david@fromorbit.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-xfs@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-security-module@vger.kernel.org, netfilter-devel@vger.kernel.org, 
	coreteam@netfilter.org, bpf@vger.kernel.org, kexec@lists.infradead.org, 
	linux-hardening@vger.kernel.org, bridge@lists.linux.dev, 
	mptcp@lists.linux.dev, lvs-devel@vger.kernel.org, linux-rdma@vger.kernel.org, 
	rds-devel@oss.oracle.com, linux-sctp@vger.kernel.org, 
	linux-nfs@vger.kernel.org, apparmor@lists.ubuntu.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240725_131859_697744_C3AFC18B 
X-CRM114-Status: GOOD (  10.84  )
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

On Wed, 24 Jul 2024 at 14:00, Joel Granados <j.granados@samsung.com> wrote:
>
> This is my first time sending out a semantic patch, so get back to me if
> you have issues or prefer some other way of receiving it.

Looks fine to me.

Sometimes if it's just a pure scripting change, people send me the
script itself and just ask me to run it as a final thing before the
rc1 release or something like that.

But since in practice there's almost always some additional manual
cleanup, doing it this way with the script documented in the commit is
typically the right way to go.

This time it was details like whitespace alignment, sometimes it's
"the script did 95%, but there was another call site that also needed
updating", or just a documentation update to go in together with the
change or whatever.

Anyway, pulled and just going through my build tests now.

              Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
