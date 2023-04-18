Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C9F1C77B75
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Apr 2023 13:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:In-Reply-To:
	Date:MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=fW4xV0M7SR+5S1x6ieYKGpA5RlZoN5AidNwi282vOkk=; b=IegalmcIM2ZGd4
	zGk3g3rb2MOA/ogf7nVkSLGvfUXWwp6ack/tdvni0HaNpD6Lykt0VBr7Q/2g0B4MPcHGH+c5eRErY
	/XPS6m7whMYkWbihihHjuEzEyvIYaJyfcNvLZMt586WvNCgMbA8yHH82x+FAVinXQacc/bdZ3Nx7/
	tLTWsxxPcaOZ/BUYfeOnw5jNdKeBek9+0NQMnCG1xYdHXJ3B4u4XTCvixcAgDXB1FDu/e7Y7bk9vA
	plTNfdRGloROjJiMQugp6yAyiZQgvu5pO/3I+6nMf1e6EVvmmN4z0cKRa/50GTUvtA8fkxS/kRRbl
	wDjJjEwDz/DojgRcGHxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1polBT-002FWh-0N;
	Tue, 18 Apr 2023 13:15:47 +0000
Received: from mail-io1-f69.google.com ([209.85.166.69])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1polBQ-002FWC-1p
	for linux-riscv@lists.infradead.org;
	Tue, 18 Apr 2023 13:15:45 +0000
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-7606d6b2fddso503484339f.2
        for <linux-riscv@lists.infradead.org>; Tue, 18 Apr 2023 06:15:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681823742; x=1684415742;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d1E/CPVb6H8VyxRsyGiJWxP2UWi3TCzv8QPJdKDcVdk=;
        b=Ic9NcynU2+d3FOT9CmD/QptcMcbCI4rsCBLJLJsOjIfDwwdJjQpRZit0nsaralyf3+
         YkRIFA7f4oWNQLsypSLrNv+ySKiIAs8VzBKcBNQR3Yap8KimV2HFVB3q1mkI5BuKjT6i
         f+F7oJB/YRBhoIBIRh53HrOdKge8R6Rhg1Ram4fmQn+ExeBhwACbdF7fAXiOTZlwHY3I
         7ermReqwK7jp7HTF9ZytcDs+h8F3L18M8F08l5dVWwVPaAI2mF7mXv6DPUeghhrT8BcF
         7tAku8J82P7TOjPlLDF+IA5C1iFEI9Sq+yfhfZ6NDP1sCdfsXYpYX5z9RDEoCEYF5gZS
         ACWg==
X-Gm-Message-State: AAQBX9cGAdYwgWFhdtV0utV6iKpfmcHDYvkTavekbfKdxAElT1xn5LCC
	Jsq0QFI0EyVGO6OSd375em2P/NSoobFofCTLwp8t5l8r7b+T
X-Google-Smtp-Source: AKy350bK6tUhkGWRadBcmLmWjSYESdTvhu9DQiBCzqdhfvo2xBb+dNdo/jaDbYIhm0DIoA9zM8Nu0yWO3Dtt07JP+fFHyoJAXZqA
MIME-Version: 1.0
X-Received: by 2002:a02:29c9:0:b0:40f:9ac9:50f2 with SMTP id
 p192-20020a0229c9000000b0040f9ac950f2mr1559935jap.3.1681823742813; Tue, 18
 Apr 2023 06:15:42 -0700 (PDT)
Date: Tue, 18 Apr 2023 06:15:42 -0700
In-Reply-To: <000000000000ea7a5c05f051fd00@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c3f07505f99c1a97@google.com>
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
X-CRM114-CacheID: sfid-20230418_061544_599737_F59AF1E9 
X-CRM114-Status: UNSURE (   5.12  )
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
