Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA134C02198
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Feb 2025 06:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a2vw2SRYGzJ1+YEtyWxBFgGvy8cILG+yoOXOYlYFhc0=; b=icjOQa2yOUk25C
	JRNFq70MBxVFfu8pzttt1XPG9PH70/Nj2bEouiF/fweGZSI+kKnhaOu095h4iqbdlODdV7xbsetpP
	ybJxklRByf0c663VEfMHhz7rbgyvkIN+r4LzMJWRFKZMxLQ+qCOEog9iBUGPlyVm6NvcsmaKQBxFQ
	mXcqrIuJT3fNkGRljgfyI69yRwFr2cIwcsX+gU8WhOAevkrI8Pogo4D0VQyxkm2V1F/EBPJD8kCmA
	1uGd3yb5JZYRDVGHVTo56jcU0qHyXEnieotp97DceX2L5w3jZCzQsBEXR0uFoTENraP0c16ltxUrm
	kSrgnDImenLnTAojv6TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tip6j-0000000DoKK-4ASv;
	Fri, 14 Feb 2025 06:23:25 +0000
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tip6O-0000000DoGo-3ZyF
	for linux-riscv@lists.infradead.org;
	Fri, 14 Feb 2025 06:23:06 +0000
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-2aa17010cbcso1356736fac.3
        for <linux-riscv@lists.infradead.org>; Thu, 13 Feb 2025 22:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1739514184; x=1740118984; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xrLjx8sI4ymiLiWAMLyA4Ul5aLiPri1Yvb0JU43eu3c=;
        b=lGqEHlga2/ggHPESN61qFcG5NvpAnOymnBsYVB88gbKxeGqvlQnQ6gZIIJMl+jB6eF
         basQT1qZkVB/8zNw4bBf0BFk8c1hOE2E9p+sT2183Qk3+cl33/ei7ijpOLmfC8qvgZKB
         JbKf7Nrni4/KZKCuI7Zt3DrKlYqMp/34/FcscBVZPrh+TkECdsSjrGhaBG6zZXV30EYz
         b8yCrb2nvA5XisUe4N6vYcApOAm5hH2Nsq5rRhmwmacG8oA9eG1EC1jBskXOs2GJozNT
         2d3To7QLdR1zDkq+Rpi7cn1b+SNcs4l/QZnur5bkXS9zyhpF8H1PpKf3QNWl4gsl+8DM
         dHxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739514184; x=1740118984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xrLjx8sI4ymiLiWAMLyA4Ul5aLiPri1Yvb0JU43eu3c=;
        b=HE3KjiTHM+9tQGU7WubXyiMAjSKQPIGtcXat7kgpcNVAfx3+CXysV+rsG7NcQSIcib
         Pv00zj2DWRw2Hqc7JLaEupQjJ5u/6m+80zRLZF72PUh8L+2YU1QNEA5pGP8qjQM3N6AS
         tth3e8t9SOqXu+fmn/i3qlaobrbx8ysq3jj9Ke61h43ulB5pcAAOavZis+AyBtXUXptW
         tvC1nWqpcy1naior/nb0pJ5Umyjr+r5PSRZ2SNnbUoa9EVjpIlHsJ8OA5O9Wynazrwsz
         dopxGSKAHi4+sm0WzQsdDyLyuHOz6tcYinXyd8rN3hMor4mpoO0sARL+wUzxrT9gMkao
         rmFg==
X-Forwarded-Encrypted: i=1; AJvYcCXJBnWtQ2kjlzAXfsNlUZn9ZVeg188UXorgsC0xey6mQsx9fhQ9xF9jX0COE2sgqO4SmAZp6y5lmp+0Xg==@lists.infradead.org
X-Gm-Message-State: AOJu0YziWwa3bWwEsUrWp1S4rcqGeDWVynN0fHniOHaqcjdJTmfauXtw
	BT/KdX84XczNgUXfOkibvU6ViuE1Cmk5Nsl3RHAy1j4NDvqULhUhRZciIygkuyhIgpOcncsRrqZ
	S2oK5+mYI+HNDP7QwLJzTO2q25MDwnQEZ1B8xmA==
X-Gm-Gg: ASbGncs7OYTmexRQNFwPTuXC/SsOn9ciACQwpDXh1PKuI+WoxbhTaC44qAMC9l0dMhk
	wMiP5zAjLWPdCrb31MkZTwVArPbAaLSfBBU0rm6GjQswR5K8P7IXkngBt/ur8wCSrJoEOLccJL0
	uAclglvAsy6y2zZg==
X-Google-Smtp-Source: AGHT+IE4605vlHn1zIiQxF2f4ULWyjpbrJ1xQMN1h89Q/8aWkSJ7Lcxw52Cxk+fp5fIwgc5uTBVQJlRTbwXkv6S+Mzo=
X-Received: by 2002:a05:6871:7bc3:b0:2a3:c59f:4cba with SMTP id
 586e51a60fabf-2b8d659ba31mr5912550fac.17.1739514183816; Thu, 13 Feb 2025
 22:23:03 -0800 (PST)
MIME-Version: 1.0
References: <mvmfrkv2vhz.fsf@suse.de> <173947144178.1330575.8179936961826705707.git-patchwork-notify@kernel.org>
 <CAEEQ3wmH9MCYCfLL4Q7R7BHWbiQso+xr=zjhizY+kA5xtNzEzw@mail.gmail.com> <C823738D-8FE1-4746-A8CF-627DFB596365@jrtc27.com>
In-Reply-To: <C823738D-8FE1-4746-A8CF-627DFB596365@jrtc27.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Fri, 14 Feb 2025 14:22:53 +0800
X-Gm-Features: AWEUYZn0iPKwrupWFG1GQNOwWt9ZWfpFLI7RdTf22_lZfp97wOBoYspyknLWZUE
Message-ID: <CAEEQ3wmOUyV0Ys0Zd=hbWr8Jn2yAy+KwuJahEgNFky+my=7Mug@mail.gmail.com>
Subject: Re: [External] [PATCH] riscv/futex: sign extend compare value in
 atomic cmpxchg
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: patchwork-bot+linux-riscv@kernel.org, Andreas Schwab <schwab@suse.de>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_222304_896912_494CD2E8 
X-CRM114-Status: GOOD (  24.70  )
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

SGkgSmVzcywKCk9uIEZyaSwgRmViIDE0LCAyMDI1IGF0IDI6MDXigK9QTSBKZXNzaWNhIENsYXJr
ZSA8anJ0YzI3QGpydGMyNy5jb20+IHdyb3RlOgo+Cj4gT24gMTQgRmViIDIwMjUsIGF0IDA0OjEx
LCB5dW5odWkgY3VpIDxjdWl5dW5odWlAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4gPgo+ID4gSGks
Cj4gPgo+ID4gT24gRnJpLCBGZWIgMTQsIDIwMjUgYXQgMjozMeKAr0FNIDxwYXRjaHdvcmstYm90
K2xpbnV4LXJpc2N2QGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4+Cj4gPj4gSGVsbG86Cj4gPj4KPiA+
PiBUaGlzIHBhdGNoIHdhcyBhcHBsaWVkIHRvIHJpc2N2L2xpbnV4LmdpdCAoZml4ZXMpCj4gPj4g
YnkgUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+Ogo+ID4+Cj4gPj4gT24gTW9u
LCAwMyBGZWIgMjAyNSAxMTowNjowMCArMDEwMCB5b3Ugd3JvdGU6Cj4gPj4+IE1ha2Ugc3VyZSB0
aGUgY29tcGFyZSB2YWx1ZSBpbiB0aGUgbHIvc2MgbG9vcCBpcyBzaWduIGV4dGVuZGVkIHRvIG1h
dGNoCj4gPj4+IHdoYXQgbHIudyBkb2VzLiAgRm9ydHVuYXRlbHksIGR1ZSB0byB0aGUgY29tcGls
ZXIga2VlcGluZyB0aGUgcmVnaXN0ZXIKPiA+Pj4gY29udGVudHMgc2lnbiBleHRlbmRlZCBhbnl3
YXkgdGhlIGxhY2sgb2YgdGhlIGV4cGxpY2l0IGV4dGVuc2lvbiBkaWRuJ3QKPiA+Pj4gcmVzdWx0
IGluIHdyb25nIGNvZGUgc28gZmFyLCBidXQgdGhpcyBjYW5ub3QgYmUgcmVsaWVkIHVwb24uCj4g
Pj4+Cj4gPj4+IEZpeGVzOiBiOTBlZGIzMzAxMGIgKCJSSVNDLVY6IEFkZCBmdXRleCBzdXBwb3J0
LiIpCj4gPj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJlYXMgU2Nod2FiIDxzY2h3YWJAc3VzZS5kZT4K
PiA+Pj4KPiA+Pj4gWy4uLl0KPiA+Pgo+ID4+IEhlcmUgaXMgdGhlIHN1bW1hcnkgd2l0aCBsaW5r
czoKPiA+PiAgLSByaXNjdi9mdXRleDogc2lnbiBleHRlbmQgY29tcGFyZSB2YWx1ZSBpbiBhdG9t
aWMgY21weGNoZwo+ID4+ICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcmlzY3YvYy81YzIzODU4
NGJjZTUKPiA+Pgo+ID4+IFlvdSBhcmUgYXdlc29tZSwgdGhhbmsgeW91IQo+ID4+IC0tCj4gPj4g
RGVldC1kb290LWRvdCwgSSBhbSBhIGJvdC4KPiA+PiBodHRwczovL2tvcmcuZG9jcy5rZXJuZWwu
b3JnL3BhdGNod29yay9wd2JvdC5odG1sCj4gPj4KPiA+Pgo+ID4KPiA+IEkgYXBwbGllZCB0aGlz
IHBhdGNoLCBidXQgaXQgZG9lc24ndCBzZWVtIHRvIHRha2UgZWZmZWN0LiBUaGVyZSBpcyBubwo+
ID4gc2lnbiBleHRlbnNpb24gZm9yIGEyIGluIHRoZSBhc3NlbWJseSBjb2RlLiBXaGF0IGRpZCBJ
IG1pc3M/Cj4gPiBHQ0MgdmVyc2lvbiA+PSAxMy4KPiA+Cj4gPiBmZmZmZmZmZjgwMGU4N2UwIDxm
dXRleF9hdG9taWNfY21weGNoZ19pbmF0b21pYz46Cj4gPiBmZmZmZmZmZjgwMGU4N2UwOiAxMTQx
ICAgICAgICAgICAgICAgIGFkZGkgc3Asc3AsLTE2Cj4gPiBmZmZmZmZmZjgwMGU4N2UyOiBlNDIy
ICAgICAgICAgICAgICAgIHNkIHMwLDgoc3ApCj4gPiBmZmZmZmZmZjgwMGU4N2U0OiAyYmYwMTc5
MyAgICAgICAgICBic2V0aSBhNSx6ZXJvLDB4M2YKPiA+IGZmZmZmZmZmODAwZTg3ZTg6IDA4MDAg
ICAgICAgICAgICAgICAgYWRkaSBzMCxzcCwxNgo+ID4gZmZmZmZmZmY4MDBlODdlYTogMTdlZCAg
ICAgICAgICAgICAgICBhZGRpIGE1LGE1LC01Cj4gPiBmZmZmZmZmZjgwMGU4N2VjOiAwMGI3ZjY2
MyAgICAgICAgICBiZ2V1IGE1LGExLGZmZmZmZmZmODAwZTg3ZjgKPiA+IDxmdXRleF9hdG9taWNf
Y21weGNoZ19pbmF0b21pYysweDE4Pgo+ID4gZmZmZmZmZmY4MDBlODdmMDogNjQyMiAgICAgICAg
ICAgICAgICBsZCBzMCw4KHNwKQo+ID4gZmZmZmZmZmY4MDBlODdmMjogNTU0OSAgICAgICAgICAg
ICAgICBsaSBhMCwtMTQKPiA+IGZmZmZmZmZmODAwZTg3ZjQ6IDAxNDEgICAgICAgICAgICAgICAg
YWRkaSBzcCxzcCwxNgo+ID4gZmZmZmZmZmY4MDBlODdmNjogODA4MiAgICAgICAgICAgICAgICBy
ZXQKPiA+IGZmZmZmZmZmODAwZTg3Zjg6IDg3MmEgICAgICAgICAgICAgICAgbXYgYTQsYTAKPiA+
IGZmZmZmZmZmODAwZTg3ZmE6IDAwMDQwODM3ICAgICAgICAgIGx1aSBhNiwweDQwCj4gPiBmZmZm
ZmZmZjgwMGU4N2ZlOiAxMDA4MjA3MyAgICAgICAgICBjc3JzIHNzdGF0dXMsYTYKPiA+IGZmZmZm
ZmZmODAwZTg4MDI6IDQ3ODEgICAgICAgICAgICAgICAgbGkgYTUsMAo+ID4gZmZmZmZmZmY4MDBl
ODgwNDogMTYwNWE4YWYgICAgICAgICAgbHIudy5hcXJsIGE3LChhMSkKPiA+IGZmZmZmZmZmODAw
ZTg4MDg6IDAwYzg5NTYzICAgICAgICAgIGJuZSBhNyxhMixmZmZmZmZmZjgwMGU4ODEyCj4gPiA8
ZnV0ZXhfYXRvbWljX2NtcHhjaGdfaW5hdG9taWMrMHgzMj4KPiA+IGZmZmZmZmZmODAwZTg4MGM6
IDFlZDVhNTJmICAgICAgICAgIHNjLncuYXFybCBhMCxhMywoYTEpCj4gPiBmZmZmZmZmZjgwMGU4
ODEwOiBmOTc1ICAgICAgICAgICAgICAgIGJuZXogYTAsZmZmZmZmZmY4MDBlODgwNAo+ID4gPGZ1
dGV4X2F0b21pY19jbXB4Y2hnX2luYXRvbWljKzB4MjQ+Cj4gPiBmZmZmZmZmZjgwMGU4ODEyOiAw
MDA3ODUxYiAgICAgICAgICBzZXh0LncgYTAsYTUKPiA+IGZmZmZmZmZmODAwZTg4MTY6IDEwMDgz
MDczICAgICAgICAgIGNzcmMgc3N0YXR1cyxhNgo+ID4gZmZmZmZmZmY4MDBlODgxYTogMDExNzIw
MjMgICAgICAgICAgc3cgYTcsMChhNCkKPiA+IGZmZmZmZmZmODAwZTg4MWU6IDY0MjIgICAgICAg
ICAgICAgICAgbGQgczAsOChzcCkKPiA+IGZmZmZmZmZmODAwZTg4MjA6IDAxNDEgICAgICAgICAg
ICAgICAgYWRkaSBzcCxzcCwxNgo+ID4gZmZmZmZmZmY4MDBlODgyMjogODA4MiAgICAgICAgICAg
ICAgICByZXQKPgo+IFRoZSBjYWxsaW5nIGNvbnZlbnRpb24gbWVhbnMgYTIgd2lsbCBiZSBzaWdu
LWV4dGVuZGVkIG9uIGVudHJ5IHRvIHRoZQo+IGZ1bmN0aW9uLCBhbmQgc2luY2UgeW91ciBjb21w
aWxlciBoYXMgbm90IGRvbmUgYW55dGhpbmcgdG8gY2hhbmdlIHRoZQo+IHZhbHVlIHRoYXQgd2ls
bCBzdGlsbCBiZSB0cnVlLiBTbyBpdCBoYXMgKGxlZ2l0aW1hdGVseSkgb3B0aW1pc2VkIG91dAo+
IGFueSBzaWduIGV4dGVuc2lvbiBhcyBhIG5vLW9wLgoKIElmIHNvLCB3aHkgdGhpcyBwYXRjaD8K
Cj4gQXJlIHlvdSBzZWVpbmcgYW55IHByb2JsZW1zIHRoYXQgeW91Cj4gYmVsaWV2ZSB0byBiZSBj
YXVzZWQgYnkgdGhpcyBmdW5jdGlvbiwgb3IgYXJlIHlvdSBqdXN0IGluc3BlY3RpbmcgdGhlCj4g
ZGlzYXNzZW1ibHkgdG8gc2F0aXNmeSB5b3VyIG93biBjdXJpb3NpdHk/CgpObyBhY3R1YWwgcHJv
YmxlbSB0cmFjZWQgaGVyZS4KCgo+Cj4gPiBTaG91bGQgd2UgZG8gaXQgbGlrZSB0aGlzOgo+ID4g
X19hc21fXyBfX3ZvbGF0aWxlX18gKAo+ID4gIiBzZXh0LncgJVtvdl0sICVbb3ZdIFxuIgo+ID4g
Li4uCj4KPiBObywgaXTigJlzIHVubmVjZXNzYXJ5IGFuZCBwcmV2ZW50cyBvcHRpbWlzYXRpb24u
Cj4KPiBKZXNzCj4KPiA+IFRoYW5rcywKPiA+IFl1bmh1aQo+ID4KPiA+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKPiA+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+IGh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKPgoKVGhhbmtzLApZ
dW5odWkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
