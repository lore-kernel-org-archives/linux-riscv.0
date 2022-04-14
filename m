Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C32C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Apr 2022 22:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uc6F4t2Exz9qyRc36FX2EjSGruZOlyVszegLh/TvjvE=; b=vQcFZpnhmCzniM
	a5O7ZNJNK8OaQgDByskgbpwzddDCNXX29GhsCM1mZgrzFWpwGKnPWgKInIYc1zwObcMUQmkxwJQVv
	/O3KdBbQBgom3ZEZbJr2dkIvVv2llqgxHOpzW/3C3i4YauhIrVcLF86sLx88HhAM1a/UL3a2Ic2tr
	zzUU+YRnHriYb21691CklrQ+HMkPiLyf2YQIz3RndwXQNkxMkPXFDO6KcoN6shkTVDrOFkJFbyVJI
	D5IGX8AX3lfbgkt4Eg+01OhbM/wMNnaXZYBAFJ/Nk/4V4slRgnNu9BgvDwwghHHENF7o69FGaGYzD
	qcxrqcmW+ANqm0OFKT2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nf7aa-007RDX-8U; Thu, 14 Apr 2022 22:05:20 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nf7aX-007RCH-GV
 for linux-riscv@lists.infradead.org; Thu, 14 Apr 2022 22:05:19 +0000
Received: by mail-pg1-x534.google.com with SMTP id s137so5929263pgs.5
 for <linux-riscv@lists.infradead.org>; Thu, 14 Apr 2022 15:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=kj79e2RofkdZtpcV4cuOdSuq76rCoCCYoAotU+R/caE=;
 b=Mub7+Xk9wwSBUzXegquRSmLHR9ZMLVl+1ewzq5ugAx4HR1GhjoZLMMFmESOz5cYpd4
 IUiDTMhYid2V2PzT+m554J80jj/yd0Smc/vEc8jxPkbRHFPCLa6XsvbMaUwGDVx5GqRk
 Sd5V0dPiRN96hXapmj2tjFQuC0Qh4YXAbNDqG/xgOYl1dzeFH2v0VX3nBxxyFb+9Nern
 2NFcsL/GBKleI6+/AFI5moGEf64wKIr1pufuCE/CAFm5t1MNIgwqoSnpO8NCH6LeTttu
 n9q0DFM8C/BW8GyewTYnqBCX5uc2Bm0yPLTCVweVHMFgSjYiAOq98kz9s95A+ZT8PL5J
 SbzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=kj79e2RofkdZtpcV4cuOdSuq76rCoCCYoAotU+R/caE=;
 b=TRUYhcgBurixzBXwqXMJh7Qu1Kb0ZtEy/+LI1KYoy47pS+kj6Rvf+0KvSppZaPxQkJ
 n9PE24IYCH+qFkT76TAcg7JyPLnmy0iFhTghmEaIT9nSV6S/AnmDp8zGc0JL3oYssvlu
 Lmf0fCJPgL9tKnk++iCL7Hg+Gyov5sFrf991cl50MvURu3pSUE59zM8e0UKe2hTRhbI1
 x6AmWC6CdBT1RgxiIiE1uARs1cE/Lk/CxdFTQQnJhZrjR/gFTt3j5Pt0lncT2f3RohpV
 ztAcSOZIrbBowjKowCqsCU8WKLe1NGRYl0rx+idv7OX1q0gWcCJr6z5timG5uuhAdiaO
 3WUA==
X-Gm-Message-State: AOAM532rM2XngvbqhTb7BdRSgQumPN2H+BEYKlJj/gKtI2rS9GgbGqIU
 U9TSke5h7GEC0wkD8BJVsGJgKg==
X-Google-Smtp-Source: ABdhPJwjtqU6AWYAwYXufYTV42SdwmS0JH8rrNmXsZg+uKyEV95T0qFTo4wyvCTdhcUWt5XoHP3CIg==
X-Received: by 2002:a63:780f:0:b0:386:5d6f:2153 with SMTP id
 t15-20020a63780f000000b003865d6f2153mr3792784pgc.555.1649973914297; 
 Thu, 14 Apr 2022 15:05:14 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 g12-20020a056a001a0c00b004e1307b249csm836244pfv.69.2022.04.14.15.05.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 15:05:13 -0700 (PDT)
Subject: [PATCH v3 0/7] Generic Ticket Spinlocks
Date: Thu, 14 Apr 2022 15:02:07 -0700
Message-Id: <20220414220214.24556-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: peterz@infradead.org, mingo@redhat.com, Will Deacon <will@kernel.org>,
 longman@redhat.com, boqun.feng@gmail.com, jonas@southpole.se,
 stefan.kristiansson@saunalahti.fi, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>, macro@orcam.me.uk,
 Greg KH <gregkh@linuxfoundation.org>, 
 sudipm.mukherjee@gmail.com, wangkefeng.wang@huawei.com, jszhang@kernel.org,
 linux-csky@vger.kernel.org, 
 linux-kernel@vger.kernel.org, openrisc@lists.librecores.org,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>, heiko@sntech.de, guoren@kernel.org,
 shorne@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_150517_809786_F049E8D2 
X-CRM114-Status: GOOD (  16.05  )
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

Looks like feedback has been largely positive on this one.  I think I
got everything from the v1 and v2, but it was a bit mixed up so sorry if
I missed something.  I'm generally being conservative on the tags here,
as things have drifted around a bit.  Specifically I dropped the
Tested-bys, as this is all based on 5.18-rc1 now and there's been a
touch of diff.

I've put this at palmer/tspinlock-v3, in case that helps anyone.  This
generally looks good to me, but I'll wait for feedback before putting it
anywhere else.  I'd default to doing a shared tag for the asm-generic
stuff and then let other arch folks pull in that (with their arch
support), but if you want me to take it via my tree then feel free to
just say so explicitly.  What's on that branch right now definately
shouldn't be treated as stable, though, as I'll wait for at least an
official Ack/Review from the asm-generic folks (and of course there may
be more feedback).

This passes my standard tests, both as the whole thing and as just the
RISC-V spinlock change.  That's just QEMU, though, so it's not all that
exciting.

Changes since v2 <20220319035457.2214979-1-guoren@kernel.org>:
* Picked up Peter's SOBs, which were posted on the v1.
* Re-ordered the first two patches, as they
* Re-worded the RISC-V qrwlock patch, as it was a bit mushy.  I also
  added a blurb in the qrwlock's top comment about this dependency.
* Picked up Stafford's fix for big-endian systems, which I have not
  tested as I don't have one (at least easily availiable, I think the BE
  MIPS systems are still in that pile in my garage).
* Call the generic version <asm-genenic/spinlock{_types}.h>, as there's
  really no utility to the version that only errors out.

Changes since v1 <20220316232600.20419-1-palmer@rivosinc.com>:
* Follow Arnd suggestion to make the patch series more generic.
* Add csky in the series.
* Combine RISC-V's two patches into one.
* Modify openrisc's patch to suit the new generic version.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
