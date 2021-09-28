Return-Path: <SRS0=vGgu=OS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A2CBC433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Sep 2021 18:36:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C646460F9D
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Sep 2021 18:36:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C646460F9D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=HHj4rMJ44bM0ZyYWqe+6rQcO4QQHdlMTc6GdwqdA7Dc=; b=Paw9+hzW9961Nc1RU6yhNSrVn7
	18o+jKvTPQfeEKGrrfoqsRM3ugg1N8s6/jt0mZPuTOuuIwjxYYbWzJEiKcVXDfNQYl7Ty9eLMFTHd
	HggKoLpGp17R1IGDyTgCGDqeuQqAgDMee10tgrPMgQky4oL2+oo2l0Wynqwgd0HM3edG3jRZgzbFM
	+8+Dy+lY1NpXZ8n/MNfaUd70AbkGbUfHwj2OvKZLC/7wQfMhMJx4Hfv6aoCKv00DCgcaZpio2t5kR
	tG88ZtI4EX61mLpkE6wRJ8Z6dSCxzhneQTR5ceNZxn1wk5TQJW+r9XYspyVpCRKr9WwLIvi4VrWLb
	8lMD/mtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVHxV-008U00-6t; Tue, 28 Sep 2021 18:36:05 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVHwM-008Tah-Ab
 for linux-riscv@lists.infradead.org; Tue, 28 Sep 2021 18:34:56 +0000
Received: by mail-pj1-x102a.google.com with SMTP id
 om12-20020a17090b3a8c00b0019eff43daf5so3520846pjb.4
 for <linux-riscv@lists.infradead.org>; Tue, 28 Sep 2021 11:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=mg9oslISXemNp0lW0mNCM+xtGCXhZ1w4ANpDRfUjljo=;
 b=EeNgh6uIEiZ/SVkpw2Qkbd9ztFNbch8UOzd4qIWZVOJrZqXKSqN3FOaZYt6zT6bbdE
 48ZLHGEW4HesUdqISQ8VmQnDQ6F/sgfDJTtJkn3ENQMDH2VbquNGGbJ17vRBS0SZX35D
 Bgi2ucr6k/XOC0ahZGmD+8rbCWyZycWfHX4m5XyT9yQ0ZVKEWqVaSCRTO3+Oxz3TRUG6
 LF9gOK0rqm4dgmey4M1vCRDoY8HIRjGoNWCY/pRh5oahAdRuHe++jShqWbRcw3TmV/pd
 aVcUEFSVkEr86IaoEf8OpWeImRFK/gxJ59LAmIljlEfEuUtpaJO9Fyz43WgWnYHlwP23
 pldA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=mg9oslISXemNp0lW0mNCM+xtGCXhZ1w4ANpDRfUjljo=;
 b=V1kypuVUiibjKn72ZtAHWHlq/za8KcZMnmUFzhNPGNepmpAicVo5Ql2vCeIsDkXvcn
 QDTGa1mxLMDdylaS/vHxAmqWmier4tr9oVfO/PazZh7yQlsUJf8HP1GHZQWTYR/OViGj
 I19/vdzVlNTAZokXLssq8r8NRFEuPCOPNDZAqIUMqU9iliKm3OajqXBLzyNWSzTAlICD
 3wb6w84Ad2x4Wcq0tgzAStPFP1ktsemVNJsq6t/hqEctg93FezJgo9opi5r67/2vCV2v
 hC7pLuQtmMgaFClLDegDxn0GS3zEjs4/C6wOf0TEFVpTF5UPxaTnaJ8KAWlIIt28Au12
 rcfg==
X-Gm-Message-State: AOAM531HTvLp3Cv1Ulm53oOhmpBiJMoZ5dh3gV3RsHRh3cHXpMrRmESR
 +G9iHqWXw+m5umBCWu0AnyTjCw==
X-Google-Smtp-Source: ABdhPJww+HQf7d3DHNbWW+F1PP3BJKgpqnsbGWwaNFL/lt4xo1+sj5XudaK7304hnBHTsLCvo1Z8jA==
X-Received: by 2002:a17:90a:4a03:: with SMTP id
 e3mr1466648pjh.198.1632854092595; 
 Tue, 28 Sep 2021 11:34:52 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id i8sm21327344pfq.22.2021.09.28.11.34.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 11:34:51 -0700 (PDT)
Date: Tue, 28 Sep 2021 11:34:51 -0700 (PDT)
X-Google-Original-Date: Tue, 28 Sep 2021 11:34:48 PDT (-0700)
Subject: Re: Status of the various RISC-V specification and policy
In-Reply-To: <63E6E860-22F0-457D-B17B-3B6625BA4A99@riscv.org>
CC: atishp@atishpatra.org, linux-riscv@lists.infradead.org,
 u-boot@lists.denx.de, 
 ahs3@redhat.com, pbonzini@redhat.com, Christoph Hellwig <hch@lst.de>,
 drjones@redhat.com, xypron.glpk@gmx.de, tekkamanninja@gmail.com,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 ksankaran@ventanamicro.com, ptomsich@ventanamicro.com, anup@brainfault.org,
 stephano@riscv.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: markhimelstein@riscv.org
Message-ID: <mhng-ab0efec8-8329-4521-9094-05cad25c6c09@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_113454_490440_D037DF9B 
X-CRM114-Status: GOOD (  23.41  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAyNyBTZXAgMjAyMSAwODo1NzoxNSBQRFQgKC0wNzAwKSwgbWFya2hpbWVsc3RlaW5A
cmlzY3Yub3JnIHdyb3RlOgo+IHRoZSB3b3JkcyBpbiB0aGlzIGRvY3VtZW50IDogCj4KPiBodHRw
czovL3dpa2kucmlzY3Yub3JnL3BsdWdpbnMvc2VydmxldC9tb2JpbGU/Y29udGVudElkPTEzMDk4
MjMwI2NvbnRlbnQvdmlldy8xMzA5ODIzMAo+Cj4gbWFrZSBpdCB2ZXJ5IGNsZWFyIHdoZW4gY2hh
bmdlcyBhcmUgYWxsb3dlZCBvciBub3QgYW5kIGxpa2VseSBvciBub3QuCj4KPiBpZiB5b3UgdGhp
bmsgdGhlIHZlcmJpYWdlIGlzIHNvbWVob3cgYW1iaWd1b3VzIHBsZWFzZSBoZWxwIHVzIG1ha2Ug
aXQgYmV0dGVyLgoKSSdtIG5vdCByZWFsbHkgd29ycmllZCBhYm91dCBjaGFuZ2VzLCBJJ20gd29y
cmllZCBhYm91dCBhIGNvbW1pdHRtZW50IHRvIApmdXR1cmUgY29tcGF0aWJpbGl0eS4gIFdoZW4g
d2UgdGFrZSBjb2RlIGludG8gdGhlIGtlcm5lbCAoYW5kIG1vc3Qgb3RoZXIgCmNvcmUgc3lzdGVt
cyBwcm9qZWN0cykgd2UncmUgdGFraW5nIG9uIHRoZSBidXJkZW4gb2Ygc3VwcG9ydGluZyAodW50
aWwgCnNvbWVvbmUgY2FuIHByb3ZlIHRoZXJlIGFyZSBubyBtb3JlIHVzZXJzKSwgd2hpY2ggaXMg
dmVyeSBkaWZmaWN1bHQgdG8gCmRvIHdoZW4gdGhlIElTQSBjaGFuZ2VzIGluIGFuIGluY29tcGF0
aWJsZSBmYXNoaW9uLiAgVGhlIHdob2xlIHBvaW50IG9mIAphZ3JlZWluZyBvbiB0aGUgZnJvemVu
IHRoaW5nIHdhcyB0aGF0IGl0IGdhdmUgdXMgYSBjb21taXR0bWVudCBmcm9tIHRoZSAKc3BlY2lm
Y2F0aW9uIGF1dGhvcnMgdGhhdCB0aGUgZnV0dXJlIElTQSB3b3VsZCBiZSBjb21wYXRpYmxlIHdp
dGggdGggCmZyb3plbiBleHRlbnNpb25zLgoKV2UncmUgYWxyZWFkeSBpbiB0aGlzIHNwb3Qgd2l0
aCB0aGUgViBleHRlbnNpb24gYW5kIHRoZSB3aG9sZSBzdGFibGUgCnRoaW5nLCB0aGlzIGRlZmlu
aXRhaW9uIG9mIGZyb3plbiBsb29rcyB2ZXJ5IG11Y2ggbGlrZSB3aGF0IHdhcyBoYXMgbGVkIAp0
byB0aGUgaXNzdWVzIHRoZXJlLiAgU2F5aW5nIHRoZSBzcGVjIHdvbid0IGNoYW5nZSByZWFsbHkg
aXNuJ3QgCm1lYW5pbmdmdWwsIGl0J3Mgc2F5aW5nIGZ1dHVyZSBzcGVjcyB3aWxsIGJlIGNvbXBh
dGlibGUgdGhhdCdzIAppbXBvcnRhbnQuICBOb3RoaW5nIGluIHRoaXMgd2hvbGUgcnVsZSB0b3Vj
aGVzIG9uIGNvbXBhdGliaWxpdHksIGFuZCBJIApyZWFsbHkgZG9uJ3Qgd2FudCB0byBlbmQgdXAg
aW4gYSBiaWdnZXIgbWVzcyB0aGFuIHdlJ3JlIGFscmVhZHkgaW4uCgooQWxzbzogc29tZSBQR0Ug
c3ViY29udHJhY3RvciBkcm92ZSBhIGNyYW5lIGludG8gbXkgaG91c2UsIHNvIHRoaW5ncyBhcmUg
CmEgYml0IGNoYW90aWMgb24gbXkgZW5kLiAgSWYgeW91IGhhdmUgdGhhdCBsaXN0IG9mIHdoYXQn
cyBvZmZpY2lhbGx5IApmcm96ZW4sIGNhbiB5b3Ugc2VuZCBpdCBvdXQ/ICBJJ2xsIHRyeSB0byB0
YWtlIGEgbG9vayBBU0FQLCBhcyB0aGVuIEkgCmNhbiBhdCBsZWFzdCBmb2N1cyB0aGUgZGlzY3Vz
c2lvbiBvbiB3aGF0J3MgcmVsZXZhbnQgcmlnaHQgbm93LikKCj4KPiBNYXJrCj4gLS0tLS0tLS0K
PiBzZW50IGZyb20gYSBtb2JpbGUgZGV2aWNlLiBwbGVhc2UgZm9yZ2l2ZSBhbnkgdHlwb3MuCj4K
Pj4gT24gU2VwIDI3LCAyMDIxLCBhdCA4OjUwIEFNLCBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQGRh
YmJlbHQuY29tPiB3cm90ZToKPj4gCj4+IO+7v09uIFR1ZSwgMjEgU2VwIDIwMjEgMTc6MjA6MTcg
UERUICgtMDcwMCksIGF0aXNocEBhdGlzaHBhdHJhLm9yZyB3cm90ZToKPj4+IEhpIEFsbCwKPj4+
IFBsZWFzZSBmaW5kIHRoZSBiZWxvdyBlbWFpbCBmcm9tIFN0ZXBoYW5vIGFib3V0IHRoZSBmcmVl
emUgYW5ub3VuY2VtZW50IGZvcgo+Pj4gdmFyaW91cyBSSVNDLVYgc3BlY2lmaWNhdGlvbnMgdGhh
dCB3aWxsIGJlIHBhcnQgb2YgcHJpdmlsZWdlIHNwZWNpZmljYXRpb24KPj4+IHYxLjEyLgo+Pj4g
QWxsIHRoZSByZXZpZXcgZGlzY3Vzc2lvbnMgYXJlIGhhcHBlbmluZyBpbiB0aGUgaXNhLWRldiBt
YWlsaW5nIGxpc3QuIFRoZQo+Pj4gcmV2aWV3IHBlcmlvZCB3aWxsIGJlIG9wZW4gZm9yIDQ1IGRh
eXMgZW5kaW5nIFN1bmRheSBPY3RvYmVyIDMxLCAyMDIxLgo+Pj4gCj4+PiBJIGp1c3Qgd2FudCB0
byBoaWdobGlnaHQgdGhlIGZhY3QgdGhhdCB0aGUgKkgqLCAqViwgU3ZQQk1ULCBDTU8gZXh0ZW5z
aW9ucwo+Pj4gYXJlIGZyb3plbiBub3cuICpUaGlzIHdpbGwgaGVscCB1cyBtZXJnZSBzb21lIHBh
dGNoZXMgdGhhdCBoYXZlIGJlZW4KPj4+IHByZXNlbnQgaW4gdGhlIG1haWxpbmcgbGlzdCBmb3Ig
YSB3aGlsZS4KPj4+IAo+Pj4gSGVyZSBhcmUgdGhlIHJhdGlmaWNhdGlvbiBwb2xpY3kgYW5kIGV4
dGVuc2lvbiBsaWZlIGN5Y2xlIGRvY3VtZW50cyBwcmVzZW50Cj4+PiBpbiB0aGUgcHVibGljLiBJ
ZiB5b3UgaGF2ZSBhbnkgcXVlc3Rpb25zIHJlZ2FyZGluZyB0aGlzLCBwbGVhc2UgY2hlY2sgd2l0
aAo+Pj4gTWFyay9TdGVwaGFubyAoY2MnZCkuCj4+PiAKPj4+IFJhdGlmaWNhdGlvbiBwb2xpY3k6
Cj4+PiBodHRwczovL2RvY3MuZ29vZ2xlLmNvbS9kb2N1bWVudC9kLzEtVWxhU0dxazU5X215ZXVQ
TXJWOWd5dWFJZ25tRnpHaDVHZnlfdHBWaXdNL2VkaXQKPj4+IAo+Pj4gRXh0ZW5zaW9uIGxpZmUg
Y3ljbGU6Cj4+PiBodHRwczovL2RvY3MuZ29vZ2xlLmNvbS9wcmVzZW50YXRpb24vZC8xblE1dUZi
MzlLQTZndlVpNVNSZVdmSVFTaVJON2hwNno3WlBmY3RFNG1Lay9lZGl0I3NsaWRlPWlkLnAxCj4+
IAo+PiBJJ20gc3RpbGwgYnVyaWVkIGFmdGVyIFBsdW1iZXJzLCBidXQgb25lIG9mIHRoZSBiaXRz
IG9uIG15IFRPRE8gbGlzdCB3YXMgdG8gbG9vayB0aHJvdWdodCB0aGUgbmV3IGRlZmluaXRpb25z
IGZvciBmcm96ZW4gYW5kIHN0YWJsZS4gIE5vdGhpbmcgaW4gdGhpcyBleHRlbnNpb24gbGlmZSBj
eWNsZSB0YWxrcyBhYm91dCB0aGUgcG9pbnQgYXQgd2hpY2ggY29tcGF0aWJpbGl0eSB3aWxsIGJl
IG1haW50YWluZWQsIHdoaWNoIHdhcyByZWFsbHkgdGhlIGNlbnRyYWwgcG9pbnQgYmVoaW5kIGZy
b3plbiBiZWZvcmUuCj4+IAo+PiBBcmUgdGhlcmUgbW9yZSBjb25jcmV0ZSBkZWZpbml0aW9ucyBz
b21ld2hlcmU/CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
