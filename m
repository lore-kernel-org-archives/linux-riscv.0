Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5C4CC0015E
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Jun 2023 12:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bRWCkLHFn4je81fUCBvcDTQb4kF+8ACgPYSzp/BlB8U=; b=jclw0TY3IwXlI3
	Le94+UqVEGel1HpO7Rg5bLQEkPMm7samDUNG2E7950tIo3NuD6Rjmaai5zAWHC6WNOCYHZoRXjRt1
	Nb9sIW1Mr8nKNjeYm/cHYaj75DRykQQIBFaOUuZ8xag9QUFYxd0eK/a0wY2oq0H1SJDOnno+A+6of
	K6GajxwfqinIq+3Mb1Nt0xWwRhHD39imBTKub3ZSbo8U+5Ktx/Nrbe+lA1vcm5TxWSi0uAVBAH4KY
	+jolCopSfSfS7+/isvgELjxhn/LjU/ZyGrMYXjoka8B8/YPc9MkCErnbRe9CExvQYMdHi9ikmdHOF
	xEybKdG2unkAPiMtVTvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qD2GB-005wlm-2w;
	Sat, 24 Jun 2023 12:20:59 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qD2G9-005wjz-0N
	for linux-riscv@lists.infradead.org;
	Sat, 24 Jun 2023 12:20:58 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3fa86b08efcso590425e9.1
        for <linux-riscv@lists.infradead.org>; Sat, 24 Jun 2023 05:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687609255; x=1690201255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3xcg93YWfCsaPVRmUBFr/zBQcP7IRrZtPOV8Dls38Ng=;
        b=dqg+BOsszxMGLdyTyEjFuHiwVXaciLVc6OPqDTS8RfHAF1bl38MZTWwQK2nO9jc7UB
         g1cMTjPqjTW0ueeubAnslmO5YjulLSxaLsRgCwCV0Bg47z1onVkor7SumyTcsenxXgO1
         F0P+GHxwq+7TiPvWLVUrZVNtbyeDk26wz4RTvb9VMIMvZ5fjeVGhZrtfI0vKQQplkUoy
         THVFJR5MX267e2XyyjG9zR/+8HfUulvWhiausMfRFBBRClFmZjXqcKS1mLXMMS8XQQJa
         JrlJlOE1hX0dWttLAPRJKfWYIm0Eds0eBbzQjyO0bYtAB10bl+CMLVX3VUjX21AMTxb/
         xpjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687609255; x=1690201255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3xcg93YWfCsaPVRmUBFr/zBQcP7IRrZtPOV8Dls38Ng=;
        b=BfY2GvuISmYZLAhfI/33LWbbhWQJYvX718TSKQqxXy4UyKfzMcClkokOEvGMOF9vN0
         MFQddxd/83kUi+BfItZb8hwD/Jcv5zWMiBFmSjwCFXPRESB8w0K+SnQUMZNgtJtfFYe/
         WdvNA1KriadclvGIhioh5LjBScOI5nZxbpSLpbBgW5AJDl56PSgolt0MmaBle32UDnJn
         XjwEPpO0zq6chv8XnJ8/p85iqj3otwDpDgUTB5pORyCF6Sh1ejIYH/XkgnzqXdVfdyta
         RH98UdtnG6EhP3epbeKjXRY+tOhkcX0CQTLW/ouHKOe2CkY59hUo6JOlxp1ZypNC87BM
         YWog==
X-Gm-Message-State: AC+VfDyo6Sb6GFHdI4x1i6Pzio6wgGqg/ZA5WgdOsV9X5+MVImAkezqV
	B8KubAoXa/aIZTO9Pm3WCSCbdQ==
X-Google-Smtp-Source: ACHHUZ6KLMNN73cFroD7E7poISffgTWCvzh26pvC4WZltuW4RPUobSZvIC+Xh+a/uBrfhhh6chbQyQ==
X-Received: by 2002:a05:600c:3c88:b0:3f9:bf0e:a312 with SMTP id bg8-20020a05600c3c8800b003f9bf0ea312mr10324537wmb.1.1687609254585;
        Sat, 24 Jun 2023 05:20:54 -0700 (PDT)
Received: from carbon-x1.home ([2a01:cb15:81c2:f100:94c1:d2b1:7300:5620])
        by smtp.gmail.com with ESMTPSA id y15-20020a7bcd8f000000b003f8f9ab6f30sm2058823wmj.20.2023.06.24.05.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jun 2023 05:20:54 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Stafford Horne <shorne@gmail.com>,
	Brian Cain <bcain@quicinc.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Michael Ellerman <mpe@ellerman.id.au>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Guo Ren <guoren@kernel.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Xianting Tian <xianting.tian@linux.alibaba.com>,
	Sia Jee Heng <jeeheng.sia@starfivetech.com>,
	Li Zhengyu <lizhengyu3@huawei.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Marc Zyngier <maz@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/6] Add support to handle misaligned accesses in S-mode
Date: Sat, 24 Jun 2023 14:20:43 +0200
Message-Id: <20230624122049.7886-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230624_052057_387007_FEF12987 
X-CRM114-Status: GOOD (  12.98  )
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

U2luY2UgY29tbWl0IDYxY2FkYjkgKCJQcm92aWRlIG5ldyBkZXNjcmlwdGlvbiBvZiBtaXNhbGln
bmVkIGxvYWQvc3RvcmUKYmVoYXZpb3IgY29tcGF0aWJsZSB3aXRoIHByaXZpbGVnZWQgYXJjaGl0
ZWN0dXJlLiIpIGluIHRoZSBSSVNDLVYgSVNBCm1hbnVhbCwgaXQgaXMgc3RhdGVkIHRoYXQgbWlz
YWxpZ25lZCBsb2FkL3N0b3JlIG1pZ2h0IG5vdCBiZSBzdXBwb3J0ZWQuCkhvd2V2ZXIsIHRoZSBS
SVNDLVYga2VybmVsIHVBQkkgZGVzY3JpYmVzIHRoYXQgbWlzYWxpZ25lZCBhY2Nlc3NlcyBhcmUK
c3VwcG9ydGVkLiBJbiBvcmRlciB0byBzdXBwb3J0IHRoYXQsIHRoaXMgc2VyaWVzIGFkZHMgc3Vw
cG9ydCBmb3IgUy1tb2RlCmhhbmRsaW5nIG9mIG1pc2FsaWduZWQgYWNjZXNzZXMsIFNCSSBjYWxs
IGZvciBtaXNhbGlnbmVkIHRyYXAgZGVsZWdhdGlvbgphcyB3ZWxsIHByY3RsIHN1cHBvcnQgZm9y
IFBSX1NFVF9VTkFMSUdOLgoKSGFuZGxpbmcgbWlzYWxpZ25lZCBhY2Nlc3MgaW4ga2VybmVsIGFs
bG93cyBmb3IgYSBmaW5lciBncmFpbiBjb250cm9sCm9mIHRoZSBtaXNhbGlnbmVkIGFjY2Vzc2Vz
IGJlaGF2aW9yLCBhbmQgdGhhbmtzIHRvIHRoZSBwcmN0bCBjYWxsLCBjYW4KYWxsb3cgZGlzYWJs
aW5nIG1pc2FsaWduZWQgYWNjZXNzIGVtdWxhdGlvbiB0byBnZW5lcmF0ZSBTSUdCVVMuIFVzZXIK
c3BhY2Ugc29mdHdhcmUgY2FuIHRoZW4gYmUgb3B0aW1pemVkIGJ5IHJlbW92aW5nIHN1Y2ggYWNj
ZXNzIGJhc2VkIG9uClNJR0JVUyBnZW5lcmF0aW9uLgoKVGhpcyBzZXJpZXMgcmVsaWVzIG9uIGEg
U0JJIGV4dGVuc2lvbiBbMV0gYWxsb3dpbmcgdG8gcmVxdWVzdCBkZWxlZ2F0aW9uIG9mCnRoZSBt
aXNhbGlnbmVkIGxvYWQvc3RvcmUgdHJhcHMgdG8gdGhlIFMtbW9kZSBzb2Z0d2FyZS4gVGhpcyBl
eHRlbnNpb24KaGFzIGJlZW4gc3VibWl0dGVkIGZvciByZXZpZXcgdG8gdGhlIHJpc2N2IHRlY2gt
cHJzIGdyb3VwLgoKVGhpcyB3b3JrIHdhcyB0ZXN0ZWQgb24gc3Bpa2Ugc2luY2UgUWVtdSBkb2Vz
IHRyYW5zcGFyZW50bHkgaGFuZGxlcwptaXNhbGlnbmVkIGFjY2Vzcy4KClsxXSBodHRwczovL2xp
c3RzLnJpc2N2Lm9yZy9nL3RlY2gtcHJzL21lc3NhZ2UvNDcyaQoKQ2zDqW1lbnQgTMOpZ2VyICg2
KToKICByaXNjdjogcmVtb3ZlIHVudXNlZCBmdW5jdGlvbnMgaW4gdHJhcHNfbWlzYWxpZ25lZC5j
CiAgcmlzY3Y6IGFkZCBzdXBwb3J0IGZvciBtaXNhbGlnbmVkIGhhbmRsaW5nIGluIFMtbW9kZQog
IHJpc2N2OiBhbGxvdyBTLW1vZGUgdG8gaGFuZGxlIG1pc2FsaWduZWQgdHJhcHMKICByaXNjdjog
YWRkIHN1cHBvcnQgZm9yIFNCSSBtaXNhbGlnbm1lbnQgdHJhcCBkZWxlZ2F0aW9uCiAgcmlzY3Y6
IGFkZCBzdXBwb3J0IGZvciBQUl9TRVRfVU5BTElHTiBhbmQgUFJfR0VUX1VOQUxJR04KICByaXNj
djogYWRkIGZsb2F0aW5nIHBvaW50IGluc24gc3VwcG9ydCB0byBtaXNhbGlnbmVkIGFjY2VzcyBl
bXVsYXRpb24KCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oICAgfCAgIDkgKwog
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaCAgICAgICAgIHwgIDEyICsrCiBhcmNoL3Jpc2N2
L2tlcm5lbC9NYWtlZmlsZSAgICAgICAgICAgfCAgIDIgKy0KIGFyY2gvcmlzY3Yva2VybmVsL2Zw
dS5TICAgICAgICAgICAgICB8IDExOCArKysrKysrKysrKysKIGFyY2gvcmlzY3Yva2VybmVsL3By
b2Nlc3MuYyAgICAgICAgICB8ICAyMCArKwogYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMgICAgICAg
ICAgICAgIHwgIDI4ICsrKwogYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYyAgICAgICAgICAgIHwg
ICA3IC0KIGFyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYyB8IDI3NiArKysrKysr
KysrKysrKysrKysrKysrLS0tLS0KIDggZmlsZXMgY2hhbmdlZCwgNDE3IGluc2VydGlvbnMoKyks
IDU1IGRlbGV0aW9ucygtKQoKLS0gCjIuNDAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
