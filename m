Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A18DD1356C
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Oct 2024 15:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ix5xCelmgLBff2TN2yUumh8ZbhBqYZiX6KFqqpJIbPw=; b=B3/8YcATNiWbp1
	D53/CBnIzKT2mK7S+pX+Im+dkar3zJtw0kvQIOizwK+Do+uFrW+Xpzh5Z1CnG3hP45piKn7bxgQ/H
	el95zzjv6hUaQa7vxL8KWXvt4IAjZ3JviCChpX9nfzf2hU6MJYPzuGDjuEJAVSINMtCVG8GWt4XOS
	3aiUa3coBncjNe3Kq75C2PF2piFd2ONl3aTIXXsMJFQ2RnRLctPqiW5e1j9Wdzw76O7IpfVkjfXol
	rmXJqBgV2hHkLXmnMdQYj1BkoRnwy86bAmE9/h1+vytPhlQy6IX9sKIyxlj+Nzcof91t9QQiPFW39
	GJM8FC5yax24OQ6v+TbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t55Cy-00000008TKj-1It4;
	Sun, 27 Oct 2024 15:29:36 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t55Cu-00000008TJd-2uVx
	for linux-riscv@lists.infradead.org;
	Sun, 27 Oct 2024 15:29:34 +0000
Received: by mail-pf1-x441.google.com with SMTP id d2e1a72fcca58-71e5130832aso2444023b3a.0
        for <linux-riscv@lists.infradead.org>; Sun, 27 Oct 2024 08:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730042971; x=1730647771; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=rodhsl2jwO/015f4VTLUGip9vsJwlnOpOG4HSAqhlNI=;
        b=KpykMrfzeCsYx9TZpPPV7BigFvbueRDZWXA/cqV0yrZEjH7pBXaTbkDa97jlKcejmo
         UF2cVSvRfb10keiiBZA41N+50R1Jsiupk08WfLF9FOca9Chib8PiMbFN2p1KosUa21Tp
         6CMpyNjFLeecPvJJfVlwMXy5GY90oC7G5BKJ/Jf7Km/FULWz7cKp+PIBI+Q1O61pvMff
         46wZ3M71RoBwZx7nHsibslrDmYt0hF0Hy28osZKwOuiemDCK6MJl/pIfFEpGkf2OtVk/
         38oRIqN3yYIUJXvO/A6OYkMOmKlzMhqatbdZIJsVxyNLfQqK+7jg5luz6OGYqU1fjfbe
         W5uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730042971; x=1730647771;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rodhsl2jwO/015f4VTLUGip9vsJwlnOpOG4HSAqhlNI=;
        b=JuN2zCAkRAlAFv8XHV9pqyrEwA7+gbop73Dhhc7q0uB1ltWlNG24x+AFOvO6YOUflb
         dvPak84U68A1D1Nvn/4B1GxzeV+Vleo3Lfqae75quSYGPWlaOeOggK8n2xQf9RiuFBh6
         KWWbwWAVh721cguq1JA5eAtRUV1JGVD/dubfTzHo1YA5zwgN1Ar/4zv9khJ4llAweLN/
         UftWswt/yTxQNhk3w2lgg/9luR594L8GcR9QxMlR0G23hqArt+Gvaz+2ymdHhHloVT+P
         u1Dv3kvI9smvkQA300VqluU6wJlRmIVXMlyEsyWdC3GT6ZAXOBSMl0/tQkRa2JG9XlTe
         g2oQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1KxHes8R19HhqVd21os+MUeUBByj4LVyqEpjVRJe3bWN7/LKQgXctjT2Trjg26hUrcLq/B1zfRJWFZQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwmA49i9KsfkRB/RjZFrun59gRlN/CE4MQiYybyIzpIhCi5RrgO
	lMoCcI4nsyoIwT0/nxApFRjBpbVK4k5AGOQDTdOM9e69DXhkkxWl
X-Google-Smtp-Source: AGHT+IG2BQrmcJxVQaY8t/NaWIL5qJcI9gTvZnuGQk5uE7/amUuptYGAttmfF3//7+Rm+oTL2tx3Gw==
X-Received: by 2002:a05:6a20:c89c:b0:1d9:6adc:afd3 with SMTP id adf61e73a8af0-1d9a83c9c49mr6447043637.19.1730042970897;
        Sun, 27 Oct 2024 08:29:30 -0700 (PDT)
Received: from [127.0.0.1] ([103.156.242.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057a3fddbsm4142235b3a.209.2024.10.27.08.29.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Oct 2024 08:29:30 -0700 (PDT)
From: Celeste Liu <coelacanthushex@gmail.com>
X-Google-Original-From: Celeste Liu <CoelacanthusHex@gmail.com>
Message-ID: <3dc10d89-6c0c-4654-95ed-dd6f19efbad4@gmail.com>
Date: Sun, 27 Oct 2024 23:29:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv/entry: get correct syscall number from
 syscall_get_nr()
Content-Language: en-GB-large
To: Thomas Gleixner <tglx@linutronix.de>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>,
 Celeste Liu via B4 Relay <devnull+CoelacanthusHex.gmail.com@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Alexandre Ghiti <alex@ghiti.fr>,
 "Dmitry V. Levin" <ldv@strace.io>, Andrea Bolognani <abologna@redhat.com>,
 Felix Yan <felixonmars@archlinux.org>, Ruizhe Pan <c141028@gmail.com>,
 Shiqi Zhang <shiqi@isrc.iscas.ac.cn>, Guo Ren <guoren@kernel.org>,
 Yao Zi <ziyao@disroot.org>, Han Gao <gaohan@iscas.ac.cn>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <87ldya4nv0.ffs@tglx>
In-Reply-To: <87ldya4nv0.ffs@tglx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_082932_761581_1B90D1A1 
X-CRM114-Status: GOOD (  45.01  )
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

T24gMjAyNC0xMC0yNyAwNDoyMSwgVGhvbWFzIEdsZWl4bmVyIHdyb3RlOgo+IE9uIEZyaSwgT2N0
IDI1IDIwMjQgYXQgMDc6MzAsIEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4+IFRob21hcyBHbGVpeG5l
ciA8dGdseEBsaW51dHJvbml4LmRlPiB3cml0ZXM6Cj4+PiBJdCdzIGNvbXBsZXRlbHkgdW5jbGVh
ciB0byBtZSB3aGF0IHRoZSBhY3R1YWwgcHJvYmxlbSBpcy4gVGhlIGZsb3cgaG93Cj4+PiB0aGlz
IHdvcmtzIG9uIGFsbCBhcmNoaXRlY3R1cmVzIGlzOgo+Pj4KPj4+ICAgICAgICByZWdzLT5vcmln
X2EwICA9IHJlZ3MtPmEwCj4+PiAgICAgICAgcmVncy0+YTAgPSAtRU5PU1lTOwo+Pj4KPj4+ICAg
ICAgICBuciA9IHN5c2NhbGxfZW50ZXJfZnJvbV91c2VyX21vZGUoLi4uLik7Cj4+Pgo+Pj4gICAg
ICAgIGlmIChuciA+PSAwKQo+Pj4gICAgICAgICAgIHJlZ3MtPmEwID0gbnIgPCBNQVhfU1lTQ0FM
TCA/IHN5c2NhbGwobnIpIDogLUVOT1NZUzsKPj4+ICAgICAgICAgICAgICAgICAgICAgIAo+Pj4g
SWYgc3lzY2FsbF90cmFjZV9lbnRlcigpIHJldHVybnMgLTEgdG8gc2tpcCB0aGUgc3lzY2FsbCwg
dGhlbiByZWdzLT5hMAo+Pj4gaXMgdW5tb2RpZmllZCwgdW5sZXNzIG9uZSBvZiB0aGUgbWFnaWMg
b3BlcmF0aW9ucyBtb2RpZmllZCBpdC4KPj4+Cj4+PiBJZiBzeXNjYWxsX3RyYWNlX2VudGVyKCkg
d2FzIG5vdCBhY3RpdmUgKG5vIHRyYWNlciwgbm8gc2VjY29tcCAuLi4pIHRoZW4KPj4+IHJlZ3Mt
PmEwIGFscmVhZHkgY29udGFpbnMgLUVOT1NZUy4KPj4+Cj4+PiBTbyB3aGF0J3MgdGhlIGV4YWN0
IHByb2JsZW0/Cj4+Cj4+IEl0J3MgYSBtaXggb2YgY2FsbGluZyBjb252ZW50aW9uLCBhbmQgVUFQ
SToKPj4gICAqIFJJU0MtViB1c2VzIGEwIGZvciBhcmcwICphbmQqIHJldHVybiB2YWx1ZSAobGlr
ZSBhcm02NCkuCj4+ICAgKiBSSVNDLVYgZG9lcyBub3QgZXhwb3NlIG9yaWdfYTAgdG8gdXNlcmxh
bmQsIGFuZCBjYW5ub3QgZWFzaWx5IHN0YXJ0Cj4+ICAgICBkb2luZyB0aGF0IHcvbyBicmVha2lu
ZyBVQVBJLgo+Pgo+PiBOb3csIHdoZW4gc2V0dGluZyBhMCB0byAtRU5PU1lTLCBpdCdzIGNsb2Ji
ZXJpbmcgYXJnMCwgYW5kIHRoZSBwdHJhY2VyCj4+IHdpbGwgaGF2ZSBhbiBpbmNvcnJlY3QgYXJn
MCAoLUVOT1NZUykuCj4gCj4gT2ggSSBzZWUuIEkgd2FzIGxvb2tpbmcgYXQgaXQgZnJvbSB0aGUg
eDg2IFBPVi4uLiAKPiAKPiBMb29raW5nIGRlZXBlciBpbnRvIHRoaXMsIHRoaXMgaXMgYWxsIGNv
bXBsZXRlbHkgaW5jb25zaXN0ZW50IGFjcm9zcwo+IGFyY2hpdGVjdHVyZXMuIEFsbCBvZiB0aGVt
IGNvcGllZCBlaXRoZXIgZnJvbSB4ODYgb3IgZnJvbSBzb21lIG90aGVyCj4gY2xvc2UgZW5vdWdo
IGV4aXN0aW5nIGNvcHkgYW5kIGNoYW5nZWQgc3R1ZmYgb24gdG9wLgo+IAo+IFNvIHdlIGhhdmUg
dHdvIGRpZmZlcmVudCBzY2VuYXJpb3MgQUZBSUNUIChJIGRpZCBub3QgbG9vayByZWFsbHkKPiBk
ZWVwbHkpOgo+IAo+ICAgIDEpIFRoZSByZWdpc3RlciB3aGljaCBob2xkcyB0aGUgc3lzY2FsbCBu
dW1iZXIgaXMgdXNlZCBmb3IgdGhlCj4gICAgICAgcmV0dXJuIHZhbHVlCj4gCj4gICAgMikgQW4g
YXJndW1lbnQgcmVnaXN0ZXIgaXMgdXNlZCBmb3IgdGhlIHJldHVybiB2YWx1ZQo+IAo+ICMxIGlz
IHRoZSBlYXN5IGNhc2UgYW5kIGp1c3QgIndvcmtzIgo+IAo+ICAgIGJlY2F1c2Ugb3JpZ18kUkVH
IGhvbGRzIHRoZSBvcmlnaW5hbCBzeXNjYWxsIG51bWJlciBhbmQgZXZlcnl0aGluZwo+ICAgIGZh
bGxzIGludG8gcGxhY2UuCj4gCj4gIzIgbmVlZHMgc29tZSB0aG91Z2h0LCBidXQgd2UgYXJlIG5v
dCBnb2luZyB0byBhZGQgdGhpczoKPiAKPj4gCSBpZiAod29yayAmIFNZU0NBTExfV09SS19FTlRF
UikKPj4gCQkgc3lzY2FsbCA9IHN5c2NhbGxfdHJhY2VfZW50ZXIocmVncywgc3lzY2FsbCwgd29y
ayk7Cj4+ICsJZWxzZSBpZiAoc3lzY2FsbCA9PSAtMUwpCj4+ICsJCXN5c2NhbGxfc2V0X3JldHVy
bl92YWx1ZShjdXJyZW50LCByZWdzLCAtRU5PU1lTLCAwKTsKPj4KPiAKPiBpbnRvIHRoZSBzeXNj
YWxsIHBhdGgganVzdCB0byBtYWtlICMyIHdvcmsuIFRoYXQncyBob3RwYXRoIGFuZCBhZmZlY3Rz
Cj4gYWxsIG90aGVyIGFyY2hpdGVjdHVyZXMgdG9vLgo+IAo+IFNvIHRoZSBwcm9ibGVtIGZvciB0
aGUgIzIgY2FzZSBpcyB0aGF0IHRoZXJlIGlzIG5vIGRpc3RpbmN0aW9uIGJldHdlZW4gYQo+IHVz
ZXIgc3BhY2UgaXNzdWVkIHN5c2NhbGwoQG5yID0gLTEpIGFuZCB0aGUgcmV0dXJuIHZhbHVlIG9m
ICgtMSkgb2YKPiB2YXJpb3VzIGZ1bmN0aW9ucyBpbnZvbHZlZCBpbiB0aGUgc3lzY2FsbCAndHJh
Y2VyJyBwcm9jZXNzaW5nLgo+IAo+IFNvIHdoYXQgdGhlIGlzc3VlIHdpdGggQ2VsZXN0ZSdzIGNo
YW5nZSBpczoKPiAKPiAJcmVzID0gc3lzY2FsbF9lbnRlcl9mcm9tX3VzZXJfbW9kZShyZWdzLCBz
eXNjYWxsKTsKPiAJc3lzY2FsbCA9IHN5c2NhbGxfZ2V0X25yKGN1cnJlbnQsIHJlZ3MpOwo+IAo+
IAlhZGRfcmFuZG9tX2tzdGFja19vZmZzZXQoKTsKPiAKPiAJaWYgKHN5c2NhbGwgPCAwIHx8IHN5
c2NhbGwgPj0gTlJfc3lzY2FsbHMpCj4gICAgICAgICAJcmVncy0+YTAgPSAtRU5PU1lTOwo+IAo+
IEFzIHRoZSB0cmFjZXIgY2FuIGludmFsaWRhdGUgdGhlIHN5c2NhbGwgbnVtYmVyIGFsb25nIHdp
dGggcmVncy0+YTAsCj4gdGhpcyBvdmVyd3JpdGVzIHRoZSBlcnJvciBjb2RlIHNldCBieSB0aGUg
dHJhY2VyLiBZb3VyIHNvbHV0aW9uIGhhcyBhCj4gc2ltaWxhciBwcm9ibGVtLgoKT2guIEl0J3Mg
YSByZWFsIGlzc3VlLgoKPiAKPiBUaGVyZSBpcyBhbm90aGVyIGlzc3VlIHZzLiByZWdzLT5hMC4g
QXNzdW1lIGEgcHRyYWNlciBtb2RpZmllZCByZWdzLT5hMAo+IChhcmcwKSBhbmQgbGV0cyB0aGUg
dGFzayBjb250aW51ZSAobm8gZmF0YWwgc2lnbmFsIHBlbmRpbmcpLgo+IAo+IFRoZW4gdGhlIGZv
bGxvd2luZyBzZWNjb21wKCkgaW52b2NhdGlvbiB3aWxsIGdldCByZWdzLT5vcmlnX2EwIGZyb20K
PiBzeXNjYWxsX2dldF9hcmd1bWVudHMoKSwgd2hpY2ggaXMgbm90IHdoYXQgdGhlIHB0cmFjZXIg
c2V0LCByaWdodD8KPiAKPiBMZXQgbWUgbG9vayBhdCB5b3VyIGZhaWx1cmUgYW5hbHlzaXMgZnJv
bSB5b3VyIGZpcnN0IHJlcGx5Ogo+IAo+PiAgMS4gc3RyYWNlICJ0cmFjaW5nIjogUmVxdWlyZXMg
dGhhdCByZWdzLT5hMCBpcyBub3QgdGFtcGVyZWQgd2l0aCBwcmlvcgo+PiAgICAgcHRyYWNlIG5v
dGlmaWNhdGlvbgo+Pgo+PiAgICAgRS5nLjoKPj4gICAgIHwgIyAuL3N0cmFjZSAvCj4+ICAgICB8
IGV4ZWN2ZSgiLyIsIFsiLyJdLCAweDdmZmZmYWFjMzg5MCAvKiAyMSB2YXJzICovKSA9IC0xIEVB
Q0NFUyAoUGVybWlzc2lvbiBkZW5pZWQpCj4+ICAgICB8IC4vc3RyYWNlOiBleGVjOiBQZXJtaXNz
aW9uIGRlbmllZAo+PiAgICAgfCArKysgZXhpdGVkIHdpdGggMSArKysKPj4gICAgIHwgIyAuL2Rp
c2FibGVfcHRyYWNlX2dldF9zeXNjYWxsX2luZm8gLi9zdHJhY2UgLwo+PiAgICAgfCBleGVjdmUo
MHhmZmZmZmZmZmZmZmZmZmRhLCBbIi8iXSwgMHg3ZmZmZDg5M2NlMTAgLyogMjEgdmFycyAqLykg
PSAtMSBFQUNDRVMgKFBlcm1pc3Npb24gZGVuaWVkKQo+PiAgICAgfCAuL3N0cmFjZTogZXhlYzog
UGVybWlzc2lvbiBkZW5pZWQKPj4gICAgIHwgKysrIGV4aXRlZCB3aXRoIDEgKysrCj4+Cj4+ICAg
ICBJbiB0aGUgc2Vjb25kIGNhc2UsIGFyZzAgaXMgcHJlbWF0dXJlbHkgc2V0IHRvIC1FTk9TWVMK
Pj4gICAgICgweGZmZmZmZmZmZmZmZmZmZGEpLgo+IAo+IFRoYXQncyBleHBlY3RlZCBpZiBwdHJh
Y2VfZ2V0X3N5c2NhbGxfaW5mbygpIGlzIG5vdCB1c2VkLiBQbGFpbiBkdW1waW5nCj4gcmVnaXN0
ZXJzIHdpbGwgZ2l2ZSB5b3UgdGhlIGN1cnJlbnQgdmFsdWUgb24gYWxsIGFyY2hpdGVjdHVyZXMu
Cj4gcHRyYWNlX2dldF9zeXNjYWxsX2luZm8oKSBleGlzdCBleGFjdGx5IGZvciB0aGF0IHJlYXNv
bi4KPiAKPj4gIDIuIHN0cmFjZSAic3lzY2FsbCB0YW1wZXJpbmciOiBSZXF1aXJlcyB0aGF0IEVO
T1NZUyBpcyByZXR1cm5lZCBmb3IKPj4gICAgIHN5c2NhbGwoLTEpLCBhbmQgbm90IHNraXBwZWQg
dy9vIGEgcHJvcGVyIHJldHVybiB2YWx1ZS4KPj4KPj4gICAgIEUuZy46Cj4+ICAgICB8IC4vc3Ry
YWNlIC1hMCAtZXdyaXRlIC1laW5qZWN0PXdyaXRlOmVycm9yPWVub3NwYyBlY2hvIGhlbGxvamVj
dD13cml0ZTplcnJvcj1lbm9zcGMgZWNobyBoZWxsbyAgIAo+Pgo+PiAgICAgSGVyZSwgc3RyYWNl
IGV4cGVjdHMgdGhhdCBpbmplY3RpbmcgLTEsIHdvdWxkIHJlc3VsdCBpbiBhIEVOT1NZUy4KPiAK
PiBOby4gSXQgZXhwZWN0cyBFTk9TUEMgd2l0aCB0aGUgYWJvdmUgY29tbWFuZCBsaW5lLiBtYW4g
c3RyYWNlOgo+IAo+ICAgICAgICBJZiA6ZXJyb3I9ZXJybm8gb3B0aW9uIGlzIHNwZWNpZmllZCwg
YSBmYXVsdCBpcyBpbmplY3RlZCBpbnRvIGEKPiAgICAgICAgc3lzY2FsbCBpbnZvY2F0aW9uOiB0
aGUgc3lzY2FsbCBudW1iZXIgaXMgcmVwbGFjZWQgYnkgLTEgd2hpY2gKPiAgICAgICAgY29ycmVz
cG9uZHMgdG8gYW4gaW52YWxpZCBzeXNjYWxsICh1bmxlc3MgYSBzeXNjYWxsIGlzIHNwZWNpZmll
ZAo+ICAgICAgICB3aXRoIDpzeXNjYWxsPSBvcHRpb24pLCBhbmQgdGhlIGVycm9yIGNvZGUgaXMg
c3BlY2lmaWVkIHVzaW5nIGEKPiAgICAgICAgc3ltYm9saWMgZXJybm8gdmFsdWUgbGlrZSBFTk9T
WVMgb3IgYSBudW1lcmljIHZhbHVlIHdpdGhpbgo+ICAgICAgICAxLi40MDk1IHJhbmdlLgo+IAo+
IFNpbWlsYXIgZm9yIC1laW5qZWN0OnJldHZhbD0kTgo+IAo+IFNvIHlvdSBjYW5ub3Qgb3Zlcndy
aXRlIGEwIHdpdGggRU5PU1lTIGlmIHRoZSBzeXNjYWxsIG5lZWRzIHRvIGJlCj4gc2tpcHBlZC4K
PiAKPj4gIDMuIHNlY2NvbXAgZmlsdGVyaW5nOiBSZXF1aXJlcyB0aGF0IHRoZSBhMCBpcyBub3Qg
dGFtcGVyZWQgdG8KPiAKPiBOby4gc2VjY29tcCB1c2VzIHN5c2NhbGxfZ2V0X2FyZ3VtZW50cygp
IHdoaWNoIHNldHMgYTAgdG8gb3JpZ19hMCBmb3IKPiBpbnNwZWN0aW9uLiBBcyBJIHNhaWQgYmVm
b3JlIHRoYXQgZmFpbHMgd2hlbiB0aGUgcHRyYWNlciBjaGFuZ2VkCj4gYXJndW1lbnQgMCBiZWZv
cmUgdGhlIHNlY2NvbXAgaW52b2NhdGlvbi4gc2VjY29tcCB3aWxsIHNlZSB0aGUgb3JpZ2luYWwK
PiBhcmd1bWVudCBhbmQgd2F2ZXMgaXQgdGhyb3VnaC4KPiAKPiBMb29raW5nIGF0IENlbGVzdGUn
cyBhbmFseXNpcyBhZ2FpbjoKPiAKPj4gV2UgY2FuJ3Qga25vdyB3aGV0aGVyIHN5c2NhbGxfbnIg
aXMgLTEgd2hlbiB3ZSBnZXQgLTEKPj4gZnJvbSBzeXNjYWxsX2VudGVyX2Zyb21fdXNlcl9tb2Rl
KCkuIEFuZCB0aGUgb2xkIHN5c2NhbGwgdmFyaWFibGUgaXMKPj4gdW51c2FibGUgYmVjYXVzZSBz
eXNjYWxsX2VudGVyX2Zyb21fdXNlcl9tb2RlKCkgbWF5IGNoYW5nZSBhNyByZWdpc3Rlci4KPiAK
PiBZb3Ugb2J2aW91c2x5IGNhbiBzYXZlIHRoZSB1c2VyIHNwYWNlIHN1cHBsaWVkIHZhbHVlIGF3
YXkKPiBpbiBkb190cmFwX2VjYWxsX3UoKSBieSBzaW1wbHkgZG9pbmcKPiAKPiAgICAgICAgbG9u
ZyBvcmlnX25yID0gcmVncy0+YTc7Cj4gCj4gTm8/IEJ1dCBJJ20gbm90IHN1cmUgdGhhdCBpdCBz
b2x2ZXMgYWxsIHByb2JsZW1zLiBJdCBjYW5ub3Qgc29sdmUgdGhlCj4gcHRyYWNlL3NlY2NvbXAg
aW50ZXJhY3Rpb24uCj4gCj4gVGhlIHJlc3Qgb2YgdGhlIGNoYW5nZWxvZyBpcyBzaW1wbHkgYm9n
dXMuIEp1c3QgYmVjYXVzZSByaXNjdiBtYWRlIGEKPiBtaXN0YWtlIHdpdGggdGhlIFVBQkkgZGVz
aWduIGRvZXMgbm90IG1lYW4gdGhhdCBpdCdzIHVzZWxlc3MgZm9yCj4gZXZlcnlvbmUgZWxzZS4K
PiAKPiBBbmQgbm8sIEknbSBub3QgZ29pbmcgdG8gY2hhbmdlIHg4NiBmb3IgdGhhdCBqdXN0IHRv
IGhhdmUgYSBwb2ludGxlc3MKPiBsb2FkIGluIHRoZSBzeXNjYWxsIGhvdHBhdGgsIHdoZW4gdGhl
IG5vcm1hbCBvcGVyYXRpb24ganVzdCBrZWVwcyB0aGUKPiBzeXNjYWxsIG51bWJlciBpbiB0aGUg
c2FtZSByZWdpc3Rlci4KPiAKPiBUaGUgcmVhbCBwcm9ibGVtIGlzIHRoYXQgb3JpZ19hMCBpcyBu
b3QgZXhwb3NlZCBpbiB0aGUgdXNlciB2aWV3IG9mIHRoZQo+IHJlZ2lzdGVycy4gQ2hhbmdpbmcg
dGhhdCBzdHJ1Y3QgYnJlYWtzIHRoZSBleGlzdGluZyBhcHBsaWNhdGlvbnMKPiBvYnZpb3VzbHku
Cj4gCj4gQnV0IHlvdSBjYW4gZXhwb3NlIGl0IHdpdGhvdXQgY2hhbmdpbmcgdGhlIHN0cnVjdCBi
eSBleHBvc2luZyBhIHJlZ3NldAo+IGZvciBvcmlnX2EwIHdoaWNoIGFsbG93cyB5b3UgdG8gcmVh
ZCBhbmQgd3JpdGUgaXQgc2ltaWxhciB0byB3aGF0IEFSTTY0Cj4gZG9lcyBmb3IgdGhlIHN5c2Nh
bGwgbnVtYmVyLgoKSWYgd2UgYWRkIHNvbWV0aGluZyBsaWtlIE5UX1NZU0NBTExfTlIgdG8gVUFQ
SSwgaXQgY2Fubm90IHNvbHZlIGFueXRoaW5nOiBXZSAKYWxyZWFkeSBoYXZlIFBUUkFDRV9HRVRf
U1lTQ0FMTF9JTkZPIHRvIGdldCBzeXNjYWxsIG51bWJlciwgd2hpY2ggd2FzIGludHJvZHVjZWQg
CmluIDUuMyBrZXJuZWwuIFRoZSBwcm9ibGVtIGlzIG9ubHkgaW4gdGhlIGtlcm5lbCBiZWZvcmUg
NS4zLiBTbyB3ZSBjYW4ndCBmaXggCnRoaXMgaXNzdWUgdW5sZXNzIHdlIGFsc28gYmFja3BvcnQg
TlRfU1lTQ0FMTF9OUiB0byA0LjE5IExUUy4gQnV0IGlmIHdlIGNhbiAKYmFja3BvcnQgaXQsIHdl
IGNhbiBiYWNrcG9ydCBQVFJBQ0VfR0VUX1NZU0NBTExfSU5GTyBkaXJlY3RseSBpbnN0ZWFkLgoK
VGhhdCdzIHdoeSBJIHRyeSB0byBsaW1pdCBjaGFuZ2VzIGluICJpbnRlcm5hbCBoYW5kbGUgbG9n
aWMiIGluIGFsbCAzIHRyaWVzIApiZWZvcmUuCgo+IAo+IFRoYXQgb2YgY291cnNlIHJlcXVpcmVz
IHVwZGF0ZWQgdXNlciBzcGFjZSwgYnV0IGV4aXN0aW5nIHVzZXIgc3BhY2Ugd2lsbAo+IGNvbnRp
bnVlIHRvIHdvcmsgd2l0aCB0aGUgY3VycmVudCBsaW1pdGF0aW9ucy4KPiAKPiBUaGFua3MsCj4g
Cj4gICAgICAgICB0Z2x4CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
