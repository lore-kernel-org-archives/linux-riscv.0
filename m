Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFDC3CD1296
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Apr 2024 21:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VaQ1HylM5lwDLLlORFmy7JIv/U4E6Vr3kNi0j8GEI3U=; b=jr8q41nhE7j03g
	OM3aKd5rH5LNxDl7NrQvfW2HDIcgwE5cQkqvpSeqMHjp3WJmSsn0XKHYtv7zGMXmqQ74/qwwndNtI
	qllMF4gj3PC5rVerm0kzPhq4Jfs/e6mkZeFREIe50AnDLdZjgmpiDrt1sUX+BZaBr7efL7sySHY0F
	O96getns58vobyg4+Q58L3DaAUbYBe1B9x0OAAzJ0eA9i4K30O91UmOPDrzT/rSnGXEUoH40COe/s
	ummDd2jzd7HZAUOO7MFEBweMp9fezWsl7XILs/+eTgUrIhdlVRVhComVZ4qVSW4tqcwUNFPBIM4Fa
	vh5c8B04x6Fhn6XKmiuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rta88-0000000DYZF-0ZhA;
	Sun, 07 Apr 2024 21:32:48 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rta83-0000000DYY1-3n7r
	for linux-riscv@lists.infradead.org;
	Sun, 07 Apr 2024 21:32:45 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2d48d75ab70so52171431fa.0
        for <linux-riscv@lists.infradead.org>; Sun, 07 Apr 2024 14:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vrull.eu; s=google; t=1712525561; x=1713130361; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4EsNSIHIYC4W6bV2ld6cL2XgDhSvlKY5N8B8yWmcW/U=;
        b=kIyfg8TByfRPbbLnrKFC4Qe+GKl/JWH/2CPEtx/aIMaIO5O2NS/8W3cV0sani4iarq
         ug6Ws1y2D7E08Q1kryNODb1uUlkkCqnWBBkMX1kKATMmuwbXmjKtHrnxsGeWhnEn4H3h
         tOq06KPkYlle5rg0QVaw212FfsHZ4WJhHFunbJkuhdKOVwOAGcb1vmu/kiWAppVhz93B
         6IlOGCoFOC+HTpG565HaUxcFflmcOcYbjvvJrlLiUc4yE4uNSonV0ZaJsIHsVsj1KI2d
         tI4socR6nK0r2p5A2r4GQtvet6UmEfl/s7ZzW1Y9tqRBUrpbkVo8UEPJNIJbHgbYzXX1
         1MuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712525561; x=1713130361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4EsNSIHIYC4W6bV2ld6cL2XgDhSvlKY5N8B8yWmcW/U=;
        b=P8wPS18Hw/Qwa0l4iUzUP6WABIQUQGYcooWOaGv7Se3BmqgFIUbCB45fvW5p4qOxUb
         eGK8AfOTeWKPap6KYZhce6yWqAM48SJMBGTRDIfWwyYK4UlHwq8iflNZPapI+frTk8/P
         tdB5PXh96vlKq/PF1n4Mo97aM0ftIvnNGpH/Umty8t+E7EjQIqXLrPUluS3foQTWYRj9
         nRuWd4c0gD1li5ciuvp+6R4/9VP35PUxKkDf6P5/XL2fDflx5uT+hZVKiI5nEGlJJSex
         DcHHjErFgq82myzikyqMpeecL2j7T/BBjd56IMpRYKg5+T7oCxn8vpmp/owebs+o3m7U
         G5Sw==
X-Gm-Message-State: AOJu0YxS6VURCfRWV1Bg+V1gAmPOgF8kVpfhH8s/ftbbM0H75ww4UtOD
	9ZtUcp4w5exW/OKCrF/XS0uUvtY2Qt6stbF+rdj+HP7295SKKV0PCSEVpUrXcJDmi2kVi/ret58
	sUhw=
X-Google-Smtp-Source: AGHT+IGi22D+aAqEe+3xMw9LUgzcozlZLoUYTQmYP6THAXpqnmjX0IEtXPFfJdDttmWTP1xPE/azBw==
X-Received: by 2002:a2e:b00c:0:b0:2d4:9201:d505 with SMTP id y12-20020a2eb00c000000b002d49201d505mr4908747ljk.51.1712525560966;
        Sun, 07 Apr 2024 14:32:40 -0700 (PDT)
Received: from antares.fritz.box (62-178-148-172.cable.dynamic.surfer.at. [62.178.148.172])
        by smtp.gmail.com with ESMTPSA id i2-20020a50fc02000000b0056e22be831dsm3267562edr.42.2024.04.07.14.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Apr 2024 14:32:40 -0700 (PDT)
From: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Cooper Qu <cooper.qu@linux.alibaba.com>,
	Zhiwei Liu <zhiwei_liu@linux.alibaba.com>,
	Huang Tao <eric.huang@linux.alibaba.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor@kernel.org>,
	Qingfang Deng <dqfext@gmail.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel.holland@sifive.com>
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/2] riscv: thead: Rename T-Head PBMT to MAE
Date: Sun,  7 Apr 2024 23:32:35 +0200
Message-ID: <20240407213236.2121592-2-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240407213236.2121592-1-christoph.muellner@vrull.eu>
References: <20240407213236.2121592-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240407_143243_969955_BE1D85AF 
X-CRM114-Status: GOOD (  15.15  )
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

VC1IZWFkJ3MgdmVuZG9yIGV4dGVuc2lvbiB0byBzZXQgcGFnZSBhdHRyaWJ1dGVzIGhhcyB0aGUg
bmFtZQpNQUUgKG1lbW9yeSBhdHRyaWJ1dGUgZXh0ZW5zaW9uKS4KTGV0J3MgcmVuYW1lIGl0LCBz
byBpdCBpcyBjbGVhciB3aGF0IHRoaXMgcmVmZXJlcyB0by4KCkxpbms6IGh0dHBzOi8vZ2l0aHVi
LmNvbS9ULWhlYWQtU2VtaS90aGVhZC1leHRlbnNpb24tc3BlYy9ibG9iL21hc3Rlci94dGhlYWRt
YWUuYWRvYwpSZXZpZXdlZC1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlw
LmNvbT4KU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIE3DvGxsbmVyIDxjaHJpc3RvcGgubXVlbGxu
ZXJAdnJ1bGwuZXU+Ci0tLQogYXJjaC9yaXNjdi9LY29uZmlnLmVycmF0YSAgICAgICAgICAgIHwg
IDggKysrKy0tLS0KIGFyY2gvcmlzY3YvZXJyYXRhL3RoZWFkL2VycmF0YS5jICAgICB8IDEwICsr
KysrLS0tLS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vZXJyYXRhX2xpc3QuaCB8IDIwICsrKysr
KysrKystLS0tLS0tLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDE5IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvS2NvbmZpZy5lcnJhdGEgYi9hcmNo
L3Jpc2N2L0tjb25maWcuZXJyYXRhCmluZGV4IDkxMGJhODgzN2FkZC4uMmFjYzdkODc2ZTFmIDEw
MDY0NAotLS0gYS9hcmNoL3Jpc2N2L0tjb25maWcuZXJyYXRhCisrKyBiL2FyY2gvcmlzY3YvS2Nv
bmZpZy5lcnJhdGEKQEAgLTgyLDE0ICs4MiwxNCBAQCBjb25maWcgRVJSQVRBX1RIRUFECiAKIAkg
IE90aGVyd2lzZSwgcGxlYXNlIHNheSAiTiIgaGVyZSB0byBhdm9pZCB1bm5lY2Vzc2FyeSBvdmVy
aGVhZC4KIAotY29uZmlnIEVSUkFUQV9USEVBRF9QQk1UCi0JYm9vbCAiQXBwbHkgVC1IZWFkIG1l
bW9yeSB0eXBlIGVycmF0YSIKK2NvbmZpZyBFUlJBVEFfVEhFQURfTUFFCisJYm9vbCAiQXBwbHkg
VC1IZWFkJ3MgbWVtb3J5IGF0dHJpYnV0ZSBleHRlbnNpb24gKFhUaGVhZE1hZSkgZXJyYXRhIgog
CWRlcGVuZHMgb24gRVJSQVRBX1RIRUFEICYmIDY0QklUICYmIE1NVQogCXNlbGVjdCBSSVNDVl9B
TFRFUk5BVElWRV9FQVJMWQogCWRlZmF1bHQgeQogCWhlbHAKLQkgIFRoaXMgd2lsbCBhcHBseSB0
aGUgbWVtb3J5IHR5cGUgZXJyYXRhIHRvIGhhbmRsZSB0aGUgbm9uLXN0YW5kYXJkCi0JICBtZW1v
cnkgdHlwZSBiaXRzIGluIHBhZ2UtdGFibGUtZW50cmllcyBvbiBULUhlYWQgU29Dcy4KKwkgIFRo
aXMgd2lsbCBhcHBseSB0aGUgbWVtb3J5IGF0dHJpYnV0ZSBleHRlbnNpb24gZXJyYXRhIHRvIGhh
bmRsZSB0aGUKKwkgIG5vbi1zdGFuZGFyZCBQVEUgdXRpbGl6YXRpb24gb24gVC1IZWFkIFNvQ3Mg
KFhUaGVhZE1hZSkuCiAKIAkgIElmIHlvdSBkb24ndCBrbm93IHdoYXQgdG8gZG8gaGVyZSwgc2F5
ICJZIi4KIApkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9lcnJhdGEvdGhlYWQvZXJyYXRhLmMgYi9h
cmNoL3Jpc2N2L2VycmF0YS90aGVhZC9lcnJhdGEuYwppbmRleCBiMWM0MTBiYmMxYWUuLjZlN2Vl
MWYxNmJlZSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9lcnJhdGEvdGhlYWQvZXJyYXRhLmMKKysr
IGIvYXJjaC9yaXNjdi9lcnJhdGEvdGhlYWQvZXJyYXRhLmMKQEAgLTE5LDEwICsxOSwxMCBAQAog
I2luY2x1ZGUgPGFzbS9wYXRjaC5oPgogI2luY2x1ZGUgPGFzbS92ZW5kb3JpZF9saXN0Lmg+CiAK
LXN0YXRpYyBib29sIGVycmF0YV9wcm9iZV9wYm10KHVuc2lnbmVkIGludCBzdGFnZSwKLQkJCSAg
ICAgIHVuc2lnbmVkIGxvbmcgYXJjaF9pZCwgdW5zaWduZWQgbG9uZyBpbXBpZCkKK3N0YXRpYyBi
b29sIGVycmF0YV9wcm9iZV9tYWUodW5zaWduZWQgaW50IHN0YWdlLAorCQkJICAgICB1bnNpZ25l
ZCBsb25nIGFyY2hfaWQsIHVuc2lnbmVkIGxvbmcgaW1waWQpCiB7Ci0JaWYgKCFJU19FTkFCTEVE
KENPTkZJR19FUlJBVEFfVEhFQURfUEJNVCkpCisJaWYgKCFJU19FTkFCTEVEKENPTkZJR19FUlJB
VEFfVEhFQURfTUFFKSkKIAkJcmV0dXJuIGZhbHNlOwogCiAJaWYgKGFyY2hfaWQgIT0gMCB8fCBp
bXBpZCAhPSAwKQpAQCAtMTQwLDggKzE0MCw4IEBAIHN0YXRpYyB1MzIgdGhlYWRfZXJyYXRhX3By
b2JlKHVuc2lnbmVkIGludCBzdGFnZSwKIHsKIAl1MzIgY3B1X3JlcV9lcnJhdGEgPSAwOwogCi0J
aWYgKGVycmF0YV9wcm9iZV9wYm10KHN0YWdlLCBhcmNoaWQsIGltcGlkKSkKLQkJY3B1X3JlcV9l
cnJhdGEgfD0gQklUKEVSUkFUQV9USEVBRF9QQk1UKTsKKwlpZiAoZXJyYXRhX3Byb2JlX21hZShz
dGFnZSwgYXJjaGlkLCBpbXBpZCkpCisJCWNwdV9yZXFfZXJyYXRhIHw9IEJJVChFUlJBVEFfVEhF
QURfTUFFKTsKIAogCWVycmF0YV9wcm9iZV9jbW8oc3RhZ2UsIGFyY2hpZCwgaW1waWQpOwogCmRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2VycmF0YV9saXN0LmggYi9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2VycmF0YV9saXN0LmgKaW5kZXggMWYyZGJmYjhhOGJmLi5lZmQ4NTFl
MWI0ODMgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZXJyYXRhX2xpc3QuaAor
KysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2VycmF0YV9saXN0LmgKQEAgLTIzLDcgKzIzLDcg
QEAKICNlbmRpZgogCiAjaWZkZWYgQ09ORklHX0VSUkFUQV9USEVBRAotI2RlZmluZQlFUlJBVEFf
VEhFQURfUEJNVCAwCisjZGVmaW5lCUVSUkFUQV9USEVBRF9NQUUgMAogI2RlZmluZQlFUlJBVEFf
VEhFQURfUE1VIDEKICNkZWZpbmUJRVJSQVRBX1RIRUFEX05VTUJFUiAyCiAjZW5kaWYKQEAgLTUz
LDIwICs1MywyMCBAQCBhc20oQUxURVJOQVRJVkUoInNmZW5jZS52bWEgJTAiLCAic2ZlbmNlLnZt
YSIsIFNJRklWRV9WRU5ET1JfSUQsCVwKICAqIGluIHRoZSBkZWZhdWx0IGNhc2UuCiAgKi8KICNk
ZWZpbmUgQUxUX1NWUEJNVF9TSElGVCA2MQotI2RlZmluZSBBTFRfVEhFQURfUEJNVF9TSElGVCA1
OQorI2RlZmluZSBBTFRfVEhFQURfTUFFX1NISUZUIDU5CiAjZGVmaW5lIEFMVF9TVlBCTVQoX3Zh
bCwgcHJvdCkJCQkJCQlcCiBhc20oQUxURVJOQVRJVkVfMigibGkgJTAsIDBcdFxubm9wIiwJCQkJ
CVwKIAkJICAibGkgJTAsICUxXHRcbnNsbGkgJTAsJTAsJTMiLCAwLAkJCVwKIAkJCVJJU0NWX0lT
QV9FWFRfU1ZQQk1ULCBDT05GSUdfUklTQ1ZfSVNBX1NWUEJNVCwJXAogCQkgICJsaSAlMCwgJTJc
dFxuc2xsaSAlMCwlMCwlNCIsIFRIRUFEX1ZFTkRPUl9JRCwJXAotCQkJRVJSQVRBX1RIRUFEX1BC
TVQsIENPTkZJR19FUlJBVEFfVEhFQURfUEJNVCkJXAorCQkJRVJSQVRBX1RIRUFEX01BRSwgQ09O
RklHX0VSUkFUQV9USEVBRF9NQUUpCVwKIAkJOiAiPXIiKF92YWwpCQkJCQkJXAogCQk6ICJJIihw
cm90IyNfU1ZQQk1UID4+IEFMVF9TVlBCTVRfU0hJRlQpLAkJXAotCQkgICJJIihwcm90IyNfVEhF
QUQgPj4gQUxUX1RIRUFEX1BCTVRfU0hJRlQpLAkJXAorCQkgICJJIihwcm90IyNfVEhFQUQgPj4g
QUxUX1RIRUFEX01BRV9TSElGVCksCQlcCiAJCSAgIkkiKEFMVF9TVlBCTVRfU0hJRlQpLAkJCQlc
Ci0JCSAgIkkiKEFMVF9USEVBRF9QQk1UX1NISUZUKSkKKwkJICAiSSIoQUxUX1RIRUFEX01BRV9T
SElGVCkpCiAKLSNpZmRlZiBDT05GSUdfRVJSQVRBX1RIRUFEX1BCTVQKKyNpZmRlZiBDT05GSUdf
RVJSQVRBX1RIRUFEX01BRQogLyoKICAqIElPL05PQ0FDSEUgbWVtb3J5IHR5cGVzIGFyZSBoYW5k
bGVkIHRvZ2V0aGVyIHdpdGggc3ZwYm10LAogICogc28gb24gVC1IZWFkIGNoaXBzLCBjaGVjayBp
ZiBubyBvdGhlciBtZW1vcnkgdHlwZSBpcyBzZXQsCkBAIC04MywxMSArODMsMTEgQEAgYXNtIHZv
bGF0aWxlKEFMVEVSTkFUSVZFKAkJCQkJCVwKIAkic2xsaSAgICB0MywgdDMsICUzXG5cdCIJCQkJ
CVwKIAkib3IgICAgICAlMCwgJTAsIHQzXG5cdCIJCQkJCVwKIAkiMjoiLCAgVEhFQURfVkVORE9S
X0lELAkJCQkJCVwKLQkJRVJSQVRBX1RIRUFEX1BCTVQsIENPTkZJR19FUlJBVEFfVEhFQURfUEJN
VCkJCVwKKwkJRVJSQVRBX1RIRUFEX01BRSwgQ09ORklHX0VSUkFUQV9USEVBRF9NQUUpCQlcCiAJ
OiAiK3IiKF92YWwpCQkJCQkJCVwKLQk6ICJJIihfUEFHRV9NVE1BU0tfVEhFQUQgPj4gQUxUX1RI
RUFEX1BCTVRfU0hJRlQpLAkJXAotCSAgIkkiKF9QQUdFX1BNQV9USEVBRCA+PiBBTFRfVEhFQURf
UEJNVF9TSElGVCksCQkJXAotCSAgIkkiKEFMVF9USEVBRF9QQk1UX1NISUZUKQkJCQkJXAorCTog
IkkiKF9QQUdFX01UTUFTS19USEVBRCA+PiBBTFRfVEhFQURfTUFFX1NISUZUKSwJCVwKKwkgICJJ
IihfUEFHRV9QTUFfVEhFQUQgPj4gQUxUX1RIRUFEX01BRV9TSElGVCksCQkJXAorCSAgIkkiKEFM
VF9USEVBRF9NQUVfU0hJRlQpCQkJCQlcCiAJOiAidDMiKQogI2Vsc2UKICNkZWZpbmUgQUxUX1RI
RUFEX1BNQShfdmFsKQotLSAKMi40NC4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
