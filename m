Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6885FC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Dec 2021 17:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NwMsx65NrfLG0T74Xis3UPwtQJkWTcZZ9nfzAOIBwNE=; b=cNSN8RUGvOcUEJ
	PkakzZ1CqsI66YyxML8WRsBfAqB9xGdaLXVHkFjtHe/qbVKM4rNdMS0lBIvcxDlDfstkoLhWOMer/
	lBwxxmT2GislZSpqivIir+UOHqp38rS7yihSRCmDSKdo0mmcBk/u+s23bkl1rbWB3pAU75xwqINi7
	jwtyKm1GS1DT69LC2tRFnzhC4b2Liz4nqOZTrzhFLgQQwHbEZmq5X1MLczNaaWdiFAor0srHqezMG
	Rq/1HE8QzJX+c31HK1qGpkLEWv/U6BUzlDeqlf8akswG+8BXMN9O+M9VOkyKd/rkawnIbC1ho4LyC
	RwMhORtD/8MHtkwYrrCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1uFr-00HCgK-5M; Mon, 27 Dec 2021 17:57:51 +0000
Received: from hera.aquilenet.fr ([185.233.100.1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1uFo-00HCec-9f
 for linux-riscv@lists.infradead.org; Mon, 27 Dec 2021 17:57:50 +0000
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id DB6A22B0;
 Mon, 27 Dec 2021 18:52:18 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a87sJkm--fNp; Mon, 27 Dec 2021 18:52:18 +0100 (CET)
Received: from begin.home (2a01cb0088600700de41a9fffe47ec49.ipv6.abo.wanadoo.fr
 [IPv6:2a01:cb00:8860:700:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 139E5281;
 Mon, 27 Dec 2021 18:52:18 +0100 (CET)
Received: from samy by begin.home with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1n1uAT-00CRly-7Q;
 Mon, 27 Dec 2021 18:52:17 +0100
Date: Mon, 27 Dec 2021 18:52:17 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 John Garry <john.garry@huawei.com>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
 William Hubbs <w.d.hubbs@gmail.com>,
 Chris Brannon <chris@the-brannons.com>,
 Kirk Reiser <kirk@reisers.ca>, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org,
 speakup@linux-speakup.org
Subject: Re: [RFC 06/32] speakup: Kconfig: add HAS_IOPORT dependencies
Message-ID: <20211227175217.5bnpoauk2e3ni73s@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Niklas Schnelle <schnelle@linux.ibm.com>,
 Arnd Bergmann <arnd@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 John Garry <john.garry@huawei.com>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
 William Hubbs <w.d.hubbs@gmail.com>,
 Chris Brannon <chris@the-brannons.com>,
 Kirk Reiser <kirk@reisers.ca>, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org,
 speakup@linux-speakup.org
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
 <20211227164317.4146918-7-schnelle@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211227164317.4146918-7-schnelle@linux.ibm.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: +
X-Rspamd-Server: hera
Authentication-Results: hera.aquilenet.fr;
	none
X-Rspamd-Queue-Id: DB6A22B0
X-Spamd-Result: default: False [1.90 / 15.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; TAGGED_RCPT(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; HAS_ORG_HEADER(0.00)[];
 RCVD_COUNT_THREE(0.00)[3]; RCPT_COUNT_TWELVE(0.00)[20];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCVD_TLS_LAST(0.00)[];
 FREEMAIL_CC(0.00)[kernel.org,google.com,huawei.com,andestech.com,gmail.com,sifive.com,dabbelt.com,eecs.berkeley.edu,the-brannons.com,reisers.ca,vger.kernel.org,lists.infradead.org,linux-speakup.org];
 MID_RHS_NOT_FQDN(0.50)[]; SUSPICIOUS_RECIPS(1.50)[]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_095748_539523_F6BE555C 
X-CRM114-Status: GOOD (  11.28  )
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

TmlrbGFzIFNjaG5lbGxlLCBsZSBsdW4uIDI3IGTDqWMuIDIwMjEgMTc6NDI6NTEgKzAxMDAsIGEg
ZWNyaXQ6Cj4gSW4gYSBmdXR1cmUgcGF0Y2ggSEFTX0lPUE9SVD1uIHdpbGwgcmVzdWx0IGluIGlu
YigpL291dGIoKSBhbmQgZnJpZW5kcwo+IG5vdCBiZWluZyBkZWNsYXJlZC4gU1BFQUtVUF9TRVJJ
QUxJTyB0aHVzIG5lZWRzIHRvIGRlcGVuZCBvbiBIQVNfSU9QT1JULgo+IAo+IENvLWRldmVsb3Bl
ZC1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBrZXJuZWwub3JnPgo+IFNpZ25lZC1vZmYtYnk6IEFy
bmQgQmVyZ21hbm4gPGFybmRAa2VybmVsLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBOaWtsYXMgU2No
bmVsbGUgPHNjaG5lbGxlQGxpbnV4LmlibS5jb20+CgpSZXZpZXdlZC1ieTogU2FtdWVsIFRoaWJh
dWx0IDxzYW11ZWwudGhpYmF1bHRAZW5zLWx5b24ub3JnPgoKPiAtLS0KPiAgZHJpdmVycy9hY2Nl
c3NpYmlsaXR5L3NwZWFrdXAvS2NvbmZpZyB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9hY2Nlc3NpYmlsaXR5L3NwZWFrdXAv
S2NvbmZpZyBiL2RyaXZlcnMvYWNjZXNzaWJpbGl0eS9zcGVha3VwL0tjb25maWcKPiBpbmRleCAw
N2VjYmJkZTAzODQuLmU4NGZiNjE3YWNjNCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2FjY2Vzc2li
aWxpdHkvc3BlYWt1cC9LY29uZmlnCj4gKysrIGIvZHJpdmVycy9hY2Nlc3NpYmlsaXR5L3NwZWFr
dXAvS2NvbmZpZwo+IEBAIC00Niw2ICs0Niw3IEBAIGlmIFNQRUFLVVAKPiAgY29uZmlnIFNQRUFL
VVBfU0VSSUFMSU8KPiAgCWRlZl9ib29sIHkKPiAgCWRlcGVuZHMgb24gSVNBIHx8IENPTVBJTEVf
VEVTVAo+ICsJZGVwZW5kcyBvbiBIQVNfSU9QT1JUCj4gIAo+ICBjb25maWcgU1BFQUtVUF9TWU5U
SF9BQ05UU0EKPiAgCXRyaXN0YXRlICJBY2NlbnQgU0Egc3ludGhlc2l6ZXIgc3VwcG9ydCIKPiAt
LSAKPiAyLjMyLjAKPiAKCi0tIApTYW11ZWwKCS8qIEFtdXNlIHRoZSB1c2VyLiAqLwoJcHJpbnRr
KAoiICAgICAgICAgICAgICBcXHwvIF9fX18gXFx8L1xuIgoiICAgICAgICAgICAgICBcIkAnLyAs
LiBcXGBAXCJcbiIKIiAgICAgICAgICAgICAgL198IFxcX18vIHxfXFxcbiIKIiAgICAgICAgICAg
ICAgICAgXFxfX1VfL1xuIik7CihGcm9tIGxpbnV4L2FyY2gvc3BhcmMva2VybmVsL3RyYXBzLmM6
ZGllX2lmX2tlcm5lbCgpKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
