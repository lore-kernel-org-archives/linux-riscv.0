Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB69DC02183
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 23:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ez6DD7BB1mNDH3kkd6YuMPL/JMFEGp6F5G5+VC/x7c8=; b=ox7euLdwrnVz2X
	325AAmiWh3lXzjRJQ/7n6hikxod1grs/U1ls71F/pRDQ7Rtn5T3vn+SKqKoNvCES6K/l1YesryZw4
	Sd2t8nEZ5HMOlM9l+YBtcqIyp2A4Tn6sBmVjdP/oNuqQ3GFT5OL+gcHD6tLisuGRSbV/+gXZZNdso
	G3fRFUQI/wFUXlYa4hxVWXACs8jeO+ybroXeD6HjH/3ZkuEnEILkubdVjqblqSVmEu14drm1DogrX
	eY2icKpTu7hTbqihfs0dFQoxgKUmfEfbn5qDjvxMs/2FHisC9GUmWLtXCXwfkrt9Md9IzNyRE5FUx
	jac7xxwybdlh+waMfvOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXq0C-0000000A2rf-0DAS;
	Tue, 14 Jan 2025 23:07:16 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXpri-00000009zs8-1dgQ
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jan 2025 22:58:31 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2163bd70069so110770425ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jan 2025 14:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736895510; x=1737500310; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5mrMIkTEe6NxNBfmJmR1XKICEvWgZ9tUVZlETsQZaOc=;
        b=UHBW/4ouU2GIhAFqiYMl8UaVRS4Qg5q1P0or7ey9Ju/wBzS8yoI+JA1MSq4FEX8969
         BEFgp7qjU5SzTEI1BFLHXKxzsBeHdBNWfcyUhw4YwK3oPwciKuJwuEv5wjf7keUiTRd5
         2sK3n2U52WeJ+wcZ/i80ZLSERx81wMmARDgpDSd+qIu8GTxrWy65qTpEv1XFgdqLh3VN
         iws84/qXFBYr3QW1jf60fncQmxkAxwr8M4Dd61XGmvtWZHmESqu+u8mx4f/743/KHD5z
         PDpqyTfNvZQgsl9QoDpvm4oMLoJOlIa50xnxlm7Wo1z43JzLsi+hQCu/SzMiZTc6E75X
         nwhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736895510; x=1737500310;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5mrMIkTEe6NxNBfmJmR1XKICEvWgZ9tUVZlETsQZaOc=;
        b=p6Pj+KGBb4NF3s5j38xUGkYZ48u8l/x48FGMZfrjt6Kedr9LKysugu2tECiZdapmjK
         DmJVueTw70fNpdCeRtircjoCMXD6Onm9tX/FatkqlXt022AzVTa2z4t4CJ/BvSQGgDSd
         dj1rQXqWQ6pMAqarRAAJ65UH4lAs0k0K8gTVfQicnCs3RWJPg/FH7JRBqUQXpBFku4ZJ
         I6716VrK5ah7VlQhafqJE5JRkQ5IaImYTUAHw2Db56vm6D5Dzm//s7TT02D1Vr57iI8o
         /OYDOoudZdWVx1LhKhNV7tKfFAxONB9Nd4MEsC8KUjYgyLBWP3MIafGHdHzAwfxDlCRZ
         abDA==
X-Gm-Message-State: AOJu0YwBYuFPFWdfnAWCBmpe6buHWI8Ww6k2+bfhbWd5pt5CIGQSpziK
	AArXwRQwuyeP2KHpFUoJqihLWve8pRSFbHKlDC/mbNm0yqXUyFTLrjUjCiCzacY=
X-Gm-Gg: ASbGncvsfDa0ncqV+uqe1s1aag4TpcONMu4EhLdW+YzCyqlfHjlisrLffyTvkLmtW0C
	cBls8fk9GRbofOgfzBQahLB7+j6z/XKnapO7nE2W0e82jEE8D4Lcb1OLvXS4mwKrx2jznfsYhWB
	R57ozmaazYmKp9ZGeDQNjti56oPjc3ZBF179yyyqKekbh7A9oDGZj05cD24DqpPr8dMLl7ZPN6L
	pB1eYVFPPbE6s4elmcGlbqtN6siwqGDexbIphKDe7CcBucqVwFYggm0LwvCNrba70/rOQ==
X-Google-Smtp-Source: AGHT+IHxXDdAHPYokpxm47ueo2TdVOG0GfdEc0qqp9YuFJCqGs1f9K+cpyt7QXfGQGsnfIi5G6wVOw==
X-Received: by 2002:a17:902:e544:b0:216:50c6:6b47 with SMTP id d9443c01a7336-21a8400038bmr426908115ad.46.1736895509814;
        Tue, 14 Jan 2025 14:58:29 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f10df7asm71746105ad.47.2025.01.14.14.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 14:58:29 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 14 Jan 2025 14:57:32 -0800
Subject: [PATCH v2 07/21] RISC-V: Add Ssccfg ISA extension definition and
 parsing
MIME-Version: 1.0
Message-Id: <20250114-counter_delegation-v2-7-8ba74cdb851b@rivosinc.com>
References: <20250114-counter_delegation-v2-0-8ba74cdb851b@rivosinc.com>
In-Reply-To: <20250114-counter_delegation-v2-0-8ba74cdb851b@rivosinc.com>
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
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_145830_424085_C1041A0C 
X-CRM114-Status: UNSURE (   9.87  )
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

U3NjY2ZnICjigJhTc+KAmSBmb3IgUHJpdmlsZWdlZCBhcmNoaXRlY3R1cmUgYW5kIFN1cGVydmlz
b3ItbGV2ZWwKZXh0ZW5zaW9uLCDigJhjY2Zn4oCZIGZvciBDb3VudGVyIENvbmZpZ3VyYXRpb24p
IHByb3ZpZGVzIGFjY2VzcyB0bwpkZWxlZ2F0ZWQgY291bnRlcnMgYW5kIG5ldyBzdXBlcnZpc29y
LWxldmVsIHN0YXRlLgoKVGhpcyBwYXRjaCBqdXN0IGVuYWJsZXMgdGhlIGRlZmluaXRpb25zIGFu
ZCBlbmFibGUgcGFyc2luZy4KClNpZ25lZC1vZmYtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2
b3NpbmMuY29tPgotLS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaCB8IDIgKysKIGFy
Y2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyB8IDIgKysKIDIgZmlsZXMgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5o
IGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCmluZGV4IDNkNmU3MDZmYzViMi4uMmY1
ZWYxZGVlN2FjIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKKysr
IGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCkBAIC0xMDIsNiArMTAyLDggQEAKICNk
ZWZpbmUgUklTQ1ZfSVNBX0VYVF9TVkFEVQkJOTMKICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9TU0NT
UklORAkJOTQKICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9TTUNTUklORAkJOTUKKyNkZWZpbmUgUklT
Q1ZfSVNBX0VYVF9TU0NDRkcgICAgICAgICAgICA5NgorI2RlZmluZSBSSVNDVl9JU0FfRVhUX1NN
Q0RFTEVHICAgICAgICAgIDk3CiAKICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9YTElOVVhFTlZDRkcJ
MTI3CiAKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyBiL2FyY2gv
cmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwppbmRleCBkMzI1OWI2NDAxMTUuLmI1ODRhYTJkNWJj
MyAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCisrKyBiL2FyY2gv
cmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwpAQCAtMzkwLDEyICszOTAsMTQgQEAgY29uc3Qgc3Ry
dWN0IHJpc2N2X2lzYV9leHRfZGF0YSByaXNjdl9pc2FfZXh0W10gPSB7CiAJX19SSVNDVl9JU0Ff
RVhUX0JVTkRMRSh6dmtzZywgcmlzY3ZfenZrc2dfYnVuZGxlZF9leHRzKSwKIAlfX1JJU0NWX0lT
QV9FWFRfREFUQSh6dmt0LCBSSVNDVl9JU0FfRVhUX1pWS1QpLAogCV9fUklTQ1ZfSVNBX0VYVF9E
QVRBKHNtYWlhLCBSSVNDVl9JU0FfRVhUX1NNQUlBKSwKKwlfX1JJU0NWX0lTQV9FWFRfREFUQShz
bWNkZWxlZywgUklTQ1ZfSVNBX0VYVF9TTUNERUxFRyksCiAJX19SSVNDVl9JU0FfRVhUX0RBVEEo
c21tcG0sIFJJU0NWX0lTQV9FWFRfU01NUE0pLAogCV9fUklTQ1ZfSVNBX0VYVF9TVVBFUlNFVChz
bW5wbSwgUklTQ1ZfSVNBX0VYVF9TTU5QTSwgcmlzY3ZfeGxpbnV4ZW52Y2ZnX2V4dHMpLAogCV9f
UklTQ1ZfSVNBX0VYVF9EQVRBKHNtc3RhdGVlbiwgUklTQ1ZfSVNBX0VYVF9TTVNUQVRFRU4pLAog
CV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHNtY3NyaW5kLCBSSVNDVl9JU0FfRVhUX1NNQ1NSSU5EKSwK
IAlfX1JJU0NWX0lTQV9FWFRfREFUQShzc2FpYSwgUklTQ1ZfSVNBX0VYVF9TU0FJQSksCiAJX19S
SVNDVl9JU0FfRVhUX0RBVEEoc3Njc3JpbmQsIFJJU0NWX0lTQV9FWFRfU1NDU1JJTkQpLAorCV9f
UklTQ1ZfSVNBX0VYVF9EQVRBKHNzY2NmZywgUklTQ1ZfSVNBX0VYVF9TU0NDRkcpLAogCV9fUklT
Q1ZfSVNBX0VYVF9EQVRBKHNzY29mcG1mLCBSSVNDVl9JU0FfRVhUX1NTQ09GUE1GKSwKIAlfX1JJ
U0NWX0lTQV9FWFRfU1VQRVJTRVQoc3NucG0sIFJJU0NWX0lTQV9FWFRfU1NOUE0sIHJpc2N2X3hs
aW51eGVudmNmZ19leHRzKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQShzc3RjLCBSSVNDVl9JU0Ff
RVhUX1NTVEMpLAoKLS0gCjIuMzQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
