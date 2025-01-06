Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 825B1E77188
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jan 2025 15:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MjrxT0auFzLTl3kogpHJbWaGYpkay3TvNKsiZK71Ux8=; b=ZSkuvDmMCO5G/y
	CxEVchdaXqWIOf2AKoBsEE0QX8xwFJrmsFa28qZkprA3ZZm+1cenFw/XWg9y2A4y+gAC0v/wEIZ/w
	99W/vbZrPBYY337T7AtYcbCA5dIx/dQBgRuN9SW9lInAHcCQMhCaQY8BkUsJZ9TBpTarUQxjVD2fe
	FiQO5zVm+KGgOwGR3S5h8e1q+kUrRrUl+WAH+7zpwb9JTBBRZrGn6yPtlULtcz0w5nDsnro2Hy2VV
	s26XIxCr2jsMYcHU+Fm0dZvEHqmLo/6nUeOvY9weNQkNEL0cHUp2JB72xA3liAovqjQ19TdriZ3IE
	7HvJNe15GaBGeLml8tGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUpNc-00000001qUq-1SSZ;
	Mon, 06 Jan 2025 15:51:00 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUpLt-00000001q3P-0rHm
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jan 2025 15:49:14 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-216426b0865so205057795ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 06 Jan 2025 07:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736178552; x=1736783352; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YWWbvbVWcBkTLDmBWRGuP/373zfHHQD7CsE6sYbpx+8=;
        b=diT2LbjAvHbiJHI9xCsx8SmO1nchaDK44rsGe8POikAH21PRAJcpeXpV5cSyKo4ccW
         C2/6iKIGHXefbOMLbY233WfURKVRpEcvWH/bhz10LZ/DKp0nqnKrVxHCnL4RiXKSZhhU
         um9xrEmt15bjzmYpKoKG/SgXblkstr0/YYmvfZlq+BaHdc77KQHytAqAsPKR193WlfDP
         zFq7uK/xRYmkQfcv2yqf82/DYfn1Ajvnbg+3SxRce/CkjcoebMIonzGFfLqKpUKiSiLV
         eoVpSU7Fw59uV4SCFQiI8lJk4J7c/ZWLOG++Iv6dG51ZU/bVYJCmLJEIpElhkWwGyW2u
         khkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736178552; x=1736783352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YWWbvbVWcBkTLDmBWRGuP/373zfHHQD7CsE6sYbpx+8=;
        b=t1QPPemyouMPTpsBU/1eC833kc6/NDNboilPPFP1+E2Qc4SJbwrS7TFFNapWrRRWhg
         KbSse0fl33ejgHIAKrgj2AQr+iB43IK4Rq0OkwWQ1Tx/DCj+MiKhjO3yekFtyrozOFhf
         wPi+5vdm4f5ZdQZiF5a+frYB4aUW96c/8wlTyo+9L+Jl5446SPgkhyC/KDNntucv3oGK
         69Y9VtlxnxN530mbGRNbxoPdhKvrUwEIxNCKBIY0xqJC7gziAzYsIAnow5ckZtCmuS3D
         GH+ROxZ77ypRI2UsKjzIcNSJE0Gfty50VApBWUGQTPG9hMCoI/uJSA4KFTjdvvNN0V9u
         1ENQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsyjIHpkcsSY55c2XP2YcKJt3q0C0xQ7X80qojjBfc/K0Q3fVJWDgtMPmBpnolxNR56cXAT1h8vpqW0Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YygnwQOgNH7lv+kX97QLxaIOPNZuF0/Iz3Luu9uBjBPpY11HPfV
	DYijKIOLFpGxipt0lHZYXzJjAFBPCLtX3/+591gsMkAkjeTpkiXrBIYycqVd+i0=
X-Gm-Gg: ASbGncvnlPKtBjByelvkk4ROGAHjm8YWC/OBJZGHrNG7DTVzosuE4a1YR4wSDAsTFNW
	ojhTvQv37YaNc8+/I49Ii/bfVQxZkOewrgaX0dFKQIMDZ9egbAyAVjsWpJ+g7wwnA+wAd8jfwk6
	0wBGYF60cNgUw7VDK2NBWSF91eu/CAeIqX2Ni2AqprOrfeBMztbYvV2g3Ca1JYUlbxsoYOU1XCT
	EuYAhhZADhv6zO6hTG+dYmYm3mtlvqa3LT7Sag7CHkJatlIulf9H7v1tA==
X-Google-Smtp-Source: AGHT+IFsrR++da94vh57i8gZG2YCIfCJlCqOllnoSuVQjwf/TtLCIaXs8yZigKmfjKjyX3pC2+VXhQ==
X-Received: by 2002:a17:902:d2c7:b0:216:5448:22a4 with SMTP id d9443c01a7336-219e6e89a6dmr805222645ad.10.1736178552138;
        Mon, 06 Jan 2025 07:49:12 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f6967sm292479535ad.214.2025.01.06.07.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 07:49:11 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
Subject: [PATCH 1/6] riscv: add Firmware Feature (FWFT) SBI extensions definitions
Date: Mon,  6 Jan 2025 16:48:38 +0100
Message-ID: <20250106154847.1100344-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250106154847.1100344-1-cleger@rivosinc.com>
References: <20250106154847.1100344-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_074913_234791_A542B969 
X-CRM114-Status: UNSURE (   9.14  )
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

VGhlIEZpcm13YXJlIEZlYXR1cmVzIGV4dGVuc2lvbiAoRldGVCkgd2FzIGFkZGVkIGFzIHBhcnQg
b2YgdGhlIFNCSSAzLjAKc3BlY2lmaWNhdGlvbi4gQWRkIFNCSSBkZWZpbml0aW9ucyB0byB1c2Ug
dGhpcyBleHRlbnNpb24uCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckBy
aXZvc2luYy5jb20+Ci0tLQogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaCB8IDI4ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaCBiL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vc2JpLmgKaW5kZXggNmM4MjMxODA2NWNmLi5lYzc4ZGUwNzFlMGUgMTAwNjQ0
Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9zYmkuaApAQCAtMzUsNiArMzUsNyBAQCBlbnVtIHNiaV9leHRfaWQgewogCVNCSV9F
WFRfREJDTiA9IDB4NDQ0MjQzNEUsCiAJU0JJX0VYVF9TVEEgPSAweDUzNTQ0MSwKIAlTQklfRVhU
X05BQ0wgPSAweDRFNDE0MzRDLAorCVNCSV9FWFRfRldGVCA9IDB4NDY1NzQ2NTQsCiAKIAkvKiBF
eHBlcmltZW50YWxzIGV4dGVuc2lvbnMgbXVzdCBsaWUgd2l0aGluIHRoaXMgcmFuZ2UgKi8KIAlT
QklfRVhUX0VYUEVSSU1FTlRBTF9TVEFSVCA9IDB4MDgwMDAwMDAsCkBAIC00MDEsNiArNDAyLDMz
IEBAIGVudW0gc2JpX2V4dF9uYWNsX2ZlYXR1cmUgewogI2RlZmluZSBTQklfTkFDTF9TSE1FTV9T
UkVUX1goX19pKQkJKChfX3Jpc2N2X3hsZW4gLyA4KSAqIChfX2kpKQogI2RlZmluZSBTQklfTkFD
TF9TSE1FTV9TUkVUX1hfTEFTVAkJMzEKIAorLyogU0JJIGZ1bmN0aW9uIElEcyBmb3IgRlcgZmVh
dHVyZSBleHRlbnNpb24gKi8KKyNkZWZpbmUgU0JJX0VYVF9GV0ZUX1NFVAkJMHgwCisjZGVmaW5l
IFNCSV9FWFRfRldGVF9HRVQJCTB4MQorCitlbnVtIHNiaV9md2Z0X2ZlYXR1cmVfdCB7CisJU0JJ
X0ZXRlRfTUlTQUxJR05FRF9FWENfREVMRUcJCT0gMHgwLAorCVNCSV9GV0ZUX0xBTkRJTkdfUEFE
CQkJPSAweDEsCisJU0JJX0ZXRlRfU0hBRE9XX1NUQUNLCQkJPSAweDIsCisJU0JJX0ZXRlRfRE9V
QkxFX1RSQVAJCQk9IDB4MywKKwlTQklfRldGVF9QVEVfQURfSFdfVVBEQVRJTkcJCT0gMHg0LAor
CVNCSV9GV0ZUX1BPSU5URVJfTUFTS0lOR19QTUxFTgkJPSAweDUsCisJU0JJX0ZXRlRfTE9DQUxf
UkVTRVJWRURfU1RBUlQJCT0gMHg2LAorCVNCSV9GV0ZUX0xPQ0FMX1JFU0VSVkVEX0VORAkJPSAw
eDNmZmZmZmZmLAorCVNCSV9GV0ZUX0xPQ0FMX1BMQVRGT1JNX1NUQVJUCQk9IDB4NDAwMDAwMDAs
CisJU0JJX0ZXRlRfTE9DQUxfUExBVEZPUk1fRU5ECQk9IDB4N2ZmZmZmZmYsCisKKwlTQklfRldG
VF9HTE9CQUxfUkVTRVJWRURfU1RBUlQJCT0gMHg4MDAwMDAwMCwKKwlTQklfRldGVF9HTE9CQUxf
UkVTRVJWRURfRU5ECQk9IDB4YmZmZmZmZmYsCisJU0JJX0ZXRlRfR0xPQkFMX1BMQVRGT1JNX1NU
QVJUCQk9IDB4YzAwMDAwMDAsCisJU0JJX0ZXRlRfR0xPQkFMX1BMQVRGT1JNX0VORAkJPSAweGZm
ZmZmZmZmLAorfTsKKworI2RlZmluZSBTQklfRldGVF9QTEFURk9STV9GRUFUVVJFX0JJVAkJKDEg
PDwgMzApCisjZGVmaW5lIFNCSV9GV0ZUX0dMT0JBTF9GRUFUVVJFX0JJVAkJKDEgPDwgMzEpCisK
KyNkZWZpbmUgU0JJX0ZXRlRfU0VUX0ZMQUdfTE9DSwkJCSgxIDw8IDApCisKIC8qIFNCSSBzcGVj
IHZlcnNpb24gZmllbGRzICovCiAjZGVmaW5lIFNCSV9TUEVDX1ZFUlNJT05fREVGQVVMVAkweDEK
ICNkZWZpbmUgU0JJX1NQRUNfVkVSU0lPTl9NQUpPUl9TSElGVAkyNAotLSAKMi40Ny4xCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
