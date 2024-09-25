Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F8ECF9C72
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Sep 2024 14:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tv7gXAfcp+TvVVOovu5XYAb0wuKi0mX4YzOvRsdHAe0=; b=RuQ8LyKY4N77mF
	fuz1J3kWl9eEAK0mMKK3o+JIbS2MxJsM73y3vwrq7nL3ZQR23FHz57JHFY2p2ECIWhSi1f2DhI+jh
	BBWK3m3UBK8J97GY3nYkILFa1pKuY6YbhziLB4IVQu6sMqKulkMuDTu8csN+7ECTb0l/sxpoWohca
	PcVh9fAio1L3lOdQuXRxkBMZVmeQt4TCeqNSOsJEPc96ZBwZ3MwfTVS6yo+8xV1vh2eVBIKw925+L
	VPZoEV5pNc2fuQM/ROtd3zBMwZd6pDWiMnKjoCfz8P9RgaAZkPJT1gl6lraZHJ6ILPDlytqL1jSJz
	227KTyDkzyM+xdxSRakA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stT5v-00000005eOU-3dW0;
	Wed, 25 Sep 2024 14:34:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stT4c-00000005dyX-34nY
	for linux-riscv@lists.infradead.org;
	Wed, 25 Sep 2024 14:33:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727274777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QGuobhGKG8NrJUlif1sRCtxHMwTeGlqMIrISMQPns7w=;
	b=Cd1761iKI3UyLszQ2/M4aGJX3HzqbSQUnLuMw6N7oeA17d0vJbuR3VwAKPxu9TPkYcfNE2
	nAKssAtUaubaMg/R50WRyZ+sEdleYlX5jT82mfpIQn4OONki/QMRaIa8ybJhUIUiFWIMbV
	tujrDfRSHiDNm9lkMQRcSjuVIrYtMaE=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-6cBL0pN2Ora2II2FutVQjw-1; Wed, 25 Sep 2024 10:32:56 -0400
X-MC-Unique: 6cBL0pN2Ora2II2FutVQjw-1
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2e08735ed9dso398639a91.3
        for <linux-riscv@lists.infradead.org>; Wed, 25 Sep 2024 07:32:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727274774; x=1727879574;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QGuobhGKG8NrJUlif1sRCtxHMwTeGlqMIrISMQPns7w=;
        b=B3ncq/2lFeDgN0vrvfBDTlVVYYf4Iks12/5AQVuvNaoYLQF/rW6OQwG5qP5SvhQ8dl
         XgikRpS4YWVkEWcCrYSRZWPv0y3kIdaooHxL5PpegT5BTDY5wj0ItcLEBh4C7oE+/XnB
         fKbWEnXGj2VlNTu+YH25lXGouaZ0bqrgm3lWodGlXlBe8sod2pUtKVNxTPkPuYh3w+LM
         lj1VblrTotphxY5xGfqEIVpQRIjOvmYZ4A9Wp77RIfZlPC0R+GYKFqUdvN+ESZQKjX8H
         pGEUcGwoNs/LWfYbKkWNwJjrU1QGsplqFRHx6GfHO8q1V4xfFYRfBVo7HWv4irf6NFEP
         YAZA==
X-Forwarded-Encrypted: i=1; AJvYcCXKQG+ApJLysOMCZYmhcrDDCsCOB2W56Bwkca66/HvzAzbOrVCoB3fBdaZoXNOdUo6B5NbvCQM7lFF3YQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzFbsLpCBHPXATqVWN1cEVgN7s0ZZ9p9gEq11jjyeborHihUaTu
	kBAZqNQiacxBlP8Z5kU+4nXBoogaszCFi9HF1ZIwlZMV30Uvq9wdXyGnOVk0en7fOwGAkpEG/Y+
	u4FCYuAkHf7CHLqV3nynZcQVG2z+9BHbIZXYFWeBBr7z8OcTT8IzNXTIhmCySJb0C1LrxvXq/ii
	MsFyoecEfpipEqN39/vuz45Ugp5Vy/26YmLSCIh+f58F7RXTfg
X-Received: by 2002:a17:90a:2e8a:b0:2d8:97b7:449f with SMTP id 98e67ed59e1d1-2e06afdfc57mr3284678a91.38.1727274773862;
        Wed, 25 Sep 2024 07:32:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHN3VFNWLgkNuYaHggvJn3laFCkFOyLDd+0+U/Dpwv04ItDLujsU2bOUncGiP/g6qe4Py4pNMEVvbEY+s4v/0I=
X-Received: by 2002:a17:90a:2e8a:b0:2d8:97b7:449f with SMTP id
 98e67ed59e1d1-2e06afdfc57mr3284655a91.38.1727274773539; Wed, 25 Sep 2024
 07:32:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAJD_bPJes4QhmXY5f63GHV9B9HFkSCoaZjk-qCT2NGS7Q9HODg@mail.gmail.com>
 <B2A62C7F-45BA-43E1-975F-5AF0197CD2C3@kernel.org> <CAJD_bP+43=XXD7p3fRfDxCbj=_YedgVLv38XO4iOAw94a+4PHg@mail.gmail.com>
 <202409221511.9AF49BD@keescook> <CAJD_bP+6qCgseo9of-cKW3+nH_UbGFwPo6WRbqqcneOZ+EEtOw@mail.gmail.com>
 <800CC050-E858-409C-A565-A6EF430E1B25@kernel.org>
In-Reply-To: <800CC050-E858-409C-A565-A6EF430E1B25@kernel.org>
From: Jason Montleon <jmontleo@redhat.com>
Date: Wed, 25 Sep 2024 10:32:42 -0400
Message-ID: <CAJD_bPKNbKo5tj4OV4MpgtSN6_FXfmQtBFgVFzZeZapCPNT6PA@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] Cannot boot Lichee Pi 4A with
 FORTIFY_SOURCE enabled
To: Kees Cook <kees@kernel.org>
Cc: linux-hardening@vger.kernel.org, 
	Linux regressions mailing list <regressions@lists.linux.dev>, linux-riscv@lists.infradead.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_073258_874871_5BEC0EEF 
X-CRM114-Status: GOOD (  30.11  )
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

T24gVHVlLCBTZXAgMjQsIDIwMjQgYXQgMTozNuKAr1BNIEtlZXMgQ29vayA8a2Vlc0BrZXJuZWwu
b3JnPiB3cm90ZToKPgo+Cj4KPiBPbiBTZXB0ZW1iZXIgMjQsIDIwMjQgODo1ODo1NyBBTSBQRFQs
IEphc29uIE1vbnRsZW9uIDxqbW9udGxlb0ByZWRoYXQuY29tPiB3cm90ZToKPiA+T24gU3VuLCBT
ZXAgMjIsIDIwMjQgYXQgNjozOOKAr1BNIEtlZXMgQ29vayA8a2Vlc0BrZXJuZWwub3JnPiB3cm90
ZToKPiA+PiBDYW4geW91IHRyeSB0aGlzIHBhdGNoPyBJdCBzaG91bGQgYXZvaWQgdXNpbmcgdGhl
ICJXQVJOIiBpbmZyYXN0cnVjdHVyZQo+ID4+IChpZiB0aGF0IGlzIHRoZSBzb3VyY2Ugb2YgYmxv
Y2tpbmcgYm9vdCksIGJ1dCBzaG91bGQgc3RpbGwgcHJvdmlkZSBzb21lCj4gPj4gZGV0YWlsIGFi
b3V0IHdoYXQgdHJpcHBlZCBpdCB1cCAodmlhIHRoZSAicmVndWxhciIgcHJfKigpIGxvZ2dpbmcp
LiBBbmQKPiA+PiBpZiBpdCBib290cywgY2FuIHlvdSBsb29rIGF0IHRoZSBsb2cgdG8gZmluZCB3
aGF0IGl0IHJlcG9ydHMgZm9yIHRoZQo+ID4+ICJXYW50ZWQgdG8gd3JpdGUgLi4uIiBsaW5lKHMp
Pwo+ID4+Cj4gPj4gVGhhbmtzIQo+ID4+Cj4gPj4gLUtlZXMKPiA+Pgo+ID4+Cj4gPj4gZGlmZiAt
LWdpdCBhL2luY2x1ZGUvbGludXgvZm9ydGlmeS1zdHJpbmcuaCBiL2luY2x1ZGUvbGludXgvZm9y
dGlmeS1zdHJpbmcuaAo+ID4+IGluZGV4IDBkOTliZjExZDI2MC4uNDY5YTM0Mzk5NTlkIDEwMDY0
NAo+ID4+IC0tLSBhL2luY2x1ZGUvbGludXgvZm9ydGlmeS1zdHJpbmcuaAo+ID4+ICsrKyBiL2lu
Y2x1ZGUvbGludXgvZm9ydGlmeS1zdHJpbmcuaAo+ID4+IEBAIC01NDksNyArNTQ5LDggQEAgX19G
T1JUSUZZX0lOTElORSBib29sIGZvcnRpZnlfbWVtY3B5X2NoayhfX2tlcm5lbF9zaXplX3Qgc2l6
ZSwKPiA+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHNp
emVfdCBxX3NpemUsCj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBjb25zdCBzaXplX3QgcF9zaXplX2ZpZWxkLAo+ID4+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgY29uc3Qgc2l6ZV90IHFfc2l6ZV9maWVsZCwKPiA+PiAtICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHU4IGZ1bmMpCj4gPj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCB1OCBmdW5jLAo+ID4+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgY2hhciAqZmll
bGQpCj4gPj4gIHsKPiA+PiAgICAgICAgIGlmIChfX2J1aWx0aW5fY29uc3RhbnRfcChzaXplKSkg
ewo+ID4+ICAgICAgICAgICAgICAgICAvKgo+ID4+IEBAIC02MTAsOCArNjExLDEzIEBAIF9fRk9S
VElGWV9JTkxJTkUgYm9vbCBmb3J0aWZ5X21lbWNweV9jaGsoX19rZXJuZWxfc2l6ZV90IHNpemUs
Cj4gPj4gICAgICAgICAgKiBodHRwczovL2djYy5nbnUub3JnL2J1Z3ppbGxhL3Nob3dfYnVnLmNn
aT9pZD0xMDE4MzIKPiA+PiAgICAgICAgICAqLwo+ID4+ICAgICAgICAgaWYgKHBfc2l6ZV9maWVs
ZCAhPSBTSVpFX01BWCAmJgo+ID4+IC0gICAgICAgICAgIHBfc2l6ZSAhPSBwX3NpemVfZmllbGQg
JiYgcF9zaXplX2ZpZWxkIDwgc2l6ZSkKPiA+PiAtICAgICAgICAgICAgICAgcmV0dXJuIHRydWU7
Cj4gPj4gKyAgICAgICAgICAgcF9zaXplICE9IHBfc2l6ZV9maWVsZCAmJiBwX3NpemVfZmllbGQg
PCBzaXplKSB7Cj4gPj4gKyAgICAgICAgICAgICAgIGlmIChwX3NpemVfZmllbGQgPT0gMCkKPiA+
PiArICAgICAgICAgICAgICAgICAgICAgICBwcl93YXJuKCJXYW50ZWQgdG8gd3JpdGUgJXp1IHRv
IGEgMC1zaXplZCBkZXN0aW5hdGlvbjogJXNcbiIsCj4gPj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBzaXplLCBmaWVsZCk7Cj4gPj4gKyAgICAgICAgICAgICAgIGVsc2UKPiA+PiAr
ICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gdHJ1ZTsKPiA+PiArICAgICAgIH0KPiA+Pgo+
ID4+ICAgICAgICAgcmV0dXJuIGZhbHNlOwo+ID4+ICB9Cj4gPj4gQEAgLTYyNSw3ICs2MzEsOCBA
QCBfX0ZPUlRJRllfSU5MSU5FIGJvb2wgZm9ydGlmeV9tZW1jcHlfY2hrKF9fa2VybmVsX3NpemVf
dCBzaXplLAo+ID4+ICAgICAgICAgY29uc3Qgc2l6ZV90IF9fcV9zaXplX2ZpZWxkID0gKHFfc2l6
ZV9maWVsZCk7ICAgICAgICAgICAgICAgICAgIFwKPiA+PiAgICAgICAgIGZvcnRpZnlfd2Fybl9v
bmNlKGZvcnRpZnlfbWVtY3B5X2NoayhfX2ZvcnRpZnlfc2l6ZSwgX19wX3NpemUsICBcCj4gPj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF9fcV9zaXplLCBfX3Bfc2l6ZV9m
aWVsZCwgICAgICAgICAgXAo+ID4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBfX3Ffc2l6ZV9maWVsZCwgRk9SVElGWV9GVU5DXyAjI29wKSwgXAo+ID4+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBfX3Ffc2l6ZV9maWVsZCwgRk9SVElGWV9GVU5DXyAj
I29wLFwKPiA+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgI3AgIiBhdCAi
IEZJTEVfTElORSksIFwKPiA+PiAgICAgICAgICAgICAgICAgICAjb3AgIjogZGV0ZWN0ZWQgZmll
bGQtc3Bhbm5pbmcgd3JpdGUgKHNpemUgJXp1KSBvZiBzaW5nbGUgJXMgKHNpemUgJXp1KVxuIiwg
XAo+ID4+ICAgICAgICAgICAgICAgICAgIF9fZm9ydGlmeV9zaXplLCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFwKPiA+PiAgICAgICAgICAgICAgICAgICAiZmllbGQgXCIi
ICNwICJcIiBhdCAiIEZJTEVfTElORSwgICAgICAgICAgICAgICAgICAgICBcCj4gPj4KPiA+Pgo+
ID4+IC0tCj4gPj4gS2VlcyBDb29rCj4gPj4KPiA+Cj4gPkhpIEtlZXMsCj4gPlNvcnJ5IGZvciB0
aGUgZGVsYXkgaW4gcmVzcG9uZGluZy4gWW91ciBwYXRjaCBhbHNvIGNhdXNlZCB0aGUgc3lzdGVt
Cj4gPnRvIGhhbmcgYm9vdGluZywgYnV0IEkgdG9vayBpdCBhcyBpbnNwaXJhdGlvbiB0byB0cnkg
c29tZSB0aGluZ3MuCj4gPlRMO0RSIEkgc2VlIHRoZXNlIHR3byBwcmludCBzZXZlcmFsIHRpbWVz
Ogo+ID4KPiA+V2FudGVkIHRvIHdyaXRlIDggdG8gYSAwLXNpemVkIGRlc3RpbmF0aW9uOiBvbGRw
dHIgYXQKPiA+YXJjaC9yaXNjdi9lcnJhdGEvdGhlYWQvZXJyYXRhLmM6MTg1Cj4gPldhbnRlZCB0
byB3cml0ZSAyOCB0byBhIDAtc2l6ZWQgZGVzdGluYXRpb246IG9sZHB0ciBhdAo+ID5hcmNoL3Jp
c2N2L2VycmF0YS90aGVhZC9lcnJhdGEuYzoxODUKPiA+Cj4gPlNpbmNlIEkgc3VzcGVjdGVkIENP
TkZJR19FUlJBVEFfVEhFQURfTUFFIHdoaWNoIHJlbGllcyBvbgo+ID5DT05GSUdfUklTQ1ZfQUxU
RVJOQVRJVkVfRUFSTFkgSSBzdXNwZWN0ZWQgaXQgaXMganVzdCB0b28gZWFybHkgZm9yCj4gPnBy
XyosIGV0Yy4gSSB0cmllZCB0cmFjZV9wcmludGsgYnV0IHRoYXQgZGlkbid0IHByb2R1Y2UgYW55
IHRyYWNlcywKPiA+YW5kIHRoZW4gSSBmb3VuZCBhIGNvbW1lbnQgd2hpY2ggbWFrZXMgbWUgdGhp
bmsgd2UncmUgdG9vIGVhcmx5IGZvcgo+ID50aGF0IHRvby4KPiA+aHR0cHM6Ly9naXQua2VybmVs
Lm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvYXJj
aC9yaXNjdi9rZXJuZWwvYWx0ZXJuYXRpdmUuYz9oPXY2LjExI24yMTQKPiA+Cj4gPkkgZGlkbid0
IHdhbnQgdG8gZ2l2ZSB1cCBzbyBJIHdyb3RlIGEgc2ltcGxlIG1vZHVsZSB0byBmaWd1cmUgb3V0
IGhvdwo+ID50byB1c2Ugc2JpX2VjYWxsIGFuZCB0aGVuIGluY29ycG9yYXRlZCB0aGF0IGlkZWEg
aW50byB5b3VyIHBhdGNoLAo+ID5hbHRob3VnaCBldmVuIHRoYXQgd2FzIG5vdCBzdHJhaWdodGZv
cndhcmQ6Cj4gPmh0dHBzOi8vZ2lzdC5naXRodWIuY29tL2ptb250bGVvbi9mMzUzNmFkNzBkYzky
YmVkOTkyMTM5YWQ1YjI2NmQ1Ywo+Cj4gT2ggbmljZSB3b3JrISBQcm9iYWJseSBzb21ldGhpbmcg
cmlzY3Ytc3BlY2lmaWMgbmVlZHMgdG8gYmUgd2lyZWQgdXAgdG8gdGhlIHByaW50ayByb3V0aW5l
cyB0byBkbyB3aGF0IHlvdSBoYXZlIHRoZXJlIHVudGlsIHByaW50ayBpcyBmdWxseSBhdmFpbGFi
bGUgIEJ1dCB0aGF0J3MgYSBzZXBhcmF0ZSBpc3N1ZSwgSSBndWVzcy4KPgo+ID5GdWxsIG91dHB1
dDogaHR0cHM6Ly9naXN0LmdpdGh1Yi5jb20vam1vbnRsZW9uLzgyM2ZhY2ZmMzhlMjhiNzE3ZjE1
M2UzOGFkY2ZkN2ZlCj4KPiBEb2VzIHRoZSBzeXN0ZW0gYm9vdCB3aXRoIHlvdXIgcGF0Y2g/CgpZ
ZXMuIEl0IGJvb3RzIGZ1bGx5LiBJdCBhbHNvIGJvb3RlZCB3aXRoIHRyYWNlX3ByaW50aywgaXQg
anVzdCBkaWRuJ3QKcHJvZHVjZSBhIHRyYWNlLCB3aGljaCBhZ2FpbiBJIHRoaW5rIGlzIGV4cGVj
dGVkIGF0IHRoYXQgc3RhZ2UuIEl0CnNlZW1zIGFzIGxvbmcgYXMgdGhlcmUgYXJlIG5vICdub3Jt
YWwnIHByaW50IGF0dGVtcHRzLCBwcl8oKSosIGV0Yy4gaXQKd29ya3MuCgo+IEkgd291bGQgZ3Vl
c3MgdGhhdCB0aGlzIGxpbmUgYXQgYXJjaC9yaXNjdi9lcnJhdGEvdGhlYWQvZXJyYXRhLmM6MTY4
Ogo+Cj4gdm9pZCAqb2xkcHRyLCAqYWx0cHRyOwo+Cj4gU2hvdWxkIGJlOgo+Cj4gdTggKm9sZHB0
ciwgKmFsdHB0cjsKCkkgdHJpZWQgdGhpcywgYnV0IGl0IGRpZG4ndCBhcHBlYXIgdG8gbWFrZSBh
IGRpZmZlcmVuY2UsIEkgd2lsbCB0cnkKc29tZSBtb3JlIHRvZGF5LCB0aG91Z2ggSSBhZG1pdCB0
byBiZWluZyBvdXQgb2YgbXkgZWxlbWVudC4KCgoKPiBCdXQgbWF5YmUgX19BTFRfUFRSIG5lZWRz
IGFkanVzdG1lbnQgdG9vPyBIbW0uIEkgd291bGQgaGF2ZSBleHBlY3RlZCB2b2lkICogdG8gaGF2
ZSBhIHNpemUgb2YgU0laRV9NQVggaGVyZSwgdGhvdWdoLCBzbyBzb21ldGhpbmcgZWxzZSBtaWdo
dCBiZSBjb25mdXNpbmcgdGhlIGNoZWNrLgo+Cj4KPiAtLQo+IEtlZXMgQ29vawo+CgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
