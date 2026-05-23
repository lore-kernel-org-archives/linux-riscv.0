Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D87DCD5BAC
	for <linux-riscv@archiver.kernel.org>; Sat, 23 May 2026 09:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DVoVL2U47bnSw4xg8EZLP0qn0gol1/g6HceWuNOi2JM=; b=hn6ctbTPVnLmoN
	TO7rI1VLe8P/9CP2JzpXqic+fWmgADelR73HAQbGGEnHYP55Pn6/A0fbWO/v0glD8RbsYgAsglHgk
	1Mh5XxIMmOYNxFX9Jf5TFsRkVugM3VfLN4jiETaIWWoL192TrA/6DUrJsLmoOb4gtejSWUab4QnDD
	9Tit9eOvpmTgLS5RAmirnxAIasjIl0qCV+0wQo40jXFuKVu2nlGC7ydVDAH+oD8ftdWOa7SWPNl4w
	UpOy2Wor4r4ifwABBW33UVWCk8ypvGkgRn9ncXZ8Xu9YQqEe1FC/M36kytrt5wT9v5PRLX6zUGA+e
	I6/Yyzd7c3TyHcekMp7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQiMY-0000000CzUQ-0Ty9;
	Sat, 23 May 2026 09:09:42 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQiMV-0000000CzTh-1dYU
	for linux-riscv@lists.infradead.org;
	Sat, 23 May 2026 09:09:40 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-479d9b155deso2634887b6e.3
        for <linux-riscv@lists.infradead.org>; Sat, 23 May 2026 02:09:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779527377; cv=none;
        d=google.com; s=arc-20240605;
        b=VAY+oIfwelFEwD/v0YTyHrvYW2L9NrjLeqqS9FekEHCAJ9ljbFj29ExH0ZHltae9RS
         a1z8SBjAW0L22S5MkIBtV+GoHD8Oicpyvqag8SYtziA0Yr5wsmxNZMndVdsK9VH3zGcN
         ywPnmQP5QX/Z0yAzRvsXcDaXqBfOhUu/g5VI0iege8fJP/p66N35GUWjL1M3dewYEhpe
         ezwYHvtGCRxBSBiPlOcTyhBEpNW6+KVTa6KPG3H3fI7Jn4EHKi9exJwIoPatX26Zsdye
         4qGq3L/KfK9QNd8GJGJabws9jlTOSbHZcv0QPMb1XDxXU2159tuuVk0ZMnrlUSjMMEoT
         nL6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ejKlmW0zzmF8irdxZs3kE5YHW68V4KSA3AOJZ+dT/PQ=;
        fh=OmESp52FssymvbUe8uSR7NWQxsncUnjm1fzvjJFzDeo=;
        b=jGyWcLKkPVZI4Ijg41L3MFgQIGreHa5pzTmdUaPPXqK92YVG7iFUX6RB6NuKj5Z7cU
         kmibdsKmKXv8b4fzrC68F2aNuQ51OZeIV0S903I8nogmBlVWq1cugKY7y3DakhOlxNiU
         OKvVafQTtGE9nSySNYz1NdnAyyrrrx4mAanYQCfTQ57hk1QmMh88M0492uu6MPLR5v2z
         aw3GKsGHR7vaDSgOY0DzNaggCVkSh8KQgqhNgOzCjCF2R1TJVOGD6XAw4js1wZxl4Ug/
         s34ne8DI1jJYnPI8VzV26U0Rt2JIpqvA36pt+TjLdFTpFEeaMbFFJhu7yJ12r60vXY2t
         gxHA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779527377; x=1780132177; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ejKlmW0zzmF8irdxZs3kE5YHW68V4KSA3AOJZ+dT/PQ=;
        b=ZiyBBebCz7QX4MxXBnOMjGcCbA4uvPDvFBb+4yj7ucr0LyD74iNh+Znvdo8PsXE3S4
         0vltBtEDHHoHHeQDgce3VZ4Pl7/AU5ELahH2rGcPcdL2phxoSdEEkGScG+PsR5tnFw2W
         MRN4k0X0Zk8IB7BAMMfwhldIZe1SUQ6OM5Ur/6BPQJw50NKN421flF55JkCxIyXqjoZR
         hdIljfxTDeLcMNsrm5I02gIuKE1zjrrlUMzYvJvVlMgXeV/nVh+C9ZyK9+/iTZqTGON9
         J/20Q3iPqOrSEGeEQaAoj+osBq6tlGu9cCGIus5zmUBt1hMKSyF7nvV8iIzbL8+RQlR4
         XijQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779527377; x=1780132177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ejKlmW0zzmF8irdxZs3kE5YHW68V4KSA3AOJZ+dT/PQ=;
        b=dwj7CuZgJNxkFgGTn6LQzWYGy4XXRgJ9SIsSrsKWRku0v0xkN2CT6+1i7/WAwTRqIr
         ukuD/cRXuphEVAI6OoYiOiQv/EUiCTz4uYCcC6wTFHm4GUFG+4FDnGB+yGgTpZU01a0F
         7SDLsOqB0Ux24YCQ+u29uJZ2Cfj7VAkdiYD8bdxlsCQMeyI+4Ih4kTKYoKJHkQFkP9eq
         0BX2mLxLkQGgK+7eA1ktLgRO3CFgENPYWlSU5G1brDuC+SieZoFu2vLXPgBCYazwDtPC
         IT2LJzNN/RhYSplpaZHJlvHPnx9B5qBwcjoEdzxM6CsL69JRRdp3LAcXtp1W7rFY9M8o
         IenQ==
X-Forwarded-Encrypted: i=1; AFNElJ+pNIT4BXgJSTCwzI9bNaCdVdyXbytvi78GZYTpdStZcWjZyCr9JRT0pLkYisI2Fkbg7ZgCEvrVTRMtAw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyhPrYT7p2ywLXpI0Ismr+QjVcjpjIef0Bh7ViJMl9716sVhg63
	bpvAuakUj/j0Y/55cHqUvWqILde8cL3b1wvcCymuOSfe6cxXjkii+EiYAEmPVNEM9ZThRrYqxJt
	PispTFlg5NtEr7JI49nVi6Jr54HyL3uU=
X-Gm-Gg: Acq92OHcWxqUyfqNLdte542jyrhOJtjlbGx9+b2IBtde/Ph2rL+A0JUaeSx+lT3b4hc
	cdAomlq4a2WgugRaxgjGIoYsnJ7UQsPcwN1tE9Ru6CMUdgmzJyBnmF+0HtHG6RPtdATG6GXGeNU
	vfrJcpbkAjk4jE5o7w3O0PwJaISu077WPM6MX7AXTt1gu7GQOXuq8HUTVLU05biYO+g1KFjup/F
	Lm8pClm2UkG/wbmkKkBMWXaGtWNgIt7XGTQ3BMDHh0PcCQaUUs54uYR5RJCchvkiAIDnhJ1IZ3A
	3w6tFIk=
X-Received: by 2002:a05:6808:80a6:b0:46e:df55:23fa with SMTP id
 5614622812f47-4854a0e00d5mr4060915b6e.17.1779527377468; Sat, 23 May 2026
 02:09:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260517-sf21-topcrm-v1-0-438f2e0513ff@gmail.com>
 <20260517-sf21-topcrm-v1-4-438f2e0513ff@gmail.com> <agsEWo_mo5rzUAAH@pie>
 <CAJsYDVJZW2VYFaxzJRg2+CJZbvqq_iRXaf7+zYvidQn0AiviKQ@mail.gmail.com> <ahB46uuoFQxKgr7r@pie>
In-Reply-To: <ahB46uuoFQxKgr7r@pie>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Sat, 23 May 2026 17:09:26 +0800
X-Gm-Features: AVHnY4Lk36CbWgZqCYBOQQ0bLGYLlT53IZSzrrfoEn7qhEuTPaAPNqycRD4gpcY
Message-ID: <CAJsYDV+cSbUu6EtgMjWT=3vjFX9w7DMNPhhBPRN2pzF0wJGwsA@mail.gmail.com>
Subject: Re: [PATCH 4/4] clk: add support for siflower sf21-topcrm
To: Yao Zi <me@ziyao.cc>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260523_020939_443227_DFD050A1 
X-CRM114-Status: GOOD (  40.18  )
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

T24gRnJpLCBNYXkgMjIsIDIwMjYgYXQgMTE6NDXigK9QTSBZYW8gWmkgPG1lQHppeWFvLmNjPiB3
cm90ZToKPgo+IE9uIE1vbiwgTWF5IDE4LCAyMDI2IGF0IDA5OjM0OjE3UE0gKzA4MDAsIENodWFu
aG9uZyBHdW8gd3JvdGU6Cj4gPiBIaSEKPiA+Cj4gPiBPbiBNb24sIE1heSAxOCwgMjAyNiBhdCA4
OjIy4oCvUE0gWWFvIFppIDxtZUB6aXlhby5jYz4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIFN1biwg
TWF5IDE3LCAyMDI2IGF0IDEwOjEyOjU4UE0gKzA4MDAsIENodWFuaG9uZyBHdW8gd3JvdGU6Cj4K
PiAuLi4KPgo+ID4gPgo+ID4gPiBbLi4uXQo+ID4gPgo+ID4gPiBCZXNpZGVzIGZpZWxkL3JlZ2lz
dGVyIG9mZnNldHMsIHRoZSBvbmx5IGRpZmZlcmVuY2UgSSBjb3VsZCB0ZWxsIGJldHdlZW4KPiA+
ID4gY21ucGxsX3Bvc3RkaXYgYW5kIHBjaWVwbGxfZm91dCBpcyB0aGF0IHBjaWVwbGxfZm91dCBj
bG9ja3MgY291bGQgYmUKPiA+ID4gZ2F0ZWQuCj4gPiA+Cj4gPiA+IFdvdWxkIGl0IGJlIGEgZ29v
ZCBpZGVhIHRvIGRlc2NyaWJlIHRoZSBnYXRpbmcgZnVuY3Rpb24gc2VwYXJhdGVseSBhcyBhCj4g
PiA+IGNsb2NrLCBhbmQgbWVyZ2UgdGhlIGNvbW1vbiBwYXJ0IG9mIHBjaWVwbGxfZm91dCBhbmQg
Y21ucGxsX3Bvc3RkaXY/IEluCj4gPiA+IHdoaWNoIHdheSB5b3UgY291bGQgc2F2ZSBhIGxvdCBv
ZiBtb3N0bHkgZHVwbGljYXRlZCBjb2RlLgo+ID4KPiA+IEkgZG9uJ3QgdGhpbmsgc28uIFNpbmNl
IHRoZSBtYWpvcml0eSBvZiB0aGUgZXhpc3RpbmcgY29kZSBhcmUgcmVnaXN0ZXIKPiA+IG9wZXJh
dGlvbnMsIGFuZCB0aGUgcmVnaXN0ZXIgYml0IGxheW91dCBhcmUgY29tcGxldGVseSBkaWZmZXJl
bnQsCj4gPiB0aGVyZSBpc24ndCBtdWNoIHRvIHNoYXJlIGJldHdlZW4gdGhlc2UgdHdvIFBMTHMu
Cj4gPiBXcml0aW5nIGEgc3RydWN0IHRvIGRlc2NyaWJlIGJvdGggcmVnaXN0ZXIgbGF5b3V0cyB0
b2dldGhlciBzZWVtcwo+ID4gdW5uZWNlc3NhcmlseSBjb21wbGljYXRlZCBhbmQgaGFyZGVyIHRv
IHJlYWQuCj4KPiBJJ20gbm90IHN1Z2dlc3RpbmcgbWVyZ2luZyB0aGUgaW1wbGVtZW50YXRpb24g
b2YgdGhlIHR3byBQTExzCj4gdGhlbXNlbHZlcywgYnV0IG9ubHkgdGhlIHR3byB0eXBlcyBvZiBj
bG9ja3MgZGVyaXZlZCBmcm9tIHRoZW0sCj4gaS5lLiBjbW5wbGxfcG9zdGRpdiBhbmQgcGNpZXBs
bF9mb3V0LgoKSSBkb24ndCBmZWVsIGxpa2UgYXJiaXRyYXJpbHkgc3BsaXR0aW5nIGEgc2luZ2xl
IGNsb2NrIGludG8gdHdvIGFuZCBleHBvc2luZwphbiBpbnRlcm5hbCBjbG9jayB1bnVzZWQgYnkg
YW55dGhpbmcgb3V0c2lkZSB0aGUgUExMIGJsb2NrIGlzIGEgZ29vZCBpZGVhLgpJJ2xsIHRyeSBy
ZXVzaW5nIHRoZSBvcHMgYW5kIG9taXQgdGhlIGVuYWJsZS9kaXNhYmxlIGNhbGwgZm9yIGNtbnBs
bF9wb3N0ZGl2LgoKPgo+ID4gQlRXIHRoZSBDTU5QTEwgYW5kIFBDSUVQTEwgYXJlIGFjdHVhbGx5
IGRpZmZlcmVudCBoYXJkd2FyZS4KPiA+IFRoZSBmb3JtZXIgaXMgYW4gaW50ZWdlciBQTEwgd2hp
bGUgdGhlIGxhdHRlciBhY3R1YWxseSBzdXBwb3J0cwo+ID4gZnJhY3Rpb25hbCBvcGVyYXRpb25z
LiBJIGRpZG4ndCBhZGQgc3VwcG9ydCBmb3IgdGhlIGZyYWN0aW9uYWwgcGFydAo+ID4gZHVlIHRv
IHRoZSBsYWNrIG9mIHVzZSBjYXNlcyBhbmQgZG9jdW1lbnRhdGlvbi4gUENJRSBhbmQgR01BQwo+
ID4gY2xvY2tzIGFyZSBmZWQgYnkgdGhpcyBQTEwgYW5kIHJlcXVpcmUgZXhhY3QgY2xvY2sgZnJl
cXVlbmNpZXMKPiA+IHdoaWNoIGNhbiBiZSBhY2hpZXZlZCB1c2luZyBvbmx5IHRoZSBpbnRlZ2Vy
IG1vZGUuCj4gPgo+ID4gPgo+ID4gPiA+ICsgICAgIC5yZWNhbGNfcmF0ZSA9IHNmMjFfcGNpZXBs
bF9mb3V0X3JlY2FsY19yYXRlLAo+ID4gPiA+ICsgICAgIC5kZXRlcm1pbmVfcmF0ZSA9IHNmMjFf
cGNpZXBsbF9mb3V0X2RldGVybWluZV9yYXRlLAo+ID4gPiA+ICsgICAgIC5zZXRfcmF0ZSA9IHNm
MjFfcGNpZXBsbF9mb3V0X3NldF9yYXRlLAo+ID4gPiA+ICt9Owo+ID4gPiBbLi4uXQo+ID4gPiA+
ICsKPiA+ID4gPiArICAgICBzcGluX2xvY2tfaXJxc2F2ZShjbW5fcHJpdi0+bG9jaywgZmxhZ3Mp
Owo+ID4gPiA+ICsgICAgIGlmIChpbmRleCkKPiA+ID4gPiArICAgICAgICAgICAgIHNmX3Jtdyhj
bW5fcHJpdiwgbXV4X3JlZywgMCwgQklUKG11eF9vZmZzKSk7Cj4gPiA+ID4gKyAgICAgZWxzZQo+
ID4gPiA+ICsgICAgICAgICAgICAgc2Zfcm13KGNtbl9wcml2LCBtdXhfcmVnLCBCSVQobXV4X29m
ZnMpLCAwKTsKPiA+ID4gPiArCj4gPiA+ID4gKyAgICAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZShj
bW5fcHJpdi0+bG9jaywgZmxhZ3MpOwo+ID4gPiA+ICsgICAgIHJldHVybiAwOwo+ID4gPiA+ICt9
Cj4gPiA+Cj4gPiA+IEkgYmVsaWV2ZSBiZXNpZGVzIHRoZSBkaXZpZGVyIHJlbG9hZGluZyBwYXJ0
LCBjbGtfbXV4X29wcywKPiA+ID4gY2xrX2RpdmlkZXJfb3BzLCBhbmQgY2xrX2dhdGVfb3BzIGhh
dmUgYWxyZWFkeSBwcm92aWRlZCB0aGUgbG9naWMKPiA+ID4geW91IGltcGxlbWVudGVkIGhlcmUu
IFNvIGl0IG1pZ2h0IGJlIGEgYmV0dGVyIG9wdGlvbiB0byBjb21wb3NpdGUgdGhlbQo+ID4gPiB0
b2dldGhlciB0byBpbXBsZW1lbnQgeW91ciBjbG9ja3MgaW5zdGVhZCBvZiBidWlsZGluZyBmcm9t
IHNjcmF0Y2guCj4gPgo+ID4gVGhlIGRpdmlkZXIgcmVsb2FkaW5nIGlzIHRoZSBleGFjdCByZWFz
b24gSSBjaG9zZSB0byBub3QgY29tcG9zZSB0aGVtCj4gPiB3aXRoIHRoZSBmdW5jdGlvbiB5b3Ug
bWVudGlvbmVkLiBUaGUgcmVsb2FkaW5nIGJpdCBuZWVkIHRvIGJlIHNldCBvbgo+ID4gYm90aCBj
bG9jayBkaXZpZGVyIGNoYW5nZSBhbmQgY2xvY2sgZW5hYmxpbmcsIGJlY2F1c2UgdGhlIGNsb2Nr
IGRpdmlkZXIKPiA+IGxvYWRpbmcgb25seSBoYXBwZW5zIHdoZW4gdGhlIGNsb2NrIGlzIHJ1bm5p
bmcuIFNpbmNlIEkgYWxyZWFkeSBoYXZlCj4gPiB0byB3cml0ZSB0d28gb2YgdGhlIHRocmVlIHBh
cnRzIHlvdSBtZW50aW9uZWQsIHRyeWluZyB0byByZXVzZQo+ID4gY2xrX211eF9vcHMgZG9lc24n
dCBzZWVtIHRvIHJlZHVjZSB0aGUgY29kZSBjb21wbGV4aXR5IGhlcmUuCj4KPiBZb3UgZG9uJ3Qg
aGF2ZSB0byB3cml0ZSBkaXZpZGVyL2dhdGUgb3BlcmF0aW9ucyBmcm9tIHNjcmF0Y2gsIGJ1dCBv
bmx5Cj4gd3JhcHBlcnMgdGhhdCBmaXJzdCBjYWxsIGNsa197ZGl2aWRlcixnYXRlfV9vcHMuKiB0
aGVuIHRyaWdnZXIgZnJlcXVlbmN5Cj4gcmVsb2FkaW5nLgoKVGhlIHdyYXBwZXIgbmVlZHMgdG8g
YmUgc3BpbmxvY2sgKyBmcmVxdWVuY3kgcmVsb2FkaW5nIHRyaWdnZXIsCmJlY2F1c2UgdGhlIGJ1
aWx0LWluIHNwaW5sb2NrIHJvdXRpbmUgb25seSBjb3ZlcnMgdGhlIGRpdmlkZXIvZ2F0ZS4Kd3Jp
dGluZy4gSSBzZWUgbm8gcG9pbnQgd3JhcHBpbmcgYWxsIHRoZSBjYWxsYmFja3MgYW5kIHdyaXRp
bmcgYSB3YXkKbW9yZSBjb21wbGljYXRlZCBwcm9iZSByb3V0aW5lIGp1c3QgdG8gcmV1c2UgYSBm
ZXcgbGluZXMgb2YKY2FsY3VsYXRpb25zICsgcmVnaXN0ZXIgb3BzLgoKPgo+ID4gSXQncyBqdXN0
IHRyYWRpbmcgZ2V0X3BhcmVudCBhbmQgc2V0X3BhcmVudCBjYWxsIHdpdGggb25lIG1vcmUgbGV2
ZWwKPiA+IGluIHRoZSBjbG9jayB0cmVlIGZvciBldmVyeSBjbG9jayBhbmQgbW9yZSBjb2RlIHRv
IHdpcmUgdGhlbSB0b2dldGhlcgo+ID4gaW4gdGhlIHByb2JlIGZ1bmN0aW9uLgoKSSBqdXN0IGxl
YXJuZWQgdGhhdCBjbGtfaHdfcmVnaXN0ZXJfY29tcG9zaXRlIHdvbid0IHJlc3VsdCBpbgpvbmUg
bW9yZSBsZXZlbCBvZiBjbG9jay4gYnV0IHRoZSBzZWNvbmQgcGFydCBzdGlsbCBpcyB0cnVlLgpJ
biBvcmRlciB0byByZXVzZSB0aGUgbWVudGlvbmVkIGtlcm5lbCBmdW5jdGlvbiBJIGhhdmUgdG8g
Z2l2ZQp1cCBvbiBteSBjdXJyZW50IHNpbmdsZSBmb3ItbG9vcCBwcm9iZSBmdW5jdGlvbiwgYWRk
IGEgc2VwYXJhdGVkCmFycmF5IG9mIGNsb2NrcyB3aXRoIG11eC9kaXYvZ2F0ZSwgbXV4LW9ubHks
IGRpdi1vbmx5LCBnYXRlLW9ubHkKY2xvY2tzLCBhbmQgd3JpdGUgc2VwYXJhdGVkIHByb2JlIHJv
dXRpbmVzIGZvciB0aGVtIGJlY2F1c2UKdGhlIGNsb2NrIGNvbXBvc2l0aW9uIGlzIGRpZmZlcmVu
dC4gVGhlIGN1cnJlbnQgc3RhdGljIHBvaW50ZXJzCmluIHN0cnVjdCBzZjIxX2h3X2Nsa3Mgd2ls
bCBhbHNvIG5lZWQgdG8gYmUgcmVwbGFjZWQgYmVjYXVzZQpjbGtfaHdfcmVnaXN0ZXJfY29tcG9z
aXRlIGFsbG9jYXRlcyBpdHMgb3duIGNsa19odyBpbnN0ZWFkLgoKSSdkIGFyZ3VlIHRoYXQgdGhl
IHBvaW50IG9mIHJldXNpbmcgY29kZSBpcyB0byByZWR1Y2UgY29kZQpkdXBsaWNhdGlvbiBhbmQg
c2ltcGxpZnkgdGhlIGRyaXZlci4KSW4gdGhpcyBjYXNlIEkgY291bGQgb25seSBzZWUgdGhlIGRy
aXZlciBnZXR0aW5nIHdheSBtb3JlCmNvbXBsZXggaW4gb3JkZXIgdG8gcmV1c2UgdGhlIHJvdXRp
bmUgeW91IG1lbnRpb25lZC4KCi0tIApSZWdhcmRzLApDaHVhbmhvbmcgR3VvCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
