Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB5AC369DC
	for <linux-riscv@archiver.kernel.org>; Wed,  7 May 2025 03:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=tzjuOEyryw5Tzg2fZVAmtRezygr30Gvk6XBwD44aqoo=; b=K06W1Qp7ut32hfGa2FIdopzJSG
	Sjvh0v4F0xDFIKwlVfwjZqvxIzowu0m2lAiEdUCE3BqjYF9Eh1cUyH/qh5JIbnq1OPQuYC2SAZxDm
	ec24/nzucey+WwwyWWexkOD0lqKTPfa0rgYtlhR2+vF0F0245Labw2IFydcrWsN98u7qkiq44ahlO
	p55yvLR5DF7A4urrmfpxwGNyAmJOyMtwHKvEUVwuQkamHRt6bmQQ1SUNqrDnJQOd6lLNSdWkG36Bh
	TalmBaIKyee5QgixWZXNQ3Htsu4rDnl6P6trKQ/5BUq4ELwwRAGOgysS7WtHwvj8OEeyeN1qSGxLq
	BLcW+dwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCVgt-0000000E5rL-0O0V;
	Wed, 07 May 2025 03:43:27 +0000
Received: from mail-oa1-x4a.google.com ([2001:4860:4864:20::4a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCVgq-0000000E5pV-1bdL
	for linux-riscv@lists.infradead.org;
	Wed, 07 May 2025 03:43:25 +0000
Received: by mail-oa1-x4a.google.com with SMTP id 586e51a60fabf-2d03e45b8e0so5859021fac.0
        for <linux-riscv@lists.infradead.org>; Tue, 06 May 2025 20:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746589403; x=1747194203; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HIjhaUFku2d30Onds8TPaHevH2XK2FGkuZ8H2DLrsm4=;
        b=pyNp9bFoFzFskS8j8ryiznzszsRr7v58PGchWvpHLizUa46gkUmEZcNrZqEln6W84a
         n4m7yC9NAjoVfC62Wu3JwKT43b8JONF9H9lqtkNyKAzrDW2qZpqqHo0MP6c6eCo98zmE
         LTSzNs0sJ54QTkeBNmTqORbplApKdlaU8fje3r+cm7Eaa50JzzA6BHZIj742Bx2jaV4v
         8+9ZoX57aHT9PovnluhTHn8l1Cq2bbaA9rMpR9Dx/DnpIEtU5di3vamGYqCbOPM9D6OS
         vEJjbZh9F4a3TOTvlkcyXpjwMnURmqmsjmLNQgUSUpH9vwHqhYwx1wSQLjjYPSfShh8W
         eJ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746589403; x=1747194203;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HIjhaUFku2d30Onds8TPaHevH2XK2FGkuZ8H2DLrsm4=;
        b=NNY42B7EjqdGD1yZr8oSiusrQSWVi+8OxCJa+x6qHseZIXc9w0mKeTOQLaA5rLbEbd
         rbh06OQ6/YEkeqGXNTfTYk4AZYuz7yzbSwSek3ggLfQnAq+06eQcDVoU5WTIUgkbtOta
         a2dw5cPYPn/ZFcARZlbnLQq/8s+xzLmLABlKi+skXUTlszl6pXVVLIuMBTDeArE0vEhM
         Gidh5IjCFbL/bCJEN7HJM+69u64Z0yWWBeSTcHPku0CpHf4e2y5YNCbl4elc7HRb/Qjn
         RvNEfly70nJQOAqWo9d7weR3o1osU+JDjptdJROK0czc74HqUZgXLXCd9ahxL8T6wCnt
         +LVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWk8pziHQ6bA1fIpTtvcqSfWqut92FuHz7pCPiu40QvZGlXUg/c5SNDsBt6hgg1e8DNJpkXzhX9hDnP1A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxzlXTd8ldNZtmxJdk3g8cnb2DuJV494GDSldO/VMt3UL3kTes6
	lT1IdWW/na3Ug5zIjK4vi60iTmTYgGuKdUdEJVv9CzCG3a+qZKDvOvO8ukpNjrkB0CX+XHUORJo
	y+rwxfE0kKA==
X-Google-Smtp-Source: AGHT+IEQ/bV1QgLKYOw74jiDCdQit/bsQIlhJxD6STisAverFe6J/w+Xjoafr+jCJijR7St5IPcQp76UWAePoA==
X-Received: from oabsk19.prod.google.com ([2002:a05:6871:8013:b0:2c2:5d77:108f])
 (user=yepeilin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6870:310:b0:29e:569a:f90d with SMTP id 586e51a60fabf-2db5c10ad14mr1022015fac.32.1746589402967;
 Tue, 06 May 2025 20:43:22 -0700 (PDT)
Date: Wed,  7 May 2025 03:43:19 +0000
In-Reply-To: <cover.1746588351.git.yepeilin@google.com>
Mime-Version: 1.0
References: <cover.1746588351.git.yepeilin@google.com>
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <d67f4c6f6ee0d0388cbce1f4892ec4176ee2d604.1746588351.git.yepeilin@google.com>
Subject: [PATCH bpf-next v2 6/8] selftests/bpf: Avoid passing out-of-range
 values to __retval()
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
X-CRM114-CacheID: sfid-20250506_204324_429700_DF43B0C6 
X-CRM114-Status: UNSURE (   8.86  )
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

Q3VycmVudGx5LCB3ZSBwYXNzIDB4MTIzNDU2Nzg5MGFiY2RlZiB0byBfX3JldHZhbCgpIGZvciB0
aGUgZm9sbG93aW5nCnR3byB0ZXN0czoKCiAgdmVyaWZpZXJfbG9hZF9hY3F1aXJlL2xvYWRfYWNx
dWlyZV82NAogIHZlcmlmaWVyX3N0b3JlX3JlbGVhc2Uvc3RvcmVfcmVsZWFzZV82NAoKSG93ZXZl
ciwgdGhlIHVwcGVyIDMyIGJpdHMgb2YgdGhhdCB2YWx1ZSBhcmUgYmVpbmcgaWdub3JlZCwgc2lu
Y2UKX19yZXR2YWwoKSBleHBlY3RzIGFuIGludC4gIEFjdHVhbGx5LCB0aGUgdGVzdHMgd291bGQg
c3RpbGwgcGFzcyBldmVuIGlmCkkgY2hhbmdlICdfX3JldHZhbCgweDEyMzQ1Njc4OTBhYmNkZWYp
JyB0byBlLmcuICdfX3JldHZhbCgweDkwYWJjZGVmKScuCgpSZXN0cnVjdHVyZSB0aGUgdGVzdHMg
YSBiaXQgdG8gdGVzdCB0aGUgZW50aXJlIDY0LWJpdCB2YWx1ZXMgcHJvcGVybHkuCkRvIHRoZSBz
YW1lIHRvIHRoZWlyIDgtLCAxNi0gYW5kIDMyLWJpdCB2YXJpYW50cyBhcyB3ZWxsIHRvIGtlZXAg
dGhlCnN0eWxlIGNvbnNpc3RlbnQuCgpGaXhlczogZmYzYWZlNWRhOTk4ICgic2VsZnRlc3RzL2Jw
ZjogQWRkIHNlbGZ0ZXN0cyBmb3IgbG9hZC1hY3F1aXJlIGFuZCBzdG9yZS1yZWxlYXNlIGluc3Ry
dWN0aW9ucyIpCkFja2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJuZWwub3JnPgpSZXZp
ZXdlZC1ieTogUHUgTGVodWkgPHB1bGVodWlAaHVhd2VpLmNvbT4KVGVzdGVkLWJ5OiBCasO2cm4g
VMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+ICMgUUVNVS9SVkEyMwpTaWduZWQtb2ZmLWJ5OiBQ
ZWlsaW4gWWUgPHllcGVpbGluQGdvb2dsZS5jb20+Ci0tLQogLi4uL2JwZi9wcm9ncy92ZXJpZmll
cl9sb2FkX2FjcXVpcmUuYyAgICAgICAgIHwgNDAgKysrKysrKysrKysrKy0tLS0tLQogLi4uL2Jw
Zi9wcm9ncy92ZXJpZmllcl9zdG9yZV9yZWxlYXNlLmMgICAgICAgIHwgMzIgKysrKysrKysrKyst
LS0tCiAyIGZpbGVzIGNoYW5nZWQsIDUyIGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9wcm9ncy92ZXJpZmllcl9s
b2FkX2FjcXVpcmUuYyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9wcm9ncy92ZXJpZmll
cl9sb2FkX2FjcXVpcmUuYwppbmRleCA3NzY5OGQ1YTE5ZTQuLmE2OTZhYjg0YmZkNiAxMDA2NDQK
LS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL3Byb2dzL3ZlcmlmaWVyX2xvYWRfYWNx
dWlyZS5jCisrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9wcm9ncy92ZXJpZmllcl9s
b2FkX2FjcXVpcmUuYwpAQCAtMTAsNjUgKzEwLDgxIEBACiAKIFNFQygic29ja2V0IikKIF9fZGVz
Y3JpcHRpb24oImxvYWQtYWNxdWlyZSwgOC1iaXQiKQotX19zdWNjZXNzIF9fc3VjY2Vzc191bnBy
aXYgX19yZXR2YWwoMHgxMikKK19fc3VjY2VzcyBfX3N1Y2Nlc3NfdW5wcml2IF9fcmV0dmFsKDAp
CiBfX25ha2VkIHZvaWQgbG9hZF9hY3F1aXJlXzgodm9pZCkKIHsKIAlhc20gdm9sYXRpbGUgKAor
CSJyMCA9IDA7IgogCSJ3MSA9IDB4MTI7IgogCSIqKHU4ICopKHIxMCAtIDEpID0gdzE7IgotCSIu
OGJ5dGUgJVtsb2FkX2FjcXVpcmVfaW5zbl07IiAvLyB3MCA9IGxvYWRfYWNxdWlyZSgodTggKiko
cjEwIC0gMSkpOworCSIuOGJ5dGUgJVtsb2FkX2FjcXVpcmVfaW5zbl07IiAvLyB3MiA9IGxvYWRf
YWNxdWlyZSgodTggKikocjEwIC0gMSkpOworCSJpZiByMiA9PSByMSBnb3RvIDFmOyIKKwkicjAg
PSAxOyIKKyIxOiIKIAkiZXhpdDsiCiAJOgogCTogX19pbW1faW5zbihsb2FkX2FjcXVpcmVfaW5z
biwKLQkJICAgICBCUEZfQVRPTUlDX09QKEJQRl9CLCBCUEZfTE9BRF9BQ1EsIEJQRl9SRUdfMCwg
QlBGX1JFR18xMCwgLTEpKQorCQkgICAgIEJQRl9BVE9NSUNfT1AoQlBGX0IsIEJQRl9MT0FEX0FD
USwgQlBGX1JFR18yLCBCUEZfUkVHXzEwLCAtMSkpCiAJOiBfX2Nsb2JiZXJfYWxsKTsKIH0KIAog
U0VDKCJzb2NrZXQiKQogX19kZXNjcmlwdGlvbigibG9hZC1hY3F1aXJlLCAxNi1iaXQiKQotX19z
dWNjZXNzIF9fc3VjY2Vzc191bnByaXYgX19yZXR2YWwoMHgxMjM0KQorX19zdWNjZXNzIF9fc3Vj
Y2Vzc191bnByaXYgX19yZXR2YWwoMCkKIF9fbmFrZWQgdm9pZCBsb2FkX2FjcXVpcmVfMTYodm9p
ZCkKIHsKIAlhc20gdm9sYXRpbGUgKAorCSJyMCA9IDA7IgogCSJ3MSA9IDB4MTIzNDsiCiAJIioo
dTE2ICopKHIxMCAtIDIpID0gdzE7IgotCSIuOGJ5dGUgJVtsb2FkX2FjcXVpcmVfaW5zbl07IiAv
LyB3MCA9IGxvYWRfYWNxdWlyZSgodTE2ICopKHIxMCAtIDIpKTsKKwkiLjhieXRlICVbbG9hZF9h
Y3F1aXJlX2luc25dOyIgLy8gdzIgPSBsb2FkX2FjcXVpcmUoKHUxNiAqKShyMTAgLSAyKSk7CisJ
ImlmIHIyID09IHIxIGdvdG8gMWY7IgorCSJyMCA9IDE7IgorIjE6IgogCSJleGl0OyIKIAk6CiAJ
OiBfX2ltbV9pbnNuKGxvYWRfYWNxdWlyZV9pbnNuLAotCQkgICAgIEJQRl9BVE9NSUNfT1AoQlBG
X0gsIEJQRl9MT0FEX0FDUSwgQlBGX1JFR18wLCBCUEZfUkVHXzEwLCAtMikpCisJCSAgICAgQlBG
X0FUT01JQ19PUChCUEZfSCwgQlBGX0xPQURfQUNRLCBCUEZfUkVHXzIsIEJQRl9SRUdfMTAsIC0y
KSkKIAk6IF9fY2xvYmJlcl9hbGwpOwogfQogCiBTRUMoInNvY2tldCIpCiBfX2Rlc2NyaXB0aW9u
KCJsb2FkLWFjcXVpcmUsIDMyLWJpdCIpCi1fX3N1Y2Nlc3MgX19zdWNjZXNzX3VucHJpdiBfX3Jl
dHZhbCgweDEyMzQ1Njc4KQorX19zdWNjZXNzIF9fc3VjY2Vzc191bnByaXYgX19yZXR2YWwoMCkK
IF9fbmFrZWQgdm9pZCBsb2FkX2FjcXVpcmVfMzIodm9pZCkKIHsKIAlhc20gdm9sYXRpbGUgKAor
CSJyMCA9IDA7IgogCSJ3MSA9IDB4MTIzNDU2Nzg7IgogCSIqKHUzMiAqKShyMTAgLSA0KSA9IHcx
OyIKLQkiLjhieXRlICVbbG9hZF9hY3F1aXJlX2luc25dOyIgLy8gdzAgPSBsb2FkX2FjcXVpcmUo
KHUzMiAqKShyMTAgLSA0KSk7CisJIi44Ynl0ZSAlW2xvYWRfYWNxdWlyZV9pbnNuXTsiIC8vIHcy
ID0gbG9hZF9hY3F1aXJlKCh1MzIgKikocjEwIC0gNCkpOworCSJpZiByMiA9PSByMSBnb3RvIDFm
OyIKKwkicjAgPSAxOyIKKyIxOiIKIAkiZXhpdDsiCiAJOgogCTogX19pbW1faW5zbihsb2FkX2Fj
cXVpcmVfaW5zbiwKLQkJICAgICBCUEZfQVRPTUlDX09QKEJQRl9XLCBCUEZfTE9BRF9BQ1EsIEJQ
Rl9SRUdfMCwgQlBGX1JFR18xMCwgLTQpKQorCQkgICAgIEJQRl9BVE9NSUNfT1AoQlBGX1csIEJQ
Rl9MT0FEX0FDUSwgQlBGX1JFR18yLCBCUEZfUkVHXzEwLCAtNCkpCiAJOiBfX2Nsb2JiZXJfYWxs
KTsKIH0KIAogU0VDKCJzb2NrZXQiKQogX19kZXNjcmlwdGlvbigibG9hZC1hY3F1aXJlLCA2NC1i
aXQiKQotX19zdWNjZXNzIF9fc3VjY2Vzc191bnByaXYgX19yZXR2YWwoMHgxMjM0NTY3ODkwYWJj
ZGVmKQorX19zdWNjZXNzIF9fc3VjY2Vzc191bnByaXYgX19yZXR2YWwoMCkKIF9fbmFrZWQgdm9p
ZCBsb2FkX2FjcXVpcmVfNjQodm9pZCkKIHsKIAlhc20gdm9sYXRpbGUgKAorCSJyMCA9IDA7Igog
CSJyMSA9IDB4MTIzNDU2Nzg5MGFiY2RlZiBsbDsiCiAJIioodTY0ICopKHIxMCAtIDgpID0gcjE7
IgotCSIuOGJ5dGUgJVtsb2FkX2FjcXVpcmVfaW5zbl07IiAvLyByMCA9IGxvYWRfYWNxdWlyZSgo
dTY0ICopKHIxMCAtIDgpKTsKKwkiLjhieXRlICVbbG9hZF9hY3F1aXJlX2luc25dOyIgLy8gcjIg
PSBsb2FkX2FjcXVpcmUoKHU2NCAqKShyMTAgLSA4KSk7CisJImlmIHIyID09IHIxIGdvdG8gMWY7
IgorCSJyMCA9IDE7IgorIjE6IgogCSJleGl0OyIKIAk6CiAJOiBfX2ltbV9pbnNuKGxvYWRfYWNx
dWlyZV9pbnNuLAotCQkgICAgIEJQRl9BVE9NSUNfT1AoQlBGX0RXLCBCUEZfTE9BRF9BQ1EsIEJQ
Rl9SRUdfMCwgQlBGX1JFR18xMCwgLTgpKQorCQkgICAgIEJQRl9BVE9NSUNfT1AoQlBGX0RXLCBC
UEZfTE9BRF9BQ1EsIEJQRl9SRUdfMiwgQlBGX1JFR18xMCwgLTgpKQogCTogX19jbG9iYmVyX2Fs
bCk7CiB9CiAKZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9wcm9ncy92
ZXJpZmllcl9zdG9yZV9yZWxlYXNlLmMgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvcHJv
Z3MvdmVyaWZpZXJfc3RvcmVfcmVsZWFzZS5jCmluZGV4IDdlNDU2ZTI4NjFiNC4uNzJmMWViMDA2
MDc0IDEwMDY0NAotLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvcHJvZ3MvdmVyaWZp
ZXJfc3RvcmVfcmVsZWFzZS5jCisrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9wcm9n
cy92ZXJpZmllcl9zdG9yZV9yZWxlYXNlLmMKQEAgLTEwLDEzICsxMCwxNyBAQAogCiBTRUMoInNv
Y2tldCIpCiBfX2Rlc2NyaXB0aW9uKCJzdG9yZS1yZWxlYXNlLCA4LWJpdCIpCi1fX3N1Y2Nlc3Mg
X19zdWNjZXNzX3VucHJpdiBfX3JldHZhbCgweDEyKQorX19zdWNjZXNzIF9fc3VjY2Vzc191bnBy
aXYgX19yZXR2YWwoMCkKIF9fbmFrZWQgdm9pZCBzdG9yZV9yZWxlYXNlXzgodm9pZCkKIHsKIAlh
c20gdm9sYXRpbGUgKAorCSJyMCA9IDA7IgogCSJ3MSA9IDB4MTI7IgogCSIuOGJ5dGUgJVtzdG9y
ZV9yZWxlYXNlX2luc25dOyIgLy8gc3RvcmVfcmVsZWFzZSgodTggKikocjEwIC0gMSksIHcxKTsK
LQkidzAgPSAqKHU4ICopKHIxMCAtIDEpOyIKKwkidzIgPSAqKHU4ICopKHIxMCAtIDEpOyIKKwki
aWYgcjIgPT0gcjEgZ290byAxZjsiCisJInIwID0gMTsiCisiMToiCiAJImV4aXQ7IgogCToKIAk6
IF9faW1tX2luc24oc3RvcmVfcmVsZWFzZV9pbnNuLApAQCAtMjYsMTMgKzMwLDE3IEBAIF9fbmFr
ZWQgdm9pZCBzdG9yZV9yZWxlYXNlXzgodm9pZCkKIAogU0VDKCJzb2NrZXQiKQogX19kZXNjcmlw
dGlvbigic3RvcmUtcmVsZWFzZSwgMTYtYml0IikKLV9fc3VjY2VzcyBfX3N1Y2Nlc3NfdW5wcml2
IF9fcmV0dmFsKDB4MTIzNCkKK19fc3VjY2VzcyBfX3N1Y2Nlc3NfdW5wcml2IF9fcmV0dmFsKDAp
CiBfX25ha2VkIHZvaWQgc3RvcmVfcmVsZWFzZV8xNih2b2lkKQogewogCWFzbSB2b2xhdGlsZSAo
CisJInIwID0gMDsiCiAJIncxID0gMHgxMjM0OyIKIAkiLjhieXRlICVbc3RvcmVfcmVsZWFzZV9p
bnNuXTsiIC8vIHN0b3JlX3JlbGVhc2UoKHUxNiAqKShyMTAgLSAyKSwgdzEpOwotCSJ3MCA9ICoo
dTE2ICopKHIxMCAtIDIpOyIKKwkidzIgPSAqKHUxNiAqKShyMTAgLSAyKTsiCisJImlmIHIyID09
IHIxIGdvdG8gMWY7IgorCSJyMCA9IDE7IgorIjE6IgogCSJleGl0OyIKIAk6CiAJOiBfX2ltbV9p
bnNuKHN0b3JlX3JlbGVhc2VfaW5zbiwKQEAgLTQyLDEzICs1MCwxNyBAQCBfX25ha2VkIHZvaWQg
c3RvcmVfcmVsZWFzZV8xNih2b2lkKQogCiBTRUMoInNvY2tldCIpCiBfX2Rlc2NyaXB0aW9uKCJz
dG9yZS1yZWxlYXNlLCAzMi1iaXQiKQotX19zdWNjZXNzIF9fc3VjY2Vzc191bnByaXYgX19yZXR2
YWwoMHgxMjM0NTY3OCkKK19fc3VjY2VzcyBfX3N1Y2Nlc3NfdW5wcml2IF9fcmV0dmFsKDApCiBf
X25ha2VkIHZvaWQgc3RvcmVfcmVsZWFzZV8zMih2b2lkKQogewogCWFzbSB2b2xhdGlsZSAoCisJ
InIwID0gMDsiCiAJIncxID0gMHgxMjM0NTY3ODsiCiAJIi44Ynl0ZSAlW3N0b3JlX3JlbGVhc2Vf
aW5zbl07IiAvLyBzdG9yZV9yZWxlYXNlKCh1MzIgKikocjEwIC0gNCksIHcxKTsKLQkidzAgPSAq
KHUzMiAqKShyMTAgLSA0KTsiCisJIncyID0gKih1MzIgKikocjEwIC0gNCk7IgorCSJpZiByMiA9
PSByMSBnb3RvIDFmOyIKKwkicjAgPSAxOyIKKyIxOiIKIAkiZXhpdDsiCiAJOgogCTogX19pbW1f
aW5zbihzdG9yZV9yZWxlYXNlX2luc24sCkBAIC01OCwxMyArNzAsMTcgQEAgX19uYWtlZCB2b2lk
IHN0b3JlX3JlbGVhc2VfMzIodm9pZCkKIAogU0VDKCJzb2NrZXQiKQogX19kZXNjcmlwdGlvbigi
c3RvcmUtcmVsZWFzZSwgNjQtYml0IikKLV9fc3VjY2VzcyBfX3N1Y2Nlc3NfdW5wcml2IF9fcmV0
dmFsKDB4MTIzNDU2Nzg5MGFiY2RlZikKK19fc3VjY2VzcyBfX3N1Y2Nlc3NfdW5wcml2IF9fcmV0
dmFsKDApCiBfX25ha2VkIHZvaWQgc3RvcmVfcmVsZWFzZV82NCh2b2lkKQogewogCWFzbSB2b2xh
dGlsZSAoCisJInIwID0gMDsiCiAJInIxID0gMHgxMjM0NTY3ODkwYWJjZGVmIGxsOyIKIAkiLjhi
eXRlICVbc3RvcmVfcmVsZWFzZV9pbnNuXTsiIC8vIHN0b3JlX3JlbGVhc2UoKHU2NCAqKShyMTAg
LSA4KSwgcjEpOwotCSJyMCA9ICoodTY0ICopKHIxMCAtIDgpOyIKKwkicjIgPSAqKHU2NCAqKShy
MTAgLSA4KTsiCisJImlmIHIyID09IHIxIGdvdG8gMWY7IgorCSJyMCA9IDE7IgorIjE6IgogCSJl
eGl0OyIKIAk6CiAJOiBfX2ltbV9pbnNuKHN0b3JlX3JlbGVhc2VfaW5zbiwKLS0gCjIuNDkuMC45
NjcuZzZhMGRmM2VjYzMtZ29vZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
