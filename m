Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8569EB64DC
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 06:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oNIZlvJ531Wy4rSDS9gnp+COLkSOjLlOVC0HXzOdXTI=; b=hi/Hk62RQDi28b
	nl1jnLK8fLZAEXlD0T+1VUhpxQZmjEcTQKUaq+8Nn073UHSgEEVtdwX1U4+JgBq90mvPj3QvOZxwQ
	l//QMK4+AI0L0RMXAi2oQTOCu4I6G6V+9SiEfP0F4Kw1QErhWWSE+0bTM0pYvcSpmgQe+uHYHMbZe
	Gf32BmGVRpJui5rDzK6vbRGKSBxtDvIrFfcxtpjP+E/k7j9V1DsZWZnXH4xQGvAekXQ6iXLoHeqKu
	RqAA21VFGowQ6Sg+q6QFWYTLfq0iVy4ydZn7Wx/bptOCSLbShgQAiyBHuvd2mEJl6CdnQITObWBBn
	TPSSL5XyuoxF5tP3Tx8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGCuq-009Re8-05;
	Mon, 03 Jul 2023 06:20:04 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGCum-009RcL-2r
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jul 2023 06:20:02 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3fbd33a573cso11945845e9.2
        for <linux-riscv@lists.infradead.org>; Sun, 02 Jul 2023 23:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1688365197; x=1690957197;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kIA8PGEOYws0vmVhO9ZbwpnpL5VKVZvMUon+9TyoBpI=;
        b=G28N59EBqbA1TV1NU1uC3s8kAkrfBErBxvNr2G/qFOJK2E54h05y0DRcJ3xxoCztG5
         Q4N40aSZk/g5pXFRQHkarqTf4DZs3X7wL2345oNsjJH8e53OJ5sF9P5cxapjmofvL/Nj
         f29CR6105WEeo2//RW2Wyl/EBUDrrHlyi595e6w8n4k3iJKtcaR3Uig2Hd6M0fmL2bu8
         g1wKa1TYVRHxyQK6y3Qg3wZ4U8ZVlgzWFXA2tziamptWb9hzjqWbmdRkp1+Fm4IbJEmC
         DzFIBJkfaQqpbGENW26FK3KbR1seicOuBAdwtZlcC6ArQjIvmaMnv61m73QIJDzv/ybA
         hRVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688365197; x=1690957197;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kIA8PGEOYws0vmVhO9ZbwpnpL5VKVZvMUon+9TyoBpI=;
        b=YS7XkH0BM9oitiysA5M8BjMlEUdJs71CpginHHpUUWIoX5uRMrWKHsczYcy2wHrF8e
         rN4QOia2pGv5WRANY+/WIpmdisTlJFP9bCFNv+I7eDqTyHb5hk0zT8nBxTWp54oxSlTO
         6vkHDB/Y7R3Fte926zVqOYx81EiniMphffoKbqu27gOlRqBVOWXKF2tQEH39DEwbpAZF
         3l8MqbKUTtvWCxKyH/MGXjG82znxceJMo8vl3ify4EaKh0nT5iAxgMPQuTN50Lu1dndz
         vg/wSfSlSQaqnghDCIOySvkY2GAiHmuLVla6fdr+FofnUBWDuf8XRVYBUfkaPDgGz46h
         RRnw==
X-Gm-Message-State: ABy/qLZcf8Q9LXQDaXr4fuSZTUqO68wAHKHqYXUx94DF2EGClv631eb0
	4KbUTX8ZYgTrN6NTKBeKFK3qjGWRRojfWy3zOnYdAjjngFbePX1DQKdC5A==
X-Google-Smtp-Source: APBJJlEGTc+phyaAeTPWFFONu5TUwojxZNGJBdfvyl86jwAZEp9blrmCMJKrpwCX7fYL9Do4AqX75KbcPMfQRU1K8RM=
X-Received: by 2002:adf:cc81:0:b0:314:d19:fc31 with SMTP id
 p1-20020adfcc81000000b003140d19fc31mr7536169wrj.51.1688365197436; Sun, 02 Jul
 2023 23:19:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230702095735.860-1-cuiyunhui@bytedance.com> <20230702-headway-dreamlike-d7ba39ac4910@spud>
 <ZKJM1fG3JXEBApfj@sunil-laptop>
In-Reply-To: <ZKJM1fG3JXEBApfj@sunil-laptop>
From: =?UTF-8?B?6L+Q6L6J5bSU?= <cuiyunhui@bytedance.com>
Date: Mon, 3 Jul 2023 14:19:46 +0800
Message-ID: <CAEEQ3wnsedWJYEEg8z+3C_HuCca0nD50NGpCdU3scxavrrOucA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v2 1/3] riscv: obtain ACPI RSDP from FFI.
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Conor Dooley <conor@kernel.org>, ardb@kernel.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, aou@eecs.berkeley.edu, 
	linux-riscv@lists.infradead.org, rminnich@gmail.com, mark.rutland@arm.com, 
	lpieralisi@kernel.org, rafael@kernel.org, lenb@kernel.org, jdelvare@suse.com, 
	yc.hung@mediatek.com, angelogioacchino.delregno@collabora.com, 
	allen-kh.cheng@mediatek.com, pierre-louis.bossart@linux.intel.com, 
	tinghan.shen@mediatek.com, linux-kernel@vger.kernel.org, 
	linux-acpi@vger.kernel.org, geshijian@bytedance.com, weidong.wd@bytedance.com, 
	alexghiti@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230702_232001_229991_F7A968B8 
X-CRM114-Status: GOOD (  22.63  )
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

SGkgU3VuaWwsCgpPbiBNb24sIEp1bCAzLCAyMDIzIGF0IDEyOjIy4oCvUE0gU3VuaWwgViBMIDxz
dW5pbHZsQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gSGkgWXVuaHVpIEN1aSwKPiBPbiBT
dW4sIEp1bCAwMiwgMjAyMyBhdCAwMjo0Nzo0MVBNICswMTAwLCBDb25vciBEb29sZXkgd3JvdGU6
Cj4gPiBIZXksCj4gPiAlc3ViamVjdDogcmlzY3Y6IG9idGFpbiBBQ1BJIFJTRFAgZnJvbSBGRkku
Cj4gPgo+ID4gVGhpcyBzdWJqZWN0IGlzIGEgYml0IHVuaGVscGZ1bCBiZWNhdXNlIEZGSSB3b3Vs
ZCBjb21tb25seSBtZWFuICJmb3JlaWduCj4gPiBmdW5jdGlvbiBpbnRlcmZhY2UiICYgeW91IGhh
dmUgbm90IHlldCBpbnRyb2R1Y2VkIGl0LiBJdCBzZWVtcyBsaWtlIGl0Cj4gPiB3b3VsZCBiZSBi
ZXR0ZXIgdG8gZG8gcy9GRkkvZGV2aWNldHJlZS8gb3Igc2ltaWxhci4KPiA+IFBsZWFzZSBhbHNv
IGRyb3AgdGhlIGZ1bGwgc3RvcCBmcm9tIHRoZSBjb21taXQgbWVzc2FnZXMgOykKPiA+Cj4gPiBQ
bGVhc2UgdXNlIGEgY292ZXIgbGV0dGVyIGZvciBtdWx0aS1wYXRjaCBzZXJpZXMgJiBpbmNsdWRl
IGNoYW5nZWxvZ3MuCj4gPgo+ID4gK0NDIFN1bmlsLCBBbGV4Ogo+ID4KPiA+IENhbiB5b3UgZ3V5
cyBwbGVhc2UgdGFrZSBhIGxvb2sgYXQgdGhpcyAmIHNlZSBpZiBpdCBpcyBzb21ldGhpbmcgdGhh
dCB3ZQo+ID4gd2FudCB0byBkbyAoQUNQSSB3aXRob3V0IEVGSSk/Cj4gPgo+Cj4gV2UgaGF2ZSBz
dXBwb3J0ZWQgQUNQSSBvbmx5IHdpdGggVUVGSS4gVGhlIGN1cnJlbnQgYm9vdGluZyBjb250cmFj
dAo+IGJldHdlZW4gZmlybXdhcmUgYW5kIE9TIGlzIHRvIHBhc3Mgb25seSBvbmUgb2YgRFQgb3Ig
QUNQSSwgbm90IGJvdGguCj4gVGhpcyBhcHByb2FjaCBicmluZ3MgYW5vdGhlciBib290aW5nIGNv
bnRyYWN0IGZvciBMaW51eCBtaXhpbmcgQUNQSSBhbmQKPiBEVCB3aGljaCBhZmZlY3RzIFJWSSBz
cGVjcy4gQXMgcGVyIHBvbGljeSBhbmQgc2luY2UgaXQgY2FuIGFmZmVjdAo+IG11bHRpcGxlIE9T
cywgYSBmcm96ZW4gUlZJIHNwZWMgaXMgcmVxdWlyZWQgZm9yIHRha2luZyB0aGlzIHBhdGNoIGlu
dG8KPiBsaW51eC4gU28sIGNvdWxkIHlvdSBwbGVhc2UgYnJpbmcgdGhpcyB0b3BpYyBmb3IgZGlz
Y3Vzc2lvbiBpbiBbMV0gYW5kCj4gZ2V0IGFncmVlbWVudD8KPgo+IElzbid0IGl0IHNpbXBsZXIg
dG8gcHJvdmlkZSBhIG1pbmltdW0gVUVGSSBjb25maWd1cmF0aW9uIHRhYmxlIGFuZAo+IHN0dWJi
ZWQgQlMvUlM/Cj4KPiBIYXZlIHlvdSBkb25lIGEgUG9DPyBJIGFtIGN1cmlvdXMgaG93IGRvIHlv
dSBoYW5kbGUgRUZJIG1lbW9yeSBtYXAKPiBkZXBlbmRlbmNpZXMuCgpZZXMsIFBvYyBoYXMgYmVl
biBjb21wbGV0ZWQuCmEgbWVtb3J5IG5vZGUgaW4gRFRTIGNhbiBzb2x2ZSBpdC4KCj4KPiBJbiBj
YXNlIHRoaXMgaXMgYXBwcm92ZWQsIEkgYW0gd29uZGVyaW5nIHdoeSBkbyB3ZSBuZWVkIG5ldyBG
Rkk/Cj4KPiBbMV0gLSBodHRwczovL2xpc3RzLnJpc2N2Lm9yZy9nL3RlY2gtYnJzCgpXZSBoYXZl
IGRpc2N1c3NlZCB3aXRoIEFyZCBhbmQgUm9uIG1hbnkgdGltZXMgYWJvdXQgdGhlIHNlcmllcyBv
ZgpxdWVzdGlvbnMgeW91IG1lbnRpb25lZCBhYm92ZSwgYW5kIHJlYWNoZWQgYSBjb25zZW5zdXMu
ClBsZWFzZSBzZWUgdGhlIHYxOgpodHRwczovL3BhdGNoZXMubGluYXJvLm9yZy9wcm9qZWN0L2xp
bnV4LWFjcGkvcGF0Y2gvMjAyMzA0MjYwMzQwMDEuMTYtMS1jdWl5dW5odWlAYnl0ZWRhbmNlLmNv
bS8KClRoYW5rcywKWXVuaHVpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
