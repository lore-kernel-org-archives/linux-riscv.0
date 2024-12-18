Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B545E77187
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Dec 2024 13:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yXIelB7sEaBiT7CL2gREWJlS1v88RCJHPJKNoy1JFHs=; b=2ZpM6n33JxyRv2
	4BY/FGAM8gu+5gq9eW5kTPpa4PeSfnknXfgG5vgQYQkH6TNoQ/KCikkmKAa/djblZkQbcDlIIq6JP
	KajsHAphtTurkYT9DJVPtGF/cl81NweeojDWHdN5jjtTtTmsYo/Sn5+C9tqE8FTX7NhfbujpsfIm+
	DZX7fUX5JgTLvooYPT8U6ZHdIDJeJbOVbowhReWuTNu4agscnJd/csGJd9cKD5+Y40/xomX7jVJh4
	wzlUaRtxANHKs8DqTSpLAeCAGoBYr7n1V7jeqJTVZzs+Yu0bP0uwP5uAozbYUBLc1r7q7uXmAIeJQ
	geU4K8vnVNPv1e7GBL/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNuBQ-0000000GjxK-3cJz;
	Wed, 18 Dec 2024 13:33:48 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNuBO-0000000Gjwb-1TuJ
	for linux-riscv@lists.infradead.org;
	Wed, 18 Dec 2024 13:33:47 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5d3f65844deso10714613a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 18 Dec 2024 05:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734528824; x=1735133624; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F04qCBUVVoN6U8u4xH7kBwCsJkFMNNfZymSECrRf1P8=;
        b=TwyKxJumHaHGl91byfC4MgOGpCxnFS7y3yrtKiuRRABnbItYkGJgVyk7Guw7dZPjdr
         /NXR8OvnkzUTzm6bgAlAGCOrIuvXSTGaFMQWQ/Q8ShzIUBBhveERPplsWOVS6/4g8299
         KVlFLHNkgZsBSOHzPtC1HYwhT/yS5VAzq9jxNAv/03QdX5Ljn6Nfzr0qNVnv1BNq+73M
         4ZZr9YH+R9SRiwsUsq9ARzcpp/h3EC2WCspmtVRCm3L/QPHZdi8iIy9QON38cPk2C3LU
         CINgETU82mri9Xh83Hh3nndTqUaOdlNn4KkiW0uUvcM4zvWjFHq9ThpUVp4rWtmMmx4p
         IAjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734528824; x=1735133624;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F04qCBUVVoN6U8u4xH7kBwCsJkFMNNfZymSECrRf1P8=;
        b=MFt+SaQqot4AA2ueVj0Rd3lxYDOh4kvxSDxk23rLbj0gI9YziXYiy+FNg+J78FrzCs
         l7M+vYXlPW1SJ363I9OyyiNXQc6PHBBjbmqvs96NINBWd5IaoRp1OtMTaGuhNHioEjFo
         5JeBomTzoo6hxDMUurgfZb36xMx+mKzrwc+I9tQLGlVaBZ2WLWIowlrAplhxGfNRiu4F
         RcS+oeRSzcxertX8wMJndyM3viEB4Rdr1eBU9ljO4lCXXNdLMk3rptBv0UbCwZtlS6X/
         dl5Umc2xSNecdbulECukILChvF3PtQyTRCM8iyKFV1d/cdj01EJph5DBX3jWJ84ZFwib
         bi7A==
X-Gm-Message-State: AOJu0Yw2XszjowWFP+YDVrnV5JI/srZyz71d+F3+wneMF4A26tmfd482
	5GLQHQ5TOAhusZGQx1tKNEFg5PV4UKnYdOyP16zQnKrODMCkQRnrORZCvABX7YY=
X-Gm-Gg: ASbGncvP8I/Ha6LeCP/4neWQf8FeTokk78yQBw2pNrcPSGnd+FqvO1yfl7CTePRc8zM
	+8/dV7y/pq0N5jIGg0uvddqOkfJirE3JdkAbbpQp/1vm7oz/cqFidwncV2L0DWuwM5YacVHmdnJ
	XL6B2e44/Zez4r6+jpzk5/14MH1r320DQPSlzydl+3QQRpKNDNbVGDWUqVSchVznwHlA9jFWmQv
	7fsTCXsMHtuFffpIQB3cdOxtnNBGOU0ExPErWlo0QfUb0HBoPtUye4eTIjzn46WhQ==
X-Google-Smtp-Source: AGHT+IHvX5X6BqHRSMeBGrCGLrIORFdCEP7U5u82MX7KqOksIbsBDW9rkN+UXFaQ/V6EmbhAHdKVrg==
X-Received: by 2002:a17:906:309a:b0:aac:d8:13d1 with SMTP id a640c23a62f3a-aac00d813f8mr82990466b.13.1734528823548;
        Wed, 18 Dec 2024 05:33:43 -0800 (PST)
Received: from localhost.localdomain ([79.175.114.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab96005f89sm562706166b.35.2024.12.18.05.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 05:33:42 -0800 (PST)
From: Aleksandar Rikalo <arikalo@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Jones <ajones@ventanamicro.com>,
	=?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	linux-kernel@vger.kernel.org,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>
Subject: [PATCH] riscv: Fix the PAUSE Opcode for MIPS P8700.
Date: Wed, 18 Dec 2024 14:33:40 +0100
Message-Id: <20241218133340.51003-1-arikalo@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_053346_407850_BC1D87DA 
X-CRM114-Status: UNSURE (   9.58  )
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

RnJvbTogUmFqIFZpc2h3YW5hdGhhbjQgPHJ2aXNod2FuYXRoYW5AbWlwcy5jb20+CgpUaGUgcmlz
Y3YgTUlQUyBQODcwMCB1c2VzIGEgZGlmZmVyZW50IG9wY29kZSBmb3IgUEFVU0UuCkl0IGlzIGEg
4oCYaGludOKAmSBlbmNvZGluZyBvZiB0aGUgU0xMSSBpbnN0cnVjdGlvbiwgd2l0aCByZD0wLCBy
czE9MCBhbmQKaW1tPTUuIEl0IHdpbGwgYmVoYXZlIGFzIGEgTk9QIGluc3RydWN0aW9uIGlmIG5v
IGFkZGl0aW9uYWwgYmVoYXZpb3IKYmV5b25kIHRoYXQgb2YgU0xMSSBpcyBpbXBsZW1lbnRlZC4K
ClNpZ25lZC1vZmYtYnk6IFJhaiBWaXNod2FuYXRoYW40IDxydmlzaHdhbmF0aGFuQG1pcHMuY29t
PgpTaWduZWQtb2ZmLWJ5OiBBbGVrc2FuZGFyIFJpa2FsbyA8YXJpa2Fsb0BnbWFpbC5jb20+Ci0t
LQogYXJjaC9yaXNjdi9LY29uZmlnICAgICAgICAgICAgICAgIHwgMTIgKysrKysrKysrKysrCiBh
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2luc24tZGVmLmggfCAgNSArKysrKwogMiBmaWxlcyBjaGFu
Z2VkLCAxNyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9LY29uZmlnIGIv
YXJjaC9yaXNjdi9LY29uZmlnCmluZGV4IGQ0YTdjYTAzODhjMC4uMDdhNzdmYTBhMDE0IDEwMDY0
NAotLS0gYS9hcmNoL3Jpc2N2L0tjb25maWcKKysrIGIvYXJjaC9yaXNjdi9LY29uZmlnCkBAIC03
MTYsNiArNzE2LDE4IEBAIGNvbmZpZyBSSVNDVl9JU0FfWkFDQVMKIAogCSAgSWYgeW91IGRvbid0
IGtub3cgd2hhdCB0byBkbyBoZXJlLCBzYXkgWS4KIAorY29uZmlnIFJJU0NWX01JUFNfUDg3MDBf
UEFVU0VfT1BDT0RFX0ZJWAorCWJvb2wgIkZpeCB0aGUgUEFVU0UgT3Bjb2RlIGZvciBNSVBTIFA4
NzAwIgorCWRlZmF1bHQgbgorCWhlbHAKKwkgICBUaGUgUklTQ1YgTUlQUyBQODcwMCB1c2VzIGEg
ZGlmZmVyZW50IG9wY29kZSBmb3IgUEFVU0UuCisJICAgSXQgaXMgYSAnaGludCcgZW5jb2Rpbmcg
b2YgdGhlIFNMTEkgaW5zdHJ1Y3Rpb24sCisJICAgd2l0aCByZD0wLCByczE9MCBhbmQgaW1tPTUu
IEl0IHdpbGwgYmVoYXZlIGFzIGEgTk9QCisJICAgaW5zdHJ1Y3Rpb24gaWYgbm8gYWRkaXRpb25h
bCBiZWhhdmlvciBiZXlvbmQgdGhhdCBvZgorCSAgIFNMTEkgaXMgaW1wbGVtZW50ZWQuCisKKwkg
ICBJZiB5b3UgYXJlIG5vdCB1c2luZyB0aGUgUDg3MDAgcHJvY2Vzc29yLCBzYXkgbi4KKwogY29u
ZmlnIFRPT0xDSEFJTl9IQVNfWkJCCiAJYm9vbAogCWRlZmF1bHQgeQpkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9pbnNuLWRlZi5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9p
bnNuLWRlZi5oCmluZGV4IDlhOTEzMDEwY2RkOS4uNzkzZWVkZGUzNTE2IDEwMDY0NAotLS0gYS9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2luc24tZGVmLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9pbnNuLWRlZi5oCkBAIC0xOTYsNyArMTk2LDEyIEBACiAJSU5TTl9JKE9QQ09ERV9NSVND
X01FTSwgRlVOQzMoMiksIF9fUkQoMCksCQlcCiAJICAgICAgIFJTMShiYXNlKSwgU0lNTTEyKDQp
KQogCisjaWZuZGVmIENPTkZJR19SSVNDVl9NSVBTX1A4NzAwX1BBVVNFX09QQ09ERV9GSVgKICNk
ZWZpbmUgUklTQ1ZfUEFVU0UJIi40Ynl0ZSAweDEwMDAwMGYiCisjZWxzZQorI2RlZmluZSBSSVND
Vl9QQVVTRQkiLjRieXRlIDB4MDA1MDEwMTMiCisjZW5kaWYKKwogI2RlZmluZSBaQVdSU19XUlNf
TlRPCSIuNGJ5dGUgMHgwMGQwMDA3MyIKICNkZWZpbmUgWkFXUlNfV1JTX1NUTwkiLjRieXRlIDB4
MDFkMDAwNzMiCiAKLS0gCjIuMjUuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
