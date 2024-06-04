Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B65EC25B78
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jun 2024 12:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vxwIa5J8VNZRTjMarZerMYVxWtOg5TyhO6GSlBERKSM=; b=BoqlyawaQDacLh
	5uc6hbB5p8yb2RwGh9/48Ir/rc28hemT9WjoGZK7+o0XkWFlIEMq2C2HYro4r/SmJiVgzf4HzEhIO
	jcO34Jt+6+Kq3EAvK5Fc70o0tFQoq248ET4U7zFTrDLbtD2TOiJ9ViXPTpMZUkIDQ+J7jtKWysF8I
	62IuC/l+p4teGN6LmZlg8YB8Ct3dewk1gFYknjMW8XBRBKM3CsT413oUGE4hQWaE9hAhKFAnHI8XZ
	Z7lFZsQGyx8EcdCUJAzHnH+sLy5FND2O1e6lx1PTgeOB39OznFpp1fvj+jTeJtBj2YQovspU91OL0
	u5fDWjLRvPYCSqH0TsDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sETac-00000002MlK-0a2G;
	Tue, 04 Jun 2024 12:48:34 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sETaY-00000002MiM-07Tk
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jun 2024 12:48:32 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-64ecc2f111dso648828a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 04 Jun 2024 05:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717505309; x=1718110109; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9khxHJjeUp7ScoJAIwKVgLlPlLRtKzhDoxFrt0oOXSQ=;
        b=GfIp+up18tcumCijF0mZHrpneWzCPl8HOiHtVqwI0K188dLRpIa2ttCzE9jAbM4TYc
         ahXbIph9QnG2noiNpPop0MsdIm1OFqmYsGa+hFlKqpYYsilqSvN6KWgnxHsEzkDA/a3Q
         sK6eKJ0+pKECIa/uTkF4qWpODXdcFlBXpYacmaciwqjU2Pyuj7owz6rHIEG4rK4Y3qTg
         KNQIrA6oSxrXdj/K1b7w12wXHE8Yy/BLm5GLSnIxUXm2HqYm3rpYQ7M6UFVtZD0e6EE5
         pXv6ZUrQD0WL/hGqPlKB9lz1ZAxiZZEFLmtyPo+5D+odoTAeMKVVQBZk0uOBaCAl1jG2
         dj1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717505309; x=1718110109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9khxHJjeUp7ScoJAIwKVgLlPlLRtKzhDoxFrt0oOXSQ=;
        b=kOM6cOIY696gbSvELGAsQHr+LIL6W5tT40Zzb5xBPNbJn+9Rd44y/BRPntvKQTF3i2
         iHjan592pZAaT5cWuzFY3T97qe0vjJZ8nut8l67L7RyBKJMK57irCau1KOihF21YJtA+
         LHHQTd1T1+IMgNTNNEtKeHXkC2b/EDgjU11LHbmpN87UhfY3ylHVgJfbWIzfbJiMbsLf
         38nmaUvN/yTb7TZSNF/GLoS+edWrSxoiqrRxe9sdkyomiPW/3VXj9vHcltnW9FLWZGxN
         K0JxBMa3PKcY8qVLvczPb/ngHusfRsHPn/s1XRl2EWrQpfJi7iiiltZewAdgYhdWMfFG
         Mrag==
X-Forwarded-Encrypted: i=1; AJvYcCUthCogC1yYKos9ylqVi+FxNjHWv62QDsb7FDH58h3WTKZfNj0CYsN2S9ykg2jBuB9rlPsCr8BQM1jtQ3/ATBn9yAzpwkoN0ibhhg2zbgJz
X-Gm-Message-State: AOJu0YzeSdumBeGJ3HL4i3UZ8z0SVKRXBiEkgbBW9AcpdoviDR0gMX4a
	8wdoWl8lqjzRxp7GA9VVi/zHDgIFM/5zfO6oM3W+Cyx140YUEyJEiNa/WL7F9FE=
X-Google-Smtp-Source: AGHT+IF51TDxFJuuXTneP6toFhIUeHG25cd2Wj/tvfzjNoZSiWv7LIVIBSZsIbu/lBStuW2IKttk4w==
X-Received: by 2002:a17:902:ea0e:b0:1f2:fbc8:643c with SMTP id d9443c01a7336-1f6370f2847mr137386785ad.3.1717505309207;
        Tue, 04 Jun 2024 05:48:29 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:327b:5ba3:8154:37ed])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6323ebc69sm83042885ad.211.2024.06.04.05.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 05:48:28 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Shuah Khan <shuah@kernel.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Atish Patra <atishp@atishpatra.org>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 12/16] dt-bindings: riscv: add Zcmop ISA extension description
Date: Tue,  4 Jun 2024 14:45:44 +0200
Message-ID: <20240604124550.3214710-13-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240604124550.3214710-1-cleger@rivosinc.com>
References: <20240604124550.3214710-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_054830_147426_44899154 
X-CRM114-Status: UNSURE (   9.42  )
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

QWRkIGRlc2NyaXB0aW9uIGZvciB0aGUgWmNtb3AgKENvbXByZXNzZWQgTWF5LUJlLU9wZXJhdGlv
bnMpIElTQQpleHRlbnNpb24gd2hpY2ggd2FzIHJhdGlmaWVkIGluIGNvbW1pdCBjNzMyYTRmMzlh
NGMgKCJaY21vcCBpcwpyYXRpZmllZC8xLjAiKSBvZiB0aGUgcmlzY3YtaXNhLW1hbnVhbC4KClNp
Z25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KQWNrZWQt
Ynk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Ci0tLQogLi4uL2Rl
dmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sICAgICAgICB8IDEyICsrKysr
KysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbApp
bmRleCA4MWJjZTRmYTI0MjQuLjE5NTJkMjBiODk5NiAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbAorKysgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sCkBAIC0yNTIs
NiArMjUyLDExIEBAIHByb3BlcnRpZXM6CiAgICAgICAgICAgICBtZXJnZWQgaW4gdGhlIHJpc2N2
LWlzYS1tYW51YWwgYnkgY29tbWl0IGRiYzc5Y2YyOGEyICgiSW5pdGlhbCBzZWVkCiAgICAgICAg
ICAgICBvZiB6Yy5hZG9jIHRvIHNyYyB0cmVlLiIpLgogCisgICAgICAgIC0gY29uc3Q6IHpjbW9w
CisgICAgICAgICAgZGVzY3JpcHRpb246CisgICAgICAgICAgICBUaGUgc3RhbmRhcmQgWmNtb3Ag
ZXh0ZW5zaW9uIHZlcnNpb24gMS4wLCBhcyByYXRpZmllZCBpbiBjb21taXQKKyAgICAgICAgICAg
IGM3MzJhNGYzOWE0ICgiWmNtb3AgaXMgcmF0aWZpZWQvMS4wIikgb2YgdGhlIHJpc2N2LWlzYS1t
YW51YWwuCisKICAgICAgICAgLSBjb25zdDogemZhCiAgICAgICAgICAgZGVzY3JpcHRpb246CiAg
ICAgICAgICAgICBUaGUgc3RhbmRhcmQgWmZhIGV4dGVuc2lvbiBmb3IgYWRkaXRpb25hbCBmbG9h
dGluZyBwb2ludApAQCAtNTQ5LDYgKzU1NCwxMyBAQCBwcm9wZXJ0aWVzOgogICAgICAgICAgICAg
ICAgIGNvbnN0OiB6Y2EKICAgICAgICAgICAgIC0gY29udGFpbnM6CiAgICAgICAgICAgICAgICAg
Y29uc3Q6IGYKKyAgICAgICMgWmNtb3AgZGVwZW5kcyBvbiBaY2EKKyAgICAgIC0gaWY6CisgICAg
ICAgICAgY29udGFpbnM6CisgICAgICAgICAgICBjb25zdDogemNtb3AKKyAgICAgICAgdGhlbjoK
KyAgICAgICAgICBjb250YWluczoKKyAgICAgICAgICAgIGNvbnN0OiB6Y2EKIAogYWxsT2Y6CiAg
ICMgWmNmIGV4dGVuc2lvbiBkb2VzIG5vdCBleGlzdCBvbiBydjY0Ci0tIAoyLjQ1LjEKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
