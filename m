Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE715CFD65F
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jan 2026 16:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=82/VTYic1IpV4iRhSIOaI37yZ6QlOKRyBsq6lFJwdks=; b=kay3/4gkDZPteC
	U0LW52NLjl4YJWnLvEWpyEm9ijBQRB07JnCSbsITgkcA7le/4HZohoBjH4N3rwDRbKKxFXPOIK4LR
	mlYpC9lOMA99An8xKDG+47o0N/KS+Z+U6jXvyFsjhqwLPCEL7Xrx/woRF6tkbSpzMp/SIdD/0cbk0
	x8iTD3fLmvtP1S/maipo8pbteHXvuRm/Q/aqIPZGzJl8uzTD+k6iaOcLn+5Whkr6oZmE3RXXdzQEz
	TQ3zOOLAfi932APeWph/KMxWQqf3y1hOQ4kploG9SI8Sasp48aAJMrVshQjGBiHv1y+DO3ir6/do2
	NknRykfvXtPirMnwkJ6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWPf-0000000FHn6-0tSQ;
	Wed, 07 Jan 2026 16:29:35 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWPc-0000000FHlO-1Hqd
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jan 2026 16:29:34 +0000
Received: by mail-wm1-x343.google.com with SMTP id 5b1f17b1804b1-47d182a8c6cso14511405e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 07 Jan 2026 08:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20230601.gappssmtp.com; s=20230601; t=1767803370; x=1768408170; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dvVGowKlmlOk8ufl2dgbwZUQhdQ7tHUGcyk69lSV+dw=;
        b=mn7l7iMENyEX9Kq/lpqibuEAFziatJodzkgy62My9uschU+/q66ZufE4UF3DyBkQbA
         0QNogYGXt2ciyF0AmDhFTTW029enwhtpeZv6DBS3dn698bc4n2TYMKU1gOvDhl9xkzF0
         YTUM7c8pUyJHN5Scj78XUN/kK4ytopPFUa4zhUnHiSFG/1fLoOfQURC0ydImSFF0D2S1
         JTns2PLHgSV7mVxC5MCbWvdCpgcOO7R+ATnD9t75P4ATza0Hhk2LCZgTcG7OWtvPj+4N
         5hJIr+KZGNNtQbCRjKEpGrjNEbcI7U02BsZd6Kq7sKzfc2YKnFfbPcO4xlqntvGNFCmj
         hqpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767803370; x=1768408170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dvVGowKlmlOk8ufl2dgbwZUQhdQ7tHUGcyk69lSV+dw=;
        b=MyRMik6sp64aAJU60k5k4jBYOKKKnbMRM7aYew/MoKqMvAAqalQo7ttffdjI+Xziff
         /nxJgNipV+KQq++zb17f/tt/rPtfm9HiWI7lLOF7yZbCIvfRPNchIUJUNqrGtf5i+h2y
         jTebWZVxz14fdF7DfI6l+Kzy3+bDh5T9HI9W+9pPJ5X50Emi6Tfsc9EDqI+jMNO/TE4R
         rzVmLQRpbB1io+RaN/XCYxgY+X0Ej8aN6pDmzRcwa5UDopC9BPw3PFXAG0BV/m/gJ9tv
         FBSIxp2U86gymVSSB8/muqJb+lSuksuHflhIKPTsh6WMGgM65uQnqD8xVCBYlBSvNMXp
         Gv9w==
X-Forwarded-Encrypted: i=1; AJvYcCUKx7blBeiMGy1urTKgYc/n78gRF96NvXQSURDKeoHPRShjw6tHCls2AjJpTqu89MyMyjiTk431ewnRLg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzhpYQescXG0ddFpxQyLERgS/PmWXttM5XMORsHW6ftknc29VCb
	HyFhGNPsckUNfXSOwH+1Fkz7fBZWceTgEmGkPW8RRQWKkNyMgL3GcxJ6c4MuoQQmIJEx
X-Gm-Gg: AY/fxX4SBSFhbDVfezCEn4TYpo7dTYWDpdyVfvVPvP/VFvXjv8/+ac4hqMSWgMaJ1mW
	0SyEf2A2/TT1E+Mj4VEBA+XRDhGHrDJwcY8E0JWD7uPQQxCMJVxbT3BGo8R29YvsXY9P3C9T4Po
	PvDwGefyrQxj4D1LLwCChQw2qyqjUjplT3d0MfdVIs5a+2wQDAexeJ5ST6ROJRvmTLCb948NZ6k
	EyRFt2rXV+Cy7fgPx7vV78flR73vc5MUsuC8QH2IDlZwMUWCEdtrZ3UROnoXTVBw5IhYvsue3WB
	g9osjvXDyYQ9YQmkLBOYFY9rMkdEL4f0SEi4g/yf+F2F2XILmJ0RbXxhwKEpxSPprRasrvvS9tQ
	HHURQAvFtFY7slpsXg216jqtuF1SWuSZfiH4uqQYhBP74+n1Zqb4hzAUuvC9L1Ea120aOgAsgv6
	NSJSp4HvC+FIgwZurz7ArdnYSI/1Wt
X-Google-Smtp-Source: AGHT+IGZvgVIRVCpFA27SlFxqTQCtBZyTJkVQlpD5nx0fxVjL9cGeTsV0wkJ5rzD4sY1Y62BW2/V+g==
X-Received: by 2002:a05:6000:144f:b0:431:54c:6f8 with SMTP id ffacd0b85a97d-432c377239fmr3846262f8f.1.1767803370264;
        Wed, 07 Jan 2026 08:29:30 -0800 (PST)
Received: from jp-linux.Home ([2001:8a0:f59c:a900:4a3c:13be:a1c0:7b9f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ff0b2sm11117030f8f.42.2026.01.07.08.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 08:29:29 -0800 (PST)
From: joaopeixoto@osyx.tech
To: linux-kernel@vger.kernel.org
Cc: ajd@linux.ibm.com,
	alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	bagasdotme@gmail.com,
	catalin.marinas@arm.com,
	conor+dt@kernel.org,
	corbet@lwn.net,
	dan.j.williams@intel.com,
	davidmcerdeira@osyx.tech,
	devicetree@vger.kernel.org,
	dev@kael-k.io,
	gregkh@linuxfoundation.org,
	haren@linux.ibm.com,
	heiko@sntech.de,
	joaopeixoto@osyx.tech,
	jose@osyx.tech,
	kever.yang@rock-chips.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	maddy@linux.ibm.com,
	mani@kernel.org,
	nathan@kernel.org,
	neil.armstrong@linaro.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	robh@kernel.org,
	will@kernel.org
Subject: [PATCH 1/6] dt-bindings: Add Bao IPC shared memory driver binding
Date: Wed,  7 Jan 2026 16:28:24 +0000
Message-ID: <20260107162829.416885-2-joaopeixoto@osyx.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107162829.416885-1-joaopeixoto@osyx.tech>
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-1-joaopeixoto@osyx.tech>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_082932_375597_F898E2E9 
X-CRM114-Status: GOOD (  14.30  )
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

RnJvbTogSm/Do28gUGVpeG90byA8am9hb3BlaXhvdG9Ab3N5eC50ZWNoPgoKVGhpcyBwYXRjaCBp
bnRyb2R1Y2VzIGEgZGV2aWNlIHRyZWUgYmluZGluZyBmb3IgdGhlIEJhbyBJUEMgU2hhcmVkIE1l
bW9yeQpkZXZpY2UsIHdoaWNoIGVuYWJsZXMgY29tbXVuaWNhdGlvbiBiZXR3ZWVuIEJhbyBoeXBl
cnZpc29yIGd1ZXN0cyB0aHJvdWdoCmRlZGljYXRlZCBzaGFyZWQtbWVtb3J5IHJlZ2lvbnMuCgpT
aWduZWQtb2ZmLWJ5OiBKb8OjbyBQZWl4b3RvIDxqb2FvcGVpeG90b0Bvc3l4LnRlY2g+Ci0tLQog
Li4uL2RldmljZXRyZWUvYmluZGluZ3MvYmFvL2JhbyxpcGNzaG1lbS55YW1sIHwgODIgKysrKysr
KysrKysrKysrKysrKwogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlh
bWwgIHwgIDIgKwogMiBmaWxlcyBjaGFuZ2VkLCA4NCBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Jhby9iYW8saXBjc2ht
ZW0ueWFtbAoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9i
YW8vYmFvLGlwY3NobWVtLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
YmFvL2JhbyxpcGNzaG1lbS55YW1sCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAw
MDAwMC4uZmE5MTgwMGRiOTlhCi0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Jhby9iYW8saXBjc2htZW0ueWFtbApAQCAtMCwwICsxLDgyIEBACisj
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlCisl
WUFNTCAxLjIKKy0tLQorJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9iYW8vYmFv
LGlwY3NobWVtLnlhbWwjCiskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hl
bWFzL2NvcmUueWFtbCMKKwordGl0bGU6IEJhbyBJUEMgU2hhcmVkIE1lbW9yeSBEZXZpY2UKKwor
bWFpbnRhaW5lcnM6CisgIC0gSm9zw6kgTWFydGlucyA8am9zZUBvc3l4LnRlY2g+CisgIC0gRGF2
aWQgQ2VyZGVpcmEgPGRhdmlkbWNlcmRlaXJhQG9zeXgudGVjaD4KKyAgLSBKb8OjbyBQZWl4b3Rv
IDxqb2FvcGVpeG90b0Bvc3l4LnRlY2g+CisKK2Rlc2NyaXB0aW9uOiB8CisgIFNoYXJlZCBtZW1v
cnkgYmFzZWQgY29tbXVuaWNhdGlvbiBkZXZpY2UgZm9yIEJhbyBoeXBlcnZpc29yIGd1ZXN0cy4K
KworICBUaGUgZGV2aWNlIGRlc2NyaWJlcyBhIHNldCBvZiBzaGFyZWQtbWVtb3J5IHJlZ2lvbnMg
dXNlZCBmb3IKKyAgY29tbXVuaWNhdGlvbiBiZXR3ZWVuIEJhbyBndWVzdHMuIEVhY2ggZ3Vlc3Qg
aW5zdGFudGlhdGluZyB0aGlzCisgIGRldmljZSB1c2VzIG9uZSByZWdpb24gZm9yIHJlYWRpbmcg
ZGF0YSBwcm9kdWNlZCBieSBhIHBlZXIgZ3Vlc3QKKyAgYW5kIGFub3RoZXIgcmVnaW9uIGZvciB3
cml0aW5nIGRhdGEgY29uc3VtZWQgYnkgdGhhdCBwZWVyLgorCitwcm9wZXJ0aWVzOgorICBjb21w
YXRpYmxlOgorICAgIGNvbnN0OiBiYW8saXBjc2htZW0KKworICByZWc6CisgICAgZGVzY3JpcHRp
b246CisgICAgICBTaGFyZWQgbWVtb3J5IHJlZ2lvbiB1c2VkIGZvciBJUEMuCisgICAgbWluSXRl
bXM6IDIKKyAgICBtYXhJdGVtczogMgorCisgIHJlYWQtY2hhbm5lbDoKKyAgICBkZXNjcmlwdGlv
bjogfAorICAgICAgU2hhcmVkLW1lbW9yeSBzdWItcmVnaW9uIHRoYXQgdGhpcyBndWVzdCByZWFk
cyBmcm9tLgorCisgICAgICBUaGlzIHJlZ2lvbiBpcyB3cml0dGVuIGJ5IHRoZSBwZWVyIEJhbyBn
dWVzdCBhbmQgcmVhZCBieSB0aGUKKyAgICAgIGd1ZXN0IGluc3RhbnRpYXRpbmcgdGhpcyBkZXZp
Y2UuCisKKyAgICAgIENvbnNpc3RzIG9mIHR3byBjZWxsczoKKyAgICAgICAgLSBvZmZzZXQgaW50
byB0aGUgc2hhcmVkLW1lbW9yeSByZWdpb24gZGVmaW5lZCBieSBgcmVnYAorICAgICAgICAtIHNp
emUgaW4gYnl0ZXMKKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91
aW50MzItYXJyYXkKKyAgICBtaW5JdGVtczogMgorICAgIG1heEl0ZW1zOiAyCisKKyAgd3JpdGUt
Y2hhbm5lbDoKKyAgICBkZXNjcmlwdGlvbjogfAorICAgICAgU2hhcmVkLW1lbW9yeSBzdWItcmVn
aW9uIHRoYXQgdGhpcyBndWVzdCB3cml0ZXMgdG8uCisKKyAgICAgIFRoaXMgcmVnaW9uIGlzIHdy
aXR0ZW4gYnkgdGhlIGd1ZXN0IGluc3RhbnRpYXRpbmcgdGhpcyBkZXZpY2UgYW5kCisgICAgICBy
ZWFkIGJ5IHRoZSBwZWVyIEJhbyBndWVzdC4KKworICAgICAgQ29uc2lzdHMgb2YgdHdvIGNlbGxz
OgorICAgICAgICAtIG9mZnNldCBpbnRvIHRoZSBzaGFyZWQtbWVtb3J5IHJlZ2lvbiBkZWZpbmVk
IGJ5IGByZWdgCisgICAgICAgIC0gc2l6ZSBpbiBieXRlcworICAgICRyZWY6IC9zY2hlbWFzL3R5
cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMi1hcnJheQorICAgIG1pbkl0ZW1zOiAyCisgICAg
bWF4SXRlbXM6IDIKKworICBpZDoKKyAgICBkZXNjcmlwdGlvbjoKKyAgICAgIERyaXZlciBpbnN0
YW5jZSBJRC4KKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50
MzIKKworcmVxdWlyZWQ6CisgIC0gY29tcGF0aWJsZQorICAtIHJlZworICAtIHJlYWQtY2hhbm5l
bAorICAtIHdyaXRlLWNoYW5uZWwKKyAgLSBpZAorCithZGRpdGlvbmFsUHJvcGVydGllczogZmFs
c2UKKworZXhhbXBsZXM6CisgIC0gfAorICAgIGJhby1pcGNAZjAwMDAwMDAgeworICAgICAgICBj
b21wYXRpYmxlID0gImJhbyxpcGNzaG1lbSI7CisgICAgICAgIHJlZyA9IDwweDAgMHhmMDAwMDAw
MCAweDAgMHgwMDAxMDAwMD47CisgICAgICAgIHJlYWQtY2hhbm5lbCA9IDwweDAgMHgyMDAwPjsK
KyAgICAgICAgd3JpdGUtY2hhbm5lbCA9IDwweDIwMDAgMHgyMDAwPjsKKyAgICAgICAgaWQgPSA8
MD47CisgICAgfTsKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy92ZW5kb3ItcHJlZml4ZXMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy92ZW5kb3ItcHJlZml4ZXMueWFtbAppbmRleCBjNzU5MWIyYWVjMmEuLmMwNDdmYmQ2YjkxYSAx
MDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVm
aXhlcy55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3It
cHJlZml4ZXMueWFtbApAQCAtMjIzLDYgKzIyMyw4IEBAIHBhdHRlcm5Qcm9wZXJ0aWVzOgogICAg
IGRlc2NyaXB0aW9uOiBTaGVuemhlbiBBWlcgVGVjaG5vbG9neSBDby4sIEx0ZC4KICAgIl5iYWlr
YWwsLioiOgogICAgIGRlc2NyaXB0aW9uOiBCQUlLQUwgRUxFQ1RST05JQ1MsIEpTQworICAiXmJh
bywuKiI6CisgICAgZGVzY3JpcHRpb246IEJhbyBIeXBlcnZpc29yCiAgICJeYmFuYW5hcGksLioi
OgogICAgIGRlc2NyaXB0aW9uOiBCSVBBSSBLRUpJIExJTUlURUQKICAgIl5iZWFjb24sLioiOgot
LSAKMi40My4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
