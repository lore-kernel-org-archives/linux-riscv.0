Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF89C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Mar 2022 20:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lgS7s0/pSAp6C5Jwu0p192Tc5ldti0nPdZn9A2XWV/I=; b=ZLOTbQUDVPeq71
	BRtxNjS8c4W5EiXjYsxXE3YnksrpEy+kemuhCW82RXqCYKJQJG0QHTQ+LhfyF989ywJXUuR32gewL
	jCoB41h0WcyQGATMW3nIP8nhL51II1CDiZMCfWKNNeHFMuz2sKU9k8abCYahUEj2dKvAgydRo49cM
	BFQw1TKoYduPYTLqxIfXuNOsgGMdqIrTqoC3yTS6EZ4aOMOD4zST8jjqqnYLTOGq+oZ6Xg3B+vuwU
	gSMJ2I83/NZXgSmfpu/jQDu+SXZ1oKEg8rCZuTwgWQSrPLdtwq02r4LcP+OMoIyMHuOELjPV0ZzdC
	hwGjniIdMK7YRPki9pvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWkyM-00C5m2-9n; Tue, 22 Mar 2022 20:19:18 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWkyJ-00C5km-Bw
 for linux-riscv@lists.infradead.org; Tue, 22 Mar 2022 20:19:17 +0000
Received: by mail-wm1-x32b.google.com with SMTP id
 bg31-20020a05600c3c9f00b00381590dbb33so2626089wmb.3
 for <linux-riscv@lists.infradead.org>; Tue, 22 Mar 2022 13:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=conchuod-ie.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=9rkIk0IBSzyeRqe3plIoBCEstX3E14ta3gpsDDOz6VQ=;
 b=w0g7/vAzsbVJ77bW2HILV854Pep6hfzLmiCTuW5XJtShxVs/kqM26LN2jde3Ps9PfF
 ylA2xoaZrP3rNmRerFiVrVZuPoh/RVBUo2b9k3uOF/hV3KCLjkUOHj9Xvx/D13iA6p2x
 egbG551k9ZIGhJ6VX3ccsVLlWN8vTOXkEp9FKv408xAYQmuaaecjWTXL0yVF7ghHaRcP
 ANHA7mtVOSOHNOuu/PZj4TBnQ4zeksHibjmvhRbKnbR+0dwkxhMYx1AZmLXXiRHKNCHL
 uPZMqLjMZ2WHp2xspt7JBFvePB2GglHR+JwS0BAiDjdXv/1DvcsWMhbvMKPPztP9Jhd8
 Gi6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9rkIk0IBSzyeRqe3plIoBCEstX3E14ta3gpsDDOz6VQ=;
 b=p3TWfVAZQNJCIVSHJAxd4AVyEzw53Wyt15L9KD8Z6+W90hg8W/eeXrpbaBMZrjP+wz
 XtuuH0AO1C76nLHWwj61ybqguL8kCti4/f3+NQgUoYZYRMtpGalEX3dIFTi6V5Wi1Kxa
 cTfH2P000vQN/53KkRAbhhMse9ulYpZd0sHYbzUaPbMZuO/sbwaocv12wotkwX59dpmb
 Qqk5Q2EKcHbigNq8X1aSpOGCmmlFI4LfbTDabL984op6yuTPm1c0PfYS46FvwKCku7fG
 PPPJM56Sy7Kjt/rnbjagnlJrG0i/XwO2JMycReCmq/PHP0+VrLb3fW52ag71Ay5OhJ4P
 RqKw==
X-Gm-Message-State: AOAM530k4hEoEUbT9GwLq2nNWlfpr+NAUjQzp/h4yz3ysWr6AB2IVrIR
 AUSkjrQTbpMT1iA8Gr8h3zvRhQ==
X-Google-Smtp-Source: ABdhPJwdsNeBRxq7SP9jrWlxnEHi4CbGxrooYjpyKb2EZkVSYaPeJUODsNxxuPr2Es0m2O3k2xSVWQ==
X-Received: by 2002:a05:600c:4e0d:b0:38c:a6da:adec with SMTP id
 b13-20020a05600c4e0d00b0038ca6daadecmr5600285wmq.145.1647980353450; 
 Tue, 22 Mar 2022 13:19:13 -0700 (PDT)
Received: from [192.168.2.116] ([109.76.4.19])
 by smtp.gmail.com with ESMTPSA id
 k35-20020a05600c1ca300b0038ca38626c0sm2480240wms.16.2022.03.22.13.19.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 13:19:13 -0700 (PDT)
Message-ID: <7dca0cb8-f0aa-a4cf-7f6f-0e4025527f5d@conchuod.ie>
Date: Tue, 22 Mar 2022 20:19:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 0/5] Generic Ticket Spinlocks
Content-Language: en-US
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, jonas@southpole.se,
 stefan.kristiansson@saunalahti.fi, shorne@gmail.com, mingo@redhat.com,
 Will Deacon <will@kernel.org>, longman@redhat.com, boqun.feng@gmail.com,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 Arnd Bergmann <arnd@arndb.de>, jszhang@kernel.org,
 wangkefeng.wang@huawei.com, openrisc@lists.librecores.org,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 peterz@infradead.org
References: <mhng-f97b1e7d-1523-4ae5-923b-e73a8db48824@palmer-ri-x1c9>
From: Conor Dooley <mail@conchuod.ie>
In-Reply-To: <mhng-f97b1e7d-1523-4ae5-923b-e73a8db48824@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220322_131915_441291_A9132153 
X-CRM114-Status: GOOD (  30.43  )
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

T24gMjIvMDMvMjAyMiAyMDowMiwgUGFsbWVyIERhYmJlbHQgd3JvdGU6Cj4gT24gVHVlLCAyMiBN
YXIgMjAyMiAxMToxODoxOCBQRFQgKC0wNzAwKSwgbWFpbEBjb25jaHVvZC5pZSB3cm90ZToKPj4g
T24gMTYvMDMvMjAyMiAyMzoyNSwgUGFsbWVyIERhYmJlbHQgd3JvdGU6Cj4+PiBQZXRlciBzZW50
IGFuIFJGQyBvdXQgYWJvdXQgYSB5ZWFyIGFnbwo+Pj4gPGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xrbWwvWUhiQkJ1VkZObkk0a2pqM0BoaXJlei5wcm9ncmFtbWluZy5raWNrcy1hc3MubmV0Lz4s
IAo+Pj4KPj4+IGJ1dCBhZnRlciBhIHNwaXJpdGVkIGRpc2N1c3Npb24gaXQgbG9va3MgbGlrZSB3
ZSBsb3N0IHRyYWNrIG9mIHRoaW5ncy4KPj4+IElJUkMgdGhlcmUgd2FzIGJyb2FkIGNvbnNlbnN1
cyBvbiB0aGlzIGJlaW5nIHRoZSB3YXkgdG8gZ28sIGJ1dCB0aGVyZQo+Pj4gd2FzIGEgbG90IG9m
IGRpc2N1c3Npb24gc28gSSB3YXNuJ3Qgc3VyZS7CoCBHaXZlbiB0aGF0IGl0J3MgYmVlbiBhIHll
YXIsCj4+PiBJIGZpZ3VyZWQgaXQnZCBiZSBiZXN0IHRvIGp1c3Qgc2VuZCB0aGlzIG91dCBhZ2Fp
biBmb3JtYXR0ZWQgYSBiaXQgbW9yZQo+Pj4gZXhwbGljaXRseSBhcyBhIHBhdGNoLgo+Pj4KPj4+
IFRoaXMgaGFzIGhhZCBhbG1vc3Qgbm8gdGVzdGluZyAoanVzdCBhIGJ1aWxkIHRlc3Qgb24gUklT
Qy1WIGRlZmNvbmZpZyksCj4+PiBidXQgSSB3YW50ZWQgdG8gc2VuZCBpdCBvdXQgbGFyZ2VseSBh
cy1pcyBiZWNhdXNlIEkgZGlkbid0IGhhdmUgYSBTT0IKPj4+IGZyb20gUGV0ZXIgb24gdGhlIGNv
ZGUuwqAgSSBoYWQgc2VudCBhcm91bmQgc29tZXRoaW5nIHNvcnQgb2Ygc2ltaWxhciBpbgo+Pj4g
c3Bpcml0LCBidXQgdGhpcyBsb29rcyBjb21wbGV0ZWx5IHJlLXdyaXR0ZW4uwqAgSnVzdCB0byBw
bGF5IGl0IHNhZmUgSQo+Pj4gd2FudGVkIHRvIHNlbmQgb3V0IGFsbW9zdCBleGFjdGx5IGFzIGl0
IHdhcyBwb3N0ZWQuwqAgSSdkIHByb2JhYmx5IHJlbmFtZQo+Pj4gdGhpcyB0c3BpbmxvY2sgYW5k
IHRzcGlubG9ja190eXBlcywgYXMgdGhlIG1pcy1tYXRjaCBraW5kIG9mIG1ha2VzIG15Cj4+PiBl
eWVzIGdvIGZ1bm55LCBidXQgSSBkb24ndCByZWFsbHkgY2FyZSB0aGF0IG11Y2guwqAgSSdsbCBh
bHNvIGdvIHRocm91Z2gKPj4+IHRoZSBvdGhlciBwb3J0cyBhbmQgc2VlIGlmIHRoZXJlJ3MgYW55
IG1vcmUgY2FuZGlkYXRlcywgSSBzZWVtIHRvCj4+PiByZW1lbWJlciB0aGVyZSBoYXZpbmcgYmVl
biBtb3JlIHRoYW4ganVzdCBPcGVuUklTQyBidXQgaXQncyBiZWVuIGEKPj4+IHdoaWxlLgo+Pj4K
Pj4+IEknbSBpbiBubyBiaWcgcnVzaCBmb3IgdGhpcyBhbmQgZ2l2ZW4gdGhlIGNvbXBsZXggSFcg
ZGVwZW5kZW5jaWVzIEkKPj4+IHRoaW5rIGl0J3MgYmVzdCB0byB0YXJnZXQgaXQgZm9yIDUuMTks
IHRoYXQnZCBnaXZlIHVzIGEgZnVsbCBtZXJnZQo+Pj4gd2luZG93IGZvciBmb2xrcyB0byB0ZXN0
L2JlbmNobWFyayBpdCBvbiB0aGVpciBzeXN0ZW1zIHRvIG1ha2Ugc3VyZSBpdCdzCj4+PiBPSy4K
Pj4KPj4gSXMgdGhlcmUgYSBzcGVjaWZpYyB3YXkgeW91IGhhdmUgYmVlbiB0ZXN0aW5nL2JlbmNo
aW5nIHRoaW5ncywgb3IgaXMgaXQKPj4ganVzdCBhIGNhc2Ugb2YgdGVzdCB3aGF0IHdlIG91cnNl
bHZlcyBjYXJlIGFib3V0Pwo+IAo+IEkgZG8gYSBidW5jaCBvZiBmdW5jdGlvbmFsIHRlc3Rpbmcg
aW4gUUVNVSAoaXQncyBhbGwgaW4gbXkgCj4gcmlzY3Ytc3lzdGVtcy1jaSByZXBvLCBidXQgdGhh
dCdzIG5vdCByZWFsbHkgZml0IGZvciBodW1hbiBjb25zdW1wdGlvbiAKPiBzbyBJIGRvbid0IHRl
bGwgZm9sa3MgdG8gdXNlIGl0KS7CoCBUaGF0J3MgcHJldHR5IG11Y2ggdXNlbGVzcyBmb3IgCj4g
c29tZXRoaW5nIGxpa2UgdGhpczogc3VyZSBpdCdkIGZpbmQgc29tZXRoaW5nIGp1c3Qgc3RyYWln
aHQtdXAgYnJva2VuIGluIAo+IHRoZSBsb2NrIGltcGxlbWVudGF0aW9uLCBidXQgdGhlIHN0dWZm
IEknbSByZWFsbHkgd29ycmllZCBhYm91dCBoZXJlIAo+IHdvdWxkIGJlIHBvb3IgaW50ZXJhY3Rp
b25zIHdpdGggaGFyZHdhcmUgdGhhdCB3YXNuJ3QgZGVzaWduZWQvdGVzdGVkIAo+IGFnYWluc3Qg
dGhpcyBmbGF2b3Igb2YgbG9ja3MuCj4gCj4gSSBkb24ndCBjdXJyZW50bHkgZG8gYW55IHJlZ3Vs
YXIgdGVzdGluZyBvbiBIVywgYnV0IHRoZXJlJ3MgYSBoYW5kZnVsIG9mIAo+IGZvbGtzIHdobyBk
by7CoCBJZiB5b3UndmUgZ290IEhXIHlvdSBjYXJlIGFib3V0IHRoZW4gdGhlIGJlc3QgYmV0IGlz
IHRvIAo+IGdpdmUgdGhpcyBhIHNob3Qgb24gaXQuwqAgVGhlcmUncyBhbHJlYWR5IGJlZW4gc29t
ZSBib290IHRlc3QgcmVwb3J0cywgc28gCj4gaXQncyBhdCBsZWFzdCBtb3N0bHkgdGhlcmUgKG9u
IFJJU0MtViwgbGFzdCBJIHNhdyBpdCB3YXMgYnJlYWtpbmcgCj4gT3BlblJJU0Mgc28gdGhlcmUn
cyBwcm9iYWJseSBzb21lIGx1cmtpbmcgaXNzdWUgc29tZXdoZXJlKS7CoCBJIHdhcyAKPiBob3Bp
bmcgd2UnZCBnZXQgZW5vdWdoIGNvdmVyYWdlIHRoYXQgd2F5IHRvIGhhdmUgY29uZmlkZW5jZSBp
biB0aGlzLCBidXQgCj4gaWYgbm90IHRoZW4gSSd2ZSBnb3QgYSBidW5jaCBvZiBSSVNDLVYgaGFy
ZHdhcmUgbHlpbmcgYXJvdW5kIHRoYXQgSSBjYW4gCj4gc3BpbiB1cCB0byBmaWxsIHRoZSBnYXBz
LgoKQXllLCBJJ2xsIGF0IHRoZSB2ZXJ5IGxlYXN0IGJvb3QgaXQgb24gYW4gSWNpY2xlICh3aGlj
aCBzaG91bGQgKmZpbmFsbHkqIApiZSBhYmxlIHRvIGJvb3QgYSBtYWlubGluZSBrZXJuZWwgd2l0
aCA1LjE4KSwgYnV0IEkgZG9uJ3QgdGhpbmsgdGhhdCdsbCAKYmUgYSBwcm9ibGVtLgoKPiBBcyBm
YXIgYXMgd2hhdCB3b3JrbG9hZHMsIEkgcmVhbGx5IGRvbid0IGtub3cgaGVyZS7CoCBBdCBsZWFz
dCBvbiBSSVNDLVYsIAo+IEkgdGhpbmsgYW55IGxvY2sgbWljcm9iZW5jaG1hcmtzIHdvdWxkIGJl
IGVzc2VudGlhbGx5IG1lYW5pbmdsZXNzOiB0aGlzIAo+IGlzIGZhaXIsIHNvIGV2ZW4gaWYgbG9j
ay91bmxvY2sgaXMgYSBiaXQgc2xvd2VyIHRoYXQncyBwcm9iYWJseSBhIHdpbiAKPiBmb3IgcmVh
bCB3b3JrbG9hZHMuwqAgVGhhdCBzYWlkLCBJJ20gbm90IHN1cmUgYW55IG9mIHRoZSBleGlzdGlu
ZyAKPiBoYXJkd2FyZSBydW5zIGFueSB3b3JrbG9hZHMgdGhhdCBJJ20gcGVyc29uYWxseSBpbnRl
cmVzdGVkIGluIHNvIHVubGVzcyAKPiB0aGlzIGlzIHNvbWUgbWFzc2l2ZSBoaXQgdG8ganVzdCBn
ZW5lcmFsIHN5c3RlbSByZXNwb25zaXZlbmVzcyBvciAKPiBtYWtlL0dDQyB0aGVuIEknbSBwcm9i
YWJseSBub3QgZ29pbmcgdG8gZmluZCBhbnl0aGluZy4KClRoZXJlJ3MgYSBjb3VwbGUgYmVuY2ht
YXJrcyB3ZSd2ZSBiZWVuIGxvb2tpbmcgYXQsIGFsdGhvdWdoIEknbSBub3Qgc3VyZSAKdGhhdCB0
aGV5IGFyZSAicmVhbCIgd29ya2xvYWRzLiBJZiB0aGV5IGVuY291bnRlciBhbnkgbWVhbmluZ2Z1
bCAKZGlmZmVyZW5jZSBJJ2xsIGxldCB5b3Uga25vdyBJIGd1ZXNzLgoKCj4gSGFwcHkgdG8gaGVh
ciBpZiBhbnlvbmUgaGFzIGlkZWFzLCB0aG91Z2guCgpNZSB0b28hCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
