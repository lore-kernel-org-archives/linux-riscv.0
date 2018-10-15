Return-Path: <SRS0=r0AO=M3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E6C3C04AA5
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Oct 2018 20:26:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C83FA208B3
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Oct 2018 20:26:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="obuyCLdM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mac.com header.i=@mac.com header.b="qnN3suve"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C83FA208B3
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mac.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-id:Date:
	In-reply-to:From:Subject:MIME-version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DPOyfgOEszO7K6aFPoKqEm9UWKsnNZB23qyn9YJyOvk=; b=obuyCLdMaMVcl3
	jJSsYL8mop8MEK894caZ9cy7MevXqHblCMEBkaEgitJIV4Lss4AR0V7zy7wkMK6BGWOt9HFUAP/8N
	tY1m1CRkumGEJORKkdagKfrQ/VvaXjWTIcZaYefymNs90pFslLytbicOma/sQkZ7jdXge305BSJY7
	rru7UofHAHlsYvfo6xhTN6IKx55g0EXKZtnbitTGpaoCVP937bhcl+L8j7RoMG/w+oxzf9277Sgkr
	UQ2mLH+Xc785CzgliZQXE+/8QwmDJPI7YzaAxFWURSdQROlJKVFGK64tDO5puHQ+2TaCV33ZzTfNj
	UoWRyLiAx/6tJhGsBlVQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gC9Rr-0004d1-LU; Mon, 15 Oct 2018 20:26:43 +0000
Received: from mr85p00im-ztdg06021101.me.com ([17.58.23.180])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gC9Ro-0004bj-7x
 for linux-riscv@lists.infradead.org; Mon, 15 Oct 2018 20:26:42 +0000
Received: from process-dkim-sign-daemon.mr85p00im-ztdg06021101.me.com by
 mr85p00im-ztdg06021101.me.com
 (Oracle Communications Messaging Server 8.0.2.2.20180531 64bit (built May 31
 2018)) id <0PGN00100POWRP00@mr85p00im-ztdg06021101.me.com> for
 linux-riscv@lists.infradead.org; Mon, 15 Oct 2018 20:26:26 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mac.com; s=04042017;
 t=1539635186; bh=jagoQOGFEg913QJncYroQD7NbEa9vQMKQeU1KzG8Kg4=;
 h=Content-type:MIME-version:Subject:From:Date:Message-id:To;
 b=qnN3suvewCCkGXWlFuRFB1Z3UPX/ABjcbn1QB68VMw/QRveP4xshmx/HM+Uk7htgY
 srAu8Sntabo7r0RXaNfQd3gqUi/eJT6lrTDsfd7uGTlnkSqT3cikq8PiAB4kJ/RTtS
 36IfU0lQJJazkPA3wF17GfUQ46EyoJIsQTRby+XMxrLP9Tj9VLPYMzvVFETlJbe0u3
 ypxnOlcFIvPA5kbn+EMdgphVNQsqFVY9uUdzjM9huSvGX0w1A5ibBjgbjAcdas87DB
 4mUExPtC+g3kw8tbFP/DZj4bN9Y7YfyrFq/hYsnVQfXMyluJ7vpkA4i8DbWqC0e6Q4
 vtuAK+CNkt6eg==
Received: from icloud.com ([127.0.0.1]) by mr85p00im-ztdg06021101.me.com
 (Oracle Communications Messaging Server 8.0.2.2.20180531 64bit (built May 31
 2018)) with ESMTPSA id <0PGN00I3GQ3WID10@mr85p00im-ztdg06021101.me.com>; Mon,
 15 Oct 2018 20:26:23 +0000 (GMT)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 mlxscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1807170000 definitions=main-1810150176
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,,
 definitions=2018-10-15_11:,, signatures=0
MIME-version: 1.0 (1.0)
Subject: Re: [isa-dev] riscv-qemu - linux boot is failing for vda device
From: Michael Clark <michaeljclark@mac.com>
X-Mailer: iPhone Mail (16A366)
In-reply-to: <CAOuPNLgimMwWrw6oXs7Eu8xBG+geOt53D_LjiiNk7=OEtLtz3g@mail.gmail.com>
Date: Tue, 16 Oct 2018 09:26:20 +1300
Message-id: <0D61A5C7-23B7-466E-BE00-458675DE4FF7@mac.com>
References: <CAOuPNLgimMwWrw6oXs7Eu8xBG+geOt53D_LjiiNk7=OEtLtz3g@mail.gmail.com>
To: Pintu Kumar <pintu.ping@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181015_132640_288760_C8BA5BE1 
X-CRM114-Status: GOOD (  24.37  )
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
Cc: linux-riscv@lists.infradead.org, sw-dev@groups.riscv.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181015202620.8iinStje4C4DCMnNjwgnjJ1DNONRkdpviWza0vpyTOA@z>

RHJvcHBpbmcgaXNhLWRldiwgYWRkaW5nIHN3LWRldgoKPiBPbiAxNi8xMC8yMDE4LCBhdCAzOjAw
IEFNLCBQaW50dSBLdW1hciA8cGludHUucGluZ0BnbWFpbC5jb20+IHdyb3RlOgo+IAo+IEhpLAo+
IEkgYW0gdHJ5aW5nIHRvIHNldHVwIHJpc2N2LXFlbXUgYm9vdGluZyBvbiBhIG5ldyBVYnVudHUg
UEMuCj4gSSBkb250IHdhbnQgdG8gdXNlIGZyZWVkb20tdS1zZGssIHNvIEkgYW0gcHJlcGFyaW5n
IG15IG93biBlbnZpcm9ubWVudC4KPiBJIGNvdWxkIGFibGUgdG8gYnVpbGQgdGhlIGZvbGxvd2lu
ZzoKPiAtIHJpc2N2LXRvb2xjaGFpbgo+IC0gcmlzY3YtbGludXgKPiAtIHJpc2N2LXFlbXUKPiAt
IHJpc2N2LXBrCj4gLSBidXN5YmVhcgo+IAo+IEFmdGVyIHRoYXQsIEkgYW0gdHJ5aW5nIHRvIGJv
b3QgcmlzY3YtcWVtdSwgdXNpbmcgdGhlIGZvbGxvd2luZyBjb21tYW5kOgo+ICMgc3VkbyBxZW11
LXN5c3RlbS1yaXNjdjY0IC1ub2dyYXBoaWMgLW1hY2hpbmUgdmlydCAta2VybmVsCj4gUEsvcmlz
Y3YtcGsvYnVpbGQvYmJsIC1hcHBlbmQgInJvb3Q9L2Rldi92ZGEgcm8gY29uc29sZT10dHlTMCIg
LWRyaXZlCj4gZmlsZT1idXN5YmVhci5iaW4sZm9ybWF0PXJhdyxpZD1oZDAgLWRldmljZQo+IHZp
cnRpby1ibGstZGV2aWNlLGRyaXZlPWhkMAoKTm90ZTogc3VkbyBpcyBub3QgcmVxdWlyZWQuIHN1
ZG8gaXMgdXNlZCBpbiB0aGUgYnVzeWJlYXIgc3RhcnQtcWVtdS5zaCBzY3JpcHQgYXMgaXQgdXNl
cyBicmlkZ2VkIG5ldHdvcmtpbmcuIFRoZSBsYXRlc3QgdmVyc2lvbiBvZiBidXN5YmVhciBwb2lu
dHMgYXQgbGludXgtNC4xOS1yYzUgc28gdGhlIGlzc3VlIG1heSBoYXZlIGJlZW4gZml4ZWQuCgo+
IEJ1dCwgSSBhbSBnZXR0aW5nIGtlcm5lbCBwYW5pYy4KPiAKPiAtLS0tLS0tLS0KPiBiYmwgbG9h
ZGVyCj4gLi4uLgo+IExpbnV4IHZlcnNpb24gNC4xOC4wLXJjNi4uLgo+IC4uLi4KPiBkZXZ0bXBm
czogaW5pdGlhbGl6ZWQKPiBjcHUgY3B1MDogRXJyb3IgLTIgY3JlYXRpbmcgb2Zfbm9kZSBsaW5r
CgpOb3Qgc3VyZSB3aGF0IGlzIGhhcHBlbmluZyBoZXJlLgoKPiAuLi4uLi4KPiBTQ1NJIHN1YnN5
c3RlbSBpbml0aWFsaXplZAo+IC4uLi4KPiBVbnBhY2tpbmcgaW5pdHJhbWZzLi4uCj4gLi4uLgo+
IGxvb3A6IG1vZHVsZSBsb2FkZWQKPiB2aXJ0aW9fYmxrOiBwcm9iZSBvZiB2aXJ0aW8wIGZhaWxl
ZCB3aXRoIGVycm9yIC0yMgo+IC4uLgo+IFZGUzogQ2Fubm90IG9wZW4gcm9vdCBkZXZpY2UgInZk
YSIgb3IgdW5rbm93bi1ibG9jaygwLDApOiBlcnJvciAtNgoKSXQgaXMgZmluZGluZyB2ZGEgZnJv
bSB0aGUgY29tbWFuZC1saW5lLCB0aHVzIGNob3NlbiBpbiB0aGUgZ2VuZXJpYyBvcGVuLWZpcm13
YXJlIGNvZGUgaXMgd29ya2luZyBmaW5lLgoKPiBQbGVhc2UgYXBwZW5kIGEgY29ycmVjdCAicm9v
dD0iIGJvb3Qgb3B0aW9uOyBoZXJlIGFyZSB0aGUgYXZhaWxhYmxlIHBhcnRpdGlvbnM6Cj4gS2Vy
bmVsIHBhbmljIC0gbm90IHN5bmNpbmc6IFZGUzogVW5hYmxlIHRvIG1vdW50IHJvb3QgZnMgb24g
dW5rbm93bi1ibG9jaygwLDApCj4gQ1BVOiAwIFBJRDogMSBDb21tOiBzd2FwcGVyLzAgTm90IHRh
aW50ZWQgNC4xOC4wLXJjNi0xMzkyNy1nZDcyZTkwZjMgIzMKPiAtLS0tLS0tLS0tLQo+IAo+IEJh
c2ljYWxseSwgaXQgY291bGQgbm90IGZpbmQgdGhlICJ2ZGEiIGRldmljZSwgZXZlbiB0aG91Z2gg
SSBwYXNzZWQKPiB0aGUgInJvb3Q9L2Rldi92ZGEiCj4gCj4gV2hhdCBjb3VsZCBiZSB0aGUgY2F1
c2Ugb2YgdGhpcyBpc3N1ZT8KPiAKPiBDT05GSUdfREVWVE1QRlM9eQo+IENPTkZJR19ERVZUTVBG
U19NT1VOVD15Cj4gQ09ORklHX1ZJUlRJT19CTEs9eQo+ICMgQ09ORklHX1ZJUlRJT19CTEtfU0NT
SSBpcyBub3Qgc2V0Cj4gIyBDT05GSUdfU0NTSV9WSVJUSU8gaXMgbm90IHNldAo+IENPTkZJR19W
SVJUSU9fTkVUPXkKCkkgY2Fu4oCZdCB0ZWxsIGF0IGEgZ2xhbmNlIHdoYXQgeW91ciBwcm9ibGVt
IGlzLCBidXQgaWYgdGhhdCBpcyB5b3VyIGNvbXBsZXRlIC5jb25maWcgZGVsdGEgZnJvbSBkZWZj
b25maWcgdGhlbiB3ZSBjYW4gZHJvcCBpdCBpbnRvIGJ1c3liZWFyIGFuZCBwb2ludCBpdCBhdCB5
b3VyIGtlcm5lbCB2ZXJzaW9uOyBjdXJyZW50bHkgdGhlIGJ1aWxkIHNjcmlwdHMgdXNlIGFuIGFy
Y2hpdmUuCgo+IFRoZXNlIGFyZSBhbHJlYWR5IGVuYWJsZWQgaW4gdGhlIGtlcm5lbC4KPiBJZiBJ
IGFtIG1pc3NpbmcgYW55IGNvbmZpZywgcGxlYXNlIGxldCBtZSBrbm93LgoKWW91IGFyZSBwcm9i
YWJseSBtaXNzaW5nIGNvbmZpZy4gRG8geW91IGhhdmUgdGhlIGZpbGVzeXN0ZW1zIGVuYWJsZWQ/
Cgo+IFRoYW5rcywKPiBQaW50dQo+IAo+IC0tIAo+IFlvdSByZWNlaXZlZCB0aGlzIG1lc3NhZ2Ug
YmVjYXVzZSB5b3UgYXJlIHN1YnNjcmliZWQgdG8gdGhlIEdvb2dsZSBHcm91cHMgIlJJU0MtViBJ
U0EgRGV2IiBncm91cC4KPiBUbyB1bnN1YnNjcmliZSBmcm9tIHRoaXMgZ3JvdXAgYW5kIHN0b3Ag
cmVjZWl2aW5nIGVtYWlscyBmcm9tIGl0LCBzZW5kIGFuIGVtYWlsIHRvIGlzYS1kZXYrdW5zdWJz
Y3JpYmVAZ3JvdXBzLnJpc2N2Lm9yZy4KPiBUbyBwb3N0IHRvIHRoaXMgZ3JvdXAsIHNlbmQgZW1h
aWwgdG8gaXNhLWRldkBncm91cHMucmlzY3Yub3JnLgo+IFZpc2l0IHRoaXMgZ3JvdXAgYXQgaHR0
cHM6Ly9ncm91cHMuZ29vZ2xlLmNvbS9hL2dyb3Vwcy5yaXNjdi5vcmcvZ3JvdXAvaXNhLWRldi8u
Cj4gVG8gdmlldyB0aGlzIGRpc2N1c3Npb24gb24gdGhlIHdlYiB2aXNpdCBodHRwczovL2dyb3Vw
cy5nb29nbGUuY29tL2EvZ3JvdXBzLnJpc2N2Lm9yZy9kL21zZ2lkL2lzYS1kZXYvQ0FPdVBOTGdp
bU13V3J3Nm9YczdFdTh4QkclMkJnZU90NTNEX0xqaWlOazclM0RPRXRMdHozZyU0MG1haWwuZ21h
aWwuY29tLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
