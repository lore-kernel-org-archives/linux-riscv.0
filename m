Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D769E7719A
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jan 2025 15:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G8PkvakKaA033gXAk9LHMiMbSFlffw8YF+5QHkdZqMs=; b=Vz4uH4CJRslKiX
	NNHPmwwdGwAlJm/aJqhNgoKNlDduJc61tCzOUz7kKHpSUln0xKDynz/lws8ohxb37Jtn6s869vI4m
	GTEiDPsbsFkZag5AWFui7fu/7DKF2lqX5k7d0oAp4rYWm0MNUduDsSQepCXzm3eNN1R/zzLGvbLTM
	T9GidyREUrOiZ5iAJN/ggh8s1DRsJhllephD6JnbrZQnIl4nQk1q+8dYGfJsHmMLuMjpsLxVXYLbF
	fBRFHL0mcjTkF/xUee+67QxPLhWtygBQyH58ojjnd+suF3FN3PxQB6nt/o8mavUbhXjCY9DRyFwCQ
	NB4YXn4nInmOTFkSNZrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUpNd-00000001qVZ-0VRs;
	Mon, 06 Jan 2025 15:51:01 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUpLz-00000001q4U-0zJC
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jan 2025 15:49:20 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2164b662090so184054525ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 06 Jan 2025 07:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736178558; x=1736783358; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hUAp13cfLrcRgomb+YDwJflWyLOeBTRPSVeLvL2aSrw=;
        b=Qvb11ir1oNeTHSjuk2ivkHhEe0CLYYZdfVyNdYEzIqiMHNuIkhYUnwJIjRAfQouFus
         N/C6elM2GFzAUNeMaAc2jO0ylduygrzJkPvvdB9VsspA90U2n3lgKDDnbOcc2ucyUy+y
         7sNitQg4c7Pnn4ZTRRmshU6Avk6OzE1U6uilCyZlk2+lHL6MTaqDV9JRIpbI3tevQfBg
         PcRYllu9qiURM58+xsXbF0s+bXI7m/OXDtmEuLZ0GtfI1iZxUTcN5a64GDsVJDB99op8
         nLhY8d41/ciy98j4aLPtrJWyMib7+hh6Ivh94lxHHCcxeRwU3MZQX8mc2i52Ing6jNs7
         +4+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736178558; x=1736783358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hUAp13cfLrcRgomb+YDwJflWyLOeBTRPSVeLvL2aSrw=;
        b=KMdGkc97LLtN12rOROBYYm2axOS3n7Bd++OBh7D/V7oUxdOtqbX/XHyj+TCQLLPU3u
         7xlsw3gxgw55B0i6g6wcwTOzT2+O+moZ73hjOi1c/WMIvLAVbQvamKYRWYsmud66vWwP
         HPsi+zWk5E05o7xmEOf2ZNqYzlmUFCP5syNTGiQFa4EjwO/9xn+Rj1ExQugghYAQFYpI
         xsIGyKO+bdoed/s2Ea22/uq5SbEK3Wm3NXs4QwmQmDL4LONFms7sQhfzOIOo965NXm3i
         ES6ZesjBW4uU4A8f54NLhcP7Cz82PaVdElWlYMTVdsrImzKD8sVGLgKwnhFj+9a3o1Gg
         Zw6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUcZDR+kn7lXsZOL0cVZoHfQ4N3P++SRfUDZ75PczKUtue++XAN+R+99oTZv3eHMVxa1BI6MKfCT7Q/OQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/bB+wLxiEgrS29hBIsVZyfK85XcaH4JPYMJwOxn2eynglFD6p
	qzXlfjtWJkOLxvhU6pUzljAHoxj8RFOJNaoAvVFxqZ8nd4BcxxbCEvi9pSEoNvs=
X-Gm-Gg: ASbGncvdFwLoM+x9W3uk0l/zIwh47/yTz0ceFAWl0FYd6p9U4nWUaCH/YfL9ylKPJoM
	6H8COqsx+dfhMoQ/0y+8KGQiIWBZ2nvnBHGYyenSeb8s6iY+XJ+XFu+sjzAdth8Z6uCaWdxUzPF
	5MnCrocXSkwl0frAXPNxoL7+Dcyi+Wuu+ng4UbKevINRErgXFKm+WeDdFdBP1da01KLXe3K9DFb
	ks3vAp/yUT7kIWj1xIli8cggP+ZE5PteBVfkMsnRK7HxJmMzefp8j4SMA==
X-Google-Smtp-Source: AGHT+IEAi4C08D2uh9ehheSrgZdf7WN1M3JGxvQSdR5w+ojassJn4RAe3pkLwbVvSQ+6CKRXrqzn6Q==
X-Received: by 2002:a17:903:946:b0:216:2af7:a2a3 with SMTP id d9443c01a7336-219e6f27157mr1007178485ad.53.1736178558552;
        Mon, 06 Jan 2025 07:49:18 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f6967sm292479535ad.214.2025.01.06.07.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 07:49:17 -0800 (PST)
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
Subject: [PATCH 2/6] riscv: request misaligned exception delegation from SBI
Date: Mon,  6 Jan 2025 16:48:39 +0100
Message-ID: <20250106154847.1100344-3-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250106154847.1100344-1-cleger@rivosinc.com>
References: <20250106154847.1100344-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_074919_273658_65EB88F6 
X-CRM114-Status: GOOD (  15.23  )
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

Tm93IHRoYXQgdGhlIGtlcm5lbCBjYW4gaGFuZGxlIG1pc2FsaWduZWQgYWNjZXNzZXMgaW4gUy1t
b2RlLCByZXF1ZXN0Cm1pc2FsaWduZWQgYWNjZXNzIGV4Y2VwdGlvbiBkZWxlZ2F0aW9uIGZyb20g
U0JJLiBUaGlzIHVzZXMgdGhlIEZXRlQgU0JJCmV4dGVuc2lvbiBkZWZpbmVkIGluIFNCSSB2ZXJz
aW9uIDMuMC4KClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5j
LmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUuaCAgICAgICAgfCAg
MSArCiBhcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMgICAgICAgfCA1OSArKysr
KysrKysrKysrKysrKysrKysrCiBhcmNoL3Jpc2N2L2tlcm5lbC91bmFsaWduZWRfYWNjZXNzX3Nw
ZWVkLmMgfCAgMiArCiAzIGZpbGVzIGNoYW5nZWQsIDYyIGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUuaCBiL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vY3B1ZmVhdHVyZS5oCmluZGV4IDRiZDA1NGM1NGMyMS4uY2Q0MDZmZTM3ZGY4IDEw
MDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUuaAorKysgYi9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUuaApAQCAtNjIsNiArNjIsNyBAQCB2b2lkIF9f
aW5pdCByaXNjdl91c2VyX2lzYV9lbmFibGUodm9pZCk7CiAJX1JJU0NWX0lTQV9FWFRfREFUQShf
bmFtZSwgX2lkLCBfc3ViX2V4dHMsIEFSUkFZX1NJWkUoX3N1Yl9leHRzKSwgX3ZhbGlkYXRlKQog
CiBib29sIGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWRfYWxsX2NwdXModm9pZCk7Cit2
b2lkIHVuYWxpZ25lZF9hY2Nlc3NfaW5pdCh2b2lkKTsKICNpZiBkZWZpbmVkKENPTkZJR19SSVND
Vl9TQ0FMQVJfTUlTQUxJR05FRCkKIHZvaWQgY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRl
ZChzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmsgX19hbHdheXNfdW51c2VkKTsKIHZvaWQgdW5hbGln
bmVkX2VtdWxhdGlvbl9maW5pc2godm9pZCk7CmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5l
bC90cmFwc19taXNhbGlnbmVkLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVk
LmMKaW5kZXggN2NjMTA4YWVkNzRlLi40YWNhNjAwNTI3ZTkgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlz
Y3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFw
c19taXNhbGlnbmVkLmMKQEAgLTE2LDYgKzE2LDcgQEAKICNpbmNsdWRlIDxhc20vZW50cnktY29t
bW9uLmg+CiAjaW5jbHVkZSA8YXNtL2h3cHJvYmUuaD4KICNpbmNsdWRlIDxhc20vY3B1ZmVhdHVy
ZS5oPgorI2luY2x1ZGUgPGFzbS9zYmkuaD4KICNpbmNsdWRlIDxhc20vdmVjdG9yLmg+CiAKICNk
ZWZpbmUgSU5TTl9NQVRDSF9MQgkJCTB4MwpAQCAtNjg5LDMgKzY5MCw2MSBAQCBib29sIGNoZWNr
X3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWRfYWxsX2NwdXModm9pZCkKIAlyZXR1cm4gZmFsc2U7
CiB9CiAjZW5kaWYKKworI2lmZGVmIENPTkZJR19SSVNDVl9TQkkKKworc3RydWN0IG1pc2FsaWdu
ZWRfZGVsZWdfcmVxIHsKKwlib29sIGVuYWJsZTsKKwlpbnQgZXJyb3I7Cit9OworCitzdGF0aWMg
dm9pZAorY3B1X3VuYWxpZ25lZF9zYmlfcmVxdWVzdF9kZWxlZ2F0aW9uKHZvaWQgKmFyZykKK3sK
KwlzdHJ1Y3QgbWlzYWxpZ25lZF9kZWxlZ19yZXEgKnJlcSA9IGFyZzsKKwlzdHJ1Y3Qgc2JpcmV0
IHJldDsKKworCXJldCA9IHNiaV9lY2FsbChTQklfRVhUX0ZXRlQsIFNCSV9FWFRfRldGVF9TRVQs
CisJCQlTQklfRldGVF9NSVNBTElHTkVEX0VYQ19ERUxFRywgcmVxLT5lbmFibGUsIDAsIDAsIDAs
IDApOworCWlmIChyZXQuZXJyb3IpCisJCXJlcS0+ZXJyb3IgPSAxOworfQorCitzdGF0aWMgdm9p
ZCB1bmFsaWduZWRfc2JpX3JlcXVlc3RfZGVsZWdhdGlvbih2b2lkKQoreworCXN0cnVjdCBtaXNh
bGlnbmVkX2RlbGVnX3JlcSByZXEgPSB7dHJ1ZSwgMH07CisKKwlvbl9lYWNoX2NwdShjcHVfdW5h
bGlnbmVkX3NiaV9yZXF1ZXN0X2RlbGVnYXRpb24sICZyZXEsIDEpOworCWlmICghcmVxLmVycm9y
KSB7CisJCXByX2luZm8oIlNCSSBtaXNhbGlnbmVkIGFjY2VzcyBleGNlcHRpb24gZGVsZWdhdGlv
biBva1xuIik7CisJCS8qCisJCSAqIE5vdGUgdGhhdCB3ZSBkb24ndCBoYXZlIHRvIHRha2UgYW55
IHNwZWNpZmljIGFjdGlvbiBoZXJlLCBpZgorCQkgKiB0aGUgZGVsZWdhdGlvbiBpcyBzdWNjZXNz
ZnVsLCB0aGVuCisJCSAqIGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWQoKSB3aWxsIHZl
cmlmeSB0aGF0IGluZGVlZCB0aGUKKwkJICogcGxhdGZvcm0gdHJhcHMgb24gbWlzYWxpZ25lZCBh
Y2Nlc3Nlcy4KKwkJICovCisJCXJldHVybjsKKwl9CisKKwkvKgorCSAqIElmIGF0IGxlYXN0IGRl
bGVnYXRpb24gcmVxdWVzdCBmYWlsZWQgb24gb25lIGhhcnQsIHJldmVydCBtaXNhbGlnbmVkCisJ
ICogZGVsZWdhdGlvbiBmb3IgYWxsIGhhcnRzLCBpZiB3ZSBkb24ndCBkbyB0aGF0LCB3ZSdsbCBw
YW5pYyBhdAorCSAqIG1pc2FsaWduZWQgZGVsZWdhdGlvbiBjaGVjayB0aW1lIChzZWUKKwkgKiBj
aGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkKCkpLgorCSAqLworCXJlcS5lbmFibGUgPSBm
YWxzZTsKKwlyZXEuZXJyb3IgPSAwOworCW9uX2VhY2hfY3B1KGNwdV91bmFsaWduZWRfc2JpX3Jl
cXVlc3RfZGVsZWdhdGlvbiwgJnJlcSwgMSk7CisJaWYgKHJlcS5lcnJvcikKKwkJcGFuaWMoIkZh
aWxlZCB0byBkaXNhYmxlIG1pc2FsaWduZWQgZGVsZWdhdGlvbiBmb3IgYWxsIENQVXNcbiIpOwor
Cit9CisKK3ZvaWQgdW5hbGlnbmVkX2FjY2Vzc19pbml0KHZvaWQpCit7CisJaWYgKHNiaV9wcm9i
ZV9leHRlbnNpb24oU0JJX0VYVF9GV0ZUKSA+IDApCisJCXVuYWxpZ25lZF9zYmlfcmVxdWVzdF9k
ZWxlZ2F0aW9uKCk7Cit9CisjZWxzZQordm9pZCB1bmFsaWduZWRfYWNjZXNzX2luaXQodm9pZCkg
e30KKyNlbmRpZgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdW5hbGlnbmVkX2FjY2Vz
c19zcGVlZC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdW5hbGlnbmVkX2FjY2Vzc19zcGVlZC5jCmlu
ZGV4IDkxZjE4OWNmMTYxMS4uMWUzMTY2MTAwODM3IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tl
cm5lbC91bmFsaWduZWRfYWNjZXNzX3NwZWVkLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdW5h
bGlnbmVkX2FjY2Vzc19zcGVlZC5jCkBAIC00MDMsNiArNDAzLDggQEAgc3RhdGljIGludCBjaGVj
a191bmFsaWduZWRfYWNjZXNzX2FsbF9jcHVzKHZvaWQpCiB7CiAJYm9vbCBhbGxfY3B1c19lbXVs
YXRlZCwgYWxsX2NwdXNfdmVjX3Vuc3VwcG9ydGVkOwogCisJdW5hbGlnbmVkX2FjY2Vzc19pbml0
KCk7CisKIAlhbGxfY3B1c19lbXVsYXRlZCA9IGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0
ZWRfYWxsX2NwdXMoKTsKIAlhbGxfY3B1c192ZWNfdW5zdXBwb3J0ZWQgPSBjaGVja192ZWN0b3Jf
dW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZF9hbGxfY3B1cygpOwogCi0tIAoyLjQ3LjEKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
