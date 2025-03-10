Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8677C35FF3
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Mar 2025 15:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LWyN2HA9Zz/Oi6kWmpTIPB2zuBmS30gp46WURUnSLOs=; b=YiC6tXBbB+D9LZ
	JQxjoAvCv7glRf7zTjKYbW9uoV+hDkCDirEbs5Vyi0uoiw3N3PTwL8oaWCr3o+nytffbLR+ZIBATT
	dbm4yq3RLyABKnaS/SWKhEC7/U/MtF3Kr76JhFD1rQGJB+jMPAq+07XeO8N8HOh3i6pfDAYJkqy/o
	4l9CeZJ0qCcsTD0CpzraacnxVrOqOHv2JJwmiJtmHMlFV8yq7BxHM5cAQm6A+bchMmtIFFLnxkliM
	r0yKR2cD0veJMDX5GmlgaceBKlSnQoO1YflvJYjpbUhF+Q/HAoh338t3jHaDizX+fr6qFLnMENcBp
	W2584j2iYPBzCEoziMIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trfLy-00000003G3a-2mtG;
	Mon, 10 Mar 2025 15:47:42 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trepP-000000037rS-0yED
	for linux-riscv@lists.infradead.org;
	Mon, 10 Mar 2025 15:14:04 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-224100e9a5cso80779775ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 10 Mar 2025 08:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741619642; x=1742224442; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z9Vwlc46bZsQyt2QxW9m2l1M9vTOam7Mm6HyDDfLEZk=;
        b=sIWiSGeaaYiTiz5eDV/+CIVr+sOLZzK9JjZcSvi/YcTMkFZcW468BSAT8yYcxdWmZv
         MSA2xP5+YWsR0OUOb00/o3v8WUMrB3nWrkgJ69xSh6tD5ZmroLCrjgLQNFq+yKR7gsXW
         kN+sYbVNDQ+lvsOrYcyeZ7/FNlaXx0xXKZeSpXdW9mWqIeHc9Rw+n6Y5Icfar7W1YCX9
         vK1qPpce4Fm2zVZxmDyqAC0m2/8z0lnKN4I3X8RQFvYazHMgwUNaOj3Dz5A8f3swBMoj
         5VGLOHSVZ1XZpWVfRoIEWnRk5LeCtOOniLdAd7XYGpizTlgfAt6hkY8daTwpLSOPzvGw
         J+rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741619642; x=1742224442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z9Vwlc46bZsQyt2QxW9m2l1M9vTOam7Mm6HyDDfLEZk=;
        b=cUf9tj+Df+JbQlhPyjQvEu35S0DRyezD8I0tsHnKXQtFK53ZR410rRQhl2SnZ8bUwr
         c9VuI18ymmdCaKwLt6SP8D43MM/Jga4sjr8JEWEo5WgYUYRT4LndQD7zmNDZvpZCSo5g
         XkAG8gh0XRHrJ8ypyV6xLB493P/zUpYpSeR/VMzOwqrGQJ9UjKAeI540NiQtBN1WWuXj
         0EAFR9c2bcic+xcNnsfbDI0b5G9K15lSi49mtdRCtV/ZJFYvb3VbcNXVj9353+M0YxPr
         /uD1bicq6nn0/SqZHlOK6yFNYFlvT6sRkJLIXZbD5jDafsNWebO2hhI/m5zo2iQoZ38V
         NYrg==
X-Forwarded-Encrypted: i=1; AJvYcCXJh2YZWBFaZ8RUa/MwoJrtz0GIpfaiqGUcY+81vnHQpDdpxi0DjMLcnwpNix4legmoIVXxOhDCPrGsMw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzthBqgwkBn/XRrr+WE4koAcPHfr1Rn7rdWx612kkeXQMrDwmrX
	9+iZQxxPrRxvi7zt06MT4Mz1g1pyqxg8lRqM4LtfIko6mfF2+j+YEjCLZjkLeLM=
X-Gm-Gg: ASbGncv+kNruk1KXZaoaB/RduEbVe54rmXA+nup4g866h8IFHyC/kN9/F30MNtcTDqj
	tE+Dsuf5FnPKoh4uibW7jEBYsuUDObAk1xwpQqAmKjt4IoVAFzX+c4cOnzA43ZRwj48UstF/d8c
	pLD5aR9irTqXn8IZyAzG4/22H+09SjC/rwlflhaeJMqOuPl8zIR8m7xlKGva3QFbYoha7L35khA
	qTOJnUuK434uvWCHLjs6bQBihdzNfqkWpVRpVF4MzrsTv1/5TXqwrcRGF44GzlaT2Q1t79j3SMv
	C8I4kG8agWPXpMdRLZ/+WHlXCRZkf5uOv8rfsL67tuvI9A==
X-Google-Smtp-Source: AGHT+IE/Wftdkd3zlZdL/ywUH78DLaDAVcrFF4WfEuA9Q1JYQZM9C8xhDZMPOQ9HkccIr+uMejIbbw==
X-Received: by 2002:a17:903:298b:b0:21f:4649:fd49 with SMTP id d9443c01a7336-22428c221dbmr239345965ad.49.1741619642512;
        Mon, 10 Mar 2025 08:14:02 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109e99dfsm79230515ad.91.2025.03.10.08.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 08:14:02 -0700 (PDT)
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
Subject: [PATCH v3 09/17] riscv: misaligned: factorize trap handling
Date: Mon, 10 Mar 2025 16:12:16 +0100
Message-ID: <20250310151229.2365992-10-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250310151229.2365992-1-cleger@rivosinc.com>
References: <20250310151229.2365992-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_081403_262070_2B9397AA 
X-CRM114-Status: GOOD (  10.54  )
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

bWlzYWxpZ25lZCBhY2Nlc3NlcyB0cmFwcyBhcmUgbm90IG5taSBhbmQgc2hvdWxkIGJlIHRyZWF0
ZWQgYXMgbm9ybWFsCm9uZSB1c2luZyBpcnFlbnRyeV9lbnRlcigpL2V4aXQoKS4gU2luY2UgYm90
aCBsb2FkL3N0b3JlIGFuZCB1c2VyL2tlcm5lbApzaG91bGQgdXNlIGFsbW9zdCB0aGUgc2FtZSBw
YXRoIGFuZCB0aGF0IHdlIGFyZSBnb2luZyB0byBhZGQgc29tZSBjb2RlCmFyb3VuZCB0aGF0LCBm
YWN0b3JpemUgaXQuCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZv
c2luYy5jb20+Ci0tLQogYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYyB8IDQ5ICsrKysrKysrKysr
KysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlv
bnMoKyksIDI5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3Ry
YXBzLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCmluZGV4IDhmZjhlOGIzNjUyNC4uNTVk
OWYzNDUwMzk4IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCisrKyBiL2Fy
Y2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKQEAgLTE5OCw0NyArMTk4LDM4IEBAIGFzbWxpbmthZ2Ug
X192aXNpYmxlIF9fdHJhcF9zZWN0aW9uIHZvaWQgZG9fdHJhcF9pbnNuX2lsbGVnYWwoc3RydWN0
IHB0X3JlZ3MgKnJlCiBET19FUlJPUl9JTkZPKGRvX3RyYXBfbG9hZF9mYXVsdCwKIAlTSUdTRUdW
LCBTRUdWX0FDQ0VSUiwgImxvYWQgYWNjZXNzIGZhdWx0Iik7CiAKLWFzbWxpbmthZ2UgX192aXNp
YmxlIF9fdHJhcF9zZWN0aW9uIHZvaWQgZG9fdHJhcF9sb2FkX21pc2FsaWduZWQoc3RydWN0IHB0
X3JlZ3MgKnJlZ3MpCitlbnVtIG1pc2FsaWduZWRfYWNjZXNzX3R5cGUgeworCU1JU0FMSUdORURf
U1RPUkUsCisJTUlTQUxJR05FRF9MT0FELAorfTsKKworc3RhdGljIHZvaWQgZG9fdHJhcF9taXNh
bGlnbmVkKHN0cnVjdCBwdF9yZWdzICpyZWdzLCBlbnVtIG1pc2FsaWduZWRfYWNjZXNzX3R5cGUg
dHlwZSkKIHsKLQlpZiAodXNlcl9tb2RlKHJlZ3MpKSB7Ci0JCWlycWVudHJ5X2VudGVyX2Zyb21f
dXNlcl9tb2RlKHJlZ3MpOworCWlycWVudHJ5X3N0YXRlX3Qgc3RhdGUgPSBpcnFlbnRyeV9lbnRl
cihyZWdzKTsKIAorCWlmICh0eXBlID09ICBNSVNBTElHTkVEX0xPQUQpIHsKIAkJaWYgKGhhbmRs
ZV9taXNhbGlnbmVkX2xvYWQocmVncykpCiAJCQlkb190cmFwX2Vycm9yKHJlZ3MsIFNJR0JVUywg
QlVTX0FEUkFMTiwgcmVncy0+ZXBjLAotCQkJICAgICAgIk9vcHMgLSBsb2FkIGFkZHJlc3MgbWlz
YWxpZ25lZCIpOwotCi0JCWlycWVudHJ5X2V4aXRfdG9fdXNlcl9tb2RlKHJlZ3MpOworCQkJCSAg
ICAgICJPb3BzIC0gbG9hZCBhZGRyZXNzIG1pc2FsaWduZWQiKTsKIAl9IGVsc2UgewotCQlpcnFl
bnRyeV9zdGF0ZV90IHN0YXRlID0gaXJxZW50cnlfbm1pX2VudGVyKHJlZ3MpOwotCi0JCWlmICho
YW5kbGVfbWlzYWxpZ25lZF9sb2FkKHJlZ3MpKQorCQlpZiAoaGFuZGxlX21pc2FsaWduZWRfc3Rv
cmUocmVncykpCiAJCQlkb190cmFwX2Vycm9yKHJlZ3MsIFNJR0JVUywgQlVTX0FEUkFMTiwgcmVn
cy0+ZXBjLAotCQkJICAgICAgIk9vcHMgLSBsb2FkIGFkZHJlc3MgbWlzYWxpZ25lZCIpOwotCi0J
CWlycWVudHJ5X25taV9leGl0KHJlZ3MsIHN0YXRlKTsKKwkJCQkgICAgICAiT29wcyAtIHN0b3Jl
IChvciBBTU8pIGFkZHJlc3MgbWlzYWxpZ25lZCIpOwogCX0KKworCWlycWVudHJ5X2V4aXQocmVn
cywgc3RhdGUpOwogfQogCi1hc21saW5rYWdlIF9fdmlzaWJsZSBfX3RyYXBfc2VjdGlvbiB2b2lk
IGRvX3RyYXBfc3RvcmVfbWlzYWxpZ25lZChzdHJ1Y3QgcHRfcmVncyAqcmVncykKK2FzbWxpbmth
Z2UgX192aXNpYmxlIF9fdHJhcF9zZWN0aW9uIHZvaWQgZG9fdHJhcF9sb2FkX21pc2FsaWduZWQo
c3RydWN0IHB0X3JlZ3MgKnJlZ3MpCiB7Ci0JaWYgKHVzZXJfbW9kZShyZWdzKSkgewotCQlpcnFl
bnRyeV9lbnRlcl9mcm9tX3VzZXJfbW9kZShyZWdzKTsKLQotCQlpZiAoaGFuZGxlX21pc2FsaWdu
ZWRfc3RvcmUocmVncykpCi0JCQlkb190cmFwX2Vycm9yKHJlZ3MsIFNJR0JVUywgQlVTX0FEUkFM
TiwgcmVncy0+ZXBjLAotCQkJCSJPb3BzIC0gc3RvcmUgKG9yIEFNTykgYWRkcmVzcyBtaXNhbGln
bmVkIik7Ci0KLQkJaXJxZW50cnlfZXhpdF90b191c2VyX21vZGUocmVncyk7Ci0JfSBlbHNlIHsK
LQkJaXJxZW50cnlfc3RhdGVfdCBzdGF0ZSA9IGlycWVudHJ5X25taV9lbnRlcihyZWdzKTsKLQot
CQlpZiAoaGFuZGxlX21pc2FsaWduZWRfc3RvcmUocmVncykpCi0JCQlkb190cmFwX2Vycm9yKHJl
Z3MsIFNJR0JVUywgQlVTX0FEUkFMTiwgcmVncy0+ZXBjLAotCQkJCSJPb3BzIC0gc3RvcmUgKG9y
IEFNTykgYWRkcmVzcyBtaXNhbGlnbmVkIik7CisJZG9fdHJhcF9taXNhbGlnbmVkKHJlZ3MsIE1J
U0FMSUdORURfTE9BRCk7Cit9CiAKLQkJaXJxZW50cnlfbm1pX2V4aXQocmVncywgc3RhdGUpOwot
CX0KK2FzbWxpbmthZ2UgX192aXNpYmxlIF9fdHJhcF9zZWN0aW9uIHZvaWQgZG9fdHJhcF9zdG9y
ZV9taXNhbGlnbmVkKHN0cnVjdCBwdF9yZWdzICpyZWdzKQoreworCWRvX3RyYXBfbWlzYWxpZ25l
ZChyZWdzLCBNSVNBTElHTkVEX1NUT1JFKTsKIH0KKwogRE9fRVJST1JfSU5GTyhkb190cmFwX3N0
b3JlX2ZhdWx0LAogCVNJR1NFR1YsIFNFR1ZfQUNDRVJSLCAic3RvcmUgKG9yIEFNTykgYWNjZXNz
IGZhdWx0Iik7CiBET19FUlJPUl9JTkZPKGRvX3RyYXBfZWNhbGxfcywKLS0gCjIuNDcuMgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
