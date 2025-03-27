Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CADC7C36013
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Mar 2025 19:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yoNJY57PnjaajVGO0wPXJ5f6IDI9UVjViQPB6RN2TeA=; b=ZIeINmo9+nocXt
	Fyd6fWe4br0Dtr+o/7QUHdRwUkH8u76wBooVwCQQE0YJGrcCFE8bSHrSVdvnp1gmiS8jkexj1+MeF
	/Eq21cCzkk/++oqD6nlsWCTL7uFk8mbTGNuwMzYFk7Et2Pslw6m+Br3OQ/ta/Hsh1TGHqiVnBy4dm
	6vDF9mE3XFpMdSrDLjgP9vbd5oJDWWTKWlN1AuM7KXHs2F4DYjEGU+n5GinXY/dH+imlZgIFkAxCF
	q/57Y/Piknw6lELfGQ+JAG4kpc05duCMtgOjwtG4+ij3ZhslKSZ2mjN47M7h+Vy9TgmhiXmqv2HMQ
	GSmYx59nRDRjBWxHa7xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txtC7-0000000Bsaw-0IPf;
	Thu, 27 Mar 2025 19:47:15 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txt1d-0000000Bpar-1t58
	for linux-riscv@lists.infradead.org;
	Thu, 27 Mar 2025 19:36:27 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-22423adf751so28526615ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 27 Mar 2025 12:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1743104185; x=1743708985; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yUgUK85uZXa6Y/dNTr7Q9E0wfwXHdLdLqKfyUg5SYXI=;
        b=I8fn1h7ozu47fV+59BO/m8nosNg0y8F5UEl2l0sRcjp7fzcMSXgzlko+N6H5TPmITo
         PGE43+OQZXqlbseGQ5piKxIz79z9Zwot/onzOCqCSuDVqwGnJKOlbrD1QgoZy3mGJWyp
         BY6Dx0X3oHTgNojntbKvQ2uqxQ7Dtrw51i3zaS3twX7fyFrfI+Qpm3YCTjr6r4A+iJFW
         vfxlijZxlvBuZwwc7iBJI2RuiP+b74b+JH7lObYjdqFxxiYqoO3JH/MwrFaALGIwE5Nw
         7wk+sIFr13uy6vQ9rXSTT9Ms1A07S4ImrbXFqAeSDnrUQpfLaJN877+OOefNeQpa286X
         J/6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743104185; x=1743708985;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yUgUK85uZXa6Y/dNTr7Q9E0wfwXHdLdLqKfyUg5SYXI=;
        b=bJ/qTvvqT1Ri7+f4/ENeksWmCBidAKpeBvXAGwfPwLvoQpigpw4EmBO+0F0iTd8bFc
         fUFcbYN9bqBqH4sBWJLnlTo9xwzguUfx1iQRLkGWsqxmOCdzIE5WwvbBvccl9beqhamR
         Nry1zejWs1pDsBqR8UgFEzLyLPI3SEts0yF3L1z9NDZnRsv46/9K9LQBIkGG+MqUjmRa
         tQrm9HxEJ4KcpjNKltLx1eef1NOJReTm6U1D3a6B6CgmfCg6kGlkrODOV56UOC3FKoP1
         mtKryFYcuDmhnS7PGwskccS/prlJOGlaUIdDXufq6gjKa0KPy0xOxLhMnpbevxpW2Qos
         wNDg==
X-Gm-Message-State: AOJu0Yy7uwKOMGlii77Pjx9wDAYYSBT/olQ/M3wxk8dGyQ71xL7vIsjT
	l07HzbAcXAvBgLmnJ8Bq9J5c6TAomVWQHs3jQK8DkDgeRcso44ARM9vXDsUCKts=
X-Gm-Gg: ASbGncuP2wASkRBEFphPAxcuTfJCOJ1EWnmYGle0dmTyJliOZ+3BceGKeOGYAFncLS3
	M2SN7VhNAFGG76ysHdIseIoRaxdwONzNRr+zeRaBneQhc+y0JS9+VKKgpHALAGCPPXDUHll0BuO
	gM9C0Z2DOadFRRfFpwBOzqJ57cxHuCC4SocQ7c4dl4axIQX/v8dZRQwxpbHzn1hvSeZSwngl7GV
	PC2dmeekwuSqca+Ky/derI7g+xCsplhoc/StxO/lP8xjVxbkMyAl9qD48jHK1p9Pa4Dslj2zumX
	aV2LjoMhhvpV+H9lhNWE2Gcc55CRGCi/gu69JPrUkB/qgJ1B5JIldGpKfA==
X-Google-Smtp-Source: AGHT+IHsQmzPAsgx/ng9OITR58/G/eBONWXQGgyTGskdwaITzdO2LxTvI25NheeogcoyYSwC74/u/Q==
X-Received: by 2002:a17:90b:2f4d:b0:2fe:8a84:e033 with SMTP id 98e67ed59e1d1-303a7b5a137mr7359505a91.2.1743104184705;
        Thu, 27 Mar 2025 12:36:24 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f6b638csm2624220a91.44.2025.03.27.12.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 12:36:24 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 27 Mar 2025 12:35:49 -0700
Subject: [PATCH v5 08/21] RISC-V: Add Sscfg extension CSR definition
MIME-Version: 1.0
Message-Id: <20250327-counter_delegation-v5-8-1ee538468d1b@rivosinc.com>
References: <20250327-counter_delegation-v5-0-1ee538468d1b@rivosinc.com>
In-Reply-To: <20250327-counter_delegation-v5-0-1ee538468d1b@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atishp@atishpatra.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, weilin.wang@intel.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 Atish Patra <atishp@rivosinc.com>, Kaiwen Xue <kaiwenx@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_123625_494588_CAFF8179 
X-CRM114-Status: UNSURE (   8.97  )
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

RnJvbTogS2Fpd2VuIFh1ZSA8a2Fpd2VueEByaXZvc2luYy5jb20+CgpUaGlzIGFkZHMgdGhlIHNj
b3VudGluaGliaXQgQ1NSIGRlZmluaXRpb24gYW5kIFMtbW9kZSBhY2Nlc3NpYmxlIGhwbWV2ZW50
CmJpdHMgZGVmaW5lZCBieSBzbWNkZWxlZy9zc2NjZmcuIHNjb3VudGluaGliaXQgYWxsb3dzIFMt
bW9kZSB0byBzdGFydC9zdG9wCmNvdW50ZXJzIGRpcmVjdGx5IGZyb20gUy1tb2RlIHdpdGhvdXQg
aW52b2tpbmcgU0JJIGNhbGxzIHRvIE0tbW9kZS4gSXQgaXMKYWxzbyB1c2VkIHRvIGZpZ3VyZSBv
dXQgdGhlIGNvdW50ZXJzIGRlbGVnYXRlZCB0byBTLW1vZGUgYnkgdGhlIE0tbW9kZSBhcwp3ZWxs
LgoKU2lnbmVkLW9mZi1ieTogS2Fpd2VuIFh1ZSA8a2Fpd2VueEByaXZvc2luYy5jb20+ClJldmll
d2VkLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+Ci0tLQogYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9jc3IuaCB8IDI2ICsrKysrKysrKysrKysrKysrKysrKysrKysrCiAx
IGZpbGUgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vY3NyLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nzci5oCmluZGV4IGJj
ZTU2YTgzYzM4NC4uM2QyZDRmODg2Yzc3IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2Nzci5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3NyLmgKQEAgLTIzMCw2ICsy
MzAsMzEgQEAKICNkZWZpbmUgU01TVEFURUVOMF9IU0VOVkNGRwkJKF9VTEwoMSkgPDwgU01TVEFU
RUVOMF9IU0VOVkNGR19TSElGVCkKICNkZWZpbmUgU01TVEFURUVOMF9TU1RBVEVFTjBfU0hJRlQJ
NjMKICNkZWZpbmUgU01TVEFURUVOMF9TU1RBVEVFTjAJCShfVUxMKDEpIDw8IFNNU1RBVEVFTjBf
U1NUQVRFRU4wX1NISUZUKQorLyogSFBNRVZFTlQgYml0cy4gVGhlc2UgYXJlIGFjY2Vzc2libGUg
aW4gUy1tb2RlIHZpYSBTbWNkZWxlZy9Tc2NjZmcgKi8KKyNpZmRlZiBDT05GSUdfNjRCSVQKKyNk
ZWZpbmUgSFBNRVZFTlRfT0YJCQkoQklUX1VMTCg2MykpCisjZGVmaW5lIEhQTUVWRU5UX01JTkgJ
CQkoQklUX1VMTCg2MikpCisjZGVmaW5lIEhQTUVWRU5UX1NJTkgJCQkoQklUX1VMTCg2MSkpCisj
ZGVmaW5lIEhQTUVWRU5UX1VJTkgJCQkoQklUX1VMTCg2MCkpCisjZGVmaW5lIEhQTUVWRU5UX1ZT
SU5ICQkJKEJJVF9VTEwoNTkpKQorI2RlZmluZSBIUE1FVkVOVF9WVUlOSAkJCShCSVRfVUxMKDU4
KSkKKyNlbHNlCisjZGVmaW5lIEhQTUVWRU5USF9PRgkJCShCSVRfVUxMKDMxKSkKKyNkZWZpbmUg
SFBNRVZFTlRIX01JTkgJCQkoQklUX1VMTCgzMCkpCisjZGVmaW5lIEhQTUVWRU5USF9TSU5ICQkJ
KEJJVF9VTEwoMjkpKQorI2RlZmluZSBIUE1FVkVOVEhfVUlOSAkJCShCSVRfVUxMKDI4KSkKKyNk
ZWZpbmUgSFBNRVZFTlRIX1ZTSU5ICQkJKEJJVF9VTEwoMjcpKQorI2RlZmluZSBIUE1FVkVOVEhf
VlVJTkgJCQkoQklUX1VMTCgyNikpCisKKyNkZWZpbmUgSFBNRVZFTlRfT0YJCQkoSFBNRVZFTlRI
X09GIDw8IDMyKQorI2RlZmluZSBIUE1FVkVOVF9NSU5ICQkJKEhQTUVWRU5USF9NSU5IIDw8IDMy
KQorI2RlZmluZSBIUE1FVkVOVF9TSU5ICQkJKEhQTUVWRU5USF9TSU5IIDw8IDMyKQorI2RlZmlu
ZSBIUE1FVkVOVF9VSU5ICQkJKEhQTUVWRU5USF9VSU5IIDw8IDMyKQorI2RlZmluZSBIUE1FVkVO
VF9WU0lOSAkJCShIUE1FVkVOVEhfVlNJTkggPDwgMzIpCisjZGVmaW5lIEhQTUVWRU5UX1ZVSU5I
CQkJKEhQTUVWRU5USF9WVUlOSCA8PCAzMikKKyNlbmRpZgorCisjZGVmaW5lIFNJU0VMRUNUX1NT
Q0NGR19CQVNFCQkweDQwCiAKIC8qIG1zZWNjZmcgYml0cyAqLwogI2RlZmluZSBNU0VDQ0ZHX1BN
TQkJCUVOVkNGR19QTU0KQEAgLTMxMSw2ICszMzYsNyBAQAogI2RlZmluZSBDU1JfU0NPVU5URVJF
TgkJMHgxMDYKICNkZWZpbmUgQ1NSX1NFTlZDRkcJCTB4MTBhCiAjZGVmaW5lIENTUl9TU1RBVEVF
TjAJCTB4MTBjCisjZGVmaW5lIENTUl9TQ09VTlRJTkhJQklUCTB4MTIwCiAjZGVmaW5lIENTUl9T
U0NSQVRDSAkJMHgxNDAKICNkZWZpbmUgQ1NSX1NFUEMJCTB4MTQxCiAjZGVmaW5lIENTUl9TQ0FV
U0UJCTB4MTQyCgotLSAKMi40My4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
