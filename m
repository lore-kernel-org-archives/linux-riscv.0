Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F9BD5E154
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Dec 2025 13:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MRmiCfaHepK0qWP4KzmjsFVuW+j0N9sAOEnnGgaQHDc=; b=WurnaN1wAYRHtR
	3ewNyxm1gxOoiqrR12ODRY+qMukSnH1cJZaUy4eN3qqmwjosyrhZEduMYeZAxSNvnx4myjefTFVuD
	FEiG7lzMbz+XMgmTlKIWtv8Vua2kXEVJMx7I+lryL44593AXZq51oQQJyzpeV/Qg8FK7UZUa1Jk+D
	J1hJw1CRZqrd8Aqx0L8hDB0VrouWntCHAxyHGTTVYDzvhVu45qsaFIKhhphnZDYcronP4DfmBSYlk
	SaL0lXvXlRWD7lCQJSURsBNuwZ7SQpvuPX5bZqabM1xgB/wih1O5Q9tWVpbr3romW+nrqITWYn4LT
	KCYhUiuQU2r+YvxTxOeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVVAf-00000005GVY-38K5;
	Tue, 16 Dec 2025 13:32:57 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVVAc-00000005GUW-37tA
	for linux-riscv@lists.infradead.org;
	Tue, 16 Dec 2025 13:32:56 +0000
Received: by mail-pl1-x641.google.com with SMTP id d9443c01a7336-2a07f8dd9cdso32565615ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 16 Dec 2025 05:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1765891974; x=1766496774; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g/JfJQXcFgX18niVnHrsIFrsFHpq0fWX7xoHVIFhehA=;
        b=BH//tusXtAxyNmt2ODWfV4baEfnnlyj+ULmS8xwZQjjAqSwD37gQc2AqpcCY4HKc99
         NRyvRGUARTPb7LXYmkJgXZekoQDxc5Cr1UrFU44+vPOzR23IUEcqYf5DtAsp/f4PZi1m
         3xTr6MEzBoRY2Zu1byykIyt825u6jIZJ6SzXMaqu3W3R3XmyRR8Ybmt43QLP2My7p8DD
         sxS9SP8jYkfcLGq3Kl84jEto6bk/CKInAslC7xdVq6Nsx8567MkeRMk1zmOzFX60y1D4
         BIzPrg1YSEpJPo2m28jC3JEWtMqaOD4IfxNdZotij1fTwqWjmnAeZaeVEhdiWZnkieGn
         astA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765891974; x=1766496774;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g/JfJQXcFgX18niVnHrsIFrsFHpq0fWX7xoHVIFhehA=;
        b=sZwYRhPXyZ17/yYYqfzgdhGWMDYIPMmf9SAvSOVIVtpktAAEOxOggqI0M4lN4qrrpn
         /xA/gpInQICqXTb0J81TKzFx0oqx28S/vGtTnE4w+k/c7EsnWOT63K2WEXxlApXKS5Ir
         7I8x+xSR1dKVNow5uJyuX7xt0Q3VFmtdQsGN1fqUZ5M5L4CuNC92BBC+3H0PhdemCQ5u
         a9Xy8ucRfGqLVN0DIZFIeZpERM9M8VWFDFFprppDLrDsL3WCLf2Kl8ZZ1wRDReFvAQ+O
         u4bG+VRHVVr6I4VhQz6VYq5GO9zLyJq4smpLQQ1tD4whRZxO7aJhNnVWL63s9iNwpbll
         LSqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZ0NATYEVNhdcPejdzZ/R4STHGjgPuAJx0gWQwHiWKwMjGKP0nRSyOpw3iSF3IOPMqPs+b6BI5gTkrEg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxz+Wttsvlaj+wrICeAjikQop/qt2tCAH0+Nby0EDCudfi7TQP6
	ucv0Sggc5Y2lyKWZ2Y44Kje16+gvVtVRtzX5qIKYAUOd4Ef0sOeSmGvqidj9hC9U3oc=
X-Gm-Gg: AY/fxX4Ji00Jx+KeKxbIKkUSANNufUZQx/PX0Ftc0iMYDoIaoZfv6SPbR0zRfl2r0kT
	fBZX+4bTlzzR2K6LPHGS0bxcdKuz5U0Bw/FtBhJDWqlN4yccfWW3gk7sgrF8WwUQEFghJ6SzblI
	Pc77oDrL+SAUWadoltXNd8PFSM0jOArJqc3i5lup5kB0Vt6bDqlcjWFdatCg1ezFlsZbwO7zsER
	a2inVg2rYRmgDskr1VBt3q4Y8s7jEVyFjuPiwmesqYmB7bB9RJEHjHisVKkRfA4gdSPRCHMqAJI
	2C7y92y6gFqoQMEADmMYCrquZcAZ3q80F/E3WoxOPD9TinAEDiPGC+5Jb+UTsbyGj6PW75SqNV5
	YfE3seqmdFPuhP4v7IErxCbt6ejhovwhr2x2ioO8VzrpjIjPe71GM3lZEA6V9lKEzAr72k89i+t
	TdZ5xPrdcmr8nJFnA8byTLK4/joAz4DtpyPbhj58o9yQ==
X-Google-Smtp-Source: AGHT+IHT8YPzl6f7Pnw8yu1d9OLksn7u1Cax08hiwcjf1bsYEfnVPO1K1qwPGMHdLgZugryriieEFw==
X-Received: by 2002:a17:902:ea0c:b0:2a0:f47c:cfc with SMTP id d9443c01a7336-2a0f47c0e76mr73502685ad.34.1765891973637;
        Tue, 16 Dec 2025 05:32:53 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::4029])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a14625add8sm15829525ad.61.2025.12.16.05.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 05:32:53 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Subject: [PATCH 0/8] riscv: spacemit: Add SpacemiT K3 SoC and K3 Pico-ITX
 board
Date: Tue, 16 Dec 2025 21:32:24 +0800
Message-Id: <20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGhfQWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDI0Mz3Wxj3aTE4sxk3ZQS3eQUS1MTAwMzQ0sLSyWgjoKi1LTMCrBp0bG
 1tQC0HgM4XQAAAA==
X-Change-ID: 20251216-k3-basic-dt-cd9540061989
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 Yangyu Chen <cyy@cyyself.name>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 Heinrich Schuchardt <xypron.glpk@gmx.de>, 
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-serial@vger.kernel.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_053255_081204_B7293C66 
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

VGhpcyBzZXJpZXMgaW50cm9kdWNlcyBiYXNpYyBzdXBwb3J0IGZvciB0aGUgU3BhY2VtaVQgSzMg
U29DIGFuZCB0aGUKSzMgUGljby1JVFggZXZhbHVhdGlvbiBib2FyZC4KClRoZSBTcGFjZW1pVCBL
MyBpcyBhbiBTb0MgZmVhdHVyaW5nIDggU3BhY2VtaVQgWDEwMCBSSVNDLVYgY29yZXMuClRoZSBY
MTAwIGlzIGEgNC1pc3N1ZSwgb3V0LW9mLW9yZGVyIGNvcmUgY29tcGxpYW50IHdpdGggdGhlIFJW
QTIzCnByb2ZpbGUsIHRhcmdldGluZyBoaWdoLXBlcmZvcm1hbmNlIHNjZW5hcmlvcy4gWzFdCgpU
aGUgSzMgUGljby1JVFggaXMgYW4gZXZhbHVhdGlvbiBib2FyZCBidWlsdCBhcm91bmQgdGhlIEsz
IFNvQy4KClRoaXMgc2VyaWVzIGluY2x1ZGVzOgogLSBEVCBiaW5kaW5ncyBmb3IgU3BhY2VtaVQg
WDEwMCBjb3JlLCBLMyBTb0MsIGFuZCBQaWNvLUlUWCBib2FyZC4KIC0gRFQgYmluZGluZ3MgZm9y
IEszIGludGVncmF0ZWQgcGVyaXBoZXJhbHM6IENMSU5ULCBBUExJQywgSU1TSUMsIGFuZCBVQVJU
LgogLSBJbml0aWFsIERldmljZSBUcmVlIGZvciBLMyBTb0MgYW5kIFBpY28tSVRYIGJvYXJkLgoK
RnJvbSBhbiBSVkEyMyBwcm9maWxlIGNvbXBsaWFuY2UgcGVyc3BlY3RpdmUsIHRoZSBYMTAwIHN1
cHBvcnRzIGFsbAptYW5kYXRvcnkgZXh0ZW5zaW9ucyByZXF1aXJlZCBieSBSVkEyM1U2NCBhbmQg
UlZBMjNTNjQuIElkZWFsbHksIGFsbAp0aGVzZSBleHRlbnNpb25zIHNob3VsZCBiZSBsaXN0ZWQg
aW4gdGhlICdyaXNjdixpc2EtZXh0ZW5zaW9ucycgc3RyaW5nLgpIb3dldmVyLCBzb21lIG1hbmRh
dG9yeSBleHRlbnNpb25zIChlLmcuICJ6aWNjaWYiLCAic3N0dmVjZCIpCmFyZSBub3QgeWV0IHN1
cHBvcnRlZCAobGlzdGVkKSBieSB0aGUgdXBzdHJlYW0gcmlzY3YvZXh0ZW5zaW9ucy55YW1sCmJp
bmRpbmcuCgpUbyBhdm9pZCB2YWxpZGF0aW9uIHdhcm5pbmdzICjigJxVbmV2YWx1YXRlZCBwcm9w
ZXJ0aWVzIGFyZSBub3QgYWxsb3dlZCIKd2hlbiBtYWtlIGR0YnNfY2hlY2sgVz0zKSBhbmQgdG8g
cHJldmVudCB0aGUga2VybmVsIGZyb20gc2lsZW50bHkKZHJvcHBpbmcgdW5yZWNvZ25pemVkIHN0
cmluZ3MsIHRoaXMgc2VyaWVzIG9ubHkgZGVjbGFyZXMgdGhlCmlzYS1leHRlbnNpb25zIHRoYXQg
YXJlIGN1cnJlbnRseSBzdXBwb3J0ZWQgYnkgdGhlIGtlcm5lbCBiaW5kaW5ncy4KCkxpbms6IGh0
dHBzOi8vd3d3LnNwYWNlbWl0LmNvbS9lbi9zcGFjZW1pdC14MTAwLWNvcmUvIFsxXQoKU2lnbmVk
LW9mZi1ieTogR3VvZG9uZyBYdSA8Z3VvZG9uZ0ByaXNjc3Rhci5jb20+Ci0tLQpHdW9kb25nIFh1
ICg4KToKICAgICAgZHQtYmluZGluZ3M6IHJpc2N2OiBhZGQgU3BhY2VtaVQgWDEwMCBDUFUgY29t
cGF0aWJsZQogICAgICBkdC1iaW5kaW5nczogdGltZXI6IGFkZCBTcGFjZW1pVCBLMyBDTElOVAog
ICAgICBkdC1iaW5kaW5nczogaW50ZXJydXB0LWNvbnRyb2xsZXI6IGFkZCBTcGFjZW1pVCBLMyBB
UExJQwogICAgICBkdC1iaW5kaW5nczogaW50ZXJydXB0LWNvbnRyb2xsZXI6IGFkZCBTcGFjZW1p
VCBLMyBJTVNJQwogICAgICBkdC1iaW5kaW5nczogc2VyaWFsOiA4MjUwOiBhZGQgU3BhY2VtaVQg
SzMgVUFSVCBjb21wYXRpYmxlCiAgICAgIGR0LWJpbmRpbmdzOiByaXNjdjogc3BhY2VtaXQ6IGFk
ZCBLMyBhbmQgUGljby1JVFggYm9hcmQgYmluZGluZ3MKICAgICAgcmlzY3Y6IGR0czogc3BhY2Vt
aXQ6IGFkZCBpbml0aWFsIGRldmljZSB0cmVlIG9mIFNwYWNlbWlUIEszIFNvQwogICAgICByaXNj
djogZHRzOiBzcGFjZW1pdDogYWRkIFNwYWNlbWlUIEszIFBpY28tSVRYIGJvYXJkIGRldmljZSB0
cmVlCgogLi4uL2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL3Jpc2N2LGFwbGljLnlhbWwg
fCAgIDEgKwogLi4uL2ludGVycnVwdC1jb250cm9sbGVyL3Jpc2N2LGltc2ljcy55YW1sICAgICAg
ICAgfCAgIDEgKwogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2NwdXMu
eWFtbCAgfCAgIDEgKwogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3Yvc3BhY2VtaXQueWFt
bCAgICAgICAgfCAgIDYgKy0KIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zZXJp
YWwvODI1MC55YW1sIHwgICAxICsKIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RpbWVyL3NpZml2
ZSxjbGludC55YW1sICAgIHwgICAxICsKIGFyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvTWFr
ZWZpbGUgICAgICAgICAgICAgIHwgICAxICsKIGFyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQv
azMtcGljby1pdHguZHRzICAgICAgIHwgIDI1ICsKIGFyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2Vt
aXQvazMuZHRzaSAgICAgICAgICAgICAgIHwgNTI5ICsrKysrKysrKysrKysrKysrKysrKwogOSBm
aWxlcyBjaGFuZ2VkLCA1NjUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQotLS0KYmFzZS1j
b21taXQ6IDhmMGI0Y2NlNDQ4MWZiMjI2NTM2OTdjY2VkOGQwZDA0MDI3Y2IxZTgKY2hhbmdlLWlk
OiAyMDI1MTIxNi1rMy1iYXNpYy1kdC1jZDk1NDAwNjE5ODkKCkJlc3QgcmVnYXJkcywKLS0gCkd1
b2RvbmcgWHUgPGd1b2RvbmdAcmlzY3N0YXIuY29tPgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
