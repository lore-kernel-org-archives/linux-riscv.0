Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2224FC3ABB6
	for <linux-riscv@archiver.kernel.org>; Wed,  7 May 2025 03:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=dYY2Pprcgxk+/OeYGsTDiilEROpDPykjRcd1fdzyHj0=; b=B1TQ9sVPbHefaKtwsUvXwJUcxx
	DEhfUrizNEyZ7+KFYTCcqBxNHQu+tYYzZV1iW7/EIBvFnjTouKci5l0doQEsBPCqjhdQ+qbc9jk89
	15pzwUZVcBWYpQrJC58kjMP3WaGK1Qphd/NWFO25gK8aVyVWqnv5v0O8Hn5cB2WcBn/QuPeWBtI/r
	mjMENrVyn55wD1bGcqUM61ABKbDlCBfxelkibQJJCjQbqG3frsnXOZkbSNujBQy9T6Prv457HrFa5
	nHn8F3TPr32Oo1iGt7wug3OIep3FTFx4/5JvYhrsinzr10rprrWIN1JFRIYXqPm1rXuRRXW1hbOl+
	qdptMIwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCVgQ-0000000E5eo-0BRd;
	Wed, 07 May 2025 03:42:58 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCVgL-0000000E5e4-2lvc
	for linux-riscv@lists.infradead.org;
	Wed, 07 May 2025 03:42:56 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b16b35ea4aaso3910128a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 06 May 2025 20:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746589372; x=1747194172; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D3ohcUNpnNrLBXhF5o8bgmqMF5EWq+vsTR9j7XgMXH8=;
        b=hhVChP4o+JKHwkMCukpFA7uviJf7tiZAhFVCq39zbsFuz8/HUkaRV29fvOYFGEkUrW
         uWsa9A9LMN7o8AALJQjPpkOiBt30T06kMTRU5sWokiollaGaOnlVzN6e55VbSXw14O4A
         WisnbBzsEXphXHkb6XF1bzV2hVkLl01ApomgnUjCJntDRb+jSn2GppMVNqe69jm//+ul
         G8s23we8ncjakVTfAOMm4WfFHY5Jral1sJT744qa0rrO65z27yAITFrkQiQicq29npaf
         xxI6GmxG0jT7uswRGCSHBB3EpFN9PLw/aCo/NPHQQJIRMfB6LTpSUGERztf1HwMflHXN
         4UQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746589372; x=1747194172;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=D3ohcUNpnNrLBXhF5o8bgmqMF5EWq+vsTR9j7XgMXH8=;
        b=iv64EVS+3MpNsFW+x/AMvJmmrJifTBuZCVE+TAm2ssQ3M/uhj4orMxZfCu3BO0QDHC
         p7RiqdgoZnLtVmIsF7VsdFmB+btBwPUIZ5g8zZJnnGAt/gIlJLlAbNwMbOBHp1f80wRs
         TVGSB6YtH+4kdRUCO5fpEzWRB+T9TrtiaYUM6nuJgjGr1IT0Hc3Ovlw2MXkihvyVLOlI
         azlMHRhyegQYNhiW1sIM56AWbYI4cBLABRam2WR3TOSTnquqGCCDtZoNQ5ptR+k8f80X
         RwNZHZ7U1J9IuuMnVSEZlmQduindpfJtzyTOtx27lhBtsr6j//Xku3TNPiMLbnORKYjB
         7vAw==
X-Forwarded-Encrypted: i=1; AJvYcCVQN8WYBoJwqigNBEvHg9ll7gqj12hVGxBTZWZFxT9VtCIe3y498mKuRoN2vAN3O+1oMYg0ALtJGAb3iQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwXmTzTkvmK/U3CMSid5UXCO26Qu16eoIB6Ns44fZEfyzZXN6uK
	RGfjlcqpQOp9XnwgrxCBB49dL+uygrlLhlm4o9s/MZ3zAjGfMVov+KWbvF30odmcSzNq5kPDc7N
	Q/M+bkgDD4g==
X-Google-Smtp-Source: AGHT+IFz4BJzYn4BfdWYvLkT/5ONenxt7WQBZf9xlB0zuHUWc3QHVKMfEbhxGAhiemEViSzfZMFPv/n3rglc7w==
X-Received: from plef17.prod.google.com ([2002:a17:902:f391:b0:227:967c:4f38])
 (user=yepeilin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:c94c:b0:223:3bf6:7e6a with SMTP id d9443c01a7336-22e5ea2b6bemr29706915ad.12.1746589372383;
 Tue, 06 May 2025 20:42:52 -0700 (PDT)
Date: Wed,  7 May 2025 03:42:45 +0000
In-Reply-To: <cover.1746588351.git.yepeilin@google.com>
Mime-Version: 1.0
References: <cover.1746588351.git.yepeilin@google.com>
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <09cb2aec979aaed9d16db41f0f5b364de39377c0.1746588351.git.yepeilin@google.com>
Subject: [PATCH bpf-next v2 1/8] bpf/verifier: Handle BPF_LOAD_ACQ
 instructions in insn_def_regno()
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
X-CRM114-CacheID: sfid-20250506_204253_700569_71C3A509 
X-CRM114-Status: GOOD (  10.98  )
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

SW4gcHJlcGFyYXRpb24gZm9yIHN1cHBvcnRpbmcgQlBGIGxvYWQtYWNxdWlyZSBhbmQgc3RvcmUt
cmVsZWFzZQppbnN0cnVjdGlvbnMgZm9yIGFyY2hpdGVjdHVyZXMgd2hlcmUgYnBmX2ppdF9uZWVk
c196ZXh0KCkgcmV0dXJucyB0cnVlCihlLmcuIHJpc2N2NjQpLCBtYWtlIGluc25fZGVmX3JlZ25v
KCkgaGFuZGxlIGxvYWQtYWNxdWlyZXMgcHJvcGVybHkuCgpBY2tlZC1ieTogQmrDtnJuIFTDtnBl
bCA8Ympvcm5Aa2VybmVsLm9yZz4KVGVzdGVkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZv
c2luYy5jb20+ICMgUUVNVS9SVkEyMwpTaWduZWQtb2ZmLWJ5OiBQZWlsaW4gWWUgPHllcGVpbGlu
QGdvb2dsZS5jb20+Ci0tLQoga2VybmVsL2JwZi92ZXJpZmllci5jIHwgMTIgKysrKysrLS0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2tlcm5lbC9icGYvdmVyaWZpZXIuYyBiL2tlcm5lbC9icGYvdmVyaWZpZXIuYwppbmRl
eCA5OWFhMmM4OTBlN2IuLjI4ZjVhNzg5OWJkNiAxMDA2NDQKLS0tIGEva2VybmVsL2JwZi92ZXJp
Zmllci5jCisrKyBiL2tlcm5lbC9icGYvdmVyaWZpZXIuYwpAQCAtMzY0OSwxNiArMzY0OSwxNiBA
QCBzdGF0aWMgaW50IGluc25fZGVmX3JlZ25vKGNvbnN0IHN0cnVjdCBicGZfaW5zbiAqaW5zbikK
IAljYXNlIEJQRl9TVDoKIAkJcmV0dXJuIC0xOwogCWNhc2UgQlBGX1NUWDoKLQkJaWYgKChCUEZf
TU9ERShpbnNuLT5jb2RlKSA9PSBCUEZfQVRPTUlDIHx8Ci0JCSAgICAgQlBGX01PREUoaW5zbi0+
Y29kZSkgPT0gQlBGX1BST0JFX0FUT01JQykgJiYKLQkJICAgIChpbnNuLT5pbW0gJiBCUEZfRkVU
Q0gpKSB7CisJCWlmIChCUEZfTU9ERShpbnNuLT5jb2RlKSA9PSBCUEZfQVRPTUlDIHx8CisJCSAg
ICBCUEZfTU9ERShpbnNuLT5jb2RlKSA9PSBCUEZfUFJPQkVfQVRPTUlDKSB7CiAJCQlpZiAoaW5z
bi0+aW1tID09IEJQRl9DTVBYQ0hHKQogCQkJCXJldHVybiBCUEZfUkVHXzA7Ci0JCQllbHNlCisJ
CQllbHNlIGlmIChpbnNuLT5pbW0gPT0gQlBGX0xPQURfQUNRKQorCQkJCXJldHVybiBpbnNuLT5k
c3RfcmVnOworCQkJZWxzZSBpZiAoaW5zbi0+aW1tICYgQlBGX0ZFVENIKQogCQkJCXJldHVybiBp
bnNuLT5zcmNfcmVnOwotCQl9IGVsc2UgewotCQkJcmV0dXJuIC0xOwogCQl9CisJCXJldHVybiAt
MTsKIAlkZWZhdWx0OgogCQlyZXR1cm4gaW5zbi0+ZHN0X3JlZzsKIAl9Ci0tIAoyLjQ5LjAuOTY3
Lmc2YTBkZjNlY2MzLWdvb2cKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
