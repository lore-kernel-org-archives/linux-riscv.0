Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B711DC04FFE
	for <linux-riscv@archiver.kernel.org>; Fri, 17 May 2024 14:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qd3fq3wDaVhCGxKxT0ra7OVRvT1YNTPxtJczjvAGMYw=; b=EIbVAw7Si14ClJ
	Kkq3OeVUk/U127bEYTkWPqt0whdDWcOyeX6MRjnJ18ARjsjo8YhJy6GuOcf9UNRXBh0Zo1ObDawV/
	pPBiWbUBygi0lL/5Be6mZU09z+awQRJIqZN39h4lircE6fYh5eYZln/B8Ztc1JG1DKikKrRhTpTAE
	UWNb36NyIrreM+mXdK/uxcGVp8Smy1Z8/2tQlmdSVu8W7J0T0Mow5kS4OuiENIlwT0kFCBBQ93ENR
	IwpChMuN4yipN96Iypdgw3EqB6ThZvWFrY06ddMvdRKOhBaJIynTNr7Uvt7D/loMfPSsTeHKEcPR0
	dAz8cXn++NDJ5jQYWrgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7yxb-000000088AA-2ymw;
	Fri, 17 May 2024 14:53:27 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7yxT-0000000881L-0yEP
	for linux-riscv@lists.infradead.org;
	Fri, 17 May 2024 14:53:22 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-351d30ade7fso38429f8f.2
        for <linux-riscv@lists.infradead.org>; Fri, 17 May 2024 07:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715957597; x=1716562397; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yNRN92k2/pTBN2tUswJ7wUiwcK9Vci4vULdEncJPQl0=;
        b=jgenbcIFKKKvutwSPa5FsaplzHQFf0ts6nxOsYgDxi6t+dTyIdKWLU33xWY0dfOboh
         XtHKtwhecCD1hGMWhNLqyhjeBViUjvlIFtNr54nQzmBWnpI+xqPNhKMx5kOzW2JrFbZ/
         oEZleHN155mf2f5mC6mUrblCZYPAS+M2wmMofqj7QfPEl17opgi1N+Fv+SLKLO0x/F/A
         JwuyvtpLtScj7MEGloUz5XNluLDFB2PSDFS1RUeaTPgq+JIYs3uawy7DAGRXfFI8JkZ4
         yNzNNsCB7VSUyK4YxnMfOQTaRsuD4tf06UGZTGqW9c3Qiz7YmL/tapgMwxeFZKvtn4DA
         ID8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715957597; x=1716562397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yNRN92k2/pTBN2tUswJ7wUiwcK9Vci4vULdEncJPQl0=;
        b=KZCLMs1qVtiXj5Ay6H6GqeCCfCkismeZqrNFrtdZndrJFL/9pbrgbVeecYKXopXZKi
         yfgR+hpicljM8Pagrxo+ycmH9RL/Ae9E9BBGukG50N6A+NdGc9lKqMZkWio4fIXhAs9w
         LAD9l7Bzjl7isJrgvmjVL8xlqkmMJ3Qa4cjXpHBYtUk9xSi1BSNgdTJBgUuyOxQyJi0o
         8dFVEFfp6pTFmklCalTHyX7k1QXsii9XoutfheQzRpiBuBw4D6UcUGODcMyPR5StmbgQ
         S40S45PPbkfykTg13Uma2JI1RiPPeWjS1vPgbk6qWdBfmQ5To1vnCWrQtmDc4n6lEFPF
         /Qag==
X-Forwarded-Encrypted: i=1; AJvYcCUWvrZCXIRDAxLvmHMfc6q9SDgXyzX0FcQDKT+j8G/PJzyvGiEcMkkcmpXK1QAcjno5vcoLD6KbDeCXWhasAUsaK6dGtaygDmPvQ1POSg4K
X-Gm-Message-State: AOJu0Yz37ytg+adDH5Hfg0B46Gfl47fwu0SyCqYaWGC4jNZFiXREJIAS
	qwtD736k4ivmN4+2CObbddcUfoeoi49jRuWH72u7agKyv5UT6JzouhNbWRMjt4w=
X-Google-Smtp-Source: AGHT+IHqFS5sQ6sZj4AQW5YtazfdwelSPtkcTWIW/0+cY1OBJlWJ4R/7hmqt03NZ//lb5/ssRTA5fQ==
X-Received: by 2002:a05:600c:19c8:b0:419:f241:6336 with SMTP id 5b1f17b1804b1-41fea928decmr160060745e9.1.1715957597105;
        Fri, 17 May 2024 07:53:17 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:46f0:3724:aa77:c1f8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccce9431sm301723695e9.28.2024.05.17.07.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 May 2024 07:53:16 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Shuah Khan <shuah@kernel.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Atish Patra <atishp@atishpatra.org>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v5 01/16] dt-bindings: riscv: add Zimop ISA extension description
Date: Fri, 17 May 2024 16:52:41 +0200
Message-ID: <20240517145302.971019-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240517145302.971019-1-cleger@rivosinc.com>
References: <20240517145302.971019-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240517_075319_335151_A3C587F7 
X-CRM114-Status: UNSURE (   8.72  )
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

QWRkIGRlc2NyaXB0aW9uIGZvciB0aGUgWmltb3AgKE1heS1CZS1PcGVyYXRpb25zKSBJU0EgZXh0
ZW5zaW9uIHdoaWNoCndhcyByYXRpZmllZCBpbiBjb21taXQgNTgyMjA2MTRhNWYgb2YgdGhlIHJp
c2N2LWlzYS1tYW51YWwuCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckBy
aXZvc2luYy5jb20+Ci0tLQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2
L2V4dGVuc2lvbnMueWFtbCB8IDUgKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3Yv
ZXh0ZW5zaW9ucy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2
L2V4dGVuc2lvbnMueWFtbAppbmRleCA5OWQyYTllOGM1MmQuLmI5MTAwYWRkZWI5MCAxMDA2NDQK
LS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMu
eWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5z
aW9ucy55YW1sCkBAIC0zNjMsNiArMzYzLDExIEBAIHByb3BlcnRpZXM6CiAgICAgICAgICAgICBy
YXRpZmllZCBpbiB0aGUgMjAxOTEyMTMgdmVyc2lvbiBvZiB0aGUgdW5wcml2aWxlZ2VkIElTQQog
ICAgICAgICAgICAgc3BlY2lmaWNhdGlvbi4KIAorICAgICAgICAtIGNvbnN0OiB6aW1vcAorICAg
ICAgICAgIGRlc2NyaXB0aW9uOgorICAgICAgICAgICAgVGhlIHN0YW5kYXJkIFppbW9wIGV4dGVu
c2lvbiB2ZXJzaW9uIDEuMCwgYXMgcmF0aWZpZWQgaW4gY29tbWl0CisgICAgICAgICAgICA1ODIy
MDYxNGE1ZiAoIlppbW9wIGlzIHJhdGlmaWVkLzEuMCIpIG9mIHRoZSByaXNjdi1pc2EtbWFudWFs
LgorCiAgICAgICAgIC0gY29uc3Q6IHp0c28KICAgICAgICAgICBkZXNjcmlwdGlvbjoKICAgICAg
ICAgICAgIFRoZSBzdGFuZGFyZCBadHNvIGV4dGVuc2lvbiBmb3IgdG90YWwgc3RvcmUgb3JkZXJp
bmcsIGFzIHJhdGlmaWVkCi0tIAoyLjQzLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
