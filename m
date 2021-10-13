Return-Path: <SRS0=U004=PB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34872C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 13:18:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB38F61040
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 13:18:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EB38F61040
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Skrwu5a0wh52uVSaP/jd/3vfULIkMsL7ywo3EFiWXsg=; b=E2X+LfbpmUrau2
	I7aQGSqAWcoy5C7NgSlGlz0CkTvQpPWVrTvzIJ9LAkg9fdZ/q/PrY0KVco9DZgBpPoSZip5vxb7O+
	HT/rxQqXZck+zHyO51ckzDyhDFeME+BMEOrm6yB/whW6TBWp+TEgHvQ0jHP00Qth+prGVniZnp5kc
	hPebfc2EsXd/O3Gl6jg4vJQUzjB9KJomybp5oQeJUARuhuSUsjQ2tFUGe+KCEQTc8J5i9BQ6NGP0h
	LTbmLNy0pcaPUUToBCTifOnCRpyNgy0u1MH64FC8SFoQr/2bBAFPVWpg7H20R8yB97Zto3I1duEv0
	RPEtAq24JRsq18Z5EZNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mae91-00Gpu1-H0; Wed, 13 Oct 2021 13:18:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1madhx-00Gg2w-Md
 for linux-riscv@lists.infradead.org; Wed, 13 Oct 2021 12:50:11 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 40026610FC
 for <linux-riscv@lists.infradead.org>; Wed, 13 Oct 2021 12:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634129409;
 bh=J8g0tilzDKDby65Hj+Esonf9qYC68SF2NllkOVPodHI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Ounni1CZ7mb3RKxYgPL+4J3upP35LrQNOjvT/tm80YmXedHoZ/RJV01CDPMnsITHx
 XZuOBDU5e+LCCvDF8pGLtaBV5PNoxLN3dXzIU5HEsZfOVAPxI1c0NXUS/Y1ylvBXMR
 cg4upO5gjW8dB/F/q/PftevcjyYCAmhdNgCLKOVKoiVCiEcS0993yV+5mTpW46J2fm
 BhBne/YZNbkrDZ854ZiHPS9280uG9aZz0TLU1fCpMNdwe+u4kAITjZv23tv2aKwXw1
 JnpEXHrrjcs+/QN99rokkFO3dV94qmM7l6Pz8Cfq5XQQNaRrCREAVVKP78HCuuuM/P
 8ciu1R8j/JwNA==
Received: by mail-ua1-f52.google.com with SMTP id e7so4153034ual.11
 for <linux-riscv@lists.infradead.org>; Wed, 13 Oct 2021 05:50:09 -0700 (PDT)
X-Gm-Message-State: AOAM531B4Bcb0qRcXpk5p97/dF86ct6h8CtzhOpfvIO7nDRah+ES+kBX
 JwnR87Dh9e7wowWMnf0bP4mepPhbLQ1lm4f21hM=
X-Google-Smtp-Source: ABdhPJz42HJibxAywzH9SAbeD10S23rM8343rvOoO185Tk+OBWh2re//oqTnchMStnNcSzdI/PN6HjF7Apo3TozB8cs=
X-Received: by 2002:a05:6102:537:: with SMTP id
 m23mr1535407vsa.43.1634129408301; 
 Wed, 13 Oct 2021 05:50:08 -0700 (PDT)
MIME-Version: 1.0
References: <20211013012149.2834212-1-guoren@kernel.org>
 <4245323.jvX0RauA9x@diego>
 <CAAhSdy29WAXfBz6Ag-kAjNo_uhJO+AuC0e-UyWhwhaCmrw7pjw@mail.gmail.com>
 <4027415.QZv1u5a1DM@diego>
In-Reply-To: <4027415.QZv1u5a1DM@diego>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 13 Oct 2021 20:49:57 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTDZ0QjY9JL=U61=ubWrGWVOe2VBbW6hgzsHqsePgN0Ww@mail.gmail.com>
Message-ID: <CAJF2gTTDZ0QjY9JL=U61=ubWrGWVOe2VBbW6hgzsHqsePgN0Ww@mail.gmail.com>
Subject: Re: [PATCH V3 1/2] dt-bindings: update riscv plic compatible string
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@wdc.com>, 
 Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>, 
 Rob Herring <robh@kernel.org>, Palmer Dabbelt <palmerdabbelt@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_055009_820203_5397C3D6 
X-CRM114-Status: GOOD (  32.19  )
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

T24gV2VkLCBPY3QgMTMsIDIwMjEgYXQgNTo0MyBQTSBIZWlrbyBTdMO8Ym5lciA8aGVpa29Ac250
ZWNoLmRlPiB3cm90ZToKPgo+IEFtIE1pdHR3b2NoLCAxMy4gT2t0b2JlciAyMDIxLCAxMToxOTo1
MyBDRVNUIHNjaHJpZWIgQW51cCBQYXRlbDoKPiA+IE9uIFdlZCwgT2N0IDEzLCAyMDIxIGF0IDI6
NDQgUE0gSGVpa28gU3TDvGJuZXIgPGhlaWtvQHNudGVjaC5kZT4gd3JvdGU6Cj4gPiA+Cj4gPiA+
IEFtIE1pdHR3b2NoLCAxMy4gT2t0b2JlciAyMDIxLCAxMToxMToyNiBDRVNUIHNjaHJpZWIgQW51
cCBQYXRlbDoKPiA+ID4gPiBPbiBXZWQsIE9jdCAxMywgMjAyMSBhdCAyOjI3IFBNIEhlaWtvIFN0
w7xibmVyIDxoZWlrb0BzbnRlY2guZGU+IHdyb3RlOgo+ID4gPiA+ID4KPiA+ID4gPiA+IEhpIEFu
dXAsCj4gPiA+ID4gPgo+ID4gPiA+ID4gQW0gTWl0dHdvY2gsIDEzLiBPa3RvYmVyIDIwMjEsIDA3
OjExOjQ2IENFU1Qgc2NocmllYiBBbnVwIFBhdGVsOgo+ID4gPiA+ID4gPiBPbiBXZWQsIE9jdCAx
MywgMjAyMSBhdCA2OjUyIEFNIDxndW9yZW5Aa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+ID4gPiA+
ID4KPiA+ID4gPiA+ID4gPiBGcm9tOiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+
Cj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBBZGQgdGhlIGNvbXBhdGlibGUgc3RyaW5nICJ0
aGVhZCxjOTAwLXBsaWMiIHRvIHRoZSByaXNjdiBwbGljCj4gPiA+ID4gPiA+ID4gYmluZGluZ3Mg
dG8gc3VwcG9ydCBTT0NzIHdpdGggdGhlYWQsYzl4eCBwcm9jZXNzb3IgY29yZXMuCj4gPiA+ID4g
PiA+ID4KPiA+ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5AbGludXgu
YWxpYmFiYS5jb20+Cj4gPiA+ID4gPiA+ID4gQ2M6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5v
cmc+Cj4gPiA+ID4gPiA+ID4gQ2M6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJkYWJiZWx0QGdvb2ds
ZS5jb20+Cj4gPiA+ID4gPiA+ID4gQ2M6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+
Cj4gPiA+ID4gPiA+ID4gQ2M6IEF0aXNoIFBhdHJhIDxhdGlzaC5wYXRyYUB3ZGMuY29tPgo+ID4g
PiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gLS0tCj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBD
aGFuZ2VzIHNpbmNlIFYzOgo+ID4gPiA+ID4gPiA+ICAtIFJlbmFtZSAiYzl4eCIgdG8gImM5MDAi
Cj4gPiA+ID4gPiA+ID4gIC0gQWRkIHRoZWFkLGM5MDAtcGxpYyBpbiB0aGUgZGVzY3JpcHRpb24g
c2VjdGlvbgo+ID4gPiA+ID4gPiA+IC0tLQo+ID4gPiA+ID4gPiA+ICAuLi4vYmluZGluZ3MvaW50
ZXJydXB0LWNvbnRyb2xsZXIvc2lmaXZlLHBsaWMtMS4wLjAueWFtbCAgICB8IDYgKysrKysrCj4g
PiA+ID4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKPiA+ID4gPiA+ID4g
Pgo+ID4gPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvc2lmaXZlLHBsaWMtMS4wLjAueWFtbCBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9zaWZpdmUs
cGxpYy0xLjAuMC55YW1sCj4gPiA+ID4gPiA+ID4gaW5kZXggMDhkNWE1N2NlMDBmLi44MjYyOTgz
MmU1YTUgMTAwNjQ0Cj4gPiA+ID4gPiA+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL3NpZml2ZSxwbGljLTEuMC4wLnlhbWwKPiA+
ID4gPiA+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW50ZXJy
dXB0LWNvbnRyb2xsZXIvc2lmaXZlLHBsaWMtMS4wLjAueWFtbAo+ID4gPiA+ID4gPiA+IEBAIC0z
NSw2ICszNSwxMSBAQCBkZXNjcmlwdGlvbjoKPiA+ID4gPiA+ID4gPiAgICBjb250YWlucyBhIHNw
ZWNpZmljIG1lbW9yeSBsYXlvdXQsIHdoaWNoIGlzIGRvY3VtZW50ZWQgaW4gY2hhcHRlciA4IG9m
IHRoZQo+ID4gPiA+ID4gPiA+ICAgIFNpRml2ZSBVNSBDb3JlcGxleCBTZXJpZXMgTWFudWFsIDxo
dHRwczovL3N0YXRpYy5kZXYuc2lmaXZlLmNvbS9VNTQtTUMtUlZDb3JlSVAucGRmPi4KPiA+ID4g
PiA+ID4gPgo+ID4gPiA+ID4gPiA+ICsgIFdoaWxlIHRoZSAidGhlYWQsYzkwMC1wbGljIiB3b3Vs
ZCBtYXNrIElSUSB3aXRoIHJlYWRsKGNsYWltKSwgc28gaXQgbmVlZG4ndAo+ID4gPiA+ID4gPiA+
ICsgIG1hc2svdW5tYXNrIHdoaWNoIG5lZWRlZCBpbiBSSVNDLVYgUExJQy4gV2hlbiBpbiBJUlFT
X09ORVNIT1QgJiBJUlFDSElQX0VPSV9USFJFQURFRAo+ID4gPiA+ID4gPiA+ICsgIHBhdGgsIHVu
bmVjZXNzYXJ5IG1hc2sgb3BlcmF0aW9uIHdvdWxkIGNhdXNlIGEgYmxvY2tpbmcgaXJxIGJ1ZyBp
biB0aGVhZCxjOTAwLXBsaWMuCj4gPiA+ID4gPiA+ID4gKyAgQmVjYXVzZSB3aGVuIElSUSBpcyBk
aXNhYmxlZCBpbiBjOTAwLCB3cml0ZWwoaHdpcnEsIGNsYWltKSB3b3VsZCBiZSBpbnZhbGlkLgo+
ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBUaGlzIGlzIGEgdG90YWxseSBpbmNvcnJlY3QgZGVzY3Jp
cHRpb24gb2YgdGhlIGVycmF0YSByZXF1aXJlZCBmb3IgQzl4eCBQTElDLgo+ID4gPiA+ID4gPgo+
ID4gPiA+ID4gPiBQbGVhc2UgZG9uJ3QgcHJvamVjdCBub24tY29tcGxpYW5jZSBhcyBhIGZlYXR1
cmUgb2YgQzl4eCBQTElDLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4g
PiAgbWFpbnRhaW5lcnM6Cj4gPiA+ID4gPiA+ID4gICAgLSBTYWdhciBLYWRhbSA8c2FnYXIua2Fk
YW1Ac2lmaXZlLmNvbT4KPiA+ID4gPiA+ID4gPiAgICAtIFBhdWwgV2FsbXNsZXkgIDxwYXVsLndh
bG1zbGV5QHNpZml2ZS5jb20+Cj4gPiA+ID4gPiA+ID4gQEAgLTQ2LDYgKzUxLDcgQEAgcHJvcGVy
dGllczoKPiA+ID4gPiA+ID4gPiAgICAgICAgLSBlbnVtOgo+ID4gPiA+ID4gPiA+ICAgICAgICAg
ICAgLSBzaWZpdmUsZnU1NDAtYzAwMC1wbGljCj4gPiA+ID4gPiA+ID4gICAgICAgICAgICAtIGNh
bmFhbixrMjEwLXBsaWMKPiA+ID4gPiA+ID4gPiArICAgICAgICAgIC0gdGhlYWQsYzkwMC1wbGlj
Cj4gPiA+ID4gPgo+ID4gPiA+ID4gd2Ugc3RpbGwgd2FudCBzcGVjaWZpYyBTb0MgbmFtZXMgaW4g
dGhlIGNvbXBhdGlibGUsIHRoZSAiYzkwMCIKPiA+ID4gPiA+IGlzIHN0aWxsIGEgc29ydC1vZiBw
bGFjZWhvbGRlci4KPiA+ID4gPgo+ID4gPiA+IFllcywgd2UgbmVlZCAiYzkwMCIgY29tcGF0aWJs
ZSBzdHJpbmcgYXMgd2VsbC4gVGhlICJjOXh4Igo+ID4gPiA+IGNvbXBhdGlibGUgc3RyaW5nIGlz
IGZvciB0aGUgY3VzdG9tIFBMSUMgc3BlYyBmb2xsb3dlZCBieSBULUhFQUQuCj4gPiA+Cj4gPiA+
IFdoYXQgSSBtZWFudCB3YXMgdGhhdCB0aGUgc29jLXNwZWNpZmljIHN0cmluZyBzaG91bGQgbmFt
ZSB0aGUKPiA+ID4gYWN0dWFsIFNvQyAoYzkwNiwgYzkxMCkgYW5kIG5vdCBzb21lIGltYWdpbmFy
eSBjaGlwIDstKQo+ID4KPiA+IEFoaCwgeWVzLiBJdCBzaG91bGQgYmUgYW4gYWN0dWFsIHNvYyBu
YW1lIGluIHRoZSBjb21wYXRpYmxlCj4gPiBzdHJpbmcuCj4gPgo+ID4gRm9yIGV4YW1wbGUsIFNp
Rml2ZSB1c2VzICJmdTU0MCIgc3RyaW5nIHRvIGlkZW50aWZ5IHNvbWUgb2YgdGhlCj4gPiBkZXZp
Y2VzIG9uIGJvdGggU2lGaXZlIHVubGVhc2hlZCBhbmQgU2lGaXZlIHVubWF0Y2hlZCBib2FyZHMu
Cj4gPgo+ID4gSSB3YXMgdW5kZXIgdGhlIGltcHJlc3Npb24gdGhhdCAiYzkwMCIgaXMgYW4gYWN0
dWFsIFNvQyBuYW1lLgo+ID4KPiA+IFJlZ2FyZHMsCj4gPiBBbnVwCj4gPgo+ID4gPgo+ID4gPiBT
ZWUgZm9yIGV4YW1wbGUgbWFsaSBncHUgYmluZGluZ3MgZm9yIGEgc2ltaWxhciByZWZlcmVuY2UK
PiA+ID4gaW4gZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvYXJtLG1hbGktYmlmcm9zdC55YW1sIC4K
PiA+ID4KPiA+ID4KPiA+ID4KPiA+ID4KPiA+ID4gPgo+ID4gPiA+ID4KPiA+ID4gPiA+Cj4gPiA+
ID4gPiA+ID4gICAgICAgIC0gY29uc3Q6IHNpZml2ZSxwbGljLTEuMC4wCj4gPiA+ID4gPiA+Cj4g
PiA+ID4gPiA+IFRoZSBQTElDIERUIG5vZGUgcmVxdWlyZXMgdHdvIGNvbXBhdGlibGUgc3RyaW5n
Ogo+ID4gPiA+ID4gPiA8aW1wbGVtZW50YXRpb25fY29tcGF0PiwgPHNwZWNfY29tcGF0Pgo+ID4g
PiA+ID4gPgo+ID4gPiA+ID4gPiBUaGUgQzl4eCBQTElDIGlzIG5vdCBSSVNDLVYgUExJQyBzbywg
dGhlIERUIG5vZGUgc2hvdWxkCj4gPiA+ID4gPiA+IGJlOiAidGhlYWQsYzkwMC1wbGljIiwgInRo
ZWFkLGM5eHgtcGxpYyIKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gWW91IG5lZWQgdG8gY2hhbmdl
ICItIGNvbnN0OiBzaWZpdmUscGxpYy0xLjAuMCIgdG8KPiA+ID4gPiA+ID4gLSBlbnVtOgo+ID4g
PiA+ID4gPiAgICAgLSBzaWZpdmUscGxpYy0xLjAuMAo+ID4gPiA+ID4gPiAgICAgLSB0aGVhZCxj
OXh4LXBsaWMKPgo+IGlzbid0IFh1YW5UaWUgdGhlIHNlcmllcyBjb250YWluaW5nIHRoZSBjOTA2
IGFuZCBjOTEwPwpYdWFuVGllIGNvbnRhaW4gdHdvIENQVSBzZXJpZXM6CnJpc2N2OiBjOTA2LCBj
OTEwCmNza3k6IGM4MDcsIGM4MTAsIGM4NjAKCj4gU28gbWF5YmUKPiAgICAgICAgIHRoZWFkLHh1
YW50aWUtcGxpYwo+IGZvciB0aGUgc3BlYyBjb21wYXRpYmxlLgo+Cj4gU28gZG9pbmcgaW4gZnVs
bAo+ICAgICAgICAgY29tcGF0aWJsZSA9ICJ0aGVhZCxjOTA2LXBsaWMiLCAidGhlYWQseHVhbnRp
ZS1wbGljIgpIb3cgYWJvdXQ6CmNvbXBhdGlibGUgPSAiYWxsd2lubmVyLGQxLXBsaWMiLCAidGhl
YWQsYzkwMC1wbGljIgoKPgo+Cj4gSGVpa28KPgo+CgoKLS0gCkJlc3QgUmVnYXJkcwogR3VvIFJl
bgoKTUw6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWNza3kvCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
