Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E77DE77173
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Dec 2024 17:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4uszknkN0bawkzHVZpwpvoRw2kBszwkRqUOBuJsxoX0=; b=qWw0hFblcGAOgQ
	xjNKrgh99U4UGmBvo3pq61WcOX1QH34khSO4w0JdZFv1ocPjJOXMuM3/Xtzdr7vRgiy05VjP3W09w
	Kzw+QpXX4f6AQTmL9rfExSqywCTZmktNDsOWN8zZpvKJ3oVNCvfRo9iRtGMTHxpFbJ7ZTrOHWfK66
	6n/zn7yW0nKdc6DvWwSBYxT0Oo0wthe+9ZVKmEa0G1jSordT0Tk+AJrrzRrtNb6uFl/2rrkF5yEb3
	iTA+KguERkHdycXIr659/U5BQ5PRtgyXe91/NH/H8KrgYL8bu/pNKZHr30rYLfouSz/nVa3aI+M+L
	5sGtUBbrhLCbGyZXiWeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJcP5-00000002NYb-2bVC;
	Fri, 06 Dec 2024 17:46:11 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJcOn-00000002NVj-2Htt
	for linux-riscv@lists.infradead.org;
	Fri, 06 Dec 2024 17:45:55 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-724e1742d0dso2228304b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 06 Dec 2024 09:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1733507152; x=1734111952; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iAooZwBPcM5TGhZsHqOQgvHTchJ3PXQRaHlWWctMQ14=;
        b=BDDxKy53MEZM6613l8zGKu2SQZ8+jYC5TpyyphiYwzZGVDsbAek/n0LEtcwkwhXyYA
         wk1vdmRz80f8xBup1LUJmApTx+fzi3hznV60854t47n9d1UCJRTltYWjsEURcj1ThZrH
         Yf73pQJykP4jxNu9Jw+lxq3y6K56uzVYPdHH2zJ55q/4TSKXZitrnFLXGnwLPaZZhTMr
         6/KclKZqZCe7K7uSrr6oHNdHAX04cIb+7beULhOGgQPIt8Dq6veWkvap/bl0p2bx9E0s
         g280nd78KFV9lvctm+QrD4EfVXi+IAFncIFPZi91Mg62sdITNtnhqD5P1MpOO/H+fsmz
         vMnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733507152; x=1734111952;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iAooZwBPcM5TGhZsHqOQgvHTchJ3PXQRaHlWWctMQ14=;
        b=FrQyropVv5gKPMYq1nvafZq29G0+i5e0reQQHJmHx3XXOWExSGBCTgEVWDB1Xa6sg3
         ZcBo6R8FBR66h/8NUzTIWKE2skQpCFYb8+CXliHISESrga+U6g5jj8uGQxm8VARzKGZj
         Fwb5pLY26VvC11bZ6LxqHJeW/I359ApvI2kNY3xfbp+8frmciVXgrXdPa8bOLZgjH3Ws
         0Sa7fN/Qs2i3NHSo/LaaFEleNxg/DRVnIEl1L5uBuaG3X3RC0AcLWfdOg+7z3mHqc1jg
         aY+ctqicg/qlPdSIBQ52r8D//1JqPd159GvZQ3ONfMESI3R2RAIyZcPS2WX1u7lDKf9S
         ivDw==
X-Forwarded-Encrypted: i=1; AJvYcCWMVyQesZBKP6Qzsl2gO4KZKxaObAq7ovzzb1oh+aVoBVfus5L+siqfcZgjdRNJ4GEeMZbqqj7o/WjttQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxO0fZdK6ay08E4GxTFi3FiuXc9MyAWhKrhxC/0udxV4qQsdgin
	q8zQP2ZAghnm5OZKXpnvpdrnLtlVkPJo1bpT5tpOmprart+jSmmKQUBpBTIHW0M=
X-Gm-Gg: ASbGnctseS9ESqYG5jz/+7xp3kWgp+Il1YknRe7c1bTuNnajew7s8eNQDzIB57zyULM
	gzYD1jMe4t4X4wzhnnG/pAKDDXKIDoLjoem2Y0L5A7y1KZe9eBX4KLBpJkTsMe4HF2cAaxKH78r
	eMVP+/6v2EYK9FANbO5nnm/OBvTxkMR8M/S4ycqkYNVTYWryAyNr8f635rQdpuiODJ1XACscoyO
	Su7IOpM54Qg+0ISAHotaaGpGwwt7zn+d9G8IC91yA0l4A==
X-Google-Smtp-Source: AGHT+IHnqHSI43jh4cv+SNvOzcNy+9f7ZIxwNmcWDWx/wr/KBsfJsS57hR/xKlrk05+r5QDxzOqqZw==
X-Received: by 2002:a17:902:dac5:b0:215:8103:6339 with SMTP id d9443c01a7336-21614da9ab6mr56714085ad.41.1733507152396;
        Fri, 06 Dec 2024 09:45:52 -0800 (PST)
Received: from ghost ([2600:1010:b0ba:197a:c0e9:4a0e:e502:edf9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8e3e875sm31382665ad.19.2024.12.06.09.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 09:45:51 -0800 (PST)
Date: Fri, 6 Dec 2024 09:45:48 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Shuah Khan <shuah@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>, linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH v4] riscv: selftests: Fix warnings pointer masking test
Message-ID: <Z1M4TNU0p1PgJOIL@ghost>
References: <20241205-fix_warnings_pointer_masking_tests-v4-1-0c77eb725486@rivosinc.com>
 <20241206-6f0aafe057dc10df9a9e02a5@orel>
 <Z1MyrgQJsHQscdZ2@ghost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z1MyrgQJsHQscdZ2@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_094553_846267_2574846A 
X-CRM114-Status: GOOD (  34.49  )
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

T24gRnJpLCBEZWMgMDYsIDIwMjQgYXQgMDk6MjE6NTBBTSAtMDgwMCwgQ2hhcmxpZSBKZW5raW5z
IHdyb3RlOgo+IE9uIEZyaSwgRGVjIDA2LCAyMDI0IGF0IDEwOjE1OjE3QU0gKzAxMDAsIEFuZHJl
dyBKb25lcyB3cm90ZToKPiA+IE9uIFRodSwgRGVjIDA1LCAyMDI0IGF0IDAxOjQ5OjMxUE0gLTA4
MDAsIENoYXJsaWUgSmVua2lucyB3cm90ZToKPiA+ID4gV2hlbiBjb21waWxpbmcgdGhlIHBvaW50
ZXIgbWFza2luZyB0ZXN0cyB3aXRoIC1XYWxsIHRoaXMgd2FybmluZwo+ID4gPiBpcyBwcmVzZW50
Ogo+ID4gPiAKPiA+ID4gcG9pbnRlcl9tYXNraW5nLmM6IEluIGZ1bmN0aW9uIOKAmHRlc3RfdGFn
Z2VkX2FkZHJfYWJpX3N5c2N0bOKAmToKPiA+ID4gcG9pbnRlcl9tYXNraW5nLmM6MjAzOjk6IHdh
cm5pbmc6IGlnbm9yaW5nIHJldHVybiB2YWx1ZSBvZiDigJhwd3JpdGXigJkKPiA+ID4gZGVjbGFy
ZWQgd2l0aCBhdHRyaWJ1dGUg4oCYd2Fybl91bnVzZWRfcmVzdWx04oCZIFstV3VudXNlZC1yZXN1
bHRdCj4gPiA+ICAgMjAzIHwgICAgICAgICBwd3JpdGUoZmQsICZ2YWx1ZSwgMSwgMCk7IHwKPiA+
ID4gICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+IHBvaW50ZXJfbWFza2luZy5jOjIwODo5
OiB3YXJuaW5nOgo+ID4gPiBpZ25vcmluZyByZXR1cm4gdmFsdWUgb2Yg4oCYcHdyaXRl4oCZIGRl
Y2xhcmVkIHdpdGggYXR0cmlidXRlCj4gPiA+IOKAmHdhcm5fdW51c2VkX3Jlc3VsdOKAmSBbLVd1
bnVzZWQtcmVzdWx0XQo+ID4gPiAgIDIwOCB8ICAgICAgICAgcHdyaXRlKGZkLCAmdmFsdWUsIDEs
IDApOwo+ID4gPiAKPiA+ID4gSSBjYW1lIGFjcm9zcyB0aGlzIG9uIHJpc2N2NjQtbGludXgtZ251
LWdjYyAoVWJ1bnR1Cj4gPiA+IDExLjQuMC0xdWJ1bnR1MX4yMi4wNCkuCj4gPiA+IAo+ID4gPiBG
aXggdGhpcyBieSBjaGVja2luZyB0aGF0IHRoZSBudW1iZXIgb2YgYnl0ZXMgd3JpdHRlbiBlcXVh
bCB0aGUgZXhwZWN0ZWQKPiA+ID4gbnVtYmVyIG9mIGJ5dGVzIHdyaXR0ZW4uCj4gPiA+IAo+ID4g
PiBGaXhlczogNzQ3MGI1YWZkMTUwICgicmlzY3Y6IHNlbGZ0ZXN0czogQWRkIGEgcG9pbnRlciBt
YXNraW5nIHRlc3QiKQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBDaGFybGllIEplbmtpbnMgPGNoYXJs
aWVAcml2b3NpbmMuY29tPgo+ID4gPiAtLS0KPiA+ID4gQ2hhbmdlcyBpbiB2NDoKPiA+ID4gLSBT
a2lwIHN5c2N0bF9lbmFibGVkIHRlc3QgaWYgZmlyc3QgcHdyaXRlIGZhaWxlZAo+ID4gPiAtIExp
bmsgdG8gdjM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDEyMDUtZml4X3dhcm5pbmdz
X3BvaW50ZXJfbWFza2luZ190ZXN0cy12My0xLTVjMjhiMGY5NjQwZEByaXZvc2luYy5jb20KPiA+
ID4gCj4gPiA+IENoYW5nZXMgaW4gdjM6Cj4gPiA+IC0gRml4IHN5c2N0bCBlbmFibGVkIHRlc3Qg
Y2FzZSAoRHJldy9BbGV4KQo+ID4gPiAtIE1vdmUgcHdyaXRlIGVyciBjb25kaXRpb24gaW50byBn
b3RvIChEcmV3KQo+ID4gPiAtIExpbmsgdG8gdjI6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3Iv
MjAyNDEyMDQtZml4X3dhcm5pbmdzX3BvaW50ZXJfbWFza2luZ190ZXN0cy12Mi0xLTFiZjBjNTA5
NWY1OEByaXZvc2luYy5jb20KPiA+ID4gCj4gPiA+IENoYW5nZXMgaW4gdjI6Cj4gPiA+IC0gSSBo
YWQgcmV0ICE9IDIgZm9yIHRlc3RpbmcsIEkgY2hhbmdlZCBpdCB0byBiZSByZXQgIT0gMS4KPiA+
ID4gLSBMaW5rIHRvIHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjQxMjA0LWZpeF93
YXJuaW5nc19wb2ludGVyX21hc2tpbmdfdGVzdHMtdjEtMS1lYTFlOTY2NWNlN2FAcml2b3NpbmMu
Y29tCj4gPiA+IC0tLQo+ID4gPiAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvYWJpL3Bv
aW50ZXJfbWFza2luZy5jIHwgMjAgKysrKysrKysrKysrKysrKysrLS0KPiA+ID4gIDEgZmlsZSBj
aGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4gPiAKPiA+ID4gZGlm
ZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jpc2N2L2FiaS9wb2ludGVyX21hc2tp
bmcuYyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jpc2N2L2FiaS9wb2ludGVyX21hc2tpbmcu
Ywo+ID4gPiBpbmRleCBkZWU0MWI3ZWUzZTMuLjc1OTQ0NWQ1ZjI2NSAxMDA2NDQKPiA+ID4gLS0t
IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvYWJpL3BvaW50ZXJfbWFza2luZy5jCj4g
PiA+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jpc2N2L2FiaS9wb2ludGVyX21hc2tp
bmcuYwo+ID4gPiBAQCAtMTg5LDYgKzE4OSw4IEBAIHN0YXRpYyB2b2lkIHRlc3RfdGFnZ2VkX2Fk
ZHJfYWJpX3N5c2N0bCh2b2lkKQo+ID4gPiAgewo+ID4gPiAgCWNoYXIgdmFsdWU7Cj4gPiA+ICAJ
aW50IGZkOwo+ID4gPiArCWludCByZXQ7Cj4gPiA+ICsJY2hhciAqZXJyX3B3cml0ZV9tc2cgPSAi
ZmFpbGVkIHRvIHdyaXRlIHRvIC9wcm9jL3N5cy9hYmkvdGFnZ2VkX2FkZHJfZGlzYWJsZWRcbiI7
Cj4gPiA+ICAKPiA+ID4gIAlrc2Z0X3ByaW50X21zZygiVGVzdGluZyB0YWdnZWQgYWRkcmVzcyBB
Qkkgc3lzY3RsXG4iKTsKPiA+ID4gIAo+ID4gPiBAQCAtMjAwLDE4ICsyMDIsMzIgQEAgc3RhdGlj
IHZvaWQgdGVzdF90YWdnZWRfYWRkcl9hYmlfc3lzY3RsKHZvaWQpCj4gPiA+ICAJfQo+ID4gPiAg
Cj4gPiA+ICAJdmFsdWUgPSAnMSc7Cj4gPiA+IC0JcHdyaXRlKGZkLCAmdmFsdWUsIDEsIDApOwo+
ID4gPiArCXJldCA9IHB3cml0ZShmZCwgJnZhbHVlLCAxLCAwKTsKPiA+ID4gKwlpZiAocmV0ICE9
IDEpIHsKPiA+ID4gKwkJa3NmdF90ZXN0X3Jlc3VsdF9za2lwKGVycl9wd3JpdGVfbXNnKTsKPiA+
IAo+ID4gSXQgc2VlbXMgbGlrZSB3ZSBzaG91bGQgaGF2ZSBhIGJldHRlciB3YXkgdG8ga2VlcCB0
aGUgY291bnQgYmFsYW5jZWQgdGhhbgo+ID4gdG8gcmVxdWlyZSBhIGtzZnRfdGVzdF9yZXN1bHRf
c2tpcCgpIGNhbGwgZm9yIGVhY2ggdGVzdCBvbiBlYWNoIGVycm9yCj4gPiBwYXRoLiBFdmVyeSB0
aW1lIHdlIGFkZCBhIHRlc3Qgd2UnbGwgaGF2ZSB0byBnbyBhZGQgc2tpcHMgZXZlcnl3aGVyZSBl
bHNlLgo+IAo+IEl0J3Mgb25seSBhIHByb2JsZW0gaWYgdGhlcmUgYXJlIG11bHRpcGxlIHRlc3Rz
IGluIGEgc2luZ2xlIHRlc3QKPiBmdW5jdGlvbiBsaWtlIHRoZXJlIGlzIGhlcmUuIFNpbmNlIHRo
ZSB0ZXN0cyBkaXNhYmxlIHRoZW4gcmVlbmFibGUgaXQKPiBtYWtlcyBzZW5zZSB0byBoYXZlIHRo
ZW0gaW4gb25lIGZ1bmN0aW9uLCBidXQgZG9lcyByZXF1aXJlIHVzIHRvIGRvIHRoZQo+IHNraXBw
aW5nLgoKSSBndWVzcyBpdCBpcyBzdWZmaWNpZW50IHRvIGxlYXZlIG91dCB0aGUgc2tpcCBoZXJl
LCBpZiB0aGUgZmlyc3Qgb25lCmZhaWxzIHdlIGNhbiBqdXN0IGNvbnRpbnVlIGFuZCBsZXQgdGhl
IHNlY29uZCBvbmUgZmFpbCB0b28uCgotIENoYXJsaWUKCj4gCj4gPiAKPiA+ID4gKwkJZ290byBl
cnJfcHdyaXRlOwo+ID4gPiArCX0KPiA+ID4gKwo+ID4gPiAgCWtzZnRfdGVzdF9yZXN1bHQoc2V0
X3RhZ2dlZF9hZGRyX2N0cmwobWluX3BtbGVuLCB0cnVlKSA9PSAtRUlOVkFMLAo+ID4gPiAgCQkJ
ICJzeXNjdGwgZGlzYWJsZWRcbiIpOwo+ID4gPiAgCj4gPiA+ICAJdmFsdWUgPSAnMCc7Cj4gPiA+
IC0JcHdyaXRlKGZkLCAmdmFsdWUsIDEsIDApOwo+ID4gPiArCXJldCA9IHB3cml0ZShmZCwgJnZh
bHVlLCAxLCAwKTsKPiA+ID4gKwlpZiAocmV0ICE9IDEpCj4gPiA+ICsJCWdvdG8gZXJyX3B3cml0
ZTsKPiA+ID4gKwo+ID4gPiAgCWtzZnRfdGVzdF9yZXN1bHQoc2V0X3RhZ2dlZF9hZGRyX2N0cmwo
bWluX3BtbGVuLCB0cnVlKSA9PSAwLAo+ID4gPiAgCQkJICJzeXNjdGwgZW5hYmxlZFxuIik7Cj4g
PiA+ICAKPiA+ID4gIAlzZXRfdGFnZ2VkX2FkZHJfY3RybCgwLCBmYWxzZSk7Cj4gPiA+ICAKPiA+
ID4gIAljbG9zZShmZCk7Cj4gPiA+ICsKPiA+ID4gKwlyZXR1cm47Cj4gPiA+ICsKPiA+ID4gK2Vy
cl9wd3JpdGU6Cj4gPiA+ICsJY2xvc2UoZmQpOwo+ID4gPiArCWtzZnRfdGVzdF9yZXN1bHRfZmFp
bChlcnJfcHdyaXRlX21zZyk7Cj4gPiA+ICB9Cj4gPiAKPiA+IEkgZG9uJ3QgdGhpbmsgdGhlIGdv
dG8gcmVkdWNlcyBtdWNoIGNvZGUgb3IgaW1wcm92ZXMgcmVhZGFiaWxpdHkgbXVjaC4gQQo+ID4g
d3JhcHBlciBmdW5jdGlvbiBzaG91bGQgZG8gYmV0dGVyLiBJIHdhcyB0aGlua2luZyBzb21ldGhp
bmcgbGlrZQo+ID4gCj4gPiAgc3RhdGljIGJvb2wgcHdyaXRlX3dyYXBwZXIoaW50IGZkLCB2b2lk
ICpidWYsIHNpemVfdCBjb3VudCwgY29uc3QgY2hhciAqbXNnKQo+ID4gIHsKPiA+ICAgIGludCBy
ZXQgPSBwd3JpdGUoZmQsIGJ1ZiwgY291bnQsIDApOwo+ID4gICAgaWYgKHJldCAhPSBjb3VudCkg
ewo+ID4gICAgICAga3NmdF9wZXJyb3IobXNnKTsKPiA+ICAgICAgIHJldHVybiBmYWxzZTsKPiA+
ICAgIH0KPiA+ICAgIHJldHVybiB0cnVlOwo+ID4gIH0KPiA+IAo+ID4gCj4gPiAgdmFsdWUgPSAn
MSc7Cj4gPiAgaWYgKCFwd3JpdGVfd3JhcHBlcihmZCwgJnZhbHVlLCAxLCAid3JpdGUgJzEnIikp
Cj4gPiAgICAga3NmdF90ZXN0X3Jlc3VsdF9mYWlsKC4uLik7Cj4gPiAKPiA+ICB2YWx1ZSA9ICcw
JzsKPiA+ICBpZiAoIXB3cml0ZV93cmFwcGVyKGZkLCAmdmFsdWUsIDEsICJ3cml0ZSAnMCciKSkK
PiA+ICAgICBrc2Z0X3Rlc3RfcmVzdWx0X2ZhaWwoLi4uKTsKPiA+IAo+ID4gCj4gCj4gV2lsbCBk
bywgdGhhbmtzIQo+IAo+IC0gQ2hhcmxpZQo+IAo+ID4gPiAgCj4gPiA+ICBzdGF0aWMgdm9pZCB0
ZXN0X3RhZ2dlZF9hZGRyX2FiaV9wbWxlbihpbnQgcG1sZW4pCj4gPiA+IAo+ID4gPiAtLS0KPiA+
ID4gYmFzZS1jb21taXQ6IDQwMzg0Yzg0MGVhMTk0NGQ3YzVhMzkyZTg5NzVlZDA4OGVjZjBiMzcK
PiA+ID4gY2hhbmdlLWlkOiAyMDI0MTIwNC1maXhfd2FybmluZ3NfcG9pbnRlcl9tYXNraW5nX3Rl
c3RzLTM4NjBlNGYzNTQyOQo+ID4gPiAtLSAKPiA+ID4gLSBDaGFybGllCj4gPiA+IAo+ID4gCj4g
PiBUaGFua3MsCj4gPiBkcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
