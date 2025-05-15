Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D928C54756
	for <linux-riscv@archiver.kernel.org>; Thu, 15 May 2025 08:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sh9Mh3gAm/LHut+t72U4Eek8NV5OVg7cOtO6fACpo8o=; b=Xba4+KMasgPcX2
	JPRxGpRBKQeDftV+qPXB/2XWQLReNgsf4EP/rytJQaibh4MQCrn2XLpYfwitGCAxM0Vf+agWzp8i/
	dYJi52bNYzqjl+9iXf5BJbxFFwa0sck42aLV5n3DqDsviTWZutxZiYzSDzpXkhVjoqTWwW3FEvM90
	WspGYgcDe1yFk0Pf+CXG9+r1dXfak3xrcgj3h3RTrg98rEVqp8gpu+JSb3CBos7euqSq5LdDZc8uF
	dCKpzhj5t2iQ9UAs75hip1sWKWSSfRePvwaifzNhnT4FOXrRN+tuG0v7mu9FKfLxoB1n1BxQvQWxU
	QS//GDgUKxtbYidLhMyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTyD-0000000HXjm-2IyS;
	Thu, 15 May 2025 08:29:37 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTsc-0000000HVhj-2kYt
	for linux-riscv@lists.infradead.org;
	Thu, 15 May 2025 08:23:52 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3a1f8c85562so371400f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 15 May 2025 01:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747297429; x=1747902229; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JOCKOWdc9Rm9mheK+/kf775/MsCKzvlzcdVw7vqLpnQ=;
        b=j3O4/jTHBMS5I+NaJQvYqUKu3Lw4eX7VKa84F5aQ7BDRsV5n5hRPxsDeOuNhzd/9au
         Bhr0867toQQ5SczC4YoL0N7bAfeyu4f4K8lpN8SCnBWvI78WdlTmwyVg0xGkPSxZXsOo
         OriS7O+vrnPNqSrkd88A8sGmUmDmM1iz5D+Pm0EW54pXBO5GK1u2ejPvlFu8qoeUnDI5
         cpqlAxfW14pijRgbNsBJeivbZaPlhNjJuSiSPUHwViZbsgco+e+wyZibp4F8AMCE8nmk
         qhAqiXkMymttbWYbCyG7MrXqmZ0CSjRAdYODvr2QltBqmkaCRnpMz2hWHnSfHkN/zTt1
         MqZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747297429; x=1747902229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JOCKOWdc9Rm9mheK+/kf775/MsCKzvlzcdVw7vqLpnQ=;
        b=lvUhePoi2qeXieQv+qZBBlkojPcOAYz8zvrTAM+UlYoogB185/anAsOy3p3QpYzvVN
         TlE++7aIQEU//Wa/dXdK0roNGDgLem3btiTHuju3O/u5jWu3BQlQimrfEbUV0XxLqApo
         ZW/lmdGzbFR83DdRtIPToWgkyoATWS/HmWAW2uju75ZBBI704osCI1tfGa9N+TNt9ogI
         Zt4okmLADIvpvEFjNZbyC6zEbuL0zMtE/gswEAZpR+x40YAcdun+/Us7om/7LzeAt4Bg
         iBrzLq4RtrG6LX7Z9EUzF/bHpOYF9dqhD7hrUFcIt3+CfSBGUUAgYlJryfrYUQtinqiI
         YJvg==
X-Forwarded-Encrypted: i=1; AJvYcCW7chX1IXpbUytBj3Vtzms4yR2rc8DmEPGIQT4m56/LxHM7TvCMLnsUsf2mDZFvf2LwbLCC+BEB4zymDQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxES/lSBZNuXLKpfPcHVG7PNCCRyINdNwDWFFzh2SisD2OngDEx
	x0RCKUIa479FAd2+7hygt+L7khLYxPQJUV+4KUylwrx3Wcw2ou35KqSEBTiI5Gg=
X-Gm-Gg: ASbGncsPDM2/2t83lZyi8S7Q/lkgHjLls509CcoiZsSziqEC9az08HlVhusfrAdTNnT
	3ptr0iSFGq6d34TEAFI1AefNBw0pbtqAPMvLNVv8hxIxBBHPMpTZbgn+dtBJAcQGT53ofSrhxSC
	9c8bNRFmTLlsXnz/ijz2dhyTp7dv9sQOFpUTegGXKqKVsmaz8pLAmXd4bW8auUHt8LAZHUJcNZF
	bHuJLHk0eTlXG42LUf4nWyuzfNAjsYjm6UpvKDqdxZqDXdC9cqNRxLLwjiFOAvBDleR0gPQz0ZC
	isuBqxu1XXb+BrQXwOkuGnmLhKr+XgMEk7/UWJzYvbYHYFE84aw=
X-Google-Smtp-Source: AGHT+IEDgFHO6gLcxW55XNJ4ZpshV/UtxVM8HE5Xz/T24HqOjUp3uFD1+/lwkhut6j4hCuDDjciWCg==
X-Received: by 2002:a05:6000:1ac6:b0:3a1:fd29:b892 with SMTP id ffacd0b85a97d-3a3537b4926mr1265289f8f.49.1747297428847;
        Thu, 15 May 2025 01:23:48 -0700 (PDT)
Received: from carbon-x1.. ([91.197.138.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f395166fsm59310785e9.18.2025.05.15.01.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 01:23:47 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v7 04/14] riscv: sbi: add FWFT extension interface
Date: Thu, 15 May 2025 10:22:05 +0200
Message-ID: <20250515082217.433227-5-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515082217.433227-1-cleger@rivosinc.com>
References: <20250515082217.433227-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_012350_699195_E1990390 
X-CRM114-Status: GOOD (  12.73  )
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

VGhpcyBTQkkgZXh0ZW5zaW9ucyBlbmFibGVzIHN1cGVydmlzb3IgbW9kZSB0byBjb250cm9sIGZl
YXR1cmUgdGhhdCBhcmUKdW5kZXIgTS1tb2RlIGNvbnRyb2wgKEZvciBpbnN0YW5jZSwgU3ZhZHUg
bWVudmNmZyBBRFVFIGJpdCwgU3NkYmx0cnAKRFRFLCBldGMpLiBBZGQgYW4gaW50ZXJmYWNlIHRv
IHNldCBsb2NhbCBmZWF0dXJlcyBmb3IgYSBzcGVjaWZpYyBjcHUKbWFzayBhcyB3ZWxsIGFzIGZv
ciB0aGUgb25saW5lIGNwdSBtYXNrLgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxj
bGVnZXJAcml2b3NpbmMuY29tPgpSZXZpZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVu
dGFuYW1pY3JvLmNvbT4KUmV2aWV3ZWQtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2b3NpbmMu
Y29tPgotLS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmggfCAxNyArKysrKysrKysrKwog
YXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMgICAgICB8IDU3ICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA3NCBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vc2JpLmgKaW5kZXggMDkzOGYyYThkMDFiLi4zNDFlNzQyMzhhYTAgMTAwNjQ0Ci0tLSBhL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9z
YmkuaApAQCAtNTAzLDYgKzUwMywyMyBAQCBpbnQgc2JpX3JlbW90ZV9oZmVuY2VfdnZtYV9hc2lk
KGNvbnN0IHN0cnVjdCBjcHVtYXNrICpjcHVfbWFzaywKIAkJCQl1bnNpZ25lZCBsb25nIGFzaWQp
OwogbG9uZyBzYmlfcHJvYmVfZXh0ZW5zaW9uKGludCBleHQpOwogCitpbnQgc2JpX2Z3ZnRfc2V0
KHUzMiBmZWF0dXJlLCB1bnNpZ25lZCBsb25nIHZhbHVlLCB1bnNpZ25lZCBsb25nIGZsYWdzKTsK
K2ludCBzYmlfZndmdF9zZXRfY3B1bWFzayhjb25zdCBjcHVtYXNrX3QgKm1hc2ssIHUzMiBmZWF0
dXJlLAorCQkJIHVuc2lnbmVkIGxvbmcgdmFsdWUsIHVuc2lnbmVkIGxvbmcgZmxhZ3MpOworLyoq
CisgKiBzYmlfZndmdF9zZXRfb25saW5lX2NwdXMoKSAtIFNldCBhIGZlYXR1cmUgb24gYWxsIG9u
bGluZSBjcHVzCisgKiBAZmVhdHVyZTogVGhlIGZlYXR1cmUgdG8gYmUgc2V0CisgKiBAdmFsdWU6
IFRoZSBmZWF0dXJlIHZhbHVlIHRvIGJlIHNldAorICogQGZsYWdzOiBGV0ZUIGZlYXR1cmUgc2V0
IGZsYWdzCisgKgorICogUmV0dXJuOiAwIG9uIHN1Y2Nlc3MsIGFwcHJvcHJpYXRlIGxpbnV4IGVy
cm9yIGNvZGUgb3RoZXJ3aXNlLgorICovCitzdGF0aWMgaW5saW5lIGludCBzYmlfZndmdF9zZXRf
b25saW5lX2NwdXModTMyIGZlYXR1cmUsIHVuc2lnbmVkIGxvbmcgdmFsdWUsCisJCQkJCSAgIHVu
c2lnbmVkIGxvbmcgZmxhZ3MpCit7CisJcmV0dXJuIHNiaV9md2Z0X3NldF9jcHVtYXNrKGNwdV9v
bmxpbmVfbWFzaywgZmVhdHVyZSwgdmFsdWUsIGZsYWdzKTsKK30KKwogLyogQ2hlY2sgaWYgY3Vy
cmVudCBTQkkgc3BlY2lmaWNhdGlvbiB2ZXJzaW9uIGlzIDAuMSBvciBub3QgKi8KIHN0YXRpYyBp
bmxpbmUgaW50IHNiaV9zcGVjX2lzXzBfMSh2b2lkKQogewpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9rZXJuZWwvc2JpLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zYmkuYwppbmRleCAxZDQ0YzM1MzA1
YTkuLjgxOGVmYWZkYzhlOSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMKKysr
IGIvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMKQEAgLTI5OSw2ICsyOTksNjMgQEAgc3RhdGljIGlu
dCBfX3NiaV9yZmVuY2VfdjAyKGludCBmaWQsIGNvbnN0IHN0cnVjdCBjcHVtYXNrICpjcHVfbWFz
aywKIAlyZXR1cm4gMDsKIH0KIAorc3RydWN0IGZ3ZnRfc2V0X3JlcSB7CisJdTMyIGZlYXR1cmU7
CisJdW5zaWduZWQgbG9uZyB2YWx1ZTsKKwl1bnNpZ25lZCBsb25nIGZsYWdzOworCWF0b21pY190
IGVycm9yOworfTsKKworc3RhdGljIHZvaWQgY3B1X3NiaV9md2Z0X3NldCh2b2lkICphcmcpCit7
CisJc3RydWN0IGZ3ZnRfc2V0X3JlcSAqcmVxID0gYXJnOworCWludCByZXQ7CisKKwlyZXQgPSBz
YmlfZndmdF9zZXQocmVxLT5mZWF0dXJlLCByZXEtPnZhbHVlLCByZXEtPmZsYWdzKTsKKwlpZiAo
cmV0KQorCQlhdG9taWNfc2V0KCZyZXEtPmVycm9yLCByZXQpOworfQorCisvKioKKyAqIHNiaV9m
d2Z0X3NldCgpIC0gU2V0IGEgZmVhdHVyZSBvbiB0aGUgbG9jYWwgaGFydAorICogQGZlYXR1cmU6
IFRoZSBmZWF0dXJlIElEIHRvIGJlIHNldAorICogQHZhbHVlOiBUaGUgZmVhdHVyZSB2YWx1ZSB0
byBiZSBzZXQKKyAqIEBmbGFnczogRldGVCBmZWF0dXJlIHNldCBmbGFncworICoKKyAqIFJldHVy
bjogMCBvbiBzdWNjZXNzLCBhcHByb3ByaWF0ZSBsaW51eCBlcnJvciBjb2RlIG90aGVyd2lzZS4K
KyAqLworaW50IHNiaV9md2Z0X3NldCh1MzIgZmVhdHVyZSwgdW5zaWduZWQgbG9uZyB2YWx1ZSwg
dW5zaWduZWQgbG9uZyBmbGFncykKK3sKKwlyZXR1cm4gLUVPUE5PVFNVUFA7Cit9CisKKy8qKgor
ICogc2JpX2Z3ZnRfc2V0X2NwdW1hc2soKSAtIFNldCBhIGZlYXR1cmUgZm9yIHRoZSBzcGVjaWZp
ZWQgY3B1bWFzaworICogQG1hc2s6IENQVSBtYXNrIG9mIGNwdXMgdGhhdCBuZWVkIHRoZSBmZWF0
dXJlIHRvIGJlIHNldAorICogQGZlYXR1cmU6IFRoZSBmZWF0dXJlIElEIHRvIGJlIHNldAorICog
QHZhbHVlOiBUaGUgZmVhdHVyZSB2YWx1ZSB0byBiZSBzZXQKKyAqIEBmbGFnczogRldGVCBmZWF0
dXJlIHNldCBmbGFncworICoKKyAqIFJldHVybjogMCBvbiBzdWNjZXNzLCBhcHByb3ByaWF0ZSBs
aW51eCBlcnJvciBjb2RlIG90aGVyd2lzZS4KKyAqLworaW50IHNiaV9md2Z0X3NldF9jcHVtYXNr
KGNvbnN0IGNwdW1hc2tfdCAqbWFzaywgdTMyIGZlYXR1cmUsCisJCQkgICAgICAgdW5zaWduZWQg
bG9uZyB2YWx1ZSwgdW5zaWduZWQgbG9uZyBmbGFncykKK3sKKwlzdHJ1Y3QgZndmdF9zZXRfcmVx
IHJlcSA9IHsKKwkJLmZlYXR1cmUgPSBmZWF0dXJlLAorCQkudmFsdWUgPSB2YWx1ZSwKKwkJLmZs
YWdzID0gZmxhZ3MsCisJCS5lcnJvciA9IEFUT01JQ19JTklUKDApLAorCX07CisKKwlpZiAoZmVh
dHVyZSAmIFNCSV9GV0ZUX0dMT0JBTF9GRUFUVVJFX0JJVCkKKwkJcmV0dXJuIC1FSU5WQUw7CisK
Kwlvbl9lYWNoX2NwdV9tYXNrKG1hc2ssIGNwdV9zYmlfZndmdF9zZXQsICZyZXEsIDEpOworCisJ
cmV0dXJuIGF0b21pY19yZWFkKCZyZXEuZXJyb3IpOworfQorCiAvKioKICAqIHNiaV9zZXRfdGlt
ZXIoKSAtIFByb2dyYW0gdGhlIHRpbWVyIGZvciBuZXh0IHRpbWVyIGV2ZW50LgogICogQHN0aW1l
X3ZhbHVlOiBUaGUgdmFsdWUgYWZ0ZXIgd2hpY2ggbmV4dCB0aW1lciBldmVudCBzaG91bGQgZmly
ZS4KLS0gCjIuNDkuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
