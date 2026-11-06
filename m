Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A0D6082BF7
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 11:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FvV5Czy+;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=vDVf485l
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WmxGt1cMCHMkJFmz/g72sT9fjI3iy1J6tLXCyOtS8/Q=; b=FvV5Czy+RgXHdHD0s+H2BWO8VL
	rRIDrRAHVPlg2FylBoJ2P5JRz53XDKuSnPaldBVUbfL14/DppAHJjy6uvbj/bENeOnLPftlmIn9yA
	vqsBy5AOx1kZqxPOq+a87tqP5YUf8FsMRcjjJDBYKOR8ofAIcXO/y7sYqrpENk91KHNkbbAGkSOy7
	dQSGLLedDz3bMMKP6xToO4hxNRiFcgsJgoMaJkkk+0N3NsO50lE1hIfiUCndQk/pXfF4t12NeyEvq
	7cUkq1PSHatM1RZWj1cxy2yoKciVfTeZbRtz3rZZvmpsO/2Jz6T28TEiIl5SvzyBLCtzgWj2lBAi0
	le+XPdrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPIAq-0000000C9cK-1Pa6;
	Fri, 06 Nov 2026 11:32:00 +0000
Received: from out30-101.freemail.mail.aliyun.com ([115.124.30.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPIAo-0000000C9bt-1BC7
	for linux-riscv@lists.infradead.org;
	Fri, 06 Nov 2026 11:31:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793964716; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=Yqjs9FxGFBp5OY6+L2rdafdj5iiRpqCep/7a7oEUs8A=;
	b=vDVf485lAtXpJo1Uq9cvNDTn6C5lmt/O2z0mX6sAvOF6aVX1ZXwZYysrobTW3mNAKE+eyZkcynov393sYTnG3Do0P+x+rhcuyT8NqzQ3eBXWcVzpeGPa0Gy5fE+njMfvOlQB4+R/SseG7BZjAB8IyxXNPxPkXOouykyMAx/5r2I=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=27;SR=0;TI=SMTPD_---0XEBfxvu_1793964708;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XEBfxvu_1793964708 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 06 Nov 2026 19:31:54 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: alex@ghiti.fr,
	andrii@kernel.org,
	aou@eecs.berkeley.edu,
	bjorn@kernel.org,
	bpf@vger.kernel.org,
	daniel@iogearbox.net,
	eddyz87@gmail.com,
	emil@etsalapatis.com,
	guoren@kernel.org,
	ihor.solodrai@linux.dev,
	jolsa@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	luke.r.nels@gmail.com,
	martin.lau@linux.dev,
	memxor@gmail.com,
	palmer@dabbelt.com,
	pjw@kernel.org,
	pulehui@huawei.com,
	puranjay@kernel.org,
	rgbi3307@gmail.com,
	shuah@kernel.org,
	song@kernel.org,
	xi.wang@gmail.com,
	yonghong.song@linux.dev
Subject: Re: [PATCH v2 bpf-next 3/3] selftests/bpf: Add a runtime test for private stack and stack arguments
Date: Fri,  6 Nov 2026 19:31:42 +0800
Message-ID: <20261106113148.3157-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <DMNFA3D0M816.2K02S8LB47QM4@gmail.com>
References: <20261104100411.997-1-cp0613@linux.alibaba.com> <20261104100411.997-4-cp0613@linux.alibaba.com> <DMNFA3D0M816.2K02S8LB47QM4@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_033158_527008_738B69D6 
X-CRM114-Status: GOOD (  10.52  )
X-Spam-Score: -17.6 (-----------------)
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
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Alexei,

Thanks for the review and for writing out the two programs.

> bpf ci is right in the other email.

Okay, will fix it in the next version.

> Also, the test runs on riscv64 only. BPF CI runs arm64 and not riscv64.
> arm64 has the same combination and no test for it.
> The run time part has nothing specific to riscv64.
> The __jited patterns pin the frame sizes that clang picks for C code.
> zero_stack doesn't use the private stack.
> It's the only reason for serial_.
>
> Two asm progs in verifier_stack_arg.c are enough.
> BPF_PROG_TEST_RUN runs a raw_tp prog. No need to attach it.
> The test runs on x86-64, arm64 and riscv64.
> On x86-64 both frames stay on the kernel stack.

Agreed, will redo the test this way in the next version.

Best regards,
Chen

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
