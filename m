Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91C6606A334
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 08:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PE6ERm3o;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=idZG3t6H
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=4HLaUUKOtJwCkxF58mhJL5JP2Z0BXodXsy2Ca929blY=; b=PE6ERm3odRIkAhL4V9p7H2MWu/
	HViC1MB9A+WF6CciLNM7zIZzQNRSPOA2XpNfAgexdcNdcLlp3mBEWYHGJ1k/EwKWbV/73U1slVh7D
	d6NdVn8mXNDz2zftN/mNztjyBKTI8sO5rlk2O2daJgPqiYB5lSPgMBDmBhYKcfbLq4wV/ogPTV32T
	00oVt7OsSEMJyLdiO44boZYAufQ0J2aV+oB+GxGL6hrx49egC/VcjGvgS8ld5cKGnd2eMzrUhi3/J
	L+tcdr/dOUiq+K7oa+86hlivq3i8rolIVaw2wrysaCdvv4dFGCUqibYqWyTjGPxLnbfY4k2ewjnNg
	OD4lNF2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTEyL-00000004yAL-1F2K;
	Tue, 17 Nov 2026 08:55:25 +0000
Received: from retz.cirad.fr ([194.199.235.221])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTEyI-00000004y9y-00ax
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 08:55:23 +0000
Received: from retz.cirad.fr (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTPS id 2F44220DC83D;
	Tue, 17 Nov 2026 09:55:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTP id 02A2A20DC645;
	Tue, 17 Nov 2026 09:55:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 retz.cirad.fr 02A2A20DC645
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirad.fr;
	s=573E3878-7916-11F1-BF4B-F68474317960; t=1794905720;
	bh=YoSUKncv+j8yWkI1ZDcElbOhTKMX3MU43KfQwivUqRI=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=idZG3t6H6xRGsVi2TLW5bezCYq3xy1oVFURyzryQ9GXpQhy69wkKSzq48Cz/RSZr7
	 7NQgoF+E6TIVPLrpq+iXLd3fgVhhZiAYA76YlzIikzYy1LxUWSSSteUlz+cTCnCJdo
	 duOaFo+2r5cKXMliOMzbXzhfnjpxJ0oD0lDOUZawsGu/moRheKWm/F0Hc+MMyCCy/s
	 MjNJrep/oM3R0LapuvuEZl371t/y3u9o4xTnI0B+wCuScVMulsx+14Ai6wbqJg4Cab
	 9IJlaf8WOQv3EG7Il0I1fk+80TKSqtYUo9J1r3NVTNxooOJMvG5T0W/1Z3S2zfMlMR
	 rWPfP6aURMzmA==
X-Virus-Scanned: amavis at retz.cirad.fr
Received: from retz.cirad.fr ([127.0.0.1])
 by localhost (retz.cirad.fr [127.0.0.1]) (amavis, port 10026) with ESMTP
 id KP3hYXsr1wK7; Tue, 17 Nov 2026 09:55:19 +0100 (CET)
Received: from localhost.localdomain (78-196-243-100.subs.proxad.net [78.196.243.100])
	by retz.cirad.fr (Postfix) with ESMTPSA id 33F1520DC83D;
	Tue, 17 Nov 2026 09:55:19 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>,
	Rob Herring <robh@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Alex Elder <elder@riscstar.com>,
	Encrow Thorne <encrow.thorne@linux.spacemit.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	linux-pci@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] PCI: spacemit-k1: Request the Gen2 speed change once the link is up
Date: Tue, 17 Nov 2026 09:55:06 +0100
Message-ID: <20261117085508.83388-1-frederic.mahe@cirad.fr>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_005522_344177_35F32F20 
X-CRM114-Status: GOOD (  18.17  )
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

T24gYSBCYW5hbmEgUGkgQlBJLUYzLCBhbiBOVk1lIFNTRCBpbiB0aGUgTS4yIHNsb3QgKHBjaWUx
KSBhbHdheXMgY29tZXMKdXAgYXQgMi41IEdUL3MsIGFsdGhvdWdoIHRoZSByb290IHBvcnQgYW5k
IHRoZSBkcml2ZSBib3RoIHN1cHBvcnQKNSBHVC9zLiBUaGUgRGlyZWN0ZWQgU3BlZWQgQ2hhbmdl
IHRoYXQgZHdfcGNpZV9zZXR1cF9yYygpIHJlcXVlc3RzCmJlZm9yZSB0aGUgTFRTU00gaXMgZW5h
YmxlZCBoYXMgbm8gZWZmZWN0IG9uIEsxLiBTZXR0aW5nIFJldHJhaW4gTGluawppbiB0aGUgcm9v
dCBwb3J0J3MgTGluayBDb250cm9sIGZyb20gdXNlcnNwYWNlIGJyaW5ncyB0aGUgbGluayB0bwo1
IEdUL3MsIHNvIHRoZSBsaW5rIGl0c2VsZiBpcyBmaW5lLgoKT25jZSB0aGUgbGluayBpcyB1cCwg
cmVxdWVzdCB0aGUgc3BlZWQgY2hhbmdlIGFnYWluLCB3YWl0IGZvciB0aGUKY29udHJvbGxlciB0
byBjbGVhciBTUEVFRF9DSEFOR0UgKGFzIHBjaS1pbXg2IGRvZXMpLCB0aGVuIGJyaWVmbHkgZm9y
CkxpbmsgU3RhdHVzIHRvIHJlcG9ydCB0aGUgbmV3IHNwZWVkLiBBIHBvcnQgd2l0aCBub3RoaW5n
IGJlaGluZCBpdCBpcwpza2lwcGVkIGFmdGVyIDEwMCBtcy4KCldpdGggYW4gU0sgaHluaXggQkM1
MTEsIHRoZSBsaW5rIG5vdyB0cmFpbnMgYXQgNSBHVC9zIHgyIGFuZCBmaW8Kc2VxdWVudGlhbCBy
ZWFkIGdvZXMgZnJvbSAzOTcgdG8gNTc1LTY0MCBNQi9zLiBEYXRhIHZlcmlmaWVkIHdpdGggZmlv
CmNyYzMyYy4gVGhlIGVtcHR5IHBjaWUyIHBvcnQgYmVoYXZlcyBhcyBiZWZvcmUuCgpUaGlzIGNo
YW5nZSB3YXMgZGV2ZWxvcGVkIHdpdGggdGhlIGhlbHAgb2YgQ2xhdWRlIChBbnRocm9waWMpOyBJ
CnJldmlld2VkIGFuZCB0ZXN0ZWQgaXQgb24gaGFyZHdhcmUuCgpTaWduZWQtb2ZmLWJ5OiBGcsOp
ZMOpcmljIE1haMOpIDxmcmVkZXJpYy5tYWhlQGNpcmFkLmZyPgotLS0KVGhlIEsxIFBDSWUgY292
ZXIgbGV0dGVyIHNheXMgYWxsIHBvcnRzIHJ1biBhdCA1IEdUL3MsIHNvIG1heWJlIHRoaXMKZGVw
ZW5kcyBvbiB0aGUgZHJpdmUgb3IgdGhlIGZpcm13YXJlOyBvbiB0aGlzIGJvYXJkIHRoZSBsaW5r
IGFsd2F5cyBjYW1lCnVwIGF0IDIuNSBHVC9zIGJlZm9yZSB0aGlzIHBhdGNoLiBUZXN0ZWQgb24g
dG9wIG9mIHY3LjQtcmMxIHdpdGggIlBDSToKc3BhY2VtaXQ6IElnbm9yZSBQRVJTVCMgaW5wdXQg
aW4gUkMgbW9kZSBvbiBLMSIgKGFwcGxpZXMgY2xlYW5seSB3aXRob3V0Cml0IHRvbykuCgogZHJp
dmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1zcGFjZW1pdC1rMS5jIHwgNDggKysrKysrKysr
KysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDQ4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLXNwYWNlbWl0LWsxLmMgYi9kcml2ZXJz
L3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLXNwYWNlbWl0LWsxLmMKaW5kZXggOTJhNzFlYTkwLi40
YWNjMTRlZmEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtc3Bh
Y2VtaXQtazEuYworKysgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLXNwYWNlbWl0
LWsxLmMKQEAgLTExLDYgKzExLDcgQEAKICNpbmNsdWRlIDxsaW51eC9kZXZpY2UuaD4KICNpbmNs
dWRlIDxsaW51eC9lcnIuaD4KICNpbmNsdWRlIDxsaW51eC9nZnAuaD4KKyNpbmNsdWRlIDxsaW51
eC9pb3BvbGwuaD4KICNpbmNsdWRlIDxsaW51eC9tZmQvc3lzY29uLmg+CiAjaW5jbHVkZSA8bGlu
dXgvb2YuaD4KICNpbmNsdWRlIDxsaW51eC9waHkvcGh5Lmg+CkBAIC0yMDksNiArMjEwLDUxIEBA
IHN0YXRpYyBib29sIGsxX3BjaWVfbGlua191cChzdHJ1Y3QgZHdfcGNpZSAqcGNpKQogCXJldHVy
biAodmFsICYgUkRMSF9MSU5LX1VQKSAmJiAodmFsICYgU01MSF9MSU5LX1VQKTsKIH0KIAorLyoK
KyAqIFRoZSBEaXJlY3RlZCBTcGVlZCBDaGFuZ2UgcmVxdWVzdGVkIGJ5IGR3X3BjaWVfc2V0dXBf
cmMoKSBiZWZvcmUgdGhlCisgKiBsaW5rIGlzIHN0YXJ0ZWQgZG9lcyBub3QgdGFrZSBlZmZlY3Qg
b24gSzEsIGFuZCB0aGUgbGluayBzdGF5cyBhdAorICogMi41IEdUL3MuICBSZXF1ZXN0IGl0IGFn
YWluIG9uY2UgdGhlIGxpbmsgaXMgdXAuCisgKi8KK3N0YXRpYyB2b2lkIGsxX3BjaWVfc3BlZWRf
Y2hhbmdlKHN0cnVjdCBkd19wY2llICpwY2kpCit7CisJdTggb2Zmc2V0ID0gZHdfcGNpZV9maW5k
X2NhcGFiaWxpdHkocGNpLCBQQ0lfQ0FQX0lEX0VYUCk7CisJYm9vbCB1cDsKKwl1MTYgc3RhOwor
CXUzMiB2YWw7CisJaW50IHJldDsKKworCWlmIChwY2ktPm1heF9saW5rX3NwZWVkIDwgMikKKwkJ
cmV0dXJuOworCisJLyogTm90aGluZyB0byBkbyBpZiB0aGVyZSBpcyBubyBkZXZpY2UgYmVoaW5k
IHRoZSBwb3J0ICovCisJcmV0ID0gcmVhZF9wb2xsX3RpbWVvdXQoazFfcGNpZV9saW5rX3VwLCB1
cCwgdXAsIDEwMDAsCisJCQkJMTAwICogVVNFQ19QRVJfTVNFQywgZmFsc2UsIHBjaSk7CisJaWYg
KHJldCkKKwkJcmV0dXJuOworCisJdmFsID0gZHdfcGNpZV9yZWFkbF9kYmkocGNpLCBMSU5LX1dJ
RFRIX1NQRUVEX0NUUkwpOworCWR3X3BjaWVfd3JpdGVsX2RiaShwY2ksIExJTktfV0lEVEhfU1BF
RURfQ1RSTCwgdmFsICYgflNQRUVEX0NIQU5HRSk7CisJZHdfcGNpZV93cml0ZWxfZGJpKHBjaSwg
TElOS19XSURUSF9TUEVFRF9DVFJMLCB2YWwgfCBTUEVFRF9DSEFOR0UpOworCisJLyogVGhlIGNv
bnRyb2xsZXIgY2xlYXJzIFNQRUVEX0NIQU5HRSB3aGVuIHRoZSBzcGVlZCBjaGFuZ2UgaXMgZG9u
ZSAqLworCXJldCA9IHJlYWRfcG9sbF90aW1lb3V0KGR3X3BjaWVfcmVhZGxfZGJpLCB2YWwsICEo
dmFsICYgU1BFRURfQ0hBTkdFKSwKKwkJCQkxMDAwLCAxMDAgKiBVU0VDX1BFUl9NU0VDLCBmYWxz
ZSwKKwkJCQlwY2ksIExJTktfV0lEVEhfU1BFRURfQ1RSTCk7CisJaWYgKHJldCkgeworCQlkZXZf
d2FybihwY2ktPmRldiwgImxpbmsgc3BlZWQgY2hhbmdlIHRpbWVkIG91dFxuIik7CisJCXJldHVy
bjsKKwl9CisKKwkvKgorCSAqIExua1N0YSBsYWdzIGJlaGluZCBTUEVFRF9DSEFOR0U7IHdhaXQg
YSBsaXR0bGUgZm9yIHRoZSBuZXcgc3BlZWQKKwkgKiAoc3RheXMgYXQgMi41IEdUL3MgaWYgdGhl
IGRldmljZSBpcyBHZW4xIG9ubHkpLgorCSAqLworCXJlYWRfcG9sbF90aW1lb3V0KGR3X3BjaWVf
cmVhZHdfZGJpLCBzdGEsCisJCQkgIEZJRUxEX0dFVChQQ0lfRVhQX0xOS1NUQV9DTFMsIHN0YSkg
PiAxLAorCQkJICAxMDAwLCAyMCAqIFVTRUNfUEVSX01TRUMsIGZhbHNlLAorCQkJICBwY2ksIG9m
ZnNldCArIFBDSV9FWFBfTE5LU1RBKTsKK30KKwogc3RhdGljIGludCBrMV9wY2llX3N0YXJ0X2xp
bmsoc3RydWN0IGR3X3BjaWUgKnBjaSkKIHsKIAlzdHJ1Y3QgazFfcGNpZSAqazEgPSB0b19rMV9w
Y2llKHBjaSk7CkBAIC0yMjYsNiArMjcyLDggQEAgc3RhdGljIGludCBrMV9wY2llX3N0YXJ0X2xp
bmsoc3RydWN0IGR3X3BjaWUgKnBjaSkKIAl2YWwgfD0gUENJRV9JTlRFUlJVUFRfRU47CiAJd3Jp
dGVsX3JlbGF4ZWQodmFsLCBrMS0+bGluayArIEsxX1BIWV9BSEJfSVJRX0VOKTsKIAorCWsxX3Bj
aWVfc3BlZWRfY2hhbmdlKHBjaSk7CisKIAlyZXR1cm4gMDsKIH0KIAoKYmFzZS1jb21taXQ6IDY2
MjhlN2Q0YzZiMjVjOGQxOGYxMzQ1ZTNhMjBkMjE4MjlhYWU3ZTQKLS0gCjIuNDcuMwoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
