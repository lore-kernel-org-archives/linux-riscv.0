Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E27C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Dec 2021 02:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XVX2d5zvaCNo6qXHweVsVVGSUbCdS7fseiDIopLmkHM=; b=oKvLqI9XtfW7Ms
	KeJKWyNC0mJhZRv6+CP5mP9zauHBh5OP7JYq2fecW8N9juM5d021A/ag044HcI7DQIJLwoxZO/X/E
	/+HiijUq2tNl+tL1lv/Y3MOKOqrmpCTJrU5KPzs5/FSWpqz9QFnlHPE4fPhs9rMNvs1coHDeALZOX
	RapXjZm0q4aew1IZ3CkEYkP4MktR1dFNE9bTp36Qlmo89AJIQUPi8z71wdxbBM7c/ZygCo2KKvS9D
	h7R048AzUokuqpbPU5gPGQTNwWWYYe/7ZWxnRaiu3j3r4Bg9cM+4YtF5rUE3Rpa/14ARjcGoF3Apt
	Axz0RVENzwKfCax7l5eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mumJt-00Afb4-45; Wed, 08 Dec 2021 02:04:33 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mumJq-00Afaj-4I
 for linux-riscv@lists.infradead.org; Wed, 08 Dec 2021 02:04:31 +0000
Received: by mail-pl1-x633.google.com with SMTP id p18so509326plf.13
 for <linux-riscv@lists.infradead.org>; Tue, 07 Dec 2021 18:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QGhWCkmSzao6PeC0Ex225wGHRUhhH5KgwhKdqzOJZvA=;
 b=YZ27ixf9+XfQMtQ3uXE/cQP2Ma/8qg0/QKNM7Pw1EEZ4KgvbcWAob75HGFNVic8Se+
 zNrzhRkgISSv/Gegh3+EmZ9gKCXC6G+wVDeJ6vOaeM4Vf/zcuSUhGZpqLy0swwJQzayE
 3uR6ZR0LLj72hednCXZyC/kXJ8BF8lud+pRbmyCJdcQ4PiPS1Ktxh/t20hvo4lMu1czi
 jeWj6XUtAFlthjBXPQtQ1wSm6OUDddAIV7arUAYx3PeyA0FK/n9WcWZCl3dpfa/pRVfu
 pVNjIXul/QWGJT8VHPLJ6YAeLLD5+BVlu3zy87t4lmMj/h4jwzDC8IKw2fRwaCPzyqJr
 Zo7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QGhWCkmSzao6PeC0Ex225wGHRUhhH5KgwhKdqzOJZvA=;
 b=rixB+u7qRu5wADFhx/ZthODHQMAiOG12uQGIu2JaI2C7JHuC4M+WlUSJcWq7n2hLEb
 F3tRYSX3hmNqLndh3EC2FDRp5hYw0ZCdu8fOXjvUvG4KYkdaWQawHdaPpW1CnYaGke+n
 nKQMedPrNkuJlfcXgykibcKsFbFOrlttlPKTdTYUcbnV38ff5ZI3Nqj1p02gvUCy10KI
 SpL7wxF6VCfh/dGDf8v/2/gr3apQqAMI/WJy9YuIEbATjycY/ddxNooVc4jNLIR8rV8G
 Y54hISZkLf63u491LXIAuDYEe2WpjYU4uPSvCCaNSmEARawmuDjQkdkPq+A7+y8lUGA0
 UGTA==
X-Gm-Message-State: AOAM533Zr7XSN0hpqm8ZYNiCi1WJglZtSPUequvd5cNUq+LIRGXn5ibG
 AikWqUq5KQAVgl0uc8aUvh+ATQ==
X-Google-Smtp-Source: ABdhPJyGdggtAdCqWtci3i/oqvpmYcZUjWvaBoYPUoaEGyTuTbkrXuissLCUqR4a4hphrmR7mezhLQ==
X-Received: by 2002:a17:902:c204:b0:142:2441:aa26 with SMTP id
 4-20020a170902c20400b001422441aa26mr56090043pll.84.1638929068018; 
 Tue, 07 Dec 2021 18:04:28 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id b19sm1167929pfv.63.2021.12.07.18.04.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 18:04:27 -0800 (PST)
From: Zong Li <zong.li@sifive.com>
To: mturquette@baylibre.com, sboyd@kernel.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, lee.jones@linaro.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH 1/1] clk: sifive: Fix W=1 kernel build warning
Date: Wed,  8 Dec 2021 10:04:22 +0800
Message-Id: <d2e681e5ea31c62529b619a3777570b4792e0684.1638928796.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_180430_224920_2124E292 
X-CRM114-Status: GOOD (  11.26  )
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

VGhpcyBjb21taXQgcmV2ZXJ0cyBjb21taXQgNDg3ZGM3YmI2YTBjICgiY2xrOiBzaWZpdmU6IGZ1
NTQwLXByY2k6CkRlY2xhcmUgc3RhdGljIGNvbnN0IHZhcmlhYmxlICdwcmNpX2Nsa19mdTU0MCcg
d2hlcmUgaXQncyB1c2VkIikuCkZvciBmaXhpbmcgVz0xIGtlcm5lbCBidWlsZCB3YXJuaW5nKHMp
IGFib3V0IOKAmHByY2lfY2xrX2Z1NTQw4oCZIGRlZmluZWQKYnV0IG5vdCB1c2VkIFstV3VudXNl
ZC1jb25zdC12YXJpYWJsZT1dLCB3ZSBzaG91bGQganVzdCByZW1vdmUgdGhlCmhlYWRlciBpbmNs
dWRpbmcgaW4gZnU1NDAgYW5kIGZ1NzQwIGltcGxlbWVudGF0aW9uIHJlc3BlY3RpdmVseSwKYmVj
YXVzZSB0aGV5IGRvbid0IGFjdHVhbGx5IHVzZSB0aGVzZSBzdGF0aWMgdmFyaWFibGVzLiBBZnRl
ciB0aGF0LAp3ZSBjb3VsZCBzdGlsbCBzZXBhcmF0ZSBTb0NzLWRlcGVuZGVudCBkYXRhIGluIHRo
ZWlyIG93biBkZWZpbmF0aW9uLApyYXRoZXIgdGhhbiBwdXQgaXQgaW4gdGhlIGNvbW1vbiBjb3Jl
IGNvZGUuCgpTaWduZWQtb2ZmLWJ5OiBab25nIExpIDx6b25nLmxpQHNpZml2ZS5jb20+Ci0tLQog
ZHJpdmVycy9jbGsvc2lmaXZlL2Z1NTQwLXByY2kuYyAgfCAxIC0KIGRyaXZlcnMvY2xrL3NpZml2
ZS9mdTU0MC1wcmNpLmggIHwgNSArKysrKwogZHJpdmVycy9jbGsvc2lmaXZlL2Z1NzQwLXByY2ku
YyAgfCAxIC0KIGRyaXZlcnMvY2xrL3NpZml2ZS9zaWZpdmUtcHJjaS5jIHwgNSAtLS0tLQogNCBm
aWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9jbGsvc2lmaXZlL2Z1NTQwLXByY2kuYyBiL2RyaXZlcnMvY2xrL3NpZml2ZS9m
dTU0MC1wcmNpLmMKaW5kZXggMjliYWI5MTUwMDNjLi40MGVlNWFiMTc0OGQgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvY2xrL3NpZml2ZS9mdTU0MC1wcmNpLmMKKysrIGIvZHJpdmVycy9jbGsvc2lmaXZl
L2Z1NTQwLXByY2kuYwpAQCAtMjAsNyArMjAsNiBAQAogCiAjaW5jbHVkZSA8ZHQtYmluZGluZ3Mv
Y2xvY2svc2lmaXZlLWZ1NTQwLXByY2kuaD4KIAotI2luY2x1ZGUgImZ1NTQwLXByY2kuaCIKICNp
bmNsdWRlICJzaWZpdmUtcHJjaS5oIgogCiAvKiBQUkNJIGludGVncmF0aW9uIGRhdGEgZm9yIGVh
Y2ggV1JQTEwgaW5zdGFuY2UgKi8KZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL3NpZml2ZS9mdTU0
MC1wcmNpLmggYi9kcml2ZXJzL2Nsay9zaWZpdmUvZnU1NDAtcHJjaS5oCmluZGV4IGMyMjA2Nzdk
YzAxMC4uYzgyNzFlZmE3YmRjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2Nsay9zaWZpdmUvZnU1NDAt
cHJjaS5oCisrKyBiL2RyaXZlcnMvY2xrL3NpZml2ZS9mdTU0MC1wcmNpLmgKQEAgLTEzLDQgKzEz
LDkgQEAKIAogZXh0ZXJuIHN0cnVjdCBfX3ByY2lfY2xvY2sgX19wcmNpX2luaXRfY2xvY2tzX2Z1
NTQwW05VTV9DTE9DS19GVTU0MF07CiAKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgcHJjaV9jbGtfZGVz
YyBwcmNpX2Nsa19mdTU0MCA9IHsKKwkuY2xrcyA9IF9fcHJjaV9pbml0X2Nsb2Nrc19mdTU0MCwK
KwkubnVtX2Nsa3MgPSBBUlJBWV9TSVpFKF9fcHJjaV9pbml0X2Nsb2Nrc19mdTU0MCksCit9Owor
CiAjZW5kaWYgLyogX19TSUZJVkVfQ0xLX0ZVNTQwX1BSQ0lfSCAqLwpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9jbGsvc2lmaXZlL2Z1NzQwLXByY2kuYyBiL2RyaXZlcnMvY2xrL3NpZml2ZS9mdTc0MC1w
cmNpLmMKaW5kZXggNTNmNmUwMGEwM2I5Li5lMWRhNGVlYzA3ODYgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvY2xrL3NpZml2ZS9mdTc0MC1wcmNpLmMKKysrIGIvZHJpdmVycy9jbGsvc2lmaXZlL2Z1NzQw
LXByY2kuYwpAQCAtOCw3ICs4LDYgQEAKIAogI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL3Np
Zml2ZS1mdTc0MC1wcmNpLmg+CiAKLSNpbmNsdWRlICJmdTU0MC1wcmNpLmgiCiAjaW5jbHVkZSAi
c2lmaXZlLXByY2kuaCIKIAogLyogUFJDSSBpbnRlZ3JhdGlvbiBkYXRhIGZvciBlYWNoIFdSUExM
IGluc3RhbmNlICovCmRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9zaWZpdmUvc2lmaXZlLXByY2ku
YyBiL2RyaXZlcnMvY2xrL3NpZml2ZS9zaWZpdmUtcHJjaS5jCmluZGV4IDgwYTI4OGM1OWU1Ni4u
OTE2ZDJmYzI4YjljIDEwMDY0NAotLS0gYS9kcml2ZXJzL2Nsay9zaWZpdmUvc2lmaXZlLXByY2ku
YworKysgYi9kcml2ZXJzL2Nsay9zaWZpdmUvc2lmaXZlLXByY2kuYwpAQCAtMTIsMTEgKzEyLDYg
QEAKICNpbmNsdWRlICJmdTU0MC1wcmNpLmgiCiAjaW5jbHVkZSAiZnU3NDAtcHJjaS5oIgogCi1z
dGF0aWMgY29uc3Qgc3RydWN0IHByY2lfY2xrX2Rlc2MgcHJjaV9jbGtfZnU1NDAgPSB7Ci0JLmNs
a3MgPSBfX3ByY2lfaW5pdF9jbG9ja3NfZnU1NDAsCi0JLm51bV9jbGtzID0gQVJSQVlfU0laRShf
X3ByY2lfaW5pdF9jbG9ja3NfZnU1NDApLAotfTsKLQogLyoKICAqIFByaXZhdGUgZnVuY3Rpb25z
CiAgKi8KLS0gCjIuMzEuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
