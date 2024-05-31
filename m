Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 483CFC25B74
	for <linux-riscv@archiver.kernel.org>; Fri, 31 May 2024 03:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:In-Reply-To:
	Date:MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=jNfm6MenbNYi1DCFjznjOgYqh/WtHVnoUsrDMyp/sYE=; b=eWqORKVcYYXuMF
	QL4HAnbzk9cMwykAwLT+np1x9036wNPVJVHwJy6J9NCugmidN6gW2xf43gTtDSYCg/vIQZ7Fi0kZq
	Jcc4Xj8D1pTxK9CuDy4COzyXxPqF27A55OzSGycx1uoVs+UwW2w7AaZz4RHH27m28U7Q5JQVkvM7M
	BVWmZOKUI57qqxOAyRo2bxU9V4ZylXekkjXvirWOhA/yHgKDmpfPvWEcGNPI98UbUhVDpQGSPj1nj
	AraurHFpxmN6iBCKTS5+Nairz+fbclBHHE7jqUvfaranwGk83DkJHTqzlc3v4qgbTz4pikdQVrzeq
	M3Jy9guk4+xGOZPFzn2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCt8k-00000009878-2TTN;
	Fri, 31 May 2024 03:41:14 +0000
Received: from mail-il1-f197.google.com ([209.85.166.197])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCt8f-0000000986h-1gft
	for linux-riscv@lists.infradead.org;
	Fri, 31 May 2024 03:41:11 +0000
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-374890dfd20so7867655ab.1
        for <linux-riscv@lists.infradead.org>; Thu, 30 May 2024 20:41:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717126864; x=1717731664;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=87j8o62HbkkhT6SZnt8wHJxPfsDOYjfW8V8a3wMHqjk=;
        b=URvQipjqz8I8WgjlyS17IapO78S5r5a35HAe+ToJdx9bPv5gFlXRuf0IqVMGBLyKnV
         ipUdu4EBnet/GAehxICQ9hz1dD0Gml8FAWRSwQb8RL1Gcz+KG79cdP+Nb6VFfAzLZuh0
         9Kgob1EGIVAjluyjSccWQAtNuK/mGeXB8Wa3xEWcW6pQo1e2h72rpobcmspovspFaMIU
         PXegV/7c/Ep0NPjlAmfArxwtG2OoGWfTmQzk7xwLwny2r/ratDcJAcAs77f6vAMn4QAm
         Dfx2P4mjQ39VAIJblkZa/58/Gv8HIBG7STQit6i5fBqVM1LStWTUQqssUmGEJ94Qwat7
         G9GA==
X-Forwarded-Encrypted: i=1; AJvYcCXi+tDj9HPVlg8nkrj+qU+ozUmHcW1n0xrVMtixii5nBeWEMl7bxMwioUUmHUQNpWHWW3LMn7kQ0YN4L09jZTKsPqVTEItfyL/ClexLNL6D
X-Gm-Message-State: AOJu0Yz7KL+DGxi/Z3A02XEEqTw5wjnZSMI8hBPUlcvaoxMVZxGgxzSy
	e7KV+waTs5KJTGxKQ+y4M4v1HJRANqWxMYcAVMPxBMuO755F/6XtEGtAjZjqK8PaNKvQyIkLB9r
	8K3LwpbKlfYuziSx4Jb4nUPSXphGIop3o1NXhzWdFTf9P2dmdyLtTq8w=
X-Google-Smtp-Source: AGHT+IGCsBUAVeOUsq1Bd0MSppgJvFf3Y3DrIaiDcrLOlhPfacoqnuTlaSqh8WRL67WxbHmUn3DdOa1DZgLuDjt1aCDR7Qa0FR43
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a6b:b0:373:89cf:c491 with SMTP id
 e9e14a558f8ab-3748b8f3693mr101875ab.0.1717126864795; Thu, 30 May 2024
 20:41:04 -0700 (PDT)
Date: Thu, 30 May 2024 20:41:04 -0700
In-Reply-To: <0000000000007628d60614449e5d@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000cf8dba0619b7c0db@google.com>
Subject: Re: [syzbot] [bpf?] general protection fault in bpf_check (2)
From: syzbot <syzbot+ba82760c63ba37799f70@syzkaller.appspotmail.com>
To: andrii@kernel.org, aou@eecs.berkeley.edu, ast@kernel.org, 
	bpf@vger.kernel.org, daniel@iogearbox.net, eddyz87@gmail.com, 
	haoluo@google.com, john.fastabend@gmail.com, jolsa@kernel.org, 
	kpsingh@kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, martin.lau@linux.dev, netdev@vger.kernel.org, 
	olsajiri@gmail.com, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	puranjay12@gmail.com, sdf@google.com, song@kernel.org, 
	syzkaller-bugs@googlegroups.com, yonghong.song@linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_204109_472846_7C4F7BD0 
X-CRM114-Status: UNSURE (   3.56  )
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

syzbot suspects this issue was fixed by commit:

commit 122fdbd2a030a95128737fc77e47df15a8f170c3
Author: Puranjay Mohan <puranjay12@gmail.com>
Date:   Fri Mar 22 15:35:18 2024 +0000

    bpf: verifier: reject addr_space_cast insn without arena

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=14e17d3c980000
start commit:   4c2a26fc80bc bpf-next: Avoid goto in regs_refine_cond_op()
git tree:       bpf-next
kernel config:  https://syzkaller.appspot.com/x/.config?x=6fb1be60a193d440
dashboard link: https://syzkaller.appspot.com/bug?extid=ba82760c63ba37799f70
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14e6bbb9180000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12941291180000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: bpf: verifier: reject addr_space_cast insn without arena

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
