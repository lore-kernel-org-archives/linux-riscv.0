Return-Path: <SRS0=/9Zu=F4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43FA1C433E0
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Dec 2020 04:24:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C822222AAC
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Dec 2020 04:24:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C822222AAC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:To:From:Subject:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+7TM+yZOzYbxfAma3LYYKVfKjRcxe7+FoyfOHL8ah6s=; b=HbFoale+MM5TliUBK+W/ugHCsx
	k5iqbHsyrw+Gq44iXRy/h4iA5w9gteya41OmFS8hMLlCBPy0oMzCq+EdYgxdTwFCS85pAR53MvOuu
	cwiRFIqn+9gtmzCOd3KQsdkxw1g65OOi/eeM7x+KBwws/vhjjpkBvWSXgNPJaQWpOs4ejbS5ns/M2
	hz6mSUVxBZtDQsYQbZsWslzTEA0fW788BZt3kycdour37aDP5unRVIDJwhFC8/RfGZO5WCF/AYc08
	ev5cs0fX0WduTqeV+4mXtBrZRlHUw1ea7qDZRPtwFsbusiPpSggVA4aL/mcwz8/ppdh+zW3rtCLxn
	8k/E1RBg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ksIAg-0001lW-1N; Thu, 24 Dec 2020 04:24:14 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ksIAd-0001l5-Vh
 for linux-riscv@lists.infradead.org; Thu, 24 Dec 2020 04:24:13 +0000
Received: by mail-pf1-x42a.google.com with SMTP id f9so605667pfc.11
 for <linux-riscv@lists.infradead.org>; Wed, 23 Dec 2020 20:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:cc:from:to:message-id;
 bh=eFNIDdfQMEQDT5VxT7UvlOTQkhuP0UlcVF5/8a1oZVw=;
 b=FIiIaF8Y2qiTVMo9ROp0f2zFUknPhBk7Hyq2hBZiQTKyunSIF8Vb87uYOzuqmyYc/Y
 Bn8cvZ9bTvq1nESCGy6EmfdfMpv+NmOH9zZ8vL+8EJSHcp9ScLfspxR5Oe00erHWAJNH
 XhoAcDmX4TUfFQLeYZMITcq60hiQxC2eRPLTXtUeIN9lpTOM3SvNqf2yWd2xXMyPfxrb
 2OC5np46ppFJmXdXmRApgs3V73YPdIQI49Xs/usuakEsBBn66OAwpiwEC4l1jEUdddRU
 5FuGmuHRufiS/2be/30OlhFNahDKWdonV1cNmkmFzwiGVMT9vrEhi+UFd3r40UGD/CL+
 +sRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=eFNIDdfQMEQDT5VxT7UvlOTQkhuP0UlcVF5/8a1oZVw=;
 b=V3r4pQJ3n8ak4kGH8LluHQ5gZMbPzbpIyjuQxi6VohhU3DHmU2OqBgPpvyq//ssJtZ
 msl2YqHDK0z448AualbfTxgV0uWJPH+iLSpI1QXcjDkod7wSsYP8+ES+YS/0vBvqLK9x
 TW8u3BRYdO5JwoaMFdT1BO0kO5wsGspvCArKO63rK4njrbZEvawmGdHqHhlFtm+PO46K
 dfqQVqYJEkR6T5ZhUHi+MlJwJI05HF24QiC8MYOLzzSls2AMT+pR3rS41Qf1Yt9bCTf+
 Rdded6itmEEjLxDoE8FntRGpw2ht6AVFp8wHNnTJny/ry2AsmFTTy5MNRCpGejMe2Gpc
 mtcA==
X-Gm-Message-State: AOAM532BPqHW2dthxzbnj1WaJNBb+QxAKemVZAmW0uRH127gE11TIXne
 HVYXcDOiBGTFQ0Op/LG8+jXXJ2LRpNSH4w==
X-Google-Smtp-Source: ABdhPJxEKQn2mqdHvl3fjDZEpX4U6V7iktUQsILQrETYO1uYQ3wOX2SBIPyj3cwUngkvfHP+yOYs+g==
X-Received: by 2002:a62:d142:0:b029:19e:62a0:ca1a with SMTP id
 t2-20020a62d1420000b029019e62a0ca1amr26275067pfl.80.1608783846600; 
 Wed, 23 Dec 2020 20:24:06 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id b6sm23421973pfd.43.2020.12.23.20.24.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Dec 2020 20:24:05 -0800 (PST)
Date: Wed, 23 Dec 2020 20:24:05 -0800 (PST)
X-Google-Original-Date: Wed, 23 Dec 2020 20:23:59 PST (-0800)
Subject: [GIT PULL] RISC-V Fixes for 5.11-rc1 (or rc2, if it's too late)
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-ab52db2e-d084-4a51-b804-ae41d45ca8db@palmerdabbelt-glaptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201223_232412_146260_6E9A0485 
X-CRM114-Status: GOOD (  14.09  )
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
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

merged tag 'riscv-for-linus-5.11-mw0'
The following changes since commit e2ae634014d3a8839a99f8897b3f6346a133a33b:

  Merge tag 'riscv-for-linus-5.11-mw0' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux (2020-12-18 10:43:07 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.11-rc1

for you to fetch changes up to de043da0b9e71147ca610ed542d34858aadfc61c:

  RISC-V: Fix usage of memblock_enforce_memory_limit (2020-12-21 21:02:14 -0800)

----------------------------------------------------------------
RISC-V Fixes for 5.11-rc1

* A fix that avoids trying to initialize memory regions outside the
  usable range.

---

I know it's an odd time, but I figured it'd be better to just send this out.
There's a few other fixes on the list that I was considering including, but
there's enough discussion that I didn't want to rush those over the holidays.
I don't see any reason to delay this one any longer, though, as it's relevant
to the ongoing QEMU work.

----------------------------------------------------------------
Atish Patra (1):
      RISC-V: Fix usage of memblock_enforce_memory_limit

 arch/riscv/mm/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
