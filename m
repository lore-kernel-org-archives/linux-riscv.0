Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0319606A321
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 08:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MHpyD9rZ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=HDaZLUDN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/oa3k8+84FO1E3CKqeb1qabWPT5xKj3/vW9bxsvjrRQ=; b=MHpyD9rZP2OlRO+vtM2L1HVziU
	y5xli7HWRyGip+wc37u806rUgPbfSLGzR0ylnzwHSM2nRQ0Ti1SEyxva2G1rAKBbtrb/Jkim+7I9w
	58NcanFXnn5SC2edzujhdVF+bInPav44XLq+qjDXV8JuZgGAiy1vnIMBPytcyuKmZK97ctEAjL4Um
	kp1UY+XBWRF1I2uPfp+BSR8nrXLMcZqKYEZ0PAov7Oe0P3pxjdYxpIw3qsN7x46DabAM9U2EQYwoH
	qf56mXV1b5cgn4YOp1H9OsJBtwzWUmTBcsgsndsHsBSrjk0giZzz/0JacxeuyJehzGQvRFF6OoUH9
	PA0jsXUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgt9-000000033Q9-1W7O;
	Tue, 10 Nov 2026 08:07:31 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgt6-000000033PB-23pf
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 08:07:30 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-492f6b7f70dso1060497f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 10 Nov 2026 00:07:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794298046; cv=none;
        d=google.com; s=arc-20260327;
        b=dr3cNb7gQwXXYpIDQ+ZJ/mIBtwi671p7ByTmwI/lIAShn45VoUMOqolCd39qDHC/AB
         er3LfbkI0s6xPIsACNsfrQrj/Ga16Df/OeUEFrr9bc6XxclN3EvschI7M42RzTuw8IHI
         78wBJr7J7zCjA6metsAQacxQi5R9ED8uWGfOqzn90iGjFWlrPCVqebVGowpd/EcJtJRM
         9t6F/LyxIsFfTUYgKRJmaIzQXfLlq4mvfTet3Dtaqik8KpC9mH4D0aW1Xdcd4Cm6glRB
         jIyERXZRHmV6NZvJNN0zsyPnyJTTbcnyEf7/vh1DXmNzetL7Xe3TfHRxIci1DvXTW3Jw
         CgAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zKy/gJ2Q4OqB/ldZ+D1suUF3Ao+MCf7ZUxfe/sFiu9Y=;
        fh=Uew4yv19+7bW4ZediuVFzev6FJH+GTdd41bDchdvvOw=;
        b=FBsWwti+HPFoBLwuGlO3I++QnWX8sXTWHwTdYNnPZtxj+DpJW0vrKVdE4KBop9ps3P
         sKQm6E2yiqmqu4sdOZmiwpU1RAWtCRQmVK1bZ1USE3OuMm8Dthr5hw2mRABB3NR8JLza
         Z5nCWkPb40iuVuvnfaZhu8aeQku+loqqjawXIgCgwAQ1MYBwHU7Cuv7ux8ofZK2HRAE2
         AqO31SCikRd4B7YXDeS1OOAM+EozFlIGRlJDBNGLbnaLjInFQd4f0pG+5HvvkYs6Jyx3
         B4SoGlyG+DZntBd5CC2SJ2CnmFUob2zaTQPPlAFrAowAgulx/fOlKaPVaHZy8nQJqPz4
         Ez1A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1794298046; x=1794902846; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zKy/gJ2Q4OqB/ldZ+D1suUF3Ao+MCf7ZUxfe/sFiu9Y=;
        b=HDaZLUDNaAZh9+o+ureIATbVRCWpT4dny2xUFnzu+d/sCPdnZ+E2jrBTj8FrtByzK2
         QXdFgyPGD4nFcmwZ/bHVk4+yMNfqr59UUlneGjHizCJOYqaD6JmDrgQUicw5Clx0TN83
         DtmmAqzogzsPEQKND254ilKhVbsHBHjmynVH5cWijWmUzG4YzObJ9qwBpMq7vA1UfwME
         AoXC6+JUMaBekRlK6hs9T3k6DqFxI+KIM2lpnp9tNKm0cvvDxhR1a9NJgoAQMq37x15V
         iv5+9NMgEYHC6HQMC4sEdLKf8GCKReSRzyJQVIiiZ8LnIptO8TxBKzmz159vJJM5WmEE
         Yhvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794298046; x=1794902846;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zKy/gJ2Q4OqB/ldZ+D1suUF3Ao+MCf7ZUxfe/sFiu9Y=;
        b=NV9vekXhPQa0Qz/aixhxtlLN57nzfHkWucPZ+UfsUjWr5o6rWlS4FkPAgRE4V812zX
         9w/8pQzhctlVDyA/mAqc2lZvReDK5cYhoNBHnncfBr6jUyZ1Xym/4qF7+0rG8Am8SG/F
         flmKHp58CNRMKCSvJWaKoyihx2cPn5rcrv6qbBVbFO7nUARZPJJvk9lwn5L7KR3BYog6
         VyWh+y/KPcXMn/1UYAQA6KnnZp4Kd9jZ2SgF3LBpo96/IR2O8GbPYN8vtrtDv6TSPfs+
         Lkhhgc0AwjTBlj6fsgdrKWRo28ujTqB1Tx/EMwfIcmzjiGXELYcgangpMpR51nLlljJ4
         qyog==
X-Forwarded-Encrypted: i=1; AL+hErEKcURMglYEfk1c432Y0A6LbMJga36cKIAM6PttbK3GVU+HNTIB7MqKEL8jWCCeIzoeslcxa/xDU5sq0Q==@lists.infradead.org
X-Gm-Message-State: APuU4Z9IYLPJ08uHl3zYqKCZnfujOmOM4a9oGRafBDsmS14LaICXQUJv
	oXOESA1yJGcHVIwak8Avg9MLUyg9U4vsyXSI+YoEwZew8B8ZEdGuZyFC7/40OTjTq0IEhjuOgyg
	ZXjL54m7hSQa2Sal0HwyTVEJZ4wHGblvmmW+eQ4MbOg==
X-Gm-Gg: AYBFou1y/PEFHgm35/zzjzp5wkyzopUUhw0SQGgtQAmGCnB8u86GwuAtX472xmwsMzL
	bpvRnzlKhQNcGumVLE/mokesTyrTvStp3OtLqbMz2wA5yymfhkk8I3Heu465GNNeqLrhKiAgH0b
	4vwoLOEcUxHc24Q+B1GW/FyLnhhwazS6hYy+N7O3qfp5f4lX28H4bndfw0DexvhLBANi3y/HvN6
	enjLaq5j5NjS++FXiUJVDmTOO+3ELqD/d/EQVHkt1KhTaHbI2XLlMD8mXhPTCyK6CmttWrWqQVX
	8pm/XtbpPiT/wTDhIAA4TJy9zvFdwOnQrrYOcXb/aCI42igNz9hS6gfPpTfDRieLVfjETZWqb/L
	WF25u+OPfxEQeKFjHcGd/o0NbJ4BZP0iN1h6OEbPceDJqB4b/PLSjBNkTWIgK//FYYx0V2R+QYt
	V89bu+7FQmJdWRTCxGDnlgTCGFgvcyGFLpft4RagTI06RVAbWGlvwaFko=
X-Received: by 2002:a05:6000:290d:b0:48c:7386:af18 with SMTP id
 ffacd0b85a97d-4982b28aa0cmr3447294f8f.8.1794298045549; Tue, 10 Nov 2026
 00:07:25 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261020-aplic-async-probe-v5-0-c4861c2aafca@mobileye.com> <20261020-aplic-async-probe-v5-2-c4861c2aafca@mobileye.com>
In-Reply-To: <20261020-aplic-async-probe-v5-2-c4861c2aafca@mobileye.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 10 Nov 2026 13:37:14 +0530
X-Gm-Features: AclHuK-vBDH2XlztsVwt_XXQdD8zuFsijRvxMQGcBNFnVvFsuvB6NPhtCgNa4gw
Message-ID: <CAAhSdy2kxydOk9wPdBtVHCTN2uDrpFbQ0WGUXHz0AUvUWAncpg@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] irqchip/riscv-aplic: force synchronous probing
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Jessica Liu <liu.xuemei1@zte.com.cn>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_000728_815535_D827AF28 
X-CRM114-Status: GOOD (  22.45  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVHVlLCBPY3QgMjAsIDIwMjYgYXQgOTowOeKAr1BNIFZsYWRpbWlyIEtvbmRyYXRpZXYKPHZs
YWRpbWlyLmtvbmRyYXRpZXZAbW9iaWxleWUuY29tPiB3cm90ZToKPgo+IFRoZSBBUExJQyBkcml2
ZXIgbGVhdmVzIHByb2JlX3R5cGUgdW5zZXQsIHNvIGl0IGZvbGxvd3MKPiBQUk9CRV9ERUZBVUxU
X1NUUkFURUdZIGFuZCBpcyBwcm9iZWQgYXN5bmNocm9ub3VzbHkgd2hlbiB0aGUgY29tbWFuZCBs
aW5lCj4gcmVxdWVzdHMgaXQgKGRyaXZlcl9hc3luY19wcm9iZT0pLiBUaGUgcHJvYmUgb2YgYW4g
QVBMSUMgaW5zdGFuY2UgdXBkYXRlcwo+IHN0YXRlIHNoYXJlZCBieSBhbGwgaW5zdGFuY2VzIHdp
dGhvdXQgYW55IGxvY2tpbmc6Cj4KPiAtIHRoZSBjaGVjay10aGVuLXNldCBvZiBhcGxpY19zeXNj
b3JlX3JlZ2lzdGVyZWQ7IHR3byBpbnN0YW5jZXMgY2FuIGJvdGgKPiAgIG9ic2VydmUgaXQgYXMg
ZmFsc2UgYW5kIGJvdGggY2FsbCByZWdpc3Rlcl9zeXNjb3JlKCksIGluc2VydGluZyB0aGUgc2Ft
ZQo+ICAgbGlzdCBub2RlIHR3aWNlIGFuZCB0cmlwcGluZyBDSEVDS19EQVRBX0NPUlJVUFRJT04g
KCJsaXN0X2FkZCBkb3VibGUKPiAgIGFkZCIpIGluIF9fbGlzdF9hZGRfdmFsaWRfb3JfcmVwb3J0
KCk7Cj4gLSB0aGUgZ2xvYmFsIGFwbGljcyBsaXN0LCBtb2RpZmllZCBieSBhcGxpY19wbV9hZGQo
KS9hcGxpY19wbV9yZW1vdmUoKTsKPiAtIGFwbGljX2RpcmVjdF9wYXJlbnRfaXJxLCB3aGVyZSBt
b3JlIHRoYW4gb25lIGluc3RhbmNlIGNhbiBwYXNzIHRoZSBjaGVjawo+ICAgYW5kIHJlZ2lzdGVy
IGl0cyBvd24gQ1BVIGhvdHBsdWcgc3RhdGU7Cj4KPiBJbnRlcnJ1cHQgY29udHJvbGxlcnMgYXJl
IHJlcXVpcmVkIGVhcmx5IGFuZCBoYXZlIG5vIGJlbmVmaXQgZnJvbQo+IHBhcmFsbGVsIHByb2Jp
bmcsIHNvIHJhdGhlciB0aGFuIGFkZGluZyBsb2NrcyBhcm91bmQgZWFjaCBvZiB0aGVtIG1hcmsg
dGhlCj4gZHJpdmVyIFBST0JFX0ZPUkNFX1NZTkNIUk9OT1VTLiBQcm9iZXMgdGhlbiBydW4gb25l
IGFmdGVyIGFub3RoZXIgZnJvbQo+IGRyaXZlciByZWdpc3RyYXRpb24sIGFuZCBkZWZlcnJlZCBw
cm9iZSByZXRyaWVzIGFyZSBzZXJpYWxpemVkIGJ5IHRoZQo+IHNpbmdsZSBkZWZlcnJlZCBwcm9i
ZSB3b3JrIGl0ZW0sIHNvIHRoZSBzaGFyZWQgc3RhdGUgaXMgbmV2ZXIgYWNjZXNzZWQKPiBjb25j
dXJyZW50bHkuIFByb2JpbmcgaXMgYWxzbyBibG9ja2VkIGFjcm9zcyBzdXNwZW5kLCBzbyBpdCBj
YW5ub3Qgb3ZlcmxhcAo+IHdpdGggdGhlIHN5c2NvcmUgY2FsbGJhY2tzIGVpdGhlci4KPgo+IFNp
Z25lZC1vZmYtYnk6IFZsYWRpbWlyIEtvbmRyYXRpZXYgPHZsYWRpbWlyLmtvbmRyYXRpZXZAbW9i
aWxleWUuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWFwbGljLW1haW4u
YyB8IDkgKysrKysrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWFwbGlj
LW1haW4uYyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtYXBsaWMtbWFpbi5jCj4gaW5kZXgg
NTM2OTA3OGYzZDAwLi4zYzEwZGJmM2I0OTIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9pcnFjaGlw
L2lycS1yaXNjdi1hcGxpYy1tYWluLmMKPiArKysgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2
LWFwbGljLW1haW4uYwo+IEBAIC0xMTgsNyArMTE4LDggQEAgc3RhdGljIHN0cnVjdCBzeXNjb3Jl
IGFwbGljX3N5c2NvcmUgPSB7Cj4KPiAgLyoKPiAgICogTm90IF9fcm9fYWZ0ZXJfaW5pdDogcHJv
YmUgY2FuIGJlIGRlZmVycmVkIChlLmcuIE1TSSBtb2RlIHdhaXRpbmcgZm9yIHRoZQo+IC0gKiBJ
TVNJQykgYW5kIGNvbXBsZXRlIGFmdGVyIHRoZSBpbml0IG1lbW9yeSBpcyBtYWRlIHJlYWQtb25s
eS4KPiArICogSU1TSUMpIGFuZCBjb21wbGV0ZSBhZnRlciB0aGUgaW5pdCBtZW1vcnkgaXMgbWFk
ZSByZWFkLW9ubHkuIFByb2JpbmcgaXMKPiArICogc3luY2hyb25vdXMgKHNlZSBhcGxpY19kcml2
ZXIpLCBzbyBubyBmdXJ0aGVyIHNlcmlhbGl6YXRpb24gaXMgbmVlZGVkLgo+ICAgKi8KPiAgc3Rh
dGljIGJvb2wgYXBsaWNfc3lzY29yZV9yZWdpc3RlcmVkOwo+Cj4gQEAgLTQxMyw2ICs0MTQsMTIg
QEAgc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgYXBsaWNfZHJpdmVyID0gewo+ICAgICAg
ICAgICAgICAgICAubmFtZSAgICAgICAgICAgPSAicmlzY3YtYXBsaWMiLAo+ICAgICAgICAgICAg
ICAgICAub2ZfbWF0Y2hfdGFibGUgPSBhcGxpY19tYXRjaCwKPiAgICAgICAgICAgICAgICAgLmFj
cGlfbWF0Y2hfdGFibGUgPSBBQ1BJX1BUUihhcGxpY19hY3BpX21hdGNoKSwKPiArICAgICAgICAg
ICAgICAgLyoKPiArICAgICAgICAgICAgICAgICogUHJvYmVzIG9mIG11bHRpcGxlIEFQTElDIGlu
c3RhbmNlcyBzaGFyZSBnbG9iYWwgc3RhdGUgKHRoZQo+ICsgICAgICAgICAgICAgICAgKiBzeXNj
b3JlIHJlZ2lzdHJhdGlvbiBhbmQgdGhlIHBhcmVudCBpbnRlcnJ1cHQgb2YgdGhlCj4gKyAgICAg
ICAgICAgICAgICAqIGRpcmVjdCBtb2RlKSBhbmQgbXVzdCBub3QgcnVuIGNvbmN1cnJlbnRseS4K
PiArICAgICAgICAgICAgICAgICovCj4gKyAgICAgICAgICAgICAgIC5wcm9iZV90eXBlICAgICA9
IFBST0JFX0ZPUkNFX1NZTkNIUk9OT1VTLAoKTWFraW5nIHRoZSB3aG9sZSBkcml2ZXIgc3luY2hy
b25vdXNseSBwcm9iZSBpcyBhIGNvbnNlcnZhdGl2ZSB3b3JrLWFyb3VuZC4KCllvdXIgb3JpZ2lu
YWwgZGlyZWN0aW9uIHdhcyBnb29kLiBIb3cgYWJvdXQgdGhlIGZvbGxvd2luZzoKMSkgQ29udmVy
dCBhcGxpY19zeXNjb3JlX3JlZ2lzdGVyZWQgYXMgYXRvbWljIHZhcmlhYmxlCjIpIEFkZCBhbm90
aGVyIGF0b21pYyB2YXJpYWJsZSBhcGxpY19kaXJlY3RfcGFyZW50X2lycV9jb3VudCBhbmQgdXNl
CiJpZiAoIWF0b21pY19pbmNfcmV0dXJuKCZhcGxpY19kaXJlY3RfcGFyZW50X2lycV9jb3VudCkg
JiYgZG9tYWluKSB7IgppbiBhcGxpY19kaXJlY3Rfc2V0dXAoKS4KClJlZ2FyZHMsCkFudXAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
