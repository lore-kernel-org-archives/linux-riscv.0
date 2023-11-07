Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA417C4167D
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 10:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R37jiUWlFe7flMnzewEz1U0LysYPYmcozCR38gmL+co=; b=4F4rDeBbu/2tNX
	hy72k86FJhblURzrxVLBMa25l6Um9vgruV0EUdMNXaVOMj69OTqeI6o1fAntgg6jhrcqpUnRIuLsW
	wWKYCk4dkBbeT0U15QZxBe/HLEfHpYSVDF6qh0EY2qBVzhAkZ21jypP6SHatNCTjI783DIx3l9WyD
	G7q/18JIkSTETwqv4UUHgWsgT5suJ9V9lC7ZZwgCez4Osi0XW1LpBygkhIDNwUZw31pOQEZJwIqJT
	iwttDJ6OlRjCu44RY4MCPX4qtyID639ZsOOmJ71h7WUxeiBGeVpd+lz9Ab1b+zmEQ462JxxU6qqOa
	cJCRgKlkGcNLGs6Rgqag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0JlD-0019rA-1a;
	Tue, 07 Nov 2023 10:56:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0JlC-0019ny-1S
	for linux-riscv@bombadil.infradead.org;
	Tue, 07 Nov 2023 10:56:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=/uOByuhC3t5IOOn5XXUVJDYNM9V7BqpeySL2m3Y9NXo=; b=hnsnPya9pC2rv+9kcch4k19G4C
	qwL1+OYpsdk7NQe1JYEXylUQY17IJ8NSYV1iB4MDTb48+ugBRRBdNw3px62G46AiMNpJZoS+dbvaz
	V0r5YyJ3F+exZGm7+i53ASBjd6S1yJf6TlxNocZKvqS/Arh8xnj5BIM2JErE0+HDdKPB3ojQvH1n6
	IQN+KtZbrjiwF2/3c56lo4e7vBvC0XYcF2LakZGeQUTePaKxpi5/gYe+J2CMSm1WY8yBR9SBLpBl6
	Coq4MYfsisE8QaCxHuOX70nm6MNwsqVx4enWQ3Ik+CVXFiUPsHsnnoU5nGEsSXGp4RFavY79p83As
	daOqGjRQ==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Jkz-00Bx8U-13
	for linux-riscv@lists.infradead.org;
	Tue, 07 Nov 2023 10:56:39 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-408434ce195so10593845e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 07 Nov 2023 02:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699354582; x=1699959382; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/uOByuhC3t5IOOn5XXUVJDYNM9V7BqpeySL2m3Y9NXo=;
        b=aKy4hT4qbHUpLQKEvH9R2w5mrIk9qNFqAaaTVdDMLPZcimrnByXDuMAt75ISGwAb5t
         U5jGZsrYaB4F4XDlWtvexKscVXC5NIBplPzwZNmQIxAIJWX61V/xJPlTcMO0yFLKA03a
         aBkRUCea9Qi+Zsr9B4ObAZZrfeE2RsLDIjNsEph8H+5NbeNCAOp2QrHex497X0PYrEzE
         XsFDqamUvOYT88exCY3YfkUr1+rBnE0mLvOiAwEgD2JFx8qiNqEJ1Y3sPc7xwc05MVtR
         puzwSojWTuZ1zrY3BoFMM2+MGbE5U9SQAThNokdx4WZTS4HGBz3oe8wepcc86e1R3XDT
         sVsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699354582; x=1699959382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/uOByuhC3t5IOOn5XXUVJDYNM9V7BqpeySL2m3Y9NXo=;
        b=M8DmKdb58+8s9Tx2pTyFPz8Nk9OkffPcp83oFV1vkQDU8NoVMdtZtnbezaHk0dsd7u
         8hZhxpX6/oMcsviYC1H1Oy2KZWuB2IOoGmII77ZvF3FtZqvHECgwqCDyvcnPTD5zMtfL
         rR7UswEYKwIe0aI96PaC/Y7KC1otRxE4Xai1+HoS/OjCgW2/MsCTdLdtbz2q1feiFwoQ
         26V0yfdLtlqj4frZQL08D/rpwsgel/0GUAWTIrmi/0YaUwXOnm+eKoDWfXk2sgWYC6hN
         uy+VoAauIwsyUGbkJiufUou6YSBx2PG8emSQW0Wkh7zOSdU9S2sML56nmddZZvpJKU41
         2MSg==
X-Gm-Message-State: AOJu0YyBXGbGFm6PlZ1/KWynz3BuWD0ySp2i5HtElVHN0yhuKR54dNSZ
	qoPsnMUlAimUV9ie2LgcGDSOwg5DDo7MRdQUuxc+0g==
X-Google-Smtp-Source: AGHT+IELIW3LIg2lrza+HJKbS5ridEWLR16IdBcQqrj8daJI6htUFeT4tLiej2ONYAZOAOmlBwC5Kg==
X-Received: by 2002:a05:600c:5128:b0:401:c07f:72bd with SMTP id o40-20020a05600c512800b00401c07f72bdmr25945621wms.4.1699354582180;
        Tue, 07 Nov 2023 02:56:22 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:7db3:bdd9:4cab:2ee3])
        by smtp.gmail.com with ESMTPSA id n30-20020a05600c501e00b00405442edc69sm15396853wmr.14.2023.11.07.02.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 02:56:20 -0800 (PST)
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
	Conor Dooley <conor@kernel.org>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 17/20] dt-bindings: riscv: add Zvfh[min] ISA extension description
Date: Tue,  7 Nov 2023 11:55:53 +0100
Message-ID: <20231107105556.517187-18-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107105556.517187-1-cleger@rivosinc.com>
References: <20231107105556.517187-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_105629_398692_4C0B1643 
X-CRM114-Status: UNSURE (   8.73  )
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
bm93IGJlCnJlcG9ydGVkIHRocm91Z2ggaHdwcm9iZSBmb3IgdXNlcnNwYWNlIHVzYWdlLgoKTGlu
azogaHR0cHM6Ly9kcml2ZS5nb29nbGUuY29tL2ZpbGUvZC8xX1l0NjBIR0FmMXIxaHg3Sm5zSXB0
dzBzcWtCZDlCUTgvdmlldyBbMV0KU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVn
ZXJAcml2b3NpbmMuY29tPgpBY2tlZC1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWlj
cm9jaGlwLmNvbT4KLS0tCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25z
LnlhbWwgICAgICAgIHwgMTIgKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9y
aXNjdi9leHRlbnNpb25zLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
cmlzY3YvZXh0ZW5zaW9ucy55YW1sCmluZGV4IGM4MDc3NGI1MThjOS4uODdjN2UzNjA4MjE3IDEw
MDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5z
aW9ucy55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9l
eHRlbnNpb25zLnlhbWwKQEAgLTM2Niw2ICszNjYsMTggQEAgcHJvcGVydGllczoKICAgICAgICAg
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
