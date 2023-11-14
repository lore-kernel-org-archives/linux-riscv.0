Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26928C07524
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Nov 2023 14:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wtKnEa82PLIDfzDXmPHmEx+j7uz5Mm1qXgPw/COnoOc=; b=WnZ/P9j61zZ9u4
	o5dZx6DrdeVLCpad5oR0nDBtQ9JhUImUC7EwrgVkicGPjD5JiuRXA99pjzOlk9vV0DZFmx1eyJxP+
	lxAqixbXYv1vrI7Nfx1ABzrNvsjbKgN9o/NFaQSzDkpMBB+woDLtFSNCPXjBdnUFPa/1E26583S/N
	OL9S29mrIz472jNRM1BsI4pWLZBCaGU2dQlcittFBvzXX/l7Xgn81de5z5ob+SeLTPy3VFc43VMlI
	pAF+t26d7WyqalzLf4qOLH2VljFr5lnAxXoefBEY3QKLyRYLwLFb7+axcEpv1y/Pvixq+gw2VHb5V
	/LkUAJ09HOa8TygH9lvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2uAd-00G8pW-0Y;
	Tue, 14 Nov 2023 14:13:39 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2uAZ-00G8n2-3D
	for linux-riscv@lists.infradead.org;
	Tue, 14 Nov 2023 14:13:37 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-77773d3246aso14490685a.1
        for <linux-riscv@lists.infradead.org>; Tue, 14 Nov 2023 06:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699971213; x=1700576013; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PrGNrJ4Mz4+id5eBYM8EQz0/YakC3IvStBxc6baL/D0=;
        b=InGvpuG+gs1UJf6g2AVQw4yVXcYLfxtCHCY+kHHYag8OEtOxdTHUpMEURfrpx87IHl
         SS2aeTHgcLogoucRrLOo3HLg+CKSgljWP7TL5zgeP3pDfDxA+Dm6HBMYUgGdo5cO6hoA
         PzKMvZTAh3/SNagwQL8e0jj/DQuyhGBsR+xiwxfnMcDw9+RP4/91v+Qo+n6UFfyaEi+F
         O6XpiEwMC1HHekWjhlZSCoTMtXqwFZ1csdRrUF3Oblio2YKp0yN6nXKGnB6OPkLeu6Rg
         2aZVcbNAK5X6sxIXCIjeonRkrxmpfC5DOguqONFLEaK4ncZHOjwmBScNWWIJcE+cMCAF
         ToAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699971213; x=1700576013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PrGNrJ4Mz4+id5eBYM8EQz0/YakC3IvStBxc6baL/D0=;
        b=bzMVahrVptLFBMCwCpVi9pmjed8z0cokzqZCzStjeczY4FmNDRWww2yXrjoLlpqI1n
         D8Ahm4nqYk6ej1huPp+2gYI5DTuny8HPE9YcxUeYIu8puAc0lfsfZRd2yXmFZ49dppi6
         GAObgeaWNbBe70IM6G5ydLIGEqGmVGaVpAqO4NyfmjaoSJL7n7J6nMd7BePtba0nXu+u
         85NWRZbN+bYtDuVEP1yyH4p5NNo8lQJuhRINQXQHV6dbNYIeLNnIG6ZB2OVedsocul/U
         xy0ZIgkEHmYc9DMT+T0a40FJE2TnHTNUANOyPYm1dlVkfwofERKRbwYWCcH/jQ7tFiW2
         eppw==
X-Gm-Message-State: AOJu0Yww/KiKLdexdrc7eV9ZqEz3cptIFV8tkncoLl1rM/PIUSnmOU9c
	NmW5bcnSfIDsNrn04IxMhTLfmwhG2cQ91Ua3Oaih/Q==
X-Google-Smtp-Source: AGHT+IFZD2b/EdJCKXaxNJw+Q4jC4YD3sm2mqseVgTheJfANyM9xUv2Lh4hYASCwt6RNtJiG1DYtgw==
X-Received: by 2002:a05:620a:28d4:b0:773:a789:cd15 with SMTP id l20-20020a05620a28d400b00773a789cd15mr2089252qkp.6.1699971213032;
        Tue, 14 Nov 2023 06:13:33 -0800 (PST)
Received: from carbon-x1.. ([12.186.190.2])
        by smtp.gmail.com with ESMTPSA id m2-20020a05620a220200b00777611164c5sm2701263qkh.106.2023.11.14.06.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 06:13:32 -0800 (PST)
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
Subject: [PATCH v4 02/20] riscv: hwprobe: export missing Zbc ISA extension
Date: Tue, 14 Nov 2023 09:12:38 -0500
Message-ID: <20231114141256.126749-3-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231114141256.126749-1-cleger@rivosinc.com>
References: <20231114141256.126749-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_061336_033799_2F6BAF22 
X-CRM114-Status: GOOD (  11.89  )
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

V2hpbGUgWmJhIGFuZCBaYmIgd2VyZSBleHBvcnRlZCB0aHJvdWdoIGh3cHJvYmUsIFpiYyB3YXMg
bm90LiBFeHBvcnQgaXQuCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckBy
aXZvc2luYy5jb20+Ci0tLQogRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0ICB8
IDMgKysrCiBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oIHwgMSArCiBhcmNo
L3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYyAgICAgICAgIHwgMSArCiAzIGZpbGVzIGNoYW5nZWQs
IDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9o
d3Byb2JlLnJzdCBiL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdAppbmRleCA3
YjIzODRkZTQ3MWYuLjNmNzFkYTkzNWE2NSAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9hcmNo
L3Jpc2N2L2h3cHJvYmUucnN0CisrKyBiL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2Jl
LnJzdApAQCAtODAsNiArODAsOSBAQCBUaGUgZm9sbG93aW5nIGtleXMgYXJlIGRlZmluZWQ6CiAg
ICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfRVhUX1pJQ0JPWmA6IFRoZSBaaWNib3ogZXh0ZW5z
aW9uIGlzIHN1cHBvcnRlZCwgYXMKICAgICAgICByYXRpZmllZCBpbiBjb21taXQgM2RkNjA2ZiAo
IkNyZWF0ZSBjbW9iYXNlLXYxLjAucGRmIikgb2YgcmlzY3YtQ01Pcy4KIAorICAqIDpjOm1hY3Jv
OmBSSVNDVl9IV1BST0JFX0VYVF9aQkNgIFRoZSBaYmMgZXh0ZW5zaW9uIGlzIHN1cHBvcnRlZCwg
YXMgZGVmaW5lZAorICAgICAgIGluIHZlcnNpb24gMS4wIG9mIHRoZSBCaXQtTWFuaXB1bGF0aW9u
IElTQSBleHRlbnNpb25zLgorCiAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0tFWV9DUFVQRVJG
XzBgOiBBIGJpdG1hc2sgdGhhdCBjb250YWlucyBwZXJmb3JtYW5jZQogICBpbmZvcm1hdGlvbiBh
Ym91dCB0aGUgc2VsZWN0ZWQgc2V0IG9mIHByb2Nlc3NvcnMuCiAKZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFw
aS9hc20vaHdwcm9iZS5oCmluZGV4IGI2NTlmZmNmY2RiNC4uYWNhNWFiYzdlYmVlIDEwMDY0NAot
LS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oCisrKyBiL2FyY2gvcmlz
Y3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgKQEAgLTMwLDYgKzMwLDcgQEAgc3RydWN0IHJp
c2N2X2h3cHJvYmUgewogI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWkJCCQkoMSA8PCA0KQog
I2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWkJTCQkoMSA8PCA1KQogI2RlZmluZQkJUklTQ1Zf
SFdQUk9CRV9FWFRfWklDQk9aCSgxIDw8IDYpCisjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9a
QkMJCSgxIDw8IDcpCiAjZGVmaW5lIFJJU0NWX0hXUFJPQkVfS0VZX0NQVVBFUkZfMAk1CiAjZGVm
aW5lCQlSSVNDVl9IV1BST0JFX01JU0FMSUdORURfVU5LTk9XTgkoMCA8PCAwKQogI2RlZmluZQkJ
UklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX0VNVUxBVEVECSgxIDw8IDApCmRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3N5c19yaXNj
di5jCmluZGV4IGM3MTIwMzdkYmUxMC4uN2E0MDE0NWU5NjI4IDEwMDY0NAotLS0gYS9hcmNoL3Jp
c2N2L2tlcm5lbC9zeXNfcmlzY3YuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3Yu
YwpAQCAtMTYyLDYgKzE2Miw3IEBAIHN0YXRpYyB2b2lkIGh3cHJvYmVfaXNhX2V4dDAoc3RydWN0
IHJpc2N2X2h3cHJvYmUgKnBhaXIsCiAJCUVYVF9LRVkoWkJCKTsKIAkJRVhUX0tFWShaQlMpOwog
CQlFWFRfS0VZKFpJQ0JPWik7CisJCUVYVF9LRVkoWkJDKTsKICN1bmRlZiBFWFRfS0VZCiAJfQog
Ci0tIAoyLjQyLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
