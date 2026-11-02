Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB4D606A32F
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Nov 2026 13:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=X+qgKeWK;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S0Rqfivm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=uOgvz3RkdEFv4nqKTgoFXe53mzl0l8g9wsBTrfBIOAM=; b=X+qgKeWKceUoDk7A7cd0Egn1vS
	Q0yDrAAJfQMv0mzKjsL0116FT1kUPwa+Yn81WNBL/8ywGiPgCL41qZJ5AXbHFpQPL/ckdxQrfyMJ+
	nOgUTvkqJoM5BG6RJ7yOVwcVgMQ9H2rhg3N1USFIP6M2pMyObhXKDDfI7oFRJvbZyMnyUEy/x7Irk
	DeYSXOxJbLHGzU2Py5e2teGLljmeOuhoeFz0uMI6kjqjEIWLMWH8uuJFDYKnAmyv0aXyLmp2doCtQ
	j3Lftn4G8DOz+Ad67y6TvwfdCj7DdJOxO8YdJoo20aFvzHmETkg8EIM4Qpz21/tQT43oEzfzpPL+V
	/8HYQ3Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsLp-0000000Gf8y-3oOi;
	Mon, 02 Nov 2026 13:45:29 +0000
Received: from mail-wm2-x06.google.com ([2a00:1450:4864:31::6])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsLm-0000000Gf7k-2o3A
	for linux-riscv@lists.infradead.org;
	Mon, 02 Nov 2026 13:45:28 +0000
Received: by mail-wm2-x06.google.com with SMTP id 5b1f17b1804b1-4a77811be24so17654425e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 02 Nov 2026 05:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793627124; x=1794231924; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UUcrbJLOOZAs9Qd9MyHCkEc9mio81RdYYZ8wU36Zvg8=;
        b=S0RqfivmKAwKXBJLlksFfqhSSWHMVg52SRAMNiM22GAlzbpUPDA7IHlj01UG/9yQdh
         zZHlhR0V8M2bDDxh7/fZcOczEdsJw8Rr6Yntop9iOXSA8TgNGmUlmFXMvFB/mmCMZDXB
         N7vmG6ifqzbNRRXMbSF23O6fdqKtQk0Fv8AiaSoqPF5Mf93fGyBrxtPn4B+Ab9uNvyil
         FyD7GNX0CdpALpwBS/w9fxD2vVc+2jcck9f3kCFIW7Ww5b78ycD35mXmATRtEpRV68LR
         sZv9Kx3TqGYSUt/9CxrDqeGTMH22cI32GNGR2N8AuXJtRyjV0Xbbp8kMsBezgoGepuJp
         TX7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793627124; x=1794231924;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UUcrbJLOOZAs9Qd9MyHCkEc9mio81RdYYZ8wU36Zvg8=;
        b=VnbgHtOBmzawAbqjsBnIIgn07ix8lm/b1RrRsv3G6SkGD+km7y+daL0yqXpym91t4W
         4Sq/vRmlUgCvTuRlOTEr38tKXmLoyOjlxQYaK8sG2yuJBroP4wOde2e01YX6VKlWDwqV
         IFgugBSigYhr5SqfrMGOwFyFfF0YmgkLTd0+kUr3/D5A3DyGhdiqJxLLJgPI0uW2muHz
         8lfGyweSU2J/g6/L5/vXdBTGgtWdVWg17FPYileSMVqYrWOusRv6AaXecVFsR/g9qoNA
         GB9+lstD/vnHg6hw4MXkCmVFL5L5hCyR0KhfxXR5aG1kBRVvm58BpnZKxNAvYNYBxlvI
         DDuA==
X-Forwarded-Encrypted: i=1; AKwUvBxbUwbv/UfXq90r15b1hJR8iPMolaX3V00OWQc+XarwGvPpaNOLHUQtJZDQZrreNfYQtSyL3T7rpBQfFg==@lists.infradead.org
X-Gm-Message-State: AFq9FYLvV1B9/mZxe+FZWBVxtOxBjqTEg36QX+9Cng6a4FkK+vnNrcy8
	LCkWvfZD2KEKmbAIDDHJ9aX13QroZfzfhv5CopXD0uFNGcZ06CvRwbk8
X-Gm-Gg: AYBFou1sGi2UfNHezO3T/E3m2NcLU3qucV9Z5wTVoE3SmgiB8GSxoFgvXSHXb9qbGOO
	1uVktat0lGcLC7gf3AnTmeq8yH/cPe4TdOqIFNq7nIYffVwhqFFDJaDTlZA0DJRwWsvNYOmsGD6
	boCXvYcdzI9RCYT0Usgsaq+No1HKL0QHgZzGaSaShVQKKhYbBI/2xxqoFsdL3dXbi3D/4YoGsbk
	IHTiV4s3tEqRqQZ7KUwpUSKt48cWQXZ28ghoaztV+MjbMBdJGkQPG70VVneAiquqziB5T3U0QN5
	vvoEKhBTbePPzSL/ADg+A60G+Ki41bjkD/RyRK/fZi7ld+uJ4YZtElkeSwEG6jjw5a0/3U6sxUq
	wpxjqTazxDFhXZPg9pR7pFoC5OwYctn3lfeqd5K9vMqYZkMC42SkPt93hyh14HC3aof/mU8c6sE
	o0BznrTEhUSITa28tD4yOngYn0shLkJIG/j83zmKFX2OvFXvy8TRIq22284y5z4l873r3tGRMog
	Q/mssJeJYbG2hSZmBkm1gDhQHYoiFyCn17eLJBN5tFMTnVtf1IlRt4HfEDFkJKyUrXrqRGyelPJ
	yATIg/HzzYqpVin0MgCAdDaok6D2MXHRrgUjSF12af2EY9G1Furi6tY=
X-Received: by 2002:a05:600c:1f87:b0:4a1:f68a:9736 with SMTP id 5b1f17b1804b1-4ac17b2be08mr233027865e9.26.1793627124284;
        Mon, 02 Nov 2026 05:45:24 -0800 (PST)
Received: from workstation.. ([110.93.227.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm319164755e9.12.2026.11.02.05.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:45:23 -0800 (PST)
From: Ali Tariq <alitariq45892@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Muchun Song <muchun.song@linux.dev>,
	Mike Rapoport <rppt@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	kasan-dev@googlegroups.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Ali Tariq <alitariq45892@gmail.com>
Subject: [PATCH] riscv: mm: Add KASAN shadow mapping to flush_cache_vmap()
Date: Mon,  2 Nov 2026 18:44:21 +0500
Message-Id: <20261102134422.610837-1-alitariq45892@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_054526_728623_3056085B 
X-CRM114-Status: GOOD (  11.90  )
X-Spam-Score: -1.9 (-)
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

Zmx1c2hfY2FjaGVfdm1hcCgpIHNldHMgYSBwZXItQ1BVIGZsYWcsIGFuZCBhIGtlcm5lbCBwYWdl
IGZhdWx0CnRoYXQgZmluZHMgdGhlIGZsYWcgc2V0IGdldHMgYW4gc2ZlbmNlLnZtYSBhbmQgYSBy
ZXRyeS4KZmx1c2hfY2FjaGVfdm1hcCgpIG9ubHkgc2V0cyB0aGUgZmxhZyBmb3Igdm1hbGxvYywg
bW9kdWxlIGFuZCB2bWVtbWFwCnJhbmdlcy4ga2FzYW5fcG9wdWxhdGVfdm1hbGxvYygpIG1hcHMg
bmV3IHNoYWRvdyBwYWdlcyBhbmQgY2FsbHMKZmx1c2hfY2FjaGVfdm1hcCgpIG9uIHRoZSBzaGFk
b3cgcmFuZ2UsIHNvIG5vIGZsYWcgZ2V0cyBzZXQuCkZvciB2bWFwKCktc3R5bGUgYXJlYXMsIGth
c2FuX3VucG9pc29uX3ZtYWxsb2MoKSB3cml0ZXMKdGhlIG5ldyBzaGFkb3cgcmlnaHQgYXdheS4g
SWYgdGhlIENQVSBoYXNu4oCZdCBzZWVuIHRoZSBuZXcgZW50cnkgeWV0LAp0aGUgc3RvcmUgZmF1
bHRzLCBhbmQgc2luY2UgdGhlcmUgaXMgbm8gZmxhZyBzZXQsIHRoZSBrZXJuZWwgY3Jhc2hlcy4K
ClsgICAgMC42NzUyMTZdIFVuYWJsZSB0byBoYW5kbGUga2VybmVsIHBhZ2luZyByZXF1ZXN0IGF0
IHZpcnR1YWwgYWRkcmVzcyBmZmZmZmZmN2MwMDlhMDAwCkN1cnJlbnQgc3dhcHBlci8wIHBndGFi
bGU6IDRLIHBhZ2VzaXplLCAzOS1iaXQgVkFzLCBwZ2RwPTB4MDAwMDAwMDAwNDUwNDAwMApbZmZm
ZmZmZjdjMDA5YTAwMF0gcGdkPTAwMDAwMDAwOWZmNmUwMDEsIHA0ZD0wMDAwMDAwMDlmZjZlMDAx
LCBwdWQ9MDAwMDAwMDA5ZmY2ZTAwMSwgcG1kPTAwMDAwMDAwNDAwZTc0MDEsIHB0ZT0wMDAwMDAw
MDQwM2NiMGU3CnN0YXR1czogMDAwMDAwMDIwMDAwMDEyMCBiYWRhZGRyOiBmZmZmZmZmN2MwMDlh
MDAwIGNhdXNlOiAwMDAwMDAwMDAwMDAwMDBmCl9fbWVtc2V0KzB4NjAvMHhmZQprYXNhbl91bnBv
aXNvbisweDI2LzB4NGUKX19rYXNhbl91bnBvaXNvbl92bWFsbG9jKzB4MjAvMHgyZQpfX2dldF92
bV9hcmVhX25vZGUrMHgxYzYvMHgyNzYKZ2V0X3ZtX2FyZWFfY2FsbGVyKzB4NTIvMHg4NAp2bWFw
KzB4ZjAvMHgyNjQKZG1hX2NvbW1vbl9jb250aWd1b3VzX3JlbWFwKzB4YTAvMHhkMAphdG9taWNf
cG9vbF9leHBhbmQrMHhiNi8weDMxMApfX2RtYV9hdG9taWNfcG9vbF9pbml0LmlzcmEuMCsweGY2
LzB4MWMwCmRtYV9hdG9taWNfcG9vbF9pbml0KzB4ZjYvMHgxYWEKZG9fb25lX2luaXRjYWxsKzB4
MTM0LzB4OTI4Cmtlcm5lbF9pbml0X2ZyZWVhYmxlKzB4NTMyLzB4NjBhCmtlcm5lbF9pbml0KzB4
MjgvMHgxNjIKcmV0X2Zyb21fZm9ya19rZXJuZWwrMHg4Mi8weDk0YwpyZXRfZnJvbV9mb3JrX2tl
cm5lbF9hc20rMHgxNi8weDE4CgpUaGUgUFRFIGlzIHZhbGlkLCBzbyB0aGUgbWFwcGluZyB3YXMg
aW4gcGxhY2Ugd2hlbiB0aGUgQ1BVIGZhdWx0ZWQuCgpUZXN0ZWQgb24gT3JhbmdlIFBpIFJWMjog
d2l0aG91dCB0aGlzIHBhdGNoIDIgb2YgMzAgYm9vdHMgY3Jhc2hlZCwKd2l0aCBpdCA1MCBvZiA1
MCBib290ZWQuCgpBZGQgdGhlIEtBU0FOIHNoYWRvdyByZWdpb24gdG8gdGhlIHJhbmdlcyBmb3Ig
d2hpY2ggZmx1c2hfY2FjaGVfdm1hcCgpCmNhbGxzIG1hcmtfbmV3X3ZhbGlkX21hcCgpLCBhcyBj
b21taXQgNGVkZDcwZWU2YTdkICgibW0vc3BhcnNlLXZtZW1tYXA6CmZsdXNoX2NhY2hlX3ZtYXAo
KSBhZnRlciBob3RwbHVnZ2luZyB2bWVtbWFwIikgZGlkIGZvciB2bWVtbWFwLgoKRml4ZXM6IDUw
MzYzOGUwYmFiZiAoInJpc2N2OiBTdG9wIGVtaXR0aW5nIHByZXZlbnRpdmUgc2ZlbmNlLnZtYSBm
b3IgbmV3IHZtYWxsb2MgbWFwcGluZ3MiKQpTaWduZWQtb2ZmLWJ5OiBBbGkgVGFyaXEgPGFsaXRh
cmlxNDU4OTJAZ21haWwuY29tPgotLS0KQ3Jhc2ggTG9nOiBodHRwczovL2tlcm5lbGNpLmNsb3Vk
LXYuY28vc2NoZWR1bGVyL2pvYi81NDEKLS0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NhY2hl
Zmx1c2guaCB8IDYgKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jYWNoZWZsdXNo
LmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NhY2hlZmx1c2guaAppbmRleCBjMmIwYTI5Mjhm
MDYuLmM5NWIyZjYwMDdmZCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jYWNo
ZWZsdXNoLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jYWNoZWZsdXNoLmgKQEAgLTgs
NiArOCw4IEBACiAKICNpbmNsdWRlIDxsaW51eC9tbS5oPgogCisjaW5jbHVkZSA8YXNtL2thc2Fu
Lmg+CisKIHN0YXRpYyBpbmxpbmUgdm9pZCBsb2NhbF9mbHVzaF9pY2FjaGVfYWxsKHZvaWQpCiB7
CiAJYXNtIHZvbGF0aWxlICgiZmVuY2UuaSIgOjo6ICJtZW1vcnkiKTsKQEAgLTU3LDcgKzU5LDkg
QEAgc3RhdGljIGlubGluZSB2b2lkIG1hcmtfbmV3X3ZhbGlkX21hcCh2b2lkKQogc3RhdGljIGlu
bGluZSB2b2lkIGZsdXNoX2NhY2hlX3ZtYXAodW5zaWduZWQgbG9uZyBzdGFydCwgdW5zaWduZWQg
bG9uZyBlbmQpCiB7CiAJaWYgKGlzX3ZtYWxsb2Nfb3JfbW9kdWxlX2FkZHIoKHZvaWQgKilzdGFy
dCkgfHwKLQkgICAgKHN0YXJ0ID49IFZNRU1NQVBfU1RBUlQgJiYgZW5kIDw9IFZNRU1NQVBfRU5E
KSkKKwkgICAgKHN0YXJ0ID49IFZNRU1NQVBfU1RBUlQgJiYgZW5kIDw9IFZNRU1NQVBfRU5EKSB8
fAorCSAgICAoSVNfRU5BQkxFRChDT05GSUdfS0FTQU4pICYmCisJICAgICBzdGFydCA+PSBLQVNB
Tl9TSEFET1dfU1RBUlQgJiYgZW5kIDw9IEtBU0FOX1NIQURPV19FTkQpKQogCQltYXJrX25ld192
YWxpZF9tYXAoKTsKIH0KICNkZWZpbmUgZmx1c2hfY2FjaGVfdm1hcF9lYXJseShzdGFydCwgZW5k
KQlsb2NhbF9mbHVzaF90bGJfa2VybmVsX3JhbmdlKHN0YXJ0LCBlbmQpCi0tIAoyLjM0LjEKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
