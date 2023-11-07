Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7199DC4167B
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 10:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a3O79HyBfGSxsKtQf6DpijQi+PNepPHyqa2W8/RQmrI=; b=ZXT10u56TlpuKa
	/jIpJQ9QuzZUSPaBNwbezITNMhGUiKitmucrTHPZ3A2CNXW2hv0x3nJ6DDrpb1UkMA5vkfSkK9xzB
	7yIm7cnmSUogZCye2KSSPCCiFi2m/XCTnZGedVioOMp9d4BFJ+IUrGZqw5ccKWVZqiDRn3crA/F2K
	uQPwsLl/HRwNuaiVbru6ov63uiW/C5HVi179Xf3sclCo5VV+gCMbeoWY0sMLrSpWtt21KscYEG+Wr
	WBDSkygrrnCTdAdLwPIOocPT9LLoeLntlYHzUnJHX75ysDuN4uz/ah0iymtvLWSQfZzoTsECOHBFr
	8sUYaj5ZpBzIJYgV7gPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Jl8-0019js-2k;
	Tue, 07 Nov 2023 10:56:38 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Jky-0019SJ-1c
	for linux-riscv@lists.infradead.org;
	Tue, 07 Nov 2023 10:56:31 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-32f9baca5bcso817497f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 07 Nov 2023 02:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699354586; x=1699959386; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hiqFYUrrovnf1rhzBHvSluIgSBMGKUT9Q2F8cmlGclI=;
        b=H5AcaVnkFfYsb23aA0LPQA3GyoFKVPfiNbzQBCSvFbUOp58FyM1nupVRzSwVbYwt19
         MUCBtKef1aZJiYwQbIwIDdJaVQaW7wfiZyAZ6coHjVk5IHSrp/DxVKDYyaAa3eAGiKAY
         j8OebHRq3hGQfm1QaH6+OzUAdwn3bhj/fkDC58l/MjOl80OMWrLFgvyvpJdgA293lbrg
         t3raR76UOJMmkbVAHV8Encd2lbOVbUdHt8zVpnyQ+L21YzM9adWpO8N8J1MbcsE8DZsL
         ZZctPxUTBBmfbtiI+7kQJzP8ZhfLp3VgZ7+5dMNvxNnz8FESdTX5FCWuLFXtckP6ZSBT
         sQig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699354586; x=1699959386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hiqFYUrrovnf1rhzBHvSluIgSBMGKUT9Q2F8cmlGclI=;
        b=UNneTmXyIQpPG+QXmXMkHyOhvXX7XduUQItyW/JFAwmJwAsvTZMISukIIA+PgXYSm+
         MulXz3kKazVUAvze0cBmh+8Hys4GpU1E48DGUO66W27KBQ8HkTW1cQozOfmk9aPenf50
         zXwoHJSSxoHdZGbZ8bqq3sIcCeTdLkpXK8L2Wp0H3DBfjGb4d+VG8SU1+XJSRM91fqIk
         6OnubU4FLeGvEeHvTZ0oIIzL0Kz/xu2TRHa5Q9wZGO5+ukc/US4iGifSpRrWJ3po5QMN
         aU1KAb4v7GYmcUHcfuHSZifL7GJpBGXlK30GrV26US6wkIz2KXJ8n1XvD9k/njMXjHna
         Ej8A==
X-Gm-Message-State: AOJu0YySw0cid9eARTVN59lAKsrJRjpSTtBrhUyv6XO7zvPCHUy4E3E5
	1KGwW07QhMLRoiHYpeALgy008R0T5Y7CGs1Ch1h5eQ==
X-Google-Smtp-Source: AGHT+IF7Zo2YtACLiPHwQ6dLVhxCBp4VHRs60nrkUPyWwGQZ1utTTeaxqjcqGnJKdNMWHeSZvxGiKQ==
X-Received: by 2002:a05:600c:3b91:b0:407:52f0:b01a with SMTP id n17-20020a05600c3b9100b0040752f0b01amr26054980wms.2.1699354585803;
        Tue, 07 Nov 2023 02:56:25 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:7db3:bdd9:4cab:2ee3])
        by smtp.gmail.com with ESMTPSA id n30-20020a05600c501e00b00405442edc69sm15396853wmr.14.2023.11.07.02.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 02:56:24 -0800 (PST)
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
	Samuel Ortiz <sameo@rivosinc.com>
Subject: [PATCH v3 20/20] dt-bindings: riscv: add Zfa ISA extension description
Date: Tue,  7 Nov 2023 11:55:56 +0100
Message-ID: <20231107105556.517187-21-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107105556.517187-1-cleger@rivosinc.com>
References: <20231107105556.517187-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_025628_538204_5CF3BB7A 
X-CRM114-Status: UNSURE (   9.04  )
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

QWRkIGRlc2NyaXB0aW9uIGZvciB0aGUgWmZhIElTQSBleHRlbnNpb25bMV0gd2hpY2ggY2FuIG5v
dyBiZQpyZXBvcnRlZCB0aHJvdWdoIGh3cHJvYmUgZm9yIHVzZXJzcGFjZSB1c2FnZS4KCkxpbms6
IGh0dHBzOi8vZHJpdmUuZ29vZ2xlLmNvbS9maWxlL2QvMVZUNlFJZ2dwYjU5LThRUlYyNjZkRUU0
VDhGWlR4R3E0L3ZpZXcgWzFdClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2Vy
QHJpdm9zaW5jLmNvbT4KLS0tCiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvcmlz
Y3YvZXh0ZW5zaW9ucy55YW1sIHwgNiArKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvcmlz
Y3YvZXh0ZW5zaW9ucy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jp
c2N2L2V4dGVuc2lvbnMueWFtbAppbmRleCA4N2M3ZTM2MDgyMTcuLmRjYmE1MzgwZjkyMyAxMDA2
NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lv
bnMueWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0
ZW5zaW9ucy55YW1sCkBAIC0yMTQsNiArMjE0LDEyIEBAIHByb3BlcnRpZXM6CiAgICAgICAgICAg
ICBpbnN0cnVjdGlvbnMgYXMgcmF0aWZpZWQgYXQgY29tbWl0IDZkMzM5MTkgKCJNZXJnZSBwdWxs
IHJlcXVlc3QgIzE1OAogICAgICAgICAgICAgZnJvbSBoaXJvb2loL2NsbXVsLWZpeC1sb29wLWVu
ZC1jb25kaXRpb24iKSBvZiByaXNjdi1iaXRtYW5pcC4KIAorICAgICAgICAtIGNvbnN0OiB6ZmEK
KyAgICAgICAgICBkZXNjcmlwdGlvbjoKKyAgICAgICAgICAgIFRoZSBzdGFuZGFyZCBaZmEgZXh0
ZW5zaW9uIGZvciBhZGRpdGlvbmFsIGZsb2F0aW5nIHBvaW50CisgICAgICAgICAgICBpbnN0cnVj
dGlvbnMsIGFzIHJhdGlmaWVkIGluIGNvbW1pdCAwNTZiNmZmICgiWmZhIGlzIHJhdGlmaWVkIikg
b2YKKyAgICAgICAgICAgIHJpc2N2LWlzYS1tYW51YWwuCisKICAgICAgICAgLSBjb25zdDogemZo
CiAgICAgICAgICAgZGVzY3JpcHRpb246CiAgICAgICAgICAgICBUaGUgc3RhbmRhcmQgWmZoIGV4
dGVuc2lvbiBmb3IgMTYtYml0IGhhbGYtcHJlY2lzaW9uIGJpbmFyeQotLSAKMi40Mi4wCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
