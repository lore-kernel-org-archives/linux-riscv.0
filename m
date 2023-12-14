Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92AC1C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Dec 2023 12:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Y443ifdHgWgiWaL6Vg31FoU9xgz2cZndv0qDcBxzVs=; b=IVIm1PyEu2c4HS
	i4PCT92mD4TnDPuWL5hh+a9qqdfkibSKFOPr/XlXEYjIIm9IWs6+dw2+rATSJAUvTWM03XbFnkWAk
	jvNeeTb3VzU6WffXHhq86LeQtR2m3+9m0MQpOvgWQ7eX945vJDV6wWmylE4sES9E0ztQuysdiG/nX
	9usvquCgoxAvGHEsyRN/3YCqILVN7k+fCFh3tHyZcyy4vEcR+evi6cdtd9KZqoXSnx/UWz04fIOax
	E9vgCgmaAC30SjjfoPJWN3lE4Y23E9aQssTC0TQdjcgV+B/RlSfYD1YovKs7M0/vSAMQQ178sJZXA
	V9L+/xCYXkx8UNcbXOJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDkr8-000H8Z-06;
	Thu, 14 Dec 2023 12:30:22 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDkr4-000H6Y-1c
	for linux-riscv@lists.infradead.org;
	Thu, 14 Dec 2023 12:30:20 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-5c673b01eeeso4416389a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 14 Dec 2023 04:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1702557016; x=1703161816; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YTYg98AeDb9Vd3saTDUzETIyYCa5DfFItfsf1F8SOZA=;
        b=F+5Z86hNfEhrFNbzDQSBrr8+p/IGx6O57hnsueBJDH3P22qTjtGuIYDNeycFulzdxu
         5LQW38865K1sTbBWFbALuxw4ZHp+/URS0Q4iG9oQDnlDuI8cxjFAaeP5FuJt2F/5D9Q7
         EWM+eAP2tFVUNUsmn2my6gLDt6YgrUNN5psQ90mNSCMnBuKkMUNJwOAVRBe1OH83cunr
         1WHucQZyohyKXrtba3O0Y30XVzx7Vs2U3kfzNUsiM/+LRIETg2g/BVn7WobCgUz4n/3q
         d1yDrX4uRK0ykgTYzMtTbeNh/E2P5t2WbDnh9/k9xzRco6pvgmVgdTP7ZVGC4SM4cHvb
         OMww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702557016; x=1703161816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YTYg98AeDb9Vd3saTDUzETIyYCa5DfFItfsf1F8SOZA=;
        b=WShs5uoyQrzC9TFWQp8fts/v4OpheJART/fFpa24uv0nx4YL8TOcepm2NZ6uPDRLPo
         yw1Lt3hvJcMA6nFOLvfGi+1BO7gywZQgYBA/fLSDSy3N+w8PCLvfR0UKOxBQYr+UMxFB
         mm7hPgrYOBNOgUXUefPcB/GFP9Y7GzdJNqSwmANgVhECU+du0/83Ula18aJb4UTvarTI
         KRLXMK16lia7SZwQv7zjx4rB+m0n3Ps54dqnsRp3hFm/FVuLFYYcnEm/UEZE4As04KwX
         4SU36xBsg62qCRUom9jZFfXwPnX5IZ+qa8CyohdvmEDZNa+ycoXzJajzAtd/BxAWYxYY
         llGA==
X-Gm-Message-State: AOJu0YziN5ekL7pl5NZtFu7m/Mfmlxo+FdFDztcqCur6Mq3mUTk8xowu
	1urUT+lXj+RQ2vNmqeNYWbgzQaq04aExp9K2c+dMbw==
X-Google-Smtp-Source: AGHT+IFh3PynjsOpH0Bb8g1t7TJwzACkLLtlQcWLE6SdhoVWBWTJX6SSIb1nQpDSBgiJeLn6u3PRCAqA+k4jZ3r/imQ=
X-Received: by 2002:a05:6a20:560c:b0:18f:97c:9278 with SMTP id
 ir12-20020a056a20560c00b0018f097c9278mr4531886pzc.93.1702557016440; Thu, 14
 Dec 2023 04:30:16 -0800 (PST)
MIME-Version: 1.0
References: <20231205024310.1593100-1-atishp@rivosinc.com> <20231205024310.1593100-5-atishp@rivosinc.com>
 <20231207-fidgeting-plywood-8347d9d346be@wendy>
In-Reply-To: <20231207-fidgeting-plywood-8347d9d346be@wendy>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 14 Dec 2023 18:00:04 +0530
Message-ID: <CAAhSdy3yK8CoQGZYT6j_xiKozt8viVXHogqVzUS7TxHs2Q_0Tw@mail.gmail.com>
Subject: Re: [RFC 4/9] drivers/perf: riscv: Read upper bits of a firmware counter
To: Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_043018_553899_41D39825 
X-CRM114-Status: GOOD (  31.12  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, kvm@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBEZWMgNywgMjAyMyBhdCA2OjAz4oCvUE0gQ29ub3IgRG9vbGV5IDxjb25vci5kb29s
ZXlAbWljcm9jaGlwLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIERlYyAwNCwgMjAyMyBhdCAwNjo0
MzowNVBNIC0wODAwLCBBdGlzaCBQYXRyYSB3cm90ZToKPiA+IFNCSSB2Mi4wIGludHJvZHVjZWQg
YSBleHBsaWNpdCBmdW5jdGlvbiB0byByZWFkIHRoZSB1cHBlciBiaXRzCj4gPiBmb3IgYW55IGZp
cm13YXIgY291bnRlciB3aWR0aCB0aGF0IGlzIGxvbmdlciB0aGFuIFhMRU4uIEN1cnJlbnRseSwK
PiA+IHRoaXMgaXMgb25seSBhcHBsaWNhYmxlIGZvciBSVjMyIHdoZXJlIGZpcm13YXJlIGNvdW50
ZXIgY2FuIGJlCj4gPiA2NCBiaXQuCj4KPiBUaGUgdjIuMCBzcGVjIGV4cGxpY2l0bHkgc2F5cyB0
aGF0IHRoaXMgZnVuY3Rpb24gcmV0dXJucyB0aGUgdXBwZXIKPiAzMiBiaXRzIG9mIHRoZSBjb3Vu
dGVyIGZvciBydjMyIGFuZCB3aWxsIGFsd2F5cyByZXR1cm4gMCBmb3IgcnY2NAo+IG9yIGhpZ2hl
ci4gVGhlIGNvbW1pdCBtZXNzYWdlIGhlcmUgc2VlbXMgb3Zlcmx5IGdlbmVyaWMgY29tcGFyZWQg
dG8KPiB0aGUgYWN0dWFsIGRlZmluaXRpb24gaW4gdGhlIHNwZWMsIGFuZCBtYWtlcyBpdCBzZWVt
IGxpa2UgaXQgY291bGQKPiBiZSB1c2VkIHdpdGggYSAxMjggYml0IGNvdW50ZXIgb24gcnY2NCB0
byBnZXQgdGhlIHVwcGVyIDY0IGJpdHMuCj4KPiBJIHRyaWVkIHRvIHRoaW5rIGFib3V0IHdoYXQg
ImdlbmVyaWMiIHNpdHVhdGlvbiB0aGUgY29tbWl0IG1lc3NhZ2UKPiBoYWQgYmVlbiB3cml0dGVu
IGZvciwgYnV0IHRoZSB0aGluZ3MgSSBjYW1lIHVwIHdpdGggd291bGQgYWxsIHJlcXVpcmUKPiBj
aGFuZ2VzIHRvIHRoZSBzcGVjIHRvIGRlZmluZSBiZWhhdmlvdXIgZm9yIEZJRCAjNSBhbmQvb3Ig
RklEICMxLCBzbwo+IGluIHRoZSBlbmQgSSBjb3VsZG4ndCBmaWd1cmUgb3V0IHRoZSByYXRpb25h
bGUgYmVoaW5kIHRoZSBub24tY29tbWl0dGFsCj4gd29yZGluZyB1c2VkIGhlcmUuCj4KPiA+Cj4g
PiBTaWduZWQtb2ZmLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4KPiA+IC0t
LQo+ID4gIGRyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMgfCAxMSArKysrKysrKystLQo+ID4g
IDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPgo+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMgYi9kcml2ZXJzL3BlcmYv
cmlzY3ZfcG11X3NiaS5jCj4gPiBpbmRleCA0MGEzMzUzNTBkMDguLjFjOTA0OWU2YjU3NCAxMDA2
NDQKPiA+IC0tLSBhL2RyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMKPiA+ICsrKyBiL2RyaXZl
cnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMKPiA+IEBAIC00OTAsMTYgKzQ5MCwyMyBAQCBzdGF0aWMg
dTY0IHBtdV9zYmlfY3RyX3JlYWQoc3RydWN0IHBlcmZfZXZlbnQgKmV2ZW50KQo+ID4gICAgICAg
c3RydWN0IGh3X3BlcmZfZXZlbnQgKmh3YyA9ICZldmVudC0+aHc7Cj4gPiAgICAgICBpbnQgaWR4
ID0gaHdjLT5pZHg7Cj4gPiAgICAgICBzdHJ1Y3Qgc2JpcmV0IHJldDsKPiA+IC0gICAgIHVuaW9u
IHNiaV9wbXVfY3RyX2luZm8gaW5mbzsKPiA+ICAgICAgIHU2NCB2YWwgPSAwOwo+ID4gKyAgICAg
dW5pb24gc2JpX3BtdV9jdHJfaW5mbyBpbmZvID0gcG11X2N0cl9saXN0W2lkeF07Cj4gPgo+ID4g
ICAgICAgaWYgKHBtdV9zYmlfaXNfZndfZXZlbnQoZXZlbnQpKSB7Cj4gPiAgICAgICAgICAgICAg
IHJldCA9IHNiaV9lY2FsbChTQklfRVhUX1BNVSwgU0JJX0VYVF9QTVVfQ09VTlRFUl9GV19SRUFE
LAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaHdjLT5pZHgsIDAsIDAsIDAsIDAs
IDApOwo+ID4gICAgICAgICAgICAgICBpZiAoIXJldC5lcnJvcikKPiA+ICAgICAgICAgICAgICAg
ICAgICAgICB2YWwgPSByZXQudmFsdWU7Cj4gPiArI2lmIGRlZmluZWQoQ09ORklHXzMyQklUKQo+
Cj4gV2h5IGlzIHRoaXMgbm90IElTX0VOQUJMRUQoKT8gVGhlIGNvZGUgYmVsb3cgdXNlcyBvbmUu
IFlvdSBjb3VsZCB0aGVuCj4gZm9sZCBpdCBpbnRvIHRoZSBpZiBzdGF0ZW1lbnQgYmVsb3cuCj4K
PiA+ICsgICAgICAgICAgICAgaWYgKHNiaV92Ml9hdmFpbGFibGUgJiYgaW5mby53aWR0aCA+PSAz
Mikgewo+Cj4gID49IDMyPyBJIGtub3cgaXQgaXMgZnJvbSB0aGUgc3BlYywgYnV0IHdoeSBkb2Vz
IHRoZSBzcGVjIGRlZmluZSBpdCBhcwo+ICAiT25lIGxlc3MgdGhhbiBudW1iZXIgb2YgYml0cyBp
biBDU1IiPyBTYXZpbmcgYml0cyBpbiB0aGUgc3RydWN0dXJlIEkKPiAgZ3Vlc3M/CgpZZXMsIGl0
IGlzIGZvciB1c2luZyBmZXdlciBiaXRzIGluIGNvdW50ZXJfaW5mby4KClRoZSBtYXhpbXVtIHdp
ZHRoIG9mIGEgSFcgY291bnRlciBpcyA2NCBiaXRzLiBUaGUgYWJzb2x1dGUgdmFsdWUgNjQKcmVx
dWlyZXMgNyBiaXRzIGluIGNvdW50ZXJfaW5mbyB3aGVyZWFzIGFic29sdXRlIHZhbHVlIDYzIHJl
cXVpcmVzIDYgYml0cwppbiBjb3VudGVyX2luZm8uIEFsc28sIGEgSFcgY291bnRlciBpZiBpdCBl
eGlzdHMgd2lsbCBoYXZlIGF0IGxlYXN0IDEgYml0CmltcGxlbWVudGVkIG90aGVyd2lzZSB0aGUg
SFcgY291bnRlciBkb2VzIG5vdCBleGlzdC4KClJlZ2FyZHMsCkFudXAKCj4KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICByZXQgPSBzYmlfZWNhbGwoU0JJX0VYVF9QTVUsIFNCSV9FWFRfUE1VX0NP
VU5URVJfRldfUkVBRF9ISSwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgaHdjLT5pZHgsIDAsIDAsIDAsIDAsIDApOwo+Cj4gPiArICAgICAgICAgICAgICAgICAgICAg
aWYgKCFyZXQuZXJyb3IpCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2YWwgPSB2
YWwgfCAoKHU2NClyZXQudmFsdWUgPDwgMzIpOwo+Cj4gSWYgdGhlIGZpcnN0IGVjYWxsIGZhaWxz
IGJ1dCB0aGUgc2Vjb25kIG9uZSBkb2Vzbid0IHdvbid0IHdlIGNvcnJ1cHQKPiB2YWwgYnkgb25s
eSBzZXR0aW5nIHRoZSB1cHBlciBiaXRzPyBJZiByZXR1cm5pbmcgdmFsID09IDAgaXMgdGhlIHRo
aW5nCj4gdG8gZG8gaW4gdGhlIGVycm9yIGNhc2UgKHdoaWNoIGl0IGlzIGluIHRoZSBleGlzdGlu
ZyBjb2RlKSBzaG91bGQgdGhlCj4gZmlyc3QgYGlmICghcmV0LmVycm9yKWAgYmVjb21lIGBpZiAo
cmV0LmVycm9yKWAgLT4gYHJldHVybiAwYD8KPgo+Cj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB2YWwgPSB2YWwgfCAoKHU2NClyZXQudmFsdWUgPDwgMzIpOwo+Cj4gQWxzbywgfD0g
Pwo+Cj4gQ2hlZXJzLAo+IENvbm9yLgo+Cj4gPiArICAgICAgICAgICAgIH0KPiA+ICsjZW5kaWYK
PiA+ICAgICAgIH0gZWxzZSB7Cj4gPiAtICAgICAgICAgICAgIGluZm8gPSBwbXVfY3RyX2xpc3Rb
aWR4XTsKPiA+ICAgICAgICAgICAgICAgdmFsID0gcmlzY3ZfcG11X2N0cl9yZWFkX2NzcihpbmZv
LmNzcik7Cj4gPiAgICAgICAgICAgICAgIGlmIChJU19FTkFCTEVEKENPTkZJR18zMkJJVCkpCj4g
PiAgICAgICAgICAgICAgICAgICAgICAgdmFsID0gKCh1NjQpcmlzY3ZfcG11X2N0cl9yZWFkX2Nz
cihpbmZvLmNzciArIDB4ODApKSA8PCAzMSB8IHZhbDsKPiA+IC0tCj4gPiAyLjM0LjEKPiA+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
