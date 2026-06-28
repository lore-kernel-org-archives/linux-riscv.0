Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C45BC43327
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Jun 2026 07:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X5t9pthncDhXK2jtkGSrh/IuTnq2wE7p0HbpuOuaCEk=; b=Z+Hm5AboSETq+m
	QE5Pm/MZJ0XTus+OvwXY1fgh78qiB5o4oW0PPgoZCaT2eW+OcH5db3Qh7GZJccQ0ypdj/Pq/49b06
	bUF2xrIrk5aiaHPyTBSk6cMdSjKrMohKRUCk8dgEKww5wXtKAjBhDFbCZ0vVo7LNOQjsVMEZmH0I9
	QX0cbRrvKat74jXghQFHfepS56yfr+r4f9FIQzvWUN/tgHXF0xJci7V9bSAbCNCOY2vCNwYsWmNE/
	rn8nyY8nTw7bT60McEviOmO4r/fjIp+iVziAR21gwsWLJbiGSvOnIScjGdO8vd4dQ8OESTc+8AkeF
	2fxCjVHZs8iadbTf9qFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdk2c-0000000Cxth-2sjN;
	Sun, 28 Jun 2026 07:34:58 +0000
Received: from mail-dl1-x1231.google.com ([2607:f8b0:4864:20::1231])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdk2Z-0000000CxtL-2aVe
	for linux-riscv@lists.infradead.org;
	Sun, 28 Jun 2026 07:34:57 +0000
Received: by mail-dl1-x1231.google.com with SMTP id a92af1059eb24-139f1dfc9faso1092357c88.0
        for <linux-riscv@lists.infradead.org>; Sun, 28 Jun 2026 00:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782632094; x=1783236894; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vledIumPthBBbn2WzmCtAqEFwAG6SWS4TJU6ZxwEn40=;
        b=d2bttw/bRCPQ5PlNzodB18ix6Zed0+m+p+c0ta8YiMb8R7rlHqd55gfBr0/It7P/PK
         5a2UUmJiZteCYXWd4uI0w3IOz9ac1T/U8/Cjd3C8FGhUzpAxSTZqBnyHVV++MRZ7Gr9A
         Ckx9+m6nC5M20pUUOALwxUAJRCqoMwsjE00iHG7RNO4WS8iUDa9DjBY1wUG9UpJqksXs
         g8o9EpY+Y/ZyHm0SDJut+rcL0BZbfKQXLXGz8sPc4NYy84ctxolput08WbRp2gOtMskw
         qSSQAljandRO1PBwwqwPIw0lsXdiMm6y1nyuJbdcwXmidGUYJCdKrDq34RZvxJGOrGNN
         gYwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782632094; x=1783236894;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vledIumPthBBbn2WzmCtAqEFwAG6SWS4TJU6ZxwEn40=;
        b=kJJAMN5KDPwT/XJoDhhejxbIrfF5gk/84TzGaNXq6Z57qPvMb1YGHy4OWu4Au8nRQx
         js78elArySmYc0GtVZmupxJHmwJm1noQ6KWCAai+KRG2dyDF9AyEJBneKsPRkD4kjbkx
         rBw7RiJqlXVLivQKq6MSN4ilr73HL2XLaMcU80gMBYsNX59lob+sAddcCr2d4DURffzA
         4HXywiEE62adEDHPw4NGc8n9SbsXgUeCpCxc+DjrBAv02Km8eYVh4HSAoDQhg0jwpWN3
         RdU8LWrV33jJ3Gzvw+/6ZWW7SS/wTg2kgJHyTKCIoHVgcl6mTAM0EbhxiLiDak3tjwPL
         CLpg==
X-Forwarded-Encrypted: i=1; AFNElJ8OXhqohZXj0yI4O/tMQyHNBHW993sAOZXHpfcCBz0kQ2vo9k6MLjXR6TkWY9p5WVtbdEL5uChcCbCPVA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzBBPHN1AIMVdgd9D72uXOJbSjFQXMmngjfGa7NjUiniYoO6thy
	RPul6HZUD1ITh4SipBJLNVcfsRHeOQMiOMv2NByiRhs/8UKlz+G8gjEb
X-Gm-Gg: AfdE7cnIJxod7W7dE93qVdsJ+T2XfeMSc5zn5qB48krlF04YVsuNZb4THo9pnDwdnhe
	qBSP7vjj/ILbY+8qEu7Q4vyKmGqqWew948OKWrxVUJynU5P7Ew8yMTbY+Ju4kIQHLaSZWdq8fzF
	RL7oDvf7zCIwp4H2WPiH+1WX+o85Ajtad9RX2qROnVUGTCo2+BBmfV4rlQmHQG4Jng2AhOWWNaB
	mB1LBQ9YUkqZGJDjtl11bJH+n9rGsjPxyR5iSRb2L0aJq/teCEEplddMs6i6zRDYwjVmSZQehGk
	moRBVml854kxqnV7QTqLuGRWA4kc4JN6cNLRQrVNrFSXOn8M/ZI86ku55vLOc3WWl7HgcyCN83q
	+gPVvksQp4n3VZKhB92w9fZlO6q+Pmgdr+PTB0XQDYOxwC58zEmxxtmyeupKhKKKzmryY2L5iFI
	kXb7UuosFt0u5gRrsZZN6hvism4TiD
X-Received: by 2002:a05:7022:f694:b0:138:637:6227 with SMTP id a92af1059eb24-139dba0a865mr13084203c88.11.1782632094282;
        Sun, 28 Jun 2026 00:34:54 -0700 (PDT)
Received: from computer ([2a09:bac5:3b4a:8aa::dd:15])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139e42338f9sm19928106c88.0.2026.06.28.00.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 00:34:53 -0700 (PDT)
Date: Sun, 28 Jun 2026 13:04:42 +0530
From: Varun R Mallya <varunrmallya@gmail.com>
To: Pu Lehui <pulehui@huawei.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
	eddyz87@gmail.com, memxor@gmail.com, bjorn@kernel.org,
	alex@ghiti.fr, martin.lau@linux.dev, song@kernel.org,
	yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com,
	puranjay@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH bpf-next 2/3] riscv, bpf: Add support for BPF exceptions
Message-ID: <akDOkptnqJt9LDtj@computer>
References: <20260621144259.288135-1-varunrmallya@gmail.com>
 <20260621144259.288135-3-varunrmallya@gmail.com>
 <b6e8c677-5fff-4de1-8483-fc23361898dc@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b6e8c677-5fff-4de1-8483-fc23361898dc@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_003456_400121_90D56601 
X-CRM114-Status: GOOD (  21.22  )
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

T24gVHVlLCBKdW4gMjMsIDIwMjYgYXQgMTA6MTE6NTdBTSArMDgwMCwgUHUgTGVodWkgd3JvdGU6
Cj4gCj4gV2UgZG9uJ3QgbmVlZCB0byBkdXBsaWNhdGUgY29kZS4gUGxlYXNlIG1lcmdlIGl0LgoK
TWFraW5nIHRoaXMgY2hhbmdlIGluIHRoZSBuZXh0IHZlcnNpb24hCgo+ID4gKwo+ID4gKwkJaWYg
KCFhdXgtPmV4Y2VwdGlvbl9jYiAmJiBhdXgtPmV4Y2VwdGlvbl9ib3VuZGFyeSkgewo+ID4gKwkJ
CS8qCj4gPiArCQkJICogQm91bmRhcnkgcHJvZ3JhbTogYWxsb2NhdGUgdGhlIGZyYW1lIGFuZCBz
YXZlIHRoZQo+ID4gKwkJCSAqIGZ1bGwgY2FsbGVlLXNhdmVkIHNldCwgY2FwdHVyaW5nIHRoZSBj
YWxsZXIncyB2YWx1ZXMuCj4gPiArCQkJICovCj4gPiArCQkJZW1pdF9hZGRpKFJWX1JFR19TUCwg
UlZfUkVHX1NQLCAtc3RhY2tfYWRqdXN0LCBjdHgpOwo+ID4gKwkJCWZvciAoaSA9IDA7IGkgPCBB
UlJBWV9TSVpFKHJ2X2V4Y2VwdGlvbl9jc2F2ZV9yZWdzKTsgaSsrKSB7Cj4gPiArCQkJCWVtaXRf
c2QoUlZfUkVHX1NQLCBzdG9yZV9vZmZzZXQsCj4gPiArCQkJCQlydl9leGNlcHRpb25fY3NhdmVf
cmVnc1tpXSwgY3R4KTsKPiA+ICsJCQkJc3RvcmVfb2Zmc2V0IC09IDg7Cj4gPiArCQkJfQo+ID4g
KwkJCWVtaXRfYWRkaShSVl9SRUdfRlAsIFJWX1JFR19TUCwgc3RhY2tfYWRqdXN0LCBjdHgpOwo+
ID4gKwkJfSBlbHNlIHsKPiA+ICsJCQkvKgo+ID4gKwkJCSAqIEV4Y2VwdGlvbiBjYWxsYmFjaywg
cmV1c2UgdGhlIGJvdW5kYXJ5IHByb2dyYW0ncwo+ID4gKwkJCSAqIGZyYW1lLCB3aG9zZSBmcmFt
ZSBwb2ludGVyIGlzIHBhc3NlZCBpbiBhMi4gU2V0dGluZwo+IAo+IHNvbWV0aGluZyBjb25mdXNl
ZOKAlHdoeSBpcyBpdCBBMj8gSSBmZWVsIGxpa2UgSSBtaXNzZWQgc29tZXRoaW5nLgoKYnBmX3Ro
cm93KCkgaW52b2tlcyB0aGUgZXhjZXB0aW9uIGNhbGxiYWNrIGFzIApicGZfZXhjZXB0aW9uX2Ni
KGNvb2tpZSwgc3AsIGJwLCAwLCAwKSAsIHdob3NlIDNyZCBhcmd1bWVudCAod2hpY2gsCmFjY29y
ZGluZyB0byBSSVNDLVYncyBjYWxsaW5nIGNvbnZlbnRpb24gcmVzaWRlcyBpbiBBMikgaXMgdGhl
IGJvdW5kYXJ5CnByb2cncyBmcmFtZSBwb2ludGVyLiBTaW5jZSB0aGlzIGVsc2UgYnJhbmNoIGhh
bmRsZXMKdGhlIGNhbGxiYWNrLCBpdCBleHBlY3RzIEEyIHRvIGhhdmUgdGhlIGZyYW1lIHBvaW50
ZXIuIFRoZSBhcm0KaW1wbGVtZW50YXRpb24gZG9lcyBzb21ldGhpbmcgdmVyeSBzaW1pbGFyIHdp
dGggZW1pdChBNjRfTU9WKDEsIEE2NF9GUCwgQTY0X1IoMikpLCBjdHgpCndoZXJlIEE2NF9SKDIp
IGlzIHRoZSB0aGlyZCBhcmcuCgo+ID4gKwkJCSAqIFNQID0gRlAgLSBzdGFja19hZGp1c3QgbGlu
ZXMgdGhlIGVwaWxvZ3VlJ3MgbG9hZHMgdXAKPiA+ICsJCQkgKiB3aXRoIHRoZSByZWdpc3RlcnMg
dGhlIGJvdW5kYXJ5IHNhdmVkLgo+ID4gKwkJCSAqLwo+ID4gKwkJCWVtaXRfbXYoUlZfUkVHX0ZQ
LCBSVl9SRUdfQTIsIGN0eCk7Cj4gPiArCQkJZW1pdF9hZGRpKFJWX1JFR19TUCwgUlZfUkVHX0ZQ
LCAtc3RhY2tfYWRqdXN0LCBjdHgpOwo+ID4gKwkJfQo+ID4gKwo+ID4gKwkJZ290byB0YWlsX3Nl
dHVwOwo+ID4gKwl9Cj4gPiArCj4gPiAgIAlpZiAoc2Vlbl9yZWcoUlZfUkVHX1JBLCBjdHgpKQo+
ID4gICAJCXN0YWNrX2FkanVzdCArPSA4Owo+ID4gICAJc3RhY2tfYWRqdXN0ICs9IDg7IC8qIFJW
X1JFR19GUCAqLwo+ID4gQEAgLTIwODIsNiArMjE3Myw3IEBAIHZvaWQgYnBmX2ppdF9idWlsZF9w
cm9sb2d1ZShzdHJ1Y3QgcnZfaml0X2NvbnRleHQgKmN0eCwgYm9vbCBpc19zdWJwcm9nKQo+ID4g
ICAJZW1pdF9hZGRpKFJWX1JFR19GUCwgUlZfUkVHX1NQLCBzdGFja19hZGp1c3QsIGN0eCk7Cj4g
PiArdGFpbF9zZXR1cDoKPiA+ICAgCWlmIChicGZfc3RhY2tfYWRqdXN0KQo+ID4gICAJCWVtaXRf
YWRkaShSVl9SRUdfUzUsIFJWX1JFR19TUCwgYnBmX3N0YWNrX2FkanVzdCwgY3R4KTsKPiA+IEBA
IC0yMTU3LDMgKzIyNDksMTMgQEAgYm9vbCBicGZfaml0X3N1cHBvcnRzX2ZzZXNzaW9uKHZvaWQp
Cj4gPiAgIHsKPiA+ICAgCXJldHVybiB0cnVlOwo+ID4gICB9Cj4gPiArCj4gPiArYm9vbCBicGZf
aml0X3N1cHBvcnRzX2V4Y2VwdGlvbnModm9pZCkKPiA+ICt7Cj4gPiArCS8qCj4gPiArCSAqIGJw
Zl90aHJvdygpIHVud2luZHMgYnkgd2Fsa2luZyB0aGUgZnJhbWUtcG9pbnRlciBjaGFpbiBmcm9t
IGluc2lkZQo+ID4gKwkgKiB0aGUga2VybmVsIGJhY2sgaW50byB0aGUgQlBGIGZyYW1lcyAoc2Vl
IGFyY2hfYnBmX3N0YWNrX3dhbGsoKSksIHNvCj4gPiArCSAqIGV4Y2VwdGlvbnMgcmVxdWlyZSB0
aGUgZnJhbWUtcG9pbnRlciB1bndpbmRlciB0byBiZSBlbmFibGVkLgo+ID4gKwkgKi8KPiA+ICsJ
cmV0dXJuIElTX0VOQUJMRUQoQ09ORklHX0ZSQU1FX1BPSU5URVIpOwo+IAo+IHJpc2N2IHNlbGVj
dCBBUkNIX1dBTlRfRlJBTUVfUE9JTlRFUlMsIHNvIHRoaXMgd2lsbCBhbHdheXMgdHJ1ZQoKSSBj
aGVja2VkIHRoYXQgdGhlIGtlcm5lbCBjb21waWxlZCBldmVuIHdoZW4gSSB0dXJuZWQKQ09ORklH
X0ZSQU1FX1BPSU5URVIgZXhwbGljaXRseSBvZmYsIHNvIG5vdCBnYXRpbmcgdGhpcwp3b3VsZCBi
ZSBhIG1pc3Rha2UsIHJpZ2h0ID8gQVJDSF9XQU5UX0ZSQU1FX1BPSU5URVJTIG1ha2VzCkNPTkZJ
R19GUkFNRV9QT0lOVEVSIHVzZXIgc2VsZWN0YWJsZSBhbmQgbWFrZXMgaXQgZGVmYXVsdCB0bwp0
cnVlLCBidXQgaXQncyBub3QgYWx3YXlzIHRydWUuIFdoYXQgZG9lcyBmb3JjZSBpdCBpcyBQRVJG
X0VWRU5UUz15IGJ1dCBpZgp0aGF0IHRvbyBpcyB0dXJuZWQgb2ZmLCB0aGVuIENPTkZJR19GUkFN
RV9QT0lOVEVSIGNhbiBhbHNvIGJlIHR1cm5lZApvZmYuCgpUaGFua3MgZm9yIHRoZSByZXZpZXch
IQotIFZhcnVuCj4gPiArfQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
