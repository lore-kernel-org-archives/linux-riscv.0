Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA738C77B7F
	for <linux-riscv@archiver.kernel.org>; Thu, 11 May 2023 22:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GpjXxkjooo1KD7UtSMTHQyDKMSUus5jeLHZt8QYbh2A=; b=pX+tQGHN+3F8S9
	num7R3GuunzVyxyPw67eXaKFT0VyQowMworWiiSwlJO8NBdORvCER58JNTnJ1uhRJuLTuDrbROIqi
	bApjlg824JAP+M2xX8+Sn6VVOzMGFAXRxSG8L4wF9NKK+1w/XRwJNMxAt0DKiDDcKXh2ei7fUT9b6
	qcsV2B+fqwbpThn4rB15VFez/1kNCW9XXrBGuHTgsEdT/FfQFLbtDfjgRbGJ7fw6SG80kZr4neOS9
	CiAs6qrpT8HWt6MImzSVCo/TdlVSKvNL7XWgHSGJpUNeKav75W2LS40eGBbx8qTXHBwIEj7VGiCpu
	9dAfzV5prbTWRp0ez76w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxErx-00ACPc-0A;
	Thu, 11 May 2023 22:34:41 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxEru-00ACOe-0x
	for linux-riscv@lists.infradead.org;
	Thu, 11 May 2023 22:34:40 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6439bbc93b6so6386842b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 11 May 2023 15:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1683844475; x=1686436475;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2i0ZAn6fgrs+9yDTMdM995rindzSbWOWY19wFX3F1Cg=;
        b=JMLw0Vd7k+yQLXI7MoQHgBO+VbI2Hzzj0WiGOpVah1cCGrEMrM6teNmcW173sWvWsY
         AB2qypKfpszANXwLnhS3ckRZMV5cdNnKUZYiyloTIwwG/C2qyT+e718WEbwq6vE6DRVp
         qZbHUP+MTUgVk9VXmwZDoOFBvgwYpmqUGwhaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683844475; x=1686436475;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2i0ZAn6fgrs+9yDTMdM995rindzSbWOWY19wFX3F1Cg=;
        b=T4y1GURdQ/jJYNvmhhU0chr4exX4N656PlWemxrPZO5rxbRjFkyCw9+69N1sU0ox/I
         yD7oyp5Tqwsyn3lsjQFr+QwY+sPcME2Odu8x3XUcmnKX2jfedL+BzxnWvB5Epf9A88P5
         GCQshlkYU+RXTlvKHcoqzV1hafGNK3nxkYTmr22PGH2OJSHS0jfO9a6fw+NnJKnhJjWq
         ZXMPUSbAkIcEFeW/54uwfIihavftj309cXVsvCoqiqscsmc7t3i+o6rSp3hjIodVV1FK
         9Syc6TrSbRMLBVhwAdU8GNecC7kY8YGex+ekYWPoKfYIO0pbAERzAmurfZYPHMTT2FG5
         JiKA==
X-Gm-Message-State: AC+VfDxJVIDnr35CjdLI8BTV7QR6zFasiQdI3KV8zJ6FggKrr32OeOfd
	a7QkusHtaTV28TulQMxScMQQJ+2aMqVHcLX3W4FH
X-Google-Smtp-Source: ACHHUZ6eLRH0exBnb84sK8SjLp9D16l7lD52O5AWhtwAGiuPYq0u7uk6NnPU1czUw/+F+3Wg+rjf7/jhxomtv9uSBvg=
X-Received: by 2002:a05:6a20:1587:b0:101:5171:c880 with SMTP id
 h7-20020a056a20158700b001015171c880mr13578515pzj.62.1683844475064; Thu, 11
 May 2023 15:34:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230508-hypnotic-phobia-99598439d828@spud> <CAOnJCUKM13+qzR-rKJZj6OD=-DWiu0z9atzBJ89j_bRwByiowA@mail.gmail.com>
 <20230511-punctuate-dinghy-0dd9be94270c@spud>
In-Reply-To: <20230511-punctuate-dinghy-0dd9be94270c@spud>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 11 May 2023 15:34:24 -0700
Message-ID: <CAOnJCUL-JTNJMCrAOgnk80pMxOQq9k2+fv84D6cPWHjZmrkqRA@mail.gmail.com>
Subject: Re: [RFC 0/6] Deprecate riscv,isa DT property?
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Yangyu Chen <cyy@cyyself.name>, 
	Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh+dt@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_153438_562057_4130A55E 
X-CRM114-Status: GOOD (  27.70  )
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

T24gVGh1LCBNYXkgMTEsIDIwMjMgYXQgMjo0N+KAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUaHUsIE1heSAxMSwgMjAyMyBhdCAwMjoyNzo0NFBNIC0w
NzAwLCBBdGlzaCBQYXRyYSB3cm90ZToKPgo+ID4gPiBUaGUgb3RoZXIgdGhvdWdodCBJIGhhZCB3
YXMgdGhhdCBwZXJoYXBzIHNvbWUgc29mdHdhcmUgbWF5IGNob29zZSBub3QgdG8KPiA+ID4gaW1w
bGVtZW50IHZlcnNpb24geC55LjAgb2YgYW4gZXh0ZW5zaW9uIGFuZCBvbmx5IHN1cHBvcnQgeC56
LjAsIHogPiB5Cj4gPiA+IGZvciBzb21lIHJlYXNvbi4gV2UnZCB3YW50IHRvIHJlZnVzZSB0aGF0
IGV4dGVuc2lvbiBpZiB0aGUgZXh0ZW5zaW9uIGlzCj4gPiA+IGZvdW5kLCBidXQgdGhlIHZlcnNp
b24gaXMgbm90IGxpc3RlZCBhcyBiZWluZyBzb21ldGhpbmcgY29tcGF0aWJsZSB3aXRoCj4gPiA+
IHguei4wLCBhbmQgd2hpbGUgdGhlIElTQSBzcGVjIGRvZXMgc2F5IHRoYXQgdGhlIGRlZmF1bHQg
YXNzdW1wdGlvbiBpcwo+ID4gPiAycDAgZm9yIHVudmVyc2lvbmVkIGV4dGVuc2lvbnMgaW4gaXRz
IGN1cnJlbnQgZm9ybSwgSSBzdHJ1Z2dsZSB0bwo+ID4gPiBleHRyYXBvbGF0ZSB0aGF0IHRvIGV4
dGVuc2lvbnMgbm90IGN1cnJlbnRseSBwYXJ0IG9mIHRoZSB1bnByaXYgc3BlYywKPiA+ID4gYnV0
IHJhdGhlciBkZWZpbmVkIG9uIHRoZWlyIG93bi4KPiA+ID4KPiA+Cj4gPiBUaGF0J3MgYSBmYWly
IHBvaW50LiBIb3dldmVyLCBhbnkgbmV3IFJWSSBJU0EgZXh0ZW5zaW9uIHdpbGwgb25seSBoYXZl
IHYxLjAKPiA+IGFzIHBlciBteSBrbm93bGVkZ2UuIEFueSBuZXcgZmVhdHVyZSB3aWxsIGhhdmUg
dG8gYmUgcGFydCBvZiBhCj4gPiBkaWZmZXJlbnQgZXh0ZW5zaW9uLgo+ID4gQXQgbGVhc3QgdGhh
dCB3YXMgdGhlIHBsYW4gZGlzY3Vzc2VkIGxhc3QgeWVhci4KPgo+IFRoYXQncyBtb3JlIHRoYW4g
bGFzdCB5ZWFyIGF0IHRoaXMgcG9pbnQsIGFuZCBub3RoaW5nIGhhcyBjaGFuZ2VkIGluIHRoZQo+
IGRvY3VtZW50YXRpb24hIFRhbGsncyBjaGVhcCwgZWhoPwo+CgpZdXAuIEkgd2lsbCBwb2tlIFJW
SSBmb2xrcyB0byBjaGVjayBpZiBpdCBzdGlsbCBpcyB0aGUgcGxhbiBvciBjaGFuZ2VkICEhCgo+
ID4gaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2L3Jpc2N2LWlzYS1tYW51YWwvaXNzdWVzLzc4MSNp
c3N1ZWNvbW1lbnQtOTgzMjIyNjU1Cj4gPgo+ID4gQXJlIHlvdSBhd2FyZSBvZiBhbnkgZGlzY3Vz
c2lvbiB0aGF0IGNoYW5nZXMgdGhpcyA/Cj4KPiBJdCdzIGNhbGxlZCAidHJ1c3QgaXNzdWVzIi4g
SSBhbSBmYXIgbGVzcyB3b3JyaWVkIGFib3V0IHRoZSBhZGRpdGlvbiBvZgo+IG5ldyBmZWF0dXJl
cyB0aG91Z2ggdGhhbiB0aGUgcmVtb3ZhbCBvZiBleGlzdGluZyBvbmVzLgo+IFBhcnQgb2YgbWUg
ZmVhcnMgZm9yIGZlbmNlLmktbGVzcyBzeXN0ZW1zIGZvciBleGFtcGxlLCBidXQgdGhlcmUgd291
bGQKPiBiZSBvdGhlciB3YXlzIHRvIGJvZGdlIGFyb3VuZCB0aGUgbWVzcyBpZiBpdCBjb21lcyB0
byBwYXNzLgo+IElmIHdlIGFyZSAqc3VyZSogdGhhdCBubyBleHRlbnNpb25zIHdpbGwgbW9kaWZ5
IGZlYXR1cmVzIGFkZGl0aXZlbHkgb3IKPiBzdWJ0cmFjdGl2ZWx5LCB0aGVuIHRoaXMgbWF5IG5v
dCBiZSBuZWVkZWQgYXQgYWxsICYgSSBjYW4gYXZvaWQgaGF2aW5nCj4gdG8gYmVuZCBkdC12YWxp
ZGF0ZSB0byBteSB3aWxsLgoKRmFpciBlbm91Z2guIExldCdzIGdldCBzb21lIGNsYXJpZmljYXRp
b24gZmlyc3QgZnJvbSBSVkkuIEl0IG11c3QgYmUKZG9jdW1lbnRlZCBpbiB1bnByaXYKc3BlYy4g
T3RoZXJ3aXNlLCB0aGVyZSBpcyBubyBwb2ludCBvZiBwcm9taXNlIDopCgo+IFdlIGhhdmUgbm8g
Z3VhcmFudGVlcyBmb3IgdmVuZG9yIGV4dGVuc2lvbnMgb24gdGhhdCBmcm9udCBlaXRoZXIsCj4g
dGhleSdyZSBmcmVlIHRvIGRvIHdoYXQgdGhleSBsaWtlIHcuci50LiB2ZXJzaW9uaW5nLCBubz8K
ClZlbmRvciBleHRlbnNpb25zIGFyZSB3aWxkIHdlc3QuIFdobyBrbm93cyB3aGF0IHNjaGVtZSB0
aGV5IHdpbGwgdXNlLgpXZSB3aWxsIGxpa2VseSBoYXZlIGEgdmVuZG9yIHNwZWNpZmljIHN0cmlu
ZyBwYXJzaW5nIGxvZ2ljLiBUaGV5IGNhbiBkbyB3aGF0ZXZlcgppbiB0aGF0IHRvIGZpZ3VyZSBv
dXQgdGhlIHZlcnNpb24gaWYgdGhleSByZXF1aXJlIGl0LgoKLS0gClJlZ2FyZHMsCkF0aXNoCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
