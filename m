Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0164EC4167D
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Nov 2023 14:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EyxtnwCrpQfXlyzUWl8N5YccXMGJ3DjFXdDjT39sKmQ=; b=CxEdSPzc+nbqD8
	JbFEUE6fj8xzKC3WEesjzXWW1cCqTB+zMvBBQ+POyD6F+wU9kqV9P96lupSqXroD8ki7/G22tre8H
	gbZdN4AzrCqi5I4pOQSAfgO5m8DoJu8PZ5qxaA4pIruuPR0Wq+yJuH2CAKZr9/4dwQbGhHc6i+9Jd
	t7RfPRK/JSMzK8xwE2ZzmPwvlyhG52oDHYg6O+8pT1ZCgr1Hfb/WsRF+kNu1LF4IAUrm7eK1YOH8t
	klZmRWuHUnm0LF/XE8FCy3xi6FGljy5kBhuwl5wBqSCN3liCRuq0NCjEKpHe19P+ZJo4lrAlO2EyC
	y0NqXsqxg0IQYjnxJg9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2uAd-00G8pu-2T;
	Tue, 14 Nov 2023 14:13:39 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2uAZ-00G8ml-0w
	for linux-riscv@lists.infradead.org;
	Tue, 14 Nov 2023 14:13:38 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-778a25cad6dso14497785a.0
        for <linux-riscv@lists.infradead.org>; Tue, 14 Nov 2023 06:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699971210; x=1700576010; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HQjQphgrA/D8IHhb5D1IdcN3VnDD+XZViad2Wn0dvR0=;
        b=jhzhlw+LBY5tQwu1SuDFLKroqEHqdimD7t7o4/k2qg5zT49wQU/liNQ5tV9cuAqxOy
         FtGU191sJoMd+gZbwkTIbUB1QOi0EzvB7c7lNHmQSilODi2w3M4D9eXqB3utznRMKDpv
         e1mZ52d2LwXER9gnQdzewJgdGDAtYxUlQ/O1RQ7R8VMf1Z1KCFs/G7L1HV49G9SHh1ir
         Gs6iuOOBtVN/YbS4ZBHAk+Xw+RNqA+QE4pdYICWtgYWZQUd40aeRGfL106HTuR9xMNW5
         5WN2+tSJl28b/ahVyj4cF1k0flsE5VgjF2LqpFUBREHQ/JgNHFL898Ix81v1FxzHHZaw
         PXZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699971210; x=1700576010;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HQjQphgrA/D8IHhb5D1IdcN3VnDD+XZViad2Wn0dvR0=;
        b=h5m2klaPWVrbA+Uo+Hmo+EJ/OcVtDdrhTHnTm7uVrMQ0F6wlvxRq0i68kXLVGm0E10
         1URJ7PmpLlNuGZU54poIS0FYHjYCyVtu4+Lu8N6dBm9r2SKEc48Iw7ti1CidnliY+hSe
         ywwXjbzV0SjfaR571GFH5qKXY1br936zw4Z8GIpu7ap+1Q9lfjxwmGv83aZaqryx0GEP
         xpVcu6vbRkMwwLP01EbhtuMqvxLCxLkkpb9IM1/Lt7qHER4zmnnVswtYn6bXzVnPc35t
         2E2hssHWF5oN0Ej47rIrlpUqTG+6iJTZ2kFvs7w/suC/OBi3OuQ6C7bU7RQWFxd4K6jH
         WH+w==
X-Gm-Message-State: AOJu0YxCXRsh6SS2r8PB5qu1rGuOuH23kGrKppYYQEoUUoi22Ykr5Fdg
	KdcG/gPxTy+U4KaIcZeWjNDPNs+AmdYmFD0wVnZL5g==
X-Google-Smtp-Source: AGHT+IGheyAGwa9SEinQILE8hC+p0W4sbxl1g6NAUPPkIdAxCstjHbETQlMdJWiCH5rmRKIUUwuHcQ==
X-Received: by 2002:a05:620a:3941:b0:778:8ae9:2247 with SMTP id qs1-20020a05620a394100b007788ae92247mr2341870qkn.5.1699971210654;
        Tue, 14 Nov 2023 06:13:30 -0800 (PST)
Received: from carbon-x1.. ([12.186.190.2])
        by smtp.gmail.com with ESMTPSA id m2-20020a05620a220200b00777611164c5sm2701263qkh.106.2023.11.14.06.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 06:13:30 -0800 (PST)
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
Subject: [PATCH v4 00/20] riscv: report more ISA extensions through hwprobe
Date: Tue, 14 Nov 2023 09:12:36 -0500
Message-ID: <20231114141256.126749-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_061335_331280_986C3347 
X-CRM114-Status: GOOD (  15.67  )
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
IHN5c2NhbGwsIGFkZCBtb3JlIElTQQpleHRlbnNpb25zIHJlcG9ydC4gVGhpcyBzZXJpZXMgYWRk
cyB0aGUgZm9sbG93aW5nIElTQSBleHRlbnNpb25zIHBhcnNpbmcKc3VwcG9ydDoKCi0gWmZoW21p
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
MV0KCi0tLQpDaGFuZ2VzIGluIFY0OgogLSBSZWJhc2Ugb24gbWFzdGVyCiAtIERvIG5vdCByZXBy
ZXNlbnQgenZrbmhiIGFzIGEgc3VwZXJzZXQgYW55bW9yZQogLSBSZW1vdmUgbWVudGlvbiB0byBo
d3Byb2JlIGluIGR0LWJpbmRpbmdzIGRvY3VtZW50cwogLSBBZGQgYSB0ZXh0IHNwZWNpZnlpbmcg
dGhhdCBaa3Igc3RyaW5nIGR0IGJpbmRpbmcgbWVhbnMgdGhhdCB0aGUgQ1NSCiAgIHByb3ZpZGVk
IGJ5IFprciBhcmUgYWNjZXNzaWJsZSBvbmx5IGJ5IHRoZSBwcml2aWxlZ2UgbGV2ZWwgdG8gd2hp
Y2gKdGhlIGRldmljZS10cmVlIGhhcyBiZWVuIHByb3ZpZGVkLgogLSBVc2UgYSBwb2ludGVyIGZv
ciBleHRlbnNpb24gaW5zdGVhZCBvZiBzdHJ1Y3QgY29weSBpbiBwYXRjaCAxCiAtIEFkZCBtaXNz
aW5nIFJJU0NWX0lTQV9FWFRfWkJDIGRlZmluZQogLSBSZW1vdmUgSVNBIGNoZWNrIG1hY3JvIHNp
bmNlIGFub3RoZXIgc2ltaWxhciBjb21taXQgd2FzIG1lcmdlZAoKQ2hhbmdlcyBpbiBWMzoKIC0g
UmViYXNlZCBvbiB0b3Agb2Ygb3JpZ2luL21hc3RlcgogLSBSZW5hbWUgYnVuZGxlX2V4dCB0byBz
dWJzZXRfZXh0IHNpbmNlIGl0IGlzIHVzZWQgZm9yIHN1cGVyc2V0CiAgIGV4dGVuc2lvbnMgKFp2
YmIgZm9yIGluc3RhbmNlKS4KIC0gQWRkIGFuIGludmFsaWQgaWQgZm9yIHB1cmUgbGFzc28gZXh0
ZW5zaW9uCiAtIEZpeCB3cm9uZyB0eXBlIGZvciBjaGVja19pc2EgZXh0LCBpbnQgLT4gdW5zaWdu
ZWQgaW50CiAtIFVzZSBidW5kbGVkIGV4dGVuc2lvbiBmb3IgWlZCQi9aVk5IQgogLSBTcGxpdCBa
QkMgaHdwcm9iZSBzdXBwb3J0IGZyb20gc2NhbGFyIGNyeXB0byBwYXRjaAogLSBGaXggdHlwb3Mg
KEV2YW4pCiAtIEFkZGVkIGEgZmV3IFJiOiBmcm9tIEV2YW4KIC0gQ2hhbmdlIFpmaC9aZmhtaW4g
dG8gWmZoW21pbl0gdG8gYmUgbW9yZSBjb2hlcmVudCB3aXRoIG90aGVyIGNvbW1pdHMKIC0gUmV3
b3JkIGNvbW1lbnQgYWJvdXQgQ0hFQ0tfSVNBX0VYVCB0byBiZSBtb3JlIGNsZWFyCgpDaGFuZ2Vz
IGluIFYyOgogLSBGaXggdHlwbyBpbiBmaXJzdCBjb21taXQgdGl0bGUgKGZhdG9yaXplLT5mYWN0
b3JpemUpCiAtIEFkZCBaZmEgc3VwcG9ydAogLSBGaXggbWlzc2luZyB1cHBlcmNhc2UgZm9yIFp2
a3QgbmFtaW5nIGluIGR0LWJpbmRpbmdzCiAtIEFkZCBDb25vciBBY2tlZC1ieSBvbiBkdC1iaW5k
aW5ncyBjb21taXRzCiAtIEFkZCBzY2FsYXIgY3J5cHRvIHN1cHBvcnQgZnJvbSBDb25vci9FdmFu
LgogLSBVc2UgcmVwb3J0aW5nIG9mIGJ1bmJsZWQgZXh0ZW5zaW9ucyBmb3IgdmVjdG9yIGNyeXB0
bwoKQ2zDqW1lbnQgTMOpZ2VyICgxOSk6CiAgcmlzY3Y6IGFkZCBJU0EgZXh0ZW5zaW9uIHBhcnNp
bmcgZm9yIFpiYwogIHJpc2N2OiBod3Byb2JlOiBleHBvcnQgbWlzc2luZyBaYmMgSVNBIGV4dGVu
c2lvbgogIHJpc2N2OiBod3Byb2JlOiBhZGQgc3VwcG9ydCBmb3Igc2NhbGFyIGNyeXB0byBJU0Eg
ZXh0ZW5zaW9ucwogIGR0LWJpbmRpbmdzOiByaXNjdjogYWRkIHNjYWxhciBjcnlwdG8gSVNBIGV4
dGVuc2lvbnMgZGVzY3JpcHRpb24KICByaXNjdjogYWRkIElTQSBleHRlbnNpb24gcGFyc2luZyBm
b3IgdmVjdG9yIGNyeXB0bwogIHJpc2N2OiBod3Byb2JlOiBleHBvcnQgdmVjdG9yIGNyeXB0byBJ
U0EgZXh0ZW5zaW9ucwogIGR0LWJpbmRpbmdzOiByaXNjdjogYWRkIHZlY3RvciBjcnlwdG8gSVNB
IGV4dGVuc2lvbnMgZGVzY3JpcHRpb24KICByaXNjdjogYWRkIElTQSBleHRlbnNpb24gcGFyc2lu
ZyBmb3IgWmZoL1pmaFttaW5dCiAgcmlzY3Y6IGh3cHJvYmU6IGV4cG9ydCBaZmhbbWluXSBJU0Eg
ZXh0ZW5zaW9ucwogIGR0LWJpbmRpbmdzOiByaXNjdjogYWRkIFpmaFttaW5dIElTQSBleHRlbnNp
b25zIGRlc2NyaXB0aW9uCiAgcmlzY3Y6IGFkZCBJU0EgZXh0ZW5zaW9uIHBhcnNpbmcgZm9yIFpp
aGludG50bAogIHJpc2N2OiBod3Byb2JlOiBleHBvcnQgWmhpbnRudGwgSVNBIGV4dGVuc2lvbgog
IGR0LWJpbmRpbmdzOiByaXNjdjogYWRkIFppaGludG50bCBJU0EgZXh0ZW5zaW9uIGRlc2NyaXB0
aW9uCiAgcmlzY3Y6IGFkZCBJU0EgZXh0ZW5zaW9uIHBhcnNpbmcgZm9yIFp2ZmhbbWluXQogIHJp
c2N2OiBod3Byb2JlOiBleHBvcnQgWnZmaFttaW5dIElTQSBleHRlbnNpb25zCiAgZHQtYmluZGlu
Z3M6IHJpc2N2OiBhZGQgWnZmaFttaW5dIElTQSBleHRlbnNpb24gZGVzY3JpcHRpb24KICByaXNj
djogYWRkIElTQSBleHRlbnNpb24gcGFyc2luZyBmb3IgWmZhCiAgcmlzY3Y6IGh3cHJvYmU6IGV4
cG9ydCBaZmEgSVNBIGV4dGVuc2lvbgogIGR0LWJpbmRpbmdzOiByaXNjdjogYWRkIFpmYSBJU0Eg
ZXh0ZW5zaW9uIGRlc2NyaXB0aW9uCgpFdmFuIEdyZWVuICgxKToKICByaXNjdjogYWRkIElTQSBl
eHRlbnNpb24gcGFyc2luZyBmb3Igc2NhbGFyIGNyeXB0bwoKIERvY3VtZW50YXRpb24vYXJjaC9y
aXNjdi9od3Byb2JlLnJzdCAgICAgICAgICB8ICA4MSArKysrKysrCiAuLi4vZGV2aWNldHJlZS9i
aW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwgfCAyMTMgKysrKysrKysrKysrKysrKysrCiBh
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUuaCAgICAgICAgICAgfCAgIDQgKy0KIGFy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaCAgICAgICAgICAgICAgICB8ICAzMCArKy0KIGFy
Y2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmggICAgICAgICB8ICAyNiArKysKIGFy
Y2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyAgICAgICAgICAgICAgICB8IDE4OSArKysrKysr
KysrKysrKy0tCiBhcmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYyAgICAgICAgICAgICAgICAg
fCAgMzMgKysrCiA3IGZpbGVzIGNoYW5nZWQsIDU1MSBpbnNlcnRpb25zKCspLCAyNSBkZWxldGlv
bnMoLSkKCi0tIAoyLjQyLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
