Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9437C46CD2
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Dec 2023 07:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gwhGnUU+v1XbvCyK/zGt+7NdckC6J0GlhpJfG0pj7eo=; b=S2j6T1HYS7TSHK
	LsRlbrZcoSFRDQC65Mcg00+OuDUcFNV023m6e7HOKzqojHezgt02pERm61NeSpDe6QPOIkZ2qP7FM
	jk9FK0rcqbisvDcfWxamEgJ3A7Finei4gaSvKbwlXOt0Bns4BmXoSQK0AQ2OHNHq8a972bo1VzD/5
	az7VDHnAu9af+UvsOac0QyGNItnbWO0pBxCSeOYnG8q5DJy4YqXywEnlvxZk0VdQLCDZBbp4QdDN4
	dV4wla4XdGtdxdBGIwqtMMhm68XAglY7CF83zoR0gudsnmd+XjMwKmtNH8fCpUb+y+mnBebi5azGi
	sLZh63vp4+c5xSAhgAHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rJUCk-002Mj5-1C;
	Sat, 30 Dec 2023 07:56:22 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rJUCg-002MhH-15
	for linux-riscv@lists.infradead.org;
	Sat, 30 Dec 2023 07:56:19 +0000
Received: by mail-io1-xd32.google.com with SMTP id ca18e2360f4ac-7ba903342c2so507337639f.3
        for <linux-riscv@lists.infradead.org>; Fri, 29 Dec 2023 23:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1703922970; x=1704527770; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/sMoecNT/vWFjebRTXppuzNrFLVfC8SMHVt9ayXTH6k=;
        b=zKWKhoYGzRygWkZBpBMOcRUDx4KrLsOxylYn/fqghHg9nXrovKjQHVdBENg2yBQD4I
         upj18IodIUtTepgokvKePMmn9mDM81R5+c2qOB++Z3O2WRqbGkhYjOTRsxAWg4wW0MmS
         NWP4hSsny0JdcaakwX5RDrGZ+Zxs3uz7+7HDiHfEpolhTb2kAo1yEy+WZ68tBjJJ4WPy
         Y1mkOIhvjYDVC76izWEyykS2LQUNYvnxsRlPjT2uUEWU1EsC3EXY2tuIrggbuAfXRTNk
         5xhDMEsoIBV5T9RbKfJf/1aR3df0LbzfdQA2i7GJVNj1P0TAwSeIdAZx/31iCSqw2xbW
         l74g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703922970; x=1704527770;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/sMoecNT/vWFjebRTXppuzNrFLVfC8SMHVt9ayXTH6k=;
        b=I4rDPJgP/QHyVmv2KRo/eVAmm5+30Fw0XgTi6F6WV5P0Hi1lS5v+OYFX2KmhgBJ5La
         xFgRbqaF2vqudWyPhXzYmzCdBaI/ucVTypxw2YFSI47BlQaHqH4lYFChfjAdOP9thsrl
         Fo3JnL06/HdE+pZc2wohGEjpYr2AOhLtw+dPtQNbGNDLrVTIqP8naYkHU8Vf9Z12TADF
         nthQd7BRbXYhbhWPuIGiyz4WrNAd2sJonia76d5rkMAOLMi04myxF9CYboVE9JfsULg8
         bvtiwI2p/b/AoEUb55WlhNAOsHZx1W68vH7dGsfV05Gnii98yzAE8djJlYvzCOqlPgrF
         G4GA==
X-Gm-Message-State: AOJu0YwUcqJfyBA1A69qb/L3Ys7Wzq1xpJ2+fS8pv+cpvTv5o6Dczb6H
	sWesFMPI92cCcuIOV6JBL/BTJ5Lqmv2jbH4lBytOCiVoV3oMOg==
X-Google-Smtp-Source: AGHT+IGVmlE2QFQ0+dx8lrqZJ+DFVfKaIOwaq4FTrn+jPUMeUqrIhNxtpGBrKoQi6J3FUQbOs5JpKftu96beacssVUk=
X-Received: by 2002:a05:6e02:184b:b0:35f:f59d:f334 with SMTP id
 b11-20020a056e02184b00b0035ff59df334mr17011843ilv.35.1703922970107; Fri, 29
 Dec 2023 23:56:10 -0800 (PST)
MIME-Version: 1.0
References: <20231229214950.4061381-1-atishp@rivosinc.com> <20231229214950.4061381-4-atishp@rivosinc.com>
In-Reply-To: <20231229214950.4061381-4-atishp@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 30 Dec 2023 13:25:59 +0530
Message-ID: <CAAhSdy3HgqPVCjnie-TtOC5uRWVXoZMRAKigvKK1+z0b7VHA2w@mail.gmail.com>
Subject: Re: [v2 03/10] drivers/perf: riscv: Read upper bits of a firmware counter
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atishp@atishpatra.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Will Deacon <will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231229_235618_559985_1AF503D8 
X-CRM114-Status: GOOD (  17.64  )
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

T24gU2F0LCBEZWMgMzAsIDIwMjMgYXQgMzoyMOKAr0FNIEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2
b3NpbmMuY29tPiB3cm90ZToKPgo+IFNCSSB2Mi4wIGludHJvZHVjZWQgYSBleHBsaWNpdCBmdW5j
dGlvbiB0byByZWFkIHRoZSB1cHBlciAzMiBiaXRzCj4gZm9yIGFueSBmaXJtd2FyIGNvdW50ZXIg
d2lkdGggdGhhdCBpcyBsb25nZXIgdGhhbiAzMmJpdHMuCj4gVGhpcyBpcyBvbmx5IGFwcGxpY2Fi
bGUgZm9yIFJWMzIgd2hlcmUgZmlybXdhcmUgY291bnRlciBjYW4gYmUKPiA2NCBiaXQuCj4KPiBB
Y2tlZC1ieTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+Cj4gU2lnbmVkLW9m
Zi1ieTogQXRpc2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+CgpMR1RNLgoKUmV2aWV3ZWQt
Ynk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpSZWdhcmRzLApBbnVwCgo+IC0t
LQo+ICBkcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jIHwgMjAgKysrKysrKysrKysrKysrKy0t
LS0KPiAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYyBiL2RyaXZlcnMvcGVy
Zi9yaXNjdl9wbXVfc2JpLmMKPiBpbmRleCAxNmFjZDRkY2RiOTYuLjY0NjYwNGY4YzBhNSAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jCj4gKysrIGIvZHJpdmVycy9w
ZXJmL3Jpc2N2X3BtdV9zYmkuYwo+IEBAIC0zNSw2ICszNSw4IEBACj4gIFBNVV9GT1JNQVRfQVRU
UihldmVudCwgImNvbmZpZzowLTQ3Iik7Cj4gIFBNVV9GT1JNQVRfQVRUUihmaXJtd2FyZSwgImNv
bmZpZzo2MyIpOwo+Cj4gK3N0YXRpYyBib29sIHNiaV92Ml9hdmFpbGFibGU7Cj4gKwo+ICBzdGF0
aWMgc3RydWN0IGF0dHJpYnV0ZSAqcmlzY3ZfYXJjaF9mb3JtYXRzX2F0dHJbXSA9IHsKPiAgICAg
ICAgICZmb3JtYXRfYXR0cl9ldmVudC5hdHRyLAo+ICAgICAgICAgJmZvcm1hdF9hdHRyX2Zpcm13
YXJlLmF0dHIsCj4gQEAgLTQ4OCwxNiArNDkwLDIzIEBAIHN0YXRpYyB1NjQgcG11X3NiaV9jdHJf
cmVhZChzdHJ1Y3QgcGVyZl9ldmVudCAqZXZlbnQpCj4gICAgICAgICBzdHJ1Y3QgaHdfcGVyZl9l
dmVudCAqaHdjID0gJmV2ZW50LT5odzsKPiAgICAgICAgIGludCBpZHggPSBod2MtPmlkeDsKPiAg
ICAgICAgIHN0cnVjdCBzYmlyZXQgcmV0Owo+IC0gICAgICAgdW5pb24gc2JpX3BtdV9jdHJfaW5m
byBpbmZvOwo+ICAgICAgICAgdTY0IHZhbCA9IDA7Cj4gKyAgICAgICB1bmlvbiBzYmlfcG11X2N0
cl9pbmZvIGluZm8gPSBwbXVfY3RyX2xpc3RbaWR4XTsKPgo+ICAgICAgICAgaWYgKHBtdV9zYmlf
aXNfZndfZXZlbnQoZXZlbnQpKSB7Cj4gICAgICAgICAgICAgICAgIHJldCA9IHNiaV9lY2FsbChT
QklfRVhUX1BNVSwgU0JJX0VYVF9QTVVfQ09VTlRFUl9GV19SRUFELAo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgaHdjLT5pZHgsIDAsIDAsIDAsIDAsIDApOwo+IC0gICAgICAgICAg
ICAgICBpZiAoIXJldC5lcnJvcikKPiAtICAgICAgICAgICAgICAgICAgICAgICB2YWwgPSByZXQu
dmFsdWU7Cj4gKyAgICAgICAgICAgICAgIGlmIChyZXQuZXJyb3IpCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgcmV0dXJuIHZhbDsKPiArCj4gKyAgICAgICAgICAgICAgIHZhbCA9IHJldC52YWx1
ZTsKPiArICAgICAgICAgICAgICAgaWYgKElTX0VOQUJMRUQoQ09ORklHXzMyQklUKSAmJiBzYmlf
djJfYXZhaWxhYmxlICYmIGluZm8ud2lkdGggPj0gMzIpIHsKPiArICAgICAgICAgICAgICAgICAg
ICAgICByZXQgPSBzYmlfZWNhbGwoU0JJX0VYVF9QTVUsIFNCSV9FWFRfUE1VX0NPVU5URVJfRldf
UkVBRF9ISSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaHdjLT5p
ZHgsIDAsIDAsIDAsIDAsIDApOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIGlmICghcmV0LmVy
cm9yKQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdmFsIHw9ICgodTY0KXJldC52
YWx1ZSA8PCAzMik7Cj4gKyAgICAgICAgICAgICAgIH0KPiAgICAgICAgIH0gZWxzZSB7Cj4gLSAg
ICAgICAgICAgICAgIGluZm8gPSBwbXVfY3RyX2xpc3RbaWR4XTsKPiAgICAgICAgICAgICAgICAg
dmFsID0gcmlzY3ZfcG11X2N0cl9yZWFkX2NzcihpbmZvLmNzcik7Cj4gICAgICAgICAgICAgICAg
IGlmIChJU19FTkFCTEVEKENPTkZJR18zMkJJVCkpCj4gICAgICAgICAgICAgICAgICAgICAgICAg
dmFsID0gKCh1NjQpcmlzY3ZfcG11X2N0cl9yZWFkX2NzcihpbmZvLmNzciArIDB4ODApKSA8PCAz
MSB8IHZhbDsKPiBAQCAtMTEwOCw2ICsxMTE3LDkgQEAgc3RhdGljIGludCBfX2luaXQgcG11X3Ni
aV9kZXZpbml0KHZvaWQpCj4gICAgICAgICAgICAgICAgIHJldHVybiAwOwo+ICAgICAgICAgfQo+
Cj4gKyAgICAgICBpZiAoc2JpX3NwZWNfdmVyc2lvbiA+PSBzYmlfbWtfdmVyc2lvbigyLCAwKSkK
PiArICAgICAgICAgICAgICAgc2JpX3YyX2F2YWlsYWJsZSA9IHRydWU7Cj4gKwo+ICAgICAgICAg
cmV0ID0gY3B1aHBfc2V0dXBfc3RhdGVfbXVsdGkoQ1BVSFBfQVBfUEVSRl9SSVNDVl9TVEFSVElO
RywKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJwZXJmL3Jpc2N2L3Bt
dTpzdGFydGluZyIsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwbXVf
c2JpX3N0YXJ0aW5nX2NwdSwgcG11X3NiaV9keWluZ19jcHUpOwo+IC0tCj4gMi4zNC4xCj4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
