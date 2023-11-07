Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BA73C4167B
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 10:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=99tcZfHq8b/F4yaGKZRYsZzZrAtc2MBVq0vlIxGAknI=; b=YWqA5hvNsouQr9
	nmbWLxt45atoo4gwdeVi4OOTmpD+wk5sn5ooQkbuMuAsEYzPlF+C5esICyfQpzzxngRa8Re+mbWxt
	g5YudP5VAUnostJtAU8fwMFCpE6NE1czvx6u5auhSOaG+e32sCJOiZq+oT2BzliUisIhBV+4J21Ej
	pgP2/K791STyVt3kMSqLS+ojrhn1yDi2MX0KmoX/mfApPWKW0Hp1BtLmalDIMnAlMO6nj8KMR1Hbe
	4B7+6LAykHvFhybktQ8SWEwqOxi93UNdKL1+cLv9W8XpMnxiONdItKpzqtiy04ddR4wOd+mZufkVK
	0Pcv1/BKEx0M0iZXGLaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Jkj-0019Ac-05;
	Tue, 07 Nov 2023 10:56:13 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Jke-00197m-22
	for linux-riscv@lists.infradead.org;
	Tue, 07 Nov 2023 10:56:10 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-32fa4183535so811424f8f.1
        for <linux-riscv@lists.infradead.org>; Tue, 07 Nov 2023 02:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699354566; x=1699959366; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sMnpi79X7SvPehiPmk4gRm0VBHL4POtxgFx0CajIeKI=;
        b=YRbQqnQB+/o9r35Y2Q+etkEKWG5B19rvDwXwJO3Vl4AycRl4RkV7v36xJCl4NL9G+N
         SbCWZ8luDX7zmoHCmhWmga4H1ZgROQi4wlv29HWJV0WzMyYPxr3KYO1xV2CNXU1IB6qE
         RvjVvfUZ8FWz347pa61GW68JO4pvcLHJOLyjXPfU4rlzL5WYrZ64PVhB1lFqXjs7tcVC
         6ZFiAOxhJ6zIwFgINi3Y6d1ygTqJzznGnq1VvUpzR1zG2uMdOWRtZZV6Fs5h0IG7NXdo
         CfpBlZxWnEYzaOnz0tXCDVHiG6TfsG6PQoI05KOg+N143AcF8cRArGgW0Yu2Gox9KnMe
         GTXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699354566; x=1699959366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sMnpi79X7SvPehiPmk4gRm0VBHL4POtxgFx0CajIeKI=;
        b=PsJvFYjdlZxPoSeR2gGo61oEsMiua6q+krg9A0iWMt+s+TmgI+gXturfDgWozXLDMH
         DSS62H2gS0x5TbkXsIfA0p6tJFM9l9AENiJ4o7ZVrf0m4Y6iwMgCF6nRBe0xGmsVFDB1
         v0xM07+p9LnV/eCxfLT7dV6yGPcC84tv6ciDABzaY0KqShLTO1fICUtGXWLFvi7bFj8s
         DuECm0Txut1KIj/L3DYMU7Tm0g0wjX7/Nginu8jazxjiqlAZGnIjmwHX4D8Z20j1b08e
         zPP5vuOMgw77odi9LPe4RwzB/eEuWDvlYBcv3n16KpeUSa22ZlEm8NNDbheGxNjfaCBh
         k/lA==
X-Gm-Message-State: AOJu0Yz3YUnUQZYoolgwOee/B1OSAltQ05hhDe28HaRsTOBn3vEuYy30
	cdmMifNetg6vwzXx8PX5cNYZ3PG3K/eNh3AfQMPidQ==
X-Google-Smtp-Source: AGHT+IFTaUb/5dQv+OZXaV1szaLrFMm+/+NNM4GP2T1RF5zEOMF3p1Mp4sxm0kbHOX9zra49UOac4w==
X-Received: by 2002:a05:600c:3b91:b0:407:52f0:b01a with SMTP id n17-20020a05600c3b9100b0040752f0b01amr26054397wms.2.1699354566602;
        Tue, 07 Nov 2023 02:56:06 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:7db3:bdd9:4cab:2ee3])
        by smtp.gmail.com with ESMTPSA id n30-20020a05600c501e00b00405442edc69sm15396853wmr.14.2023.11.07.02.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 02:56:05 -0800 (PST)
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
Subject: [PATCH v3 05/20] dt-bindings: riscv: add scalar crypto ISA extensions description
Date: Tue,  7 Nov 2023 11:55:41 +0100
Message-ID: <20231107105556.517187-6-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107105556.517187-1-cleger@rivosinc.com>
References: <20231107105556.517187-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_025608_677034_78819D45 
X-CRM114-Status: UNSURE (   9.95  )
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

QWRkIGRlc2NyaXB0aW9uIGZvciBzY2FsYXIgY3J5cHRvIElTQSBleHRlbnNpb25zIHdoaWNoIGNh
biBub3cgYmUKcmVwb3J0ZWQgdGhyb3VnaCBod3Byb2JlIGZvciB1c2Vyc3BhY2UgdXNhZ2UuIFRo
ZXNlIGV4dGVuc2lvbnMgYXJlIHRoZQpmb2xsb3dpbmc6CgotIFpia2IKLSBaYmtjCi0gWmJreAot
IFprbmQKLSBaa25lCi0gWmtuaAotIFprcgotIFprc2VkCi0gWmtzaAotIFprdAoKU2lnbmVkLW9m
Zi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgotLS0KIC4uLi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbCB8IDc3ICsrKysrKysrKysrKysr
KysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3NyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbCBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwKaW5k
ZXggYzkxYWIwZTQ2NjQ4Li5hODkzNjNhZDY1M2EgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwKKysrIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbApAQCAtMTkwLDEy
ICsxOTAsODkgQEAgcHJvcGVydGllczoKICAgICAgICAgICAgIG11bHRpcGxpY2F0aW9uIGFzIHJh
dGlmaWVkIGF0IGNvbW1pdCA2ZDMzOTE5ICgiTWVyZ2UgcHVsbCByZXF1ZXN0CiAgICAgICAgICAg
ICAjMTU4IGZyb20gaGlyb29paC9jbG11bC1maXgtbG9vcC1lbmQtY29uZGl0aW9uIikgb2Ygcmlz
Y3YtYml0bWFuaXAuCiAKKyAgICAgICAgLSBjb25zdDogemJrYgorICAgICAgICAgIGRlc2NyaXB0
aW9uOgorICAgICAgICAgICAgVGhlIHN0YW5kYXJkIFpia2IgYml0bWFuaXAgaW5zdHJ1Y3Rpb25z
IGZvciBjcnlwdG9ncmFwaHkgYXMgcmF0aWZpZWQKKyAgICAgICAgICAgIGluIHZlcnNpb24gMS4w
IG9mIFJJU0MtViBDcnlwdG9ncmFwaHkgRXh0ZW5zaW9ucyBWb2x1bWUgSQorICAgICAgICAgICAg
c3BlY2lmaWNhdGlvbi4KKworICAgICAgICAtIGNvbnN0OiB6YmtjCisgICAgICAgICAgZGVzY3Jp
cHRpb246CisgICAgICAgICAgICBUaGUgc3RhbmRhcmQgWmJrYyBjYXJyeS1sZXNzIG11bHRpcGx5
IGluc3RydWN0aW9ucyBhcyByYXRpZmllZAorICAgICAgICAgICAgaW4gdmVyc2lvbiAxLjAgb2Yg
UklTQy1WIENyeXB0b2dyYXBoeSBFeHRlbnNpb25zIFZvbHVtZSBJCisgICAgICAgICAgICBzcGVj
aWZpY2F0aW9uLgorCisgICAgICAgIC0gY29uc3Q6IHpia3gKKyAgICAgICAgICBkZXNjcmlwdGlv
bjoKKyAgICAgICAgICAgIFRoZSBzdGFuZGFyZCBaYmt4IGNyb3NzYmFyIHBlcm11dGF0aW9uIGlu
c3RydWN0aW9ucyBhcyByYXRpZmllZAorICAgICAgICAgICAgaW4gdmVyc2lvbiAxLjAgb2YgUklT
Qy1WIENyeXB0b2dyYXBoeSBFeHRlbnNpb25zIFZvbHVtZSBJCisgICAgICAgICAgICBzcGVjaWZp
Y2F0aW9uLgorCiAgICAgICAgIC0gY29uc3Q6IHpicwogICAgICAgICAgIGRlc2NyaXB0aW9uOiB8
CiAgICAgICAgICAgICBUaGUgc3RhbmRhcmQgWmJzIGJpdC1tYW5pcHVsYXRpb24gZXh0ZW5zaW9u
IGZvciBzaW5nbGUtYml0CiAgICAgICAgICAgICBpbnN0cnVjdGlvbnMgYXMgcmF0aWZpZWQgYXQg
Y29tbWl0IDZkMzM5MTkgKCJNZXJnZSBwdWxsIHJlcXVlc3QgIzE1OAogICAgICAgICAgICAgZnJv
bSBoaXJvb2loL2NsbXVsLWZpeC1sb29wLWVuZC1jb25kaXRpb24iKSBvZiByaXNjdi1iaXRtYW5p
cC4KIAorICAgICAgICAtIGNvbnN0OiB6aworICAgICAgICAgIGRlc2NyaXB0aW9uOgorICAgICAg
ICAgICAgVGhlIHN0YW5kYXJkIFprIFN0YW5kYXJkIFNjYWxhciBjcnlwdG9ncmFwaHkgZXh0ZW5z
aW9uIGFzIHJhdGlmaWVkCisgICAgICAgICAgICBpbiB2ZXJzaW9uIDEuMCBvZiBSSVNDLVYgQ3J5
cHRvZ3JhcGh5IEV4dGVuc2lvbnMgVm9sdW1lIEkKKyAgICAgICAgICAgIHNwZWNpZmljYXRpb24u
CisKKyAgICAgICAgLSBjb25zdDogemtuCisgICAgICAgICAgZGVzY3JpcHRpb246CisgICAgICAg
ICAgICBUaGUgc3RhbmRhcmQgWmtuIE5JU1QgYWxnb3JpdGhtIHN1aXRlIGV4dGVuc2lvbnMgYXMg
cmF0aWZpZWQgaW4KKyAgICAgICAgICAgIHZlcnNpb24gMS4wIG9mIFJJU0MtViBDcnlwdG9ncmFw
aHkgRXh0ZW5zaW9ucyBWb2x1bWUgSQorICAgICAgICAgICAgc3BlY2lmaWNhdGlvbi4KKworICAg
ICAgICAtIGNvbnN0OiB6a25kCisgICAgICAgICAgZGVzY3JpcHRpb246IHwKKyAgICAgICAgICAg
IFRoZSBzdGFuZGFyZCBaa25kIGZvciBOSVNUIHN1aXRlOiBBRVMgZGVjcnlwdGlvbiBpbnN0cnVj
dGlvbnMgYXMKKyAgICAgICAgICAgIHJhdGlmaWVkIGluIHZlcnNpb24gMS4wIG9mIFJJU0MtViBD
cnlwdG9ncmFwaHkgRXh0ZW5zaW9ucyBWb2x1bWUgSQorICAgICAgICAgICAgc3BlY2lmaWNhdGlv
bi4KKworICAgICAgICAtIGNvbnN0OiB6a25lCisgICAgICAgICAgZGVzY3JpcHRpb246IHwKKyAg
ICAgICAgICAgIFRoZSBzdGFuZGFyZCBaa25lIGZvciBOSVNUIHN1aXRlOiBBRVMgZW5jcnlwdGlv
biBpbnN0cnVjdGlvbnMgYXMKKyAgICAgICAgICAgIHJhdGlmaWVkIGluIHZlcnNpb24gMS4wIG9m
IFJJU0MtViBDcnlwdG9ncmFwaHkgRXh0ZW5zaW9ucyBWb2x1bWUgSQorICAgICAgICAgICAgc3Bl
Y2lmaWNhdGlvbi4KKworICAgICAgICAtIGNvbnN0OiB6a25oCisgICAgICAgICAgZGVzY3JpcHRp
b246IHwKKyAgICAgICAgICAgIFRoZSBzdGFuZGFyZCBaa25oIGZvciBOSVNUIHN1aXRlOiBoYXNo
IGZ1bmN0aW9uIGluc3RydWN0aW9ucyBhcworICAgICAgICAgICAgcmF0aWZpZWQgaW4gdmVyc2lv
biAxLjAgb2YgUklTQy1WIENyeXB0b2dyYXBoeSBFeHRlbnNpb25zIFZvbHVtZSBJCisgICAgICAg
ICAgICBzcGVjaWZpY2F0aW9uLgorCisgICAgICAgIC0gY29uc3Q6IHprcgorICAgICAgICAgIGRl
c2NyaXB0aW9uOgorICAgICAgICAgICAgVGhlIHN0YW5kYXJkIFprciBlbnRyb3B5IHNvdXJjZSBl
eHRlbnNpb24gYXMgcmF0aWZpZWQgaW4gdmVyc2lvbgorICAgICAgICAgICAgMS4wIG9mIFJJU0Mt
ViBDcnlwdG9ncmFwaHkgRXh0ZW5zaW9ucyBWb2x1bWUgSSBzcGVjaWZpY2F0aW9uLgorCisgICAg
ICAgIC0gY29uc3Q6IHprcworICAgICAgICAgIGRlc2NyaXB0aW9uOgorICAgICAgICAgICAgVGhl
IHN0YW5kYXJkIFprcyBTaGFuZ01pIGFsZ29yaXRobSBzdWl0ZSBleHRlbnNpb25zIGFzIHJhdGlm
aWVkIGluCisgICAgICAgICAgICB2ZXJzaW9uIDEuMCBvZiBSSVNDLVYgQ3J5cHRvZ3JhcGh5IEV4
dGVuc2lvbnMgVm9sdW1lIEkKKyAgICAgICAgICAgIHNwZWNpZmljYXRpb24uCisKKyAgICAgICAg
LSBjb25zdDogemtzZWQKKyAgICAgICAgICBkZXNjcmlwdGlvbjogfAorICAgICAgICAgICAgVGhl
IHN0YW5kYXJkIFprc2VkIGZvciBTaGFuZ01pIHN1aXRlOiBTTTQgYmxvY2sgY2lwaGVyIGluc3Ry
dWN0aW9ucworICAgICAgICAgICAgYXMgcmF0aWZpZWQgaW4gdmVyc2lvbiAxLjAgb2YgUklTQy1W
IENyeXB0b2dyYXBoeSBFeHRlbnNpb25zCisgICAgICAgICAgICBWb2x1bWUgSSBzcGVjaWZpY2F0
aW9uLgorCisgICAgICAgIC0gY29uc3Q6IHprc2gKKyAgICAgICAgICBkZXNjcmlwdGlvbjogfAor
ICAgICAgICAgICAgVGhlIHN0YW5kYXJkIFprc2ggZm9yIFNoYW5nTWkgc3VpdGU6IFNNMyBoYXNo
IGZ1bmN0aW9uIGluc3RydWN0aW9ucworICAgICAgICAgICAgYXMgcmF0aWZpZWQgaW4gdmVyc2lv
biAxLjAgb2YgUklTQy1WIENyeXB0b2dyYXBoeSBFeHRlbnNpb25zCisgICAgICAgICAgICBWb2x1
bWUgSSBzcGVjaWZpY2F0aW9uLgorCisgICAgICAgIC0gY29uc3Q6IHprdAorICAgICAgICAgIGRl
c2NyaXB0aW9uOgorICAgICAgICAgICAgVGhlIHN0YW5kYXJkIFprdCBmb3IgZGF0YSBpbmRlcGVu
ZGVudCBleGVjdXRpb24gbGF0ZW5jeSBhcyByYXRpZmllZAorICAgICAgICAgICAgaW4gdmVyc2lv
biAxLjAgb2YgUklTQy1WIENyeXB0b2dyYXBoeSBFeHRlbnNpb25zIFZvbHVtZSBJCisgICAgICAg
ICAgICBzcGVjaWZpY2F0aW9uLgorCiAgICAgICAgIC0gY29uc3Q6IHppY2JvbQogICAgICAgICAg
IGRlc2NyaXB0aW9uOgogICAgICAgICAgICAgVGhlIHN0YW5kYXJkIFppY2JvbSBleHRlbnNpb24g
Zm9yIGJhc2UgY2FjaGUgbWFuYWdlbWVudCBvcGVyYXRpb25zIGFzCi0tIAoyLjQyLjAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
