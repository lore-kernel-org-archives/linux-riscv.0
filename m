Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1553CCD3427
	for <linux-riscv@archiver.kernel.org>; Mon, 11 May 2026 09:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h8xMBlsaGf/DYJwujigpX89emAaV9vveEZq+wn+dQnE=; b=PzYcFupHqPlNkX
	TMcDFIb8Lxxbn+x+t/StYLdkYEKa9nlhIfoTRwWgJpQ1JDgcvJhcPMlnAuvsZhJgES4y38O3JWUV1
	n5rCHpw+jUjUWQbjdN5WW/KbQBZ26XTtZ8pPngbyzSHX9D1Y710RgWRHSjWku2gUHxWKTiy7zSeyf
	2jSimbyKWP65eLJKtqYHvhlNjbsYAzhW5Y0y8A00iibh7vupZhkoVFm6WmAxjxT8sbHbLYSMAXNWE
	iZpEPv2RBBSFruNMS+Ahe5hajrrfAC94cCJCyT0Ih3EB6QTgwuh26jjlChyAJTh+8rpsY5PDOzAmi
	PBjoQ3AsiX3KFAwsMgvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMNKo-0000000D1AO-1evK;
	Mon, 11 May 2026 09:53:58 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMNKk-0000000D18v-3aD2
	for linux-riscv@lists.infradead.org;
	Mon, 11 May 2026 09:53:56 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-bc64ad08bf9so614365666b.0
        for <linux-riscv@lists.infradead.org>; Mon, 11 May 2026 02:53:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778493232; cv=none;
        d=google.com; s=arc-20240605;
        b=beGB4M5WKiMHpKcBcjnecboEPGp9+qUpomLn8JG5WSc4VWsX2m49RAmHXSKOqmZUZ3
         WSzQWCSGlUEDNGw0O8arKGR8cbxvozKwpFqVJIsVih4Ks5Qi+aVoA8j6h+dPsXlyJQTk
         tVQki6oLjXQGwhMmkoGd1e5a+p4ik8Nw4UpdDA1P8765YPntK1q0qzzC+c/c/5toUP5Y
         DRux472S4WBhyDz1I+uoNzqZToUPqnsBgXWi40u++t0LrFgBvvzmTrVQCdCBzVg0lCr7
         GQCbdjjuTYOMj+FODpFnHOWYo+v0HAgKdG19f22Kn/9nOSMkFgn4unOMlHm7peSWcItP
         yXdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DOxqkclygaOaqJpXj8YK91vPBx+UjdLdYyf947vxb3I=;
        fh=F7/IjCNbdOyhFMosYuSm3CrdiknMU/5iD6CbMnoBDVk=;
        b=ZXVAvqFYHDH1rSV0qf8R8XYNH9eObDWQ36phmRPeZTu4Ub9DOtxio1PXdy6jPepugi
         Pz8GSgHFLdko4Sx/QlBFSJkRm7lkJ4KXeY5S3uLLLOK5CpJUKZiP5OI5Ph6KR8k/vAFM
         veAlngP0mV424kogbx/ZcYNY8V5Lon2hWvyLz4XdV+Ba3Kj6Amy1Mby4E6OyJ4rhN7cv
         GnWFAByjPzPjMjL3NhDhXeTchCHb8nOwK1ztkcKJunKXgaqZteOODkiYRSFl2PqV7lPV
         x/CHj7QVAfCDDJv6g5Pd1HWalljSqEisgaggFkbcTnejW+00WHVOyYn3I052P46u0R6T
         dirg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778493232; x=1779098032; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DOxqkclygaOaqJpXj8YK91vPBx+UjdLdYyf947vxb3I=;
        b=ps1GZgca2cQR+tRtCYjILm80rGaY4o5OChYgmeGj4GVAmdI74xaIIADkm7TrRiJeky
         baDVPQKpFymf48Zhhfo89EwXiYnOrdbuD2IEkgA4nG/7yYjJ+CEld5mT7KRx+AITfOPo
         VDXpLppebx5TFQDZzUHefouG6T4KKcWT0qPydGt9PdflWw1H6f/y64VHoYroHqIrlUb4
         NeksE2x/5Ij/Wl4TZDGOgYxGt0M9RqbqRzkOm4BzIhENZNO4mVeOQAYaFdYIoqH9gJlU
         plCWBKchwRRrNYxpEyMOV+c3ZeChSWf23/fp9ez0ZcMbYODJQRADk9hitit4OcS4hwXE
         brJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778493232; x=1779098032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DOxqkclygaOaqJpXj8YK91vPBx+UjdLdYyf947vxb3I=;
        b=XjA6BfdCJCgZ8S6H7JctTXe4MxKooBwCbnzCViygzMSsCZQPovG7n+tuKv3q0u479t
         MHj9nPqQTaJbDFHXs3e1QCNVn5Y83tchLjTDSSv9KDRBkp+DEdjdh5rCTdRG9aNF2Fyc
         soxiuH61y01OxnDPtW/sjJhMaTKbDDt2pqfKwcTEo0FtUf8M2vUyYfo1/SPzfbM3V9ve
         /jpm1yRsMPlV3dOs+cjFtvTujWuNSbjjvCRYVTV5AmGIrWu3trf9PL20hI5qYev+Djn/
         0sf8T4YpEdX+BrcMOPGNfQ+CmwIaF/+0E0F687NduCJRcaCmoOyyCDwedxH70KWNfnt2
         kcMA==
X-Forwarded-Encrypted: i=1; AFNElJ/d/DBkJ9BD8wKiWspD+rtalm8jQ8J2xchd/2X/2+SYH2EuX4zTO5n6XjFfCUuE4ZlDdjxIdqdM2zYAMg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/cOVy7AAdH1WWXW8pHgRYz4M76FfJAvgzAotvcfLPTsE0JmmD
	RMoFXhCOMtxcA5QGOHckUmGbCFwNL2e5Da3rwstEdJms4UjfWUI4KqNY0iln2y/k/mpwOZlbl36
	bVJgETMYfMocntPpc0NVdJ9G7zN6RtW8=
X-Gm-Gg: Acq92OEgkR8gcbHbruSOO2Zm4KgMnJn94fnGTACfbTxWOK4jLj4NPbltViWLjgE+1o3
	lXh6eBwiLaSKYJM7we4TjafewEap1QV5DvCu18PWnOXNVBTrn+JQmM9bSD8Jg5oSF69rKQllqhv
	kCcMhF0yxMpDBrfQfUTTvqXFkVlGkbP24zfv8FmZhCYzwy49RmObB2co4CAlKLxvX5yqYXM3q8T
	+UmZnJXZ5127DqE3LyEd3vPOlqZTBG42TM6SKE8wjwfR80KC+ivCDB39y2W2NOiBIgiGk76dx9i
	gC0xXN0ppxqg+sfddMfjQ17j9w==
X-Received: by 2002:a17:907:970d:b0:bcf:1d87:11be with SMTP id
 a640c23a62f3a-bcf1d871b7dmr249140166b.19.1778493231921; Mon, 11 May 2026
 02:53:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260502051906.8160-1-linux.amoon@gmail.com> <20260502051906.8160-2-linux.amoon@gmail.com>
 <20260507024524-GKA3579608@kernel.org> <CANAwSgQLhgC6puNy2dkMjL=hd+yTYizBBFykd63KJDbw48219w@mail.gmail.com>
 <20260509121802-GKB3601591@kernel.org> <CANAwSgQNgXKitogbhQFcQaTTFtJ2sfxHehOCPdHH51S0a5wcSg@mail.gmail.com>
 <20260511065338-GKA3624147@kernel.org>
In-Reply-To: <20260511065338-GKA3624147@kernel.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 11 May 2026 15:23:35 +0530
X-Gm-Features: AVHnY4KbnlDceZWMAiIkuvkcFalGLhmIPDWMJqWZnt6VcLlOiYENy77kljjTReU
Message-ID: <CANAwSgTXo_ZO5DhK5BwLvCFXqsJ0dwmXeA6o-TebW-A87Y8+-g@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] riscv: dts: spacemit: k1-bananapi-f3: Add
 vcc5v0_sys regulator for Banana Pi F3
To: Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, 
	Han Gao <gaohan@iscas.ac.cn>, Ze Huang <huang.ze@linux.dev>, Chukun Pan <amadeus@jmu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_025354_949461_A059BCB8 
X-CRM114-Status: GOOD (  43.14  )
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

SGkgWWl4dW4sCgpPbiBNb24sIDExIE1heSAyMDI2IGF0IDEyOjIzLCBZaXh1biBMYW4gPGRsYW5A
a2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBIaSBBbmFuZCwKPgo+IE9uIDIwOjQ4IFNhdCAwOSBNYXkg
ICAgICwgQW5hbmQgTW9vbiB3cm90ZToKPiA+IEhpIFlpeHVuLAo+ID4KPiA+IE9uIFNhdCwgOSBN
YXkgMjAyNiBhdCAxNzo0OCwgWWl4dW4gTGFuIDxkbGFuQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4g
Pgo+ID4gPiBIaSBBbmFuZCwKPiA+ID4KPiA+ID4gT24gMTM6MDYgRnJpIDA4IE1heSAgICAgLCBB
bmFuZCBNb29uIHdyb3RlOgo+ID4gPiA+IEhpIFlpeHVuLAo+ID4gPiA+Cj4gPiA+ID4gVGhhbmtz
IGZvciB5b3VyIHJldmlldyBjb21tZW50cy4KPiA+ID4gPgo+ID4gPiA+IE9uIFRodSwgNyBNYXkg
MjAyNiBhdCAwODoxNSwgWWl4dW4gTGFuIDxkbGFuQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPiA+
ID4KPiA+ID4gPiA+IEhpIEFuYW5kLAo+ID4gPiA+ID4KPiA+ID4gPiA+IE9uIDEwOjQ4IFNhdCAw
MiBNYXkgICAgICwgQW5hbmQgTW9vbiB3cm90ZToKPiA+ID4gPiA+ID4gRGVmaW5lIHRoZSBzeXN0
ZW0gNVYgZml4ZWQgcmVndWxhdG9yICh2Y2M1djBfc3lzKSBzdXBwbGllZCBieSB0aGUKPiA+ID4g
PiA+ID4gREMgaW5wdXQuIEFzIHBlciB0aGUgc2NoZW1hdGljcywgdmNjNXYwX3N5cyBpcyB0aGUg
aW5wdXQgcG93ZXIgc291cmNlCj4gPiA+ID4gPiA+IGZvciB0aGUgVkNDNVYwX0hVQiBhbmQgNVZf
VkJVUyByZWdsYXRvcnMuIFVwZGF0ZSB0aGVzZSByZWd1bGF0b3JzCj4gPiA+ID4gPiA+IHRvIGNv
cnJlY3RseSByZWZlcmVuY2UgdmNjNXYwX3N5cyBhcyB0aGVpciBwYXJlbnQgKHZpbi1zdXBwbHkp
Lgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBDYzogSGFuIEdhbyA8Z2FvaGFuQGlzY2FzLmFjLmNu
Pgo+ID4gPiA+ID4gPiBDYzogWmUgSHVhbmcgPGh1YW5nLnplQGxpbnV4LmRldj4KPiA+ID4gPiA+
ID4gQ2M6IENodWt1biBQYW4gPGFtYWRldXNAam11LmVkdS5jbj4KPiA+ID4gPiA+ID4gU2lnbmVk
LW9mZi1ieTogQW5hbmQgTW9vbiA8bGludXguYW1vb25AZ21haWwuY29tPgo+ID4gPiA+ID4gPiAt
LS0KPiA+ID4gPiA+ID4gIGFyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazEtYmFuYW5hcGkt
ZjMuZHRzIHwgMTIgKysrKysrKysrKysrCj4gPiA+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTIg
aW5zZXJ0aW9ucygrKQo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS1iYW5hbmFwaS1mMy5kdHMgYi9hcmNoL3Jpc2N2L2Jv
b3QvZHRzL3NwYWNlbWl0L2sxLWJhbmFuYXBpLWYzLmR0cwo+ID4gPiA+ID4gPiBpbmRleCA1Nzkw
ZDkyN2I5M2QuLjk3MjdlY2RkOWY2YiAxMDA2NDQKPiA+ID4gPiA+ID4gLS0tIGEvYXJjaC9yaXNj
di9ib290L2R0cy9zcGFjZW1pdC9rMS1iYW5hbmFwaS1mMy5kdHMKPiA+ID4gPiA+ID4gKysrIGIv
YXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS1iYW5hbmFwaS1mMy5kdHMKPiA+ID4gPiA+
ID4gQEAgLTUwLDYgKzUwLDE2IEBAIHJlZ19kY19pbjogcmVndWxhdG9yLWRjLWluLTEydiB7Cj4g
PiA+ID4gPiA+ICAgICAgICAgICAgICAgcmVndWxhdG9yLWFsd2F5cy1vbjsKPiA+ID4gPiA+ID4g
ICAgICAgfTsKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gKyAgICAgcmVnX3ZjYzV2MF9zeXM6IHJl
Z3VsYXRvci12Y2M1djAtc3lzIHsKPiA+ID4gPiA+IFRoaXMgd2lsbCBmYWxsIGludG8gdGhlIGNh
dG9nZXJ5IG9mICJub24tY29udHJvbGxhYmxlICYgc2VydmUgbm8gZGV2aWNlcyIKPiA+ID4gPiA+
IHNlZSBzaW1pbGFyIGNvbW1lbnQgZm9yICdyZWdfZGNfaW4nIHdoaWNoIHJhaXNlZCBieSBLcnp5
c3p0b2YKPiA+ID4gPiA+Cj4gPiA+ID4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvNjUz
MDUyNmYtNTljYS00NzUzLWEwNjgtNDZjNjJhMWExZmVkQGtlcm5lbC5vcmcvCj4gPiA+ID4gPgo+
ID4gPiA+ID4gb3Igc2hvdWxkIEkgYXNrLCB3aGF0J3MgdGhlIHJlYWwgcHJvYmxlbSBpZiByZWd1
bGF0b3IgaGFzIG5vIHZpbi1zdXBwbHk/Cj4gPiA+ID4KPiA+ID4gPiBJZiB0aGUgZGV2aWNlIHRy
ZWUgaXMgbm90IGNvbmZpZ3VyZWQgd2l0aCB0aGUgY29ycmVjdCBwb3dlciBzb3VyY2UgaXQKPiA+
ID4gPiB3aWxsIGFmZmVjdCBwZXJmb3JtYW5jZS4KPiA+ID4gPgo+ID4gPiBQbGVhc2UgZWxhYm9y
YXRlLCBvciBwcm92aWRlIGVub3VnaCBldmlkZW5jZSB0byBwcm92ZSB0aGlzLCBiZWNhdXNlIHRo
ZQo+ID4gPiBjb25jbHVzaW9uIHlvdSBnYXZlIGhlcmUgY29udHJhZGljdHMgd2l0aCB3aGF0IEty
enlzenRvZiBwb2ludGVkIG91dAo+ID4gSSBkb27igJl0IGhhdmUgdGhlIHNjaGVtYXRpYyBmb3Ig
dGhhdCBib2FyZCwgc28gSSBza2lwcGVkIHJlcGx5aW5nLgo+ID4KPiBObywgeW91IGRpZG4ndCBh
bnN3ZXIgbXkgcXVlc3Rpb24sIEkgd2FzIGFza2luZyB3aHkgImFmZmVjdCBwZXJmb3JtYW5jZSIs
Cj4gYW5kIHlvdSBqdXN0IGdhdmUgbWUgdGhlIG9wcG9zaXRlIGNvbmNsdXNpb24KPgpJIHRyaWVk
IHRvIGp1c3RpZnkgbXkgY2hhbmdlcyBhY2NvcmRpbmcgdG8gdGhlIHNjaGVtYXRpYyBJIHVuZGVy
c3Rvb2QuCgo+IExldCBtZSBlbGFib3JhdGUsIHRoZSByZWdfdmNjNXYwX3N5cyBpcyBhIHJlZ3Vs
YXRvciB0aGF0IGhhcyBubyBzb2Z0d2FyZQo+IG9yIEdQSU8gY29udHJvbCwgc28gbm8gbmVlZCBz
b2Z0d2FyZSBjb250cm9sIGZyb20gdGhlIGtlcm5lbC9kcml2ZXIgcGVyc3BlY3RpdmUsCj4gd2hp
Y2ggYWxzbyBtZWFuIGl0IHdpbGwgYmUgYXV0b21hdGljYWxseSBlbmFibGVkIGZyb20gaGFyZHdh
cmUgcGVyc3BlY3RpdmUKPiBvbmNlIHRoZSBib2FyZCBwb3dlciB1cCAtICJub24tY29udHJvbGxh
YmxlIiBpbiBLcnp5c3p0b2YncyByZXBseQo+Cj4gdGhlIHJlZ192Y2M1djBfc3lzIGN1cnJlbnRs
eSBvbmx5IHNlcnZlIGFzIHZpbiBmb3Igb3RoZXIgcmVndWxhdG9yIHdoaWNoCj4gaXMgbm90IGEg
ZGV2aWNlIChlLmcgbm90IFVTQiwgUENJZSwgZU1NQy4uKSAtICJzZXJ2ZSBubyBkZXZpY2VzIiBp
bgo+IEtyenlzenRvZidzIHJlcGx5Li4KPgpNYW55IGRldmVsb3BtZW50IGJvYXJkcyBmb2xsb3cg
YSBzaW1pbGFyIHJlZ3VsYXRvciBzdHJ1Y3R1cmUsIHdpdGgKZml4ZWQgcmVndWxhdG9ycyBhc3Np
Z25lZCB0byBVU0IsIFBDSWUsIGFuZCBvdGhlciBpbnRlcm5hbCBzdWJzeXN0ZW1zLgpUaGlzIGRl
c2lnbiBpcyBjb25zaXN0ZW50IHdpdGggdGhlIHNlbWFudGljcyBkaWFncmFtLCBzbyBJ4oCZbSBu
b3QKaW50cm9kdWNpbmcgYW55dGhpbmcgbmV3Lgo+IGFuZCBieSBpbnRyb2R1Y2luZyByZWdfdmNj
NXYwX3N5cywga2VybmVsIGRyaXZlciBuZWVkIHRvIGRvIGFkZGl0aW9uYWwKPiB3b3JrIHRvIGdv
IHRocm91Z2ggcHJvYmUgcHJvY2VkdXJlIGFuZCByZWdpc3RlciB0aGUgcmVndWxhdG9yIGRldmlj
ZSwKPiBjb25zdW1lciBkZXBlbmQgb24gaXQgbmVlZCB0byB3YWl0LCB0aGlzIHdpbGwgaHVydCBw
ZXJmb3JtYW5jZSwgc2xvdwo+IGRvd24gc3lzdGVtIGJvb3QgYW5kIGV2ZW4gY29uc3VtZSBtb3Jl
IG1lbW9yeS4uCj4KTm8sIGl0IHNpbXBseSBkZWZpbmVzIHRoZSBwb3dlciBoaWVyYXJjaHkgdG8g
ZW5zdXJlIHRoYXQgZWFjaCBkZXZpY2UgcmVjZWl2ZXMKdGhlIGFwcHJvcHJpYXRlIHBvd2VyIHNv
dXJjZS4KCj4gQnkgZHJvcHBpbmcgcmVnX3ZjYzV2MF9zeXMsIGl0IHdpbGwgcmVzdWx0IGFzIGEg
c3RyaXBwZWQgcG93ZXIgc291cmNlCj4gdHJlZSwgdGhpcyBpcyBvbmx5IGRvd25zaWRlIEkgY2Fu
IHNlZSwgYnV0IGRvZXNuJ3QgcmVhbGx5IGh1cnQuLgo+Ck5vIGlzc3VlLiBJZiBteSBjaGFuZ2Vz
IGFyZSBicmVha2luZyB5b3VyIGRldmVsb3BtZW50IGJvYXJkLCBwbGVhc2UgZHJvcCB0aGlzLgoK
PiA+IFBsZWFzZSByZWZlciB0byB0aGUgUE9XRVIgVFJFRSBkaWFncmFtLCB3aGljaCBwcm92aWRl
cyBhIGNsZWFyCj4gPiB2aXN1YWxpemF0aW9uIG9mIHRoZSBwb3dlciBzb3VyY2VzLgo+ID4KPiA+
IFRoaXMgYm9hcmQgYWNjZXB0cyB0d28gcHJpbWFyeSBwb3dlciBzb3VyY2VzOiBhIDEy4oCvViBE
QyBpbnB1dCBhbmQgVVNCCj4gPiBUeXBl4oCRQyBwb3dlci4KPiA+IEZyb20gdGhlIHNjaGVtYXRp
Y+KAmXMgcG93ZXIgdHJlZSAocGFnZeKArzQpOgo+ID4KPiA+IFR5cGXigJFDIOKGkiBEQ19JTuKG
kiBTWTgzODZKIChVeHh4KSDihpIgUEkgUE1JQwo+ID4KPiA+IEFjY29yZGluZyB0byB0aGUgYmxv
Y2sgZGlhZ3JhbSwgdGhlIFNZODM4NkogcmVndWxhdG9yIElDIGlzCj4gPiByZXNwb25zaWJsZSBm
b3IgZ2VuZXJhdGluZyB0aGUgVkNDNVYwX1NZUyByYWlsICBWQ0M0VjBfU1lTIChzZWUgcGFnZQo+
ID4gMTMpLgo+ID4KPiA+IFVTQlZCVVMg4oaSIFNZODM4Nkog4oaSIFZDQzVWMF9TWVMKPiA+IFVT
QlZCVVMg4oaSIFNZODM4Nkog4oaSIFZDQzRWMF9TWVMKPiA+Cj4gPiBVU0JWQlVTICggVHlwZUMg
cG9ydCkgLS0+IERDX0lOLS0+IDEyVgo+ID4KPiA+IEluIHRoaXMgZGVzaWduLCB0aGUgU1k4Mzg2
SiBvcGVyYXRlcyBhcyBhIHN0ZXDigJFkb3duIGNvbnZlcnRlciwgc3VwcGx5aW5nCj4gPiBib3Ro
IFZDQzRWMF9TWVMgYW5kIFZDQzVWMF9TWVMgcmFpbHMgYW5kIFAhIFBNSUMuCj4gPgo+ID4gU1k4
Mzg2IGlzIGEgaGlnaC1lZmZpY2llbmN5IHN5bmNocm9ub3VzIHN0ZXAtZG93biBEQy9EQyByZWd1
bGF0b3IKPiA+IGNhcGFibGUgb2YgZGVsaXZlcmluZyB1cCB0byA2QSB3aXRoIHdpZGUgaW5wdXQg
dm9sdGFnZSBzdXBwb3J0IGFuZCBtdWx0aXBsZQo+ID4gcHJvdGVjdGlvbiBmZWF0dXJlcy4KPiA+
IERhdGFzaGVldCBbMV0gaHR0cHM6Ly9kYXRhc2hlZXQ0dS5jb20vZG93bmxvYWRfbmV3LnBocD9p
ZD0xNjA0NzQ0Cj4gc28gcmlnaHQsIFNZODM4NiBpcyBhIHBhc3NpdmUgZGV2aWNlIHdoaWNoIG5l
ZWQgbm8gc29mdHdhcmUgY29udHJvbCwKPiBub24tY29udHJvbGxhYmxlLi4KPgpOb3QgYWxsIHJl
Z3VsYXRvcnMgYXJlIHNvZnR3YXJlLWNvbnRyb2xsZWQuCklmIHRoZSBLMSBQMSBwb3dlciBtYW5h
Z2VtZW50IElDIHByb3ZpZGVzIDXigK9WIHJhaWxzLCB0aGVzZSBjYW4gYmUKdXRpbGl6ZWQgdG8g
c3VwcGx5IGludGVybmFsIHBlcmlwaGVyYWxzCj4gPgo+ID4gSSBoYXZlIHRyaWVkIHRvIGVsYWJv
cmF0ZSBhcyBjbGVhcmx5IGFzIEkgY2FuLgo+ID4gPgo+ID4gPiA+ID4gQW55IHByb2JlIGZhaWx1
cmUgb3Igc29tZXRoaW5nIGJhZCBoYXBwZW4/IChiZXNpZGVzIC9zeXMvLi4vcmVndWxhdG9yX3N1
bW1heSkKPiA+ID4gPgo+ID4gPiA+IE5vdCByZWFsbHk7IHRoZSByZWd1bGF0b3Igc3VtbWFyeSBq
dXN0IGNvbmZpcm1zIHRoZSBQTUlDIHVzZWQgdGhlCj4gPiA+ID4gY29ycmVjdCBwb3dlciBzb3Vy
Y2UuCj4gPiA+ID4gd2l0aCB0ZSBkZXZpY2UgaXAgYmxvY2tzLgo+ID4gPiA+Cj4gPiA+IHRoZW4g
SSBzZWUgaXQncyB1bm5lY2Vzc2FyeSB0byBhZGQgdGhpcwo+ID4gPgo+ID4gPiA+IEJhbmFuYXBp
IEYzIHNjaGVtYXRpY3MuCj4gPiA+ID4gWzFdIGh0dHBzOi8vZHJpdmUuZ29vZ2xlLmNvbS9maWxl
L2QvMTlpTEo1eG5DQl9vSzhWZVFqa1BHanpBbjM5V1l5eWx2L3ZpZXcKPiA+ID4gPiAocGFnZSAy
NCkKPiA+ID4gPgo+ID4gPiA+IFBsZWFzZSBjaGVjayB0aGUgc2hlbWF0aWNzIFZDQzVWMF9TWVMg
cGFnZSA0Cj4gPiA+ID4gVkNDNVYwX1NZUy0+VVNCX1ZDQzVWMC0+SERNSV9WQ0M1VjAtPkZBTl9W
Q0M1VjAtPlZDQzNWM19TWVMKPiA+ID4gPgo+ID4gPiA+IFBsZWFzZSBjaGVjayB0aGUgc2hlbWF0
aWNzIFZDQzVWMF9TWVMgcGFnZSAyNAo+ID4gPiA+IFZDQzVWMF9TWVMgaW5wdXQgZm9yIFZDQzVW
MF9IVUIgYW5kIDVWX1ZCVVMgZ2l2ZSB0aGUgVVNCIGh1YiwKPiA+ID4gPiB3aGljaCBpcyBlbmFi
bGVkIGJ5IFVTQjNfUFdSRU4gKGdwaW8gcGluKT4KPiA+ID4gPgo+ID4gPiA+IFBsZXNlIGNoZWNr
IHBvd2VyIHRyZWUgcGFnZSA0Cj4gPiA+ID4gVVNCVkJVUy0+U1k4Mzg2SiBVWFhYIC0+IFBDSUVf
VkNDM1YzIGZvciBwY2llIHZpbiBzb3VyY2UKPiA+ID4gPgo+ID4gPiA+IFNvLCB0aGlzIHNlcmll
cyB0cmllcyB0byBmaXggdGhlIHZpbiBzb3VyY2UgZm9yIFVTQiAzLjAgYW5kIFBDSWUgbm9kZXMu
Cj4gPiA+ID4KPiA+ID4gVGhpcyBpcyBub3Qgd2hhdCBJIGFzay4uCj4gPiBPcHBzLCBJIHRyaWVk
LCBidXQgSSB3YXNu4oCZdCBhYmxlIHRvIGNsZWFybHkgZWxhYm9yYXRlIG9uIGhvdyB0aGUgcG93
ZXIgc291cmNlcwo+ID4gYXJlIGRpc3RyaWJ1dGVkIGFjcm9zcyB0aGUgdmFyaW91cyBwZXJpcGhl
cmFscy4KPgo+IEhvcGUgSSBtYWtlIGl0IGNsZWFyIHRoaXMgdGltZS4uCkkgdHJpZWQgdG8gZWxh
Ym9yYXRlLCBidXQgd2FzbuKAmXQgc3VjY2Vzc2Z1bC4KPgo+IC0tCj4gWWl4dW4gTGFuIChkbGFu
KQpUaGFua3MKLUFuYW5kCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
