Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E93C46CA1
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Oct 2023 13:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OitekEWe+gHB7yYiqpKx0byJXtnOEIAJIvQb9fIBI6I=; b=qchxkIWalTeJ1L
	bPilktBL0PCfomT094WjE+tyivlyOhsE412TlSnUBkgBEWIscoMLPF1xDVfToXoJ1s29oW5cSVoxC
	1sD1VTErEv4+ap06Re32hM/2+ftCVOAF8hzSMEVYAMXKUj+qFWicVHemZgp0D+do8eUn6lni1iRBF
	iFKb3Lb49pxl3vFniI06whbfVZkNt813FR155NYBV+OYDx3aJtB++7oyPO3Sfir65stalzylyY8X/
	tZFdxezImhYP8858lQFXrbVHlSm2D96WbulArXl+8NR7TR3SgQe7yScVORb2S7CWTG5Vn+kEL6coh
	IRkV1DtnG0d3xWspA4Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsjvC-00CN9L-0N;
	Tue, 17 Oct 2023 13:15:42 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsjv6-00CN2u-1w
	for linux-riscv@lists.infradead.org;
	Tue, 17 Oct 2023 13:15:38 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2c52289e900so3531671fa.0
        for <linux-riscv@lists.infradead.org>; Tue, 17 Oct 2023 06:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697548534; x=1698153334; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gPGVtTxEoI+EJFM/rO8bytg8A5BuyDNrPQqlXh09110=;
        b=nLTD04g4cghn5+k9cFvsGi7EIXlZDgBhIxELpk6dUAnfC5QtcqttsuR9ZfKstiJg3z
         vSy8eGNtsU7370UhzwFLgCTa9SElWoqaK5IeVlSUqqAxaA4j1eYJ3IE8ps4VeejHmkgj
         QJqFvWEwzQ1DpOkdtRm27kxRhP15fS68KaYGgK+NxR6pPpJ65wUlTE1/sjEJX3E9SRwZ
         0KV5aLmpPb+Ll85PEkoVkfiRVuFdI+p+dZZ3+qI/SPsbnymoEaR1+dPsNK8tdP+Slgs4
         hgZNhk2Lx/v+AU+4MvfezT3EUdqoJGhFN1u/+i6Us347UsawJdWbuUsCfxxgz3xH4LI7
         dztw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697548534; x=1698153334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gPGVtTxEoI+EJFM/rO8bytg8A5BuyDNrPQqlXh09110=;
        b=XLjrQ5f3takscmTNqXs9k9mxC+KcsnfmqHSTD+ORNXH53orO8kMH7aZ4z267GmSihB
         a2XU+j54UBkog+hxEhedVU0kR/ygExsaVGg8dTx/s1/bMnQP30y/7UXhhvJfc1v8VSUY
         22in7uMU9yXbGH7watMqVgovXC0qyD0H+Oi1Ix7gTMX7x3nxbIW5ChfEloWiRrAXLVdd
         jrGTdPeQl6WpfElJOjPCce6f0nsC4ilYlnPhtT0gVfoxrk1P9V+uXrS4LRAgrav9jM3u
         1EFLB1ZV8NngEucgXWtn2qqMxtiqMTKBMg7g6iL6YqKmd3ld+d/f9X5Uj9DdOn19L198
         mmbQ==
X-Gm-Message-State: AOJu0Yw4RvVVi2G2z6noa9LOZpVFMTe/13FlVeYCFCM9JW6uouULQt1l
	qA7EffaNS7Npxy6f8GHusM+nPeB8AGgkf2xkCvqcWA==
X-Google-Smtp-Source: AGHT+IG89Ezhs/hr39tiGoIN9T+MSH1jYS4TrNXC4XsGbKsSNFsBrnTzxaL5mt1ZXNIpzObkb7JElA==
X-Received: by 2002:a2e:b553:0:b0:2c5:2407:4d0c with SMTP id a19-20020a2eb553000000b002c524074d0cmr1474854ljn.2.1697548533314;
        Tue, 17 Oct 2023 06:15:33 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:96:820c:ecf7:a817])
        by smtp.gmail.com with ESMTPSA id fj7-20020a05600c0c8700b0040772138bb7sm9873393wmb.2.2023.10.17.06.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 06:15:32 -0700 (PDT)
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
Subject: [PATCH v2 07/19] dt-bindings: riscv: add vector crypto ISA extensions description
Date: Tue, 17 Oct 2023 15:14:44 +0200
Message-ID: <20231017131456.2053396-8-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231017131456.2053396-1-cleger@rivosinc.com>
References: <20231017131456.2053396-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_061536_647699_6D45CF9E 
X-CRM114-Status: UNSURE (   9.46  )
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

QWRkIFp2KiB2ZWN0b3IgY3J5cHRvIGV4dGVuc2lvbnMgdGhhdCB3ZXJlIGFkZGVkIGluICJSSVND
LVYgQ3J5cHRvZ3JhcGh5CkV4dGVuc2lvbnMgVm9sdW1lIElJIiBzcGVjaWZpY2F0aW9uaVsxXToK
Ci0gWnZiYjogVmVjdG9yIEJhc2ljIEJpdC1tYW5pcHVsYXRpb24KLSBadmJjOiBWZWN0b3IgQ2Fy
cnlsZXNzIE11bHRpcGxpY2F0aW9uCi0gWnZrYjogVmVjdG9yIENyeXB0b2dyYXBoeSBCaXQtbWFu
aXB1bGF0aW9uCi0gWnZrZzogVmVjdG9yIEdDTS9HTUFDLgotIFp2a25lZDogTklTVCBTdWl0ZTog
VmVjdG9yIEFFUyBCbG9jayBDaXBoZXIKLSBadmtuaFthYl06IE5JU1QgU3VpdGU6IFZlY3RvciBT
SEEtMiBTZWN1cmUgSGFzaAotIFp2a3NlZDogU2hhbmdNaSBTdWl0ZTogU000IEJsb2NrIENpcGhl
cgotIFp2a3NoOiBTaGFuZ01pIFN1aXRlOiBTTTMgU2VjdXJlIEhhc2gKLSBadmtuOiBOSVNUIEFs
Z29yaXRobSBTdWl0ZQotIFp2a25jOiBOSVNUIEFsZ29yaXRobSBTdWl0ZSB3aXRoIGNhcnJ5bGVz
cyBtdWx0aXBseQotIFp2a25nOiBOSVNUIEFsZ29yaXRobSBTdWl0ZSB3aXRoIEdDTS4KLSBadmtz
OiBTaGFuZ01pIEFsZ29yaXRobSBTdWl0ZQotIFp2a3NjOiBTaGFuZ01pIEFsZ29yaXRobSBTdWl0
ZSB3aXRoIGNhcnJ5bGVzcyBtdWx0aXBsaWNhdGlvbgotIFp2a3NnOiBTaGFuZ01pIEFsZ29yaXRo
bSBTdWl0ZSB3aXRoIEdDTS4KLSBadmt0OiBWZWN0b3IgRGF0YS1JbmRlcGVuZGVudCBFeGVjdXRp
b24gTGF0ZW5jeS4KCkxpbms6IGh0dHBzOi8vZHJpdmUuZ29vZ2xlLmNvbS9maWxlL2QvMWdiOU9M
SC1EaGJDZ1dwN1Z3cFBPVnJyWTZmM29TSkxML3ZpZXcgWzFdClNpZ25lZC1vZmYtYnk6IENsw6lt
ZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KQWNrZWQtYnk6IENvbm9yIERvb2xleSA8
Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Ci0tLQogLi4uL2RldmljZXRyZWUvYmluZGluZ3Mv
cmlzY3YvZXh0ZW5zaW9ucy55YW1sIHwgOTYgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNo
YW5nZWQsIDk2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbAppbmRleCA5NmVkM2QyMmQzYzQu
LjkzYmViOTg3MjkwMCAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sCkBAIC0zMjMsNSArMzIzLDEwMSBAQCBwcm9w
ZXJ0aWVzOgogICAgICAgICAgICAgaW4gY29tbWl0IDJlNTIzNiAoIlp0c28gaXMgbm93IHJhdGlm
aWVkLiIpIG9mIHRoZQogICAgICAgICAgICAgcmlzY3YtaXNhLW1hbnVhbC4KIAorICAgICAgICAt
IGNvbnN0OiB6dmJiCisgICAgICAgICAgZGVzY3JpcHRpb246CisgICAgICAgICAgICBUaGUgc3Rh
bmRhcmQgWnZiYiBleHRlbnNpb24gZm9yIHZlY3RvcmVkIGJhc2ljIGJpdC1tYW5pcHVsYXRpb24K
KyAgICAgICAgICAgIGluc3RydWN0aW9ucywgYXMgcmF0aWZpZWQgaW4gY29tbWl0IDU2ZWQ3OTUg
KCJVcGRhdGUKKyAgICAgICAgICAgIHJpc2N2LWNyeXB0by1zcGVjLXZlY3Rvci5hZG9jIikgb2Yg
cmlzY3YtY3J5cHRvLgorCisgICAgICAgIC0gY29uc3Q6IHp2YmMKKyAgICAgICAgICBkZXNjcmlw
dGlvbjoKKyAgICAgICAgICAgIFRoZSBzdGFuZGFyZCBadmJjIGV4dGVuc2lvbiBmb3IgdmVjdG9y
ZWQgY2FycnlsZXNzIG11bHRpcGxpY2F0aW9uCisgICAgICAgICAgICBpbnN0cnVjdGlvbnMsIGFz
IHJhdGlmaWVkIGluIGNvbW1pdCA1NmVkNzk1ICgiVXBkYXRlCisgICAgICAgICAgICByaXNjdi1j
cnlwdG8tc3BlYy12ZWN0b3IuYWRvYyIpIG9mIHJpc2N2LWNyeXB0by4KKworICAgICAgICAtIGNv
bnN0OiB6dmtiCisgICAgICAgICAgZGVzY3JpcHRpb246CisgICAgICAgICAgICBUaGUgc3RhbmRh
cmQgWnZrYiBleHRlbnNpb24gZm9yIHZlY3RvciBjcnlwdG9ncmFwaHkgYml0LW1hbmlwdWxhdGlv
bgorICAgICAgICAgICAgaW5zdHJ1Y3Rpb25zLCBhcyByYXRpZmllZCBpbiBjb21taXQgNTZlZDc5
NSAoIlVwZGF0ZQorICAgICAgICAgICAgcmlzY3YtY3J5cHRvLXNwZWMtdmVjdG9yLmFkb2MiKSBv
ZiByaXNjdi1jcnlwdG8uCisKKyAgICAgICAgLSBjb25zdDogenZrZworICAgICAgICAgIGRlc2Ny
aXB0aW9uOgorICAgICAgICAgICAgVGhlIHN0YW5kYXJkIFp2a2cgZXh0ZW5zaW9uIGZvciB2ZWN0
b3IgR0NNL0dNQUMgaW5zdHJ1Y3Rpb25zLCBhcworICAgICAgICAgICAgcmF0aWZpZWQgaW4gY29t
bWl0IDU2ZWQ3OTUgKCJVcGRhdGUgcmlzY3YtY3J5cHRvLXNwZWMtdmVjdG9yLmFkb2MiKQorICAg
ICAgICAgICAgb2YgcmlzY3YtY3J5cHRvLgorCisgICAgICAgIC0gY29uc3Q6IHp2a24KKyAgICAg
ICAgICBkZXNjcmlwdGlvbjoKKyAgICAgICAgICAgIFRoZSBzdGFuZGFyZCBadmtuIGV4dGVuc2lv
biBmb3IgTklTVCBhbGdvcml0aG0gc3VpdGUgaW5zdHJ1Y3Rpb25zLCBhcworICAgICAgICAgICAg
cmF0aWZpZWQgaW4gY29tbWl0IDU2ZWQ3OTUgKCJVcGRhdGUgcmlzY3YtY3J5cHRvLXNwZWMtdmVj
dG9yLmFkb2MiKQorICAgICAgICAgICAgb2YgcmlzY3YtY3J5cHRvLgorCisgICAgICAgIC0gY29u
c3Q6IHp2a25jCisgICAgICAgICAgZGVzY3JpcHRpb246CisgICAgICAgICAgICBUaGUgc3RhbmRh
cmQgWnZrbmMgZXh0ZW5zaW9uIGZvciBOSVNUIGFsZ29yaXRobSBzdWl0ZSB3aXRoIGNhcnJ5bGVz
cworICAgICAgICAgICAgbXVsdGlwbHkgaW5zdHJ1Y3Rpb25zLCBhcyByYXRpZmllZCBpbiBjb21t
aXQgNTZlZDc5NSAoIlVwZGF0ZQorICAgICAgICAgICAgcmlzY3YtY3J5cHRvLXNwZWMtdmVjdG9y
LmFkb2MiKSBvZiByaXNjdi1jcnlwdG8uCisKKyAgICAgICAgLSBjb25zdDogenZrbmVkCisgICAg
ICAgICAgZGVzY3JpcHRpb246CisgICAgICAgICAgICBUaGUgc3RhbmRhcmQgWnZrbmVkIGV4dGVu
c2lvbiBmb3IgVmVjdG9yIEFFUyBibG9jayBjaXBoZXIKKyAgICAgICAgICAgIGluc3RydWN0aW9u
cywgYXMgcmF0aWZpZWQgaW4gY29tbWl0IDU2ZWQ3OTUgKCJVcGRhdGUKKyAgICAgICAgICAgIHJp
c2N2LWNyeXB0by1zcGVjLXZlY3Rvci5hZG9jIikgb2YgcmlzY3YtY3J5cHRvLgorCisgICAgICAg
IC0gY29uc3Q6IHp2a25nCisgICAgICAgICAgZGVzY3JpcHRpb246CisgICAgICAgICAgICBUaGUg
c3RhbmRhcmQgWnZrbmcgZXh0ZW5zaW9uIGZvciBOSVNUIGFsZ29yaXRobSBzdWl0ZSB3aXRoIEdD
TQorICAgICAgICAgICAgaW5zdHJ1Y3Rpb25zLCBhcyByYXRpZmllZCBpbiBjb21taXQgNTZlZDc5
NSAoIlVwZGF0ZQorICAgICAgICAgICAgcmlzY3YtY3J5cHRvLXNwZWMtdmVjdG9yLmFkb2MiKSBv
ZiByaXNjdi1jcnlwdG8uCisKKyAgICAgICAgLSBjb25zdDogenZrbmhhCisgICAgICAgICAgZGVz
Y3JpcHRpb246IHwKKyAgICAgICAgICAgIFRoZSBzdGFuZGFyZCBadmtuaGEgZXh0ZW5zaW9uIGZv
ciBOSVNUIHN1aXRlOiB2ZWN0b3IgU0hBLTIgc2VjdXJlLAorICAgICAgICAgICAgaGFzaCAoU0hB
LTI1NiBvbmx5KSBpbnN0cnVjdGlvbnMsIGFzIHJhdGlmaWVkIGluIGNvbW1pdAorICAgICAgICAg
ICAgNTZlZDc5NSAoIlVwZGF0ZSByaXNjdi1jcnlwdG8tc3BlYy12ZWN0b3IuYWRvYyIpIG9mIHJp
c2N2LWNyeXB0by4KKworICAgICAgICAtIGNvbnN0OiB6dmtuaGIKKyAgICAgICAgICBkZXNjcmlw
dGlvbjogfAorICAgICAgICAgICAgVGhlIHN0YW5kYXJkIFp2a25oYiBleHRlbnNpb24gZm9yIE5J
U1Qgc3VpdGU6IHZlY3RvciBTSEEtMiBzZWN1cmUsCisgICAgICAgICAgICBoYXNoIChTSEEtMjU2
IGFuZCBTSEEtNTEyKSBpbnN0cnVjdGlvbnMsIGFzIHJhdGlmaWVkIGluIGNvbW1pdAorICAgICAg
ICAgICAgNTZlZDc5NSAoIlVwZGF0ZSByaXNjdi1jcnlwdG8tc3BlYy12ZWN0b3IuYWRvYyIpIG9m
IHJpc2N2LWNyeXB0by4KKworICAgICAgICAtIGNvbnN0OiB6dmtzCisgICAgICAgICAgZGVzY3Jp
cHRpb246CisgICAgICAgICAgICBUaGUgc3RhbmRhcmQgWnZrcyBleHRlbnNpb24gZm9yIFNoYW5n
TWkgYWxnb3JpdGhtIHN1aXRlCisgICAgICAgICAgICBpbnN0cnVjdGlvbnMsIGFzIHJhdGlmaWVk
IGluIGNvbW1pdCA1NmVkNzk1ICgiVXBkYXRlCisgICAgICAgICAgICByaXNjdi1jcnlwdG8tc3Bl
Yy12ZWN0b3IuYWRvYyIpIG9mIHJpc2N2LWNyeXB0by4KKworICAgICAgICAtIGNvbnN0OiB6dmtz
YworICAgICAgICAgIGRlc2NyaXB0aW9uOgorICAgICAgICAgICAgVGhlIHN0YW5kYXJkIFp2a3Nj
IGV4dGVuc2lvbiBmb3IgU2hhbmdNaSBhbGdvcml0aG0gc3VpdGUgd2l0aAorICAgICAgICAgICAg
Y2FycnlsZXNzIG11bHRpcGxpY2F0aW9uIGluc3RydWN0aW9ucywgYXMgcmF0aWZpZWQgaW4gY29t
bWl0IDU2ZWQ3OTUKKyAgICAgICAgICAgICgiVXBkYXRlIHJpc2N2LWNyeXB0by1zcGVjLXZlY3Rv
ci5hZG9jIikgb2YgcmlzY3YtY3J5cHRvLgorCisgICAgICAgIC0gY29uc3Q6IHp2a3NlZAorICAg
ICAgICAgIGRlc2NyaXB0aW9uOiB8CisgICAgICAgICAgICBUaGUgc3RhbmRhcmQgWnZrc2VkIGV4
dGVuc2lvbiBmb3IgU2hhbmdNaSBzdWl0ZTogU000IGJsb2NrIGNpcGhlcgorICAgICAgICAgICAg
aW5zdHJ1Y3Rpb25zLCBhcyByYXRpZmllZCBpbiBjb21taXQgNTZlZDc5NSAoIlVwZGF0ZQorICAg
ICAgICAgICAgcmlzY3YtY3J5cHRvLXNwZWMtdmVjdG9yLmFkb2MiKSBvZiByaXNjdi1jcnlwdG8u
CisKKyAgICAgICAgLSBjb25zdDogenZrc2gKKyAgICAgICAgICBkZXNjcmlwdGlvbjogfAorICAg
ICAgICAgICAgVGhlIHN0YW5kYXJkIFp2a3NoIGV4dGVuc2lvbiBmb3IgU2hhbmdNaSBzdWl0ZTog
U00zIHNlY3VyZSBoYXNoCisgICAgICAgICAgICBpbnN0cnVjdGlvbnMsIGFzIHJhdGlmaWVkIGlu
IGNvbW1pdCA1NmVkNzk1ICgiVXBkYXRlCisgICAgICAgICAgICByaXNjdi1jcnlwdG8tc3BlYy12
ZWN0b3IuYWRvYyIpIG9mIHJpc2N2LWNyeXB0by4KKworICAgICAgICAtIGNvbnN0OiB6dmtzZwor
ICAgICAgICAgIGRlc2NyaXB0aW9uOgorICAgICAgICAgICAgVGhlIHN0YW5kYXJkIFp2a3NnIGV4
dGVuc2lvbiBmb3IgU2hhbmdNaSBhbGdvcml0aG0gc3VpdGUgd2l0aCBHQ00KKyAgICAgICAgICAg
IGluc3RydWN0aW9ucywgYXMgcmF0aWZpZWQgaW4gY29tbWl0IDU2ZWQ3OTUgKCJVcGRhdGUKKyAg
ICAgICAgICAgIHJpc2N2LWNyeXB0by1zcGVjLXZlY3Rvci5hZG9jIikgb2YgcmlzY3YtY3J5cHRv
LgorCisgICAgICAgIC0gY29uc3Q6IHp2a3QKKyAgICAgICAgICBkZXNjcmlwdGlvbjoKKyAgICAg
ICAgICAgIFRoZSBzdGFuZGFyZCBadmt0IGV4dGVuc2lvbiBmb3IgdmVjdG9yIGRhdGEtaW5kZXBl
bmRlbnQgZXhlY3V0aW9uCisgICAgICAgICAgICBsYXRlbmN5LCBhcyByYXRpZmllZCBpbiBjb21t
aXQgNTZlZDc5NSAoIlVwZGF0ZQorICAgICAgICAgICAgcmlzY3YtY3J5cHRvLXNwZWMtdmVjdG9y
LmFkb2MiKSBvZiByaXNjdi1jcnlwdG8uCisKIGFkZGl0aW9uYWxQcm9wZXJ0aWVzOiB0cnVlCiAu
Li4KLS0gCjIuNDIuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
