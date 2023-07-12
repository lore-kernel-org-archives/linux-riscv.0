Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F165FEB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 18:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=aXfMCSaxTb10Vg74DDvVFItC2iaCxNzcTWDtD9K271E=; b=lCkp050SoHn6isaVxxXcKpwYy1
	hBddmDQaRAI5lWRv8Rz8cQNPCqIRIsjzA7vc7f2W3jbUYOShIt5j/leWZjsvuCcON97EmFrKUdzhs
	EuBZdgfmyQSaHmFrrrGvXvbFAa/yw5/mZhaFicFNCK5msEdNEneK4V1br7TUpXOkzBQzbNSKBTMJY
	0W0HHAjhbXMDmocF+/KleJmz/Ot4CNjluoHBHTs5xYqZl5/g+1SQDr089cLAGAGRIzGmMvba9lUdQ
	e1vyOKVA9IvTPXg1Wwt05OdGdF9erABAgahWzUfbpk7+njAGhyzf6sZmWBjjqAM6p4fQ+aYfP6bz0
	kC/87Syw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJeXW-000t1V-29;
	Wed, 12 Jul 2023 18:26:14 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJeXT-000t0g-2i
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jul 2023 18:26:13 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1b8b4749013so53832985ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 12 Jul 2023 11:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689186370; x=1691778370;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=swX/Btqe9SwlapTlO/DIwSPMFx8s3wfg5niuyYAHqCU=;
        b=t+rGeMqK4FQu3U7IWvo5hWBuuEiCmmtx6poL/uG/sChia7xNUk3OjXe/eY0quvdn3z
         J123/5f5oYO/dxIPHh21icK7IG4SZCsW7TDCaFEh6ePd5h+7zV6VrHLvNvZ6HjgB0Rfk
         pHOSJxec/EaLIYDDUUx2eomAS7CkrSFMGdSkIaQ/NARpCUrZ3kyuLxWk8C4gSvBGzf5e
         jdQbwdsup+JK10w1xzMP8CDroJIDpy439nDIwXhUfaTYVLJE2wO4xW8/mjUDID4cmm4+
         gSpw7xE+Mm/fQD0dLPdLrV1xLGdywWVEpYLaWqapHsrYVpGo2y6iBuQFoGOgRilvg6Q3
         WylQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689186370; x=1691778370;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=swX/Btqe9SwlapTlO/DIwSPMFx8s3wfg5niuyYAHqCU=;
        b=BMm9u8se/yIDiknsgGlCERXqcnWA86y/NlSAQZAVWkQ+RRG+i+VqpVP9w8qwPksK8a
         X+cTrq1KgUZ5vIu/FjcNHJrk32ikY34ViadPT0fPIEle3zI+pBMpWwKEdIu7n4YfQtRr
         Gy7eHPp0vUKQ66vn/m3GBROSuXv0l78IVObr7xFrfX90pIRzd63obCTQykBMkNrTHheA
         zhhA8VwAF2ugCMpA6Wft0orkZy1hymtD7/M2Z9r2lu2vtl56uv23HO7tsL1pEtYQgWm/
         6Xth6dAR3zd1QMKqARPyxjmWErGdSocqdOO25oK0DlMzdl0IApxBTfpTIRKE8p/Bn4dV
         AwUw==
X-Gm-Message-State: ABy/qLZo4Hwxg795qV2eyDzRuF9+yqyUC9yaKC7WLqwdVH8Y4kuUbpDQ
	h9Cbk5SRkjtleZHRu9oG8lUHhw==
X-Google-Smtp-Source: APBJJlHAxMXSUIbZXiuDm3AUa5MRO5PMewMy62zRT6aZ+RDrwQLncLwIngEG+ozHai+hqvZIUWsP4Q==
X-Received: by 2002:a17:902:ce81:b0:1b8:3e15:40e8 with SMTP id f1-20020a170902ce8100b001b83e1540e8mr5333784plg.56.1689186370368;
        Wed, 12 Jul 2023 11:26:10 -0700 (PDT)
Received: from localhost ([50.38.6.230])
        by smtp.gmail.com with ESMTPSA id q15-20020a170902b10f00b001b9da7ae98bsm4291752plr.122.2023.07.12.11.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 11:26:09 -0700 (PDT)
Date: Wed, 12 Jul 2023 11:26:09 -0700 (PDT)
X-Google-Original-Date: Wed, 12 Jul 2023 11:25:23 PDT (-0700)
Subject: Re: [PATCH V11 0/5] riscv: Optimize function trace
In-Reply-To: <87jzv5q9tv.fsf@all.your.base.are.belong.to.us>
CC: suagrfillet@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, rostedt@goodmis.org, mhiramat@kernel.org, Mark Rutland <mark.rutland@arm.com>,
  guoren@kernel.org, suagrfillet@gmail.com, Bjorn Topel <bjorn@rivosinc.com>, jszhang@kernel.org,
  Conor Dooley <conor.dooley@microchip.com>, pulehui@huawei.com, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, songshuaishuai@tinylab.org,
  bpf@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: bjorn@kernel.org
Message-ID: <mhng-a2c88f43-3cf7-4caa-8e4a-b0fc9d7e4628@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_112612_067042_25A24C85 
X-CRM114-Status: GOOD (  23.10  )
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

T24gV2VkLCAxMiBKdWwgMjAyMyAxMToxMTowOCBQRFQgKC0wNzAwKSwgYmpvcm5Aa2VybmVsLm9y
ZyB3cm90ZToKPiBTb25nIFNodWFpIDxzdWFncmZpbGxldEBnbWFpbC5jb20+IHdyaXRlczoKPgo+
IFsuLi5dCj4KPj4gQWRkIFdJVEhfRElSRUNUX0NBTExTIHN1cHBvcnQgWzNdIChwYXRjaCAzLCA0
KQo+PiA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4KPiBX
ZSd2ZSBoYWQgc29tZSBvZmZsaXN0IGRpc2N1c3Npb25zLCBzbyBoZXJlJ3Mgc29tZSBpbnB1dCBm
b3IgYSB3aWRlcgo+IGF1ZGllbmNlISBNb3N0IGltcG9ydGFudGx5LCB0aGlzIGlzIGZvciBQYWxt
ZXIsIHNvIHRoYXQgdGhpcyBzZXJpZXMgaXMKPiBub3QgbWVyZ2VkIHVudGlsIGEgcHJvcGVyIEJQ
RiB0cmFtcG9saW5lIGZpeCBpcyBpbiBwbGFjZS4KPgo+IE5vdGUgdGhhdCB3aGF0J3MgY3VycmVu
dGx5IHVzYWJsZSBmcm9tIEJQRiB0cmFtcG9saW5lICp3b3JrcyouIEl0J3MKPiB3aGVuIHRoaXMg
c2VyaWVzIGlzIGFkZGVkIHRoYXQgaXQgYnJlYWtzLgo+Cj4gVEw7RFIgVGhpcyBzZXJpZXMgYWRk
cyBEWU5BTUlDX0ZUUkFDRV9XSVRIX0RJUkVDVF9DQUxMUywgd2hpY2ggZW5hYmxlcwo+IGZlbnRy
eS9mZXhpdCBCUEYgdHJhbXBvbGluZSBzdXBwb3J0LiBVbmZvcnR1bmF0ZWx5IHRoZQo+IGZleGl0
L0JQRl9UUkFNUF9GX1NLSVBfRlJBTUUgcGFydHMgb2YgdGhlIFJWIEJQRiB0cmFtcG9saW5lIGJy
ZWFrcwo+IHdpdGggdGhpcyBhZGRpdGlvbiwgYW5kIG5lZWQgdG8gYmUgYWRkcmVzc2VkICpwcmlv
ciogbWVyZ2luZyB0aGlzCj4gc2VyaWVzLiBBbiBlYXN5IHdheSB0byByZXByb2R1Y2UsIGlzIGp1
c3QgY2FsbGluZyBhbnkgb2YgdGhlIGtzZWxmdGVzdAo+IHRlc3RzIHRoYXQgdXNlcyBmZXhpdCBw
YXRjaGluZy4KPgo+IFRoZSBpc3N1ZSBpcyBhcm91bmQgdGhlIG5vcCBzZWxkLCBhbmQgaG93IGEg
Y2FsbCBpcyBkb25lOyBUaGUgbm9wIHNsZWQKPiAocGF0Y2hhYmxlLWZ1bmN0aW9uLWVudHJ5KSBz
aXplIGNoYW5nZWQgZnJvbSAxNkIgdG8gOEIgaW4gY29tbWl0Cj4gNjcyNGE3NmNmZjg1ICgicmlz
Y3Y6IGZ0cmFjZTogUmVkdWNlIHRoZSBkZXRvdXIgY29kZSBzaXplIHRvIGhhbGYiKSwgYnV0Cj4g
QlBGIGNvZGUgc3RpbGwgdXNlcyB0aGUgb2xkIDE2Qi4gU28gaXQnbGwgd29yayBmb3IgQlBGIHBy
b2dyYW1zLCBidXQgbm90Cj4gZm9yIHJlZ3VsYXIga2VybmVsIGZ1bmN0aW9ucy4KPgo+IEFuIGV4
YW1wbGU6Cj4KPiAgIHwgZmZmZmZmZmY4MGZhNDE1MCA8YnBmX2ZlbnRyeV90ZXN0MT46Cj4gICB8
IGZmZmZmZmZmODBmYTQxNTA6ICAgICAgIDAwMDEgICAgICAgICAgICAgICAgICAgIG5vcAo+ICAg
fCBmZmZmZmZmZjgwZmE0MTUyOiAgICAgICAwMDAxICAgICAgICAgICAgICAgICAgICBub3AKPiAg
IHwgZmZmZmZmZmY4MGZhNDE1NDogICAgICAgMDAwMSAgICAgICAgICAgICAgICAgICAgbm9wCj4g
ICB8IGZmZmZmZmZmODBmYTQxNTY6ICAgICAgIDAwMDEgICAgICAgICAgICAgICAgICAgIG5vcAo+
ICAgfCBmZmZmZmZmZjgwZmE0MTU4OiAgICAgICAxMTQxICAgICAgICAgICAgICAgICAgICBhZGQg
ICAgIHNwLHNwLC0xNgo+ICAgfCBmZmZmZmZmZjgwZmE0MTVhOiAgICAgICBlNDIyICAgICAgICAg
ICAgICAgICAgICBzZCAgICAgIHMwLDgoc3ApCj4gICB8IGZmZmZmZmZmODBmYTQxNWM6ICAgICAg
IDA4MDAgICAgICAgICAgICAgICAgICAgIGFkZCAgICAgczAsc3AsMTYKPiAgIHwgZmZmZmZmZmY4
MGZhNDE1ZTogICAgICAgNjQyMiAgICAgICAgICAgICAgICAgICAgbGQgICAgICBzMCw4KHNwKQo+
ICAgfCBmZmZmZmZmZjgwZmE0MTYwOiAgICAgICAyNTA1ICAgICAgICAgICAgICAgICAgICBhZGR3
ICAgIGEwLGEwLDEKPiAgIHwgZmZmZmZmZmY4MGZhNDE2MjogICAgICAgMDE0MSAgICAgICAgICAg
ICAgICAgICAgYWRkICAgICBzcCxzcCwxNgo+ICAgfCBmZmZmZmZmZjgwZmE0MTY0OiAgICAgICA4
MDgyICAgICAgICAgICAgICAgICAgICByZXQKPgo+IGlzIHBhdGNoZWQgdG86Cj4KPiAgIHwgZmZm
ZmZmZmY4MGZhNDE1MDogIGY3MGMwMjk3ICAgICAgICAgICAgICAgICAgICAgYXVpcGMgICB0MCwt
MTUwMjA4NTEyCj4gICB8IGZmZmZmZmZmODBmYTQxNTQ6ICBlYjAyODJlNyAgICAgICAgICAgICAg
ICAgICAgIGphbHIgICAgdDAsdDAsLTMzNgo+Cj4gVGhlIHJldHVybiBhZGRyZXNzIHRvIGJwZl9m
ZW50cnlfdGVzdDEgaXMgc3RvcmVkIGluIHQwIGF0IEJQRgo+IHRyYW1wb2xpbmUgZW50cnkuIFJl
dHVybiB0byB0aGUgKnBhcmVudCogaXMgaW4gcmEuIFRoZSB0cmFtcGxpbmUgaGFzCj4gdG8gZGVh
bCB3aXRoIHRoaXMuCj4KPiBGb3IgQlBGX1RSQU1QX0ZfU0tJUF9GUkFNRS9DQUxMX09SSUcsIHRo
ZSBCUEYgdHJhbXBvbGluZSB3aWxsIHNraXAgdG9vCj4gbWFueSBieXRlcywgYW5kIG5vdCBjb3Jy
ZWN0bHkgaGFuZGxlIHBhcmVudCBjYWxscy4KPgo+IEZ1cnRoZXI7IFRoZSBCUEYgdHJhbXBvbGlu
ZSBjdXJyZW50bHkgaGFzIGEgZGlmZmVyZW50IHdheSBvZiBwYXRjaGluZwo+IHRoZSBub3BzIGZv
ciBCUEYgcHJvZ3JhbXMsIHRoYW4gd2hhdCBmdHJhY2UgZG9lcy4gVGhhdCBzaG91bGQgYmUgY2hh
bmdlZAo+IHRvIG1hdGNoIHdoYXQgZnRyYWNlIGRvZXMgKGF1aXBjL2phbHIgdDApLgo+Cj4gVG8g
c3VtbWFyaXplOgo+ICAqIEFsaWduIEJQRiBub3Agc2xlZCB3aXRoIHBhdGNoYWJsZS1mdW5jdGlv
bi1lbnRyeTogOEIuCj4gICogQWRhcHQgQlBGIHRyYW1wb2xpbmUgZm9yIDhCIG5vcCBzbGVkcy4K
PiAgKiBBZGFwdCBCUEYgdHJhbXBvbGluZSB0MCByZXR1cm4sIHJhIHBhcmVudCBzY2hlbWUuCgpU
aGFua3MgZm9yIGRpZ2dpbmcgaW50byB0aGlzIG9uZSwgSSBhZ3JlZSB3ZSBuZWVkIHRvIHNvcnQg
b3V0IHRoZSBCUEYgCmJyZWFrYWdlcyBiZWZvcmUgd2UgbWVyZ2UgdGhpcy4gIFNvdW5kcyBsaWtl
IHRoZXJlJ3MgYSByYWJiaXQgaG9sZSBoZXJlLCAKYnV0IGhvcGVmdWxseSB3ZSBjYW4gZ2V0IGl0
IHNvcnRlZCBvdXQuCgpJJ3ZlIGRyb3BwZWQgdGhpcyBmcm9tIHBhdGNod29yayBhbmQgc3VjaCwg
YXMgd2UnbGwgbmVlZCBhdCBsZWFzdCAKYW5vdGhlciBzcGluLgoKPiBDaGVlcnMsCj4gQmrDtnJu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
