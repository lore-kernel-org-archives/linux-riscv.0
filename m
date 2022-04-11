Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB0BC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Apr 2022 10:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QCzlzcx9rnxVrD0hxMwEhk99jTtmqFeyXswFMgw1TqM=; b=UaFB73cfPixpta
	s6nVVMamOKJ1vo5kX5DyvvH+UO559y9cmDsEqnKzS+IxmDwr3RAloEA87fFC3ap+2xr1wPoudH2nq
	+H7TOTH+eq9gIV5Y9UZV+itunLWInVAvrxcSoSRFEtCa+7cl4PKf3WO26GmN1z6TTEaN8SqQBvJ5e
	jlxfuG81yg7WJLcFa1HEXgomDy5s8OCa8ZzCFQdwfv8Q4ifMI9iL2biHXez7WNkDeKg0icy4lPpKg
	MSBa9OMFzx4cwpM/7/Eq530h1Jzj6d0OpfgQ3ra7oAQCvtCncDJHDY9EmCZbvMJP8TiI11fdQpHNq
	r7gmqoDzSNLf/2SO3s/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndrhx-008XL4-22; Mon, 11 Apr 2022 10:55:45 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndrht-008XIn-Ti
 for linux-riscv@lists.infradead.org; Mon, 11 Apr 2022 10:55:43 +0000
Received: by mail-pj1-x102b.google.com with SMTP id
 g12-20020a17090a640c00b001cb59d7a57cso4800372pjj.1
 for <linux-riscv@lists.infradead.org>; Mon, 11 Apr 2022 03:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BBbu++vBSNayZTILSoy+5ZJkZ1mpzPQD8VHz8a8sGvY=;
 b=XFXMbOusHesZHA6gwQAvFU7HTZpIvsbKmvIEG8F8zrsAIuW4QppeuRRX/AH70+9QbL
 wwH+qqogb2oMVb58vJkBeFBKHZ87O4PwsLqWNAh2mxVWPHAdRUBquqmy/W2JBWlzSra6
 ICrpFGApKTkyVje52v+ODM1+IMky3gMRw/OSVx3bjEl4uYyBO90j5ZcOQantpEpWEScl
 bexqOzHRAKyG2ue79HiOBCWz0ql6Pxg/jh32KvzbeQWVKoeyxv7OhjAKiQhccBAJF5/8
 5YXJ/541f6GllOEL2FtGZ28uWkTPPVdLoB3o3zn6SW+Lu/2MwAhiGjqS8ntRBr+3Y8jy
 QCvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BBbu++vBSNayZTILSoy+5ZJkZ1mpzPQD8VHz8a8sGvY=;
 b=ErJpgP97VdVrai+lkBzBQsvfET/IVhRNHRJ1/4tqGJfcdr04GBs1OEWbN6ShwAfBXi
 XOANTp4BPbtbyIdPPruOe82ambiFtgHA06cQh7BSxtA5SbnmVRbJMS8XVIpQ0TPUYmQg
 z1/5cWmE5bb81scdTuOC+kbyW6UG/0RU+9iQUO/iXN4kQXEWZFeSZ/0eqerRe4J9ig27
 jLZ/JKhmhEN3GTF6a3jrota/QhN1OTOmQVh46KlEv33tqG2TZvAiLbkTv9DKgcqao6N+
 sf0EZDQiPbXKVV1KJOS3oh0JD5rAvdfeSmGKq/2oKHNgkuW6DegX++9iipic3GVIE+rH
 iYug==
X-Gm-Message-State: AOAM532At29v+QpAZ/CRlRh9Jvr1X0QW60Kk5KsWV7mrPjmfLn3rz3SR
 yrMxc0Qjfz/Hi9s1wFe8siPp0g==
X-Google-Smtp-Source: ABdhPJwARghM2rwkZJdJicDl1OJ5uhAhOFscb86n6xacLMoXCE0Z28GOKLMOOp6KjpmRJb30QFSQ4A==
X-Received: by 2002:a17:902:ab8b:b0:156:16c0:dc6d with SMTP id
 f11-20020a170902ab8b00b0015616c0dc6dmr31826900plr.147.1649674539339; 
 Mon, 11 Apr 2022 03:55:39 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 v26-20020aa7809a000000b00505bf88a17bsm3496127pff.214.2022.04.11.03.55.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 03:55:38 -0700 (PDT)
From: Eric Lin <eric.lin@sifive.com>
To: peterz@infradead.org, mingo@redhat.com, acme@kernel.org,
 mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org,
 namhyung@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 iii@linux.ibm.com, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	Eric Lin <eric.lin@sifive.com>
Subject: [PATCH v2 0/1] perf jitdump: Add riscv64 support
Date: Mon, 11 Apr 2022 18:54:37 +0800
Message-Id: <20220411105438.21366-1-eric.lin@sifive.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_035542_027998_2E909560 
X-CRM114-Status: UNSURE (   7.42  )
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

This patch enable perf jitdump for riscv64 and it tested with V8 on qemu rv64.

Qemu rv64:
$ perf record -e cpu-clock -c 1000 -g -k mono ./d8_rv64 --perf-prof --no-write-protect-code-memory test.js
$ perf inject -j -i perf.data -o perf.data.jitted
$ perf report -i perf.data.jitted

Output:
 To display the perf.data header info, please use --header/--header-only options.

 Total Lost Samples: 0

 Samples: 87K of event 'cpu-clock'
 Event count (approx.): 87974000

 Children      Self  Command          Shared Object                Symbol

....
     0.28%     0.06%  d8_rv64          d8_rv64                      [.] _ZN2v88i
nternal6WasmJs7InstallEPNS0_7IsolateEb
     0.28%     0.00%  d8_rv64          d8_rv64                      [.] _ZN2v88i
nternal10ParserBaseINS0_6ParserEE22ParseLogicalExpressionEv
     0.28%     0.03%  d8_rv64          jitted-112-76.so             [.] Builtin:
InterpreterEntryTrampoline
     0.12%     0.00%  d8_rv64          d8_rv64                      [.] _ZN2v88i
nternal19ContextDeserializer11DeserializeEPNS0_7IsolateENS0_6HandleINS0_13JSGlob
alProxyEEENS_33DeserializeInternalFieldsCallbackE
     0.12%     0.01%  d8_rv64          jitted-112-651.so            [.] Builtin:
CEntry_Return1_DontSaveFPRegs_ArgvOnStack_NoBuiltinExit
....

Changed in v2:
 - Rebase on tag v5.18-rc2
 - Show perf jitdump commands and dump in the commit message.

Eric Lin (1):
  perf jitdump: Add riscv64 support.

 tools/perf/arch/riscv/Makefile | 1 +
 tools/perf/util/genelf.h       | 3 +++
 2 files changed, 4 insertions(+)

-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
