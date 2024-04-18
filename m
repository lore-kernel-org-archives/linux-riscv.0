Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B19C4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 15:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BJOq/s2swcdAaUtNaQACS2q99BaAEkvOU5lSQpzbz0Q=; b=PBCw9uXID+LQLJ
	py+uZcIvOd8bPLGaIXZnBGc/6Toc5DNYoz3Zaaz68CtNbF6nEu/U689B9QKBOaMGHfyXvGGIHwEWk
	rYTctt3Gny0H/mt4cj+GQAuyWcb4UvvY+PLPBQJeJ0J5tNaK1hbX10mxyFhQa5w/ACxAoiIFFAvfe
	1HEy97tAKSRn1L73EzwXhHPUCxxP4VqsinbnXWuxvcI91IYTZlcAvKFgbemJB51xNFcQOkVHzTg0a
	Px5YrY2vHxqr1L7TzESkym7zsoH1TOfINPh88gCQHDI1n9xX0GFPJyTuv9DBlzhi9+jobABB1Jnz3
	ka1OflxLM0dNZnRuRJhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxTjq-00000002nzM-42Py;
	Thu, 18 Apr 2024 15:31:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxSjP-00000002cY4-1zaz
	for linux-riscv@bombadil.infradead.org;
	Thu, 18 Apr 2024 14:27:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=m/abrO6aRdYSwYEiniLJTSjXDsMHpzNjwZUI0bHiQJI=; b=LG6GtYafBkxrgqHArbSmWKcvY/
	SE5uH3zmOC+w8j8WcEdV4u0FvmRHqvnYtqcto1E0ApP9O6Mwnpwz1lPeCJ1XxdrGnYvbsV0J6zVHE
	8UMboMLqjn+bzIF4EKbEZdEsGSt/FESPQaM9KTeq6XmFnkArjjc7uj9ViBlzXpYCfNVAF7kBdf/5R
	x3/9hSW1SU7MFyek+d+LisdEwRItH+eHQrSnYmpcmCrnwQeZnzuqTfuwt6Pm0W2JFUt4Fsm+wuFqw
	y4ZYieJtqoXnB/i+4QF4466jZU9e9z+KwYfQZU2lAcIIdCk/VxKKTEIKqWvLfOzRypPKGbo8/HWrz
	zai7ZBeA==;
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxSjM-0000000C2PM-17cl
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 14:27:18 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-349a35aba9dso167608f8f.3
        for <linux-riscv@lists.infradead.org>; Thu, 18 Apr 2024 07:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713450434; x=1714055234; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m/abrO6aRdYSwYEiniLJTSjXDsMHpzNjwZUI0bHiQJI=;
        b=Uz77sTkw5q9geby3ck94PZzmiOCVVLrWvczIqA+VM2y0X9SkoMgfc3YwgJuTMzRN8+
         9Ly/TiQlukai6hsXhbjorXuNnWeC86gwEEbNaKd9v6RL7pRP/D/TrsG8WpCVfsFz/+CG
         4obNyf085rSi6y9Via9u3apeDfvfsRsGkjr+p3jsJ/xMgvn424bn6ohZA3IhND0sq9aM
         22eZo2E9ZlXGp7djq049zFjMleRcqX4iE4LOn4SlzDPGaaHISNIDdF4thrTqRpou5Er6
         e5246HPTKV4+BRL69ITwv56yle+61M0tHXdiGfmldqkn4Eq3LHxoLDyaZeAzEegdYvS9
         c5qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713450434; x=1714055234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m/abrO6aRdYSwYEiniLJTSjXDsMHpzNjwZUI0bHiQJI=;
        b=MC5lO39xLmnGjWCUUtWu9P52h7LOoF6wPP1vS+YjLujxNqxHyzfGZl4UTvU+gCw3oC
         KKJhXMlEZiL3+u+N+vzo2UP4qQdiTkfv08GH6WFv+uJVnb/HFB8hUH41xKrT/FyonST+
         yoxPqgpd7y+eGFZbX8HaWhnaDd1imoywKS2brAqNUWaEjlbsMFHmEJTkCsNxFJJyUWZj
         guNFTWUqx0L0v3tTTrM5Iz+wMnWpwHEWbyFGFq4KI49RWpfQ1VOUDeQNWD5+KfF+xvBd
         +SNfBHKA/d9YP3HT8fBWQiwf7FOuX4W/7f9HGtHio3iZIsyE1ouOC93IsFLXET7bfftj
         HDdg==
X-Forwarded-Encrypted: i=1; AJvYcCVRAkcUGYLpBL0yHpVjIXCAqEGiSqhvJekJj/5Viy8zhkJ5pSxdHrWqg8fZNsOi+pzzRVbye13Tw2t8kTqXQdaT1zKQkzKcC4TOWyRLKomu
X-Gm-Message-State: AOJu0YwuqHX7mHffwkXhM4G6j7NW2nqqSgQ/S3MTQK7g5QvrRddNXQ3d
	juC98mCg796uCtGTlSagwuXsyBhqVoWHmxMJnBgjVSM6HWQb4/Ky3Yo4y5AdZxs=
X-Google-Smtp-Source: AGHT+IEkGDIAezbeIVZmmrT9rlRCJjcxopA8THm4S/C75RtVNLUvN35X394KK2J0KQ/iPXZ6II3FvA==
X-Received: by 2002:a05:600c:4f8a:b0:418:f770:ba0 with SMTP id n10-20020a05600c4f8a00b00418f7700ba0mr505923wmq.0.1713450434242;
        Thu, 18 Apr 2024 07:27:14 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:7b64:4d1d:16d8:e38b])
        by smtp.gmail.com with ESMTPSA id v10-20020a05600c470a00b00418a386c059sm2873645wmo.42.2024.04.18.07.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 07:27:13 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	Ved Shanbhogue <ved@rivosinc.com>
Subject: [RFC PATCH 4/7] riscv: handle Ssdbltrp mstatus SDT bit
Date: Thu, 18 Apr 2024 16:26:43 +0200
Message-ID: <20240418142701.1493091-5-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240418142701.1493091-1-cleger@rivosinc.com>
References: <20240418142701.1493091-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_152716_426701_08D905F7 
X-CRM114-Status: GOOD (  15.01  )
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

V2hlbiBTc2RibHRycCBpcyBlbmFibGVkLCB3ZSBtdXN0IHRha2UgY2FyZSBvZiBjbGVhcmluZyBT
RFQgYWZ0ZXIKc2Vuc2l0aXZlIHBoYXNlcyBhcmUgb3ZlciB0byBhdm9pZCBnZW5lcmF0aW5nIGEg
ZG91YmxlIHRyYXAuIFRoaXMKaXMgbWFpbmx5IGFib3V0IGV4Y2VwdGlvbnMgaGFuZGxpbmcgc28g
Y2xlYXIgU0RUIG9uY2Ugd2UgaGF2ZQpzYXZlZCBlbm91Z2ggaW5mb3JtYXRpb24gKGNyaXRpY2Fs
IENTUnMpIGJ1dCBhbHNvIGNsZWFycyBpdCBkdXJpbmcgU0FUUAptb2RlIGRldGVjdGlvbiB3aGlj
aCBnZW5lcmF0ZXMgYW4gImlubGluZSIgdHJhcCBhbmQgdGh1cyBzZXRzIFNEVAppbXBsaWNpdGVs
eS4KClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4K
LS0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nzci5oICB8ICAxICsKIGFyY2gvcmlzY3Yva2Vy
bmVsL2VudHJ5LlMgICAgIHwgNTIgKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0K
IGFyY2gvcmlzY3Yva2VybmVsL2hlYWQuUyAgICAgIHwgIDQgKysrCiBhcmNoL3Jpc2N2L2tlcm5l
bC9zc2VfZW50cnkuUyB8ICA0ICstLQogNCBmaWxlcyBjaGFuZ2VkLCAzNyBpbnNlcnRpb25zKCsp
LCAyNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nz
ci5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaAppbmRleCA1NTI4MTU5YjNkNWQuLjkw
NWNkZjg5NGE1NyAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaAorKysg
Yi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nzci5oCkBAIC0xNyw2ICsxNyw3IEBACiAjZGVmaW5l
IFNSX1NQUAkJX0FDKDB4MDAwMDAxMDAsIFVMKSAvKiBQcmV2aW91c2x5IFN1cGVydmlzb3IgKi8K
ICNkZWZpbmUgU1JfTVBQCQlfQUMoMHgwMDAwMTgwMCwgVUwpIC8qIFByZXZpb3VzbHkgTWFjaGlu
ZSAqLwogI2RlZmluZSBTUl9TVU0JCV9BQygweDAwMDQwMDAwLCBVTCkgLyogU3VwZXJ2aXNvciBV
c2VyIE1lbW9yeSBBY2Nlc3MgKi8KKyNkZWZpbmUgU1JfU0RUCQlfQUMoMHgwMTAwMDAwMCwgVUwp
IC8qIFN1cGVydmlzb3IgRG91YmxlIFRyYXAgKi8KIAogI2RlZmluZSBTUl9GUwkJX0FDKDB4MDAw
MDYwMDAsIFVMKSAvKiBGbG9hdGluZy1wb2ludCBTdGF0dXMgKi8KICNkZWZpbmUgU1JfRlNfT0ZG
CV9BQygweDAwMDAwMDAwLCBVTCkKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2VudHJ5
LlMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9lbnRyeS5TCmluZGV4IDE1OTFlMDc4MTU2OS4uMDdkYTkx
MDgwODM5IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9lbnRyeS5TCisrKyBiL2FyY2gv
cmlzY3Yva2VybmVsL2VudHJ5LlMKQEAgLTQ5LDIzICs0OSwxMiBAQCBTWU1fQ09ERV9TVEFSVCho
YW5kbGVfZXhjZXB0aW9uKQogCVJFR19TIHg1LCAgUFRfVDAoc3ApCiAJc2F2ZV9mcm9tX3g2X3Rv
X3gzMQogCi0JLyoKLQkgKiBEaXNhYmxlIHVzZXItbW9kZSBtZW1vcnkgYWNjZXNzIGFzIGl0IHNo
b3VsZCBvbmx5IGJlIHNldCBpbiB0aGUKLQkgKiBhY3R1YWwgdXNlciBjb3B5IHJvdXRpbmVzLgot
CSAqCi0JICogRGlzYWJsZSB0aGUgRlBVL1ZlY3RvciB0byBkZXRlY3QgaWxsZWdhbCB1c2FnZSBv
ZiBmbG9hdGluZyBwb2ludAotCSAqIG9yIHZlY3RvciBpbiBrZXJuZWwgc3BhY2UuCi0JICovCi0J
bGkgdDAsIFNSX1NVTSB8IFNSX0ZTX1ZTCi0KIAlSRUdfTCBzMCwgVEFTS19USV9VU0VSX1NQKHRw
KQotCWNzcnJjIHMxLCBDU1JfU1RBVFVTLCB0MAogCWNzcnIgczIsIENTUl9FUEMKIAljc3JyIHMz
LCBDU1JfVFZBTAogCWNzcnIgczQsIENTUl9DQVVTRQogCWNzcnIgczUsIENTUl9TQ1JBVENICiAJ
UkVHX1MgczAsIFBUX1NQKHNwKQotCVJFR19TIHMxLCBQVF9TVEFUVVMoc3ApCiAJUkVHX1MgczIs
IFBUX0VQQyhzcCkKIAlSRUdfUyBzMywgUFRfQkFEQUREUihzcCkKIAlSRUdfUyBzNCwgUFRfQ0FV
U0Uoc3ApCkBAIC03Nyw2ICs2NiwyMSBAQCBTWU1fQ09ERV9TVEFSVChoYW5kbGVfZXhjZXB0aW9u
KQogCSAqLwogCWNzcncgQ1NSX1NDUkFUQ0gsIHgwCiAKKwkvKgorCSAqIERpc2FibGUgdXNlci1t
b2RlIG1lbW9yeSBhY2Nlc3MgYXMgaXQgc2hvdWxkIG9ubHkgYmUgc2V0IGluIHRoZQorCSAqIGFj
dHVhbCB1c2VyIGNvcHkgcm91dGluZXMuCisJICoKKwkgKiBEaXNhYmxlIHRoZSBGUFUvVmVjdG9y
IHRvIGRldGVjdCBpbGxlZ2FsIHVzYWdlIG9mIGZsb2F0aW5nIHBvaW50CisJICogb3IgdmVjdG9y
IGluIGtlcm5lbCBzcGFjZS4KKwkgKgorCSAqIENsZWFyIHN1cGVydmlzb3IgZG91YmxlIHRyYXAg
Yml0IGFzIGFsbCB0cmFwIGNvbnRleHQgaXMgc2F2ZWQgYW5kIHdlCisJICogY2FuIGhhbmRsZSBh
bm90aGVyIG9uZQorCSAqLworCWxpIHQwLCBTUl9TVU0gfCBTUl9GU19WUyB8IFNSX1NEVAorCisJ
Y3NycmMgczEsIENTUl9TVEFUVVMsIHQwCisJUkVHX1MgczEsIFBUX1NUQVRVUyhzcCkKKwogCS8q
IExvYWQgdGhlIGdsb2JhbCBwb2ludGVyICovCiAJbG9hZF9nbG9iYWxfcG9pbnRlcgogCkBAIC0x
MjMsMTUgKzEyNywyNSBAQCBTWU1fQ09ERV9TVEFSVF9OT0FMSUdOKHJldF9mcm9tX2V4Y2VwdGlv
bikKICNpZmRlZiBDT05GSUdfUklTQ1ZfTV9NT0RFCiAJLyogdGhlIE1QUCB2YWx1ZSBpcyB0b28g
bGFyZ2UgdG8gYmUgdXNlZCBhcyBhbiBpbW1lZGlhdGUgYXJnIGZvciBhZGRpICovCiAJbGkgdDAs
IFNSX01QUAotCWFuZCBzMCwgczAsIHQwCisJYW5kIHQxLCBzMCwgdDAKICNlbHNlCi0JYW5kaSBz
MCwgczAsIFNSX1NQUAorCWFuZGkgdDEsIHMwLCBTUl9TUFAKKyNlbmRpZgorCisjaWZkZWYgQ09O
RklHX1JJU0NWX0lTQV9WX1BSRUVNUFRJVkUKKwltb3ZlIGEwLCBzcAorCWNhbGwgcmlzY3Zfdl9j
b250ZXh0X25lc3RpbmdfZW5kCiAjZW5kaWYKLQlibmV6IHMwLCAxZgorCS8qCisJICogUmVzdG9y
ZSBTVEFUVVMgbm93IHRvIHNldCBzdXBlcnZpc29yIGRvdWJsZSB0cmFwIGJpdCB3aGljaCBtZWFu
cyB0aGF0CisJICogZnJvbSBub3cgb24sIHdlIGNhbiBub3QgaGFuZGxlIGFuIGV4Y2VwdGlvbiB1
cCB0byAic3JldCIKKwkgKi8KKwljc3J3IENTUl9TVEFUVVMsIHMwCisJYm5leiB0MSwgMWYKIAog
CS8qIFNhdmUgdW53b3VuZCBrZXJuZWwgc3RhY2sgcG9pbnRlciBpbiB0aHJlYWRfaW5mbyAqLwot
CWFkZGkgczAsIHNwLCBQVF9TSVpFX09OX1NUQUNLCi0JUkVHX1MgczAsIFRBU0tfVElfS0VSTkVM
X1NQKHRwKQorCWFkZGkgdDEsIHNwLCBQVF9TSVpFX09OX1NUQUNLCisJUkVHX1MgdDEsIFRBU0tf
VElfS0VSTkVMX1NQKHRwKQogCiAJLyogU2F2ZSB0aGUga2VybmVsIHNoYWRvdyBjYWxsIHN0YWNr
IHBvaW50ZXIgKi8KIAlzY3Nfc2F2ZV9jdXJyZW50CkBAIC0xNDIsMTEgKzE1Niw2IEBAIFNZTV9D
T0RFX1NUQVJUX05PQUxJR04ocmV0X2Zyb21fZXhjZXB0aW9uKQogCSAqLwogCWNzcncgQ1NSX1ND
UkFUQ0gsIHRwCiAxOgotI2lmZGVmIENPTkZJR19SSVNDVl9JU0FfVl9QUkVFTVBUSVZFCi0JbW92
ZSBhMCwgc3AKLQljYWxsIHJpc2N2X3ZfY29udGV4dF9uZXN0aW5nX2VuZAotI2VuZGlmCi0JUkVH
X0wgYTAsIFBUX1NUQVRVUyhzcCkKIAkvKgogCSAqIFRoZSBjdXJyZW50IGxvYWQgcmVzZXJ2YXRp
b24gaXMgZWZmZWN0aXZlbHkgcGFydCBvZiB0aGUgcHJvY2Vzc29yJ3MKIAkgKiBzdGF0ZSwgaW4g
dGhlIHNlbnNlIHRoYXQgbG9hZCByZXNlcnZhdGlvbnMgY2Fubm90IGJlIHNoYXJlZCBiZXR3ZWVu
CkBAIC0xNjcsNyArMTc2LDYgQEAgU1lNX0NPREVfU1RBUlRfTk9BTElHTihyZXRfZnJvbV9leGNl
cHRpb24pCiAJUkVHX0wgIGEyLCBQVF9FUEMoc3ApCiAJUkVHX1NDIHgwLCBhMiwgUFRfRVBDKHNw
KQogCi0JY3NydyBDU1JfU1RBVFVTLCBhMAogCWNzcncgQ1NSX0VQQywgYTIKIAogCVJFR19MIHgx
LCAgUFRfUkEoc3ApCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9oZWFkLlMgYi9hcmNo
L3Jpc2N2L2tlcm5lbC9oZWFkLlMKaW5kZXggNDIzNmE2OWMzNWNiLi5iY2MyYjY2NzhmNDAgMTAw
NjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2hlYWQuUworKysgYi9hcmNoL3Jpc2N2L2tlcm5l
bC9oZWFkLlMKQEAgLTEwNiw2ICsxMDYsMTAgQEAgcmVsb2NhdGVfZW5hYmxlX21tdToKIAljc3J3
IENTUl9TQVRQLCBhMAogLmFsaWduIDIKIDE6CisJLyogQSB0cmFwIHBvdGVudGlhbGx5IHNldCB0
aGUgU0RUIGZsYWcsIGNsZWFyIGl0ICovCisJbGkgdDAsIFNSX1NEVAorCWNzcmMgQ1NSX1NUQVRV
UywgdDAKKwogCS8qIFNldCB0cmFwIHZlY3RvciB0byBzcGluIGZvcmV2ZXIgdG8gaGVscCBkZWJ1
ZyAqLwogCWxhIGEwLCAuTHNlY29uZGFyeV9wYXJrCiAJY3NydyBDU1JfVFZFQywgYTAKZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3NzZV9lbnRyeS5TIGIvYXJjaC9yaXNjdi9rZXJuZWwv
c3NlX2VudHJ5LlMKaW5kZXggZDNjNzI4NmYzMzcyLi5lNjlkMzg2ZTM2ZTkgMTAwNjQ0Ci0tLSBh
L2FyY2gvcmlzY3Yva2VybmVsL3NzZV9lbnRyeS5TCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3Nz
ZV9lbnRyeS5TCkBAIC02NSw3ICs2NSw3IEBAIFNZTV9DT0RFX1NUQVJUKGhhbmRsZV9zc2UpCiAJ
UkVHX1MgYTQsIFBUX1NQKHNwKQogCiAJLyogRGlzYWJsZSB1c2VyIG1lbW9yeSBhY2Nlc3MgYW5k
IGZsb2F0aW5nL3ZlY3RvciBjb21wdXRpbmcgKi8KLQlsaSB0MCwgU1JfU1VNIHwgU1JfRlNfVlMK
KwlsaSB0MCwgU1JfU1VNIHwgU1JfRlNfVlMgfCBTUl9TRFQKIAljc3JjIENTUl9TVEFUVVMsIHQw
CiAKIAlsb2FkX2dsb2JhbF9wb2ludGVyCkBAIC0xMzEsOCArMTMxLDggQEAgU1lNX0NPREVfU1RB
UlQoaGFuZGxlX3NzZSkKIAogU1lNX0lOTkVSX0xBQkVMKHJldF9mcm9tX3NzZSwgU1lNX0xfR0xP
QkFMKQogCS8qIFJlc3RvcmUgc2F2ZWQgQ1NScyAqLwotCWNzcncgQ1NSX1NTQ1JBVENILCBzNAog
CWNzcncgQ1NSX1NTVEFUVVMsIHM1CisJY3NydyBDU1JfU1NDUkFUQ0gsIHM0CiAKICNpZmRlZiBD
T05GSUdfRlJBTUVfUE9JTlRFUgogCS8qIEZyYW1lIHBvaW50ZXIgaXMgY3JlYXRlZCBvbmx5IHdo
ZW4ga2VybmVsIGlzIGludGVycnVwdGVkICovCi0tIAoyLjQzLjAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
