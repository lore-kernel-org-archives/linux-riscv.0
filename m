Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B13C3600B
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Mar 2025 19:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O6fYzmq8+SnFXgbeKi4MVBIgVrYsUqdi6D0OoW4bN9g=; b=rNwr/Bn957rj6v
	QXRl8/VpiZiWGh4RXQZoLEhJ923CVD8BkgjZoRS+qsfD+o5fDmNX8GvpetIerTy51tLJai3t8Qg2M
	CIP+Zv93uIXg9co9yWuGoREeeLASplNM+mEpB/fCT3mNGhcqv6L6lL1i6JDDRNpW431tbnv0gWZ2u
	QTgXJ33w131ER/NpcL/bqdwaB+vYBn3CYrWqKzlAi6hfXX4SdlVjIdSjVOo8INqcIsaYB5E+Ajhtz
	iWUdvUysqJSHPet3bGF2xwMLrBX1LQneRE6djzq/dz66O+ikPXpIUYgy+gwmpFckfp+F3GXDbvyya
	tXi5oWnP21QpFguQ0+5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txtFX-0000000BtS4-17Nh;
	Thu, 27 Mar 2025 19:50:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txt1i-0000000Bpg3-3HQO
	for linux-riscv@bombadil.infradead.org;
	Thu, 27 Mar 2025 19:36:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=/JOQ8WwmCbSnRqnzBomZTQ9W38PHSEAGnjY39LhZEAM=; b=QN4uWkdf5zrn+cTfUbpMi3AXoc
	T6GPmI+qx8BCIItVitKgQCtenxqnOlWrBrXCD6oePUn1HOsOUWx+rnrM3oCmavu3r7IJ2Qcj/4EnQ
	ce6xv9X+xsH9ns8I9obV2E1qknrsxiyCwxIGxmv51ioImXkEzdG0UcgCIM2pdCAmMDA2JAMuib1NH
	W3ziLYtOgI9DkiNIR1MDmsRPJYFMsGVw9QXtenage50gI/PIcK+k7DYk9uljirBYQrfaYRpAhx9L+
	iY2a5DSPKVb2nDtR4Tq87p1rFdKrZpFynhRgm9D5K31SXeRnlPpy11rw7KGHCe2OHrxfgYVEbynPv
	5dhlLp5g==;
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txt1c-000000061Z6-462p
	for linux-riscv@lists.infradead.org;
	Thu, 27 Mar 2025 19:36:29 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2255003f4c6so30015865ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 27 Mar 2025 12:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1743104181; x=1743708981; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/JOQ8WwmCbSnRqnzBomZTQ9W38PHSEAGnjY39LhZEAM=;
        b=YWpowb+K2+o/3BdF5UE0LL+9EPD4KwPAvS+9R3IgGHrCIHmB5YG9irZ/6nxZF5Umlo
         x/1Q6BZBouEIE3CxMemr9Se8WmHKpB1v6X3VtscPDv50877jWlGP6jyibFvkTUDthuTd
         lBSTsmdfPJ/BtX6RIwBxei28lq9SEQLJ3mn4SL8gAjVtcIOCnSV0T8zIZh4L+XQRmjH8
         Mvn6Wf+3VXwXQeg3gdUr+miiSoqf2m/LE9p/VHjPKzjYxmXevIQnQV3/eIm19E61ShQ8
         Mb/Z3iZBtdOpvtxXvvDVpcXYRdNyvIKjN+o0IA76PE/mHO5rqbA61cB5UsrSD6p6oGHR
         bqoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743104181; x=1743708981;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/JOQ8WwmCbSnRqnzBomZTQ9W38PHSEAGnjY39LhZEAM=;
        b=GFXSj+IcGlPQSu8qV5q+TcVoeThFJb3q4ZNTdhBGGzezTdXd866TsX7qYgWiKOYIUU
         0NBsPk8bjuxZbEeF6hnLbyeFT/g557TJrHtuw4/3n09i3ffIN0P6WNq31mR8gTPz1t1K
         J2FGCG6j0tOCV3YY8BEMm33YCwBbdYAvOaW7SiiJw5HUngw+x8ZpVFsdPydorIo64K1v
         y5/1fF33zRZS/ARvy8+GV/RhoQ4bhX9R5cHub4ilSJue/jQQhZO4HR+KuTdkQsjfoaRE
         +3HU/tph4EKsXJovVXKNY4zcSAbAOuz7Efw1VfSgoiIjxdQIq8nxqkNuE9Q6JAE6TU3T
         /+Mw==
X-Gm-Message-State: AOJu0YxFlnHtEoSSEgm4Zb7+57CKVZNhdKRahwT0QrCFmCbb3ezc0cGU
	3pGBzaLrLNi3BXKjBCtoMuNfEsGjXQejSU4JE4HZO1L82sh7ohMNI/ZUmwfLgQ0=
X-Gm-Gg: ASbGnctaxQAGTJPNiYc6c0UekELz+7qDN9+DAd1RiazlwbUcwUyKSoQmdDzzwhyZ+v1
	yhu0hw+ou+za6KhQ/FPQz37ctXOekVp6V1Wh455Vgf2sEJCKFtXBMqpqMBJYOTqHFE8Sisbwpt9
	gZJNyGOX2mUCd4S/OX08vcLpSUJxCkLAaOCGl8VOmhwV8xKTrIkmciI/JlsLuLji3e7OLoghDOb
	CUe3EJ5gE3apE8sR82hwVT4/JjTE1p3/aCh5dP+GkZm/ANwIAu7oRXg5JmFf4PGGE6V9bKUFshw
	LJuIppUcggMy83kOOL1SvuiDJnomErHt5uH61TOHcvkfxV/bAXLWXSNEnrGalJ2WNhq1
X-Google-Smtp-Source: AGHT+IFSLJpOO+uUPIXxxR4PWavcDhvMZFlKhYeaacVfbM6bFNGqTFcN8T3TvSAfTzPEFeN7iSGrUA==
X-Received: by 2002:a17:903:11c7:b0:215:4a4e:9262 with SMTP id d9443c01a7336-2280481d0b6mr52437215ad.8.1743104181444;
        Thu, 27 Mar 2025 12:36:21 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f6b638csm2624220a91.44.2025.03.27.12.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 12:36:21 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 27 Mar 2025 12:35:47 -0700
Subject: [PATCH v5 06/21] RISC-V: Add Smcntrpmf extension parsing
MIME-Version: 1.0
Message-Id: <20250327-counter_delegation-v5-6-1ee538468d1b@rivosinc.com>
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
 Atish Patra <atishp@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_193625_318779_E9E7ACF1 
X-CRM114-Status: GOOD (  10.40  )
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

U21jbnRycG1mIGV4dGVuc2lvbiBhbGxvd3MgTS1tb2RlIHRvIGVuYWJsZSBwcml2aWxlZ2UgbW9k
ZSBmaWx0ZXJpbmcKZm9yIGN5Y2xlL2luc3RyZXQgY291bnRlcnMuIEhvd2V2ZXIsIHRoZSBjeWNs
ZWNmZy9pbnN0cmV0Y2ZnIENTUnMgYXJlCm9ubHkgYXZhaWxhYmxlIG9ubHkgaW4gU3NjY2ZnIG9u
bHkgU21jbnRycG1mIGlzIHByZXNlbnQuCgpUaGF0J3Mgd2h5LCBrZXJuZWwgbmVlZHMgdG8gZGV0
ZWN0IHByZXNlbmNlIG9mIFNtY250cnBtZiBleHRlbnNpb24gYW5kCmVuYWJsZSBwcml2aWxlZ2Ug
bW9kZSBmaWx0ZXJpbmcgZm9yIGN5Y2xlL2luc3RyZXQgY291bnRlcnMuCgpSZXZpZXdlZC1ieTog
Q2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgpTaWduZWQtb2ZmLWJ5OiBBdGlz
aCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2h3Y2FwLmggfCAxICsKIGFyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyB8IDEgKwogMiBm
aWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL2h3Y2FwLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKaW5kZXgg
M2Q2ZTcwNmZjNWIyLi5iNGVkZGNiNTc4NDIgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vaHdjYXAuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKQEAgLTEw
Miw2ICsxMDIsNyBAQAogI2RlZmluZSBSSVNDVl9JU0FfRVhUX1NWQURVCQk5MwogI2RlZmluZSBS
SVNDVl9JU0FfRVhUX1NTQ1NSSU5ECQk5NAogI2RlZmluZSBSSVNDVl9JU0FfRVhUX1NNQ1NSSU5E
CQk5NQorI2RlZmluZSBSSVNDVl9JU0FfRVhUX1NNQ05UUlBNRiAgICAgICAgIDk2CiAKICNkZWZp
bmUgUklTQ1ZfSVNBX0VYVF9YTElOVVhFTlZDRkcJMTI3CiAKZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3Yva2VybmVsL2NwdWZlYXR1cmUuYyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwpp
bmRleCBlZGRiYWIwMzgzMDEuLmUzZTQwY2ZlNzk2NyAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9r
ZXJuZWwvY3B1ZmVhdHVyZS5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwpA
QCAtMzk0LDYgKzM5NCw3IEBAIGNvbnN0IHN0cnVjdCByaXNjdl9pc2FfZXh0X2RhdGEgcmlzY3Zf
aXNhX2V4dFtdID0gewogCV9fUklTQ1ZfSVNBX0VYVF9CVU5ETEUoenZrc2csIHJpc2N2X3p2a3Nn
X2J1bmRsZWRfZXh0cyksCiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoenZrdCwgUklTQ1ZfSVNBX0VY
VF9aVktUKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQShzbWFpYSwgUklTQ1ZfSVNBX0VYVF9TTUFJ
QSksCisJX19SSVNDVl9JU0FfRVhUX0RBVEEoc21jbnRycG1mLCBSSVNDVl9JU0FfRVhUX1NNQ05U
UlBNRiksCiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoc21jc3JpbmQsIFJJU0NWX0lTQV9FWFRfU01D
U1JJTkQpLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHNtbXBtLCBSSVNDVl9JU0FfRVhUX1NNTVBN
KSwKIAlfX1JJU0NWX0lTQV9FWFRfU1VQRVJTRVQoc21ucG0sIFJJU0NWX0lTQV9FWFRfU01OUE0s
IHJpc2N2X3hsaW51eGVudmNmZ19leHRzKSwKCi0tIAoyLjQzLjAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
