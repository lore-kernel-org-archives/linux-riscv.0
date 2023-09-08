Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17F6FEEB56C
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Sep 2023 18:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:In-Reply-To:
	Date:MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=Kp8tAmg80E2vuMNOc7zjwFE9R+yutezHVdaPMdDCi1Y=; b=x6AsxZeQ2jcAM6
	Vsbw6/OCBMGdCjaDmHXMPhoTfKGTNyODtUi0x8XY+FkCdw6PqAK8qJeab49RtB/WZrGABDK/Z8/MK
	k0QTJPFlCgvBXdtfyqDzWpBZoTN9iKUPA3XKLSglZVzWY30nIZfB22fJ+DbDnVFNRHgDMTTiZZg9u
	U8BfB/D0KKFwJDw8flTSYh8L/5RxbPXuK4g2PnnhIpwe0m6PPFBfcNF4s8aIZFCo8XQpfTJtTs1iS
	7rwSh9qg1wToQGkPOIzmUY0P75SRo2Ttlvbw3EQ/IG2TWS/EpZM8dfz5oo3DUJ4hFga28tghL/uUw
	AgmJKwRPNM1bGsjsz1Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qefqO-00EDeR-2p;
	Fri, 08 Sep 2023 18:04:36 +0000
Received: from mail-pf1-f198.google.com ([209.85.210.198])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qefqK-00EDah-31
	for linux-riscv@lists.infradead.org;
	Fri, 08 Sep 2023 18:04:35 +0000
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-68bec43ec0cso3285726b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 08 Sep 2023 11:04:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694196270; x=1694801070;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0lAvPiHpQzYJH2/Evbqeae0jEIobBXd5mkIT/JR5mjU=;
        b=ZwJ9yVNPPJaIwhFUupt3XwH/lKncjDao99qIN1/yjSE8Gedk4OternAimz2C0L2Ws9
         LYA5knGS8zflLGMCwAG8y2mURXbh49lcCou4OnKDyKr59rG9Ydq2QTKzWMmaojecWjFE
         1mxwC4fHVGBF8LDxfdCGk/Avuzd1PkyfdCx2+8+YgxIoGGMgL88D51NXyluYgxuOSPCu
         ayqlz2HripV4jgKD3/ks4RNzKNu49sTHwf7I7jPW+K1A1ckwSSNBiriXH+fcQc2LbmJe
         i++Ije2jx6XBIL5e8TNXwYOCkx/6deYC9OT0M5WSZIlhJMG3bsLlGVtos3Uv6WmsJMPS
         mkNw==
X-Gm-Message-State: AOJu0YwknL9ClNA5iY3YnKY8q3DuJQiyovswA1v3D84sNCbC7fyqgpEC
	cYy6Ry6qexEKo0hCEd9LRVvp8y9KiaruWu4htY+muAzNsDzP
X-Google-Smtp-Source: AGHT+IFG6oZqBOayFovKE0NVKEQ0Xnwtd+Nskzg2qKPXIoko6vfMv+elInHkBKWJh6QlQckbllDdPD2ESA+Mlnx+N1cgB86kBYBd
MIME-Version: 1.0
X-Received: by 2002:a05:6a00:80c:b0:68a:3c7a:128c with SMTP id
 m12-20020a056a00080c00b0068a3c7a128cmr1357477pfk.2.1694196270440; Fri, 08 Sep
 2023 11:04:30 -0700 (PDT)
Date: Fri, 08 Sep 2023 11:04:30 -0700
In-Reply-To: <000000000000f392a60604a65085@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000e127ec0604dcce27@google.com>
Subject: Re: [syzbot] [mm?] kernel BUG in vma_replace_policy
From: syzbot <syzbot+b591856e0f0139f83023@syzkaller.appspotmail.com>
To: 42.hyeyoo@gmail.com, Liam.Howlett@Oracle.com, agordeev@linux.ibm.com, 
	akpm@linux-foundation.org, alexghiti@rivosinc.com, aou@eecs.berkeley.edu, 
	borntraeger@linux.ibm.com, cgroups@vger.kernel.org, 
	christophe.leroy@csgroup.eu, damon@lists.linux.dev, david@redhat.com, 
	eadavis@sina.com, frankja@linux.ibm.com, gerald.schaefer@linux.ibm.com, 
	gor@linux.ibm.com, hannes@cmpxchg.org, hca@linux.ibm.com, 
	imbrenda@linux.ibm.com, jeeheng.sia@starfivetech.com, jglisse@redhat.com, 
	kvm@vger.kernel.org, leyfoon.tan@starfivetech.com, linmiaohe@huawei.com, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	mason.huo@starfivetech.com, mhocko@kernel.org, mpe@ellerman.id.au, 
	muchun.song@linux.dev, naoya.horiguchi@nec.com, npiggin@gmail.com, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, roman.gushchin@linux.dev, 
	sebastian.reichel@collabora.com, shakeelb@google.com, sj@kernel.org, 
	surenb@google.com, svens@linux.ibm.com, syzkaller-bugs@googlegroups.com, 
	willy@infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230908_110432_969254_F003A4D1 
X-CRM114-Status: UNSURE (   4.05  )
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

syzbot has bisected this issue to:

commit 49b0638502da097c15d46cd4e871dbaa022caf7c
Author: Suren Baghdasaryan <surenb@google.com>
Date:   Fri Aug 4 15:27:19 2023 +0000

    mm: enable page walking API to lock vmas during the walk

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=11fd2348680000
start commit:   7733171926cc Merge tag 'mailbox-v6.6' of git://git.linaro...
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=13fd2348680000
console output: https://syzkaller.appspot.com/x/log.txt?x=15fd2348680000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b273cdfbc13e9a4b
dashboard link: https://syzkaller.appspot.com/bug?extid=b591856e0f0139f83023
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15d4ecd0680000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1055c284680000

Reported-by: syzbot+b591856e0f0139f83023@syzkaller.appspotmail.com
Fixes: 49b0638502da ("mm: enable page walking API to lock vmas during the walk")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
