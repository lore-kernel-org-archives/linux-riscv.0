Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FDC5C10F1A
	for <linux-riscv@archiver.kernel.org>; Wed,  8 May 2024 01:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:References:
	In-Reply-To:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BvTlKkEw699Xyu5oVsPEwvHo/ccfIDEG5kU76mfl7jw=; b=pnkHTENn9k0JO1
	guChNQ6uxs6FTSa38lnrqXzKj8O0GSrEfve9jIKpxb3LRIGqCvdpKq9C+ilO5dqu8bmqt+EfYYVG3
	j1vbM7G4VppPMUp5XasrWRv+EV8COAUdKkGJ3yq3/oIF5Nywl6MvKOPPX0aXdpitbHbqs9FTaFjxf
	of1xd9IS01kZyBO9r3WoiV5oWaxAJUb8VXnFOGI/78uES11L7XO8fyZBbl0+j1hyO/+7nWuIuojOl
	q0ca4mRukAyUFo4QtfA6H6GJ3bqVAnLrVHnI0CEchOpk8grEdqqWXmJvEP22X1iFhKBoMo5HQA9U9
	UxX7Gu6HbnvZUzwr06Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4WKX-0000000DgMi-34BB;
	Wed, 08 May 2024 01:42:49 +0000
Received: from m15.mail.163.com ([45.254.50.220])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4WKT-0000000DgLF-1JB1
	for linux-riscv@lists.infradead.org;
	Wed, 08 May 2024 01:42:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=qAcwmOcJtkUz7iXSL+0YdjC+Tf34zyZyjt2ptu431Wo=; b=E
	cooEocRPcoof0j9Jgb9r00i0MLjd6lolNFHgxezTSBR7vpl1SOhFb5Bym0rO2WAy
	MTHn/Eu/ZWSqHToHaoHbd1R9e7kjI0cMAV6iz4ORPNlrHHzr0M5BlVoclETuQgRh
	BTNzbh7M4OPGSN61IJMavLVsn6ESQckPmAgqeJ96YM=
Received: from gaoshanliukou$163.com ( [60.27.227.220] ) by
 ajax-webmail-wmsvr-40-120 (Coremail) ; Wed, 8 May 2024 09:42:16 +0800 (CST)
X-Originating-IP: [60.27.227.220]
Date: Wed, 8 May 2024 09:42:16 +0800 (CST)
From: "yang.zhang" <gaoshanliukou@163.com>
To: "Alexandre Ghiti" <alex@ghiti.fr>
Cc: alexghiti@rivosinc.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, "yang.zhang" <yang.zhang@hexintek.com>
Subject: Re:Re: [PATCH V2] riscv: set trap vector earlier
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20230109(dcb5de15)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <bfb82e87-94c0-4a23-b59d-bb57911224b5@ghiti.fr>
References: <20240506022239.6817-1-gaoshanliukou@163.com>
 <bfb82e87-94c0-4a23-b59d-bb57911224b5@ghiti.fr>
X-NTES-SC: AL_Qu2aB/2YvU0o4CacZOkXnEYQh+k3XcK4u/0u2YFVP5E0qiT/wSEYRHJZB3L16u6SFyS3vRWtTxZsxu98Z4lpQI9nkv/NUE9cGOesQFbkm49C
MIME-Version: 1.0
Message-ID: <4feaf8ec.2435.18f55dd9745.Coremail.gaoshanliukou@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: _____wD333R42DpmZiMnAA--.42497W
X-CM-SenderInfo: pjdr2x5dqox3xnrxqiywtou0bp/1tbiNwbX8mXAlHQD7QACs9
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_184245_818831_BA52D238 
X-CRM114-Status: GOOD (  11.33  )
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
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpBdCAyMDI0LTA1LTA3IDEzOjI4OjU4LCAiQWxleGFuZHJlIEdoaXRpIiA8YWxleEBnaGl0aS5m
cj4gd3JvdGU6Cj5IaSBZYW5nLAo+Cj5PbiAwNi8wNS8yMDI0IDA0OjIyLCB5YW5nLnpoYW5nIHdy
b3RlOgo+PiBGcm9tOiAieWFuZy56aGFuZyIgPHlhbmcuemhhbmdAaGV4aW50ZWsuY29tPgo+Pgo+
PiBJZiB0cmFwIGVhcmxpZXIsIHRyYXAgdmVjdG9yIGRvZXNuJ3QgeWV0IHNldCBwcm9wZXJseSwg
Y3VycmVudAo+PiB2YWx1ZSBtYXliZSBzZXQgYnkgcHJldmlvdXMgZmlybXdpcmUsIHR5cGljYWxs
eSBpdCdzIHRoZSBfc3RhcnQgb2Yga2VybmVsLAo+PiBpdCdzIGNvbmZ1c2VkIGFuZCBkaWZmaWN1
bHQgdG8gZGVidWdlLCBzbyBzZXQgaXQgZWFybGllci4KPgo+Cj5XaGF0IGFib3V0Ogo+Cj4iVGhl
IGV4Y2VwdGlvbiB2ZWN0b3Igb2YgdGhlIGJvb3RpbmcgaGFydCBpcyBub3Qgc2V0IGJlZm9yZSBl
bmFibGluZyB0aGUgCj5tbXUgYW5kIHRoZW4gc3RpbGwgcG9pbnRzIHRvIHRoZSB2YWx1ZSBvZiB0
aGUgcHJldmlvdXMgZmlybXdhcmUsIAo+dHlwaWNhbGx5IF9zdGFydF9rZXJuZWwuIFRoYXQgbWFr
ZXMgaXQgaGFyZCB0byBkZWJ1ZyBzZXR1cF92bSgpIHdoZW4gYmFkIAo+dGhpbmdzIGhhcHBlbi4g
U28gZml4IHRoYXQgYnkgc2V0dGluZyB0aGUgZXhjZXB0aW9uIHZlY3RvciBlYXJsaWVyLiIKCkhp
IGFsZXg6Ck1heWJlICJ0eXBpY2FsbHkgX3N0YXJ0IiBub3QgInR5cGljYWxseSBfc3RhcnRfa2Vy
bmVsIiwgcmlnaHQ/ClRoYW5rcyBmb3IgeW91ciBoZWxwoaMKPj4gLS0tCj4+IHYxIC0+IHYyOgo+
PiBBcyBBbGV4IGNvbW1lbnRlZCwgcmVtb3ZlIHRoZSBwYXRjaCBmb3Igc3VwcG9ydGluZyBodWdl
c2l6ZSBrZXJuZWsgaW1hZ2UKPj4gQWRkIHRoZSBvbWlzc2l2ZSBsb2dpYyBvZiBzZXQgdHJhcCB2
ZWN0b3IgZWFybGllcgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiB5YW5nLnpoYW5nIDx5YW5nLnpoYW5n
QGhleGludGVrLmNvbT4KPj4gLS0tCj4+ICAgYXJjaC9yaXNjdi9rZXJuZWwvaGVhZC5TIHwgMyAr
KysKPj4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L2tlcm5lbC9oZWFkLlMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9oZWFkLlMKPj4g
aW5kZXggNDIzNmE2OWMzNWNiLi4wM2RjNDQwZTY0M2UgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlz
Y3Yva2VybmVsL2hlYWQuUwo+PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9oZWFkLlMKPj4gQEAg
LTMwMCw2ICszMDAsOSBAQCBTWU1fQ09ERV9TVEFSVChfc3RhcnRfa2VybmVsKQo+PiAgICNlbHNl
Cj4+ICAgCW12IGEwLCBhMQo+PiAgICNlbmRpZiAvKiBDT05GSUdfQlVJTFRJTl9EVEIgKi8KPj4g
KwkvKiBTZXQgdHJhcCB2ZWN0b3IgdG8gc3BpbiBmb3JldmVyIHRvIGhlbHAgZGVidWcgKi8KPj4g
KwlsYSBhMywgLkxzZWNvbmRhcnlfcGFyawo+PiArCWNzcncgQ1NSX1RWRUMsIGEzCj4+ICAgCWNh
bGwgc2V0dXBfdm0KPj4gICAjaWZkZWYgQ09ORklHX01NVQo+PiAgIAlsYSBhMCwgZWFybHlfcGdf
ZGlyCj4KPk5vdGUgdGhhdCB0aGlzIHBhdGNoIHdpbGwgYWxsb3cgdG8gY2F0Y2ggYW55IGV4Y2Vw
dGlvbiBoYXBwZW5pbmcgaW4gCj5zZXR1cF92bSgpIGJ1dCBhcyB3ZSByZXNldCBzdHZlYyBpbiBy
ZWxvY2F0ZV9lbmFibGVfbW11LiBCdXQgdGhhdCdzIG9rLCAKPml0IHdpbGwgaGVscCBjYXRjaGlu
ZyB3ZWlyZCBidWdzIG1vcmUgZWFzaWx5IDopCj4KPldpdGggdGhlIGNvbW1pdCBtZXNzYWdlIGZp
eGVkLCB5b3UgY2FuIGFkZDoKPgo+UmV2aWV3ZWQtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdo
aXRpQHJpdm9zaW5jLmNvbT4KPgo+VGhhbmtzLAo+Cj5BbGV4Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
