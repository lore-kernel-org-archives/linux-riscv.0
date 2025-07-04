Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 925D2C83F05
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jul 2025 11:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T1IU4XWjL/0fMW4+cqqSAGosfl6+XSeCv7I2mxuFQY4=; b=GzfZV/mDZspEw8
	0iXmSDOGN3w3AvbqCEsFmIX7rOuSpy1G4UeMZtwP/t97UXn1jMKZtztKYuFzcZldt+y1QqDzCUu9x
	LVQ9KzYNqJD7aPwkT6FVEtLWHvDPF9jRM7N2mIj/hUoD2wKW6iKTzrFN1ljztO94ouHEutRzWU9YM
	/8/h6hE2Ye0MYPkZBMo0JKk9kuDubkqxj2qUlUdW65CdYwCFavjL26cXuSd/KoMyCt9UlznUvQyBx
	V3A1UKaPG1c2LfGTosCvf1Dj6vpoPCJyxRJhWuLG6FATqxzS1bCer/U4UXr0geW/QEaDKST3C9p6v
	FYocqyv1i7HhPdxvnw0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXeyL-0000000EI4G-0QVj;
	Fri, 04 Jul 2025 11:52:53 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXdpr-0000000E69I-3STA
	for linux-riscv@lists.infradead.org;
	Fri, 04 Jul 2025 10:40:05 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-74b56b1d301so561023b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 04 Jul 2025 03:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751625603; x=1752230403; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6qpm9oVk31iPLMFRDyV/0+2lbwRDN6/sR7bTcFUqHlY=;
        b=RwniW9vxb5Y4cO4RlwuedOFToFyZGKMoC9g1LLLHGVZj2XaiwKA+8VMp9EjhTN98Hi
         v0CKmvVLy9DItOWGsM6NjE5kSwRlw7P7CdkCs3zl0moxlZfm2MZ6lUWTH96iA2xGF9nC
         RdOIiLUYNyaUABN9NlZ9IHTwIDYlfDZD62+JMD8xvxTbG3fMDiP82o6w6HrGAHUWVrIq
         Vl4HhxYtM+WpvPKeY5ZjVtFgmtWzv4Xra07lwpGJxWmfNhRLHvj1XISFohcbRZz8XgtB
         6yF/Pkeqpf4huzuZdaDSigORdDVUknkkG8s4KIaLWGyZhlkeGaqhvxyf6T1DJ4FQTdmH
         StXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751625603; x=1752230403;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6qpm9oVk31iPLMFRDyV/0+2lbwRDN6/sR7bTcFUqHlY=;
        b=TpZI8hTCRiWQzf/CVRMMkgCpBhzLqipMb6vmvZQ+2IlK+inTvsxWDLRK8/0KA8gY1t
         qxL1+DSE8trSgDXW0a6IiKXwi22Dzn24sT2UZsw+5ceLZQFf3wP7rFP66kmUPMDz1Syj
         RtTfkuhuc5s5CKGf6PIg7sz5YOcWUxZUKXBzlSWZm42DVSgcnHGIn+6tlQr01ypZLkK5
         u9CSoH9ntt0gEM+3DKxSwvEMCrrctsR4PfSCK0xU2qvLexxLvf2QvvgvZlaXyrrtQnzD
         JBiVylDGWn8O9SptFBl6wN/tgT2dNqWB/5yzKMFYgu4e0yu/0z5g6Zf5PdV07CCfeRUu
         HO7g==
X-Forwarded-Encrypted: i=1; AJvYcCUWBB58wMbL+a6g6gQ6FqXTGJrXF4tcfMOPqwQ8f9qujdysT6Go4BlN0YJuZyuOi88FeigFHT/KPJY7rw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyc9GYfD1DSrtXelE0M0tEfFKrHiRVWOeyuH9KV/EhvsLt4h4UL
	VaaFt9JR2fo/Sq2uurM9V63PxHKInM0/uoY+cJe3GR80BN8SxXfPVyzbvnz+tSsdbGbHLaos07w
	aVPCTlxjk7/KviT3OI+U9XfUsU7U9L7l+n/7fYcWW9Q==
X-Gm-Gg: ASbGncsvzGxQmeoBhibcWRZ90rQVtSgagXkeqsyVdnOVD61hiaj8z4w0ZbCk1Wjq2mi
	FuiATQrdtmLKNtiisWbL4HdmNMZCNX3b+FRvABEiqcCEcIXc71q2dTlQj+qsa4khPyGdniHJ4J8
	/4asJBHaFqEQsy2KiwXBLUsBW/enfe00gVJ/zdJ+TAUDCM2iW6Ttd82TW4bt/6XzHhmA15QdlSs
	FDh
X-Google-Smtp-Source: AGHT+IGBs9C/a1h9wEnSJ4u2whXXZ8h6N1fXxSXBnoBq+aBJJFdxWz87n4GrI9gt5Rt5fyk2gdtaErEvJ5wxodxEPAg=
X-Received: by 2002:a05:6a21:328a:b0:21d:fd1:9be with SMTP id
 adf61e73a8af0-226095a50bemr2186092637.12.1751625603014; Fri, 04 Jul 2025
 03:40:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250701114733.636510-1-ulf.hansson@linaro.org> <20250701114733.636510-25-ulf.hansson@linaro.org>
In-Reply-To: <20250701114733.636510-25-ulf.hansson@linaro.org>
From: Rahul Pathak <rpathak@ventanamicro.com>
Date: Fri, 4 Jul 2025 16:09:27 +0530
X-Gm-Features: Ac12FXzyhceuDUHxAgg09E47FfPnvNTySeb2d62SyjDeeom2LGwO1x_uyESViw4
Message-ID: <CA+Oz1=aU=2KFEsJNmO6LHjE0Wsdyor7Z4Yr30nLwRkAGm=ZO6w@mail.gmail.com>
Subject: Re: [PATCH v3 24/24] cpuidle: riscv-sbi: Drop redundant sync_state support
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Saravana Kannan <saravanak@google.com>, Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Peng Fan <peng.fan@oss.nxp.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Johan Hovold <johan@kernel.org>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Michal Simek <michal.simek@amd.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Hiago De Franco <hiago.franco@toradex.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_034003_884379_29AC5FB4 
X-CRM114-Status: GOOD (  11.21  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBKdWwgMSwgMjAyNSBhdCA1OjIz4oCvUE0gVWxmIEhhbnNzb24gPHVsZi5oYW5zc29u
QGxpbmFyby5vcmc+IHdyb3RlOgo+Cj4gVGhlIHJlY2VudCB1cGRhdGVzIHRvIHRoZSBnZW5wZCBj
b3JlLCBjYW4gZW50aXJlbHkgbWFuYWdlIHRoZSBzeW5jX3N0YXRlCj4gc3VwcG9ydCBmb3IgdGhl
IGNwdWlkbGUtcmlzY3Ytc2JpLWRvbWFpbi4gTW9yZSBwcmVjaXNlbHksIGdlbnBkIHByZXZlbnRz
Cj4gb3VyIC0+cG93ZXJfb2ZmKCkgY2FsbGJhY2sgZnJvbSBiZWluZyBpbnZva2VkLCB1bnRpbCBh
bGwgb2Ygb3VyIGNvbnN1bWVycwo+IGFyZSByZWFkeSBmb3IgaXQuCj4KPiBMZXQncyB0aGVyZWZv
cmUgZHJvcCB0aGUgc3luY19zdGF0ZSBzdXBwb3J0IGZvciB0aGUKPiBjcHVpZGxlLXJpc2N2LXNi
aS1kb21haW4gYXMgaXQgaGFzIGJlY29tZSByZWR1bmRhbnQuCj4KPiBDYzogQW51cCBQYXRlbCA8
YW51cEBicmFpbmZhdWx0Lm9yZz4KPiBDYzogbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
Zwo+IFRlc3RlZC1ieTogSGlhZ28gRGUgRnJhbmNvIDxoaWFnby5mcmFuY29AdG9yYWRleC5jb20+
ICMgQ29saWJyaSBpTVg4WAo+IFRlc3RlZC1ieTogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2Vp
bmVuQGlkZWFzb25ib2FyZC5jb20+ICMgVEkgQU02MkEsWGlsaW54IFp5bnFNUCBaQ1UxMDYKPiBT
aWduZWQtb2ZmLWJ5OiBVbGYgSGFuc3NvbiA8dWxmLmhhbnNzb25AbGluYXJvLm9yZz4KPiAtLS0K
PiAgZHJpdmVycy9jcHVpZGxlL2NwdWlkbGUtcmlzY3Ytc2JpLmMgfCAyMiArLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMjEgZGVsZXRpb25z
KC0pCj4KCkxHVE0KClJldmlld2VkLWJ5OiBSYWh1bCBQYXRoYWsgPHJwYXRoYWtAdmVudGFuYW1p
Y3JvLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
