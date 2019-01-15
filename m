Return-Path: <SRS0=k4h2=PX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2C18C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 08:36:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FC272063F
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 08:36:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U91FuHOe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iDz3+RNJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FC272063F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+MoFkbkRdJt5mQy/4Z5V3y4LZYla6QvHnXqh0K6bzxY=; b=U91FuHOeVnI3ca
	0AFPplskboiYh/kqY4COPwOrmgsPluyaq5fuDhtwMtxNfLFNcj+7IlA2pv1tJpb0YocO7gUDdtifL
	Hf+on/d22fxfuy0qEfBPspy9k/A2Pj73AiSNgAj3ymLNfjs+6SRtHHNY4V2BSyRwtbF8T+0v0nMKA
	Hsv1Rw5ucOcdMg1ccepsSQ0BCo5iRod+wS6bTvX4YXVJdddlYOSf33WuXFPD+maPBAVLZomJraYF0
	8JAjo3/vZffo8P7ijbUg1Gq9ZYGVk2nLcBktvOQVE+mzxtHBherJB1iyl+84YZ9FGGFl3e5tSVVs9
	cb0y5GcYLoQL1yecJLKw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjKCZ-0002wK-22; Tue, 15 Jan 2019 08:36:03 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjKCX-0002uT-2h
 for linux-riscv@lists.infradead.org; Tue, 15 Jan 2019 08:36:02 +0000
Received: by mail-lf1-x144.google.com with SMTP id a16so1382312lfg.3
 for <linux-riscv@lists.infradead.org>; Tue, 15 Jan 2019 00:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6kspacMDlawfH674vGJhb7OwBVwVwcUr6YFmb9U7sq0=;
 b=iDz3+RNJDFy+gHfZA81+dSJ8MsK/pr/vqwryT8w+yEaDXyM7UBv7VqYCE5Ka+qDV/N
 WfPj4HxStbcD7r3DDpeh3Yh5ODZHw0HtgiL/RRRBY5B1qcmjck9pShtq2nDkdprOf6j6
 sExYlm1v9GsFWV9gZGbCudUT8bIYFaSRmtCUqhAVbEqsinZqz4QolTfNnVfDoGy4jE5G
 oP9prqGBdTPajdKUQTDZP7wUAGi/RMy/nCHU+tFitX135/9qbGNTvixTomrBVhgnUvnT
 B4efZ9fSYrjcEb2Mp3nRDlWi0TaSiQG17bOS8r54MqCizXcDWiP5Va1HUpPMwfh+CJ2T
 L87w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6kspacMDlawfH674vGJhb7OwBVwVwcUr6YFmb9U7sq0=;
 b=axbmDMjSXxnc1kd1G/RkwzKi1ND63S8OKmZ4S8PYig4IGGW6vvM385y7olTm4KlfQP
 tw/pdosAuZZTMKbhjA9GEP/fdsx8UJoW8lnyyq7BMXJ3mYuv9jcthIsTr4H6aXgswLf+
 MMZ5Zb8pcMWIzynYdDfu5YrGX+nYIbvDe8nidPRzZje79vROfoKs4xHqBGbp2LIJxeUJ
 9kOGBe9uR3LwkDVjYBwkWjfnu3RZPv4m+5r+X1Fmu17CT/cjuXowfTbYmYJ0nzPjZhi3
 OOXFsMOqkgYJE1QWIzrSuwmtMsty1nuOcB/geIESS+A7v8KPfojjYT6WjMfcBXeoJD5W
 QzwQ==
X-Gm-Message-State: AJcUukeU8BQs9v7f9W6MQtklOChbp2HFm4Uon7DiCzkzVEO4eCEDOWpV
 StkVSlY4ZtjkJj3y3xpCbBzTI3gozB9xfA==
X-Google-Smtp-Source: ALg8bN5HEQFAWXvsQsiVirXn3vol7dXm1Otd1w7t+75eLgi8AEm/5fWsdz9kAszHhBQHb/v7LpOSPg==
X-Received: by 2002:a19:d90c:: with SMTP id q12mr1903077lfg.24.1547541357847; 
 Tue, 15 Jan 2019 00:35:57 -0800 (PST)
Received: from btopel-mobl.ger.intel.com ([213.100.199.124])
 by smtp.gmail.com with ESMTPSA id e14-v6sm453004ljb.31.2019.01.15.00.35.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 15 Jan 2019 00:35:57 -0800 (PST)
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@gmail.com>
To: linux-riscv@lists.infradead.org
Subject: [RFC PATCH 2/3] riscv: add build infra for JIT compiler
Date: Tue, 15 Jan 2019 09:35:17 +0100
Message-Id: <20190115083518.10149-3-bjorn.topel@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190115083518.10149-1-bjorn.topel@gmail.com>
References: <20190115083518.10149-1-bjorn.topel@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190115_003601_117474_6E04D5EC 
X-CRM114-Status: GOOD (  12.15  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@gmail.com>,
 palmer@sifive.com, davidlee@sifive.com, daniel@iogearbox.net,
 netdev@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

U2lnbmVkLW9mZi1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm4udG9wZWxAZ21haWwuY29tPgotLS0K
IGFyY2gvcmlzY3YvS2NvbmZpZyAgICAgICAgICAgIHwgMSArCiBhcmNoL3Jpc2N2L01ha2VmaWxl
ICAgICAgICAgICB8IDQgKysrKwogYXJjaC9yaXNjdi9uZXQvTWFrZWZpbGUgICAgICAgfCA1ICsr
KysrCiBhcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXAuYyB8IDQgKysrKwogNCBmaWxlcyBjaGFu
Z2VkLCAxNCBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9uZXQv
TWFrZWZpbGUKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXAu
YwoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvS2NvbmZpZyBiL2FyY2gvcmlzY3YvS2NvbmZpZwpp
bmRleCBmMTMyMjA5MDRkN2MuLjNlZGFhNTk1ODI2MiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9L
Y29uZmlnCisrKyBiL2FyY2gvcmlzY3YvS2NvbmZpZwpAQCAtNTAsNiArNTAsNyBAQCBjb25maWcg
UklTQ1YKIAlzZWxlY3QgR0VORVJJQ19JUlFfTVVMVElfSEFORExFUgogCXNlbGVjdCBBUkNIX0hB
U19QVEVfU1BFQ0lBTAogCXNlbGVjdCBIQVZFX0VGRklDSUVOVF9VTkFMSUdORURfQUNDRVNTCisJ
c2VsZWN0IEhBVkVfRUJQRl9KSVQgaWYgNjRCSVQKIAogY29uZmlnIE1NVQogCWRlZl9ib29sIHkK
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvTWFrZWZpbGUgYi9hcmNoL3Jpc2N2L01ha2VmaWxlCmlu
ZGV4IDRiNTk0ZjJlNGY3ZS4uYWQ0ODdmM2MxZDdiIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L01h
a2VmaWxlCisrKyBiL2FyY2gvcmlzY3YvTWFrZWZpbGUKQEAgLTc5LDYgKzc5LDEwIEBAIGhlYWQt
eSA6PSBhcmNoL3Jpc2N2L2tlcm5lbC9oZWFkLm8KIAogY29yZS15ICs9IGFyY2gvcmlzY3Yva2Vy
bmVsLyBhcmNoL3Jpc2N2L21tLwogCitpZmVxICgkKENPTkZJR19BUkNIX1JWNjRJKSx5KQorY29y
ZS15ICs9IGFyY2gvcmlzY3YvbmV0LworZW5kaWYKKwogbGlicy15ICs9IGFyY2gvcmlzY3YvbGli
LwogCiBQSE9OWSArPSB2ZHNvX2luc3RhbGwKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbmV0L01h
a2VmaWxlIGIvYXJjaC9yaXNjdi9uZXQvTWFrZWZpbGUKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5k
ZXggMDAwMDAwMDAwMDAwLi5iMGI2YWMxM2VkZjUKLS0tIC9kZXYvbnVsbAorKysgYi9hcmNoL3Jp
c2N2L25ldC9NYWtlZmlsZQpAQCAtMCwwICsxLDUgQEAKKyMKKyMgUklTQ1YgbmV0d29ya2luZyBj
b2RlCisjCisKK29iai0kKENPTkZJR19CUEZfSklUKSArPSBicGZfaml0X2NvbXAubwpkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wLmMgYi9hcmNoL3Jpc2N2L25ldC9icGZf
aml0X2NvbXAuYwpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLjdlMzU5
ZDMyNDllZQotLS0gL2Rldi9udWxsCisrKyBiL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcC5j
CkBAIC0wLDAgKzEsNCBAQAorc3RydWN0IGJwZl9wcm9nICpicGZfaW50X2ppdF9jb21waWxlKHN0
cnVjdCBicGZfcHJvZyAqcHJvZykKK3sKKwlyZXR1cm4gcHJvZzsKK30KLS0gCjIuMTkuMQoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
