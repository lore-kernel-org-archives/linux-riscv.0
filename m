Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94760C7EE2E
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Feb 2023 07:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ExRt2RMQBRRf71Ldm3T4PTYB3E/G7arVFcpqNew8frI=; b=OCVNdZn/KMyV5H
	V+PGmfvW+1lUT1Z9u6bjWLt7+0LcRAaagskB1W9AL2H6YIu0Be4qu8s2BKx0jKZ3qpSVh25anHtLr
	I1v5oVnfY/RRHry42+xMQS3rhTvl47dk0kp7TTK7Xf0xAqrwwakh24+xIVuB+UBSYjnAZmHMvwnvx
	zk6j7mxhE1BThVY0pN9JLnGnpbhL7/zTtarBWCe0ofko234FhnpL5bqYODsGrvDmQ+7uSYIjhPCtj
	021wIcVPWx1WWSiu23abI64PErOI8zQwuQRcBzwCv12BbM/CjHt+izpTZs4Ht9jCy5Cn/K66Ohdl5
	X/alj8g+3yU90OsNj6ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWXo3-008etN-QF; Mon, 27 Feb 2023 07:20:19 +0000
Received: from [2601:1c2:980:9ec0::df2f] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWXo1-008esp-Hx; Mon, 27 Feb 2023 07:20:17 +0000
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
Subject: [PATCH bpf v2] riscv, bpf: fix patch_text implicit declaration
Date: Sun, 26 Feb 2023 23:20:16 -0800
Message-Id: <20230227072016.14618-1-rdunlap@infradead.org>
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

YnBmX2ppdF9jb21wNjQuYyB1c2VzIHBhdGNoX3RleHQoKSwgc28gYWRkIDxhc20vcGF0Y2guaD4g
dG8gaXQKdG8gcHJldmVudCB0aGUgYnVpbGQgZXJyb3I6CgouLi9hcmNoL3Jpc2N2L25ldC9icGZf
aml0X2NvbXA2NC5jOiBJbiBmdW5jdGlvbiAnYnBmX2FyY2hfdGV4dF9wb2tlJzoKLi4vYXJjaC9y
aXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYzo2OTE6MjM6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJh
dGlvbiBvZiBmdW5jdGlvbiAncGF0Y2hfdGV4dCc7IGRpZCB5b3UgbWVhbiAncGF0aF9nZXQnPyBb
LVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KICA2OTEgfCAgICAgICAgICAg
ICAgICAgcmV0ID0gcGF0Y2hfdGV4dChpcCwgbmV3X2luc25zLCBuaW5zbnMpOwogICAgICB8ICAg
ICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+CgpGaXhlczogNTk2ZjJlNmY5Y2Y0ICgicmlz
Y3YsIGJwZjogQWRkIGJwZl9hcmNoX3RleHRfcG9rZSBzdXBwb3J0IGZvciBSVjY0IikKU2lnbmVk
LW9mZi1ieTogUmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+ClJlcG9ydGVkLWJ5
OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KTGluazogaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvci8yMDIzMDIyNzEwMDAuQWo0bk1YYlotbGtwQGludGVsLmNvbQpDYzogUHUgTGVo
dWkgPHB1bGVodWlAaHVhd2VpLmNvbT4KQ2M6IEx1a2UgTmVsc29uIDxsdWtlLnIubmVsc0BnbWFp
bC5jb20+CkNjOiBYaSBXYW5nIDx4aS53YW5nQGdtYWlsLmNvbT4KQ2M6IGJwZkB2Z2VyLmtlcm5l
bC5vcmcKQ2M6IEFsZXhlaSBTdGFyb3ZvaXRvdiA8YXN0QGtlcm5lbC5vcmc+CkNjOiBEYW5pZWwg
Qm9ya21hbm4gPGRhbmllbEBpb2dlYXJib3gubmV0PgpDYzogSm9obiBGYXN0YWJlbmQgPGpvaG4u
ZmFzdGFiZW5kQGdtYWlsLmNvbT4KQ2M6IEFuZHJpaSBOYWtyeWlrbyA8YW5kcmlpQGtlcm5lbC5v
cmc+CkNjOiBQYXVsIFdhbG1zbGV5IDxwYXVsLndhbG1zbGV5QHNpZml2ZS5jb20+CkNjOiBQYWxt
ZXIgRGFiYmVsdCA8cGFsbWVyQGRhYmJlbHQuY29tPgpDYzogQWxiZXJ0IE91IDxhb3VAZWVjcy5i
ZXJrZWxleS5lZHU+CkNjOiAiQmrDtnJuIFTDtnBlbCIgPGJqb3JuQGtlcm5lbC5vcmc+CkNjOiBs
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCi0tLQp2MjogYWRkIGhlYWRlciBmaWxlIGRp
cmVjdGx5IHRvIGJwZl9qaXRfY29tcDY0LmMgKFB1IExlaHVpKQogICAgY2hhbmdlIHBhdGNoIHRh
cmdldCB0byBicGYgKGZvciBmaXhlcykKCiBhcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5j
IHwgICAgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS0gYS9hcmNo
L3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jIGIvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21w
NjQuYwotLS0gYS9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jCisrKyBiL2FyY2gvcmlz
Y3YvbmV0L2JwZl9qaXRfY29tcDY0LmMKQEAgLTEwLDYgKzEwLDcgQEAKICNpbmNsdWRlIDxsaW51
eC9maWx0ZXIuaD4KICNpbmNsdWRlIDxsaW51eC9tZW1vcnkuaD4KICNpbmNsdWRlIDxsaW51eC9z
dG9wX21hY2hpbmUuaD4KKyNpbmNsdWRlIDxhc20vcGF0Y2guaD4KICNpbmNsdWRlICJicGZfaml0
LmgiCiAKICNkZWZpbmUgUlZfUkVHX1RDQyBSVl9SRUdfQTYKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
