Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52196606A335
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 23:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=je9xWYTw;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vh51ogPd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gALmEqUFXWSlEPXXP4RPxO6HjqvwUNMuHfIk76kmgd0=; b=je9xWYTw+4tD35F3u3XUB94rOA
	Oc9l7eewRynR8G/fqfBZQ3c1t7Rf9Ufr10uwLqp+VnW6BLmLLnAQ4AwGkQU4Y3HzS3Zumuv/rSvWI
	OseqhE2UaaXaFPcEr5CpPDoxVYA6qMzwdK5xoVM/OSVaG78NVZDjbfzrlHVx8+fLryag1p5100G3P
	NjIgkFJnsB5JLysBahgk51OrxSB5jWmICBk8jZl8Qf8PBczftKY0HFW45HVX3OlgIzQ/R1bcqMbgg
	K45JUnz07XCZu831q71Ujuc0K2MV5ZaLjykMtyFtyNanJ982gCqC/q4Q7W8QHYkozLVoBcPlbUYAW
	wx7MfH9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWMS5-0000000BYVx-0FTd;
	Wed, 25 Nov 2026 23:31:01 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWMRy-0000000BYQB-017D
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 23:30:58 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4bb6057b333so30339895e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2026 15:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795649452; x=1796254252; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V5JhfCZN21w53Q+VXqNEMxIRzxDLInZAIKyThM70aLU=;
        b=Vh51ogPdP486LY1BDkOiV/X6LgUFkupdarAtetp2D1NDaCEAqpwMAjyvxu2CTo7uhF
         D1VdwJOO/TNmlU3zPmIFWBXF8lSE8T26VAdwOKq08e827PN9VAn+i2geMSP5u2MUtOEQ
         I5/3opHjBaW2OtLIExsdk7A667YXOIsd4XAlNEX5dcPM5z60Ww+4Jy/qvZPQnFlLCyBL
         DQZOX0O08fEnpJ6iH+nmfjPdspI39/BCZopIls0DzGf0//N5OYOvkGaXXU4tjUDvHI02
         9qcFNnjj64yG4w6dsrTDhzQcNCajKyzFBEg73phH8HnZuOY8e/wMuniDiF7TSkIrnutr
         lR9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795649452; x=1796254252;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V5JhfCZN21w53Q+VXqNEMxIRzxDLInZAIKyThM70aLU=;
        b=O6/8+iU5LfwfNNa3pNXFw9Fi426HBb4soeqDCnvYiK4o62GhkAV39WevRyFufsTs9V
         oRebAdkfJ46C1n+pQf7xY2T2JezuKPqjB7SSuUem7AHddqEeJ+2VqNtcjkywFeTCB35l
         nj89BMrsM4iJpRmGC1rkDmC6G06cHRo5OukQIXm/z0zWgJE5JFMYcF0lkdkC8SLQL136
         AwiJcoJcaWa361l63MgBsVQ60jYYj/P123tDHjeFnP6u8Z7fXW/2va8sDnqUg9xdM4CQ
         aVvJiJ2n5S8h12QU9ACUOTlTpQ4qVGy8jcxeiUh10Ka1CjL/r1p2mEJe+4rQn0nQqT+j
         YGmQ==
X-Gm-Message-State: APuU4Z9nOxbSJI0lEn/dq1ZfHk2eSSYwPO0h2lciSpL0D1pdVZyTdKY2
	bCcwSiy7X8y2V7xns90/+Ir/8+WOImoU7mIGa39Z7t9ej6HGTPsZbKqTfEjs7M5ze7M=
X-Gm-Gg: AZFdTZcRb/Jt6Vx3rYnEVDvBNCzehwuxlCNWAZ5UqQgOm3541P8yEfXg0hlcb+aO3iX
	78dkv66QbutQKl+0LZB6Xz3j2otmNaiqjRs6IAvF1UtBhenBIeU7fN+YiYlS/arGWYZLjcmb0I8
	Q3SHqu4NEbdECDYF4CvPCLlFPg8RdAroKePIVib0CvUN/eZHrdFwzs8Ejgj5VwEyFcAH7bkehxc
	0euZp4LLHl+3jb5ow1UrpzsM/ZYCxe+4m9eAtQ0gOPrme2maJWBnS+rGbfNyp6/emCpFq93nBo1
	9n7XuL44/y7Xmn8bKmhI0Wxki1WiGE1DkMvnD8nk7tYOMU0xmw5vZVXVvHyiZNCVixm2DYQ32hs
	FBQayLQ9wYivBm5k32/+xg+eAExSlkVAq1G5GjYbIJwhggTZE82ayeZQo0fXR0h0mroo4J2PiQC
	0qmSYg33YeNOUiPVqJ+7TdWEyCM6hIoJ0xHrV1QG70Sb6YxHx5Dl9b2e6/ILUhhuBuo9eoyEpjo
	cKlZyNU1bv/fxmZClkIYOJ6fOoyjmPAbvCRtUZA+n6wFh5AQsYElv5+Xhw/yWBK2Qt7HcyjwKBr
	iecpuJE372RySzHO50GCsjZ37Z9/7ilisQCD6OpdGBVhowUvkVffnZmv8gz9qERUMcP+AV24H+3
	tz0fPfXYvhg==
X-Received: by 2002:a05:600c:3b88:b0:4a2:191f:7cbd with SMTP id 5b1f17b1804b1-4bb888078a8mr440446035e9.11.1795649451797;
        Wed, 25 Nov 2026 15:30:51 -0800 (PST)
Received: from localhost (bl20-90-91.dsl.telepac.pt. [2.81.90.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm525188055e9.8.2026.11.25.15.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:30:51 -0800 (PST)
From: =?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>
Subject: [PATCH RFC 05/19] dt-bindings: interrupt-controller: Add Espressif ESP32-P4 interrupt matrix
Date: Wed, 25 Nov 2026 23:30:06 +0000
Message-ID: <20261125233020.1380594-6-vitorhg20080@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125233020.1380594-1-vitorhg20080@gmail.com>
References: <20261125233020.1380594-1-vitorhg20080@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_153054_083427_2C57D2D7 
X-CRM114-Status: GOOD (  14.70  )
X-Spam-Score: -1.8 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RGVzY3JpYmUgdGhlIGludGVycnVwdCBtYXRyaXggdGhhdCByb3V0ZXMgcGVyaXBoZXJhbCBpbnRl
cnJ1cHQgc291cmNlcwp0byB0aGUgQ0xJQy4gRGVmaW5lIHRoZSBpbnRlcnJ1cHQgcGFyZW50IGFu
ZCB0aGUgdHdvLWNlbGwgc3BlY2lmaWVyCmZvciB0aGUgcGVyaXBoZXJhbCBzb3VyY2UgbnVtYmVy
IGFuZCB0cmlnZ2VyIHR5cGUuCgpUZXN0ZWQgb24gYSBXYXZlc2hhcmUgRVNQMzItUDQtTW9kdWxl
LURFVi1LSVQuCgpBSSBhc3Npc3RlZCB3aXRoIGRyYWZ0aW5nIGFuZCB2YWxpZGF0aW5nIHRoZSBi
aW5kaW5nLgoKU2lnbmVkLW9mZi1ieTogVsOtdG9yIEh1Z28gU2lsdmEgPHZpdG9yaGcyMDA4MEBn
bWFpbC5jb20+Ci0tLQogLi4uL2VzcCxlc3AzMnA0LWludG10eC55YW1sICAgICAgICAgICAgICAg
ICAgIHwgNjcgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDY3IGluc2VydGlv
bnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvZXNwLGVzcDMycDQtaW50bXR4LnlhbWwKCmRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xs
ZXIvZXNwLGVzcDMycDQtaW50bXR4LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvZXNwLGVzcDMycDQtaW50bXR4LnlhbWwKbmV3IGZp
bGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi4yMGYzNmM0ZjQ1ZGEKLS0tIC9kZXYv
bnVsbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW50ZXJydXB0LWNv
bnRyb2xsZXIvZXNwLGVzcDMycDQtaW50bXR4LnlhbWwKQEAgLTAsMCArMSw2NyBAQAorIyBTUERY
LUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpCislWUFN
TCAxLjIKKy0tLQorJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9pbnRlcnJ1cHQt
Y29udHJvbGxlci9lc3AsZXNwMzJwNC1pbnRtdHgueWFtbCMKKyRzY2hlbWE6IGh0dHA6Ly9kZXZp
Y2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIworCit0aXRsZTogRXNwcmVzc2lmIEVT
UDMyLVA0IEhpZ2gtUGVyZm9ybWFuY2UgSW50ZXJydXB0IE1hdHJpeAorCittYWludGFpbmVyczoK
KyAgLSBWw610b3IgSHVnbyBTaWx2YSA8dml0b3JoZzIwMDgwQGdtYWlsLmNvbT4KKworZGVzY3Jp
cHRpb246CisgIFRoZSBoaWdoLXBlcmZvcm1hbmNlIGludGVycnVwdCBtYXRyaXggcm91dGVzIHBl
cmlwaGVyYWwgaW50ZXJydXB0IHNvdXJjZXMKKyAgdG8gdGhlIGV4dGVybmFsIGlucHV0cyBvZiBh
IGhpZ2gtcGVyZm9ybWFuY2UgY29yZSdzIENMSUMuIFRoZSBtYXRyaXggY2FuCisgIGluZGVwZW5k
ZW50bHkgc2VsZWN0IHRoZSBkZXN0aW5hdGlvbiBpbnB1dCBmb3IgZWFjaCBwZXJpcGhlcmFsIHNv
dXJjZS4KKyAgRVNQMzItUDQgcmV2aXNpb24gMy54IGFkZHMgdGhyZWUgaW50ZXJydXB0IHJvdXRp
bmcgcmVnaXN0ZXJzLgorCitwcm9wZXJ0aWVzOgorICBjb21wYXRpYmxlOgorICAgIGVudW06Cisg
ICAgICAtIGVzcCxlc3AzMnA0LWludG10eAorICAgICAgLSBlc3AsZXNwMzJwNC12My1pbnRtdHgK
KworICByZWc6CisgICAgbWF4SXRlbXM6IDEKKworICBpbnRlcnJ1cHQtY29udHJvbGxlcjogdHJ1
ZQorCisgICcjaW50ZXJydXB0LWNlbGxzJzoKKyAgICBjb25zdDogMgorICAgIGRlc2NyaXB0aW9u
OgorICAgICAgVGhlIGZpcnN0IGNlbGwgaXMgdGhlIHBlcmlwaGVyYWwgaW50ZXJydXB0IHNvdXJj
ZSBudW1iZXIgaW4gdGhlIG1hdHJpeC4KKyAgICAgIFRoZSBzZWNvbmQgY2VsbCBpcyB0aGUgdHJp
Z2dlciB0eXBlIGFzIGRlZmluZWQgaW4KKyAgICAgIGR0LWJpbmRpbmdzL2ludGVycnVwdC1jb250
cm9sbGVyL2lycS5oLgorCisgICcjYWRkcmVzcy1jZWxscyc6CisgICAgY29uc3Q6IDAKKworICBp
bnRlcnJ1cHQtcGFyZW50OgorICAgIGRlc2NyaXB0aW9uOiBQaGFuZGxlIHRvIHRoZSBDTElDIHRo
YXQgcmVjZWl2ZXMgaW50ZXJydXB0cyBmcm9tIHRoaXMgbWF0cml4LgorCityZXF1aXJlZDoKKyAg
LSBjb21wYXRpYmxlCisgIC0gcmVnCisgIC0gaW50ZXJydXB0LWNvbnRyb2xsZXIKKyAgLSAnI2lu
dGVycnVwdC1jZWxscycKKyAgLSBpbnRlcnJ1cHQtcGFyZW50CisKK2FkZGl0aW9uYWxQcm9wZXJ0
aWVzOiBmYWxzZQorCitleGFtcGxlczoKKyAgLSB8CisgICAgY2xpYzogaW50ZXJydXB0LWNvbnRy
b2xsZXJAMjA4MDAwMDAgeworICAgICAgICBjb21wYXRpYmxlID0gImVzcCxlc3AzMnA0LWNsaWMi
OworICAgICAgICByZWcgPSA8MHgyMDgwMDAwMCAweDEwMDAwPjsKKyAgICAgICAgaW50ZXJydXB0
LWNvbnRyb2xsZXI7CisgICAgICAgICNpbnRlcnJ1cHQtY2VsbHMgPSA8Mj47CisgICAgfTsKKwor
ICAgIGludGVycnVwdC1jb250cm9sbGVyQDUwMGQ2MDAwIHsKKyAgICAgICAgY29tcGF0aWJsZSA9
ICJlc3AsZXNwMzJwNC1pbnRtdHgiOworICAgICAgICByZWcgPSA8MHg1MDBkNjAwMCAweDQwMD47
CisgICAgICAgIGludGVycnVwdC1jb250cm9sbGVyOworICAgICAgICAjaW50ZXJydXB0LWNlbGxz
ID0gPDI+OworICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwwPjsKKyAgICAgICAgaW50ZXJydXB0
LXBhcmVudCA9IDwmY2xpYz47CisgICAgfTsKLS0gCjIuNTYuMQoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
