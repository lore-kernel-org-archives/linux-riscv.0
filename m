Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A046C77B7C
	for <linux-riscv@archiver.kernel.org>; Sun, 21 May 2023 05:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Vb/jWc+BMQdwQ5MngFySK4zFrPw249DJMEwxM2FEs0=; b=AHkuPNxFVvcGSo
	/DBQ0tZ9csM3B22Y/gNMl3UyjUylYh+vBuXVOWhPQ1eV/iOESwpl6DGJpBV9SHwxFvOEqHcq8lo9K
	E+LAdSKoEPfKjbn/27PVi0h0BZk8QLllg2joMxXvkZ9uSh81ru26krREMkO4ByH7nI434ZiQ259TG
	lW6OLt+0H5SpayHCZVhgYqhSm5xWOSQhUGjJ7qKhE3kP12yjfp6Ec5vkQyHwS5pfxJWSefOy6ZElJ
	8JODxdlnO+/dQ6edj11siyJdot/gVdqTIRKmAcJdJT3eOYC1mDHCrN5kaSm9Add+ed84Y7UeajI0A
	1Sh1nNADCmY8PmjQ7jyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0bUw-0039hf-0F;
	Sun, 21 May 2023 05:20:50 +0000
Received: from sypressi2.dnainternet.net ([83.102.40.154])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0bUr-0039gw-2T
	for linux-riscv@lists.infradead.org;
	Sun, 21 May 2023 05:20:47 +0000
Received: from localhost (localhost [127.0.0.1])
	by sypressi2.dnainternet.net (Postfix) with ESMTP id 77CE51382B;
	Sun, 21 May 2023 08:20:42 +0300 (EEST)
X-Virus-Scanned: DNA Internet at dnainternet.net
Received: from sypressi2.dnainternet.net ([83.102.40.154])
	by localhost (sypressi2.dnainternet.net [127.0.0.1]) (DNA Internet, port 10041)
	with ESMTP id bL63GhnjK1Ib; Sun, 21 May 2023 08:20:42 +0300 (EEST)
Received: from luumupuu2.dnainternet.net (luumupuu2.dnainternet.net [83.102.40.55])
	by sypressi2.dnainternet.net (Postfix) with ESMTP id 18A8112DC9;
	Sun, 21 May 2023 08:20:42 +0300 (EEST)
Received: from basile.localnet (87-92-194-88.rev.dnainternet.fi [87.92.194.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by luumupuu2.dnainternet.net (Postfix) with ESMTPS id C6E8B74;
	Sun, 21 May 2023 08:20:39 +0300 (EEST)
From: =?ISO-8859-1?Q?R=E9mi?= Denis-Courmont <remi@remlab.net>
To: linux-riscv@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH -next v20 24/26] riscv: Add documentation for Vector
Date: Sun, 21 May 2023 08:20:39 +0300
Message-ID: <2915864.UkfCvvTAve@basile.remlab.net>
Organization: Remlab
In-Reply-To: <20230518161949.11203-25-andy.chiu@sifive.com>
References:  <20230518161949.11203-1-andy.chiu@sifive.com>
 <20230518161949.11203-25-andy.chiu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230520_222046_115368_765E0902 
X-CRM114-Status: GOOD (  20.56  )
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

CUhpLAoKTGUgdG9yc3RhaW5hIDE4LiB0b3Vrb2t1dXRhIDIwMjMgMTkuMTkuNDcgRUVTVCwgdm91
cyBhdmV6IMOpY3JpdCA6Cj4gVGhpcyBwYXRjaCBhZGQgYSBicmllZiBkb2N1bWVudGF0aW9uIG9m
IHRoZSB1c2Vyc3BhY2UgaW50ZXJmYWNlIGluCj4gcmVnYXJkIHRvIHRoZSBSSVNDLVYgVmVjdG9y
IGV4dGVuc2lvbi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmR5IENoaXUgPGFuZHkuY2hpdSBhdCBz
aWZpdmUuY29tPgo+IFJldmlld2VkLWJ5OiBHcmVlbnRpbWUgSHUgPGdyZWVudGltZS5odSBhdCBz
aWZpdmUuY29tPgo+IFJldmlld2VkLWJ5OiBWaW5jZW50IENoZW4gPHZpbmNlbnQuY2hlbiBhdCBz
aWZpdmUuY29tPgo+IENvLWRldmVsb3BlZC1ieTogQmFnYXMgU2FuamF5YSA8YmFnYXNkb3RtZSBh
dCBnbWFpbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQmFnYXMgU2FuamF5YSA8YmFnYXNkb3RtZSBh
dCBnbWFpbC5jb20+Cj4gLS0tCj4gQ2hhbmdlbG9nIHYyMDoKPiAgLSBEcm9wIGJpdC1maWVsZCBy
ZXByZXNzZW50YXRpb24gYW5kIHR5cG9zIChCaj9ybikKPiAgLSBGaXggZG9jdW1lbnQgc3R5bGlu
ZyAoQmFnYXMpCj4gLS0tCj4gIERvY3VtZW50YXRpb24vcmlzY3YvaW5kZXgucnN0ICB8ICAgMSAr
Cj4gIERvY3VtZW50YXRpb24vcmlzY3YvdmVjdG9yLnJzdCB8IDEyMCArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMjEgaW5zZXJ0aW9ucygrKQo+
ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9yaXNjdi92ZWN0b3IucnN0Cj4gCj4g
ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vcmlzY3YvaW5kZXgucnN0IGIvRG9jdW1lbnRhdGlv
bi9yaXNjdi9pbmRleC5yc3QKPiBpbmRleCAxNzVhOTFkYjAyMDAuLjk1Y2Y5YzFlMWRhMSAxMDA2
NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL3Jpc2N2L2luZGV4LnJzdAo+ICsrKyBiL0RvY3VtZW50
YXRpb24vcmlzY3YvaW5kZXgucnN0Cj4gQEAgLTEwLDYgKzEwLDcgQEAgUklTQy1WIGFyY2hpdGVj
dHVyZQo+ICAgICAgaHdwcm9iZQo+ICAgICAgcGF0Y2gtYWNjZXB0YW5jZQo+ICAgICAgdWFiaQo+
ICsgICAgdmVjdG9yCj4gCj4gICAgICBmZWF0dXJlcwo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL3Jpc2N2L3ZlY3Rvci5yc3QgYi9Eb2N1bWVudGF0aW9uL3Jpc2N2L3ZlY3Rvci5yc3QK
PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4uNWQzN2ZkMjEyNzIw
Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vcmlzY3YvdmVjdG9yLnJzdAo+
IEBAIC0wLDAgKzEsMTIwIEBACj4gKy4uIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4w
Cj4gKwo+ICs9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+ICtWZWN0
b3IgRXh0ZW5zaW9uIFN1cHBvcnQgZm9yIFJJU0MtViBMaW51eAo+ICs9PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PQo+ICsKPiArVGhpcyBkb2N1bWVudCBicmllZmx5IG91
dGxpbmVzIHRoZSBpbnRlcmZhY2UgcHJvdmlkZWQgdG8gdXNlcnNwYWNlIGJ5IExpbnV4Cj4gaW4g
K29yZGVyIHRvIHN1cHBvcnQgdGhlIHVzZSBvZiB0aGUgUklTQy1WIFZlY3RvciBFeHRlbnNpb24u
Cj4gKwo+ICsxLiAgcHJjdGwoKSBJbnRlcmZhY2UKPiArLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4g
Kwo+ICtUd28gbmV3IHByY3RsKCkgY2FsbHMgYXJlIGFkZGVkIHRvIGFsbG93IHByb2dyYW1zIHRv
IG1hbmFnZSB0aGUgZW5hYmxlbWVudAo+ICtzdGF0dXMgZm9yIHRoZSB1c2Ugb2YgVmVjdG9yIGlu
IHVzZXJzcGFjZToKPiArCj4gKyogcHJjdGwoUFJfUklTQ1ZfVl9TRVRfQ09OVFJPTCwgdW5zaWdu
ZWQgbG9uZyBhcmcpCj4gKwo+ICsgICAgU2V0cyB0aGUgVmVjdG9yIGVuYWJsZW1lbnQgc3RhdHVz
IG9mIHRoZSBjYWxsaW5nIHRocmVhZCwgd2hlcmUgdGhlCj4gY29udHJvbAo+ICsgICAgYXJndW1l
bnQgY29uc2lzdHMgb2YgdHdvIDItYml0IGVuYWJsZW1lbnQgc3RhdHVzZXMgYW5kIGEgYml0Cj4g
Zm9yIGluaGVyaXRhbmNlCj4gKyAgICBtb2RlLiBPdGhlciB0aHJlYWRzIG9mIHRoZSBjYWxsaW5n
IHByb2Nlc3MgYXJlCj4gdW5hZmZlY3RlZC4KCkkgc29tZXdoYXQgd29uZGVyIHdobyBpcy9hcmUg
dGhlIGludGVuZGVkIHVzZXJzIG9mIHRoaXMgbmV3IHByY3RsKCkuIEFyZSB0aGV5IAp0aGUgcnVu
LXRpbWUgKGxpYmMpPyBUaGUgbWFpbiBwcm9ncmFtPyBMaWJyYXJpZXMgdXNpbmcgUlZWIGludGVy
bmFsbHkgKHRoaW5rIApPcGVuU1NMLCBOZXR0bGUsIEZGbXBlZywgZXRjKT8gVGhlIGluaXQgc3lz
dGVtPwoKTGlicmFyeSBjb2RlIGRvZXNuJ3QgdHlwaWNhbGx5IGtub3cgaG93IHN0YWNrcyBhcmUg
YWxsb2NhdGVkIGFuZCBob3cgc2lnbmFsIAphcmUgaGFuZGxlZCAob24gYWx0ZXJuYXRlIG9yIG5v
cm1hbCBzdGFja3MpLCBzaW5jZSBzaWduYWwgaGFuZGxlcnMgYXJlIApwcm9jZXNzLWdsb2JhbCBz
dGF0ZS4gU28gSSBmaWd1cmUgdGhhdCBsaWJyYXJpZXMgc2hvdWxkIGtlZXAgb2ZmIG9mZiB0aGlz
IG9uZS4KCkNvbnZlcnNlbHksIGl0IHdvdWxkIGJlIGltcHJhY3RpY2FsIGZvciBwcm9ncmFtcyB0
byBjYWxsIGEgTGludXgtc3BlY2lmaWMgUklTQy0KVi1zcGVjaWZpYyBpbiBvciBhcm91bmQgdGhl
aXIgbWFpbigpLiBBbmQgdGhlbiBsaWJjIHByZXN1bWFibHkgc2hvdWxkIG5vdCAKb3ZlcnJpZGUg
dGhlIGNvbmZpZ3VyZWQgcG9saWN5IHRoYXQgY29tZXMgZnJvbSBzeXNjdGwgb3IgZnJvbSB0aGUg
cGFyZW50IApwcm9jZXNzLgoKU28gSSBndWVzcyB0aGF0IHRoYXQgbGVhdmVzIGp1c3QgdGhlIGlu
aXQgc3lzdGVtIChpbiBhIGJyb2FkIHNlbnNlKSB0aGVuPwoKSW4gYW55IGNhc2UsIEkgdGhpbmsg
dGhlIGludGVuZGVkIHVzZSBzaG91bGQgYmUgY2xhcmlmaWVkIHdpdGggcHJvcGVyIHVzYWdlIApn
dWlkZWxpbmVzLiBPdGhlcndpc2UsIHdoYXQgSSBiZXQgaGFwcGVucyBpcyBSVlYtY2FwYWJsZSBs
aWJyYXJpZXMganVzdCAKYmxpbmRseSBpbnZva2UgdGhlIHByY3RsKCkgdG8gImVuYWJsZSBSVlYi
LCBkZWFmZWF0aW5nIHRoZSBwdXJwb3NlIG9mIGhhdmluZyAKdGhlIHByY3RsKCkgaW4gdGhlIGZp
cnN0IHBsYWNlLgoKLS0gClLDqW1pIERlbmlzLUNvdXJtb250Cmh0dHA6Ly93d3cucmVtbGFiLm5l
dC8KCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
