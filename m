Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E8ACC83F15
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 17:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yvYWilFqraoIXEgcXZGepUnEFAkx+DyH7YlOEySjcAY=; b=DCBgQb0HNrPJwp
	KxXDdUP5FG4oCknGTeKLrgznSEwMLIJfHNEafITxHBHxzsSa3/g+sRYul/9kyB5G844XOUjkLbRAt
	oq9FLBwqsWJ6F9Ox/mLF8VkaB8NHmC8rXqldo9ikw683QZ6hdxcxi2x2TUoZC507N7xwiqHJKHli2
	g+QEpjByFPELHEwM7Cjf4QhYQ8oyWQAOIzDmhqjiKzZKC18GjlAKBrzrLXoG27KWchZSd0z3oYzkG
	t6N6pS/HOdZ1cHib0XqcFWuQoH1cXjJi3PB1d2hHUqxzjtChrTKDFDb++yUMdeXtE6Jr8gAc7Gj8t
	bImCNJvGK92Gq8U5bZlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qafaz-009wxV-1o;
	Mon, 28 Aug 2023 17:00:09 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qafaw-009wvI-0h
	for linux-riscv@lists.infradead.org;
	Mon, 28 Aug 2023 17:00:07 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-401bdff4cb4so23751965e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 28 Aug 2023 10:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693242000; x=1693846800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8P7/Zkeac2PFc5cssTAi6ZYqGhNKmBRPTm9VR7EbbnQ=;
        b=k5b70U+ZUANzv/IDScpVmw3R2qaefcllK7WC8Nha9UpJvpdmbkS5pfzSapqRgPxfZo
         T9p177CuHrWQGR9yj5JGvAYv9zaYYH+05pfrcKjjwtHPb/eqXq5rOLWjgu6fwHagd7l7
         FwjMFX0biUYYB0LBJ/b/uvxG2jr+aFTe4MRBAeYHxcMeFsS/K7JZFkMCfDC2pYTF5UxV
         pmjptilC7+XLgYiVah62rVoqBxlNacLZEW/uFl2r++7kaQHKRqhmc+ZEXZ4/MgJadxiN
         SlZ9UxZ9lxzgzzjyg9R/9TyQNSNtqidAvkopPpQP3cU0w3DGRhIopD+MbMFu1DdfXQkN
         trUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693242000; x=1693846800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8P7/Zkeac2PFc5cssTAi6ZYqGhNKmBRPTm9VR7EbbnQ=;
        b=DDK2RdsaZDoCDa4Sd5WWYmMlam/TVVLQFS2PdXT2nfnjevh3mbNMgckBCQCsvCbmQ3
         /DyE69W1tqbTEZr3c+BetuIqXeQToUjGsnk+NTM05oxcIBHhqupJt6u/Wr3+zF269u5Y
         rkmVBVYQakE+Y0z6DZO8WEigKe0EjqOHd41F/u4lfMIw0plsWo0o28KrzSM/XOwv/bal
         RyXID/WSi2Fx7HEVNQm2yjwuCgqWVlOD/tJ4dveb9r0ZSYJCv6k/U6QtR0qkCCt7si5S
         b4M2SxdNCfQoiIXvoOqUt+94dty4SbhPzY0TlXwvyPRks89MoOlH2z0LNKnz5Ywdsnwz
         RrQw==
X-Gm-Message-State: AOJu0Yw/EGmDmgdcNZfU1mpRbRgYK6xLKKTWDsuTzLkJmNDpxptgdhkx
	diL7/wqGQ97PcR5r9xy7T6Y=
X-Google-Smtp-Source: AGHT+IHEmWlVZTHQ0UdjiaiuoDBvpVXt9N2cIoSQkZkdFqsjMRcSrFBXHhd6HB1m2RxLs3sY30C9cg==
X-Received: by 2002:a1c:f304:0:b0:3fc:60:7dbf with SMTP id q4-20020a1cf304000000b003fc00607dbfmr20878500wmq.41.1693241999647;
        Mon, 28 Aug 2023 09:59:59 -0700 (PDT)
Received: from ip-172-31-30-46.eu-west-1.compute.internal (ec2-54-170-241-106.eu-west-1.compute.amazonaws.com. [54.170.241.106])
        by smtp.gmail.com with ESMTPSA id g9-20020a056000118900b0031ad5fb5a0fsm11033613wrx.58.2023.08.28.09.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 09:59:59 -0700 (PDT)
From: Puranjay Mohan <puranjay12@gmail.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	pulehui@huawei.com,
	conor.dooley@microchip.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	song@kernel.org,
	yhs@fb.com,
	kpsingh@kernel.org,
	bjorn@kernel.org,
	bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: puranjay12@gmail.com
Subject: [PATCH bpf-next v3 1/3] riscv: extend patch_text_nosync() for multiple pages
Date: Mon, 28 Aug 2023 16:59:56 +0000
Message-Id: <20230828165958.1714079-2-puranjay12@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230828165958.1714079-1-puranjay12@gmail.com>
References: <20230828165958.1714079-1-puranjay12@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_100006_278155_810141C1 
X-CRM114-Status: GOOD (  15.49  )
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

VGhlIHBhdGNoX2luc25fd3JpdGUoKSBmdW5jdGlvbiBjdXJyZW50bHkgZG9lc24ndCB3b3JrIGZv
ciBtdWx0aXBsZSBwYWdlcwpvZiBpbnN0cnVjdGlvbnMsIHRoZXJlZm9yZSBwYXRjaF90ZXh0X25v
c3luYygpIHdpbGwgZmFpbCB3aXRoIGEgcGFnZSBmYXVsdAppZiBjYWxsZWQgd2l0aCBsZW5ndGhz
IHNwYW5uaW5nIG11bHRpcGxlIHBhZ2VzLgoKVGhpcyBjb21taXQgZXh0ZW5kcyB0aGUgcGF0Y2hf
aW5zbl93cml0ZSgpIGZ1bmN0aW9uIHRvIHN1cHBvcnQgbXVsdGlwbGUKcGFnZXMgYnkgY29weWlu
ZyBhdCBtYXggMiBwYWdlcyBhdCBhIHRpbWUgaW4gYSBsb29wLiBUaGlzIGltcGxlbWVudGF0aW9u
CmlzIHNpbWlsYXIgdG8gdGV4dF9wb2tlX2NvcHkoKSBmdW5jdGlvbiBvZiB4ODYuCgpTaWduZWQt
b2ZmLWJ5OiBQdXJhbmpheSBNb2hhbiA8cHVyYW5qYXkxMkBnbWFpbC5jb20+ClJldmlld2VkLWJ5
OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Ci0tLQogYXJjaC9yaXNjdi9rZXJu
ZWwvcGF0Y2guYyB8IDM3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAzMiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3Yva2VybmVsL3BhdGNoLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9wYXRjaC5j
CmluZGV4IDU3NWU3MWQ2YzhhZS4uMmM5N2UyNDZmNGRjIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2
L2tlcm5lbC9wYXRjaC5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3BhdGNoLmMKQEAgLTUzLDEy
ICs1MywxOCBAQCBzdGF0aWMgdm9pZCBwYXRjaF91bm1hcChpbnQgZml4bWFwKQogfQogTk9LUFJP
QkVfU1lNQk9MKHBhdGNoX3VubWFwKTsKIAotc3RhdGljIGludCBwYXRjaF9pbnNuX3dyaXRlKHZv
aWQgKmFkZHIsIGNvbnN0IHZvaWQgKmluc24sIHNpemVfdCBsZW4pCitzdGF0aWMgaW50IF9fcGF0
Y2hfaW5zbl93cml0ZSh2b2lkICphZGRyLCBjb25zdCB2b2lkICppbnNuLCBzaXplX3QgbGVuKQog
ewogCXZvaWQgKndhZGRyID0gYWRkcjsKIAlib29sIGFjcm9zc19wYWdlcyA9ICgoKHVpbnRwdHJf
dCkgYWRkciAmIH5QQUdFX01BU0spICsgbGVuKSA+IFBBR0VfU0laRTsKIAlpbnQgcmV0OwogCisJ
LyoKKwkgKiBPbmx5IHR3byBwYWdlcyBjYW4gYmUgbWFwcGVkIGF0IGEgdGltZSBmb3Igd3JpdGlu
Zy4KKwkgKi8KKwlpZiAobGVuICsgb2Zmc2V0X2luX3BhZ2UoYWRkcikgPiAyICogUEFHRV9TSVpF
KQorCQlyZXR1cm4gLUVJTlZBTDsKKwogCS8qCiAJICogQmVmb3JlIHJlYWNoaW5nIGhlcmUsIGl0
IHdhcyBleHBlY3RlZCB0byBsb2NrIHRoZSB0ZXh0X211dGV4CiAJICogYWxyZWFkeSwgc28gd2Ug
ZG9uJ3QgbmVlZCB0byBnaXZlIGFub3RoZXIgbG9jayBoZXJlIGFuZCBjb3VsZApAQCAtNzQsNyAr
ODAsNyBAQCBzdGF0aWMgaW50IHBhdGNoX2luc25fd3JpdGUodm9pZCAqYWRkciwgY29uc3Qgdm9p
ZCAqaW5zbiwgc2l6ZV90IGxlbikKIAkJbG9ja2RlcF9hc3NlcnRfaGVsZCgmdGV4dF9tdXRleCk7
CiAKIAlpZiAoYWNyb3NzX3BhZ2VzKQotCQlwYXRjaF9tYXAoYWRkciArIGxlbiwgRklYX1RFWFRf
UE9LRTEpOworCQlwYXRjaF9tYXAoYWRkciArIFBBR0VfU0laRSwgRklYX1RFWFRfUE9LRTEpOwog
CiAJd2FkZHIgPSBwYXRjaF9tYXAoYWRkciwgRklYX1RFWFRfUE9LRTApOwogCkBAIC04NywxNSAr
OTMsMzYgQEAgc3RhdGljIGludCBwYXRjaF9pbnNuX3dyaXRlKHZvaWQgKmFkZHIsIGNvbnN0IHZv
aWQgKmluc24sIHNpemVfdCBsZW4pCiAKIAlyZXR1cm4gcmV0OwogfQotTk9LUFJPQkVfU1lNQk9M
KHBhdGNoX2luc25fd3JpdGUpOworTk9LUFJPQkVfU1lNQk9MKF9fcGF0Y2hfaW5zbl93cml0ZSk7
CiAjZWxzZQotc3RhdGljIGludCBwYXRjaF9pbnNuX3dyaXRlKHZvaWQgKmFkZHIsIGNvbnN0IHZv
aWQgKmluc24sIHNpemVfdCBsZW4pCitzdGF0aWMgaW50IF9fcGF0Y2hfaW5zbl93cml0ZSh2b2lk
ICphZGRyLCBjb25zdCB2b2lkICppbnNuLCBzaXplX3QgbGVuKQogewogCXJldHVybiBjb3B5X3Rv
X2tlcm5lbF9ub2ZhdWx0KGFkZHIsIGluc24sIGxlbik7CiB9Ci1OT0tQUk9CRV9TWU1CT0wocGF0
Y2hfaW5zbl93cml0ZSk7CitOT0tQUk9CRV9TWU1CT0woX19wYXRjaF9pbnNuX3dyaXRlKTsKICNl
bmRpZiAvKiBDT05GSUdfTU1VICovCiAKK3N0YXRpYyBpbnQgcGF0Y2hfaW5zbl93cml0ZSh2b2lk
ICphZGRyLCBjb25zdCB2b2lkICppbnNuLCBzaXplX3QgbGVuKQoreworCXNpemVfdCBwYXRjaGVk
ID0gMDsKKwlzaXplX3Qgc2l6ZTsKKwlpbnQgcmV0ID0gMDsKKworCS8qCisJICogQ29weSB0aGUg
aW5zdHJ1Y3Rpb25zIHRvIHRoZSBkZXN0aW5hdGlvbiBhZGRyZXNzLCB0d28gcGFnZXMgYXQgYSB0
aW1lCisJICogYmVjYXVzZSBfX3BhdGNoX2luc25fd3JpdGUoKSBjYW4gb25seSBoYW5kbGUgbGVu
IDw9IDIgKiBQQUdFX1NJWkUuCisJICovCisJd2hpbGUgKHBhdGNoZWQgPCBsZW4gJiYgIXJldCkg
eworCQlzaXplID0gbWluX3Qoc2l6ZV90LCBQQUdFX1NJWkUgKiAyIC0gb2Zmc2V0X2luX3BhZ2Uo
YWRkciArIHBhdGNoZWQpLCBsZW4gLSBwYXRjaGVkKTsKKwkJcmV0ID0gX19wYXRjaF9pbnNuX3dy
aXRlKGFkZHIgKyBwYXRjaGVkLCBpbnNuICsgcGF0Y2hlZCwgc2l6ZSk7CisKKwkJcGF0Y2hlZCAr
PSBzaXplOworCX0KKworCXJldHVybiByZXQ7Cit9CitOT0tQUk9CRV9TWU1CT0wocGF0Y2hfaW5z
bl93cml0ZSk7CisKIGludCBwYXRjaF90ZXh0X25vc3luYyh2b2lkICphZGRyLCBjb25zdCB2b2lk
ICppbnNucywgc2l6ZV90IGxlbikKIHsKIAl1MzIgKnRwID0gYWRkcjsKLS0gCjIuNDAuMQoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
