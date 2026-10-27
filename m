Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895D0606A31D
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Oct 2026 06:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eBF3Q6SZ;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=b9SUelzg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=UK/JWsLTTx+d33AtEPx1iYiGQaJOYnPB+v4dA9d5DIM=; b=eBF3Q6SZdJKyBhE0YXDA6eVJZh
	NxZfBGxJdje3tpiFn85iiF7G0A1chhX5Hn+8e6pd/O8hcfM/7beoPMgbB/3r3D1HitCdf2IEvhZ8y
	2bdjANurn1c+naQ6wX0NoYyUMebQOWDt2hYjS742SrWMHYMeFryE5LeNn67DLSPW9FAAfSI1tBZ5j
	Fby7TdkwWtmzc/Bm8m5cf1azHYHq4QAZwKH99mFy/xWPgsmO4Du3FzyZa7Xusj/Yv0N1xqv9RafQA
	QDBVUby2CEZOenUSr8FJt+bXOCKZDp2AJDChRHySfqvKt+HUJpxeYZipHspxBgDUyIC8cIx3YyYy8
	exVP3L5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLan4-00000003qGy-0JVI;
	Tue, 27 Oct 2026 06:36:10 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLan1-00000003qGG-1lIf
	for linux-riscv@lists.infradead.org;
	Tue, 27 Oct 2026 06:36:08 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-8a07025cce4so2478015b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 26 Oct 2026 23:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793082966; x=1793687766; darn=lists.infradead.org;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aZp+29bWJnemlJ9gnuNYF6ybAmwjMMYwBmFx7KL7rmE=;
        b=b9SUelzgjQWuZJVdlz65m99Dc1D91+73Vy2fNKng3ycbZRZ/VJqxRHyUGZC7RD2JXZ
         TxXN7Cvr1BjCxSdB9BCSb2cQbaxP2mH3QmCRTK0c0QLTst1gCIRh16ramN7DVWyG4dha
         SjVvxg9ZJOqQft7nMOEPSWDdwZzvUExAyMR+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793082966; x=1793687766;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aZp+29bWJnemlJ9gnuNYF6ybAmwjMMYwBmFx7KL7rmE=;
        b=0/eDEIiM8J2zdlIm2vco3ODDZheMR/wdxtn7YXYQpcl5Sy75UemZAtx64fgF3CJhiM
         UdJf0xT2PYxQDSJR/ThPE6K8qKV0T+5CQpwCa9mQ5dcOPIgMVXiZrYxsqEKdTeYQAwOT
         gh+nVmK3PYrEZAEKwc0t1XeE+kJ259NvnTsjfvYZJfrSGM8np2FZzl+Xrz39qJ7hsrV0
         XNAkOUGFHnwcGrIzUs7upjUVKRdTTBDEhhkEt0PjacUxG5Km87GeQVUQSBShrfDWCm+q
         r+RK3IPHMMWB7oVWZ0B+EdXFr55rHYbE2T0CI31MDkqf3ouy+pGXpGytH9KjQAnt0rWu
         F4/w==
X-Forwarded-Encrypted: i=1; AKwUvByuUfNIa7j53Hk5+HxEZ3vr6S2ihx599KLab3wO2EsV36CefV8z1z+Ydb4oXQqPSg74qcpE+bmJpG8PXg==@lists.infradead.org
X-Gm-Message-State: AFq9FYJcm0YiptunF+yqZoLuRit4whI3Dh2lfnUH0JazWgVKGZ1oICmZ
	c/kzaTUaxk9xMaCdXNv1YvKA6tWKk/2KJ/7Upg+KILqMptNdg349o6/3RkPD/JdN5/4=
X-Gm-Gg: AYBFou1K3aHfRjI1hoS3dsnZw2ZgxtMLkZKs1dlES8D+JVcFTgsF5hq+8AaGLOADLcF
	UMQUR08U8+/b0ZQNRgLhl2/2Cm8f0U1D0eBVJNeZCbNU4bkO81ZA6BVBVvxLqPbiHooJfDbFunw
	7CxzM4DYTnJJH3BjQk7EXTb9pBD+cceVXSxzvpsT8fB6D3URIKo2r5h13pFuLY9QX+lwoXvSvFh
	QtkmAQecfmU2Osg1Ix30i6GC6oC7oqurfuNwOLma3bDJGWgCRSMh504oeEFO1w8OYTx1frMoxV0
	r7p4oUVee+kiheEPx3Vdsj+LvtsMWvS3PWfdfKj6c+L6kqQ9kSIXwRi50YbXCsVu4ZZGnVej1qm
	rm4uqU7e2je/MUs1SlD3xivWEc48KZ10T5slaOQRI4542Hod6nOmrNf1st+7cmdKkA/c2Ri2ii0
	trj1to04RIKZy05VPYiF+QiMUyHO/JYnqdlNrjzfZUx+peBLR6EY7vsUiDvcd489Pk9ZawF6WaN
	k2SwPrt6GvrsAdDhuplx/XF52xmbjEfgmBpfcv2WqUc4v3HQ5dXQy6DvW4kJtWG6Td+acJvI6Vh
	lJJ4dVjCza9bQqTASr82uMpCx/vbDJ2IYFACyYeeqFB+IYTXZF876Op4TjM0X4qSGW1LyEQAsoD
	EHfpEFGoi1J+mF8bKlPr0PuA=
X-Received: by 2002:a05:6a00:21d5:b0:899:e80c:1ec1 with SMTP id d2e1a72fcca58-8a367a39106mr7234616b3a.18.1793082966170;
        Mon, 26 Oct 2026 23:36:06 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a368d87afasm2004475b3a.7.2026.10.26.23.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 23:36:05 -0700 (PDT)
Date: Tue, 27 Oct 2026 14:36:01 +0800
From: Chris Down <chris@chrisdown.name>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Kees Cook <kees@kernel.org>
Cc: Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH 0/3] Make the scheduler stack end check selectable at boot
Message-ID: <cover.1793082868.git.chris@chrisdown.name>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_233607_461875_DE9B0418 
X-CRM114-Status: GOOD (  11.57  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

At Meta, some of our host types enable CONFIG_SCHED_STACK_END_CHECK, but
we don't want it generally on because of the extra work on every context
switch.

Right now this is only configurable by setting the Kconfig option at
build time. Let's make it so we can also select it at boot with
sched_stack_end_check=, so that those hosts can share one kernel image.

(Patch 1 is a cleanup I happened upon while working on this, it can
also be taken independently.)

Chris Down (3):
  sched/core: Skip the shadow stack end check when SCS is disabled
  sched/core: Add sched_stack_end_check= boot parameter
  lkdtm/bugs: Add CORRUPT_STACK_END to test the scheduler stack end
    check

 .../admin-guide/kernel-parameters.txt         |  8 +++++
 drivers/misc/lkdtm/bugs.c                     | 21 ++++++++++++
 kernel/sched/core.c                           | 33 +++++++++++++++----
 tools/testing/selftests/lkdtm/tests.txt       |  1 +
 4 files changed, 57 insertions(+), 6 deletions(-)


base-commit: b99b7f60c5b473d374c68b53753153b4aa9e0702
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
