Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36DECC28B2E
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Mar 2025 15:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ezPF9RbRKyoyHdB+6Ix0smuGm+9an3uaXgKFFcrobHg=; b=a1UPrDHOrCEZsX
	Z8pD2s927HqyBS9ATduBfnmi1tIu0Bbuuv9OYaIv2JVZ+1GuWomO7zBH5Wn+/P4PTOGuI5IECe50H
	Q4tgBAZWR4iZ7ad4zUZ4W5rYjis5q6g7vd3sZpM40hkhUy8tub13rq3O6lxSZjlZ3WcDh96CobFE5
	3MYpje5Er2UJCvp+q0TaNqqpZGOjaWRXw1ecQqbwctAYypXpFcZcGeJlVX8Ts5PU4yhNfW0w8UqRN
	1zGljoXnYAlplw9xrjMR8RQNAPL/rtKG6dv7+DpKazKC5uctpusrcT4BLC2I4KuQGEKqeQ8AMJSb/
	j6dE1gZ7POAb4lbaq9lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trfLw-00000003G0r-49Mx;
	Mon, 10 Mar 2025 15:47:40 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trepG-000000037nv-1wbJ
	for linux-riscv@lists.infradead.org;
	Mon, 10 Mar 2025 15:13:55 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-225477548e1so33349615ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 10 Mar 2025 08:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741619634; x=1742224434; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aJEE3tstWlxClRLN5XCqSGWhwaxxi8RTX0eYkvDKRxQ=;
        b=D+JHsFOb6sbgkr7O3kYZmPgQqv2auuhizLNkrN9k/9PaDbfiGYw5itXny1blxf4Xbj
         5Mqx8U/hvZEYDuQ+V/KOKfjkaIm0waOHqo4Q9wPTwDk2YSjr9VoWFYIXggMNRJ6ypkFc
         N3qBEqzGEKB6TrG3UEHi7EhBCgmrGhobEhjCG9oG9gRNf7kVXXIWX8NGLSjgrBjxjA4i
         pJgJqcdkHvZPCcL7nvjsno1vKmZH5+bpBRFhH7LlThATs99G1zIt/0Rat/ouim/FUQ4O
         6ebUc3KdrGPJfscGuV+VE9Zf4WvkLKWnuWjUStrdtoFBSS3eicEFtuTX/hApgniaW+On
         djFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741619634; x=1742224434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aJEE3tstWlxClRLN5XCqSGWhwaxxi8RTX0eYkvDKRxQ=;
        b=uNSyoZltFcLv4XwftZGYzXaFxynr0UTW8TyhvK/sD/y8at7acufIcYc/P5PP5Yd3tU
         tkE/7R/8sfQkuuEokltayxPd+b8vSDpIpgT19qZyY1myFkHPNY/VcNeJ2uH7WJHepHFb
         8WRTaXGxsh7GvKRyw0g6ZSSnsz0tdumQLoiT7KoN2DrL0ALTQaR6czHNdtJeUKKINFiE
         irHtJEK6oMlyiyVrDb8VqTtj6Uea1e1RZb0tWz2LP3NoKF46I6nXoQG7cTSHEpJfEnUm
         Wx5W1234yRo4q/Z7D0hILiA+lIETxQQuPWYXlGYfUqIQpkWWSFSaXXU8gB0VEGLTS2FV
         3d1A==
X-Forwarded-Encrypted: i=1; AJvYcCWKgCrbKXk83zAecUGmXo8810w1bH82trdedIanOQtjPP15QDq9Nh0mmeJHmJ4+7TfI/swgOS5Sc/pv3g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4tP4TG85eqZUS0a5jwEtbRPGVg9hqZp1AZr2nIJ++Q/bqaiFR
	xQrgILcD9ixASIdQbLP7yJhkdt1dyrNE1dqQrYQHYqMsqM6AiZmR3qnBJ13l5Uw=
X-Gm-Gg: ASbGncslzV3g+WSEvg5hNgtzhb7Jvfg4DsAP/pj4yyNYjG61PGnIBuowa5jzlxiCzB9
	jTcZ40UOWBSatXbvZeaPZP6nmaOzAOIq7LrNcz1KOTfF+4xv8SW0a5CXZvgiBpc3oVYt0DvbaS8
	rJvPWRcTEKWZsOPCkjzc4CLm76tbMRncGKqHm2NopTck9CfeAEP8/8m7LNJp+xwORroEFNrzWHe
	UonrWb61vkjZNOcona47s7brMSZJbh74tMAHs5VhxxqIkLF1/KvbHJ7STwQUyKDHBS67l/6lhbH
	dG3NipRVE7RXRLeAhn/Xo2EER0bLl3tL+RqhS8WDUISCgQ==
X-Google-Smtp-Source: AGHT+IFu79SrTcHr6DQ0LZoB48TuSJ0ALQO1FccV1+6ehx1qbYGTJAEYU8+IrRgycH415AfK45aV/g==
X-Received: by 2002:a17:902:f68a:b0:220:bcc5:2845 with SMTP id d9443c01a7336-2242888666bmr164594065ad.7.1741619633926;
        Mon, 10 Mar 2025 08:13:53 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109e99dfsm79230515ad.91.2025.03.10.08.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 08:13:53 -0700 (PDT)
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
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v3 08/17] riscv: misaligned: add a function to check misalign trap delegability
Date: Mon, 10 Mar 2025 16:12:15 +0100
Message-ID: <20250310151229.2365992-9-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250310151229.2365992-1-cleger@rivosinc.com>
References: <20250310151229.2365992-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_081354_501908_EA1535D6 
X-CRM114-Status: GOOD (  12.08  )
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

Q2hlY2tpbmcgZm9yIHRoZSBkZWxlZ2FiaWxpdHkgb2YgdGhlIG1pc2FsaWduZWQgYWNjZXNzIHRy
YXAgaXMgbmVlZGVkCmZvciB0aGUgS1ZNIEZXRlQgZXh0ZW5zaW9uIGltcGxlbWVudGF0aW9uLiBB
ZGQgYSBmdW5jdGlvbiB0byBnZXQgdGhlCmRlbGVnYWJpbGl0eSBvZiB0aGUgbWlzYWxpZ25lZCB0
cmFwIGV4Y2VwdGlvbi4KClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJp
dm9zaW5jLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUuaCAgfCAg
NSArKysrKwogYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jIHwgMTcgKysrKysr
KysrKysrKysrLS0KIDIgZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUuaCBi
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1ZmVhdHVyZS5oCmluZGV4IGFkN2QyNjc4OGU2YS4u
OGI5N2NiYTk5ZmMzIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1
cmUuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUuaApAQCAtNjksMTIg
KzY5LDE3IEBAIGludCBjcHVfb25saW5lX3VuYWxpZ25lZF9hY2Nlc3NfaW5pdCh1bnNpZ25lZCBp
bnQgY3B1KTsKICNpZiBkZWZpbmVkKENPTkZJR19SSVNDVl9TQ0FMQVJfTUlTQUxJR05FRCkKIHZv
aWQgdW5hbGlnbmVkX2VtdWxhdGlvbl9maW5pc2godm9pZCk7CiBib29sIHVuYWxpZ25lZF9jdGxf
YXZhaWxhYmxlKHZvaWQpOworYm9vbCBtaXNhbGlnbmVkX3RyYXBzX2Nhbl9kZWxlZ2F0ZSh2b2lk
KTsKIERFQ0xBUkVfUEVSX0NQVShsb25nLCBtaXNhbGlnbmVkX2FjY2Vzc19zcGVlZCk7CiAjZWxz
ZQogc3RhdGljIGlubGluZSBib29sIHVuYWxpZ25lZF9jdGxfYXZhaWxhYmxlKHZvaWQpCiB7CiAJ
cmV0dXJuIGZhbHNlOwogfQorc3RhdGljIGlubGluZSBib29sIG1pc2FsaWduZWRfdHJhcHNfY2Fu
X2RlbGVnYXRlKHZvaWQpCit7CisJcmV0dXJuIGZhbHNlOworfQogI2VuZGlmCiAKIGJvb2wgY2hl
Y2tfdmVjdG9yX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWRfYWxsX2NwdXModm9pZCk7CmRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMgYi9hcmNoL3Jpc2N2
L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMKaW5kZXggZGIzMTk2NmE4MzRlLi5hNjdhNmU3MDlh
MDYgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYworKysg
Yi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMKQEAgLTcxNiwxMCArNzE2LDEw
IEBAIHN0YXRpYyBpbnQgY3B1X29ubGluZV9jaGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVk
KHVuc2lnbmVkIGludCBjcHUpCiB9CiAjZW5kaWYKIAotI2lmZGVmIENPTkZJR19SSVNDVl9TQkkK
LQogc3RhdGljIGJvb2wgbWlzYWxpZ25lZF90cmFwc19kZWxlZ2F0ZWQ7CiAKKyNpZmRlZiBDT05G
SUdfUklTQ1ZfU0JJCisKIHN0YXRpYyBpbnQgY3B1X29ubGluZV9zYmlfdW5hbGlnbmVkX3NldHVw
KHVuc2lnbmVkIGludCBjcHUpCiB7CiAJaWYgKHNiaV9md2Z0X3NldChTQklfRldGVF9NSVNBTElH
TkVEX0VYQ19ERUxFRywgMSwgMCkgJiYKQEAgLTc2MSw2ICs3NjEsNyBAQCBzdGF0aWMgaW50IGNw
dV9vbmxpbmVfc2JpX3VuYWxpZ25lZF9zZXR1cCh1bnNpZ25lZCBpbnQgY3B1IF9fYWx3YXlzX3Vu
dXNlZCkKIHsKIAlyZXR1cm4gMDsKIH0KKwogI2VuZGlmCiAKIGludCBjcHVfb25saW5lX3VuYWxp
Z25lZF9hY2Nlc3NfaW5pdCh1bnNpZ25lZCBpbnQgY3B1KQpAQCAtNzczLDMgKzc3NCwxNSBAQCBp
bnQgY3B1X29ubGluZV91bmFsaWduZWRfYWNjZXNzX2luaXQodW5zaWduZWQgaW50IGNwdSkKIAog
CXJldHVybiBjcHVfb25saW5lX2NoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWQoY3B1KTsK
IH0KKworYm9vbCBtaXNhbGlnbmVkX3RyYXBzX2Nhbl9kZWxlZ2F0ZSh2b2lkKQoreworCS8qCisJ
ICogRWl0aGVyIHdlIHN1Y2Nlc3NmdWxseSByZXF1ZXN0ZWQgbWlzYWxpZ25lZCB0cmFwcyBkZWxl
Z2F0aW9uIGZvciBhbGwKKwkgKiBDUFVTIG9yIHRoZSBTQkkgZG9lcyBub3QgaW1wbGVtZW50ZWQg
RldGVCBleHRlbnNpb24gYnV0IGRlbGVnYXRlZCB0aGUKKwkgKiBleGNlcHRpb24gYnkgZGVmYXVs
dC4KKwkgKi8KKwlyZXR1cm4gbWlzYWxpZ25lZF90cmFwc19kZWxlZ2F0ZWQgfHwKKwkgICAgICAg
YWxsX2NwdXNfdW5hbGlnbmVkX3NjYWxhcl9hY2Nlc3NfZW11bGF0ZWQoKTsKK30KK0VYUE9SVF9T
WU1CT0xfR1BMKG1pc2FsaWduZWRfdHJhcHNfY2FuX2RlbGVnYXRlKTsKXCBObyBuZXdsaW5lIGF0
IGVuZCBvZiBmaWxlCi0tIAoyLjQ3LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
