Return-Path: <SRS0=aUtB=M5=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F2A6ECDE32
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 17 Oct 2018 07:35:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 217D02151D
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 17 Oct 2018 07:35:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hM3qTR0D";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mac.com header.i=@mac.com header.b="ZeEfAA/i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 217D02151D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mac.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-id:Date:
	In-reply-to:From:Subject:MIME-version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=09VDnWO4sTR0jBA0ResJbXl1e0LoqJNszHagj0nxYLo=; b=hM3qTR0DwVXi/d
	P5ejwilMyGiozANGkCJxxr369fL4UZ0jxGz5s/yaxnJdUWLs57a8BEbSMh2R5drPCQhTh29+kN3i9
	ygCH+hbqqJ8P1lpFmUqkhSjQLqUlfysC+YCsLem3MLN36tOlG6btmUYmtRkWe+d9EoeonlU7WfOXR
	RNm/ALhoQDWpBfmmaG1z9oX4otcXVO60Mrqqe22bHEVZPKtR0ndYHF3WEjycLheQ9pzyZ2jgCuAbW
	zZZ1LiJctXGlnxPoS16LMkQnFZ4Dl3nOc3KJUssfHEAxncpoXNdMOewlVlo5ccXxdifecRU2Zhx3H
	hzsQL0mh5jqFoDplczQA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gCgMM-0005Sm-Ge; Wed, 17 Oct 2018 07:35:14 +0000
Received: from mr28p00im-ztfo03015001.me.com ([17.110.71.106])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gCgMI-0004S8-Pw
 for linux-riscv@lists.infradead.org; Wed, 17 Oct 2018 07:35:12 +0000
Received: from process-dkim-sign-daemon.mr28p00im-ztfo03015001.me.com by
 mr28p00im-ztfo03015001.me.com
 (Oracle Communications Messaging Server 8.0.2.2.20180531 64bit (built May 31
 2018)) id <0PGQ00600EXFP600@mr28p00im-ztfo03015001.me.com> for
 linux-riscv@lists.infradead.org; Wed, 17 Oct 2018 07:34:33 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mac.com; s=04042017;
 t=1539761672; bh=4wmv9dK0n8z71r+PUEI/mqIuJhn2Y5tZhPTeGpwPrKY=;
 h=Content-type:MIME-version:Subject:From:Date:Message-id:To;
 b=ZeEfAA/i8UBMaRdir7NgNtSCPA2f+ydGOnsGWZdvKS/CWFnbpPqxKEoea1TfCNBAw
 cIRTH2dPglD4LxF4Fa6l+YbEu68EbMZ0d1i9dsT7Zo2TBaCqi2v5y4DPtN4cMT3EyX
 n/dcTm+qwr38awe6Th2IDxKMPFiPsg8blQiJqLnc/mrhETelLY2bommIVM9jTS0nRi
 7Jn/HYa8+YADWMBa9nO9kj7ipOfgAy/p5XkrEWv29vS63jTuiAXzp2X5+jBQaFfaQi
 KQi2EDCeYnPTeWybutQr4/oSunPHV/IN2n+Oxg9dR/kLu3jz3F390LPs1H1mwNk/zb
 wAwEGP3D7/Tig==
Received: from icloud.com ([127.0.0.1]) by mr28p00im-ztfo03015001.me.com
 (Oracle Communications Messaging Server 8.0.2.2.20180531 64bit (built May 31
 2018)) with ESMTPSA id <0PGQ002OSFPFEE20@mr28p00im-ztfo03015001.me.com>; Wed,
 17 Oct 2018 07:34:30 +0000 (GMT)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 mlxscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1807170000 definitions=main-1810170069
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,,
 definitions=2018-10-16_14:,, signatures=0
MIME-version: 1.0 (1.0)
Subject: Re: [sw-dev] Re: [isa-dev] riscv-qemu - linux boot is failing for vda
 device
From: Michael Clark <michaeljclark@mac.com>
X-Mailer: iPhone Mail (16A366)
In-reply-to: <20181017051904.ulsm4trmhjrtnwfh@excalibur.cnev.de>
Date: Wed, 17 Oct 2018 20:34:27 +1300
Message-id: <B5F7BE64-98A5-4A92-B4B0-C58B06653C9F@mac.com>
References: <CAOuPNLiR+BLUno8sYjwLwW1BqJbBrH-suBiHEx1-dtMO906Ung@mail.gmail.com>
 <mhng-14c6ccbd-b9ff-40e3-b69b-4333d814c6c1@palmer-si-x1c4>
 <20181016200245.j2gesmdjgoi7zmqh@excalibur.cnev.de>
 <D9003246-0336-4327-97D3-D8F079F640D3@mac.com>
 <20181017051904.ulsm4trmhjrtnwfh@excalibur.cnev.de>
To: Karsten Merker <merker@debian.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181017_003510_870144_F62F33E2 
X-CRM114-Status: GOOD (  13.41  )
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
Message-ID: <20181017073427.UCMTi2JW_xN4wLaWpLsr_vbnqgo43SkX0ZdxJH35350@z>

Cgo+IE9uIDE3LzEwLzIwMTgsIGF0IDY6MTkgUE0sIEthcnN0ZW4gTWVya2VyIDxtZXJrZXJAZGVi
aWFuLm9yZz4gd3JvdGU6Cj4gCj4gT24gV2VkLCBPY3QgMTcsIDIwMTggYXQgMTE6MzA6NTBBTSAr
MTMwMCwgTWljaGFlbCBDbGFyayB3cm90ZToKPj4+IE9uIDE3LzEwLzIwMTgsIGF0IDk6MDIgQU0s
IEthcnN0ZW4gTWVya2VyIDxtZXJrZXJAZGViaWFuLm9yZz4gd3JvdGU6Cj4+PiAKPj4+Pj4gT24g
VHVlLCBPY3QgMTYsIDIwMTggYXQgMTE6Mzg6NTNBTSAtMDcwMCwgUGFsbWVyIERhYmJlbHQgd3Jv
dGU6Cj4+Pj4+PiBPbiBUdWUsIDE2IE9jdCAyMDE4IDA2OjEyOjExIFBEVCAoLTA3MDApLCBwaW50
dS5waW5nQGdtYWlsLmNvbSB3cm90ZToKPj4+Pj4+IE9uIFR1ZSwgT2N0IDE2LCAyMDE4IGF0IDY6
MTAgQU0gUGFsbWVyIERhYmJlbHQgPHBhbG1lckBzaWZpdmUuY29tPiB3cm90ZToKPj4+Pj4+IE9u
IE1vbiwgMTUgT2N0IDIwMTggMTQ6MTQ6NTEgUERUICgtMDcwMCksIHJqb25lc0ByZWRoYXQuY29t
IHdyb3RlOgo+Pj4gWy4uLl0KPj4+Pj4+IFlvdXIgYmVzdCBiZXQgdG9kYXkgaXMgdG8gcnVuIDQu
MTktcmM4LCB3aGljaCBzaG91bGQgYmUgcHJldHR5IHN0YWJsZS4KPj4+Pj4gCj4+Pj4+IFllcywg
SSBjaGVja2VkIHdpdGggbWFpbmxpbmUgbGludXgta2VybmVsIDQuMTkuCj4+Pj4+IE5vdyBJIGFt
IGFibGUgdG8gYm9vdCBzdWNjZXNzZnVsbHkgYW5kIGxvZ2luIGludG8gcWVtdS1yaXNjdiBzaGVs
bC4KPj4+Pj4gVGhhbmsgeW91IHNvIG11Y2ggOikKPj4+Pj4gCj4+Pj4+IEJ1dCBJIGFtIGN1cmlv
dXMgdG8ga25vdyB3aGF0IGNoYW5nZXMgcmVzdWx0ZWQgaW50byB0aGlzIGZpeCwgaW4gNC4xOSBr
ZXJuZWwgPwo+Pj4+PiBXaGljaCBpcyB0aGUgZXhhY3QgcGF0Y2ggaW4gbWFpbmxpbmUsIHRoYXQg
Zml4ZXMgdGhpcyBpc3N1ZT8KPj4+Pj4gQmVjYXVzZSBhdCB0aW1lcyBkdXJpbmcgdGhlIGRldmVs
b3BtZW50LCBpdCB3aWxsIGJlIGRpZmZpY3VsdCB0bwo+Pj4+PiBzaW1wbHkgdXBncmFkZSB0aGUg
a2VybmVsIHZlcnNpb24uCj4+Pj4gCj4+Pj4gWWVzLCB0aGF0J3MgZXhwZWN0ZWQuICBSSVNDLVYg
TGludXggaXMgc3RpbGwgcHJldHR5IGJsZWVkaW5nIGVkZ2UsIHlvdSBqdXN0Cj4+Pj4gaGFwcGVu
ZWQgdG8gY2F0Y2ggaXQgYmV0d2VlbiB3aGVuIG1hc3RlciBzdGFydGVkIHdvcmtpbmcgYW5kIHdo
ZW4gdGhlcmUgd2FzCj4+Pj4gYSBwcm9wZXIgcmVsZWFzZSB0aGF0IGNvbnRhaW5lZCB5b3VyIHBh
dGNoZXMuICBTaW5jZSBtYXN0ZXIgaXMgdmVyeSBjYWxtCj4+Pj4gcmlnaHQgbm93ICh0aGVyZSB3
YXMgYW4gcmM4IGJlZm9yZSByZWxlYXNlLCBidXQgaXQncyB2ZXJ5IGNsb3NlIHRvIGEKPj4+PiBy
ZWxlYXNlKSBpdCdzIE9LIHRvIHVzZSwgYnV0IHlvdSBiZXN0IGJldCBnb2luZyBmb3J3YXJkIGlz
IHRvIHVzZSB0aGUKPj4+PiByZWxlYXNlIHRhcmJhbGxzIGp1c3QgbGlrZSBub3JtYWwuCj4+PiAK
Pj4+IEp1c3QgYXMgYSBkYXRhIHBvaW50IGluIGNhc2UgeW91IHNob3VsZCBmaW5kIGl0IGhlbHBm
dWw6IEknbQo+Pj4gc2luY2UgdHdvIHdlZWtzIHJ1bm5pbmcgNC4xOS1yYzYvLXJjNyBvbiB0aGUg
cWVtdS1yaXNjdiAidmlydCIKPj4+IGJvYXJkIHVuZGVyIHBlcm1hbmVudCBoZWF2eSBsb2FkICh0
aGUgc3lzdGVtIGlzIHJ1bm5pbmcgYSBEZWJpYW4KPj4+IHBhY2thZ2UgYnVpbGRlcikgd2l0aG91
dCBhIHNpbmdsZSBoaWNjdXAuCj4+IAo+PiBIaSBLYXJzdGVuLAo+PiAKPj4gSGF2ZSB5b3UgdHJp
ZWQgcmlzY3YtcWVtdT8gIEkga25vdyBxZW11LXJpc2N2IGdldHMgcXVpdGUgYSBsb3Qgb2YgdGVz
dGluZwo+PiBidXQgSeKAmWQgbGlrZSB0byBnYWluIHNvbWUgbW9yZSBjb25maWRlbmNlIGluIHJp
c2N2LXFlbXUuCj4gCj4gSSBoYXZlIHVwc3RyZWFtIHFlbXUgcnVubmluZyBvbiBvbmUgYm94IGFu
ZCByaXNjdi1xZW11IGZyb20KPiBodHRwczovL2dpdGh1Yi5jb20vcmlzY3YvcmlzY3YtcWVtdS8s
IGJyYW5jaCAicWVtdS1mb3ItdXBzdHJlYW0iLAo+IG9uIGFub3RoZXIsIGFuZCBoYXZlbid0IGVu
Y291bnRlcmVkIGFueSBzdGFiaWxpdHkgcHJvYmxlbXMgb24KPiBlaXRoZXIgb2YgdGhvc2UuCgpP
aCB0aGF04oCZcyBnb29kIG5ld3MuCgpUaGFua3MsCk1pY2hhZWwKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
