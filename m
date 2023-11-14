Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 834F0C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Nov 2023 14:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=attXhYSplwUbP3eupRi9aoY9YcZ8WK34zCgAoOvNMIA=; b=yeGvn6UnjpkFJq
	hdjHNijBny+ZAJzW8LBoZZHIkBG32QHrQS9cxEatY6f3ouHAE3V8gbsMEcBcDieigH7Kg+5O6cwxI
	Qy0wGN5b+mvdsv8CbBBW6c1bdwM7CSSlkS5Jtc4onYPUG6yvRC3mXAcT9zp37pYs2M4ljZJB3bCsZ
	uH92zok7gZmd3QVNA3eS7GMJWcWaNEXLC7ej7UkSsYE+0vKT5lSKEIlKojJv5VNP47b3QLrXQ7rWQ
	4Ux4wKcwXG8fE5uEhT0Nh9Pk7PCEomfiXCfxmRfdsyzgu696ikBFmQsO81n+n12nig/EgWZCuYOcY
	oyYWVpZW+6dSzmuTt8VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2uAr-00G94Y-1Y;
	Tue, 14 Nov 2023 14:13:53 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2uAk-00G8u1-0U
	for linux-riscv@lists.infradead.org;
	Tue, 14 Nov 2023 14:13:50 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-6d32ce135c4so575929a34.0
        for <linux-riscv@lists.infradead.org>; Tue, 14 Nov 2023 06:13:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699971222; x=1700576022; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LJxzqFw+iRCRAp409dtPRDTd4Cqq/JWi5Ol6ihv9w4s=;
        b=OtacOpc1i4tlvMgH9gB8EyG6wRBa8aAdo9Xqqxn5CP5tInIyR4dsxatw4ottKEs+3A
         AWr6UbRkIi36zQMfwzYCwcdXrPL65C1OaF2eUKLRPS3FJKiQ9SosLTRO9U3Y0KpbP5DC
         0HI/22fElVCzcwN9NHBp6vRYnu9txt8PBdgKOl0jcABy9wYoBAbCSyzNvFknlSa6Owat
         UlRQFEaBKynFlElUCkFEx384W1zPGQ2c8OVS7OrGCsPFbN9QWhrMHA6VaxyshIiaOxpt
         YyTzlYgOd+H+aoffg8f/S3a0oFQ44Gv/UUPbs8dipFZoKTLE2Ke9z1ug0YIC5hFIsupx
         AWPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699971222; x=1700576022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LJxzqFw+iRCRAp409dtPRDTd4Cqq/JWi5Ol6ihv9w4s=;
        b=fEtgGWkRIcftMb+PXf2suHG0/H/jjiy5TAa46hhosPl/LYMQ9j0VEUCaInDenC8LBF
         nB1gM2L10B9XglnWTAxi0ekYack1YxZBF75zsiZMTnOiZwL3MbKQDi0V3Rn8G6LbXmg5
         mwFpCgPK3QQlYwxzR2+aTFT2xegOXP93cJQa1ZVJT3IkWBKYFv2vG1F1AVjCxrnYezAc
         L5WtkFVN4uQlap26aXZJxQ9WrQu6VvxNPS5OdbFTpASuw0k3dp+V7eagrQqFletW6I9w
         /GFJ20JRrCTo0TxHmd4pd3qpZXSJd1y1OT8XznVi07CcOmWB/2Ql75UID2so76EU4dkr
         UvQQ==
X-Gm-Message-State: AOJu0YxP+hHtBPBa+xZD0rIK5OoQavR35YBVkmmvIb/RAU5H9EDtuX0L
	eDh2Zwaxp1S1g4R6DQXLR701kroH79tvE8pZMxDuvQ==
X-Google-Smtp-Source: AGHT+IFgajfszQOvIS9zHpqlXWy/Ja3Phv8JGz7/cMe3MoO7xsUg3ckGQ7HGu11jTeRueJ8PltXSWA==
X-Received: by 2002:a05:6830:7102:b0:6b1:9646:2ea0 with SMTP id ek2-20020a056830710200b006b196462ea0mr2803747otb.1.1699971222044;
        Tue, 14 Nov 2023 06:13:42 -0800 (PST)
Received: from carbon-x1.. ([12.186.190.2])
        by smtp.gmail.com with ESMTPSA id m2-20020a05620a220200b00777611164c5sm2701263qkh.106.2023.11.14.06.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 06:13:41 -0800 (PST)
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
Subject: [PATCH v4 08/20] dt-bindings: riscv: add vector crypto ISA extensions description
Date: Tue, 14 Nov 2023 09:12:44 -0500
Message-ID: <20231114141256.126749-9-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231114141256.126749-1-cleger@rivosinc.com>
References: <20231114141256.126749-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_061346_193322_53D6B2C6 
X-CRM114-Status: UNSURE (   9.10  )
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
Y2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbAppbmRleCBhMzgwM2IyMmNmNGYu
LmU4NDVlNDYxYjZlMSAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sCkBAIC0zMzgsNSArMzM4LDEwMSBAQCBwcm9w
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
