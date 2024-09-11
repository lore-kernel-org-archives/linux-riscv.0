Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D463DEE01EE
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Sep 2024 11:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cp+apzTJ8nl0R9MA10svLa64G48I/RjOYqCVhyrnhZY=; b=3l5oG6rLJPR4G3
	VV9bjXRitFiHaZZCH7rLklrHYUo9hTmAEJgrbOUwWNtH6vPxXYqpHp8CnfPQWu5NNyMxIviWhe6Aa
	Dd55YXJhDyEM4UFZmcwVOAgjkBHTjWQdWzNXkW+C1w6xi6TO7qJ7Q6jpvZVCXZlAL4crHL7m3i18G
	MAGvhd20urGWpjMSSGfGJsS0hmzjAMSFr7vinBsRQuZFbmLh25IdoJfcVdTQh9HaNwMLuaNx0h3Zi
	s9GcDsBCx5djrZlV2w7tfEXXKPnPxi5qzcFUny7g+nqF//sagNyYeEQvTASLsaVi1P8UV+ekrKmpL
	MpomLisfhg9zBYAn8WXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soLGM-00000009F1x-3x3J;
	Wed, 11 Sep 2024 11:11:54 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soL3f-00000009CXz-2HlW
	for linux-riscv@lists.infradead.org;
	Wed, 11 Sep 2024 10:58:48 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-718e3c98b5aso3192739b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 11 Sep 2024 03:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726052326; x=1726657126; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y7Wq0ojhg4OlKZWObqNyEMqFiHsGaFxKZnwTSD+aecE=;
        b=XPzYupX9h1+/CfcGg7wue/7JXq1xsfPy237C/0Sh5G2HyqNadcp6El3mKsWY45itqp
         uXImuSNVlZZrfWLLxqFLcpq8lrEIj7361nJqLVt7Jiz1Mch3Z8DQdcM1m68wS2juCQlR
         FMa4ZspT9WbXF5Dblit5frDTz/UYeWUBQuFl6I5nMB/oLgChwju08I6GWvBVdLCKF3W+
         00o3Cv8vHgrgFZMDsGcoD5fANL2P1VjQmtV/ylJweLMC1mKIt7KIz9sWIN5F9bQrSxKS
         Fr4CVLsnnplKIwAl1DPgFQKNOOmuq/29xUupnIEG7M1kEkmqmPYxbjMWmjvC3TP8Wmjl
         MsBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726052326; x=1726657126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y7Wq0ojhg4OlKZWObqNyEMqFiHsGaFxKZnwTSD+aecE=;
        b=vyYp8TZg1QpbF68tSGcAYjtzx4QK8FX/lU+3SJ3j/RTiA91TUtbaqXGxSYVtOzexLM
         qvI+bPrFDF51yT1PmoCBpRj/tYhmcPLd5B2wuOYarb164fKsO6V/BuQtra0IDKj6NVUf
         nfqYLDD8iCThbrjPmtSR6+BCZt8O74GXXaX604XATG/6ycr0HbUr7OCyiQxXbi2jQtPl
         OBO8Xyk5RaNVbdBMtZ5wPAgUbT53q3BiIj/XU8ftF/2qS1jtPa/O7SRz4zhplefFm2vX
         NKeTqdURkjWAl0TsUcblMrgiuKl4dFE8MEep19OxGZxYF8phe3hz6QkKlqVcjpSoUNva
         JDiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWELIF6ouAqeQynKjmS7CEzFrJSkyXmbS/vSqIMOA514jN423C+lMWrQPjpNM92MdcZ94s6rU6zzSkmNQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwO/v6m1V52N8iiyVvhF2pwAtseQ10XlYLhrhgRYf+95dgQMsps
	TvIkXPJKPpGSvfIGHojNEvn4fB7w3Ni88uVJW06AHbjlP0WSQwhL
X-Google-Smtp-Source: AGHT+IFXRIkDYXeweCuIJfGLn2HYm5191miDB4YjHLUhLcLcNRniPgRSA5iz617KUqpt/gEh00OviQ==
X-Received: by 2002:a05:6a00:181e:b0:717:9154:b5d6 with SMTP id d2e1a72fcca58-718d5ee032emr20084562b3a.22.1726052326133;
        Wed, 11 Sep 2024 03:58:46 -0700 (PDT)
Received: from localhost.localdomain (1-171-31-75.dynamic-ip.hinet.net. [1.171.31.75])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d8242b3d13sm7158307a12.52.2024.09.11.03.58.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Sep 2024 03:58:45 -0700 (PDT)
From: Andy Chiu <andybnac@gmail.com>
To: bjorn@kernel.org
Cc: alexghiti@rivosinc.com,
	andy.chiu@sifive.com,
	aou@eecs.berkeley.edu,
	justinstitt@google.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	mark.rutland@arm.com,
	mhiramat@kernel.org,
	morbo@google.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	palmer@dabbelt.com,
	palmer@rivosinc.com,
	paul.walmsley@sifive.com,
	puranjay@kernel.org,
	rostedt@goodmis.org,
	zong.li@sifive.com,
	Andy Chiu <andybnac@gmail.com>,
	yongxuan.wang@sifive.com
Subject: Re: [PATCH v2 3/6] riscv: ftrace: prepare ftrace for atomic code patching
Date: Wed, 11 Sep 2024 18:57:17 +0800
Message-Id: <ZuFteQ3t8K4h2-kJ@Andys-MacBook-Air.local>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <87sev78dnz.fsf@all.your.base.are.belong.to.us>
References: <87sev78dnz.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_035847_611674_DD9B995E 
X-CRM114-Status: GOOD (  31.69  )
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

T24gV2VkLCBBdWcgMTQsIDIwMjQgYXQgMDI6NTc6NTJQTSArMDIwMCwgQmrDtnJuIFTDtnBlbCB3
cm90ZToKPiBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJuZWwub3JnPiB3cml0ZXM6Cj4gCj4gPiBB
bmR5IENoaXUgPGFuZHkuY2hpdUBzaWZpdmUuY29tPiB3cml0ZXM6Cj4gPgo+ID4+IFdlIHVzZSBh
biBBVUlQQytKQUxSIHBhaXIgdG8ganVtcCBpbnRvIGEgZnRyYWNlIHRyYW1wb2xpbmUuIFNpbmNl
Cj4gPj4gaW5zdHJ1Y3Rpb24gZmV0Y2ggY2FuIGJyZWFrIGRvd24gdG8gNCBieXRlIGF0IGEgdGlt
ZSwgaXQgaXMgaW1wb3NzaWJsZQo+ID4+IHRvIHVwZGF0ZSB0d28gaW5zdHJ1Y3Rpb25zIHdpdGhv
dXQgYSByYWNlLiBJbiBvcmRlciB0byBtaXRpZ2F0ZSBpdCwgd2UKPiA+PiBpbml0aWFsaXplIHRo
ZSBwYXRjaGFibGUgZW50cnkgdG8gQVVJUEMgKyBOT1A0LiBUaGVuLCB0aGUgcnVuLXRpbWUgY29k
ZQo+ID4+IHBhdGNoaW5nIGNhbiBjaGFuZ2UgTk9QNCB0byBKQUxSIHRvIGVhYmxlL2Rpc2FibGUg
ZnRyY2FlIGZyb20gYQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBl
bmFibGUgICAgICAgIGZ0cmFjZQo+ID4KPiA+PiBmdW5jdGlvbi4gVGhpcyBsaW1pdHMgdGhlIHJl
YWNoIG9mIGVhY2ggZnRyYWNlIGVudHJ5IHRvICstMktCIGRpc3BsYWNpbmcKPiA+PiBmcm9tIGZ0
cmFjZV9jYWxsZXIuCj4gPj4KPiA+PiBTdGFydGluZyBmcm9tIHRoZSB0cmFtcG9saW5lLCB3ZSBh
ZGQgYSBsZXZlbCBvZiBpbmRpcmVjdGlvbiBmb3IgaXQgdG8KPiA+PiByZWFjaCBmdHJhY2UgY2Fs
bGVyIHRhcmdldC4gTm93LCBpdCBsb2FkcyB0aGUgdGFyZ2V0IGFkZHJlc3MgZnJvbSBhCj4gPj4g
bWVtb3J5IGxvY2F0aW9uLCB0aGVuIHBlcmZvcm0gdGhlIGp1bXAuIFRoaXMgZW5hYmxlIHRoZSBr
ZXJuZWwgdG8gdXBkYXRlCj4gPj4gdGhlIHRhcmdldCBhdG9taWNhbGx5Lgo+ID4KPiA+IFRoZSAr
LTJLIGxpbWl0IGlzIGZvciBkaXJlY3QgY2FsbHMsIHJpZ2h0Pwo+ID4KPiA+IC4uLmFuZCB0aGlz
IEkgd291bGQgc2F5IGJyZWFrcyBESVJFQ1RfQ0FMTFMgKHdoaWNoIHNob3VsZCBiZSBpbXBsZW1l
bnRlZAo+ID4gdXNpbmcgY2FsbF9vcHMgbGF0ZXIpPwo+IAo+IFRoaW5raW5nIGEgYml0IG1vcmUs
IGFuZCByZS1yZWFkaW5nIHRoZSBzZXJpZXMuCj4gCj4gVGhpcyBzZXJpZXMgaXMgZ29vZCB3b3Jr
LCBhbmQgaXQncyBhIGJpZyBpbXByb3ZlbWVudCBmb3IgRFlOQU1JQ19GVFJBQ0UsCj4gYnV0Cj4g
Cj4gK2ludCBmdHJhY2VfbWFrZV9jYWxsKHN0cnVjdCBkeW5fZnRyYWNlICpyZWMsIHVuc2lnbmVk
IGxvbmcgYWRkcikKPiArewo+ICsJdW5zaWduZWQgbG9uZyBkaXN0YW5jZSwgb3JpZ19hZGRyOwo+
ICsKPiArCW9yaWdfYWRkciA9ICh1bnNpZ25lZCBsb25nKSZmdHJhY2VfY2FsbGVyOwo+ICsJZGlz
dGFuY2UgPSBhZGRyID4gb3JpZ19hZGRyID8gYWRkciAtIG9yaWdfYWRkciA6IG9yaWdfYWRkciAt
IGFkZHI7Cj4gKwlpZiAoZGlzdGFuY2UgPiBKQUxSX1JBTkdFKQo+ICsJCXJldHVybiAtRUlOVkFM
Owo+ICsKPiArCXJldHVybiBfX2Z0cmFjZV9tb2RpZnlfY2FsbChyZWMtPmlwLCBhZGRyLCBmYWxz
ZSk7Cj4gK30KPiArCj4gCj4gYnJlYWtzIFdJVEhfRElSRUNUX0NBTExTLiBUaGUgZGlyZWN0IHRy
YW1wb2xpbmUgd2lsbCAqbmV2ZXIqIGJlIHdpdGhpbgo+IHRoZSBKQUxSX1JBTkdFLgoKClllcywg
aXQgaXMgaGFyZGx5IHBvc3NpYmxlIHRoYXQgYSBkaXJlY3QgdHJhbXBvbGluZSB3aWxsIGJlIHdp
dGhpbiB0aGUKcmFuZ2UuCgpSZWNlbnRseSBJIGhhdmUgYmVlbiB0aGlua2luZyBzb21lIHNvbHV0
aW9ucyB0byBhZGRyZXNzIHRoZSBpc3N1ZS4gT25lCnNvbHV0aW9uIGlzIHJlcGxheWluZyBBVUlQ
QyBhdCBmdW5jdGlvbiBlbnRyaWVzLiBUaGUgaWRlYSBoYXMgdHdvIHNpZGVzLgpGaXJzdCwgaWYg
d2UgYXJlIHJldHVybmluZyBiYWNrIHRvIHRoZSBzZWNvbmQgaW5zdHJ1Y3Rpb24gYXQgdHJhcCBy
ZXR1cm4sCnRoZW4gZG8gc2VwYyAtPSA0IHNvIGl0IGV4ZWN1dGVzIHRoZSB1cC10by1kYXRlIEFV
SVBDLiBUaGUgb3RoZXIgc2lkZSBpcwp0byBmaXJlIHN5bmNocm9ub3VzIElQSSB0aGF0IGRvZXMg
cmVtb3RlIGZlbmNlLmkgYXQgcmlnaHQgdGltaW5ncyB0bwpwcmV2ZW50IGNvbmN1cnJlbnQgZXhl
Y3V0aW5nIG9uIGEgbWl4IG9mIG9sZCBhbmQgbmV3IGluc3RydWN0aW9ucy4KIApDb25zaWRlciBy
ZXBsYWNpbmcgaW5zdHJ1Y3Rpb25zIGF0IGEgZnVuY3Rpb24ncyBwYXRjaGFibGUgZW50cnkgd2l0
aCB0aGUKZm9sbG93aW5nIHNlcXVlbmNlOgoKSW5pdGlhbCBzdGF0ZToKLS0tLS0tLS0tLS0tLS0K
MDogQVVJUEMKNDogSkFMUgoKU3RlcDE6CndyaXRlKDAsICJKICs4IikKZmVuY2Ugdyx3CnNlbmQg
c3luYyBsb2NhbCtyZW1vdGUgZmVuY2UuaQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KMDogSiAr
OAo0OiBKQUxSCgpTdGVwMjoKd3JpdGUoNCwgIkpBTFInIikKZmVuY2Ugdyx3CnNlbmQgc3luYyBs
b2NhbCtyZW1vdGUgZmVuY2UuaQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KMDogSiArOAo0OiBK
QUxSJwoKU3RlcDM6CndyaXRlKDAsICJBVUlQQyciKQpmZW5jZSB3LHcKc2VuZCBzeW5jIGxvY2Fs
K3JlbW90ZSBmZW5jZS5pICh0byBhY3RpdmF0ZSB0aGUgY2FsbCkKLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KMDogQVVJUEMnCjQ6IEpBTFInCgpUaGUgZm9sbG93aW5nIGV4ZWN1dGlvbiBzZXF1ZW5j
ZXMgYXJlIGFjY2VwdGFibGU6Ci0gQVVJUEMsIEpBTFIKLSBKICs4LCAoc2tpcHBpbmcge0pBTFIg
fCBKQUxSJ30pCi0gQVVJUEMnLCBKQUxSJwoKQW5kIGhlcmUgYXJlIHNlcXVlbmNlcyB0aGF0IHdl
IHdhbnQgdG8gcHJldmVudDoKLSBBVUlQQycsIEpBTFIKLSBBVUlQQywgSkFMUicKClRoZSBsb2Nh
bCBjb3JlIHNob3VsZCBuZXZlciBleGVjdXRlIHRoZSBmb3JiaWRkZW4gc2VxdWVuY2UuCgpCeSBs
aXN0aW5nIGFsbCBwb3NzaWJsZSBjb21iaW5hdGlvbnMgb2YgZXhlY3V0aW5nIHNlcXVlbmNlIG9u
IGEgcmVtb3RlCmNvcmUsIHdlIGNhbiBmaW5kIHRoYXQgdGhlIGRhbmdlcm91cyBzZXFlbmNlIGlz
IGltcG9zc2libGUgdG8gaGFwcGVuOgoKbGV0IGYgYmUgdGhlIGZlbmNlLmkgYXQgc3RlcCAxLCAy
LCAzLiBBbmQgbGV0IG51bWJlcnMgYmUgdGhlIGxvY2F0aW9uIG9mCmNvZGUgYmVpbmcgZXhlY3V0
ZWQuIE1hdGhlbWF0aWNhbGx5LCBoZXJlIGFyZSBhbGwgY29tYmluYXRpb25zIGF0IGEgc2l0ZQpo
YXBwZW5pbmcgb24gYSByZW1vdGUgY29yZToKCmZmZjA0IC0tIHVwZGF0ZWQgc2VxCmZmMGY0IC0t
IGltcG9zc2libGUsIHdvdWxkIGJlIGZmMGYwNCwgdXBkYXRlZCBzZXEKZmYwNGYgLS0gaW1wb3Nz
aWJsZSwgd291bGQgYmUgZmYwOGYsIHNhZmUgc2VxCmYwZmY0IC0tIGltcG9zc2libGUsIHdvdWxk
IGJlIGYwZmYwNCwgdXBkYXRlZCBzZXEKZjBmNGYgLS0gaW1wb3NzaWJsZSwgd291bGQgYmUgZjBm
MDhmIChzYWZlKSwgb3IgZjBmMGYwNCAodXBkYXRlZCkKZjA0ZmYgLS0gaW1wb3NzaWJsZSwgd291
bGQgYmUgZjA4ZmYsIHNhZmUgc2VxCjBmZmY0IC0tIGltcG9zc2libGUsIHdvdWxkIGJlIDBmZmYw
NCwgdXBkYXRlZCBzZXEKMGZmNGYgLS0gaW1wb3NzaWJsZSwgd291bGQgYmUgMGZmMDhmIChzYWZl
KSwgb3IgMGZmMGYwNCAodXBkYXRlZCkKMGY0ZmYgLS0gaW1wb3NzaWJsZSwgd291bGQgYmUgMGYw
OGZmIChzYWZlKSwgMGYwZjA4ZiAoc2FmZSksIDBmMGYwZjA0ICh1cGRhdGVkKQowNGZmZiAtLSBv
bGQgc2VxCgpBZnRlciB0aGUgMXN0ICdmZW5jZS5pJywgcmVtb3RlIGNvcmVzIHNob3VsZCBvYnNl
cnZlIChKICs4LCBKQUxSKSBvciAoSiArOCwgSkFMUicpCkFmdGVyIHRoZSAybmQgJ2ZlbmNlLmkn
LCByZW1vdGUgY29yZXMgc2hvdWxkIG9ic2VydmUgKEogKzgsIEpBTFInKSBvciAoQVVJUEMnLCBK
QUxSJykKQWZ0ZXIgdGhlIDNyZCAnZmVuY2UuaScsIHJlbW90ZSBjb3JlcyBzaG91bGQgb2JzZXJ2
ZSAoQVVJUEMnLCBKQUxSJykKClJlbW90ZSBjb3JlcyBzaG91bGQgbmV2ZXIgZXhlY3V0ZSAoQVVJ
UEMnLEpBTFIpIG9yIChBVUlQQyxKQUxSJykKClRvIGNvcnJlY3RseSBpbXBsZW1lbnQgdGhlIHNv
bHV0aW9uLCB0aGUgdHJhcCByZXR1cm4gY29kZSBtdXN0IG1hdGNoIEpBTFIKYW5kIGFkanVzdCBz
ZXBjIG9ubHkgZm9yIHBhdGNoYWJsZSBmdW5jdGlvbiBlbnRyaWVzLiBUaGlzIGlzIHVuZG9jdW1l
bnRseQpwb3NzaWJsZSBiZWNhdXNlIHdlIHVzZSB0MCBhcyBzb3VyY2UgYW5kIGRlc3RpbmF0aW9u
IHJlZ2lzdGVycyBmb3IgSkFMUgphdCBmdW5jdGlvbiBlbnRyaWVzLiBDb21waWxlciBuZXZlciBn
ZW5lcmF0ZXMgSkFMUiB0aGF0IHVzZXMgdGhlIHNhbWUKcmVnaXN0ZXIgcGF0dGVybi4KCkFub3Ro
ZXIgc29sdXRpb24gaXMgaW5zcGlyZWQgYnkgemNtdCwgYW5kIHBlcmhhcHMgd2UgY2FuIG9wdGlt
aXplIGl0IGlmCnRoZSBoYXJkd2FyZSBkb2VzIHN1cHBvcnQgemNtdC4gRmlyc3QsIHdlIGFsbG9j
YXRlIGEgcGFnZSBhbmQgZGl2aWRlIGl0CmludG8gdHdvIGhhbHZlcy4gVGhlIGZpcnN0IGhhbGYg
b2YgdGhlIHBhZ2UgYXJlIDI1NSB4IDhCIGRlc3RpbmF0aW9uCmFkZHJlc3Nlcy4gVGhlbiwgc3Rh
cnRpbmcgZnJvbSBvZmZzZXQgMjA1NiwgdGhlIHNlY29uZCBoYWxmIG9mIHRoZSBwYWdlCmlzIGNv
bXBvc2VkIGJ5IGEgc2VyaWVzIG9mIDIgeCA0IEJ5dGUgaW5zdHJ1Y3Rpb25zOgoKMDoJZnRyYWNl
X3RyYW1wXzEKODoJZnRyYWNlX3RyYW1wXzIKLi4uCjIwNDA6CWZ0cmFjZV90cmFtcF8yNTUKMjA0
ODoJZnRyYWNlX3RyYW1wXzI1NiAobm90IHVzZWQgd2hlbiBjb25maWd1cmVkIHdpdGggMjU1IHRy
YW1wcykKMjA1NjoKbGQJdDEsIC0yMDQ4KHQxKQpqcgl0MQpsZAl0MSwgLTIwNDgodDEpCmpyCXQx
Ci4uLgo0MDg4OgpsZAl0MSwgLTIwNDgodDEpCmpyCXQxCjQwOTY6CgpJdCBpcyBwb3NzaWJsZSB0
byBleHBhbmQgdG8gNTExIHRyYW1wb2xpbmVzIGJ5IGFkZGluZyBhIHBhZ2UKYmVsb3csIGFuZCBt
YWtpbmcgYSBsb2FkK2pyIHNlcXVlbmNlIGZyb20gKzIwNDAgb2Zmc2V0LgoKV2hlbiB0aGUga2Vy
bmVsIGJvb3RzLCB3ZSBkaXJlY3QgQVVJUENzIGF0IHBhdGNoYWJsZSBlbnRyaWVzIHRvIHRoZSBw
YWdlLAphbmQgZGlzYWJsZSB0aGUgY2FsbCBieSBzZXR0aW5nIHRoZSBzZWNvbmQgaW5zdHJ1Y3Rp
b24gdG8gTk9QNC4gVGhlbiwgd2UKY2FuIGVmZmVjdGl2ZWx5IGVuYWJsZS9kaXNhYmxlL21vZGlm
eSBhIGNhbGwgYnkgc2V0dGluZyBvbmx5IHRoZQppbnN0cnVjdGlvbiBhdCBKQUxSLiBJdCBpcyBw
b3NzaWJsZSB0byB1dGlsaXplIG1vc3Qgb2YgdGhlIGN1cnJlbnQgcGF0Y2gKc2V0IHRvIGFjaGll
dmUgYXRvbWljIHBhdGNoaW5nLiBBIG1pc3NpbmcgcGFydCBpcyB0byBhbGxvY2F0ZSBhbmQgbWFu
YWdlCnRyYW1wb2xpbmVzIGZvciBmdHJhY2UgdXNlcnMuCgpUaGFua3MsCkFuZHkKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
