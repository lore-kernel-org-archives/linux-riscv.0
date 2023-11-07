Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 186D5C00A5A
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 10:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fb6uBNgNG2h3AAN6vi1qQLpzMW9yxCW0jPctXgdwv74=; b=Bt7mgt1ETRUn0b
	J9/yPBa4ooziRS6reFPd2aYNNSd9NoR7RImPEpsYbwpFJf4T6S9Vl5lXmsre70UNS+kCLRtRTLbPf
	Ye+Vi1/+fA8Ypjz3nVzu5j8liKEOsOpbdlVlUQ7Hblt3XHSYzkhz4GBIQhJ935bAsYlA/HjKx1yFZ
	D2HY9fka/r0vmE2f+HpHeb/GTyDo6/IqlgQyGS44KUuCgxmi8nAX8BcwWMIfF6RwjH5vj0tPg9bKO
	xKfDL4wMwnDa1QXJ43fD6wEVoWps4c3VGJxKbY4zs43TdiPMfDkfSAxhQNSA8qoxW+04zJIhtRgXF
	OToEPyEt3BINpm/Jurmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Jku-0019P9-0J;
	Tue, 07 Nov 2023 10:56:24 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Jkm-0019D5-3B
	for linux-riscv@lists.infradead.org;
	Tue, 07 Nov 2023 10:56:19 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-9bf60bba6f8so165968566b.0
        for <linux-riscv@lists.infradead.org>; Tue, 07 Nov 2023 02:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699354574; x=1699959374; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K+noeIiO0ZzRdCBLgjz9J+sy56GBx1867ixAgWMD4Wc=;
        b=h3Y4ooXTocGS5A7m8kPcQ3IISI5uboeFVCPAju4JgClxfCULP7L75wlQB/wcCnowrj
         thLiPsQcJ693LG9HPdWePop9eNn6/867RK0E+c7snSPTpazVXI6JT/MIitj2xiu/fwon
         9dj2JIB9ggC3DkqE12UdBbZ9+R6CEzhY4NyxefZUartv+AvCgVKgzL1qQGgoocwKHQCQ
         mBfdxQ23pu0IJnCAA54+GIcmDHm+BX1lHNoDFR8yUwAor5No5UBw5oJPS90iEq6/AERi
         Cmr3It4xPcPK2t9SFOMaxwdsyUfmJqYbW8p44nMyKshEQr1PZvrAC1a5u9ta1DgiklUe
         P9mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699354574; x=1699959374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K+noeIiO0ZzRdCBLgjz9J+sy56GBx1867ixAgWMD4Wc=;
        b=klGi7iKPnhMk/g55HAIPWTh9iIyEOGfOd5fc6MkOR8YzjqSiv8R2xSqUjuvf3zyjoT
         gvmnWUiRIB0cStoGUU//eXMwzeFGQwx4W1i6pwVEX+orX0c975bSjYy8jQNILyP7TslZ
         b3OHZXm3OIDklRFFcF+aASVLFG8eona8BJsloHQVBG6Vw+Z7wB9e9f3GNcufF8qawKRx
         HJTaazUwLF9tuSluF8CJiVMcJLQ+s1KGQ5Ihn9m+bhy2WB2WF7LGxDnzuO8OzaxuXlq1
         3wcPYvg+nOXz2h2bOnob5uj7e07UP3SBmJaDIAZCaB3ZzeKJujtlBDOibbXQPFw9i0fl
         RORw==
X-Gm-Message-State: AOJu0YyICaS4Z9f5g0cAjKmZTK+nyitzBTsJ0sbQq8UnM0yvwXw2Ik5x
	H3xDK8iMrlYLWK53K5HZMdJrUQzjhiUXaa67SKMSpg==
X-Google-Smtp-Source: AGHT+IGQ52RAx3C3PSFQKflfCCfN+v4u5QXrEdDEyMd6Gzx8ZtOWMB3t8ixpUgsMGHhCAPNhRGbMJA==
X-Received: by 2002:a17:907:6d02:b0:9c9:603c:407e with SMTP id sa2-20020a1709076d0200b009c9603c407emr28520448ejc.0.1699354573974;
        Tue, 07 Nov 2023 02:56:13 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:7db3:bdd9:4cab:2ee3])
        by smtp.gmail.com with ESMTPSA id n30-20020a05600c501e00b00405442edc69sm15396853wmr.14.2023.11.07.02.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 02:56:12 -0800 (PST)
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
Subject: [PATCH v3 11/20] dt-bindings: riscv: add Zfh[min] ISA extensions description
Date: Tue,  7 Nov 2023 11:55:47 +0100
Message-ID: <20231107105556.517187-12-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107105556.517187-1-cleger@rivosinc.com>
References: <20231107105556.517187-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_025617_048473_27D896D6 
X-CRM114-Status: UNSURE (   9.30  )
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

QWRkIGRlc2NyaXB0aW9uIG9mIFpmaFttaW5dIElTQSBleHRlbnNpb25zWzFdIHdoaWNoIGNhbiBu
b3cgYmUgcmVwb3J0ZWQKdGhyb3VnaCBod3Byb2JlIGZvciB1c2Vyc3BhY2UgdXNhZ2UuCgpMaW5r
OiBodHRwczovL2RyaXZlLmdvb2dsZS5jb20vZmlsZS9kLzF6M3RRUUxtNUFMc0FENzdQTTBsMENI
bmFweFdDZVZ6UC92aWV3IFsxXQpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdl
ckByaXZvc2luYy5jb20+CkFja2VkLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNy
b2NoaXAuY29tPgotLS0KIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMu
eWFtbCAgICAgICB8IDEzICsrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jp
c2N2L2V4dGVuc2lvbnMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9y
aXNjdi9leHRlbnNpb25zLnlhbWwKaW5kZXggYjY4ZWRmZDFmYjQzLi42MmI1ZmU0MGI0YTMgMTAw
NjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNp
b25zLnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4
dGVuc2lvbnMueWFtbApAQCAtMjE0LDYgKzIxNCwxOSBAQCBwcm9wZXJ0aWVzOgogICAgICAgICAg
ICAgaW5zdHJ1Y3Rpb25zIGFzIHJhdGlmaWVkIGF0IGNvbW1pdCA2ZDMzOTE5ICgiTWVyZ2UgcHVs
bCByZXF1ZXN0ICMxNTgKICAgICAgICAgICAgIGZyb20gaGlyb29paC9jbG11bC1maXgtbG9vcC1l
bmQtY29uZGl0aW9uIikgb2YgcmlzY3YtYml0bWFuaXAuCiAKKyAgICAgICAgLSBjb25zdDogemZo
CisgICAgICAgICAgZGVzY3JpcHRpb246CisgICAgICAgICAgICBUaGUgc3RhbmRhcmQgWmZoIGV4
dGVuc2lvbiBmb3IgMTYtYml0IGhhbGYtcHJlY2lzaW9uIGJpbmFyeQorICAgICAgICAgICAgZmxv
YXRpbmctcG9pbnQgaW5zdHJ1Y3Rpb25zLCBhcyByYXRpZmllZCBpbiBjb21taXQgNjQwNzRiYyAo
IlVwZGF0ZQorICAgICAgICAgICAgdmVyc2lvbiBudW1iZXJzIGZvciBaZmgvWmZpbngiKSBvZiBy
aXNjdi1pc2EtbWFudWFsLgorCisgICAgICAgIC0gY29uc3Q6IHpmaG1pbgorICAgICAgICAgIGRl
c2NyaXB0aW9uOgorICAgICAgICAgICAgVGhlIHN0YW5kYXJkIFpmaG1pbiBleHRlbnNpb24gd2hp
Y2ggcHJvdmlkZXMgbWluaW1hbCBzdXBwb3J0IGZvcgorICAgICAgICAgICAgMTYtYml0IGhhbGYt
cHJlY2lzaW9uIGJpbmFyeSBmbG9hdGluZy1wb2ludCBpbnN0cnVjdGlvbnMsIGFzIHJhdGlmaWVk
CisgICAgICAgICAgICBpbiBjb21taXQgNjQwNzRiYyAoIlVwZGF0ZSB2ZXJzaW9uIG51bWJlcnMg
Zm9yIFpmaC9aZmlueCIpIG9mCisgICAgICAgICAgICByaXNjdi1pc2EtbWFudWFsLgorCiAgICAg
ICAgIC0gY29uc3Q6IHprCiAgICAgICAgICAgZGVzY3JpcHRpb246CiAgICAgICAgICAgICBUaGUg
c3RhbmRhcmQgWmsgU3RhbmRhcmQgU2NhbGFyIGNyeXB0b2dyYXBoeSBleHRlbnNpb24gYXMgcmF0
aWZpZWQKLS0gCjIuNDIuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
