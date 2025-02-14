Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB3A1C02198
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Feb 2025 06:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v6BA34MBx1DGqwXvL+JDDNlqlrUDmy2izc+mfq2VqE8=; b=V7u00yRY0V0IOU
	n8Pu2HIq8Tn2OzqGsjO0FtXrn4qSKYLRrMVsuiVP9YdTYTqcvibzZojjAklGpUWHVgG6pUg7xlPBj
	sV27WfOMt9VfJRhhYpl1Ej2cjYcspPs1IhdbuWVCliQjGVwt744JyqfcXv26IEdi1j2FvM4bNYHSQ
	qxjCllKlT4dhmsu/1RhamB4m0dBJyWudrod55x6rbpWa0dqqAEgqJz/LQY3tmbi/A8s75PKU8Y30W
	u0UdY02hcqEji2NQ1aVOzjJ2LXFl6rGbBwR5FvnAPIhI3ijPZxT8lRqhLrKOerpiiHTZAa7loLLLV
	rDBghDWqJnA/AoufjgzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiop5-0000000Dlha-0zLE;
	Fri, 14 Feb 2025 06:05:11 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiop2-0000000DlhB-174a
	for linux-riscv@lists.infradead.org;
	Fri, 14 Feb 2025 06:05:09 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-38dd14c9a66so762568f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 13 Feb 2025 22:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1739513106; x=1740117906; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8GL1+uMNBu0SazZFpMvaXEzpnl+GmzSPEG+r8Eq9ugU=;
        b=jxpiaesTxo3/HdxyVPWCEPVfvITlx3zyjaWfvnOQci78AZ6T6pCIOhVuB1DhO0ks1o
         7cURy145YWJQON8sA6mEfp+1UlgzirgYMuJY4EjdLEiCH62IMyfJLoVUtPhIcFAxdrNU
         CHVV4yayb01iwJ06HEGHSaAYT5wNiRCoWdjGqO1UXe1GEGcSdrDH0GlRMFdJWvm+WhNX
         UhM2/Wa54N3G0N65GjngyQEgutCA/FWHxG2eTJMZqHLojiov18EXJwejpm6+1BPIRo3J
         OskkRe2ppLAy+e0Q1pq+tuMAOzNN1jCzj5WaybE8/JuS/7+uW72RR1CT3QHakXPSjIc4
         BaDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739513106; x=1740117906;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8GL1+uMNBu0SazZFpMvaXEzpnl+GmzSPEG+r8Eq9ugU=;
        b=DdjjhFHcsO2bknsLKdhN0EwgI9T2SIFNKgNqVMPmUTCPKqlIWzxS4TXXtuThZJ1BgF
         u6ST9vN8RPurlRjht4iwcMX/JMJcs4y/mpeDZ2BQ9oLnT3YBEhoYRFmK07d35nRDh69A
         ABNTtZ1FDkHWzQyivRChXpRWjc1gv7YDnGSpcoOqDGNnvhD7kbAiswbfhIzPPLeroL+J
         QyD/KPxENCMeEK0rQGTt5+aQ/vyNnCJjhK11NBjchfsFDr/QwGphznrMHXbyWOenHlH2
         gx0zpnBvpLOQNgdGbbPqg+Lr2j95ia3hnRp/55kP+/DDVEApx4E68OIURNJhEZO6msdH
         lDbA==
X-Forwarded-Encrypted: i=1; AJvYcCUIy8ieNJZJcsg2Fet3ItXVf80GA/A6Kjx3KvRdlTNGWaB9NBvtDqZFv/Aur5blUCbp/HL/g9rBYLu3eQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxrL9O4zKMbCsv3xyBczd4WFj32RYe4GI3UZLXXWJh++1yhbJhh
	wsSQtWTvYKgo0lk1Kryn8vCMEkyd51rsWoZwHT5o58vBTva6M2GQ7jIjG56BRq0=
X-Gm-Gg: ASbGncs4CBKCGkw+YaK7zGnJwuhwx6TF6kzB5KMPZ/OTQa/+XfQRzE190/F9fgATffe
	rMxq/pnh8nVsAo9tpG+mML/XfV7dK4FTY8hDdmBHICnRYmPMqURe/vUwuzN7Y3PI93rOhgv8aa3
	BEAoMUciLrqfa21qZO0ul4n0sAj7u/ln4CEjp+bZfuvVuxB+rZzYov9IIhc2Bm/Bum5O0LGEenj
	7cQsFbe6trZkdtAnoFg4YnyiDxYFEm/yBNxj6bNqhq+aEOxKT6+2WuWSfpLKYcbCn0LCXXh2EvL
	D8ihmz7T9QrYiijQJUDUJc5ewIgG
X-Google-Smtp-Source: AGHT+IHd25u3Q2I6jS80Y+yh5R9GFpw15aq+J7xqJ2e+hhm2TKf+u8x4399qIS2YV+1Txeq2km5rqw==
X-Received: by 2002:a5d:5987:0:b0:38f:2401:a6a6 with SMTP id ffacd0b85a97d-38f2401a738mr6402658f8f.12.1739513106090;
        Thu, 13 Feb 2025 22:05:06 -0800 (PST)
Received: from smtpclient.apple ([131.111.5.201])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b431fsm3657389f8f.2.2025.02.13.22.05.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Feb 2025 22:05:04 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: [External] [PATCH] riscv/futex: sign extend compare value in
 atomic cmpxchg
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <CAEEQ3wmH9MCYCfLL4Q7R7BHWbiQso+xr=zjhizY+kA5xtNzEzw@mail.gmail.com>
Date: Fri, 14 Feb 2025 06:04:53 +0000
Cc: patchwork-bot+linux-riscv@kernel.org,
 Andreas Schwab <schwab@suse.de>,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <C823738D-8FE1-4746-A8CF-627DFB596365@jrtc27.com>
References: <mvmfrkv2vhz.fsf@suse.de>
 <173947144178.1330575.8179936961826705707.git-patchwork-notify@kernel.org>
 <CAEEQ3wmH9MCYCfLL4Q7R7BHWbiQso+xr=zjhizY+kA5xtNzEzw@mail.gmail.com>
To: yunhui cui <cuiyunhui@bytedance.com>
X-Mailer: Apple Mail (2.3826.300.87.4.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_220508_320459_B9126702 
X-CRM114-Status: GOOD (  17.22  )
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

T24gMTQgRmViIDIwMjUsIGF0IDA0OjExLCB5dW5odWkgY3VpIDxjdWl5dW5odWlAYnl0ZWRhbmNl
LmNvbT4gd3JvdGU6Cj4gCj4gSGksCj4gCj4gT24gRnJpLCBGZWIgMTQsIDIwMjUgYXQgMjozMeKA
r0FNIDxwYXRjaHdvcmstYm90K2xpbnV4LXJpc2N2QGtlcm5lbC5vcmc+IHdyb3RlOgo+PiAKPj4g
SGVsbG86Cj4+IAo+PiBUaGlzIHBhdGNoIHdhcyBhcHBsaWVkIHRvIHJpc2N2L2xpbnV4LmdpdCAo
Zml4ZXMpCj4+IGJ5IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPjoKPj4gCj4+
IE9uIE1vbiwgMDMgRmViIDIwMjUgMTE6MDY6MDAgKzAxMDAgeW91IHdyb3RlOgo+Pj4gTWFrZSBz
dXJlIHRoZSBjb21wYXJlIHZhbHVlIGluIHRoZSBsci9zYyBsb29wIGlzIHNpZ24gZXh0ZW5kZWQg
dG8gbWF0Y2gKPj4+IHdoYXQgbHIudyBkb2VzLiAgRm9ydHVuYXRlbHksIGR1ZSB0byB0aGUgY29t
cGlsZXIga2VlcGluZyB0aGUgcmVnaXN0ZXIKPj4+IGNvbnRlbnRzIHNpZ24gZXh0ZW5kZWQgYW55
d2F5IHRoZSBsYWNrIG9mIHRoZSBleHBsaWNpdCBleHRlbnNpb24gZGlkbid0Cj4+PiByZXN1bHQg
aW4gd3JvbmcgY29kZSBzbyBmYXIsIGJ1dCB0aGlzIGNhbm5vdCBiZSByZWxpZWQgdXBvbi4KPj4+
IAo+Pj4gRml4ZXM6IGI5MGVkYjMzMDEwYiAoIlJJU0MtVjogQWRkIGZ1dGV4IHN1cHBvcnQuIikK
Pj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJlYXMgU2Nod2FiIDxzY2h3YWJAc3VzZS5kZT4KPj4+IAo+
Pj4gWy4uLl0KPj4gCj4+IEhlcmUgaXMgdGhlIHN1bW1hcnkgd2l0aCBsaW5rczoKPj4gIC0gcmlz
Y3YvZnV0ZXg6IHNpZ24gZXh0ZW5kIGNvbXBhcmUgdmFsdWUgaW4gYXRvbWljIGNtcHhjaGcKPj4g
ICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9yaXNjdi9jLzVjMjM4NTg0YmNlNQo+PiAKPj4gWW91
IGFyZSBhd2Vzb21lLCB0aGFuayB5b3UhCj4+IC0tCj4+IERlZXQtZG9vdC1kb3QsIEkgYW0gYSBi
b3QuCj4+IGh0dHBzOi8va29yZy5kb2NzLmtlcm5lbC5vcmcvcGF0Y2h3b3JrL3B3Ym90Lmh0bWwK
Pj4gCj4+IAo+IAo+IEkgYXBwbGllZCB0aGlzIHBhdGNoLCBidXQgaXQgZG9lc24ndCBzZWVtIHRv
IHRha2UgZWZmZWN0LiBUaGVyZSBpcyBubwo+IHNpZ24gZXh0ZW5zaW9uIGZvciBhMiBpbiB0aGUg
YXNzZW1ibHkgY29kZS4gV2hhdCBkaWQgSSBtaXNzPwo+IEdDQyB2ZXJzaW9uID49IDEzLgo+IAo+
IGZmZmZmZmZmODAwZTg3ZTAgPGZ1dGV4X2F0b21pY19jbXB4Y2hnX2luYXRvbWljPjoKPiBmZmZm
ZmZmZjgwMGU4N2UwOiAxMTQxICAgICAgICAgICAgICAgIGFkZGkgc3Asc3AsLTE2Cj4gZmZmZmZm
ZmY4MDBlODdlMjogZTQyMiAgICAgICAgICAgICAgICBzZCBzMCw4KHNwKQo+IGZmZmZmZmZmODAw
ZTg3ZTQ6IDJiZjAxNzkzICAgICAgICAgIGJzZXRpIGE1LHplcm8sMHgzZgo+IGZmZmZmZmZmODAw
ZTg3ZTg6IDA4MDAgICAgICAgICAgICAgICAgYWRkaSBzMCxzcCwxNgo+IGZmZmZmZmZmODAwZTg3
ZWE6IDE3ZWQgICAgICAgICAgICAgICAgYWRkaSBhNSxhNSwtNQo+IGZmZmZmZmZmODAwZTg3ZWM6
IDAwYjdmNjYzICAgICAgICAgIGJnZXUgYTUsYTEsZmZmZmZmZmY4MDBlODdmOAo+IDxmdXRleF9h
dG9taWNfY21weGNoZ19pbmF0b21pYysweDE4Pgo+IGZmZmZmZmZmODAwZTg3ZjA6IDY0MjIgICAg
ICAgICAgICAgICAgbGQgczAsOChzcCkKPiBmZmZmZmZmZjgwMGU4N2YyOiA1NTQ5ICAgICAgICAg
ICAgICAgIGxpIGEwLC0xNAo+IGZmZmZmZmZmODAwZTg3ZjQ6IDAxNDEgICAgICAgICAgICAgICAg
YWRkaSBzcCxzcCwxNgo+IGZmZmZmZmZmODAwZTg3ZjY6IDgwODIgICAgICAgICAgICAgICAgcmV0
Cj4gZmZmZmZmZmY4MDBlODdmODogODcyYSAgICAgICAgICAgICAgICBtdiBhNCxhMAo+IGZmZmZm
ZmZmODAwZTg3ZmE6IDAwMDQwODM3ICAgICAgICAgIGx1aSBhNiwweDQwCj4gZmZmZmZmZmY4MDBl
ODdmZTogMTAwODIwNzMgICAgICAgICAgY3NycyBzc3RhdHVzLGE2Cj4gZmZmZmZmZmY4MDBlODgw
MjogNDc4MSAgICAgICAgICAgICAgICBsaSBhNSwwCj4gZmZmZmZmZmY4MDBlODgwNDogMTYwNWE4
YWYgICAgICAgICAgbHIudy5hcXJsIGE3LChhMSkKPiBmZmZmZmZmZjgwMGU4ODA4OiAwMGM4OTU2
MyAgICAgICAgICBibmUgYTcsYTIsZmZmZmZmZmY4MDBlODgxMgo+IDxmdXRleF9hdG9taWNfY21w
eGNoZ19pbmF0b21pYysweDMyPgo+IGZmZmZmZmZmODAwZTg4MGM6IDFlZDVhNTJmICAgICAgICAg
IHNjLncuYXFybCBhMCxhMywoYTEpCj4gZmZmZmZmZmY4MDBlODgxMDogZjk3NSAgICAgICAgICAg
ICAgICBibmV6IGEwLGZmZmZmZmZmODAwZTg4MDQKPiA8ZnV0ZXhfYXRvbWljX2NtcHhjaGdfaW5h
dG9taWMrMHgyND4KPiBmZmZmZmZmZjgwMGU4ODEyOiAwMDA3ODUxYiAgICAgICAgICBzZXh0Lncg
YTAsYTUKPiBmZmZmZmZmZjgwMGU4ODE2OiAxMDA4MzA3MyAgICAgICAgICBjc3JjIHNzdGF0dXMs
YTYKPiBmZmZmZmZmZjgwMGU4ODFhOiAwMTE3MjAyMyAgICAgICAgICBzdyBhNywwKGE0KQo+IGZm
ZmZmZmZmODAwZTg4MWU6IDY0MjIgICAgICAgICAgICAgICAgbGQgczAsOChzcCkKPiBmZmZmZmZm
ZjgwMGU4ODIwOiAwMTQxICAgICAgICAgICAgICAgIGFkZGkgc3Asc3AsMTYKPiBmZmZmZmZmZjgw
MGU4ODIyOiA4MDgyICAgICAgICAgICAgICAgIHJldAoKVGhlIGNhbGxpbmcgY29udmVudGlvbiBt
ZWFucyBhMiB3aWxsIGJlIHNpZ24tZXh0ZW5kZWQgb24gZW50cnkgdG8gdGhlCmZ1bmN0aW9uLCBh
bmQgc2luY2UgeW91ciBjb21waWxlciBoYXMgbm90IGRvbmUgYW55dGhpbmcgdG8gY2hhbmdlIHRo
ZQp2YWx1ZSB0aGF0IHdpbGwgc3RpbGwgYmUgdHJ1ZS4gU28gaXQgaGFzIChsZWdpdGltYXRlbHkp
IG9wdGltaXNlZCBvdXQKYW55IHNpZ24gZXh0ZW5zaW9uIGFzIGEgbm8tb3AuIEFyZSB5b3Ugc2Vl
aW5nIGFueSBwcm9ibGVtcyB0aGF0IHlvdQpiZWxpZXZlIHRvIGJlIGNhdXNlZCBieSB0aGlzIGZ1
bmN0aW9uLCBvciBhcmUgeW91IGp1c3QgaW5zcGVjdGluZyB0aGUKZGlzYXNzZW1ibHkgdG8gc2F0
aXNmeSB5b3VyIG93biBjdXJpb3NpdHk/Cgo+IFNob3VsZCB3ZSBkbyBpdCBsaWtlIHRoaXM6Cj4g
X19hc21fXyBfX3ZvbGF0aWxlX18gKAo+ICIgc2V4dC53ICVbb3ZdLCAlW292XSBcbiIKPiAuLi4K
Ck5vLCBpdOKAmXMgdW5uZWNlc3NhcnkgYW5kIHByZXZlbnRzIG9wdGltaXNhdGlvbi4KCkplc3MK
Cj4gVGhhbmtzLAo+IFl1bmh1aQo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
