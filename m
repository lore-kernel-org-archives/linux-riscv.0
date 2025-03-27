Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 719FFC36016
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Mar 2025 19:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X0xvBsbB8AEu6qIkM1O2tp/tSDlHG6IkgN/EkzA05vo=; b=awmXG4Nflu93Lp
	F8KuvPvDLteQr83zqZEW/lFpDVvrOiokHRdadQuoulutsdkCR964qQMFxmj4OPseSejoS0d8VIrn2
	u3WTpBSD9xTP0XoMRvlGeaxObCUFMUAaPSbdXcsquHAEBZCFlckWOvUi96dgGqGdm3keEmSOWMB4B
	V33w1CMH8u7k0BN4SVQfXcyEVXTZ9MzbOZiC/8iZywS9Mzst8FsX7Ab5DxpavMKsL9qMJgrCxx5YB
	eqHabXKWvsKddyy6jkxvsk6NpYcgA+kAtwi2fgC6K0WQErRl2wt1QjbT4W/QdPn8CCwH6asREmW0S
	8pwPWdFFS1KYSIXxHpqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txt8T-0000000BrWY-0Zdv;
	Thu, 27 Mar 2025 19:43:29 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txt1Z-0000000BpWf-2e4e
	for linux-riscv@lists.infradead.org;
	Thu, 27 Mar 2025 19:36:25 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-226185948ffso31578495ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 27 Mar 2025 12:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1743104179; x=1743708979; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SNiDOpzl6VVeJNgjlyJ9nrrgFT7wIm7QDa1NpBXt1X8=;
        b=NQ+q/xckMJTVMwxT2q9yn51FMy9c9at7RS37A0vbWxAkIu/8P6LGnkKQvxWDy6IaVk
         C0j0+eximDFaLwW2v09fcIDcdCF8aUTDziKRESHDqRasVOjedZjbDXq0Qxj79dYnyoRM
         byCTY+DIufwD1U4wsAUmNonSF/ClSGCQdRdv5xZ/CjNV7vUJxNbMtQxtfSuN1wDmF/xo
         ms7XneWdiXwntdSP5ug3J2BxxqhwcJSgpMOkA9A7NgdVqrdzNxa9SdlrNvxTTKY16KFu
         jAH6G3Soh7uC2WYwY+lXeLt3CMZpctgjGHxJk8gzVW5SUp/bTLuDlouelpmv8TuShV2w
         Kmsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743104179; x=1743708979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SNiDOpzl6VVeJNgjlyJ9nrrgFT7wIm7QDa1NpBXt1X8=;
        b=Ty7VqWE0GhO+pndyqPddicktQAnitVkiEGYSrdnPQLoSHrgOb3IsNqnr88u05yw5dW
         AV5i6XBh7R1PJFYyHovNDJfyWd4HsePug7G5XnJnE29Jp6gPqvIdjx/LJ0QllbHukvVg
         BYIpEFPlNdC1DH4G6VIi3cuNr0VZd93xTpcNFXfD+E1hofOcU75TIgEkDZkyqGIiPtvM
         bmsp7/0XOyc9xvNYBmpwRvxz/Orzib8iVXD+2R5TrpO1W+lySa68xqe4m7XpJMMkDBA5
         Vs1R9FUP84F/s/ef+UUJQ5vAwvvVMjx7I9Asn2skjWVD+n+lYw6E4+3Zo16nHFnsBkdq
         cq/A==
X-Gm-Message-State: AOJu0Yw3XLquOszhrOkMNKoZXBfjz0qITTAQ/6XxtdaLxLbCTjxwdFHE
	p1fZtZ0uXfUoRxVaFV2IVXLDwW1nlDTK4Zl1fx7DOji+4ilpW/3eOfcy5cJ+Fyk=
X-Gm-Gg: ASbGncuDoWF+a/qPGi2XOcr1u/L1YBu9Z1tOHw2ah6Ki2bsx7b13x7E10G3NktH92U3
	nd8bAusGMan1TMSuV6z9hoG6u2G5NUihYlfebHPSBtZ3hOt+lyWCTAJjLbxkv2Zr+xj2MUE3ETu
	1aND5fbnrsKipxnLa+9JiLLPwaAelQGc6WQ09H5kWwZKwTvVBDeNmmXORTBP1oLxagtcH8p9UCT
	ZB5cj7vrSIYHBdNc4hHWiN9heO++IK41QBa2hO+jQXAmB0yRJqOahjs9VHFp8hCqzJRczwRRx74
	oACOe8l/+3VgL8CxXZB6mG38Tf4xkGBCroN+XZXboutOsJkR+IUH/LVz2g==
X-Google-Smtp-Source: AGHT+IE+y9OOA1EBKtpBON1MPRGyOf1+3dniyWNGs1euEGYpPv+8H/XM0XTNXU8WsHLC0qF7ObKE3w==
X-Received: by 2002:a17:90a:d44f:b0:2ea:a9ac:eee1 with SMTP id 98e67ed59e1d1-303a7d6a7ffmr7665632a91.10.1743104174834;
        Thu, 27 Mar 2025 12:36:14 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f6b638csm2624220a91.44.2025.03.27.12.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 12:36:14 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 27 Mar 2025 12:35:43 -0700
Subject: [PATCH v5 02/21] RISC-V: Add Sxcsrind ISA extension CSR
 definitions
MIME-Version: 1.0
Message-Id: <20250327-counter_delegation-v5-2-1ee538468d1b@rivosinc.com>
References: <20250327-counter_delegation-v5-0-1ee538468d1b@rivosinc.com>
In-Reply-To: <20250327-counter_delegation-v5-0-1ee538468d1b@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atishp@atishpatra.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, weilin.wang@intel.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 Atish Patra <atishp@rivosinc.com>, Kaiwen Xue <kaiwenx@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_123621_671921_66D9E8C8 
X-CRM114-Status: UNSURE (   8.95  )
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

RnJvbTogS2Fpd2VuIFh1ZSA8a2Fpd2VueEByaXZvc2luYy5jb20+CgpUaGlzIGFkZHMgZGVmaW5p
dGlvbnMgb2YgbmV3IENTUnMgYW5kIGJpdHMgZGVmaW5lZCBpbiBTeGNzcmluZCBJU0EKZXh0ZW5z
aW9uLiBUaGVzZSBDU1IgZW5hYmxlcyBpbmRpcmVjdCBhY2Nlc3NlcyBtZWNoYW5pc20gdG8gYWNj
ZXNzCmFueSBDU1JzIGluIE0tLCBTLSwgYW5kIFZTLW1vZGUuIFRoZSByYW5nZSBvZiB0aGUgc2Vs
ZWN0IHZhbHVlcwphbmQgaXJlZyB3aWxsIGJlIGRlZmluZSBieSB0aGUgSVNBIGV4dGVuc2lvbiB1
c2luZyBTeGNzcmluZCBleHRlbnNpb24uCgpTaWduZWQtb2ZmLWJ5OiBLYWl3ZW4gWHVlIDxrYWl3
ZW54QHJpdm9zaW5jLmNvbT4KUmV2aWV3ZWQtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJp
dm9zaW5jLmNvbT4KU2lnbmVkLW9mZi1ieTogQXRpc2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5j
b20+Ci0tLQogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaCB8IDMwICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nzci5oIGIvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9jc3IuaAppbmRleCA2ZmVkNDJlMzc3MDUuLmJjZTU2YTgzYzM4NCAxMDA2NDQKLS0tIGEv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2Nzci5oCkBAIC0zMzMsNiArMzMzLDEyIEBACiAvKiBTdXBlcnZpc29yLUxldmVsIFdpbmRvdyB0
byBJbmRpcmVjdGx5IEFjY2Vzc2VkIFJlZ2lzdGVycyAoQUlBKSAqLwogI2RlZmluZSBDU1JfU0lT
RUxFQ1QJCTB4MTUwCiAjZGVmaW5lIENTUl9TSVJFRwkJMHgxNTEKKy8qIFN1cGVydmlzb3ItTGV2
ZWwgV2luZG93IHRvIEluZGlyZWN0bHkgQWNjZXNzZWQgUmVnaXN0ZXJzIChTeGNzcmluZCkgKi8K
KyNkZWZpbmUgQ1NSX1NJUkVHMgkJMHgxNTIKKyNkZWZpbmUgQ1NSX1NJUkVHMwkJMHgxNTMKKyNk
ZWZpbmUgQ1NSX1NJUkVHNAkJMHgxNTUKKyNkZWZpbmUgQ1NSX1NJUkVHNQkJMHgxNTYKKyNkZWZp
bmUgQ1NSX1NJUkVHNgkJMHgxNTcKIAogLyogU3VwZXJ2aXNvci1MZXZlbCBJbnRlcnJ1cHRzIChB
SUEpICovCiAjZGVmaW5lIENTUl9TVE9QRUkJCTB4MTVjCkBAIC0zODAsNiArMzg2LDE0IEBACiAv
KiBWUy1MZXZlbCBXaW5kb3cgdG8gSW5kaXJlY3RseSBBY2Nlc3NlZCBSZWdpc3RlcnMgKEgtZXh0
ZW5zaW9uIHdpdGggQUlBKSAqLwogI2RlZmluZSBDU1JfVlNJU0VMRUNUCQkweDI1MAogI2RlZmlu
ZSBDU1JfVlNJUkVHCQkweDI1MQorLyoKKyAqIFZTLUxldmVsIFdpbmRvdyB0byBJbmRpcmVjdGx5
IEFjY2Vzc2VkIFJlZ2lzdGVycyAoSC1leHRlbnNpb24gd2l0aCBTeGNzcmluZCkKKyAqLworI2Rl
ZmluZSBDU1JfVlNJUkVHMgkJMHgyNTIKKyNkZWZpbmUgQ1NSX1ZTSVJFRzMJCTB4MjUzCisjZGVm
aW5lIENTUl9WU0lSRUc0CQkweDI1NQorI2RlZmluZSBDU1JfVlNJUkVHNQkJMHgyNTYKKyNkZWZp
bmUgQ1NSX1ZJU1JFRzYJCTB4MjU3CiAKIC8qIFZTLUxldmVsIEludGVycnVwdHMgKEgtZXh0ZW5z
aW9uIHdpdGggQUlBKSAqLwogI2RlZmluZSBDU1JfVlNUT1BFSQkJMHgyNWMKQEAgLTQyMiw2ICs0
MzYsMTIgQEAKIC8qIE1hY2hpbmUtTGV2ZWwgV2luZG93IHRvIEluZGlyZWN0bHkgQWNjZXNzZWQg
UmVnaXN0ZXJzIChBSUEpICovCiAjZGVmaW5lIENTUl9NSVNFTEVDVAkJMHgzNTAKICNkZWZpbmUg
Q1NSX01JUkVHCQkweDM1MQorLyogTWFjaGluZS1MZXZlbCBXaW5kb3cgdG8gSW5kaXJlY3RseSBB
Y2Nlc3NlZCBSZWdpc3RlcnMgKFN4Y3NyaW5kKSAqLworI2RlZmluZSBDU1JfTUlSRUcyCQkweDM1
MgorI2RlZmluZSBDU1JfTUlSRUczCQkweDM1MworI2RlZmluZSBDU1JfTUlSRUc0CQkweDM1NQor
I2RlZmluZSBDU1JfTUlSRUc1CQkweDM1NgorI2RlZmluZSBDU1JfTUlSRUc2CQkweDM1NwogCiAv
KiBNYWNoaW5lLUxldmVsIEludGVycnVwdHMgKEFJQSkgKi8KICNkZWZpbmUgQ1NSX01UT1BFSQkJ
MHgzNWMKQEAgLTQ2Nyw2ICs0ODcsMTEgQEAKICMgZGVmaW5lIENTUl9JRUgJCUNTUl9NSUVICiAj
IGRlZmluZSBDU1JfSVNFTEVDVAlDU1JfTUlTRUxFQ1QKICMgZGVmaW5lIENTUl9JUkVHCUNTUl9N
SVJFRworIyBkZWZpbmUgQ1NSX0lSRUcyCUNTUl9NSVJFRzIKKyMgZGVmaW5lIENTUl9JUkVHMwlD
U1JfTUlSRUczCisjIGRlZmluZSBDU1JfSVJFRzQJQ1NSX01JUkVHNAorIyBkZWZpbmUgQ1NSX0lS
RUc1CUNTUl9NSVJFRzUKKyMgZGVmaW5lIENTUl9JUkVHNglDU1JfTUlSRUc2CiAjIGRlZmluZSBD
U1JfSVBICQlDU1JfTUlQSAogIyBkZWZpbmUgQ1NSX1RPUEVJCUNTUl9NVE9QRUkKICMgZGVmaW5l
IENTUl9UT1BJCUNTUl9NVE9QSQpAQCAtNDkyLDYgKzUxNywxMSBAQAogIyBkZWZpbmUgQ1NSX0lF
SAkJQ1NSX1NJRUgKICMgZGVmaW5lIENTUl9JU0VMRUNUCUNTUl9TSVNFTEVDVAogIyBkZWZpbmUg
Q1NSX0lSRUcJQ1NSX1NJUkVHCisjIGRlZmluZSBDU1JfSVJFRzIJQ1NSX1NJUkVHMgorIyBkZWZp
bmUgQ1NSX0lSRUczCUNTUl9TSVJFRzMKKyMgZGVmaW5lIENTUl9JUkVHNAlDU1JfU0lSRUc0Cisj
IGRlZmluZSBDU1JfSVJFRzUJQ1NSX1NJUkVHNQorIyBkZWZpbmUgQ1NSX0lSRUc2CUNTUl9TSVJF
RzYKICMgZGVmaW5lIENTUl9JUEgJCUNTUl9TSVBICiAjIGRlZmluZSBDU1JfVE9QRUkJQ1NSX1NU
T1BFSQogIyBkZWZpbmUgQ1NSX1RPUEkJQ1NSX1NUT1BJCgotLSAKMi40My4wCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
