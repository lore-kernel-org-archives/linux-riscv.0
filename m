Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0824AC7EE24
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Jun 2023 08:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TEEwn1LJGVwGy5euOdPNu6e+ayAsjeEaZBUeK21qtR4=; b=v6tBiiUIoJ9TGr
	5rAfqyK30+Qctm0NIybrWd8ddLak9sUeynYtY2jKRvic6OI9z6ySJzMBVQUrcCwyKkzZazl5E8M3D
	rv9ql8vXnDAo89KiGzGX3+PH6Ct/0NXbXerW6HK8hW7gOgDzcPPCui2kqGmnIC/Y6t19vZQ8RSTe7
	rHc3nMzPD7vl5OxSL5h/mudEBKGWaUMvUHdsTzd2dfdoGxaXtwEeeWg5YhTYlw26ph88MKbV+LxIP
	Y16zJvPOO3+oZMrufMXjNqQyRNFWj9ZMtvZJs7N/eK9TdYRIhN2mOxt17p+jZwFS9vsle8pq3lZWe
	5hesOu4cgru9WKzWrrdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5MCL-0092kB-14;
	Sat, 03 Jun 2023 08:01:17 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5MCI-0092if-0z
	for linux-riscv@lists.infradead.org;
	Sat, 03 Jun 2023 08:01:15 +0000
X-QQ-mid: bizesmtp66t1685779256tfrhwl1v
Received: from linux-lab-host.localdomain ( [119.123.130.226])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 03 Jun 2023 16:00:55 +0800 (CST)
X-QQ-SSF: 00200000000000D0V000000A0000000
X-QQ-FEAT: k0mQ4ihyJQNgkVwygW0yshuGkeM5gEbPP6qD3JPq1MQNFpbusU7tTU0lbB22l
	A/5UcKnooUQIfO7IdU6An49Ew/yF6sQud/gbxCL4QnanhGzK5jwDlyfGoBThAEWl768oPaN
	eBs1jfQtfGszTLv2Ika597BM+IvXXcun0tPnrU6tHzcRc2UZUueBk6bih+duFmLswS5oeaG
	vFxXt7CE38Pel27vLsN2UsJz//tO/rgvA+hJSXSRHAQTde1zwQCX9o42qUvx0BGe+Zs2U5Z
	2CNFuUUZWezBEgy6ORi06eutXif6JZYh+Pnlp3AnWar+2IW0xvGRO9ed1T643iOLM4zGfFm
	dF/cgTkjCgfOoncc6p43EE+tkxQsdBQsYmRC9NXrF1fNybD8O6YFpEQI/CODCNYAvg059yP
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13312987647065387357
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: [PATCH v3 01/12] selftests/nolibc: syscall_args: use generic __NR_statx
Date: Sat,  3 Jun 2023 16:00:46 +0800
Message-Id: <d61b1251af808b91f79f49e5b9a773141aa86eaf.1685777982.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1685777982.git.falcon@tinylab.org>
References: <cover.1685777982.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230603_010114_646651_D361BA68 
X-CRM114-Status: GOOD (  11.97  )
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

Q29tcGlsaW5nIG5vbGliYy10ZXN0LmMgZm9yIHJ2MzIgZ290IHN1Y2ggZXJyb3I6CgogICAgdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMvbm9saWJjL25vbGliYy10ZXN0LmM6NTk5OjU3OiBlcnJvcjog
4oCYX19OUl9mc3RhdOKAmSB1bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4gdGhpcyBmdW5jdGlvbikK
ICAgICAgNTk5IHwgICBDQVNFX1RFU1Qoc3lzY2FsbF9hcmdzKTsgICAgICBFWFBFQ1RfU1lTRVIo
MSwgc3lzY2FsbChfX05SX2ZzdGF0LCAwLCBOVUxMKSwgLTEsIEVGQVVMVCk7IGJyZWFrOwoKVGhl
IGdlbmVyaWMgaW5jbHVkZS91YXBpL2FzbS1nZW5lcmljL3VuaXN0ZC5oIHVzZWQgYnkgcnYzMiBk
b2Vzbid0CnN1cHBvcnQgX19OUl9mc3RhdCwgdXNlIHRoZSBtb3JlIGdlbmVyaWMgX19OUl9zdGF0
eCBpbnN0ZWFkOgoKICAgIFJ1bm5pbmcgdGVzdCAnc3lzY2FsbCcKICAgIDY5IHN5c2NhbGxfbm9h
cmdzID0gMSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgW09LXQog
ICAgNzAgc3lzY2FsbF9hcmdzID0gLTEgRUZBVUxUICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBbT0tdCgpfX05SX3N0YXR4IGhhcyBiZWVuIGFkZGVkIGZyb20gdjQuMTA6Cgog
ICAgY29tbWl0IGE1MjhkMzVlOGJmYyAoInN0YXR4OiBBZGQgYSBzeXN0ZW0gY2FsbCB0byBtYWtl
IGVuaGFuY2VkIGZpbGUgaW5mbyBhdmFpbGFibGUiKQoKSXQgaGFzIGJlZW4gc3VwcG9ydGVkIGJ5
IGFsbCBvZiB0aGUgcGxhdGZvcm1zIHNpbmNlIGF0IGxlYXN0IGZyb20gdjQuMjAuCgpGaXhlczog
OGUzYWI1MjliZWY5ICgidG9vbHMvbm9saWJjL3VuaXN0ZDogYWRkIHN5c2NhbGwoKSIpClN1Z2dl
c3RlZC1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KTGluazogaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvbGludXgtcmlzY3YvZWU4YjFmMDItZGVkMS00ODhiLWEzYTUtNjg3NzRmMDM0
OWI1QGFwcC5mYXN0bWFpbC5jb20vClNpZ25lZC1vZmYtYnk6IFpoYW5namluIFd1IDxmYWxjb25A
dGlueWxhYi5vcmc+Ci0tLQogdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbm9saWJjL25vbGliYy10
ZXN0LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9ub2xpYmMvbm9saWJjLXRl
c3QuYyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25vbGliYy9ub2xpYmMtdGVzdC5jCmluZGV4
IDdkZTQ2MzA1ZjQxOS4uZDQxN2NhNWQ5NzZmIDEwMDY0NAotLS0gYS90b29scy90ZXN0aW5nL3Nl
bGZ0ZXN0cy9ub2xpYmMvbm9saWJjLXRlc3QuYworKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0
cy9ub2xpYmMvbm9saWJjLXRlc3QuYwpAQCAtNjIxLDcgKzYyMSw3IEBAIGludCBydW5fc3lzY2Fs
bChpbnQgbWluLCBpbnQgbWF4KQogCQlDQVNFX1RFU1Qod3JpdGVfYmFkZik7ICAgICAgICBFWFBF
Q1RfU1lTRVIoMSwgd3JpdGUoLTEsICZ0bXAsIDEpLCAtMSwgRUJBREYpOyBicmVhazsKIAkJQ0FT
RV9URVNUKHdyaXRlX3plcm8pOyAgICAgICAgRVhQRUNUX1NZU1pSKDEsIHdyaXRlKDEsICZ0bXAs
IDApKTsgYnJlYWs7CiAJCUNBU0VfVEVTVChzeXNjYWxsX25vYXJncyk7ICAgIEVYUEVDVF9TWVNF
USgxLCBzeXNjYWxsKF9fTlJfZ2V0cGlkKSwgZ2V0cGlkKCkpOyBicmVhazsKLQkJQ0FTRV9URVNU
KHN5c2NhbGxfYXJncyk7ICAgICAgRVhQRUNUX1NZU0VSKDEsIHN5c2NhbGwoX19OUl9mc3RhdCwg
MCwgTlVMTCksIC0xLCBFRkFVTFQpOyBicmVhazsKKwkJQ0FTRV9URVNUKHN5c2NhbGxfYXJncyk7
ICAgICAgRVhQRUNUX1NZU0VSKDEsIHN5c2NhbGwoX19OUl9zdGF0eCwgMCwgTlVMTCwgMCwgMCwg
TlVMTCksIC0xLCBFRkFVTFQpOyBicmVhazsKIAkJY2FzZSBfX0xJTkVfXzoKIAkJCXJldHVybiBy
ZXQ7IC8qIG11c3QgYmUgbGFzdCAqLwogCQkvKiBub3RlOiBkbyBub3Qgc2V0IGFueSBkZWZhdWx0
cyBzbyBhcyB0byBwZXJtaXQgaG9sZXMgYWJvdmUgKi8KLS0gCjIuMjUuMQoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
