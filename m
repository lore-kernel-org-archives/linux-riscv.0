Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB9B5C7EE23
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 15:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1BQN3ShWDr0zQ9YmOuWrhaaJnT6xuUVMep64i6zPM54=; b=Zdb+TC8kqDq9OF
	9NpyQgOIXl0TS+zwuYgAW7TWt/cI4wpNQSsOdCNjkZq2B1jkObVHID3jOSSEj11tbwM10bQxRkOUh
	KK52jYVceDdmIOqTnpob22nh5vYBkaEQbr7paeRtfG9blRwtBD7iy/Um+8wC3dcTkZn9z5TSYsx0B
	Wt9mnLCOrQ+Oh2NufY7j+WIfEp6TpNRingVK4zmP5g0PGFzlweAT4SaG7pj4CpBSWBIngW/4zSsKL
	gDnsr/t945m1uJ0zPDGLXR8Iplp7vCNNUr+hCo4HbqDHNvmETEj/aUCCLYE6j16f2D0LEv3tbdyE7
	y+PxHF9dDg6SOKIa2rZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6CJx-00Fz52-2p;
	Mon, 05 Jun 2023 15:40:37 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6CJv-00Fz3C-1n
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jun 2023 15:40:37 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1b026657a6fso43020945ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 05 Jun 2023 08:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1685979634; x=1688571634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kxEVtyq7dBTCubXHey7aFJ4tCQ5HL12TEktIsofBNGs=;
        b=OnNdGih9m3hBHVhxOHKWKviIPC+AaDLw5GVm27/gmkj9Y0/qKXdq6CRuV9p3Pu/3o3
         n9TX2BWl8aibwUiW37/2wkSZAQ5nF8+is7qEQaKbzwu7sPGHx1odC+aw+5GaQ3wm+k0Y
         8d3bzL6jn4MIivP96cHs8iuQdDRwe6AmzaIsMKy/MP9Bkkp65hreXLFYJULjSdVw+det
         1EmbwbuzwInYLhcg+OQ8MgNkisAUbynPQKKdXbU7fzjaYElwhTaL7f2PAv0cDwwca0tu
         AlQC6elTLyTIZ+siocH8NkgOcjFenjrQin0gJB2chTG2ea5TfMEUY9wT5MPwtvuVVRGo
         GePQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685979634; x=1688571634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kxEVtyq7dBTCubXHey7aFJ4tCQ5HL12TEktIsofBNGs=;
        b=mBVzNdl0xLt5vc4en8jbnpVYmYUlf4zvYS2wC8HTkDd9ohaHKXfc9nBQBN4uzPbanj
         SH3NKYw8XDw0t1NFAC7o1az+XgaH34Wb0u2ys/IzoTCCP6p/uY3RlvNVXynGRA7yYkdT
         LqK3YAOOOBOOJFjBzwcSbHH5MsWQux7EwcJFxzn7mxUG3Fc66egKQp5wpNNor4TUC4ln
         RxEjLooBp9N2GLqp85BzYWyA6QKYSw7OgcWUvaQKjlfzmXEczWfGv4ChNsmJmnbVGC9M
         qPNa+9BML0oJA83rVGBTOTHGizaq0FVmqm659kM99qnbMZXI8bdUSu6vog4ge6tl/WqN
         MF/A==
X-Gm-Message-State: AC+VfDxBiebrvMD10SgfceOPRnh8l5/9B6A6Zugxxt6j0E7rT28V7bK/
	BQzwvht2HngoSEpSK0NdXflk3AjvJY0Dnee8SLPhQb2nRhkl4x6Z2VVph4Z6flTw8t8Yp+2qsQu
	BJOtfhblqLD+8Nr54frPNQX9Z6NWjH27pdLgkWQmdNnPoTrqEpmMdHKwHvToYKtx99PQ9n+DVoA
	8/QvOYHYeQP3OptLc=
X-Google-Smtp-Source: ACHHUZ5pbxo0J0M4WCbe+KgkW+U+WnvH2OLqhT3drAD+z8zebaA48LRKA3rPjaI5NORSH9rGNHZyLw==
X-Received: by 2002:a17:903:1109:b0:1a3:cd4c:8d08 with SMTP id n9-20020a170903110900b001a3cd4c8d08mr11051551plh.38.1685979634596;
        Mon, 05 Jun 2023 08:40:34 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id jk19-20020a170903331300b001b0aec3ed59sm6725962plb.256.2023.06.05.08.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 08:40:34 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: vineetg@rivosinc.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	Vincent Chen <vincent.chen@sifive.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH -next v21 09/27] riscv: Introduce struct/helpers to save/restore per-task Vector state
Date: Mon,  5 Jun 2023 11:07:06 +0000
Message-Id: <20230605110724.21391-10-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230605110724.21391-1-andy.chiu@sifive.com>
References: <20230605110724.21391-1-andy.chiu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_084035_596069_7E15A756 
X-CRM114-Status: GOOD (  12.51  )
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

RnJvbTogR3JlZW50aW1lIEh1IDxncmVlbnRpbWUuaHVAc2lmaXZlLmNvbT4KCkFkZCB2ZWN0b3Ig
c3RhdGUgY29udGV4dCBzdHJ1Y3QgdG8gYmUgYWRkZWQgbGF0ZXIgaW4gdGhyZWFkX3N0cnVjdC4g
QW5kCnByZXBhcmUgbG93LWxldmVsIGhlbHBlciBmdW5jdGlvbnMgdG8gc2F2ZS9yZXN0b3JlIHZl
Y3RvciBjb250ZXh0cy4KClRoaXMgaW5jbHVkZSBWZWN0b3IgUmVnZmlsZSBhbmQgQ1NScyBob2xk
aW5nIGR5bmFtaWMgY29uZmlndXJhdGlvbiBzdGF0ZQoodnN0YXJ0LCB2bCwgdnR5cGUsIHZjc3Ip
LiBUaGUgVmVjIFJlZ2lzdGVyIHdpZHRoIGNvdWxkIGJlIGltcGxlbWVudGF0aW9uCmRlZmluZWQs
IGJ1dCBzYW1lIGZvciBhbGwgcHJvY2Vzc2VzLCBzbyB0aGF0IGlzIHNhdmVkIHNlcGFyYXRlbHku
CgpUaGlzIGlzIG5vdCB5ZXQgd2lyZWQgaW50byBmaW5hbCB0aHJlYWRfc3RydWN0IC0gd2lsbCBi
ZSBkb25lIHdoZW4KX19zd2l0Y2hfdG8gYWN0dWFsbHkgc3RhcnRzIGRvaW5nIHRoaXMgaW4gbGF0
ZXIgcGF0Y2hlcy4KCkdpdmVuIHRoZSB2YXJpYWJsZSAoYW5kIHBvdGVudGlhbGx5IGxhcmdlKSBz
aXplIG9mIHJlZ2ZpbGUsIHRoZXkgYXJlCnNhdmVkIGluIGR5bmFtaWNhbGx5IGFsbG9jYXRlZCBt
ZW1vcnksIHBvaW50ZWQgdG8gYnkgZGF0YXAgcG9pbnRlciBpbgpfX3Jpc2N2X3ZfZXh0X3N0YXRl
LgoKQ28tZGV2ZWxvcGVkLWJ5OiBWaW5jZW50IENoZW4gPHZpbmNlbnQuY2hlbkBzaWZpdmUuY29t
PgpTaWduZWQtb2ZmLWJ5OiBWaW5jZW50IENoZW4gPHZpbmNlbnQuY2hlbkBzaWZpdmUuY29tPgpT
aWduZWQtb2ZmLWJ5OiBHcmVlbnRpbWUgSHUgPGdyZWVudGltZS5odUBzaWZpdmUuY29tPgpTaWdu
ZWQtb2ZmLWJ5OiBWaW5lZXQgR3VwdGEgPHZpbmVldGdAcml2b3NpbmMuY29tPgpTaWduZWQtb2Zm
LWJ5OiBBbmR5IENoaXUgPGFuZHkuY2hpdUBzaWZpdmUuY29tPgpBY2tlZC1ieTogQ29ub3IgRG9v
bGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KUmV2aWV3ZWQtYnk6IEd1byBSZW4gPGd1
b3JlbkBrZXJuZWwub3JnPgpSZXZpZXdlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3Np
bmMuY29tPgpSZXZpZXdlZC1ieTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvLnN0dWVibmVyQHZydWxs
LmV1PgpUZXN0ZWQtYnk6IEhlaWtvIFN0dWVibmVyIDxoZWlrby5zdHVlYm5lckB2cnVsbC5ldT4K
UmV2aWV3ZWQtYnk6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPgotLS0KIGFy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vdmVjdG9yLmggICAgICB8IDk1ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysKIGFyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9wdHJhY2UuaCB8IDE3ICsr
KysrCiAyIGZpbGVzIGNoYW5nZWQsIDExMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS92ZWN0b3IuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmVj
dG9yLmgKaW5kZXggZGYzYjVjYWVjYzg3Li4zYzI5ZjRlYjU1MmEgMTAwNjQ0Ci0tLSBhL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20vdmVjdG9yLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92
ZWN0b3IuaApAQCAtMTEsOCArMTEsMTAgQEAKIAogI2lmZGVmIENPTkZJR19SSVNDVl9JU0FfVgog
CisjaW5jbHVkZSA8bGludXgvc3RyaW5naWZ5Lmg+CiAjaW5jbHVkZSA8YXNtL2h3Y2FwLmg+CiAj
aW5jbHVkZSA8YXNtL2Nzci5oPgorI2luY2x1ZGUgPGFzbS9hc20uaD4KIAogZXh0ZXJuIHVuc2ln
bmVkIGxvbmcgcmlzY3Zfdl92c2l6ZTsKIGludCByaXNjdl92X3NldHVwX3ZzaXplKHZvaWQpOwpA
QCAtMjIsNiArMjQsMjYgQEAgc3RhdGljIF9fYWx3YXlzX2lubGluZSBib29sIGhhc192ZWN0b3Io
dm9pZCkKIAlyZXR1cm4gcmlzY3ZfaGFzX2V4dGVuc2lvbl91bmxpa2VseShSSVNDVl9JU0FfRVhU
X3YpOwogfQogCitzdGF0aWMgaW5saW5lIHZvaWQgX19yaXNjdl92X3ZzdGF0ZV9jbGVhbihzdHJ1
Y3QgcHRfcmVncyAqcmVncykKK3sKKwlyZWdzLT5zdGF0dXMgPSAocmVncy0+c3RhdHVzICYgflNS
X1ZTKSB8IFNSX1ZTX0NMRUFOOworfQorCitzdGF0aWMgaW5saW5lIHZvaWQgcmlzY3Zfdl92c3Rh
dGVfb2ZmKHN0cnVjdCBwdF9yZWdzICpyZWdzKQoreworCXJlZ3MtPnN0YXR1cyA9IChyZWdzLT5z
dGF0dXMgJiB+U1JfVlMpIHwgU1JfVlNfT0ZGOworfQorCitzdGF0aWMgaW5saW5lIHZvaWQgcmlz
Y3Zfdl92c3RhdGVfb24oc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCit7CisJcmVncy0+c3RhdHVzID0g
KHJlZ3MtPnN0YXR1cyAmIH5TUl9WUykgfCBTUl9WU19JTklUSUFMOworfQorCitzdGF0aWMgaW5s
aW5lIGJvb2wgcmlzY3Zfdl92c3RhdGVfcXVlcnkoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCit7CisJ
cmV0dXJuIChyZWdzLT5zdGF0dXMgJiBTUl9WUykgIT0gMDsKK30KKwogc3RhdGljIF9fYWx3YXlz
X2lubGluZSB2b2lkIHJpc2N2X3ZfZW5hYmxlKHZvaWQpCiB7CiAJY3NyX3NldChDU1JfU1NUQVRV
UywgU1JfVlMpOwpAQCAtMzIsMTMgKzU0LDg2IEBAIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9p
ZCByaXNjdl92X2Rpc2FibGUodm9pZCkKIAljc3JfY2xlYXIoQ1NSX1NTVEFUVVMsIFNSX1ZTKTsK
IH0KIAorc3RhdGljIF9fYWx3YXlzX2lubGluZSB2b2lkIF9fdnN0YXRlX2Nzcl9zYXZlKHN0cnVj
dCBfX3Jpc2N2X3ZfZXh0X3N0YXRlICpkZXN0KQoreworCWFzbSB2b2xhdGlsZSAoCisJCSJjc3Jy
CSUwLCAiIF9fc3RyaW5naWZ5KENTUl9WU1RBUlQpICJcblx0IgorCQkiY3NycgklMSwgIiBfX3N0
cmluZ2lmeShDU1JfVlRZUEUpICJcblx0IgorCQkiY3NycgklMiwgIiBfX3N0cmluZ2lmeShDU1Jf
VkwpICJcblx0IgorCQkiY3NycgklMywgIiBfX3N0cmluZ2lmeShDU1JfVkNTUikgIlxuXHQiCisJ
CTogIj1yIiAoZGVzdC0+dnN0YXJ0KSwgIj1yIiAoZGVzdC0+dnR5cGUpLCAiPXIiIChkZXN0LT52
bCksCisJCSAgIj1yIiAoZGVzdC0+dmNzcikgOiA6KTsKK30KKworc3RhdGljIF9fYWx3YXlzX2lu
bGluZSB2b2lkIF9fdnN0YXRlX2Nzcl9yZXN0b3JlKHN0cnVjdCBfX3Jpc2N2X3ZfZXh0X3N0YXRl
ICpzcmMpCit7CisJYXNtIHZvbGF0aWxlICgKKwkJIi5vcHRpb24gcHVzaFxuXHQiCisJCSIub3B0
aW9uIGFyY2gsICt2XG5cdCIKKwkJInZzZXR2bAkgeDAsICUyLCAlMVxuXHQiCisJCSIub3B0aW9u
IHBvcFxuXHQiCisJCSJjc3J3CSIgX19zdHJpbmdpZnkoQ1NSX1ZTVEFSVCkgIiwgJTBcblx0Igor
CQkiY3NydwkiIF9fc3RyaW5naWZ5KENTUl9WQ1NSKSAiLCAlM1xuXHQiCisJCTogOiAiciIgKHNy
Yy0+dnN0YXJ0KSwgInIiIChzcmMtPnZ0eXBlKSwgInIiIChzcmMtPnZsKSwKKwkJICAgICJyIiAo
c3JjLT52Y3NyKSA6KTsKK30KKworc3RhdGljIGlubGluZSB2b2lkIF9fcmlzY3Zfdl92c3RhdGVf
c2F2ZShzdHJ1Y3QgX19yaXNjdl92X2V4dF9zdGF0ZSAqc2F2ZV90bywKKwkJCQkJIHZvaWQgKmRh
dGFwKQoreworCXVuc2lnbmVkIGxvbmcgdmw7CisKKwlyaXNjdl92X2VuYWJsZSgpOworCV9fdnN0
YXRlX2Nzcl9zYXZlKHNhdmVfdG8pOworCWFzbSB2b2xhdGlsZSAoCisJCSIub3B0aW9uIHB1c2hc
blx0IgorCQkiLm9wdGlvbiBhcmNoLCArdlxuXHQiCisJCSJ2c2V0dmxpCSUwLCB4MCwgZTgsIG04
LCB0YSwgbWFcblx0IgorCQkidnNlOC52CQl2MCwgKCUxKVxuXHQiCisJCSJhZGQJCSUxLCAlMSwg
JTBcblx0IgorCQkidnNlOC52CQl2OCwgKCUxKVxuXHQiCisJCSJhZGQJCSUxLCAlMSwgJTBcblx0
IgorCQkidnNlOC52CQl2MTYsICglMSlcblx0IgorCQkiYWRkCQklMSwgJTEsICUwXG5cdCIKKwkJ
InZzZTgudgkJdjI0LCAoJTEpXG5cdCIKKwkJIi5vcHRpb24gcG9wXG5cdCIKKwkJOiAiPSZyIiAo
dmwpIDogInIiIChkYXRhcCkgOiAibWVtb3J5Iik7CisJcmlzY3Zfdl9kaXNhYmxlKCk7Cit9CisK
K3N0YXRpYyBpbmxpbmUgdm9pZCBfX3Jpc2N2X3ZfdnN0YXRlX3Jlc3RvcmUoc3RydWN0IF9fcmlz
Y3Zfdl9leHRfc3RhdGUgKnJlc3RvcmVfZnJvbSwKKwkJCQkJICAgIHZvaWQgKmRhdGFwKQorewor
CXVuc2lnbmVkIGxvbmcgdmw7CisKKwlyaXNjdl92X2VuYWJsZSgpOworCWFzbSB2b2xhdGlsZSAo
CisJCSIub3B0aW9uIHB1c2hcblx0IgorCQkiLm9wdGlvbiBhcmNoLCArdlxuXHQiCisJCSJ2c2V0
dmxpCSUwLCB4MCwgZTgsIG04LCB0YSwgbWFcblx0IgorCQkidmxlOC52CQl2MCwgKCUxKVxuXHQi
CisJCSJhZGQJCSUxLCAlMSwgJTBcblx0IgorCQkidmxlOC52CQl2OCwgKCUxKVxuXHQiCisJCSJh
ZGQJCSUxLCAlMSwgJTBcblx0IgorCQkidmxlOC52CQl2MTYsICglMSlcblx0IgorCQkiYWRkCQkl
MSwgJTEsICUwXG5cdCIKKwkJInZsZTgudgkJdjI0LCAoJTEpXG5cdCIKKwkJIi5vcHRpb24gcG9w
XG5cdCIKKwkJOiAiPSZyIiAodmwpIDogInIiIChkYXRhcCkgOiAibWVtb3J5Iik7CisJX192c3Rh
dGVfY3NyX3Jlc3RvcmUocmVzdG9yZV9mcm9tKTsKKwlyaXNjdl92X2Rpc2FibGUoKTsKK30KKwog
I2Vsc2UgLyogISBDT05GSUdfUklTQ1ZfSVNBX1YgICovCiAKIHN0cnVjdCBwdF9yZWdzOwogCiBz
dGF0aWMgaW5saW5lIGludCByaXNjdl92X3NldHVwX3ZzaXplKHZvaWQpIHsgcmV0dXJuIC1FT1BO
T1RTVVBQOyB9CiBzdGF0aWMgX19hbHdheXNfaW5saW5lIGJvb2wgaGFzX3ZlY3Rvcih2b2lkKSB7
IHJldHVybiBmYWxzZTsgfQorc3RhdGljIGlubGluZSBib29sIHJpc2N2X3ZfdnN0YXRlX3F1ZXJ5
KHN0cnVjdCBwdF9yZWdzICpyZWdzKSB7IHJldHVybiBmYWxzZTsgfQogI2RlZmluZSByaXNjdl92
X3ZzaXplICgwKQorI2RlZmluZSByaXNjdl92X3ZzdGF0ZV9vZmYocmVncykJCWRvIHt9IHdoaWxl
ICgwKQorI2RlZmluZSByaXNjdl92X3ZzdGF0ZV9vbihyZWdzKQkJCWRvIHt9IHdoaWxlICgwKQog
CiAjZW5kaWYgLyogQ09ORklHX1JJU0NWX0lTQV9WICovCiAKZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3YvaW5jbHVkZS91YXBpL2FzbS9wdHJhY2UuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2Fz
bS9wdHJhY2UuaAppbmRleCA4ODI1NDdmNmJkNWMuLjU4Njc4NmQwMjNjNCAxMDA2NDQKLS0tIGEv
YXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL3B0cmFjZS5oCisrKyBiL2FyY2gvcmlzY3YvaW5j
bHVkZS91YXBpL2FzbS9wdHJhY2UuaApAQCAtNzcsNiArNzcsMjMgQEAgdW5pb24gX19yaXNjdl9m
cF9zdGF0ZSB7CiAJc3RydWN0IF9fcmlzY3ZfcV9leHRfc3RhdGUgcTsKIH07CiAKK3N0cnVjdCBf
X3Jpc2N2X3ZfZXh0X3N0YXRlIHsKKwl1bnNpZ25lZCBsb25nIHZzdGFydDsKKwl1bnNpZ25lZCBs
b25nIHZsOworCXVuc2lnbmVkIGxvbmcgdnR5cGU7CisJdW5zaWduZWQgbG9uZyB2Y3NyOworCXZv
aWQgKmRhdGFwOworCS8qCisJICogSW4gc2lnbmFsIGhhbmRsZXIsIGRhdGFwIHdpbGwgYmUgc2V0
IGEgY29ycmVjdCB1c2VyIHN0YWNrIG9mZnNldAorCSAqIGFuZCB2ZWN0b3IgcmVnaXN0ZXJzIHdp
bGwgYmUgY29waWVkIHRvIHRoZSBhZGRyZXNzIG9mIGRhdGFwCisJICogcG9pbnRlci4KKwkgKgor
CSAqIEluIHB0cmFjZSBzeXNjYWxsLCBkYXRhcCB3aWxsIGJlIHNldCB0byB6ZXJvIGFuZCB0aGUg
dmVjdG9yCisJICogcmVnaXN0ZXJzIHdpbGwgYmUgY29waWVkIHRvIHRoZSBhZGRyZXNzIHJpZ2h0
IGFmdGVyIHRoaXMKKwkgKiBzdHJ1Y3R1cmUuCisJICovCit9OworCiAjZW5kaWYgLyogX19BU1NF
TUJMWV9fICovCiAKICNlbmRpZiAvKiBfVUFQSV9BU01fUklTQ1ZfUFRSQUNFX0ggKi8KLS0gCjIu
MTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
