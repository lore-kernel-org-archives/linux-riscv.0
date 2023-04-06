Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 890CBC7618D
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Apr 2023 08:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aUbOHDyJV14R66sNWkQ04IkH2RP/HFGX0rp0lIgMVrY=; b=2o8Wa364So05aN
	OHXnmjCyDwV4ZkVJ6rJZW4+cbxca/LK2KafQHf2+74x2jhzh+jpXBwhzEy89kGMkq6FcqckuVgrc0
	feCFebeXF6uqZRmxI9z4qQEUsXweJ7bYQZoYT3pFamaFmF9AveRqD9cAb9Kap0V8Ei5vYU5EwC+WA
	2Lm+bSReDzfyc/0hdVPioxbNQwQyfW0a6RJaHIL6l6TL+CENhMrJ8B79XohSLkjLR6du5g8RRLWCn
	vMx9ZhLRUvC4bqsvj3xPXELjnkttkSyiqnLV2O+jjuVFiQkkgqyoQVmQY/9hoUstp1pvi0x8bwuvg
	2fdjjgULnClftXZ3J0Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkKbV-006haJ-0b;
	Thu, 06 Apr 2023 08:04:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkKbS-006hYw-0o
	for linux-riscv@lists.infradead.org;
	Thu, 06 Apr 2023 08:04:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680768256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kBR23GZ8+/B49HpGt9RtYBgTJWOQz/g1P9XKqxTbjRU=;
	b=Y1J37HTVBwGF4DrWoE8G/7rFElnNYpJZKbxxT0q7ThoZuvrtk0Ut7PYhNVOdnPbW+DtJR/
	v1bCRvgQQqZkV+oGo8ZrM0PomzWECbkSjHIRlvPbGtpRqfX+VhKa1/2dvVO7tNWBQP0DnN
	f0tX8VlU2Jjk55MJzJexS0Fl6+SxGG0=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-91-KIikKSZLNE2hFhXg7s0Ltg-1; Thu, 06 Apr 2023 04:04:14 -0400
X-MC-Unique: KIikKSZLNE2hFhXg7s0Ltg-1
Received: by mail-qk1-f200.google.com with SMTP id c186-20020a379ac3000000b007484744a472so17099067qke.22
        for <linux-riscv@lists.infradead.org>; Thu, 06 Apr 2023 01:04:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680768254;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kBR23GZ8+/B49HpGt9RtYBgTJWOQz/g1P9XKqxTbjRU=;
        b=ML82xZnsqPQRf0oXPQSah2gJ4Y8Pl8H0uh528JR0AQXNtkf9fZz1hmSp1QyvRhUfC3
         kpgP4gkRZZgD0wEu6fh+Jo2IlU1TD83LiJCSw5casgZA/+TmpaLNYxDx9n5uKJwp+nrQ
         1AS5KGQ4XPLS6Erp1FYg9lPodUA/GSVAvJQktWBlY7sfbBLVDEp3Fc0Z2lUlxOzArum9
         HMvvc5F7w314q5n760wl++1KpxernxscLUI9/peSh7TZ6+Iq1AcdX6VRDElzRc40Kn70
         ABw+MgHHzfBymXzD/+8M4De7EZcHcHBN/MXyAq8nfE++goip65//NY6ka1RCzDIJI7tA
         r5mA==
X-Gm-Message-State: AAQBX9el3HTx0p9e1elE4Cmw6fbqx4ztKSsILFtt+LdsQednkhXpls1U
	kRgh3mdizKO05NTVVsJY8pJvD2dojeVjtGaJmhEMwUHrge4u6TM/j0ox3OQ2iRif4KCtmY9is4T
	pUpKBOqqmspMXyf7LLghlRGiZvO0Qvza+Y+WmXnxZV5N1
X-Received: by 2002:a05:620a:1a87:b0:74a:580:c44f with SMTP id bl7-20020a05620a1a8700b0074a0580c44fmr1997128qkb.15.1680768254371;
        Thu, 06 Apr 2023 01:04:14 -0700 (PDT)
X-Google-Smtp-Source: AKy350b40gp56Owd1MrZXFq8AS5omv9qC9T8NSJdmJvSJPLqoBm/VcSbTdIPTRAal/ociNgaDksnkXTN5J9GdZSFRV8=
X-Received: by 2002:a05:620a:1a87:b0:74a:580:c44f with SMTP id
 bl7-20020a05620a1a8700b0074a0580c44fmr1997118qkb.15.1680768254137; Thu, 06
 Apr 2023 01:04:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230404163741.2762165-1-leobras@redhat.com> <CAJF2gTTBm7_krSFjfSjD62pbfcaUOrfUhXzoHUD1-DKQ_SCLhA@mail.gmail.com>
In-Reply-To: <CAJF2gTTBm7_krSFjfSjD62pbfcaUOrfUhXzoHUD1-DKQ_SCLhA@mail.gmail.com>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Thu, 6 Apr 2023 05:04:03 -0300
Message-ID: <CAJ6HWG56G+0CiSwDzkEjCiRf-2TQqqDBN7ABPYYeVQMdtm8iAA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 0/6] Deduplicating RISCV cmpxchg.h macros
To: Guo Ren <guoren@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrea Parri <parri.andrea@gmail.com>, 
	Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_010418_364603_AF8385DC 
X-CRM114-Status: GOOD (  23.23  )
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

T24gV2VkLCBBcHIgNSwgMjAyMyBhdCAxMTo0MOKAr1BNIEd1byBSZW4gPGd1b3JlbkBrZXJuZWwu
b3JnPiB3cm90ZToKPgo+IFRoeCBMZW9uYXJkbywKPgo+IEl0J3MgYSBnb29kIHBvaW50IGZvciBj
bGVhbmluZyB1cC4KCkhlbGxvIEd1bywKVGhhbmtzIGZvciB0aGUgZmVlZGJhY2shCgo+Cj4gT24g
V2VkLCBBcHIgNSwgMjAyMyBhdCAxMjozN+KAr0FNIExlb25hcmRvIEJyYXMgPGxlb2JyYXNAcmVk
aGF0LmNvbT4gd3JvdGU6Cj4gPgo+ID4gV2hpbGUgc3R1ZHlpbmcgcmlzY3YncyBjbXB4Y2hnLmgg
ZmlsZSwgSSBnb3QgcmVhbGx5IGludGVyZXN0ZWQgaW4KPiA+IHVuZGVyc3RhbmRpbmcgaG93IFJJ
U0NWIGFzbSBpbXBsZW1lbnRlZCB0aGUgZGlmZmVyZW50IHZlcnNpb25zIG9mCj4gPiB7Y21wLH14
Y2hnLgo+ID4KPiA+IFdoZW4gSSB1bmRlcnN0b29kIHRoZSBwYXR0ZXJuLCBpdCBtYWRlIHNlbnNl
IGZvciBtZSB0byByZW1vdmUgdGhlCj4gPiBkdXBsaWNhdGlvbnMgYW5kIGNyZWF0ZSBtYWNyb3Mg
dG8gbWFrZSBpdCBlYXNpZXIgdG8gdW5kZXJzdGFuZCB3aGF0IGV4YWN0bHkKPiA+IGNoYW5nZXMg
YmV0d2VlbiB0aGUgdmVyc2lvbnM6IEluc3RydWN0aW9uIHN1Zml4ZXMgJiBiYXJyaWVycy4KPiA+
Cj4gPiBJIHNwbGl0IHRob3NlIGNoYW5nZXMgaW4gMyBsZXZlbHMgZm9yIGVhY2ggY21weGNoZyBh
bmQgeGNoZywgcmVzdWx0aW5nIGEKPiBCdXQgaG93IGFib3V0IG1lcmdpbmcgMyBsZXZlbHMgaW50
byBvbmU/IChJIG1lYW4gb25lIGZvciBjbXB4Y2hnIGFuZAo+IG9uZSBmb3IgeGNoZywgcmVzdWx0
aW5nIGluIDIgcGF0Y2hlcy4pCgpTdXJlLCBhcyBtZW50aW9uZWQgYmVsb3csIEkgaGF2ZSBubyBp
c3N1ZSBzcXVhc2hpbmcgdGhlIHBhdGNoZXMsIHNvIDIKc2hvdWxkIHdvcmsgZmluZS4KCkkgd2Fz
IHByZXZpb3VzbHkgd29ycmllZCBhYm91dCB0aGUgY2hhbmdlcywgc28gSSBzcGxpdCB0aGVtIGlu
IDMgc28KaXQncyBlYXNpZXIgdG8gdW5kZXJzdGFuZCBteSB0aG91Z2h0IHByb2Nlc3MuCgpJIHdp
bGwgcmVzZW5kIGl0IGluIGEgY291cGxlIG1pbnV0ZXMuCgo+Cj4gPiB0b3RhbCBvZiA2IHBhdGNo
ZXMuIEkgZGlkIHRoaXMgc28gaXQgYmVjb21lcyBlYXNpZXIgdG8gcmV2aWV3IGFuZCByZW1vdmUK
PiA+IHRoZSBsYXN0IGxldmVscyBpZiBkZXNpcmVkLCBidXQgSSBoYXZlIG5vIGlzc3VlIHNxdWFz
aGluZyB0aGVtIGlmIGl0J3MKPiA+IGJldHRlci4KPiA+Cj4gPiBQbGVhc2UgcHJvdmlkZSBjb21t
ZW50cy4KPiA+Cj4gPiBUaGFua3MhCj4gPiBMZW8KPiA+Cj4gPiBDaGFuZ2VzIHNpbmNlIHYyOgo+
ID4gLSBGaXhlZCAgbWFjcm9zIHRoYXQgZGVwZW5kIG9uIGhhdmluZyBhIGxvY2FsIHZhcmlhYmxl
IHdpdGggYSBtYWdpYyBuYW1lCj4gPiAtIFByZXZpb3VzIGNhc3QgdG8gKGxvbmcpIGlzIG5vdyBv
bmx5IGFwcGxpZWQgb24gNC1ieXRlcyBjbXB4Y2hnCj4gPgo+ID4gQ2hhbmdlcyBzaW5jZSB2MToK
PiA+IC0gRml4ZWQgcGF0Y2ggNC82IHN1ZmZpeCBmcm9tICd3LmFxcmwnIHRvICcudy5hcXJsJywg
dG8gYXZvaWQgYnVpbGQgZXJyb3IKPiA+Cj4gPgo+ID4gTGVvbmFyZG8gQnJhcyAoNik6Cj4gPiAg
IHJpc2N2L2NtcHhjaGc6IERlZHVwbGljYXRlIGNtcHhjaGcoKSBhc20gZnVuY3Rpb25zCj4gPiAg
IHJpc2N2L2NtcHhjaGc6IERlZHVwbGljYXRlIGNtcHhjaGcoKSBtYWNyb3MKPiA+ICAgcmlzY3Yv
Y21weGNoZzogRGVkdXBsaWNhdGUgYXJjaF9jbXB4Y2hnKCkgbWFjcm9zCj4gPiAgIHJpc2N2L2Nt
cHhjaGc6IERlZHVwbGljYXRlIHhjaGcoKSBhc20gZnVuY3Rpb25zCj4gPiAgIHJpc2N2L2NtcHhj
aGc6IERlZHVwbGljYXRlIHhjaGcoKSBtYWNyb3MKPiA+ICAgcmlzY3YvY21weGNoZzogRGVkdXBs
aWNhdGUgYXJjaF94Y2hnKCkgbWFjcm9zCj4gPgo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20v
Y21weGNoZy5oIHwgMzE5ICsrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+ICAxIGZp
bGUgY2hhbmdlZCwgNjcgaW5zZXJ0aW9ucygrKSwgMjUyIGRlbGV0aW9ucygtKQo+ID4KPiA+IC0t
Cj4gPiAyLjQwLjAKPiA+Cj4KPgo+IC0tCj4gQmVzdCBSZWdhcmRzCj4gIEd1byBSZW4KPgoKQmVz
dCByZWdhcmRzLApMZW8KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
