Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F121CD1292
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Apr 2024 21:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=htryupzJXAPKM9aD9kto3PQ+ZnpoYZ1WLb7Rf303XzY=; b=huduo/h8QwkKlN
	fsoStJ+mJFz7n4EKKSJtdQiDc+yFHcGukRCkAgvipXCEEYbuHRpcWL9R4O+jGltpMgIcOHakOHvU/
	1mfG7r5cakzztCHg/Vt1quy5dK30ryJ3lYIqkdqJzJf7EDN/vacePU/8YyKuZCmGu54cwJh/qFO2u
	h0i1AH9xfnQlZG0f08rz54hrNSWAtJbVd7eK+sZ39650AGwT90Ji+TQlpNLfgU4QtFVb1M4tot3qp
	JJdFLrpzlx1W/WHZ9cC5dZhjbcEjoXTPo+rmiIiDPYG+3G3NdOEceFqB9CjbfxqPAb+Bdjy+Qho5+
	AU6zdHyJ9RZv9HGk+YDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rta88-0000000DYZN-3zjd;
	Sun, 07 Apr 2024 21:32:48 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rta84-0000000DYYI-41vn
	for linux-riscv@lists.infradead.org;
	Sun, 07 Apr 2024 21:32:46 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2d8863d8a6eso10375371fa.3
        for <linux-riscv@lists.infradead.org>; Sun, 07 Apr 2024 14:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vrull.eu; s=google; t=1712525562; x=1713130362; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cpsym7Sf/nHOWsd3i9dIJWLFXouR7iLMcrTGkY+MhkE=;
        b=n6X8j03dniYW8GRmcNDz6c6V8q3Y5bgZtphIPMA/aUCn4mMGHT6FfkHjvQYAqDfx5k
         /6I+0uJzot5IsGvca7dZtoPKvZ99YPauim2+3zrg9RlFVj8ZQ5MpDRYKR8B8iWA6uRkU
         CeMJObegm9cbptV6ogwccaY68m072gD5vr9XzS0j5TTI1kf7JRAoqK8FsoUOk+H6vxbG
         e4l81BmlZddcAlI6NJXuZeXCyfVWykzPyCEaV5y/08yJGg+MpTFd+LH0bjn+gfUwwQDG
         hLBSy8rzH9G6MtcfoG6fn9Tg9+/CtueenfHuUIVTazdHbBLGcyLHxYIRUMxg4SQqr33F
         De1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712525562; x=1713130362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cpsym7Sf/nHOWsd3i9dIJWLFXouR7iLMcrTGkY+MhkE=;
        b=BDRXf/cG+HT4kSQrdz1uxrcGukmgJoOtN/KXJix4P18W4k1TAlIwUqNtWpIpXXYhls
         fxTCv3LviwiD15P69E/951kpOMc8PUQmmY/2yrdB/PrC62NK3XAz5Phwp3cuj4Cj6kZ9
         ljRZP87Xmhm0DlVd1Pg7Wl01cmSY6Dgxgu2ISHooZ/ZGWj+MTvTdMlZHuSljzj/C3ywr
         Z5apu2MghxzYcA6OA4HVtlOfpbPfY2oA26vgvaI0NzeTuUmizNqzTAgmV31bn7hSgcAA
         hCG5ugby5Y8wO7iOocljA5HUh/pFhwHYIoZKP7kFKPSphBaJz0/jd1gpt01EQ5uiF+/R
         JPfw==
X-Gm-Message-State: AOJu0Yw0NowtFnpCtll8qIJG/ojl8OVOYNEUIhA+eW+zAyCPm63xaVIB
	haYxXh7Onct9AHMTpJLG14jK8qEENGwMbME7ziVkdJYM1+ccSO6yg9PQIuzSlvwiVG14+eAXw2L
	lxtA=
X-Google-Smtp-Source: AGHT+IHu0pX2u2R5/xFiOzLKYemPhVeotLvlqxwy6j4sGwaJJZl/b8VeAR1RK5E1ty/vAsGXsDt7hA==
X-Received: by 2002:a2e:bb91:0:b0:2d6:c001:d87 with SMTP id y17-20020a2ebb91000000b002d6c0010d87mr4816723lje.8.1712525562496;
        Sun, 07 Apr 2024 14:32:42 -0700 (PDT)
Received: from antares.fritz.box (62-178-148-172.cable.dynamic.surfer.at. [62.178.148.172])
        by smtp.gmail.com with ESMTPSA id i2-20020a50fc02000000b0056e22be831dsm3267562edr.42.2024.04.07.14.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Apr 2024 14:32:41 -0700 (PDT)
From: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Cooper Qu <cooper.qu@linux.alibaba.com>,
	Zhiwei Liu <zhiwei_liu@linux.alibaba.com>,
	Huang Tao <eric.huang@linux.alibaba.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor@kernel.org>,
	Qingfang Deng <dqfext@gmail.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel.holland@sifive.com>
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 2/2] riscv: T-Head: Test availability bit before enabling MAE errata
Date: Sun,  7 Apr 2024 23:32:36 +0200
Message-ID: <20240407213236.2121592-3-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240407213236.2121592-1-christoph.muellner@vrull.eu>
References: <20240407213236.2121592-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240407_143245_025659_9BF64FE3 
X-CRM114-Status: GOOD (  14.07  )
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

VC1IZWFkJ3MgbWVtb3J5IGF0dHJpYnV0ZSBleHRlbnNpb24gKFhUaGVhZE1hZSkgKG5vbi1jb21w
YXRpYmxlCmVxdWl2YWxlbnQgb2YgUlZJJ3MgU3ZwYm10KSBpcyBjdXJyZW50bHkgYXNzdW1lZCBm
b3IgYWxsIFQtSGVhZCBoYXJ0cy4KSG93ZXZlciwgUUVNVSByZWNlbnRseSBkZWNpZGVkIHRvIGRy
b3AgYWNjZXB0YW5jZSBvZiBndWVzdHMgdGhhdCB3cml0ZQpyZXNlcnZlZCBiaXRzIGluIFBURXMu
CkFzIFhUaGVhZE1hZSB1c2VzIHJlc2VydmVkIGJpdHMgaW4gUFRFcyBhbmQgTGludXggYXBwbGll
cyB0aGUgTUFFIGVycmF0YQpmb3IgYWxsIFQtSGVhZCBoYXJ0cywgdGhpcyBicm9rZSB0aGUgTGlu
dXggc3RhcnR1cCBvbiBRRU1VIGVtdWxhdGlvbnMKb2YgdGhlIEM5MDYgZW11bGF0aW9uLgoKVGhp
cyBwYXRjaCBhdHRlbXB0cyB0byBhZGRyZXNzIHRoaXMgaXNzdWUgYnkgdGVzdGluZyB0aGUgTUFF
LWVuYWJsZSBiaXQKaW4gdGhlIHRoLnN4c3RhdHVzIENTUi4gVGhpcyBDU1IgaXMgYXZhaWxhYmxl
IGluIEhXIGFuZCBjYW4gYmUKZW11bGF0ZWQgaW4gUUVNVS4KClRoaXMgcGF0Y2ggYWxzbyBtYWtl
cyB0aGUgWFRoZWFkTWFlIHByb2JpbmcgbWVjaGFuaXNtIHJlbGlhYmxlLCBiZWNhdXNlCmEgdGVz
dCBmb3IgdGhlIHJpZ2h0IGNvbWJpbmF0aW9uIG9mIG12ZW5kb3JpZCwgbWFyY2hpZCwgYW5kIG1p
bXBpZAppcyBub3Qgc3VmZmljaWVudCB0byBlbmFibGUgTUFFLgoKUmV2aWV3ZWQtYnk6IENvbm9y
IERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+ClNpZ25lZC1vZmYtYnk6IENocmlz
dG9waCBNw7xsbG5lciA8Y2hyaXN0b3BoLm11ZWxsbmVyQHZydWxsLmV1PgotLS0KIGFyY2gvcmlz
Y3YvZXJyYXRhL3RoZWFkL2VycmF0YS5jIHwgMTQgKysrKysrKysrKy0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCAxMCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3YvZXJyYXRhL3RoZWFkL2VycmF0YS5jIGIvYXJjaC9yaXNjdi9lcnJhdGEvdGhlYWQvZXJy
YXRhLmMKaW5kZXggNmU3ZWUxZjE2YmVlLi5iZjZhMGE2MzE4ZWUgMTAwNjQ0Ci0tLSBhL2FyY2gv
cmlzY3YvZXJyYXRhL3RoZWFkL2VycmF0YS5jCisrKyBiL2FyY2gvcmlzY3YvZXJyYXRhL3RoZWFk
L2VycmF0YS5jCkBAIC0xOSw2ICsxOSw5IEBACiAjaW5jbHVkZSA8YXNtL3BhdGNoLmg+CiAjaW5j
bHVkZSA8YXNtL3ZlbmRvcmlkX2xpc3QuaD4KIAorI2RlZmluZSBDU1JfVEhfU1hTVEFUVVMJCTB4
NWMwCisjZGVmaW5lIFNYU1RBVFVTX01BRUUJCV9BQygweDIwMDAwMCwgVUwpCisKIHN0YXRpYyBi
b29sIGVycmF0YV9wcm9iZV9tYWUodW5zaWduZWQgaW50IHN0YWdlLAogCQkJICAgICB1bnNpZ25l
ZCBsb25nIGFyY2hfaWQsIHVuc2lnbmVkIGxvbmcgaW1waWQpCiB7CkBAIC0yOCwxMSArMzEsMTQg
QEAgc3RhdGljIGJvb2wgZXJyYXRhX3Byb2JlX21hZSh1bnNpZ25lZCBpbnQgc3RhZ2UsCiAJaWYg
KGFyY2hfaWQgIT0gMCB8fCBpbXBpZCAhPSAwKQogCQlyZXR1cm4gZmFsc2U7CiAKLQlpZiAoc3Rh
Z2UgPT0gUklTQ1ZfQUxURVJOQVRJVkVTX0VBUkxZX0JPT1QgfHwKLQkgICAgc3RhZ2UgPT0gUklT
Q1ZfQUxURVJOQVRJVkVTX01PRFVMRSkKLQkJcmV0dXJuIHRydWU7CisJaWYgKHN0YWdlICE9IFJJ
U0NWX0FMVEVSTkFUSVZFU19FQVJMWV9CT09UICYmCisJICAgIHN0YWdlICE9IFJJU0NWX0FMVEVS
TkFUSVZFU19NT0RVTEUpCisJCXJldHVybiBmYWxzZTsKIAotCXJldHVybiBmYWxzZTsKKwlpZiAo
IShjc3JfcmVhZChDU1JfVEhfU1hTVEFUVVMpICYgU1hTVEFUVVNfTUFFRSkpCisJCXJldHVybiBm
YWxzZTsKKworCXJldHVybiB0cnVlOwogfQogCiAvKgotLSAKMi40NC4wCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
