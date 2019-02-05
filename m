Return-Path: <SRS0=rZMy=QM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67A87C282CB
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  5 Feb 2019 12:57:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23BEE20818
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  5 Feb 2019 12:57:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PLN4Rx9n";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="kl0Z9L5z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nqTbUwkU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23BEE20818
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/ef6lq5kFba0YFIU41vH4q4gCOPftDe5BCEBIAxQl2I=; b=PLN4Rx9nJnYM2T
	2h1NpMo8yL/20ijdWw+fFfYiliQrd6buR9K3EecQeLfnRXmuUiR9qwA3bhnhpvAnqDggaAuXiAHtS
	JvdHfeFLdqAq2BUZ1x14ZvuGTGuz5UKJnN2IR8aKx3KJtdxJBcP9YvCYGcMClkLq0fcTywTpXElck
	DlRLEnvTv/swpRucurp09yjZlmWBQhUVEXz7Mef3jVTjK472qNlJ1q8uPLYrCoYiesYM9YkAmrNnD
	JjjyTIqSCmrycESAt2lWjL5aSs87/HFHSXXY1IrlLhUHUEOOX43uuA676QTh3ys9+geAu9K2phU5S
	MAAiVDaHqjOzyR/eHgsg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gr0IQ-0002j5-FO; Tue, 05 Feb 2019 12:57:50 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gr0IM-0002CI-Ud
 for linux-riscv@bombadil.infradead.org; Tue, 05 Feb 2019 12:57:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ov2pY1QRT8MdFzbiJyQGfF9j+mQj8oBAgdYLbigi/aQ=; b=kl0Z9L5zfOONIH6Bai6jOrtlHr
 WPTGsbF5Otkv1jCaIRuI3FRKqr5XxjSOp2zaJuB6hMNSWHxNKd1FrlMGXNQT8VrM1eSSipEc5RinZ
 GvaV4G+QRAwIRNB4EWZ89BMAmTBV8ZqXgfUTHttOFo7nI/lLsD4rlIbvw+f42GL3YawHAbbgB5WU/
 NKkgtQuqIJv/Bo/7hFGv6tIo8RUkjpH3X/J2ILtUHohvpM3Exoud8k76xE7UgIfhtnXREIo0DFmF+
 SDoYV6t9FOUxsB0VRFasLcxosSYffufaBkpFeeRS0tyAOX3GWeXZ7h4WJ6I7JedoCZazcyKU8A6Pq
 b/MJYEgQ==;
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gr03F-0007U3-91
 for linux-riscv@lists.infradead.org; Tue, 05 Feb 2019 12:42:13 +0000
Received: by mail-pf1-x443.google.com with SMTP id g62so1404482pfd.12
 for <linux-riscv@lists.infradead.org>; Tue, 05 Feb 2019 04:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ov2pY1QRT8MdFzbiJyQGfF9j+mQj8oBAgdYLbigi/aQ=;
 b=nqTbUwkUbXmxZzAzZMwGWjqTD4aDDqp5+C1Q0Rz7GnC9O19jmFNTiG96lciKVkmllx
 JbV19pu+KIsE2GPw4KLjHPHoF+0U4XMc8KHJdRuNpGwaxvumsGRWUVL22WicICA6qFhp
 3FI7V5q8YYrJVyJPfFylsvRKdeNSs4va1LSugHVCSBpIksTmEE/QQzqIHWhnpQK4wblZ
 0V7UJBj79NN0G3nGASMqQVWsz0wjvwLYXOztYzg3bAK79vX6f1LyynMcTT//0jS0Fuai
 ZjJ2SYezggBJOCWk/fPuBEFFcl19vyJQfJVVNzT7wcYna7lO7AuBcPRR9Um5jY3cW8BN
 Lswg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ov2pY1QRT8MdFzbiJyQGfF9j+mQj8oBAgdYLbigi/aQ=;
 b=T4TUw5LNzBvwdnvXl1yb+Krhk6mQN+x75EGsxWDDQja2qBdZ8itmzBFPFJ+Gzu2i2v
 23VLRW5CNwKkI6Fyn0vwFardujOe4mqsfCexEflTADUBDS1tUADiEbmcbcsRhD3FaaPm
 cgYYlbBODpzJrrnMlm0MyNtrlTwLoLs+CUST1rQxA7/wjJP453hsnt8SMvEhP6KrrUyo
 XJ5nr8Z/SJh+c/gqZB7AY+j5MOKR3tx7PkOOlxbN2fycZs4dI+06woGl0cnLNmgulpDD
 ZppppkW/AF+bf2+4yhRreADykI/VkZLb7Qd5MBvLdHy+3W7N2C64m3jqH7n15G7CjJog
 8AQw==
X-Gm-Message-State: AHQUAubLXnvAf2lIdcqsdTjuErBobzqopqloshFGltHIdCgKDVcFacUg
 1TrswKYfQ2foRLCa44fxAV2TMLLawzWYow==
X-Google-Smtp-Source: AHgI3IasJvZRBZONKy91UYagMlg0QqWse14Y+D514zala9PJzekGcYF6jGbnVIeu26eCnVQZ1m5NzQ==
X-Received: by 2002:aa7:83c6:: with SMTP id j6mr4790721pfn.91.1549370527538;
 Tue, 05 Feb 2019 04:42:07 -0800 (PST)
Received: from btopel-mobl.ger.intel.com (jfdmzpr04-ext.jf.intel.com.
 [134.134.139.73])
 by smtp.gmail.com with ESMTPSA id g6sm5116774pgq.18.2019.02.05.04.42.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 05 Feb 2019 04:42:07 -0800 (PST)
From: bjorn.topel@gmail.com
To: linux-riscv@lists.infradead.org, daniel@iogearbox.net, ast@kernel.org,
 netdev@vger.kernel.org
Subject: [PATCH bpf-next v2 2/4] MAINTAINERS: add RISC-V BPF JIT maintainer
Date: Tue,  5 Feb 2019 13:41:23 +0100
Message-Id: <20190205124125.5553-3-bjorn.topel@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190205124125.5553-1-bjorn.topel@gmail.com>
References: <20190205124125.5553-1-bjorn.topel@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190205_124209_402033_A6C95CB1 
X-CRM114-Status: UNSURE (   8.76  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: hch@infradead.org,
 =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@gmail.com>, palmer@sifive.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm4udG9wZWxAZ21haWwuY29tPgoKQWRkIEJqw7ZybiBU
w7ZwZWwgYXMgUklTQy1WIEJQRiBKSVQgbWFpbnRhaW5lci4KClNpZ25lZC1vZmYtYnk6IEJqw7Zy
biBUw7ZwZWwgPGJqb3JuLnRvcGVsQGdtYWlsLmNvbT4KLS0tCiBNQUlOVEFJTkVSUyB8IDYgKysr
KysrCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvTUFJTlRB
SU5FUlMgYi9NQUlOVEFJTkVSUwppbmRleCAwMTlhMmJjZmJkMDkuLmI0NDkxMTMyYjljZSAxMDA2
NDQKLS0tIGEvTUFJTlRBSU5FUlMKKysrIGIvTUFJTlRBSU5FUlMKQEAgLTI5MDcsNiArMjkwNywx
MiBAQCBMOgluZXRkZXZAdmdlci5rZXJuZWwub3JnCiBTOglNYWludGFpbmVkCiBGOglhcmNoL3Bv
d2VycGMvbmV0LwogCitCUEYgSklUIGZvciBSSVNDLVYgKFJWNjRHKQorTToJQmrDtnJuIFTDtnBl
bCA8Ympvcm4udG9wZWxAZ21haWwuY29tPgorTDoJbmV0ZGV2QHZnZXIua2VybmVsLm9yZworUzoJ
TWFpbnRhaW5lZAorRjoJYXJjaC9yaXNjdi9uZXQvCisKIEJQRiBKSVQgZm9yIFMzOTAKIE06CU1h
cnRpbiBTY2h3aWRlZnNreSA8c2Nod2lkZWZza3lAZGUuaWJtLmNvbT4KIE06CUhlaWtvIENhcnN0
ZW5zIDxoZWlrby5jYXJzdGVuc0BkZS5pYm0uY29tPgotLSAKMi4xOS4xCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
