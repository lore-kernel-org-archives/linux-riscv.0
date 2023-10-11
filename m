Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3CE1CD6E5A
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 11:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kc8udiFE6VtWYGRr6aZSSxZsAJdBIiMKhJIch2zUebY=; b=zRPG1yqlJeTjkQ
	VVgO4/LTAVP7YZt4lWkU+yjhdBxNzqW/WoAJNpDeHjk/pEjrReaHpfg2y3ADAuhXkKKrUDHIt5vfN
	WKlqP2Uy+duQvZNRK/xvXq0UtEgvhVW4R5OvK8tuxtegI1zBnJ8gHenn7pgv+qu/dTj90PpbnatNk
	LNVbxxhXIKODFEQgTDhZwiuFcTRVUfLR/2BQeR7jsQX7FVnA2jAtbYAQRTbgKEfbP3BBNv8W7N+Yt
	cPYLZpQ2rjCFRPZcEJ+6ZS/qP04pIePaaGpu98v2laK6tz/Hrxv7ndXHa7Uth5L/J3zT5R/ioeCo+
	zxcvcmtkP4Uh/ZJKCo3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqXFS-00FjPQ-1D;
	Wed, 11 Oct 2023 11:19:30 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqXFN-00FjHR-0y
	for linux-riscv@lists.infradead.org;
	Wed, 11 Oct 2023 11:19:28 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4053e6e8ca7so19944685e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 11 Oct 2023 04:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697023161; x=1697627961; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k1iP2iExuR7IS677Qe2UFfmGvnhfXBRfGhWxe/84qUE=;
        b=1k3GfPPBNvQmakBe8L1tEcH2AKyMk7Y+wsfQzkJisVVXpni51VaapkQL1f6+RaUgp9
         uZm10lM4OeCAEm+9MyyGL8WD0LzRIvDhm3L6zwQ8S5dNCOD7XImVGMISGac9cJPiLp5h
         xsGDbUwxm5V/g5HnQgYOOzKrv/PYOtzsQ+UkTvOnn8Bt1zOAFYB1pP+u43MZ22U2tz7Q
         TziMNdctSmTJQoQqMqXCiEoxv63oJobUQcnBv98qcav1wHXl873f/ELwqrAa6v6s6JFV
         wBUN691OaJPgUFvIvlGNKFrqemrhRV+kebSp3CGuviiJI3/55Mxa/Lk7VK5RUhiKppK4
         bO3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697023161; x=1697627961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k1iP2iExuR7IS677Qe2UFfmGvnhfXBRfGhWxe/84qUE=;
        b=HHldq8Toga6+zww/2HfEpzm6h15GCU4IEr4bMvfNYxDRtJFUHjqJkIzeT9GbhOa3dl
         peyD3G5gJz0EmMQfpgnMQ7L8bOtZLcRah2Ukus3ELuzrA+9c41+/yg6fqLpWRJY4g6ms
         Q63Nvi2NjyGGA0bF/iaSmWwBovzpsxvKIK668iGa4ZMuA9/jgZ635r6sH+KpZ+LKSmKG
         7D8Mh6Tdtp4rMmhf/zh0M7im+yxDAO2MpyveP5CTB9vWAqKPt+YuCHLvBPeGB7e0ym4z
         V+Eb05N5FBpQ4jYnNHX/etrpG8gAhI+mstQFwVFE/r1ctjsfPTcb4YyGxX5aB6HTVKag
         Teww==
X-Gm-Message-State: AOJu0YwaMYQGUH96KUMhmst54vJua6f06Q4nqVEnoNKbGUqxp4o1kFOz
	0pcl95eDZomPYwaTM7n3qbWH2JzbwA6lVQ+DlAw9dQ==
X-Google-Smtp-Source: AGHT+IHN1jrPE5e/OFNBPSwpg81Ym2JZZudWxgKZK78wyWJftAy9XEh6ziseuRa2e9MUXZKDACfVXQ==
X-Received: by 2002:a05:600c:511d:b0:401:b53e:6c3e with SMTP id o29-20020a05600c511d00b00401b53e6c3emr18807477wms.1.1697023160607;
        Wed, 11 Oct 2023 04:19:20 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:9134:b302:d8b:a200])
        by smtp.gmail.com with ESMTPSA id a4-20020a05600c224400b003fe2b081661sm18945715wmm.30.2023.10.11.04.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 04:19:20 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Jones <ajones@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>,
	Conor Dooley <conor@kernel.org>
Subject: [PATCH v1 07/13] dt-bindings: riscv: add Zfh/Zfhmin ISA extensions description
Date: Wed, 11 Oct 2023 13:14:32 +0200
Message-ID: <20231011111438.909552-8-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231011111438.909552-1-cleger@rivosinc.com>
References: <20231011111438.909552-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_041925_352437_90BC07D1 
X-CRM114-Status: UNSURE (   8.41  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

QWRkIGRlc2NyaXB0aW9uIG9mIFpmaCBhbmQgWmZobWluIElTQSBleHRlbnNpb25zWzFdIHdoaWNo
IGNhbiBub3cgYmUKcmVwb3J0ZWQgdGhyb3VnaCBod3Byb2JlIGZvciB1c2Vyc3BhY2UgdXNhZ2Uu
CgpbMV0gaHR0cHM6Ly9kcml2ZS5nb29nbGUuY29tL2ZpbGUvZC8xejN0UVFMbTVBTHNBRDc3UE0w
bDBDSG5hcHhXQ2VWelAvdmlldwoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVn
ZXJAcml2b3NpbmMuY29tPgotLS0KIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVu
c2lvbnMueWFtbCAgICAgICB8IDEzICsrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMyBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwKaW5kZXggNDAwMmM2NTE0NWM5Li40YzkyMzgwMGQ3
NTEgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9l
eHRlbnNpb25zLnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jp
c2N2L2V4dGVuc2lvbnMueWFtbApAQCAtMTkwLDYgKzE5MCwxOSBAQCBwcm9wZXJ0aWVzOgogICAg
ICAgICAgICAgaW5zdHJ1Y3Rpb25zIGFzIHJhdGlmaWVkIGF0IGNvbW1pdCA2ZDMzOTE5ICgiTWVy
Z2UgcHVsbCByZXF1ZXN0ICMxNTgKICAgICAgICAgICAgIGZyb20gaGlyb29paC9jbG11bC1maXgt
bG9vcC1lbmQtY29uZGl0aW9uIikgb2YgcmlzY3YtYml0bWFuaXAuCiAKKyAgICAgICAgLSBjb25z
dDogemZoCisgICAgICAgICAgZGVzY3JpcHRpb246CisgICAgICAgICAgICBUaGUgc3RhbmRhcmQg
WmZoIGV4dGVuc2lvbiBmb3IgMTYtYml0IGhhbGYtcHJlY2lzaW9uIGJpbmFyeQorICAgICAgICAg
ICAgZmxvYXRpbmctcG9pbnQgaW5zdHJ1Y3Rpb25zLCBhcyByYXRpZmllZCBpbiBjb21taXQgNjQw
NzRiYyAoIlVwZGF0ZQorICAgICAgICAgICAgdmVyc2lvbiBudW1iZXJzIGZvciBaZmgvWmZpbngi
KSBvZiByaXNjdi1pc2EtbWFudWFsLgorCisgICAgICAgIC0gY29uc3Q6IHpmaG1pbgorICAgICAg
ICAgIGRlc2NyaXB0aW9uOgorICAgICAgICAgICAgVGhlIHN0YW5kYXJkIFpmaG1pbiBleHRlbnNp
b24gd2hpY2ggcHJvdmlkZXMgbWluaW1hbCBzdXBwb3J0IGZvcgorICAgICAgICAgICAgMTYtYml0
IGhhbGYtcHJlY2lzaW9uIGJpbmFyeSBmbG9hdGluZy1wb2ludCBpbnN0cnVjdGlvbnMsIGFzIHJh
dGlmaWVkCisgICAgICAgICAgICBpbiBjb21taXQgNjQwNzRiYyAoIlVwZGF0ZSB2ZXJzaW9uIG51
bWJlcnMgZm9yIFpmaC9aZmlueCIpIG9mCisgICAgICAgICAgICByaXNjdi1pc2EtbWFudWFsLgor
CiAgICAgICAgIC0gY29uc3Q6IHppY2JvbQogICAgICAgICAgIGRlc2NyaXB0aW9uOgogICAgICAg
ICAgICAgVGhlIHN0YW5kYXJkIFppY2JvbSBleHRlbnNpb24gZm9yIGJhc2UgY2FjaGUgbWFuYWdl
bWVudCBvcGVyYXRpb25zIGFzCi0tIAoyLjQyLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
