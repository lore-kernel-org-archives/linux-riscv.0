Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B5D606A331
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 07:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aGuS5iP/;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=BA+bFgOL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZYL2hfukUCgqZ+HfAIEUfu6AmmFPbvE2V/fsxibXixw=; b=aGuS5iP/XjkxhzXlYw0efp0NBg
	nnCPoOa23q7yjrvWg0A5JOZF+u/WN6v3ii9ze4CYcv6DRaFTLzbqfPNYt6jTV/9Ls7WxgvC31Zq2y
	jUbp0xHzzDK2LrnVB+DjBF318BBz/4AFt6Qle5Yxr7/V3zi0cKpryTR+ZAVekYMydJ8to521WtVVC
	Q33VwOBH4NMwFtpqdIvQFnO3ujKUC2QPPUgOqPXaIRb+5i6Ha/C14KHdxExgEoz01j8yqrYIf9+y+
	HvwnN/7iauotATOVFaEi9aiABtTd0zb4T5snsc0d8+qbzCP7FeqC8sG+TRT2L9wFlJDtk0mF4aryC
	Tr/pCUpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgZe-000000030WK-2amg;
	Tue, 10 Nov 2026 07:47:22 +0000
Received: from retz.cirad.fr ([194.199.235.221])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgZa-000000030S4-315X
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 07:47:21 +0000
Received: from retz.cirad.fr (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTPS id 2431620D4CA9;
	Tue, 10 Nov 2026 08:47:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTP id 00D2320D4CB1;
	Tue, 10 Nov 2026 08:47:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 retz.cirad.fr 00D2320D4CB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirad.fr;
	s=573E3878-7916-11F1-BF4B-F68474317960; t=1794296837;
	bh=1baqYX7J86dweMCkPQfESiLRzdTWwZDtqPYe1PsN2XM=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=BA+bFgOL5chCN83DvWwCtjB8Z/AMp/wJolkNGrtjSp1z2whP/uU++tMBmDXuEBLMN
	 ZyQsQbooCG7bDpGwD1c/vV3ifVnw0/7F2B7oAIzUd75Zwg9GvVwyYYpxcn8R0GCU24
	 kQ2gnKIi/lAIkb+e6viQUw1/g801FLVpiEllrrjaStvqkVkHBqlLTm3VGEQpq9VU04
	 4+dFqejklQanlpnsfjZtDFEPwlBUIgIOtDw0mb1x6qIj7rGWzirkV7G8CetzYukF6n
	 M2QS8C40UoO0LKYHiVuR94I3PW2iDjJaMRrdFlLi9RXWHp0t6h7uh/gw99yk3iGpmR
	 Aqmk4ayc8cetQ==
X-Virus-Scanned: amavis at retz.cirad.fr
Received: from retz.cirad.fr ([127.0.0.1])
 by localhost (retz.cirad.fr [127.0.0.1]) (amavis, port 10026) with ESMTP
 id m0-m20SpvJkb; Tue, 10 Nov 2026 08:47:16 +0100 (CET)
Received: from localhost.localdomain (78-196-243-100.subs.proxad.net [78.196.243.100])
	by retz.cirad.fr (Postfix) with ESMTPSA id 045BD20D7CF7;
	Tue, 10 Nov 2026 08:47:15 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-bluetooth@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
Subject: [PATCH 1/2] dt-bindings: net: bluetooth: realtek: Add RTL8852BS
Date: Tue, 10 Nov 2026 08:46:06 +0100
Message-ID: <20261110074607.363918-2-frederic.mahe@cirad.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261110074607.363918-1-frederic.mahe@cirad.fr>
References: <20261110074607.363918-1-frederic.mahe@cirad.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_234718_923951_3EBB3F32 
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

VGhlIFJUTDg4NTJCUyBpcyBhIFdpLUZpIDYgKyBCbHVldG9vdGggNS4yIGNoaXAgd2l0aCBXaS1G
aSBvbiBTRElPCmFuZCBCbHVldG9vdGggb24gVUFSVCAoSDUpLiBJdHMgQmx1ZXRvb3RoIHBhcnQg
d29ya3Mgd2l0aCB0aGUKUlRMODgyMkNTIGRyaXZlciBkYXRhLCBzbyB1c2UgcmVhbHRlayxydGw4
ODIyY3MtYnQgYXMgZmFsbGJhY2suCgpUaGlzIHBhdGNoIHdhcyBwcmVwYXJlZCB3aXRoIHRoZSBo
ZWxwIG9mIGFuIEFJIGFzc2lzdGFudCAoQ2xhdWRlKSwKd2hpY2ggYWxzbyByYW4gdGhlIHRlc3Rz
LgoKU2lnbmVkLW9mZi1ieTogRnLDqWTDqXJpYyBNYWjDqSA8ZnJlZGVyaWMubWFoZUBjaXJhZC5m
cj4KLS0tCiAuLi4vYmluZGluZ3MvbmV0L2JsdWV0b290aC9yZWFsdGVrLGJsdWV0b290aC55YW1s
ICAgICB8IDExICsrKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA0
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9uZXQvYmx1ZXRvb3RoL3JlYWx0ZWssYmx1ZXRvb3RoLnlhbWwgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbmV0L2JsdWV0b290aC9yZWFsdGVrLGJsdWV0b290aC55YW1s
CmluZGV4IDdkNTY3MTIyYi4uZmZkZjEzYjA1IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbmV0L2JsdWV0b290aC9yZWFsdGVrLGJsdWV0b290aC55YW1sCisr
KyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvYmx1ZXRvb3RoL3JlYWx0
ZWssYmx1ZXRvb3RoLnlhbWwKQEAgLTQsMTYgKzQsMTYgQEAKICRpZDogaHR0cDovL2RldmljZXRy
ZWUub3JnL3NjaGVtYXMvbmV0L2JsdWV0b290aC9yZWFsdGVrLGJsdWV0b290aC55YW1sIwogJHNj
aGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCiAKLXRp
dGxlOiBSVEw4NzIzQlMvUlRMODcyM0NTL1JUTDg4MjFDUy9SVEw4ODIyQ1MgQmx1ZXRvb3RoCit0
aXRsZTogUlRMODcyM0JTL1JUTDg3MjNDUy9SVEw4ODIxQ1MvUlRMODgyMkNTL1JUTDg4NTJCUyBC
bHVldG9vdGgKIAogbWFpbnRhaW5lcnM6CiAgIC0gVmFzaWx5IEtob3J1emhpY2sgPGFuYXJzb3Vs
QGdtYWlsLmNvbT4KICAgLSBBbGlzdGFpciBGcmFuY2lzIDxhbGlzdGFpckBhbGlzdGFpcjIzLm1l
PgogCiBkZXNjcmlwdGlvbjoKLSAgUlRMODcyM0JTL1JUTDg3MjNDUy9SVEw4ODIxQ1MvUlRMODgy
MkNTIGlzIGEgV2lGaSArIEJUIGNoaXAuIFdpRmkgcGFydAotICBpcyBjb25uZWN0ZWQgb3ZlciBT
RElPLCB3aGlsZSBCVCBpcyBjb25uZWN0ZWQgb3ZlciBzZXJpYWwuIEl0IHNwZWFrcwotICBINSBw
cm90b2NvbCB3aXRoIGZldyBleHRyYSBjb21tYW5kcyB0byB1cGxvYWQgZmlybXdhcmUgYW5kIGNo
YW5nZQorICBSVEw4NzIzQlMvUlRMODcyM0NTL1JUTDg4MjFDUy9SVEw4ODIyQ1MvUlRMODg1MkJT
IGlzIGEgV2lGaSArIEJUIGNoaXAuCisgIFdpRmkgcGFydCBpcyBjb25uZWN0ZWQgb3ZlciBTRElP
LCB3aGlsZSBCVCBpcyBjb25uZWN0ZWQgb3ZlciBzZXJpYWwuIEl0CisgIHNwZWFrcyBINSBwcm90
b2NvbCB3aXRoIGZldyBleHRyYSBjb21tYW5kcyB0byB1cGxvYWQgZmlybXdhcmUgYW5kIGNoYW5n
ZQogICBtb2R1bGUgc3BlZWQuCiAKIHByb3BlcnRpZXM6CkBAIC0yOCw2ICsyOCw5IEBAIHByb3Bl
cnRpZXM6CiAgICAgICAgICAgLSBlbnVtOgogICAgICAgICAgICAgICAtIHJlYWx0ZWsscnRsODgy
MWNzLWJ0CiAgICAgICAgICAgLSBjb25zdDogcmVhbHRlayxydGw4NzIzYnMtYnQKKyAgICAgIC0g
aXRlbXM6CisgICAgICAgICAgLSBjb25zdDogcmVhbHRlayxydGw4ODUyYnMtYnQKKyAgICAgICAg
ICAtIGNvbnN0OiByZWFsdGVrLHJ0bDg4MjJjcy1idAogCiAgIGRldmljZS13YWtlLWdwaW9zOgog
ICAgIG1heEl0ZW1zOiAxCi0tIAoyLjQ3LjMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
