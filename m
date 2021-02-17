Return-Path: <SRS0=wXp/=HT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4362C433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Feb 2021 04:42:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F0DE64DF3
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Feb 2021 04:42:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F0DE64DF3
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4SbkQ52LliJaQhtyQUChJfR+r4K4P8F/LxXVBV9h43U=; b=BDEtXylYp69UvnQ/S5mObemXk
	1pdjtfghE05u15usRarWRHHQ6UiylnzNwCvYuowAliTNsdZ75v09XBtzREsp6hNHUGIfHJ29jFQxG
	fQ6R5OuCJwa8KtrcIaBbWJtm+9yd64+S//Q7dYa63nG3u1l3bWKFXeS2R2S61tkbIwORpsUW6Mu5T
	htrQ00fqCTycMyotatBYURZNh0f9EtuGdm3X0PwJyDcLwOggDbrKz4l4d1es0hIE5adWBJPhwdfAb
	xziXR7xyvB5RDKc9iXbAmHz1DcULRDT6JQlH3ppAqWp8Q3nrYjWkSL2hUNkmy2bPe9MXwskN6ytvq
	skR0t0vPA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lCEfZ-0006A7-OG; Wed, 17 Feb 2021 04:42:33 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lCEfX-00069V-5G
 for linux-riscv@lists.infradead.org; Wed, 17 Feb 2021 04:42:32 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id p12so5748197qvv.5
 for <linux-riscv@lists.infradead.org>; Tue, 16 Feb 2021 20:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8m8v3N1mfBy+Rw2JWENvO+sd3wm4zI7IbdM3+bR1i2o=;
 b=CQp+0wMx4TvKt6+vvq9D4g27VNgYWGQn/cvb0q4cw2sVCD4eGVC4O5mLyF03jZvWWP
 /IiFu06UsjaLcG9CcWqPnOfCPC2rxpsuW+dWB6+VA4hx+fP6VvKu3f3DPlyGb27WmERW
 VTj8G1cM1PKAja4VA92N6age/9SPnCs/AIitEQPYsbdnYAMhL4al1gCw/yP89X+8oOsT
 sgQOBhyw+ln41OQq75An2d5ArH9wn2SYxUNQgE5jthTal3puZPHOJGyhputUC5zuwqt3
 OJSgY72FSh9SUeEs7MFnb41hF6CimKxRn8Oq7ejnMO7Mv+L7SfOTC0Bja2Ru+wUBa+Wm
 0glQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8m8v3N1mfBy+Rw2JWENvO+sd3wm4zI7IbdM3+bR1i2o=;
 b=Do2y0TP/Cb5HBpvts09xhN7D+gy945EeX+JCLgB9+BGDMAVAvNxHfRBIt6bDAOzeWv
 jPeR4QWBxNQLMYhdNnThaXQ0sJNW2yMkjeAAt4rtLjlUBAJ+/YC4MHLsIZMTJtndH/HL
 kWUHB2M21/nPYQZhVRUh/lNz0AtCKUZ+Bty9HsLrjB8WT0RgpDljXp2cpi2cE8367yxA
 Kfo46u25RMW41lmknvbnPxIeiMqxUuauVR1KmCK5tLcjPpcv5wpYiE9m5JxuZRe8qB6Z
 KgaBcI0+aJnZBQQoCw3nn3S6KGx7DOi/cyGatbVBkc4dXG6NUlPXUENqsDA6+y9eVLPd
 FBew==
X-Gm-Message-State: AOAM530eHVs+jNxAOmFwHVlsQb2wrZfOB31og5wXOmcTEds91uSt8+wm
 +l2EChVbL662Q0TZFKhuxQSCrYUbKDtMT8QkmcqwAg==
X-Google-Smtp-Source: ABdhPJx2GVCvp/9jJ/birRkl0knj9cHuNGGEP3gyhozzsxMkM+zgM1luK2AyPGqjunfEoPFdjB9dKBKsv3y3Yp8aTKs=
X-Received: by 2002:a0c:a5e2:: with SMTP id z89mr23006257qvz.37.1613536947982; 
 Tue, 16 Feb 2021 20:42:27 -0800 (PST)
MIME-Version: 1.0
References: <CACT4Y+bDqMiC+ou5ghb=XB3Oyjw3p-GTDvNw4NkkQqQthw1yuQ@mail.gmail.com>
 <mhng-02b88d43-ede8-48f9-82f1-c84201acb7a8@palmerdabbelt-glaptop>
 <CACT4Y+aN3LvgaBc_zmW=t=D7ChU-jrWYnjt5sZ2GEDQhg_BC9A@mail.gmail.com>
 <CACT4Y+aC19DaNOm87EO3cER2=MEmO9pmtUxzVmRtg9YhZKuMVA@mail.gmail.com>
 <20210118145310.crnqnh6kax5jqicj@distanz.ch>
 <CACT4Y+bFV6m1LCYb1nO7ioKJK99916D76sJ+H-LgBjWx6biF5w@mail.gmail.com>
 <CACT4Y+bmDKNnykeTP9yKjje3XZjbXY3De+_e3fMFOMoe0dnARw@mail.gmail.com>
 <6e9ee3a1-0e16-b1fc-a690-f1ca8e9823a5@ghiti.fr>
 <CACT4Y+adSjve7bXRPh5UybCQx6ubOUu5RbwuT620wdcxHzVYJg@mail.gmail.com>
 <CACT4Y+ZNJBnkKHXUf=tm_yuowvZvHwN=0rmJ=7J+xFd+9r_6pQ@mail.gmail.com>
 <CACT4Y+awHrJfFo+g33AiAnCj3vq6t6PqbL-3=Qbciy6dAJfVWg@mail.gmail.com>
 <24857bfc-c557-f141-8ae7-2e3da24f67f5@ghiti.fr>
In-Reply-To: <24857bfc-c557-f141-8ae7-2e3da24f67f5@ghiti.fr>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 17 Feb 2021 05:42:16 +0100
Message-ID: <CACT4Y+bmuhR=2u=1bGK+W8ttOn+=bkKrqCRM8_SiDSW1iAX60A@mail.gmail.com>
Subject: Re: riscv+KASAN does not boot
To: Alex Ghiti <alex@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210216_234231_247448_406450A9 
X-CRM114-Status: GOOD (  38.43  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Bjorn Topel <bjorn.topel@gmail.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, LKML <linux-kernel@vger.kernel.org>,
 nylon7@andestech.com, syzkaller <syzkaller@googlegroups.com>,
 Andreas Schwab <schwab@linux-m68k.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Tobias Klauser <tklauser@distanz.ch>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBGZWIgMTYsIDIwMjEgYXQgOTo0MiBQTSBBbGV4IEdoaXRpIDxhbGV4QGdoaXRpLmZy
PiB3cm90ZToKPgo+IEhpIERtaXRyeSwKPgo+IExlIDIvMTYvMjEgw6AgNjoyNSBBTSwgRG1pdHJ5
IFZ5dWtvdiBhIMOpY3JpdCA6Cj4gPiBPbiBUdWUsIEZlYiAxNiwgMjAyMSBhdCAxMjoxNyBQTSBE
bWl0cnkgVnl1a292IDxkdnl1a292QGdvb2dsZS5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gT24gRnJp
LCBKYW4gMjksIDIwMjEgYXQgOToxMSBBTSBEbWl0cnkgVnl1a292IDxkdnl1a292QGdvb2dsZS5j
b20+IHdyb3RlOgo+ID4+Pj4gSSB3YXMgZml4aW5nIEtBU0FOIHN1cHBvcnQgZm9yIG15IHN2NDgg
cGF0Y2hzZXQgc28gSSB0b29rIGEgbG9vayBhdCB5b3VyCj4gPj4+PiBpc3N1ZTogSSBidWlsdCBh
IGtlcm5lbCBvbiB0b3Agb2YgdGhlIGJyYW5jaCByaXNjdi9maXhlcyB1c2luZwo+ID4+Pj4gaHR0
cHM6Ly9naXRodWIuY29tL2dvb2dsZS9zeXprYWxsZXIvYmxvYi8yNjlkMjRlODU3YTc1N2QwOWE4
OTgwODZhMmZhNmZhNWQ4MjdjM2UxL2Rhc2hib2FyZC9jb25maWcvbGludXgvdXBzdHJlYW0tcmlz
Y3Y2NC1rYXNhbi5jb25maWcKPiA+Pj4+IGFuZCBCdWlsZHJvb3QgMjAyMC4xMS4gSSBoYXZlIHRo
ZSB3YXJuaW5ncyByZWdhcmRpbmcgdGhlIHVzZSBvZgo+ID4+Pj4gX192aXJ0X3RvX3BoeXMgb24g
d3JvbmcgYWRkcmVzc2VzIChidXQgdGhhdCdzIG5vcm1hbCBzaW5jZSB0aGlzIGZ1bmN0aW9uCj4g
Pj4+PiBpcyB1c2VkIGluIHZpcnRfYWRkcl92YWxpZCkgYnV0IG5vdCB0aGUgc2VnZmF1bHRzIHlv
dSBkZXNjcmliZS4KPiA+Pj4KPiA+Pj4gSGkgQWxleCwKPiA+Pj4KPiA+Pj4gTGV0IG1lIHRyeSB0
byByZWJ1aWxkIGJ1aWxkcm9vdCBpbWFnZS4gTWF5YmUgdGhlcmUgd2FzIHNvbWV0aGluZyB3cm9u
Zwo+ID4+PiB3aXRoIG15IGJ1aWxkLCB0aG91Z2gsIEkgZGlkICdtYWtlIGNsZWFuJyBiZWZvcmUg
ZG9pbmcuIEJ1dCBhdCB0aGUKPiA+Pj4gc2FtZSB0aW1lIGl0IHdvcmtlZCBiYWNrIGluIEp1bmUu
Li4KPiA+Pj4KPiA+Pj4gUmUgV0FSTklOR3MsIHRoZXkgaW5kaWNhdGUga2VybmVsIGJ1Z3MuIEkg
YW0gd29ya2luZyBvbiBzZXR0aW5nIHVwIGEKPiA+Pj4gc3l6Ym90IGluc3RhbmNlIG9uIHJpc2N2
LiBJZiB0aGVyZSBhIFdBUk5JTkcgZHVyaW5nIGJvb3QgdGhlbiB0aGUKPiA+Pj4ga2VybmVsIHdp
bGwgYmUgbWFya2VkIGFzIGJyb2tlbi4gTm8gZnVydGhlciB0ZXN0aW5nIHdpbGwgaGFwcGVuLgo+
ID4+PiBJcyBpdCBhIG1pcy11c2Ugb2YgV0FSTl9PTj8gSWYgc28sIGNvdWxkIGFueWJvZHkgcGxl
YXNlIHJlbW92ZSBpdCBvcgo+ID4+PiByZXBsYWNlIGl0IHdpdGggcHJfZXJyLgo+ID4+Cj4gPj4K
PiA+PiBIaSwKPiA+Pgo+ID4+IEkndmUgbG9jYWxpemVkIG9uZSBpc3N1ZSB3aXRoIHJpc2N2L0tB
U0FOOgo+ID4+IEtBU0FOIGJyZWFrcyBWRFNPIGFuZCB0aGF0J3MgSSB0aGluayB0aGUgcm9vdCBj
YXVzZSBvZiB3ZWlyZCBmYXVsdHMgSQo+ID4+IHNhdyBlYXJsaWVyLiBUaGUgZm9sbG93aW5nIHBh
dGNoIGZpeGVzIGl0Lgo+ID4+IENvdWxkIHNvbWVib2R5IHBsZWFzZSB1cHN0cmVhbSB0aGlzIGZp
eD8gSSBkb24ndCBrbm93IGhvdyB0byBhZGQvcnVuCj4gPj4gdGVzdHMgZm9yIHRoaXMuCj4gPj4g
VGhhbmtzCj4gPj4KPiA+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdmRzby9NYWtl
ZmlsZSBiL2FyY2gvcmlzY3Yva2VybmVsL3Zkc28vTWFrZWZpbGUKPiA+PiBpbmRleCAwY2ZkNmRh
Nzg0Zjg0Li5jZjNhMzgzYzE3OTlkIDEwMDY0NAo+ID4+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVs
L3Zkc28vTWFrZWZpbGUKPiA+PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC92ZHNvL01ha2VmaWxl
Cj4gPj4gQEAgLTM1LDYgKzM1LDcgQEAgQ0ZMQUdTX1JFTU9WRV92Z2V0dGltZW9mZGF5Lm8gPSAk
KENDX0ZMQUdTX0ZUUkFDRSkgLU9zCj4gPj4gICAjIERpc2FibGUgZ2NvdiBwcm9maWxpbmcgZm9y
IFZEU08gY29kZQo+ID4+ICAgR0NPVl9QUk9GSUxFIDo9IG4KPiA+PiAgIEtDT1ZfSU5TVFJVTUVO
VCA6PSBuCj4gPj4gK0tBU0FOX1NBTklUSVpFIDo9IG4KPiA+Pgo+ID4+ICAgIyBGb3JjZSBkZXBl
bmRlbmN5Cj4gPj4gICAkKG9iaikvdmRzby5vOiAkKG9iaikvdmRzby5zbwo+Cj4gV2hhdCdzIHdl
aXJkIGlzIHRoYXQgSSBkb24ndCBoYXZlIGFueSBpc3N1ZSB3aXRob3V0IHRoaXMgcGF0Y2ggd2l0
aCB0aGUKPiBmb2xsb3dpbmcgY29uZmlnIHdoZXJlYXMgaXQgaW5kZWVkIHNlZW1zIHJlcXVpcmVk
IGZvciBLQVNBTi4gQnV0IHdoZW4KPiBsb29raW5nIGF0IHRoZSBzZWdmYXVsdHMgeW91IGdvdCBl
YXJsaWVyLCB0aGUgc2VnZmF1bHQgYWRkcmVzcyBpcyAweGJiMAo+IGFuZCB0aGUgY2F1c2UgaXMg
YW4gaW5zdHJ1Y3Rpb24gcGFnZSBmYXVsdDogdGhpcyBhZGRyZXNzIGlzIHRoZSBQTFQgYmFzZQo+
IGFkZHJlc3MgaW4gdmRzby5zbyBhbmQgYW4gaW5zdHJ1Y3Rpb24gcGFnZSBmYXVsdCB3b3VsZCBt
ZWFuIHRoYXQgc29tZW9uZQo+IHRyaWVkIHRvIGp1bXAgYXQgdGhpcyBhZGRyZXNzLCB3aGljaCBp
cyB3ZWlyZC4gQXQgZmlyc3Qgc2lnaHQsIHRoYXQgZG9lcwo+IG5vdCBzZWVtIHJlbGF0ZWQgdG8g
eW91ciBwYXRjaCBhYm92ZSwgYnV0IGNsZWFybHkgSSBtYXkgYmUgd3JvbmcuCj4KPiBUb2JpYXMs
IGRpZCB5b3Ugb2JzZXJ2ZSB0aGUgc2FtZSBzZWdmYXVsdHMgYXMgRG1pdHJ5ID8KCgpJIG5vdGlj
ZWQgdGhhdCBub3QgYWxsIGJ1aWxkcm9vdCBpbWFnZXMgdXNlIFZEU08sIGl0IHNlZW1zIHRvIGJl
CmRlcGVuZGVudCBvbiBsaWJjIHNldHRpbmdzIChhdCBsZWFzdCBJIHRoaW5rIEkgY2hhbmdlZCBp
dCBpbiB0aGUKcGFzdCkuCkkgYWxzbyBib290ZWQgYW4gaW1hZ2UgY29tcGxldGVseSBzdWNjZXNz
ZnVsbHkgaW5jbHVkaW5nIGRoY3BkL3NzaGQKc3RhcnQsIGJ1dCB0aGVuIG15IGV4ZWN1dGFibGUg
Y3Jhc2hlZCBpbiBjbG9ja19nZXR0aW1lLiBUaGUgZXhlY3V0YWJsZQp3YXMgYnVpbGQgb24gbGlu
dXgvYW1kNjQgaG9zdCB3aXRoICJyaXNjdjY0LWxpbnV4LWdudS1nY2MgLXN0YXRpYyIKKDEwLjIu
MSkuCgoKPiA+IFNlY29uZCBpc3N1ZSBJIGFtIHNlZWluZyBzZWVtcyB0byBiZSByZWxhdGVkIHRv
IHRleHQgc2VnbWVudCBzaXplLgo+ID4gSSBjaGVjayBvdXQgdjUuMTEgYW5kIHVzZSB0aGlzIGNv
bmZpZzoKPiA+IGh0dHBzOi8vZ2lzdC5naXRodWIuY29tL2R2eXVrb3YvNmFmMjU0NzRkNDU1NDM3
NTc3YTg0MjEzYjBjYzkxNzgKPgo+IFRoaXMgY29uZmlnIGdhdmUgbXkgbGFwdG9wIGEgaGFyZCB0
aW1lICEgRmluYWxseSBJIHdhcyBhYmxlIHRvIGJvb3QKPiBjb3JyZWN0bHkgdG8gdXNlcnNwYWNl
LCBidXQgSSByZWFsaXplZCBJIHVzZWQgbXkgc3Y0OCBicmFuY2guLi5FaXRoZXIgSQo+IGZpeGVk
IHlvdXIgaXNzdWUgYWxvbmcgdGhlIHdheSBvciBJIGNhbid0IHJlcHJvZHVjZSBpdCwgSSdsbCBn
aXZlIGl0IGEKPiB0cnkgdG9tb3Jyb3cuCgpXaGVyZSBpcyB5b3VyIGJyYW5jaD8gSSBjb3VsZCBh
bHNvIHRlc3QgaW4gbXkgc2V0dXAgb24geW91ciBicmFuY2guCgoKPiA+IFRoZW4gdHJ5aW5nIHRv
IGJvb3QgaXQgdXNpbmc6Cj4gPiBRRU1VIGVtdWxhdG9yIHZlcnNpb24gNS4yLjAgKERlYmlhbiAx
OjUuMitkZnNnLTMpCj4gPiAkIHFlbXUtc3lzdGVtLXJpc2N2NjQgLW1hY2hpbmUgdmlydCAtc21w
IDIgLW0gNEcgLi4uCj4gPgo+ID4gSXQgc2hvd3Mgbm8gb3V0cHV0IGZyb20gdGhlIGtlcm5lbCB3
aGF0c29ldmVyLCBldmVuIHRob3VnaCBJIGhhdmUKPiA+IGVhcmx5Y29uIGFuZCBvdXRwdXQgc2hv
d3MgdmVyeSBlYXJseSB3aXRoIG90aGVyIGNvbmZpZ3MuCj4gPiBLZXJuZWwgYm9vdHMgZmluZSB3
aXRoIGRlZmNvbmZpZyBhbmQgb3RoZXIgc21hbGxlciBjb25maWdzLgo+ID4KPiA+IElmIEkgZW5h
YmxlIEtBU0FOX09VVExJTkUgYW5kIENDX09QVElNSVpFX0ZPUl9TSVpFLCB0aGVuIHRoaXMgY29u
ZmlnCj4gPiBhbHNvIGJvb3RzIGZpbmUuIEJvdGggb2YgdGhlc2Ugb3B0aW9ucyBzaWduaWZpY2Fu
dGx5IHJlZHVjZSBrZXJuZWwKPiA+IHNpemUuIEhvd2V2ZXIsIEkgY2FuIGFsc28gYm9vdCB0aGUg
a2VybmVsIHdpdGhvdXQgdGhlc2UgMiBjb25maWdzLCBpZgo+ID4gSSBkaXNhYmxlIGEgd2hvbGUg
bG90IG9mIHN1YnN5c3RlbSBjb25maWdzLiBUaGlzIG1ha2VzIG1lIHRoaW5rIHRoYXQKPiA+IHRo
ZXJlIGlzIGFuIGlzc3VlIHJlbGF0ZWQgdG8ga2VybmVsIHNpemUgc29tZXdoZXJlIGluCj4gPiBx
ZW11L2Jvb3Rsb2FkZXIva2VybmVsIGJvb3RzdHJhcCBjb2RlLgo+ID4gRG9lcyBpdCBtYWtlIHNl
bnNlIHRvIHlvdT8gQ2FuIHNvbWVib2R5IHJlcHJvZHVjZSB3aGF0IEkgYW0gc2VlaW5nPyA+Cj4K
PiBJIGRpZCBub3QgYnJpbmcgYW55IGFuc3dlciB0byB5b3VyIHF1ZXN0aW9uLCBidXQgYXQgbGVh
c3QgeW91IGtub3cgSSdtCj4gd29ya2luZyBvbiBpdCwgSSdsbCBrZWVwIHlvdSBwb3N0ZWQuCj4K
PiBUaGFua3MgZm9yIHRha2luZyB0aGUgdGltZSB0byBzZXR1cCBzeXprYWxsZXIuCj4KPiBBbGV4
Cj4KPiA+IFRoYW5rcwo+ID4KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiA+IGxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YKPiA+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
