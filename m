Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C1BC04FFF
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 13:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4Xch/Qj8cfE+2qvZKhDVpGaQ3MMEuIvAsmFG7Ygax8c=; b=q7zT1n9uaHtA2f
	KPng1AIUs0JkaoqWmGqhiT2mGjK2Wo4xjWfpof5epWGC+9I3oNflzn96VNc1gZitYnT8c4wljsSH3
	aZT52JTaKXRmg9Ndii8+EbGoUtOXYuhIBO1ii3c/0QBJbrfbBt06gwRQILGnA/vf/AjPoln55lvYb
	J0QNtkCcIHiIiJOJZ/+87736ZPsZO6FmPlzHriNxguiaeGCCBJGtUiFdBlr/D0bJIBEyXnu/vfxu2
	vXTYxOmO2xIQTjDH8QbTXdOxoGShW9JGpbd1jXKNuBVPGXBu74r7CDPaKlsi2c4yLVW16vT7ZFHEZ
	+U4k2Wiw8aSOQJ5W4LpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxS5j-00000002QUP-1bXF;
	Thu, 18 Apr 2024 13:46:19 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxR7P-00000002CRD-3VHk
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 12:44:01 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-349a35ae298so80014f8f.2
        for <linux-riscv@lists.infradead.org>; Thu, 18 Apr 2024 05:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713444234; x=1714049034; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=32JRcAZ8LHhKBfsqOJDGu3ZSnqgwx85ZTFPgD6hMyrs=;
        b=YpgRr9wCoHdqrh2P1rxPe1/c2EnajB+OaPOPhZDL4Nh+XUViA8bRzCLMjV/+Fin/pO
         XUuVjD2TTfSrUCes9dmn99/Gq3HUp2N2eitS/Vm8a97qDg9NlkTwdM6TiNy+i6bHnfy5
         F4TyS0RlvKd9tUSdm6mX06t6Djj7h/3qG9+hyCvagmKUONJbxw2GpoFS26RmBtrbBJqQ
         W8rprKeIn3bUbHpr6vrIQOcbXktoTMbLM2/6gchJLusS+0VOFEjaA6jjof6cOWhVLwjB
         z3UWTfX0ht2LEK4kg/WTFdnEt6FtyHa8VUGi2FSBmAe0xsEHz/piSUVad8wnN6TZkb/G
         hEHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713444234; x=1714049034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=32JRcAZ8LHhKBfsqOJDGu3ZSnqgwx85ZTFPgD6hMyrs=;
        b=necDU0GaVx5oHlxqU+qxceB+HINX5Tbp7r0O+e/StNAztkcb0/A4n+m6IDCI922Y81
         BqZpdqMrir2vEpjEKUUuXRs3Mv06e3ueXOgvwa/U9Nv7+TMsXz9vrmNlRiposfGlsxJf
         fZoVS8sFZLjhJT/ENfeFw0E1+iAEeJzPifecDqmYsSgknMrsjF52tpgSp8AvHPKRi9To
         fllP/C88EqnFn0HhO8MV74YLJOHirjvBH0UeDqcGOnKo0VILuAYVqU5+UkQUVm9ZkFFk
         pRULhMPqm9/ccURbFG8LtmklPD+fGU3AOqhEt7EvRcoihpOxyHLlm0nm85OhrW9z2elM
         CADg==
X-Forwarded-Encrypted: i=1; AJvYcCWQWzd0F8khngFfMsAy9taVx9r4Gh+Jq1obWtH3jIEpiq4VG5wXZJDl3He5N3TxfhVxRWX/vzAnbKrsm2F5+T6/WVh0jTn9QQKPrFUDHyVR
X-Gm-Message-State: AOJu0YzCCcOmLFOJ/RcjTsucla61v1QrkQXV0bVCYo7IhB73N6Lx2WrM
	i1p2tbbyfCdeU8dua2qyh+/fndewZ8QT5tpCb9q0AH5a+RrTBOJWRaSvRd+1s/E=
X-Google-Smtp-Source: AGHT+IFziCRGNRnIuKdQWAYceCQlX3IZZXZCOpe0+zYvs0VTpiLEE6booy5ASHtPCGw5+ceQDaJ+5w==
X-Received: by 2002:a05:600c:1c91:b0:418:9a5b:d51 with SMTP id k17-20020a05600c1c9100b004189a5b0d51mr2042383wms.0.1713444233704;
        Thu, 18 Apr 2024 05:43:53 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:7b64:4d1d:16d8:e38b])
        by smtp.gmail.com with ESMTPSA id bi18-20020a05600c3d9200b00418d5b16fa2sm3373412wmb.30.2024.04.18.05.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 05:43:53 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Shuah Khan <shuah@kernel.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Atish Patra <atishp@atishpatra.org>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v2 00/12] Add support for a few Zc* extensions as well as Zcmop
Date: Thu, 18 Apr 2024 14:42:23 +0200
Message-ID: <20240418124300.1387978-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_054359_884811_DDEEBD6E 
X-CRM114-Status: UNSURE (   9.10  )
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

QWRkIHN1cHBvcnQgZm9yICh5ZXQgYWdhaW4pIG1vcmUgUlZBMjNVNjQgbWlzc2luZyBleHRlbnNp
b25zLiBBZGQKc3VwcG9ydCBmb3IgWmNtb3AsIFpjYSwgWmNmLCBaY2QgYW5kIFpjYiBleHRlbnNp
b25zIGlzYSBzdHJpbmcgcGFyc2luZywKaHdwcm9iZSBhbmQga3ZtIHN1cHBvcnQuIFpjZSwgWmNt
dCBhbmQgWmNtcCBleHRlbnNpb25zIGhhdmUgYmVlbiBsZWZ0Cm91dCBzaW5jZSB0aGV5IHRhcmdl
dCBtaWNyb2NvbnRyb2xsZXJzL2VtYmVkZGVkIENQVXMgYW5kIGFyZSBub3QgbmVlZGVkCmJ5IFJW
QTIzVTY0CgpUaGlzIHNlcmllcyBpcyBiYXNlZCBvbiB0aGUgWmltb3Agb25lIFsxXS4KCkxpbms6
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjQwNDA0MTAzMjU0LjE3NTI4
MzQtMS1jbGVnZXJAcml2b3NpbmMuY29tLyBbMV0KCi0tLQp2MjoKIC0gQWRkIFpjKiBkZXBlbmRl
bmNpZXMgdmFsaWRhdGlvbiBpbiBkdC1iaW5kaW5ncwogLSB2MTogaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGttbC8yMDI0MDQxMDA5MTEwNi43NDkyMzMtMS1jbGVnZXJAcml2b3NpbmMuY29tLwoK
Q2zDqW1lbnQgTMOpZ2VyICgxMik6CiAgZHQtYmluZGluZ3M6IHJpc2N2OiBhZGQgWmNhLCBaY2Ys
IFpjZCBhbmQgWmNiIElTQSBleHRlbnNpb24KICAgIGRlc2NyaXB0aW9uCiAgcmlzY3Y6IGR0czog
ZW5hYmxlIFpjKiBleHRlbnNpb25zIHdoZW4gbmVlZGVkCiAgZHQtYmluZGluZ3M6IHJpc2N2OiBh
ZGQgWmMqIGV4dGVuc2lvbiBydWxlcyBpbXBsaWVkIGJ5IEMgZXh0ZW5zaW9uCiAgcmlzY3Y6IGFk
ZCBJU0EgcGFyc2luZyBmb3IgWmNhLCBaY2YsIFpjZCBhbmQgWmNiCiAgcmlzY3Y6IGh3cHJvYmU6
IGV4cG9ydCBaY2EsIFpjZiwgWmNkIGFuZCBaY2IgSVNBIGV4dGVuc2lvbnMKICBSSVNDLVY6IEtW
TTogQWxsb3cgWmNhLCBaY2YsIFpjZCBhbmQgWmNiIGV4dGVuc2lvbnMgZm9yIEd1ZXN0L1ZNCiAg
S1ZNOiByaXNjdjogc2VsZnRlc3RzOiBBZGQgc29tZSBaYyogZXh0ZW5zaW9ucyB0byBnZXQtcmVn
LWxpc3QgdGVzdAogIGR0LWJpbmRpbmdzOiByaXNjdjogYWRkIFpjbW9wIElTQSBleHRlbnNpb24g
ZGVzY3JpcHRpb24KICByaXNjdjogYWRkIElTQSBleHRlbnNpb24gcGFyc2luZyBmb3IgWmNtb3AK
ICByaXNjdjogaHdwcm9iZTogZXhwb3J0IFpjbW9wIElTQSBleHRlbnNpb24KICBSSVNDLVY6IEtW
TTogQWxsb3cgWmNtb3AgZXh0ZW5zaW9uIGZvciBHdWVzdC9WTQogIEtWTTogcmlzY3Y6IHNlbGZ0
ZXN0czogQWRkIFpjbW9wIGV4dGVuc2lvbiB0byBnZXQtcmVnLWxpc3QgdGVzdAoKIERvY3VtZW50
YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdCAgICAgICAgICB8ICAyNCArKwogLi4uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvcmlzY3YvY3B1cy55YW1sICAgICAgIHwgICA4ICstCiAuLi4vZGV2aWNl
dHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwgfCAxMjQgKysrKysrKysrCiBhcmNo
L3Jpc2N2L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW4yMGktZDFzLmR0c2kgfCAgIDQgKy0KIGFyY2gv
cmlzY3YvYm9vdC9kdHMvbWljcm9jaGlwL21wZnMuZHRzaSAgICAgICB8ICAyMCArLQogYXJjaC9y
aXNjdi9ib290L2R0cy9yZW5lc2FzL3I5YTA3ZzA0M2YuZHRzaSAgIHwgICA0ICstCiBhcmNoL3Jp
c2N2L2Jvb3QvZHRzL3NpZml2ZS9mdTU0MC1jMDAwLmR0c2kgICAgfCAgMjAgKy0KIGFyY2gvcmlz
Y3YvYm9vdC9kdHMvc2lmaXZlL2Z1NzQwLWMwMDAuZHRzaSAgICB8ICAyMCArLQogYXJjaC9yaXNj
di9ib290L2R0cy9zb3BoZ28vY3YxOHh4LmR0c2kgICAgICAgIHwgICA0ICstCiBhcmNoL3Jpc2N2
L2Jvb3QvZHRzL3NvcGhnby9zZzIwNDItY3B1cy5kdHNpICAgfCAyNTYgKysrKysrKysrLS0tLS0t
LS0tCiBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzEwMC5kdHNpICAgICAgfCAgIDgg
Ky0KIGFyY2gvcmlzY3YvYm9vdC9kdHMvc3RhcmZpdmUvamg3MTEwLmR0c2kgICAgICB8ICAyMCAr
LQogYXJjaC9yaXNjdi9ib290L2R0cy90aGVhZC90aDE1MjAuZHRzaSAgICAgICAgIHwgIDE2ICst
CiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmggICAgICAgICAgICAgICAgfCAgIDUgKwog
YXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaCAgICAgICAgIHwgICA1ICsKIGFy
Y2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9rdm0uaCAgICAgICAgICAgICB8ICAgNSArCiBhcmNo
L3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgICAgICAgICAgICAgICAgfCAgIDUgKwogYXJjaC9y
aXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYyAgICAgICAgICAgICAgIHwgICA1ICsKIGFyY2gvcmlz
Y3Yva3ZtL3ZjcHVfb25lcmVnLmMgICAgICAgICAgICAgICAgICB8ICAxMCArCiAuLi4vc2VsZnRl
c3RzL2t2bS9yaXNjdi9nZXQtcmVnLWxpc3QuYyAgICAgICAgfCAgMjAgKysKIDIwIGZpbGVzIGNo
YW5nZWQsIDM5NCBpbnNlcnRpb25zKCspLCAxODkgZGVsZXRpb25zKC0pCgotLSAKMi40My4wCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
