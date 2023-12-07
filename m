Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD37C4167B
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Dec 2023 09:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x8fmrvXfUY+hVFqxmJWhUcih/CVsrE/sh8Z/yNvk68Y=; b=xMBYPd6cYMr05F
	T6aVVE29KV9AOpGF0PboBIM+nHdzQE7UdXDU++Mv9juDO9RX9UuSDuIqOPlfsED6Py/trKwjwkHuj
	turOjC/wqjY+m3wLrY3M6pDrTvvCtFuFORQ2VkFcHByF76dokZf1L/oZBITae/oYY8KyCYOScBlG8
	cx+Y1UcY82jOQcQYSlnEgDIG8uY2Rtp9I0RjpznqYHgxDPo8TOcZbiOao7bmR+0lXdiBgxWqeH11x
	5GnJSFQuzoZCxEI3lOWrSMrufxew4/FB373vZhSaptgvuGIS45qfEb7A7jgUaaFeaQ9wyiuIzKe1P
	2X27u8NW1lZpkue2X5sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBAOE-00CJ3l-1E;
	Thu, 07 Dec 2023 09:09:50 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBAOB-00CJ36-0M
	for linux-riscv@lists.infradead.org;
	Thu, 07 Dec 2023 09:09:48 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-286e676ffa0so645560a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 07 Dec 2023 01:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1701940185; x=1702544985; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2c4C3n0LRxWIX1WwXTdUDTm3hHPBj3ay99ram+tbJ5c=;
        b=F/c1cHw3KXptgigKWW3TMjg7hRd725+cQkcEnDdoIvq68KuoRsnMhTeTSTQNJ5DHuu
         MAd0EGy5Ml1gAxpLHkyVF/dkeqsw7yQlXXKF1JX979FvsR5GadDdQzgPYX3ObaYGhGn4
         +YNigSN3JzBrtjMc1f6STmfBMptJoXK+xKVbkrIy/xqbC8z4D3bmHZJE5TodnRvLyMAw
         jhr4NJq/ZIn4jQYCOJmfVTf3SCv/ny8UxqqTgVs5tMG0S619121w5bGxURTUQIwtdCW0
         grXZD+WmvjvpAQ9r575I4MpqDzhmDzDK1msAKZjM7uWRtYNRif9y8WRfsNvpytV0lzmL
         ucXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701940185; x=1702544985;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2c4C3n0LRxWIX1WwXTdUDTm3hHPBj3ay99ram+tbJ5c=;
        b=hmXTLvugzE7rTN6GKFxRvUksKcG4LoUmgsXAn16ebMOy0Ns3wY7vXJQJbXziTvAeOk
         vENtwhkKb6BZxOY5i8RSKKS33u4RjWZgaYNEmp0Up4dX7P0tvKayZRS+NcJqIZ+dvFJV
         nVhGb5PhICxN3vABdX/O+XTevAFO4R590aW3crba9YAZRffMM3bvghBh6hSTdr3noeS+
         Nd9B9iDRmVq7zA8CVl49TEQkZlvs4gZg62upOQlSWZLHcPG6HPi5dAh3LTE+u2YoFf6v
         N8vsHsvWsZYH+Kx9I6FIffh5uYx6S0K2pxA4YMV9RE1QHVD5ItZiEFUieL16ZKSqoynQ
         ACJw==
X-Gm-Message-State: AOJu0Yw1fM7TP2sQWoAZ/GzfPx9qOXeJwJ/yvcCNOQXHpzUDbNF3XdvE
	k60XSBmQpYG5BzBEbRuJV27uW8GRXcp/m5Rekhztjg==
X-Google-Smtp-Source: AGHT+IFK+U+J/GEdq+NYipG+hOrQ/lKIqZ6/I+wyo90SHNVrwK9YL7khjtC+G9Lw2tXREXPfZ0XbM9s5dby1KfOqA4U=
X-Received: by 2002:a17:90b:3509:b0:286:9231:c5c1 with SMTP id
 ls9-20020a17090b350900b002869231c5c1mr1903943pjb.7.1701940185105; Thu, 07 Dec
 2023 01:09:45 -0800 (PST)
MIME-Version: 1.0
References: <20231026143122.279437-1-cleger@rivosinc.com>
In-Reply-To: <20231026143122.279437-1-cleger@rivosinc.com>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Thu, 7 Dec 2023 17:09:33 +0800
Message-ID: <CAPYmKFsFLQnhXRPXpcoNfO-kEyjYLXD2Hm-F-O=Yxe1WJoSL9w@mail.gmail.com>
Subject: Re: [External] [RFC PATCH 0/3] riscv: add support for SBI Supervisor
 Software Events
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atishp@atishpatra.org>, 
	Anup Patel <apatel@ventanamicro.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Himanshu Chauhan <hchauhan@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_010947_154571_7AE24A7C 
X-CRM114-Status: GOOD (  32.48  )
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

UGFyZG9uLiBJdCBzZWVtcyB0aGF0IHRoZSBjb2RlIGluIG9wZW5zYmlbMV0gaXMgbm90IGNvbXBs
ZXRlIGZvciBQTVUgTk1JIG5vdy4KRm9yIGV4YW1wbGUsIHRoZSBwbXUgb3ZmIGlycSBpcyBzdGls
bCBkZWxlZ2F0ZWQgdG8gc3VwZXJ2aXNvciBtb2RlIGFuZAp0aHVzIGNhbiBub3QgcmVhbGx5IHBs
YXkgYSByb2xlIGFzIE5NSS4gQW5kIG5laXRoZXIgdGhlIGtlcm5lbCBub3IKb3BlbnNiaSB3aWxs
IGluamVjdCBhIHBtdSBldmVudC4KClRvIGNvbXBsZXRlIHRoZSB3b3JrLCB3ZSB0aGluayBtYXli
ZSAnZW5hYmxlX2NiJyBhbmQgJ2Rpc2FibGVfY2InCmZ1bmN0aW9ucyBjYW4gYmUgc3VwcGxpZWQg
Zm9yIHNiaV9zc2VfY2Jfb3BzLgpXaGVuIHNiaV9zc2VfZW5hYmxlIGlzIGNhbGxlZCB0byBlbmFi
bGUgcG11IGV2ZW50LCB0aGUgZW5hYmxlX2NiIHdpbGwKYmUgY2FsbGVkIHRvIHJldm9rZSB0aGUg
ZGVsZWdhdGlvbiBvZiBwbXUgb3ZmIGlycSBhbmQgZW5hYmxlIHRoaXMgaXJxCmluIENTUl9NSUUu
CldoZW4gcG11IG92ZiBpcnEgb2NjdXJzLCBrZXJuZWwgdHJhcHMgaW50byBvcGVuc2JpIGFuZCBv
cGVuc2JpIGluamVjdHMKdGhlIGV2ZW50IHZpYSBzYmlfc3NlX2luamVjdF9ldmVudCBhbmQgZXJl
dCBiYWNrIHRvIGtlcm5lbC4KClBsZWFzZSBwb2ludCBpdCBvdXQgaWYgd2UgaGF2ZSBhbnkgbWlz
dW5kZXJzdGFuZGluZy4KCkJ5IHRoZSB3YXksIGhvdyBpcyBTU0UgZ29pbmcgbm93PyBXZSB3aWxs
IGFwcHJlY2lhdGUgaXQgdmVyeSBtdWNoIGlmCndlIGNhbiBwYXJ0aWNpcGF0ZSBpbiBzb21lIGRl
dmVsb3BtZW50IHdvcmsgaW4ga2VybmVsIG9yIG9wZW5zYmkgYW5kCmJlIG9mIGFueSBoZWxwLgoK
UmVnYXJkcyEKCkxpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS9yaXZvc2luYy9vcGVuc2JpL3RyZWUv
ZGV2L2NsZWdlci9zc2UgWzFdCgpPbiBUaHUsIE9jdCAyNiwgMjAyMyBhdCAxMDozMeKAr1BNIENs
w6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBUaGUgU0JJIFN1
cGVydmlzb3IgU29mdHdhcmUgRXZlbnRzIChTU0UpIGV4dGVuc2lvbnMgcHJvdmlkZXMgYSBtZWNo
YW5pc20KPiB0byBpbmplY3Qgc29mdHdhcmUgZXZlbnRzIGZyb20gYW4gU0JJIGltcGxlbWVudGF0
aW9uIHRvIHN1cGVydmlzb3IKPiBzb2Z0d2FyZSBzdWNoIHRoYXQgaXQgcHJlZW1wdHMgYWxsIG90
aGVyIHN1cGVydmlzb3IgbGV2ZWwgdHJhcHMgYW5kCj4gaW50ZXJydXB0cyBbMV0uCj4KPiBWYXJp
b3VzIGV2ZW50cyBhcmUgZGVmaW5lZCBhbmQgY2FuIGJlIHNlbmQgYXN5bmNocm9ub3VzbHkgdG8g
c3VwZXJ2aXNvcgo+IHNvZnR3YXJlIChSQVMsIFBNVSwgREVCVUcsIEFzeW5jaHJvbm91cyBwYWdl
IGZhdWx0KSBmcm9tIFNCSSBhcyB3ZWxsCj4gYXMgcGxhdGZvcm0gc3BlY2lmaWMgZXZlbnRzLiBF
dmVudHMgY2FuIGJlIGVpdGhlciBsb2NhbCAocGVyLWhhcnQpIG9yCj4gZ2xvYmFsLiBFdmVudHMg
Y2FuIGJlIG5lc3RlZCBvbiB0b3Agb2YgZWFjaCBvdGhlciBiYXNlZCBvbiBwcmlvcml0eSBhbmQK
PiBjYW4gaW50ZXJydXB0IHRoZSBrZXJuZWwgYXQgYW55IHRpbWUuCj4KPiBGaXJzdCBwYXRjaCBh
ZGRzIHRoZSBTU0UgZGVmaW5pdGlvbnMuIFNlY29uZCBvbmUgYWRkcyBzdXBwb3J0IGZvciBTU0UK
PiBpdHNlbGYuIEltcGxlbWVudGF0aW9uIGlzIHNwbGl0IGJldHdlZW4gYXJjaCBzcGVjaWZpYyBj
b2RlIGFuZCBnZW5lcmljCj4gcGFydCAoc2ltaWxhcmx5IHRvIHdoYXQgaXMgZG9uZSBmb3IgQVJN
IFNERUkpLiBGaW5hbGx5LCB0aGUgbGFzdCBwYXRjaAo+IGFkZCBzdXBwb3J0IGZybyBTU0UgZXZl
bnQgaW4gdGhlIFNCSSBQTVUgZHJpdmVyLiBJZiB0aGUgU1NFIGV2ZW50IGlzCj4gYXZhaWxhYmxl
IGZyb20gdGhlIFNCSSB0aGVuLCBpdCB3aWxsIGJlIHVzZWQgaW5zdGVhZCBvZiB0aGUgbm9ybWFs
Cj4gaW50ZXJydXB0Lgo+Cj4gQW1vbmdzdCB0aGUgc3BlY2lmaWMgcG9pbnRzIHRoYXQgbmVlZHMg
dG8gYmUgaGFuZGxlIGlzIHRoZSBpbnRlcnJ1cHRpb24KPiBhdCBhbnkgcG9pbnQgb2YgdGhlIGtl
cm5lbCBleGVjdXRpb24gYW5kIG1vcmUgc3BlY2lmaWNhbGx5IGR1cmluZwo+IGV4Y2VwdGlvbiBo
YW5kbGluZy4gRHVlIHRvIHRoZSBmYWN0IHRoYXQgdGhlIGV4Y2VwdGlvbiBlbnRyeQo+IGltcGxl
bWVudGF0aW9uIHVzZXMgdGhlIFNDUkFUQ0ggQ1NSIGFzIGJvdGggdGhlIGN1cnJlbnQgdGFzayBz
dHJ1Y3QgYW5kCj4gYXMgdGhlIHRlbXBvcmFyeSByZWdpc3RlciB0byBzd2l0Y2ggdGhlIHN0YWNr
IGFuZCBzYXZlIHJlZ2lzdGVyLCBpdCBpcwo+IGRpZmZpY3VsdCB0byByZWxpYWJseSBnZXQgdGhl
IGN1cnJlbnQgdGFzayBzdHJ1Y3QgaWYgd2UgZ2V0IGludGVycnVwdGVkCj4gYXQgdGhpcyBzcGVj
aWZpYyBtb21lbnQuIEEgZml4dXAtbGlrZSBtZWNoYW5pc20gYWxsb3dzIHRvIG1hcmsgdGhlCj4g
bG9jYXRpb24gb2YgdGhlIGN1cnJlbnQgdGFzayBzdHJ1Y3QgZGVwZW5kaW5nIG9uIHRoZSBlbnRy
eSBsZXZlbAo+ICh1c2VyL2tlcm5lbCkgYW5kIHRoZSBsb2NhdGlvbi4gVGhpcyBpcyB0aGVuIHVz
ZWQgaW4gdGhlIFNTRSBhc3NlbWJseSB0bwo+IGRldGVybWluZSB3aGVyZSBpcyBsb2NhdGVkIHRo
ZSBjdXJyZW50IHRhc2tfc3RydWN0Lgo+Cj4gQ29udHJhcnkgdG8gcHNldWRvIE5NSSBbMl0sIFNT
RSBkb2VzIG5vdCBtb2RpZmllcyB0aGUgd2F5IGludGVycnVwdHMgYXJlCj4gaGFuZGxlZCBhbmQg
ZG9lcyBub3QgYWRkcyBhbnkgb3ZlcmhlYWQgdG8gZXhpc3RpbmcgY29kZS4gTW9yZW92ZXIsIGl0
Cj4gcHJvdmlkZXMgInRydWUiIE5NSS1saWtlIGludGVycnVwdHMgd2hpY2ggY2FuIGludGVycnVw
dCB0aGUga2VybmVsIGF0Cj4gYW55IHRpbWUgKGV2ZW4gaW4gZXhjZXB0aW9uIGhhbmRsaW5nKS4g
VGhpcyBpcyBwYXJ0aWN1bGFybHkgY3J1Y2lhbCBmb3IKPiBSQVMgZXJyb3JzIHdoaWNoIG5lZWRz
IHRvIGJlIGhhbmRsZWQgYXMgZmFzdCBhcyBwb3NzaWJsZSB0byBhdm9pZCBhbnkKPiBmYXVsdCBw
cm9wYWdhdGlvbi4gQWRkaXRpb25hbGx5LCBTU0UgZXZlbnQgaGFuZGxpbmcgaXMgZmFzdGVyIHRo
YXQgdGhlCj4gc3RhbmRhcmQgSVJRIGhhbmRsaW5nIHBhdGggd2l0aCBhbG1vc3QgaGFsZiBleGVj
dXRlZCBpbnN0cnVjdGlvbiAoNzAwIHZzCj4gMTU5MCkuIFNvbWUgY29tcGxlbWVudGFyeSB0ZXN0
cy9wZXJmIG1lYXN1cmVtZW50cyB3aWxsIGJlIGRvbmUuCj4KPiBGb3IgdGVzdGluZyBwdXJwb3Nl
LCBvbmUgY2FuIHVzZSB0aGUgcHJvdmlkZWQgU0JJIGltcGxlbWVudGF0aW9uIGF0IFszXS4KPiBU
aGlzIHNlcmllcyBhbHNvIG5lZWRzIHBhdGNoIFs0XSB0byBmaXggYSBidWcgaW4gdGhlIFBNVSBk
cml2ZXIuCj4KPiBMaW5rOiBodHRwczovL2xpc3RzLnJpc2N2Lm9yZy9nL3RlY2gtcHJzL21lc3Nh
Z2UvNTE1IFsxXQo+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyMzEwMjMw
ODI5MTEuMjMyNDItMTAtbHV4dS5rZXJuZWxAYnl0ZWRhbmNlLmNvbS9ULyBbMl0KPiBMaW5rOiBo
dHRwczovL2dpdGh1Yi5jb20vcml2b3NpbmMvb3BlbnNiaS90cmVlL2Rldi9jbGVnZXIvc3NlIFsz
XQo+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWFybS1rZXJuZWwvMjAyMzEw
MjYwODQwMTAuMTE4ODgtMS1hbGV4Z2hpdGlAcml2b3NpbmMuY29tLyBbNF0KPgo+IC0tLQo+Cj4g
Q2zDqW1lbnQgTMOpZ2VyICgzKToKPiAgIHJpc2N2OiBhZGQgU0JJIFNTRSBleHRlbnNpb24gZGVm
aW5pdGlvbnMKPiAgIHJpc2N2OiBhZGQgc3VwcG9ydCBmb3IgU0JJIFN1cGVydmlzb3IgU29mdHdh
cmUgRXZlbnRzIGV4dGVuc2lvbgo+ICAgcGVyZjogUklTQy1WOiBhZGQgc3VwcG9ydCBmb3IgU1NF
IGV2ZW50Cj4KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hc20tcHJvdG90eXBlcy5oIHwgICA1
ICsKPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaCAgICAgICAgICAgIHwgIDQwICsrCj4g
IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vc3NlLmggICAgICAgICAgICB8ICA5NCArKysrKwo+ICBh
cmNoL3Jpc2N2L2tlcm5lbC9NYWtlZmlsZSAgICAgICAgICAgICAgfCAgIDEgKwo+ICBhcmNoL3Jp
c2N2L2tlcm5lbC9hc20tb2Zmc2V0cy5jICAgICAgICAgfCAgMTcgKwo+ICBhcmNoL3Jpc2N2L2tl
cm5lbC9lbnRyeS5TICAgICAgICAgICAgICAgfCAxNTYgKysrKysrKysKPiAgYXJjaC9yaXNjdi9r
ZXJuZWwvc2JpLmMgICAgICAgICAgICAgICAgIHwgICA0ICsKPiAgYXJjaC9yaXNjdi9rZXJuZWwv
c3NlLmMgICAgICAgICAgICAgICAgIHwgIDk3ICsrKysrCj4gIGFyY2gvcmlzY3Yva2VybmVsL3N0
YWNrdHJhY2UuYyAgICAgICAgICB8ICAxMyArCj4gIGFyY2gvcmlzY3Yva2VybmVsL3ZtbGludXgu
bGRzLlMgICAgICAgICB8ICAgNiArCj4gIGRyaXZlcnMvZmlybXdhcmUvS2NvbmZpZyAgICAgICAg
ICAgICAgICB8ICAxMCArCj4gIGRyaXZlcnMvZmlybXdhcmUvTWFrZWZpbGUgICAgICAgICAgICAg
ICB8ICAgMSArCj4gIGRyaXZlcnMvZmlybXdhcmUvcmlzY3Zfc3NlLmMgICAgICAgICAgICB8IDQ5
NiArKysrKysrKysrKysrKysrKysrKysrKysKPiAgZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmku
YyAgICAgICAgICAgIHwgIDUxICsrLQo+ICBpbmNsdWRlL2xpbnV4L3Jpc2N2X3NzZS5oICAgICAg
ICAgICAgICAgfCAgNTYgKysrCj4gIDE1IGZpbGVzIGNoYW5nZWQsIDEwMzggaW5zZXJ0aW9ucygr
KSwgOSBkZWxldGlvbnMoLSkKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vc3NlLmgKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3Yva2VybmVsL3NzZS5j
Cj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2Zpcm13YXJlL3Jpc2N2X3NzZS5jCj4gIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2xpbnV4L3Jpc2N2X3NzZS5oCj4KPiAtLQo+IDIuNDIu
MAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
