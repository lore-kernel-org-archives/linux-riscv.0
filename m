Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A9BEDEC53
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 14:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TncsEbu4UDVyL94bYG0YAYQcm4O1KQpPeWMRKlGXV6g=; b=E8SFQ+4ugzPbxn
	aHCd9FOe/pjBNiVXgZH++E81MNFdQrxT7JXPukkrvKjbsJzkIVOaC+T+jocodI1hIxG3Rkfh5VTUS
	o0usNndTov/C6kaRSt4zSOG/hV2X/nEjg2PJyQTgcsbwOCwLqkBgqFXlGqa8XxY2Ja3qZnP5NYy0q
	wWL7d7wRwcIgl6j7rkO2YH/I8jAvQ5NizsRrCpoltmNksGjGNTjyrVyrFk73gHDHsAHaKMwrb2Xp0
	2o8+BFryQuFoNJFYCAPLh9LHDLJoxGDrgCiJq8qUij578CJPN4Wf3/tIdFqp6T6J5nd9NhpQfIWtY
	wqlsJqWeae3SdlZdKwJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgQWg-0065Zf-28;
	Wed, 13 Sep 2023 14:07:30 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgQWe-0065YO-34
	for linux-riscv@lists.infradead.org;
	Wed, 13 Sep 2023 14:07:30 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-401ce65dfc4so20492695e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 Sep 2023 07:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1694614045; x=1695218845; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eUcO5LOOz7EzwAPKcG26jxLJeh1V8AQ265+bz+A8SoI=;
        b=CJuZllU35tS9RI8G+MPWYg48MKnfTMXowk/SpYyoolA9rm2nVNGfZ4qdh45vFfPcOi
         r+rC4/Q1melhPyAvmrXy7eJnnRYSREF0nrvy3+hTCrqteE8H2iXKnbbugBGAjYbRIHBw
         R5+O+XyTDbW7ZXz0kS3zY/teFtuLYcsC10a940YNCpc0eKw3OcGDHB/yNNAdX3D+bgLA
         mt+byhibx/LSeec+e5yUFmcCvR3jUpN4p12h+amyqk5bWTlCzUBRdcDOyJXmtmYfJUeP
         YWHj3F58hRJ+QAQxSwl4lv2e0pQS3MSaNpZqIlf057MeWZgz67gNORFx2FfDouikSwSJ
         NW7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694614045; x=1695218845;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eUcO5LOOz7EzwAPKcG26jxLJeh1V8AQ265+bz+A8SoI=;
        b=XaEXfIijoaUenwKEU/W97mbDi19cGRToRnvOzTKY4GE+f5AH4kjdyUtk8RERvRk6YK
         reDKSY/5DkUKMOVcJl7ePsLpH1yKuXTERbV4ddqE0srqvq0MUmJgeAJchqCFx5z2NQGE
         gEotC77xCa1G07hysJBwtk/QBUUQWII3aqkrVrmpYZ/tE+nhIIXmwf3ef5VEt/irKuJe
         7XYeG4sB4ZAhcNnN2bcRu+Ro0QS4irk524xHUfbB+LSDzY0Tw7V4IHBy7+psfH8zLpM8
         TGdiMXAJSfBcUVJmVBtcMp0KubKvaCtUtBIVCIJgdg2+ln9vIquJzev8bfJjEmtFCpnh
         8f8w==
X-Gm-Message-State: AOJu0Ywodve9Nq67d0ybJVulCqg33HJWH23dS+J2rpo6RCxHmAd6Ew9f
	W1RmusLG3Z7wENNJo26qNPGEFQ==
X-Google-Smtp-Source: AGHT+IGCH9EQFNujQ2CA3x2E+UgIyr58wi0F+nWTVuTCbTQOTY+VR6HOeI5WcUFS+BmJOSuQbmxsDA==
X-Received: by 2002:a05:600c:1da2:b0:401:7d3b:cc84 with SMTP id p34-20020a05600c1da200b004017d3bcc84mr2256337wms.0.1694614044700;
        Wed, 13 Sep 2023 07:07:24 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:8fed:c1bc:8957:f1f0])
        by smtp.gmail.com with ESMTPSA id q5-20020a7bce85000000b004013797efb6sm2166222wmj.9.2023.09.13.07.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 07:07:23 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Shuah Khan <shuah@kernel.org>,
	Gabriel Krisman Bertazi <krisman@collabora.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
Subject: [PATCH] selftests: sud_test: return correct emulated syscall value on RISC-V
Date: Wed, 13 Sep 2023 16:07:11 +0200
Message-Id: <20230913140711.266975-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_070728_986883_617A1D57 
X-CRM114-Status: GOOD (  10.54  )
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

Q3VycmVudGx5LCB0aGUgc3VkX3Rlc3QgZXhwZWN0cyB0aGUgZW11bGF0ZWQgc3lzY2FsbCB0byBy
ZXR1cm4gdGhlCmVtdWxhdGVkIHN5c2NhbGwgbnVtYmVyLiBUaGlzIGFzc3VtcHRpb24gb25seSB3
b3JrcyBvbiBhcmNoaXRlY3R1cmVzCndlcmUgdGhlIHN5c2NhbGwgY2FsbGluZyBjb252ZW50aW9u
IHVzZSB0aGUgc2FtZSByZWdpc3RlciBmb3Igc3lzY2FsbApudW1iZXIvc3lzY2FsbCByZXR1cm4g
dmFsdWUuIFRoaXMgaXMgbm90IHRoZSBjYXNlIGZvciBSSVNDLVYgYW5kIHRodXMKdGhlIHJldHVy
biB2YWx1ZSBtdXN0IGJlIGFsc28gZW11bGF0ZWQgdXNpbmcgdGhlIHByb3ZpZGVkIHVjb250ZXh0
LgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgot
LS0KIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3N5c2NhbGxfdXNlcl9kaXNwYXRjaC9zdWRfdGVz
dC5jIHwgOCArKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3N5c2NhbGxfdXNlcl9kaXNwYXRjaC9zdWRf
dGVzdC5jIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvc3lzY2FsbF91c2VyX2Rpc3BhdGNoL3N1
ZF90ZXN0LmMKaW5kZXggYjVkNTkyZDQwOTllLi4xYjU1NTNjMTk3MDAgMTAwNjQ0Ci0tLSBhL3Rv
b2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3N5c2NhbGxfdXNlcl9kaXNwYXRjaC9zdWRfdGVzdC5jCisr
KyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3N5c2NhbGxfdXNlcl9kaXNwYXRjaC9zdWRfdGVz
dC5jCkBAIC0xNTgsNiArMTU4LDE0IEBAIHN0YXRpYyB2b2lkIGhhbmRsZV9zaWdzeXMoaW50IHNp
Zywgc2lnaW5mb190ICppbmZvLCB2b2lkICp1Y29udGV4dCkKIAogCS8qIEluIHByZXBhcmF0aW9u
IGZvciBzaWdyZXR1cm4uICovCiAJU1lTQ0FMTF9ESVNQQVRDSF9PRkYoZ2xvYl9zZWwpOworCisJ
LyoKKwkgKiBNb2RpZnkgaW50ZXJydXB0ZWQgY29udGV4dCByZXR1cm5lZCB2YWx1ZSBhY2NvcmRp
bmcgdG8gc3lzY2FsbAorCSAqIGNhbGxpbmcgY29udmVudGlvbgorCSAqLworI2lmIGRlZmluZWQo
X19yaXNjdikKKwkoKHVjb250ZXh0X3QqKXVjb250ZXh0KS0+dWNfbWNvbnRleHQuX19ncmVnc1tS
RUdfQTBdID0gTUFHSUNfU1lTQ0FMTF8xOworI2VuZGlmCiB9CiAKIFRFU1QoZGlzcGF0Y2hfYW5k
X3JldHVybikKLS0gCjIuNDAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
