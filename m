Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A1BC54FCD
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Aug 2026 08:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rEP4yGRjHNLPAiw8a0iAcM9Io3PMs8lULCqW3xFwYW0=; b=Pe5H4Ov59NYbIU
	lFBuaVn56MdRyLqabhhWdS41d7yiH6BCYJfDarKP+gGoij4//yXX0g4x7GEQGDd3nqkr34JD5Giw8
	1gukXFm+ngPS6x5H/QMpdD9kH0oaSw47kt5VvIa0SQfpurLNrt45GJ8Dofpoe2MWl2PXWgUdzZ0Um
	GdO5I9GB4j0aN1i+Cxlv7bXyhVmL1HsaV5lFIwwsW3uojehmJu5QqBIhBQEoX2Ai5N+mDUetPeZ1Z
	qFkG5b+imgCvplS13K8IdHgnmAA7qYof6ECGlDKIBlIhNrnux7oNnt0LYAdj8BpLlaBUveyzgUEQm
	c6QWf7WlMnmTe4bDDrTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq5CV-0000000E3j5-0llo;
	Sat, 01 Aug 2026 08:36:11 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq5CS-0000000E3hK-34QT
	for linux-riscv@lists.infradead.org;
	Sat, 01 Aug 2026 08:36:10 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5b29599b81cso2435755e87.1
        for <linux-riscv@lists.infradead.org>; Sat, 01 Aug 2026 01:36:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785573367; cv=none;
        d=google.com; s=arc-20260327;
        b=AmdEGLSn+heWSrs2OxLo678Pct08WbjT3Yr/0wMFCxAHyfAaXvdQaeWid5TuucWtx7
         cz4LFywVSRgd3DNV4t5tiafXm7oTuMLlX5tXi8U2tYFLKb4dwfC3jserC9ZcZotfVqNd
         k/+37zOHFCKmysSqZZjMPMRpJhHpTsGNhmR36rG1f9f8xOfCB+eHbo/TaI/MPrN45Vb/
         7+LoPPDEcw3p2iWkUS6WcYCqbsZBJeUO0dgz3TvXiRfjgr570112w1Caku4Bd/GMam6P
         tRN5IfpprERZKR+eZ8CUI1Rck1oSGeIbW1UxlWVMN0EMR/k+VSKzWBhKywMuc1LqEYB7
         KN4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oN+sLPJRs7U6ubaCblfaryc964dsGbRviBowu4xGE9o=;
        fh=KGvLMV+nHzopsiniSqgVTszqlNqZhPoZUkFCV8AP0vw=;
        b=DiXvCA9OgKEgnu3YG6AbeTZZBaF/0F5GQ1C9wrJNIfysfbb9NRBxWZn8Wnvmjc22Gu
         qyx5SOSqTHzHOfVbEfnF4BwVB9umqD5Uw5ChsKigih3eZoQS+JZBzt9dhxGj8oJ4cRg2
         3EU18jb05F3XeiN2W9D958Krip6W2OeWae75vAt8AZDkwdNOTEG8OW/gW8UKd9HdN8cd
         jT9JqspTS/31PvfYXzuCsOYK3hXklSQNlEoZgWnUFRs61uniCKhPnG7g6PgAr9p4Bcdb
         qVRYPcDA387aR5XXhNzbC1ttXyh+V1Rhjfyb3RtNJ/N8vXDceHWNOXJtia5gM+ZcSJlZ
         DpPQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1785573367; x=1786178167; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oN+sLPJRs7U6ubaCblfaryc964dsGbRviBowu4xGE9o=;
        b=stg8sz9gQFLuxI5ylp8u3R7Jlz6HB+rQ6Ob5ZXaxwFXeOhWEwx9ALw+smmPmGyeAPa
         D5BZ0K2GY0ZQv7S8Yjbo0DnO9UzXNaKp3aPwiE5O4/HyAORh6hadP6fyZ9UNXRUtr3GN
         egfDT8mUPcM2fyOlw0nGosiK6tpX4iINT1h7w/ygUR07Zx/g7dqJXTUOACD+9RnsTa0y
         e9NAQ1grMAdRg4ZqSxlGIhPJpt4o3WRnXO6Wuygl11XRlh7rNX309OxBX0PeG+0wAlky
         CTdZA1b/n/MGh8iH1nHmCxoRVJxvAsoApfGvX63u1OTi/Zp/IhTiSowZyqhoQsdIV5cd
         Vmug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785573367; x=1786178167;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oN+sLPJRs7U6ubaCblfaryc964dsGbRviBowu4xGE9o=;
        b=b+EcITFr5JD9mkzAf0jwbDkA5ub1KOXf8Q5twD8MBHIDpBM5cyW8RxiZ/Ku52PR6Oh
         lwSE1N4ChjIn5/icyVdUydM7H3rLtYHj3pIcAjfoHSrAaFiiVSRchTj0eQYaGZV6UHpW
         Tkw/M5O5xadSwxf6OEYHOKiRkzQiWO8+qX3O1F5ItNiBwyusQvNild6AbAtyzn5hCVh2
         4JWteqyUaVz6lJkjBjnl4ugEE6M4/FLFo6AgfvQT5B4Pq/oK7QaM2qSHD1N1coJh62VP
         t9GGU5x6T4eYZOk86ceDCJ6pABJU2rhPGyskI8RibXhpAwD4uQM9dBGXD8kCFC/61Gch
         z/fA==
X-Forwarded-Encrypted: i=1; AHgh+Ro3ll5jox0oJoRokIRDOsQrhVJ5awh9OHWyrjmdEad8x0BKfnF5slo/vaHmz2glfmJiI0KjWxYD3do8SA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7deIoyBsv8l+Z9rsh+DZi9v2K0wRQ3K1dCchCQMwXwNmeF+7B
	MSkHzZ1RVobgwho74H9+DPoWZ68nkGOSfv5oQs6+5AWzWdAc263uMlYKInlDqF6VR93rVTyidE+
	K2JCnwPhnmkhGim3RKjrqNtbwIoOKTzbOlvMp0Iz8LQ==
X-Gm-Gg: AR+sD12oXiF1j3jlzWVCJRKIiSdtMCk7Y+ZO2xfqWqmda7d9vSQqnTzQCWdZdtX4DNm
	X9WDPz6iH+yoUSW45UdhvPzwfMueoXrdZDV4vPKylrEqW6jOXqHP2SSfGiT2Dyfo1eO+o65NyAm
	dy3Y/9HPS/7EtGqQb3clAmEdPJn5PBruX4BpDgi4Np7KpYJV6Lr7gadND1LqMb/ebU9N4TGpN46
	75MNPv+q63HB1x961NmJo949WfXtKyMOmBhm19tazIp/IQtMIYtvPztXF1SMZq7uk9vHKOXCa1K
	GW4TwCF0N//TH/AX1Vf0PbGLkcnjvLflPV963KgvxePAkqoI1rco1etuprBqDvwB/1XBsKOYNry
	FOTcvZjHdVVUa96466RebIzMHdWCRnLGu3TpAz+vLNDyWKBNmDolT4R7GI6etYIOE
X-Received: by 2002:a05:6512:6889:20b0:5ae:b764:3ba5 with SMTP id
 2adb3069b0e04-5b2e4f9c50amr288278e87.64.1785573366525; Sat, 01 Aug 2026
 01:36:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260731093833.1551341-1-wang.yechao255@zte.com.cn>
In-Reply-To: <20260731093833.1551341-1-wang.yechao255@zte.com.cn>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 1 Aug 2026 14:05:52 +0530
X-Gm-Features: AUfX_mxBMP70jLpvU1dCTqR-waeQ9HTBiOZcnjCyTgyRTSVEjpFRKArAdatF0Gk
Message-ID: <CAAhSdy17xH1D7RpGnqJubqax_hTQaKpRu5g0tSDd2U6Rx71V9g@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] RISC-V: KVM: Optimize hfence request handling for
 SMP guests
To: Wang Yechao <wang.yechao255@zte.com.cn>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_013608_798586_DFC26483 
X-CRM114-Status: GOOD (  15.76  )
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

T24gRnJpLCBKdWwgMzEsIDIwMjYgYXQgMzoxMeKAr1BNIFdhbmcgWWVjaGFvIDx3YW5nLnllY2hh
bzI1NUB6dGUuY29tLmNuPiB3cm90ZToKPgo+IFRoaXMgc2VyaWVzIGltcHJvdmVzIHRoZSBoZmVu
Y2UgcmVxdWVzdCBoYW5kbGluZyBpbiBSSVNDLVYgS1ZNLAo+IHRhcmdldGluZyBzY2VuYXJpb3Mg
d2hlcmUgbXVsdGlwbGUgVkNQVXMgYXJlIHJ1bm5pbmcgYW4gU01QIGd1ZXN0Lgo+Cj4gVGhlIGZp
cnN0IHBhdGNoIEludHJvZHVjZSBtYWtlX3hmZW5jZV9yZXF1ZXN0X25vZGF0YSBmb3IgRkVOQ0Uu
SQo+IHJlcXVlc3RzIGFuZCBtb3ZlcyB0aGUgaGZlbmNlIGRhdGEvdHlwZSB2YWxpZGF0aW9uIG91
dCBvZiB0aGUKPiBWQ1BVIGxvb3AgdG8gYXZvaWQgcmVkdW5kYW50IGNoZWNrcyBvbiBldmVyeSBp
dGVyYXRpb24uCj4KPiBUaGUgc2Vjb25kIHBhdGNoIGZpeGVzIGEgbW9yZSBzdWJ0bGUgcGVyZm9y
bWFuY2UgaXNzdWU6IHdoZW4gb25lCj4gVkNQVSdzIGhmZW5jZSBxdWV1ZSBiZWNvbWVzIGZ1bGwg
YW5kIHRyaWdnZXJzIGEgZmFsbGJhY2ssIHRoZQo+IGN1cnJlbnQgY29kZSBhcHBsaWVzIHRoZSBm
YWxsYmFjayB0byBhbGwgVkNQVXMgaW5kaXNjcmltaW5hdGVseS4KPiBUaGlzIHVubmVjZXNzYXJp
bHkgZGVncmFkZXMgaGVhbHRoeSBWQ1BVcyBhbmQgY2FuIGNhdXNlIHRoZWlyCj4gcXVldWVzIHRv
IGZpbGwgdXAgcHJlbWF0dXJlbHkgZHVlIHRvIGxhY2sgb2YgcHJvY2Vzc2luZyBpdC4KPgo+IFdp
dGggdGhlc2UgY2hhbmdlcywgZmFsbGJhY2sgaXMgYXBwbGllZCBvbmx5IHRvIHRoZSBWQ1BVcyB0
aGF0Cj4gYWN0dWFsbHkgbmVlZCBpdCwgcHJlc2VydmluZyB0aGUgZWZmaWNpZW5jeSBvZiB0aGUg
bm9ybWFsIHBhdGgKPiBmb3Igb3RoZXJzLgo+Cj4gQ2hhbmdlcyBpbiB2MzoKPiAgLSBSZS1vcmRl
ciB0aGUgUEFUQ0gxIGFuZCBQQVRDSDIsIGxldCB0aGUgZml4IFBBVENIIGFzIGZpcnN0IHBhdGNo
Lgo+ICAtIExpbmsgdG8gdjI6Cj4gIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2t2bS1yaXNjdi8y
MDI2MDcwNzEyNTAzNC40MTY1MjEtMS13YW5nLnllY2hhbzI1NUB6dGUuY29tLmNuLwo+Cj4gQ2hh
bmdlcyBpbiB2MjoKPiAgLSBGaXggdGhlIHBhdGNoMDEgYnJva2VuIHRoZSBLVk1fUkVRX0ZFTkNF
X0kgcmVxdWVzdChTYXNoaWtvIEFJIHJldmlldykuCj4KPiAgLSBMaW5rIHRvIHYxOgo+ICBodHRw
czovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDI2MDcwNzExMzcxNS40MTMyNjUtMS13
YW5nLnllY2hhbzI1NUB6dGUuY29tLmNuLwo+Cj4gV2FuZyBZZWNoYW8gKDIpOgo+ICAgUklTQy1W
OiBLVk06IFNlcGFyYXRlIHJlcSBhbmQgZmFsbGJhY2tfcmVxIG1hc2tzIGluCj4gICAgIG1ha2Vf
eGZlbmNlX3JlcXVlc3QKPiAgIFJJU0MtVjogS1ZNOiBJbnRyb2R1Y2UgbWFrZV94ZmVuY2VfcmVx
dWVzdF9ub2RhdGEgZm9yIEZFTkNFLkkgcmVxdWVzdHMKPgo+ICBhcmNoL3Jpc2N2L2t2bS90bGIu
YyB8IDQ2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAzNSBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKPgo+IC0tCj4g
Mi4zOS4zCj4KClF1ZXVlZCB0aGlzIHNlcmllcyBmb3IgTGludXgtNy4zCgpUaGFua3MsCkFudXAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
