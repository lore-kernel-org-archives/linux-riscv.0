Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD74AC3600B
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Mar 2025 19:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o14/CP7lev78GdaYFu4KsTtA6e7jO74Lla0UboQf7xg=; b=FQVJfM2hYkdy8i
	ov6n/zxgtCjP5FEFMTQ8kY1jth/b3fIKWqJnvL3EnGsI8gGWIgw0RewXlqeM9JjlJMQ9JxXMb80nX
	mVPCHogogIsYe1L/BMXGm8vG5oy2FUC2TIKSW+qXHix5/S3Ti7r/gcYJHpHKUM4mYxOuRPbycWvcO
	XvTKSXMQRknElG2l2oU4kcyMQbJqdScU91Hxz01/Sd6EFEYaB4maiJy7LEwhSJ1HKQfDqC9OaRMhn
	7csH/VRfI0T7pZz12Z4xMmuwGLcLYM7FqFmt9Uxgfw1nnzrlbkLBmFNC1+KN4UwALMr86/pkCts/R
	N1IGFVIlSxOFFnlXmOrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txtC7-0000000Bsb0-2fYG;
	Thu, 27 Mar 2025 19:47:15 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txt1f-0000000BpcE-1X1B
	for linux-riscv@lists.infradead.org;
	Thu, 27 Mar 2025 19:36:28 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-227b828de00so27162955ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 27 Mar 2025 12:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1743104186; x=1743708986; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fU6+swbjNie6iv0e0xu8zQCGmiznni+/eNGoYv30rIw=;
        b=ve/ve+TQyaOHZstd+j3+yFbVcWijJ0F4vw05Bat+mtEbVFSu1BGBKMF6r1zSmtFxvU
         oNeLGN9GQ6se8KniSpJKurYDHyjT/AEMGt3o5YPe7dEuQEj2jr3E9JtWg3Y1yZpWU2G1
         VYzmQli+gChYqKbuA5Pexrg49nQv9tzZYpQiVufNU7ucMm946Ci6C8fqp+i9VRkS0i3g
         4eI5txGfhTr+is/RXemNcf3hnKgaFeebtPNC1zF4tayoFAF8GYO2wfW0l5enve+eSxUM
         HMN9Pz+JDgd/0tzplw7FctuYahkFS60vv5FOQS5olSW6V0hXRkS2x9EsDoA1aJNH+mhe
         jR1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743104186; x=1743708986;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fU6+swbjNie6iv0e0xu8zQCGmiznni+/eNGoYv30rIw=;
        b=OucOyckWE+aAlsO106vjdg7mcqaVX43tHrCxCcmwHQjP93KGfc9sDMJkZglDFEVSZD
         qtgeqcfcquiM653mCllM45Y0x0GxLaVPOW628FTCbtGWjwGpbTRI340xgA3/omZGdtiR
         p1hWZd9WoO8v/Td0LIbRmBm0xgtdz2y042uymOtQ4V0sQGgHbimF5/bRjOxrUBonOMkI
         Qed0iY+fCMnj4nXp1utWpujBqNxaPvxl8qlOy4EuCPXcZGvItzJrImUpepmddnahOO2/
         B0k8KU/qNoTrajy3u5/UlO7KgBv3ACpW/Zz4w6Mt+cLT4Fnw999kSuL8FGbzOGxRgl1r
         oOOg==
X-Gm-Message-State: AOJu0YzRYEb4ovxE53lz0K9TewYUyMB0wVlVx6rY17Hn2P4l+NAgSz7G
	azc8lsG/jM4PcHkyzSRGqED2IAl6Vfnki5CnibrshMLJx1vIwlF2/+hVmUWhcHc=
X-Gm-Gg: ASbGncuSRrYx5GnJcPpcvpFa4ieN6IUjB2KLwbcvnL4E85lMXT+Sx/JSJKflKRc6Gxe
	OU3WFjaOc8Pl4+ZDenoyOpKWOi0GzL1DscHf37W3QQgstPSL3UssMMlDgHOxAtmL6uBojn2KWbI
	KA4fc6iKws5XtGYhOUjgPMmVLrVbKjvhruKutvY5Tr4JGY0aKBi0X1TTfOi+M9rWF+ZdWRYHbrX
	jhq+gDVhFD4gPf3nBnqhbPJOGjF3fh71BqJHKRAVq+1FDeBqd2ASJbmj5sDxzrIdSsQsMP86P9G
	JbBLxWe1qK8hPkAsEHObJ7EXoG7dg1decyzZib+nOsv0hV5P6b/UvEJlvA==
X-Google-Smtp-Source: AGHT+IG6W5JCnq2W/DPMkiUqQh7RSB5vMs9zmrYMV01msf9VIMSJa0JuflPjxBxsdjfYbz9YgA1nag==
X-Received: by 2002:a17:90b:2ed0:b0:2fe:861b:1ae3 with SMTP id 98e67ed59e1d1-303a7d66291mr7527766a91.8.1743104186345;
        Thu, 27 Mar 2025 12:36:26 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f6b638csm2624220a91.44.2025.03.27.12.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 12:36:26 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 27 Mar 2025 12:35:50 -0700
Subject: [PATCH v5 09/21] RISC-V: Add Ssccfg/Smcdeleg ISA extension
 definition and parsing
MIME-Version: 1.0
Message-Id: <20250327-counter_delegation-v5-9-1ee538468d1b@rivosinc.com>
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
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_123627_444064_8EB8E728 
X-CRM114-Status: GOOD (  12.27  )
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

U21jZGVsZWcgZXh0ZW5zaW9uIGFsbG93cyB0aGUgTS1tb2RlIHRvIGRlbGVnYXRlIHNlbGVjdGVk
IGNvdW50ZXJzCnRvIFMtbW9kZSBzbyB0aGF0IGl0IGNhbiBhY2Nlc3MgdGhvc2UgY291bnRlcnMg
YW5kIGNvcnJlcHNvbmRpbmcKaHBtZXZlbnQgQ1NScyB3aXRob3V0IE0tbW9kZS4KClNzY2NmZyAo
4oCYU3PigJkgZm9yIFByaXZpbGVnZWQgYXJjaGl0ZWN0dXJlIGFuZCBTdXBlcnZpc29yLWxldmVs
CmV4dGVuc2lvbiwg4oCYY2NmZ+KAmSBmb3IgQ291bnRlciBDb25maWd1cmF0aW9uKSBwcm92aWRl
cyBhY2Nlc3MgdG8KZGVsZWdhdGVkIGNvdW50ZXJzIGFuZCBuZXcgc3VwZXJ2aXNvci1sZXZlbCBz
dGF0ZS4KClRoaXMgcGF0Y2gganVzdCBlbmFibGVzIHRoZXNlIGRlZmluaXRpb25zIGFuZCBlbmFi
bGUgcGFyc2luZy4KClNpZ25lZC1vZmYtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2b3NpbmMu
Y29tPgotLS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaCB8ICAyICsrCiBhcmNoL3Jp
c2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgfCAyNCArKysrKysrKysrKysrKysrKysrKysrKysKIDIg
ZmlsZXMgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vaHdjYXAuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaAppbmRl
eCBiNGVkZGNiNTc4NDIuLmZhNWUwMWJjYjk5MCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9od2NhcC5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaApAQCAt
MTAzLDYgKzEwMyw4IEBACiAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfU1NDU1JJTkQJCTk0CiAjZGVm
aW5lIFJJU0NWX0lTQV9FWFRfU01DU1JJTkQJCTk1CiAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfU01D
TlRSUE1GICAgICAgICAgOTYKKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9TU0NDRkcgICAgICAgICAg
ICA5NworI2RlZmluZSBSSVNDVl9JU0FfRVhUX1NNQ0RFTEVHICAgICAgICAgIDk4CiAKICNkZWZp
bmUgUklTQ1ZfSVNBX0VYVF9YTElOVVhFTlZDRkcJMTI3CiAKZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3Yva2VybmVsL2NwdWZlYXR1cmUuYyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwpp
bmRleCBlM2U0MGNmZTc5NjcuLmY3MjU1MmFkYjI1NyAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9r
ZXJuZWwvY3B1ZmVhdHVyZS5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwpA
QCAtMTUwLDYgKzE1MCwyNyBAQCBzdGF0aWMgaW50IHJpc2N2X2V4dF9zdmFkdV92YWxpZGF0ZShj
b25zdCBzdHJ1Y3QgcmlzY3ZfaXNhX2V4dF9kYXRhICpkYXRhLAogCXJldHVybiAwOwogfQogCitz
dGF0aWMgaW50IHJpc2N2X2V4dF9zbWNkZWxlZ192YWxpZGF0ZShjb25zdCBzdHJ1Y3QgcmlzY3Zf
aXNhX2V4dF9kYXRhICpkYXRhLAorCQkJCSAgICAgICBjb25zdCB1bnNpZ25lZCBsb25nICppc2Ff
Yml0bWFwKQoreworCWlmIChfX3Jpc2N2X2lzYV9leHRlbnNpb25fYXZhaWxhYmxlKGlzYV9iaXRt
YXAsIFJJU0NWX0lTQV9FWFRfU1NDU1JJTkQpICYmCisJICAgIF9fcmlzY3ZfaXNhX2V4dGVuc2lv
bl9hdmFpbGFibGUoaXNhX2JpdG1hcCwgUklTQ1ZfSVNBX0VYVF9aSUhQTSkgJiYKKwkgICAgX19y
aXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZShpc2FfYml0bWFwLCBSSVNDVl9JU0FfRVhUX1pJ
Q05UUikpCisJCXJldHVybiAwOworCisJcmV0dXJuIC1FUFJPQkVfREVGRVI7Cit9CisKK3N0YXRp
YyBpbnQgcmlzY3ZfZXh0X3NzY2NmZ192YWxpZGF0ZShjb25zdCBzdHJ1Y3QgcmlzY3ZfaXNhX2V4
dF9kYXRhICpkYXRhLAorCQkJCSAgICAgY29uc3QgdW5zaWduZWQgbG9uZyAqaXNhX2JpdG1hcCkK
K3sKKwlpZiAoIXJpc2N2X2V4dF9zbWNkZWxlZ192YWxpZGF0ZShkYXRhLCBpc2FfYml0bWFwKSAm
JgorCSAgICBfX3Jpc2N2X2lzYV9leHRlbnNpb25fYXZhaWxhYmxlKGlzYV9iaXRtYXAsIFJJU0NW
X0lTQV9FWFRfU01DREVMRUcpKQorCQlyZXR1cm4gMDsKKworCXJldHVybiAtRVBST0JFX0RFRkVS
OworfQorCiBzdGF0aWMgY29uc3QgdW5zaWduZWQgaW50IHJpc2N2X3prX2J1bmRsZWRfZXh0c1td
ID0gewogCVJJU0NWX0lTQV9FWFRfWkJLQiwKIAlSSVNDVl9JU0FfRVhUX1pCS0MsCkBAIC0zOTQs
MTIgKzQxNSwxNSBAQCBjb25zdCBzdHJ1Y3QgcmlzY3ZfaXNhX2V4dF9kYXRhIHJpc2N2X2lzYV9l
eHRbXSA9IHsKIAlfX1JJU0NWX0lTQV9FWFRfQlVORExFKHp2a3NnLCByaXNjdl96dmtzZ19idW5k
bGVkX2V4dHMpLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHp2a3QsIFJJU0NWX0lTQV9FWFRfWlZL
VCksCiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoc21haWEsIFJJU0NWX0lTQV9FWFRfU01BSUEpLAor
CV9fUklTQ1ZfSVNBX0VYVF9EQVRBX1ZBTElEQVRFKHNtY2RlbGVnLCBSSVNDVl9JU0FfRVhUX1NN
Q0RFTEVHLAorCQkJCSAgICAgIHJpc2N2X2V4dF9zbWNkZWxlZ192YWxpZGF0ZSksCiAJX19SSVND
Vl9JU0FfRVhUX0RBVEEoc21jbnRycG1mLCBSSVNDVl9JU0FfRVhUX1NNQ05UUlBNRiksCiAJX19S
SVNDVl9JU0FfRVhUX0RBVEEoc21jc3JpbmQsIFJJU0NWX0lTQV9FWFRfU01DU1JJTkQpLAogCV9f
UklTQ1ZfSVNBX0VYVF9EQVRBKHNtbXBtLCBSSVNDVl9JU0FfRVhUX1NNTVBNKSwKIAlfX1JJU0NW
X0lTQV9FWFRfU1VQRVJTRVQoc21ucG0sIFJJU0NWX0lTQV9FWFRfU01OUE0sIHJpc2N2X3hsaW51
eGVudmNmZ19leHRzKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQShzbXN0YXRlZW4sIFJJU0NWX0lT
QV9FWFRfU01TVEFURUVOKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQShzc2FpYSwgUklTQ1ZfSVNB
X0VYVF9TU0FJQSksCisJX19SSVNDVl9JU0FfRVhUX0RBVEFfVkFMSURBVEUoc3NjY2ZnLCBSSVND
Vl9JU0FfRVhUX1NTQ0NGRywgcmlzY3ZfZXh0X3NzY2NmZ192YWxpZGF0ZSksCiAJX19SSVNDVl9J
U0FfRVhUX0RBVEEoc3Njb2ZwbWYsIFJJU0NWX0lTQV9FWFRfU1NDT0ZQTUYpLAogCV9fUklTQ1Zf
SVNBX0VYVF9EQVRBKHNzY3NyaW5kLCBSSVNDVl9JU0FfRVhUX1NTQ1NSSU5EKSwKIAlfX1JJU0NW
X0lTQV9FWFRfU1VQRVJTRVQoc3NucG0sIFJJU0NWX0lTQV9FWFRfU1NOUE0sIHJpc2N2X3hsaW51
eGVudmNmZ19leHRzKSwKCi0tIAoyLjQzLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
