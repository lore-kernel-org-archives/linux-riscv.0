Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3256C00528
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Aug 2023 14:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=C+2bFglHi8/QuNwuQV/aFWd/I9VVE+wqGhD1cTHN5Y0=; b=aru7WcTIwTsik2
	vv3tlDoYhyybYXfii+wa40Psr7nelgwV0QziaErV3UwDGoAfaljMkroJcaqe5Fv6+8RLP2ZFQTbH9
	EX4Mc4JPdDTNBmCbfOHxV/XnjPUyt/2WT/F3GCVIgq1HSmy0KszOtqR6gJ45XYTmAMM/OZaJMO3dU
	CRjtqk9vVTdj4L3/N/yh9XlPtXCbXiC7b74Lh42lz0PPG3mOZyMV23UKtexMjaiE8+YFUTSKD3wuo
	zABELV/eOP7xOn4TbZNYhF+hIHkJdRhl+5DYoW+CXRjVe+q1ODzNSO0o3WJQTbaIx2xgVnBPAumqm
	1f1hn0lxzO6k3yP+EFEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQqAc-002YBI-03;
	Tue, 01 Aug 2023 14:16:18 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQqAY-002YAC-1u
	for linux-riscv@lists.infradead.org;
	Tue, 01 Aug 2023 14:16:15 +0000
Received: by mail-pl1-x644.google.com with SMTP id d9443c01a7336-1bb775625e2so37433905ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 01 Aug 2023 07:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690899373; x=1691504173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3jFV9XAxcsKZ1IZ7FbIlGmL+fRJueIamD5rnI3l/9I4=;
        b=BU/pqNAyFkP3cndzLQYB/KyOxc68v55NJDx0inLLo//mG7WvlqrCpmiJ7xQ15WJu6e
         qxOGCnlzPYCrrKaGqu15t4FfPRNdT4xgHqvlsWsdFmIsxN7Efxt8lOk2iKE7tgREKYP8
         vEqaDoJEMWDgLcyKMhoMfwUZ+2BfD2Yw7XMxVvzuaQZrgt/AysZiirIRHF6DWIn/fhR8
         9VsRSBYPzI3YZsKo29TQc3WwMfWxjojPAPVFv8CUhL23DIredqJxr7RjSUnFGYRkEHPL
         tjBvqXjBu/3uAXVShAOLH6IZlYzO41Hnj0cXQQdL+GlMB+wFg/XJa/u2lgZS78z7tsPA
         1J0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690899373; x=1691504173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3jFV9XAxcsKZ1IZ7FbIlGmL+fRJueIamD5rnI3l/9I4=;
        b=T8QrgcTmSiTK8wzn9MiqFZk+WepYlKSCG/F+PS5P+3xEQz7YKyONY9pgtpfVmZ32tl
         CBftFaAyYrMzv9/ANzFfzfcVMUO7b/6AyAf8czuvg29ZXtLe8GnmKJHsfJp5wImUk4o2
         H0cxhIoCh7rzKpcvL7NW8AVJzgCvSHgbkHcAlHZEQshkDkN/57ifRFQmGvH4/s50S5gQ
         Wv7dh+P4tyv3U8qOS3PSKvefq3vGXSfP3C2MuN3rgH1TRPLw7xXHWZdYpaAfnlZ1T7H2
         Q/c+BcOKQfykG1MrPpuUZMoMEiqoKHCgpDe+7SgHaYi6RJJ53/Zw9eJK9xUR/oMbiWwU
         gdUg==
X-Gm-Message-State: ABy/qLbI3lugI7RnXGhT8spcNq4Ca5YcY7YEBCk4g15sIBKkDYkxiwNa
	lWWJW/lRRW+jyREeFuf2s8c=
X-Google-Smtp-Source: APBJJlExiPxDP932JGscZIrLZalViGmQU7KrT7LdWCbl80hR5iI6lu7lJ6rBiYh9VtxYXBOMai260A==
X-Received: by 2002:a17:902:dacf:b0:1bb:c9e3:6d4f with SMTP id q15-20020a170902dacf00b001bbc9e36d4fmr17790506plx.10.1690899373147;
        Tue, 01 Aug 2023 07:16:13 -0700 (PDT)
Received: from localhost ([212.107.28.51])
        by smtp.gmail.com with ESMTPSA id h7-20020a170902f7c700b001b8c689060dsm10583434plw.28.2023.08.01.07.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 07:16:12 -0700 (PDT)
From: Celeste Liu <coelacanthushex@gmail.com>
X-Google-Original-From: Celeste Liu <CoelacanthusHex@gmail.com>
To: Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Andreas Schwab <schwab@suse.de>,
	David Laight <David.Laight@ACULAB.COM>,
	Celeste Liu <CoelacanthusHex@gmail.com>,
	Felix Yan <felixonmars@archlinux.org>,
	Ruizhe Pan <c141028@gmail.com>,
	Shiqi Zhang <shiqi@isrc.iscas.ac.cn>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: [PATCH v5] riscv: entry: set a0 = -ENOSYS only when syscall != -1
Date: Tue,  1 Aug 2023 22:15:16 +0800
Message-ID: <20230801141607.435192-1-CoelacanthusHex@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_071614_653225_6819FAE2 
X-CRM114-Status: GOOD (  13.63  )
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

V2hlbiB3ZSB0ZXN0IHNlY2NvbXAgd2l0aCA2LjQga2VybmVsLCB3ZSBmb3VuZCBlcnJubyBoYXMg
d3JvbmcgdmFsdWUuCklmIHdlIGRlbnkgTkVUTElOS19BVURJVCB3aXRoIEVBRk5PU1VQUE9SVCwg
YWZ0ZXIgZjBiZGRmNTA1ODZkLCB3ZSB3aWxsCmdldCBFTk9TWVMgaW5zdGVhZC4gV2UgZ290IHNh
bWUgcmVzdWx0IHdpdGggY29tbWl0IDljMjU5OGQ0MzUxMCAoInJpc2N2OgplbnRyeTogU2F2ZSBh
MCBwcmlvciBzeXNjYWxsX2VudGVyX2Zyb21fdXNlcl9tb2RlKCkiKS4KCkFmdGVyIGFuYWx5c2lu
ZyBjb2RlLCB3ZSB0aGluayB0aGF0IHJlZ3MtPmEwID0gLUVOT1NZUyBzaG91bGQgb25seSBiZQpl
eGVjdXRlZCB3aGVuIHN5c2NhbGwgIT0gLTEuIEluIF9fc2VjY29tcF9maWx0ZXIsIHdoZW4gc2Vj
Y29tcCByZWplY3RlZAp0aGlzIHN5c2NhbGwgd2l0aCBzcGVjaWZpZWQgZXJybm8sIHRoZXkgd2ls
bCBzZXQgYTAgdG8gcmV0dXJuIG51bWJlciBhcwpzeXNjYWxsIEFCSSwgYW5kIHRoZW4gcmV0dXJu
IC0xLiBUaGlzIHJldHVybiBudW1iZXIgaXMgZmluYWxseSBwYXNzIGFzCnJldHVybiBudW1iZXIg
b2Ygc3lzY2FsbF9lbnRlcl9mcm9tX3VzZXJfbW9kZSwgYW5kIHRoZW4gaXMgY29tcGFyZWQgd2l0
aApOUl9zeXNjYWxscyBhZnRlciBjb252ZXJ0ZWQgdG8gdWxvbmcgKHNvIGl0IHdpbGwgYmUgVUxP
TkdfTUFYKS4gVGhlCmNvbmRpdGlvbiBzeXNjYWxsIDwgTlJfc3lzY2FsbHMgd2lsbCBhbHdheXMg
YmUgZmFsc2UsIHNvIHJlZ3MtPmEwID0gLUVOT1NZUwppcyBhbHdheXMgZXhlY3V0ZWQuIEl0IGNv
dmVyZWQgYTAgc2V0IGJ5IHNlY2NvbXAsIHNvIHdlIGFsd2F5cyBnZXQKRU5PU1lTIHdoZW4gbWF0
Y2ggc2VjY29tcCBSRVRfRVJSTk8gcnVsZS4KCkZpeGVzOiBmMGJkZGY1MDU4NmQgKCJyaXNjdjog
ZW50cnk6IENvbnZlcnQgdG8gZ2VuZXJpYyBlbnRyeSIpClJlcG9ydGVkLWJ5OiBGZWxpeCBZYW4g
PGZlbGl4b25tYXJzQGFyY2hsaW51eC5vcmc+CkNvLWRldmVsb3BlZC1ieTogUnVpemhlIFBhbiA8
YzE0MTAyOEBnbWFpbC5jb20+ClNpZ25lZC1vZmYtYnk6IFJ1aXpoZSBQYW4gPGMxNDEwMjhAZ21h
aWwuY29tPgpDby1kZXZlbG9wZWQtYnk6IFNoaXFpIFpoYW5nIDxzaGlxaUBpc3JjLmlzY2FzLmFj
LmNuPgpTaWduZWQtb2ZmLWJ5OiBTaGlxaSBaaGFuZyA8c2hpcWlAaXNyYy5pc2Nhcy5hYy5jbj4K
U2lnbmVkLW9mZi1ieTogQ2VsZXN0ZSBMaXUgPENvZWxhY2FudGh1c0hleEBnbWFpbC5jb20+ClRl
c3RlZC1ieTogRmVsaXggWWFuIDxmZWxpeG9ubWFyc0BhcmNobGludXgub3JnPgpUZXN0ZWQtYnk6
IEVtaWwgUmVubmVyIEJlcnRoaW5nIDxlbWlsLnJlbm5lci5iZXJ0aGluZ0BjYW5vbmljYWwuY29t
PgpSZXZpZXdlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgpSZXZpZXdl
ZC1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+Ci0tLQoKdjQgLT4gdjU6IGFkZCBUZXN0
ZWQtYnkgRW1pbCBSZW5uZXIgQmVydGhpbmcgPGVtaWwucmVubmVyLmJlcnRoaW5nQGNhbm9uaWNh
bC5jb20+CnYzIC0+IHY0OiB1c2UgbG9uZyBpbnN0ZWFkIG9mIHVsb25nIHRvIHJlZHVjZSB0eXBl
IGNhc3QgYW5kIGF2b2lkCiAgICAgICAgICBpbXBsZW1lbnRhdGlvbi1kZWZpbmVkIGJlaGF2aW9y
LCBhbmQgbWFrZSB0aGUganVkZ21lbnQgb2Ygc3lzY2FsbAogICAgICAgICAgaW52YWxpZCBtb3Jl
IGV4cGxpY2l0CnYyIC0+IHYzOiB1c2UgaWYtc3RhdGVtZW50IGluc3RlYWQgb2Ygc2V0IGRlZmF1
bHQgdmFsdWUsCiAgICAgICAgICBjbGFyaWZ5IHRoZSB0eXBlIG9mIHN5c2NhbGwKdjEgLT4gdjI6
IGFkZGVkIGV4cGxhbmF0aW9uIG9uIHdoeSBhbHdheXMgZ290IEVOT1NZUwoKIGFyY2gvcmlzY3Yv
a2VybmVsL3RyYXBzLmMgfCA2ICsrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5j
IGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwppbmRleCBmOTEwZGZjY2JmNWQyLi43MjlmNzlj
OTdlMmJmIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCisrKyBiL2FyY2gv
cmlzY3Yva2VybmVsL3RyYXBzLmMKQEAgLTI5Nyw3ICsyOTcsNyBAQCBhc21saW5rYWdlIF9fdmlz
aWJsZSBfX3RyYXBfc2VjdGlvbiB2b2lkIGRvX3RyYXBfYnJlYWsoc3RydWN0IHB0X3JlZ3MgKnJl
Z3MpCiBhc21saW5rYWdlIF9fdmlzaWJsZSBfX3RyYXBfc2VjdGlvbiB2b2lkIGRvX3RyYXBfZWNh
bGxfdShzdHJ1Y3QgcHRfcmVncyAqcmVncykKIHsKIAlpZiAodXNlcl9tb2RlKHJlZ3MpKSB7Ci0J
CXVsb25nIHN5c2NhbGwgPSByZWdzLT5hNzsKKwkJbG9uZyBzeXNjYWxsID0gcmVncy0+YTc7CiAK
IAkJcmVncy0+ZXBjICs9IDQ7CiAJCXJlZ3MtPm9yaWdfYTAgPSByZWdzLT5hMDsKQEAgLTMwNiw5
ICszMDYsOSBAQCBhc21saW5rYWdlIF9fdmlzaWJsZSBfX3RyYXBfc2VjdGlvbiB2b2lkIGRvX3Ry
YXBfZWNhbGxfdShzdHJ1Y3QgcHRfcmVncyAqcmVncykKIAogCQlzeXNjYWxsID0gc3lzY2FsbF9l
bnRlcl9mcm9tX3VzZXJfbW9kZShyZWdzLCBzeXNjYWxsKTsKIAotCQlpZiAoc3lzY2FsbCA8IE5S
X3N5c2NhbGxzKQorCQlpZiAoc3lzY2FsbCA+PSAwICYmIHN5c2NhbGwgPCBOUl9zeXNjYWxscykK
IAkJCXN5c2NhbGxfaGFuZGxlcihyZWdzLCBzeXNjYWxsKTsKLQkJZWxzZQorCQllbHNlIGlmIChz
eXNjYWxsICE9IC0xKQogCQkJcmVncy0+YTAgPSAtRU5PU1lTOwogCiAJCXN5c2NhbGxfZXhpdF90
b191c2VyX21vZGUocmVncyk7Ci0tIAoyLjQxLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
