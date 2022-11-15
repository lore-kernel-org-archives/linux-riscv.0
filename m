Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A18DC433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Nov 2022 18:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WaAuGZi7wawM1SgJxwv3dxqDtvdRCJ7rJfTfrSD3Yko=; b=u7DKkMCkO8MdOX
	i69xoil/Zroy0vwERm/TCYwnVmczl3Sm1KQfuvhvn4IKjZAVOPxyM+2CQ4KRVYfclh/oKx2r7dSkN
	hi/g6ZmUYRDNCSAnCvuOFMq9FQ2FZ9mz0gR3ZcBakNkoae9csB+cG06OpyRNts1JzFwSgBGcgWQME
	2z6dfZnjuyk+wslErXMoZJ5isWI3d7AKyC4TkWTEw9bE4lKW31j7JNB+p2Vf8O2O5qC3Y3mUYDsoq
	M0zfcSh/8HryR+vJzEPJMooi1Ux04Hgr2Ne16zwQuzAzAU2HDwtFiB1AROyE0QVyJQk97eUOC//YF
	k6/Z27F3DW2u9aTZ87Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ov0Yj-00Dh84-Cb; Tue, 15 Nov 2022 18:21:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ov0Yg-00Dh7e-Jm
	for linux-riscv@lists.infradead.org; Tue, 15 Nov 2022 18:21:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3074861964;
	Tue, 15 Nov 2022 18:21:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47EF4C433D6;
	Tue, 15 Nov 2022 18:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668536476;
	bh=xWjmq7WiC/F2r5gxXmowNQUk5c/Yd6DQ40WejS4CMrI=;
	h=From:To:Cc:Subject:Date:From;
	b=XV/xHytSXTAxKESi5zLwvm3E3IJevMUxrqXp/puCiUKcgXF2lcIadEpzTwc1Zsddj
	 cg/kvtK17XcMBsBLC5YBGZRrLQjNQUk4mlxuGjgiUfhiPtWxs3BvsdbYJW5wFWbbzC
	 3izeGNv/NU4wRXNAMbPB0U4VdcTewozfarptvttWJvg2B9gUFQp+73bh49nLVlMsuZ
	 sw29JRq8vzVQ/awI8H9J6K5e4mlnb5lDNhXad0D98F1rnWxCJ4Jkkz6XeG3vpDZRss
	 PhOcZ0JCvORYSKuwSjWdoyHQffv6ZuKKcnDl8Du49XKAnWHw/9dNNsae4jMFEkG8q6
	 gcYIVwlkQBUtA==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: bpf@vger.kernel.org,
	Andrii Nakryiko <andrii@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org,
	Anders Roxell <anders.roxell@linaro.org>,
	Mykola Lysenko <mykolal@fb.com>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf 1/2] selftests/bpf: Explicitly pass RESOLVE_BTFIDS to sub-make
Date: Tue, 15 Nov 2022 19:20:50 +0100
Message-Id: <20221115182051.582962-1-bjorn@kernel.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_102118_727847_7B78E2E9 
X-CRM114-Status: GOOD (  11.10  )
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

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKV2hlbiBjcm9zcy1jb21w
aWxpbmcgc2VsZnRlc3RzL2JwZiwgdGhlIHJlc29sdmVfYnRmaWRzIGJpbmFyeSBlbmQgdXAKaW4g
YSBkaWZmZXJlbnQgZGlyZWN0b3J5LCB0aGFuIHRoZSByZWd1bGFyIHJlc29sdmVfYnRmaWRzCmJ1
aWxkcy4gUG9wdWxhdGUgUkVTT0xWRV9CVEZJRFMgZm9yIHN1Yi1tYWtlLCBzbyBpdCBjYW4gZmlu
ZCB0aGUKYmluYXJ5LgoKU2lnbmVkLW9mZi1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3Np
bmMuY29tPgotLS0KIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9NYWtlZmlsZSB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9NYWtlZmlsZSBiL3Rvb2xzL3Rlc3Rpbmcv
c2VsZnRlc3RzL2JwZi9NYWtlZmlsZQppbmRleCBlNmNmMjFmYWQ2OWYuLjhmOGVkZTMwZTk0ZSAx
MDA2NDQKLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL01ha2VmaWxlCisrKyBiL3Rv
b2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9NYWtlZmlsZQpAQCAtMjAwLDcgKzIwMCw3IEBAICQo
T1VUUFVUKS9zaWduLWZpbGU6IC4uLy4uLy4uLy4uL3NjcmlwdHMvc2lnbi1maWxlLmMKICQoT1VU
UFVUKS9icGZfdGVzdG1vZC5rbzogJChWTUxJTlVYX0JURikgJCh3aWxkY2FyZCBicGZfdGVzdG1v
ZC9NYWtlZmlsZSBicGZfdGVzdG1vZC8qLltjaF0pCiAJJChjYWxsIG1zZyxNT0QsLCRAKQogCSQo
USkkKFJNKSBicGZfdGVzdG1vZC9icGZfdGVzdG1vZC5rbyAjIGZvcmNlIHJlLWNvbXBpbGF0aW9u
Ci0JJChRKSQoTUFLRSkgJChzdWJtYWtlX2V4dHJhcykgLUMgYnBmX3Rlc3Rtb2QKKwkkKFEpJChN
QUtFKSAkKHN1Ym1ha2VfZXh0cmFzKSBSRVNPTFZFX0JURklEUz0kKFJFU09MVkVfQlRGSURTKSAt
QyBicGZfdGVzdG1vZAogCSQoUSljcCBicGZfdGVzdG1vZC9icGZfdGVzdG1vZC5rbyAkQAogCiBE
RUZBVUxUX0JQRlRPT0wgOj0gJChIT1NUX1NDUkFUQ0hfRElSKS9zYmluL2JwZnRvb2wKCmJhc2Ut
Y29tbWl0OiA0N2RmOGEyZjc4YmMzNGZmMTcwZDE0N2QwNWIxMjFmODRlMjUyYjg1Ci0tIAoyLjM3
LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
