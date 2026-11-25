Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5077D606A321
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 23:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FIng3ZZH;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=LqfSF87H;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pe20K3sV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vbz+oA03LYcBIY01tFR5ckF2QZfpkDWgNo3O2LBDnKc=; b=FIng3ZZHQ+AbtJLQ2DycuwqDvE
	X/HTikfn9pMLuzHR928Y61l4w2Gfa6UVim9zNr2na3AuOoon5qT6DgXSYQCtksB7cueme4U+tomSU
	ZLBzMOInFHkswXFsy33XifIG8myrdMnsNU3pBlT2Fw7N58oioNdsPRphlIUErFUMDuKUtkI9uS4UZ
	faVRR/hPZ/epiXECVh1W44+2WR1XZ+eN73vit/PYtJB4CI9/Pq68HN7akpCV9BPLucmMXEnS/TNGX
	I3FtWRTCgp+FmY91VCb7dDl4x1YsJ4VYxX//PnPhFPpOPHAg0O9tAlprevvrJMAPxjGLS+FG9odyv
	c2PuvmhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWMTF-0000000BZlL-3iEH;
	Wed, 25 Nov 2026 23:32:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWMTD-0000000BZhn-3XHv
	for linux-riscv@bombadil.infradead.org;
	Wed, 25 Nov 2026 23:32:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=mw86VSI5sCZ9uIOLp5gRfRDyzqoaa4r2NV57xZBkoKM=; b=LqfSF87HyXY3tE74je3NnN0Qls
	JursBd+6YlI1O4GywSbmbi2948TyZ+D2mPweXU43dlqc8BXLPbNqqxbALnFrrs63T6+nEglp6NtSb
	IsSGSKD2krfBAdXZFh3M/6sFgjmRlrLgL6IbFeVVxwhTrK77TwebbMhVHWplxx0Vm1gIlNaFcEly6
	RAhwOpcDIxSEule/nMPaPLh8VgKAJVpMA39x78aKiUW2O229fJzN5ryyAlA83iwSS3q0w+SUkN6X7
	SWpiFEtAZ/5hnsb1n54xx4GWXzDS6BPR9Ino9WpZ0VxOohDNFxtNgB+RFMtnFDcRvqPpBPYbpaO1C
	DxpbynLw==;
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWMTA-00000005t8u-2sy8
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 23:32:10 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso50242385e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2026 15:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795649525; x=1796254325; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mw86VSI5sCZ9uIOLp5gRfRDyzqoaa4r2NV57xZBkoKM=;
        b=pe20K3sVyJ+s+d3eP/gNltYAnySmJg21lpysR7i4Ckc/2wSanV8CUOqX0YWH9qzNoU
         rZr4tcsleyNNskwBoZ0TmgnfhrMwF0NNNZQpTLsicVUp/4l5arKK94k8gVsIRAjjZS87
         iDB9O6qFyvUyBFz+imiOtK9CiQM8InhYYmwmnlYvpbAhch3FJtGEA4adXae9o4zDllD/
         IC8BsL4T55KYFRtYNnaIYcV/aTaeqaz9llz/AqmgZev+pIEl0XtPiPz93cZoNgmx38/c
         qz6kc5qvODuW8a/dZ5GFlls7vGdnO4IiZB38DQo4qKB43gzI939434OvDOSVeuRh9wvj
         JxsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795649525; x=1796254325;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mw86VSI5sCZ9uIOLp5gRfRDyzqoaa4r2NV57xZBkoKM=;
        b=ch43HVDgkfPw6nv1nqrMZLJuLl1H3iP9Q3pm6TUQRECZ6eHJCsBvHVLsr7C16W6Ukk
         s4XjnFCjxqUEaP7sybllmwLGJxNJh30DJo0GfDHNUzQtxQa8qzmNvw5F/m0cbml6WdjE
         EkkMsGa2/1Xss9rNuGfPAz954rNDlePZnl96ZfU4yC/YVqJZqbK/wNySMVijSvcIYIT7
         ZlIWOlKZ+F+0C9zz5/t6J/1nVeSdWSDtm7Yad66HePfM/9vEsg2r+VovwG2EurcRZeId
         feSw623b/5JXtUdtLDCUXhIJQnkvRpOSkqeeq75u+AmS9F9bh8D8ymrIGOS97qDBVD33
         +Mtw==
X-Gm-Message-State: APuU4Z91W8dgFHXsVK2aaRVf2BF7VB6HNcQXEE6XAmbrgl77jNXPh6mF
	wHpS+9PjO3Z8E+hBpCdmHiglN1gtmKqufX8hykaTazalP+Qs2H+JUBLKPQw5tFzU2No=
X-Gm-Gg: AZFdTZeCNGUuyS1QREXdrK1YW6hHCAK/9excySw5GbSvwYAL2UuneKr8gwseUwn9xaw
	NMNeQ+faXo5xuOeTzIHrN4wbETZ1tlRCGee0zep8s2yndZTUKZ9CiBDaW5NNyiM14oaEVQ0crEO
	3N607zxB4htfDyT2CIBA+RVlcK5GzjaX84pfyQLG8tRsLAxUxhnjf53a392i/RKyt7vYHNviCH9
	dOCMc1CBv5mioVCLd4OJ/xx2aUUWM84ykMInZbIBQsuq5Rg5A9t5CDDClfDv/FIpMhYeRifba4w
	f8FwEUWusTPxzQr6O6eCCrZ8O5+wUfw7g1oGVk5S4W10XspXUDQOyONkR0hwp6kEfpKBuFWDQaN
	QcbsXNsEiS8R5qfBJG3P4M+mZxeAvMd93Xl5KWJ/x7WrDbqGt6onrOnpLuPiKdN204W76HqdLBb
	FZD/zfyDT9pXAfV8dZ+QvAKiinrVcq3AMYChuEKGmjIP97Q0YjLcC45+kmi5uOM32al0DnKZOlp
	PFqgmwfZ3Ux5o9bybglcVBmHFce7ewzCnp/1WFyTYI2u/uV7fqPbK8NiVHgmOo3ktcIau9sTUqn
	W+DdNlgwwIUxkGauO4NzKcBOax2w7o4bWdB8BtJ0uct83MEfaN5Pti6UtKYEUH7kSzqgGTvsQb8
	bEOjZ+736kw==
X-Received: by 2002:a05:600c:820d:b0:4bb:6cef:d14b with SMTP id 5b1f17b1804b1-4bb887c34f1mr398097975e9.2.1795649525443;
        Wed, 25 Nov 2026 15:32:05 -0800 (PST)
Received: from localhost (bl20-90-91.dsl.telepac.pt. [2.81.90.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865a2sm572054705e9.3.2026.11.25.15.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:32:05 -0800 (PST)
From: =?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH RFC 19/19] MAINTAINERS: Add the Espressif ESP32-P4 platform
Date: Wed, 25 Nov 2026 23:30:20 +0000
Message-ID: <20261125233020.1380594-20-vitorhg20080@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125233020.1380594-1-vitorhg20080@gmail.com>
References: <20261125233020.1380594-1-vitorhg20080@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_233209_089790_61E390A3 
X-CRM114-Status: UNSURE (   9.04  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.1 (/)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

QWRkIGFuIGVudHJ5IGZvciB0aGUgRVNQMzItUDQgRGV2aWNlIFRyZWUgZmlsZXMgYW5kIGludGVy
cnVwdApjb250cm9sbGVyIGRyaXZlcnMuIE1hdGNoIEVTUDMyLVA0LXNwZWNpZmljIGNoYW5nZXMg
aW4gc2hhcmVkCmZpbGVzIGJ5IGtleXdvcmQuCgpBSSBhc3Npc3RlZCB3aXRoIHZhbGlkYXRpbmcg
cGF0Y2ggcm91dGluZy4KClNpZ25lZC1vZmYtYnk6IFbDrXRvciBIdWdvIFNpbHZhIDx2aXRvcmhn
MjAwODBAZ21haWwuY29tPgotLS0KIE1BSU5UQUlORVJTIHwgMTQgKysrKysrKysrKysrKysKIDEg
ZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMg
Yi9NQUlOVEFJTkVSUwppbmRleCBjY2JjZGMwNzk5YjkuLjUzOGYxYTM1MzUyNiAxMDA2NDQKLS0t
IGEvTUFJTlRBSU5FUlMKKysrIGIvTUFJTlRBSU5FUlMKQEAgLTI0MTYyLDYgKzI0MTYyLDIwIEBA
IEY6CWFyY2gvcmlzY3YvCiBOOglyaXNjdgogSzoJcmlzY3YKIAorUklTQy1WIEVTUFJFU1NJRiBF
U1AzMi1QNCBTVVBQT1JUCitNOglWw610b3IgSHVnbyBTaWx2YSA8dml0b3JoZzIwMDgwQGdtYWls
LmNvbT4KK0w6CWxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKK1M6CU1haW50YWluZWQK
K0Y6CURvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxl
ci9lc3AsZXNwMzJwNC1jbGljLnlhbWwKK0Y6CURvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9lc3AsZXNwMzJwNC1pbnRtdHgueWFtbAorRjoJRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2VzcHJlc3NpZi55YW1sCitGOglh
cmNoL3Jpc2N2L2Jvb3QvZHRzL2VzcHJlc3NpZi9NYWtlZmlsZQorRjoJYXJjaC9yaXNjdi9ib290
L2R0cy9lc3ByZXNzaWYvZXNwMzJwNCoKK0Y6CWRyaXZlcnMvaXJxY2hpcC9pcnEtZXNwMzJwNC1j
bGljLmMKK0Y6CWRyaXZlcnMvaXJxY2hpcC9pcnEtZXNwMzJwNC1pbnRtdHguYworSzoJXGIoQ09O
RklHXyk/UklTQ1ZfRVNQMzJQNF9DTElDXGIKK0s6CVxiKGVzcDMycDR8RVNQMzJQNCkoXGJ8XykK
KwogUklTQy1WIElPTU1VCiBNOglUb21hc3ogSmV6bmFjaCA8dG9tYXN6Lmplem5hY2hAbGludXgu
ZGV2PgogTDoJaW9tbXVAbGlzdHMubGludXguZGV2Ci0tIAoyLjU2LjEKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
