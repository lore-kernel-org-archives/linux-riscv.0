Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 542D1C369DC
	for <linux-riscv@archiver.kernel.org>; Wed,  7 May 2025 03:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=tXFhCZf7EX8lrP4evqFGFlBrW0Oj7mb9b5TX75kf9O4=; b=sGmjGR9JUlr62zUK52ODd388No
	CouM4PpW1CsTIz4/nbqZBEA6Ho+UBLGomECtopuTDJP69iNFmN5EjZ9ujBYf9uhqgEP2un0nGmFVB
	6Gk7pE12p4eKNlO6i8kIDBAcfAxVcCbZIGXgrhnFqys1wTq+1ZwGbEZno7+uzK3fRgGW8ByH65sSR
	PueoLU8vMVQ7tR2eggnsrIjnXOXE+VMRDx4mFyeVZmtwlGtVc6/9P3IaqzApWHdKOSvqCC+L6Q8Gd
	Z3TiiKIFeSnfChHUPhS/DWbuMd/MiPrIfCwH25okOki+GmxeFcTokRau5vqlyqG0fF7DJmnTfOQCU
	GeG2Gxpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCVgm-0000000E5o4-287N;
	Wed, 07 May 2025 03:43:20 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCVgj-0000000E5mn-3eG6
	for linux-riscv@lists.infradead.org;
	Wed, 07 May 2025 03:43:18 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-22e3abea7e8so14939255ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 06 May 2025 20:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746589396; x=1747194196; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aYex2sS04TBXgGkqcQU1a9cCLcTu5hNrYUfNWQD7HDc=;
        b=icpYT965d2di4giEggUy9Gmk/+D65HvQFx/fsW9fqEp0ljU8cTtE3mdcjELx8xzRnQ
         xvQ4aFoyeWklJGyI1UHP7ws5FC0CB4NDvKIglvcutZs1VfRK510KlmBKqzvjxPX4Hj6G
         lJuyAWcSekXEgD8FH8hhZjNKT5P9CA+Wa4OXQFeFcO5M3LVQzwLThFsMMTSF2BohlI1l
         teDkkwEvwzMI/RqWPQTDVv/Yb8ZCUwmJ4N/gKG03PE1HUu110/iya+YwwUwkP+X+qA4q
         R5l0gT9iNsL6ryOpIrV551BVg1xVzLJMWXR5irLiyqv+duxDGM344Ni91staxeh9gCYh
         x80Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746589396; x=1747194196;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aYex2sS04TBXgGkqcQU1a9cCLcTu5hNrYUfNWQD7HDc=;
        b=CEcEMk2Dp62wJSEtgNzIKCfWF1RnVAwvAVKL3qOysVZESE/zwhHmQm7A92abP/m/XU
         xOhCKpVB57auJDQ4VT71m3pUZa2wKDQZu6FVbTL20gsMkWphuXTpzUPaFwKLEd9gJYjZ
         POqgV8mSSi0ptjqzn3RIOpYkzVw84rB5adHHjZ0iIKPd3B+xdfXUnrprnBPfNIaaZ2uU
         IUOVehVlWmRYyZh59EhuijcFBnJ5AhxNCQ8xvLOzpcPeJ4Qv+1sZipeIfcEYtr5XeQ1b
         hd1NYowHHQmT2F0EipTJGCujalEZrEwrZCiS+9/IHjNYc1xRt1Rk3y0B4SbU+mgqOY9Z
         v6Ww==
X-Forwarded-Encrypted: i=1; AJvYcCV45HyBGCuyNvnMqNOiDyS3RGu1UmjlmqRXBatVkBznAMCHllT5mE5LY7dwwndnv/bb1bosly1NqZTVuw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxa6yfmubXJFmBQwCzaEr8t2u/mPNSHo3PGvsPVk1UZeURI6kz+
	+o2nhWlVh9p2zR6ntwNxwsIgcjm2AqOihGkDV8vPe02oozOnfrxXyFzotXSuVBWlP5Kc4GV95qe
	Rxy9LA4wcXg==
X-Google-Smtp-Source: AGHT+IELVqGsFyBemvslmYA30CZavjjBYh0FXqYFC6YoOCxRYmeBQDsEWpFjL+ya6H26BpSHDqeqzy8w2NOTHQ==
X-Received: from plfp2.prod.google.com ([2002:a17:902:e742:b0:22e:5728:685d])
 (user=yepeilin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:e786:b0:224:2a6d:55ae with SMTP id d9443c01a7336-22e5edf5679mr25520635ad.48.1746589396613;
 Tue, 06 May 2025 20:43:16 -0700 (PDT)
Date: Wed,  7 May 2025 03:43:13 +0000
In-Reply-To: <cover.1746588351.git.yepeilin@google.com>
Mime-Version: 1.0
References: <cover.1746588351.git.yepeilin@google.com>
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <45d7e025f6e390a8ff36f08fc51e31705ac896bd.1746588351.git.yepeilin@google.com>
Subject: [PATCH bpf-next v2 5/8] selftests/bpf: Use CAN_USE_LOAD_ACQ_STORE_REL
 when appropriate
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
X-CRM114-CacheID: sfid-20250506_204317_908091_C0F4FE92 
X-CRM114-Status: UNSURE (   9.47  )
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

SW5zdGVhZCBvZiBvcGVuLWNvZGluZyB0aGUgY29uZGl0aW9ucywgdXNlCicjaWZkZWYgQ0FOX1VT
RV9MT0FEX0FDUV9TVE9SRV9SRUwnIHRvIGd1YXJkIHRoZSBmb2xsb3dpbmcgdGVzdHM6CgogIHZl
cmlmaWVyX3ByZWNpc2lvbi9icGZfbG9hZF9hY3F1aXJlCiAgdmVyaWZpZXJfcHJlY2lzaW9uL2Jw
Zl9zdG9yZV9yZWxlYXNlCiAgdmVyaWZpZXJfc3RvcmVfcmVsZWFzZS8qCgpOb3RlIHRoYXQsIGZv
ciB0aGUgZmlyc3QgdHdvIHRlc3RzIGluIHZlcmlmaWVyX3ByZWNpc2lvbi5jLCBzd2l0Y2hpbmcg
dG8KJyNpZmRlZiBDQU5fVVNFX0xPQURfQUNRX1NUT1JFX1JFTCcgbWVhbnMgYWxzbyBjaGVja2lu
ZyBpZgonX19jbGFuZ19tYWpvcl9fID49IDE4Jywgd2hpY2ggaGFzIGFscmVhZHkgYmVlbiBndWFy
YW50ZWVkIGJ5IHRoZSBvdXRlcgonI2lmJyBjaGVjay4KCkFja2VkLWJ5OiBCasO2cm4gVMO2cGVs
IDxiam9ybkBrZXJuZWwub3JnPgpSZXZpZXdlZC1ieTogUHUgTGVodWkgPHB1bGVodWlAaHVhd2Vp
LmNvbT4KVGVzdGVkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+ICMgUUVN
VS9SVkEyMwpTaWduZWQtb2ZmLWJ5OiBQZWlsaW4gWWUgPHllcGVpbGluQGdvb2dsZS5jb20+Ci0t
LQogdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL3Byb2dzL3ZlcmlmaWVyX3ByZWNpc2lvbi5j
ICAgICB8IDUgKystLS0KIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9wcm9ncy92ZXJpZmll
cl9zdG9yZV9yZWxlYXNlLmMgfCA3ICsrKy0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRp
b25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRl
c3RzL2JwZi9wcm9ncy92ZXJpZmllcl9wcmVjaXNpb24uYyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRl
c3RzL2JwZi9wcm9ncy92ZXJpZmllcl9wcmVjaXNpb24uYwppbmRleCA2NjYyZDRiMzk5NjkuLjJk
ZDBkMTVjMjY3OCAxMDA2NDQKLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL3Byb2dz
L3ZlcmlmaWVyX3ByZWNpc2lvbi5jCisrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9w
cm9ncy92ZXJpZmllcl9wcmVjaXNpb24uYwpAQCAtOTEsOCArOTEsNyBAQCBfX25ha2VkIGludCBi
cGZfZW5kX2Jzd2FwKHZvaWQpCiAJCTo6OiBfX2Nsb2JiZXJfYWxsKTsKIH0KIAotI2lmIGRlZmlu
ZWQoRU5BQkxFX0FUT01JQ1NfVEVTVFMpICYmIFwKLQkoZGVmaW5lZChfX1RBUkdFVF9BUkNIX2Fy
bTY0KSB8fCBkZWZpbmVkKF9fVEFSR0VUX0FSQ0hfeDg2KSkKKyNpZmRlZiBDQU5fVVNFX0xPQURf
QUNRX1NUT1JFX1JFTAogCiBTRUMoIj9yYXdfdHAiKQogX19zdWNjZXNzIF9fbG9nX2xldmVsKDIp
CkBAIC0xMzgsNyArMTM3LDcgQEAgX19uYWtlZCBpbnQgYnBmX3N0b3JlX3JlbGVhc2Uodm9pZCkK
IAk6IF9fY2xvYmJlcl9hbGwpOwogfQogCi0jZW5kaWYgLyogbG9hZC1hY3F1aXJlLCBzdG9yZS1y
ZWxlYXNlICovCisjZW5kaWYgLyogQ0FOX1VTRV9MT0FEX0FDUV9TVE9SRV9SRUwgKi8KICNlbmRp
ZiAvKiB2NCBpbnN0cnVjdGlvbiAqLwogCiBTRUMoIj9yYXdfdHAiKQpkaWZmIC0tZ2l0IGEvdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL3Byb2dzL3ZlcmlmaWVyX3N0b3JlX3JlbGVhc2UuYyBi
L3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9wcm9ncy92ZXJpZmllcl9zdG9yZV9yZWxlYXNl
LmMKaW5kZXggYzA0NDJkNWJiMDQ5Li43ZTQ1NmUyODYxYjQgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL2JwZi9wcm9ncy92ZXJpZmllcl9zdG9yZV9yZWxlYXNlLmMKKysrIGIv
dG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL3Byb2dzL3ZlcmlmaWVyX3N0b3JlX3JlbGVhc2Uu
YwpAQCAtNiw4ICs2LDcgQEAKICNpbmNsdWRlICIuLi8uLi8uLi9pbmNsdWRlL2xpbnV4L2ZpbHRl
ci5oIgogI2luY2x1ZGUgImJwZl9taXNjLmgiCiAKLSNpZiBfX2NsYW5nX21ham9yX18gPj0gMTgg
JiYgZGVmaW5lZChFTkFCTEVfQVRPTUlDU19URVNUUykgJiYgXAotCShkZWZpbmVkKF9fVEFSR0VU
X0FSQ0hfYXJtNjQpIHx8IGRlZmluZWQoX19UQVJHRVRfQVJDSF94ODYpKQorI2lmZGVmIENBTl9V
U0VfTE9BRF9BQ1FfU1RPUkVfUkVMCiAKIFNFQygic29ja2V0IikKIF9fZGVzY3JpcHRpb24oInN0
b3JlLXJlbGVhc2UsIDgtYml0IikKQEAgLTI3MSw3ICsyNzAsNyBAQCBfX25ha2VkIHZvaWQgc3Rv
cmVfcmVsZWFzZV93aXRoX2ludmFsaWRfcmVnKHZvaWQpCiAJOiBfX2Nsb2JiZXJfYWxsKTsKIH0K
IAotI2Vsc2UKKyNlbHNlIC8qIENBTl9VU0VfTE9BRF9BQ1FfU1RPUkVfUkVMICovCiAKIFNFQygi
c29ja2V0IikKIF9fZGVzY3JpcHRpb24oIkNsYW5nIHZlcnNpb24gPCAxOCwgRU5BQkxFX0FUT01J
Q1NfVEVTVFMgbm90IGRlZmluZWQsIGFuZC9vciBKSVQgZG9lc24ndCBzdXBwb3J0IHN0b3JlLXJl
bGVhc2UsIHVzZSBhIGR1bW15IHRlc3QiKQpAQCAtMjgxLDYgKzI4MCw2IEBAIGludCBkdW1teV90
ZXN0KHZvaWQpCiAJcmV0dXJuIDA7CiB9CiAKLSNlbmRpZgorI2VuZGlmIC8qIENBTl9VU0VfTE9B
RF9BQ1FfU1RPUkVfUkVMICovCiAKIGNoYXIgX2xpY2Vuc2VbXSBTRUMoImxpY2Vuc2UiKSA9ICJH
UEwiOwotLSAKMi40OS4wLjk2Ny5nNmEwZGYzZWNjMy1nb29nCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
