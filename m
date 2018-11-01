Return-Path: <SRS0=CEwi=NM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B404AC0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  1 Nov 2018 17:49:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48C712082E
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  1 Nov 2018 17:49:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UVdf7hYn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48C712082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jHpTDcrwt6mhiST77FVRMfAmG04IloVNH31hOnCtqDc=; b=UVdf7hYnYTsj7B
	fPX2/1UX225xKiq0hm+E18haJ3ZvzhqtQrMQ3bYC5elEFWPWhqVjTi+98zjz+FS30yG8pgCD2mk4g
	I+u4yB073obDpmbkU2xp/2x0W08jbrMUCwDs4zpEHsWhjbCWqIVyJcCKglpany+Fc8E9vF/zj9EYK
	Zz0w1zetLpRz+snbqQ+NskgL3b2OZnEqWtz3dSUkNa5MJxod7krU0jlriWzvUGxV0d+Sr6Fh2lM1M
	bMd521fHTXGdwECwGXc0MEmW0rDeIInGbiDxd4dUlfX2sjkaB5zHeeQtO9dbLY7StoO/2U6oIf7rE
	fKCbdW/NL/pPeWVYBHxA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gIH5u-0004IY-Hv; Thu, 01 Nov 2018 17:49:22 +0000
Received: from mout.kundenserver.de ([212.227.126.135])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gIH5q-0004H7-Mp
 for linux-riscv@lists.infradead.org; Thu, 01 Nov 2018 17:49:20 +0000
Received: from excalibur.cnev.de ([213.196.202.171]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MlfGs-1frQnW186M-00ilkM; Thu, 01 Nov 2018 18:49:00 +0100
Received: from excalibur.cnev.de ([213.196.202.171]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MlfGs-1frQnW186M-00ilkM; Thu, 01 Nov 2018 18:49:00 +0100
Received: from karsten by excalibur.cnev.de with local (Exim 4.89)
 (envelope-from <merker@debian.org>)
 id 1gIH5W-00060g-0g; Thu, 01 Nov 2018 18:48:58 +0100
Date: Thu, 1 Nov 2018 18:48:57 +0100
From: Karsten Merker <merker@debian.org>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [RFC 0/2] RISC-V: A proposal to add vendor-specific code
Message-ID: <20181101174857.du2zu4vnrhpu5asf@excalibur.cnev.de>
References: <CAAhSdy0Y_jdc=2Lf8epof_+7HigCfhDxMNe8EF0fHfncqhs-zA@mail.gmail.com>
 <mhng-01f0ac6a-c2fd-41be-9d53-44d1c139d453@palmer-si-x1c4>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-01f0ac6a-c2fd-41be-9d53-44d1c139d453@palmer-si-x1c4>
X-No-Archive: yes
User-Agent: NeoMutt/20170113 (1.7.2)
X-Provags-ID: V03:K1:tUOLTyi1OuMqiWoSJtJD7MQCytwhy4PpEEBTgMGAU8nEmOdagoI
 +9nAgF8L5sni3jCk2QRBnggBT5EeNdj7Vaa8SrJ4Ejts7F7/TDqsTq4ZUtlC8UsNftR4pdJ
 GTWs/vyevt5qWaQbrO/hFF79vFpAIPG67G5rw/wTB4cU1atgring34lZ3v3hAd9Kn2pyUg7
 sqs1dikjyg3tZ6ytIJw/A==
X-UI-Out-Filterresults: notjunk:1;V01:K0:RbnT+6yzs0g=:hptnew0/RBH6Akk4UbXkar
 aAwjwjWkSMtYD4bN9YMm+K7yoZWu24PC2saniJZoASW5BXrw1qkxDET1MgAWUoXOxZmaMn/dQ
 LOaL2cYNOooX74o66JRfG1v5MRslu4RYzzwYjm2DDjMj3Ct/g2Mk1M0sQtE4MDi+IO8cs6G8b
 2x0KFQO4Ii73iFUdEQf7AiprCll6BNRpz2fkj7ydOhzGzqBAoSqEBtYCWxqsoe51n/es98F2B
 KeOeQPjvvDWI1gmfRXawg5HlLdA8Teg6//hY8IhMEkkhWskneeGaUymjJOVcAEqKacGYcemzf
 IQGGZMNosVVZPojasdpAXmWwFCs0lVvTgBNzdw9+p+oZ4wCR1ne/CuG/m8k3jbpbOwAKGennM
 2h1uhQ2m0tFnhiP0wBe1Wha8LVyA24oyHENTgtONXQbU2e5DDe5fvx36V61AO4weG7TeHruKg
 xvftFZP2k4eJeqhnxg4DYalDfYfxGxZ8PH+8mcuGmPByKPNMhWGiN97ej5dHFq8YkQhvmJznt
 /pkfOFiD4Hb4btPIm+IYSZ7UeBs+72jYp+6RYx1+e8YRbi3ubZ+6z8gxSYy0fac2OnDp7wr11
 b5JTnzoI7UGaZV7FK16x5YAj2oKcEfrkxf+u0IvJaqo5cRSaPjJ66vYGTnzuT5/oMjX326RQ0
 bmSu0ooCG2KcBHABSbnHs98dhkAcNtqIEfCbmXj0aV8s4W40tQrfRd49yu68ai37PZrw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181101_104919_045924_AEFDF66A 
X-CRM114-Status: GOOD (  27.33  )
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
Cc: vincentc@andestech.com, aou@eecs.berkeley.edu,
 Arnd Bergmann <arnd@arndb.de>, alankao@andestech.com, greentime@andestech.com,
 anup@brainfault.org, linux-kernel@vger.kernel.org, zong@andestech.com,
 linux-riscv@lists.infradead.org, deanbo422@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBPY3QgMzEsIDIwMTggYXQgMTA6Mjc6MDVBTSAtMDcwMCwgUGFsbWVyIERhYmJlbHQg
d3JvdGU6Cj4gT24gV2VkLCAzMSBPY3QgMjAxOCAwNDoxNjoxMCBQRFQgKC0wNzAwKSwgYW51cEBi
cmFpbmZhdWx0Lm9yZyB3cm90ZToKPiA+IE9uIFdlZCwgT2N0IDMxLCAyMDE4IGF0IDQ6MDYgUE0g
VmluY2VudCBDaGVuIDx2aW5jZW50Y0BhbmRlc3RlY2guY29tPiB3cm90ZToKPiA+ID4gCj4gPiA+
ICAgUklTQy1WIHBlcm1pdHMgZWFjaCB2ZW5kb3IgdG8gZGV2ZWxvcCByZXNwZWN0aXZlIGV4dGVu
c2lvbiBJU0EgYmFzZWQKPiA+ID4gb24gUklTQy1WIHN0YW5kYXJkIElTQS4gVGhpcyBtZWFucyB0
aGF0IHRoZXNlIHZlbmRvci1zcGVjaWZpYyBmZWF0dXJlcwo+ID4gPiBtYXkgYmUgY29tcGF0aWJs
ZSB0byB0aGVpciBjb21waWxlciBhbmQgQ1BVLiBUaGVyZWZvcmUsIGVhY2ggdmVuZG9yIG1heQo+
ID4gPiBiZSBjb25zaWRlcmVkIGEgc3ViLWFyY2hpdGVjdHVyZSBvZiBSSVNDLVYuIEN1cnJlbnRs
eSwgdmVuZG9ycyBkbyBub3QKPiA+ID4gaGF2ZSB0aGUgYXBwcm9wcmlhdGUgZXhhbXBsZXMgdG8g
YWRkIHRoZXNlIHNwZWNpZmljIGZlYXR1cmVzIHRvIHRoZQo+ID4gPiBrZXJuZWwuIEluIHRoaXMg
UkZDIHNldCwgd2UgcHJvcG9zZSBhbiBpbmZyYXN0cnVjdHVyZSB0aGF0IHZlbmRvciBjYW4KPiA+
ID4gZWFzaWx5IGhvb2sgdGhlaXIgc3BlY2lmaWMgZmVhdHVyZXMgaW50byBrZXJuZWwuIFRoZSBm
aXJzdCBjb21taXQgaXMKPiA+ID4gdGhlIG1haW4gYm9keSBvZiB0aGlzIGluZnJhc3RydWN0dXJl
LiBJbiB0aGUgc2Vjb25kIGNvbW1pdCwgd2UgcHJvdmlkZQo+ID4gPiBhIHNvbHV0aW9uIHRoYXQg
YWxsb3dzIGRtYV9tYXBfb3BzKCkgdG8gd29yayB3aXRob3V0IGNhY2hlIGNvaGVyZW50Cj4gPiA+
IGFnZW50IHN1cHBvcnQuIENhY2hlIGNvaGVyZW50IGFnZW50IGlzIHVuc3VwcG9ydGVkIGZvciBs
b3ctZW5kIENQVXMgaW4KPiA+ID4gdGhlIEFuZGVTdGFyIFJJU0MtViBzZXJpZXMuIEluIG9yZGVy
IGZvciBMaW51eCB0byBydW4gb24gdGhlc2UgQ1BVcywgd2UKPiA+ID4gbmVlZCB0aGlzIHNvbHV0
aW9uIHRvIG92ZXJjb21lIHRoZSBsaW1pdGF0aW9uIG9mIGNhY2hlIGNvaGVyZW50IGFnZW50Cj4g
PiA+IHN1cHBvcnQuIEhlbmNlLCBpdCBhbHNvIGNhbiBiZSB1c2VkIGFzIGFuIGV4YW1wbGUgZm9y
IHRoZSBmaXJzdCBjb21taXQuCj4gPiA+IAo+ID4gPiAgIEkgYW0gZ2xhZCB0byBkaXNjdXNzIGFu
eSBpZGVhcywgc28gaWYgeW91IGhhdmUgYW55IGlkZWEsIHBsZWFzZSBnaXZlCj4gPiA+IG1lIHNv
bWUgZmVlZGJhY2suCj4gPiA+IAo+ID4gSSBhZ3JlZSB0aGF0IHdlIG5lZWQgYSBwbGFjZSBmb3Ig
dmVuZG9yLXNwZWNpZmljIElTQSBleHRlbnNpb25zIGFuZAo+ID4gaGF2aW5nIHZlbmRvci1zcGVj
aWZpYyBkaXJlY3RvcmllcyBpcyBhbHNvIGdvb2QuCj4gPiAKPiA+IFdoYXQgSSBkb24ndCBzdXBw
b3J0IGlzIHRoZSBhcHByb2FjaCBvZiBoYXZpbmcgY29tcGlsZSB0aW1lIHNlbGVjdGlvbgo+ID4g
b2YgdmVuZG9yLXNwZWNpZmljIElTQSBleHRlbnNpb24uCj4gPiAKPiA+IFdlIHNob3VsZCBoYXZl
IHJ1bnRpbWUgcHJvYmluZyBmb3IgY29tcGF0aWJsZSB2ZW5kb3Itc3BlY2lmaWMgSVNBCj4gPiBl
eHRlbnNpb24uIEFsc28sIGl0IHNob3VsZCBiZSBwb3NzaWJsZSB0byBsaW5rIG11bHRpcGxlIHZl
bmRvci1zcGVjaWZpYwo+ID4gU0EgZXh0ZW5zaW9ucyB0byBzYW1lIGtlcm5lbCBpbWFnZS4gVGhp
cyB3YXkgd2UgY2FuIGhhdmUgYSBzaW5nbGUKPiA+IGtlcm5lbCBpbWFnZSAoYWxvbmcgd2l0aCB2
YXJpb3VzIHZlbmRvci1zcGVjaWZpYyBJU0EgZXh0ZW5zaW9ucykgd2hpY2gKPiA+IHdvcmtzIG9u
IHZhcmlldHkgb2YgdGFyZ2V0cy9ob3N0cy4KPiA+IAo+ID4gQXMgYW4gZXhhbXBsZSBvciBydW50
aW1lIHByb2JpbmcgeW91IGNhbiBsb29rIGF0IGhvdyBJUlFDSElQIG9yCj4gPiBDTE9DS1NPVVJD
RSBkcml2ZXJzIGFyZSBwcm9iZWQuIFRoZSB2ZW5kb3Itc3BlY2lmaWMgSVNBIGV4dGVuc2lvbgo+
ID4gaG9va3Mgc2hvdWxkIGNhbGxlZCBpbiBzaW1pbGFyIGZhc2hpb24uCj4gCj4gWWVzLCBJIGFn
cmVlLiAgTXkgYmlnZ2VzdCBjb25jZXJuIGhlcmUgaXMgdGhhdCB3ZSBlbnN1cmUgdGhhdAo+IG9u
ZSBrZXJuZWwgY2FuIGJvb3Qgb24gaW1wbGVtZW50YXRpb25zIGZyb20gYWxsIHZlbmRvcnMuICBJ
Cj4gaGF2ZW4ndCBoYWQgYSBjaGFuY2UgdG8gbG9vayBhdCB0aGUgcGF0Y2hlcyB5ZXQsIGJ1dCBp
dCBzaG91bGQKPiBiZSBwb3NzaWJsZSB0bzoKPiAKPiAqIEJ1aWxkIGEga2VybmVsIHRoYXQgaGFz
IHZlbmRvci1zcGVjaWZpYyBjb2RlIGZyb20gbXVsdGlwbGUgdmVuZG9ycy4KPiAqIERldGVjdCB0
aGUgaW1wbGVtZW50YXRpb24gYW4gcnVuIHRpbWUgYW5kIHNlbGVjdCB0aGUgY29ycmVjdCBleHRy
YQo+ICAgY29kZS4KCkZyb20gYSBkaXN0cm8gcG9pbnQgb2YgdmlldyB3ZSBkZWZpbml0ZWx5IHdh
bnQgdG8gaGF2ZSBvbmUga2VybmVsCmltYWdlIHRoYXQgaXMgYm9vdGFibGUgZXZlcnl3aGVyZS4g
IERlYmlhbiB3b24ndCBzdXBwb3J0IGFueQpwbGF0Zm9ybSB0aGF0IHJlcXVpcmVzIGEgcGVyLXBs
YXRmb3JtIG9yIHBlci12ZW5kb3Iga2VybmVsLCBhbmQgSQphc3N1bWUgdGhhdCB0aGUgc2FtZSB3
aWxsIGJlIHRydWUgZm9yIEZlZG9yYSBhbmQgU3VzZS4KCk9uZSB0aGluZyB0aGF0IEkgaGF2ZSBz
dHVtYmxlZCB1cG9uIHdoaWxlIGxvb2tpbmcgYXQgdGhlIHBhdGNoZXMKaXMgdGhhdCB0aGV5IHNl
ZW0gdG8gYXNzdW1lIHRoYXQgWC10eXBlIElTQSBleHRlbnNpb25zIGFyZQpzdHJpY3RseSBwZXIg
dmVuZG9yLiAgQWx0aG91Z2ggdGhhdCBpcyBwcm9iYWJseSB0cnVlIGluIHRoZQptYWpvcml0eSBv
ZiBjYXNlcywgaXQgZG9lc24ndCBuZWNlc3NhcmlseSBoYXZlIHRvIGJlIC0gSSBjb3VsZAplLmcu
IGltYWdpbmUgdGhhdCB0aGUgRFNQIGV4dGVuc2lvbnMgZnJvbSB0aGUgUFVMUCBjb3JlcyBtaWdo
dApiZSB1c2VkIGJ5IG11bHRpcGxlIHZlbmRvcnMuICBJZiBzdWNoIGFuIGV4dGVuc2lvbiB3b3Vs
ZCBoYXZlCnN0YXRlIHRoYXQgbmVlZHMgdG8gYmUgc2F2ZWQgb24gY29udGV4dCBzd2l0Y2gsIGl0
IHdvdWxkIG5lZWQKY29ycmVzcG9uZGluZyBrZXJuZWwgc3VwcG9ydC4gIFVzaW5nICJQVUxQIiAo
b3IgYW55IG90aGVyCm9wZW4tc291cmNlIHByb2plY3QpIGFzIHRoZSB2ZW5kb3IgaW4gc3VjaCBh
IGNhc2UgbGVhZHMgdG8KYW5vdGhlciBwb3RlbnRpYWwgaXNzdWU6IHRoZSBwYXRjaGVzIGJhc2Ug
ZXZlcnl0aGluZyBvbiBhIEpFREVDCnZlbmRvciBJRCB0aGF0IGlzIGNvbXBhcmVkIHRvIHRoZSBj
b250ZW50cyBvZiB0aGUgbXZlbmRvcmlkIENTUiwKYnV0IHN1Y2ggYSBKRURFQyB2ZW5kb3IgSUQg
dXN1YWxseSBkb2Vzbid0IGV4aXN0IGZvciBvcGVuLXNvdXJjZQppbXBsZW1lbnRhdGlvbnM7IHRo
ZSBtYWpvcml0eSBvZiB0aG9zZSBoYXZlIG12ZW5kb3JpZCBzZXQgdG8KemVyby4KClJlZ2FyZHMs
CkthcnN0ZW4KLS0gCkdlbS4gUGFyLiAyOCBBYnMuIDQgQnVuZGVzZGF0ZW5zY2h1dHpnZXNldHog
d2lkZXJzcHJlY2hlIGljaCBkZXIgTnV0enVuZwpzb3dpZSBkZXIgV2VpdGVyZ2FiZSBtZWluZXIg
cGVyc29uZW5iZXpvZ2VuZW4gRGF0ZW4gZsO8ciBad2Vja2UgZGVyCldlcmJ1bmcgc293aWUgZGVy
IE1hcmt0LSBvZGVyIE1laW51bmdzZm9yc2NodW5nLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
