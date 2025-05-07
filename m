Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E2CAC3ABC0
	for <linux-riscv@archiver.kernel.org>; Wed,  7 May 2025 03:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=j3fvs7nIZEnmBAko3mp9hLsO1Pm06v7eb+wr1hkVISY=; b=d4lkp4P5nRtid2iGpTqk7ouiqE
	9e00m5AmTvNnY3VaFqP3G4rOmcLow4ypEArANtzRtwbmc5VhwgOQeNlA3PmtQdFD2o9/KvkmAEvk9
	03LW9SzR8cDA6uPNxMwS+2OozO2P5JrC8mdThYi9WebXni6g65YqbmZX0WnMwX2A04wnLMjBZcyc9
	mQsvSU/0LqNFZukWJIw260dERBrJyEWXjla2U034mRu725/rpraEc3kPqHCwl++ZCwcNULZEVx5a8
	Y0qaFyCJYOvEZgR9ATQj/1YbCE8wDUUYfcbyedH6OP2MXVr0foSjYAhW+Bnh0vu2rvh8astizqnow
	iHudr3ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCVga-0000000E5i8-1CFq;
	Wed, 07 May 2025 03:43:08 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCVgX-0000000E5gw-33DI
	for linux-riscv@lists.infradead.org;
	Wed, 07 May 2025 03:43:06 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b1c122308dcso6918444a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 06 May 2025 20:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746589384; x=1747194184; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XZ9+VVlu9UVnVt8rYB8A7FfAZEwt5x79n4OT+/YhqGE=;
        b=UzY7uqRwM8G8lBD7ZHoLH1P4sVZWR/uBtLBCHXUFXWipPCEZLPcr6qReKBFGzU3qYr
         Z/NKVWXltfNgm+2gCknoYWXwmAmxSk72P9Fwy8Q+aMjpKS+psVkH2DPicE9e3bVwcWOM
         RYhColW9L3uDej6aoZQkCNb8k728XpOB8wMdCvYWkEE3dO9eUtbsoEipiy8XQbNCg7m5
         p4+V4SeQnvEaET4BbMdWZ8yFgY6ukCH90ARwc+kZUFEK0ek+2rxH9fc4IpfwLSKrAUDz
         JjheZ7dnxhZiufqqK65y4ouUz+rlPh9g0Hb8m4ZMcjvYC21/AKMlutjPONo9MX9Lw0bq
         e4Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746589384; x=1747194184;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XZ9+VVlu9UVnVt8rYB8A7FfAZEwt5x79n4OT+/YhqGE=;
        b=wZiwHOlMQetuIS4YifJQ0K0U0c2IbsIFhP/E80CuEkHFCIQ5vod0OOiF/GRzZiNSl2
         xdCY30hfuPfSPw8Bwl30MKlqGN4rUgLpweTZsNIMlBKFmZ+aKK1fXTOqbEpw8DVVxXgQ
         nx4J3UBGauwEM2OWWEOFnVdSU3Og0FuvLCaUfTWSysaHAS47PGEnpj8y7SkeOy+Up8sd
         qUwNWO6YWYPStY7wEOOZZ3kIKS0X2n++0AxOPbCy/wkK16QzgEOyjBiABTNKXaU5KvlT
         PLfI4B9EbU0L33hWnITQHshMKwxHpykJufxjyTFNXZbM5QVWZ/vA/F7FlikyI3jZ0+px
         HZow==
X-Forwarded-Encrypted: i=1; AJvYcCVxj/F09VreuEh9PzEz6L2frI/PDIjOljOsrZtQP2Xyqxo+e1DdVopKy6htcWO4dVtfG2KzkYczXqeeeg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzNhOM1dOQwRD6UpRanNamYf1aYA+Md03ReEvoWdSYJ6QTJHETb
	TAHAcT7ulHU9D9+Nmmk0q7kTzwAu1qIqL1O/eoGLuxFVDe6g1ZnNG1hiqdqpdy2pXuQ+a7odLEd
	jBrsYaTmeaw==
X-Google-Smtp-Source: AGHT+IHdddzj77XHhSHINniLU11jO45Ia6D6O+Nfkg/uiniU8HQiKK7yRkvfJa8QrxS3/oIfYMIff4ezEHlJYw==
X-Received: from pjbsc5.prod.google.com ([2002:a17:90b:5105:b0:2fc:2c9c:880])
 (user=yepeilin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:2343:b0:22e:421b:49ad with SMTP id d9443c01a7336-22e5edf7a66mr25507985ad.46.1746589384548;
 Tue, 06 May 2025 20:43:04 -0700 (PDT)
Date: Wed,  7 May 2025 03:43:01 +0000
In-Reply-To: <cover.1746588351.git.yepeilin@google.com>
Mime-Version: 1.0
References: <cover.1746588351.git.yepeilin@google.com>
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <3059c560e537ad43ed19055d2ebbd970c698095a.1746588351.git.yepeilin@google.com>
Subject: [PATCH bpf-next v2 3/8] bpf, riscv64: Support load-acquire and
 store-release instructions
From: Peilin Ye <yepeilin@google.com>
To: bpf@vger.kernel.org
Cc: Andrea Parri <parri.andrea@gmail.com>, linux-riscv@lists.infradead.org, 
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
	Neel Natu <neelnatu@google.com>, Benjamin Segall <bsegall@google.com>, 
	Peilin Ye <yepeilin@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_204305_768935_BE31FB28 
X-CRM114-Status: GOOD (  14.11  )
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

RnJvbTogQW5kcmVhIFBhcnJpIDxwYXJyaS5hbmRyZWFAZ21haWwuY29tPgoKU3VwcG9ydCBCUEYg
bG9hZC1hY3F1aXJlIChCUEZfTE9BRF9BQ1EpIGFuZCBzdG9yZS1yZWxlYXNlCihCUEZfU1RPUkVf
UkVMKSBpbnN0cnVjdGlvbnMgaW4gdGhlIHJpc2N2NjQgSklUIGNvbXBpbGVyLiAgRm9yIGV4YW1w
bGUsCmNvbnNpZGVyIHRoZSBmb2xsb3dpbmcgNjQtYml0IGxvYWQtYWNxdWlyZSAoYXNzdW1pbmcg
bGl0dGxlLWVuZGlhbik6CgogIGRiIDEwIDAwIDAwIDAwIDAxIDAwIDAwICByMSA9IGxvYWRfYWNx
dWlyZSgodTY0ICopKHIxICsgMHgwKSkKICA5NSAwMCAwMCAwMCAwMCAwMCAwMCAwMCAgZXhpdAoK
ICBvcGNvZGUgKDB4ZGIpOiBCUEZfQVRPTUlDIHwgQlBGX0RXIHwgQlBGX1NUWAogIGltbSAoMHgw
MDAwMDEwMCk6IEJQRl9MT0FEX0FDUQoKVGhlIEpJVCBjb21waWxlciB3aWxsIGVtaXQgYW4gTEQg
aW5zdHJ1Y3Rpb24gZm9sbG93ZWQgYnkgYSBGRU5DRSBSLFJXCmluc3RydWN0aW9uIGZvciB0aGUg
YWJvdmUsIGUuZy46CgogIGxkIHg3LDAoeDYpCiAgZmVuY2UgcixydwoKU2ltaWxhcmx5LCBjb25z
aWRlciB0aGUgZm9sbG93aW5nIDE2LWJpdCBzdG9yZS1yZWxlYXNlOgoKICBjYiAyMSAwMCAwMCAx
MCAwMSAwMCAwMCAgc3RvcmVfcmVsZWFzZSgodTE2ICopKHIxICsgMHgwKSwgdzIpCiAgOTUgMDAg
MDAgMDAgMDAgMDAgMDAgMDAgIGV4aXQKCiAgb3Bjb2RlICgweGNiKTogQlBGX0FUT01JQyB8IEJQ
Rl9IIHwgQlBGX1NUWAogIGltbSAoMHgwMDAwMDExMCk6IEJQRl9TVE9SRV9SRUwKCkEgRkVOQ0Ug
UlcsVyBpbnN0cnVjdGlvbiBmb2xsb3dlZCBieSBhbiBTSCBpbnN0cnVjdGlvbiB3aWxsIGJlIGVt
aXR0ZWQsCmUuZy46CgogIGZlbmNlIHJ3LHcKICBzaCB4MiwwKHg0KQoKOC1iaXQgYW5kIDE2LWJp
dCBsb2FkLWFjcXVpcmVzIGFyZSB6ZXJvLWV4dGVuZGluZyAoY2YuLCBMQlUsIExIVSkuICBUaGUK
dmVyaWZpZXIgYWx3YXlzIHJlamVjdHMgbWlzYWxpZ25lZCBsb2FkLWFjcXVpcmVzL3N0b3JlLXJl
bGVhc2VzIChldmVuIGlmCkJQRl9GX0FOWV9BTElHTk1FTlQgaXMgc2V0KSwgc28gdGhlIGVtaXR0
ZWQgbG9hZCBhbmQgc3RvcmUgaW5zdHJ1Y3Rpb25zCmFyZSBndWFyYW50ZWVkIHRvIGJlIHNpbmds
ZS1jb3B5IGF0b21pYy4KCkludHJvZHVjZSBwcmltaXRpdmVzIHRvIGVtaXQgdGhlIHJlbGV2YW50
IChhbmQgdGhlIG1vc3QgY29tbW9uL3VzZWQgaW4KdGhlIGtlcm5lbCkgZmVuY2VzLCBpLmUuIGZl
bmNlcyB3aXRoIFIgLT4gUlcsIFJXIC0+IFcgYW5kIFJXIC0+IFJXLgoKUmVuYW1lIGVtaXRfYXRv
bWljKCkgdG8gZW1pdF9hdG9taWNfcm13KCkgdG8gbWFrZSBpdCBjbGVhciB0aGF0IGl0IG9ubHkK
aGFuZGxlcyBSTVcgYXRvbWljcywgYW5kIHJlcGxhY2UgaXRzIGlzNjQgcGFyYW1ldGVyIHRvIGFs
bG93IHRvIHBlcmZvcm0KdGhlIHJlcXVpcmVkIGNoZWNrcyBvbiB0aGUgb3BzaXplIChCUEZfU0la
RShjb2RlKSkuCgpBY2tlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4KVGVz
dGVkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+ICMgUUVNVS9SVkEyMwpT
aWduZWQtb2ZmLWJ5OiBBbmRyZWEgUGFycmkgPHBhcnJpLmFuZHJlYUBnbWFpbC5jb20+CkNvLWRl
dmVsb3BlZC1ieTogUGVpbGluIFllIDx5ZXBlaWxpbkBnb29nbGUuY29tPgpTaWduZWQtb2ZmLWJ5
OiBQZWlsaW4gWWUgPHllcGVpbGluQGdvb2dsZS5jb20+Ci0tLQogYXJjaC9yaXNjdi9uZXQvYnBm
X2ppdC5oICAgICAgICB8IDE1ICsrKysrKysKIGFyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0
LmMgfCA3NSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0KIDIgZmlsZXMgY2hhbmdl
ZCwgODUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L25ldC9icGZfaml0LmggYi9hcmNoL3Jpc2N2L25ldC9icGZfaml0LmgKaW5kZXggMWQxYzc4
ZDRjZmYxLi5lN2IwMzJkZmQxN2YgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXQu
aAorKysgYi9hcmNoL3Jpc2N2L25ldC9icGZfaml0LmgKQEAgLTYwOCw2ICs2MDgsMjEgQEAgc3Rh
dGljIGlubGluZSB1MzIgcnZfZmVuY2UodTggcHJlZCwgdTggc3VjYykKIAlyZXR1cm4gcnZfaV9p
bnNuKGltbTExXzAsIDAsIDAsIDAsIDB4Zik7CiB9CiAKK3N0YXRpYyBpbmxpbmUgdm9pZCBlbWl0
X2ZlbmNlX3Jfcncoc3RydWN0IHJ2X2ppdF9jb250ZXh0ICpjdHgpCit7CisJZW1pdChydl9mZW5j
ZSgweDIsIDB4MyksIGN0eCk7Cit9CisKK3N0YXRpYyBpbmxpbmUgdm9pZCBlbWl0X2ZlbmNlX3J3
X3coc3RydWN0IHJ2X2ppdF9jb250ZXh0ICpjdHgpCit7CisJZW1pdChydl9mZW5jZSgweDMsIDB4
MSksIGN0eCk7Cit9CisKK3N0YXRpYyBpbmxpbmUgdm9pZCBlbWl0X2ZlbmNlX3J3X3J3KHN0cnVj
dCBydl9qaXRfY29udGV4dCAqY3R4KQoreworCWVtaXQocnZfZmVuY2UoMHgzLCAweDMpLCBjdHgp
OworfQorCiBzdGF0aWMgaW5saW5lIHUzMiBydl9ub3Aodm9pZCkKIHsKIAlyZXR1cm4gcnZfaV9p
bnNuKDAsIDAsIDAsIDAsIDB4MTMpOwpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9uZXQvYnBmX2pp
dF9jb21wNjQuYyBiL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMKaW5kZXggOTUzYjZh
MjBjNjlmLi44NzY3ZjAzMmYyZGUgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRf
Y29tcDY0LmMKKysrIGIvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYwpAQCAtNjA3LDEx
ICs2MDcsNjUgQEAgc3RhdGljIHZvaWQgZW1pdF9zdG9yZV82NCh1OCByZCwgczMyIG9mZiwgdTgg
cnMsIHN0cnVjdCBydl9qaXRfY29udGV4dCAqY3R4KQogCWVtaXRfc2QoUlZfUkVHX1QxLCAwLCBy
cywgY3R4KTsKIH0KIAotc3RhdGljIHZvaWQgZW1pdF9hdG9taWModTggcmQsIHU4IHJzLCBzMTYg
b2ZmLCBzMzIgaW1tLCBib29sIGlzNjQsCi0JCQlzdHJ1Y3QgcnZfaml0X2NvbnRleHQgKmN0eCkK
K3N0YXRpYyBpbnQgZW1pdF9hdG9taWNfbGRfc3QodTggcmQsIHU4IHJzLCBzMTYgb2ZmLCBzMzIg
aW1tLCB1OCBjb2RlLCBzdHJ1Y3QgcnZfaml0X2NvbnRleHQgKmN0eCkKK3sKKwlzd2l0Y2ggKGlt
bSkgeworCS8qIGRzdF9yZWcgPSBsb2FkX2FjcXVpcmUoc3JjX3JlZyArIG9mZjE2KSAqLworCWNh
c2UgQlBGX0xPQURfQUNROgorCQlzd2l0Y2ggKEJQRl9TSVpFKGNvZGUpKSB7CisJCWNhc2UgQlBG
X0I6CisJCQllbWl0X2xvYWRfOChmYWxzZSwgcmQsIG9mZiwgcnMsIGN0eCk7CisJCQlicmVhazsK
KwkJY2FzZSBCUEZfSDoKKwkJCWVtaXRfbG9hZF8xNihmYWxzZSwgcmQsIG9mZiwgcnMsIGN0eCk7
CisJCQlicmVhazsKKwkJY2FzZSBCUEZfVzoKKwkJCWVtaXRfbG9hZF8zMihmYWxzZSwgcmQsIG9m
ZiwgcnMsIGN0eCk7CisJCQlicmVhazsKKwkJY2FzZSBCUEZfRFc6CisJCQllbWl0X2xvYWRfNjQo
ZmFsc2UsIHJkLCBvZmYsIHJzLCBjdHgpOworCQkJYnJlYWs7CisJCX0KKwkJZW1pdF9mZW5jZV9y
X3J3KGN0eCk7CisJCWJyZWFrOworCS8qIHN0b3JlX3JlbGVhc2UoZHN0X3JlZyArIG9mZjE2LCBz
cmNfcmVnKSAqLworCWNhc2UgQlBGX1NUT1JFX1JFTDoKKwkJZW1pdF9mZW5jZV9yd193KGN0eCk7
CisJCXN3aXRjaCAoQlBGX1NJWkUoY29kZSkpIHsKKwkJY2FzZSBCUEZfQjoKKwkJCWVtaXRfc3Rv
cmVfOChyZCwgb2ZmLCBycywgY3R4KTsKKwkJCWJyZWFrOworCQljYXNlIEJQRl9IOgorCQkJZW1p
dF9zdG9yZV8xNihyZCwgb2ZmLCBycywgY3R4KTsKKwkJCWJyZWFrOworCQljYXNlIEJQRl9XOgor
CQkJZW1pdF9zdG9yZV8zMihyZCwgb2ZmLCBycywgY3R4KTsKKwkJCWJyZWFrOworCQljYXNlIEJQ
Rl9EVzoKKwkJCWVtaXRfc3RvcmVfNjQocmQsIG9mZiwgcnMsIGN0eCk7CisJCQlicmVhazsKKwkJ
fQorCQlicmVhazsKKwlkZWZhdWx0OgorCQlwcl9lcnJfb25jZSgiYnBmLWppdDogaW52YWxpZCBh
dG9taWMgbG9hZC9zdG9yZSBvcGNvZGUgJTAyeFxuIiwgaW1tKTsKKwkJcmV0dXJuIC1FSU5WQUw7
CisJfQorCisJcmV0dXJuIDA7Cit9CisKK3N0YXRpYyBpbnQgZW1pdF9hdG9taWNfcm13KHU4IHJk
LCB1OCBycywgczE2IG9mZiwgczMyIGltbSwgdTggY29kZSwKKwkJCSAgIHN0cnVjdCBydl9qaXRf
Y29udGV4dCAqY3R4KQogewogCXU4IHIwOwogCWludCBqbXBfb2Zmc2V0OworCWJvb2wgaXM2NDsK
KworCWlmIChCUEZfU0laRShjb2RlKSAhPSBCUEZfVyAmJiBCUEZfU0laRShjb2RlKSAhPSBCUEZf
RFcpIHsKKwkJcHJfZXJyX29uY2UoImJwZi1qaXQ6IDEtIGFuZCAyLWJ5dGUgUk1XIGF0b21pY3Mg
YXJlIG5vdCBzdXBwb3J0ZWRcbiIpOworCQlyZXR1cm4gLUVJTlZBTDsKKwl9CisJaXM2NCA9IEJQ
Rl9TSVpFKGNvZGUpID09IEJQRl9EVzsKIAogCWlmIChvZmYpIHsKIAkJaWYgKGlzXzEyYl9pbnQo
b2ZmKSkgewpAQCAtNjg4LDkgKzc0MiwxNCBAQCBzdGF0aWMgdm9pZCBlbWl0X2F0b21pYyh1OCBy
ZCwgdTggcnMsIHMxNiBvZmYsIHMzMiBpbW0sIGJvb2wgaXM2NCwKIAkJICAgICBydl9zY193KFJW
X1JFR19UMywgcnMsIHJkLCAwLCAxKSwgY3R4KTsKIAkJam1wX29mZnNldCA9IG5pbnNuc19ydm9m
ZigtNik7CiAJCWVtaXQocnZfYm5lKFJWX1JFR19UMywgMCwgam1wX29mZnNldCA+PiAxKSwgY3R4
KTsKLQkJZW1pdChydl9mZW5jZSgweDMsIDB4MyksIGN0eCk7CisJCWVtaXRfZmVuY2Vfcndfcnco
Y3R4KTsKIAkJYnJlYWs7CisJZGVmYXVsdDoKKwkJcHJfZXJyX29uY2UoImJwZi1qaXQ6IGludmFs
aWQgYXRvbWljIFJNVyBvcGNvZGUgJTAyeFxuIiwgaW1tKTsKKwkJcmV0dXJuIC1FSU5WQUw7CiAJ
fQorCisJcmV0dXJuIDA7CiB9CiAKICNkZWZpbmUgQlBGX0ZJWFVQX09GRlNFVF9NQVNLICAgR0VO
TUFTSygyNiwgMCkKQEAgLTE5NjIsMTAgKzIwMjEsMTYgQEAgaW50IGJwZl9qaXRfZW1pdF9pbnNu
KGNvbnN0IHN0cnVjdCBicGZfaW5zbiAqaW5zbiwgc3RydWN0IHJ2X2ppdF9jb250ZXh0ICpjdHgs
CiAJY2FzZSBCUEZfU1RYIHwgQlBGX01FTSB8IEJQRl9EVzoKIAkJZW1pdF9zdG9yZV82NChyZCwg
b2ZmLCBycywgY3R4KTsKIAkJYnJlYWs7CisJY2FzZSBCUEZfU1RYIHwgQlBGX0FUT01JQyB8IEJQ
Rl9COgorCWNhc2UgQlBGX1NUWCB8IEJQRl9BVE9NSUMgfCBCUEZfSDoKIAljYXNlIEJQRl9TVFgg
fCBCUEZfQVRPTUlDIHwgQlBGX1c6CiAJY2FzZSBCUEZfU1RYIHwgQlBGX0FUT01JQyB8IEJQRl9E
VzoKLQkJZW1pdF9hdG9taWMocmQsIHJzLCBvZmYsIGltbSwKLQkJCSAgICBCUEZfU0laRShjb2Rl
KSA9PSBCUEZfRFcsIGN0eCk7CisJCWlmIChicGZfYXRvbWljX2lzX2xvYWRfc3RvcmUoaW5zbikp
CisJCQlyZXQgPSBlbWl0X2F0b21pY19sZF9zdChyZCwgcnMsIG9mZiwgaW1tLCBjb2RlLCBjdHgp
OworCQllbHNlCisJCQlyZXQgPSBlbWl0X2F0b21pY19ybXcocmQsIHJzLCBvZmYsIGltbSwgY29k
ZSwgY3R4KTsKKwkJaWYgKHJldCkKKwkJCXJldHVybiByZXQ7CiAJCWJyZWFrOwogCiAJY2FzZSBC
UEZfU1RYIHwgQlBGX1BST0JFX01FTTMyIHwgQlBGX0I6Ci0tIAoyLjQ5LjAuOTY3Lmc2YTBkZjNl
Y2MzLWdvb2cKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
