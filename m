Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BEB6C6FD1F
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Mar 2023 11:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dHzIA9HuSMxw3W2NI4HKOgdZr2Xt63hh3tbktKFESCk=; b=wCRGuOZr5uyPX+
	LDZs7XWCQVKC02EqDEyEtwedxfNkbdQ8RRUiFIPOvITTUK70dDJG8tm+8xfq28Y+oMd8I464JL+4+
	BtlZ6ByPXroodaerY/H0aEOfkr8RWtwHf8rrScttVjEEsVfF24NUJ1vI1BXtH59lge/Tb47sNyvVK
	etslLxPA0TsDvUqHNK8sthgbaNR8SoPAt16uFAkmph9pKVqaTG5mbs411NnhSre5nyZwUsvKBAJUp
	KawnbfHGS4sY/7HSVTHOoYzg2VXrLquUX6XhHuItxyy/0uuouuHRaUPwe8QntearRq4jaBIdxotRJ
	T1RVg+rrkWfYCGqiKbaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paxfQ-000OcT-8G; Sat, 11 Mar 2023 11:45:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paxfG-000OXa-8v
	for linux-riscv@bombadil.infradead.org; Sat, 11 Mar 2023 11:45:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=SV/dLCNcysuQ7CKaIgag1w22Gn4yS1/4xn0PDWGs4Eo=; b=T74+u4WKiIZeLv6StuyXlf0jJ1
	e2DD2qZAbz3o5l0uHfKQFhjkZ0IvdKnaCjtZQ34jrMtGjXano8925E3PY2IiIdxiKSp2eWjxMLVVl
	nweL9jPpJSj+xfAwBJQnY1DsY7tqG2z+FAufNNqziIA68kdn31ilFAhL4zvNQ0jvkgwAaMjrmo79O
	IN+B81nDIu5qEUYVzdQ9plkS5hWZ0+NNmDVJhhT13lj7CuRB+ZBlzJzb5pHldJKApPA+f7aU14h/M
	rT8kCq453wpRur7wrzKIffIB0aaOA1Rfh9fj9dQ3VelZoIJDHqywTKcAg6kOHKVyOtEIG1cSRbtzP
	EdKUHrGg==;
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1paxA7-000j0P-1o
	for linux-riscv@lists.infradead.org;
	Sat, 11 Mar 2023 11:13:22 +0000
Received: by mail-ed1-x536.google.com with SMTP id g10so1853729eda.1
        for <linux-riscv@lists.infradead.org>; Sat, 11 Mar 2023 03:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678533196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SV/dLCNcysuQ7CKaIgag1w22Gn4yS1/4xn0PDWGs4Eo=;
        b=aewFZRIKniBekuXeMaGJNez/58uZHOVwAjNPwR+B2kHBdCJ63CkilQSENhCJYv1pG8
         zcdnWH8Q+yGhNsdegLlOpHWz7AwkjhUo95EFhrKrhmzfm1bOy3rn2FLD0oFpAV7LWLEj
         v3vF0mvNf0CiJkdaUGzWtA0y0C65mtU2nG6C7ACOubceuA5VnzGpt7TduSKrg1nOpJRr
         ia6lVsJaLdTEQsL1KCrPsaeT7F1X85eZ/ho87my7n2LIlKlqaRn762ULmRFIxorqevxu
         JVa0UPmb8expOEojDdKdP9vfyvMKf7Aja4zcK8MX/wkFeoGATANvM2Dl7hg0aqiNPoxQ
         Zqiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678533196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SV/dLCNcysuQ7CKaIgag1w22Gn4yS1/4xn0PDWGs4Eo=;
        b=I2Ak5ZjRQNLHbq22sDs7T+hg7jtnMS0rs6+1qsyEVxPw4ynHPVtsugSSD9n2V/iYzU
         lOTAEE705BtCQKFMHx8ykhAfWf75YC6CkoQSje5t97NeSQ3YC/PByeY7r+5vJClbGBSu
         vQ3E8dN28Byw5Sj1S10YkxPFU3dlsvoNgZqF3l8OLWfG1iTeEyDNzRVsEtopICZ/GkHi
         pfChEQ0fYKzr4cWH7cpn4Aj8+Se6StwP853LKHg22S1LrYcALLFP67tEW+mK7VhjWi2O
         jAvAUI5dAkq1lGYx55B/YR5hYbwaugCS97qgwhp2ULacA1tFOAdTAgtEOXybG0ZhA0aP
         2omg==
X-Gm-Message-State: AO0yUKU94p+w2ntbpqKlcsUeYXXcjf6S9oMCzMf0y1UZisCSyjuBibKZ
	NoXgvhJBKqBm8bCrHzX8PyQc7w==
X-Google-Smtp-Source: AK7set+zT8di1EH1vwo5WQtIvhf3MGOHHVEN7hy7axJP4iQDi22LYOiHLEsY77pHOuQpGOh2MpfNuA==
X-Received: by 2002:aa7:d78e:0:b0:4fa:d75c:16c6 with SMTP id s14-20020aa7d78e000000b004fad75c16c6mr515662edq.38.1678533196359;
        Sat, 11 Mar 2023 03:13:16 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:fa97:2d7c:bdd7:e1b])
        by smtp.gmail.com with ESMTPSA id s11-20020a170906bc4b00b008ee95ccfe06sm973189ejv.119.2023.03.11.03.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 03:13:16 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Mun Yew Tham <mun.yew.tham@intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Nandor Han <nandor.han@ge.com>,
	Semi Malinen <semi.malinen@ge.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 7/8] gpio: xra1403: mark OF related data as maybe unused
Date: Sat, 11 Mar 2023 12:13:06 +0100
Message-Id: <20230311111307.251123-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230311111307.251123-1-krzysztof.kozlowski@linaro.org>
References: <20230311111307.251123-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230311_111319_857661_06A4F3E0 
X-CRM114-Status: GOOD (  11.55  )
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

VGhlIGRyaXZlciBjYW4gYmUgY29tcGlsZSB0ZXN0ZWQgd2l0aCAhQ09ORklHX09GIG1ha2luZyBj
ZXJ0YWluIGRhdGEKdW51c2VkOgoKICBkcml2ZXJzL2dwaW8vZ3Bpby14cmExNDAzLmM6MTk4OjM0
OiBlcnJvcjog4oCYeHJhMTQwM19zcGlfb2ZfbWF0Y2jigJkgZGVmaW5lZCBidXQgbm90IHVzZWQg
Wy1XZXJyb3I9dW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KClNpZ25lZC1vZmYtYnk6IEtyenlzenRv
ZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJz
L2dwaW8vZ3Bpby14cmExNDAzLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwaW8vZ3Bpby14cmExNDAz
LmMgYi9kcml2ZXJzL2dwaW8vZ3Bpby14cmExNDAzLmMKaW5kZXggNDljODc4Y2ZkNWM2Li41MWQ2
MTE5ZTFiYjQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3Bpby9ncGlvLXhyYTE0MDMuYworKysgYi9k
cml2ZXJzL2dwaW8vZ3Bpby14cmExNDAzLmMKQEAgLTE5NSw3ICsxOTUsNyBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IHNwaV9kZXZpY2VfaWQgeHJhMTQwM19pZHNbXSA9IHsKIH07CiBNT0RVTEVfREVW
SUNFX1RBQkxFKHNwaSwgeHJhMTQwM19pZHMpOwogCi1zdGF0aWMgY29uc3Qgc3RydWN0IG9mX2Rl
dmljZV9pZCB4cmExNDAzX3NwaV9vZl9tYXRjaFtdID0geworc3RhdGljIGNvbnN0IHN0cnVjdCBv
Zl9kZXZpY2VfaWQgeHJhMTQwM19zcGlfb2ZfbWF0Y2hbXSBfX21heWJlX3VudXNlZCA9IHsKIAl7
IC5jb21wYXRpYmxlID0gImV4YXIseHJhMTQwMyIgfSwKIAl7fSwKIH07Ci0tIAoyLjM0LjEKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
