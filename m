Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB94CC27C79
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jun 2024 15:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e+DEyBC0RXFWUqHdFrx9J8yQrLnrr0RmS9ktfSXDyew=; b=C/c2+YfzmVKVGA
	6mhoaX2ngQ/0nlUzzApKegSQSVevgrSTf5Ppar6TqdeWSCy/rXYYuekQVimjY2hAb8/488ZrX8lx2
	/z7FtAxiExJJyvB44hpCaVGmcwLmEbEWmV57Vua6BBzrEicgq3g6/FV6YZ2PX8zIQjiK9QYrXf4gt
	iKayyYreU5Ca6OFqloFxdg0q7j+dt5PcgPU7LOuqou0tb2QQPPE20heD47Nq8SigSIGqwTlbpOMXq
	PsTSjDxXsq1wQ51ZcpEBe4jyinFYUVpjWZnnXbbs2KYgx2Nr/dNJJWt2+8Y7aFm6JBP9c+oYw9QsZ
	EhTcsdfdC7vMGLaIF4Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJxR1-00000001qZF-20Z4;
	Wed, 19 Jun 2024 15:41:19 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJxQv-00000001qTA-0frr
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jun 2024 15:41:15 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-35f0dac5909so523291f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jun 2024 08:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718811671; x=1719416471; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4SiklklSKLnUGvj1C6ENo1sDkOQpn+QWruzZ6zUta1c=;
        b=XmXtInNafrU+jwnsJpzJKlce8RvfzMVPIliHeLlFYIvNBEGYSCw1BZtiUMGKQActKs
         fhsNI1n0KKakm4m3/gemJP2v7nCi59nAPDG0qk5AEk8APVAZTeXOOVvTIwFXAM9xky7K
         YZw9wwyGXRzqeIt5wNEnf23Qe2AC30Crc86VkvgIkUqRXYMXK79+BXLIxQU/XGREvGIA
         /7Vn6rlOnOO14JI/Am4UAgQthOknwu8irYp54Q81CVcjDT2u2WZFKLm/+PxLmMp1iPcU
         JAkcuAcpITNIwJH/3TYS4AZBdS8MsPpRAZOVPHKlWudsVTHPcjHy/CbHTuru41OAUHGU
         RvNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718811671; x=1719416471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4SiklklSKLnUGvj1C6ENo1sDkOQpn+QWruzZ6zUta1c=;
        b=WYfy6A/baGjdIXUbfnw5RGY66ihOhDCiSQwAt+JsxFPwfsx3odp8ivMaZ7DtWxI7ge
         +DGtmFT7J4ZCgaZQmmV36HcE+VjPnKw2/zhBsF4enPWJ6Kwipm1JJWnEC1yW+UmgTOrX
         GAPYyy4k6QROoG/0ZBON2ntruWdqd9FNO+jhBBHOhxNJ/IIMGOoS86DqHHvYB4Jtpvwy
         P165vuLYftOutQ3ZtZKdjuJqDogXKGFo4dychQBNRdyrvwoaE81X39Bu7wIGPTl4hrOg
         1Xfqai/C4RnvtTVtWezjmWbKIWJN5bnhcEkICywAPTYZHqfMI3n5jOvmB7GcFm1N8qmp
         yR2g==
X-Forwarded-Encrypted: i=1; AJvYcCXlzqUyta8s2JIfc/NnhSke17XdKI5muF0F6f6M0QjjlMnDofsgSNTA8LmasSQ2Ltg0nZsqbrcIYXXBVmrg969uec04o7JM9EiiNlbNmaAo
X-Gm-Message-State: AOJu0Yyla5XBPNe3HjNFBOTbjHnevAJBc1qtTaxxAK9li/Gu4aIfm1eK
	fTMkaA6McAac7PCG/Ki9XFCgJmv63VMOwZ4qv6sD+AGBGDJa5FigHbsZzxQxdRo=
X-Google-Smtp-Source: AGHT+IFM9BO+cRboDOZItswqfJhKnEJlq+pT+xsqwOnHXCasZo7t145rk+2pPxABjV30c0ZiYjwFGQ==
X-Received: by 2002:a05:6000:1787:b0:35f:247e:fbce with SMTP id ffacd0b85a97d-363170ed4c8mr2179347f8f.1.1718811671025;
        Wed, 19 Jun 2024 08:41:11 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:819d:b9d2:9c2:3b7a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3607509c785sm17392292f8f.34.2024.06.19.08.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 08:41:10 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Shuah Khan <shuah@kernel.org>,
	Atish Patra <atishp@atishpatra.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 1/5] dt-bindings: riscv: add Zaamo and Zalrsc ISA extension description
Date: Wed, 19 Jun 2024 17:39:08 +0200
Message-ID: <20240619153913.867263-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240619153913.867263-1-cleger@rivosinc.com>
References: <20240619153913.867263-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_084113_211372_25FE887A 
X-CRM114-Status: UNSURE (   9.26  )
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

QWRkIGRlc2NyaXB0aW9uIGZvciB0aGUgWmFhbW8gYW5kIFphbHJzYyBJU0EgZXh0ZW5zaW9uWzFd
LgoKTGluazogaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2L3Jpc2N2LXphYW1vLXphbHJzYyBbMV0K
U2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgotLS0K
IC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbCB8IDE5ICsrKysr
KysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMu
eWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25z
LnlhbWwKaW5kZXggMzNmMWE4NmVmZWQ4Li45ODI2ODRlNGRhYTEgMTAwNjQ0Ci0tLSBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwKKysrIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbApA
QCAtMTcxLDEyICsxNzEsMjQgQEAgcHJvcGVydGllczoKICAgICAgICAgICAgIG1lbW9yeSB0eXBl
cyBhcyByYXRpZmllZCBpbiB0aGUgMjAxOTEyMTMgdmVyc2lvbiBvZiB0aGUgcHJpdmlsZWdlZAog
ICAgICAgICAgICAgSVNBIHNwZWNpZmljYXRpb24uCiAKKyAgICAgICAgLSBjb25zdDogemFhbW8K
KyAgICAgICAgICBkZXNjcmlwdGlvbjogfAorICAgICAgICAgICAgVGhlIHN0YW5kYXJkIFphYW1v
IGV4dGVuc2lvbiBmb3IgYXRvbWljIG1lbW9yeSBvcGVyYXRpb25zIGFzCisgICAgICAgICAgICBy
YXRpZmllZCBhdCBjb21taXQgZTg3NDEyZTYyMWYxICgiaW50ZWdyYXRlIFphYW1vIGFuZCBaYWxy
c2MgdGV4dAorICAgICAgICAgICAgKCMxMzA0KSIpIG9mIHRoZSB1bnByaXZpbGVnZWQgSVNBIHNw
ZWNpZmljYXRpb24uCisKICAgICAgICAgLSBjb25zdDogemFjYXMKICAgICAgICAgICBkZXNjcmlw
dGlvbjogfAogICAgICAgICAgICAgVGhlIFphY2FzIGV4dGVuc2lvbiBmb3IgQXRvbWljIENvbXBh
cmUtYW5kLVN3YXAgKENBUykgaW5zdHJ1Y3Rpb25zCiAgICAgICAgICAgICBpcyBzdXBwb3J0ZWQg
YXMgcmF0aWZpZWQgYXQgY29tbWl0IDUwNTllMGNhNjQxYyAoInVwZGF0ZSB0bwogICAgICAgICAg
ICAgcmF0aWZpZWQiKSBvZiB0aGUgcmlzY3YtemFjYXMuCiAKKyAgICAgICAgLSBjb25zdDogemFs
cnNjCisgICAgICAgICAgZGVzY3JpcHRpb246IHwKKyAgICAgICAgICAgIFRoZSBzdGFuZGFyZCBa
YWxyc2MgZXh0ZW5zaW9uIGZvciBsb2FkLXJlc2VydmVkL3N0b3JlLWNvbmRpdGlvbmFsIGFzCisg
ICAgICAgICAgICByYXRpZmllZCBhdCBjb21taXQgZTg3NDEyZTYyMWYxICgiaW50ZWdyYXRlIFph
YW1vIGFuZCBaYWxyc2MgdGV4dAorICAgICAgICAgICAgKCMxMzA0KSIpIG9mIHRoZSB1bnByaXZp
bGVnZWQgSVNBIHNwZWNpZmljYXRpb24uCisKICAgICAgICAgLSBjb25zdDogemJhCiAgICAgICAg
ICAgZGVzY3JpcHRpb246IHwKICAgICAgICAgICAgIFRoZSBzdGFuZGFyZCBaYmEgYml0LW1hbmlw
dWxhdGlvbiBleHRlbnNpb24gZm9yIGFkZHJlc3MgZ2VuZXJhdGlvbgpAQCAtNTkxLDYgKzYwMywx
MyBAQCBwcm9wZXJ0aWVzOgogICAgICAgICB0aGVuOgogICAgICAgICAgIGNvbnRhaW5zOgogICAg
ICAgICAgICAgY29uc3Q6IHpjYQorICAgICAgIyBaYWNhcyBkZXBlbmRzIG9uIFphYW1vCisgICAg
ICAtIGlmOgorICAgICAgICAgIGNvbnRhaW5zOgorICAgICAgICAgICAgY29uc3Q6IHphY2FzCisg
ICAgICAgIHRoZW46CisgICAgICAgICAgY29udGFpbnM6CisgICAgICAgICAgICBjb25zdDogemFh
bW8KIAogYWxsT2Y6CiAgICMgWmNmIGV4dGVuc2lvbiBkb2VzIG5vdCBleGlzdCBvbiBydjY0Ci0t
IAoyLjQ1LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
