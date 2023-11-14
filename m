Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D23DC4167D
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Nov 2023 14:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qvmAZ48kTJQJNQ+5FJH3DC7LK0c0VuXcKGqpo/Cbvio=; b=vlqlzpljuUTIWI
	RPlTb5t3Qqkg3fKkxnnp4b7OZchX1bj1CBsYLHDBg0jYLaOAL9IN3tUHL2s07vQtO0N5xttHIFA9N
	savde3svEWhxguNnMTWKRgCx/RTUk0SNlTsQbUSy4yOp1iYKZ5KvpPqUdorq/9MocVwzul0Y2JLLa
	2QoGNc2xoCKLMJUDfmrgTM0D9luFGZZ8jJPQqEx7fRphBCvu3+JBDY9X2z/LMUA7497izAIYxqx1u
	sw2F0ChRLWhHEeTD8r+0gXqEndiHWJ48m8bF/mFnYVujv3leO7rRYZYbmPNmM0lBDQ7+YkdHYXk8x
	6N4OqDfFT2nTlwBfeVjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2uB6-00G9NV-0c;
	Tue, 14 Nov 2023 14:14:08 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2uAu-00G96k-0X
	for linux-riscv@lists.infradead.org;
	Tue, 14 Nov 2023 14:13:58 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-77bccdea0ffso8947985a.0
        for <linux-riscv@lists.infradead.org>; Tue, 14 Nov 2023 06:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699971234; x=1700576034; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XoTFo90940vK77kTlCvHvrvp3qqCfWhzk2ZkyIVF9ns=;
        b=uBFjEnAqgNvn1/S3ZSGm8mdh0dn/U/9byGjOqdY+3quc4tpH3msI5QO8N1prjkUyZ6
         jk0TfuKANb+ZlvNZXIdJQls3Ilv4vpj38B/0FQprxk24eecjvfrTVRzR1pbG+bZnDDTQ
         QtOHnpeKcJ3z8c5nwdeyhY6vmL0/oWgxEFHtf9RWn12izVpkEoT3cJH/1rFQXP1bzE73
         TB39KxXvnv3wU2ieB/J0NVmWkkoEjktiiny+sBmFDTVsI4lxaxJ2NY9QkbCMV79Euezm
         F7j+1VZhsc6G9FigSCgzsola2vMnOxMp+zPLO5OVjHLrQhbuXwGL4fQKU6t/ELZoB+ku
         IFbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699971234; x=1700576034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XoTFo90940vK77kTlCvHvrvp3qqCfWhzk2ZkyIVF9ns=;
        b=VXiu9TZXHBj8fJqNiHwaqSJ7X83rNXXs/oI2rbyEz5GixMgKztPuZlFY+hWW4Yfxvu
         iwObOVVGVNLGs6a1U3/C5AHApwKSJ8gtECw7088HxXZH3XHWXuVEBSzL39SEqFzd0A3x
         L7JPNh1SC/EQAXyZd4hvQnSXfLE1RGiQUarYDydBPiSjf3K/MzFKDQ+gNB1d2MMVNwYy
         8PINb36OTku6epFaWbz4rBzWZFacXtZuGOcwUMH/7wg8if4ab0yvQC4Tvocwm0UaqLUL
         5UiKG3c9Dr5e4wz1BnZ1YBC4GMxc/gDNQHJk04LDHjmvLQinp/512Ui6e99TbPRdMim/
         7ufw==
X-Gm-Message-State: AOJu0YxKPuVwuzvluRiLhVSE8HowDh1emyLa8DGp6IyFkYAQ+L/DFmWZ
	kO67mp7KPYSV5HOldMwnpdDKsUhD0CqqLirUeQP9HA==
X-Google-Smtp-Source: AGHT+IFNCPX21/Ri63YAzgADy+EVaz2PJ/ebWolRkZq99YoI+InQVMnXeGM6ah9IB3zm0CykKOxaXw==
X-Received: by 2002:a05:620a:bd3:b0:772:5300:1c3d with SMTP id s19-20020a05620a0bd300b0077253001c3dmr2154010qki.0.1699971234326;
        Tue, 14 Nov 2023 06:13:54 -0800 (PST)
Received: from carbon-x1.. ([12.186.190.2])
        by smtp.gmail.com with ESMTPSA id m2-20020a05620a220200b00777611164c5sm2701263qkh.106.2023.11.14.06.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 06:13:53 -0800 (PST)
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
Subject: [PATCH v4 17/20] dt-bindings: riscv: add Zvfh[min] ISA extension description
Date: Tue, 14 Nov 2023 09:12:53 -0500
Message-ID: <20231114141256.126749-18-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231114141256.126749-1-cleger@rivosinc.com>
References: <20231114141256.126749-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_061356_301522_6AEDA455 
X-CRM114-Status: UNSURE (   8.04  )
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

QWRkIGRlc2NyaXB0aW9uIGZvciBadmZoW21pbl0gSVNBIGV4dGVuc2lvblsxXS4KCkxpbms6IGh0
dHBzOi8vZHJpdmUuZ29vZ2xlLmNvbS9maWxlL2QvMV9ZdDYwSEdBZjFyMWh4N0puc0lwdHcwc3Fr
QmQ5QlE4L3ZpZXcgWzFdClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJp
dm9zaW5jLmNvbT4KQWNrZWQtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hp
cC5jb20+Ci0tLQogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1s
ICAgICAgICB8IDEyICsrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3Yv
ZXh0ZW5zaW9ucy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2
L2V4dGVuc2lvbnMueWFtbAppbmRleCBmOTUzYzQ5YmU5MGQuLmI5MWQ0OWI3YzNhMCAxMDA2NDQK
LS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMu
eWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5z
aW9ucy55YW1sCkBAIC0zNjksNiArMzY5LDE4IEBAIHByb3BlcnRpZXM6CiAgICAgICAgICAgICBp
bnN0cnVjdGlvbnMsIGFzIHJhdGlmaWVkIGluIGNvbW1pdCA1NmVkNzk1ICgiVXBkYXRlCiAgICAg
ICAgICAgICByaXNjdi1jcnlwdG8tc3BlYy12ZWN0b3IuYWRvYyIpIG9mIHJpc2N2LWNyeXB0by4K
IAorICAgICAgICAtIGNvbnN0OiB6dmZoCisgICAgICAgICAgZGVzY3JpcHRpb246CisgICAgICAg
ICAgICBUaGUgc3RhbmRhcmQgWnZmaCBleHRlbnNpb24gZm9yIHZlY3RvcmVkIGhhbGYtcHJlY2lz
aW9uCisgICAgICAgICAgICBmbG9hdGluZy1wb2ludCBpbnN0cnVjdGlvbnMsIGFzIHJhdGlmaWVk
IGluIGNvbW1pdCBlMmNjZDA1CisgICAgICAgICAgICAoIlJlbW92ZSBkcmFmdCB3YXJuaW5ncyBm
cm9tIFp2ZmhbbWluXSIpIG9mIHJpc2N2LXYtc3BlYy4KKworICAgICAgICAtIGNvbnN0OiB6dmZo
bWluCisgICAgICAgICAgZGVzY3JpcHRpb246CisgICAgICAgICAgICBUaGUgc3RhbmRhcmQgWnZm
aG1pbiBleHRlbnNpb24gZm9yIHZlY3RvcmVkIG1pbmltYWwgaGFsZi1wcmVjaXNpb24KKyAgICAg
ICAgICAgIGZsb2F0aW5nLXBvaW50IGluc3RydWN0aW9ucywgYXMgcmF0aWZpZWQgaW4gY29tbWl0
IGUyY2NkMDUKKyAgICAgICAgICAgICgiUmVtb3ZlIGRyYWZ0IHdhcm5pbmdzIGZyb20gWnZmaFtt
aW5dIikgb2YgcmlzY3Ytdi1zcGVjLgorCiAgICAgICAgIC0gY29uc3Q6IHp2a2IKICAgICAgICAg
ICBkZXNjcmlwdGlvbjoKICAgICAgICAgICAgIFRoZSBzdGFuZGFyZCBadmtiIGV4dGVuc2lvbiBm
b3IgdmVjdG9yIGNyeXB0b2dyYXBoeSBiaXQtbWFuaXB1bGF0aW9uCi0tIAoyLjQyLjAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
