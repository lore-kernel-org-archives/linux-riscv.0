Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 807C9C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jun 2022 13:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=v5ZLmGbHCLDRp5r16Za+jtmAwH1o33RAYuuldIuZ2O8=; b=hA3LQB/mbak4qT
	q7d0LLqY34wwoUnT8CzqY8bPjaU21WViaBgsZZgtodrdknPPiNfQfYLENdXSTr2DEaWh/GWahHrdu
	SKGkzZyZB+EwYvetxARmTlp4G6gb5aNeQmfj/9RUffXerFhgN5LyuwygqiQmRF1ci+anT8EkKoPaf
	z/HGBKBucNh6WkATxomY3vlgmBCHDBRTZibF3bLY7qXWqj2WTPr9OVR8nlCL4ZESJwsnVr015mWNo
	juJ5Dd/i5VABxWMylohzrcHcyFZEwdNyy4xFA5Tqfg1i9Xnz0069iRZiT2OHClMhHez14mnzOI3vl
	YEPSwKGICCljPquq7HRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyZ53-007cPR-Jd; Tue, 07 Jun 2022 13:17:09 +0000
Received: from forward102p.mail.yandex.net ([2a02:6b8:0:1472:2741:0:8b7:102])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyZ4x-007cJq-NF
	for linux-riscv@lists.infradead.org; Tue, 07 Jun 2022 13:17:07 +0000
Received: from myt5-6f58ffe13ff5.qloud-c.yandex.net (myt5-6f58ffe13ff5.qloud-c.yandex.net [IPv6:2a02:6b8:c12:3998:0:640:6f58:ffe1])
	by forward102p.mail.yandex.net (Yandex) with ESMTP id C43203940448;
	Tue,  7 Jun 2022 16:16:52 +0300 (MSK)
Received: from myt6-654ec0a0ab93.qloud-c.yandex.net (myt6-654ec0a0ab93.qloud-c.yandex.net [2a02:6b8:c12:1d80:0:640:654e:c0a0])
	by myt5-6f58ffe13ff5.qloud-c.yandex.net (mxback/Yandex) with ESMTP id ppOtZO6pHq-Gof4nswX;
	Tue, 07 Jun 2022 16:16:52 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1654607812;
	bh=ruIzGDkTnWqR5rQVP4jNY3qUlTQRJox4LfVANkCdoho=;
	h=Date:Subject:Cc:To:From:Message-Id;
	b=NMZooYb8WWDFiNpfIFNBaKIRJiwTz8upBxH2V20mi2MKrXpKCnRF41fVhIWjZlihB
	 3C5Y2WbSbAkrQqUC7jxLd4Q2d8iC1+GFqQUdtPVVh4Gnw1pzbP0ESTl2I+L+pYBgAm
	 dNk8SkSBC/et9LaKhORmzGAn4sN5A1sYWURqYwSc=
Authentication-Results: myt5-6f58ffe13ff5.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by myt6-654ec0a0ab93.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id sOXgg17Zrk-GoM4UUpT;
	Tue, 07 Jun 2022 16:16:50 +0300
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client certificate not present)
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: 
Cc: Genevieve Chan <genevieve.chan@starfivetech.com>,
	Nikita Shubin <n.shubin@yadro.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE)
Subject: [PATCH v3 0/4] Introduce pmu-events support for HiFive Unmatched
Date: Tue,  7 Jun 2022 16:16:43 +0300
Message-Id: <20220607131648.29439-1-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_061705_100719_87064118 
X-CRM114-Status: GOOD (  10.45  )
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

RnJvbTogTmlraXRhIFNodWJpbiA8bi5zaHViaW5AeWFkcm8uY29tPgoKVGhpcyBzZXJpZXMgb2Yg
cGF0Y2hlcyBpbnRyb2R1Y2VzIHN1cHBvcnQgZm9yIHRoZSBSSVNDLVYgUE1VIGlkZW50aWZpY2F0
aW9uIGFuZCByYXcgZXZlbnRzIG1hdGNoaW5nIGJldHdlZW4gcGVyZiBhbmQgdGhlIFBNVS4KVGhl
IEhpRml2ZSBVbm1hdGNoZWQgYm9hcmQgY2FuIG5vdyB1c2UgYWxsIHRoZSBjb3VudGVycyB3aXRo
IG5hbWVkIGV2ZW50cy4KClVuZm9ydHVuYXRlbHkgTWFyaW8gaXMgbm8gbG9uZ2VyIGludGVyZXN0
ZWQgaW4gc3VibWl0dGluZyB0aGlzIHNlcmllcywgYXMgdGhlcmUgd2VyZSBubyBvYmplY3Rpb25z
IHRvIHYyIHNlcmllcywgYmVzaWRlcyBEVCAKYmluZGluZ3Mgd2hpY2ggcmVzaWRlIGluIFUtQm9v
dCBhbmQgc2hvdWxkbid0IGJlIGV4cG9zZWQgdG8gTGludXgsIGkgcmVzZW5kaW5nIG1vc3RseSBv
cmlnaW5hbCBzZXJpZXMgd2l0aCBzbWFsbCBzeXNmcyBwbXUgaWQgZml4LgoKU2VlIG9yaWdpbmFs
IGNvdmVyIGxldHRlciBieSBKb8OjbyBNw6FyaW8gRG9taW5nb3M6Cmh0dHBzOi8vcGF0Y2h3b3Jr
Lmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1yaXNjdi9jb3Zlci8yMDIxMTExNjE1NDgxMi4xNzAw
OC0xLWpvYW8ubWFyaW9AdGVjbmljby51bGlzYm9hLnB0LwoKRm9sbG93aW5nIGFkZGl0aW9uIHdh
cyBtYWRlIHRvIFUtQm9vdCBkZXZpY2UgdHJlZToKYGBgCnBtdSB7Cgljb21wYXRpYmxlID0gInJp
c2N2LHBtdSI7CglyaXNjdixldmVudC10by1taHBtY291bnRlcnMgPQoJCTwweDAzIDB4MDYgMHgx
OAoJCTB4MTAwMDEgMHgxMDAwMiAweDE4CgkJMHgxMDAwOSAweDEwMDA5IDB4MTgKCQkweDEwMDEx
IDB4MTAwMTEgMHgxOAoJCTB4MTAwMTkgMHgxMDAxOSAweDE4CgkJMHgxMDAyMSAweDEwMDIxIDB4
MTg+OwoJcmlzY3YsZXZlbnQtdG8tbWhwbWV2ZW50ID0KCQk8MHgwMyAweDAwMDAwMDAwIDB4MTgw
MQoJCTB4MDQgMHgwMDAwMDAwMCAweDAzMDIKCQkweDA1IDB4MDAwMDAwMDAgMHg0MDAwCgkJMHgw
NiAweDAwMDAwMDAwIDB4NjAwMQoJCTB4MTAwMDEgMHgwMDAwMDAwMCAweDAyMDIKCQkweDEwMDAy
IDB4MDAwMDAwMDAgMHgwNDAyCgkJMHgxMDAwOSAweDAwMDAwMDAwIDB4MDEwMgoJCTB4MTAwMTEg
MHgwMDAwMDAwMCAweDIwMDIKCQkweDEwMDE5IDB4MDAwMDAwMDAgMHgxMDAyCgkJMHgxMDAyMSAw
eDAwMDAwMDAwIDB4MDgwMj47CglyaXNjdixyYXctZXZlbnQtdG8tbWhwbWNvdW50ZXJzID0KCQk8
MHgwMDAwMDAwMCAweDAzZmZmZjAwIDB4MCAweDAgMHgxOAoJCTB4MDAwMDAwMDAgMHgwMDA3ZmYw
MSAweDAgMHgxIDB4MTgKCQkweDAwMDAwMDAwIDB4MDAwMDNmMDIgMHgwIDB4MiAweDE4PjsKfTsK
YGBgCgpUZXN0ZWQgb24gdGhlIHRvcCBvZiB2NS4xOSB3aGljaCBjb250YWlucyBBdGlzaCBQYXRy
YSBQTVUgc2VyaWVzLgoKLS0tCkNoYW5nZXMgaW4gdjM6CiAgLSBDaGFuZ2UgJ3NvYy9zb2M6cG11
L2lkJyB0byAncmlzY3YtcG11L2lkJwpDaGFuZ2VzIGluIHYyOgogIC0gRml4IGNvbXBpbGF0aW9u
IGVycm9ycyBhbmQgd2FybmluZ3MKICAtIFJlbW92ZSBzcGFjZSBpZGVudHMKICAtIENvcnJlY3Qg
Zm9ybWF0dGluZwotLS0KCkpvw6NvIE3DoXJpbyBEb21pbmdvcyAoNCk6CiAgUklTQy1WOiBDcmVh
dGUgdW5pcXVlIGlkZW50aWZpY2F0aW9uIGZvciBTb0MgUE1VCiAgUklTQy1WOiBTdXBwb3J0IENQ
VUlEIGZvciByaXNjLXYgaW4gcGVyZgogIFJJU0MtVjogQWRkZWQgZ2VuZXJpYyBwbXUtZXZlbnRz
IG1hcGZpbGUKICBSSVNDLVY6IEFkZGVkIEhpRml2ZSBVbm1hdGNoZWQgUE1VIGV2ZW50cwoKIGFy
Y2gvcmlzY3Yva2VybmVsL3NiaS5jICAgICAgICAgICAgICAgICAgICAgICB8ICAzICsKIGRyaXZl
cnMvcGVyZi9yaXNjdl9wbXUuYyAgICAgICAgICAgICAgICAgICAgICB8IDE4ICsrKysKIGRyaXZl
cnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMgICAgICAgICAgICAgICAgICB8IDQ3ICsrKysrKysrKysK
IHRvb2xzL3BlcmYvYXJjaC9yaXNjdi91dGlsL0J1aWxkICAgICAgICAgICAgICB8ICAxICsKIHRv
b2xzL3BlcmYvYXJjaC9yaXNjdi91dGlsL2hlYWRlci5jICAgICAgICAgICB8IDY2ICsrKysrKysr
KysrKysKIHRvb2xzL3BlcmYvcG11LWV2ZW50cy9hcmNoL3Jpc2N2L21hcGZpbGUuY3N2ICB8IDE1
ICsrKwogLi4uL3BtdS1ldmVudHMvYXJjaC9yaXNjdi9yaXNjdi1nZW5lcmljLmpzb24gIHwgMjAg
KysrKwogLi4uL2FyY2gvcmlzY3Yvc2lmaXZlL3U3NC9pbnN0cnVjdGlvbnMuanNvbiAgIHwgOTIg
KysrKysrKysrKysrKysrKysrKwogLi4uL2FyY2gvcmlzY3Yvc2lmaXZlL3U3NC9tZW1vcnkuanNv
biAgICAgICAgIHwgMzIgKysrKysrKwogLi4uL2FyY2gvcmlzY3Yvc2lmaXZlL3U3NC9taWNyb2Fy
Y2guanNvbiAgICAgIHwgNTcgKysrKysrKysrKysrCiAxMCBmaWxlcyBjaGFuZ2VkLCAzNTEgaW5z
ZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL3BlcmYvYXJjaC9yaXNjdi91dGls
L2hlYWRlci5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvcGVyZi9wbXUtZXZlbnRzL2FyY2gv
cmlzY3YvbWFwZmlsZS5jc3YKIGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29scy9wZXJmL3BtdS1ldmVu
dHMvYXJjaC9yaXNjdi9yaXNjdi1nZW5lcmljLmpzb24KIGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29s
cy9wZXJmL3BtdS1ldmVudHMvYXJjaC9yaXNjdi9zaWZpdmUvdTc0L2luc3RydWN0aW9ucy5qc29u
CiBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvcGVyZi9wbXUtZXZlbnRzL2FyY2gvcmlzY3Yvc2lm
aXZlL3U3NC9tZW1vcnkuanNvbgogY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL3BlcmYvcG11LWV2
ZW50cy9hcmNoL3Jpc2N2L3NpZml2ZS91NzQvbWljcm9hcmNoLmpzb24KCi0tIAoyLjM1LjEKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
