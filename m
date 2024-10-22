Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10CE3D17157
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Oct 2024 01:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VZUvlfvCUE6q+xvxhH+NDkvfHCGo6CbX0Xg5vLWAwBo=; b=QpIAC2EV3Edjtp
	J0IPw7aLQObNPaXQRRfBOh4nk8jdEhOdu4yg2/D6o9fnPDiiSaIxl4jCuSpnFTMJMlAS8nsmRkPsy
	6zvcZrb8qqqaKqp+5FZMbSq3CV1+1gNngyivRjCAXiokP8rnzA4W+/KppCn+PGeW06U83o1gY7YrN
	Ko7JLja5/bFoyKoHft9yZLCDqsWETcG1SqmrC7kPD2v7YmUihTrmXXcwWOn1+uTrSzK+udT5afsLe
	YcLL2TqBT8mrY9sxkDDQ7Z+sB+O4ZxTL6BjGZ++4XTfqlxCgU70uEuwU7Ius0BIwyuOe5eKscvYP9
	3Fw6628mGFJYKsvxDKNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t34B6-00000009Flo-3LE7;
	Tue, 22 Oct 2024 01:59:20 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t34B3-00000009Fk4-1DSd
	for linux-riscv@lists.infradead.org;
	Tue, 22 Oct 2024 01:59:18 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2e3686088c3so3733194a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 21 Oct 2024 18:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1729562356; x=1730167156; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e65ANAnizaofFjgpIDXOaUasil0HVOGTLixFGnIEx4s=;
        b=PxSleaQwkQmVEAMHbV745Hx3a4at9U6ZArzvlC4Ej/ktO8HjBiH1HOvSkX7B/pQp6y
         +IvUJ7wCvttULXoYplwuLTHBiw/orpTuwerrWRaKz564HdT2Amzjw0tajCFDmIDSfXYr
         /8ilfaiPo5gcHZbV7G8RIgdhxHD7bAeTUZGlxvC2FrH3dBRV5BWXgtsnel605J5ce+BF
         zTw7C4LiGh/fuMA8S6r6GJQKnDp9bu065OGtmj6pK0cvaipEDfjVecWUUX27mw4zpqoT
         CCZoMeEiCwEpbaeeIfHUbo+s6wF32n0GhaHkgrUGo8RDpnLGoicEGkMsYtlHl9xie3hW
         Du7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729562356; x=1730167156;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e65ANAnizaofFjgpIDXOaUasil0HVOGTLixFGnIEx4s=;
        b=kfrGz7Gd070kKErQmqtngKYWC0SikeSYE3r0+BeEnOrs9Q4YLDgh48NqASulU1m7yu
         nd+0R/q3eD8Pp+ZVNyW8BNWBWPI3MCxHh0/+qvIvJprXRTDC0pqtNlkeO0tgaH0+eRLg
         FX+ljBaMQ/yMS8RIcyLlFdaKUHiEQUsfriQMSd4ym18Ro6ntlra2m+STQHJ7J+gOeLfL
         9ZcC47hOuwivKMuQ5iZpoa8HMbIUzzsVHMRj6008BLbPxFXxkd+xQ33Fs/cKNKTIIfCO
         ce9J7S4qW+JziYw9q0jiSlmncYVAb9bTst901cnUrD7DjVyKV6jILRqb4F17Qtr+mVEt
         I1LA==
X-Forwarded-Encrypted: i=1; AJvYcCXn/CQB/AD7/T4ZMR2ewqAw/4VxHjQCC9tXqI1Xm00u3wxFA5rMA/JuSN3WN/LbNdA3RPk+4Ry1aURbTg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyA634Hy+Rc3t/Vl6x/LaugfHh+L7na5b+UrOIkLTKC0t+nWy30
	1vDSGGEVAfe3ZL1QogpwssdG/yQIeWS55SL9Nfi755o9RgcXAl/sApQn2A0q7ko=
X-Google-Smtp-Source: AGHT+IEXsyYj+KgjHmYUKoNKrCcxY4nPfOvA/Yp1hV7DCU8lwbKfMca2QJF0T6KgMVKIPzFYrhGr9A==
X-Received: by 2002:a05:6a20:d81b:b0:1d9:20cf:2c24 with SMTP id adf61e73a8af0-1d96b71566fmr2363833637.29.1729562356331;
        Mon, 21 Oct 2024 18:59:16 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec132ffdcsm3600710b3a.46.2024.10.21.18.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 18:59:15 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	kasan-dev@googlegroups.com
Cc: llvm@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Will Deacon <will@kernel.org>,
	Evgenii Stepanov <eugenis@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 0/9] kasan: RISC-V support for KASAN_SW_TAGS using pointer masking
Date: Mon, 21 Oct 2024 18:57:08 -0700
Message-ID: <20241022015913.3524425-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_185917_373988_66AB83FE 
X-CRM114-Status: GOOD (  22.35  )
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

VGhpcyBzZXJpZXMgaW1wbGVtZW50cyBzdXBwb3J0IGZvciBzb2Z0d2FyZSB0YWctYmFzZWQgS0FT
QU4gdXNpbmcgdGhlClJJU0MtViBwb2ludGVyIG1hc2tpbmcgZXh0ZW5zaW9uWzFdLCB3aGljaCBz
dXBwb3J0cyA3IGFuZC9vciAxNi1iaXQKdGFncy4gVGhpcyBpbXBsZW1lbnRhdGlvbiB1c2VzIDct
Yml0IHRhZ3MsIHNvIGl0IGlzIGNvbXBhdGlibGUgd2l0aAplaXRoZXIgaGFyZHdhcmUgbW9kZS4g
UGF0Y2ggNCBhZGRzIHN1cHBvcnRzIGZvciBLQVNBTl9TV19UQUdTIHdpdGggdGFnCndpZHRocyBv
dGhlciB0aGFuIDggYml0cy4KClBvaW50ZXIgbWFza2luZyBpcyBhbiBvcHRpb25hbCBJU0EgZXh0
ZW5zaW9uLCBhbmQgaXQgbXVzdCBiZSBlbmFibGVkCnVzaW5nIGFuIFNCSSBjYWxsIHRvIGZpcm13
YXJlIG9uIGVhY2ggQ1BVLiBJZiB0aGUgU0JJIGNhbGwgZmFpbHMgb24gdGhlCmJvb3QgQ1BVLCBL
QVNBTiBpcyBnbG9iYWxseSBkaXNhYmxlZC4gUGF0Y2ggMiBhZGRzIHN1cHBvcnQgZm9yIGJvb3Qt
dGltZQpkaXNhYmxpbmcgb2YgS0FTQU5fU1dfVEFHUywgYW5kIHBhdGNoIDMgYWRkcyBzdXBwb3J0
IGZvciBydW50aW1lIGNvbnRyb2wKb2Ygc3RhY2sgdGFnZ2luZy4KClBhdGNoIDEgaXMgYW4gb3B0
aW1pemF0aW9uIHRoYXQgY291bGQgYmUgYXBwbGllZCBzZXBhcmF0ZWx5LiBJdCBpcwppbmNsdWRl
ZCBoZXJlIGJlY2F1c2UgaXQgYWZmZWN0cyB0aGUgc2VsZWN0aW9uIG9mIEtBU0FOX1NIQURPV19P
RkZTRVQuCgpUaGlzIGltcGxlbWVudGF0aW9uIGN1cnJlbnRseSBwYXNzZXMgdGhlIEtBU0FOIEtV
bml0IHRlc3Qgc3VpdGU6CgogICMga2FzYW46IHBhc3M6NjQgZmFpbDowIHNraXA6OSB0b3RhbDo3
MwogICMgVG90YWxzOiBwYXNzOjY0IGZhaWw6MCBza2lwOjkgdG90YWw6NzMKICBvayAxIGthc2Fu
CgpPbmUgd29ya2Fyb3VuZCBpcyByZXF1aXJlZCB0byBwYXNzIHRoZSB2bWFsbG9jX3BlcmNwdSB0
ZXN0LiBJIGhhdmUgdG8Kc2hyaW5rIHRoZSBpbml0aWFsIHBlcmNwdSBhcmVhIHRvIGZvcmNlIHRo
ZSB1c2Ugb2YgYSBLQVNBTi10YWdnZWQgcGVyY3B1CmFyZWEgaW4gdGhlIHRlc3QgKGRlcGVuZGlu
ZyBvbiAuY29uZmlnLCB0aGlzIHdvcmthcm91bmQgaXMgYWxzbyBuZWVkZWQKb24gYXJtNjQgd2l0
aG91dCB0aGlzIHNlcmllcyBhcHBsaWVkLCBzbyBpdCBpcyBub3QgYSBuZXcgaXNzdWUpOgoKZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvcGVyY3B1LmggYi9pbmNsdWRlL2xpbnV4L3BlcmNwdS5o
CmluZGV4IGI2MzIxZmM0OTE1OS4uMjZiOTdjNzlhZDdjIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xp
bnV4L3BlcmNwdS5oCisrKyBiL2luY2x1ZGUvbGludXgvcGVyY3B1LmgKQEAgLTQzLDcgKzQzLDcg
QEAKICNpZmRlZiBDT05GSUdfUkFORE9NX0tNQUxMT0NfQ0FDSEVTCiAjZGVmaW5lIFBFUkNQVV9E
WU5BTUlDX1NJWkVfU0hJRlQgICAgICAxMgogI2Vsc2UKLSNkZWZpbmUgUEVSQ1BVX0RZTkFNSUNf
U0laRV9TSElGVCAgICAgIDEwCisjZGVmaW5lIFBFUkNQVV9EWU5BTUlDX1NJWkVfU0hJRlQgICAg
ICA4CiAjZW5kaWYKCldoZW4gcnVubmluZyB3aXRoIGhhcmR3YXJlIG9yIGZpcm13YXJlIHRoYXQg
ZG9lc24ndCBzdXBwb3J0IHBvaW50ZXIKbWFza2luZywgdGhlIGtlcm5lbCBzdGlsbCBib290cyBz
dWNjZXNzZnVsbHk6CgogIGthc2FuOiB0ZXN0OiBDYW4ndCBydW4gS0FTQU4gdGVzdHMgd2l0aCBL
QVNBTiBkaXNhYmxlZAogICAgICAjIGthc2FuOiAgICAgIyBmYWlsZWQgdG8gaW5pdGlhbGl6ZSAo
LTEpCiAgbm90IG9rIDEga2FzYW4KClRoaXMgc2VyaWVzIGNhbiBiZSB0ZXN0ZWQgYnkgYXBwbHlp
bmcgcGF0Y2ggc2VyaWVzIHRvIExMVk1bMl0gYW5kClFFTVVbM10sIGFuZCB1c2luZyB0aGUgbWFz
dGVyIGJyYW5jaCBvZiBPcGVuU0JJWzRdLgoKWzFdOiBodHRwczovL2dpdGh1Yi5jb20vcmlzY3Yv
cmlzY3Ytai1leHRlbnNpb24vcmF3L2Q3MDAxMWRkZTZjMi96anBtLXNwZWMucGRmClsyXTogaHR0
cHM6Ly9naXRodWIuY29tL1NpRml2ZUhvbGxhbmQvbGx2bS1wcm9qZWN0L2NvbW1pdHMvdXAvcmlz
Y3Y2NC1rZXJuZWwtaHdhc2FuClszXTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcWVtdS1kZXZl
bC8yMDI0MDUxMTEwMTA1My4xODc1NTk2LTEtbWVAZGVsaXZlcnNtb25rZXkuc3BhY2UvCls0XTog
aHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2LXNvZnR3YXJlLXNyYy9vcGVuc2JpL2NvbW1pdC8xY2Iy
MzRiMWM5ZWQKCkNoYW5nZXMgaW4gdjI6CiAtIEltcHJvdmUgdGhlIGV4cGxhbmF0aW9uIGZvciBo
b3cgS0FTQU5fU0hBRE9XX0VORCBpcyBkZXJpdmVkCiAtIFVwZGF0ZSB0aGUgcmFuZ2UgY2hlY2sg
aW4ga2FzYW5fbm9uX2Nhbm9uaWNhbF9ob29rKCkKIC0gU3BsaXQgdGhlIGdlbmVyaWMgYW5kIFJJ
U0MtViBwYXJ0cyBvZiBzdGFjayB0YWcgZ2VuZXJhdGlvbiBjb250cm9sCiAgIHRvIGF2b2lkIGJy
ZWFraW5nIGJpc2VjdGFiaWxpdHkKIC0gQWRkIGEgcGF0Y2ggdG8gY2FsbCBrYXNhbl9ub25fY2Fu
b25pY2FsX2hvb2soKSBvbiByaXNjdgogLSBGaXggYnVpbGQgZXJyb3Igd2l0aCBLQVNBTl9HRU5F
UklDCiAtIFVzZSBzeW1ib2xpYyBkZWZpbml0b25zIGZvciBTQkkgZmlybXdhcmUgZmVhdHVyZXMg
Y2FsbAogLSBVcGRhdGUgaW5kZW50YXRpb24gaW4gc2NyaXB0cy9NYWtlZmlsZS5rYXNhbgogLSBV
c2Uga2FzYW5fcGFyYW1zIHRvIHNldCBod2FzYW4tZ2VuZXJhdGUtdGFncy13aXRoLWNhbGxzPTEK
CkNsw6ltZW50IEzDqWdlciAoMSk6CiAgcmlzY3Y6IEFkZCBTQkkgRmlybXdhcmUgRmVhdHVyZXMg
ZXh0ZW5zaW9uIGRlZmluaXRpb25zCgpTYW11ZWwgSG9sbGFuZCAoOCk6CiAga2FzYW46IHN3X3Rh
Z3M6IFVzZSBhcml0aG1ldGljIHNoaWZ0IGZvciBzaGFkb3cgY29tcHV0YXRpb24KICBrYXNhbjog
c3dfdGFnczogQ2hlY2sga2FzYW5fZmxhZ19lbmFibGVkIGF0IHJ1bnRpbWUKICBrYXNhbjogc3df
dGFnczogU3VwcG9ydCBvdXRsaW5lIHN0YWNrIHRhZyBnZW5lcmF0aW9uCiAga2FzYW46IHN3X3Rh
Z3M6IFN1cHBvcnQgdGFnIHdpZHRocyBsZXNzIHRoYW4gOCBiaXRzCiAgcmlzY3Y6IG1tOiBMb2cg
cG90ZW50aWFsIEtBU0FOIHNoYWRvdyBhbGlhcwogIHJpc2N2OiBEbyBub3QgcmVseSBvbiBLQVNB
TiB0byBkZWZpbmUgdGhlIG1lbW9yeSBsYXlvdXQKICByaXNjdjogQWxpZ24gdGhlIHN2MzkgbGlu
ZWFyIG1hcCB0byAxNiBHaUIKICByaXNjdjogSW1wbGVtZW50IEtBU0FOX1NXX1RBR1MKCiBEb2N1
bWVudGF0aW9uL2FyY2gvcmlzY3Yvdm0tbGF5b3V0LnJzdCB8IDEwICsrLS0tCiBEb2N1bWVudGF0
aW9uL2Rldi10b29scy9rYXNhbi5yc3QgICAgICB8IDE0ICsrKy0tLQogYXJjaC9hcm02NC9LY29u
ZmlnICAgICAgICAgICAgICAgICAgICAgfCAxMCArKy0tLQogYXJjaC9hcm02NC9pbmNsdWRlL2Fz
bS9rYXNhbi5oICAgICAgICAgfCAgNiArKy0KIGFyY2gvYXJtNjQvaW5jbHVkZS9hc20vbWVtb3J5
LmggICAgICAgIHwgMTcgKysrKysrLQogYXJjaC9hcm02NC9pbmNsdWRlL2FzbS91YWNjZXNzLmgg
ICAgICAgfCAgMSArCiBhcmNoL2FybTY0L21tL2thc2FuX2luaXQuYyAgICAgICAgICAgICB8ICA3
ICsrLQogYXJjaC9yaXNjdi9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgfCAgNCArLQogYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9jYWNoZS5oICAgICAgICAgfCAgNCArKwogYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9rYXNhbi5oICAgICAgICAgfCAyOSArKysrKysrKysrKy0KIGFyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vcGFnZS5oICAgICAgICAgIHwgMjEgKysrKysrKy0tCiBhcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL3BndGFibGUuaCAgICAgICB8ICA2ICsrKwogYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9zYmkuaCAgICAgICAgICAgfCAyOCArKysrKysrKysrKysKIGFyY2gvcmlzY3YvaW5jbHVkZS9h
c20vdGxiZmx1c2guaCAgICAgIHwgIDQgKy0KIGFyY2gvcmlzY3Yva2VybmVsL3NldHVwLmMgICAg
ICAgICAgICAgIHwgIDYgKysrCiBhcmNoL3Jpc2N2L2tlcm5lbC9zbXBib290LmMgICAgICAgICAg
ICB8ICA4ICsrKy0KIGFyY2gvcmlzY3YvbGliL01ha2VmaWxlICAgICAgICAgICAgICAgIHwgIDIg
KwogYXJjaC9yaXNjdi9saWIva2FzYW5fc3dfdGFncy5TICAgICAgICAgfCA2MSArKysrKysrKysr
KysrKysrKysrKysrKysrKwogYXJjaC9yaXNjdi9tbS9mYXVsdC5jICAgICAgICAgICAgICAgICAg
fCAgMyArKwogYXJjaC9yaXNjdi9tbS9pbml0LmMgICAgICAgICAgICAgICAgICAgfCAgMiArLQog
YXJjaC9yaXNjdi9tbS9rYXNhbl9pbml0LmMgICAgICAgICAgICAgfCAzMiArKysrKysrKysrKysr
LQogYXJjaC9yaXNjdi9tbS9waHlzYWRkci5jICAgICAgICAgICAgICAgfCAgNCArKwogaW5jbHVk
ZS9saW51eC9rYXNhbi1lbmFibGVkLmggICAgICAgICAgfCAxNSArKystLS0tCiBpbmNsdWRlL2xp
bnV4L2thc2FuLXRhZ3MuaCAgICAgICAgICAgICB8IDEzICsrKy0tLQogaW5jbHVkZS9saW51eC9r
YXNhbi5oICAgICAgICAgICAgICAgICAgfCAxMCArKysrLQogbW0va2FzYW4vaHdfdGFncy5jICAg
ICAgICAgICAgICAgICAgICAgfCAxMCAtLS0tLQogbW0va2FzYW4va2FzYW4uaCAgICAgICAgICAg
ICAgICAgICAgICAgfCAgMiArCiBtbS9rYXNhbi9yZXBvcnQuYyAgICAgICAgICAgICAgICAgICAg
ICB8IDIyICsrKysrKysrLS0KIG1tL2thc2FuL3N3X3RhZ3MuYyAgICAgICAgICAgICAgICAgICAg
IHwgIDkgKysrKwogbW0va2FzYW4vdGFncy5jICAgICAgICAgICAgICAgICAgICAgICAgfCAxMCAr
KysrKwogc2NyaXB0cy9NYWtlZmlsZS5rYXNhbiAgICAgICAgICAgICAgICAgfCAgNSArKysKIHNj
cmlwdHMvZ2RiL2xpbnV4L21tLnB5ICAgICAgICAgICAgICAgIHwgIDUgKystCiAzMiBmaWxlcyBj
aGFuZ2VkLCAzMTMgaW5zZXJ0aW9ucygrKSwgNjcgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAx
MDA2NDQgYXJjaC9yaXNjdi9saWIva2FzYW5fc3dfdGFncy5TCgotLSAKMi40NS4xCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
