Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30BD0C4332F
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 10:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=otK6sXzu86lyIBhq/HSynW4+y8OfHPdPr5CDDG2iE5I=; b=SLxL2LNCGNqzEK
	ksaY6MBMVGrkRPavWy3mvtIz1r8lqCQNj+X4LPsVqK4t65OyDoNiWUPXLNn+MAWYR0d4a3190f/8B
	qwckuS7ns0gVnHzRdm6/+vtaeuEFOHcqEWgOOAP+7ahoGKDU5r7cI6a9Pf0I1vqrU7jR/yi8v+5/h
	Jy7upE9WCGPd4mY+eLvbNd+nxU6zikiex+U8Og5oGoJsDVHsdufvXrtJSrPcgR28Ss6NOwpdUIgk0
	vE6t7FaLbgGIlUUTO+ZhbNNQ2Rlle+lN6Z9t8hTZ7FPLQM4CL1YTMctWEhobv2cH6HNF1a8KNgI/j
	JsCFsCdro1v6377O1x0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Jkd-00197i-1E;
	Tue, 07 Nov 2023 10:56:07 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0JkZ-00195A-27
	for linux-riscv@lists.infradead.org;
	Tue, 07 Nov 2023 10:56:05 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2c6eac9c053so17671161fa.1
        for <linux-riscv@lists.infradead.org>; Tue, 07 Nov 2023 02:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699354560; x=1699959360; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TTPh4b9H/nO8hrW4fuWs0VYK/m0j/zKHKOI67JxMX58=;
        b=0RzPSw/xHUKJ301sU7ArHIym9ovQb9nqYGOmD14ZXTzd38EI8eIVxT5sTIPjD7P18Y
         LT2qKvR8Eu/SzDL1RgsbvZgy6p9AslCVRqos2QmCGDbothMPbrx4csKZwCRcE18rN0Uc
         y3FqPO5R0cLl06MtJam2Aoa5EFjQcwJSNpMja5DX9ZIXZLzte4yxxlWUeSvJJirYD/U1
         2M157lwVuSxEzvdQ6HHV4v+USBw+6aAgHxlHbqpCxNQnxe6T1MDYwbU4suWa24iiSI+7
         y970V1tPCjeBtS2YqagZrhPJJ2C242dGwFY//6G00sxFFa0EFjC9veKQQgByfh/6yr0l
         uNgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699354560; x=1699959360;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TTPh4b9H/nO8hrW4fuWs0VYK/m0j/zKHKOI67JxMX58=;
        b=P3+p3nVVhr8BNy1ea1+uBo3hEBGfiKZPlcl89OTgn7KVjw7mYSM4uFmhpY5aGytwTi
         Iw8vlGfYqHm9dOKv6YaJ2W2UJKeeYRIv629vDEqjglu0jWGGZxcTXxAH9P75/Z7qhx13
         953+mTRAY28iEVqf25BdMCKDXxFZGbAPxxuCbYQt52FwuQkMz7RHrg9fygjGXb88y7Y3
         D7CeK6sIbInW0UML90sfW07/lkF+0EulissNaOR1/8BHOZf4rY07QTeCxC4+NigR/z0W
         Ns59HiMlx+n/XBlBT2+w0tsVaMNrr/O8hRND+wcgST2qNh6ubB/X0pisH2GbKhvxDt9i
         8BUA==
X-Gm-Message-State: AOJu0Yxlspi8Clju/W3haXM/OjKdI90moFsukBRZTQo9XettdFIz+rFC
	IQWQh0QUZI4uCQewbpRcEOCIC9K10lWksg48on0E6Q==
X-Google-Smtp-Source: AGHT+IH6kSTyN/uSnqdIlgzf5lG+Dfp4JV8XqbpNFHyUam9HN1gSjiiGpNBk+IykQOWB11yd1ldOxw==
X-Received: by 2002:a2e:a9a2:0:b0:2bf:e5dc:aa68 with SMTP id x34-20020a2ea9a2000000b002bfe5dcaa68mr26713821ljq.3.1699354559989;
        Tue, 07 Nov 2023 02:55:59 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:7db3:bdd9:4cab:2ee3])
        by smtp.gmail.com with ESMTPSA id n30-20020a05600c501e00b00405442edc69sm15396853wmr.14.2023.11.07.02.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 02:55:59 -0800 (PST)
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
Subject: [PATCH v3 00/20] riscv: report more ISA extensions through hwprobe
Date: Tue,  7 Nov 2023 11:55:36 +0100
Message-ID: <20231107105556.517187-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_025603_902831_32DAD1AE 
X-CRM114-Status: GOOD (  12.72  )
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

SW4gb3JkZXIgdG8gYmUgYWJsZSB0byBnYXRoZXIgbW9yZSBpbmZvcm1hdGlvbiBhYm91dCB0aGUg
c3VwcG9ydGVkIElTQQpleHRlbnNpb25zIGZyb20gdXNlcnNwYWNlIHVzaW5nIHRoZSBod3Byb2Jl
IHN5c2NhbGwsIGFkZCBtb3JlIElTQSBleHRlbnNpb25zCnJlcG9ydC4gVGhpcyBzZXJpZXMgYWRk
cyB0aGUgZm9sbG93aW5nIElTQSBleHRlbnNpb25zIHBhcnNpbmcgc3VwcG9ydDoKCi0gWmZoW21p
bl0KLSBadmZoW21pbl0KLSBaaWhpbnRudGwKLSBaYmMKLSBadmJiCi0gWnZiYwotIFp2a2IKLSBa
dmtnCi0gWnZrbmVkCi0gWnZrbmhbYWJdCi0gWnZrc2VkCi0gWnZrc2gKLSBadmtuCi0gWnZrbmMK
LSBadmtuZwotIFp2a3MKLSBadmtzYwotIFp2a3NnCi0gWnZrdAotIFpmYQotIFpia2IKLSBaYmtj
Ci0gWmJreAotIFprbmQKLSBaa25lCi0gWmtuaAotIFprcgotIFprc2VkCi0gWmtzaAotIFprdAoK
U29tZSBvZiB0aGVzZSBleHRlbnNpb25zIGFyZSBhY3R1YWxseSBzaG9ydGhhbmRzIGZvciBvdGhl
ciAic3ViIgpleHRlbnNpb25zLiBUaGlzIHNlcmllcyBpbmNsdWRlcyBhIHBhdGNoIGZyb20gQ29u
b3IvRXZhbiB0aGF0IGFkZHMgYSB3YXkKdG8gc3BlY2lmeSBzdWNoICJidW5kbGVkIiBleHRlbnNp
b25zLiBXaGVuIGV4cG9zaW5nIHRoZXNlIGJ1bmRsZWQKZXh0ZW5zaW9ucyB0byB1c2Vyc3BhY2Ug
dGhyb3VnaCBod3Byb2JlLCBvbmx5IHRoZSAic3ViIiBleHRlbnNpb25zIGFyZQpleHBvc2VkLgoK
SW4gb3JkZXIgdG8gdGVzdCBpdCwgb25lIGNhbiB1c2UgcWVtdSBhbmQgdGhlIHNtYWxsIGh3cHJv
YmUgdXRpbGl0eQpwcm92aWRlZFsxXS4gUnVuIHFlbXUgYnkgc3BlY2lmeWluZyBhZGRpdGlvbmFs
IElTQSBleHRlbnNpb25zLCBmb3IKaW5zdGFuY2U6CgokIHFlbXUtc3lzdGVtLXJpc2N2NjQgLWNw
dSBydjY0LHY9dHJ1ZSx6az10cnVlLHp2a3NoPXRydWUsenZrbmVkPXRydWUKICA8d2hhdGV2ZXIg
b3B0aW9ucyB5b3Ugd2FudD4KClRoZW4sIHJ1biBod3Byb2JlOgoKJCAuL2h3cHJvYmUKQmFzZSBz
eXN0ZW0gSVNBOgogLSBJTUFfRkQKIC0gQwogLSBWClN1cHBvcnRlZCBleHRlbnNpb25zOgogLSBa
YmEKIC0gWmJiCiAtIFpicwogLSBaYmMKIC0gWmJrYgogLSBaYmtjCiAtIFpia3gKIC0gWmtuZAog
LSBaa25lCiAtIFprbmgKIC0gWmt0CiAtIFp2a25lZAogLSBadmtzaAogLSBaaWhpbnRudGwKIC0g
WmZhCgpMaW5rOiBodHRwczovL2dpdGh1Yi5jb20vY2xlbWVudGxlZ2VyL2h3cHJvYmVfZHVtcCBb
MV0KCi0tLQoKQ2hhbmdlcyBpbiBWMzoKIC0gUmViYXNlZCBvbiB0b3Agb2Ygb3JpZ2luL21hc3Rl
cgogLSBSZW5hbWUgYnVuZGxlX2V4dCB0byBzdWJzZXRfZXh0IHNpbmNlIGl0IGlzIHVzZWQgZm9y
IHN1cGVyc2V0CiAgIGV4dGVuc2lvbnMgKFp2YmIgZm9yIGluc3RhbmNlKS4KIC0gQWRkIGFuIGlu
dmFsaWQgaWQgZm9yIHB1cmUgbGFzc28gZXh0ZW5zaW9uCiAtIEZpeCB3cm9uZyB0eXBlIGZvciBj
aGVja19pc2EgZXh0LCBpbnQgLT4gdW5zaWduZWQgaW50CiAtIFVzZSBidW5kbGVkIGV4dGVuc2lv
biBmb3IgWlZCQi9aVk5IQgogLSBTcGxpdCBaQkMgaHdwcm9iZSBzdXBwb3J0IGZyb20gc2NhbGFy
IGNyeXB0byBwYXRjaAogLSBGaXggdHlwb3MgKEV2YW4pCiAtIEFkZGVkIGEgZmV3IFJiOiBmcm9t
IEV2YW4KIC0gQ2hhbmdlIFpmaC9aZmhtaW4gdG8gWmZoW21pbl0gdG8gYmUgbW9yZSBjb2hlcmVu
dCB3aXRoIG90aGVyIGNvbW1pdHMKIC0gUmV3b3JkIGNvbW1lbnQgYWJvdXQgQ0hFQ0tfSVNBX0VY
VCB0byBiZSBtb3JlIGNsZWFyCgpDaGFuZ2VzIGluIFYyOgogLSBGaXggdHlwbyBpbiBmaXJzdCBj
b21taXQgdGl0bGUgKGZhdG9yaXplLT5mYWN0b3JpemUpCiAtIEFkZCBaZmEgc3VwcG9ydAogLSBG
aXggbWlzc2luZyB1cHBlcmNhc2UgZm9yIFp2a3QgbmFtaW5nIGluIGR0LWJpbmRpbmdzCiAtIEFk
ZCBDb25vciBBY2tlZC1ieSBvbiBkdC1iaW5kaW5ncyBjb21taXRzCiAtIEFkZCBzY2FsYXIgY3J5
cHRvIHN1cHBvcnQgZnJvbSBDb25vci9FdmFuLgogLSBVc2UgcmVwb3J0aW5nIG9mIGJ1bmJsZWQg
ZXh0ZW5zaW9ucyBmb3IgdmVjdG9yIGNyeXB0bwoKQ2zDqW1lbnQgTMOpZ2VyICgxOSk6CiAgcmlz
Y3Y6IGh3cHJvYmU6IGZhY3Rvcml6ZSBod3Byb2JlIElTQSBleHRlbnNpb24gcmVwb3J0aW5nCiAg
cmlzY3Y6IGh3cHJvYmU6IGV4cG9ydCBtaXNzaW5nIFpiYyBJU0EgZXh0ZW5zaW9uCiAgcmlzY3Y6
IGh3cHJvYmU6IGFkZCBzdXBwb3J0IGZvciBzY2FsYXIgY3J5cHRvIElTQSBleHRlbnNpb25zCiAg
ZHQtYmluZGluZ3M6IHJpc2N2OiBhZGQgc2NhbGFyIGNyeXB0byBJU0EgZXh0ZW5zaW9ucyBkZXNj
cmlwdGlvbgogIHJpc2N2OiBhZGQgSVNBIGV4dGVuc2lvbiBwYXJzaW5nIGZvciB2ZWN0b3IgY3J5
cHRvCiAgcmlzY3Y6IGh3cHJvYmU6IGV4cG9ydCB2ZWN0b3IgY3J5cHRvIElTQSBleHRlbnNpb25z
CiAgZHQtYmluZGluZ3M6IHJpc2N2OiBhZGQgdmVjdG9yIGNyeXB0byBJU0EgZXh0ZW5zaW9ucyBk
ZXNjcmlwdGlvbgogIHJpc2N2OiBhZGQgSVNBIGV4dGVuc2lvbiBwYXJzaW5nIGZvciBaZmgvWmZo
W21pbl0KICByaXNjdjogaHdwcm9iZTogZXhwb3J0IFpmaFttaW5dIElTQSBleHRlbnNpb25zCiAg
ZHQtYmluZGluZ3M6IHJpc2N2OiBhZGQgWmZoW21pbl0gSVNBIGV4dGVuc2lvbnMgZGVzY3JpcHRp
b24KICByaXNjdjogYWRkIElTQSBleHRlbnNpb24gcGFyc2luZyBmb3IgWmloaW50bnRsCiAgcmlz
Y3Y6IGh3cHJvYmU6IGV4cG9ydCBaaGludG50bCBJU0EgZXh0ZW5zaW9uCiAgZHQtYmluZGluZ3M6
IHJpc2N2OiBhZGQgWmloaW50bnRsIElTQSBleHRlbnNpb24gZGVzY3JpcHRpb24KICByaXNjdjog
YWRkIElTQSBleHRlbnNpb24gcGFyc2luZyBmb3IgWnZmaFttaW5dCiAgcmlzY3Y6IGh3cHJvYmU6
IGV4cG9ydCBadmZoW21pbl0gSVNBIGV4dGVuc2lvbnMKICBkdC1iaW5kaW5nczogcmlzY3Y6IGFk
ZCBadmZoW21pbl0gSVNBIGV4dGVuc2lvbiBkZXNjcmlwdGlvbgogIHJpc2N2OiBhZGQgSVNBIGV4
dGVuc2lvbiBwYXJzaW5nIGZvciBaZmEKICByaXNjdjogaHdwcm9iZTogZXhwb3J0IFpmYSBJU0Eg
ZXh0ZW5zaW9uCiAgZHQtYmluZGluZ3M6IHJpc2N2OiBhZGQgWmZhIElTQSBleHRlbnNpb24gZGVz
Y3JpcHRpb24KCkV2YW4gR3JlZW4gKDEpOgogIHJpc2N2OiBhZGQgSVNBIGV4dGVuc2lvbiBwYXJz
aW5nIGZvciBzY2FsYXIgY3J5cHRvCgogRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUu
cnN0ICAgICAgICAgIHwgIDgxICsrKysrKysKIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2
L2V4dGVuc2lvbnMueWFtbCB8IDIxMCArKysrKysrKysrKysrKysrKysKIGFyY2gvcmlzY3YvaW5j
bHVkZS9hc20vaHdjYXAuaCAgICAgICAgICAgICAgICB8ICAzNiArKy0KIGFyY2gvcmlzY3YvaW5j
bHVkZS91YXBpL2FzbS9od3Byb2JlLmggICAgICAgICB8ICAyNiArKysKIGFyY2gvcmlzY3Yva2Vy
bmVsL2NwdWZlYXR1cmUuYyAgICAgICAgICAgICAgICB8IDE4OSArKysrKysrKysrKysrKy0tCiBh
cmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYyAgICAgICAgICAgICAgICAgfCAgNjQgKysrKy0t
CiA2IGZpbGVzIGNoYW5nZWQsIDU2NiBpbnNlcnRpb25zKCspLCA0MCBkZWxldGlvbnMoLSkKCi0t
IAoyLjQyLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
