Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA113C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Apr 2024 15:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jgxuhDBjxValMLNOIrh8igDwcZ2b1SSWp1ElN2Yxv0Y=; b=CqhSi28GfDTuMQ
	z7r0rY+vDmIY/hY9IiZHWF3aM7M8m16UvHfUYeT0JOxnq2TRBlK61FWuso69o+A1HRko9IdsFmjB/
	/+t93JnHBjwenxf8MQwd6ZoG9k2wnOrXSvza31ANpqW4syRqMDS2HDbcZt3QAi2c2oA6CkCG+tlHp
	Fv3E3YMa3a4UpwZTNEte7oOKeycSQipxQg802gfpZRRw9b6Ar+RI+ZzfQG3oeYRUvl0YSRD+lXe/j
	X+CCsOkbA9Yfs3gfbc4lXS8E49CjPbjdlcm8psi/Z+qpElYgvs0BrV31mHP1Chi/YaykuEQM47E4M
	ok0Y1cGpWxhwMpVPyErQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1SdN-00000003IIH-0Yb4;
	Mon, 29 Apr 2024 15:09:37 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1SaV-00000003GPA-07zV
	for linux-riscv@lists.infradead.org;
	Mon, 29 Apr 2024 15:06:43 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2de14227d91so507681fa.2
        for <linux-riscv@lists.infradead.org>; Mon, 29 Apr 2024 08:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714403197; x=1715007997; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rKUXibPhUwjjSXA/KBDdbbKS1P63ijLLovqIt9fNrZc=;
        b=YEipojsQ7/Pq8/qeuN24ZCbhs+Uuas3r8+ZvC58jjK1dOGruLwPFxn1jyQvBscGSGc
         SsevNnhBjD/TkzuX3H20aXRewFi8PVDPQOPiUL65XDy0RVaqBRU3P7YwzfbMWhmbSWGt
         r0wZYOHkn4q48tR9u4N6rIg7BBmbe+ryfkdWfh8NWbGK20OzbjDskjk4plNPB528oG5+
         9ysKgqVaMhP1b10Hr0WTlsjxbPKZXPFkARyU1ferxDzK6yTzISgfEu2nWoBjzapxwA0E
         VLjctcuMsN59TlERLXjqRQ+HCFi27BkMkWDgB0LdQ+p/jlXivuxQv3T7djuTmJ0wSRUM
         cRzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403197; x=1715007997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rKUXibPhUwjjSXA/KBDdbbKS1P63ijLLovqIt9fNrZc=;
        b=v+N+o3Nd/DINC9g8+W/E5hGrXgZHA0AhGTTvj/5vhbg05sYWmhP20YXeKFvTtInLGw
         rkF1ltRjPpauPQ/9hLDMc6DAI56+RJghbBDXN0tcbysP21fhHdqaIpW1OCwCeUo+X2NL
         8ErCMS08UWzfmZhiBvlgYCR2weghP9JlbmJAzuBK1KizvblMBvbGHKZklRE0OFmhuIiY
         WKvNyVUwO6E8qPtljjBiUKeIkFyhh7iDs6UtdIeMhJcd8dnyaAMy2WsrPSsCrhS+LMDI
         Ay+eggCwwgfiNWTYziWPLNkSUaqbasT4F1rHLYQAuzwXyyX+jykjXzwOXjNchVoBfCdd
         JmXA==
X-Forwarded-Encrypted: i=1; AJvYcCU4xSYPXHa1nZNlEld0Cen3vQXAOwnvAL9qd8uNMBHiTka/cpdff+1MJ8E3xP+8RkmHpK/5ONKVQWOdnhqROduhqMFkTJhdbZxuGXHagv2f
X-Gm-Message-State: AOJu0Yy4giRh+hpEUMqcXprjWqnNZ3GAqxCj0cq0kokMSdWyc+xf9T89
	DT9K0H7xMrFnPi/ReO8KCvT+oIF0AX2Wn+/LXDeW5nurIxNm5FFG55ymSfwGnxU=
X-Google-Smtp-Source: AGHT+IHBeQWCMZrNLW0+ykllLuDLc1Y3CgTNKkl/oAAzYPksrb/JlVrkXxJwQYgzThm7ieqJgwd2hg==
X-Received: by 2002:a2e:910a:0:b0:2dd:60d3:7664 with SMTP id m10-20020a2e910a000000b002dd60d37664mr6737706ljg.5.1714403196813;
        Mon, 29 Apr 2024 08:06:36 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:2fec:d20:2b60:e334])
        by smtp.gmail.com with ESMTPSA id l23-20020a05600c1d1700b00418f99170f2sm39646638wms.32.2024.04.29.08.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 08:06:36 -0700 (PDT)
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
Subject: [PATCH v4 05/11] RISC-V: KVM: Allow Zca, Zcf, Zcd and Zcb extensions for Guest/VM
Date: Mon, 29 Apr 2024 17:04:58 +0200
Message-ID: <20240429150553.625165-6-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240429150553.625165-1-cleger@rivosinc.com>
References: <20240429150553.625165-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_080639_183111_2CA22774 
X-CRM114-Status: UNSURE (   9.55  )
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

RXh0ZW5kIHRoZSBLVk0gSVNBIGV4dGVuc2lvbiBPTkVfUkVHIGludGVyZmFjZSB0byBhbGxvdyBL
Vk0gdXNlciBzcGFjZQp0byBkZXRlY3QgYW5kIGVuYWJsZSBaY2EsIFpjZiwgWmNkIGFuZCBaY2Ig
ZXh0ZW5zaW9ucyBmb3IgR3Vlc3QvVk0uCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIg
PGNsZWdlckByaXZvc2luYy5jb20+ClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWlu
ZmF1bHQub3JnPgpBY2tlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KLS0t
CiBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmggfCA0ICsrKysKIGFyY2gvcmlzY3Yv
a3ZtL3ZjcHVfb25lcmVnLmMgICAgICB8IDggKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMTIg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9r
dm0uaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9rdm0uaAppbmRleCAzNWExMmFhMTk1
M2UuLjU3ZGIzZmVhNjc5ZiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNt
L2t2bS5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9rdm0uaApAQCAtMTY4LDYg
KzE2OCwxMCBAQCBlbnVtIEtWTV9SSVNDVl9JU0FfRVhUX0lEIHsKIAlLVk1fUklTQ1ZfSVNBX0VY
VF9aVFNPLAogCUtWTV9SSVNDVl9JU0FfRVhUX1pBQ0FTLAogCUtWTV9SSVNDVl9JU0FfRVhUX1pJ
TU9QLAorCUtWTV9SSVNDVl9JU0FfRVhUX1pDQSwKKwlLVk1fUklTQ1ZfSVNBX0VYVF9aQ0IsCisJ
S1ZNX1JJU0NWX0lTQV9FWFRfWkNELAorCUtWTV9SSVNDVl9JU0FfRVhUX1pDRiwKIAlLVk1fUklT
Q1ZfSVNBX0VYVF9NQVgsCiB9OwogCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X29u
ZXJlZy5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9vbmVyZWcuYwppbmRleCAxMjQzNmY2ZjBkMjAu
LmEyNzQ3YTZkYmRiNiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9vbmVyZWcuYwor
KysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jCkBAIC00OCw2ICs0OCwxMCBAQCBzdGF0
aWMgY29uc3QgdW5zaWduZWQgbG9uZyBrdm1faXNhX2V4dF9hcnJbXSA9IHsKIAlLVk1fSVNBX0VY
VF9BUlIoWkJLQyksCiAJS1ZNX0lTQV9FWFRfQVJSKFpCS1gpLAogCUtWTV9JU0FfRVhUX0FSUiha
QlMpLAorCUtWTV9JU0FfRVhUX0FSUihaQ0EpLAorCUtWTV9JU0FfRVhUX0FSUihaQ0IpLAorCUtW
TV9JU0FfRVhUX0FSUihaQ0QpLAorCUtWTV9JU0FfRVhUX0FSUihaQ0YpLAogCUtWTV9JU0FfRVhU
X0FSUihaRkEpLAogCUtWTV9JU0FfRVhUX0FSUihaRkgpLAogCUtWTV9JU0FfRVhUX0FSUihaRkhN
SU4pLApAQCAtMTI4LDYgKzEzMiwxMCBAQCBzdGF0aWMgYm9vbCBrdm1fcmlzY3ZfdmNwdV9pc2Ff
ZGlzYWJsZV9hbGxvd2VkKHVuc2lnbmVkIGxvbmcgZXh0KQogCWNhc2UgS1ZNX1JJU0NWX0lTQV9F
WFRfWkJLQzoKIAljYXNlIEtWTV9SSVNDVl9JU0FfRVhUX1pCS1g6CiAJY2FzZSBLVk1fUklTQ1Zf
SVNBX0VYVF9aQlM6CisJY2FzZSBLVk1fUklTQ1ZfSVNBX0VYVF9aQ0E6CisJY2FzZSBLVk1fUklT
Q1ZfSVNBX0VYVF9aQ0I6CisJY2FzZSBLVk1fUklTQ1ZfSVNBX0VYVF9aQ0Q6CisJY2FzZSBLVk1f
UklTQ1ZfSVNBX0VYVF9aQ0Y6CiAJY2FzZSBLVk1fUklTQ1ZfSVNBX0VYVF9aRkE6CiAJY2FzZSBL
Vk1fUklTQ1ZfSVNBX0VYVF9aRkg6CiAJY2FzZSBLVk1fUklTQ1ZfSVNBX0VYVF9aRkhNSU46Ci0t
IAoyLjQzLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
