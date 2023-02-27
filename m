Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA30C64ED6
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Feb 2023 04:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FhMTHztLSxGV5i/9HZNj/hQq45du3YcySsYr/UgQdQE=; b=0TeU+OUGxMGRKF
	YqfsjR8lSrooClqH7EBVahrWKpPZAgZF+UgVcj+CarS280f29KM7ZfWoEh04owTzcgIbBPPa1UZqM
	0X8XY/Fi3mJy7WRpyg7LbdnwEriNUArPnYSOkQfqL5jSTvcCcefispzWkzLk5NuFEVk7VrcIVI0pC
	4YRVqFspnTUjexGOF9c/NPIvqGHUjau1TI1Qksow+TUEhE8o55mPb6QwZFBblvGzRz223f9w0WMH0
	h5oHWP8iWUQ1dlhnxn5tqZJmL7ASKtiC7qHgA6Xg8zpYULXt/VIL7Xus4Fy/ALM3jynHk2ub3sEye
	sDP0ZECPr7/mqHOAKf8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWUiY-008PF7-Kq; Mon, 27 Feb 2023 04:02:26 +0000
Received: from [2601:1c2:980:9ec0::df2f] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWUiU-008PEf-VI; Mon, 27 Feb 2023 04:02:23 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	kernel test robot <lkp@intel.com>,
	Pu Lehui <pulehui@huawei.com>,
	Luke Nelson <luke.r.nels@gmail.com>,
	Xi Wang <xi.wang@gmail.com>,
	bpf@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	linux-riscv@lists.infradead.org
Subject: [PATCH bpf-next] riscv, bpf: fix patch_text implicit declaration
Date: Sun, 26 Feb 2023 20:02:21 -0800
Message-Id: <20230227040221.15442-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
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

YnBmX2ppdF9jb21wNjQuYyB1c2VzIHBhdGNoX3RleHQoKSwgc28gYWRkIGl0IHRvIGEgbG9jYWwg
aGVhZGVyIGZpbGUKdG8gcHJldmVudCB0aGUgYnVpbGQgZXJyb3I6CgouLi9hcmNoL3Jpc2N2L25l
dC9icGZfaml0X2NvbXA2NC5jOiBJbiBmdW5jdGlvbiAnYnBmX2FyY2hfdGV4dF9wb2tlJzoKLi4v
YXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYzo2OTE6MjM6IGVycm9yOiBpbXBsaWNpdCBk
ZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiAncGF0Y2hfdGV4dCc7IGRpZCB5b3UgbWVhbiAncGF0aF9n
ZXQnPyBbLVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KICA2OTEgfCAgICAg
ICAgICAgICAgICAgcmV0ID0gcGF0Y2hfdGV4dChpcCwgbmV3X2luc25zLCBuaW5zbnMpOwogICAg
ICB8ICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+CgpGaXhlczogNTk2ZjJlNmY5Y2Y0
ICgicmlzY3YsIGJwZjogQWRkIGJwZl9hcmNoX3RleHRfcG9rZSBzdXBwb3J0IGZvciBSVjY0IikK
U2lnbmVkLW9mZi1ieTogUmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+ClJlcG9y
dGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KTGluazogaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvci8yMDIzMDIyNzEwMDAuQWo0bk1YYlotbGtwQGludGVsLmNvbQpDYzog
UHUgTGVodWkgPHB1bGVodWlAaHVhd2VpLmNvbT4KQ2M6IEx1a2UgTmVsc29uIDxsdWtlLnIubmVs
c0BnbWFpbC5jb20+CkNjOiBYaSBXYW5nIDx4aS53YW5nQGdtYWlsLmNvbT4KQ2M6IGJwZkB2Z2Vy
Lmtlcm5lbC5vcmcKQ2M6IEFsZXhlaSBTdGFyb3ZvaXRvdiA8YXN0QGtlcm5lbC5vcmc+CkNjOiBE
YW5pZWwgQm9ya21hbm4gPGRhbmllbEBpb2dlYXJib3gubmV0PgpDYzogSm9obiBGYXN0YWJlbmQg
PGpvaG4uZmFzdGFiZW5kQGdtYWlsLmNvbT4KQ2M6IEFuZHJpaSBOYWtyeWlrbyA8YW5kcmlpQGtl
cm5lbC5vcmc+CkNjOiBQYXVsIFdhbG1zbGV5IDxwYXVsLndhbG1zbGV5QHNpZml2ZS5jb20+CkNj
OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQGRhYmJlbHQuY29tPgpDYzogQWxiZXJ0IE91IDxhb3VA
ZWVjcy5iZXJrZWxleS5lZHU+CkNjOiAiQmrDtnJuIFTDtnBlbCIgPGJqb3JuQGtlcm5lbC5vcmc+
CkNjOiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCi0tLQpXaGF0IGlzIHRoZSBwcm9w
ZXIgcGF0aCB0byBoYXZlIHRoaXMgbWVyZ2VkIHNvb24gdG8gc3RvcCBidWlsZAplcnJvcnM/Cgog
YXJjaC9yaXNjdi9uZXQvYnBmX2ppdC5oIHwgICAgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKykKCmRpZmYgLS0gYS9hcmNoL3Jpc2N2L25ldC9icGZfaml0LmggYi9hcmNoL3Jpc2N2
L25ldC9icGZfaml0LmgKLS0tIGEvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdC5oCisrKyBiL2FyY2gv
cmlzY3YvbmV0L2JwZl9qaXQuaApAQCAtMTIsNiArMTIsNyBAQAogI2luY2x1ZGUgPGxpbnV4L2Jw
Zi5oPgogI2luY2x1ZGUgPGxpbnV4L2ZpbHRlci5oPgogI2luY2x1ZGUgPGFzbS9jYWNoZWZsdXNo
Lmg+CisjaW5jbHVkZSA8YXNtL3BhdGNoLmg+CiAKIHN0YXRpYyBpbmxpbmUgYm9vbCBydmNfZW5h
YmxlZCh2b2lkKQogewoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
