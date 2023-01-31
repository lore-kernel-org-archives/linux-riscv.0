Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DA90C61DA4
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Jan 2023 01:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VEKe5H/wijrXfbkfAFCymiMqi586k3bJYzacdxVW7rQ=; b=ZgeN0awJq1e87i
	5m5Yy/lHmQEJFGK/UiwcsRWiXJ4PU6YSXmeofI9YaomeWz4UhdtVMNiJ5EdoQvg1HX3re9fqiCpV4
	0gqNkrQDIuMAttLyy5h8dn5xVgR4PYq1yRM7dokP3um6QnPRcDbxvU3Owe/NTlf56AwKLjSpUgDKs
	NnvS7FcMK8rTe3OO5W22mkuXoSAzlfz1AlbyP/eavVWH2a/kf8MY7f7mUWWF8N+JZnMSb4TaNMeA+
	vwJuRffG15iM7Q7T29tQEpOaJRkuR2G5UY64ghC6QnFHkeG5gZRAIssoBTHDhBTJidvnYoGbLERDN
	YYR3KasVnG3yR1k2sdlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMfAK-005yZp-3A; Tue, 31 Jan 2023 01:10:28 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMfAG-005yYS-CE
	for linux-riscv@lists.infradead.org; Tue, 31 Jan 2023 01:10:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9E916B81899
	for <linux-riscv@lists.infradead.org>; Tue, 31 Jan 2023 01:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDB2AC433A4
	for <linux-riscv@lists.infradead.org>; Tue, 31 Jan 2023 01:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675127413;
	bh=onpyFW2B+Gj5kU4fpubsm41eLl07ahwfV/KCzovWuCM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JLX3QU5f6YyvUji+AsZZDgDFjL93k9MqyxII8YTOjFjg9xb7qQusUInU5OBUWf7Uu
	 0mK51JzVBJgHZyPLpCYbVU7HsptcBbhQ6jMTTk22nzwL806mEeTkIt98D39v54yXv+
	 +sLcniGZ5f3crLxq3qobHzYMiNH7fa1gL6l4sHG+ZCoz1yyJn71JkTKYaAeaXnGAs3
	 kZptq0fewUUZZdUrjD3OuTsaKLzaIFPJYuY0x6Is68I3VfJLJFEz5I2bzWRmkbWPdq
	 z1mwri75ZMYOyj+mjcg7vhjR51l5hgf3H83m4PDhrfxe7ZfghYMYIir5fVGMnADnyC
	 OzZ9FgojgSoGA==
Received: by mail-ed1-f44.google.com with SMTP id cw4so7776814edb.13
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jan 2023 17:10:13 -0800 (PST)
X-Gm-Message-State: AFqh2kqaAsdAvInd9DVIXm5AeYgD/XkscHuh4P5L6dtaR80YZAh53Dgv
	0nRUghWULUb+4Bn6JN5N8Q2WX8mih18+xRbHluw=
X-Google-Smtp-Source: AMrXdXsIBsel5Hml0GeDeoAvVHwBKmoYikSeM8cUxgU/ynijJ65Yr62SwxH+Ic34fjMwvakQ3EXbZiCwVVaf5q+hTIM=
X-Received: by 2002:aa7:dbd9:0:b0:49c:ea59:46b with SMTP id
 v25-20020aa7dbd9000000b0049cea59046bmr10186437edt.54.1675127411777; Mon, 30
 Jan 2023 17:10:11 -0800 (PST)
MIME-Version: 1.0
References: <20230126161559.1467374-1-guoren@kernel.org> <0abbbdd4-6b85-9659-03ee-97c56a5b77c1@huawei.com>
 <CAJF2gTS0s4X_uwLaEeSqKAyRmxCR2vxRuHhz7-SP2w4bBqzr+Q@mail.gmail.com>
 <87r0vc9h4g.fsf@all.your.base.are.belong.to.us> <CAJF2gTQZWO8Ubi60nHn-J-8czqBnsp1Kdyoim3uLNkjbYd-H8Q@mail.gmail.com>
In-Reply-To: <CAJF2gTQZWO8Ubi60nHn-J-8czqBnsp1Kdyoim3uLNkjbYd-H8Q@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 31 Jan 2023 09:09:59 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSHQ7J1a-0tTzaLAHeUTqbco5OXJgGDZpgB-SLb+teL2A@mail.gmail.com>
Message-ID: <CAJF2gTSHQ7J1a-0tTzaLAHeUTqbco5OXJgGDZpgB-SLb+teL2A@mail.gmail.com>
Subject: Re: [PATCH] riscv: kprobe: Optimize kprobe with accurate atomicity
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: "liaochang (A)" <liaochang1@huawei.com>, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	mhiramat@kernel.org, conor.dooley@microchip.com, penberg@kernel.org, 
	mark.rutland@arm.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_171024_740336_59477122 
X-CRM114-Status: GOOD (  36.08  )
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

T24gVHVlLCBKYW4gMzEsIDIwMjMgYXQgOTowMSBBTSBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9y
Zz4gd3JvdGU6Cj4KPiBPbiBNb24sIEphbiAzMCwgMjAyMyBhdCAxMToyOCBQTSBCasO2cm4gVMO2
cGVsIDxiam9ybkBrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBHdW8gUmVuIDxndW9yZW5Aa2Vy
bmVsLm9yZz4gd3JpdGVzOgo+ID4KPiA+ID4+IEluIHRoZSBzZXJpZSBvZiBSSVNDViBPUFRQUk9C
RVMgWzFdLCBpdCBwYXRjaGVzIGEgbG9uZy1qdW1wIGluc3RydWN0aW9ucyBwYWlyCj4gPiA+PiBB
VUlQQy9KQUxSIGluIGtlcm5lbCB0ZXh0LCBzbyBpbiBvcmRlciB0byBlbnN1cmUgb3RoZXIgQ1BV
cyBkb2VzIG5vdCBleGVjdXRlCj4gPiA+PiBpbiB0aGUgaW5zdHJ1Y3Rpb25zIHRoYXQgd2lsbCBi
ZSBtb2RpZmllZCwgaXQgaXMgc3RpbGwgbmVlZCB0byBzdG9wIG90aGVyIENQVXMKPiA+ID4+IHZp
YSBwYXRjaF90ZXh0IEFQSSwgb3IgeW91IGhhdmUgYW55IGJldHRlciBzb2x1dGlvbiB0byBhY2hp
ZXZlIHRoZSBwdXJwb3NlPwo+ID4gPiAgLSBUaGUgc3RvcF9tYWNoaW5lIGlzIGFuIGV4cGVuc2l2
ZSB3YXkgYWxsIGFyY2hpdGVjdHVyZXMgc2hvdWxkCj4gPiA+IGF2b2lkLCBhbmQgeW91IGNvdWxk
IGtlZXAgdGhhdCBpbiB5b3VyIE9QVFBST0JFUyBpbXBsZW1lbnRhdGlvbiBmaWxlcwo+ID4gPiB3
aXRoIHN0YXRpYyBmdW5jdGlvbnMuCj4gPiA+ICAtIFRoZSBzdG9wX21hY2hpbmUgY291bGRuJ3Qg
d29yayB3aXRoIFBSRUVNUFRJT04sIHNvIHlvdXIKPiA+ID4gaW1wbGVtZW50YXRpb24gbmVlZHMg
dG8gd29yayB3aXRoICFQUkVFTVBUSU9OLgo+ID4KPiA+IC4uLmFuZCBzdG9wX21hY2hpbmUoKSB3
aXRoICFQUkVFTVBUSU9OIGlzIGJyb2tlbiBhcyB3ZWxsLCB3aGVuIHlvdSdyZQo+ID4gcmVwbGFj
aW5nIG11bHRpcGxlIGluc3RydWN0aW9ucyAoc2VlIE1hcmsncyBwb3N0IGF0IFsxXSkuIFRoZQo+
ID4gc3RvcF9tYWNoaW5lKCkgZGFuY2UgbWlnaHQgd29yayB3aGVuIHlvdSdyZSByZXBsYWNpbmcg
Km9uZSogaW5zdHJ1Y3Rpb24sCj4gPiBub3QgbXVsdGlwbGUgYXMgaW4gdGhlIFJJU0MtViBjYXNl
LiBJJ2xsIGV4cGFuZCBvbiB0aGlzIGluIGEgY29tbWVudCBpbgo+ID4gdGhlIE9QVFBST0JFUyB2
NiBzZXJpZXMuCj4gPgo+ID4gPj4gPiAgc3RhdGljIHZvaWQgX19rcHJvYmVzIGFyY2hfcHJlcGFy
ZV9zaW11bGF0ZShzdHJ1Y3Qga3Byb2JlICpwKQo+ID4gPj4gPiBAQCAtMTE0LDE2ICsxMjAsMjMg
QEAgdm9pZCAqYWxsb2NfaW5zbl9wYWdlKHZvaWQpCj4gPiA+PiA+ICAvKiBpbnN0YWxsIGJyZWFr
cG9pbnQgaW4gdGV4dCAqLwo+ID4gPj4gPiAgdm9pZCBfX2twcm9iZXMgYXJjaF9hcm1fa3Byb2Jl
KHN0cnVjdCBrcHJvYmUgKnApCj4gPiA+PiA+ICB7Cj4gPiA+PiA+IC0gICAgIGlmICgocC0+b3Bj
b2RlICYgX19JTlNOX0xFTkdUSF9NQVNLKSA9PSBfX0lOU05fTEVOR1RIXzMyKQo+ID4gPj4gPiAt
ICAgICAgICAgICAgIHBhdGNoX3RleHQocC0+YWRkciwgX19CVUdfSU5TTl8zMik7Cj4gPiA+PiA+
IC0gICAgIGVsc2UKPiA+ID4+ID4gLSAgICAgICAgICAgICBwYXRjaF90ZXh0KHAtPmFkZHIsIF9f
QlVHX0lOU05fMTYpOwo+ID4gPj4gPiArI2lmZGVmIENPTkZJR19SSVNDVl9JU0FfQwo+ID4gPj4g
PiArICAgICB1MzIgb3Bjb2RlID0gX19CVUdfSU5TTl8xNjsKPiA+ID4+ID4gKyNlbHNlCj4gPiA+
PiA+ICsgICAgIHUzMiBvcGNvZGUgPSBfX0JVR19JTlNOXzMyOwo+ID4gPj4gPiArI2VuZGlmCj4g
PiA+PiA+ICsgICAgIHBhdGNoX3RleHRfbm9zeW5jKHAtPmFkZHIsICZvcGNvZGUsIEdFVF9JTlNO
X0xFTkdUSChvcGNvZGUpKTsKPiA+ID4+Cj4gPiA+PiBTb3VuZHMgZ29vZCwgYnV0IGl0IHdpbGwg
bGVhdmUgc29tZSBSVkkgaW5zdHJ1Y3Rpb24gdHJ1bmNhdGVkIGluIGtlcm5lbCB0ZXh0LAo+ID4g
Pj4gaSBkb3VidCBrZXJuZWwgYmVoYXZpb3IgZGVwZW5kcyBvbiB0aGUgcmVzdCBvZiB0aGUgdHJ1
bmNhdGVkIGluc3RydWN0aW9uLCB3ZWxsLAo+ID4gPj4gaXQgbmVlZHMgbW9yZSBzdHJpY3QgdGVz
dGluZyB0byBwcm92ZSBteSBjb25jZXJuIDopCj4gPiA+IEkgZG8gdGhpcyBvbiBwdXJwb3NlLCBh
bmQgaXQgZG9lc24ndCBjYXVzZSBhbnkgcHJvYmxlbXMuIERvbid0IHdvcnJ5Owo+ID4gPiBJRlUg
aHcgbXVzdCBlbmZvcmNlIHRoZSBmZXRjaCBzZXF1ZW5jZSwgYW5kIHRoZXJlIGlzIG5vIHdheSB0
byBleGVjdXRlCj4gPiA+IGJyb2tlbiBpbnN0cnVjdGlvbnMgZXZlbiBpbiB0aGUgc3BlY3VsYXRp
dmUgZXhlY3V0aW9uIHBhdGguCj4gPgo+ID4gVGhpcyBpcyBzdHJldGNoaW5nIHJlYWxpdHkgYSBi
aXQgbXVjaC4gQVJNdjgsIGUuZy4sIGhhcyBhIGNoYXB0ZXIgaW4gdGhlCj4gPiBBcm0gQVJNIFsy
XSBBcHBlbmRpeCBCICJDb25jdXJyZW50IG1vZGlmaWNhdGlvbiBhbmQgZXhlY3V0aW9uIG9mCj4g
PiBpbnN0cnVjdGlvbnMiIChDTU9EWCkuICpTb21lKiBpbnN0cnVjdGlvbnMgY2FuIGJlIHJlcGxh
Y2VkIGNvbmN1cnJlbnRseSwKPiA+IGFuZCBvdGhlcnMgY2Fubm90IHdpdGhvdXQgY2F1dGlvbi4g
QXNzdW1pbmcgdGhhdCB0aGF0IGFsbCBSSVNDLVYKPiA+IGltcGxlbWVudGF0aW9ucyBjYW4sIGlz
IGEgc3RyZXRjaC4gUklTQy1WIGhhc24ndCBldmVuIHNwZWNpZmllZCB0aGUKPiA+IGJlaGF2aW9y
IG9mIENNT0RYICh3aGljaCBpcyBwcm9ibGVtYXRpYykuCj4gSGVyZSB3ZSBvbmx5IHVzZSBvbmUg
c3cvc2ggaW5zdHJ1Y3Rpb24gdG8gc3RvcmUgYSAzMmJpdC8xNmJpdCBhbGlnbmVkIGVsZW1lbnQ6
Cj4KPiBJTlNOXzAgPC0gZWJyZWFrICgxNmJpdC8zMmJpdCBhbGlnbmVkKQo+IElOU05fMQo+IElO
U05fMgo+Cj4gVGhlIGVicmVhayB3b3VsZCBjYXVzZSBhbiBleGNlcHRpb24gd2hpY2ggaW1wbGll
cyBhIGh1Z2UgZmVuY2UgaGVyZS4KPiBObyBtYWNoaW5lIGNvdWxkIGdpdmUgYSBzcGVjdWxhdGl2
ZSBleGVjdXRpb24gZm9yIHRoZSBlYnJlYWsgcGF0aC4KCkZvciBBUk12NywgZWJyZWFrIGlzIGFs
c28gc2FmZToKCi0tLQpDb25jdXJyZW50IG1vZGlmaWNhdGlvbiBhbmQgZXhlY3V0aW9uIG9mIGlu
c3RydWN0aW9ucwoKVGhlIEFSTXY3IGFyY2hpdGVjdHVyZSBsaW1pdHMgdGhlIHNldCBvZiBpbnN0
cnVjdGlvbnMgdGhhdCBjYW4gYmUKZXhlY3V0ZWQgYnkgb25lIHRocmVhZCBvZiBleGVjdXRpb24g
YXMgdGhleSBhcmUgYmVpbmcgbW9kaWZpZWQgYnkKYW5vdGhlciB0aHJlYWQgb2YgZXhlY3V0aW9u
IHdpdGhvdXQgcmVxdWlyaW5nIGV4cGxpY2l0CnN5bmNocm9uaXphdGlvbi4KLi4uClRoZSBpbnN0
cnVjdGlvbnMgdG8gd2hpY2ggdGhpcyBndWFyYW50ZWUgYXBwbGllcyBhcmU6CkluIHRoZSBUaHVt
YiBpbnN0cnVjdGlvbiBzZXQKVGhlIDE2LWJpdCBlbmNvZGluZ3Mgb2YgdGhlIEIsIE5PUCwgQktQ
VCwgYW5kIFNWQyBpbnN0cnVjdGlvbnMuCi4uLgpJbiB0aGUgQVJNIGluc3RydWN0aW9uIHNldApU
aGUgQiwgQkwsIE5PUCwgQktQVCwgU1ZDLCBIVkMsIGFuZCBTTUMgaW5zdHJ1Y3Rpb25zLgotLS0K
Cj4KPiA+Cj4gPiBJZiBhbnl0aGluZyBpdCB3b3VsZCBiZSBtb3JlIGxpa2VseSB0aGF0IHRoZSBl
eGlzdGluZwo+ID4gInN0b3BfbWFjaGluZSgpLXRvLXJlcGxhY2Utd2l0aC1lYnJlYWsiIHdvcmtz
IChhZ2FpbiwgcmVwbGFjaW5nIG9uZQo+ID4gaW5zdHJ1Y3Rpb24gZG9lcyBub3QgaGF2ZSB0aGUg
IVBSRUVNUFRJT04gaXNzdWVzKS4gVGhlbiBhZ2Fpbiwgbm8gc3BlYywKPiA+IHNvIG1vc3RseSBn
dWVzc2luZyBmcm9tIG15IHNpZGUuIDotKAo+ID4KPiA+IE9oLCBidXQgdGhlIGV4aXN0aW5nICJl
YnJlYWsgcmVwbGFjZSIgbWlnaHQgYmUgYnJva2VuIGxpa2UgWzNdLgo+ID4KPiA+Cj4gPiBCasO2
cm4KPiA+Cj4gPgo+ID4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2L1k3
JTJGNkF0WDVYMCs1cUY2WUBGVkZGNzdTMFEwNU4vCj4gPiBbMl0gaHR0cHM6Ly9kZXZlbG9wZXIu
YXJtLmNvbS9kb2N1bWVudGF0aW9uL2RkaTA0ODcvbGF0ZXN0Cj4gPiBbM10gaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAyMzAxMjYxNzA2MDcuMTQ4OTE0MS0yLWd1b3JlbkBr
ZXJuZWwub3JnLwo+Cj4KPgo+IC0tCj4gQmVzdCBSZWdhcmRzCj4gIEd1byBSZW4KCgoKLS0gCkJl
c3QgUmVnYXJkcwogR3VvIFJlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
