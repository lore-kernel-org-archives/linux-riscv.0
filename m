Return-Path: <SRS0=F/sc=EY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBB97C5519F
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2020 07:17:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24A562223D
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2020 07:17:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OSNRRyTn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LMjkAtbU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24A562223D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZpMY+zis8njb5L0EeIrrKz64VHtyyAcXOpSsetVsANc=; b=OSNRRyTnNBt3KtXpIsu2bmbWc
	HALccCb6j5coOso60Zhx6vgLCyP9CeA/BltG7dje2LIjvcYhQNuyP9muZhwJx7E2EbhijrRu+GgDV
	L8cKgXKIRWvJpRLxyMwWJbOXwF8cGre1MFEfZTJKHzz0VJ2H3vIPwuVNqhEC94wM30iOSQUtlqjxL
	BR8m689pbJigOkM1513DsoYaRqUe0E77V5IdIkgdbDDAFZxZgyA3oS4sJIKthLOu9qqREzsadB+YP
	dPDGTTqsmmdMn8V53nVnYaDjtAbUPTP6oixesr5xTzjMk4K5Ihkhbt6E9tU/5+DiIfNaK8OdocyaV
	PPQJzO98A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfHi9-0005QO-3C; Wed, 18 Nov 2020 07:17:01 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfHi6-0005Pl-QV
 for linux-riscv@lists.infradead.org; Wed, 18 Nov 2020 07:16:59 +0000
Received: by mail-pj1-x1041.google.com with SMTP id r9so565401pjl.5
 for <linux-riscv@lists.infradead.org>; Tue, 17 Nov 2020 23:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CdQI5C98t7LZ1pEv4GMZDnMVWKgqmMtUOYvNiSvzudA=;
 b=LMjkAtbU4YDRmAuKc1jYATFtY1xW7glvFoPkf7S2JWBOQ0kTN+dAtwdm7zubvImgYy
 k4A+dfh5ZO5JdVTYcuOanXzZERNSr7OXwOhe4qiaWKp5Ys5+ZifRBkxFQtMC8hHDkBNM
 qz+1+enyAZSYwvVt/jQ5Y/8FhxxD5BTzjebVzTvDye3TXAoLO2Mi8jLUWHEBonDknnOs
 381JUdSP+2sRsHGlUTwn7VOcFpRfLwSI1Azd9vs3JPKHlatZ0x7qTUAyyE3j8zAnYN48
 DzZ1eR9jNhy0ZM/45WaEHjb9e0A+zmezNYeeKSoxs5mSkZooBcyLOS/1cd4SxgREdyuJ
 jX9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CdQI5C98t7LZ1pEv4GMZDnMVWKgqmMtUOYvNiSvzudA=;
 b=fSkucJO/Y2/tZ8vPhMTnbSq9+5GDhUcAKkmlnRvMc7pjuVJGUWvmU8ae2nZV3uuY3s
 0cSIvm9IxMgrqKIIfFJPTtxHVzgdrjXYzH5k7f6Pk09tITcj2vDqTrzgrsXeYv/lIIZg
 1aSG97wb4O/Yov75b0sa2Bh0WhEpC/Ht8c0Q/r6UZPv8Y7yhFlDxc/K2qJWut6ELKJAX
 4wSosJ7GD1ZLWKj1KoUAY+rZIZ4yXtNe9EKJ0eq6ZDY/GCrYKZiO8JW5HXaIr2N1lQHl
 DoQj0QEJFPlnscGtTCz/I7+hBoXArWkUPoKIU3Pq6kdm/8pYNfGx5EO1Lcutyd3uey1u
 Zwkw==
X-Gm-Message-State: AOAM532EQA5TVaC7Og2O0uAF5/a1d3gupclekqov4DYMI47AgOxy2yXi
 euAJsDWNG01cNG18fvS3x60=
X-Google-Smtp-Source: ABdhPJw4/1/t7nwcBfpsnRyXSKkYvjQkLheyRuyIbHbgq6Y1wC5ljFFmZBpinmQxPd6ZLHhfnLxeiQ==
X-Received: by 2002:a17:90a:de93:: with SMTP id
 n19mr2847217pjv.142.1605683817025; 
 Tue, 17 Nov 2020 23:16:57 -0800 (PST)
Received: from btopel-mobl.ger.intel.com ([192.55.55.45])
 by smtp.gmail.com with ESMTPSA id e128sm23019382pfe.154.2020.11.17.23.16.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 23:16:55 -0800 (PST)
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@gmail.com>
To: ast@kernel.org, daniel@iogearbox.net, netdev@vger.kernel.org,
 bpf@vger.kernel.org
Subject: [PATCH bpf-next v2 1/3] selftests/bpf: Fix broken riscv build
Date: Wed, 18 Nov 2020 08:16:38 +0100
Message-Id: <20201118071640.83773-2-bjorn.topel@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201118071640.83773-1-bjorn.topel@gmail.com>
References: <20201118071640.83773-1-bjorn.topel@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_021658_882864_E2CE1FF5 
X-CRM114-Status: GOOD (  10.23  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@gmail.com>,
 linux-riscv@lists.infradead.org, andrii.nakryiko@gmail.com, xi.wang@gmail.com,
 luke.r.nels@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

VGhlIHNlbGZ0ZXN0cy9icGYgTWFrZWZpbGUgaW5jbHVkZXMgc3lzdGVtIGluY2x1ZGUgZGlyZWN0
b3JpZXMgZnJvbQp0aGUgaG9zdCwgd2hlbiBidWlsZGluZyBCUEYgcHJvZ3JhbXMuIE9uIFJJU0Mt
ViBnbGliYyByZXF1aXJlcyB0aGF0Cl9fcmlzY3ZfeGxlbiBpcyBkZWZpbmVkLiBUaGlzIGlzIG5v
dCB0aGUgY2FzZSBmb3IgImNsYW5nIC10YXJnZXQgYnBmIiwKd2hpY2ggbWVzc2VzIHVwIF9fV09S
RFNJWkUgKGVycm5vLmggLT4gLi4uIC0+IHdvcmRzaXplLmgpIGFuZCBicmVha3MKdGhlIGJ1aWxk
LgoKQnkgZXhwbGljaXRseSBkZWZpbmluZyBfX3Jpc2NfeGxlbiBjb3JyZWN0bHkgZm9yIHJpc2N2
LCB3ZSBjYW4Kd29ya2Fyb3VuZCB0aGlzLgoKRml4ZXM6IDE2NzM4MWYzZWFjMCAoInNlbGZ0ZXN0
cy9icGY6IE1ha2VmaWxlIGZpeCAibWlzc2luZyIgaGVhZGVycyBvbiBidWlsZCB3aXRoIC1pZGly
YWZ0ZXIiKQpTaWduZWQtb2ZmLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybi50b3BlbEBnbWFpbC5j
b20+Ci0tLQogdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL01ha2VmaWxlIHwgMyArKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvTWFrZWZpbGUgYi90b29scy90ZXN0aW5nL3Nl
bGZ0ZXN0cy9icGYvTWFrZWZpbGUKaW5kZXggYzE3MDhmZmE2YjFjLi4zZDU5NDBjZDExMGQgMTAw
NjQ0Ci0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9NYWtlZmlsZQorKysgYi90b29s
cy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvTWFrZWZpbGUKQEAgLTIxOSw3ICsyMTksOCBAQCAkKFJF
U09MVkVfQlRGSURTKTogJChCUEZPQkopIHwgJChCVUlMRF9ESVIpL3Jlc29sdmVfYnRmaWRzCVwK
ICMgYnVpbGQgd291bGQgaGF2ZSBmYWlsZWQgYW55d2F5cy4KIGRlZmluZSBnZXRfc3lzX2luY2x1
ZGVzCiAkKHNoZWxsICQoMSkgLXYgLUUgLSA8L2Rldi9udWxsIDI+JjEgXAotCXwgc2VkIC1uICcv
PC4uLj4gc2VhcmNoIHN0YXJ0cyBoZXJlOi8sL0VuZCBvZiBzZWFyY2ggbGlzdC4veyBzfCBcKC8u
KlwpfC1pZGlyYWZ0ZXIgXDF8cCB9JykKKwl8IHNlZCAtbiAnLzwuLi4+IHNlYXJjaCBzdGFydHMg
aGVyZTovLC9FbmQgb2Ygc2VhcmNoIGxpc3QuL3sgc3wgXCgvLipcKXwtaWRpcmFmdGVyIFwxfHAg
fScpIFwKKyQoc2hlbGwgJCgxKSAtZE0gLUUgLSA8L2Rldi9udWxsIHwgZ3JlcCAnI2RlZmluZSBf
X3Jpc2N2X3hsZW4gJyB8IHNlZCAncy8jZGVmaW5lIC8tRC8nIHwgc2VkICdzLyAvPS8nKQogZW5k
ZWYKIAogIyBEZXRlcm1pbmUgdGFyZ2V0IGVuZGlhbm5lc3MuCi0tIAoyLjI3LjAKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
