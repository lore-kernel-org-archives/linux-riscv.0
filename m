Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F2BC4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 09:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oi5VccuO6eYLYiAmVTwm1sVsaUaj7P3up7H0PafqsRA=; b=R+TCA/fDQmUJOA
	Haeb5Hxk+TQXDdzmKtFgdro51WT5oLy/hcckqG7m615hjHq9bm8YakqUEqCOQFtPZBywu01ysFgIk
	yhhOJ5MG/uEIENTNEXQxogLxn0ycA/LDoS1WnCbwhCJGLOjHgnWQW2Jg7Cu1z0sx4Sa/Wsv/gL350
	l3IRjKnGG+spLKFjFG0XncguKJ7pl/E1NtgjWwnv7JwMOfkhq1DTD5rMO4wtH9UGxFGUfwyll1YlM
	kJE5sHWijcnxd6K61ViAL1CiIfSbpdnk8zuXKCf1OjIoa0nboasr+T0dULwDE0QLo+5dpUFFUw8fg
	pm3NXIZ4w33ZNjzDaZEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCcDC-004PpN-2y;
	Mon, 11 Dec 2023 09:04:27 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCcD7-004Pnc-0P
	for linux-riscv@lists.infradead.org;
	Mon, 11 Dec 2023 09:04:25 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-40c31f18274so35618335e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 11 Dec 2023 01:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702285456; x=1702890256; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7rA+zJQnEpXRXHPa8sM57MSeRpDyuhTRmbcQiHO1u+s=;
        b=Mfs+stQWusjaIpF0tjfIQknIMT7xUXeQKVtBrPmvFZLZhTeOSY8CXftJ7JfnZQSGVW
         QiQoV9oZTeBLEQnENMm2MLL/zzoNZEbnxFYtDGSKmbCvtgKilMn2pf6WScIZIAiNTR1O
         CBZcRX+2LDhPopspkaGM7VLOY5YnE97bbpIS1uGyXRhp2Rypiofz3Gv1NZiLTj/4S15Z
         CT+tUwKVC/ve3tToxUr4rIvDxFYoL8wMgMM62Es4GeEBi8hxcTw8NFUDe+pIGHXGpwFF
         hcEFIwoce/EO6aVtYv9Qv1Pe/lH8L4930dZJeZGGnqEK3ed8wn9SKT4DbjEsHxlTJ5ii
         E9jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702285456; x=1702890256;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7rA+zJQnEpXRXHPa8sM57MSeRpDyuhTRmbcQiHO1u+s=;
        b=WbSEM4ucc6O77uCwYVSPqCBgOjDMLYmVbnHgbYqTwTzcNOkBlQ4TdlCDRwPCLUu6Qg
         qnlsZKfBRSYSQ8cj8OCzVVyMR1pNlT8qjYdNZUhKOVf5z0mU3IGDVO7TGRTv1lsZpnWp
         Yvr3tb3KuJV+Bj5or3i38uSMOpnSXGlqlVmKLNQqpvZBVLiAiB5KZFpb76qVM9ouB23V
         Ma6tFIg9XjAzY3kVFB3kkkqBHbLSOD3DgwOuNEV6DEg9QlhySebTGfzlD1y8BGP70sQr
         xw3VahYpN5JjmaZfTv0/XZU0Nzj4tlnJEoL8CuObwyz5p6Q82xFPZwx/EMKTj0DsxVEe
         KWfg==
X-Gm-Message-State: AOJu0Yyi/88z0lbsakZjVEiS+whVQ2kpvjRBDVmscmyDdw11Szs9s+jK
	ZdBkynsWCo9BABMMMUELjPe5F5e1x/qXuKG68k14lA==
X-Google-Smtp-Source: AGHT+IFpNmatGvvVppvoqNpeec6Fgu1l4m42A9UAld+oqVELJcb96pUrmUgmZWFkNp2NoDAyyfMYz98BOk5CAdbJpEo=
X-Received: by 2002:a05:600c:2945:b0:40c:3c72:608f with SMTP id
 n5-20020a05600c294500b0040c3c72608fmr1628668wmd.17.1702285456052; Mon, 11 Dec
 2023 01:04:16 -0800 (PST)
MIME-Version: 1.0
References: <20231208151036.2458921-1-guoren@kernel.org> <CAHVXubjfuKZ1PBYQ8By41OX65YpAma3_kmSL7urT8L0PmMxFnQ@mail.gmail.com>
 <CAJF2gTSB-4hDo8ncSLVKvbnOOEwLSrV716kQM9d9HrzXFs7D8A@mail.gmail.com>
In-Reply-To: <CAJF2gTSB-4hDo8ncSLVKvbnOOEwLSrV716kQM9d9HrzXFs7D8A@mail.gmail.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Mon, 11 Dec 2023 10:04:05 +0100
Message-ID: <CAHVXubiK0TXMuhZhYjLq7tyk_dhFP9W2uReacECWDC7HToYuXA@mail.gmail.com>
Subject: Re: [PATCH] riscv: pgtable: Enhance set_pte to prevent OoO risk
To: Guo Ren <guoren@kernel.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, akpm@linux-foundation.org, 
	catalin.marinas@arm.com, willy@infradead.org, david@redhat.com, 
	muchun.song@linux.dev, will@kernel.org, peterz@infradead.org, rppt@kernel.org, 
	paulmck@kernel.org, atishp@atishpatra.org, anup@brainfault.org, alex@ghiti.fr, 
	mike.kravetz@oracle.com, dfustini@baylibre.com, wefu@redhat.com, 
	jszhang@kernel.org, falcon@tinylab.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_010421_217883_8B2B6E26 
X-CRM114-Status: GOOD (  35.76  )
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

T24gTW9uLCBEZWMgMTEsIDIwMjMgYXQgOTo0MeKAr0FNIEd1byBSZW4gPGd1b3JlbkBrZXJuZWwu
b3JnPiB3cm90ZToKPgo+IE9uIE1vbiwgRGVjIDExLCAyMDIzIGF0IDE6NTLigK9QTSBBbGV4YW5k
cmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+IHdyb3RlOgo+ID4KPiA+IEhpIEd1bywK
PiA+Cj4gPiBPbiBGcmksIERlYyA4LCAyMDIzIGF0IDQ6MTDigK9QTSA8Z3VvcmVuQGtlcm5lbC5v
cmc+IHdyb3RlOgo+ID4gPgo+ID4gPiBGcm9tOiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFi
YS5jb20+Cj4gPiA+Cj4gPiA+IFdoZW4gY2hhbmdpbmcgZnJvbSBhbiBpbnZhbGlkIHB0ZSB0byBh
IHZhbGlkIG9uZSBmb3IgYSBrZXJuZWwgcGFnZSwKPiA+ID4gdGhlcmUgaXMgbm8gbmVlZCBmb3Ig
dGxiX2ZsdXNoLiBJdCdzIG9rYXkgZm9yIHRoZSBUU08gbWVtb3J5IG1vZGVsLCBidXQKPiA+ID4g
dGhlcmUgaXMgYW4gT29PIHJpc2sgZm9yIHRoZSBXZWFrIG9uZS4gZWc6Cj4gPiA+Cj4gPiA+IHNk
IHQwLCAoYTApIC8vIGEwID0gcHRlIGFkZHJlc3MsIHB0ZXZhbCBpcyBjaGFuZ2VkIGZyb20gaW52
YWxpZCB0byB2YWxpZAo+ID4gPiAuLi4KPiA+ID4gbGQgdDEsIChhMSkgLy8gYTEgPSB2YSBvZiBh
Ym92ZSBwdGUKPiA+ID4KPiA+ID4gSWYgdGhlIGxkIGluc3RydWN0aW9uIGlzIGV4ZWN1dGVkIHNw
ZWN1bGF0aXZlbHkgYmVmb3JlIHRoZSBzZAo+ID4gPiBpbnN0cnVjdGlvbi4gVGhlbiBpdCB3b3Vs
ZCBicmluZyBhbiBpbnZhbGlkIGVudHJ5IGludG8gdGhlIFRMQiwgYW5kIHdoZW4KPiA+ID4gdGhl
IGxkIGluc3RydWN0aW9uIHJldGlyZWQsIGEgc3B1cmlvdXMgcGFnZSBmYXVsdCBvY2N1cnJlZC4g
QmVjYXVzZSB0aGUKPiA+ID4gdm1lbW1hcCBoYXMgYmVlbiBpZ25vcmVkIGJ5IHZtYWxsb2NfZmF1
bHQsIHRoZSBzcHVyaW91cyBwYWdlIGZhdWx0IHdvdWxkCj4gPiA+IGNhdXNlIGtlcm5lbCBwYW5p
Yy4KPiA+ID4KPiA+ID4gVGhpcyBwYXRjaCB3YXMgaW5zcGlyZWQgYnkgdGhlIGNvbW1pdDogN2Yw
YjFiZjA0NTExICgiYXJtNjQ6IEZpeCBiYXJyaWVycwo+ID4gPiB1c2VkIGZvciBwYWdlIHRhYmxl
IG1vZGlmaWNhdGlvbnMiKS4gRm9yIFJJU0MtViwgdGhlcmUgaXMgbm8gcmVxdWlyZW1lbnQKPiA+
ID4gaW4gdGhlIHNwZWMgdG8gZ3VhcmFudGVlIGFsbCB0bGIgZW50cmllcyBhcmUgdmFsaWQgYW5k
IG5vIHJlcXVpcmVtZW50IHRvCj4gPiA+IFBUVyBmaWx0ZXIgb3V0IGludmFsaWQgZW50cmllcy4g
T2YgY291cnNlLCBtaWNyby1hcmNoIGNvdWxkIGdpdmUgYSBtb3JlCj4gPiA+IHJvYnVzdCBkZXNp
Z24sIGJ1dCBoZXJlLCB1c2UgYSBzb2Z0d2FyZSBmZW5jZSB0byBndWFyYW50ZWUuCj4gPiA+Cj4g
PiA+IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBsaW51eC5hbGliYWJhLmNvbT4KPiA+
ID4gU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4gPiA+IC0tLQo+
ID4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggfCA3ICsrKysrKysKPiA+ID4g
IDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9wZ3RhYmxlLmgKPiA+ID4gaW5kZXggMjk0MDQ0NDI5ZThlLi4yZmFlNWE1NDM4ZTAgMTAwNjQ0
Cj4gPiA+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4gPiA+ICsrKyBi
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4gPiA+IEBAIC01MTEsNiArNTExLDEz
IEBAIHN0YXRpYyBpbmxpbmUgaW50IHB0ZV9zYW1lKHB0ZV90IHB0ZV9hLCBwdGVfdCBwdGVfYikK
PiA+ID4gIHN0YXRpYyBpbmxpbmUgdm9pZCBzZXRfcHRlKHB0ZV90ICpwdGVwLCBwdGVfdCBwdGV2
YWwpCj4gPiA+ICB7Cj4gPiA+ICAgICAgICAgKnB0ZXAgPSBwdGV2YWw7Cj4gPiA+ICsKPiA+ID4g
KyAgICAgICAvKgo+ID4gPiArICAgICAgICAqIE9ubHkgaWYgdGhlIG5ldyBwdGUgaXMgcHJlc2Vu
dCBhbmQga2VybmVsLCBvdGhlcndpc2UgVExCCj4gPiA+ICsgICAgICAgICogbWFpbnRlbmFuY2Ug
b3IgdXBkYXRlX21tdV9jYWNoZSgpIGhhdmUgdGhlIG5lY2Vzc2FyeSBiYXJyaWVycy4KPiA+ID4g
KyAgICAgICAgKi8KPiA+ID4gKyAgICAgICBpZiAocHRlX3ZhbChwdGV2YWwpICYgKF9QQUdFX1BS
RVNFTlQgfCBfUEFHRV9HTE9CQUwpKQo+ID4gPiArICAgICAgICAgICAgICAgUklTQ1ZfRkVOQ0Uo
cncscncpOwo+ID4KPiA+IE9ubHkgYSBzZmVuY2Uudm1hIGNhbiBndWFyYW50ZWUgdGhhdCB0aGUg
UFRXIGFjdHVhbGx5IHNlZXMgYSBuZXcKPiA+IG1hcHBpbmcsIGEgZmVuY2UgaXMgbm90IGVub3Vn
aC4gVGhhdCBiZWluZyBzYWlkLCBuZXcga2VybmVsIG1hcHBpbmdzCj4gPiAodm1hbGxvYyBvbmVz
KSBhcmUgY29ycmVjdGx5IGhhbmRsZWQgaW4gdGhlIGtlcm5lbCBieSB1c2luZwo+ID4gZmx1c2hf
Y2FjaGVfdm1hcCgpLiBEaWQgeW91IG9ic2VydmUgc29tZXRoaW5nIHRoYXQgdGhpcyBwYXRjaCBm
aXhlcz8KPiBUaHggZm9yIHRoZSByZXBseSEKPgo+IFRoZSBzZmVuY2Uudm1hIGlzIHRvbyBleHBl
bnNpdmUsIHNvIHRoZSBzaXR1YXRpb24gaXMgdHJpY2t5LiBTZWUgdGhlCj4gYXJtNjQgY29tbWl0
OiA3ZjBiMWJmMDQ1MTEgKCJhcm02NDogRml4IGJhcnJpZXJzIHVzZWQgZm9yIHBhZ2UgdGFibGUK
PiBtb2RpZmljYXRpb25zIiksIHdoaWNoIGlzIHNpbWlsYXIuIFRoYXQgaXMsIGxpbnV4IGFzc3Vt
ZXMgaW52YWxpZCBwdGUKPiB3b24ndCBnZXQgaW50byBUTEIuIFRoaW5rIGFib3V0IG1lbW9yeSBo
b3RwbHVnOgo+Cj4gbW0vc3BhcnNlLmM6IHNwYXJzZV9hZGRfc2VjdGlvbigpIHsKPiAuLi4KPiAg
ICAgICAgIG1lbW1hcCA9IHNlY3Rpb25fYWN0aXZhdGUobmlkLCBzdGFydF9wZm4sIG5yX3BhZ2Vz
LCBhbHRtYXAsIHBnbWFwKTsKPiAgICAgICAgIGlmIChJU19FUlIobWVtbWFwKSkKPiAgICAgICAg
ICAgICAgICAgcmV0dXJuIFBUUl9FUlIobWVtbWFwKTsKPgo+ICAgICAgICAgLyoKPiAgICAgICAg
ICAqIFBvaXNvbiB1bmluaXRpYWxpemVkIHN0cnVjdCBwYWdlcyBpbiBvcmRlciB0byBjYXRjaCBp
bnZhbGlkIGZsYWdzCj4gICAgICAgICAgKiBjb21iaW5hdGlvbnMuCj4gICAgICAgICAgKi8KPiAg
ICAgICAgIHBhZ2VfaW5pdF9wb2lzb24obWVtbWFwLCBzaXplb2Yoc3RydWN0IHBhZ2UpICogbnJf
cGFnZXMpOwo+IC4uLgo+IH0KPiBUaGUgc2VjdGlvbl9hY3RpdmF0ZSB3b3VsZCB1c2Ugc2V0X3B0
ZSB0byBzZXR1cCB2bWVtbWFwLCBhbmQKPiBwYWdlX2luaXRfcG9pc29uIHdvdWxkIGFjY2VzcyB0
aGVzZSBwYWdlcycgc3RydWN0LgoKU28gSSB0aGluayB0aGUgZ2VuZXJpYyBjb2RlIG11c3QgYmUg
Zml4ZWQgYnkgYWRkaW5nIGEKZmx1c2hfY2FjaGVfdm1hcCgpIGluIHZtZW1tYXBfcG9wdWxhdGVf
cmFuZ2UoKSBvciBzaW1pbGFyOiBzZXZlcmFsCmFyY2hpdGVjdHVyZXMgaW1wbGVtZW50IGZsdXNo
X2NhY2hlX3ZtYXAoKSBiZWNhdXNlIHRoZXkgbmVlZCB0byBkbwoic29tZXRoaW5nIiBhZnRlciBh
IG5ldyBtYXBwaW5nIGlzIGVzdGFibGlzaGVkLCBzbyB2bWVtbWFwIHNob3VsZCBub3QKYmUgYW55
IGRpZmZlcmVudC4KCj4KPiBUaGF0IG1lYW5zOgo+IHNkIHQwLCAoYTApIC8vIGEwID0gc3RydWN0
IHBhZ2UncyBwdGUgYWRkcmVzcywgcHRldmFsIGlzIGNoYW5nZWQgZnJvbQo+IGludmFsaWQgdG8g
dmFsaWQKPiAgLi4uCj4gbHcvc3cgdDEsIChhMSkgLy8gYTEgPSB2YSBvZiBzdHJ1Y3QgcGFnZQo+
Cj4gSWYgdGhlIGx3L3N3IGluc3RydWN0aW9uIGlzIGV4ZWN1dGVkIHNwZWN1bGF0aXZlbHkgYmVm
b3JlIHRoZSBzZXRfcHRlLAo+IHdlIG5lZWQgYSBmZW5jZSB0byBwcmV2ZW50IHRoaXMuCgpZZXMg
SSBhZ3JlZSwgYnV0IHRvIG1lIHdlIG5lZWQgdGhlIGZlbmNlIHByb3BlcnR5IG9mIHNmZW5jZS52
bWEgdG8KbWFrZSBzdXJlIHRoZSBQVFcgc2VlcyB0aGUgbmV3IHB0ZSwgdW5sZXNzIEknbSBtaXN0
YWtlbiBhbmQgc29tZXRoaW5nCmluIHRoZSBwcml2aWxlZ2VkIHNwZWNpZmljYXRpb24gc3RhdGVz
IHRoYXQgYSBmZW5jZSBpcyBlbm91Z2g/Cgo+Cj4gPgo+ID4gVGhhbmtzLAo+ID4KPiA+IEFsZXgK
PiA+Cj4gPiA+ICB9Cj4gPiA+Cj4gPiA+ICB2b2lkIGZsdXNoX2ljYWNoZV9wdGUocHRlX3QgcHRl
KTsKPiA+ID4gLS0KPiA+ID4gMi40MC4xCj4gPiA+Cj4KPgo+Cj4gLS0KPiBCZXN0IFJlZ2FyZHMK
PiAgR3VvIFJlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
