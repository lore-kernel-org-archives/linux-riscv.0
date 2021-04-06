Return-Path: <SRS0=fjc5=JD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68CCEC433B4
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Apr 2021 08:11:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3CE8613BE
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Apr 2021 08:11:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3CE8613BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SGBiD2gzZA9MO1EAoFE31mfoVcMLB3jWU8Vt6M5EA5M=; b=cTS/mwC5bQrXYgKZq9LOxWWid
	mQUbI+xO3UT2/EhyCRbvJoU7LPWM6AbQt31LemEJav7AIXUQqpeF1teSFixUPKVHItR4fPlgA5joq
	hhDZTZ9w1NaCTaDuJgduVSZyQgAReTSf3hPzEobLJFOkEbp1avhraE5o6LkQymFRqX9GHbU7+D6Xw
	Rg8PyWhpuQ7EHwTOswXpHV+BkZb6ciV4SUe120Nw09y2tJhhsHHtOz7ASNPtzWR0rNfzBYGHK0Kvv
	aHH1T5TXcFe4uXHeKW1rQqVTgpv7P3JskOyU1Wj9mEBUymIIIB+4Dk4WkSXo7L9jNCOngt8wmPHoT
	8cGFX4IlA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTgo7-001q3p-Di; Tue, 06 Apr 2021 08:11:31 +0000
Received: from mailgate.ics.forth.gr ([139.91.1.2])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTgo4-001q3H-Nt
 for linux-riscv@lists.infradead.org; Tue, 06 Apr 2021 08:11:30 +0000
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
 by mailgate.ics.forth.gr (8.15.2/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 1368BR3b016264
 for <linux-riscv@lists.infradead.org>; Tue, 6 Apr 2021 11:11:27 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; d=ics.forth.gr; s=av; c=relaxed/simple;
 q=dns/txt; i=@ics.forth.gr; t=1617696682; x=1620288682;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2r0QMkSyPkhE8Ev1lT1DRSw293cf5b3ZEKEW8v8rynY=;
 b=p0WyOp2TyUEvFHDEbdhJTxNDzwMbMhuPcUMVTbMIOWiMEQiQeeYhhQYoIxbLjA+3
 jOZ3D+Ao95NTsgx81NBzSKV+xOGwtyyv+mkGgfZT0bJQjgs7hReDBWIM1eyd/UFi
 c53AnzImYMCcJcGL/xn4PayOaujdK9MlQVKi9oasLO0RA+T+1p9MAYVl2uGE7N+F
 5gZshlSIweY5mJEYfDLGSnyl7Sf8agy264/09xgUgwL9bPnIXayHyGLzz75JwW2L
 F4kRqm61v55hQHKAALjcZuwkbjHS42ZGB3YhCfSaT/TQurpHvfanf+2r2MqKQoYX
 0lHISwWipULW5IThJfyGQA==;
X-AuditID: 8b5b014d-a4c337000000209f-d5-606c17aaeef5
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.151.35])
 by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id
 4F.01.08351.AA71C606; Tue,  6 Apr 2021 11:11:22 +0300 (EEST)
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Tue, 06 Apr 2021 11:11:22 +0300
From: Nick Kossifidis <mick@ics.forth.gr>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Nick Kossifidis <mick@ics.forth.gr>, linux-riscv
 <linux-riscv@lists.infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 3/5] RISC-V: Improve init_resources
Organization: FORTH
In-Reply-To: <CAMuHMdWi+wo0+PCR6B1wyXVesG-kL9NQt8XFBuWhZ3SdVUaLZg@mail.gmail.com>
References: <20210405085712.1953848-1-mick@ics.forth.gr>
 <20210405085712.1953848-4-mick@ics.forth.gr>
 <CAMuHMdWi+wo0+PCR6B1wyXVesG-kL9NQt8XFBuWhZ3SdVUaLZg@mail.gmail.com>
Message-ID: <5a09d1f0ded4581c9e7458f546db9329@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.3.16
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMLMWRmVeSWpSXmKPExsXSHT1dWXeVeE6Cwaef6hbPbu1lsri8aw6b
 xbbPLWwWze/OsVu8vNzDbNE2i9+BzePNy5csHg83XWLyOHS4g9Fj85J6j0vN19k9Pm+SC2CL
 4rJJSc3JLEst0rdL4Mo4M3UPa8Ed8Yrzk56wNjCuEupi5OSQEDCR+L1oA1MXIxeHkMBRRonT
 ew6zQCRMJWbv7WQEsXkFBCVOznwCFmcWsJCYemU/I4QtL9G8dTYziM0ioCqx6e4EdhCbTUBT
 Yv6lg0D1HBwiAroSc36CzWcW6GSS+LF+E1ivsICVxISZ/5hAbH4BYYlPdy+ygticAoESP59O
 gTpoHaPE8YZv7BBHuEgc/9/EDnGcisSH3w/YQRaIAtmb5ypNYBScheTUWUhOnYXk1AWMzKsY
 BRLLjPUyk4v10vKLSjL00os2MYLDndF3B+PtzW/1DjEycTAeYpTgYFYS4d3Rm50gxJuSWFmV
 WpQfX1Sak1p8iFGag0VJnJdXb0K8kEB6YklqdmpqQWoRTJaJg1OqgclTT25pxiJzlYYddYYr
 v7bpHlGonxgcVhTIv+UuQ83Pr489nnvNuf65UuTxln5dkYOHn3jcs1K7v+rZ0c1e895OF/Ep
 e1RuGB9fPuvcTnfBaxb6rp8ndx48NvHfg3VuE/fXhW5uy+lfwv2/4p7Eo6boUwu3vPeoMNQo
 dk+P8+cvu9+q6HbmbqdplsHZ9sqNW27IPApb1hjxOPHiqudTXCT8y39IXshl1G3eYLStKNtM
 ajPf8o9Gs523eUz/Envi2rWtng3fHGY7T+u24jq/KbP/7uKL27o4Ni96PnGhgbCUS/CnP7yK
 Mi57WjJ1y85XfGbOC5m4V+nqFZnKjV78lmLlaY8ubTHf0Rb7K6JYa7cSS3FGoqEWc1FxIgB2
 H1ll5gIAAA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_091128_981955_9DAE52A1 
X-CRM114-Status: GOOD (  21.14  )
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

SGVsbG8gR2VlcnQsCgrOo8+EzrnPgiAyMDIxLTA0LTA2IDEwOjE5LCBHZWVydCBVeXR0ZXJob2V2
ZW4gzq3Os8+BzrHPiM61Ogo+IEhpIE5pY2ssCj4gCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQo+
IAo+IE9uIE1vbiwgQXByIDUsIDIwMjEgYXQgMTA6NTcgQU0gTmljayBLb3NzaWZpZGlzIDxtaWNr
QGljcy5mb3J0aC5ncj4gCj4gd3JvdGU6Cj4+ICogS2VybmVsIHJlZ2lvbiBpcyBhbHdheXMgcHJl
c2VudCBhbmQgd2Uga25vdyB3aGVyZSBpdCBpcywgbm8KPj4gbmVlZCB0byBsb29rIGZvciBpdCBp
bnNpZGUgdGhlIGxvb3AsIGp1c3QgaWdub3JlIGl0IGxpa2UgdGhlCj4+IHJlc3Qgb2YgdGhlIHJl
c2VydmVkIHJlZ2lvbnMgd2l0aGluIHN5c3RlbSdzIG1lbW9yeS4KPj4gCj4+ICogRG9uJ3QgY2Fs
bCBtZW1ibG9ja19mcmVlIGluc2lkZSB0aGUgbG9vcCwgaWYgY2FsbGVkIGl0J2xsIHNwbGl0Cj4+
IHRoZSByZWdpb24gb2YgcHJlLWFsbG9jYXRlZCByZXNvdXJjZXMgaW4gdHdvIHBhcnRzLCBtZXNz
aW5nIHRoaW5ncwo+PiB1cCwganVzdCByZS11c2UgdGhlIHByZXZpb3VzIHByZS1hbGxvY2F0ZWQg
cmVzb3VyY2UgYW5kIGZyZWUgYW55Cj4+IHVudXNlZCByZXNvdXJjZXMgYWZ0ZXIgYm90aCBsb29w
cyBmaW5pc2guCj4+IAo+PiAqIG1lbWJsb2NrX2FsbG9jIG1heSBhZGQgYSByZWdpb24gd2hlbiBj
YWxsZWQsIHNvIGluY3JlYXNlIHRoZQo+PiBudW1iZXIgb2YgcHJlLWFsbG9jYXRlZCByZWdpb25z
IGJ5IG9uZSB0byBiZSBvbiB0aGUgc2FmZSBzaWRlCj4+IChyZXBvcnRlZCBhbmQgcGF0Y2hlZCBi
eSBHZWVydCBVeXR0ZXJob2V2ZW4pCj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBHZWVydCBVeXR0ZXJo
b2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPgo+IAo+IFdoZXJlIGRvZXMgdGhpcyBTb0IgY29t
ZSBmcm9tPwo+IAo+PiBTaWduZWQtb2ZmLWJ5OiBOaWNrIEtvc3NpZmlkaXMgPG1pY2tAaWNzLmZv
cnRoLmdyPgo+IAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jCj4+ICsrKyBiL2Fy
Y2gvcmlzY3Yva2VybmVsL3NldHVwLmMKPiAKPj4gQEAgLTEyOSw1MyArMTM5LDQyIEBAIHN0YXRp
YyB2b2lkIF9faW5pdCBpbml0X3Jlc291cmNlcyh2b2lkKQo+PiAgICAgICAgIHN0cnVjdCByZXNv
dXJjZSAqcmVzID0gTlVMTDsKPj4gICAgICAgICBzdHJ1Y3QgcmVzb3VyY2UgKm1lbV9yZXMgPSBO
VUxMOwo+PiAgICAgICAgIHNpemVfdCBtZW1fcmVzX3N6ID0gMDsKPj4gLSAgICAgICBpbnQgcmV0
ID0gMCwgaSA9IDA7Cj4+IC0KPj4gLSAgICAgICBjb2RlX3Jlcy5zdGFydCA9IF9fcGFfc3ltYm9s
KF90ZXh0KTsKPj4gLSAgICAgICBjb2RlX3Jlcy5lbmQgPSBfX3BhX3N5bWJvbChfZXRleHQpIC0g
MTsKPj4gLSAgICAgICBjb2RlX3Jlcy5mbGFncyA9IElPUkVTT1VSQ0VfU1lTVEVNX1JBTSB8IElP
UkVTT1VSQ0VfQlVTWTsKPj4gLQo+PiAtICAgICAgIHJvZGF0YV9yZXMuc3RhcnQgPSBfX3BhX3N5
bWJvbChfX3N0YXJ0X3JvZGF0YSk7Cj4+IC0gICAgICAgcm9kYXRhX3Jlcy5lbmQgPSBfX3BhX3N5
bWJvbChfX2VuZF9yb2RhdGEpIC0gMTsKPj4gLSAgICAgICByb2RhdGFfcmVzLmZsYWdzID0gSU9S
RVNPVVJDRV9TWVNURU1fUkFNIHwgSU9SRVNPVVJDRV9CVVNZOwo+PiAtCj4+IC0gICAgICAgZGF0
YV9yZXMuc3RhcnQgPSBfX3BhX3N5bWJvbChfZGF0YSk7Cj4+IC0gICAgICAgZGF0YV9yZXMuZW5k
ID0gX19wYV9zeW1ib2woX2VkYXRhKSAtIDE7Cj4+IC0gICAgICAgZGF0YV9yZXMuZmxhZ3MgPSBJ
T1JFU09VUkNFX1NZU1RFTV9SQU0gfCBJT1JFU09VUkNFX0JVU1k7Cj4+ICsgICAgICAgaW50IG51
bV9yZXNvdXJjZXMgPSAwLCByZXNfaWR4ID0gMDsKPj4gKyAgICAgICBpbnQgcmV0ID0gMDsKPj4g
Cj4+IC0gICAgICAgYnNzX3Jlcy5zdGFydCA9IF9fcGFfc3ltYm9sKF9fYnNzX3N0YXJ0KTsKPj4g
LSAgICAgICBic3NfcmVzLmVuZCA9IF9fcGFfc3ltYm9sKF9fYnNzX3N0b3ApIC0gMTsKPj4gLSAg
ICAgICBic3NfcmVzLmZsYWdzID0gSU9SRVNPVVJDRV9TWVNURU1fUkFNIHwgSU9SRVNPVVJDRV9C
VVNZOwo+PiArICAgICAgIC8qICsgMSBhcyBtZW1ibG9ja19hbGxvYygpIG1pZ2h0IGluY3JlYXNl
IAo+PiBtZW1ibG9jay5yZXNlcnZlZC5jbnQgKi8KPj4gKyAgICAgICBudW1fcmVzb3VyY2VzID0g
bWVtYmxvY2subWVtb3J5LmNudCArIG1lbWJsb2NrLnJlc2VydmVkLmNudCArIAo+PiAxOwo+PiAr
ICAgICAgIHJlc19pZHggPSBudW1fcmVzb3VyY2VzIC0gMTsKPj4gCj4+IC0gICAgICAgbWVtX3Jl
c19zeiA9IChtZW1ibG9jay5tZW1vcnkuY250ICsgbWVtYmxvY2sucmVzZXJ2ZWQuY250KSAqIAo+
PiBzaXplb2YoKm1lbV9yZXMpOwo+IAo+IE9oLCB5b3UgaW5jb3Jwb3JhdGVkIG15IGNvbW1pdCBj
ZTk4OWYxNDcyYWUzNTBlICgiUklTQy1WOiBGaXggCj4gb3V0LW9mLWJvdW5kcwo+IGFjY2Vzc2Vz
IGluIGluaXRfcmVzb3VyY2VzKCkiKSAoZnJvbSB2NS4xMi1yYzQpIGludG8geW91ciBwYXRjaC4K
PiBXaHk/IFRoaXMgbWVhbnMgeW91ciBwYXRjaCBkb2VzIG5vdCBhcHBseSBhZ2FpbnN0IHVwc3Ry
ZWFtLgo+IAoKU29ycnkgaWYgdGhpcyBsb29rcyBhd2t3YXJkLCBJJ20gdW5kZXIgdGhlIGltcHJl
c3Npb24gdGhhdCBuZXcgZmVhdHVyZXMgCmdvIG9uIGZvci1uZXh0IGluc3RlYWQgb2YgZml4ZXMg
YW5kIHlvdXIgcGF0Y2ggaGFzbid0IGJlZW4gbWVyZ2VkIG9uIApmb3ItbmV4dCB5ZXQuIEkgdGhv
dWdodCBpdCB3b3VsZCBiZSBjbGVhbmVyIHRvIGhhdmUgb25lIHBhdGNoIHRvIG1lcmdlIApmb3Ig
aW5pdF9yZXNvdXJjZXMgaW5zdGVhZCBvZiB0d28sIGFuZCBzaW1wbGVyIGZvciBwZW9wbGUgdG8g
dGVzdCB0aGUgCnNlcmllcy4gSSBjYW4gcmViYXNlIHRoaXMgb24gdG9wIG9mIGZpeGVzIGlmIHRo
YXQgd29ya3MgYmV0dGVyIGZvciB5b3UgCm9yIFBhbG1lci4KClJlZ2FyZHMsCk5pY2sKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
