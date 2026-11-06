Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59492606A326
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 06:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bCq+0sjP;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=CoEmUfaY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PgGbz1Kr+vcIKCBWH4PSvdCPcddb1rRLGJ0IiXQOnyk=; b=bCq+0sjPfbrvSgKCUQIYnIHAar
	GqCDOlbqnMh2G6SITE0/k2ah0XsWZr1VnarBg3VQEkOAimTftyYDULEBVuDWZhKYop3QrmdOwniqE
	cTO7mAv5toq65BJQMXQimyyWyTkUt6DJKASGVmuIuLeCiDnwjNWHu3x+UK1Sge+AXJhLbT7v65Smw
	zRb6gRpDLtK/oEYylsjfQ/oQ5YS3bcC1CwScoRwnq/cz+Ut4+lFe6NewsF3cAMDJg4Vhd1wEdNQxO
	KcgrI74YBExFPnhMgCAFYO1ifekHCHD+gCRkhQ+Y3i4a9nWOHD+ClfPd+L8qmGPh/UKs21Fi0ApR/
	QkeP5O3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPDA5-0000000BKjJ-2PeV;
	Fri, 06 Nov 2026 06:10:53 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPDA0-0000000BKgt-3XvX
	for linux-riscv@lists.infradead.org;
	Fri, 06 Nov 2026 06:10:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793945416;
	bh=dlMB2EQjuzBySmR5GqJBziBOr+KKGv+oGqz2McQg0Ss=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=CoEmUfaYL00ZRlWq6ulYaVkNZeN1ZD+oNWBABhrwQYxaFtvOnN9pwRBSLFqh06Sag
	 4ZqWGNbpBo5bEhwIdg4CHV1E9yXk4Kzwqm6LtKzDaiSs9h2all9wJqzNkNK7/yX+of
	 WnwoMnfoY2evLp4/GtEdziIhXoAC6VjsWuZKbTSU=
X-QQ-mid: esmtpgz12t1793945414t31773276
X-QQ-Originating-IP: TvjStvLttQ2jKx3rjkbSQUng+nHe5KV9P0Hm81jxCs8=
Received: from localhost ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 06 Nov 2026 14:10:12 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 186222589772570272
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Fri, 06 Nov 2026 14:10:12 +0800
Message-Id: <DMNWKP4OI5IT.2S74EHH6A8Z6G@linux.spacemit.com>
Cc: "alessio.belle" <alessio.belle@imgtec.com>, "luigi.santivetti"
 <luigi.santivetti@imgtec.com>, "maarten.lankhorst"
 <maarten.lankhorst@linux.intel.com>, "mripard" <mripard@kernel.org>,
 "tzimmermann" <tzimmermann@suse.de>, "airlied" <airlied@gmail.com>,
 "simona" <simona@ffwll.ch>, "dlan" <dlan@kernel.org>, "imagination"
 <imagination@lists.freedesktop.org>, "dri-devel"
 <dri-devel@lists.freedesktop.org>, "linux-kernel"
 <linux-kernel@vger.kernel.org>, "linux-riscv"
 <linux-riscv@lists.infradead.org>, "spacemit" <spacemit@lists.linux.dev>
Subject: Re: [PATCH] drm/imagination: retry runtime idle when firmware is
 not yet idle
From: "Baihui Liang" <liangbaihui@linux.spacemit.com>
To: "Gyeyoung Baek" <gye976@gmail.com>, "troy" <troy@kernel.org>
X-Mailer: aerc 0.17.0
References: <20261029-img-pm-autosuspend-v1-1-26851840a34e@linux.spacemit.com> <DMHSRIU2XCB0.35RV6ADY6W1IE@kernel.org> <CAKbEzns6CYjNXmf4jTx_eGSH2j6AjpKJPx=EtoqxweGLiQ85JA@mail.gmail.com>
In-Reply-To: <CAKbEzns6CYjNXmf4jTx_eGSH2j6AjpKJPx=EtoqxweGLiQ85JA@mail.gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: ODTmzx1EshNFL4WFHQIljyjY0SnRwoPgWzJAelDdb5qUjsIeI8MIINUL
	D9CTRx5CD08jrkzzVgZBDNww7zePC2CF/8+UWWZLH3+G3/M72V2UMKlsuM+w3yE0ElycuNp
	fZXR9y6WUYYvJjjmtvMjq7C5I2Y2cpNAVhHoq0g30znS94LdIoIQwZg/nH2881ESceU0auv
	T0AOekcJye1Nudr5SPxcOaxTShNdK5ktjrGlYT7vyCJVaLRyuVBdxUQR/VfyawZAHqkq9vM
	j45DnHJkAiZ1nfqb38TMIoUV5z/QYUEZopKUTK2km0Ulu8Ec8pnUP+FMh75TwH1sTCdh0cz
	qQXWM4nPgu76ovGwX3wj8AxBJM0/lE0p4IuEeJlYHko/PhLDO/mBpeJKFccF5htBjvb0a2Z
	W4gDYJoiM6yPaxvMK399/9h9lHyPA0AvvWjRiAVObCgbfa3OHgKCBqBwM9nfig4EZdCY/TS
	v87ZcAjIHLaIUZ1Np4bpPOIgencFFkO8M2KCy3vt0w3RAWcSWoaM0MPp2J9cclRmbfFRMzX
	P5QUuWv9dJXXBE7R9pDwxHkALP3AFyXKvpFfIcjKT2qYdrqXOkx5VSjEFW+YVPKdODON6U5
	N2XbbakVA2bRDPPyHN/SOPjFxdmRsD8HLDClrw3uVoXzjfuZYZPjcf3TNlUBdYi+cwWM14j
	239A2tnXn9cByrkvrolAdgy4ORbbDTvUTyi/u1qTJ3TUIuX/zBMqE+qI7z/KBN20SvBZeDk
	BXckoFb8nfWsth7/Yy7ZDylfrS0zlNy6fovcPEgiCpmMNpAnjhiTYDXxXC6/shVDvagkjBW
	fy/NAan3fwqmPpT/bIcg0LGgjAz8qsG4ONwlpZmr6HGA7h5u1h08hmENy8I0Gignl+I4Ux3
	p2UGRyFu5cyodIbpYjU5tVVPRuGOtVWWkfS+Nflajctd+MK9ocR9gOeUuVuC5UeDO05fbek
	qt1dAUdMOCU8NpEpyU9Paw0Klr8xpDZ4CJYj+GAO4+0QmQw==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_221050_486217_74254EBA 
X-CRM114-Status: GOOD (  31.73  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgYWxsLAoKVGhhbmtzIGZvciB0aGUgcmV2aWV3LiBBbGwgdGhyZWUgb2YgeW91IGFyZSByaWdo
dCwgYW5kIHYxIHdhcyB3cm9uZy4KCk9uIFN1biBOb3YgMSwgMjAyNiBhdCAxMjozNCBBTSBDU1Qs
IEd5ZXlvdW5nIEJhZWsgd3JvdGU6Cj4gSGkgQmFpaHVpLCBUcm95LAo+Cj4KPiBPbiBGcmksIE9j
dCAzMCwgMjAyNiBhdCAxMDo1NeKAr0FNIFRyb3kgTWl0Y2hlbGwgPHRyb3lAa2VybmVsLm9yZz4g
d3JvdGU6Cj4gPgo+ID4gSGkgQmFpaHVpLAo+ID4KPiA+IE9uIFRodSBPY3QgMjksIDIwMjYgYXQg
NDozOCBQTSArMDgwMCwgQmFpaHVpIExpYW5nIHdyb3RlOgo+ID4gPiBSZXR1cm5pbmcgLUVCVVNZ
IGZyb20gLT5ydW50aW1lX2lkbGUoKSBwcmV2ZW50cyB0aGUgUE0gY29yZSBmcm9tCj4gPiA+IHJl
dHJ5aW5nIHRoZSBpZGxlIGNoZWNrLiBTY2hlZHVsZSBhbiBhdXRvc3VzcGVuZCBzbyB0aGUgaWRs
ZSBzdGF0ZQo+ID4gPiBjYW4gYmUgcmUtZXZhbHVhdGVkIG9uY2UgdGhlIGZpcm13YXJlIHJlYWNo
ZXMgUk9HVUVfRldJRl9QT1dfSURMRS4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogQmFpaHVp
IExpYW5nIDxsaWFuZ2JhaWh1aUBsaW51eC5zcGFjZW1pdC5jb20+Cj4gPiA+IC0tLQo+ID4gPiBU
ZXN0ZWQgb24gU3BhY2VtaVQgSzMgKFBvd2VyVlIgUm9ndWUgQlhNLTQtNjQpIGJ5IHJ1bm5pbmcg
dnVsa2FuaW5mbwo+ID4gPiByZXBlYXRlZGx5LiBXaXRob3V0IHRoaXMgY2hhbmdlIHRoZSBkZXZp
Y2UgaW50ZXJtaXR0ZW50bHkgc3RheWVkCj4gPiA+IHJ1bnRpbWUtYWN0aXZlIGFmdGVyIHRoZSBs
YXN0IHVzZXIgd2VudCBhd2F5LCBiZWNhdXNlIHRoZSBmaXJtd2FyZSBoYWQKPiA+ID4gbm90IHll
dCByZWFjaGVkIFJPR1VFX0ZXSUZfUE9XX0lETEUgd2hlbiB0aGUgaWRsZSBjaGVjayByYW4uIFdp
dGggdGhlCj4gPiA+IGNoYW5nZSB0aGUgZGV2aWNlIHJlbGlhYmx5IHN1c3BlbmRzLgo+ID4gPiAt
LS0KPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9wdnJfcG93ZXIuYyB8IDExICsr
KysrKysrKystCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2ltYWdpbmF0
aW9uL3B2cl9wb3dlci5jIGIvZHJpdmVycy9ncHUvZHJtL2ltYWdpbmF0aW9uL3B2cl9wb3dlci5j
Cj4gPiA+IGluZGV4IGViNGI2ZWNkZjRmLi42ZjM4MjQ5ZmZjYiAxMDA2NDQKPiA+ID4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2ltYWdpbmF0aW9uL3B2cl9wb3dlci5jCj4gPiA+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9wdnJfcG93ZXIuYwo+ID4gPiBAQCAtNDM0LDcgKzQzNCwx
NiBAQCBwdnJfcG93ZXJfZGV2aWNlX2lkbGUoc3RydWN0IGRldmljZSAqZGV2KQo+ID4gPiAgICAg
ICBzdHJ1Y3QgZHJtX2RldmljZSAqZHJtX2RldiA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBsYXRf
ZGV2KTsKPiA+ID4gICAgICAgc3RydWN0IHB2cl9kZXZpY2UgKnB2cl9kZXYgPSB0b19wdnJfZGV2
aWNlKGRybV9kZXYpOwo+ID4gPgo+ID4gPiAtICAgICByZXR1cm4gcHZyX3Bvd2VyX2lzX2lkbGUo
cHZyX2RldikgPyAwIDogLUVCVVNZOwo+ID4gPiArICAgICBpZiAocHZyX3Bvd2VyX2lzX2lkbGUo
cHZyX2RldikpCj4gPiA+ICsgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gPiA+ICsKPiA+ID4gKyAg
ICAgLyoKPiA+ID4gKyAgICAgICogRmlybXdhcmUgbm90IHlldCBpZGxlOyByZWplY3QgYnV0IHNj
aGVkdWxlIGF1dG9zdXNwZW5kIHNvCj4gPiA+ICsgICAgICAqIHJ1bnRpbWVfaWRsZSgpIGNhbiBi
ZSByZXRyaWVkLgo+ID4gPiArICAgICAgKi8KPiA+ID4gKyAgICAgcG1fcnVudGltZV9hdXRvc3Vz
cGVuZChkZXYpOwo+ID4KPiA+IElmIEkgcmVhZCB0aGUgUE0gY29yZSBjb3JyZWN0bHksIHdoZW4g
dGhpcyBhdXRvc3VzcGVuZCB0aW1lciBmaXJlcyBpdAo+ID4gY2FsbHMgLT5ydW50aW1lX3N1c3Bl
bmQoKSBkaXJlY3RseSByYXRoZXIgdGhhbiByZXRyeWluZwo+ID4gLT5ydW50aW1lX2lkbGUoKSwg
c28gdGhpcyBsb29rcyBlcXVpdmFsZW50IHRvIHJldHVybmluZyAwLiAKClRoYXQncyByaWdodC4g
SXQgbWVyZWx5IGRlbGF5cyB1bmNvbmRpdGlvbmFsIEZXIHRlYXJkb3duIHdpdGhvdXQKcmUtY2hl
Y2tpbmcgaWRsZSBzdGF0ZS4gSSdsbCBzZW5kIHYyIHdpdGggYSBkaWZmZXJlbnQgYXBwcm9hY2gu
Cgo+ID4gQ291bGQgdGhlCj4gPiByZWFsIGlzc3VlIGJlIHRoZSBwbV9ydW50aW1lX3B1dCgpIGlu
IHB2cl93YXRjaGRvZ193b3JrZXIoKSwgd2hpY2gKPiA+IHBlcmhhcHMgc2hvdWxkIGJlIHBtX3J1
bnRpbWVfcHV0X2F1dG9zdXNwZW5kKCk/CgpUaGF0IHB1dCBpcyBvbmx5IHJlYWNoZWQgd2hlbiBw
bV9ydW50aW1lX2dldF9pZl9pbl91c2UoKSBhY3R1YWxseQpyZXR1cm5lZCBhIHJlZmVyZW5jZS4g
T3VyIHN0dWNrLWFjdGl2ZSBjYXNlIHdhcyB0aGUgb3Bwb3NpdGUgY2FzZTogdGhlCmRldmljZSB3
YXMgYWN0aXZlIHdpdGggYSB6ZXJvIHVzYWdlIGNvdW50LCB3aGljaCBqdW1wcyBkaXJlY3RseSB0
bwpvdXRfcmVxdWV1ZSBhbmQgc2tpcHMgcG1fcnVudGltZV9wdXQgZW50aXJlbHkuIENoYW5naW5n
IHRoaXMgY2FsbAp3b24ndCBoZWxwLgoKPiBJIHRoaW5rIHNhc2hpa28ncyBwb2ludCBpcyB2YWxp
ZC4KPgo+IENhbGxpbmcgcG1fcnVudGltZV9hdXRvc3VzcGVuZCgpIGZyb20gcHZyX3Bvd2VyX2Rl
dmljZV9pZGxlKCkgd2hlbiB0aGUKPiBGVyBpcyBidXN5IG9ubHkgYWRkcyBhIGRlbGF5LCBhbmQg
dGhlIGRldmljZSBpcyB0aGVuIHN1c3BlbmRlZCB3aXRob3V0Cj4gcmUtY2hlY2tpbmcgaWRsZSwg
YW5kIHRoaXMgaXMgZWZmZWN0aXZlbHkgdGhlIHNhbWUgYXMKPiByZXR1cm5pbmcgMC4gSSBndWVz
cyBpdCB3b3JrZWQgaW4gdGVzdGluZyBiZWNhdXNlIHRoZSBGVyB3YXMgYnVzeSBhdAo+IHB2cl9w
b3dlcl9kZXZpY2VfaWRsZSgpIHRpbWUgYnV0IHJlYWNoZWQgaWRsZSBiZWZvcmUgdGhlIGF1dG9z
dXNwZW5kCj4gZGVsYXkgZXhwaXJlZC4KPgo+IEhvdyBhYm91dCBtb3ZpbmcgdGhlIHB2cl9wb3dl
cl9pc19pZGxlKCkgY2hlY2sgaW50bwo+IHB2cl9wb3dlcl9kZXZpY2Vfc3VzcGVuZCgpIChhbmQg
ZHJvcHBpbmcgcHZyX3Bvd2VyX2RldmljZV9pZGxlKCkpLCBhbmQKPiByZXR1cm5pbmcgLUVCVVNZ
IGFmdGVyIHBtX3J1bnRpbWVfbWFya19sYXN0X2J1c3koKSBpZiB0aGUgRlcgaXMgYnVzeT8KPiBU
aGUgUE0gY29yZSB0aGVuIHJlc2NoZWR1bGVzIHRoZSBhdXRvc3VzcGVuZCByZWdhcmRsZXNzIG9m
IHdoZXRoZXIgdGhlCj4gbGFzdCBwdXQgY29tZXMgZnJvbSB0aGUgd2F0Y2hkb2cgb3IgZWxzZXdo
ZXJlLCBzbyBzdXNwZW5kIGlzIHJldHJpZWQKPiB1bnRpbCB0aGUgRlcgYmVjb21lcyBpZGxlLgoK
QWdyZWVkLCB2MiB3aWxsIGZvbGxvdyB0aGlzIGFwcHJvYWNoLgoKPiBJIHRoaW5rIHRoaXMgaXMg
dGhlIHBhdHRlcm4gZGVzY3JpYmVkIGluCj4gRG9jdW1lbnRhdGlvbi9wb3dlci9ydW50aW1lX3Bt
LnJzdCwgc2VjdGlvbiA5ICgiSWYgdGhlCj4gLT5ydW50aW1lX3N1c3BlbmQoKSBjYWxsYmFjayBy
ZXR1cm5zIC1FQUdBSU4gb3IgLUVCVVNZIC4uLiIpLgo+IC0tCj4gVGhhbmtzLAo+IEd5ZXlvdW5n
CgpUaGFua3MsCkJhaWh1aQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
