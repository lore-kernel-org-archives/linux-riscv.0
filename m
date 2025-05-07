Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0944C369DC
	for <linux-riscv@archiver.kernel.org>; Wed,  7 May 2025 03:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=8tsQTfv0H2LZO3hvannR3wMyRDMyHJ3wDGqtvcBONwM=; b=P65
	UeWg1eYR49yGpInKOCavzUKrfQ/Y3e9srug1naJinYG6tTDpOA8+E45Th0fgV2T0OdGv54sfhVyiS
	yqB8KFXp8KMUV/1vabWvtLO6WJVr9a9n5D/+Ale6QYYw/CDeNHQZkbFHWcCCiL3m5zfV4kGxSb67g
	93vHjwxfUltMNCBCJQWIk6RQNJPOTbtLjZimQjb2Z+C2qvN50pt5MilOHA628likokg9PXQAhwpme
	5BrBr6eWpPE11NBBVJTlrqT8hQL/s/rj0WI20Pqg6ljnm3XyAipRZa2CcvN57IX4r6ifWCgjDA7vg
	MU4KwLanUD/XhrVLPeYvqFmYXRvfK3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCVgH-0000000E5dH-25Jn;
	Wed, 07 May 2025 03:42:49 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCVgB-0000000E5cr-41YT
	for linux-riscv@lists.infradead.org;
	Wed, 07 May 2025 03:42:47 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-b115383fcecso3691860a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 06 May 2025 20:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746589362; x=1747194162; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zq7LU3JKFzJT28CjBFkNg7IAHXfKJMWuEZp8c2mW00c=;
        b=uGsB9beYj+Hv6AFfPhMMim0uYfSjXsYB/WnhnZSLZhD2HoUk/aP/isCWy2D621xjyS
         JTLZWnz6J3UrIOi7eZad6wPLQq6NfxHHSNi7SvVOz/M3rBSbLv1i6/2c9bm65amr8g+q
         8LYsBsx/XjXfp5gGF1SobIxsr+5ohzj004QlVXqXiT52SyAIjUM+gFCrjQHcN0xFr1nJ
         QqQPWgIfw4DXWlHiya2iAZm5VcPV5SkNY36o3N9DarNfX340MklS5IluluyTurKnekWk
         fZQ9C1IGKS0l9ioBwVFBetWme1CMISOnRMkprCGW2ravcNmKEwYjS2slcr9JksGknrYV
         wV1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746589362; x=1747194162;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zq7LU3JKFzJT28CjBFkNg7IAHXfKJMWuEZp8c2mW00c=;
        b=KYF2ANkl7rgF6QOBvUqjVHDO8fseHLGGTXaqtQUG9X0VYcMpmEgPVnvdtroaExiHm7
         98AGSQ5RHMOETEl0giVSydiPPZx1BUtWgSYh8iuSIw0E4PnhVusnzHEEgedPRzmxNgnh
         UYcTAHzw/yrNKCJ50KxPQsBOhEI3qJ/jJIshIgNp5sNDjlJaxsJUkDBNK63fFBYM2V3G
         wJ63q/AZ5RJrIubA9X1jxVYplhjioSazbI8bcDyiXfLbKEk8ym7ouyL4vHOYh3sKSgkM
         O2abLKX+o9F+LRdQOmz2iSCPyx/WgyVohetbPYcWnVqIQAikTUjXJfZrKYeIyuKWW7pB
         Bmyg==
X-Forwarded-Encrypted: i=1; AJvYcCWQkgnwMt0+vymd0iXx/IHUwZgufDfLamVd5IOfirrnVeKTlAlzIkmfFdS8gmknTzf+hDGiBM4i0qGb1A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyiWHa94SVwQKwcZYvIp+gOpSABQe/siDJ+T71iOCVlPwdMxV5I
	+kAv5IlBvSjjdFcLtLeHyGBDAbw33PKXjIm+utbW3R2DIy5eqiPOG8tME5Cd/nIatI03JMCOf8l
	Xl/zVCkg7mQ==
X-Google-Smtp-Source: AGHT+IFgAfqWvX5PEh1cmn/u8Yxf4LfZBK3LA1v4JaXGtqfLL/0kW1PeCJmxk05AdT4eeV56gWtBEcduQpTx6A==
X-Received: from pgcl20.prod.google.com ([2002:a63:7014:0:b0:b16:7375:98d2])
 (user=yepeilin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:d70f:b0:1ee:c8e7:203c with SMTP id adf61e73a8af0-2148bf0678amr2882726637.24.1746589362544;
 Tue, 06 May 2025 20:42:42 -0700 (PDT)
Date: Wed,  7 May 2025 03:42:29 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <cover.1746588351.git.yepeilin@google.com>
Subject: [PATCH bpf-next v2 0/8] bpf, riscv64: Support load-acquire and
 store-release instructions
From: Peilin Ye <yepeilin@google.com>
To: bpf@vger.kernel.org
Cc: Peilin Ye <yepeilin@google.com>, linux-riscv@lists.infradead.org, 
	Andrea Parri <parri.andrea@gmail.com>, 
	"=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?=" <bjorn@kernel.org>, Pu Lehui <pulehui@huawei.com>, 
	Puranjay Mohan <puranjay@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Mykola Lysenko <mykolal@fb.com>, 
	Shuah Khan <shuah@kernel.org>, Josh Don <joshdon@google.com>, Barret Rhoden <brho@google.com>, 
	Neel Natu <neelnatu@google.com>, Benjamin Segall <bsegall@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_204244_032871_114AB6AE 
X-CRM114-Status: UNSURE (   8.39  )
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

SGkgYWxsIQoKUGF0Y2hzZXQgWzFdIGludHJvZHVjZWQgQlBGIGxvYWQtYWNxdWlyZSAoQlBGX0xP
QURfQUNRKSBhbmQKc3RvcmUtcmVsZWFzZSAoQlBGX1NUT1JFX1JFTCkgaW5zdHJ1Y3Rpb25zLCBh
bmQgYWRkZWQgeDg2LTY0IGFuZCBhcm02NApKSVQgY29tcGlsZXIgc3VwcG9ydC4gIEFzIGEgZm9s
bG93LXVwLCB0aGlzIHYyIHBhdGNoc2V0IHN1cHBvcnRzCmxvYWQtYWNxdWlyZSBhbmQgc3RvcmUt
cmVsZWFzZSBpbnN0cnVjdGlvbnMgZm9yIHRoZSByaXNjdjY0IEpJVApjb21waWxlciwgYW5kIGlu
dHJvZHVjZXMgc29tZSByZWxhdGVkIHNlbGZ0ZXN0cy8gY2hhbmdlcy4KClNwZWNpZmljYWxseToK
CiAqIFBBVENIIDEgbWFrZXMgaW5zbl9kZWZfcmVnbm8oKSBoYW5kbGUgbG9hZC1hY3F1aXJlcyBw
cm9wZXJseSBmb3IKICAgYnBmX2ppdF9uZWVkc196ZXh0KCkgKHRydWUgZm9yIHJpc2N2NjQpIGFy
Y2hpdGVjdHVyZXMKICogUEFUQ0ggMiwgMyBmcm9tIEFuZHJlYSBQYXJyaSBhZGQgdGhlIGFjdHVh
bCBzdXBwb3J0IHRvIHRoZSByaXNjdjY0CiAgIEpJVCBjb21waWxlcgogKiBQQVRDSCA0IG9wdGlt
aXplcyBjb2RlIGVtaXNzaW9uIGJ5IHNraXBwaW5nIHJlZHVuZGFudCB6ZXh0CiAgIGluc3RydWN0
aW9ucyBpbnNlcnRlZCBieSB0aGUgdmVyaWZpZXIKICogUEFUQ0ggNSwgNiBhbmQgNyBhcmUgbWlu
b3Igc2VsZnRlc3QvIGltcHJvdmVtZW50cwogKiBQQVRDSCA4IGVuYWJsZXMgKG5vbi1hcmVuYSkg
bG9hZC1hY3F1aXJlL3N0b3JlLXJlbGVhc2Ugc2VsZnRlc3RzIGZvcgogICByaXNjdjY0Cgp2MTog
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnBmL2NvdmVyLjE3NDU5NzA5MDguZ2l0LnllcGVpbGlu
QGdvb2dsZS5jb20vCkNoYW5nZXMgc2luY2UgdjE6CgogKiBhZGQgQWNrZWQtYnk6LCBSZXZpZXdl
ZC1ieTogYW5kIFRlc3RlZC1ieTogdGFncyBmcm9tIExlaHVpIGFuZCBCasO2cm4KICogc2ltcGxp
ZnkgY29kZSBsb2dpYyBpbiBQQVRDSCAxIChMZWh1aSkKICogaW4gUEFUQ0ggMywgYXZvaWQgY2hh
bmdpbmcgJ3JldHVybiAwOycgdG8gJ3JldHVybiByZXQ7JyBhdCB0aGUgZW5kIG9mCiAgIGJwZl9q
aXRfZW1pdF9pbnNuKCkgKExlaHVpKQoKUGxlYXNlIHJlZmVyIHRvIGluZGl2aWR1YWwgcGF0Y2hl
cyBmb3IgZGV0YWlscy4gIFRoYW5rcyEKClsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwv
Y292ZXIuMTc0MTA0OTU2Ny5naXQueWVwZWlsaW5AZ29vZ2xlLmNvbS8KCkFuZHJlYSBQYXJyaSAo
Mik6CiAgYnBmLCByaXNjdjY0OiBJbnRyb2R1Y2UgZW1pdF9sb2FkXyooKSBhbmQgZW1pdF9zdG9y
ZV8qKCkKICBicGYsIHJpc2N2NjQ6IFN1cHBvcnQgbG9hZC1hY3F1aXJlIGFuZCBzdG9yZS1yZWxl
YXNlIGluc3RydWN0aW9ucwoKUGVpbGluIFllICg2KToKICBicGYvdmVyaWZpZXI6IEhhbmRsZSBC
UEZfTE9BRF9BQ1EgaW5zdHJ1Y3Rpb25zIGluIGluc25fZGVmX3JlZ25vKCkKICBicGYsIHJpc2N2
NjQ6IFNraXAgcmVkdW5kYW50IHpleHQgaW5zdHJ1Y3Rpb24gYWZ0ZXIgbG9hZC1hY3F1aXJlCiAg
c2VsZnRlc3RzL2JwZjogVXNlIENBTl9VU0VfTE9BRF9BQ1FfU1RPUkVfUkVMIHdoZW4gYXBwcm9w
cmlhdGUKICBzZWxmdGVzdHMvYnBmOiBBdm9pZCBwYXNzaW5nIG91dC1vZi1yYW5nZSB2YWx1ZXMg
dG8gX19yZXR2YWwoKQogIHNlbGZ0ZXN0cy9icGY6IFZlcmlmeSB6ZXJvLWV4dGVuc2lvbiBiZWhh
dmlvciBpbiBsb2FkLWFjcXVpcmUgdGVzdHMKICBzZWxmdGVzdHMvYnBmOiBFbmFibGUgbm9uLWFy
ZW5hIGxvYWQtYWNxdWlyZS9zdG9yZS1yZWxlYXNlIHNlbGZ0ZXN0cwogICAgZm9yIHJpc2N2NjQK
CiBhcmNoL3Jpc2N2L25ldC9icGZfaml0LmggICAgICAgICAgICAgICAgICAgICAgfCAgMTUgKwog
YXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYyAgICAgICAgICAgICAgIHwgMzMyICsrKysr
KysrKysrKy0tLS0tLQogYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb3JlLmMgICAgICAgICAgICAg
ICAgIHwgICAzICstCiBrZXJuZWwvYnBmL3ZlcmlmaWVyLmMgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgMTIgKy0KIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9wcm9ncy9icGZfbWlzYy5o
ICB8ICAgNSArLQogLi4uL2JwZi9wcm9ncy92ZXJpZmllcl9sb2FkX2FjcXVpcmUuYyAgICAgICAg
IHwgIDQ4ICsrLQogLi4uL3NlbGZ0ZXN0cy9icGYvcHJvZ3MvdmVyaWZpZXJfcHJlY2lzaW9uLmMg
IHwgICA1ICstCiAuLi4vYnBmL3Byb2dzL3ZlcmlmaWVyX3N0b3JlX3JlbGVhc2UuYyAgICAgICAg
fCAgMzkgKy0KIDggZmlsZXMgY2hhbmdlZCwgMzEzIGluc2VydGlvbnMoKyksIDE0NiBkZWxldGlv
bnMoLSkKCi0tIAoyLjQ5LjAuOTY3Lmc2YTBkZjNlY2MzLWdvb2cKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
