Return-Path: <SRS0=1tpi=MK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26164C636CA
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Jul 2021 21:55:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5EF561073
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Jul 2021 21:55:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5EF561073
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vT96XdlyCbsLflJcywldLu5XkxzbWQnt0qO2H0id6ug=; b=FnyT5mStUqrL/q
	AH7c1sdVv+M5n2DZ3mvLCF1SMCXbmFMmiPju62gQB2hYc6FuYLbywj9FJ4ffd9cqCn6IzpNLYYbwT
	/5KEZoSeaREx/4BaHzUgr0YnHmHVMZSxM5+C7CxwMcJYZpD6AgncoAV2/NLF2SUrFdRyovGQIdwsO
	qzfUlxbiZo0fZKVUjplYmi9T0tSYhBgUGwjLqh680vaijCAyFXsnBbLqrhK0sv+DXKdmgBXZW/Yv+
	8GD6+8cau6jTP9MwawUWQBCTlDncHX0/+WhZXorpU0VmoLOry+W7QpRwEtV1UHuNuLQ7OnHe1rlJI
	U0uSeQDAvPKwL7agBKBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5Eko-00844B-Nj; Sun, 18 Jul 2021 21:55:18 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5Ekm-00843Z-Hg
 for linux-riscv@lists.infradead.org; Sun, 18 Jul 2021 21:55:18 +0000
Received: by mail-yb1-xb30.google.com with SMTP id i18so24540311yba.13
 for <linux-riscv@lists.infradead.org>; Sun, 18 Jul 2021 14:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=eveSL79fIO473idt3HKry68bIqrgOKyaUGuLZHQDq4o=;
 b=RxEURirprLtNAPe/SG7ygypPUBIGDbJu7ZxunILTdeP60VJXbkfph5slETy6nrYYwc
 +fuwO82JebWo9JpXQQOmXl7AkSrLlNitbLzGssaL3mlet/7p2dhpIcEaeLJmbZ7tESyr
 Pon1huY9z5qV/MBjnUFMu6ee9S3x86JlqzqaN4njrSDGTYDEDvCuc5icrrQrtvXo9foG
 jYb5OsrMuk/KruD+jPYIHXXjB/+0X35nxDGBw+1ujqASLY0Q9p4L7wjtH55MqLGyxWMN
 8PC7hT4O2ujA/UZ7ccq9JO//Ayru1GuKACV1t14cttaOv0/dx6tZdWiJiSKEnLjvUS98
 RwYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eveSL79fIO473idt3HKry68bIqrgOKyaUGuLZHQDq4o=;
 b=quEm6vqIVH60TEeod1kPpC6pVmwLjJuMe3QYDiz/yzviYS7B1sjN6ufvTvuKs5Jg62
 MCdJN+YEr+XzzyzZCOZV7NLLfZ6qK4xF3ggAZE+YbydSJ241tXI6JhZ7AM8F519E0Ks5
 Npk+Lafb4E22CwmElmGpd7SgZjZBLuKp+gwOcluCL4HpFK5SQE7v/BumXFPsagOrGwUA
 i9cwmDFboE0dBv+/hLSe8ugy2o89CYqXew/FTrMLk1Q68p57pA60RyzfFN3NUH3x0b/l
 SU2SZ4Dc2EYYM814cIDMN/IwzlXNgTHEoGK+og8PlbaESGfJLrHdWY1UTZmmAuSMyw7t
 X5jA==
X-Gm-Message-State: AOAM531HW6VMWAwZNEhEK8kO7UY4pTkfCh0dqlPKT9E8V/rxWckHEuBm
 jXBFbbGAOKvZZS2hlubMsr8jid6fbHQQWW1m2iQ=
X-Google-Smtp-Source: ABdhPJwWdylJkAom1a6yZ2KBQ4hwAC+q4SyV8RNzxMWOraKtYQZ3UCzXBASX2sg1TbqC5eQUYPc1j70PXMLBGFjzZKc=
X-Received: by 2002:a25:b741:: with SMTP id e1mr28061396ybm.347.1626645315867; 
 Sun, 18 Jul 2021 14:55:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210718065039.15627-1-msuchanek@suse.de>
 <c621c6c6-ad2d-5ce0-3f8c-014daf7cad64@iogearbox.net>
 <20210718193655.GP24916@kitsune.suse.cz>
 <CAEf4Bza4Fd4vnJLHYKN_VE3=hcLSnxUN-YMN4iv=B5h+y+wCdg@mail.gmail.com>
In-Reply-To: <CAEf4Bza4Fd4vnJLHYKN_VE3=hcLSnxUN-YMN4iv=B5h+y+wCdg@mail.gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Sun, 18 Jul 2021 14:55:04 -0700
Message-ID: <CAEf4BzY_QYz6eQY9if5-xu8_pLb-b1sCrd3Q6VXWxCvJ9tFpMA@mail.gmail.com>
Subject: Re: [PATCH] libbpf: Remove from kernel tree.
To: =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>
Cc: Daniel Borkmann <daniel@iogearbox.net>, bpf <bpf@vger.kernel.org>, 
 Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <kafai@fb.com>, 
 Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, 
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
 Magnus Karlsson <magnus.karlsson@intel.com>,
 Jonathan Lemon <jonathan.lemon@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, "David S. Miller" <davem@davemloft.net>, 
 Jakub Kicinski <kuba@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>,
 open list <linux-kernel@vger.kernel.org>, 
 Networking <netdev@vger.kernel.org>, linux-riscv@lists.infradead.org, 
 clang-built-linux <clang-built-linux@googlegroups.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210718_145516_655475_CAA60CA6 
X-CRM114-Status: GOOD (  25.29  )
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

T24gU3VuLCBKdWwgMTgsIDIwMjEgYXQgMjo1NCBQTSBBbmRyaWkgTmFrcnlpa28KPGFuZHJpaS5u
YWtyeWlrb0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gU3VuLCBKdWwgMTgsIDIwMjEgYXQgMTI6
MzYgUE0gTWljaGFsIFN1Y2jDoW5layA8bXN1Y2hhbmVrQHN1c2UuZGU+IHdyb3RlOgo+ID4KPiA+
IE9uIFN1biwgSnVsIDE4LCAyMDIxIGF0IDA5OjA0OjE2UE0gKzAyMDAsIERhbmllbCBCb3JrbWFu
biB3cm90ZToKPiA+ID4gT24gNy8xOC8yMSA4OjUwIEFNLCBNaWNoYWwgU3VjaGFuZWsgd3JvdGU6
Cj4gPiA+ID4gbGliYnBmIHNoaXBwZWQgYnkgdGhlIGtlcm5lbCBpcyBvdXRkYXRlZCBhbmQgaGFz
IHByb2JsZW1zLiBSZW1vdmUgaXQuCj4gPiA+ID4KPiA+ID4gPiBDdXJyZW50IHZlcnNpb24gb2Yg
bGliYnBmIGlzIGF2YWlsYWJsZSBhdAo+ID4gPiA+Cj4gPiA+ID4gaHR0cHM6Ly9naXRodWIuY29t
L2xpYmJwZi9saWJicGYKPgo+IFRoaXMgcGF0Y2ggbWFkZSBtZSBkYXkgOikgbGliYnBmIHNvdXJj
ZXMgaW4gdGhlIGtlcm5lbCB0cmVlIGlzICp0aGUKPiBzb3VyY2UqIG9mIGxpYmJwZi4gUXVvdGlu
ZyBEZXRhaWxzIHNlY3Rpb24gKFswXSkgb2YgbGliYnBmIFJFQURNRToKCiAgWzBdIGh0dHBzOi8v
Z2l0aHViLmNvbS9saWJicGYvbGliYnBmI2RldGFpbHMKCj4KPiAgIERldGFpbHMKPgo+ICAgVGhp
cyBpcyBhIG1pcnJvciBvZiBicGYtbmV4dCBMaW51eCBzb3VyY2UgdHJlZSdzIHRvb2xzL2xpYi9i
cGYKPiBkaXJlY3RvcnkgcGx1cyBpdHMgc3VwcG9ydGluZyBoZWFkZXIgZmlsZXMuCj4KPiAgIEFs
bCB0aGUgZ29yeSBkZXRhaWxzIG9mIHN5bmNpbmcgY2FuIGJlIGZvdW5kIGluIHNjcmlwdHMvc3lu
Yy1rZXJuZWwuc2ggc2NyaXB0Lgo+Cj4gICBTb21lIGhlYWRlciBmaWxlcyBpbiB0aGlzIHJlcG8g
KGluY2x1ZGUvbGludXgvKi5oKSBhcmUgcmVkdWNlZAo+IHZlcnNpb25zIG9mIHRoZWlyIGNvdW50
ZXJwYXJ0IGZpbGVzIGF0IGJwZi1uZXh0J3MKPiB0b29scy9pbmNsdWRlL2xpbnV4LyouaCB0byBt
YWtlIGNvbXBpbGF0aW9uIHN1Y2Nlc3NmdWwuCj4KPiA+ID4gPgo+ID4gPiA+IExpbms6IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2JwZi9iMDcwMTVlYmQ3YmJhZGIwNmE5NWE1MTA1ZDlmNmI0ZWQ1
ODE3YjJmLmNhbWVsQGRlYmlhbi5vcmcvCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogTWljaGFsIFN1
Y2hhbmVrIDxtc3VjaGFuZWtAc3VzZS5kZT4KPiA+ID4KPiA+ID4gTkFLLCBJJ20gbm90IGFwcGx5
aW5nIGFueSBvZiB0aGlzLiBJZiB0aGVyZSBhcmUgaXNzdWVzLCB0aGVuIGZpeCB0aGVtLiBJZgo+
ID4KPiA+IFRoZXkgYXJlIGZpeGVkIGluIHRoZSBnaXRodWIgdmVyc2lvbi4KPiA+Cj4gPiA+IHlv
dSB3b3VsZCBoYXZlIGNoZWNrZWQgdG9vbHMvbGliL2JwZi8gZ2l0IGhpc3RvcnksIHlvdSB3b3Vs
ZCBoYXZlIGZvdW5kCj4gPiA+IHRoYXQgbGliYnBmIGlzIHVuZGVyIGFjdGl2ZSBkZXZlbG9wbWVu
dCBpbiB0aGUgdXBzdHJlYW0ga2VybmVsIHRyZWUgYW5kCj4gPgo+ID4gU28gaXMgdGhlIGdpdGh1
YiB2ZXJzaW9uLgo+Cj4gU2VlIGFib3ZlLCBHaXRodWIgaXMgYSBwcm9qZWN0aW9uIG9mIHRoZSBr
ZXJuZWwgc291cmNlcy4gWWVzLCBNYWtlZmlsZQo+IGhlcmUgYW5kIG9uIEdpdGh1YiBhcmUgZGlm
ZmVyZW50LCBidXQgdGhhdCdzIGJ5IG5lY2Vzc2l0eS4gV2UgZG8gYXNrCj4gYWxsIGRpc3Ryb3Mg
dG8gcGFja2FnZSBsaWJicGYgZnJvbSB0aGUgR2l0aHViIHZlcnNpb24sIGJ1dCB0aGVyZSBhcmUK
PiBrZXJuZWwgcHJvamVjdHMgKGJwZnRvb2wsIHBlcmYsIHNlbGZ0ZXN0cykgdXNpbmcgbGliYnBm
IGZyb20gdGhlCj4ga2VybmVsIHNvdXJjZXMgdGhlbXNlbHZlcy4KPgo+ID4KPiA+ID4geW91IGNv
dWxkIGhhdmUgc3BhcmVkIHlvdXJzZWxmIHRoaXMgcGF0Y2guCj4gPgo+ID4gWW91IGNvdWxkIGhh
dmUgc3BhcmVkIG1lIGEgbG90IG9mIHByb2JsZW1zIGlmIHRoZXJlIHdhcyBvbmx5IG9uZSBzb3Vy
Y2UKPiA+IGZvciBsaWJicGYuCj4gPgo+ID4gQ2FuJ3QgeW91IEJQRiBwZW9wbGUgYWdyZWUgb24g
b25lIHBsYWNlIHRvIGRldmVsb3AgdGhlIGxpYnJhcnk/Cj4KPiBXZSBjYW4uIFdlIGRpZC4gV2Ug
ZXZlbiB3cm90ZSB0aGF0IGRvd24uIEFuZCB3ZSBkbyBkZXZlbG9wIGxpYmJwZiBpbgo+IG9uZSBw
bGFjZSwgaGVyZS4gR2l0aHViIHJlcG8gb25seSBhY2NlcHRzIFBScyBmb3IgR2l0aHViIE1ha2Vm
aWxlIGFuZAo+IHZhcmlvdXMgcGFydHMgb2YgQ0kgcHJvY2VzcyB3aGljaCBpcyBHaXRodWItc3Bl
Y2lmaWMuCj4KPiA+Cj4gPiBUaGFua3MKPiA+Cj4gPiBNaWNoYWwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
