Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A763CD1280
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 16:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tnIPWjbfH7VelsH5kJfay0krWFCQmbS45VlcI74N+rs=; b=hvd/NCauQH4aTo
	nU+CmYMBq0h0Yia5o0if8a2zjCFHIeb1mMISFtWxLSS6EB0iXQL/kp1/HVJ/sKpAUUj1CPICUfvQD
	/XpQGrnHzI0zlm8ZBp3kynVqq7eriJa4BgOSi/88WZz3TOevvedk2E60LMORYqhpQudjzxn5q1zD1
	j14nQwJfCXIm9PTIOxg+c5Uuq8BTQu61TmN2FSUpZxzcQYsZVs/SVYhmexm3yQZwsahgJ7sFLGCCo
	VRRiTXKcDjOfQ72bmAwq1nFJuBv8P9z4BWP4bPFFXGHjmah/kELymyT7Kct8f8Geo3FGmcH5ODLoh
	NcsBAeqdkqTDz9Sd1bgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpVme-00000009zIA-0Sr0;
	Wed, 27 Mar 2024 16:05:48 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpVmI-00000009z6q-0QP6
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 16:05:33 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1e0d82d441bso24232865ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 09:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711555524; x=1712160324; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VuDNJ40vLIezNFuUe/xAQeUguFHfIodkK1lC+Qglvxs=;
        b=WEqTBJqeK2LLW0yXJw8eiacYWZa5+72h2ptbd3UI5gA8Ez6LNgUzai9eN/NkqTKxly
         Kqz+AhboQFNPkGoeSLxraljxMCwmoovA8aZMuXJOwfBdCPFVoY+5EBdCEBpBolKtG8Pt
         bqV7BbRQuhUITZ48YRfuR6qHVYa4H76O19l6tjer+59rHJU8Rl2+crzwaljRSEUUdtox
         MB2OpNkbLmVaSEZ1Otn5dQ2Ac2M3D42lE7JWpVFSi1fwlDXRUdt9FtDTwp6RyWEAvO4/
         lSrcZQEJ5oRyrA4O8aH0GBiSdDPRPwNvV5n7SsjMy+5/hRFahSkzarRJi0kk35R15HIa
         QV6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711555524; x=1712160324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VuDNJ40vLIezNFuUe/xAQeUguFHfIodkK1lC+Qglvxs=;
        b=TCTWzeGWkXrvtq+atX26B3PKXAvEs6qxUj/4TqbRPBFJOlpm1f28K2ci87CUTyJiwe
         aGOr88ma9uqdwe2mVUKFSJgFfueM7/15cIlLswUGp07Jfhu9UINqKMpwY7FNJZl8emH8
         9tYrAn7eDFXeec0V22Ak199jWOYbtPaUkJb57nuZkJzmDD5xMGyO8/3PEK2nPpYvU1Un
         fdY4PeCmu7hbpfuVKAe/m8fj6jzynBTFoYgg52IunO5EQPEVKujWsAhk6+6b2a10XYRf
         AxzuqHLE3pAmQRFDdB/5GNhg3JgLfeHIJYApCtJ3yYkTy5Py1INq/pPcZ5uxRVvor9mo
         1DEg==
X-Forwarded-Encrypted: i=1; AJvYcCWy0QpcAtEJCBu4n7OGGxSZdL5TmS77/49YBaZ0W07tbsdO1Rm/RpKEqXjamFe4yji7QHakIsWCAvOWdJ3q2HBWmmjZBcubhvdwmZpz7STL
X-Gm-Message-State: AOJu0YxqmRjDzOdANKZKqV9xzRth4LiFC6P2RXAqrs12LczC7uHMOBAr
	i1H7IuckOcyST3hnLbETJJwH7caAGagfcQNhkSV4Pd5kIjjo52NcDj+61rIwnc8=
X-Google-Smtp-Source: AGHT+IFLpO6qOZi7q4RhE4GsZZhUwfq9Dw57tdLyUjstKo8gtTnO92RJN1LNXII9AjG38+eBbfsS1w==
X-Received: by 2002:a17:902:784c:b0:1dd:a33f:5913 with SMTP id e12-20020a170902784c00b001dda33f5913mr139558pln.30.1711555523234;
        Wed, 27 Mar 2024 09:05:23 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id bf4-20020a170902b90400b001e14807f9cesm1718226plb.125.2024.03.27.09.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 09:05:22 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Jason Baron <jbaron@akamai.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH v2 1/7] riscv: jump_label: Batch icache maintenance
Date: Wed, 27 Mar 2024 09:04:40 -0700
Message-ID: <20240327160520.791322-2-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240327160520.791322-1-samuel.holland@sifive.com>
References: <20240327160520.791322-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_090527_045904_7B78212F 
X-CRM114-Status: GOOD (  10.90  )
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

U3dpdGNoIHRvIHRoZSBiYXRjaGVkIHZlcnNpb24gb2YgdGhlIGp1bXAgbGFiZWwgdXBkYXRlIGZ1
bmN0aW9ucyBzbwppbnN0cnVjdGlvbiBjYWNoZSBtYWludGVuYW5jZSBpcyBkZWZlcnJlZCB1bnRp
bCB0aGUgZW5kIG9mIHRoZSB1cGRhdGUuCgpSZXZpZXdlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympv
cm5Acml2b3NpbmMuY29tPgpTaWduZWQtb2ZmLWJ5OiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsLmhv
bGxhbmRAc2lmaXZlLmNvbT4KLS0tCgoobm8gY2hhbmdlcyBzaW5jZSB2MSkKCiBhcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2p1bXBfbGFiZWwuaCB8ICAyICsrCiBhcmNoL3Jpc2N2L2tlcm5lbC9qdW1w
X2xhYmVsLmMgICAgICB8IDE2ICsrKysrKysrKysrKy0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMTQg
aW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL2p1bXBfbGFiZWwuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vanVtcF9sYWJl
bC5oCmluZGV4IDRhMzVkNzg3YzAxOS4uNjI5MGIyNmY0YTE0IDEwMDY0NAotLS0gYS9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2p1bXBfbGFiZWwuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2p1bXBfbGFiZWwuaApAQCAtMTIsNiArMTIsOCBAQAogI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+
CiAjaW5jbHVkZSA8YXNtL2FzbS5oPgogCisjZGVmaW5lIEhBVkVfSlVNUF9MQUJFTF9CQVRDSAor
CiAjZGVmaW5lIEpVTVBfTEFCRUxfTk9QX1NJWkUgNAogCiBzdGF0aWMgX19hbHdheXNfaW5saW5l
IGJvb2wgYXJjaF9zdGF0aWNfYnJhbmNoKHN0cnVjdCBzdGF0aWNfa2V5ICogY29uc3Qga2V5LApk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvanVtcF9sYWJlbC5jIGIvYXJjaC9yaXNjdi9r
ZXJuZWwvanVtcF9sYWJlbC5jCmluZGV4IGU2Njk0NzU5ZGJkMC4uMTFhZDc4OWM2MGM2IDEwMDY0
NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9qdW1wX2xhYmVsLmMKKysrIGIvYXJjaC9yaXNjdi9r
ZXJuZWwvanVtcF9sYWJlbC5jCkBAIC05LDEzICs5LDE0IEBACiAjaW5jbHVkZSA8bGludXgvbWVt
b3J5Lmg+CiAjaW5jbHVkZSA8bGludXgvbXV0ZXguaD4KICNpbmNsdWRlIDxhc20vYnVnLmg+Cisj
aW5jbHVkZSA8YXNtL2NhY2hlZmx1c2guaD4KICNpbmNsdWRlIDxhc20vcGF0Y2guaD4KIAogI2Rl
ZmluZSBSSVNDVl9JTlNOX05PUCAweDAwMDAwMDEzVQogI2RlZmluZSBSSVNDVl9JTlNOX0pBTCAw
eDAwMDAwMDZmVQogCi12b2lkIGFyY2hfanVtcF9sYWJlbF90cmFuc2Zvcm0oc3RydWN0IGp1bXBf
ZW50cnkgKmVudHJ5LAotCQkJICAgICAgIGVudW0ganVtcF9sYWJlbF90eXBlIHR5cGUpCitib29s
IGFyY2hfanVtcF9sYWJlbF90cmFuc2Zvcm1fcXVldWUoc3RydWN0IGp1bXBfZW50cnkgKmVudHJ5
LAorCQkJCSAgICAgZW51bSBqdW1wX2xhYmVsX3R5cGUgdHlwZSkKIHsKIAl2b2lkICphZGRyID0g
KHZvaWQgKilqdW1wX2VudHJ5X2NvZGUoZW50cnkpOwogCXUzMiBpbnNuOwpAQCAtMjQsNyArMjUs
NyBAQCB2b2lkIGFyY2hfanVtcF9sYWJlbF90cmFuc2Zvcm0oc3RydWN0IGp1bXBfZW50cnkgKmVu
dHJ5LAogCQlsb25nIG9mZnNldCA9IGp1bXBfZW50cnlfdGFyZ2V0KGVudHJ5KSAtIGp1bXBfZW50
cnlfY29kZShlbnRyeSk7CiAKIAkJaWYgKFdBUk5fT04ob2Zmc2V0ICYgMSB8fCBvZmZzZXQgPCAt
NTI0Mjg4IHx8IG9mZnNldCA+PSA1MjQyODgpKQotCQkJcmV0dXJuOworCQkJcmV0dXJuIHRydWU7
CiAKIAkJaW5zbiA9IFJJU0NWX0lOU05fSkFMIHwKIAkJCSgoKHUzMilvZmZzZXQgJiBHRU5NQVNL
KDE5LCAxMikpIDw8ICgxMiAtIDEyKSkgfApAQCAtMzYsNiArMzcsMTMgQEAgdm9pZCBhcmNoX2p1
bXBfbGFiZWxfdHJhbnNmb3JtKHN0cnVjdCBqdW1wX2VudHJ5ICplbnRyeSwKIAl9CiAKIAltdXRl
eF9sb2NrKCZ0ZXh0X211dGV4KTsKLQlwYXRjaF90ZXh0X25vc3luYyhhZGRyLCAmaW5zbiwgc2l6
ZW9mKGluc24pKTsKKwlwYXRjaF9pbnNuX3dyaXRlKGFkZHIsICZpbnNuLCBzaXplb2YoaW5zbikp
OwogCW11dGV4X3VubG9jaygmdGV4dF9tdXRleCk7CisKKwlyZXR1cm4gdHJ1ZTsKK30KKwordm9p
ZCBhcmNoX2p1bXBfbGFiZWxfdHJhbnNmb3JtX2FwcGx5KHZvaWQpCit7CisJZmx1c2hfaWNhY2hl
X2FsbCgpOwogfQotLSAKMi40My4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
