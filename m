Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89195606D80C
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 11:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gGmFA7hH;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=yevr9HYC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Jk6CyiihxdMGgd7+7Jm77Cvo2vHXmjrAdHXb2w6OkPo=; b=gGmFA7hHDMaxaFyoklZOTiSYA8
	Kb+9dKvmfL7aBKWp3HT+/bxvfz9YaEcAWLjMDUHxQXC3sVx9l/AOQsDHEVXU2GAlqevCdBZOS4UNc
	hRvhPBrEwf9fMcfafvV1AK5wkDEuXJD6qylDNc3SadIDNZxuSMokqd+HifiFlL0JlyJJQfOuYDsWH
	m/DPIO8tf0aoWg4/5NnpgOiMUUetZ6LIiG9mV4ILxE3IH2jpW7Jo0jYBCjOGgeOi4ECJBVynVDfqO
	SYy86lMMEkAxchlj+yDvFubjIEGHEIJiTfFaFRdWyt4bVyGQhTv3yVAVPlkT6AqiLgPKXMPZYk6n0
	Lz90kwmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPI7i-0000000C9JQ-0EtC;
	Fri, 06 Nov 2026 11:28:46 +0000
Received: from out30-113.freemail.mail.aliyun.com ([115.124.30.113])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPI7f-0000000C9It-06ed
	for linux-riscv@lists.infradead.org;
	Fri, 06 Nov 2026 11:28:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793964520; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=x4bVUhjHWKbLWf39GdnghFqz7Ddc3DEd75LdHRnTlSo=;
	b=yevr9HYCCHSkHhvjH2vgfykb87vm2x4amggXnyuCc5Ox4PJNqc3EOCk1fxSyNaLbQp7xfSRLVhluety8FTN/5jkFVpFA5YUKqH4QON/NUcknEDuUcI0M28kil+60qGzAxhPZr8CT3dBSiytywlEr42HyI0imnl1++4igjTLx8dc=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=27;SR=0;TI=SMTPD_---0XEBfx5X_1793964514;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XEBfx5X_1793964514 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 06 Nov 2026 19:28:38 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: Pu Lehui <pulehui@huawei.com>
Cc: alex@ghiti.fr,
	andrii@kernel.org,
	aou@eecs.berkeley.edu,
	ast@kernel.org,
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
	puranjay@kernel.org,
	rgbi3307@gmail.com,
	shuah@kernel.org,
	song@kernel.org,
	xi.wang@gmail.com,
	yonghong.song@linux.dev
Subject: Re: [PATCH v2 bpf-next 1/3] riscv: bpf: Add BPF private stack support
Date: Fri,  6 Nov 2026 19:28:31 +0800
Message-ID: <20261106112834.3118-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ad060270-6e32-4dcf-9830-6d2ffbfc0783@huawei.com>
References: <20261104100411.997-1-cp0613@linux.alibaba.com> <20261104100411.997-2-cp0613@linux.alibaba.com> <ad060270-6e32-4dcf-9830-6d2ffbfc0783@huawei.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_032843_227612_DCD1A76A 
X-CRM114-Status: UNSURE (   4.16  )
X-CRM114-Notice: Please train this message.
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

Hi Lehui,

Thanks for the review.

> a nit, let move it with the PRIV_STACK_GUARD_SZ macro.

Will fix it in the next version.

Best regards,
Chen

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
