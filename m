Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 570FFCD6E5C
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 11:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N0lhGsLCSZ92zuaTYki7h8/xzM2QzPVjTzJVeiUYA2w=; b=139CuuoYKEbC3g
	DeeSW8xH/7mOAbnry37Z+RxbNd9wnGCru6bfO7zJS/5BQfLiAnwEYTWs0bLoZhZnpPDhgCCvNNKVQ
	HxBn3M4uNPcIqGp9W+vH8o3wqsgAsmLSMP4u+YVTICciCMFOuQ8pTMbJ8f3HPe4gl2VxfZjhKLXIT
	3PA30sUr3rOKi/zRt5Q/1TpMtZ5+LJvmF+SPxS9hTn1iAJVo85m4/21UCdlix1cVetKHLS3sZv204
	PnCEzI873enGLpn84ehQy4/9VHi7Dx5AFrE9KVHk+HTGSh9IcdNHEOW3blybW2Ct6NcB9lE792C5S
	S94PjMTnw0JaEcDMf2Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqXFf-00Fjaa-2m;
	Wed, 11 Oct 2023 11:19:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqXFe-00FjZW-33
	for linux-riscv@bombadil.infradead.org;
	Wed, 11 Oct 2023 11:19:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=C6vkJpRdG/bLQ2xKu/qLTVaLR+B+KqIXN0A+WQhuda0=; b=HGhDcixllfebbYLVk60SYxWIM5
	BUJ9WpDDiY8xiz9hKziR3iqvzIHQ1jnajB/pxGyUvoce2IM4/X5aES4ltXvECCxcRv2NR6m+E4G1y
	XeXaRwRH2TA6myItt77Ck9CCBqBHLEMxRjXsralYq2P3wmO2nk1fe+dHqlxZOI8KCwZ896TlxJWwT
	fuNnIJTwJKB432gImt3YqonPq8FAopl6fVp9LsZTTXKUAiumc88dpehnGmnYKQDTNzHZ52uB3wdMr
	G0HcOAzk3Ctq8vdQqkOHigsgoUTSo0KjNyIM2EcFYmAnJv15EtkNi3OT/Dh4oklBvAInpEsgCbgiF
	JkkXCppQ==;
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqXFP-000A3I-2q
	for linux-riscv@lists.infradead.org;
	Wed, 11 Oct 2023 11:19:41 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-406aaccb41dso18558785e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 11 Oct 2023 04:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697023168; x=1697627968; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C6vkJpRdG/bLQ2xKu/qLTVaLR+B+KqIXN0A+WQhuda0=;
        b=G5FHm9n9xwoPvsZwT3ruomEQT/isDvdvd2+MuJhyw6gOH4nkPNHyriEDN7P+++oaSp
         yEymUKwZz5qOB7uaXVr+Dj+SJknWJdgcqTb7ACNVnbOF+vyawkOUNnlSPxODpWWrt9jv
         4Dzh7OLHUKSvOtKDXwZ9POcVYE4pZuVBOxC2Sv8pDyZy53gdB3e0KgzxbGRe4Z/E7TEs
         kCi4M6n1RG2KWNmi7Bc8J0TXMTqun3dUnyaMYVzTVtaY1d4Iv7a9eqFVbLLMrKZ1aW44
         Cp+o9Svh6aOnJrS1glmODN/72dmcRuy7lgGsJ+oIaqR9yO+x+SZD7sIGL1wtGRdxVE1A
         c0Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697023168; x=1697627968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C6vkJpRdG/bLQ2xKu/qLTVaLR+B+KqIXN0A+WQhuda0=;
        b=Xs3s92rzo9Qmf05ax6xyWRamRsZcV9gtA/JrvVSHgsd0B6irCam8g+FQfAzz7K9qTY
         lRW0qNjIcL4aAOEU8sWxqZ76iUx3U7O0s56x6hKn0/PKCq7mefwz5fM06SYQg2BkUSxa
         9MbDM3oE5dLbGBq9Kfwn34UDIK2sqjcuPNZMo6wMvaW/Y0Joqf8tVIPIdElG+upv8xJj
         nnyrx1BBwW22XuWNANSEBgvvhEhMuvWT7UbTZcsKcQPCxE8w4j0JUgbiiyl0xifYRVjF
         GynL2qe+LU6Em+63nIX07xXamLyBJUcQmqT2FMzwtpa2AW/Y1JXNyBtnJFBSDs70LVwi
         Y3LA==
X-Gm-Message-State: AOJu0YwqoSS5j/O9T5jEdZBE0ZPhWR6pAqo6TVTE4Pdu3xlOzVjVt15X
	y02KGAyb+c/4zjiELRimQ0CYsPLt7qqRpYYYYqAv/w==
X-Google-Smtp-Source: AGHT+IHXrxe2sFvVo+XelH0PH3G8nahvmswXp0qGPu5jm1rix/iAXBAzMu1U6LxnE5OCFMSwjGB0dQ==
X-Received: by 2002:a05:600c:511d:b0:401:b53e:6c3e with SMTP id o29-20020a05600c511d00b00401b53e6c3emr18807765wms.1.1697023167444;
        Wed, 11 Oct 2023 04:19:27 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:9134:b302:d8b:a200])
        by smtp.gmail.com with ESMTPSA id a4-20020a05600c224400b003fe2b081661sm18945715wmm.30.2023.10.11.04.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 04:19:26 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Jones <ajones@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>,
	Conor Dooley <conor@kernel.org>
Subject: [PATCH v1 13/13] dt-bindings: riscv: add Zvfh[min] ISA extension description
Date: Wed, 11 Oct 2023 13:14:38 +0200
Message-ID: <20231011111438.909552-14-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231011111438.909552-1-cleger@rivosinc.com>
References: <20231011111438.909552-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_121929_420668_DA56FA96 
X-CRM114-Status: UNSURE (   8.27  )
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

QWRkIGRlc2NyaXB0aW9uIGZvciBadmZoW21pbl0gSVNBIGV4dGVuc2lvblsxXSB3aGljaCBjYW4g
bm93IGJlCnJlcG9ydGVkIHRocm91Z2ggaHdwcm9iZSBmb3IgdXNlcnNwYWNlIHVzYWdlLgoKWzFd
IGh0dHBzOi8vZHJpdmUuZ29vZ2xlLmNvbS9maWxlL2QvMV9ZdDYwSEdBZjFyMWh4N0puc0lwdHcw
c3FrQmQ5QlE4L3ZpZXcKClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJp
dm9zaW5jLmNvbT4KLS0tCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25z
LnlhbWwgICAgICAgIHwgMTIgKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9y
aXNjdi9leHRlbnNpb25zLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
cmlzY3YvZXh0ZW5zaW9ucy55YW1sCmluZGV4IDcwYzJiMDM1MTM1Ny4uYWU3ZGI0MjBhYjkyIDEw
MDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5z
aW9ucy55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9l
eHRlbnNpb25zLnlhbWwKQEAgLTI3Nyw2ICsyNzcsMTggQEAgcHJvcGVydGllczoKICAgICAgICAg
ICAgIGluc3RydWN0aW9ucywgYXMgcmF0aWZpZWQgaW4gY29tbWl0IDU2ZWQ3OTUgKCJVcGRhdGUK
ICAgICAgICAgICAgIHJpc2N2LWNyeXB0by1zcGVjLXZlY3Rvci5hZG9jIikgb2YgcmlzY3YtY3J5
cHRvLgogCisgICAgICAgIC0gY29uc3Q6IHp2ZmgKKyAgICAgICAgICBkZXNjcmlwdGlvbjoKKyAg
ICAgICAgICAgIFRoZSBzdGFuZGFyZCBadmZoIGV4dGVuc2lvbiBmb3IgdmVjdG9yZWQgaGFsZi1w
cmVjaXNpb24KKyAgICAgICAgICAgIGZsb2F0aW5nLXBvaW50IGluc3RydWN0aW9ucywgYXMgcmF0
aWZpZWQgaW4gY29tbWl0IGUyY2NkMDUKKyAgICAgICAgICAgICgiUmVtb3ZlIGRyYWZ0IHdhcm5p
bmdzIGZyb20gWnZmaFttaW5dIikgb2YgcmlzY3Ytdi1zcGVjLgorCisgICAgICAgIC0gY29uc3Q6
IHp2ZmhtaW4KKyAgICAgICAgICBkZXNjcmlwdGlvbjoKKyAgICAgICAgICAgIFRoZSBzdGFuZGFy
ZCBadmZobWluIGV4dGVuc2lvbiBmb3IgdmVjdG9yZWQgbWluaW1hbCBoYWxmLXByZWNpc2lvbgor
ICAgICAgICAgICAgZmxvYXRpbmctcG9pbnQgaW5zdHJ1Y3Rpb25zLCBhcyByYXRpZmllZCBpbiBj
b21taXQgZTJjY2QwNQorICAgICAgICAgICAgKCJSZW1vdmUgZHJhZnQgd2FybmluZ3MgZnJvbSBa
dmZoW21pbl0iKSBvZiByaXNjdi12LXNwZWMuCisKICAgICAgICAgLSBjb25zdDogenZrYgogICAg
ICAgICAgIGRlc2NyaXB0aW9uOgogICAgICAgICAgICAgVGhlIHN0YW5kYXJkIFp2a2IgZXh0ZW5z
aW9uIGZvciB2ZWN0b3IgY3J5cHRvZ3JhcGh5IGJpdC1tYW5pcHVsYXRpb24KLS0gCjIuNDIuMAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
