Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E5F0CD4F3C
	for <linux-riscv@archiver.kernel.org>; Mon, 18 May 2026 09:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mjCPPGyMF2vcKnYiuDo5TMnkQWFeo5wh2EhmBa+1NbE=; b=nhrAFxeBnNNo/J
	hiMjpL2TJATVf4ExY87e++W/LfxiVz26cQG4raHXnKZg7xPBYqFB21B9O2kFIbxQVAJvsnn2ceK4R
	I/cwdCXK6ghhwYThzSZYMAGRpGg+I0LkvGA0EzrAS+02ppiWUws96vi1dKyz5EMsVZ8pORhcMubcP
	IzNBxMh7P0pXWxXCx06BZsds9I1pDubs272RWzTq8o2mK4o6xBbv4h7SM46pC6WkjjovtmFJKUvNP
	IEXjZ3LsjoCBs6J8O73PbLc1GNAmwPs1SnvT8h/2OYmDfFGj9DfVUy0TaSdCIKc560P6zIDkfAqly
	qBdhE5D9xXwc/y+PViwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOujE-0000000F7Jf-1WX0;
	Mon, 18 May 2026 09:57:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOujC-0000000F7IZ-1tFj
	for linux-riscv@bombadil.infradead.org;
	Mon, 18 May 2026 09:57:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=HT0Lf2/mFgKxOu+qdEtEaudYEyue/pxbGLR/tX7Yu8c=; b=bV+zB+COkSsiY36W03Zvc7Z51A
	B2ieQ1AzZzFn49wo6tbjO1/kmk2LbGSRbbRKuCX3LZmslg2tp2kyuG9iaFPa+5gCnLpguLVLi8OtA
	NFaPOcS+jO1yBmLKDuOY8wLpWgNNbEor7CYE4ff0bXDhOk03QDgLQVS3O0YAAQoWwUSbLt7UnDavf
	fb5mmx1qYT6jdYOAaTPAlPxarcoo2C4m+ON4C9vrp0dr8OG15sOf9FonBGcWhXizBthiU/R6DXtjS
	8eAIrwXteB4djBJOGJsHSCqtAIqaaMUdC6oh6P0pQiyhxA7TRupsP2NxnnfewwCPLZApPTjRHf3mq
	FvwckyaA==;
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOuj3-0000000AfEe-0BQY
	for linux-riscv@lists.infradead.org;
	Mon, 18 May 2026 09:57:35 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-43d73422431so1307495f8f.2
        for <linux-riscv@lists.infradead.org>; Mon, 18 May 2026 02:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779098247; x=1779703047; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HT0Lf2/mFgKxOu+qdEtEaudYEyue/pxbGLR/tX7Yu8c=;
        b=heuowZXBbVG9XmhvMFAQvXssbhjU/M9Yhuhf2LqFvUOUVaQfSxv/WYkVhgcMWvWFjf
         LB9ncr1lW7fpZeXCE7Xr1HMG11G+tcFeQrV+u83zvGM3EQ/wqPl7q4SqOqZK3/VW9zSe
         pAtxmhVvJfw4UlXGbyGR99TC7wgVQHCR1zUGn7HE1t05mVBmLJvEJ48wFTKKEfA7ex0C
         m08Ba4aXLCAWhIkRvP8Mp9tFNN9+wQN6URbOP2zyvaRN7zJXtSw+MzEEjEL1P/j9wMIv
         jyzmEDq4G6hcsyDA3rpwfdxx43xDpf9dLNlPO9iVUGN7CAPhuM524OwdQPDt9WK8o21Q
         PctQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779098247; x=1779703047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HT0Lf2/mFgKxOu+qdEtEaudYEyue/pxbGLR/tX7Yu8c=;
        b=EOam8eSMJC1Avf7+rASCaMSD4qSG+YQQYpWH3K6ELufNTRXiwHm+a/DPxERWfxCVZp
         SV2v+vhtjj3xvn7gqdziWUPoiSVEc6vAL7ZFl9TkoVpyTWW8rxcGgsU4TA4pFtLZwoAf
         ZLTuHIoX3VtIwztSju/d3m8rLzF5vxYsJ2mbbnDnwJO8wsZmW6YHFd8MTdXCmkqc4KK+
         dmWN7/O659Xoog434g3hd4pt2Ie3Yx1KznhZe052wH4FXVtq+gOAT7NrgGtaAFsIs0MU
         pm2pUdC4qDAQti9nGc+NlPTPHEy/8ePFaLJKJW/tjnSt7NAxmv3DALsJ+CNqGJr4FzDV
         cBaA==
X-Forwarded-Encrypted: i=1; AFNElJ8L5uvaQH+Q3uWMh8Ec37e3STw4R319F9vAYg5uaJPQH9kLGp4QSCZven9GOiq72gDkogDmW7wib+jZMQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwG4Fco+RLlwkHoq4u1augODPEm6vmPviRS++1LxQ3QdjPK16Bm
	LWONL+I1pwl+Ia3mQZKBROCUnhhgsLhEPJkrn8zQTDmBYy5n/hGE9aMH
X-Gm-Gg: Acq92OE8ayA8q0lKDpaBN9Gmn8QDhx5V8PstpMT5vNBFHNt6R5X3pJP8YZ4SX7rqA/7
	8OAIdy1AzVZ9c2I348SKWMjhU8ZlgbMCUbuYTur3a9lyzktaitBoZdHJVDsMZPMb+LxWTTmJtqq
	TcpQTg3C3AK/GFwOGqyYWN5yd248yE35E7g/xeAzRf/eb/dULVFAgG3NY1dg8PvJbiY1pjGbV4B
	NKdoiF4oQsAgceo5qEZSHQ5XJbCYLBwHLALr7eeTxB2q6SuHFAz0c14sDezdszrAS9VBbSUno18
	dty1+Q9iGflOnDax6TxYxLUOLpLOoCfxLjEvIMHEYYYaH6djMFZRn/SYBG2KEGTrjbG0XdZD4KS
	azk6SEfha8MlYHTplt017ttaZj5rEFuOsj+xJaPvt1rQqa3UuG/QUDDZXV6lRqMrFmdiAc+vWgz
	R9Dw3R5WSsVCH1n5l8vSyyry68hD/Tf5D1f5r64CvS5W0rn5qaOfchqH56XIzNmrwKKzB86Aa2I
	gE=
X-Received: by 2002:a05:6000:2304:b0:441:1c95:17e7 with SMTP id ffacd0b85a97d-45e5c5c9e11mr23052887f8f.15.1779098247199;
        Mon, 18 May 2026 02:57:27 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a19a0csm34266191f8f.20.2026.05.18.02.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 02:57:26 -0700 (PDT)
Date: Mon, 18 May 2026 10:57:25 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Zong Li <zong.li@sifive.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, debug@rivosinc.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] riscv: cif: reduce shadow stack size limit from 4GB
 to 2GB
Message-ID: <20260518105725.7afe7a4c@pumpkin>
In-Reply-To: <CANXhq0qOjCVOQfCe5QqNU+UksAzK3F4OLYAFSfsBrRP3zo9GUg@mail.gmail.com>
References: <20260514075036.1432352-1-zong.li@sifive.com>
	<20260514095605.2c7d8761@pumpkin>
	<CANXhq0rY8wb-0x2whLGMSuWLujtZwrEsmpWh_PUhxoZ0gpA96w@mail.gmail.com>
	<20260515102411.4d3e868a@pumpkin>
	<CANXhq0p-YeNHGtQGHVvHSRvSaDtEvoY=KHc019iRBfQM7aV+ZA@mail.gmail.com>
	<20260515201613.243ea49b@pumpkin>
	<CANXhq0qOjCVOQfCe5QqNU+UksAzK3F4OLYAFSfsBrRP3zo9GUg@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_105730_242504_A5A5AF80 
X-CRM114-Status: GOOD (  46.88  )
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

T24gTW9uLCAxOCBNYXkgMjAyNiAxMTo1NDozMiArMDgwMApab25nIExpIDx6b25nLmxpQHNpZml2
ZS5jb20+IHdyb3RlOgoKPiBPbiBTYXQsIE1heSAxNiwgMjAyNiBhdCAzOjE24oCvQU0gRGF2aWQg
TGFpZ2h0Cj4gPGRhdmlkLmxhaWdodC5saW51eEBnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IE9u
IEZyaSwgMTUgTWF5IDIwMjYgMjI6Mjk6MDUgKzA4MDAKPiA+IFpvbmcgTGkgPHpvbmcubGlAc2lm
aXZlLmNvbT4gd3JvdGU6Cj4gPiAgCj4gPiA+IE9uIEZyaSwgTWF5IDE1LCAyMDI2IGF0IDU6MjTi
gK9QTSBEYXZpZCBMYWlnaHQKPiA+ID4gPGRhdmlkLmxhaWdodC5saW51eEBnbWFpbC5jb20+IHdy
b3RlOiAgCj4gPiA+ID4KPiA+ID4gPiBPbiBGcmksIDE1IE1heSAyMDI2IDExOjQyOjQ1ICswODAw
Cj4gPiA+ID4gWm9uZyBMaSA8em9uZy5saUBzaWZpdmUuY29tPiB3cm90ZToKPiA+ID4gPiAgCj4g
PiA+ID4gPiBPbiBUaHUsIE1heSAxNCwgMjAyNiBhdCA0OjU24oCvUE0gRGF2aWQgTGFpZ2h0ICAK
PiA+ID4gPiAuLiAgCj4gPiA+ID4gPiA+IEkgYWxzbyBkb24ndCB1bmRlcnN0YW5kIHRoZSByYXRp
b25hbCBmb3IganVzdCAvMiBhbmQgdGhlIDJHIHVwcGVyIGxpbWl0Lgo+ID4gPiA+ID4gPiBZb3Ug
bmVlZCA1MTIgbmVzdGVkIGZ1bmN0aW9uIGNhbGxzIHRvIGV2ZW4gdXNlIDRrLgo+ID4gPiA+ID4g
PiBUaGF0IHdvdWxkIGhhdmUgdG8gYmUgcXVpdGUgZGVlcCByZWN1cnNpb24uICAKPiA+ID4gPiA+
Cj4gPiA+ID4gPiBEdXJpbmcgdGhlIGRpc2N1c3Npb25zIGFib3V0IHRoZSBBUk0gR0NTIHYzIHNl
cmllcywgY29tbXVuaXR5IHBvaW50ZWQKPiA+ID4gPiA+IG91dCB0aGF0IGEgNEcgc2hhZG93IHN0
YWNrIG1pZ2h0IGJlIHRvbyBsYXJnZS4gVGhpcyBzaXplIGlzIGhhcmQgdG8KPiA+ID4gPiA+IHN1
cHBvcnQgaW4gbWVtb3J5LWNvbnN0cmFpbmVkIGVudmlyb25tZW50cyBsaWtlIEFuZHJvaWQuIEhv
d2V2ZXIsIHRoZQo+ID4gPiA+ID4gc2l6ZSBjYW5ub3QgYmUgdG9vIHNtYWxsIGVpdGhlciwgb3Ig
d2UgbWlnaHQgZmFjZSBzdGFjayBvdmVyZmxvdwo+ID4gPiA+ID4gaXNzdWVzLiBBdCB0aGF0IHRp
bWUsIGEgcGVyZmVjdCBzaXplIHdhcyBub3QgZGVjaWRlZC4gIAo+ID4gPiA+Cj4gPiA+ID4gSXQg
aXMgb25seSBWQSBub3QgcmVhbCBtZW1vcnkgc28gc2hvdWxkbid0IG1ha2UgbXVjaCBkaWZmZXJl
bmNlIHRvIG1lbW9yeQo+ID4gPiA+IHVzZSAoZXhjZXB0IGZvciBub21tdSB3aGVyZSB0aGUgYWN0
dWFsIG1lbW9yeSBoYXMgdG8gYmUgYWxsb2NhdGVkKS4KPiA+ID4gPiAgCj4gPiA+Cj4gPiA+IFlv
dSByYWlzZSBhIHZhbGlkIHBvaW50IHRoYXQgc2hhZG93IHN0YWNrcyBhcmUgcHJpbWFyaWx5IGEg
VkEKPiA+ID4gYWxsb2NhdGlvbi4gSG93ZXZlciwgaW4gTGludXgsIHRoZSBtZW1vcnkgb3ZlcmNv
bW1pdCBtZWNoYW5pc20gY3JlYXRlcwo+ID4gPiBhIHByYWN0aWNhbCBsaW5rIGJldHdlZW4gVkEg
YWxsb2NhdGlvbiBhbmQgcGh5c2ljYWwgbWVtb3J5IGNhcGFjaXR5Lgo+ID4gPiBBcyBJIG1lbnRp
b25lZCBpbiB0aGUgY29tbWl0IG1lc3NhZ2UsIG1lbW9yeSBhbGxvY2F0aW9uIHdpbGwgZmFpbCB3
aGVuCj4gPiA+IHRoZSBvdmVyY29tbWl0IG1vZGUgaXMgc2V0IHRvIE9WRVJDT01NSVRfR1VFU1Mg
b3IgT1ZFUkNPTU1JVF9ORVZFUi4KPiA+ID4KPiA+ID4gSW4gX192bV9lbm91Z2hfbWVtb3J5Ogo+
ID4gPiAgICAgICAgIGlmIChwYWdlcyA+IHRvdGFscmFtX3BhZ2VzKCkgKyB0b3RhbF9zd2FwX3Bh
Z2VzKQo+ID4gPiAgICAgICAgICAgICAgICAgZ290byBlcnJvcjsKPiA+ID4KPiA+ID4gTWFueSBw
YWdlIHJlcXVlc3RzIGZvciBWQSB3aWxsIGZhaWwgaWYgdGhlIHJlcXVlc3RlZCBzaXplIGV4Y2Vl
ZHMgdGhlCj4gPiA+IHN5c3RlbSdzIHRvdGFsIFJBTSBwbHVzIFN3YXAuIE9uIG1lbW9yeS1jb25z
dHJhaW5lZCBzeXN0ZW1zLAo+ID4gPiBhbGxvY2F0aW5nIGEgbWFzc2l2ZSA0R0Igc2hhZG93IHN0
YWNrIHBlciB0aHJlYWQgd291bGQgaW1tZWRpYXRlbHkKPiA+ID4gdHJpZ2dlciB0aGlzIGVycm9y
LiAgCj4gPgo+ID4gQnV0IHJlZHVjaW5nIHRoZSBzaXplIGJ5IGhhbGYgbWFrZXMgbGl0dGxlIGRp
ZmZlcmVuY2UuCj4gPiBZb3UnZCBuZWVkIGEgbXVjaCBiaWdnZXIgcmVkdWN0aW9uIHRvIG1ha2Ug
YW55IHJlYWwgZGlmZmVyZW5jZS4KPiA+ICAKPiAKPiBJIGFncmVlIHdpdGggeW91IHRoYXQgYSBz
bWFsbGVyIHNpemUgd291bGQgY292ZXIgbW9yZSBjYXNlcy4gSSBhbSB2ZXJ5Cj4gb3BlbiB0byB5
b3VyIGlkZWFzIHJlZ2FyZGluZyB0aGUgc2l6ZS4gV291bGQgeW91IHByZWZlciB0byB1c2UgMUdC
IG9yCj4gNTEyTUIgYXMgdGhlIGRlZmF1bHQgaW5zdGVhZD8KPiBBcyBJIG1lbnRpb25lZCBpbiBt
eSBwcmV2aW91cyBlbWFpbHMsIHVzaW5nIDJHQiBzZWVtcyB0byBiZSBhIHNhZmUKPiBzdGFydGlu
ZyBwb2ludC4gVGhpcyBpcyBiZWNhdXNlIGl0IGlzIGFscmVhZHkgYWNjZXB0ZWQgYnkgdGhlCj4g
Y29tbXVuaXR5IGFuZCB0aGUgQW5kcm9pZCBzeXN0ZW0gKGluIEdDUyBpbXBsZW1lbnRhdGlvbiku
Cj4gQWRkaXRpb25hbGx5LCBhbHRob3VnaCB0aGUgQ0ZJIGZlYXR1cmUgZG9lc24ndCBzdXBwb3J0
IDMyLWJpdCBzeXN0ZW1zCj4geWV0LCBub3JtYWwgMzItYml0IHN5c3RlbXMgY2FuIG9ubHkgc3Vw
cG9ydCB1cCB0byA0R0Igb2YgcGh5c2ljYWwKPiBtZW1vcnkuIElmIHRoZSBkZWZhdWx0IHNoYWRv
dyBzdGFjayBzaXplIGlzIDRHQiwgaXQgd291bGQgYmUgYWxtb3N0Cj4gaW1wb3NzaWJsZSB0byBy
dW4gb24gYSAzMi1iaXQgc3lzdGVtLiBVc2luZyBhdCBsZWFzdCAyR0IgY2FuIGhlbHAKPiBhdm9p
ZCB0aGlzIGlzc3VlIGluIHRoZSBmdXR1cmUuIElmIHlvdSBkb24ndCBoYXZlIGEgcHJlZmVycmVk
IGRlZmF1bHQKPiB2YWx1ZSwgbWF5YmUgd2UgY291bGQgc3RhcnQgd2l0aCAyRz8KCkkndmUgbm8g
cmVhbCBpZGVhIC0gbm90ZSB0aGF0IHRoZSBybGltaXQgdmFsdWUgc2hvdWxkIGJlIHNtYWxsIGZv
ciAzMmJpdAoob3IgYXQgbGVhc3QgdGhlIGFjdHVhbCBzdGFjayBpcyBzbWFsbCByZWdhcmRsZXNz
IG9mIHRoZSBybGltaXQgdmFsdWUpLgpUaGUgMkcgaXMganVzdCBhbiB1cHBlciBib3VuZCAtIHBy
b2JhYmx5IG1hdGNoaW5nIHRoZSA0RyB1cHBlciBib3VuZApmb3IgdGhlIDY0Yml0IHN0YWNrIGl0
c2VsZi4KCkRvbid0IGZvY3VzIG9uIHRoZSAyRyBsaW1pdCwgYnV0IG9uIHRoZSBybGltaXQoU1RB
Q0spLzIgKG9yIHJhdGhlciB0aGUgc2l6ZQpvZiB0aGUgbm9ybWFsIHN0YWNrKS4KT24gbXkgc3lz
dGVtcyB0aGUgZGVmYXVsdCBzb2Z0IGxpbWl0IGlzIDhNLCBhIDRNIHNoYWRvdyBzdGFjayBzdXBw
b3J0cyA1MTJrCm5lc3RlZCBmdW5jdGlvbiBjYWxscyAoNjRiaXQpIC0gbm9uZSBvZiB3aGljaCBj
YW4gaGF2ZSBhbnkgbG9jYWwgZGF0YS4KSW4gcmVhbGl0eSBwcm9ncmFtcyB0aGF0IHVzZSBhIGxv
dCBvZiBzdGFjayBhbGxvY2F0ZSBsYXJnZSBidWZmZXJzIG9uIHN0YWNrLAp0aGV5IGRvbid0IGhh
dmUgc2lsbHkgZGVwdGhzIG9mIHJlY3Vyc2l2ZSBmdW5jdGlvbnMgd2l0aCBubyBsb2NhbCBkYXRh
LgoKSSd2ZSBqdXN0IGxvb2tlZCBhdCB2bWxpbnV4Lm8gLSB3aGljaCB3b24ndCBiZSByZXByZXNl
bnRhdGl2ZSBvZiB1c2Vyc3BhY2UhCldoaWxlIHRoZXJlIGFyZSBhIGxvdCBvZiBmdW5jdGlvbnMg
d2l0aCBzbWFsbCBzdGFjayBmcmFtZSAoc3ViICQweDEwLCVyc3ApCnRoZXkgdGVuZCB0byBoYXZl
IHNhdmVkIGEgZmV3IHJlZ2lzdGVycyBpbiBzdGFjayBmaXJzdC4KVGhlIG1ham9yaXR5IHdpbGwg
aGF2ZSBhIHN0YWNrIGRlbHRhIG9mIG92ZXIgNjQgYnl0ZXMuClRoYXQgY29ycmVzcG9uZHMgdG8g
cmxpbWl0KFNUQUNLKS84IGFuZCBldmVuIHRoYXQgaXMgY29uc2VydmF0aXZlLgoKSSdkIHN1c3Bl
Y3QgdGhhdCBjb3VsZCBzYWZlbHkgaGFsdmUgdGhhdCBhZ2Fpbi4KCkFjdHVhbGx5IHdvdWxkIGl0
IGJlIHBvc3NpYmxlIHRvIGluaXRpYWxseSBqdXN0IGFsbG9jYXRlIG9uZSBwYWdlPwpJZiB5b3Ug
Z2V0IGFuIG92ZXJmbG93IGZhdWx0IG9uIHRoZSBzaGFkb3cgc3RhY2sgSSB0aGluayB5b3UgY2Fu
CnNhZmVseSByZWFsbG9jYXRlIGl0IGF0IGFuIGVudGlyZWx5IGRpZmZlcmVudCB1c2VyIHZpcnR1
YWwgYWRkcmVzcy4KVGhhdCB3b3VsZCByZW1vdmUgYWxsIHRoZSBwcm9ibGVtcyBvdmVyIGNvbW1p
dHRpbmcgYSBsb3Qgb2Ygc3dhcC4KTW9zdCB0aHJlYWRzIHdpbGwgbmV2ZXIgZG8gdGhlIDUxMiBu
ZXN0ZWQgY2FsbHMgbmVlZGVkIHRvIGJsb3cgdGhlIHN0YWNrLgoKLS0gRGF2aWQKCj4gCj4gCj4g
PiAtLSBEYXZpZAo+ID4gIAo+ID4gPiAgCj4gPiA+ID4gQnV0IDMyYml0IHByb2dyYW1zIHdpdGgg
bG90cyBvZiB0aHJlYWRzIGNhbiBydW4gb3V0IG9mIFZBLgo+ID4gPiA+IEluY3JlYXNpbmcgdGhl
IHN0YWNrIFZBIHNpemUgYnkgNTAlIG1pZ2h0IGV2ZW4gZ2l2ZSBwcm9ibGVtcyBmb3IgNjRiaXQK
PiA+ID4gPiBwcm9ncmFtcyAtIGlmIHRoZXkgYXJlIGFscmVhZHkgcmVkdWNpbmcgdGhlIHRocmVh
ZCBzdGFjayBzaXplIGF2b2lkCj4gPiA+ID4gcnVubmluZyBvdXQgb2YgVkEuCj4gPiA+ID4KPiA+
ID4gPiBJJ3ZlIG5vdCBjaGVja2VkLCBidXQgcHRocmVhZF9hdHRyX3NldHN0YWNrc2l6ZSgpIHNl
dHMgYSBsaW1pdCBmb3IgdGhlCj4gPiA+ID4gdGhyZWFkIHN0YWNrIHNpemUgKHdoaWNoIHdvdWxk
IG90aGVyd2lzZSBkZWZhdWx0IHNvIHJsaW1pdChTVEFDSykpLgo+ID4gPiA+IEkgZG9uJ3QgYmVs
aWV2ZSBpdCBzaG91bGQgdXBkYXRlIHRoZSBybGltaXQgdmFsdWUgaXRzZWxmLgo+ID4gPiA+IElu
IHdoaWNoIGNhc2UgeW91IGFyZSB1c2luZyB0aGUgd3Jvbmcgc2l6ZS4KPiA+ID4gPgo+ID4gPiA+
IEJ1dCBmb3IgYSB0aHJlYWQgd2l0aCBhIHZlcnkgcmVkdWNlZCBzdGFjayAoc2F5IDEyOGspIHlv
dSBwcm9iYWJseSBvbmx5Cj4gPiA+ID4gbmVlZCAxIHBhZ2Ugb2Ygc2hhZG93IHN0YWNrLCBhbnkg
bW9yZSBjb3VsZCBlYXNpbHkgbGVhZCB0byBydW5uaW5nIG91dAo+ID4gPiA+IG9mIFZBLgo+ID4g
PiA+Cj4gPiA+ID4gLS0gRGF2aWQgIAo+ID4gPiAgCj4gPiAgCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
