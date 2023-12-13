Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D93D1C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 11:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NE1+WzsS1S30f205vmgax4nIUABj+hiQO8yCneWEllo=; b=3DQf+s52ygayGx
	sK+PxwthIgiRRK2W08X79R9H9qBIE83D2JqlJEjRnh24pXdfhhrNqgMBOapTwnK4TZR6uWiZzu3pi
	xhF7K6A7ujI2XULywaoYNje42LcO1Byg1kTAZuJR7uH7htB8QC8vN6BU8trORZ0ktUmNfOBop+/os
	ee0SjA2kWuWeG73A8bc+tLD9hvQyLn3w41/8MQW0OkL72ooZHaOAay3S87oUZHyq44j4fy0QuxPLE
	PuvZI5462TgsJnoHRkRfKMPX+9W/CHTvQbqKqF7SjMFSHrMQeUPvtzpJ6OQGXd7JsWa6/SWftSrwc
	eeKH7nv3J7DJJMMDbSMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDNUT-00ET8t-0R;
	Wed, 13 Dec 2023 11:33:25 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDNUO-00ET1m-0Z
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 11:33:21 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2c9f575d4b2so16198021fa.1
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 03:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702467194; x=1703071994; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fxiI83AWHviDA1K2goPpANE3T3h3Nt6zkBhZOZxUOr0=;
        b=c9Nv6c2VKCWSpc38hq0a1oPl/GmzxJ/B2ogWeQ9BPx15fmN6Bmz7QpfqkQruipoqCj
         NJMRG17sE4ds1advspVXzJiWNd2U7+0dxn1pBIyMwPRXSXZy0CHbYQ9QrGe2cQ5mpdsk
         ks9swBge6dcWT/xmvyqe4PBPy3i8ZRJAFQq5U4jbwnWlEqe44pbb7SiLZF1qXfaMK6g5
         E71bG+Kw4ADQaZdiPWlXVna49paY0q3pODukVwndjPsPCJSgRu7HWiew78NkWUGmDdX0
         AeV9l2ZUzZME+Ia5gYzPB2wDn7sjvTEcPvKOpuJcOdF78gA8fv7/6OjjyVIiL89q0C9B
         94PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702467194; x=1703071994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fxiI83AWHviDA1K2goPpANE3T3h3Nt6zkBhZOZxUOr0=;
        b=VOGVD9yWbKf1nUixyoAraU8U1yvL/VCTLh7X3sua/cFZY4yJLjwwjOz4V3vOw+Nvgd
         QXa83fgYA91hFOtrDyBzUhT2jcfSgaQGuluVNYobABtI7bAOAfcbV+SpF+k7DNphGWld
         +Jv1XOUZrbytMY78//zInPNv3/u3unLnhJIlGiXuAt59d5J4fe0bsUo0uKaxK06WQ2vB
         TN21Ba5CoOjeA4sPrELa3dLZ4OeV9HH4Pg60rRqRjaQUifCBl3EUSYFQKncjAZ6cgjzh
         fSRMUxiDGwbA/AH4/qqWMDrL/EYtvBBWSjGYsr77WxjzPljuJ1TB2ITWkfRy4tak8/Be
         fwUA==
X-Gm-Message-State: AOJu0Yw5tl7Me45U7QkcOsddOO9PbVhcoZ4YRbO44WXrGzvkQTTEUDRU
	ekRl/Q6F8Q+BGKdeqF80OVkPYA==
X-Google-Smtp-Source: AGHT+IGFQ9eQ0IrP8TYC+dSFSgqEE4ePc+Ww0dv4Sk8Ab3H2/aQW5oT0kIoa/QE1H0U8J0J6zKys2w==
X-Received: by 2002:a2e:bc23:0:b0:2c9:edfa:f7a0 with SMTP id b35-20020a2ebc23000000b002c9edfaf7a0mr8605317ljf.1.1702467194165;
        Wed, 13 Dec 2023 03:33:14 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:c564:f167:d072:5672])
        by smtp.gmail.com with ESMTPSA id m27-20020a05600c3b1b00b0040b38292253sm22433137wms.30.2023.12.13.03.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 03:33:13 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Robbin Ehn <rehn@rivosinc.com>
Subject: [PATCH 2/9] riscv: hwprobe: export Ztso ISA extension
Date: Wed, 13 Dec 2023 12:32:58 +0100
Message-ID: <20231213113308.133176-3-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231213113308.133176-1-cleger@rivosinc.com>
References: <20231213113308.133176-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_033320_221776_A8911DDE 
X-CRM114-Status: GOOD (  10.50  )
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

RXhwb3J0IHRoZSBadHNvIGV4dGVuc2lvbiB0byB1c2Vyc3BhY2UuCgpTaWduZWQtb2ZmLWJ5OiBD
bMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+Ci0tLQogRG9jdW1lbnRhdGlvbi9h
cmNoL3Jpc2N2L2h3cHJvYmUucnN0ICB8IDQgKysrKwogYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkv
YXNtL2h3cHJvYmUuaCB8IDEgKwogYXJjaC9yaXNjdi9rZXJuZWwvc3lzX3Jpc2N2LmMgICAgICAg
ICB8IDEgKwogMyBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9E
b2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QgYi9Eb2N1bWVudGF0aW9uL2FyY2gv
cmlzY3YvaHdwcm9iZS5yc3QKaW5kZXggNDE0NjNiOTMyMjY4Li4xMGJkN2IxNzAxMTggMTAwNjQ0
Ci0tLSBhL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdAorKysgYi9Eb2N1bWVu
dGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QKQEAgLTE2MSw2ICsxNjEsMTAgQEAgVGhlIGZv
bGxvd2luZyBrZXlzIGFyZSBkZWZpbmVkOgogICAgICAgIGRlZmluZWQgaW4gdGhlIFJJU0MtViBJ
U0EgbWFudWFsIHN0YXJ0aW5nIGZyb20gY29tbWl0IDA1NmI2ZmY0NjdjNwogICAgICAgICgiWmZh
IGlzIHJhdGlmaWVkIikuCiAKKyAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9FWFRfWlRTT2A6
IFRoZSBadHNvIGV4dGVuc2lvbiBpcyBzdXBwb3J0ZWQgYXMKKyAgICAgICBkZWZpbmVkIGluIHRo
ZSBSSVNDLVYgSVNBIG1hbnVhbCBzdGFydGluZyBmcm9tIGNvbW1pdCA1NjE4ZmI1YTIxNmIKKyAg
ICAgICAoIlp0c28gaXMgbm93IHJhdGlmaWVkLiIpCisKICogOmM6bWFjcm86YFJJU0NWX0hXUFJP
QkVfS0VZX0NQVVBFUkZfMGA6IEEgYml0bWFzayB0aGF0IGNvbnRhaW5zIHBlcmZvcm1hbmNlCiAg
IGluZm9ybWF0aW9uIGFib3V0IHRoZSBzZWxlY3RlZCBzZXQgb2YgcHJvY2Vzc29ycy4KIApkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaCBiL2FyY2gvcmlz
Y3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgKaW5kZXggOTFmYmUxYTdmMmUyLi4wMWFjM2Rj
MTk2ZTUgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgK
KysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaApAQCAtNTYsNiArNTYs
NyBAQCBzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSB7CiAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9a
VkZICQkoMSA8PCAzMCkKICNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhUX1pWRkhNSU4JKDEgPDwg
MzEpCiAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aRkEJCSgxVUxMIDw8IDMyKQorI2RlZmlu
ZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWlRTTwkJKDFVTEwgPDwgMzMpCiAjZGVmaW5lIFJJU0NWX0hX
UFJPQkVfS0VZX0NQVVBFUkZfMAk1CiAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX01JU0FMSUdORURf
VU5LTk9XTgkoMCA8PCAwKQogI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX0VNVUxB
VEVECSgxIDw8IDApCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYyBi
L2FyY2gvcmlzY3Yva2VybmVsL3N5c19yaXNjdi5jCmluZGV4IGYwYmQ3YjQ4MGI3Zi4uNjU2NGZh
OWU3YTdmIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYworKysgYi9h
cmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYwpAQCAtMTc0LDYgKzE3NCw3IEBAIHN0YXRpYyB2
b2lkIGh3cHJvYmVfaXNhX2V4dDAoc3RydWN0IHJpc2N2X2h3cHJvYmUgKnBhaXIsCiAJCUVYVF9L
RVkoWktTSCk7CiAJCUVYVF9LRVkoWktUKTsKIAkJRVhUX0tFWShaSUhJTlROVEwpOworCQlFWFRf
S0VZKFpUU08pOwogCiAJCWlmIChoYXNfdmVjdG9yKCkpIHsKIAkJCUVYVF9LRVkoWlZCQik7Ci0t
IAoyLjQzLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
