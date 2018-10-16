Return-Path: <SRS0=QIML=M4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A620C5ACC6
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 16 Oct 2018 22:31:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F35182147C
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 16 Oct 2018 22:31:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gXDFMD1S";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mac.com header.i=@mac.com header.b="GATSzqN3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F35182147C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mac.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-id:Date:
	In-reply-to:From:Subject:MIME-version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3/qVViRIya8Is2wDvRSZsroeOw0gw/fwqD0NjllNnpU=; b=gXDFMD1S/hHraP
	Fh78n0yQn4sFPbWBjbmZlEGl5OLGm1nXIszJUj7HhHzpcH6Rw87T/iPCH+yxmGPmh3EeY1h4iZ5vy
	9cOFtMBuokuEXWyHRWPnXjCdaBPoIsqPQMUYUn/WS00FrYS08jW0xfIL5Fwu7+wffE0Ugoimy90Tw
	VLYJBPS/X6N1YKcKepco3dlycs/7zHX0FbJUZuKp3EaKryVDC5Yf7EcOVnlDVumXytjN1h/Q/7g45
	FNqe0dcESEmcz3caeaFeyqZ109xkfXvwOqHSHMhS2ivERMAudGjTbXoIRPpkfaKUVT2PRxWJAMOd7
	oqoLlZVUzsr8ZDox1T4w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gCXsD-0001up-F4; Tue, 16 Oct 2018 22:31:33 +0000
Received: from mr28p00im-ztfo03025101.me.com ([17.110.71.91])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gCXsB-0001tT-1s
 for linux-riscv@lists.infradead.org; Tue, 16 Oct 2018 22:31:32 +0000
Received: from process-dkim-sign-daemon.mr28p00im-ztfo03025101.me.com by
 mr28p00im-ztfo03025101.me.com
 (Oracle Communications Messaging Server 8.0.2.2.20180531 64bit (built May 31
 2018)) id <0PGP00700PZ2TO00@mr28p00im-ztfo03025101.me.com> for
 linux-riscv@lists.infradead.org; Tue, 16 Oct 2018 22:30:58 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mac.com; s=04042017;
 t=1539729057; bh=XnqEssCjgh2br5tWTupyfr4NTcBTukWy9biGdFj7l2A=;
 h=Content-type:MIME-version:Subject:From:Date:Message-id:To;
 b=GATSzqN3HeMxw6oU/dbk7Ut1lm0kg9Xn1oBaUloud4t5uL2c0kHpeMFdbr4VGK9tg
 0n6Mq3wqrti16vkOV9d0b5QAViKB5bZXjvRWa6FVBgJfEUayJQxBiUNmPd2/ObICo5
 8RPJxAsnWsbYYtSFD9VBbZHn04g4PQecuBOrl0yr5XvKqeqdkse7k4oKupEBHkClpn
 dbmfFwMLhkpLcyBTSbFn+xYywlYq6UOE5EJHm3XE2Dj6SeQKHrQr5tQyCdt2itbVWx
 C4ftbV7+AdLrqzM0W6HPr7JRDCJ1NynnkPLWoUgZVY9qmlqzfG8o6NCIZPyhZs7NeQ
 lksjBP05/Ufbg==
Received: from icloud.com ([127.0.0.1]) by mr28p00im-ztfo03025101.me.com
 (Oracle Communications Messaging Server 8.0.2.2.20180531 64bit (built May 31
 2018)) with ESMTPSA id <0PGP002DJQJI4B30@mr28p00im-ztfo03025101.me.com>; Tue,
 16 Oct 2018 22:30:57 +0000 (GMT)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 mlxscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1807170000 definitions=main-1810160188
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,,
 definitions=2018-10-16_14:,, signatures=0
MIME-version: 1.0 (1.0)
Subject: Re: [sw-dev] Re: [isa-dev] riscv-qemu - linux boot is failing for vda
 device
From: Michael Clark <michaeljclark@mac.com>
X-Mailer: iPhone Mail (16A366)
In-reply-to: <20181016200245.j2gesmdjgoi7zmqh@excalibur.cnev.de>
Date: Wed, 17 Oct 2018 11:30:50 +1300
Message-id: <D9003246-0336-4327-97D3-D8F079F640D3@mac.com>
References: <CAOuPNLiR+BLUno8sYjwLwW1BqJbBrH-suBiHEx1-dtMO906Ung@mail.gmail.com>
 <mhng-14c6ccbd-b9ff-40e3-b69b-4333d814c6c1@palmer-si-x1c4>
 <20181016200245.j2gesmdjgoi7zmqh@excalibur.cnev.de>
To: Karsten Merker <merker@debian.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181016_153131_145439_A1506C9A 
X-CRM114-Status: GOOD (  13.84  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@sifive.com>,
 sw-dev@groups.riscv.org, pintu.ping@gmail.com, rjones@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181016223050.rtxiXDmJdmyLVHnF7mA3NbjfaIf_BKK77IEpj_EaojE@z>

Cgo+IE9uIDE3LzEwLzIwMTgsIGF0IDk6MDIgQU0sIEthcnN0ZW4gTWVya2VyIDxtZXJrZXJAZGVi
aWFuLm9yZz4gd3JvdGU6Cj4gCj4+IE9uIFR1ZSwgT2N0IDE2LCAyMDE4IGF0IDExOjM4OjUzQU0g
LTA3MDAsIFBhbG1lciBEYWJiZWx0IHdyb3RlOgo+Pj4gT24gVHVlLCAxNiBPY3QgMjAxOCAwNjox
MjoxMSBQRFQgKC0wNzAwKSwgcGludHUucGluZ0BnbWFpbC5jb20gd3JvdGU6Cj4+Pj4gT24gVHVl
LCBPY3QgMTYsIDIwMTggYXQgNjoxMCBBTSBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHNpZml2ZS5j
b20+IHdyb3RlOgo+Pj4+IE9uIE1vbiwgMTUgT2N0IDIwMTggMTQ6MTQ6NTEgUERUICgtMDcwMCks
IHJqb25lc0ByZWRoYXQuY29tIHdyb3RlOgo+IFsuLi5dCj4+Pj4gWW91ciBiZXN0IGJldCB0b2Rh
eSBpcyB0byBydW4gNC4xOS1yYzgsIHdoaWNoIHNob3VsZCBiZSBwcmV0dHkgc3RhYmxlLgo+Pj4g
Cj4+PiBZZXMsIEkgY2hlY2tlZCB3aXRoIG1haW5saW5lIGxpbnV4LWtlcm5lbCA0LjE5Lgo+Pj4g
Tm93IEkgYW0gYWJsZSB0byBib290IHN1Y2Nlc3NmdWxseSBhbmQgbG9naW4gaW50byBxZW11LXJp
c2N2IHNoZWxsLgo+Pj4gVGhhbmsgeW91IHNvIG11Y2ggOikKPj4+IAo+Pj4gQnV0IEkgYW0gY3Vy
aW91cyB0byBrbm93IHdoYXQgY2hhbmdlcyByZXN1bHRlZCBpbnRvIHRoaXMgZml4LCBpbiA0LjE5
IGtlcm5lbCA/Cj4+PiBXaGljaCBpcyB0aGUgZXhhY3QgcGF0Y2ggaW4gbWFpbmxpbmUsIHRoYXQg
Zml4ZXMgdGhpcyBpc3N1ZT8KPj4+IEJlY2F1c2UgYXQgdGltZXMgZHVyaW5nIHRoZSBkZXZlbG9w
bWVudCwgaXQgd2lsbCBiZSBkaWZmaWN1bHQgdG8KPj4+IHNpbXBseSB1cGdyYWRlIHRoZSBrZXJu
ZWwgdmVyc2lvbi4KPj4gCj4+IFllcywgdGhhdCdzIGV4cGVjdGVkLiAgUklTQy1WIExpbnV4IGlz
IHN0aWxsIHByZXR0eSBibGVlZGluZyBlZGdlLCB5b3UganVzdAo+PiBoYXBwZW5lZCB0byBjYXRj
aCBpdCBiZXR3ZWVuIHdoZW4gbWFzdGVyIHN0YXJ0ZWQgd29ya2luZyBhbmQgd2hlbiB0aGVyZSB3
YXMKPj4gYSBwcm9wZXIgcmVsZWFzZSB0aGF0IGNvbnRhaW5lZCB5b3VyIHBhdGNoZXMuICBTaW5j
ZSBtYXN0ZXIgaXMgdmVyeSBjYWxtCj4+IHJpZ2h0IG5vdyAodGhlcmUgd2FzIGFuIHJjOCBiZWZv
cmUgcmVsZWFzZSwgYnV0IGl0J3MgdmVyeSBjbG9zZSB0byBhCj4+IHJlbGVhc2UpIGl0J3MgT0sg
dG8gdXNlLCBidXQgeW91IGJlc3QgYmV0IGdvaW5nIGZvcndhcmQgaXMgdG8gdXNlIHRoZQo+PiBy
ZWxlYXNlIHRhcmJhbGxzIGp1c3QgbGlrZSBub3JtYWwuCj4gCj4gSnVzdCBhcyBhIGRhdGEgcG9p
bnQgaW4gY2FzZSB5b3Ugc2hvdWxkIGZpbmQgaXQgaGVscGZ1bDogSSdtCj4gc2luY2UgdHdvIHdl
ZWtzIHJ1bm5pbmcgNC4xOS1yYzYvLXJjNyBvbiB0aGUgcWVtdS1yaXNjdiAidmlydCIKPiBib2Fy
ZCB1bmRlciBwZXJtYW5lbnQgaGVhdnkgbG9hZCAodGhlIHN5c3RlbSBpcyBydW5uaW5nIGEgRGVi
aWFuCj4gcGFja2FnZSBidWlsZGVyKSB3aXRob3V0IGEgc2luZ2xlIGhpY2N1cC4KCkhpIEthcnN0
ZW4sCgpIYXZlIHlvdSB0cmllZCByaXNjdi1xZW11PyBJIGtub3cgcWVtdS1yaXNjdiBnZXRzIHF1
aXRlIGEgbG90IG9mIHRlc3RpbmcgYnV0IEnigJlkIGxpa2UgdG8gZ2FpbiBzb21lIG1vcmUgY29u
ZmlkZW5jZSBpbiByaXNjdi1xZW11LgoKV2UgbWlnaHQgaGF2ZSBhIFBMSUMgYnVnIGluIFFFTVUu
IElmIGFueW9uZSBoYXMgYSByZXByb2R1Y2VyIHRoZXkgY2FuIGZpbGUgYW4gaXNzdWUgb24gdGhl
IHJpc2N2LXFlbXUgaXNzdWUgdHJhY2tlciBhbmQgSeKAmWxsIHRha2UgYSBsb29rLi4uCgpNaWNo
YWVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
