Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF7FBC77B7A
	for <linux-riscv@archiver.kernel.org>; Fri, 19 May 2023 13:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZTRYDdPgw+SfFfBjGgnC3aq/TuAjGLZlznHPFkrUJ7Q=; b=E7KUJPrhmhGsa9
	VQMLMKSHq7uBEacEtrux/WlBJBXj0LcH004bpfd3Rx+VUVh6uGUgxAKwyQRC1TtCoh7IEM2Y9ZAJL
	Z335IfO5bTb3wTpXfpuZa2oJq6fTBBOijoz8bl+K9Ct0dk5F6yltkTrS2UI1yCLnBayUaWCvskA2I
	cf44Ri6kmhyiihWBKMrTA7iHkrBKBNrG7LQlcCWt8n/HYmnPPeNsk7e5+rsL7Cb6NLo2hhbI6HOOQ
	bVAxujOxvBo9/FKeFGGCGsQ2qy7DbqFG9ye5jHh3hZbB285EBRjQnwNn6aAmzBTY4bDYjsmIPnvSW
	xpe0CiOBGtQFkAPkvokw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzzv5-00GME5-2Z;
	Fri, 19 May 2023 13:13:19 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzzv2-00GMCi-1i
	for linux-riscv@lists.infradead.org;
	Fri, 19 May 2023 13:13:18 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3f42bcf5df1so31326115e9.3
        for <linux-riscv@lists.infradead.org>; Fri, 19 May 2023 06:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1684501994; x=1687093994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=VubzrgCD2ViwjmO3PZokr9/4IFGa31fvJ3BrWREI83s=;
        b=esXtjrha/93GEYue04kr1iYA2b8go6OK835+hPZVPvEThh/VfdYosW1AKs6s7hktoz
         zPIWkQzeaZDU4xwV3VdId7N9gVpqccbTO7zC/RErqlEwPuKSoMvodIaRLgajJAToThvl
         mpeHBk17ZiOWelgQekvt6juGQE/6lzDTaqrkzeECodBD6GZ8GnzxJn27gUKVKoeubU4V
         mNgCSKA/qbNtO+hDlKnCffMbtEKSGTiUPbfp6PY26ZMGIX8ddHFAg7qLb0SRsJgiCgRS
         ILjuxOOl9WrTrI9+GlwbbbjbCfVcSZqLwZqunDKzO2dy15wm+o3nNe71h2zC3yHQDvi9
         pH2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684501994; x=1687093994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VubzrgCD2ViwjmO3PZokr9/4IFGa31fvJ3BrWREI83s=;
        b=igoRl6BUrzaTISlxwLp5aWGK7VP7LNyOEtdVLNWQI5GUiAB9N9cQ5Iy5MkLXm/WLWa
         PcMcbg4Nux0ukSvRO+DMlX8TeNCN+Q+7e35hsm5tNNtRkS5Z+nwqYawesHOxSSt+Gqps
         g6kLYtU+xImcZsfqOV6zjXHN4V/NI3Zzg9gKwawuixvJ00E+oCJc2qT5JQg4LY3U/wkO
         +9r7eg4iiyTf/UlhVuJgB5Ju1F3k8fRaAgQmBNyjDIIBR1nOKkze/DID5ecQhcJsh9Np
         XxUjX602C/YzZU6nrXnQ4c1VZtTvVqxnEK8+xOwRl158by5yX0IatIw0biwTXMpm2GKS
         RzxA==
X-Gm-Message-State: AC+VfDxscP8JTtVpiICjYQFwuLqHV9TGQ5bFVs7cRoFOO8cpTrTUKrjz
	HrXaFzmi4MujXx5bZFmIdCxlYw==
X-Google-Smtp-Source: ACHHUZ7z6OJX0gt0aF1BvTHyoKCTYb8Fn0XrT2W5Wunx95APLO34d8Hw86p9y/xxKYpasC/ohNUFdA==
X-Received: by 2002:a1c:ed0c:0:b0:3f4:2506:3d58 with SMTP id l12-20020a1ced0c000000b003f425063d58mr1278568wmh.23.1684501993851;
        Fri, 19 May 2023 06:13:13 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id n3-20020adff083000000b00304b5b2f5ffsm5282580wro.53.2023.05.19.06.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 06:13:13 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH -fixes] riscv: Fix unused variable warning when BUILTIN_DTB is set
Date: Fri, 19 May 2023 15:13:11 +0200
Message-Id: <20230519131311.391960-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230519_061316_816931_9398F4C3 
X-CRM114-Status: GOOD (  10.78  )
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

Y29tbWl0IGVmNjlkMjU1OWZlOSAoInJpc2N2OiBNb3ZlIGVhcmx5IGR0YiBtYXBwaW5nIGludG8g
dGhlIGZpeG1hcApyZWdpb24iKSB3cm9uZ2x5IG1vdmVkIHRoZSAjaWZuZGVmIENPTkZJR19CVUlM
VElOX0RUQiBzdXJyb3VuZGluZyB0aGUgcGEKdmFyaWFibGUgZGVmaW5pdGlvbiBpbiBjcmVhdGVf
ZmR0X2Vhcmx5X3BhZ2VfdGFibGUoKSwgc28gbW92ZSBpdCBiYWNrIHRvCml0cyByaWdodCBwbGFj
ZSB0byBxdWlldCB0aGUgZm9sbG93aW5nIHdhcm5pbmc6CgouLi9hcmNoL3Jpc2N2L21tL2luaXQu
YzogSW4gZnVuY3Rpb24g4oCYY3JlYXRlX2ZkdF9lYXJseV9wYWdlX3RhYmxl4oCZOgouLi9hcmNo
L3Jpc2N2L21tL2luaXQuYzo5MjU6MTI6IHdhcm5pbmc6IHVudXNlZCB2YXJpYWJsZSDigJhwYeKA
mSBbLVd1bnVzZWQtdmFyaWFibGVdCiAgOTI1IHwgIHVpbnRwdHJfdCBwYSA9IGR0Yl9wYSAmIH4o
UE1EX1NJWkUgLSAxKTsKCkZpeGVzOiBlZjY5ZDI1NTlmZTkgKCJyaXNjdjogTW92ZSBlYXJseSBk
dGIgbWFwcGluZyBpbnRvIHRoZSBmaXhtYXAgcmVnaW9uIikKU2lnbmVkLW9mZi1ieTogQWxleGFu
ZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgotLS0KIGFyY2gvcmlzY3YvbW0vaW5p
dC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9tbS9pbml0LmMgYi9hcmNoL3Jpc2N2L21tL2luaXQu
YwppbmRleCA3NDdlNWIxZWYwMmQuLmM2YmI5NjZlNDEyMyAxMDA2NDQKLS0tIGEvYXJjaC9yaXNj
di9tbS9pbml0LmMKKysrIGIvYXJjaC9yaXNjdi9tbS9pbml0LmMKQEAgLTkyMiw5ICs5MjIsOSBA
QCBzdGF0aWMgdm9pZCBfX2luaXQgY3JlYXRlX2tlcm5lbF9wYWdlX3RhYmxlKHBnZF90ICpwZ2Rp
ciwgYm9vbCBlYXJseSkKIHN0YXRpYyB2b2lkIF9faW5pdCBjcmVhdGVfZmR0X2Vhcmx5X3BhZ2Vf
dGFibGUodWludHB0cl90IGZpeF9mZHRfdmEsCiAJCQkJCSAgICAgICB1aW50cHRyX3QgZHRiX3Bh
KQogeworI2lmbmRlZiBDT05GSUdfQlVJTFRJTl9EVEIKIAl1aW50cHRyX3QgcGEgPSBkdGJfcGEg
JiB+KFBNRF9TSVpFIC0gMSk7CiAKLSNpZm5kZWYgQ09ORklHX0JVSUxUSU5fRFRCCiAJLyogTWFr
ZSBzdXJlIHRoZSBmZHQgZml4bWFwIGFkZHJlc3MgaXMgYWx3YXlzIGFsaWduZWQgb24gUE1EIHNp
emUgKi8KIAlCVUlMRF9CVUdfT04oRklYX0ZEVCAlIChQTURfU0laRSAvIFBBR0VfU0laRSkpOwog
Ci0tIAoyLjM3LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
