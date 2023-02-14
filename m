Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B843C05027
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Feb 2023 16:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4RBaLimeYanrbh8NKBS9ncF4Y89Wpa2vTOMBKyJmiMg=; b=BCPs0TISZeqh0+
	3YdHELCLqEJPHCMzQiroKhw53UWIajPlLodp1fco9texnLwJBWcRG3XTSyPD9CZ1OpMR80OYH1gRM
	k33ah+ugV7wK7LzpWrh2fI/Qer7Ajy4T0l63usxhVI3iib+ROWUBD2YklYpRFYym9sgx3hJwBazmg
	ztDSrw9rDk42a6ZKyZWpeEfZYUZQ171vgc6YNa85QiI43tyPowO1EqId73bkvBsg07ywBHR8OjnkJ
	iWsYkUAiAqZF6iY1IiaG12xevg6clPvKrgNrK6ZLBI40PlLFB4cIJZpRU+v6HK/BzQ4U0qeefniIA
	yZQ59piY8BDK970JLIpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRy7T-002no7-1J; Tue, 14 Feb 2023 16:25:27 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRy7Q-002nnX-1q
	for linux-riscv@lists.infradead.org; Tue, 14 Feb 2023 16:25:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E5700B81CCB;
	Tue, 14 Feb 2023 16:25:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5084DC4339B;
	Tue, 14 Feb 2023 16:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676391920;
	bh=LuWURY4FFKeKIoza3eLnRgl1jiOEIpdGZG7bWday3lQ=;
	h=From:To:Cc:Subject:Date:From;
	b=cd0pCB93jtXrpx96m2wkGNutsKDwf2F+zq4ZVhUc+B4RHfuZQ5EkUTerejBJzln+Z
	 DLx9UhdDb0znIJmWADwgoVkzz3om2KlqnSZ/bLG7Vr1xsiSgYaPLpoh7tbA+2OHZ4y
	 O6FJ64O2SRPGOQve4QpVRZqJJXIYnWAQ65Ovvdb3WtbZqZHlfvv39NjzzD6fzwRrRZ
	 3lI4AyH4LrHocUsXzIEBDkQDMmVDn6ndyKKc4PV8RvnG/945LLOw3mGD60pSQuRDNO
	 TevFehVYvo6e6ZC+iFmADq3Azi7+dtl8ZtoV4Coc1QG3qew7ha4KcdW+dSFqQkAPEl
	 mD3l4ttDKl8ag==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	bpf@vger.kernel.org
Subject: [PATCH] riscv, mm: Perform BPF exhandler fixup on page fault
Date: Tue, 14 Feb 2023 17:25:15 +0100
Message-Id: <20230214162515.184827-1-bjorn@kernel.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_082524_284692_87F669CD 
X-CRM114-Status: GOOD (  14.64  )
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

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKQ29tbWl0IDIxODU1Y2Fj
ODJkMyAoInJpc2N2L21tOiBQcmV2ZW50IGtlcm5lbCBtb2R1bGUgdG8gYWNjZXNzIHVzZXIKbWVt
b3J5IHdpdGhvdXQgdWFjY2VzcyByb3V0aW5lcyIpIGFkZGVkIGVhcmx5IGV4aXRzL2RlYXRocyBm
b3IgcGFnZQpmYXVsdHMgc3RlbW1pbmcgZnJvbSBhY2Nlc3NlcyB0byB1c2VyLXNwYWNlIHdpdGhv
dXQgdXNpbmcgcHJvcGVyCnVhY2Nlc3Mgcm91dGluZXMgKHdoZXJlIHNzdGF0dXMuU1VNIGlzIHNl
dCkuCgpVbmZvcnR1bmF0bHksIHRoaXMgaXMgdG9vIHN0cmljdCBmb3Igc29tZSBCUEYgcHJvZ3Jh
bXMsIHdoaWNoIHJlbGllcwpvbiBCUEYgZXhoYW5kbGVyIGZpeHVwcy4gVGhlc2UgQlBGIHByb2dy
YW1zIGxvYWRzICJCVEYgcG9pbnRlcnMiLiBBCkJURiBwb2ludGVycyBjb3VsZCBlaXRoZXIgYmUg
YSB2YWxpZCBrZXJuZWwgcG9pbnRlciBvciBOVUxMLCBidXQgbm90IGEKdXNlcnNwYWNlIGFkZHJl
c3MuCgpSZXNvbHZlIHRoZSBwcm9ibGVtIGJ5IGNhbGxpbmcgdGhlIGZpeHVwIGhhbmRsZXIgaW4g
dGhlIGVhcmx5IGV4aXQKcGF0aC4KCkZpeGVzOiAyMTg1NWNhYzgyZDMgKCJyaXNjdi9tbTogUHJl
dmVudCBrZXJuZWwgbW9kdWxlIHRvIGFjY2VzcyB1c2VyIG1lbW9yeSB3aXRob3V0IHVhY2Nlc3Mg
cm91dGluZXMiKQpTaWduZWQtb2ZmLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5j
b20+Ci0tLQpQYWxtZXIsCgpUaGlzIGlzIGEgZml4IGZvciBCUEYgb24gcmlzY3YsIGJ1dCBJJ2Qg
c3RpbGwgbGlrZSB0byB0YWtlIGl0IHZpYSB0aGUKUklTQy1WIHRyZWUsIGdpdmVuIHRoZSBtbSBj
aGFuZ2VzLgoKQlBGL0JURiBpcyBhIHNwZWNpYWwgc25vd2ZsYWtlLCBhbmQgbmVlZHMgc3BlY2lh
bCBjYXJlLiA7LSkKCklmIEJQRl9QUk9CRV9NRU0gaXMgZXZlciB0byBiZSB1c2VkIGZvciB1c2Vy
bW9kZSBwb2ludGVycyBpbiB0aGUKZnV0dXJlLCB0aGVuIHRoZSBmaXh1cCBjYWxsIGNhbiBiZSBy
ZW1vdmVkLCBpbiBmYXZvciBvZiBzZXR0aW5nCnNzdGF0dXMuU1VNIGZyb20gdGhlIEJQRiBqaXR0
ZWQgY29kZS4KCgpCasO2cm4KLS0tCiBhcmNoL3Jpc2N2L21tL2ZhdWx0LmMgfCAxMCArKysrKyst
LS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3YvbW0vZmF1bHQuYyBiL2FyY2gvcmlzY3YvbW0vZmF1bHQuYwpp
bmRleCBkODZmN2NlYmQ0YTcuLmViMDc3NGQ5YzAzYiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9t
bS9mYXVsdC5jCisrKyBiL2FyY2gvcmlzY3YvbW0vZmF1bHQuYwpAQCAtMjY3LDEwICsyNjcsMTIg
QEAgYXNtbGlua2FnZSB2b2lkIGRvX3BhZ2VfZmF1bHQoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCiAJ
aWYgKHVzZXJfbW9kZShyZWdzKSkKIAkJZmxhZ3MgfD0gRkFVTFRfRkxBR19VU0VSOwogCi0JaWYg
KCF1c2VyX21vZGUocmVncykgJiYgYWRkciA8IFRBU0tfU0laRSAmJgotCQkJdW5saWtlbHkoIShy
ZWdzLT5zdGF0dXMgJiBTUl9TVU0pKSkKLQkJZGllX2tlcm5lbF9mYXVsdCgiYWNjZXNzIHRvIHVz
ZXIgbWVtb3J5IHdpdGhvdXQgdWFjY2VzcyByb3V0aW5lcyIsCi0JCQkJYWRkciwgcmVncyk7CisJ
aWYgKCF1c2VyX21vZGUocmVncykgJiYgYWRkciA8IFRBU0tfU0laRSAmJiB1bmxpa2VseSghKHJl
Z3MtPnN0YXR1cyAmIFNSX1NVTSkpKSB7CisJCWlmIChmaXh1cF9leGNlcHRpb24ocmVncykpCisJ
CQlyZXR1cm47CisKKwkJZGllX2tlcm5lbF9mYXVsdCgiYWNjZXNzIHRvIHVzZXIgbWVtb3J5IHdp
dGhvdXQgdWFjY2VzcyByb3V0aW5lcyIsIGFkZHIsIHJlZ3MpOworCX0KIAogCXBlcmZfc3dfZXZl
bnQoUEVSRl9DT1VOVF9TV19QQUdFX0ZBVUxUUywgMSwgcmVncywgYWRkcik7CiAKCmJhc2UtY29t
bWl0OiA5NTBiODc5YjdmMDI1MTMxN2QyNmJhZTA2ODdlNzI1OTJkNjA3NTMyCi0tIAoyLjM3LjIK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
