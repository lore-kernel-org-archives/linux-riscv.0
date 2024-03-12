Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A42C54E5D
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 23:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DzIeMnUnz6nJTF2tddNjleyAl2BeVbcBq7nhepge9NQ=; b=OWKRIvTkPrPZJ8
	VMeBeHKdJhWKfUGb8e18rm6dughKniJLBojDL+lTMh2wBB39gMqWCxn32MCOIHCA/9nPHh6i+kasx
	KBFnxxOHsChl/xAzAmB+Z/enfuqvEQ6nAacnUCuPnTJ8pmd8ZmsmpAB0bmR2TtV50bZoyiVnwFlCy
	jfuRysGeLldINEwhIqHKHPElfhZyxFyVePW1hRta3XMIgD4dzwGBqVLQ77nCVX+juU4cqTGhbmHVC
	b2y3EB+zxBVukHRRRxiHk2ica4uKIoRXZZfD0fn+3j6TCBtqirC/6JiqGkVVxkq0JJZbH1B+nfq7K
	kZL/N12PnxX5xxKvEA3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkBwK-000000081fY-1NpG;
	Tue, 12 Mar 2024 23:53:48 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkBwG-000000081dH-0ZFy
	for linux-riscv@lists.infradead.org;
	Tue, 12 Mar 2024 23:53:46 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1dd9568fc51so25940135ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 12 Mar 2024 16:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1710287623; x=1710892423; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CbaFnomR7UPqP/ib9gPmxvX9sB23kPs908oJq/nrjUk=;
        b=kiPmGHq6ZlAro0P+Mv2U6wOUzLgymU4j5PRsH3NGWxRg2w27XmcegCnJusY5RlaqM5
         1JM7YYFyRrzaOPfFZ4+ONiDjEGZjlwcdtvWFncRdRc2Ljq5lrWshhwhH8+N7/1LeJEie
         x9YsDprzzFFLWIoJXRfguEpbuLgmMBijhB05NkBghWAePs6SsKydZKfMJWtRFGsyJRyz
         tG5lSvAarZsdz0u7+X2mdhHBM+45yD8l+2rksS6n1VoWUPQle2Z/aOSg/n2UCpT7FSy/
         Qvgwba7loqeEdM5OTMebvtWPGlGJvyiJ/QIoiLX9jhSlJHfKgS9Dm0+6hzIb2RW+F3uI
         0hnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710287623; x=1710892423;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CbaFnomR7UPqP/ib9gPmxvX9sB23kPs908oJq/nrjUk=;
        b=ldvN3ePyEPbUUq9zvlRgFchCtZutrYB3ZboHoLh0xtME4ws7Xm7f75sZ9hj5g5u+Eo
         9jqKQ0I9xgelAnQvoU+ob/Un5gOk+4z4FoBXOSCQIu17PkrOMctIhUxXYF4vnbEWKq5i
         udm0myMe/SE0SE7LZbDw9e6oL7uW6N6hEFvm+FHQ0++PKWrLj6qpBei8HFZi5IQhQRTC
         DfLheHT9xMcYzf9es465dmUqyivg/Y8x1/U9b27CHsRBObQvUG7T3tHeB2S/G/cgcQw+
         JTeQMgUlKUMpQvEHizM/RX8ewcMXrkTMYNeaagM53QeUawv4uJhmyne7eB2HGsUpGspd
         kYlg==
X-Gm-Message-State: AOJu0Yz5i5XRMeN1yQoiowXcwhj/3eoTCW5EiqGBl4QYHOOSljhq7JdA
	5XdTZ8kHm8SUVs1Q9AI+epXi8qXxNoYKWp2iVxh2Whw8/GFNXB7LQWIKjSUNMJw=
X-Google-Smtp-Source: AGHT+IHVbfM3Upj8dQ1ZiJAogAez9qyzrGsHmhX8elIUp0oPQ1+icC5GBmRm1mIUrYnc9dn7CC/z2g==
X-Received: by 2002:a17:903:110c:b0:1dc:2d65:5fd1 with SMTP id n12-20020a170903110c00b001dc2d655fd1mr13242321plh.2.1710287622877;
        Tue, 12 Mar 2024 16:53:42 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id h9-20020a170902f7c900b001dcad9cbf8bsm7282844plw.239.2024.03.12.16.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 16:53:42 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v13 0/4] riscv: Create and document
 PR_RISCV_SET_ICACHE_FLUSH_CTX prctl
Date: Tue, 12 Mar 2024 16:53:39 -0700
Message-Id: <20240312-fencei-v13-0-4b6bdc2bbf32@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAPr8GUC/23SzU7DMAwH8FeZeqbIdpwm5cR7IA7Nh1kOtFOLK
 tC0dyedWBuhHGPl909s+doscU5xaV5O12aOa1rSNOYDqqdT48/D+BHbFHKhISCFiKaVOPqYWum
 lg2AsywBNvnyZo6Tve9Lbez6f0/I1zT/34BW36l8E0SNixRZaFz1YRO8I6XVO67Sk0T/76bPZU
 lYqpIJdUpbkXUdqcOhQKlIdklDtUm1vGo3akrLRmYrkh2RA2BteOcvAXkhcDzqoitSltLvUWQ4
 DRo3BEFHtt10p+112WQIjdtkya1+RppB4zNZkaaxAhxwxOKhIW8pulzZLVgPnqbEAYUX2haRjt
 v32JubvOok2mJpEKCkfqwDbjEj3BoUVYKhZPCwVreK2RxEVGSEtEWu9Ih1WlXbbJBDFIADs4/9
 9uN1uv40iyc4kAwAA
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jonathan Corbet <corbet@lwn.net>, Conor Dooley <conor.dooley@microchip.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Atish Patra <atishp@atishpatra.org>, Randy Dunlap <rdunlap@infradead.org>, 
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>, 
 Atish Patra <atishp@rivosinc.com>, Alexandre Ghiti <alexghiti@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1710287621; l=3918;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=XX2+/VdM5mhKCZhAjluqbyHqY+H52dZCZSEOzxTDQYM=;
 b=iDe63BieDVlBvDEubOrVk77TNEJxUHkq9FbutFVORS9XaaUJEGTcCrNlCGaHxB4IU2b09a6yq
 HqFpMP4qtBbA2AOKshD8M+PGTA+ek+P08cDFlAKWtHCiY0Wq6hEEM6k
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_165344_355087_C303D33F 
X-CRM114-Status: GOOD (  10.27  )
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

SW1wcm92ZSB0aGUgcGVyZm9ybWFuY2Ugb2YgaWNhY2hlIGZsdXNoaW5nIGJ5IGNyZWF0aW5nIGEg
bmV3IHByY3RsIGZsYWcKUFJfUklTQ1ZfU0VUX0lDQUNIRV9GTFVTSF9DVFguIFRoZSBpbnRlcmZh
Y2UgaXMgbGVmdCBnZW5lcmljIHRvIGFsbG93CmZvciBmdXR1cmUgZXhwYW5zaW9ucyBzdWNoIGFz
IHdpdGggdGhlIHByb3Bvc2VkIEogZXh0ZW5zaW9uIFsxXS4KCkRvY3VtZW50YXRpb24gaXMgYWxz
byBwcm92aWRlZCB0byBleHBsYWluIHRoZSB1c2UgY2FzZS4KClBhdGNoIHNlbnQgdG8gYWRkIFBS
X1JJU0NWX1NFVF9JQ0FDSEVfRkxVU0hfQ1RYIHRvIG1hbi1wYWdlcyBbMl0uCgpbMV0gaHR0cHM6
Ly9naXRodWIuY29tL3Jpc2N2L3Jpc2N2LWotZXh0ZW5zaW9uClsyXSBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9saW51eC1tYW4vMjAyNDAxMjQtZmVuY2VpX3ByY3RsLXYxLTEtMGJkZGFmY2VmMzMx
QHJpdm9zaW5jLmNvbQoKU2lnbmVkLW9mZi1ieTogQ2hhcmxpZSBKZW5raW5zIDxjaGFybGllQHJp
dm9zaW5jLmNvbT4KLS0tCkNoYW5nZXMgaW4gdjEzOgotIFByb3Blcmx5IHVuc2V0IHRocmVhZC5m
b3JjZV9pY2FjaGVfZmx1c2ggKFNhbXVlbCkKLSBBZGQgY3R4IHZhbHVlIGNoZWNraW5nIHdoZW4g
U01QPW4gKFNhbXVlbCkKLSBSZW1vdmUgZHVwbGljYXRlIGJpdCBzZXQgKFNhbXVlbCkKLSBMaW5r
IHRvIHYxMjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MDMxMi1mZW5jZWktdjEyLTAt
MGYzNDBmMDA0Y2U3QHJpdm9zaW5jLmNvbQoKQ2hhbmdlcyBpbiB2MTI6Ci0gVXNlIGNvbnRleHQu
aWNhY2hlX3N0YWxlX21hc2sgaW5zdGVhZCBvZiB0aHJlYWQuaWNhY2hlX3N0YWxlX21hc2sgaW4K
ICBQUl9SSVNDVl9DVFhfU1dfRkVOQ0VJX09GRiAoU2FtdWVsKQotIExpbmsgdG8gdjExOiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9yLzIwMjQwMjEyLWZlbmNlaS12MTEtMC1lMTMyN2YyNWZlMTBA
cml2b3NpbmMuY29tCgpDaGFuZ2VzIGluIHYxMToKLSBBZGQgYmFjayBQUl9SSVNDVl9DVFhfU1df
RkVOQ0VJX09GRiAoU2FtdWVsKQotIEZpeCB1bmRlciBub3NtcCAoU2FtdWVsKQotIENoYW5nZSBz
ZXRfcHJldl9jcHUgKFNhbXVlbCkKLSBGaXh1cCBleGFtcGxlIHRlc3RjYXNlIGluIGRvY3MKLSBD
aGFuZ2Ugd29yZGluZyBvZiBkb2N1bWVudGF0aW9uIHNsaWdodGx5IChBbGVqYW5kb3IgQ29sb21h
cikKLSBMaW5rIHRvIHYxMDogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MDEyNC1mZW5j
ZWktdjEwLTAtYTI1OTcxZjQzMDFkQHJpdm9zaW5jLmNvbQoKQ2hhbmdlcyBpbiB2MTA6Ci0gRml4
IGZlbmNlLmkgY29uZGl0aW9uIHRvIHByb3Blcmx5IG9ubHkgZmx1c2ggb24gbWlncmF0aW9uIChB
bGV4KQotIEZpeCBkb2N1bWVudGF0aW9uIHdvcmRpbmcgKEFsZXgpCi0gTGluayB0byB2OTogaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MDEyMy1mZW5jZWktdjktMC03MTQxMWJmZThkNzFA
cml2b3NpbmMuY29tCgpDaGFuZ2VzIGluIHY5OgotIFJlbW92ZSBwcmV2X2NwdSBmcm9tIG1tIChB
bGV4KQotIExpbmsgdG8gdjg6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDAxMTYtZmVu
Y2VpLXY4LTAtNDNhNDIxMzRmMDIxQHJpdm9zaW5jLmNvbQoKQ2hhbmdlcyBpbiB2ODoKLSBPbmx5
IGZsdXNoIGljYWNoZSBpZiBtaWdyYXRlZCB0byBkaWZmZXJlbnQgY3B1IChBbGV4KQotIE1vdmUg
Zmx1c2hpbmcgdG8gc3dpdGNoX3RvIHRvIGNhdGNoIHBlci10aHJlYWQgZmx1c2hpbmcgcHJvcGVy
bHkKLSBMaW5rIHRvIHY3OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjQwMTEyLWZlbmNl
aS12Ny0wLTc4ZjA2MTRlMWRiMEByaXZvc2luYy5jb20KCkNoYW5nZXMgaW4gdjc6Ci0gQ2hhbmdl
ICJwZXJfdGhyZWFkIiBwYXJhbWV0ZXIgdG8gInNjb3BlIiBhbmQgcHJvdmlkZSBjb25zdGFudHMg
Zm9yIHRoZQogIHBhcmFtZXRlci4KLSBMaW5rIHRvIHY2OiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9yLzIwMjQwMTA5LWZlbmNlaS12Ni0wLTA0MTE2ZTUxNDQ1Y0ByaXZvc2luYy5jb20KCkNoYW5n
ZXMgaW4gdjY6Ci0gRml4dXAgZG9jdW1lbnRhdGlvbiBmb3JtYXR0aW5nCi0gTGluayB0byB2NTog
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MDEwOC1mZW5jZWktdjUtMC1hYTFlNTFkNzIy
MmZAcml2b3NpbmMuY29tCgpDaGFuZ2VzIGluIHY1OgotIE1pbm9yIGRvY3VtZW50YXRpb24gY2hh
bmdlcyAoUmFuZHkpCi0gTGluayB0byB2NDogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0
MDEwNy1mZW5jZWktdjQtMC1kNGNmMmZiOTA1ZDNAcml2b3NpbmMuY29tCgpDaGFuZ2VzIGluIHY0
OgotIEFkZCBPRkYgZmxhZyB0byBkaXNhbGxvdyBmZW5jZS5pIGluIHVzZXJzcGFjZSAoQXRpc2gp
Ci0gRml4IGRvY3VtZW50YXRpb24gaXNzdWVzIChBdGlzaCkKLSBMaW5rIHRvIHYzOiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9yLzIwMjMxMjEzLWZlbmNlaS12My0wLWI3NTE1ODIzOGViN0ByaXZv
c2luYy5jb20KCkNoYW5nZXMgaW4gdjM6Ci0gQ2hlY2sgaWYgdmFsdWUgZm9yY2VfaWNhY2hlX2Zs
dXNoIHNldCBvbiB0aHJlYWQsIHJhdGhlciB0aGFuIGluIG1tCiAgdHdpY2UgKENsw6ltZW50KQot
IExpbmsgdG8gdjI6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyMzExMzAtZmVuY2VpLXYy
LTAtMmNiNjIzYWIxYjFmQHJpdm9zaW5jLmNvbQoKQ2hhbmdlcyBpbiB2MjoKLSBGaXgga2VybmVs
LWRvYyBjb21tZW50IChDb25vcikKLSBMaW5rIHRvIHYxOiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9yLzIwMjMxMTIyLWZlbmNlaS12MS0wLWJlYzA4MTFjYjIxMkByaXZvc2luYy5jb20KCi0tLQpD
aGFybGllIEplbmtpbnMgKDQpOgogICAgICByaXNjdjogUmVtb3ZlIHVubmVjZXNzYXJ5IGlycWZs
YWdzIHByb2Nlc3Nvci5oIGluY2x1ZGUKICAgICAgcmlzY3Y6IEluY2x1ZGUgcmlzY3Zfc2V0X2lj
YWNoZV9mbHVzaF9jdHggcHJjdGwKICAgICAgZG9jdW1lbnRhdGlvbjogRG9jdW1lbnQgUFJfUklT
Q1ZfU0VUX0lDQUNIRV9GTFVTSF9DVFggcHJjdGwKICAgICAgY3B1bWFzazogQWRkIGFzc2lnbiBj
cHUKCiBEb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvY21vZHgucnN0IHwgIDk4ICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrCiBEb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaW5kZXgucnN0
IHwgICAxICsKIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaXJxZmxhZ3MuaCAgfCAgIDEgLQogYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9tbXUuaCAgICAgICB8ICAgMiArCiBhcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL3Byb2Nlc3Nvci5oIHwgIDEwICsrKysKIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vc3dp
dGNoX3RvLmggfCAgMjMgKysrKysrKysKIGFyY2gvcmlzY3YvbW0vY2FjaGVmbHVzaC5jICAgICAg
ICAgfCAxMTEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogYXJjaC9yaXNj
di9tbS9jb250ZXh0LmMgICAgICAgICAgICB8ICAxOSArKysrLS0tCiBpbmNsdWRlL2xpbnV4L2Nw
dW1hc2suaCAgICAgICAgICAgIHwgIDE2ICsrKysrKwogaW5jbHVkZS91YXBpL2xpbnV4L3ByY3Rs
LmggICAgICAgICB8ICAgNiArKwoga2VybmVsL3N5cy5jICAgICAgICAgICAgICAgICAgICAgICB8
ICAgNiArKwogMTEgZmlsZXMgY2hhbmdlZCwgMjg0IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25z
KC0pCi0tLQpiYXNlLWNvbW1pdDogNjYxMzQ3NmUyMjVlMDkwY2M5YWFkNDliZTdmYTUwNGUyOTBk
ZDMzZApjaGFuZ2UtaWQ6IDIwMjMxMTE3LWZlbmNlaS1mOWY2MGQ3ODRmYTAKLS0gCi0gQ2hhcmxp
ZQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
