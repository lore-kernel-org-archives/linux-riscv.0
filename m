Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 090B5D3B7E5
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Dec 2025 23:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hIULoNVs5d0f55PXWXFZqCFbtajlttZ6kKH0hoLOBa4=; b=IT/U305LFXDySI
	S7Myj0M9fbRYF5T6C3SQBhrlCC38sq4DBUwzIKT76khcKaXPPsASJOuUgOwf2k1odJ3kkXNJf2W8B
	NV0pt/v3Uiva9XxCL5Y8R+HzVYnQ4ty8uiLaVrvCKH4uRhDcgN7+Eyi/fecYQlihF6pXV4SYAfJ+i
	e0vkCUfIE8XwmEuHYUpQccp+C0JbLEwflPQGw/awjHIGPHlK1K3rk1GrM1OHeSOR1fZHnxRKDBT5U
	uK8tIkwpgmgeDgMfVYnLpuQJNiBvmq2iUV+wkeBr35irdnb/UDxZFnfJIWTyWdTeEhCQGktTZsJIQ
	tU7O3SkQ3fA9DsVl/2Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va0Wt-0000000379X-1j19;
	Sun, 28 Dec 2025 23:50:31 +0000
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va0Wr-0000000378v-1kc1
	for linux-riscv@lists.infradead.org;
	Sun, 28 Dec 2025 23:50:30 +0000
Received: by mail-qt1-x841.google.com with SMTP id d75a77b69052e-4ee05b2b1beso91548321cf.2
        for <linux-riscv@lists.infradead.org>; Sun, 28 Dec 2025 15:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766965828; x=1767570628; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0iJY5kULQZeqgTosQ9scmyKuRaTaMg4i5yh/l64mgrA=;
        b=TlkFvAf6NzvyqKkXNL+JHbwihM6ArfiYYkPj+TbQi+1Qm+aK7Pl3oTDR7rQLBw85kw
         75CtXu/cMw/R9urppw8g/wv8/d5dwrSW0EnMt0Ey02ALm3Kvtqbf1Cy6HURNDvPjxvZv
         BUWxiAJLdgy0b9Bm2LoU0VGF2ns3KNd0xRZvPGvBesaLs2CsF/g1S/5bPaWtN+WRlbZv
         y0NsC5+J5dAD3uBadpIsBic+TmFgw5mnGoxbWlwdfw1u6QxfehE3CtrGU1pGwhzTIHnD
         ghR79bNfU70FIUmzWvVaA/e8oUd1LQP/UAw8lHbNB09yoMkKx5H/gmkXcxRKJ4Zo6m0i
         2DXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766965828; x=1767570628;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0iJY5kULQZeqgTosQ9scmyKuRaTaMg4i5yh/l64mgrA=;
        b=UL+bBFFND7MgeuLI5qCk4ysyqEZFvZdkYvAc1L06+nmKgyYdcpDomtJQCAqnHSRXNp
         pBS/UwexJhukFjok6aYoTjPxIwudszswpsPJ3ymoEPMgIrQVp/6yTY6daTVtRyK1dmwX
         TSrE6VJyEWDh6+1JipTmVDfWzNydRBbN5w9JYPA3rM7cBN7dDGIrnhpv/TuKV49tU4/Y
         vSmmpsrbOC5fOWu3FRocJuk8hU02hhbhulaWFXmRfH2eJT4YDwWa0uVWM+vAeiTijDux
         aU9rEdUUcoQsiQRyUhcHyoQB05b+YFnnury6M3nocuHArKekPQxF9rJg+ioOKDfYxter
         lM6A==
X-Forwarded-Encrypted: i=1; AJvYcCURlD5foUISX9dikYoYCSQ2lXyuhehDtOtecDyI3vQi2S5H1J9WTnS5m1b9csGwGu4Dtt8mGQG26sqDgA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwKFDeaRz0DyrsJFrh1tZ9nmr//HB5eQyI8TgP+sZPypN//vFje
	3UFW/sTiC3ihkBcYk4D7Z1Z632vdk9hsUPZE6u3YWDE91VLQXRPyYTAiGKz6btpjWm4=
X-Gm-Gg: AY/fxX4n5NItHQBE+/bY3GNYDx8Yyqyfbga03aBEnrmBOlxd+LkDPGRG+t3gnWj4SSW
	057xNd3MMl2WOROHbH1YwNcRhg8LUjyYW43G8gB6MFIqPNq8D+docfztPbhplF7+TECsK515GoY
	UG3awvvHtyQtY/blePjvPfbUq8ZMgY+5ShPA01KvQry466uFVtVtsI4RT2fgUqO4V+WNL1O6TPN
	ar7M0PlRpKI+FCkL/rIOMZLUzfP5D1IHOl3PN68hssjzW29e031HDTNpn+ajXqm3qfWDlWyOO7U
	NaSZDUauiSUI1caHBeA/hPHbep6oCzXBWXFugI1mU89+S6j4khqNA++n4Z4SzFpJdMlGeyfR39C
	3sHBR4lCIpbF49L2GZAqtgbQG/rDehKZIVgCLatmSRw8aMlcq6KDYiQNfqfjq4rwMhN+9KlysIi
	fqF5EdxkfDQh2w79nX6LHR46l274a9Sh2elMRikzTb6V5NBCei0I4=
X-Google-Smtp-Source: AGHT+IHMoTvSCcsoBat644ksem8ZqP4Cs7kB7zIlLcWG+j/tQjQblk+rAjCWaI4lEYjd6IAfo873cw==
X-Received: by 2002:ac8:6f07:0:b0:4f3:4fe8:b5ca with SMTP id d75a77b69052e-4f4abcf6a40mr349244621cf.10.1766965828133;
        Sun, 28 Dec 2025 15:50:28 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0973f28e3sm2406423185a.45.2025.12.28.15.50.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Dec 2025 15:50:27 -0800 (PST)
Message-ID: <b3d015aa-01bd-4974-881a-0af297655c55@riscstar.com>
Date: Sun, 28 Dec 2025 17:50:25 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/13] dt-bindings: riscv: Add Ssccptr, Sscounterenw,
 Sstvala, Sstvecd, Ssu64xl
To: Guodong Xu <guodong@riscstar.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Samuel Holland <samuel.holland@sifive.com>, Anup Patel
 <anup@brainfault.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
 Yangyu Chen <cyy@cyyself.name>, Paul Walmsley <paul.walmsley@sifive.com>,
 Conor Dooley <conor@kernel.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
 Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 spacemit@lists.linux.dev, linux-serial@vger.kernel.org
References: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
 <20251222-k3-basic-dt-v2-9-3af3f3cd0f8a@riscstar.com>
 <6925aa57-874c-479f-9f5b-f0fd6ede685b@riscstar.com>
 <CAH1PCMauCHQ==Fyb1pHzWtkNOCnpRoJ_8KE0zJBC4B6X8TzweA@mail.gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <CAH1PCMauCHQ==Fyb1pHzWtkNOCnpRoJ_8KE0zJBC4B6X8TzweA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_155029_475396_C391E929 
X-CRM114-Status: GOOD (  22.33  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTIvMjgvMjUgNjozMSBBTSwgR3VvZG9uZyBYdSB3cm90ZToKPiBIaSwgQWxleAo+IAo+IE9u
IFNhdCwgRGVjIDI3LCAyMDI1IGF0IDU6MjjigK9BTSBBbGV4IEVsZGVyIDxlbGRlckByaXNjc3Rh
ci5jb20+IHdyb3RlOgo+Pgo+PiBPbiAxMi8yMi8yNSA3OjA0IEFNLCBHdW9kb25nIFh1IHdyb3Rl
Ogo+Pj4gQWRkIGRlc2NyaXB0aW9ucyBmb3IgZml2ZSBuZXcgZXh0ZW5zaW9uczogU3NjY3B0ciwg
U3Njb3VudGVyZW53LCBTc3R2YWxhLAo+Pj4gU3N0dmVjZCwgYW5kIFNzdTY0eGwuIFRoZXNlIGV4
dGVuc2lvbnMgYXJlIHJhdGlmaWVkIGluIFJJU0MtViBQcm9maWxlcwo+Pj4gVmVyc2lvbiAxLjAg
KGNvbW1pdCBiMWQ4MDY2MDVmODcgIlVwZGF0ZWQgdG8gcmF0aWZpZWQgc3RhdGUuIikuCj4+Pgo+
Pj4gVGhleSBhcmUgaW50cm9kdWNlZCBhcyBuZXcgZXh0ZW5zaW9uIG5hbWVzIGZvciBleGlzdGlu
ZyBmZWF0dXJlcyBhbmQKPj4+IHJlZ3VsYXRlIGltcGxlbWVudGF0aW9uIGRldGFpbHMgZm9yIFJJ
U0MtViBQcm9maWxlIGNvbXBsaWFuY2UuIEFjY29yZGluZwo+Pj4gdG8gUklTQy1WIFByb2ZpbGVz
IFZlcnNpb24gMS4wIGFuZCBSVkEyMyBQcm9maWxlcyBWZXJzaW9uIDEuMCwgdGhlaXIKPj4+IHJl
cXVpcmVtZW50IHN0YXR1cyBhcmU6Cj4+Pgo+Pj4gICAgLSBTc2NjcHRyOiBNYW5kYXRvcnkgaW4g
UlZBMjBTNjQsIFJWQTIyUzY0LCBSVkEyM1M2NAo+Pj4gICAgLSBTc2NvdW50ZXJlbnc6IE1hbmRh
dG9yeSBpbiBSVkEyMlM2NCwgUlZBMjNTNjQKPj4+ICAgIC0gU3N0dmFsYTogTWFuZGF0b3J5IGlu
IFJWQTIwUzY0LCBSVkEyMlM2NCwgUlZBMjNTNjQKPj4+ICAgIC0gU3N0dmVjZDogTWFuZGF0b3J5
IGluIFJWQTIwUzY0LCBSVkEyMlM2NCwgUlZBMjNTNjQKPj4+ICAgIC0gU3N1NjR4bDogT3B0aW9u
YWwgaW4gUlZBMjBTNjQsIFJWQTIyUzY0OyBNYW5kYXRvcnkgaW4gUlZBMjNTNjQKPj4KPj4gQWdh
aW4sIEkgZGlkIG5vdCB2ZXJpZnkgeW91ciBzdGF0ZW1lbnRzIGFib3V0IHdoZXJlIHRoZXNlIGFy
ZQo+PiBvcHRpb25hbCBhbmQgbWFuZGF0b3J5LCBidXQgSSBhc3N1bWUgdGhleSdyZSBjb3JyZWN0
Lgo+IAo+IFRoYW5rcyBmb3IgdGhlIHJldmlldy4KPiAKPiBBcyBtZW50aW9uZWQgaW4gbXkgcmVz
cG9uc2UgdG8gcGF0Y2ggOCwgdGhlIHJlcXVpcmVtZW50IHN0YXR1cyBmb3IgdGhlc2UKPiBleHRl
bnNpb25zIGlzIGNsZWFybHkgZGVmaW5lZCBpbiB0aGUgUklTQy1WIFByb2ZpbGVzIHNwZWNpZmlj
YXRpb24ocykgd2hpY2gKPiBJIG1lbnRpb25lZCBhYm92ZS4KPiAKPiBJIGhhdmUgdmVyaWZpZWQg
dGhlc2UgZGV0YWlscyBhZ2FpbnN0IHRoZSBvZmZpY2lhbCBkb2N1bWVudCB0byBlbnN1cmUKPiBh
Y2N1cmFjeS4KClJpZ2h0LCBteSBjb21tZW50IGhlcmUgd2FzIGp1c3QgdG8gYmUgdHJhbnNwYXJl
bnQgdGhhdCAqSSogZGlkCm5vdCBjaGVjayB0aGlzLCBhbmQgYW0gdHJ1c3RpbmcgdGhhdCB3aGF0
IHlvdSBzYWlkIGlzIHJpZ2h0LgpUaGFua3MgZm9yIGNvbmZpcm1pbmcuCgoJCQkJCS1BbGV4Cgo+
IFRoZSBleHRlbnNpb24gZGVzY3JpcHRpb25zIGFyZSBpbmNsdWRlZCBpbiB0aGUgY29tbWl0IG1l
c3NhZ2UgdG8gcHJvdmlkZQo+IG5lY2Vzc2FyeSBiYWNrZ3JvdW5kIGluZm9ybWF0aW9uLgo+IAo+
Pgo+Pj4gU2lnbmVkLW9mZi1ieTogR3VvZG9uZyBYdSA8Z3VvZG9uZ0ByaXNjc3Rhci5jb20+Cj4+
PiAtLS0KPj4+IHYyOiBOZXcgcGF0Y2guCj4+PiAtLS0KPj4+ICAgIC4uLi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbCAgICAgIHwgMzIgKysrKysrKysrKysrKysrKysr
KysrKwo+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDMyIGluc2VydGlvbnMoKykKPj4+Cj4+PiBkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lv
bnMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNp
b25zLnlhbWwKPj4+IGluZGV4IGE2YjlkN2UzZWRmODZlY2ZiMTE3YmE3MmUyOTVlZjA5N2JkYzk4
MzEuLmVkN2E4OGMwYWIzYjdkYzdhZDRhNGQyZmQzMDBkNmZiMzNlZjA1MGMgMTAwNjQ0Cj4+PiAt
LS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55
YW1sCj4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0
ZW5zaW9ucy55YW1sCj4+PiBAQCAtMTYwLDEyICsxNjAsMjYgQEAgcHJvcGVydGllczoKPj4+ICAg
ICAgICAgICAgICAgIGJlaGF2aW91cmFsIGNoYW5nZXMgdG8gaW50ZXJydXB0cyBhcyBmcm96ZW4g
YXQgY29tbWl0IGNjYmRkYWIKPj4+ICAgICAgICAgICAgICAgICgiTWVyZ2UgcHVsbCByZXF1ZXN0
ICM0MiBmcm9tIHJpc2N2L2poYXVzZXItMjAyMy1SQzQiKSBvZiByaXNjdi1haWEuCj4+Pgo+Pj4g
KyAgICAgICAgLSBjb25zdDogc3NjY3B0cgo+Pj4gKyAgICAgICAgICBkZXNjcmlwdGlvbjogfAo+
Pj4gKyAgICAgICAgICAgIFRoZSBzdGFuZGFyZCBTc2NjcHRyIGV4dGVuc2lvbiBmb3IgbWFpbiBt
ZW1vcnkgKGNhY2hlYWJpbGl0eSBhbmQKPj4+ICsgICAgICAgICAgICBjb2hlcmVuY2UpIGhhcmR3
YXJlIHBhZ2UtdGFibGUgcmVhZHMsIGFzIHJhdGlmaWVkIGluIFJJU0MtVgo+Pj4gKyAgICAgICAg
ICAgIFByb2ZpbGVzIFZlcnNpb24gMS4wLCB3aXRoIGNvbW1pdCBiMWQ4MDY2MDVmODcgKCJVcGRh
dGVkIHRvCj4+PiArICAgICAgICAgICAgcmF0aWZpZWQgc3RhdGUuIikKPj4+ICsKPj4+ICAgICAg
ICAgICAgLSBjb25zdDogc3Njb2ZwbWYKPj4+ICAgICAgICAgICAgICBkZXNjcmlwdGlvbjogfAo+
Pj4gICAgICAgICAgICAgICAgVGhlIHN0YW5kYXJkIFNzY29mcG1mIHN1cGVydmlzb3ItbGV2ZWwg
ZXh0ZW5zaW9uIGZvciBjb3VudCBvdmVyZmxvdwo+Pj4gICAgICAgICAgICAgICAgYW5kIG1vZGUt
YmFzZWQgZmlsdGVyaW5nIGFzIHJhdGlmaWVkIGF0IGNvbW1pdCAwMWQxZGYwICgiQWRkIGFiaWxp
dHkKPj4+ICAgICAgICAgICAgICAgIHRvIG1hbnVhbGx5IHRyaWdnZXIgd29ya2Zsb3cuICgjMiki
KSBvZiByaXNjdi1jb3VudC1vdmVyZmxvdy4KPj4+Cj4+PiArICAgICAgICAtIGNvbnN0OiBzc2Nv
dW50ZXJlbncKPj4+ICsgICAgICAgICAgZGVzY3JpcHRpb246IHwKPj4+ICsgICAgICAgICAgICBU
aGUgc3RhbmRhcmQgU3Njb3VudGVyZW53IGV4dGVuc2lvbiBmb3Igc3VwcG9ydCB3cml0YWJsZSBl
bmFibGVzCj4+PiArICAgICAgICAgICAgaW4gc2NvdW50ZXJlbiBmb3IgYW55IHN1cHBvcnRlZCBj
b3VudGVyLCBhcyByYXRpZmllZCBpbiBSSVNDLVYKPiAKPiBIZXJlLCBJIHVzZWQgdGhlIGFiYnJl
dmlhdGVkIHZlcnNpb24uIFNlZSBiZWxvdy4KPiAKPj4+ICsgICAgICAgICAgICBQcm9maWxlcyBW
ZXJzaW9uIDEuMCwgd2l0aCBjb21taXQgYjFkODA2NjA1Zjg3ICgiVXBkYXRlZCB0bwo+Pj4gKyAg
ICAgICAgICAgIHJhdGlmaWVkIHN0YXRlLiIpCj4+Cj4+IE1heWJlIHlvdSBzaG91bGQganVzdCBj
b3B5IHRoZSB0ZXh0IGZyb20gdGhlIFJWQTIzIHNwZWNpZmljYXRpb24KPj4gZm9yIGFsbCBvZiB0
aGVzZS4gIFNvIHNvbWV0aGluZyBsaWtlOgo+Pgo+PiAgICAgRm9yIGFueSBocG1jb3VudGVyIHRo
YXQgaXMgbm90IHJlYWQtb25seSB6ZXJvLCB0aGUgY29ycmVzcG9uZGluZwo+PiAgICAgYml0IGlu
IHNjb3VudGVyZW4gbXVzdCBiZSB3cml0YWJsZS4gIFRoaXMgd2FzIHJhdGlmaWVkIGluIHRoZQo+
PiAgICAgUklTQy1WIFByb2ZpbGVzIHNwZWNpZmljYXRpb24gdmVyc2lvbiAxLjAsIHdpdGggY29t
bWl0IC4uLgo+Pgo+IAo+IEFzIHlvdSBub3RpY2VkLCB0aGUgUlZBMjMgUHJvZmlsZSB2MS4wIHBy
b3ZpZGVzIHR3byB2ZXJzaW9ucyBvZiBleHBsYW5hdGlvbgo+IGZvciBTc2NvdW50ZXJlbnc6Cj4g
IlNzY291bnRlcmVudzogRm9yIGFueSBocG1jb3VudGVyIHRoYXQgaXMgbm90IHJlYWQtb25seSB6
ZXJvLCB0aGUgY29ycmVzcG9uZGluZwo+IGJpdCBpbiBzY291bnRlcmVuIG11c3QgYmUgd3JpdGFi
bGUiCj4gIlNzY291bnRlcmVudzogU3VwcG9ydCB3cml0ZWFibGUgZW5hYmxlcyBmb3IgYW55IHN1
cHBvcnRlZCBjb3VudGVyIgo+IAo+IEJSLAo+IEd1b2RvbmcgWHUKPiAKPj4+ICsKPj4+ICAgICAg
ICAgICAgLSBjb25zdDogc3NucG0KPj4+ICAgICAgICAgICAgICBkZXNjcmlwdGlvbjogfAo+Pj4g
ICAgICAgICAgICAgICAgVGhlIHN0YW5kYXJkIFNzbnBtIGV4dGVuc2lvbiBmb3IgbmV4dC1tb2Rl
IHBvaW50ZXIgbWFza2luZyBhcwo+Pj4gQEAgLTE3OCw2ICsxOTIsMjQgQEAgcHJvcGVydGllczoK
Pj4+ICAgICAgICAgICAgICAgIHJhdGlmaWVkIGF0IGNvbW1pdCAzZjllZDM0ICgiQWRkIGFiaWxp
dHkgdG8gbWFudWFsbHkgdHJpZ2dlcgo+Pj4gICAgICAgICAgICAgICAgd29ya2Zsb3cuICgjMiki
KSBvZiByaXNjdi10aW1lLWNvbXBhcmUuCj4+Pgo+Pj4gKyAgICAgICAgLSBjb25zdDogc3N0dmFs
YQo+Pj4gKyAgICAgICAgICBkZXNjcmlwdGlvbjogfAo+Pj4gKyAgICAgICAgICAgIFRoZSBzdGFu
ZGFyZCBTc3R2YWxhIGV4dGVuc2lvbiBmb3Igc3R2YWwgcHJvdmlkZXMgYWxsIG5lZWRlZCB2YWx1
ZXMKPj4+ICsgICAgICAgICAgICBhcyByYXRpZmllZCBpbiBSSVNDLVYgUHJvZmlsZXMgVmVyc2lv
biAxLjAsIHdpdGggY29tbWl0IGIxZDgwNjYwNWY4Nwo+Pj4gKyAgICAgICAgICAgICgiVXBkYXRl
ZCB0byByYXRpZmllZCBzdGF0ZS4iKQo+Pgo+PiBPciBhbHRlcm5hdGl2ZSB0byB0aGUgZnVsbCB0
ZXh0IGluIHRoZSBzcGVjLCB5b3UgY291bGQgY29weSBvdmVyCj4+IHRoZSBhYmJyZXZpYXRlZCBk
ZXNjcmlwdGlvbiBsaXN0ZWQgaW4gdGhlIGdsb3NzYXJ5IGF0IHRoZSBlbmQKPj4gaW5zdGVhZC4g
IFNvbWV0aGluZyBsaWtlOgo+Pgo+PiAgICAgc3R2YWwgcHJvdmlkZXMgYWxsIG5lZWRlZCB2YWx1
ZXMuICBUaGlzIHdhcyByYXRpZmllZCBpbi4uLgo+Pgo+PiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIC1BbGV4Cj4+Cj4+PiArCj4+PiArICAgICAgICAtIGNvbnN0OiBz
c3R2ZWNkCj4+PiArICAgICAgICAgIGRlc2NyaXB0aW9uOiB8Cj4+PiArICAgICAgICAgICAgVGhl
IHN0YW5kYXJkIFNzdHZlY2QgZXh0ZW5zaW9uIGZvciBzdHZlYyBzdXBwb3J0cyBEaXJlY3QgbW9k
ZSBhcwo+Pj4gKyAgICAgICAgICAgIHJhdGlmaWVkIGluIFJJU0MtViBQcm9maWxlcyBWZXJzaW9u
IDEuMCwgd2l0aCBjb21taXQgYjFkODA2NjA1Zjg3Cj4+PiArICAgICAgICAgICAgKCJVcGRhdGVk
IHRvIHJhdGlmaWVkIHN0YXRlLiIpCj4+PiArCj4+PiArICAgICAgICAtIGNvbnN0OiBzc3U2NHhs
Cj4+PiArICAgICAgICAgIGRlc2NyaXB0aW9uOiB8Cj4+PiArICAgICAgICAgICAgVGhlIHN0YW5k
YXJkIFNzdTY0eGwgZXh0ZW5zaW9uIGZvciBVWExFTj02NCBtdXN0IGJlIHN1cHBvcnRlZCwgYXMK
Pj4+ICsgICAgICAgICAgICByYXRpZmllZCBpbiBSSVNDLVYgUHJvZmlsZXMgVmVyc2lvbiAxLjAs
IHdpdGggY29tbWl0IGIxZDgwNjYwNWY4Nwo+Pj4gKyAgICAgICAgICAgICgiVXBkYXRlZCB0byBy
YXRpZmllZCBzdGF0ZS4iKQo+Pj4gKwo+Pj4gICAgICAgICAgICAtIGNvbnN0OiBzdmFkZQo+Pj4g
ICAgICAgICAgICAgIGRlc2NyaXB0aW9uOiB8Cj4+PiAgICAgICAgICAgICAgICBUaGUgc3RhbmRh
cmQgU3ZhZGUgc3VwZXJ2aXNvci1sZXZlbCBleHRlbnNpb24gZm9yIFNXLW1hbmFnZWQgUFRFIEEv
RAo+Pj4KPj4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
