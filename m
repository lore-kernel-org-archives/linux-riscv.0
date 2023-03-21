Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A554C74A5B
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Mar 2023 13:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:In-Reply-To:
	Date:MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=fW4xV0M7SR+5S1x6ieYKGpA5RlZoN5AidNwi282vOkk=; b=F643qBoX7GY2Fj
	/8+Qf2/NZAK+CkxIdwQrOIV5SbH/xm/2wqQaOR0wRfA9QEhExG/Waw0EmaDuD+8ZdWOBiuULGsOza
	gSXEKNXcxVXH2fU2KoJ2UCSguxdRPxd8swyvxXaryipG/VLnq5uDIvh5P8nGzr/MYkGhexn6iq7tZ
	QzmXtWZJWSxJbxCezPGLf/FcKPSnUUTyoD+qkJ9R1+CEmKKxUfcEBZV1YY0pde4f3K5PIwRNRx9vl
	T3bRfOYixhJ/34DcQyL1jVXx1opI+X7P4JADi2YgKgvveXwdWqCd4Oc3J+RvDRo8VuIs7hv0jKWjN
	/VlAJWJBLZOHzf9gDlhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pebp6-00CTqM-0i;
	Tue, 21 Mar 2023 13:14:44 +0000
Received: from mail-il1-f200.google.com ([209.85.166.200])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pebp3-00CTpN-1O
	for linux-riscv@lists.infradead.org;
	Tue, 21 Mar 2023 13:14:42 +0000
Received: by mail-il1-f200.google.com with SMTP id i14-20020a056e0212ce00b0031d17f33e9aso7573645ilm.7
        for <linux-riscv@lists.infradead.org>; Tue, 21 Mar 2023 06:14:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679404478;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d1E/CPVb6H8VyxRsyGiJWxP2UWi3TCzv8QPJdKDcVdk=;
        b=qgmpmOuUYmMQcg9WJaTQ40zvthDNVdZOBwU03W+QXF10olsTjueotg8I8Dgg0M2NGB
         /dJxJoQ5+06JpRtd+XED9mZqCpPdrieXacKFjCaJuuPNqhS97gHaZvJAq4ZSHTcsgmbH
         pHbEsoN3guBV4juehne/YTw+VSBfn0NYhwWlF++aR33tUYmDM3S4+yeT4Yegw/30MfdT
         a3zpPyTE+/Ea24eZVRzJKN5B54dJKCjco5vJIVL1e3oKTEPxzzuapO9Aqm1hhtnR9As/
         +6a3i6aO8gTYks8vK7ZFPfX5+yI7ks5Duq+gsXujfR4OYetbTAvRteSzJvbJyvTYRjoj
         3ygQ==
X-Gm-Message-State: AO0yUKUQZ0zLC36xsT2bm3hBPsrGxkmXsGHZIFM8OrJ3x5yr3rM/YBjQ
	+lReSqQxnG67nZ1yxDA5PEj9m8V1K1vKXOUml2QK8vGn7MSy
X-Google-Smtp-Source: AK7set/s6ej3JV3Xsl6KlLwe5mBRC4+3HQxIGvDZNFwhkHinh5peA+vo1p3wVHAfY3eJ5A7/xT9ehxiKPiehGXUDwIA3ROPqBwGS
MIME-Version: 1.0
X-Received: by 2002:a6b:8d46:0:b0:752:f038:6322 with SMTP id
 p67-20020a6b8d46000000b00752f0386322mr846819iod.0.1679404478524; Tue, 21 Mar
 2023 06:14:38 -0700 (PDT)
Date: Tue, 21 Mar 2023 06:14:38 -0700
In-Reply-To: <000000000000ea7a5c05f051fd00@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000006071aa05f768d333@google.com>
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
X-CRM114-CacheID: sfid-20230321_061441_471109_B8CD971A 
X-CRM114-Status: UNSURE (   4.63  )
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
