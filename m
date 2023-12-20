Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CABCC46CD3
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 15:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=q9bvFyWsFxEh+2jKc8ybEh0mPkaHLfgjwZPyNneGqpk=; b=y/gxm9Y92Fq6my
	Ap6KExzhPP0kNs7UMq0p4fqfp6XZINsyPZPO4HVDOC7Gi7z+K1ig27gk+JHx1wipmJb9Pc5NyHFc3
	AMLSl2Anq+oWGnPzb5jO4QEgwhLHYJdBr5DPXUy2bHDlt3Aq2D8/5u7tZVQVtqxqhjjJnpw8tp+Ir
	qvnlYV9Bfw1Ojk3PNCKJ/uI0S9CQKED05BoqwE1W3oTOHwvGuaks79cXdrznDKl6UgmcH/e00qwIH
	K2SkH5j1EU0YVT0BfRYN2s0plE1S/Avh4IXIeTTZ3L3C46/jLRwX0Gsimt5Iu8lHNpe2V6p9SN791
	s9P6EQ6DLe8fQo+FWNbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFyxA-000KL3-2J;
	Wed, 20 Dec 2023 15:57:48 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFyx7-000KIj-0y
	for linux-riscv@lists.infradead.org;
	Wed, 20 Dec 2023 15:57:46 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-50bcf41379bso1520384e87.1
        for <linux-riscv@lists.infradead.org>; Wed, 20 Dec 2023 07:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1703087860; x=1703692660; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lXGoVjd4u7kYD7llneKYEOWLFOV8IcsaMr6UiEiL8lA=;
        b=Cmgkhu/0Wf9lFq4HsphkaNtBi+7UBgHa2Mjn9jrJ9eTjpSJsw0t5WM8C2uLJu+zI6T
         /c/Ur9tBTtiENxi5HwgNhRO/mH/M+5UDgE5IWNH/8FKsnpjtL72GQMPRPE8ENp6+Ij+3
         dcjxrTZZRwRhNtItk+PNFdekeL24wej3FTo+iH+t5DhlRt0ZpIfGsOCoHXKx76kU5y1t
         mxWOZmEsTubglkKpXjvxoUBvWwnXFI4FsUA4KngBxPPjYwvNURhvWCSxmVwsVXi5fCOe
         wXv7kf+ydV6pWmMNxW7IbBq4zfZy4y9WIh1RF26L8M1MQJypaP/QLaadPkkPHJEpGriu
         PqGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703087860; x=1703692660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lXGoVjd4u7kYD7llneKYEOWLFOV8IcsaMr6UiEiL8lA=;
        b=OxzvPoLsHNiLkpxy30m0lBx6ZwxPlRDQDamIwP4iy2az6D99DgPtMk6PETqWndZUrO
         0aXyWqjFCZ8U71uqcxEOi/4CwnJI9z9xXRlfmlzlyX2jE75rwlvILoY+NtBTllE2cKXO
         sjSDaej8tTEftWST0LMuH8Cm/z8Kuyy7MmkKbhIx5SxK8Kvt9zqNx+bO2g2i1GUVMCEI
         m7JuFd7l1ed0fw8gB7TMTjDXJ/rb1m69il9tQqHSumkTNSCUfq6QpLkMr/euNix6fL/1
         fMnF/w54pMnGFO824jFShEujsu3RFi1/h40qVfyFXFc9ZNvHBSDbyWQPfE2JxdriVAlb
         tumA==
X-Gm-Message-State: AOJu0YwrAnu6DoySjs9NK/XfzHD7DY3W0FvdhlgI20tzdJsMTssqwA2p
	kZzMhqyrddOb/rXCKqFG2Xyxsg==
X-Google-Smtp-Source: AGHT+IGvk4pAMVhFAQz7BALeRDKatbOjz/HnD6L+wq8WrKnoDOVFvFkoMQFUdTnt9ae82wR35gTXGg==
X-Received: by 2002:a05:6512:3a95:b0:50e:4a7b:f506 with SMTP id q21-20020a0565123a9500b0050e4a7bf506mr2980459lfu.4.1703087860189;
        Wed, 20 Dec 2023 07:57:40 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:3eae:b70:f27f:7aa1])
        by smtp.gmail.com with ESMTPSA id h18-20020adffd52000000b003366af9d611sm7279693wrs.22.2023.12.20.07.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 07:57:39 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Robbin Ehn <rehn@rivosinc.com>,
	Gianluca Guida <gianluca@rivosinc.com>
Subject: [PATCH v2 0/6] riscv: hwprobe: add Zicond, Zacas and Ztso support
Date: Wed, 20 Dec 2023 16:57:16 +0100
Message-ID: <20231220155723.684081-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_075745_334563_143AB26A 
X-CRM114-Status: UNSURE (   8.84  )
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

VGhpcyBzZXJpZXMgYWRkIHN1cHBvcnQgZm9yIGEgZmV3IG1vcmUgZXh0ZW5zaW9ucyB0aGF0IGFy
ZSBwcmVzZW50IGluCnRoZSBSVkEyMlU2NC9SVkEyM1U2NCAoZWl0aGVyIG1hbmRhdG9yeSBvciBv
cHRpb25hbCkgYW5kIHRoYXQgYXJlIHVzZWZ1bApmb3IgdXNlcnNwYWNlOgotIFppY29uZAotIFph
Y2FzCi0gWnRzbwoKU2VyaWVzIGN1cnJlbnRseSBiYXNlZCBvbiByaXNjdi9mb3ItbmV4dC4KCi0t
LQoKQ2hhbmdlcyBpbiBWMjoKIC0gUmVtb3ZlZCBaYW0gd2hpY2ggaXMgbm90IHlldCByYXRpZmll
ZAogLSBMaW5rIHRvIHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDIz
MTIxMzExMzMwOC4xMzMxNzYtMS1jbGVnZXJAcml2b3NpbmMuY29tLwoKQ2zDqW1lbnQgTMOpZ2Vy
ICg2KToKICByaXNjdjogYWRkIElTQSBleHRlbnNpb24gcGFyc2luZyBmb3IgWnRzbwogIHJpc2N2
OiBod3Byb2JlOiBleHBvcnQgWnRzbyBJU0EgZXh0ZW5zaW9uCiAgZHQtYmluZGluZ3M6IHJpc2N2
OiBhZGQgWmFjYXMgSVNBIGV4dGVuc2lvbiBkZXNjcmlwdGlvbgogIHJpc2N2OiBhZGQgSVNBIGV4
dGVuc2lvbiBwYXJzaW5nIGZvciBaYWNhcwogIHJpc2N2OiBod3Byb2JlOiBleHBvcnQgWmFjYXMg
SVNBIGV4dGVuc2lvbgogIHJpc2N2OiBod3Byb2JlOiBleHBvcnQgWmljb25kIGV4dGVuc2lvbgoK
IERvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdCAgICAgICAgICAgICAgICB8IDEz
ICsrKysrKysrKysrKysKIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMu
eWFtbCAgICAgICB8ICA2ICsrKysrKwogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oICAg
ICAgICAgICAgICAgICAgICAgIHwgIDIgKysKIGFyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9o
d3Byb2JlLmggICAgICAgICAgICAgICB8ICAzICsrKwogYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVh
dHVyZS5jICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKysKIGFyY2gvcmlzY3Yva2VybmVsL3N5
c19yaXNjdi5jICAgICAgICAgICAgICAgICAgICAgICB8ICAzICsrKwogNiBmaWxlcyBjaGFuZ2Vk
LCAyOSBpbnNlcnRpb25zKCspCgotLSAKMi40My4wCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
