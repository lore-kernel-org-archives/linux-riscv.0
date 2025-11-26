Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B33C2D1037E
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Nov 2025 06:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wc5UfyvKbi2nO1gnGsVJ7Tc3lMPZxFXGZAlqkq7O4zY=; b=0fvxWwfUCvF0sx
	tWk0OwxPXMRBFzdhsMlrOQjORDVgACPKPMAahhVUDk0UnGxwi3TE6hiwe1CEnHeCTX0Z++fKoJVaM
	ZBtNo/DPukmPemL7yq5Dgy/m9OHk+twgQVdNq3i3bmVURuNPaHcSI2YBE3mrvoghz7TQRuaSZYunG
	p2X5x7kLywmCpCsBdcIVnm+APD5q3Mw20mqsbJzPhD1sf+3dqbqnF3lCojvjqDHZgj9nrbgMjIoMh
	l43aQuLR1iEotihYHdobRtRvgrqR17kBb2H08lgiLyYfksFtxQOQRoMgLHDagky1ph5zY8GJaSwQx
	l5u+rEymTAhxO8/1AFUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO9BA-0000000ERrG-0cku;
	Wed, 26 Nov 2025 06:39:04 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO9B7-0000000ERpv-09mx
	for linux-riscv@lists.infradead.org;
	Wed, 26 Nov 2025 06:39:02 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso61566525e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 25 Nov 2025 22:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1764139139; x=1764743939; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XeK0u2TVOvN4f/SN0xTGzbjonpqj44JziKIfWQXgIwk=;
        b=bBSvoXMDJnOeNn1AJpyc97c1H+oPAReWZECIBE08f3Odng9103vAm8d3cDcSNlbX8u
         SWpg0WvJDOdBrrqWEU1fYmzZWdqDiKRZxFqou48ZC5dIBIP85OP0qk7xcoJTzA5B/Srl
         YvrVfaFj2q+K2VwiPykLDQSxthCQ8GSTvoItROs5t9Nz/aW8CxxW1p8/43F2WeTq7NtX
         XooxJruOX5hg+n/M1a/w/lUxZbj1kMgtZRGi/0GhDZTD7/cFnWWsRbMMStEsOof2EUqu
         UjAxUTagojGUaZUpGDd0CqYtVBVYK0pChTbueofCWDfy/EWFb438k52TWNM8LCHrxNUJ
         VIIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764139139; x=1764743939;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XeK0u2TVOvN4f/SN0xTGzbjonpqj44JziKIfWQXgIwk=;
        b=Fzyh+hvhWs/hpqaFfPIu0MT8g5sgEmzsKGAmBn6XICWSFUBjc5WdUQLVQfypt9UVfh
         cG+NujlMR1U6X/CQEuxhnWODwhAMIhQ/XUiAk3CAj8Hoqwdm5SKoTLDYE8FeWb6sVh2N
         XW4PnszJ7ykb0i52YT1FbZ4bnA/l+GpsM7JY5TgDWsd2wdD/Qt9X6a6b/lwtAhxhfXjG
         F9T9neoyn/TgeHKQyaIUVl7YzE5jxq8DXiX2ziI7q3qp9yX14V8/el7IQNHtnRT6T507
         Le0pt+Xx3ImopdEswXGEX8eNDHdiqmV1/DCSxQ8fBwnC09g86a+qRhchFcV6atmnC3qg
         x+sg==
X-Gm-Message-State: AOJu0YytFFCDCXx0LuZH/DveR16hCdnlU19UsYPmpYJbVxsZpHzL1/Re
	yxKK1h8uE41+xMt7upWLGJHIQSngItomycwqjLElWIg0FF8TkZNtqzXWBM1eLQyzg1Y=
X-Gm-Gg: ASbGncuue1MYrQwCJ0NwTRn2yjx6gGfrpbgS89galzm6VsyLAPKqTyNgFTMS59NR28n
	OrKwa3yAIfAP2gY73z0IVtCwpMUAox3UnrngbfK2J9jsXUFu6i7Woknrp6jd2RrIl0FlMw0YegQ
	8Km6LXqzzy3qibl6Y36vo5ePaBl0axC4TIh9BeHjmI01z+Jrp9IUuhJkjE/8GhtMG+uReJxOAmX
	6R4QxHrI723wGc+n8FXtwHbmxk5pvLIqYNaYSSQEZBfXLnxjI++aQANfrI2KgwAFh879hXG9+6A
	Iof2RtNxAqWUl1XMLvJXt0S2ADgnJfd3/Y9L09ukZQV/XvNQ8WKT6xDE7zYv9yzEw/3tqEz7dFH
	51NJ1iIpME+t4C2EdRhbFYnN978eCTfY20Qpyou7/ptnouB3ftnM9Po6PQUOUoLbqCKpW0RFOcY
	ZV9gPBXUO+mlF4DRoLtON2h+cTixHBHAxx0Cw7HHaCe8Tqs0PT44LfiN94
X-Google-Smtp-Source: AGHT+IE1KjxiGrCtY3epm9hXR1ydSh+Ibj1PiTQ0E3rejshywrVXqvECFX43oDn0HerzmZQcrLtvoQ==
X-Received: by 2002:a05:600c:524d:b0:477:c71:1fc1 with SMTP id 5b1f17b1804b1-477c01d44b4mr169143895e9.19.1764139138720;
        Tue, 25 Nov 2025 22:38:58 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790addddf6sm25591685e9.8.2025.11.25.22.38.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 22:38:58 -0800 (PST)
Message-ID: <4b22e7c4-4d3d-43b9-bc27-ffd7a86ad26a@rivosinc.com>
Date: Wed, 26 Nov 2025 07:38:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/5] riscv: add support for SBI Supervisor Software
 Events
To: Paul Walmsley <pjw@kernel.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, hchauhan@ventanamicro.com,
 apatel@ventanamicro.com, luxu.kernel@bytedance.com, atishp@atishpatra.org,
 bjorn@rivosinc.com, cuiyunhui@bytedance.com,
 =?UTF-8?B?5byg5bGV6bmP?= <zhangzhanpeng.jasper@bytedance.com>
References: <20251105082639.342973-1-cleger@rivosinc.com>
 <176355541775.758643.18140349571928540394.git-patchwork-notify@kernel.org>
 <350edd01-56ce-6558-1473-4b9231647e1e@kernel.org>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <350edd01-56ce-6558-1473-4b9231647e1e@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_223901_254913_109BCB33 
X-CRM114-Status: GOOD (  17.17  )
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

CgpPbiAxMS8xOS8yNSAxNjo1MiwgUGF1bCBXYWxtc2xleSB3cm90ZToKPiAKPiBUbyBhZGQgbW9y
ZSBjb250ZXh0Ogo+IAo+IE9uIFdlZCwgMTkgTm92IDIwMjUsIHBhdGNod29yay1ib3QrbGludXgt
cmlzY3ZAa2VybmVsLm9yZyB3cm90ZToKPiAKPj4gVGhpcyBzZXJpZXMgd2FzIGFwcGxpZWQgdG8g
cmlzY3YvbGludXguZ2l0IChmb3ItbmV4dCkKPj4gYnkgUGF1bCBXYWxtc2xleSA8cGp3QGtlcm5l
bC5vcmc+Ogo+Pgo+PiBPbiBXZWQsICA1IE5vdiAyMDI1IDA4OjI2OjMyICswMDAwIHlvdSB3cm90
ZToKPj4+IFRoZSBTQkkgU3VwZXJ2aXNvciBTb2Z0d2FyZSBFdmVudHMgKFNTRSkgZXh0ZW5zaW9u
cyBwcm92aWRlcyBhIG1lY2hhbmlzbQo+Pj4gdG8gaW5qZWN0IHNvZnR3YXJlIGV2ZW50cyBmcm9t
IGFuIFNCSSBpbXBsZW1lbnRhdGlvbiB0byBzdXBlcnZpc29yCj4+PiBzb2Z0d2FyZSBzdWNoIHRo
YXQgaXQgcHJlZW1wdHMgYWxsIG90aGVyIHN1cGVydmlzb3IgbGV2ZWwgdHJhcHMgYW5kCj4+PiBp
bnRlcnJ1cHRzLiBUaGlzIGV4dGVuc2lvbiBpcyBpbnRyb2R1Y2VkIGJ5IHRoZSBTQkkgdjMuMCBz
cGVjaWZpY2F0aW9uWzFdLgo+Pj4KPj4+IFZhcmlvdXMgZXZlbnRzIGFyZSBkZWZpbmVkIGFuZCBj
YW4gYmUgc2VuZCBhc3luY2hyb25vdXNseSB0byBzdXBlcnZpc29yCj4+PiBzb2Z0d2FyZSAoUkFT
LCBQTVUsIERFQlVHLCBBc3luY2hyb25vdXMgcGFnZSBmYXVsdCkgZnJvbSBTQkkgYXMgd2VsbAo+
Pj4gYXMgcGxhdGZvcm0gc3BlY2lmaWMgZXZlbnRzLiBFdmVudHMgY2FuIGJlIGVpdGhlciBsb2Nh
bCAocGVyLWhhcnQpIG9yCj4+PiBnbG9iYWwuIEV2ZW50cyBjYW4gYmUgbmVzdGVkIG9uIHRvcCBv
ZiBlYWNoIG90aGVyIGJhc2VkIG9uIHByaW9yaXR5IGFuZAo+Pj4gY2FuIGludGVycnVwdCB0aGUg
a2VybmVsIGF0IGFueSB0aW1lLgo+Pj4KPj4+IFsuLi5dCj4+Cj4+IEhlcmUgaXMgdGhlIHN1bW1h
cnkgd2l0aCBsaW5rczoKPj4gICAtIFt2OCwxLzVdIHJpc2N2OiBhZGQgU0JJIFNTRSBleHRlbnNp
b24gZGVmaW5pdGlvbnMKPj4gICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcmlzY3YvYy83YmJh
MzgyNDliOGEKPj4gICAtIFt2OCwyLzVdIHJpc2N2OiBhZGQgc3VwcG9ydCBmb3IgU0JJIFN1cGVy
dmlzb3IgU29mdHdhcmUgRXZlbnRzIGV4dGVuc2lvbgo+PiAgICAgaHR0cHM6Ly9naXQua2VybmVs
Lm9yZy9yaXNjdi9jL2I1MjE3OWU2ZGU3ZAo+PiAgIC0gW3Y4LDMvNV0gZHJpdmVyczogZmlybXdh
cmU6IGFkZCByaXNjdiBTU0Ugc3VwcG9ydAo+PiAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9y
aXNjdi9jLzVmZmU2MGQyNjEwNwo+PiAgIC0gW3Y4LDQvNV0gcGVyZjogUklTQy1WOiBhZGQgc3Vw
cG9ydCBmb3IgU1NFIGV2ZW50Cj4+ICAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL3Jpc2N2L2Mv
YzZmM2YwNGQyYTljCj4+ICAgLSBbdjgsNS81XSBzZWxmdGVzdHMvcmlzY3Y6IGFkZCBTU0UgdGVz
dCBtb2R1bGUKPj4gICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcmlzY3YvYy9hMTIzMzE2NjYw
YWYKPiAKPiBUaGlzIGlzIGEgcHJldHR5IHNvcGhpc3RpY2F0ZWQgc2VyaWVzLiAgSSB3YXMgaG9w
aW5nIHRvIGdldCBtb3JlIHRlc3QgCj4gcmVwb3J0cyBvbiBpdCBhbmQgcmV2aWV3cyAoYXMgQ2zD
qW1lbnQgcmVxdWVzdGVkIGFzIHdlbGwpLiBJbiB0aGUgbWVhbnRpbWUgCj4gSSd2ZSBwdWxsZWQg
dGhlbSBpbnRvIGZvci1uZXh0IGluIHRoZSBob3BlcyB0aGF0IGl0IG1pZ2h0IGluY3JlYXNlIHRo
ZSAKPiBudW1iZXIgb2YgcG90ZW50aWFsIHRlc3RlcnMuICBBbSBzdGlsbCB2ZXJ5IG11Y2ggaW50
ZXJlc3RlZCBpbiBhbnkgdGVzdCAKPiByZXBvcnRzIG9yIGFkZGl0aW9uYWwgcmV2aWV3czsgaWYg
dGhleSBjb21lIGluIHRoaXMgd2VlaywgSSdsbCBjb25zaWRlciAKPiByZWJ1aWxkaW5nIGZvci1u
ZXh0IHRvIGFkZCB0aGVtLgoKSGV5IFBhdWwsCgpTaW5jZSB3ZSBnYXRoZXJlZCBhZGRpdGlvbmFs
IGJ1Zy9zdGFydmF0aW9uIHJlcG9ydHMgd2l0aCBTU0UgZnJvbQpaaGFucGVuZywgaXQgd291bGQg
YmUgcHJlZmVyYWJsZSB0byByZW1vdmUgdGhpcyBzZXJpZXMgZnJvbSB5b3VyIGJyYW5jaAppZiBz
dGlsbCBwb3NzaWJsZS4gSSdtIG5vdCBjdXJyZW50bHkgcmVhbGx5IGF2YWlsYWJsZSAoanVzdCBo
YWQgYQpuZXdib3JuKSBzbyBJIHdvbid0IGJlIGFibGUgdG8gZml4IHRoaXMgcXVpY2tseS4KClRo
YW5rcywKCkNsw6ltZW50CgoKPiAKPiAKPiAtIFBhdWwKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
