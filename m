Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BAF4EE2084
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Feb 2026 11:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=83AdtRZjEPQNa2SQc6Q+qa7VO/hx76bw4EMVJBxco9I=; b=J+qdpbfN4dV55T
	x/LzYter4lBEXStTOMsOXGvk0Gws83VoVWjl+Y/a8Pp0fAyWAYypM+BxFOq5VJUPszE3uUDSwhd9m
	T3INjrykhQ2vtq8SpzWWF7YHTXWXSdNn7q23N1t6wctj6heM266LuDVbHSVAEdBA5Emdu8mfF7VRA
	Z8BQA86Dkb3/rVKJ9Lh0EmiSmm/Mh9/sdADy8++iZeoaX9KuT1ARycx/4xqOXlf2W1tggfdn0UCU6
	p75Ln8O90HiSfTN8IOwjnIleKl5C14CL38tnMt1mg4ZUGLmgyLTHKqyqaWNKdYEJtTKUWEC/YUPd6
	MW1rbk2uSSbF3MSmdeMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voKU1-0000000BGd0-17cg;
	Fri, 06 Feb 2026 11:58:45 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voKTy-0000000BGch-3847
	for linux-riscv@lists.infradead.org;
	Fri, 06 Feb 2026 11:58:44 +0000
Received: by mail-pl1-x641.google.com with SMTP id d9443c01a7336-2a0c20ee83dso17186275ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 06 Feb 2026 03:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770379121; x=1770983921; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BwiHVlaKsntpUJzB9dI5SHd2dWcYWLOEu8oB1qgtOsM=;
        b=Di06hCtY5D0q6U/lTWRE8vWhKQFGWqIajD/MT6xbsDTO/WAWRCXm0i3ypEFqEweWNS
         seDmgMvtXwJ/m1PccExQtLOjiNX8gfJEPxbr7o3NRA+eMujg37IE45GmbxCK32ogQmMN
         ya3oad/+sY2EUmyRio7dXb0oomIeRBqSElXmrRpMottYef5lmb0Voi468tXg0j7SRYwG
         XFOIj0oFldPmllVDnLiZOMCa8S9c+iYGb84xrW2EGtQ8nBAKVekTGLFvXwqN9itIoR7G
         hnTr4mINfKSnlaKUqTmH7popJDcBGz6lsf4lqf80F0BarGzQ6NXyFF+mVZgmCI3qRpFq
         95lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770379121; x=1770983921;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BwiHVlaKsntpUJzB9dI5SHd2dWcYWLOEu8oB1qgtOsM=;
        b=toONbTKbJgJ/MPwsVj0lzvjq0PWdH4BKpyw99XrveAn7Dc8MsDR09l+E7JHHKLBenZ
         YAHYC5e6bjrtuiDWKVge+zZyFCZAPBGBXesufLninBlb4+Gp+vQlRUlGVzdonuMToiH2
         v/sLIOP2qHx8gPVHVAQxnGcbR65t0c4ZrADDhzqH0+z7r/QFLrB65Ah7CmYwioL8Wb3K
         qHWThDoLAAZYZLhsdWgL0UGdWL6N9ZepgnVDGuY3r0WVAV+QtNidahZs1CTbNqm8Pkwo
         LxopbKEhJtpAjIo61hYWT/H3HXPojvXWpo+DjFBCOA4L1P0u5+CoFUxiobnNzy74Wi2S
         M15g==
X-Forwarded-Encrypted: i=1; AJvYcCX9CvzMXldNtCRMtpWSeWFN+s3MBClou3OEMINAYV8sPrWGCXf89DkvFLeZaai4DXJim/66NpJCE89tjg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwJEXLJyizKP+JJzb0wHsAprdumU/cfjnBKivXHiyQTLmXSON6I
	jUVVERsKvaTbtxs/pkjaumtgJH5QOujDRCJbLDjXdNf8aKOr27Jg4kZ6
X-Gm-Gg: AZuq6aLznGI+SXxyntV70CoSsMbVlaqW22F/bxDjxGuwINDqQT2PfM/7bVlnpr58K0+
	uWB/L/FerJq5neEjFtlnkkhF2HdoHbv+sq+WHX4JOSMYi+PFP66+N1ELIV+PKfUv+8CVFUoYOov
	JFyITC0fcNLHFVuGh6C+fYegm7sl8RCRS7K+4QGVBr9wGnnkOYzL2lRStSlIvlQpg/cdOwMO1fL
	dqUY+MS6DaeKXADvTqo0aRC/1Vn8u/aB0HJHB5HL06c91nDyFBzwkeVeBesePz18uXssAYUlURE
	OMSSaUosKv2G+/0uF+PAjXQbvwFVcZIQb1Cr5UV0oEHddKluksQ4w1Ln6syRGC0ZWv44yEcMjs+
	Zpa5CZzgomcird5D9gtfMqtzq6zVCcJ+cLJBXwMEi3QZu1KHNMSxaT7hNPMVlOi8rFm3sBmBfmv
	XC0pPkT+7h
X-Received: by 2002:a17:902:d504:b0:2a0:b4f6:5595 with SMTP id d9443c01a7336-2a95192514bmr23739265ad.50.1770379121168;
        Fri, 06 Feb 2026 03:58:41 -0800 (PST)
Received: from 7950hx ([103.173.155.241])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951c8ac5asm22856395ad.35.2026.02.06.03.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 03:58:40 -0800 (PST)
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
Subject: [PATCH bpf-next v2 0/3] bpf: fsession support for riscv
Date: Fri,  6 Feb 2026 19:58:20 +0800
Message-ID: <20260206115823.1070354-1-dongml2@chinatelecom.cn>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_035842_807257_1DEDD6E0 
X-CRM114-Status: UNSURE (   5.91  )
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

Changes v2 -> v1:
* use bpf_prog_calls_session_cookie() in invoke_bpf() in the 2nd patch.
* https://lore.kernel.org/bpf/20260203055231.1088479-1-dongml2@chinatelecom.cn/

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
