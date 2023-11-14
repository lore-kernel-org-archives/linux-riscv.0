Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D65CEC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Nov 2023 14:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d9TMjh+vVGIQu2qx5sSA68CQOdtSUlSG8CqOX9+ycRo=; b=1XFmIbx7GkQbTU
	SoTHP4ytBbMPqbYKP7doNA9bus/2m7OQIdFWHtcYltAnjW116klwtKm+Im/z+C5S5Yo64d/NFlD9l
	8iphpf0FV1/xK0Ua570Qx4WHx9MH1yG9bj2cIOPt6y3GWOdGxngD3cydqqUqw3jpNZz1Mz1O3ZCCH
	u4XU1drUfogf5IO/YYCVcs/+jhViB49O1DbS02JPRww7jvCnK0odldzjHllEPiH5O0piVqLxrDtES
	Os0RYGVVKR5EMKXLFdBggP/rcjBuIWrYm6Voocji+yGqXn94s2UdR1N8mb0b65rUiaq/kOsT9FJEa
	OXjE40yUl475Y67G7V9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2uAj-00G8vT-0p;
	Tue, 14 Nov 2023 14:13:45 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2uAd-00G8op-1o
	for linux-riscv@lists.infradead.org;
	Tue, 14 Nov 2023 14:13:41 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-77bccdea0ffso8944285a.0
        for <linux-riscv@lists.infradead.org>; Tue, 14 Nov 2023 06:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699971216; x=1700576016; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tj3F7r4bXKdKcLl3zXhsKyMtAAaQ3OyO+btxNZcVTGo=;
        b=LmiR+Le7nHH8j7m/UFSyhf9aLAF0wQng+OlaHKaNdMtXgZI4NVMoU5OsNXbdc8hTCR
         muxtiF2astgoPk1cZPyj3WF+dU8ouTer4wyB4WcBE06yl+szfj2pGTxU2OYvvpCrz7DP
         yOxF6+h4yyKG80/GQLOuuJJFcLBOeZV6r266URZOk2fsx/9OSetZIXfuXSWgw3W6BeX0
         8PrB3vTcBeSfp2gfePPBhCa5x05Rx9kakP9GzFB4GI4Y35Oh9JMe/P3FltB/AYC5AHse
         BiseXuk82AnwU3+MAl70aXPztMuB8LSBKkg0NvFcbyGHfccDI7arGaQ+x1eq7CVqk47/
         TyJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699971216; x=1700576016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tj3F7r4bXKdKcLl3zXhsKyMtAAaQ3OyO+btxNZcVTGo=;
        b=iBfSgxJv6ouSfs9YQDoW1s//mW0Jr3pwdMYsOVBjykm+JDVcrW9GaQiMAntDLBJCLR
         ZZSGlU5php6L01G1+IT2gXTUT0bZq16wdKFOG5AqK2aLmP9xOiqXTWMPRcm2ehmm72xO
         7nnrTJ2yvnX+7tNcYxgzt+h8KcMATENfmsv0eKLUDc2FFDnKPXJpDzVPkwPXvozn8uNG
         FpJXc/IlLWWSeVs6H+L+BpxUJ/nmVukhWYzV0gtMxBu/gIk8/5mclZiOtAxYtvZ8skjo
         ejJl/2tIxonoCRUEI7BTkEWNyzofSHDQChY/h4/RrrW/AUH2lq6q8qq9RyYkK8IX1bpH
         2WLw==
X-Gm-Message-State: AOJu0Yw4QOd3ZKw6LYcS4l5idjLivTChUxrIkOJXa8lJCEj7d+STG5U9
	BHPwnqvPQVdtGhdkIsdbFd2sn2qZoD6AwRVeTSR76g==
X-Google-Smtp-Source: AGHT+IFh0Kg7TsQGIegnmes1+Kqf8PJcacK9no05PQKvW4IVexEI0Bnw1hLpRCsL4VG1Y2MfFWnXFQ==
X-Received: by 2002:a05:620a:460f:b0:777:7178:ebf0 with SMTP id br15-20020a05620a460f00b007777178ebf0mr2719131qkb.5.1699971216721;
        Tue, 14 Nov 2023 06:13:36 -0800 (PST)
Received: from carbon-x1.. ([12.186.190.2])
        by smtp.gmail.com with ESMTPSA id m2-20020a05620a220200b00777611164c5sm2701263qkh.106.2023.11.14.06.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 06:13:36 -0800 (PST)
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
	Jerry Shih <jerry.shih@sifive.com>
Subject: [PATCH v4 05/20] dt-bindings: riscv: add scalar crypto ISA extensions description
Date: Tue, 14 Nov 2023 09:12:41 -0500
Message-ID: <20231114141256.126749-6-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231114141256.126749-1-cleger@rivosinc.com>
References: <20231114141256.126749-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_061339_610065_AD60C36E 
X-CRM114-Status: UNSURE (   9.34  )
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

QWRkIGRlc2NyaXB0aW9uIGZvciBzY2FsYXIgY3J5cHRvIElTQSBleHRlbnNpb25zOgoKLSBaYmti
Ci0gWmJrYwotIFpia3gKLSBaa25kCi0gWmtuZQotIFprbmgKLSBaa3IKLSBaa3NlZAotIFprc2gK
LSBaa3QKClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNv
bT4KLS0tCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwgfCA4
MCArKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgODAgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRl
bnNpb25zLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0
ZW5zaW9ucy55YW1sCmluZGV4IGM5MWFiMGU0NjY0OC4uYTM4MDNiMjJjZjRmIDEwMDY0NAotLS0g
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1s
CisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25z
LnlhbWwKQEAgLTE5MCwxMiArMTkwLDkyIEBAIHByb3BlcnRpZXM6CiAgICAgICAgICAgICBtdWx0
aXBsaWNhdGlvbiBhcyByYXRpZmllZCBhdCBjb21taXQgNmQzMzkxOSAoIk1lcmdlIHB1bGwgcmVx
dWVzdAogICAgICAgICAgICAgIzE1OCBmcm9tIGhpcm9vaWgvY2xtdWwtZml4LWxvb3AtZW5kLWNv
bmRpdGlvbiIpIG9mIHJpc2N2LWJpdG1hbmlwLgogCisgICAgICAgIC0gY29uc3Q6IHpia2IKKyAg
ICAgICAgICBkZXNjcmlwdGlvbjoKKyAgICAgICAgICAgIFRoZSBzdGFuZGFyZCBaYmtiIGJpdG1h
bmlwIGluc3RydWN0aW9ucyBmb3IgY3J5cHRvZ3JhcGh5IGFzIHJhdGlmaWVkCisgICAgICAgICAg
ICBpbiB2ZXJzaW9uIDEuMCBvZiBSSVNDLVYgQ3J5cHRvZ3JhcGh5IEV4dGVuc2lvbnMgVm9sdW1l
IEkKKyAgICAgICAgICAgIHNwZWNpZmljYXRpb24uCisKKyAgICAgICAgLSBjb25zdDogemJrYwor
ICAgICAgICAgIGRlc2NyaXB0aW9uOgorICAgICAgICAgICAgVGhlIHN0YW5kYXJkIFpia2MgY2Fy
cnktbGVzcyBtdWx0aXBseSBpbnN0cnVjdGlvbnMgYXMgcmF0aWZpZWQKKyAgICAgICAgICAgIGlu
IHZlcnNpb24gMS4wIG9mIFJJU0MtViBDcnlwdG9ncmFwaHkgRXh0ZW5zaW9ucyBWb2x1bWUgSQor
ICAgICAgICAgICAgc3BlY2lmaWNhdGlvbi4KKworICAgICAgICAtIGNvbnN0OiB6Ymt4CisgICAg
ICAgICAgZGVzY3JpcHRpb246CisgICAgICAgICAgICBUaGUgc3RhbmRhcmQgWmJreCBjcm9zc2Jh
ciBwZXJtdXRhdGlvbiBpbnN0cnVjdGlvbnMgYXMgcmF0aWZpZWQKKyAgICAgICAgICAgIGluIHZl
cnNpb24gMS4wIG9mIFJJU0MtViBDcnlwdG9ncmFwaHkgRXh0ZW5zaW9ucyBWb2x1bWUgSQorICAg
ICAgICAgICAgc3BlY2lmaWNhdGlvbi4KKwogICAgICAgICAtIGNvbnN0OiB6YnMKICAgICAgICAg
ICBkZXNjcmlwdGlvbjogfAogICAgICAgICAgICAgVGhlIHN0YW5kYXJkIFpicyBiaXQtbWFuaXB1
bGF0aW9uIGV4dGVuc2lvbiBmb3Igc2luZ2xlLWJpdAogICAgICAgICAgICAgaW5zdHJ1Y3Rpb25z
IGFzIHJhdGlmaWVkIGF0IGNvbW1pdCA2ZDMzOTE5ICgiTWVyZ2UgcHVsbCByZXF1ZXN0ICMxNTgK
ICAgICAgICAgICAgIGZyb20gaGlyb29paC9jbG11bC1maXgtbG9vcC1lbmQtY29uZGl0aW9uIikg
b2YgcmlzY3YtYml0bWFuaXAuCiAKKyAgICAgICAgLSBjb25zdDogemsKKyAgICAgICAgICBkZXNj
cmlwdGlvbjoKKyAgICAgICAgICAgIFRoZSBzdGFuZGFyZCBaayBTdGFuZGFyZCBTY2FsYXIgY3J5
cHRvZ3JhcGh5IGV4dGVuc2lvbiBhcyByYXRpZmllZAorICAgICAgICAgICAgaW4gdmVyc2lvbiAx
LjAgb2YgUklTQy1WIENyeXB0b2dyYXBoeSBFeHRlbnNpb25zIFZvbHVtZSBJCisgICAgICAgICAg
ICBzcGVjaWZpY2F0aW9uLgorCisgICAgICAgIC0gY29uc3Q6IHprbgorICAgICAgICAgIGRlc2Ny
aXB0aW9uOgorICAgICAgICAgICAgVGhlIHN0YW5kYXJkIFprbiBOSVNUIGFsZ29yaXRobSBzdWl0
ZSBleHRlbnNpb25zIGFzIHJhdGlmaWVkIGluCisgICAgICAgICAgICB2ZXJzaW9uIDEuMCBvZiBS
SVNDLVYgQ3J5cHRvZ3JhcGh5IEV4dGVuc2lvbnMgVm9sdW1lIEkKKyAgICAgICAgICAgIHNwZWNp
ZmljYXRpb24uCisKKyAgICAgICAgLSBjb25zdDogemtuZAorICAgICAgICAgIGRlc2NyaXB0aW9u
OiB8CisgICAgICAgICAgICBUaGUgc3RhbmRhcmQgWmtuZCBmb3IgTklTVCBzdWl0ZTogQUVTIGRl
Y3J5cHRpb24gaW5zdHJ1Y3Rpb25zIGFzCisgICAgICAgICAgICByYXRpZmllZCBpbiB2ZXJzaW9u
IDEuMCBvZiBSSVNDLVYgQ3J5cHRvZ3JhcGh5IEV4dGVuc2lvbnMgVm9sdW1lIEkKKyAgICAgICAg
ICAgIHNwZWNpZmljYXRpb24uCisKKyAgICAgICAgLSBjb25zdDogemtuZQorICAgICAgICAgIGRl
c2NyaXB0aW9uOiB8CisgICAgICAgICAgICBUaGUgc3RhbmRhcmQgWmtuZSBmb3IgTklTVCBzdWl0
ZTogQUVTIGVuY3J5cHRpb24gaW5zdHJ1Y3Rpb25zIGFzCisgICAgICAgICAgICByYXRpZmllZCBp
biB2ZXJzaW9uIDEuMCBvZiBSSVNDLVYgQ3J5cHRvZ3JhcGh5IEV4dGVuc2lvbnMgVm9sdW1lIEkK
KyAgICAgICAgICAgIHNwZWNpZmljYXRpb24uCisKKyAgICAgICAgLSBjb25zdDogemtuaAorICAg
ICAgICAgIGRlc2NyaXB0aW9uOiB8CisgICAgICAgICAgICBUaGUgc3RhbmRhcmQgWmtuaCBmb3Ig
TklTVCBzdWl0ZTogaGFzaCBmdW5jdGlvbiBpbnN0cnVjdGlvbnMgYXMKKyAgICAgICAgICAgIHJh
dGlmaWVkIGluIHZlcnNpb24gMS4wIG9mIFJJU0MtViBDcnlwdG9ncmFwaHkgRXh0ZW5zaW9ucyBW
b2x1bWUgSQorICAgICAgICAgICAgc3BlY2lmaWNhdGlvbi4KKworICAgICAgICAtIGNvbnN0OiB6
a3IKKyAgICAgICAgICBkZXNjcmlwdGlvbjoKKyAgICAgICAgICAgIFRoZSBzdGFuZGFyZCBaa3Ig
ZW50cm9weSBzb3VyY2UgZXh0ZW5zaW9uIGFzIHJhdGlmaWVkIGluIHZlcnNpb24KKyAgICAgICAg
ICAgIDEuMCBvZiBSSVNDLVYgQ3J5cHRvZ3JhcGh5IEV4dGVuc2lvbnMgVm9sdW1lIEkgc3BlY2lm
aWNhdGlvbi4KKyAgICAgICAgICAgIFRoaXMgc3RyaW5nIGJlaW5nIHByZXNlbnQgbWVhbnMgdGhh
dCB0aGUgQ1NSIGFzc29jaWF0ZWQgdG8gdGhpcworICAgICAgICAgICAgZXh0ZW5zaW9uIGlzIGFj
Y2Vzc2libGUgYXQgdGhlIHByaXZpbGVnZSBsZXZlbCB0byB3aGljaCB0aGF0CisgICAgICAgICAg
ICBkZXZpY2UtdHJlZSBoYXMgYmVlbiBwcm92aWRlZC4KKworICAgICAgICAtIGNvbnN0OiB6a3MK
KyAgICAgICAgICBkZXNjcmlwdGlvbjoKKyAgICAgICAgICAgIFRoZSBzdGFuZGFyZCBaa3MgU2hh
bmdNaSBhbGdvcml0aG0gc3VpdGUgZXh0ZW5zaW9ucyBhcyByYXRpZmllZCBpbgorICAgICAgICAg
ICAgdmVyc2lvbiAxLjAgb2YgUklTQy1WIENyeXB0b2dyYXBoeSBFeHRlbnNpb25zIFZvbHVtZSBJ
CisgICAgICAgICAgICBzcGVjaWZpY2F0aW9uLgorCisgICAgICAgIC0gY29uc3Q6IHprc2VkCisg
ICAgICAgICAgZGVzY3JpcHRpb246IHwKKyAgICAgICAgICAgIFRoZSBzdGFuZGFyZCBaa3NlZCBm
b3IgU2hhbmdNaSBzdWl0ZTogU000IGJsb2NrIGNpcGhlciBpbnN0cnVjdGlvbnMKKyAgICAgICAg
ICAgIGFzIHJhdGlmaWVkIGluIHZlcnNpb24gMS4wIG9mIFJJU0MtViBDcnlwdG9ncmFwaHkgRXh0
ZW5zaW9ucworICAgICAgICAgICAgVm9sdW1lIEkgc3BlY2lmaWNhdGlvbi4KKworICAgICAgICAt
IGNvbnN0OiB6a3NoCisgICAgICAgICAgZGVzY3JpcHRpb246IHwKKyAgICAgICAgICAgIFRoZSBz
dGFuZGFyZCBaa3NoIGZvciBTaGFuZ01pIHN1aXRlOiBTTTMgaGFzaCBmdW5jdGlvbiBpbnN0cnVj
dGlvbnMKKyAgICAgICAgICAgIGFzIHJhdGlmaWVkIGluIHZlcnNpb24gMS4wIG9mIFJJU0MtViBD
cnlwdG9ncmFwaHkgRXh0ZW5zaW9ucworICAgICAgICAgICAgVm9sdW1lIEkgc3BlY2lmaWNhdGlv
bi4KKworICAgICAgICAtIGNvbnN0OiB6a3QKKyAgICAgICAgICBkZXNjcmlwdGlvbjoKKyAgICAg
ICAgICAgIFRoZSBzdGFuZGFyZCBaa3QgZm9yIGRhdGEgaW5kZXBlbmRlbnQgZXhlY3V0aW9uIGxh
dGVuY3kgYXMgcmF0aWZpZWQKKyAgICAgICAgICAgIGluIHZlcnNpb24gMS4wIG9mIFJJU0MtViBD
cnlwdG9ncmFwaHkgRXh0ZW5zaW9ucyBWb2x1bWUgSQorICAgICAgICAgICAgc3BlY2lmaWNhdGlv
bi4KKwogICAgICAgICAtIGNvbnN0OiB6aWNib20KICAgICAgICAgICBkZXNjcmlwdGlvbjoKICAg
ICAgICAgICAgIFRoZSBzdGFuZGFyZCBaaWNib20gZXh0ZW5zaW9uIGZvciBiYXNlIGNhY2hlIG1h
bmFnZW1lbnQgb3BlcmF0aW9ucyBhcwotLSAKMi40Mi4wCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
