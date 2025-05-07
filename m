Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE5BC369DC
	for <linux-riscv@archiver.kernel.org>; Wed,  7 May 2025 03:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=2ImLAnl5+jfhG7beV3fCO+oqV1OoKoaQ/9xNqH1il2k=; b=vc3i0c2bkFJ1LMQUMo7E631azA
	m6tISJjs7LjguDmcPcXhHRfdPiRAvw5f1/ZbaZEDmY0nkZ1D4yxrV7at1Yk6g3TkfKrh6LmEpjBEA
	Mfs0wLoHLWyDIxHYPcsXMT39mfxIcae4KZZYDLbRgVDQ6I53PsZWLEEvyjDZ97C8qFEE0uxtjoceX
	R3CW09LMjO/FzLMx5D20fNxSaRlpVwSejkMRbS+xC1F/IBTEkYXSyqfXxq74gp/8rFLlkK9+IFgVQ
	VTa9+mZMfZOrGzZi8N8emoELcppavAbmrGU0GahL9i5mrBs/+5uBpW4sAxb5jr1Gx7N5z2DMSY+mG
	BvVvLpRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCVgg-0000000E5lI-3d2f;
	Wed, 07 May 2025 03:43:14 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCVge-0000000E5jm-1Xcz
	for linux-riscv@lists.infradead.org;
	Wed, 07 May 2025 03:43:13 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-3011bee1751so5180489a91.1
        for <linux-riscv@lists.infradead.org>; Tue, 06 May 2025 20:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746589391; x=1747194191; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uxEgqRWNnCIbxPFGHN0DtpWce+dYhTac5Yxo7QchO30=;
        b=x1nuKQRDw/Nf89Jb5uUJnD8zfnsNp0CHWolix7nedmuRe6F+a7uBVh3EyOzIkwjRgC
         LZGHEyVHEMXY8dTUQpLBHdFd2yUvhF/xf+P9bmMINVBPezw8gJD3FBMYu+9Gmafz4cyR
         p8H+Am8Qm22i57I12wo7lzQGjiag1jiLaYhuQ9h2Xxtf8FfyK/WgA97SjUdCHwnSg8wc
         +VUwoHV2aPubOkO7tBjouFpSKHJrEiZoDkI6bH8UHxOfrChCYf6RXynclvAGKRoVf/hE
         AqzrxfW+ypArzsKygubJotn9rjEaGSvdmxLDPFn6aiQWjkWy+k0bO4WXJk9qlkJtcTlg
         aXBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746589391; x=1747194191;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uxEgqRWNnCIbxPFGHN0DtpWce+dYhTac5Yxo7QchO30=;
        b=xLGPE1FtgIywosoOUjNOnNSaODLv49uvkOukdr12h12mxMMGdxdGe43npSAu7aBmK0
         X1erpshKwMdnLhwdq6F3DBHhVlx+sKXdvU2ysYVBTgLqWegj08y2+3DBebDO6mRGIlTD
         RSjIW5NoKhcSsaDl7Uav76e+7yJs8ROVYKqKhL7I68wpSnWrBq6Vp8hz38vPsJjSbCfY
         IMz8epOqJtx/mI1QgymzYtl0ppnjc0T3nuR1vLFZ5yvsPdTC078qFdk8U5bkxlNdElbY
         CnWg0LlU1P0++Z9R+YqDJPrigd4i++qkyHjcZIwqjY3BxZc99QjyvEF0jVxxDl1vPWnl
         pFUg==
X-Forwarded-Encrypted: i=1; AJvYcCUkYtloHlRBTElvF7jugD9imjfaVcVVaCYFWAVGjq/uREoxNuM/0YWL2hsy8SRDvhfInsFj93wKgilSAA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxShBaYrqRM9/H6W560wBKS+VWwOTSVLPGOTL56wQQ5gHTVBRy/
	2UpSJiUBWFZY9AWJI3/C43LjpKBCxOkLP25hJyxHYFZDaXkvQbs1MhckR4ujAb/GN1qkOr9Hf9c
	+/FVfNk2Qag==
X-Google-Smtp-Source: AGHT+IHKxBND9jCab6HFwe4pJvHSVydGb2+kTstOAcdiQFsFXY5M29PHXlkh+RljB/HINF75zl2pV/LqwLoMZQ==
X-Received: from pjbdj15.prod.google.com ([2002:a17:90a:d2cf:b0:2fe:800f:23a])
 (user=yepeilin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:384f:b0:2fa:13d9:39c with SMTP id 98e67ed59e1d1-30aac19d7e0mr3239110a91.14.1746589390718;
 Tue, 06 May 2025 20:43:10 -0700 (PDT)
Date: Wed,  7 May 2025 03:43:07 +0000
In-Reply-To: <cover.1746588351.git.yepeilin@google.com>
Mime-Version: 1.0
References: <cover.1746588351.git.yepeilin@google.com>
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <10e90e0eab042f924d35ad0d1c1f7ca29f673152.1746588351.git.yepeilin@google.com>
Subject: [PATCH bpf-next v2 4/8] bpf, riscv64: Skip redundant zext instruction
 after load-acquire
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
X-CRM114-CacheID: sfid-20250506_204312_407399_3452758F 
X-CRM114-Status: GOOD (  15.57  )
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

Q3VycmVudGx5LCB0aGUgdmVyaWZpZXIgaW5zZXJ0cyBhIHpleHQgaW5zdHJ1Y3Rpb24gcmlnaHQg
YWZ0ZXIgZXZlcnkgOC0sCjE2LSBvciAzMi1iaXQgbG9hZC1hY3F1aXJlLCB3aGljaCBpcyBhbHJl
YWR5IHplcm8tZXh0ZW5kaW5nLiAgU2tpcCBzdWNoCnJlZHVuZGFudCB6ZXh0IGluc3RydWN0aW9u
cy4KCldoaWxlIHdlIGFyZSBoZXJlLCB1cGRhdGUgdGhhdCBhbHJlYWR5LW9ic29sZXRlIGNvbW1l
bnQgYWJvdXQgInNraXAgdGhlCm5leHQgaW5zdHJ1Y3Rpb24iIGluIGJ1aWxkX2JvZHkoKS4gIEFs
c28gY2hhbmdlIGVtaXRfYXRvbWljX3JtdygpJ3MKcGFyYW1ldGVycyB0byBrZWVwIGl0IGNvbnNp
c3RlbnQgd2l0aCBlbWl0X2F0b21pY19sZF9zdCgpLgoKTm90ZSB0aGF0IGNoZWNraW5nICdpbnNu
WzFdJyByZWxpZXMgb24gJ2luc24nIG5vdCBiZWluZyB0aGUgbGFzdAppbnN0cnVjdGlvbiwgd2hp
Y2ggc2hvdWxkIGhhdmUgYmVlbiBndWFyYW50ZWVkIGJ5IHRoZSB2ZXJpZmllcjsgd2UKYWxyZWFk
eSB1c2UgJ2luc25bMV0nIGVsc2V3aGVyZSBpbiB0aGUgZmlsZSBmb3Igc2ltaWxhciBwdXJwb3Nl
cy4KQWRkaXRpb25hbGx5LCB3ZSBkb24ndCBjaGVjayBpZiAnaW5zblsxXScgaXMgYWN0dWFsbHkg
YSB6ZXh0IGZvciBvdXIKbG9hZC1hY3F1aXJlJ3MgZHN0X3JlZywgb3Igc29tZSBvdGhlciByZWdp
c3RlcnMgLSBpbiBvdGhlciB3b3JkcywgaGVyZQp3ZSBhcmUgcmVseWluZyBvbiB0aGUgdmVyaWZp
ZXIgdG8gYWx3YXlzIGluc2VydCBhIHJlZHVuZGFudCB6ZXh0IHJpZ2h0CmFmdGVyIGEgOC8xNi8z
Mi1iaXQgbG9hZC1hY3F1aXJlLCBmb3IgaXRzIGRzdF9yZWcuCgpBY2tlZC1ieTogQmrDtnJuIFTD
tnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4KUmV2aWV3ZWQtYnk6IFB1IExlaHVpIDxwdWxlaHVpQGh1
YXdlaS5jb20+ClRlc3RlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPiAj
IFFFTVUvUlZBMjMKU2lnbmVkLW9mZi1ieTogUGVpbGluIFllIDx5ZXBlaWxpbkBnb29nbGUuY29t
PgotLS0KIGFyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMgfCAyMyArKysrKysrKysrKysr
KysrKystLS0tLQogYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb3JlLmMgICB8ICAzICstLQogMiBm
aWxlcyBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMgYi9hcmNoL3Jpc2N2L25ldC9icGZf
aml0X2NvbXA2NC5jCmluZGV4IDg3NjdmMDMyZjJkZS4uMTBlMDFmZjA2MzEyIDEwMDY0NAotLS0g
YS9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jCisrKyBiL2FyY2gvcmlzY3YvbmV0L2Jw
Zl9qaXRfY29tcDY0LmMKQEAgLTYwNyw4ICs2MDcsMTMgQEAgc3RhdGljIHZvaWQgZW1pdF9zdG9y
ZV82NCh1OCByZCwgczMyIG9mZiwgdTggcnMsIHN0cnVjdCBydl9qaXRfY29udGV4dCAqY3R4KQog
CWVtaXRfc2QoUlZfUkVHX1QxLCAwLCBycywgY3R4KTsKIH0KIAotc3RhdGljIGludCBlbWl0X2F0
b21pY19sZF9zdCh1OCByZCwgdTggcnMsIHMxNiBvZmYsIHMzMiBpbW0sIHU4IGNvZGUsIHN0cnVj
dCBydl9qaXRfY29udGV4dCAqY3R4KQorc3RhdGljIGludCBlbWl0X2F0b21pY19sZF9zdCh1OCBy
ZCwgdTggcnMsIGNvbnN0IHN0cnVjdCBicGZfaW5zbiAqaW5zbiwKKwkJCSAgICAgc3RydWN0IHJ2
X2ppdF9jb250ZXh0ICpjdHgpCiB7CisJdTggY29kZSA9IGluc24tPmNvZGU7CisJczMyIGltbSA9
IGluc24tPmltbTsKKwlzMTYgb2ZmID0gaW5zbi0+b2ZmOworCiAJc3dpdGNoIChpbW0pIHsKIAkv
KiBkc3RfcmVnID0gbG9hZF9hY3F1aXJlKHNyY19yZWcgKyBvZmYxNikgKi8KIAljYXNlIEJQRl9M
T0FEX0FDUToKQEAgLTYyNyw2ICs2MzIsMTIgQEAgc3RhdGljIGludCBlbWl0X2F0b21pY19sZF9z
dCh1OCByZCwgdTggcnMsIHMxNiBvZmYsIHMzMiBpbW0sIHU4IGNvZGUsIHN0cnVjdCBydl8KIAkJ
CWJyZWFrOwogCQl9CiAJCWVtaXRfZmVuY2Vfcl9ydyhjdHgpOworCisJCS8qIElmIG91ciBuZXh0
IGluc24gaXMgYSByZWR1bmRhbnQgemV4dCwgcmV0dXJuIDEgdG8gdGVsbAorCQkgKiBidWlsZF9i
b2R5KCkgdG8gc2tpcCBpdC4KKwkJICovCisJCWlmIChCUEZfU0laRShjb2RlKSAhPSBCUEZfRFcg
JiYgaW5zbl9pc196ZXh0KCZpbnNuWzFdKSkKKwkJCXJldHVybiAxOwogCQlicmVhazsKIAkvKiBz
dG9yZV9yZWxlYXNlKGRzdF9yZWcgKyBvZmYxNiwgc3JjX3JlZykgKi8KIAljYXNlIEJQRl9TVE9S
RV9SRUw6CkBAIC02NTQsMTAgKzY2NSwxMiBAQCBzdGF0aWMgaW50IGVtaXRfYXRvbWljX2xkX3N0
KHU4IHJkLCB1OCBycywgczE2IG9mZiwgczMyIGltbSwgdTggY29kZSwgc3RydWN0IHJ2XwogCXJl
dHVybiAwOwogfQogCi1zdGF0aWMgaW50IGVtaXRfYXRvbWljX3Jtdyh1OCByZCwgdTggcnMsIHMx
NiBvZmYsIHMzMiBpbW0sIHU4IGNvZGUsCitzdGF0aWMgaW50IGVtaXRfYXRvbWljX3Jtdyh1OCBy
ZCwgdTggcnMsIGNvbnN0IHN0cnVjdCBicGZfaW5zbiAqaW5zbiwKIAkJCSAgIHN0cnVjdCBydl9q
aXRfY29udGV4dCAqY3R4KQogewotCXU4IHIwOworCXU4IHIwLCBjb2RlID0gaW5zbi0+Y29kZTsK
KwlzMTYgb2ZmID0gaW5zbi0+b2ZmOworCXMzMiBpbW0gPSBpbnNuLT5pbW07CiAJaW50IGptcF9v
ZmZzZXQ7CiAJYm9vbCBpczY0OwogCkBAIC0yMDI2LDkgKzIwMzksOSBAQCBpbnQgYnBmX2ppdF9l
bWl0X2luc24oY29uc3Qgc3RydWN0IGJwZl9pbnNuICppbnNuLCBzdHJ1Y3QgcnZfaml0X2NvbnRl
eHQgKmN0eCwKIAljYXNlIEJQRl9TVFggfCBCUEZfQVRPTUlDIHwgQlBGX1c6CiAJY2FzZSBCUEZf
U1RYIHwgQlBGX0FUT01JQyB8IEJQRl9EVzoKIAkJaWYgKGJwZl9hdG9taWNfaXNfbG9hZF9zdG9y
ZShpbnNuKSkKLQkJCXJldCA9IGVtaXRfYXRvbWljX2xkX3N0KHJkLCBycywgb2ZmLCBpbW0sIGNv
ZGUsIGN0eCk7CisJCQlyZXQgPSBlbWl0X2F0b21pY19sZF9zdChyZCwgcnMsIGluc24sIGN0eCk7
CiAJCWVsc2UKLQkJCXJldCA9IGVtaXRfYXRvbWljX3JtdyhyZCwgcnMsIG9mZiwgaW1tLCBjb2Rl
LCBjdHgpOworCQkJcmV0ID0gZW1pdF9hdG9taWNfcm13KHJkLCBycywgaW5zbiwgY3R4KTsKIAkJ
aWYgKHJldCkKIAkJCXJldHVybiByZXQ7CiAJCWJyZWFrOwpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9uZXQvYnBmX2ppdF9jb3JlLmMgYi9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvcmUuYwppbmRl
eCBmOGNkMmY3MGE3ZmIuLmY2Y2E1Y2ZhNmIyZiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9uZXQv
YnBmX2ppdF9jb3JlLmMKKysrIGIvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb3JlLmMKQEAgLTI2
LDkgKzI2LDggQEAgc3RhdGljIGludCBidWlsZF9ib2R5KHN0cnVjdCBydl9qaXRfY29udGV4dCAq
Y3R4LCBib29sIGV4dHJhX3Bhc3MsIGludCAqb2Zmc2V0KQogCQlpbnQgcmV0OwogCiAJCXJldCA9
IGJwZl9qaXRfZW1pdF9pbnNuKGluc24sIGN0eCwgZXh0cmFfcGFzcyk7Ci0JCS8qIEJQRl9MRCB8
IEJQRl9JTU0gfCBCUEZfRFc6IHNraXAgdGhlIG5leHQgaW5zdHJ1Y3Rpb24uICovCiAJCWlmIChy
ZXQgPiAwKQotCQkJaSsrOworCQkJaSsrOyAvKiBza2lwIHRoZSBuZXh0IGluc3RydWN0aW9uICov
CiAJCWlmIChvZmZzZXQpCiAJCQlvZmZzZXRbaV0gPSBjdHgtPm5pbnNuczsKIAkJaWYgKHJldCA8
IDApCi0tIAoyLjQ5LjAuOTY3Lmc2YTBkZjNlY2MzLWdvb2cKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
