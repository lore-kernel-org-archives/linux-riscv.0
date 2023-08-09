Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68BE5EB64DD
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 06:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=whJ1cHgp0ADvGHMa1dZ2DKOxoVbLX98LFHHNCP6Mu4U=; b=m6UishLv9VKyAq
	X/1W/P3yiFPl3qCvM34nAZeMx20PJnR/Vd1rT8xehxYkFMUKilR9o390qrDXAAswQT+Q2Q0TfYJCg
	0AIkZGO6DJfY2SplpI+92tuWA8+RnKR28+8DYFbyVls+yLXFOEFN9BRUnm4tkMwWj/inRvTTQ9G52
	EVg695+ZR/6RaqJ5/GqQ1FMdh6Y9H3O/ZQAxAhtdL5/Q2RntYV2TQULeEZOsE42X+4RZzGLiDR7Ba
	0AhATytr1ZKLhwJP+Gd+FOvvk6BIHplv4wBvn1d1cfzGf4ZAcv3s2g7mci3mRYPJYSqNgiXXhCAgP
	wwoExQaM1S1ScIKyHXng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTd9M-004Bha-1o;
	Wed, 09 Aug 2023 06:58:32 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTd9I-004BgS-1s
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 06:58:30 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-56ce936f7c0so4629455eaf.3
        for <linux-riscv@lists.infradead.org>; Tue, 08 Aug 2023 23:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1691564303; x=1692169103;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pefRTU+8B4m9LlJAFGQ0IQAqbtMHJMUCx10va6N3Enw=;
        b=kz805cuhiEqMxJpNJIufLksHrMhd7adoGDZy9oV1BHultXIZgvH+RyhBxZVCzVgzS1
         PwOkw442ijAM94hAao2Fq9PqJKXcrrF8D65D23NizmOYWcQtSucLZuIBFn11hHkBdYEs
         NoT956z0mGNKbS+5lX7fvo+Ohr7kdF9hmidxuC6hjaS8EobOZJQ2NPGKYPK4hN6FmOAv
         NtIsgPPQH4grl6sGObE32GxmZ3L4V/ctfsbfDKqFmWa9FavJzB+N/mdoa2F89ncCTzjj
         c4+a1ECILnbtW+vqIvkD20K9TedBOEd3flPXKSCaEXd337M5yQa5Mjb1D0jg7WKqm6ou
         WJ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691564303; x=1692169103;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pefRTU+8B4m9LlJAFGQ0IQAqbtMHJMUCx10va6N3Enw=;
        b=NfTGVG/kMcJAKofxyj9RUEGmT2PfsUXZ5uDZob/z6JKwjCAb34VW9zsurqNGkXKMUL
         t5WY+O3SHIWwnyHyjVG+rNx2a50oVedU65/gUQd+gig7UWoIsr/VtY9QGHM5JLodeN+I
         fLFg29byIvg4UArl2TAtLfMKhlaZk1oVpRqrTfEhlaHHw6y6iu+iHpc1sxJWI77dJfNP
         yXilZvyKzqloVD4QI6aXdTDrYPBjEt2E5iB2/N+8ZKTJge+Fnnd3raK9Ij90zf9a9zeo
         BvUevTRQD7DqcE3SkvD7nNRE30tOhty6BYvN3yFxJ/p9D/1bxozvSOUbYX7hQIR++Wqq
         Vh1g==
X-Gm-Message-State: AOJu0YylGm3w3Tsgh+OLlHlDsBFA//8ts690VBCk282vIpgqdFNidIhm
	6xFj5fO4AOjbtPMcFBhp92rJg2KI+beAOI7o6aCvLw==
X-Google-Smtp-Source: AGHT+IFOQzArXEOnOoN5WR9/edMYywXHyjfSlSB4WWO8aADAYXK1YC337PmXNavlPzrTL4N3WEIdVBrYJc28FICV1Mw=
X-Received: by 2002:a05:6808:1988:b0:3a3:654d:b2e5 with SMTP id
 bj8-20020a056808198800b003a3654db2e5mr2333267oib.42.1691564302996; Tue, 08
 Aug 2023 23:58:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230725070549.89810-1-luxu.kernel@bytedance.com> <mhng-a0239c56-385e-40a9-8a71-45d50e28b45d@palmer-ri-x1c9>
In-Reply-To: <mhng-a0239c56-385e-40a9-8a71-45d50e28b45d@palmer-ri-x1c9>
From: =?UTF-8?B?5pet6Lev?= <luxu.kernel@bytedance.com>
Date: Wed, 9 Aug 2023 14:58:11 +0800
Message-ID: <CAPYmKFvXf7q_8QzFe4VFL1s-j0P3ZGSZ8nG1q4HmtU4rzek77Q@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] riscv: Fix local irq restore when flags
 indicates irq disabled
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_235828_829125_FE78B766 
X-CRM114-Status: GOOD (  24.81  )
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

T24gV2VkLCBBdWcgOSwgMjAyMyBhdCAyOjA14oCvUE0gUGFsbWVyIERhYmJlbHQgPHBhbG1lckBk
YWJiZWx0LmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUsIDI1IEp1bCAyMDIzIDAwOjA1OjQ5IFBEVCAo
LTA3MDApLCBsdXh1Lmtlcm5lbEBieXRlZGFuY2UuY29tIHdyb3RlOgo+ID4gV2hlbiBhcmNoX2xv
Y2FsX2lycV9yZXN0b3JlKCkgaXMgY2FsbGVkIHdpdGggZmxhZ3MgaW5kaWNhdGluZyBpcnFzCj4g
PiBkaXNhYmxlZCwgd2UgbmVlZCB0byBjbGVhciBTUl9JRSBiaXQgaW4gQ1NSX1NUQVRVUywgd2hl
cmVhcyBjdXJyZW50Cj4gPiBpbXBsZW1lbnRhdGlvbiBiYXNlZCBvbiBjc3Jfc2V0KCkgZnVuY3Rp
b24gb25seSBzZXRzIFNSX0lFIGJpdCBvZgo+ID4gQ1NSX1NUQVRVUyB3aGVuIFNSX0lFIGJpdCBv
ZiBmbGFncyBpcyBoaWdoIGFuZCBkb2VzIG5vdGhpbmcgd2hlbgo+ID4gU1JfSUUgYml0IG9mIGZs
YWdzIGlzIGxvdy4KPiA+Cj4gPiBUaGlzIGNvbW1pdCBzdXBwbGllcyBjc3IgY2xlYXIgb3BlcmF0
aW9uIHdoZW4gY2FsbGluZyBpcnEgcmVzdG9yZQo+ID4gZnVuY3Rpb24gd2l0aCBmbGFncyBpbmRp
Y2F0aW5nIGlycSBkaXNhYmxlZC4KPiA+Cj4gPiBGaXhlczogNmQ2MGI2ZWUwYzk3ICgiUklTQy1W
OiBEZXZpY2UsIHRpbWVyLCBJUlFzLCBhbmQgdGhlIFNCSSIpCj4gPiBTaWduZWQtb2ZmLWJ5OiBY
dSBMdSA8bHV4dS5rZXJuZWxAYnl0ZWRhbmNlLmNvbT4KPiA+IC0tLQo+ID4gIGFyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vaXJxZmxhZ3MuaCB8IDUgKysrKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vaXJxZmxhZ3MuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaXJxZmxh
Z3MuaAo+ID4gaW5kZXggMDhkNGQ2YTViN2U5Li43YzMxZmMzYzM1NTkgMTAwNjQ0Cj4gPiAtLS0g
YS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2lycWZsYWdzLmgKPiA+ICsrKyBiL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vaXJxZmxhZ3MuaAo+ID4gQEAgLTQ5LDcgKzQ5LDEwIEBAIHN0YXRpYyBpbmxp
bmUgaW50IGFyY2hfaXJxc19kaXNhYmxlZCh2b2lkKQo+ID4gIC8qIHNldCBpbnRlcnJ1cHQgZW5h
YmxlZCBzdGF0dXMgKi8KPiA+ICBzdGF0aWMgaW5saW5lIHZvaWQgYXJjaF9sb2NhbF9pcnFfcmVz
dG9yZSh1bnNpZ25lZCBsb25nIGZsYWdzKQo+ID4gIHsKPiA+IC0gICAgIGNzcl9zZXQoQ1NSX1NU
QVRVUywgZmxhZ3MgJiBTUl9JRSk7Cj4gPiArICAgICBpZiAoZmxhZ3MgJiBTUl9JRSkKPiA+ICsg
ICAgICAgICAgICAgY3NyX3NldChDU1JfU1RBVFVTLCBTUl9JRSk7Cj4gPiArICAgICBlbHNlCj4g
PiArICAgICAgICAgICAgIGNzcl9jbGVhcihDU1JfU1RBVFVTLCBTUl9JRSk7Cj4KPiBVbmxlc3Mg
SSdtIG1pc3Npbmcgc29tZXRoaW5nLCB0aGUgb3JpZ2luYWwgdmVyc2lvbiBpcyBjb3JyZWN0Ogo+
IGxvY2FsX2lycV9yZXN0b3JlKCkgbXVzdCBiZSBwYWlyZWQgd2l0aCBhIGxvY2FsX2lycV9zYXZl
KCksIHNvIHdlIGNhbgo+IG9ubHkgZ2V0IGhlcmUgd2l0aCBpbnRlcnJ1cHRzIGRpc2FibGVkLgoK
WWVzLCBpdCBpcyBjb3JyZWN0IGlmIGxvY2FsX2lycV9zYXZlKCkgaXMgY2FsbGVkIHdoZW4gaXJx
IGlzIGVuYWJsZWQgYmVmb3JlLgpUaGUgZmxhZ3MgcmV0dXJuZWQgd2lsbCBiZSBTUl9JRS4gQW5k
IGl0IGlzIHNhZmUgdG8gY2FsbCBsb2NhbF9pcnFfcmVzdG9yZSgpCndpdGggZmxhZyBTUl9JRSBp
biBhbnkgY2FzZS4KCkhvd2V2ZXIsIGlmIGxvY2FsX2lycV9zYXZlKCkgaXMgY2FsbGVkIHdoZW4g
aXJxIGlzIGRpc2FibGVkLiBUaGUgU1JfSUUgYml0IG9mCmZsYWcgcmV0dXJuZWQgaXMgY2xlYXIu
IElmIHNvbWUgY29kZSBiZXR3ZWVuIGxvY2FsX2lycV9zYXZlKCkgYW5kCmxvY2FsX2lycV9yZXN0
b3JlKCkgcmVlbmFibGVzIGlycSwgY2F1c2luZyB0aGUgU1JfSUUgYml0IG9mIENTUl9TVEFUVVMK
YmFjayB0byAxLCB0aGVuIGxvY2FsX2lycV9yZXN0b3JlKCkgY2FuIG5vdCByZXN0b3JlIGlycSBz
dGF0dXMgYmFjayB0byBkaXNhYmxlZC4KCkhlcmUgaXMgYW4gZXhhbXBsZSBpbiBleGlzdGluZyBk
cml2ZXIgKG1heSBub3QgYmVsb25nIHRvIHJpc2N2IGFyY2gpIGluCmRyaXZlcnMvbmV0L3dpcmVs
ZXNzL3JlYWx0ZWsvcnRsd2lmaS9ydGw4NzIzYWUvaHcuYy4gVGhlIHBzZXVkbyBjb2RlCmJlaGF2
ZXMgbGlrZToKCmludCBydGw4NzIzZV9od19pbml0KHN0cnVjdCBpZWVlODAyMTFfaHcgKmh3KQp7
CiAgICAgaW50IGVycjsKICAgICB1bnNpZ25lZCBsb25nIGZsYWdzOwogICAgIC4uLgogICAgIGxv
Y2FsX2lycV9zYXZlX2ZsYWdzKGZsYWdzKTsKICAgICBsb2NhbF9pcnFfZW5hYmxlKCk7CiAgICAg
Li4uCiAgICAgbG9jYWxfaXJxX3Jlc3RvcmUoZmxhZ3MpOwogICAgIC4uLgogICAgIHJldHVybiBl
cnI7Cn0KCgo+Cj4gPiAgfQo+ID4KPiA+ICAjZW5kaWYgLyogX0FTTV9SSVNDVl9JUlFGTEFHU19I
ICovCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
