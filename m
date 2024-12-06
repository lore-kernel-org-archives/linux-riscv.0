Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B77CE77173
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Dec 2024 16:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1f9q1nIBXTuZ+DlIOeesNeATrswUN9HnqFSL3fgEP0Y=; b=kQ0nWG+0LxSWBi
	j0QyqTlUiMbs+rsKPHXHx+bTdxn81pno+uLROcgJI+aDw5u2F8oQBCcFaoVs8RHTEZp4vuDiPZX+C
	lZnup4BlXcoOhD7fJ4rG2HiGE7SY3DpzL4DDcjtTL3haT7J4KCEG2RDYoWoapp2tvT0LhfWnieb7k
	LZDW8kKCO3dpUbQ1XuEu/aW/kHLoXBEsaEqEIv+QKDWswnR0P8XdiysJQfL6TCC7U/vqQm1Yi45TY
	qTLi1fMjjVs9gf8obPU0giACUFnjyI9GoXjiOSvjR4mpXW2fDcuNbiJawZZqz2VEuykFgCzjQuQcF
	g+cR2rzP++BujgGKYyng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJbMR-00000002CYz-2mxS;
	Fri, 06 Dec 2024 16:39:23 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJbEU-00000002AIX-2jx0
	for linux-riscv@lists.infradead.org;
	Fri, 06 Dec 2024 16:31:12 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3862a921123so731779f8f.3
        for <linux-riscv@lists.infradead.org>; Fri, 06 Dec 2024 08:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1733502668; x=1734107468; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=40IeoncDegwdvePviQ9Ac1q99emn7vMhde6cXPhiSAU=;
        b=Oz+8D5pHjd/SxODqn5J2Gp0qmfHFM8eYkwJOtWKa5nXCkwefdLUH/71+SG67yHqNM2
         KxS4Qzdsq/E9AD2E0vIfRjyb4ctTkwh17amvWX9YapNmXN5zoxAZtximUiAPzivFxorc
         tfH6cCu7/qzOAEPRfv4x9E4wovffJWOXgMe83Ap71BsUFiaCsRKU5kdmYfr8oUEpGJGX
         QSkWiKelARSQe2MWQ3tgDYiILnuT3mMPFZLZhImxldupz9bTTJ2z0AWPzVp59Q7fAkGo
         4Mi16VYFutayMk2HygPjwpmCKtfHN6RCaHObNPZV7+qQ9XW07cfYMvM54XbJ80nn5MoP
         UMww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733502668; x=1734107468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=40IeoncDegwdvePviQ9Ac1q99emn7vMhde6cXPhiSAU=;
        b=X1F9r2pVXALJdXv8Fs9SU4gaL1sWm5j0LV4uui0PzYphFv+iIkn45cqkfIQBoCxd/a
         eVQ3lK68jSjIowy+DiGdX1N44BqokFKeLE37M6dsrxd1UHmVkg2SocDsJQqEkf7eFF1c
         /xzc9JTl9eZOWei3oKflYVmcbiiLMkZAkkMd9AEAQOlPeQgoNuEiGByb2stOdPzU3w7b
         cfvFIuzWqGMe3GDb2eLufqLlS1RjecBg98eBglGjSBF+v57EhVIWXox/WS8RoqR0H+hu
         FEHXzU3CREvkh4Ml6IIjpFbVAmN0Mn2Vbhsk3WkOv9aAPBMYGNrR8gpcirXCvFxj1T9y
         24Uw==
X-Forwarded-Encrypted: i=1; AJvYcCXsMXV7Ani+64ShpCWpkLfNg+ioF46XIrVgjg+DGrtwC07Vwe7xdHmvkUKOX3NrA0Y8QhqexQKk5V0k4A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxISEVu/Zkg1pHyI80C5AE5x+Fqji/amNqqR/vxO7kcN1BOM408
	mxK5f2RD00t+vZpEWqI49fy0N3Jc12hQ+zJ1PU2pN3gXJe4MnOAGXHt5x0rDUhk=
X-Gm-Gg: ASbGncsC9C1MYW3Wz2RTWVRvpOvqB8SUZ9RZ9tWoZ54oS4uol8jdnY0zTFBtyrrQfZv
	cO8ddnCnlQOsUlRamkvULiIzdqtfr1G+yfSezVexEoQ1Dvn57sm32S1fL0wTxmhLRlWBkv3v+B6
	3O/QHRY5apsNyq8JrFWZGOmI9RjA3J+ZRJbwYXJvgmiw0cgwEa7mqs79QGEjYM4pZTuiL2vLECP
	oSjHlIuvCTNQ2VJCkx3iMadp3iMhYs3o9UI77ydeB6x1GI3nsI=
X-Google-Smtp-Source: AGHT+IHAkbc/dcGz/MjNU6vQq8UGceABhupZgIW1uIKLdzsf3QUJS33oSh5p4cBX6H9+RneNbzUK4A==
X-Received: by 2002:a5d:59a3:0:b0:385:dffb:4d66 with SMTP id ffacd0b85a97d-3862b36a491mr2894353f8f.17.1733502668076;
        Fri, 06 Dec 2024 08:31:08 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3862f02f5c3sm1151942f8f.65.2024.12.06.08.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 08:31:07 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Xu Lu <luxu.kernel@bytedance.com>,
	Atish Patra <atishp@atishpatra.org>
Subject: [PATCH v3 0/4] riscv: add support for SBI Supervisor Software Events
Date: Fri,  6 Dec 2024 17:30:56 +0100
Message-ID: <20241206163102.843505-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_083110_951426_B61D2336 
X-CRM114-Status: GOOD (  21.11  )
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

VGhlIFNCSSBTdXBlcnZpc29yIFNvZnR3YXJlIEV2ZW50cyAoU1NFKSBleHRlbnNpb25zIHByb3Zp
ZGVzIGEgbWVjaGFuaXNtCnRvIGluamVjdCBzb2Z0d2FyZSBldmVudHMgZnJvbSBhbiBTQkkgaW1w
bGVtZW50YXRpb24gdG8gc3VwZXJ2aXNvcgpzb2Z0d2FyZSBzdWNoIHRoYXQgaXQgcHJlZW1wdHMg
YWxsIG90aGVyIHN1cGVydmlzb3IgbGV2ZWwgdHJhcHMgYW5kCmludGVycnVwdHMuIFRoaXMgc3Bl
Y2lmaWNhdGlvbiBpcyBpbnRyb2R1Y2VkIGJ5IHRoZSBTQkkgdjMuMApzcGVjaWZpY2F0aW9uWzFd
LgoKVmFyaW91cyBldmVudHMgYXJlIGRlZmluZWQgYW5kIGNhbiBiZSBzZW5kIGFzeW5jaHJvbm91
c2x5IHRvIHN1cGVydmlzb3IKc29mdHdhcmUgKFJBUywgUE1VLCBERUJVRywgQXN5bmNocm9ub3Vz
IHBhZ2UgZmF1bHQpIGZyb20gU0JJIGFzIHdlbGwKYXMgcGxhdGZvcm0gc3BlY2lmaWMgZXZlbnRz
LiBFdmVudHMgY2FuIGJlIGVpdGhlciBsb2NhbCAocGVyLWhhcnQpIG9yCmdsb2JhbC4gRXZlbnRz
IGNhbiBiZSBuZXN0ZWQgb24gdG9wIG9mIGVhY2ggb3RoZXIgYmFzZWQgb24gcHJpb3JpdHkgYW5k
CmNhbiBpbnRlcnJ1cHQgdGhlIGtlcm5lbCBhdCBhbnkgdGltZS4KCkZpcnN0IHBhdGNoIGFkZHMg
dGhlIFNTRSBkZWZpbml0aW9ucy4gU2Vjb25kIG9uZSBhZGRzIHN1cHBvcnQgZm9yIFNTRQphdCBh
cmNoIGxldmVsIChlbnRyeSBjb2RlIGFuZCBzdGFjayBhbGxvY2F0aW9ucykgYW5kIHRoaXJkIG9u
ZSBhdCBkcml2ZXIKbGV2ZWwuIEZpbmFsbHksIHRoZSBsYXN0IHBhdGNoIGFkZCBzdXBwb3J0IGZv
ciBTU0UgZXZlbnRzIGluIHRoZSBTQkkgUE1VCmRyaXZlci4gQWRkaXRpb25hbCB0ZXN0aW5nIGZv
ciB0aGF0IHBhcnQgaXMgaGlnaGx5IHdlbGNvbWVkIHNpbmNlIHRoZXJlCmFyZSBhIGxvdCBvZiBw
b3NzaWJsZSBwYXRoIHRoYXQgbmVlZHMgdG8gYmUgZXhlcmNpc2VkLgoKQW1vbmdzdCB0aGUgc3Bl
Y2lmaWMgcG9pbnRzIHRoYXQgbmVlZHMgdG8gYmUgaGFuZGxlIGlzIHRoZSBpbnRlcnJ1cHRpb24K
YXQgYW55IHBvaW50IG9mIHRoZSBrZXJuZWwgZXhlY3V0aW9uIGFuZCBtb3JlIHNwZWNpZmljYWxs
eSBhdCB0aGUKYmVnZ2luaW5nIG9mIGV4Y2VwdGlvbiBoYW5kbGluZy4gRHVlIHRvIHRoZSBmYWN0
IHRoYXQgdGhlIGV4Y2VwdGlvbiBlbnRyeQppbXBsZW1lbnRhdGlvbiB1c2VzIHRoZSBTQ1JBVENI
IENTUiBhcyBib3RoIHRoZSBjdXJyZW50IHRhc2sgc3RydWN0IGFuZAphcyB0aGUgdGVtcG9yYXJ5
IHJlZ2lzdGVyIHRvIHN3aXRjaCB0aGUgc3RhY2sgYW5kIHNhdmUgcmVnaXN0ZXIsIGl0IGlzCmRp
ZmZpY3VsdCB0byByZWxpYWJseSBnZXQgdGhlIGN1cnJlbnQgdGFzayBzdHJ1Y3QgaWYgd2UgZ2V0
IGludGVycnVwdGVkCmF0IHRoaXMgc3BlY2lmaWMgbW9tZW50IChpZSwgaXQgbWlnaHQgY29udGFp
biAwLCB0aGUgdGFzayBwb2ludGVyIG9yIHRwKS4KQSBmaXh1cC1saWtlIG1lY2hhbmlzbSBpcyBu
b3QgcG9zc2libGUgZHVlIHRvIHRoZSBuZXN0ZWQgbmF0dXJlIG9mIFNTRQp3aGljaCBtYWtlcyBp
dCByZWFsbHkgaGFyZCB0byBvYnRhaW4gdGhlIG9yaWdpbmFsIGludGVycnVwdGlvbiBzaXRlLiBJ
bgpvcmRlciB0byByZXRyaWV2ZSB0aGUgdGFzayBpbiBhIHJlbGlhYmxlIG1hbmVlciwgYWRkIGFu
IGFkZGl0aW9uYWwKX19zc2VfZW50cnlfdGFzayBwZXJfY3B1IGFycmF5IHdoaWNoIHN0b3JlcyB0
aGUgY3VycmVudCB0YXNrLiBJZGVhbGx5LAp3ZSB3b3VsZCBuZWVkIHRvIG1vZGlmeSB0aGUgd2F5
IHdlIHJldHJpZXZlL3N0b3JlIHRoZSBjdXJyZW50IHRhc2sgaW4KZXhjZXB0aW9uIGhhbmRsaW5n
IHNvIHRoYXQgaXQgZG9lcyBub3QgZGVwZW5kIG9uIHRoZSBwbGFjZSB3aGVyZSBpdCdzCmludGVy
cnVwdGVkLgoKQ29udHJhcnkgdG8gcHNldWRvIE5NSSBbMl0sIFNTRSBkb2VzIG5vdCBtb2RpZmll
cyB0aGUgd2F5IGludGVycnVwdHMgYXJlCmhhbmRsZWQgYW5kIGRvZXMgbm90IGFkZHMgYW55IG92
ZXJoZWFkIHRvIGV4aXN0aW5nIGNvZGUuIE1vcmVvdmVyLCBpdApwcm92aWRlcyAidHJ1ZSIgTk1J
LWxpa2UgaW50ZXJydXB0cyB3aGljaCBjYW4gaW50ZXJydXB0IHRoZSBrZXJuZWwgYXQKYW55IHRp
bWUgKGV2ZW4gaW4gZXhjZXB0aW9uIGhhbmRsaW5nKS4gVGhpcyBpcyBwYXJ0aWN1bGFybHkgY3J1
Y2lhbCBmb3IKUkFTIGVycm9ycyB3aGljaCBuZWVkcyB0byBiZSBoYW5kbGVkIGFzIGZhc3QgYXMg
cG9zc2libGUgdG8gYXZvaWQgYW55CmZhdWx0IHByb3BhZ2F0aW9uLgoKT3BlblNCSSBTU0Ugc3Vw
cG9ydCBpcyBhbHJlYWR5IHVwc3RyZWFtLgoKTGluazogaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2
LW5vbi1pc2EvcmlzY3Ytc2JpLWRvYy9yZWxlYXNlcy9kb3dubG9hZC92djMuMC1yYzIvcmlzY3Yt
c2JpLnBkZiBbMV0KCi0tLQoKQ2hhbmdlcyBpbiB2MzoKIC0gU3BsaXQgYXJjaC9kcml2ZXIgc3Vw
cG9ydAogLSBGaXggcG90ZW50aWFsIHJlZ2lzdGVyIGZhaWx1cmUgcmVwb3J0aW5nCiAtIFNldCBh
IGZldyBwcl9lcnIgYXMgcHJfZGVidWcKIC0gQWxsb3cgQ09ORklHX1JJU0NWX1NTRSB0byBiZSBk
aXNhYmxlZAogLSBGaXggYnVpbGQgd2l0aG91dCBDT05GSUdfUklTQ1ZfU1NFCiAtIFJlbW92ZSBm
aXh1cC1saWtlIG1lY2hhbmlzbSBhbmQgdXNlIGEgcGVyLWNwdSBhcnJheQogLSBGaXhlZCBTU0NS
QVRDSCBiZWluZyBjb3JydXB0ZWQgd2hlbiBpbnRlcnJ1cHRpbmcgdGhlIGtlcm5lbCBpbiBlYXJs
eQogICBleGNlcHRpb24gcGF0aC4KIC0gU3BsaXQgU1NFIGFzc2VtYmx5IGZyb20gZW50cnkuUwog
LSBBZGQgSGltYW5jaHUgU1NFIG1hc2svdW5tYXNrIGFuZCBydW50aW1lIFBNIHN1cHBvcnQuCiAt
IERpc2FibGUgdXNlciBtZW1vcnkgYWNjZXNzL2Zsb2F0aW5nIHBvaW50L3ZlY3RvciBpbiBTU0Ug
aGFuZGxlcgogLSBSZWJhc2VkIG9uIG1hc3RlcgoKdjI6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xpbnV4LXJpc2N2LzIwMjQwMTEyMTExNzIwLjI5NzUwNjktMS1jbGVnZXJAcml2b3NpbmMuY29t
LwoKQ2hhbmdlcyBpbiB2MjoKIC0gSW1wbGVtZW50ZWQgc3BlY2lmaWNhdGlvbiB2MgogLSBGaXgg
dmFyaW91cyBlcnJvciBoYW5kbGluZyBjYXNlcwogLSBBZGRlZCBzaGFkb3cgc3RhY2sgc3VwcG9y
dAoKdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjMxMDI2MTQzMTIy
LjI3OTQzNy0xLWNsZWdlckByaXZvc2luYy5jb20vCgpDbMOpbWVudCBMw6lnZXIgKDQpOgogIHJp
c2N2OiBhZGQgU0JJIFNTRSBleHRlbnNpb24gZGVmaW5pdGlvbnMKICByaXNjdjogYWRkIHN1cHBv
cnQgZm9yIFNCSSBTdXBlcnZpc29yIFNvZnR3YXJlIEV2ZW50cyBleHRlbnNpb24KICBkcml2ZXJz
OiBmaXJtd2FyZTogYWRkIHJpc2N2IFNTRSBzdXBwb3J0CiAgcGVyZjogUklTQy1WOiBhZGQgc3Vw
cG9ydCBmb3IgU1NFIGV2ZW50CgogTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgIDE0ICsKIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vYXNtLmggICAgICAgICB8ICAxNCArLQog
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaCAgICAgICAgIHwgIDYyICsrKwogYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9zY3MuaCAgICAgICAgIHwgICA3ICsKIGFyY2gvcmlzY3YvaW5jbHVkZS9h
c20vc3NlLmggICAgICAgICB8ICAzOCArKwogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zd2l0Y2hf
dG8uaCAgIHwgIDE0ICsKIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGhyZWFkX2luZm8uaCB8ICAg
MSArCiBhcmNoL3Jpc2N2L2tlcm5lbC9NYWtlZmlsZSAgICAgICAgICAgfCAgIDEgKwogYXJjaC9y
aXNjdi9rZXJuZWwvYXNtLW9mZnNldHMuYyAgICAgIHwgIDEyICsKIGFyY2gvcmlzY3Yva2VybmVs
L3NzZS5jICAgICAgICAgICAgICB8IDEzNCArKysrKysKIGFyY2gvcmlzY3Yva2VybmVsL3NzZV9l
bnRyeS5TICAgICAgICB8IDE3MSArKysrKysrCiBkcml2ZXJzL2Zpcm13YXJlL0tjb25maWcgICAg
ICAgICAgICAgfCAgIDEgKwogZHJpdmVycy9maXJtd2FyZS9NYWtlZmlsZSAgICAgICAgICAgIHwg
ICAxICsKIGRyaXZlcnMvZmlybXdhcmUvcmlzY3YvS2NvbmZpZyAgICAgICB8ICAxNSArCiBkcml2
ZXJzL2Zpcm13YXJlL3Jpc2N2L01ha2VmaWxlICAgICAgfCAgIDMgKwogZHJpdmVycy9maXJtd2Fy
ZS9yaXNjdi9yaXNjdl9zc2UuYyAgIHwgNjkxICsrKysrKysrKysrKysrKysrKysrKysrKysrKwog
ZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYyAgICAgICAgIHwgIDUxICstCiBpbmNsdWRlL2xp
bnV4L3Jpc2N2X3NzZS5oICAgICAgICAgICAgfCAgNTYgKysrCiAxOCBmaWxlcyBjaGFuZ2VkLCAx
MjczIGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGFy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vc3NlLmgKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2
L2tlcm5lbC9zc2UuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3Yva2VybmVsL3NzZV9l
bnRyeS5TCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9maXJtd2FyZS9yaXNjdi9LY29uZmln
CiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9maXJtd2FyZS9yaXNjdi9NYWtlZmlsZQogY3Jl
YXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZmlybXdhcmUvcmlzY3YvcmlzY3Zfc3NlLmMKIGNyZWF0
ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2xpbnV4L3Jpc2N2X3NzZS5oCgotLSAKMi40NS4yCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
