Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3863EE2091
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Feb 2026 12:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qL8fjV7Bm6zy0tl8aaafrcyOzcAFOfN3S5rbrYLZZTE=; b=nTe6jv51O4eGX0
	omKOnOdHoNoanmYtyunUYC7vdnHgV4ao3dz/rvi+GqesqrZwwht7kIFn/sX54BYzWYPgr+mwUXUzE
	s1TKTinLi5+o56V1suvUR0w8l+eqrzjYSH4syKFfGAA4V+T7HrNnJ/PYUJpkO0G4HCOJUKRmECY72
	KUeJ1GiJ+LXULkdHGX4pw9Xwm/xxpST9fDmR5W84bZNfvyqYla70GBy9sfJgHEKFPlOmV6ieySxU1
	FowG5h+7a4aj1OL8WvJGOi6qnteKVVMf36LpjwRQretC3veB3Ys4qR+fyjb17d506If8qgeNFQya2
	QSbIFacYrhSDIiJyTrQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voKp5-0000000BILa-3h6G;
	Fri, 06 Feb 2026 12:20:33 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voKoz-0000000BILF-2kFI
	for linux-riscv@lists.infradead.org;
	Fri, 06 Feb 2026 12:20:27 +0000
Received: by mail-pj1-x1044.google.com with SMTP id 98e67ed59e1d1-3532aa9a77eso946101a91.0
        for <linux-riscv@lists.infradead.org>; Fri, 06 Feb 2026 04:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770380424; x=1770985224; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aPUwOK0qT9Cn0VNf/dygSumLmGtU9fWTdZD3I+SEn5A=;
        b=V/UlBJGt7mvCIUNPzuBGhatKssZUscFRr726ADucW46haCnvRQb/0LXH2JZjGZlWgy
         aUGBO5iC8/RLS1aqlgHn+WxjrKs9FtSJmYl1zl0C0VAdH+JKsF3Z8tt7mb7QWDiyg12J
         OkKo1qPfWeOh2YyxM81ba86l9RJcBUbXwPeJZ6Wn8q09pmZBeNl0pnU+NbT52Nnqu21F
         umh6ws0NqbT4GMBfwGnsPOkh5FtJTVQcC/6tl8AttEskuIMaI6qR+c3P5aA+2YLRY6sE
         b+CyRZ4C6cM0dAq6amcKX0u+ibqpCiaskrUH/zEv8VFjUVoBLngi4SUr9cSsdJW1TbGS
         3tMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770380424; x=1770985224;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aPUwOK0qT9Cn0VNf/dygSumLmGtU9fWTdZD3I+SEn5A=;
        b=MUuKbX4WJaQmHEseLZdCfX1YxC1T2N54+VHNoSPloOsVJFY1LHxYynu9yNzCQL9wCb
         Dx6MPIeIlFnTok8PVRpH/oysrhH2He8uBwClHm4d01ZfZb9W7MqtUYOhC3HCbDNUKIz1
         EbSjj5SUyFdBeGiA9kDWHHthvmNmaolcmW60MBt8y5AFHlknHC1TBSqNZRflYPza4Wgd
         44SZalw/87reqkabOUhPRiCp3wwH5Xsjuc2q716o3s8JKtVsAdfuiK3hu6sEkiQc6m20
         xAw1TFMR7PWeRTzBbF2xw7F3Dr1cf+IkHxLbkJiFm9kijA4tVSS5sFmLedVOj59hYL9D
         bWjw==
X-Forwarded-Encrypted: i=1; AJvYcCVuOFqzuSt+vp5OlXs2+08Qe7MRxGynm6CKMfY6BbY49ZwCShSIP6FqgRAgGtVZqExpeCkhEOqFKxEHfw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyKJ25ReyKDDVJCvvPmLC8h0Ce1s79XCnak+HqF8NvvdK1eO04f
	/DVcJT9z0sgZAx2gprO32b1Vl3a24rPbG/1MvwlvRqrtnYqnIQyWOSaJpOIq/jr8jH4=
X-Gm-Gg: AZuq6aIEf4oPzGV8VsAcAdFZ2NOcIUW5nXVP53lZVKn8hCZDcRGcM+/RsbgQvMWk1m/
	EMloQwLxa4g4rqgtFacEEWWBxZWWNQ8m6wKQo1sIE5d2f+BjnoYbBKElw4vVPCCDn2DhnQmunUn
	jr9ZVaH+fUOQaOckKBs0qw56C0Pd/TR+OgBFqjvtkjzEdlNzZOYEX4TRWVcNCoAjkAPWLNW/4KD
	SIoGqIdff9X9X58fbNQpYl4bGYmJ0CrfvSFtoqEJa/ZULiZARZSd3sChL68WPRyg3xeCYxSVXih
	kI6hqFxsjHU1xgFGK1/A+FQOJVdJPl0hS8QZk1ICU/RanG9Hc0dEXphqBkZ7hfVODEVgqGWJlog
	wFPXjdudBhX0I4EcIFu9E9Bpx9W+iSPmSg1bQFKhvymekbLSVD9NO0Lbvor5nY4SrC3KuQmvv5c
	hBW3H2nefO
X-Received: by 2002:a17:90b:586b:b0:32e:3829:a71c with SMTP id 98e67ed59e1d1-354b3cad4acmr2416618a91.16.1770380424537;
        Fri, 06 Feb 2026 04:20:24 -0800 (PST)
Received: from 7950hx ([103.173.155.241])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-354b301d93bsm1528222a91.1.2026.02.06.04.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 04:20:24 -0800 (PST)
From: Menglong Dong <menglong8.dong@gmail.com>
X-Google-Original-From: Menglong Dong <dongml2@chinatelecom.cn>
To: ast@kernel.org,
	bjorn@kernel.org
Cc: daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	haoluo@google.com,
	jolsa@kernel.org,
	pulehui@huawei.com,
	puranjay@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jiang.biao@linux.dev
Subject: [PATCH bpf-next v3 0/3] bpf: fsession support for riscv
Date: Fri,  6 Feb 2026 20:19:59 +0800
Message-ID: <20260206122002.1494125-1-dongml2@chinatelecom.cn>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_042026_608547_3763D6D4 
X-CRM114-Status: UNSURE (   5.83  )
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

Implement bpf fsession for the riscv architecture.

Changes v3 -> v2:
* fix some comments.
* v2: https://lore.kernel.org/bpf/20260206115823.1070354-1-dongml2@chinatelecom.cn/T/#t

Changes v2 -> v1:
* use bpf_prog_calls_session_cookie() in invoke_bpf() in the 2nd patch.
* v1: https://lore.kernel.org/bpf/20260203055231.1088479-1-dongml2@chinatelecom.cn/

Menglong Dong (3):
  bpf, riscv: introduce emit_store_stack_imm64() for trampoline
  bpf, riscv: add fsession support for trampolines
  selftests/bpf: enable fsession_test on riscv64

 arch/riscv/net/bpf_jit_comp64.c               | 97 +++++++++++++++----
 .../selftests/bpf/progs/get_func_args_test.c  |  2 +-
 .../selftests/bpf/progs/get_func_ip_test.c    |  2 +-
 3 files changed, 79 insertions(+), 22 deletions(-)

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
