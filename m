Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7979CC46CD2
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 15:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4X0rlxMH32JN0KBubIbpTJ9Mc9UTvUkbxvN2YqBlEeY=; b=sQLrTlhMC4ZtcJ
	iECmR9YHsnldGvODtVCCFUuWW/+m09tmt8/AZizwUrAW96d9lO6RTI7TfNWQ7zt+TX4WnpxPX80ou
	+cWcOmfIkNJ+GU20RSwNyVk5XmGfW8ir3booBfCi/9giS3laK97mhvjw2w1TzvHLySKtRvMCQ3hpl
	AIwPR/LyaZPMpZetrGD6OtXgGYnNKEWRC4RtteyUGNlo/wTLLObLV6udbfJRV7rTSi0cYiYFR8Fcv
	DUI5QpymH9IAPFSuK5T8DWC5cGIMaXBUm6pMBXsNzzqYedefS9q22D8JPTQcVQ/pAofCP6CZnkwFm
	dx7BVyVufQjh9qMyFEhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFyxI-000KPh-1m;
	Wed, 20 Dec 2023 15:57:56 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFyxC-000KKS-11
	for linux-riscv@lists.infradead.org;
	Wed, 20 Dec 2023 15:57:51 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-40c32e205fcso9882015e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 20 Dec 2023 07:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1703087866; x=1703692666; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3BPMv24jdGVieLmHRP/43iA/a2qmOUrYJR1MkKgXts4=;
        b=nHL4rj0shMRFog8OMig+pIfQ3emZC3YfGxFWnUcTcQUK/6KSoDthnUunaJ6C7Lxz9B
         mnKAX3+lc786NIRY9XvWWgi/66WlSVRXit+t5wcVLDq23SR7q7d4tDM7g7mINnBKLhuQ
         gAqO362nZhRd5Isrk1KuLnppIKRQauM9CWUrO/OJWYLRe1Ct0OEXgkh9GHrbeBocqPOs
         QdrwJihre3vCpQaeLULTdatQtJ6FUPdYlt61+njqea+7Zm/nG6lPKV4w/pLa3csJZWry
         1lpbhOHHpkEl+1UoDoEgAdpiuJbeVlxztzExFF8CrHwuSf2iQFteq48DfdJtIpUB8pvn
         wvpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703087866; x=1703692666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3BPMv24jdGVieLmHRP/43iA/a2qmOUrYJR1MkKgXts4=;
        b=AtdG5EMH8KIGYcYy6Kph014mYkuDlsuGH04BCHa2SpP27//JqG87p0nmpn/JXjhp0x
         xvV56lFlSQDAnqn9/140eQTj/pB7OmRbJF67abLjJIftW0g6I3KRZNUVb/sjUVBK5TU3
         MONQIk1At0LyHZKhrBeMxlo2hrRbOJMBP30rWPh50FVlY3L3zuu0+XTrmf6e5lZILANH
         fWekl7rZ8rhC1hTH+sUOpwyJU3+vxB3yF2AHu1ho1SjZqcjh6oE8SDVOge2CdHSflQzl
         l+5uUgvKVRlw7azMJAITs7P4DoSfqP97wjCiYD5qXwUFdx8apyxM+aPMqB2hGw3v203o
         htog==
X-Gm-Message-State: AOJu0YxJ5wpFSwJv38fbgd1y+LoelTZe1KVw7Ww6ysG6az6ry37jtgAs
	EspPVb+0jjMGq6MT1On9aX44kQ==
X-Google-Smtp-Source: AGHT+IHhRAXXz42/u2vdF2rRn+pcNPzJD+CGhaPX7dsedwK3pxf8bg5I86xeWYEngCYQhOlYz8+CIQ==
X-Received: by 2002:a05:600c:3b98:b0:40d:3880:b046 with SMTP id n24-20020a05600c3b9800b0040d3880b046mr1065572wms.4.1703087865822;
        Wed, 20 Dec 2023 07:57:45 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:3eae:b70:f27f:7aa1])
        by smtp.gmail.com with ESMTPSA id h18-20020adffd52000000b003366af9d611sm7279693wrs.22.2023.12.20.07.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 07:57:45 -0800 (PST)
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
	Robbin Ehn <rehn@rivosinc.com>,
	Gianluca Guida <gianluca@rivosinc.com>
Subject: [PATCH v2 5/6] riscv: hwprobe: export Zacas ISA extension
Date: Wed, 20 Dec 2023 16:57:21 +0100
Message-ID: <20231220155723.684081-6-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231220155723.684081-1-cleger@rivosinc.com>
References: <20231220155723.684081-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_075750_358054_91E280E1 
X-CRM114-Status: GOOD (  10.71  )
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

RXhwb3J0IFphY2FzIElTQSBleHRlbnNpb24gdGhyb3VnaCBod3Byb2JlLgoKU2lnbmVkLW9mZi1i
eTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgotLS0KIERvY3VtZW50YXRp
b24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdCAgfCA0ICsrKysKIGFyY2gvcmlzY3YvaW5jbHVkZS91
YXBpL2FzbS9od3Byb2JlLmggfCAxICsKIGFyY2gvcmlzY3Yva2VybmVsL3N5c19yaXNjdi5jICAg
ICAgICAgfCAxICsKIDMgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0IGIvRG9jdW1lbnRhdGlvbi9h
cmNoL3Jpc2N2L2h3cHJvYmUucnN0CmluZGV4IDEwYmQ3YjE3MDExOC4uYmZmNjgwMDRhZDQzIDEw
MDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QKKysrIGIvRG9j
dW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0CkBAIC0xNjUsNiArMTY1LDEwIEBAIFRo
ZSBmb2xsb3dpbmcga2V5cyBhcmUgZGVmaW5lZDoKICAgICAgICBkZWZpbmVkIGluIHRoZSBSSVND
LVYgSVNBIG1hbnVhbCBzdGFydGluZyBmcm9tIGNvbW1pdCA1NjE4ZmI1YTIxNmIKICAgICAgICAo
Ilp0c28gaXMgbm93IHJhdGlmaWVkLiIpCiAKKyAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9F
WFRfWkFDQVNgOiBUaGUgWmFjYXMgZXh0ZW5zaW9uIGlzIHN1cHBvcnRlZCBhcworICAgICAgIGRl
ZmluZWQgaW4gdGhlIEF0b21pYyBDb21wYXJlLWFuZC1Td2FwIChDQVMpIGluc3RydWN0aW9ucyBt
YW51YWwgc3RhcnRpbmcKKyAgICAgICBmcm9tIGNvbW1pdCA1MDU5ZTBjYTY0MWMgKCJ1cGRhdGUg
dG8gcmF0aWZpZWQiKS4KKwogKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9LRVlfQ1BVUEVSRl8w
YDogQSBiaXRtYXNrIHRoYXQgY29udGFpbnMgcGVyZm9ybWFuY2UKICAgaW5mb3JtYXRpb24gYWJv
dXQgdGhlIHNlbGVjdGVkIHNldCBvZiBwcm9jZXNzb3JzLgogCmRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkv
YXNtL2h3cHJvYmUuaAppbmRleCAwMWFjM2RjMTk2ZTUuLmFjNjViYjQzYzhlNyAxMDA2NDQKLS0t
IGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaAorKysgYi9hcmNoL3Jpc2N2
L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oCkBAIC01Nyw2ICs1Nyw3IEBAIHN0cnVjdCByaXNj
dl9od3Byb2JlIHsKICNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhUX1pWRkhNSU4JKDEgPDwgMzEp
CiAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aRkEJCSgxVUxMIDw8IDMyKQogI2RlZmluZQkJ
UklTQ1ZfSFdQUk9CRV9FWFRfWlRTTwkJKDFVTEwgPDwgMzMpCisjZGVmaW5lCQlSSVNDVl9IV1BS
T0JFX0VYVF9aQUNBUwkJKDFVTEwgPDwgMzQpCiAjZGVmaW5lIFJJU0NWX0hXUFJPQkVfS0VZX0NQ
VVBFUkZfMAk1CiAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX01JU0FMSUdORURfVU5LTk9XTgkoMCA8
PCAwKQogI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX0VNVUxBVEVECSgxIDw8IDAp
CmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYyBiL2FyY2gvcmlzY3Yv
a2VybmVsL3N5c19yaXNjdi5jCmluZGV4IDY1NjRmYTllN2E3Zi4uNmM2ODBjNzVhYzBkIDEwMDY0
NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYworKysgYi9hcmNoL3Jpc2N2L2tl
cm5lbC9zeXNfcmlzY3YuYwpAQCAtMTc1LDYgKzE3NSw3IEBAIHN0YXRpYyB2b2lkIGh3cHJvYmVf
aXNhX2V4dDAoc3RydWN0IHJpc2N2X2h3cHJvYmUgKnBhaXIsCiAJCUVYVF9LRVkoWktUKTsKIAkJ
RVhUX0tFWShaSUhJTlROVEwpOwogCQlFWFRfS0VZKFpUU08pOworCQlFWFRfS0VZKFpBQ0FTKTsK
IAogCQlpZiAoaGFzX3ZlY3RvcigpKSB7CiAJCQlFWFRfS0VZKFpWQkIpOwotLSAKMi40My4wCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
