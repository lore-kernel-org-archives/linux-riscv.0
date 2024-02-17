Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF1EC48BF6
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Feb 2024 00:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oClqW0lxLtDGAeuS02oCQAmlLxctWteJXAlfowKL2rc=; b=Bc86pC33Q/jjYp
	y1sEJVaaTleLWElzOyA3z4fxbWcg5CTZwvMQ+E2Y96+iU28JB+bHq8vkRRe6eqYMrUF3++pbc8geX
	KtO/ccWidNP39xSN49kamHHRDXqjeS1sRmb+ovD4qZuh/qjIatMctScXvqoki/zMKz0pGfO2YKcZA
	6SHM+Wv/2yYjV8SbN27fMB8P0Z39nE6YF7Jcpi/VuYEvq8QVW9x7r4nGDq4qdItds5ck+BTtnMnmP
	5d/ih0QBpwDbxPDL9fHa7ElCa5gpAj8/KsAQ+bLTzw7TUjJR2aYol0UZJA+LfzHoo56RfcjD9xksJ
	SqNBJPQJ2SdsxGnAOQ1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb92V-00000004IKT-40mc;
	Sat, 17 Feb 2024 00:58:47 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb92H-00000004I5s-1pR1
	for linux-riscv@lists.infradead.org;
	Sat, 17 Feb 2024 00:58:36 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-3650dcd38a0so3262605ab.1
        for <linux-riscv@lists.infradead.org>; Fri, 16 Feb 2024 16:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1708131512; x=1708736312; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8yuqScAnZ2lAjzdM+wGDjNHf/qrm86EPmr1bz136zUM=;
        b=NUx3StnjFV9aK5ks4d+rp6FajNW4PfQ8JiEs9s1DpdmPVX3PKRU0Gc92OlePmJDiXD
         CMrrXourUbCYzuIx2EelC5IW1C/7pwVTa3YxEWPyeTyekQoMUdhwTP5/kfT6KmubAWow
         Uy/MkZNHdUBHgPY3PYwKDnsXf7k5wG6Jy70dtbmh07HbDH4d1/oO/Ih1lerEWc0hzqo6
         Jng3v/oPbjesOcIcogxUIGSEI9k0Q7arfEw/YwPPYWp8iqq42wZ6aP/zKKY0LU/ugIkL
         qVEyD2dKpf5VkhI1SFNWO/OfeMxSDROwJ5n8HmbbpBBWAMX/ek1GKHNwqSrcTiq/19Dt
         gi4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708131512; x=1708736312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8yuqScAnZ2lAjzdM+wGDjNHf/qrm86EPmr1bz136zUM=;
        b=DI8g24lUWqcO0yDT53G7/ps65n3tQPJNkWUdcvr8TIz9z5c3CliFXpmORSEp2BvV0r
         CxBGdTS1AVCWsYjvvw+KeP+/mjhL0nNNGfl+OgaczfzUKmuNDIvLD06xwawJH17l7LWI
         kY4EuUM8wvFzmZbqZuCb0eovTEBD6164T1kGgSj1dFlk0wCA4VjzaMFU+8m8e5U01F3G
         1fb7m7QYLym7ASBOVKG/QbkizBOVXrzRMD0ZmdiEk+8DH8Y/L3Wu4UN5mgVZh6A5xN35
         l7hzlj6ZjuNMA5kXYeaJFboQy9z3gVUUuf/nBH626musDpJf3qCqr0lbDGWpU5VEttV0
         0uzA==
X-Forwarded-Encrypted: i=1; AJvYcCX462E6B1DytiQns52ldguX6gJgd6ca4JL5JQVBBuGLsABepRuKM925RmoFcOg8YC+pHFyo6qAKs2pFbRIVxzogea2C4gJWWv7NQOl6w6E7
X-Gm-Message-State: AOJu0YzW1msfH5FAd7Ecx9kkXe1ienOZ5c8lNM4UMOobidbIu4DwWKR1
	TiYj2ur3LG/mFpgYkaoGCLpf6OovkfZK03ALXAKViigWMCrkFL4t82R/1YhEJmU=
X-Google-Smtp-Source: AGHT+IHik4QrimZEc7Y58ACfRBjvwhbVJhwuT0U4/D/6aufYBPUmjg3iZ9kYnwtI0QZLKwXDyQ9OOw==
X-Received: by 2002:a05:6e02:1069:b0:363:b362:a2bb with SMTP id q9-20020a056e02106900b00363b362a2bbmr5475068ilj.32.1708131512047;
        Fri, 16 Feb 2024 16:58:32 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d188-20020a6336c5000000b005dc89957e06sm487655pga.71.2024.02.16.16.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:58:31 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Atish Patra <atishp@atishpatra.org>,
	Christian Brauner <brauner@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor@kernel.org>,
	devicetree@vger.kernel.org,
	Evan Green <evan@rivosinc.com>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Ian Rogers <irogers@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	James Clark <james.clark@arm.com>,
	Jing Zhang <renyu.zj@linux.alibaba.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ji Sheng Teoh <jisheng.teoh@starfivetech.com>,
	John Garry <john.g.garry@oracle.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Kan Liang <kan.liang@linux.intel.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	linux-doc@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Rob Herring <robh+dt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Weilin Wang <weilin.wang@intel.com>,
	Will Deacon <will@kernel.org>,
	kaiwenxue1@gmail.com,
	Yang Jihong <yangjihong1@huawei.com>
Subject: [PATCH RFC 07/20] RISC-V: Add Ssccfg ISA extension definition and parsing
Date: Fri, 16 Feb 2024 16:57:25 -0800
Message-Id: <20240217005738.3744121-8-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240217005738.3744121-1-atishp@rivosinc.com>
References: <20240217005738.3744121-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_165833_763273_8B4C9BA2 
X-CRM114-Status: GOOD (  10.97  )
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
IGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCmluZGV4IDQ0ZGYyNTljYzgxNS4uNWY0
NDAxZTIyMWVlIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKKysr
IGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCkBAIC04Miw2ICs4Miw4IEBACiAjZGVm
aW5lIFJJU0NWX0lTQV9FWFRfWkFDQVMJCTczCiAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfU1NDU1JJ
TkQJCTc0CiAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfU01DU1JJTkQJCTc1CisjZGVmaW5lIFJJU0NW
X0lTQV9FWFRfU1NDQ0ZHICAgICAgICAgICAgNzYKKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9TTUNE
RUxFRyAgICAgICAgICA3NwogCiAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfTUFYCQkxMjgKICNkZWZp
bmUgUklTQ1ZfSVNBX0VYVF9JTlZBTElECQlVMzJfTUFYCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2tlcm5lbC9jcHVmZWF0dXJlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKaW5k
ZXggNTJlYzg4ZGZiMDA0Li43N2NjNWRiZDczYmYgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2Vy
bmVsL2NwdWZlYXR1cmUuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKQEAg
LTMwMCwxMCArMzAwLDEyIEBAIGNvbnN0IHN0cnVjdCByaXNjdl9pc2FfZXh0X2RhdGEgcmlzY3Zf
aXNhX2V4dFtdID0gewogCV9fUklTQ1ZfSVNBX0VYVF9CVU5ETEUoenZrc2csIHJpc2N2X3p2a3Nn
X2J1bmRsZWRfZXh0cyksCiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoenZrdCwgUklTQ1ZfSVNBX0VY
VF9aVktUKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQShzbWFpYSwgUklTQ1ZfSVNBX0VYVF9TTUFJ
QSksCisJX19SSVNDVl9JU0FfRVhUX0RBVEEoc21jZGVsZWcsIFJJU0NWX0lTQV9FWFRfU01DREVM
RUcpLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHNtc3RhdGVlbiwgUklTQ1ZfSVNBX0VYVF9TTVNU
QVRFRU4pLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHNtY3NyaW5kLCBSSVNDVl9JU0FfRVhUX1NN
Q1NSSU5EKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQShzc2FpYSwgUklTQ1ZfSVNBX0VYVF9TU0FJ
QSksCiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoc3Njc3JpbmQsIFJJU0NWX0lTQV9FWFRfU1NDU1JJ
TkQpLAorCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHNzY2NmZywgUklTQ1ZfSVNBX0VYVF9TU0NDRkcp
LAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHNzY29mcG1mLCBSSVNDVl9JU0FfRVhUX1NTQ09GUE1G
KSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQShzc3RjLCBSSVNDVl9JU0FfRVhUX1NTVEMpLAogCV9f
UklTQ1ZfSVNBX0VYVF9EQVRBKHN2aW52YWwsIFJJU0NWX0lTQV9FWFRfU1ZJTlZBTCksCi0tIAoy
LjM0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
