Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07475CDE008
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 08:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=REyv495Q+mBIcW7ZzXXO8R7wzNRjOlG2SMyR7F4b1l4=; b=RbcSiWUiP13vCi
	pFdoSbrkhlN4Vot6pOR52qnSi+p0UZjS+/m+yN3o18krFsUBQ0269McB/ll4RrnURhP6opyPIuGr7
	+87l1UuKzYboqrFUkbcyEFhw4RA7ODoihvvpbHk5ebN+ntftROeyysTGtzrjtwBF8e0MomneCurme
	w24QQKizRKJjvCD6/kfqdFDu8t7rlJVWIBlWVt7V146+nM5QOWdjH4jTEK0l1+Kn5BnOiAgveMqKg
	xFdOZQCHhOLsAnDmOxK0uApB041nxxrPM0g7epx7vxCNhufuN2V3a+ogYenc+Ytp6QXksAeEm8nCi
	WqFKc2xvXLT23RDOtQRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd25k-0000000AsRJ-1cMC;
	Fri, 26 Jun 2026 08:39:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd25h-0000000AsQR-0hEw
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jun 2026 08:39:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782463152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NDltzCJUDRmKYkrW1vbieyufI39hKX9sdD7dTyxWQpA=;
	b=ffNp93CZNuk9Zcv3BFNQL7rqnVJlJgcBIbHYXIZTwDvZsryivK3HZedKnCYXx+GbPuDvj/
	hvVds8xxVxIlCRQJClSdGWXBvBiKYDEZPcbQpW5f614PZiec7BDn0qhJL5k/5bk/2ud0E6
	M0Intj77ypF1i6tUNkiDuSFRvM26G2Y=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-e_2Hnn-1NOywjirwvt-tPA-1; Fri, 26 Jun 2026 04:39:10 -0400
X-MC-Unique: e_2Hnn-1NOywjirwvt-tPA-1
X-Mimecast-MFC-AGG-ID: e_2Hnn-1NOywjirwvt-tPA_1782463150
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-517ac42d958so13175101cf.0
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jun 2026 01:39:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782463150; x=1783067950;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NDltzCJUDRmKYkrW1vbieyufI39hKX9sdD7dTyxWQpA=;
        b=BQepqwBz1TQvBEiBd0Rkt3C3rSEiP2Q3+AOYOwKgEBB6eWv1zlHCSdhMh9G78uB+34
         3ABt9O0FMJjhBRRjk9fSFqXBklrtDOU9vq1LwZkEL8Spq74tKPrHgeHOyMmuP0ISMZUk
         CGx51JB0nilaVziy8LIc6+Zq+Q7GI30h1jQZTAlqd2WE4KGtYDMJuSFZ5h3gk5ZIwLV0
         lj8ldfevhcI6xvZaEuPuQBjzDIb8AlpWjr1I3N5T7BsPBO7SPacCIyZQ2g+KJw74f8Vg
         5aP5WLgYcYMzhkJpRii1W2gLwTDatN833OUqBS7fIKFBer6bHDc0QJCG+jkUUgv42Vup
         OGkw==
X-Forwarded-Encrypted: i=1; AFNElJ/HjdZUH6Ujhx3gdqUZip60EleWsANE63N/DTNoBVA6C98WdPC5lG1Cki4kUof2MqbQFVndc6YPc1TyNA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwKZNsktIDWL6p0kMtynPzcEfPfO49A8MsO0oVlMLUQQ16vPHnb
	3U22WaWJ8mYVdUmEqg8682DZMIOhSx5cHelC5HyUstTwnZEPVaR52cnESxhrUsYJNKbu05MAX0T
	VyVUDHVOKMM/NlTUe3oodo1ENcdI/qvlOI+AZRFDPntSonKmltanqGInwowjom0yaqn6nI+DWwN
	LJd0UaRas7duYu63aBUy0eBjkHqvESBHqWTxYhLTBdq+5Y
X-Gm-Gg: AfdE7cnoT3wSHaT38nJ2qAkWNlp09r6qS/ZmlgW97JfttwTrptTvNRVgCEyUnpgnWYj
	b94qhkFAchhoKla5o5LZgYLscrypWaeQPqlVkpSIMAXR5Ft1PZYucbBxXmNDF+ECV6AHpdPZxK5
	lqFiiA/opLwunY0WmYMoJFUDWUeOkYNhFhYJ7envuURRQW0WT7lg0xDuDoCr94/AhgDoI=
X-Received: by 2002:ac8:5d8f:0:b0:517:7e26:36a4 with SMTP id d75a77b69052e-51a727a6b4emr38094621cf.34.1782463149747;
        Fri, 26 Jun 2026 01:39:09 -0700 (PDT)
X-Received: by 2002:ac8:5d8f:0:b0:517:7e26:36a4 with SMTP id
 d75a77b69052e-51a727a6b4emr38094311cf.34.1782463149181; Fri, 26 Jun 2026
 01:39:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260529032739.13264-2-ltao@redhat.com> <CAO7dBbW+LEy8SBGAKcrxEDzK5Xctw-r7ztgnXuURa9g0xntbtQ@mail.gmail.com>
 <CAP_BRoQEM8Re1dT7JNQgO72o50GAnb2y7R1HWPd+E772GVYAJg@mail.gmail.com>
In-Reply-To: <CAP_BRoQEM8Re1dT7JNQgO72o50GAnb2y7R1HWPd+E772GVYAJg@mail.gmail.com>
From: Tao Liu <ltao@redhat.com>
Date: Fri, 26 Jun 2026 20:38:32 +1200
X-Gm-Features: AVVi8CcC6SRLbaRMcmDZcOqEvJBqXMu3cyxkiJ8WEEu_YPQEWrWyMZoL0N-5qwY
Message-ID: <CAO7dBbW55P9eibE5o74s8Hn+fsZ5CeasyEtLMcpkCM=kVzF7zQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: Fix a NULL pointer reference in machine_kexec_prepare
To: Baoquan He <bhe@redhat.com>
Cc: kexec@lists.infradead.org, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OLTkz9RpSTSp8dTbS0nJGpPVSZ1ILrQezi-MxEMwhX8_1782463150
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_013913_293052_B9938988 
X-CRM114-Status: GOOD (  26.87  )
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

SGkgQmFvcXVhbiwKCkdsYWQgdG8gc2VlIHlvdXIgbWVzc2FnZSBhZ2FpbiEKClRoYW5rcyBmb3Ig
dGhlIEFjayBhbmQgdGhlIHN1Z2dlc3Rpb24gZm9yIHRoZSBjb21tZW50LCBJIHdpbGwgYWRkIGl0
CmluIHRoZSBuZXh0IHZlcnNpb24uCgpJbiB0aGUgbWVhbnRpbWUsIEkgd2lsbCBjaGVjayBpZiBz
aW1pbGFyIGlzc3VlIGV4aXN0cyBvbiBMb29uZ0FyY2ggYXMgd2VsbC4KClRoYW5rcywKVGFvIExp
dQoKT24gRnJpLCBKdW4gMjYsIDIwMjYgYXQgODowNOKAr1BNIEJhb3F1YW4gSGUgPGJoZUByZWRo
YXQuY29tPiB3cm90ZToKPgo+IEFkZCBrZXhlYyBNTCB0byBDQy4KPgo+IE9uIEZyaSwgSnVuIDI2
LCAyMDI2IGF0IDc6NDbigK9BTSBUYW8gTGl1IDxsdGFvQHJlZGhhdC5jb20+IHdyb3RlOgo+ID4K
PiA+IEtpbmRseSBwaW5nLCBhbnkgY29tbWVudHM/Cj4gPgo+ID4gVGhhbmtzLAo+ID4gVGFvIExp
dQo+ID4KPiA+IE9uIEZyaSwgTWF5IDI5LCAyMDI2IGF0IDM6MzXigK9QTSBUYW8gTGl1IDxsdGFv
QHJlZGhhdC5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBBIE5VTEwgcG9pbnRlciByZWZlcmVuY2Ug
aXNzdWUgaXMgbm90aWNlZCBpbiByaXNjdidzIG1hY2hpbmVfa2V4ZWNfcHJlcGFyZSwKPiA+ID4g
d2hlcmUgaW1hZ2UtPnNlZ21lbnRbaV0uYnVmIG1pZ2h0IGJlIE5VTEwgYW5kIGNvcGllZCB1bmNo
ZWNrZWQuCj4gPiA+Cj4gPiA+IFRoZSBOVUxMIGJ1ZiBjb21lcyBmcm9tIHNlY3VyaXR5L2ludGVn
cml0eS9pbWEvaW1hX2tleGVjLmM6Cj4gPiA+IGltYV9hZGRfa2V4ZWNfYnVmZmVyKCksIHdoZXJl
IGtidWYgaXMgYWRkZWQgYnkga2V4ZWNfYWRkX2J1ZmZlcigpLAo+ID4gPiBidXQga2J1Zi5idWZm
ZXIgaXMgTlVMTC4KPiA+ID4KPiA+ID4gRml4IHRoaXMgYnkgc2ltcGx5IGFkZGluZyBhIGNoZWNr
IGJlZm9yZSBjb3B5Lgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBUYW8gTGl1IDxsdGFvQHJl
ZGhhdC5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvbWFjaGluZV9rZXhl
Yy5jIHwgMyArKysKPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPiA+ID4K
PiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL21hY2hpbmVfa2V4ZWMuYyBiL2Fy
Y2gvcmlzY3Yva2VybmVsL21hY2hpbmVfa2V4ZWMuYwo+ID4gPiBpbmRleCAyMzA2Y2UzZTVmMjIu
LmQ4MWQ1NzZmOWNiNSAxMDA2NDQKPiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvbWFjaGlu
ZV9rZXhlYy5jCj4gPiA+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL21hY2hpbmVfa2V4ZWMuYwo+
ID4gPiBAQCAtNDEsNiArNDEsOSBAQCBtYWNoaW5lX2tleGVjX3ByZXBhcmUoc3RydWN0IGtpbWFn
ZSAqaW1hZ2UpCj4gPiA+ICAgICAgICAgICAgICAgICBpZiAoaW1hZ2UtPnNlZ21lbnRbaV0ubWVt
c3ogPD0gc2l6ZW9mKGZkdCkpCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVl
Owo+ID4gPgo+ID4gPiArICAgICAgICAgICAgICAgaWYgKGltYWdlLT5zZWdtZW50W2ldLmJ1ZiA9
PSBOVUxMKQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiA+ID4gKwo+
Cj4gVGhpcyBpcyBhIGdvb2QgZml4LCBtYXliZSB3ZSBjYW4gYWRkIGNvZGUgY29tbWVudHMgdG8g
ZXhwbGFpbiBpdCBhcwo+IGJlbG93LCBqdXN0IGZvciByZWZlcmVuY2UuCj4KPiAgICAgICAgICAg
ICAgICAvKgo+ICAgICAgICAgICAgICAgICAqIFNvbWUgc2VnbWVudHMgKGUuZy4gSU1BKSByZXNl
cnZlIHNwYWNlIGJ1dCBoYXZlIG5vIGJ1ZmZlcgo+ICAgICAgICAgICAgICAgICAqIGxvYWRlZCB5
ZXQuIFNraXAgdGhlbSBhcyB0aGV5IGNhbm5vdCBjb250YWluIGFuIEZEVC4KPiAgICAgICAgICAg
ICAgICAgKi8KPiBBbmQgaXMgdGhlcmUgYW55IG90aGVyIHBsYWNlIHdoZXJlIHRoZSBzaW1pbGFy
IGlzc3VlIGV4aXN0cz8gZS5nIG9uIExvb25nQXJjaD8KPgo+IE90aGVyIHRoYW4gYWJvdmUgY29u
Y2VybnMsIHRoaXMgcGF0Y2ggbG9va3MgZ29vZCB0byBtZToKPgo+IEFja2VkLWJ5OiBCYW9xdWFu
IEhlIDxiaGVAcmVkaGF0LmNvbT4KPgo+ID4gPiAgICAgICAgICAgICAgICAgaWYgKGltYWdlLT5m
aWxlX21vZGUpCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIG1lbWNweSgmZmR0LCBpbWFn
ZS0+c2VnbWVudFtpXS5idWYsIHNpemVvZihmZHQpKTsKPiA+ID4gICAgICAgICAgICAgICAgIGVs
c2UgaWYgKGNvcHlfZnJvbV91c2VyKCZmZHQsIGltYWdlLT5zZWdtZW50W2ldLmJ1Ziwgc2l6ZW9m
KGZkdCkpKQo+ID4gPiAtLQo+ID4gPiAyLjQ3LjAKPiA+ID4KPiA+Cj4gPgo+ID4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+IGxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdAo+ID4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4gaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo+ID4KPgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
