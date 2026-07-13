Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43050C44501
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 06:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k+FP3vSbJL8h+dfla7UV7AXeZ4YRX31z84PfGjOw9mA=; b=ZZVKET4AwPosai
	KTn0rALQg8hDb/JYmurC5/cPw3dejNTdoRFqJC4ZY/SbuuWBKy+YLWh1vo5YhA6oZ5sEgQECFdXXT
	2UY/PptTMril/A5FDIOMkssuC1Mc6ONz5u1XKVUOoSZg+vHQmonLY8GZQSrsozqkksvbedEKIoycY
	k2LOM2B8pIXfDPXGLGSo32zy9o5dfmR3dm4pDedINu2AiHQL27X/6xyZt8IMqbEhG8PG6NYr94aI+
	g/HmoUjl0KnF0PwnsMnL3ItBJ6/EyeiwyPHHYPhxN+XEqzw253a5BTUNKhv04VslYsvj7CaFbVWuH
	XnS00EelronWK3zTYFjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjAAy-00000008EaC-0UrD;
	Mon, 13 Jul 2026 06:30:00 +0000
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjAAv-00000008EZh-36CS
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jul 2026 06:29:59 +0000
Received: by mail-vk1-xa34.google.com with SMTP id 71dfb90a1353d-5bf9466412fso2218859e0c.1
        for <linux-riscv@lists.infradead.org>; Sun, 12 Jul 2026 23:29:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783924193; cv=none;
        d=google.com; s=arc-20260327;
        b=qhe8CzOzYkm9GUzndicIS3GadkqMArpJyKbnIHiBI0ZoI2pnFZ8rvDHFqV2LjdPSTY
         3on96eRuMhoAV/w8AiFgP0enpx/no+c2aYq/Yfl/5/A4ILk1rRv1fGSn2prW+IjCpXmw
         vKqfpfIhUWVLh74JOtR/CnhxYEGsRwWH9h1TxovZPXxcIZegsqzN9JKndzqmzqufEIEv
         dGaOQheGyyQo8Pyje9gfpwDt3s4w+WOkGXcsUTPpr9iJdY3Ipk3FkHbTJ32DBEDGkwrv
         dIDeoKExzckG+iTJuNxX9e7N6lO70ySLUnOR4FN4akAHBT2Kvi7B2adIFkDy8ZwKJMJs
         NPiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U9cnJXJYJorYGJ6MyAFLa4vvfRiJiLcoacpuGhjfrRk=;
        fh=HDsAqv7eNRrTvNnHrGoEK8OuI4ba+zwvEUozfE9HfCU=;
        b=qA3Z+7fQOvZKTXc8DslB/BZh+J6hiv8yfzoNAz3sS9Jw3xoUTb4L7dobcg/M7JuLLl
         KoTpb5grLSH3V70/IyBvOFdPhkmMSqTdwHQJfAf+qLwLzZXdT/FPOMzYP4sXdqaR1xWs
         sNFzp0e9jOGonY1EIYLtnpHfcjWFsDbINMqHbQi8GR1MDOc6Z6lfank25Kabx/ypgz8x
         btzPCAA0FAErk9WqihrPE236bHaEIalXYWbVYFUq+kfUA26iy68INdL+yZSuSINbUN84
         pnPmV/UybD5yuh/paXCRir/aqQi8ZUSBKWhGh7KhpffhfSYbL9CtwJzBpp6X00+9RBDH
         kQ8A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1783924193; x=1784528993; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U9cnJXJYJorYGJ6MyAFLa4vvfRiJiLcoacpuGhjfrRk=;
        b=O1DdFJjvfCFWbY7rA8cA0kRSBn4alB3QZB3xMW9zm1BoeN80CjUvfirmBs2uNIXci+
         pST2brysLi9rs8byOJoM5GWRfBkwkqikEVsiZ4xz7wXkMM4sqAJxfzZBvSJTg5Ba49cq
         o9SpGI0mZgHlz9vUobPyVZ19C8DEBcN+TqsmpDt+DxDs9IXpaFCdnT65+0y8lZClk+OG
         0CFt5I437ndo5dCP+1orJKJI5TSPLhHM1yhDK26lUijJoPBdxJcZsTKj56Ej9tN2sA49
         XIiGkUsE/PabQ76BpLBm++ImACQItYZc2cfz1GSrW7nTv6q1lqsqzmqgqBhMV24I/ovK
         q4iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783924193; x=1784528993;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U9cnJXJYJorYGJ6MyAFLa4vvfRiJiLcoacpuGhjfrRk=;
        b=lxLG7BvGNLV2Dv/jzs146UCtYE6wF74yVMuUvNXeazzp9CTVCfmIK2Q7nTx8RX/be8
         leme2Foh5xTDQsSZpE3AmtE8s0YHN+aL+dEe81G+lANvWp5tvLuu2THadQwI0Op0C+S8
         bVr1egXoaROhVDdVCwPTSwtj3GZpeul9dnrNqNbRZnCuEjE2wAyCoNcp1HlbNTUUMqDh
         yCFqOEYwqIXwMjmbXAzFBg8QrLOZcOOHANnQZo1kYYWak7HmI0yCyxAXSmyGP5BHzGSM
         8muhQQC3V0Q64v69C7Rbfy6Z+tKPCAiQ3E+Nit/fsL5aOj7QKrVbLUT+SAOorOhZ2S4a
         OhQg==
X-Forwarded-Encrypted: i=1; AHgh+Rrr/VbJajqdISoiEaiNi7gniYzKBHUyWQNSuY9j85uyn/pbgvbVG1bhqz8sd5w8nOTgGZdHUFtJuNPnYA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxMdzA67boBqXRajn4ujRlHdojw8+uZDLM6V4AQbSXY/XLBV0CV
	dkv9ZPQep2SgQCFXii5p+7IO6Rc75IpU0MbnIxgdXJZnL8n9ot0+gaCGkpYYi694r+MMdRyM91Z
	AsRqNjxHgpHoxphkE/r0TYKSRogWGRKCbzthfgPuZog==
X-Gm-Gg: AfdE7cmNOxq/CjhEWcszkNxT8ryepW7PB4prrrD7Wy0oNBYRUEHasWsURzTxR//iMyp
	0wjRiFzArITyPqTdIYoxyUFczur/N2Q4gqc5MuWkI2SvsBkScUert2L6gV3uDUuyNzrpojdZ9dj
	BEPf7zbk2iC2PBT+dIm30lBCvKw+n+U4ZeTvWx3xq/PE23LMdjoirOljgAiMiKH84sGN5YzIdJ9
	LpmZ9fvQzAvjX97kD01ChYVRVkXmad7/7JmcjPlDktFTfH/LcCq0mC2ERLhwttQkrcrlMVcosC1
	8WvQNWvNK6FuRt1KOWDF
X-Received: by 2002:a05:6122:1d0b:b0:5bf:66a8:6253 with SMTP id
 71dfb90a1353d-5bfbf0a89c8mr4977103e0c.1.1783924193265; Sun, 12 Jul 2026
 23:29:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250901114141.5438-1-luxu.kernel@bytedance.com>
 <20250901114141.5438-2-luxu.kernel@bytedance.com> <dcd61aba-8622-b14d-6466-44a7f0dc0615@kernel.org>
In-Reply-To: <dcd61aba-8622-b14d-6466-44a7f0dc0615@kernel.org>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Mon, 13 Jul 2026 14:29:42 +0800
X-Gm-Features: AUfX_mzEgtA8pER8NSkzCAf73X_6_sK7HjkcUn_odoOFEAjK7yNYQPOOQAGUL5o
Message-ID: <CAPYmKFt3t0C0R4iVea=MRf0zu4F9gkkanPsepqC+XEJLAT8ecQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH RESEND 1/2] riscv: mm: Apply svinval in update_mmu_cache()
To: Paul Walmsley <pjw@kernel.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	apw@canonical.com, joe@perches.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_232957_797216_5A71CA0D 
X-CRM114-Status: GOOD (  24.44  )
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

SGkgUGF1bCwKClllcywgaXQgbWFrZXMgbW9yZSBzZW5zZS4gR28gYWhlYWQgcGxlYXNlLgoKQmVz
dCByZWdhcmRzLgpYdSBMdQoKT24gU2F0LCBKdWwgMTEsIDIwMjYgYXQgODowNOKAr0FNIFBhdWwg
V2FsbXNsZXkgPHBqd0BrZXJuZWwub3JnPiB3cm90ZToKPgo+IEhpLAo+Cj4gT24gTW9uLCAxIFNl
cCAyMDI1LCBYdSBMdSB3cm90ZToKPgo+ID4gT25seSBmbHVzaCB0bGIgb2YgdGhlIHNwZWNpZmll
ZCBtbSwgYW5kIGFwcGx5IHN2aW52YWwgaWYgYXZhaWxhYmxlLgo+ID4KPiA+IFNpZ25lZC1vZmYt
Ynk6IFh1IEx1IDxsdXh1Lmtlcm5lbEBieXRlZGFuY2UuY29tPgo+Cj4gSSB3b3VuZCB1cCBzcGxp
dHRpbmcgdGhpcyBpbnRvIHR3byBzZXBhcmF0ZSBwYXRjaGVzLCByYXRoZXIgdGhhbiBvbmUKPiBw
YXRjaCwgc2luY2UgdGhlcmUgc2VlbSB0byBiZSB0d28gb3J0aG9nb25hbCBjaGFuZ2VzLiAgVGhl
IGZpcnN0IGNoYW5nZQo+IHJlc3RyaWN0cyB0aGUgc2ZlbmNlLnZtYSB0byBhIHBhcnRpY3VsYXIg
QVNJRCAoYmVsb3cpLiAgVGhlIHNlY29uZCBjaGFuZ2UKPiBpbnZvbHZlcyB0aGUgU3ZpbnZhbCBw
YXRoLCBhbmQgaXMgc2VudCBpbiBhIHN1YnNlcXVlbnQgbWVzc2FnZS4KPiBXaGF0IGRvIHlvdSB0
aGluaz8KPgo+Cj4gLSBQYXVsCj4KPgo+IEZyb206IFh1IEx1IDxsdXh1Lmtlcm5lbEBieXRlZGFu
Y2UuY29tPgo+IERhdGU6IE1vbiwgMSBTZXAgMjAyNSAxOTo0MTo0MCArMDgwMAo+IFN1YmplY3Q6
IFtQQVRDSCAxLzJdIHJpc2N2OiBtbTogZmx1c2ggVExCIGJ5IEFTSUQgaW4gdXBkYXRlX21tdV9j
YWNoZV9yYW5nZSgpCj4KPiBPbmx5IGZsdXNoIHRoZSBUTEIgb2YgdGhlIHNwZWNpZmllZCBtbSAo
dmlhIGxvY2FsX2ZsdXNoX3RsYl9wYWdlX2FzaWQpCj4KPiBTaWduZWQtb2ZmLWJ5OiBYdSBMdSA8
bHV4dS5rZXJuZWxAYnl0ZWRhbmNlLmNvbT4KPiBMaW5rOiBodHRwczovL3BhdGNoLm1zZ2lkLmxp
bmsvMjAyNTA5MDExMTQxNDEuNTQzOC0yLWx1eHUua2VybmVsQGJ5dGVkYW5jZS5jb20KPiBbcGp3
QGtlcm5lbC5vcmc6IHNwbGl0IHRoZSBub24tU3ZpbnZhbCBjb2RlIGluIHRoZSBvcmlnaW5hbCBp
bnRvIHRoaXMgcGF0Y2g7IHVwZGF0ZSBkZXNjcmlwdGlvbl0KPiBTaWduZWQtb2ZmLWJ5OiBQYXVs
IFdhbG1zbGV5IDxwandAa2VybmVsLm9yZz4KPiAtLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9wZ3RhYmxlLmggIHwgNyArKysrKy0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGxiZmx1
c2guaCB8IDUgKysrKysKPiAgYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jICAgICAgICAgIHwgNSAt
LS0tLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0p
Cj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggYi9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaAo+IGluZGV4IDVkNTc1NmJkYTgyZS4uNzU1NDk1
YTU0MmNjIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4g
KysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKPiBAQCAtNTY4LDYgKzU2OCw4
IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCB1cGRhdGVfbW11X2NhY2hlX3JhbmdlKHN0cnVjdCB2bV9m
YXVsdCAqdm1mLAo+ICAgICAgICAgICAgICAgICBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwg
dW5zaWduZWQgbG9uZyBhZGRyZXNzLAo+ICAgICAgICAgICAgICAgICBwdGVfdCAqcHRlcCwgdW5z
aWduZWQgaW50IG5yKQo+ICB7Cj4gKyAgICAgICB1bnNpZ25lZCBsb25nIGFzaWQ7Cj4gKwo+ICAg
ICAgICAgLyoKPiAgICAgICAgICAqIFN2dnB0YyBndWFyYW50ZWVzIHRoYXQgdGhlIG5ldyB2YWxp
ZCBwdGUgd2lsbCBiZSB2aXNpYmxlIHdpdGhpbgo+ICAgICAgICAgICogYSBib3VuZGVkIHRpbWVm
cmFtZSwgc28gd2hlbiB0aGUgdWFyY2ggZG9lcyBub3QgY2FjaGUgaW52YWxpZAo+IEBAIC01ODMs
MTAgKzU4NSwxMSBAQCBzdGF0aWMgaW5saW5lIHZvaWQgdXBkYXRlX21tdV9jYWNoZV9yYW5nZShz
dHJ1Y3Qgdm1fZmF1bHQgKnZtZiwKPiAgICAgICAgICAqIFJlbHlpbmcgb24gZmx1c2hfdGxiX2Zp
eF9zcHVyaW91c19mYXVsdCB3b3VsZCBzdWZmaWNlLCBidXQKPiAgICAgICAgICAqIHRoZSBleHRy
YSB0cmFwcyByZWR1Y2UgcGVyZm9ybWFuY2UuICBTbywgZWFnZXJseSBTRkVOQ0UuVk1BLgo+ICAg
ICAgICAgICovCj4gKyAgICAgICBhc2lkID0gZ2V0X21tX2FzaWQodm1hLT52bV9tbSk7Cj4gICAg
ICAgICB3aGlsZSAobnItLSkKPiAtICAgICAgICAgICAgICAgbG9jYWxfZmx1c2hfdGxiX3BhZ2Uo
YWRkcmVzcyArIG5yICogUEFHRV9TSVpFKTsKPiAtCj4gKyAgICAgICAgICAgICAgIGxvY2FsX2Zs
dXNoX3RsYl9wYWdlX2FzaWQoYWRkcmVzcyArIG5yICogUEFHRV9TSVpFLCBhc2lkKTsKPiAgfQo+
ICsKPiAgI2RlZmluZSB1cGRhdGVfbW11X2NhY2hlKHZtYSwgYWRkciwgcHRlcCkgXAo+ICAgICAg
ICAgdXBkYXRlX21tdV9jYWNoZV9yYW5nZShOVUxMLCB2bWEsIGFkZHIsIHB0ZXAsIDEpCj4KPiBk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90bGJmbHVzaC5oIGIvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS90bGJmbHVzaC5oCj4gaW5kZXggZWVkMGFiYzQwNTE0Li43YzJjZDVjYzky
ZDMgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90bGJmbHVzaC5oCj4gKysr
IGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90bGJmbHVzaC5oCj4gQEAgLTE1LDYgKzE1LDExIEBA
Cj4gICNkZWZpbmUgRkxVU0hfVExCX05PX0FTSUQgICAgICAgKCh1bnNpZ25lZCBsb25nKS0xKQo+
Cj4gICNpZmRlZiBDT05GSUdfTU1VCj4gK3N0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZyBnZXRf
bW1fYXNpZChzdHJ1Y3QgbW1fc3RydWN0ICptbSkKPiArewo+ICsgICAgICAgcmV0dXJuIG1tID8g
Y250eDJhc2lkKGF0b21pY19sb25nX3JlYWQoJm1tLT5jb250ZXh0LmlkKSkgOiBGTFVTSF9UTEJf
Tk9fQVNJRDsKPiArfQo+ICsKPiAgc3RhdGljIGlubGluZSB2b2lkIGxvY2FsX2ZsdXNoX3RsYl9h
bGwodm9pZCkKPiAgewo+ICAgICAgICAgX19hc21fXyBfX3ZvbGF0aWxlX18gKCJzZmVuY2Uudm1h
IiA6IDogOiAibWVtb3J5Iik7Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbW0vdGxiZmx1c2gu
YyBiL2FyY2gvcmlzY3YvbW0vdGxiZmx1c2guYwo+IGluZGV4IDg0MDQ1MzBlYzAwZi4uNzNjMjI2
ZjcxOWM3IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvbW0vdGxiZmx1c2guYwo+ICsrKyBiL2Fy
Y2gvcmlzY3YvbW0vdGxiZmx1c2guYwo+IEBAIC0xMTAsMTEgKzExMCw2IEBAIHN0YXRpYyB2b2lk
IF9faXBpX2ZsdXNoX3RsYl9yYW5nZV9hc2lkKHZvaWQgKmluZm8pCj4gICAgICAgICBsb2NhbF9m
bHVzaF90bGJfcmFuZ2VfYXNpZChkLT5zdGFydCwgZC0+c2l6ZSwgZC0+c3RyaWRlLCBkLT5hc2lk
KTsKPiAgfQo+Cj4gLXN0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZyBnZXRfbW1fYXNpZChzdHJ1
Y3QgbW1fc3RydWN0ICptbSkKPiAtewo+IC0gICAgICAgcmV0dXJuIG1tID8gY250eDJhc2lkKGF0
b21pY19sb25nX3JlYWQoJm1tLT5jb250ZXh0LmlkKSkgOiBGTFVTSF9UTEJfTk9fQVNJRDsKPiAt
fQo+IC0KPiAgc3RhdGljIHZvaWQgX19mbHVzaF90bGJfcmFuZ2Uoc3RydWN0IG1tX3N0cnVjdCAq
bW0sCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGNwdW1hc2sg
KmNtYXNrLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgc3Rh
cnQsIHVuc2lnbmVkIGxvbmcgc2l6ZSwKPiAtLQo+IDIuNTMuMAo+Cj4KPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
