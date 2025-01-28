Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D32EC02190
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jan 2025 05:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ez6DD7BB1mNDH3kkd6YuMPL/JMFEGp6F5G5+VC/x7c8=; b=3b9Oj/L12J6hkd
	3TknIggCBAdEii7ImGd5SlBy5pU4IwKcCA6RGzBVQzOezGpGl4mKmIxWDgk95M0Uby7yi4COMhFo9
	3dQTuAvesbeBgrEyRL/IAh+ybwHYlNC/JKvz8ol0PHHRFxKHtqNad5zEYy9d4h31tnBcJUXZiNEo6
	eR70GXDm4IyFp3sRmwRXevpRQ/CmsbFPiXr5Nef8KTiaWqtXQeZ7GVX5Yj5hnuympWhismOEZmL0L
	1ix0XCDiZ/6JtE4Bm+/vRxKGYnPwEiNTC3WqIXO/+rwglqKBCbCAuC/fwKJQadbTzB70rS2/o8kyR
	K+YEGE69lxviGUVgIicQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcdrw-000000047OM-2gIn;
	Tue, 28 Jan 2025 05:10:36 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcdhh-000000044Sy-10nX
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jan 2025 05:00:02 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2efd81c7ca4so6882224a91.2
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jan 2025 21:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738040401; x=1738645201; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5mrMIkTEe6NxNBfmJmR1XKICEvWgZ9tUVZlETsQZaOc=;
        b=I6q5FTeYHcCzESWR2Mv4qXtXzDhuAITL95N67RVQP63dG+68BbrMSTE8cpk8KcNyMz
         n+3m+sxTrD5jGkKUrsVLf7x3z5Iqbcxsy/3iSrz83ioO9yw3xKnFpE8yX/qwp2L6G8FV
         Ek4Ol88+egoill1inF7CN6xzoFlhbfcXXanuXWP7suAE0qWzjO33wNY0vZ9Aej8vD3A3
         yC9oaJLk0jmMTzxQMVyu+t4KU4l7/ATbMLPvMu2jUlagZzVe/nv++r8I3rxLNIz9HKXG
         8zKQ89lDgXiwEcv75WWKklAfzYlCfMtTxNP9OiC8ZEWkyM+cs4BBsd0NDrvuUoibTnHG
         R8xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738040401; x=1738645201;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5mrMIkTEe6NxNBfmJmR1XKICEvWgZ9tUVZlETsQZaOc=;
        b=ERjWER4kYhx+YeIb7A2QlO1RoNjQlynBBhJfHdq7F5NZoemJFvEZMTkY7O6l/9W4R7
         qDFrBrV3luM0E67V0qdWQqALk68z5DEeXokqMuGHKmp+VtdE/C8olw/26BWYLOpE11zU
         Tg3H5vEplNhcNNampvIDt7R9p/tXEU2LqH3zcZ3LhhmnuWsq4GxJpp+9McYVxNl2DwhM
         1FYSZaofUIzaafXu9XCxAtdDgQHxSSDIihxj2MIwn1o65RIjWfLAP79Hc+fds501MyDZ
         Gm9LAxrD2f1yMsNWjPHL8SEib2W79XysAvciz+zAeTNeDgPT0J0GU17c/svot/QSgMOa
         PzbQ==
X-Gm-Message-State: AOJu0YyrtTqpnmSFzM8FLyylKJcPhy6r+gxtFOIgwsdKLMvY13lIFaLF
	AOg+CTLMvZRXbO177zkj7uGovLU1cNDX4UWMrMdWlGVL/HHvgCyZsxN93CA87qQ=
X-Gm-Gg: ASbGncsRsI7ui04kE082AHwyge4x7SBO1QI6k9Wjdj/fEzGPwq7MQWbOBToObgUo/Jq
	sTRuZ13CYW4cbaOEEQPucAETH4CFFRT1tsyQLrUfVHKySPG+WEY2ewIhm8CKHF/CWcVHxjgsDD7
	8dSZXTR2XIgQ1khE1E5zKxJ+L0qFOPGK1ZbxpFbwPO8LOXq5hPcC+Z9yzE8hGBXaV5g5BAKGeiX
	7Frw1901dduwuGUb534mRV+mUrpYmIg6qZ00NTGSc4WT4fKERENvnnsop7UtqdGIatQupriF1Pa
	DGqnUyiS8N5j4s1s+RBbiu2p/lJE
X-Google-Smtp-Source: AGHT+IH1CyamZ5GxB/LaeGh1+pUXZNcyZ/3f2i2HBGmcLQlGMYAJa1S5yIJT+e6qxkT5U/Ox2SNkIQ==
X-Received: by 2002:a17:90b:288a:b0:2ee:bc7b:9237 with SMTP id 98e67ed59e1d1-2f782d35fafmr61340887a91.27.1738040400688;
        Mon, 27 Jan 2025 21:00:00 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa5a7f7sm8212776a91.11.2025.01.27.20.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 21:00:00 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 27 Jan 2025 20:59:48 -0800
Subject: [PATCH v3 07/21] RISC-V: Add Ssccfg ISA extension definition and
 parsing
MIME-Version: 1.0
Message-Id: <20250127-counter_delegation-v3-7-64894d7e16d5@rivosinc.com>
References: <20250127-counter_delegation-v3-0-64894d7e16d5@rivosinc.com>
In-Reply-To: <20250127-counter_delegation-v3-0-64894d7e16d5@rivosinc.com>
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
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_210001_333446_BCEFF448 
X-CRM114-Status: GOOD (  10.13  )
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
