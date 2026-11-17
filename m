Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48164606A31C
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 21:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rWEWN4jB;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=Xycq8THx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xoVB8yS1ObMiMjCy0cjPelvNiELmOAT+JLalPqgUxjk=; b=rWEWN4jB48BO6ie0wG3+u8Yq2n
	apOQY6ToVYxpIn48Jm8rmPHDuEVgIpItk0yGCaf7XqnaQO0Qusj4e+JbJWA9ne1JMctsbQ3Y24l8P
	Od9Tq+Ul+VxctuNdcj/jsC1fnxBN/fPekIE9ZyRdKsUgjvE4PGb+bh7lps4rxbhs8QhfiZKLgknTz
	sXDoKhL2dZ4pckjQ5M5CRtUx8GblPuo7lsZnhkPXsubK+Urjuhzyh1EH+bHj0C0X9/7Xwkbk/hJ9a
	VPzUrr6uP8vJIBg8pUzrHuJ/6hyttJaaPG+gHXgQ8YMfS7XotA4Ee6ZsxXx9M6VSWDGg/qAnKHoBH
	PHLXKssw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTQIY-00000007431-3K5k;
	Tue, 17 Nov 2026 21:01:02 +0000
Received: from retz.cirad.fr ([194.199.235.221])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTQIV-000000073zR-3ROg
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 21:01:01 +0000
Received: from retz.cirad.fr (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTPS id 3F0B120D557C;
	Tue, 17 Nov 2026 22:00:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTP id 1E66520D4EBD;
	Tue, 17 Nov 2026 22:00:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 retz.cirad.fr 1E66520D4EBD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirad.fr;
	s=573E3878-7916-11F1-BF4B-F68474317960; t=1794949258;
	bh=mS8VJ60KbJ7B3GE2mbAaQevEqhL/UeJY3gNnsa1WmB8=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=Xycq8THxrxJ+E8r+YRoMrPY1u1DelbY1f+i0cHx5gHBoLTtBaNwD0vx4jXhugdW9m
	 gOqtmI2netarfeK7iyJvs2paMu0iW9228VN/u+bJWXrF5aH2XAXEySJcB5yZDk+1Dh
	 okVc4KpetSCj9o1CkryDDkr7wol9/pd5H6QQ8Nrj+n89PpFRAN94mUjnTG1DkwKeUJ
	 oqAR/1YoI581ye+CwJg1745MSvG5zYeF0jWKhG+RNLQlQ+nSXNCF8hKFtrXquU9Ntz
	 QxiO7qD6cGLggkxHBHq2upfV1VjSotKPM7R070aBhAinqs5jouApjB/VWE7bhKGeiu
	 H1fiy1hxzjb5g==
X-Virus-Scanned: amavis at retz.cirad.fr
Received: from retz.cirad.fr ([127.0.0.1])
 by localhost (retz.cirad.fr [127.0.0.1]) (amavis, port 10026) with ESMTP
 id 7dw6BMPIIR3a; Tue, 17 Nov 2026 22:00:58 +0100 (CET)
Received: from localhost.localdomain (78-196-243-100.subs.proxad.net [78.196.243.100])
	by retz.cirad.fr (Postfix) with ESMTPSA id D75C120D557C;
	Tue, 17 Nov 2026 22:00:56 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
To: Stephen Boyd <sboyd@kernel.org>,
	Yixun Lan <dlan@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.co>,
	Haylen Chu <heylenay@4d2.org>,
	Hung-Chun Tseng <alan.tseng.cs@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
Subject: [PATCH 4/6] riscv: dts: spacemit: k1: Add RCPU2 PWM nodes
Date: Tue, 17 Nov 2026 21:59:49 +0100
Message-ID: <20261117205951.140146-5-frederic.mahe@cirad.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117205951.140146-1-frederic.mahe@cirad.fr>
References: <20261117205951.140146-1-frederic.mahe@cirad.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_130100_015419_206A6271 
X-CRM114-Status: UNSURE (   7.93  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

QWRkIHRoZSB0ZW4gUFdNIGNvbnRyb2xsZXJzIG9mIHRoZSBSQ1BVMiBibG9jaywgYW5kIG1ha2Ug
dGhlIFJDUFUyCnN5c3RlbSBjb250cm9sbGVyIGEgY2xvY2sgcHJvdmlkZXIgZm9yIHRoZW0uCgpX
cml0dGVuIHdpdGggaGVscCBmcm9tIENsYXVkZSAoQW50aHJvcGljKTsgcmV2aWV3ZWQgYW5kIHRl
c3RlZCBvbiBoYXJkd2FyZS4KClNpZ25lZC1vZmYtYnk6IEZyw6lkw6lyaWMgTWFow6kgPGZyZWRl
cmljLm1haGVAY2lyYWQuZnI+Ci0tLQogYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS5k
dHNpIHwgOTEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDkx
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0
L2sxLmR0c2kgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLmR0c2kKaW5kZXggNTQy
YmZjMGQxLi4zMzM5ZmY1NmMgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2Vt
aXQvazEuZHRzaQorKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLmR0c2kKQEAg
LTQ1Niw5ICs0NTYsMTAwIEBAIHN5c2Nvbl9yY3B1OiBzeXN0ZW0tY29udHJvbGxlckBjMDg4MDAw
MCB7CiAJCXN5c2Nvbl9yY3B1Mjogc3lzdGVtLWNvbnRyb2xsZXJAYzA4ODgwMDAgewogCQkJY29t
cGF0aWJsZSA9ICJzcGFjZW1pdCxrMS1zeXNjb24tcmNwdTIiOwogCQkJcmVnID0gPDB4MCAweGMw
ODg4MDAwIDB4MCAweDI4PjsKKwkJCSNjbG9jay1jZWxscyA9IDwxPjsKIAkJCSNyZXNldC1jZWxs
cyA9IDwxPjsKIAkJfTsKIAorCQlycHdtMDogcHdtQGMwODg4MTAwIHsKKwkJCWNvbXBhdGlibGUg
PSAic3BhY2VtaXQsazEtcHdtIiwgIm1hcnZlbGwscHhhOTEwLXB3bSI7CisJCQlyZWcgPSA8MHgw
IDB4YzA4ODgxMDAgMHgwIDB4MTA+OworCQkJI3B3bS1jZWxscyA9IDwzPjsKKwkJCWNsb2NrcyA9
IDwmc3lzY29uX3JjcHUyIENMS19SQ1BVMl9QV00wPjsKKwkJCXJlc2V0cyA9IDwmc3lzY29uX3Jj
cHUyIFJFU0VUX1JDUFUyX1BXTTA+OworCQkJc3RhdHVzID0gImRpc2FibGVkIjsKKwkJfTsKKwor
CQlycHdtMTogcHdtQGMwODg4MjAwIHsKKwkJCWNvbXBhdGlibGUgPSAic3BhY2VtaXQsazEtcHdt
IiwgIm1hcnZlbGwscHhhOTEwLXB3bSI7CisJCQlyZWcgPSA8MHgwIDB4YzA4ODgyMDAgMHgwIDB4
MTA+OworCQkJI3B3bS1jZWxscyA9IDwzPjsKKwkJCWNsb2NrcyA9IDwmc3lzY29uX3JjcHUyIENM
S19SQ1BVMl9QV00xPjsKKwkJCXJlc2V0cyA9IDwmc3lzY29uX3JjcHUyIFJFU0VUX1JDUFUyX1BX
TTE+OworCQkJc3RhdHVzID0gImRpc2FibGVkIjsKKwkJfTsKKworCQlycHdtMjogcHdtQGMwODg4
MzAwIHsKKwkJCWNvbXBhdGlibGUgPSAic3BhY2VtaXQsazEtcHdtIiwgIm1hcnZlbGwscHhhOTEw
LXB3bSI7CisJCQlyZWcgPSA8MHgwIDB4YzA4ODgzMDAgMHgwIDB4MTA+OworCQkJI3B3bS1jZWxs
cyA9IDwzPjsKKwkJCWNsb2NrcyA9IDwmc3lzY29uX3JjcHUyIENMS19SQ1BVMl9QV00yPjsKKwkJ
CXJlc2V0cyA9IDwmc3lzY29uX3JjcHUyIFJFU0VUX1JDUFUyX1BXTTI+OworCQkJc3RhdHVzID0g
ImRpc2FibGVkIjsKKwkJfTsKKworCQlycHdtMzogcHdtQGMwODg4NDAwIHsKKwkJCWNvbXBhdGli
bGUgPSAic3BhY2VtaXQsazEtcHdtIiwgIm1hcnZlbGwscHhhOTEwLXB3bSI7CisJCQlyZWcgPSA8
MHgwIDB4YzA4ODg0MDAgMHgwIDB4MTA+OworCQkJI3B3bS1jZWxscyA9IDwzPjsKKwkJCWNsb2Nr
cyA9IDwmc3lzY29uX3JjcHUyIENMS19SQ1BVMl9QV00zPjsKKwkJCXJlc2V0cyA9IDwmc3lzY29u
X3JjcHUyIFJFU0VUX1JDUFUyX1BXTTM+OworCQkJc3RhdHVzID0gImRpc2FibGVkIjsKKwkJfTsK
KworCQlycHdtNDogcHdtQGMwODg4NTAwIHsKKwkJCWNvbXBhdGlibGUgPSAic3BhY2VtaXQsazEt
cHdtIiwgIm1hcnZlbGwscHhhOTEwLXB3bSI7CisJCQlyZWcgPSA8MHgwIDB4YzA4ODg1MDAgMHgw
IDB4MTA+OworCQkJI3B3bS1jZWxscyA9IDwzPjsKKwkJCWNsb2NrcyA9IDwmc3lzY29uX3JjcHUy
IENMS19SQ1BVMl9QV000PjsKKwkJCXJlc2V0cyA9IDwmc3lzY29uX3JjcHUyIFJFU0VUX1JDUFUy
X1BXTTQ+OworCQkJc3RhdHVzID0gImRpc2FibGVkIjsKKwkJfTsKKworCQlycHdtNTogcHdtQGMw
ODg4NjAwIHsKKwkJCWNvbXBhdGlibGUgPSAic3BhY2VtaXQsazEtcHdtIiwgIm1hcnZlbGwscHhh
OTEwLXB3bSI7CisJCQlyZWcgPSA8MHgwIDB4YzA4ODg2MDAgMHgwIDB4MTA+OworCQkJI3B3bS1j
ZWxscyA9IDwzPjsKKwkJCWNsb2NrcyA9IDwmc3lzY29uX3JjcHUyIENMS19SQ1BVMl9QV001PjsK
KwkJCXJlc2V0cyA9IDwmc3lzY29uX3JjcHUyIFJFU0VUX1JDUFUyX1BXTTU+OworCQkJc3RhdHVz
ID0gImRpc2FibGVkIjsKKwkJfTsKKworCQlycHdtNjogcHdtQGMwODg4NzAwIHsKKwkJCWNvbXBh
dGlibGUgPSAic3BhY2VtaXQsazEtcHdtIiwgIm1hcnZlbGwscHhhOTEwLXB3bSI7CisJCQlyZWcg
PSA8MHgwIDB4YzA4ODg3MDAgMHgwIDB4MTA+OworCQkJI3B3bS1jZWxscyA9IDwzPjsKKwkJCWNs
b2NrcyA9IDwmc3lzY29uX3JjcHUyIENMS19SQ1BVMl9QV002PjsKKwkJCXJlc2V0cyA9IDwmc3lz
Y29uX3JjcHUyIFJFU0VUX1JDUFUyX1BXTTY+OworCQkJc3RhdHVzID0gImRpc2FibGVkIjsKKwkJ
fTsKKworCQlycHdtNzogcHdtQGMwODg4ODAwIHsKKwkJCWNvbXBhdGlibGUgPSAic3BhY2VtaXQs
azEtcHdtIiwgIm1hcnZlbGwscHhhOTEwLXB3bSI7CisJCQlyZWcgPSA8MHgwIDB4YzA4ODg4MDAg
MHgwIDB4MTA+OworCQkJI3B3bS1jZWxscyA9IDwzPjsKKwkJCWNsb2NrcyA9IDwmc3lzY29uX3Jj
cHUyIENMS19SQ1BVMl9QV003PjsKKwkJCXJlc2V0cyA9IDwmc3lzY29uX3JjcHUyIFJFU0VUX1JD
UFUyX1BXTTc+OworCQkJc3RhdHVzID0gImRpc2FibGVkIjsKKwkJfTsKKworCQlycHdtODogcHdt
QGMwODg4OTAwIHsKKwkJCWNvbXBhdGlibGUgPSAic3BhY2VtaXQsazEtcHdtIiwgIm1hcnZlbGws
cHhhOTEwLXB3bSI7CisJCQlyZWcgPSA8MHgwIDB4YzA4ODg5MDAgMHgwIDB4MTA+OworCQkJI3B3
bS1jZWxscyA9IDwzPjsKKwkJCWNsb2NrcyA9IDwmc3lzY29uX3JjcHUyIENMS19SQ1BVMl9QV004
PjsKKwkJCXJlc2V0cyA9IDwmc3lzY29uX3JjcHUyIFJFU0VUX1JDUFUyX1BXTTg+OworCQkJc3Rh
dHVzID0gImRpc2FibGVkIjsKKwkJfTsKKworCQlycHdtOTogcHdtQGMwODg4YTAwIHsKKwkJCWNv
bXBhdGlibGUgPSAic3BhY2VtaXQsazEtcHdtIiwgIm1hcnZlbGwscHhhOTEwLXB3bSI7CisJCQly
ZWcgPSA8MHgwIDB4YzA4ODhhMDAgMHgwIDB4MTA+OworCQkJI3B3bS1jZWxscyA9IDwzPjsKKwkJ
CWNsb2NrcyA9IDwmc3lzY29uX3JjcHUyIENMS19SQ1BVMl9QV005PjsKKwkJCXJlc2V0cyA9IDwm
c3lzY29uX3JjcHUyIFJFU0VUX1JDUFUyX1BXTTk+OworCQkJc3RhdHVzID0gImRpc2FibGVkIjsK
KwkJfTsKKwogCQl1c2JwaHkyOiBwaHlAYzBhMzAwMDAgewogCQkJY29tcGF0aWJsZSA9ICJzcGFj
ZW1pdCxrMS11c2IyLXBoeSI7CiAJCQlyZWcgPSA8MHgwIDB4YzBhMzAwMDAgMHgwIDB4MjAwPjsK
LS0gCjIuNDcuMwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
