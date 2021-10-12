Return-Path: <SRS0=CTJ+=PA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F4179C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 14:00:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B929861040
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 14:00:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B929861040
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ETnmRE/QKIx3EUvar9TNe3Cn1jvFtGovx7LPpLE7KYk=; b=gi0SlKlbJUYWp+
	Q7v5FkYB1yQsWxEzENPpZGV2McxSFejlc8pvCdVqPM8aNsIFfirp3Yzd0w9uCZf3cncjltvg2BF2/
	zMCmEJNspUQnaXULvyVOnWOt9TQ4lU5MjiR3HAbN2bVE6jtrSB83n80kd/zYB/4RJXcwUMSB9yvMm
	/jmj3rzVPTNfjgghZSrZXCvu4Jwa2b+iQFLyRBZnuexNrxgWHS/iUd9F2cMsx0+U6zfNxWQqVj+lD
	znOEeU+iSaY0eSC68zNe9exOousgKaSDa8Q+xFPAfRv6j10LBboI9LGlBYbZSZ9sBc8urTHF3ju3F
	cAhGBAGFq/n2jx7ff9mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maIJq-00D6k7-8r; Tue, 12 Oct 2021 13:59:50 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maIJm-00D6iR-Ie
 for linux-riscv@lists.infradead.org; Tue, 12 Oct 2021 13:59:47 +0000
Received: by mail-wr1-x42a.google.com with SMTP id e3so33635219wrc.11
 for <linux-riscv@lists.infradead.org>; Tue, 12 Oct 2021 06:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloudflare.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8+uJr5hp/PrwImyhLww643udSk+FgvtkOnzEH/iiMXA=;
 b=S54KEdJVG5PidXuDq9r16txvb2g/cP+3eW8Jwk8oD7+pSdOTA4ADJE+GWkNmKRn6xt
 E7ze+GwF/sNaoP3DUf9kqKEz1SuoC80Sab8lMxVpP4OZf9B9VIu8Cgce9Pqjgwvale19
 ffQIHz52YRLNkhSog3jdhhM1IWstr0eIylMJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8+uJr5hp/PrwImyhLww643udSk+FgvtkOnzEH/iiMXA=;
 b=XCcekz3BW4r7uVgqWv85Kk5rt6aR0G+us5h81ssK27+ys30106xr3HFjqXsVdKLbc9
 HDWWc+KI5ni3ogkKNWjwzDlob55hSybX9tT5PPcocNrB1eax3RTxnt9xIE13k/MT+UAY
 tH5Hu8Izdg3Ae6YwIcnVo+OnyBzqVD4hnwzYsk1Oog0iVu9fs+lpnybeSu6nht1pX9uD
 Zkus3jh4WBvt/jgZRVZMXGnoaJ1uimrjoJFTgafPmx6hnKIUOFCh/w2Ho5yNiNU3x8ti
 1FMUiO1wcKVSQx8l70CKGcKokLNziRLwE98i9JZWrp9lcFaHBz+1Mo9fpobJI4z460Hu
 fwSQ==
X-Gm-Message-State: AOAM533kFYDnD1hFVk5+MhypcP0rdfe4ZpDlUBczwjdIyTR0js1TTZOj
 fXDCSYEAUZLy4R9oWz10NQFEZA==
X-Google-Smtp-Source: ABdhPJylp2yWYbawmjfOTMiLcasdN+Z6efwR6pCAb6UhqxWGMRgLmOkn2eCFQKHgteNVV4kv6gQhYw==
X-Received: by 2002:adf:9bce:: with SMTP id e14mr31937800wrc.353.1634047183850; 
 Tue, 12 Oct 2021 06:59:43 -0700 (PDT)
Received: from antares..
 (d.5.b.3.f.b.d.4.c.0.9.7.6.8.3.1.f.f.6.2.a.5.a.7.0.b.8.0.1.0.0.2.ip6.arpa.
 [2001:8b0:7a5a:26ff:1386:790c:4dbf:3b5d])
 by smtp.gmail.com with ESMTPSA id o6sm14875894wri.49.2021.10.12.06.59.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 06:59:43 -0700 (PDT)
From: Lorenz Bauer <lmb@cloudflare.com>
To: nicolas.dichtel@6wind.com, luke.r.nels@gmail.com,
 =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
 Xi Wang <xi.wang@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: kernel-team@cloudflare.com, Lorenz Bauer <lmb@cloudflare.com>,
 netdev@vger.kernel.org, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] bpf: define bpf_jit_alloc_exec_limit for riscv JIT
Date: Tue, 12 Oct 2021 14:59:32 +0100
Message-Id: <20211012135935.37054-2-lmb@cloudflare.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211012135935.37054-1-lmb@cloudflare.com>
References: <20211012135935.37054-1-lmb@cloudflare.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_065946_632485_84DE5F08 
X-CRM114-Status: UNSURE (   8.82  )
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

Expose the maximum amount of useable memory from the riscv JIT.

Signed-off-by: Lorenz Bauer <lmb@cloudflare.com>
Acked-by: Luke Nelson <luke.r.nels@gmail.com>
---
 arch/riscv/net/bpf_jit_core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/net/bpf_jit_core.c b/arch/riscv/net/bpf_jit_core.c
index fed86f42dfbe..0fee2cbaaf53 100644
--- a/arch/riscv/net/bpf_jit_core.c
+++ b/arch/riscv/net/bpf_jit_core.c
@@ -166,6 +166,11 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
 	return prog;
 }
 
+u64 bpf_jit_alloc_exec_limit(void)
+{
+	return BPF_JIT_REGION_SIZE;
+}
+
 void *bpf_jit_alloc_exec(unsigned long size)
 {
 	return __vmalloc_node_range(size, PAGE_SIZE, BPF_JIT_REGION_START,
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
