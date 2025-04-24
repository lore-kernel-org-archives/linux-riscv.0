Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C446C369C2
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 17:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U6GaPvR/ILNW7brOsi1j4AJqJc1KmxQHUaUHX5LpR+I=; b=R8S6kmRfF/9/UC
	HEcVtPYNdQVjYPHQD/s/xrfvWlPDJE/3kJDN9Fh05zblnvrLq3qX1948KjaCumktzjQ1rpOe5oeHp
	fIvh82rbbNHmCTNmBjVHnOV+ik20UOnc3/PlJU2bk6ZpAnvLudjxpzEcVd0dSkvgODKPsDHZea47J
	VUl22S0MPLL5J/ck5SOrkkGrdNamYSBfAU3xLfhBJbQWRmuTNrgqKcknjRfwgyU04wTWlPRzITlRL
	2ooRA4dHojVtjBXvu/PT6KdtuBIgNKCVEOvfqYbVQYw/aNw5nevWRfKs9xSykra44GOaYStGbNCf2
	x4qG0JPJF/FMxEoZ9mLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u80Sl-0000000EuYP-1tOD;
	Thu, 24 Apr 2025 17:34:15 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u80Sj-0000000EuWT-0L3T
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 17:34:14 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-224191d92e4so15398345ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 24 Apr 2025 10:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745516052; x=1746120852; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DvBBsjj+z7fvXIiV8XNjx2EbWr7FpMlve2V3rRwX9go=;
        b=K4OT4ezqJfTXhRdeFNznLo0xxaxpYFdfKfV8yYZDeeS3ZXwrs3MkNE3GdrR+a59E/y
         Jp19c/z0mnZx3w9pYZ+t1oAZqo11SqcUoh2PLNGZadlqCbUcATgNkUwTMvcCn0Jw8Pzz
         4di02LWuUJx4nJKjIUZCHHL7oZBY2A4DwnAWFmrbvZ3j6UOmS+mm9i8Y5MSar+s14MvD
         tX4gThZ4ByhgXQgUwpzXeRYOOSrC1JYfmLE1tSs2cQUY1bAy2lHNECSdtV/Km10JEJuh
         In9GYRJOCbKgwpO/XNB/GtT2nf8mcD7syAyOmodRNAZNyxr4WB7fJU9kufOJeehS0v6j
         r+Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745516052; x=1746120852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DvBBsjj+z7fvXIiV8XNjx2EbWr7FpMlve2V3rRwX9go=;
        b=vihQaXKPxM2gW5OaucXl1SBSqYVn+kUPx7k85wDyBll+ro8byKbnzuUNIgu9nErs0g
         P3uAyT81PwkE7hKOvEog2QEAaa8FEj4eDcn2P9R7sPEdYnDUUVLx1uzIn4jaq/P5DjtY
         VsFcefRhHrC6YM/1msrIbkkbthHUg88Lb5g3xkpAD9rCz29pC1Xihfg9/AW81Z6Xn0if
         YlulquL9+R6YKnzBK88R7vRQHZx+gjlJAJNPkdETVO9xPD91jQ1PqYKt8JetzwYG1zy3
         0IXPXVPcRF6xBA4WYUou5Tw913oziKLmnjYc8p/R+5UuX6M1cRx3ys/fF2fQ4BDwqxbK
         3rkw==
X-Forwarded-Encrypted: i=1; AJvYcCVYbos4nFSfpiE4ugtp+aUID6YW5Wp4bfhUiCkhv155tUBQdGGPueUEnFZpuSiwGSaF6lqQA63JyyebAA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwKBTZxCyLvfpWPjKU/h++OdBfFlJvlx+pFdZ7D/jou89HzOn7V
	PScr0yuQ/aREYcAvVrugZKLFe3Q8+IOXedjhdsz6OJJ2HAsqItuBkAidr+2hMyQ=
X-Gm-Gg: ASbGncsZvPH5lyzGdFD58YNZA3K0MwRVrGsPPnCWaMCoubdQfRfdTAKRRoh0389Bi1y
	T30pYXGva1DcE6j3Db3ua9yXcsI+qKHU2Zqc/Nmy1vmJIJEEZ/1UtnbAu6oaMLpiholbZq0Czob
	j+XY9gDEPwnn3gtSR2zVDsUtALrLO9kTbOsVsz9YX5K5n5fCE4jUw/NrEAdYqbW59QVJYOOjX3V
	DRapm56bNw1twZtBzGVFGWtrq08orfP2Xu1mZDmtWPRjAYHYDqtz+iuQy6J1WmdM+RKpqDkPuOZ
	VKILRanZsAArSRuoRm9ze3OYp+Pv5BTP0Zdhe+7DeQ==
X-Google-Smtp-Source: AGHT+IGUt7NQqfqeO0namSyIMn7maNYN8P7cnVATP91mLdDbfQJ5Gas+mViREoMG88x9kDoZBx7Z4g==
X-Received: by 2002:a17:903:3c46:b0:21c:fb6:7c3c with SMTP id d9443c01a7336-22dbd412142mr4560165ad.17.1745516052316;
        Thu, 24 Apr 2025 10:34:12 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5100c4esm16270255ad.173.2025.04.24.10.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 10:34:11 -0700 (PDT)
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
	Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v6 04/14] riscv: sbi: add FWFT extension interface
Date: Thu, 24 Apr 2025 19:31:51 +0200
Message-ID: <20250424173204.1948385-5-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424173204.1948385-1-cleger@rivosinc.com>
References: <20250424173204.1948385-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_103413_118308_CA27CA28 
X-CRM114-Status: GOOD (  12.43  )
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
dGFuYW1pY3JvLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oIHwgMTcgKysr
KysrKysrKysKIGFyY2gvcmlzY3Yva2VybmVsL3NiaS5jICAgICAgfCA1NyArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgNzQgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmggYi9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3NiaS5oCmluZGV4IDdlYzI0OWZlYTg4MC4uM2JiZWY1NmJjZWZjIDEwMDY0
NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oCisrKyBiL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vc2JpLmgKQEAgLTUwMyw2ICs1MDMsMjMgQEAgaW50IHNiaV9yZW1vdGVfaGZlbmNl
X3Z2bWFfYXNpZChjb25zdCBzdHJ1Y3QgY3B1bWFzayAqY3B1X21hc2ssCiAJCQkJdW5zaWduZWQg
bG9uZyBhc2lkKTsKIGxvbmcgc2JpX3Byb2JlX2V4dGVuc2lvbihpbnQgZXh0KTsKIAoraW50IHNi
aV9md2Z0X3NldCh1MzIgZmVhdHVyZSwgdW5zaWduZWQgbG9uZyB2YWx1ZSwgdW5zaWduZWQgbG9u
ZyBmbGFncyk7CitpbnQgc2JpX2Z3ZnRfc2V0X2NwdW1hc2soY29uc3QgY3B1bWFza190ICptYXNr
LCB1MzIgZmVhdHVyZSwKKwkJCSB1bnNpZ25lZCBsb25nIHZhbHVlLCB1bnNpZ25lZCBsb25nIGZs
YWdzKTsKKy8qKgorICogc2JpX2Z3ZnRfc2V0X29ubGluZV9jcHVzKCkgLSBTZXQgYSBmZWF0dXJl
IG9uIGFsbCBvbmxpbmUgY3B1cworICogQGZlYXR1cmU6IFRoZSBmZWF0dXJlIHRvIGJlIHNldAor
ICogQHZhbHVlOiBUaGUgZmVhdHVyZSB2YWx1ZSB0byBiZSBzZXQKKyAqIEBmbGFnczogRldGVCBm
ZWF0dXJlIHNldCBmbGFncworICoKKyAqIFJldHVybjogMCBvbiBzdWNjZXNzLCBhcHByb3ByaWF0
ZSBsaW51eCBlcnJvciBjb2RlIG90aGVyd2lzZS4KKyAqLworc3RhdGljIGlubGluZSBpbnQgc2Jp
X2Z3ZnRfc2V0X29ubGluZV9jcHVzKHUzMiBmZWF0dXJlLCB1bnNpZ25lZCBsb25nIHZhbHVlLAor
CQkJCQkgICB1bnNpZ25lZCBsb25nIGZsYWdzKQoreworCXJldHVybiBzYmlfZndmdF9zZXRfY3B1
bWFzayhjcHVfb25saW5lX21hc2ssIGZlYXR1cmUsIHZhbHVlLCBmbGFncyk7Cit9CisKIC8qIENo
ZWNrIGlmIGN1cnJlbnQgU0JJIHNwZWNpZmljYXRpb24gdmVyc2lvbiBpcyAwLjEgb3Igbm90ICov
CiBzdGF0aWMgaW5saW5lIGludCBzYmlfc3BlY19pc18wXzEodm9pZCkKIHsKZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3Yva2VybmVsL3NiaS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMKaW5kZXgg
MWQ0NGMzNTMwNWE5Li5kNTdlNGRhZTdkYWMgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVs
L3NiaS5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3NiaS5jCkBAIC0yOTksNiArMjk5LDYzIEBA
IHN0YXRpYyBpbnQgX19zYmlfcmZlbmNlX3YwMihpbnQgZmlkLCBjb25zdCBzdHJ1Y3QgY3B1bWFz
ayAqY3B1X21hc2ssCiAJcmV0dXJuIDA7CiB9CiAKKy8qKgorICogc2JpX2Z3ZnRfc2V0KCkgLSBT
ZXQgYSBmZWF0dXJlIG9uIHRoZSBsb2NhbCBoYXJ0CisgKiBAZmVhdHVyZTogVGhlIGZlYXR1cmUg
SUQgdG8gYmUgc2V0CisgKiBAdmFsdWU6IFRoZSBmZWF0dXJlIHZhbHVlIHRvIGJlIHNldAorICog
QGZsYWdzOiBGV0ZUIGZlYXR1cmUgc2V0IGZsYWdzCisgKgorICogUmV0dXJuOiAwIG9uIHN1Y2Nl
c3MsIGFwcHJvcHJpYXRlIGxpbnV4IGVycm9yIGNvZGUgb3RoZXJ3aXNlLgorICovCitpbnQgc2Jp
X2Z3ZnRfc2V0KHUzMiBmZWF0dXJlLCB1bnNpZ25lZCBsb25nIHZhbHVlLCB1bnNpZ25lZCBsb25n
IGZsYWdzKQoreworCXJldHVybiAtRU9QTk9UU1VQUDsKK30KKworc3RydWN0IGZ3ZnRfc2V0X3Jl
cSB7CisJdTMyIGZlYXR1cmU7CisJdW5zaWduZWQgbG9uZyB2YWx1ZTsKKwl1bnNpZ25lZCBsb25n
IGZsYWdzOworCWF0b21pY190IGVycm9yOworfTsKKworc3RhdGljIHZvaWQgY3B1X3NiaV9md2Z0
X3NldCh2b2lkICphcmcpCit7CisJc3RydWN0IGZ3ZnRfc2V0X3JlcSAqcmVxID0gYXJnOworCWlu
dCByZXQ7CisKKwlyZXQgPSBzYmlfZndmdF9zZXQocmVxLT5mZWF0dXJlLCByZXEtPnZhbHVlLCBy
ZXEtPmZsYWdzKTsKKwlpZiAocmV0KQorCQlhdG9taWNfc2V0KCZyZXEtPmVycm9yLCByZXQpOwor
fQorCisvKioKKyAqIHNiaV9md2Z0X3NldF9jcHVtYXNrKCkgLSBTZXQgYSBmZWF0dXJlIGZvciB0
aGUgc3BlY2lmaWVkIGNwdW1hc2sKKyAqIEBtYXNrOiBDUFUgbWFzayBvZiBjcHVzIHRoYXQgbmVl
ZCB0aGUgZmVhdHVyZSB0byBiZSBzZXQKKyAqIEBmZWF0dXJlOiBUaGUgZmVhdHVyZSBJRCB0byBi
ZSBzZXQKKyAqIEB2YWx1ZTogVGhlIGZlYXR1cmUgdmFsdWUgdG8gYmUgc2V0CisgKiBAZmxhZ3M6
IEZXRlQgZmVhdHVyZSBzZXQgZmxhZ3MKKyAqCisgKiBSZXR1cm46IDAgb24gc3VjY2VzcywgYXBw
cm9wcmlhdGUgbGludXggZXJyb3IgY29kZSBvdGhlcndpc2UuCisgKi8KK2ludCBzYmlfZndmdF9z
ZXRfY3B1bWFzayhjb25zdCBjcHVtYXNrX3QgKm1hc2ssIHUzMiBmZWF0dXJlLAorCQkJICAgICAg
IHVuc2lnbmVkIGxvbmcgdmFsdWUsIHVuc2lnbmVkIGxvbmcgZmxhZ3MpCit7CisJc3RydWN0IGZ3
ZnRfc2V0X3JlcSByZXEgPSB7CisJCS5mZWF0dXJlID0gZmVhdHVyZSwKKwkJLnZhbHVlID0gdmFs
dWUsCisJCS5mbGFncyA9IGZsYWdzLAorCQkuZXJyb3IgPSBBVE9NSUNfSU5JVCgwKSwKKwl9Owor
CisJaWYgKGZlYXR1cmUgJiBTQklfRldGVF9HTE9CQUxfRkVBVFVSRV9CSVQpCisJCXJldHVybiAt
RUlOVkFMOworCisJb25fZWFjaF9jcHVfbWFzayhtYXNrLCBjcHVfc2JpX2Z3ZnRfc2V0LCAmcmVx
LCAxKTsKKworCXJldHVybiBhdG9taWNfcmVhZCgmcmVxLmVycm9yKTsKK30KKwogLyoqCiAgKiBz
Ymlfc2V0X3RpbWVyKCkgLSBQcm9ncmFtIHRoZSB0aW1lciBmb3IgbmV4dCB0aW1lciBldmVudC4K
ICAqIEBzdGltZV92YWx1ZTogVGhlIHZhbHVlIGFmdGVyIHdoaWNoIG5leHQgdGltZXIgZXZlbnQg
c2hvdWxkIGZpcmUuCi0tIAoyLjQ5LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
