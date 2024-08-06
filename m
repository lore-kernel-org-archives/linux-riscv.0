Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D07DEC3DA7F
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Aug 2024 01:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JBf/+jbeHyN5AiTVtSoltAYYoteOu2MqmbfS+fNN/LQ=; b=fGJJcYkLpV2+By
	A51RAOZWmGlwYA1s4DMWzIv4VDvAL7F5oNcCJhkJlVZrV7bwoI2TyXZRAyvBWohpMhmH09ctwA6do
	vUrT5+oYMEEMQ89r42LgRr5nWrBz6+hgmQwA0ZMot0tIG0kw3ol2nAex8/RUYhK7Wyuy06Ma/Vw/0
	1Y81AccvaNbmKFkANH+8tqmgtY31b4C5QXdA2kdAoJi0Urjg1h8lOwiLoKoo6cf7K/omInpJ98eTp
	yo9oS023+Y0uTzPtzTqCZvq/lHN0bXobYAkx5U0y7niF4sZsR2RP8+zRvnGsyf9as+vNTOpKluQQo
	f+160B+TAi6CbpFzCg0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb9Rl-00000000CR6-0TSl;
	Tue, 06 Aug 2024 01:57:09 +0000
Received: from mail-vk1-xa30.google.com ([2607:f8b0:4864:20::a30])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb9Ri-00000000CQh-0YuX
	for linux-riscv@lists.infradead.org;
	Tue, 06 Aug 2024 01:57:07 +0000
Received: by mail-vk1-xa30.google.com with SMTP id 71dfb90a1353d-4f6ac477ff4so116088e0c.3
        for <linux-riscv@lists.infradead.org>; Mon, 05 Aug 2024 18:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1722909424; x=1723514224; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4IBhLwxtqkmorMtQaTuVRdda8fWR3f/wiJqz/bSky3o=;
        b=bAml4IuHSH36qrUOxOinne+LRi50d7WiGtSDDeMcxzcQLZ0qyz7q6g59Nr2PnWO+Ef
         QoP3yXBvMBD/YPshOtzbGTkgUA6X4QlnQiUOUlhXcAHD/RYojr6+MY/VfbwaC2NjWn0I
         MRfm94Bri+AcaX6rpoH5oASCj3bJgvsHDgL3oFuAquTsp3AV2i2HYBD0PW9yafOqy44/
         eAaoQPmvLmAWgqzYdffWJYYh1+V7KoBdzP929UCUNf7cSUaEE/neqnbfhc4RNbKZ7Zdo
         5E/SolZLJ2SxbNC4KhwwOzyDtZI5s60eQbj7hiVuPY8dRsOsoYf3RQ8LqBJK2hUNw1Td
         MYLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722909424; x=1723514224;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4IBhLwxtqkmorMtQaTuVRdda8fWR3f/wiJqz/bSky3o=;
        b=LyKIY52zqgjo4j2IqwOWGojBkHgkhKd7lNTJPaTMwuhAG+AD/T9alcw7iUyQPzek6r
         VxVgXymqL6ZU+K4mFsGMalrCj8/wZtbebO18awb0YQSJv/V6sLuApsnxe8bu0dNnA/vT
         EAwGKuIrvmhHzhHlLMkmES7jBmNeBQSQBklJrtziA6QCAH8wJBfm5W1OhGMjgPiGvYOc
         8cIa0+PZ49xnlBzVJ5ZQMcoCTQYng9I9hqXF0vIyBhVf1+l7kjfIXF0i8qx7wtvoHIu0
         ddsGSNCWL8iuttmdLrTavhxSouqrBxL2pKLiWoXUMrya0Broy6xYVTn0JGj3avthxs6e
         dRew==
X-Forwarded-Encrypted: i=1; AJvYcCXc4ZIrs7boldk2SruHjf0GgJ1A5c3xK4dRuhmwoVHj3nD5aby4FnPLnA33ot6tH0DnqT8biBykWg53Bci2qfCHyxlVR64pOzM8uG3awINs
X-Gm-Message-State: AOJu0YxrWRD0/2jM7to13dP+uyH1Z5nUxpjoaKUF15al8KuWdByzyjAf
	lGa4SvmXNatNjCl759W4z6tQZH4r1rwuUFB/VHh8zzWTKPIEtyeSV8kcuhjPY9e2fHc+4FVDZOh
	TDY27ooQiqqvzT6Y+WuKt+sjNw0VcSFBYE5hxyA==
X-Google-Smtp-Source: AGHT+IG6uYp/qeARWmcfys9e+xhKBRJ3fLh+ZcQoOxPy1mUlLhZ7LB67in6o5dtQKoMQbvfW4vU8Bcr9rD2b/bQNxDQ=
X-Received: by 2002:a05:6122:4584:b0:4eb:5cb9:f219 with SMTP id
 71dfb90a1353d-4f89fe84d6fmr16806238e0c.0.1722909424192; Mon, 05 Aug 2024
 18:57:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240802075741.316968-1-vincent.chen@sifive.com>
 <CAAhSdy3yx=mm3M6U_Q+_WdMs12SGCypPgNkBAVc9Kwn9jgev6g@mail.gmail.com>
 <CABvJ_xgcbyQKa1+U1MC7cLEB-SUzzNaWqKdXFp+13mni0YSvNw@mail.gmail.com> <87sevj5r45.ffs@tglx>
In-Reply-To: <87sevj5r45.ffs@tglx>
From: Vincent Chen <vincent.chen@sifive.com>
Date: Tue, 6 Aug 2024 09:56:53 +0800
Message-ID: <CABvJ_xhMAU+Ft-Ut2hMapO9dCSkz4M2PqxvdCrJS6eaSz02hLQ@mail.gmail.com>
Subject: Re: [PATCH] irqchip: let the probe of APLIC be earlier than IMSIC
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Anup Patel <anup@brainfault.org>, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_185706_365107_1E8AA2EB 
X-CRM114-Status: GOOD (  18.58  )
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

T24gTW9uLCBBdWcgNSwgMjAyNCBhdCA0OjA44oCvUE0gVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxp
bnV0cm9uaXguZGU+IHdyb3RlOgo+Cj4gT24gTW9uLCBBdWcgMDUgMjAyNCBhdCAxMDo0MywgVmlu
Y2VudCBDaGVuIHdyb3RlOgo+ID4gT24gRnJpLCBBdWcgMiwgMjAyNCBhdCA3OjAz4oCvUE0gQW51
cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4gd3JvdGU6Cj4gPj4gU2Vjb25kbHksIGNoYW5n
aW5nIGNvbXBpbGF0aW9uIG9yZGVyIGluIE1ha2VmaWxlIHRvIGluZmx1ZW5jZQo+ID4+IHRoZSBw
cm9iZSBvcmRlciB3aWxsIG5vdCBoZWxwIGluIGFueSB3YXkuCj4gPj4KPiA+IEkgd2FzIGNvbmZ1
c2VkIGhlcmUuIElmIHBvc3NpYmxlLCBob3BlIHlvdSBjYW4gaGVscCBtZSBjbGFyaWZ5IGl0Lgo+
ID4gVGhlIGZvbGxvd2luZyBpcyB0aGUgYmFja3RyYWNlIG9mIHJlYWxseV9wb3JiZSgpIGR1bXBl
ZCBieSBHREIuCj4gPiAjMCAgMHhmZmZmZmZmZjgwOTIzMThhIGluIHJlYWxseV9wcm9iZSAoKQo+
ID4gIzEgIDB4ZmZmZmZmZmY4MDkyMzUxNiBpbiBfX2RyaXZlcl9wcm9iZV9kZXZpY2UucGFydC4w
ICgpCj4gPiAjMiAgMHhmZmZmZmZmZjgwNTdjODU2IGluIGRyaXZlcl9wcm9iZV9kZXZpY2UgKCkK
PiA+ICMzICAweGZmZmZmZmZmODA1N2M5YmEgaW4gX19kcml2ZXJfYXR0YWNoICgpCj4gPiAjNCAg
MHhmZmZmZmZmZjgwNTdhYWE0IGluIGJ1c19mb3JfZWFjaF9kZXYgKCkKPiA+ICM1ICAweGZmZmZm
ZmZmODA1N2MzZWEgaW4gZHJpdmVyX2F0dGFjaCAoKQo+ID4gIzYgIDB4ZmZmZmZmZmY4MDU3YmM0
YSBpbiBidXNfYWRkX2RyaXZlciAoKQo+ID4gIzcgIDB4ZmZmZmZmZmY4MDU3ZDc1YSBpbiBkcml2
ZXJfcmVnaXN0ZXIgKCkKPiA+ICM4ICAweGZmZmZmZmZmODA1N2U4M2MgaW4gX19wbGF0Zm9ybV9k
cml2ZXJfcmVnaXN0ZXIgKCkKPiA+ICM5ICAweGZmZmZmZmZmODBhMjQ1NWUgaW4gaW1zaWNfcGxh
dGZvcm1fZHJpdmVyX2luaXQgKCkKPiA+ICMxMCAweGZmZmZmZmZmODAwMDIxMmMgaW4gZG9fb25l
X2luaXRjYWxsICgpCj4gPiAjMTEgMHhmZmZmZmZmZjgwYTAxMTg4IGluIGtlcm5lbF9pbml0X2Zy
ZWVhYmxlICgpCj4gPiAjMTIgMHhmZmZmZmZmZjgwOTI4ZDgwIGluIGtlcm5lbF9pbml0ICgpCj4g
Pgo+ID4gQWNjb3JkaW5nIHRvIHRoaXMgcmVzdWx0LCB0aGUgc291cmNlIHRvIGNhbGwgcmVhbGx5
X3Byb2JlIGlzCj4gPiBkb19vbmVfaW5pdGNhbGwoKSwgcmVnYXJkbGVzcyBvZiB3aGV0aGVyIGl0
IGlzIEFQTElDIG9yIElNU0lDLiBUaGUKPiA+IGRvX29uZV9pbml0Y2FsbCgpIGZ1bmN0aW9uIGZv
bGxvd3MgdGhlIHBsYWNlZCBvcmRlciBvZiB0aGUKPiA+IGluaXRpYWxpemF0aW9uIGZ1bmN0aW9u
cyBpbiB0aGUgX19pbml0Y2FsbDYgc2VjdGlvbiB0byBpbnZva2UgdGhlbS4KPiA+IFRoZSBjb21w
aWxlIG9yZGVyIGRldGVybWluZXMgdGhlIG9yZGVyIG9mIHRoZSBfX2luaXRjYWxsNiBzZWN0aW9u
Lgo+ID4gVGhlcmVmb3JlLCBJIHRyeSB0byBhZGp1c3QgdGhlIGNvbXBpbGUgb3JkZXIgdG8gaW5m
bHVlbmNlIHRoZSBwcm9iZQo+ID4gb3JkZXIgYmV0d2VlbiBJTVNJQyBhbmQgQVBMSUMuIERvIEkg
bWlzdW5kZXJzdGFuZCBzb21ldGhpbmc/Cj4KPiBUaGVyZSBpcyBubyBndWFyYW50ZWUgdGhhdCB0
aGlzIG9yZGVyIGlzIHJldGFpbmVkLiBUaGUgbGlua2VyIGNhbiBmcmVlbHkKPiByZW9yZyB0aGUg
c2VjdGlvbi4gVGhhdCdzIHdoeSB3ZSBoYXZlIGRlZmVycmVkIHByb2JpbmcuIEl0J3MgbmVpdGhl
ciBhCj4gYnVnIG5vciBhIHByb2JsZW0sIHNvIHdoYXQgYXJlIHlvdSB0cnlpbmcgdG8gc29sdmU/
Cj4KCkhpIFRob21hcywKSSB1bmRlcnN0YW5kIG5vdy4gSSBkaWRuJ3QgcmVhbGl6ZSB0aGF0IHRo
ZSBsaW5rZXIgY291bGQgZnJlZWx5CnJlb3JnYW5pemUgdGhpcyBzZWN0aW9uLiBUaGlzIHBhdGNo
IHdvbuKAmXQgYWN0dWFsbHkgYWRqdXN0IHRoZSBwcm9iZQpvcmRlci4gVGhhbmsgeW91IHZlcnkg
bXVjaCBmb3IgdGhlIGV4cGxhbmF0aW9uCgpSZWdhcmRzLApWaW5jZW50Cgo+IFRoYW5rcywKPgo+
ICAgICAgICAgdGdseAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
