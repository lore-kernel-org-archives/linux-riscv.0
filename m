Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0033DEF06E3
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Feb 2026 05:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lxenOpo5A+4oIhhln3m0jlZIJWatJnuvN2YXCIZHTHw=; b=Rk8pQ3gCFCnn8c
	QV4dTLmVDkAt+1Bfxam24kldULdNo/mIa1f1ojmtY+Iby/GLvpx3ku8nFoWu8Wwe3f8/u8yfZPNyD
	qPOz9qcQCFTp5vIgtuHxFxZzJ/Nd6bAYzMGCkraXU5119CBKLpd8umbYcb0ZldOMecgP6Pqq+b1Ez
	boxPX5hDiqVwU4j9BatdI5bEHfGzwGdz8j7jUm2nPquNCV3hJGInGGZLdSWaeq24GOHEH0aHN2/er
	KOkQHPHcrHVzQVIVALiWisbIPkzvGUer8aD7I6SwN3dNjukq/yuc8gbZGA2eyAgqv0CFaNhT2VV2+
	2KjDf7fw1qD7dmr26IwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voxQK-0000000D2yt-0Net;
	Sun, 08 Feb 2026 05:33:32 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voxQG-0000000D2ya-4BNC
	for linux-riscv@lists.infradead.org;
	Sun, 08 Feb 2026 05:33:30 +0000
Received: by mail-pf1-x442.google.com with SMTP id d2e1a72fcca58-81e821c3d4eso2974595b3a.3
        for <linux-riscv@lists.infradead.org>; Sat, 07 Feb 2026 21:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770528807; x=1771133607; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vYwL1EESl4uI9GdV+OkRykkZGeDMHRXuiQ8c1/130nM=;
        b=l0705n1oZcztOnPFN6108Hmvt01oQClk8CyX8p/9EJd9vH0ICDIvWiuEKfrs12Gkxj
         Va2tsGwwz4fJl4GZFPX5EIRE9c60HR7geGGSZNAwNeggYk0bliz9CyXLasAUt+1+NCGS
         zkj+XscVkRoPADfXhm+0Zi+a4mqhMcJXRs/IoGXD986QaYaUaunhiP2KeH4YCxpbkbQb
         TETh54Aal2mpxZVSlKxrkum0SWO8y7KeI9FBGOH0cTFd3qkQDsCT2B4mmASm3ChF20f6
         0WhI9fCp8VtCMan81Jxu/g9EjkQ8pNX7hjO6TIt7OylDdR0N/hrgZF6W1O01iWaOh6ZG
         eFtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770528807; x=1771133607;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vYwL1EESl4uI9GdV+OkRykkZGeDMHRXuiQ8c1/130nM=;
        b=kXOOsbpJwNSPakoq96VD/DaeHS7G6qIZ5rUDwjXxN1rohWJtTcnUChAmFaFjduQIek
         yIy3Mmn3A6r1gOhhNqzUO82dXDaBLnHQ6NKhwSJeTO0jBE7jQKbFxXwH/dBg1NT+sWYf
         Dq29MQrHABba7nxea8zOKQaRVpwiOr4vS7RWRaxAJ7d0FKVZERRG3wVzhyzoUHq02ZMd
         IFNTwG5DNOE8NMQPpiDicMokN9I2rJuvuMhftmD2ih0+eMkvFDcOIjM5l+h/8WonwMxo
         drv8Q1SdOYLyJWFMd2iwqC9i4AMaJiyA7Pb+Wt5NKXBaLSadCzOIfhW2b5UaRj913AuE
         80yA==
X-Forwarded-Encrypted: i=1; AJvYcCXRrvkewPOaQThyNDkXDDzudHNq+JJg91HV6UMINLD8a4v045X2+sx9eFq1vxKEN04LtJ4q9tpaSeH3+A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwphXaqSQXQd+cgjB/QfZjQBHioQVf/d8cexYkwHjU/c5I5lwMm
	0EzyF2DgwQO0QnlOHB6venNkm1UgTyeP11w5IRg4pLWLXaZcM7crGKtj
X-Gm-Gg: AZuq6aJYUjroDthnZM7EO4ubPQoiEiBMnTwf9ihbym+pT02cZw1S2h2RfKDKm4i1pac
	/5FKtnIdnFdZNWCSD3jXUzkPJYab9X3NPUJ+coMNUkduBZPj93KT+V3yuKs2/6lnFdvYhGTCJQp
	Qtszu2uCX/ny7IgYPjb3zdauWE7MJ3iafpgxIgamLvTvivgH5SZ0FAHEUt4UXTnY2mvd+Tln4AU
	GruBuyCvHysQ5B/WFIshefmX4BZCtZoYk3RjPO9l7gQJNjbK6qXh4imhXw76+DDs9Ho8xImRuW4
	jnfvhsItqQ7cuJCkYp7BhDIE0NWzsmT8atbP3m/52tvQ8xfWrwS5qscz1WWALaRxhzY3mXKV8Ii
	gSH7GGZw8l6ozXFSErLL+JuWsn1sBwi1gA8P1Xm1dILeUHztvq1OF3iIMs2G0jxZwjdDsYsjNbD
	fBQnjNN11D
X-Received: by 2002:a05:6a00:aa09:b0:81f:4063:f1ef with SMTP id d2e1a72fcca58-8244172c192mr7635880b3a.54.1770528807304;
        Sat, 07 Feb 2026 21:33:27 -0800 (PST)
Received: from 7950hx ([103.173.155.241])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824418de80dsm6067700b3a.62.2026.02.07.21.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 21:33:26 -0800 (PST)
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
Subject: [PATCH bpf-next v4 0/3] bpf: fsession support for riscv
Date: Sun,  8 Feb 2026 13:33:08 +0800
Message-ID: <20260208053311.698352-1-dongml2@chinatelecom.cn>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260207_213329_060292_67B3C965 
X-CRM114-Status: UNSURE (   6.31  )
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

Changes v4 -> v3:
* fix the build error
* v3: https://lore.kernel.org/bpf/20260206122002.1494125-1-dongml2@chinatelecom.cn/

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
