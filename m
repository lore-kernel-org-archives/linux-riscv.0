Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8983AC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Nov 2023 15:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BeBl0GugbBSRwnYwv5ssqOYvfRQ7F3b9AR6HFB2qQmU=; b=VZAYvDaAwo+iJX
	L8GNylkhr8VJ5K3Z1CQrMGlr1d37yjIMRrJVe1vJmdcumQpWNjORNOi0Ubk4UjrOkinNhEisSDT0p
	xH0gF6xwPEDl9/Ju/+rA1tv0tLszkaxzdDKJ1EkRtn88wgj/zpSGc1N2ffHCktxj0kL6wC3Rt7jp9
	O0XGXgL4BENjWR+81wsslt96m/VIaQtZekAbRs/RO5qPX0dC7zhPCNW0lp62WvH7T1ev+kmSoXg2L
	28oVvXv7vforg1bHgjbkp3NlBMNKbSJ0EDryNdLvo1lfvepqs5Yrtrx6cGp4eq7BxhKVwujPo9ZRU
	2GzoFGvgMj7T66iJySKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2v8Y-00GHYo-13;
	Tue, 14 Nov 2023 15:15:34 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2uAx-00G9Bw-2n
	for linux-riscv@lists.infradead.org;
	Tue, 14 Nov 2023 14:14:01 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-77891670417so55614585a.0
        for <linux-riscv@lists.infradead.org>; Tue, 14 Nov 2023 06:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699971238; x=1700576038; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rR6IoEmFXflq9Qi2M8/M8/Q1NwDbTzc9ULqQpExnZtc=;
        b=2/1XpT+YEgpNPg1wc1/z9iY9J4MiDCDj1CMD3GnmN0jgktnd1NL26wD8z53ygdZp9n
         QJPXC+2/qYHE6w+K3j16R4TL7npHYEiP1SiEcToufNhSX7q1nzCx0SeJV+besTE/2R/z
         6vqWsW8r31ixj0UqAuUSOs85bLFY6fBdo8nDc+k6P1lQwItPSRW3PBKasne4ZCgypanp
         BP66qiu15tJjwRQdwje8utxl8LUs6UaaMO2srLe1xl+D//hV6PtaFIgBa6m5Y8X9aJ4E
         xrZgC+hZlpK5FShhtaWR3P35DoGDDWJTktzBMTC3jT/lU7WRolnJV2MzI32dQyy7kyH9
         /acA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699971238; x=1700576038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rR6IoEmFXflq9Qi2M8/M8/Q1NwDbTzc9ULqQpExnZtc=;
        b=SX1AxpUIZ+lIBwv10NBow4wWJiLI3p8/bJ9LTh15OofatwzCxD+3ImRP2LevVCdK9+
         qxVDlEEue01J+hrJk7hql9qnYKZwiZmCKczX4YXQ+TcfCyDsMRcTZO0uAqWwfumaK3e4
         3Ai9OAJ+kJDaYOd5UnJcVC/8/RZHW8q+OODAPCgEuDkKk5hDIhdPZjra0hoJWtVBozkn
         JEUuFiYeMZn2H816aIUt/MNvp3WQEZnfoLovOWU6F8E/pKd1aclQ6b4ZhRtJZtxCI+y5
         9QR15kVMBkipBCBeX4jijjl3l2X+sQ6v5lifuUU9SJIXdfFmry4/gdJf58pwJQaE+6b1
         j4Kw==
X-Gm-Message-State: AOJu0YwtdHt8Cp7RuExW47egsT1+I2AnaOvpkAxsmSSBr9IeJaeEgWzM
	LIMOZ2IXyU7gikSKvLmrJBxFCLNRI0RRtUIxdYVknA==
X-Google-Smtp-Source: AGHT+IGC6MfMYTQMl9dKfVeKwBQV9tnSgNOr1rIW41NsUM7O4nwiZO4ELAHWdrBbYXRRG7zqxSN9cw==
X-Received: by 2002:a05:620a:461f:b0:774:17d6:31f1 with SMTP id br31-20020a05620a461f00b0077417d631f1mr2492695qkb.4.1699971238436;
        Tue, 14 Nov 2023 06:13:58 -0800 (PST)
Received: from carbon-x1.. ([12.186.190.2])
        by smtp.gmail.com with ESMTPSA id m2-20020a05620a220200b00777611164c5sm2701263qkh.106.2023.11.14.06.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 06:13:57 -0800 (PST)
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
	Jerry Shih <jerry.shih@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 20/20] dt-bindings: riscv: add Zfa ISA extension description
Date: Tue, 14 Nov 2023 09:12:56 -0500
Message-ID: <20231114141256.126749-21-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231114141256.126749-1-cleger@rivosinc.com>
References: <20231114141256.126749-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_061359_931563_85E800DD 
X-CRM114-Status: UNSURE (   8.45  )
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

QWRkIGRlc2NyaXB0aW9uIGZvciB0aGUgWmZhIElTQSBleHRlbnNpb25bMV0uCgpMaW5rOiBodHRw
czovL2RyaXZlLmdvb2dsZS5jb20vZmlsZS9kLzFWVDZRSWdncGI1OS04UVJWMjY2ZEVFNFQ4RlpU
eEdxNC92aWV3IFsxXQpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZv
c2luYy5jb20+CkFja2VkLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAu
Y29tPgotLS0KIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNp
b25zLnlhbWwgfCA2ICsrKysrKwogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNp
b25zLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5z
aW9ucy55YW1sCmluZGV4IGI5MWQ0OWI3YzNhMC4uMzU3NGEwYjcwYmU0IDEwMDY0NAotLS0gYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sCisr
KyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlh
bWwKQEAgLTIxNCw2ICsyMTQsMTIgQEAgcHJvcGVydGllczoKICAgICAgICAgICAgIGluc3RydWN0
aW9ucyBhcyByYXRpZmllZCBhdCBjb21taXQgNmQzMzkxOSAoIk1lcmdlIHB1bGwgcmVxdWVzdCAj
MTU4CiAgICAgICAgICAgICBmcm9tIGhpcm9vaWgvY2xtdWwtZml4LWxvb3AtZW5kLWNvbmRpdGlv
biIpIG9mIHJpc2N2LWJpdG1hbmlwLgogCisgICAgICAgIC0gY29uc3Q6IHpmYQorICAgICAgICAg
IGRlc2NyaXB0aW9uOgorICAgICAgICAgICAgVGhlIHN0YW5kYXJkIFpmYSBleHRlbnNpb24gZm9y
IGFkZGl0aW9uYWwgZmxvYXRpbmcgcG9pbnQKKyAgICAgICAgICAgIGluc3RydWN0aW9ucywgYXMg
cmF0aWZpZWQgaW4gY29tbWl0IDA1NmI2ZmYgKCJaZmEgaXMgcmF0aWZpZWQiKSBvZgorICAgICAg
ICAgICAgcmlzY3YtaXNhLW1hbnVhbC4KKwogICAgICAgICAtIGNvbnN0OiB6ZmgKICAgICAgICAg
ICBkZXNjcmlwdGlvbjoKICAgICAgICAgICAgIFRoZSBzdGFuZGFyZCBaZmggZXh0ZW5zaW9uIGZv
ciAxNi1iaXQgaGFsZi1wcmVjaXNpb24gYmluYXJ5Ci0tIAoyLjQyLjAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
