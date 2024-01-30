Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B52AC47DA9
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 02:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qsfQ2ca20EZdmdEcJJ4ZPEPekXrdAFdIsXnqqx6duxc=; b=qtO2IH0Zz6xLHq
	dWhmyQ6mdKkl+jf62vxuUlqmns9/stw6GCb2iDWd9G7Uz0pTwutLGcVq5MH4GJc/r+8u7nMYjx9Io
	fB4N+M0R/jW00uDgvllmXiSDvbz1HAG85deGIgKJPM/VFvXKMqsP1oyC7I1zCYJpEsKkELRoBo4Fb
	m9QWNzsYUHUF2gq49i2y7stdjDvDq8xVYBovmwkSOh4oUl7999hjfUiv5pLeAElpBw0SlbccQAC4H
	+VAY54is1N2KGo/WO7RXXw/81892QpPvsEH7Dr2/HbfI2KrWprbaq6td4s2Zomisb8K56y75ytFx2
	TbNX3j53MktxS1lIM5uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUeD6-0000000F1nE-48o4;
	Tue, 30 Jan 2024 02:50:52 +0000
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUeD2-0000000F1ly-1l9r
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 02:50:50 +0000
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-210ce33ea1aso1775537fac.0
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jan 2024 18:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706583046; x=1707187846; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I4kmLD/ZHgJFQzacfvJ5aXtIPI3Q8g9U5l7cj/1gwss=;
        b=xrDbIljzzxemnjV5lKtXjmey8/7AN5y7QMjwndoE4TCN5VklcZLpsId3IRdQAPcmGx
         NgwHx7P/v+UQFOSX4jTMuHx6CAqKBRoRDJe0YZEGEJtNuD9+GvRuqmwVyidNznkxLxVv
         kyzJRcGsqqWz2Vg8gz8I+xgTeEebi9CBPhwYUqUhKX97KSFgIm/eNGqqc8TsUStqZkW1
         WBAdNk2toSjjeFCJbSV41T+uRhS95YM8KB2jztVHfrNVTu7r2orXYgHbnkqJhJZkiwIC
         aADpQ43qD3irJU7dJOHfgh5A/efeT21l1QHpqUeE3D3j4QpRU4hKo5Ys55S878NrUnof
         I/dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706583046; x=1707187846;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I4kmLD/ZHgJFQzacfvJ5aXtIPI3Q8g9U5l7cj/1gwss=;
        b=suNXOMYOmK7woVDphSe+Ahss137uyBd5F+Ipa9NXuspSMZiGuAntiD6fYg8NhJyt8q
         zaqCHZW5BviL5wrXwGtfjsrnqhjH56s2uYYDxkjJugkx8awpcDXijohAhj5khfkbNfRc
         V0ogJKzvQKPIFa+fIUHpGnDJbFpj5Ux8rmyv5X8AsDk5KHV7R9kmhh7W/yhzijHZq950
         eKJFENUs6BRml8b07P+omTrOT6JWLhvCyk0VMTIl8YO1JMJwEudP5+dDu9X7zOHLyNt1
         kUXVjLN7CwSC3QtVu9CKLf51POxYbYnvgEJaCemo4KeSqwROyl0kGdB1mF+gpGhmbtSD
         cYjg==
X-Gm-Message-State: AOJu0YwaW/gfc+ETlJCgAB9Wk6ujIY3Atf6z3Ay+3wIstxSBR35ZNxCE
	pInXuhQdl3jpHY8GGqsRiu4qnXUauZjfDscjipd+fC56SW+s2UXoKw/2TqeO9FM=
X-Google-Smtp-Source: AGHT+IHVIhbQGSEna5MN4n3vgllTv+oL5jn7aTe6nq6Ie2BpSyHZw7jYc/tSHXwtTS+M7cDDGwEHmw==
X-Received: by 2002:a05:6358:796:b0:178:76b3:58d8 with SMTP id n22-20020a056358079600b0017876b358d8mr3227466rwj.38.1706583046256;
        Mon, 29 Jan 2024 18:50:46 -0800 (PST)
Received: from ghost (mobile-166-137-160-039.mycingular.net. [166.137.160.39])
        by smtp.gmail.com with ESMTPSA id y12-20020aa7854c000000b006dbd3aec001sm6794293pfn.146.2024.01.29.18.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 18:50:45 -0800 (PST)
Date: Mon, 29 Jan 2024 18:50:41 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Yangyu Chen <cyy@cyyself.name>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/3] riscv: mm: Use hint address in mmap if available
Message-ID: <ZbhkAUf+h7sK71Rs@ghost>
References: <20240129-use_mmap_hint_address-v1-0-4c74da813ba1@rivosinc.com>
 <20240129-use_mmap_hint_address-v1-1-4c74da813ba1@rivosinc.com>
 <tencent_F34C3BC7F1077728A62E84A7D183EF5BF005@qq.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <tencent_F34C3BC7F1077728A62E84A7D183EF5BF005@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_185048_489845_B6897DED 
X-CRM114-Status: GOOD (  35.65  )
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

T24gVHVlLCBKYW4gMzAsIDIwMjQgYXQgMTA6MzQ6MDNBTSArMDgwMCwgWWFuZ3l1IENoZW4gd3Jv
dGU6Cj4gCj4gPiBPbiBKYW4gMzAsIDIwMjQsIGF0IDA4OjM3LCBDaGFybGllIEplbmtpbnMgPGNo
YXJsaWVAcml2b3NpbmMuY29tPiB3cm90ZToKPiA+IAo+ID4gT24gcmlzY3YgaXQgaXMgZ3VhcmFu
dGVlZCB0aGF0IHRoZSBhZGRyZXNzIHJldHVybmVkIGJ5IG1tYXAgaXMgbGVzcyB0aGFuCj4gPiB0
aGUgaGludCBhZGRyZXNzLiBBbGxvdyBtbWFwIHRvIHJldHVybiBhbiBhZGRyZXNzIGFsbCB0aGUg
d2F5IHVwIHRvCj4gPiBhZGRyLCBpZiBwcm92aWRlZCwgcmF0aGVyIHRoYW4ganVzdCB1cCB0byB0
aGUgbG93ZXIgYWRkcmVzcyBzcGFjZS4KPiA+IAo+ID4gVGhpcyBwcm92aWRlcyBhIHBlcmZvcm1h
bmNlIGJlbmVmaXQgYXMgd2VsbCwgYWxsb3dpbmcgbW1hcCB0byBleGl0IGFmdGVyCj4gPiBjaGVj
a2luZyB0aGF0IHRoZSBhZGRyZXNzIGlzIGluIHJhbmdlIHJhdGhlciB0aGFuIHNlYXJjaGluZyBm
b3IgYSB2YWxpZAo+ID4gYWRkcmVzcy4KPiA+IAo+ID4gSXQgaXMgcG9zc2libGUgdG8gcHJvdmlk
ZSBhbiBhZGRyZXNzIHRoYXQgdXNlcyBhdCBtb3N0IHRoZSBzYW1lIG51bWJlcgo+ID4gb2YgYml0
cywgaG93ZXZlciBpdCBpcyBzaWduaWZpY2FudGx5IG1vcmUgY29tcHV0YXRpb25hbGx5IGV4cGVu
c2l2ZSB0bwo+ID4gcHJvdmlkZSB0aGF0IG51bWJlciByYXRoZXIgdGhhbiBzZXR0aW5nIHRoZSBt
YXggdG8gYmUgdGhlIGhpbnQgYWRkcmVzcy4KPiA+IFRoZXJlIGlzIHRoZSBpbnN0cnVjdGlvbiBj
bHovY2x6dyBpbiBaYmIgdGhhdCByZXR1cm5zIHRoZSBoaWdoZXN0IHNldCBiaXQKPiA+IHdoaWNo
IGNvdWxkIGJlIHVzZWQgdG8gcGVyZm9ybWFudGx5IGltcGxlbWVudCB0aGlzLCBidXQgaXQgd291
bGQgc3RpbGwKPiA+IGJlIHNsb3dlciB0aGFuIHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uLiBB
dCB3b3JzdCBjYXNlLCBoYWxmIG9mIHRoZQo+ID4gYWRkcmVzcyB3b3VsZCBub3QgYmUgYWJsZSB0
byBiZSBhbGxvY2F0ZWQgd2hlbiBhIGhpbnQgYWRkcmVzcyBpcwo+ID4gcHJvdmlkZWQuCj4gPiAK
PiA+IFNpZ25lZC1vZmYtYnk6IENoYXJsaWUgSmVua2lucyA8Y2hhcmxpZUByaXZvc2luYy5jb20+
Cj4gPiAtLS0KPiA+IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHJvY2Vzc29yLmggfCAyMSArKysr
KysrKy0tLS0tLS0tLS0tLS0KPiA+IDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDEz
IGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9wcm9jZXNzb3IuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHJvY2Vzc29yLmgKPiA+IGlu
ZGV4IGYxOWY4NjFjZGE1NC4uZjNlYTUxNjZlM2IyIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaAo+ID4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9wcm9jZXNzb3IuaAo+ID4gQEAgLTIyLDE0ICsyMiwxMSBAQAo+ID4gKHsgXAo+ID4gdW5zaWdu
ZWQgbG9uZyBtbWFwX2VuZDsgXAo+ID4gdHlwZW9mKGFkZHIpIF9hZGRyID0gKGFkZHIpOyBcCj4g
PiAtIGlmICgoX2FkZHIpID09IDAgfHwgKElTX0VOQUJMRUQoQ09ORklHX0NPTVBBVCkgJiYgaXNf
Y29tcGF0X3Rhc2soKSkpIFwKPiA+IC0gbW1hcF9lbmQgPSBTVEFDS19UT1BfTUFYOyBcCj4gPiAt
IGVsc2UgaWYgKChfYWRkcikgPj0gVkFfVVNFUl9TVjU3KSBcCj4gPiAtIG1tYXBfZW5kID0gU1RB
Q0tfVE9QX01BWDsgXAo+ID4gLSBlbHNlIGlmICgoKChfYWRkcikgPj0gVkFfVVNFUl9TVjQ4KSkg
JiYgKFZBX0JJVFMgPj0gVkFfQklUU19TVjQ4KSkgXAo+ID4gLSBtbWFwX2VuZCA9IFZBX1VTRVJf
U1Y0ODsgXAo+ID4gKyBpZiAoKF9hZGRyKSA9PSAwIHx8IFwKPiA+ICsgKElTX0VOQUJMRUQoQ09O
RklHX0NPTVBBVCkgJiYgaXNfY29tcGF0X3Rhc2soKSkgfHwgXAo+ID4gKyAoKF9hZGRyICsgbGVu
KSA+IEJJVChWQV9CSVRTIC0gMSkpKSBcCj4gCj4gSG93IGFib3V0IHJlcGxhY2luZyBCSVQoVkFf
QklUUy0xKSB0byBERUZBVUxUX01BUF9XSU5ET1cgdG8gbWFrZSB0aGUgY29kZQo+IG1vcmUgZ2Vu
ZXJhbC4KPiAKPiA+IGVsc2UgXAo+ID4gLSBtbWFwX2VuZCA9IFZBX1VTRVJfU1YzOTsgXAo+ID4g
KyBtbWFwX2VuZCA9IChfYWRkciArIGxlbik7IFwKPiA+IG1tYXBfZW5kOyBcCj4gPiB9KQo+ID4g
Cj4gPiBAQCAtMzksMTQgKzM2LDEyIEBACj4gPiB0eXBlb2YoYWRkcikgX2FkZHIgPSAoYWRkcik7
IFwKPiA+IHR5cGVvZihiYXNlKSBfYmFzZSA9IChiYXNlKTsgXAo+ID4gdW5zaWduZWQgbG9uZyBy
bmRfZ2FwID0gREVGQVVMVF9NQVBfV0lORE9XIC0gKF9iYXNlKTsgXAo+ID4gLSBpZiAoKF9hZGRy
KSA9PSAwIHx8IChJU19FTkFCTEVEKENPTkZJR19DT01QQVQpICYmIGlzX2NvbXBhdF90YXNrKCkp
KSBcCj4gPiArIGlmICgoX2FkZHIpID09IDAgfHwgXAo+ID4gKyAgICAoSVNfRU5BQkxFRChDT05G
SUdfQ09NUEFUKSAmJiBpc19jb21wYXRfdGFzaygpKSB8fCBcCj4gPiArICAgICgoX2FkZHIgKyBs
ZW4pID4gQklUKFZBX0JJVFMgLSAxKSkpIFwKPiAKPiBTYW1lIGhlcmUuCj4gCj4gPiBtbWFwX2Jh
c2UgPSAoX2Jhc2UpOyBcCj4gPiAtIGVsc2UgaWYgKCgoX2FkZHIpID49IFZBX1VTRVJfU1Y1Nykg
JiYgKFZBX0JJVFMgPj0gVkFfQklUU19TVjU3KSkgXAo+ID4gLSBtbWFwX2Jhc2UgPSBWQV9VU0VS
X1NWNTcgLSBybmRfZ2FwOyBcCj4gPiAtIGVsc2UgaWYgKCgoKF9hZGRyKSA+PSBWQV9VU0VSX1NW
NDgpKSAmJiAoVkFfQklUUyA+PSBWQV9CSVRTX1NWNDgpKSBcCj4gPiAtIG1tYXBfYmFzZSA9IFZB
X1VTRVJfU1Y0OCAtIHJuZF9nYXA7IFwKPiA+IGVsc2UgXAo+ID4gLSBtbWFwX2Jhc2UgPSBWQV9V
U0VSX1NWMzkgLSBybmRfZ2FwOyBcCj4gPiArIG1tYXBfYmFzZSA9IChfYWRkciArIGxlbikgLSBy
bmRfZ2FwOyBcCj4gPiBtbWFwX2Jhc2U7IFwKPiA+IH0pCj4gPiAKPiA+IAo+IAo+IFdoYXQgYWJv
dXQgbm90IHNldHRpbmcgdGhlIHVwcGVyIGJvdW5kIGFzIHg4Ni9hcm0vcG93ZXJwYyBhcyBbMV0g
ZGlkPwo+IEluIHRoaXMgY2FzZSwgdXNlciBzcGFjZSBjYW4gZGlyZWN0bHkgcGFzcyBhIGNvbnN0
YW50IGhpbnQgYWRkcmVzcyA+Cj4gQklUKDQ3KSB0byBnZXQgYSBtYXBwaW5nIGluIHN2NTcuIElm
IHlvdSB3YW50IHRoaXMsIHRoaXMgY29kZSBhbHNvIGFsbG93cwo+IHVzZXItc3BhY2UgdG8gcGFz
cyBhbnkgYWRkcmVzcyBsYXJnZXIgdGhhbiBUQVNLX1NJWkUuIFlvdSBzaG91bGQgYWxzbwo+IGxp
bWl0IHRoZSBtbWFwX2Jhc2UgdG8gKGJhc2UpICsgVEFTS19TSVpFIC0gREVGQVVMVF9NQVBfV0lO
RE9XLgoKTm8uIFRoaXMgc3VnZ2VzdGlvbiBjYXVzZXMgYSByYW5kb20gYWRkcmVzcyB0byBiZSB1
c2VkIGlmIHRoZSBoaW50CmFkZHJlc3MgaXMgbm90IGF2YWlsYWJsZS4gVGhhdCBpcyB3aHkgSSBk
aWRuJ3Qgc2ltcGx5IGdvIHdpdGggeW91cgpwYXRjaC4KClRoaXMgcGF0Y2ggYm90aCBnaXZlcyB5
b3VyIGFwcGxpY2F0aW9uIHRoZSBiZW5lZml0IG9mIGJlaW5nIGFibGUgdG8gdXNlCmEgaGludCBh
ZGRyZXNzIGluIHRoZSBob3BlcyB0aGF0IHRoZSBhZGRyZXNzIGlzIGF2YWlsYWJsZSwgYXMgd2Vs
bCBhcwpjb250aW51aW5nIHRvIHN1cHBvcnQgdGhlIGd1YXJhbnRlZSB0aGF0IGFuIGFkZHJlc3Mg
dXNpbmcgbW9yZSBiaXRzIHRoYW4KdGhlIGhpbnQgYWRkcmVzcyBpcyBub3QgcmV0dXJuZWQuCgot
IENoYXJsaWUKCj4gCj4gSeKAmW0gYWxzbyBhd2FyZSBvZiB0aGUgcm5kX2dhcCBpZiBpdCBpcyBu
b3QgMCwgdGhlbiB3ZSB3aWxsIG5vdCBnZXQKPiBhZGRyZXNzIG1hcHBlZCB0byBWQV9VU0VSX1NW
MzkgLSBybmRfZ2FwLgo+IAo+IFsxXS4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlz
Y3YvdGVuY2VudF8yNjgzNjMyQkVFNDM4QzZENDg1NEUzMEJERjlDQTA4NDM2MDZAcXEuY29tLwo+
IAo+ID4gLS0gCj4gPiAyLjQzLjAKPiA+IAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
