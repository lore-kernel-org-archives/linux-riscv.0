Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E34BCDB470
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jun 2026 07:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oOSumhpgHqLOMMlXUixiw6lTXfAhZLoEGV2bwgyUHdI=; b=bYnuuNyRnqLVHb6fW+2BuUXkPY
	5effwGa3VjciMdV5p7YH64d/vCFA3MYiS+2auPKRm2bkTZnPQJzIxJ+pMhu2a7Ob7oLwIj5Ow5485
	F0ofNK409TPtSWZqh9eNjCNsfdeOm8EmCVxCZ7z/gf3L7Hn0lbQyxSgKxsB6hVF8nJ6ksBDpfNGoO
	U7+yLQW2JD6Uj4t5zEQ+uyhyvlnbqz5mpnW3WlY5XzfmYKneSrWCXEa1hcAQK4iJUiVokLhHhGNVo
	OYsw5pmEmv/mdHG0MLQqsuxd/CJs8JDC9nWDYm+/lRiHx5c1dI49cM6moLVZfPF2w8lP3s+JJZt9w
	lSCKFG2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbw1x-00000005rq4-0Ho9;
	Tue, 23 Jun 2026 07:58:49 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbw1k-00000005rpE-42dh
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jun 2026 07:58:38 +0000
Received: by mail-pf1-x442.google.com with SMTP id d2e1a72fcca58-845537740ddso2032802b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 23 Jun 2026 00:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782201516; x=1782806316; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ek6r0TkIKR0tiCQ28suwzM5bkNpctpIQyqr76NBcjWs=;
        b=ZRG/pbBJpEzZf4PYI8Ibmujh+75dZt7XqAt9GUsvboy4pPRiENPHISNmiOYQ7e6X0s
         VOFsCc9uYcfYdDb0UsIbg58IOpv6EaEjP+pWgVTL7yZp/fp/Jf41D/Qx+ZLI8qzYmvcV
         kv0yjCoBmcwnUyUFxodKuz4/lJQmZgOgmBaPbtEb4sXTBkxYRUR1nvGXlFlwSUASQ+gf
         l5tauq5GMhYtNmhbQds/QfDBhR2jIGzma4ZXww1eWPIdbsci01uBw1GgOAaFlzuqZZJn
         nFd16Fe7JK4QCzAM0PohTCUbdxbFUyJqfVBmi4zYeMdqZs3A5BZMUGeFohpDA21I7glt
         UaEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782201516; x=1782806316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ek6r0TkIKR0tiCQ28suwzM5bkNpctpIQyqr76NBcjWs=;
        b=N/4IwwY2ZQVTepoAJdesrx65mtxRsw7F5B57+fm4agQjclAawcbiZSJoObQj7IH9aL
         YeYdUfM+C9BJ4ESxtdFQH1uwM7DPetgzmsJTxwf2VtnwfWEnF7206xOso1ZEFlFsRqZy
         jf9Kyy8uyxO8M5qxIXLARyEtVMkWNfxytejRGoVY1CHHIWjCTZgusugNOutogbQ0lHck
         T4DLR/Vw/T/6EtYDG0+zxWsF6aF9MP9UO+MUn3GLs6XNPiNfD0LC5yP94Z6ssFw+1obA
         jgmVRxTEiW9xBwQn5jffHaFwtUP1Zr1bzIMxjpcwt42PR6AG4GC1gbRh+/YtCT8K16ml
         cw2g==
X-Forwarded-Encrypted: i=1; AHgh+Rrwlu7p95dVnrl6bjwepWKjgflULPEFAwxOD/PBu0zFaESp7yq1wB/681Pve5inFSFB6VP1r3fnwQR7dg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzDwKfJoDf20+tlnOAu/HlnLINYWXJ+Cmz33DVg+x3G3R3B8mIM
	JdPVhew98MKPbNa75IQCS70pXAb8tkUVk8BTudmaEsl7EVb+kOdZ0Pd7
X-Gm-Gg: AfdE7ckDrtXclGDuZBLXCUgPFiwUokBEBOV3zbtd6ZKfjCGQ0uU4iZdQJiaOnqXpqun
	cnil/Dipl3D34omucIaUS01vWjb0d7dttXcAO/MGtrSJNpVyVl158vS6rvnYEUbmwqwpL6fUzR6
	Z7cBkK77dJMEZyUuq1ONFx/TpGt095+BfkNoRWNCITzr1Aos4QqUxo9O66ZB+OTnzx/3xMF0nzA
	YrWFJVQ4KIUlXOGI8FZA56AzQLjMaDulY3xJ6MgWp9i+OR+rYdm6EIitKv9xyZCGAAETAkRK7TB
	tMSjOWrpKjK7eBNofBKBg9P16CBVRGmAAsSHwncALcDFGoGnaKIBv3xUkYHAf/T2rwsOyFw6oWM
	0aJeMVS2DtlsRPBFjL7DwUpS0QAn4cL2pxjYR9dGnBt6EJxpCDPDjg5GIQQ5AMwuwn2rJTAKu71
	sxpLJNqSRsWtma7FkA9ZVQ8wvbkW0hcHQNhWeQtA4T
X-Received: by 2002:a05:6a00:1707:b0:838:29b3:9ed1 with SMTP id d2e1a72fcca58-84550900333mr19117203b3a.41.1782201515623;
        Tue, 23 Jun 2026 00:58:35 -0700 (PDT)
Received: from zhr-ThinkStation-K.mioffice.cn ([2408:8607:1b00:8:ede9:3e72:37cf:55a2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564e745besm9355930b3a.28.2026.06.23.00.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 00:58:35 -0700 (PDT)
From: Hongru Zhang <zhanghongru06@gmail.com>
X-Google-Original-From: Hongru Zhang <zhanghongru@xiaomi.com>
To: david@kernel.org
Cc: akpm@linux-foundation.org,
	baohua@kernel.org,
	bhe@redhat.com,
	chentao@kylinos.cn,
	chrisl@kernel.org,
	jack@suse.cz,
	kasong@tencent.com,
	kunwu.chan@gmail.com,
	liam@infradead.org,
	lianux.mm@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	liyangouwen1@oppo.com,
	ljs@kernel.org,
	loongarch@lists.linux.dev,
	mhocko@suse.com,
	nphamcs@gmail.com,
	nzzhao@126.com,
	pfalcato@suse.de,
	rppt@kernel.org,
	shikemeng@huaweicloud.com,
	surenb@google.com,
	vbabka@kernel.org,
	wanglian@kylinos.cn,
	willy@infradead.org,
	youngjun.park@lge.com,
	zhanghongru06@gmail.com
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page fault performance
Date: Tue, 23 Jun 2026 15:58:05 +0800
Message-ID: <20260623075805.466317-1-zhanghongru@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <3be9475b-0e8a-4df8-a130-4262f993973d@kernel.org>
References: <3be9475b-0e8a-4df8-a130-4262f993973d@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_005836_995171_E2098DD5 
X-CRM114-Status: GOOD (  14.45  )
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
Content-Type: multipart/mixed; boundary="===============7361487183429230371=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7361487183429230371==
Content-Transfer-Encoding: quoted-printable

> On 5/20/26 23:15, Matthew Wilcox wrote:=0D
> > On Thu, May 21, 2026 at 05:14:20AM +0800, Barry Song wrote:=0D
> >> My understanding is that we should not blame applications here. This i=
s 2026:=0D
> >> there are basically only two kinds of applications =E2=80=94 single-th=
readed and=0D
> >> multi-threaded =E2=80=94 and single-threaded applications are nearly e=
xtinct.=0D
> > =0D
> > all of the applications i run are either single threaded or don't fork.=
=0D
> > what multithreaded applications call fork?=0D
>=0D
> Traditionally the problem was random libraries using fork+execve to launc=
h other=0D
> programs ... instead of using alternatives like posix_spwan (some use cas=
es=0D
> require more work done before execve and cannot yet switch to that). I'd =
hope=0D
> that that is less of a problem on Android.=0D
>=0D
> I assume Android zygote might be multi threaded? Maybe sshd as well? Syst=
emd?=0D
> But I'd be surprised if there are really performance implications.=0D
>=0D
> Not sure about webbroswers .... I think most of them switched to fork ser=
vers,=0D
> where I would assume fork servers would be single-threaded.=0D
>=0D
> So, yeah, getting a clear understanding how this ends up being a problem =
on=0D
> Android would be great.=0D
=0D
Barry asked me to share observations on fork() usage across Android=0D
applications.=0D
=0D
I wrote a BPF-based tracing tool (kprobe on copy_process, checking=0D
CLONE_VM to distinguish process creation from thread creation) and ran=0D
it against the top 200 Android applications in the China market during=0D
normal usage scenarios.=0D
=0D
Results:=0D
- 82 out of 200 apps (41%) call fork() during normal operation=0D
- Among these, some call fork() from multiple threads=0D
=0D
These are not zygote forks =E2=80=94 they are fork() calls initiated by app=
=0D
threads at runtime. Examples by category:=0D
=0D
  Browsers:     com.quark.browser, com.UCMobile, com.xunlei.browser=0D
  Shopping:     com.taobao.taobao, com.tmall.wireless, com.achievo.vipshop=
=0D
  Video:        com.youku.phone, com.qiyi.video, com.hunantv.imgo.activity=
=0D
  Social/IM:    com.alibaba.android.rimet, com.ss.android.lark=0D
  News:         com.ss.android.article.news, com.ss.android.article.lite=0D
  Navigation:   com.autonavi.minimap, com.sdu.didi.psnger=0D
  Finance:      com.eg.android.AlipayGphone, com.chinamworld.main=0D
=0D
This confirms that fork() is widely used in real-world multi-threaded=0D
Android applications. Since dup_mmap() needs to acquire=0D
vma_start_write() for every VMA, holding the VMA lock across I/O=0D
would risk blocking fork() for unpredictable durations in these 82=0D
applications.=0D
=0D
Tracing tool (two equivalent implementations):=0D
  bpftrace:         https://gist.github.com/zhr250/bf4384202d598bb4cda71cb9=
902f15ab=0D
  libbpf-bootstrap: https://gist.github.com/zhr250/76189bdf51bdc8818500e4c8=
917c6493=0D
=0D
Analysis results (top 200 apps):=0D
  https://gist.github.com/zhr250/06f51092c84a49c602a55ac3d186e9ce=0D
=0D
Hongru=0D
=0D


--===============7361487183429230371==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7361487183429230371==--
