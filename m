Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18846C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 18 May 2022 09:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PIiC/Kj/MZ1pvXcafoM0uhkHu1ygs78okKkWD+eD7Ek=; b=kJqKIAv3S78xDK
	mcWtSeBInus09WUPeg3vAVFf48krVhJpzZNts/KqGmM6Dv9zwTKcvgH7SoKTP5hWswfzgSMQ+TB10
	LU/jLFYf6arFNutjrFL0HTfR0IbAOh9HUNFsdUB2vytF4k8I7QNRDwZlDERzi8mrwP/U6tzJrEQrL
	uTQFH8HkO1eNnATADW7MYYb8js7Q7y8ZqOSy1s6C8YVc2W7QeT0Jk6Rvr9XBP1fWzMAFTMlVJPnUv
	2N31O2wBKriW9KWvYUBO8Mlr40eUViXC5q8oErEJCazBAPKC5uYIeTP8Y9oko8XshXld7elOrK3P3
	yzQhimP6XjgsF+bPpeIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrFrK-000s5A-7B; Wed, 18 May 2022 09:20:46 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrFrG-000rti-G3
 for linux-riscv@lists.infradead.org; Wed, 18 May 2022 09:20:43 +0000
Received: by mail-wm1-x32d.google.com with SMTP id
 c190-20020a1c35c7000000b0038e37907b5bso2835230wma.0
 for <linux-riscv@lists.infradead.org>; Wed, 18 May 2022 02:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=eBrgiBGzrk60kAZSEVCexv1pWJW5TTEZ8MUjnMwLi/I=;
 b=bKCZxRM1GoQTtqmmmW5HOA0FKMOGvKrMx1cl1ODcLG19yE2nCh9+52uWp5JEeiUWWT
 2yNY2n6uNTiOKmM/R87OZFim/s1zQgcicxY8uILlNGsvr2dtMxiV23UqCIOTL7sIh0qF
 pkY1FHbSxwLaPZRBeC5eKzoLHMDkHbETzTE9n6jZcz32Y2p4o1lHbljlyPCDMNYHgE+l
 6V1kkUxJfqmqCSYSS5lXO6fjWiIbZqHVb0LYZurFDtChM14eTJdDJVBuDLFupp3ocNRc
 5xO40GRRBQOLSkH6zjsCE7Nqo1y8/PzivfcxGMJgfnCsczobb4a+pKR6J/XC3tCd0C00
 CKmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eBrgiBGzrk60kAZSEVCexv1pWJW5TTEZ8MUjnMwLi/I=;
 b=gyuWL5nVB7+IMJlfMYqg+qsPKVT5FE314tzMHO0i+Tk8KBgejAG81ilqjVNd9WWL6o
 IygsYNzPE0rARhRK5UIABw54tNV9EQy7/5wvdW22RRSFc9JHNp1mwkFIzE9PKwLM3FN2
 alDR0clpheYN4/ACstJvu0RGD/YzE+MmSCFj4bQsDAjbiTa9dbPshGiv0aP95rs338Pk
 6rpHHGElIpN7ioE/G8gZkBaH+zrYFdwdGQs1r1XFe6BKjNggKFPo14JARgInk9w/3Z25
 c9qWeLY63VlVgikiVHoAihM6oxuCiQEsq4KoVvbJdwW5/vifKzuSvy6SGoEksv8MDuYf
 2m6w==
X-Gm-Message-State: AOAM532zmlYbt3su62WQCDblbTIOEoA3b/gJomX19WZkODZ9JCZNBKY0
 xzqZT0vzgypCr0qaHw7B0IsT0e5joVeclmK94IadiA==
X-Google-Smtp-Source: ABdhPJyNgdytB47LUliXc+x/PU5W1Vst1F3N/U9fluyBnS+APsQi7/YRSS6Psb+Lcx8jhj0DGPUy4mF0djw+vfks62s=
X-Received: by 2002:a05:600c:35c1:b0:394:8621:a1d5 with SMTP id
 r1-20020a05600c35c100b003948621a1d5mr35267641wmq.196.1652865638784; Wed, 18
 May 2022 02:20:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220511214132.2281431-1-heiko@sntech.de>
 <20220518002529.GA1928329-robh@kernel.org>
 <CAAeLtUBLpDHeJHfPtaUb_OLZb_6cUQa1Z_F+06pkdJMSHtWrfQ@mail.gmail.com>
 <1893094.PYKUYFuaPT@diego>
 <CAAhSdy1sG8uzg0W2Ufi=EYFB58+JZobUa9D+rcHeb4upJoMzng@mail.gmail.com>
In-Reply-To: <CAAhSdy1sG8uzg0W2Ufi=EYFB58+JZobUa9D+rcHeb4upJoMzng@mail.gmail.com>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Wed, 18 May 2022 11:20:27 +0200
Message-ID: <CAAeLtUBYF5qG3TkVCwz-DjaM4xGrwm9GyEPSBYJo04g70cNO4w@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: riscv: document cbom-block-size
To: Anup Patel <anup@brainfault.org>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Rob Herring <robh@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Wei Fu <wefu@redhat.com>, 
 Guo Ren <guoren@kernel.org>, Atish Patra <atishp@atishpatra.org>, 
 Nick Kossifidis <mick@ics.forth.gr>, Samuel Holland <samuel@sholland.org>, 
 Christoph Muellner <cmuellner@linux.com>, krzk+dt@kernel.org,
 DTML <devicetree@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_022042_569393_69381AB9 
X-CRM114-Status: GOOD (  18.42  )
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

T24gV2VkLCAxOCBNYXkgMjAyMiBhdCAxMToxMCwgQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0
Lm9yZz4gd3JvdGU6Cj4gPiA+ID4gPiArICAgIGRlc2NyaXB0aW9uOgo+ID4gPiA+ID4gKyAgICAg
IEJsb2Nrc2l6ZSBpbiBieXRlcyBmb3IgdGhlIFppY2JvbSBjYWNoZSBvcGVyYXRpb25zLiBUaGUg
YmxvY2sKPiA+ID4gPiA+ICsgICAgICBzaXplIGlzIGEgcHJvcGVydHkgb2YgdGhlIGNvcmUgaXRz
ZWxmIGFuZCBkb2VzIG5vdCBuZWNlc3NhcmlseQo+ID4gPiA+ID4gKyAgICAgIG1hdGNoIG90aGVy
IHNvZnR3YXJlIGRlZmluZWQgY2FjaGUgc2l6ZXMuCj4gPiA+ID4KPiA+ID4gPiBXaGF0IGFib3V0
IGhhcmR3YXJlIGRlZmluZWQgY2FjaGUgc2l6ZXM/IEknbSBzY3JhdGNoaW5nIG15IGhlYWQgYXMg
dG8KPiA+ID4gPiB3aGF0IGEgJ3NvZnR3YXJlIGRlZmluZWQgY2FjaGUgc2l6ZScgaXMuCj4gPgo+
ID4gSSBhZ3JlZSB0aGF0IHRoaXMgc2hvdWxkIGJlIHdvcmRlZCBiZXR0ZXIuIFRoZSBpbnRlbnQg
d2FzIHRvIHRlbGwgdGhhdCB0aGlzCj4gPiBpcyBkaWZmZXJlbnQgZnJvbSBzYXkgdGhlIGwxLWNh
Y2hlLWJsb2NrLXNpemUuCj4gPgo+ID4gSS5lLiB0aGVzZSB2YWx1ZXMgY2FuIGJlIHRoZSBzYW1l
IGJ1dCBkb24ndCBuZWVkIHRvIGJlLiBCdXQgSSBndWVzcyBJIGdvdAo+ID4gdG9vIG11Y2ggbGVh
ZCBvbiBieSBhIGtlcm5lbCBpbXBsZW1lbnRhdGlvbiBkZXRhaWwgKEwxX0NBQ0hFX0JZVEVTIGNv
bnN0YW50KQo+Cj4gQmV0dGVyIHRvIGp1c3QgY2FsbCBpdCBhcyAidGhlIGNhY2hlIGJsb2NrLXNp
emUgZXhwZWN0ZWQgYnkgWmljYm9tIGNhY2hlCj4gb3BlcmF0aW9ucyIgd2l0aG91dCBnZXR0aW5n
IGRldGFpbHMgb2YgcmVsYXRpb24gd2l0aCBMMSBjYWNoZSBibG9jayBzaXplLgoKSSB3b3VsZCBt
YWtlIHRoaXMgYW4gZXZlbiBzdHJvbmdlciBzdGF0ZW1lbnQgYW5kIGFzc2VydCB0aGF0IEFudXAn
cwpyZWNvbW1lbmRlZCByZXdvcmRpbmcgKGFuZCBzdGF5aW5nIGF3YXkgZnJvbSBMMSBibG9jay9s
aW5lIHNpemVzIGluCnRlcm1pbm9sb2d5KSBpcyByZXF1aXJlZCB0byBhY2N1cmF0ZWx5IHJlZmxl
Y3QgdGhlIGRlc2lnbiBvZiB0aGUKUklTQy1WIENNT3MuCgpUaGUgWmljYm9tIG9wZXJhdGlvbiBz
aXplIGlzIGluIGZhY3QgZGVjb3VwbGVkIGZyb20gdGhlCmwxLWNhY2hlLWJsb2NrLXNpemUgKGFz
IHRoYXQgd291bGQgYmUgdGhlIGNhY2hlIGxpbmUgc2l6ZSDigJQgYW5kCnRoZXJlZm9yZSB0aGUg
c2l6ZSBvZiBmZXRjaGVzL3JlcGxhY2VtZW50cyB0byB0aGUgY2FjaGUpIGFzIHRoZQpkZWxpYmVy
YXRpb25zIHdpdGhpbiB0aGUgQ01PIGdyb3VwIHNob3dlZC4gICBUaGlzIGlzIG9ubHkgdGhlIGdy
YW51bGUKdGhhdCBaaWNib20gaW5zdHJ1Y3Rpb25zIG9wZXJhdGUgb24gKGFuZCB0aGVyZSBtaWdo
dCBiZSBhZGRpdGlvbmFsCm1lY2hhbmlzbXMgYXQgd29yayBpbiB0aGUgYmFja2dyb3VuZCB0aGF0
IGVuc3VyZSB0aGF0IHRoaXMgaXMgc2FmZSBmb3IKYW55IGdpdmVuIHVuZGVybHlpbmcgY2FjaGUg
aW1wbGVtZW50YXRpb24pLgoKQ2hlZXJzLApQaGlsaXBwLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
