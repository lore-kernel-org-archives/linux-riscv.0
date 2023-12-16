Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54EECC46CD2
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Dec 2023 23:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dVB/jL0w0e+Nc35jSLXRgSfBtfg0C7NLfivTCUXcnsY=; b=FYgoZzSiB9xLYr
	wUVAPTmNzi+JpMSFFGGIZzK3WsJhqaXEsdkDhEsqdCMpHDeNplpK1n588UJuJybQNmPLArYlEasjm
	FcqEuGbp1owQCYQD3yHwPL0arty0xl6AxBy0lCbNKFCfhzakmX3wFOYTFYWm7nlpfMACqi8n9ghkl
	WHvhyrEr5AG3tXZdvGjpgZTn9PDoSZV51cirD9sHFJDDTSNOzrqFGhvpHb+6ZD9WvulCVCxEwRkjr
	TTH4Ln5URhSYz8mvYyfOiUELMnuzQ/eHT8GZYpgaHIkqdftv6KoAhVI/WABymGSLf3u65nDKLz7t9
	CbemeHTrkS1I5MFrVZkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEeUB-006rre-2Q;
	Sat, 16 Dec 2023 23:54:24 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEeU8-006rqj-00
	for linux-riscv@lists.infradead.org;
	Sat, 16 Dec 2023 23:54:22 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-50e3213cce0so232163e87.0
        for <linux-riscv@lists.infradead.org>; Sat, 16 Dec 2023 15:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702770857; x=1703375657; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zrVvV1utl9GFRZ2LZ5WcICVBPuOzU+o2aQHc1q2IHuo=;
        b=oLi0biFOG4gJgWEv6wIwdojvEAFbdn4bgt61762f90yQXCX+rLa4u0kGVqHxdAPPR6
         He8ULMxyQ9+KZGlvku1rEC2rrLO2RS6rkLp6bPXFm8xIpIoDhcbiFFBEvgyfZ4berKiP
         NMb4DYKrg+fHMomPDdDjN0us+lZc0Y8eoa9MN/AXyC2Pyv211K73/okp5QsrMBE2OHdb
         XY0/cmM2DTRPhvtuY6bO02QBtW8OePom/wZ/G73/LH4mEiE2HlHfW47HLQC5FIYFOysX
         g0oMD2ImUM0/4mERV9ibey6X/Wecy4BIYVYnuFdhYbPd1HStmXSDogrUuaQOxXwf5qGy
         pQag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702770857; x=1703375657;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zrVvV1utl9GFRZ2LZ5WcICVBPuOzU+o2aQHc1q2IHuo=;
        b=GVu2jghO/c6vDZfaGpDjxYfnPihFD6FOIgGslhcOdjGmxlKm0cPCHmnuNkN1503/Gq
         JSoYS2053fi84Wv58FQ1E5MfncoX89EXSxZwVnx54DDCY7JYodpRxP71uZhiF+bYbanM
         ud3dRFe1eCk27WCF04BuH4IIhGkyVfiu0uS9ly1LAWVYORE/lNukzD7cgeJZgU4HiYQ1
         Nwd2vHpNlXuEucWB6oTdthXSVU30DSPj9sscRuWLOjSsrubFEWN5o28ILgvqSudXJCQa
         jwaKOsSj+apS8PUen2gRQvX+2adJGzjWdQb2htmcOw5xHNO8+BS/lQidOc/iTRPGcNMX
         +8tw==
X-Gm-Message-State: AOJu0YwklRJGCvZEe6MGXsbX1CLJs8wnsUB0IxCleug8qE7Vfkkk6HwU
	VUEGP935me2tQeo6DuaLhnx02RbmmSPPdnNd4ng/Tw==
X-Google-Smtp-Source: AGHT+IHCk7xG4MDxAwpDBg6B7k1zu+srSh/WBB8mQwajIiQw78mVZPMw1Rp9thftw8ABC4FzjfI8TzSLAb+wvu2Wd2o=
X-Received: by 2002:ac2:4c4f:0:b0:50e:17ea:905 with SMTP id
 o15-20020ac24c4f000000b0050e17ea0905mr3172436lfk.91.1702770857122; Sat, 16
 Dec 2023 15:54:17 -0800 (PST)
MIME-Version: 1.0
References: <20231205024310.1593100-1-atishp@rivosinc.com> <20231205024310.1593100-5-atishp@rivosinc.com>
 <20231207-fidgeting-plywood-8347d9d346be@wendy> <CAAhSdy3yK8CoQGZYT6j_xiKozt8viVXHogqVzUS7TxHs2Q_0Tw@mail.gmail.com>
In-Reply-To: <CAAhSdy3yK8CoQGZYT6j_xiKozt8viVXHogqVzUS7TxHs2Q_0Tw@mail.gmail.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Sat, 16 Dec 2023 15:54:06 -0800
Message-ID: <CAHBxVyGs0kry-d1jcKWmR_AXm41hrUuvXAZxk+ht-AXS28mZqA@mail.gmail.com>
Subject: Re: [RFC 4/9] drivers/perf: riscv: Read upper bits of a firmware counter
To: Anup Patel <anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231216_155420_366332_4EE2FDB3 
X-CRM114-Status: GOOD (  36.14  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, kvm@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBEZWMgMTQsIDIwMjMgYXQgNDozMOKAr0FNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+IHdyb3RlOgo+Cj4gT24gVGh1LCBEZWMgNywgMjAyMyBhdCA2OjAz4oCvUE0gQ29u
b3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24g
TW9uLCBEZWMgMDQsIDIwMjMgYXQgMDY6NDM6MDVQTSAtMDgwMCwgQXRpc2ggUGF0cmEgd3JvdGU6
Cj4gPiA+IFNCSSB2Mi4wIGludHJvZHVjZWQgYSBleHBsaWNpdCBmdW5jdGlvbiB0byByZWFkIHRo
ZSB1cHBlciBiaXRzCj4gPiA+IGZvciBhbnkgZmlybXdhciBjb3VudGVyIHdpZHRoIHRoYXQgaXMg
bG9uZ2VyIHRoYW4gWExFTi4gQ3VycmVudGx5LAo+ID4gPiB0aGlzIGlzIG9ubHkgYXBwbGljYWJs
ZSBmb3IgUlYzMiB3aGVyZSBmaXJtd2FyZSBjb3VudGVyIGNhbiBiZQo+ID4gPiA2NCBiaXQuCj4g
Pgo+ID4gVGhlIHYyLjAgc3BlYyBleHBsaWNpdGx5IHNheXMgdGhhdCB0aGlzIGZ1bmN0aW9uIHJl
dHVybnMgdGhlIHVwcGVyCj4gPiAzMiBiaXRzIG9mIHRoZSBjb3VudGVyIGZvciBydjMyIGFuZCB3
aWxsIGFsd2F5cyByZXR1cm4gMCBmb3IgcnY2NAo+ID4gb3IgaGlnaGVyLiBUaGUgY29tbWl0IG1l
c3NhZ2UgaGVyZSBzZWVtcyBvdmVybHkgZ2VuZXJpYyBjb21wYXJlZCB0bwo+ID4gdGhlIGFjdHVh
bCBkZWZpbml0aW9uIGluIHRoZSBzcGVjLCBhbmQgbWFrZXMgaXQgc2VlbSBsaWtlIGl0IGNvdWxk
Cj4gPiBiZSB1c2VkIHdpdGggYSAxMjggYml0IGNvdW50ZXIgb24gcnY2NCB0byBnZXQgdGhlIHVw
cGVyIDY0IGJpdHMuCj4gPgo+ID4gSSB0cmllZCB0byB0aGluayBhYm91dCB3aGF0ICJnZW5lcmlj
IiBzaXR1YXRpb24gdGhlIGNvbW1pdCBtZXNzYWdlCj4gPiBoYWQgYmVlbiB3cml0dGVuIGZvciwg
YnV0IHRoZSB0aGluZ3MgSSBjYW1lIHVwIHdpdGggd291bGQgYWxsIHJlcXVpcmUKPiA+IGNoYW5n
ZXMgdG8gdGhlIHNwZWMgdG8gZGVmaW5lIGJlaGF2aW91ciBmb3IgRklEICM1IGFuZC9vciBGSUQg
IzEsIHNvCj4gPiBpbiB0aGUgZW5kIEkgY291bGRuJ3QgZmlndXJlIG91dCB0aGUgcmF0aW9uYWxl
IGJlaGluZCB0aGUgbm9uLWNvbW1pdHRhbAo+ID4gd29yZGluZyB1c2VkIGhlcmUuCj4gPgpUaGUg
aW50ZW50aW9uIHdhcyB0byBzaG93IHRoYXQgdGhpcyBjYW4gYmUgZXh0ZW5kZWQgaW4gdGhlIGZ1
dHVyZSBmb3IKb3RoZXIgWExFTiBzeXN0ZW1zCihvYnZpb3VzbHkgd2l0aCBzcGVjIG1vZGlmaWNh
dGlvbikuIEJ1dCBJIGdvdCB5b3VyIHBvaW50LiBXZSBjYW4KdXBkYXRlIGl0IHdoZW5ldmVyIHdl
IGhhdmUKc3VjaCBzeXN0ZW1zIGFuZCB0aGUgc3BlYy4gTW9kaWZpZWQgdGhlIGNvbW1pdCB0ZXh0
IHRvIG1hdGNoIHdoYXQgaXMKaW4gdGhlIHNwZWMgLgoKPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1i
eTogQXRpc2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgZHJp
dmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYyB8IDExICsrKysrKysrKy0tCj4gPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4gPgo+ID4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYyBiL2RyaXZlcnMvcGVyZi9yaXNj
dl9wbXVfc2JpLmMKPiA+ID4gaW5kZXggNDBhMzM1MzUwZDA4Li4xYzkwNDllNmI1NzQgMTAwNjQ0
Cj4gPiA+IC0tLSBhL2RyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMKPiA+ID4gKysrIGIvZHJp
dmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYwo+ID4gPiBAQCAtNDkwLDE2ICs0OTAsMjMgQEAgc3Rh
dGljIHU2NCBwbXVfc2JpX2N0cl9yZWFkKHN0cnVjdCBwZXJmX2V2ZW50ICpldmVudCkKPiA+ID4g
ICAgICAgc3RydWN0IGh3X3BlcmZfZXZlbnQgKmh3YyA9ICZldmVudC0+aHc7Cj4gPiA+ICAgICAg
IGludCBpZHggPSBod2MtPmlkeDsKPiA+ID4gICAgICAgc3RydWN0IHNiaXJldCByZXQ7Cj4gPiA+
IC0gICAgIHVuaW9uIHNiaV9wbXVfY3RyX2luZm8gaW5mbzsKPiA+ID4gICAgICAgdTY0IHZhbCA9
IDA7Cj4gPiA+ICsgICAgIHVuaW9uIHNiaV9wbXVfY3RyX2luZm8gaW5mbyA9IHBtdV9jdHJfbGlz
dFtpZHhdOwo+ID4gPgo+ID4gPiAgICAgICBpZiAocG11X3NiaV9pc19md19ldmVudChldmVudCkp
IHsKPiA+ID4gICAgICAgICAgICAgICByZXQgPSBzYmlfZWNhbGwoU0JJX0VYVF9QTVUsIFNCSV9F
WFRfUE1VX0NPVU5URVJfRldfUkVBRCwKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgaHdjLT5pZHgsIDAsIDAsIDAsIDAsIDApOwo+ID4gPiAgICAgICAgICAgICAgIGlmICghcmV0
LmVycm9yKQo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgdmFsID0gcmV0LnZhbHVlOwo+ID4g
PiArI2lmIGRlZmluZWQoQ09ORklHXzMyQklUKQo+ID4KPiA+IFdoeSBpcyB0aGlzIG5vdCBJU19F
TkFCTEVEKCk/IFRoZSBjb2RlIGJlbG93IHVzZXMgb25lLiBZb3UgY291bGQgdGhlbgo+ID4gZm9s
ZCBpdCBpbnRvIHRoZSBpZiBzdGF0ZW1lbnQgYmVsb3cuCj4gPgoKRG9uZS4KCj4gPiA+ICsgICAg
ICAgICAgICAgaWYgKHNiaV92Ml9hdmFpbGFibGUgJiYgaW5mby53aWR0aCA+PSAzMikgewo+ID4K
PiA+ICA+PSAzMj8gSSBrbm93IGl0IGlzIGZyb20gdGhlIHNwZWMsIGJ1dCB3aHkgZG9lcyB0aGUg
c3BlYyBkZWZpbmUgaXQgYXMKPiA+ICAiT25lIGxlc3MgdGhhbiBudW1iZXIgb2YgYml0cyBpbiBD
U1IiPyBTYXZpbmcgYml0cyBpbiB0aGUgc3RydWN0dXJlIEkKPiA+ICBndWVzcz8KPgo+IFllcywg
aXQgaXMgZm9yIHVzaW5nIGZld2VyIGJpdHMgaW4gY291bnRlcl9pbmZvLgo+Cj4gVGhlIG1heGlt
dW0gd2lkdGggb2YgYSBIVyBjb3VudGVyIGlzIDY0IGJpdHMuIFRoZSBhYnNvbHV0ZSB2YWx1ZSA2
NAo+IHJlcXVpcmVzIDcgYml0cyBpbiBjb3VudGVyX2luZm8gd2hlcmVhcyBhYnNvbHV0ZSB2YWx1
ZSA2MyByZXF1aXJlcyA2IGJpdHMKPiBpbiBjb3VudGVyX2luZm8uIEFsc28sIGEgSFcgY291bnRl
ciBpZiBpdCBleGlzdHMgd2lsbCBoYXZlIGF0IGxlYXN0IDEgYml0Cj4gaW1wbGVtZW50ZWQgb3Ro
ZXJ3aXNlIHRoZSBIVyBjb3VudGVyIGRvZXMgbm90IGV4aXN0Lgo+Cj4gUmVnYXJkcywKPiBBbnVw
Cj4KPiA+Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICByZXQgPSBzYmlfZWNhbGwoU0JJX0VY
VF9QTVUsIFNCSV9FWFRfUE1VX0NPVU5URVJfRldfUkVBRF9ISSwKPiA+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBod2MtPmlkeCwgMCwgMCwgMCwgMCwgMCk7Cj4gPgo+
ID4gPiArICAgICAgICAgICAgICAgICAgICAgaWYgKCFyZXQuZXJyb3IpCj4gPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHZhbCA9IHZhbCB8ICgodTY0KXJldC52YWx1ZSA8PCAzMik7
Cj4gPgo+ID4gSWYgdGhlIGZpcnN0IGVjYWxsIGZhaWxzIGJ1dCB0aGUgc2Vjb25kIG9uZSBkb2Vz
bid0IHdvbid0IHdlIGNvcnJ1cHQKPiA+IHZhbCBieSBvbmx5IHNldHRpbmcgdGhlIHVwcGVyIGJp
dHM/IElmIHJldHVybmluZyB2YWwgPT0gMCBpcyB0aGUgdGhpbmcKPiA+IHRvIGRvIGluIHRoZSBl
cnJvciBjYXNlICh3aGljaCBpdCBpcyBpbiB0aGUgZXhpc3RpbmcgY29kZSkgc2hvdWxkIHRoZQo+
ID4gZmlyc3QgYGlmICghcmV0LmVycm9yKWAgYmVjb21lIGBpZiAocmV0LmVycm9yKWAgLT4gYHJl
dHVybiAwYD8KPiA+CgpTdXJlLiBGaXhlZCBpdC4KCj4gPgo+ID4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB2YWwgPSB2YWwgfCAoKHU2NClyZXQudmFsdWUgPDwgMzIpOwo+ID4KPiA+
IEFsc28sIHw9ID8KPiA+CgpEb25lLgoKCj4gPiBDaGVlcnMsCj4gPiBDb25vci4KPiA+Cj4gPiA+
ICsgICAgICAgICAgICAgfQo+ID4gPiArI2VuZGlmCj4gPiA+ICAgICAgIH0gZWxzZSB7Cj4gPiA+
IC0gICAgICAgICAgICAgaW5mbyA9IHBtdV9jdHJfbGlzdFtpZHhdOwo+ID4gPiAgICAgICAgICAg
ICAgIHZhbCA9IHJpc2N2X3BtdV9jdHJfcmVhZF9jc3IoaW5mby5jc3IpOwo+ID4gPiAgICAgICAg
ICAgICAgIGlmIChJU19FTkFCTEVEKENPTkZJR18zMkJJVCkpCj4gPiA+ICAgICAgICAgICAgICAg
ICAgICAgICB2YWwgPSAoKHU2NClyaXNjdl9wbXVfY3RyX3JlYWRfY3NyKGluZm8uY3NyICsgMHg4
MCkpIDw8IDMxIHwgdmFsOwo+ID4gPiAtLQo+ID4gPiAyLjM0LjEKPiA+ID4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
