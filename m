Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 254A4C761A6
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Apr 2023 13:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:In-Reply-To:
	Date:MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=fW4xV0M7SR+5S1x6ieYKGpA5RlZoN5AidNwi282vOkk=; b=px2QouvxAU4Jqb
	0qxLYyliD+j+mbJTjUPmNzqFp4ErJ9dExioSWNsGT+jIvbZAjvpHeUdlGZasXDtW1M8zuo72B2jPa
	e6nIjZje8pc0KCP6ni47TdNY+QjO/o9gHV/xFUhdkd5EgJ4ciXkFmlgmTYJTw4YFIKj40BPiNHsHB
	uFOodWGQjRSPnsHWF+Xi4vaVbef6MOlqzMSR+NytkTlVYRKO21y3YvNYjwKi5yGPTlf9HrQORu9J2
	YBTrryJb8w/uVvVm7ta9yORGwPlcDVdojw0lV9Q9OT/lmX30r2oeNL7YcPCkLxso0ona7IAGgXSTi
	2dgGh1ZeNHK4sqLtRtZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjgVh-001QXN-1n;
	Tue, 04 Apr 2023 13:15:41 +0000
Received: from mail-il1-f198.google.com ([209.85.166.198])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjgVe-001QWS-0O
	for linux-riscv@lists.infradead.org;
	Tue, 04 Apr 2023 13:15:39 +0000
Received: by mail-il1-f198.google.com with SMTP id a9-20020a921a09000000b003264524481cso8920269ila.7
        for <linux-riscv@lists.infradead.org>; Tue, 04 Apr 2023 06:15:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680614135; x=1683206135;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d1E/CPVb6H8VyxRsyGiJWxP2UWi3TCzv8QPJdKDcVdk=;
        b=27biJGOj4fX2L1Vml/BsD1r/dpuncquYSHr17K/cincrDzQ7wIkeyUABmURS5fiz0F
         4bwtEq3Dt7TDvnC1zh1drQHZoornkKihq+J38KJzzAsDCSLBKGxkHD7uar4dqBQk5+PU
         ok/Z4YN5imFwhWFzrZH5mnA3jruJFJ8KkIl4zRpPwo0LA2Xd1Oh79a0CECtg2p5y8afh
         u5P7Ywe8CXh66sQ70qVQFQALK1sQxmrC46LBNhc1aoLPBkJ3bbww1n0RYAwHG/+CNjDi
         7ZWh3ThFcClWeP+Mfwxhad+qeikn3XFgIlh+QioSN9PPWFcxW+zmRckmxIjmKC9R45FF
         YRmg==
X-Gm-Message-State: AAQBX9dzDZf9nKEPjpnpL+UA4tv9go83YiR/z2OGj+kaiD96qogbMxzd
	Rttx1ar0vJoVUuuYMsxxnhGPY4cfK24+WnWdG9+rxz/zMYEL
X-Google-Smtp-Source: AKy350a9HLTipr+raKImLD76mGe3Np9Ljig3Z9sLELiKdBwISbIN4VnWZyemyNCQ7gxBcZbQOpO+Wy2G6itx3Us7y2KbIi/Xr61s
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1cad:b0:325:f785:6a6 with SMTP id
 x13-20020a056e021cad00b00325f78506a6mr1608281ill.6.1680614135456; Tue, 04 Apr
 2023 06:15:35 -0700 (PDT)
Date: Tue, 04 Apr 2023 06:15:35 -0700
In-Reply-To: <000000000000ea7a5c05f051fd00@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000008c6f3b05f88278c5@google.com>
Subject: Re: [syzbot] riscv/fixes boot error: WARNING in __apply_to_page_range (2)
From: syzbot <syzbot+5702f46b5b22bdb38b7e@syzkaller.appspotmail.com>
To: alex@ghiti.fr, andrii@kernel.org, aou@eecs.berkeley.edu, ast@kernel.org, 
	bjorn@kernel.org, bpf@vger.kernel.org, daniel@iogearbox.net, 
	dvyukov@google.com, haoluo@google.com, john.fastabend@gmail.com, 
	jolsa@kernel.org, kpsingh@kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, luke.r.nels@gmail.com, martin.lau@linux.dev, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, sdf@google.com, song@kernel.org, 
	syzkaller-bugs@googlegroups.com, xi.wang@gmail.com, yhs@fb.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_061538_160332_D1BEDB19 
X-CRM114-Status: UNSURE (   5.26  )
X-CRM114-Notice: Please train this message.
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

This bug is marked as fixed by commit:
riscv: Rework kasan population functions

But I can't find it in the tested trees[1] for more than 90 days.
Is it a correct commit? Please update it by replying:

#syz fix: exact-commit-title

Until then the bug is still considered open and new crashes with
the same signature are ignored.

Kernel: Linux
Dashboard link: https://syzkaller.appspot.com/bug?extid=5702f46b5b22bdb38b7e

---
[1] I expect the commit to be present in:

1. for-kernelci branch of
git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git

2. master branch of
git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git

3. master branch of
git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git

4. main branch of
git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git

The full list of 10 trees can be found at
https://syzkaller.appspot.com/upstream/repos

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
