Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6AD4606A33F
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 21:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HNM1fbWT;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=Q2UhN0Bq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UXkgtouWFeliznrOcQkF0W0S6seSpeGMYi05L46k9E0=; b=HNM1fbWTh7UAhfY2J7wB1AlJuN
	malhJfLS/jZAibzg1iamKQW92oCWGzKd05pslEjNSdz9ivm9ShYr1DjjCpPqJK5GrKoF3N9fYHnTa
	e5lyu1r5YAwO+vaIQXiVys2AR3DOrgheePtkdX//BhbkymIGkj+toqGu9NzmVLyELZ/fiOYmDjYXs
	9+TcMHrSQCZ3n5lzgNgnyjyKloIEAp/q/jKXF+5NftlxssCkOwvpeBPV/TBAK1FBrR8MBmfY6Itmp
	TL98AI7RQUOe1RpQx0nOOS9dwW+papYRnjcpTXO3S8OS+RYYd6BdVKlXBvI9oLCSgEWoAWhrGRthX
	Q0SLpUug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTQIT-000000073yb-2YMS;
	Tue, 17 Nov 2026 21:00:57 +0000
Received: from retz.cirad.fr ([194.199.235.221])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTQIR-000000073xm-0VeU
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 21:00:56 +0000
Received: from retz.cirad.fr (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTPS id 8625820D4EBC;
	Tue, 17 Nov 2026 22:00:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTP id 61AC420D531A;
	Tue, 17 Nov 2026 22:00:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 retz.cirad.fr 61AC420D531A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirad.fr;
	s=573E3878-7916-11F1-BF4B-F68474317960; t=1794949253;
	bh=zKE7LOjuE8R61pXnC7DCd6CJseLuy7O1djF3vybCZY4=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=Q2UhN0BqMcskmlPAPwUW+MBaw+AzXNVySTnUvQ6oBTmeMf+VmYOmzxb0XJMICz2rK
	 rjFthN+4l4sfENBkOB68QY3x9t7dkKrcjh31UF0A6vV73Ah8gDOLmeGxkfLVnDzQvB
	 nqlYDgTd00YTs8i39JN1Nbg3R7kPkdQXDBhgZtQw8cgiyNZiJhgysckjfwBmxzvMFt
	 KvrKLkgDhxhSVR2zKsVqadwSct859IhhQzhF/phsRPdrY0lAKYw/0qb6qrgmv7g/kG
	 jaH/qz4shX0a2nvntmAb0QH6bMvGyauTCSRj4KVEk6wdy+MFg6OaMgE6QdCrgI3YdH
	 F9zSCvK6AWzPg==
X-Virus-Scanned: amavis at retz.cirad.fr
Received: from retz.cirad.fr ([127.0.0.1])
 by localhost (retz.cirad.fr [127.0.0.1]) (amavis, port 10026) with ESMTP
 id NVrKEnwF_wLb; Tue, 17 Nov 2026 22:00:53 +0100 (CET)
Received: from localhost.localdomain (78-196-243-100.subs.proxad.net [78.196.243.100])
	by retz.cirad.fr (Postfix) with ESMTPSA id 3FD6A20D5578;
	Tue, 17 Nov 2026 22:00:52 +0100 (CET)
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
Subject: [PATCH 2/6] clk: spacemit: k1: Keep pll1_aud_245p7 enabled
Date: Tue, 17 Nov 2026 21:59:47 +0100
Message-ID: <20261117205951.140146-3-frederic.mahe@cirad.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117205951.140146-1-frederic.mahe@cirad.fr>
References: <20261117205951.140146-1-frederic.mahe@cirad.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_130055_314409_555260BB 
X-CRM114-Status: UNSURE (   9.12  )
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

QWNjZXNzZXMgdG8gdGhlIFJDUFUyIGJsb2NrICgweGMwODg4MDAwKSBoYW5nIG9uY2UgcGxsMV9h
dWRfMjQ1cDcgaXMKZ2F0ZWQ6IHRoZSBDUFUgc3RvcHMgcmVzcG9uZGluZywgZXZlbiB0byBOTUlz
LiBOb3RoaW5nIGNsYWltcyB0aGlzCmNsb2NrIGluIG1haW5saW5lLCBzbyBjbGtfZGlzYWJsZV91
bnVzZWQoKSB0dXJucyBpdCBvZmYgYXQgYm9vdCwgYW5kCnByb2JpbmcgYW4gUkNQVTIgUFdNIGFm
dGVyd2FyZHMgaGFuZ3MgdGhlIGJvYXJkLiBUaGUgUkNQVTIgY2xvY2sgYW5kCnJlc2V0IHJlZ2lz
dGVycyBsaXZlIGluIHRoZSBzYW1lIGJsb2NrLgoKTWFyayBpdCBjcml0aWNhbCwgYXMgd2FzIGRv
bmUgZm9yIHRoZSBLMyBSQ1BVIGNsb2NrLgoKVGVzdGVkIG9uIGEgQlBJLUYzOiB3aXRob3V0IHRo
aXMsIHByb2JpbmcgYW4gUkNQVTIgUFdNIGhhbmdzIHRoZQpib2FyZDsgd2l0aCBpdCwgbm8gaGFu
ZywgYWxzbyB3aXRoIG5vIFBXTSBpbiB1c2UuCgpXcml0dGVuIHdpdGggaGVscCBmcm9tIENsYXVk
ZSAoQW50aHJvcGljKTsgcmV2aWV3ZWQgYW5kIHRlc3RlZCBvbiBoYXJkd2FyZS4KClNpZ25lZC1v
ZmYtYnk6IEZyw6lkw6lyaWMgTWFow6kgPGZyZWRlcmljLm1haGVAY2lyYWQuZnI+Ci0tLQogZHJp
dmVycy9jbGsvc3BhY2VtaXQvY2N1LWsxLmMgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL3NwYWNl
bWl0L2NjdS1rMS5jIGIvZHJpdmVycy9jbGsvc3BhY2VtaXQvY2N1LWsxLmMKaW5kZXggZGVlMTRk
MjVmLi4zNjQzODhmZjggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvY2xrL3NwYWNlbWl0L2NjdS1rMS5j
CisrKyBiL2RyaXZlcnMvY2xrL3NwYWNlbWl0L2NjdS1rMS5jCkBAIC02MCw3ICs2MCw4IEBAIEND
VV9GQUNUT1JfR0FURV9ERUZJTkUocGxsMV9kMTFfMjIzcDQsIENDVV9QQVJFTlRfSFcocGxsMSks
IEFQQlNfUExMMV9TV0NSMiwgQklUCiBDQ1VfRkFDVE9SX0dBVEVfREVGSU5FKHBsbDFfZDEzXzE4
OSwgQ0NVX1BBUkVOVF9IVyhwbGwxKSwgQVBCU19QTEwxX1NXQ1IyLCBCSVQoMTYpLCAxMywgMSk7
CiBDQ1VfRkFDVE9SX0dBVEVfREVGSU5FKHBsbDFfZDIzXzEwNnA4LCBDQ1VfUEFSRU5UX0hXKHBs
bDEpLCBBUEJTX1BMTDFfU1dDUjIsIEJJVCgyMCksIDIzLCAxKTsKIENDVV9GQUNUT1JfR0FURV9E
RUZJTkUocGxsMV9kNjRfMzhwNCwgQ0NVX1BBUkVOVF9IVyhwbGwxKSwgQVBCU19QTEwxX1NXQ1Iy
LCBCSVQoMCksIDY0LCAxKTsKLUNDVV9GQUNUT1JfR0FURV9ERUZJTkUocGxsMV9hdWRfMjQ1cDcs
IENDVV9QQVJFTlRfSFcocGxsMSksIEFQQlNfUExMMV9TV0NSMiwgQklUKDEwKSwgMTAsIDEpOwor
Q0NVX0ZBQ1RPUl9HQVRFX0ZMQUdTX0RFRklORShwbGwxX2F1ZF8yNDVwNywgQ0NVX1BBUkVOVF9I
VyhwbGwxKSwgQVBCU19QTEwxX1NXQ1IyLCBCSVQoMTApLCAxMCwgMSwKKwkJCSAgICAgQ0xLX0lT
X0NSSVRJQ0FMKTsKIENDVV9GQUNUT1JfR0FURV9ERUZJTkUocGxsMV9hdWRfMjRwNSwgQ0NVX1BB
UkVOVF9IVyhwbGwxKSwgQVBCU19QTEwxX1NXQ1IyLCBCSVQoMTEpLCAxMDAsIDEpOwogCiBDQ1Vf
RkFDVE9SX0dBVEVfREVGSU5FKHBsbDJfZDEsIENDVV9QQVJFTlRfSFcocGxsMiksIEFQQlNfUExM
Ml9TV0NSMiwgQklUKDApLCAxLCAxKTsKLS0gCjIuNDcuMwoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
