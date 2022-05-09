Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63840C433FE
	for <linux-riscv@archiver.kernel.org>; Mon,  9 May 2022 22:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wF7+2S7tSXsqACIKNSs2GztN3r1QhIuujEGXwD2ys+c=; b=n2T8jppJJMVXpE
	KyOQg+vW5goiEXqYQewCtBG66T54X4GOe6DZrLTeSm6UzIbsK5lcWI+l8CrCA+XKG9bUTmcgIihr6
	IHQP+Cmt0gq4GD1+uXVuH4rLRWVDqi1iUBxhnCLW6sdS0QMXgJGSI2AvpyK6j7sBVgm4Cqle6AFkn
	NVlV7sT8SHaR8vCW1QCm/Brx52xDYqHrFzdOeDk0du2oCKAxsFVuvyiwFeWbnI7ih2e0OJdj2G4pI
	KQaejQLEmd5ujxcCBBYwcBPG+DmqKnO5/O2rdihlhxgd6mn3puw8R20UNgooJ43clqT8l8YRTYKcv
	QxOaW2wh8BiBb4fVnVow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noBva-00GZ6b-Ak; Mon, 09 May 2022 22:32:30 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noBvV-00GZ44-Rd
 for linux-riscv@lists.infradead.org; Mon, 09 May 2022 22:32:27 +0000
Received: by mail-pf1-x42a.google.com with SMTP id j6so13409516pfe.13
 for <linux-riscv@lists.infradead.org>; Mon, 09 May 2022 15:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=wogL5SNF6fBWUFbVfNImZXe0oagV0GR5P/uvXUVTGHw=;
 b=IJlSe/QYx+QBVtXsevt86SPgzwgnfYUoN/+MtyvqGNjARDi5TpCiQz6TJD5R7+mW5m
 x1JKsPS1APmscP3dprFiIQRfFzjXXfYVyAdBp2oqTtlD1pomh7P+T8/J1bw9I193p9rb
 iVTOupRBY/ZlX0QdHDGqSv2jYXcpZIJ3YFVWw8NHqfqSpy1JsSbHDLG1NlA8aj1y3A0B
 deI6rVkM4HytF4YzYO3kSyKYzQRH/4jZ9v0kI2MOFYw1Tqmz4RjwXhlBTcoq+tlKfZ7W
 HZ2zuhLgAk5S9uqogxOl7tNwVp13lu6ZXSnuV0Irnw4mmHrGSywUR+iz7poAhIuNIWUQ
 /hHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=wogL5SNF6fBWUFbVfNImZXe0oagV0GR5P/uvXUVTGHw=;
 b=TcCqncr6n/F/N+JsM0fr9hWUBZn+B/rqnJyZmROAZGlvFTbmraTi7739oS3Lp8Lk2y
 kwo3u5lIlvkZw0Vu7zdP1fZDzra4mtLGSh5qUoivVydxu8BPXBzlsvM7agoT5gHYwC20
 6YC80q3yQ7fxOmUIWh7IAgmdF7LiSR9hwaWG14+OyVsnJzjfeDPLE3+vZNclGgZO98gH
 71L9+EsWnpr+sd1Y81hQcBFT3gXaiEEZ8jXPW8Jn+KM7ZvBqBMy0HcyS9GH7zsVfIuo7
 Yr1AsyYlzvGLmP2na+ZhICJbiHU2AqsL3x73tn3UPyjRIXA7vH+rX+lbVM4nJeMG5GO/
 iM5g==
X-Gm-Message-State: AOAM5306uEZpLtyl/4QRkDuTZMkHCGt0fHCBrg2FGH/YE99kzi1tFpUh
 Jk7RUTJMnBTLcAtFKF82fdc5qQ==
X-Google-Smtp-Source: ABdhPJyAwHjkK3tRBZ297rtg0Bed+Rov0Lqf/ttVjbMRkoVNvpEnT2Uuc+cDP/CXmoRrMY/G7ikPDg==
X-Received: by 2002:a63:f710:0:b0:3c6:3561:42a5 with SMTP id
 x16-20020a63f710000000b003c6356142a5mr14416105pgh.295.1652135543686; 
 Mon, 09 May 2022 15:32:23 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 q10-20020a170902daca00b0015e8d4eb1besm423397plx.8.2022.05.09.15.32.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 15:32:23 -0700 (PDT)
Subject: [PATCH v5 0/7] Generic Ticket Spinlocks
Date: Mon,  9 May 2022 15:29:49 -0700
Message-Id: <20220509222956.2886-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: guoren@kernel.org, peterz@infradead.org, mingo@redhat.com,
 Will Deacon <will@kernel.org>, longman@redhat.com, boqun.feng@gmail.com,
 jonas@southpole.se, stefan.kristiansson@saunalahti.fi, shorne@gmail.com,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu,
 Arnd Bergmann <arnd@arndb.de>, macro@orcam.me.uk, 
 Greg KH <gregkh@linuxfoundation.org>, sudipm.mukherjee@gmail.com,
 jszhang@kernel.org, linux-csky@vger.kernel.org, 
 linux-kernel@vger.kernel.org, openrisc@lists.librecores.org,
 linux-riscv@lists.infradead.org, 
 linux-arch@vger.kernel.org,         linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_153225_930265_8959F184 
X-CRM114-Status: GOOD (  11.06  )
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

The changes since v5 have been very minor, just some tags and a few
wording changes to the qspinlock comment.  There's also a PR for Arnd's
tree, assuming that lands I'll take the RISC-V bits into my tree and
assuming the csky and openrisc folks don't say anything I'll take those
too (though now that we're got a multi-tree merge going that doesn't
matter so much, but I said I'd take them so I'm going to default to
that as everyone else may have tuned out).

Changes since v4 <20220430153626.30660-1-palmer@rivosinc.com>:
* Some wording cleanups for the qspinlock comment.
* Collected reviewed/tested tags.

Changes since v3 <20220414220214.24556-1-palmer@rivosinc.com>:
* Added a smp_mb() in the lock slow-path, to make sure that is RCsc.
* Fixed the header guards.

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
