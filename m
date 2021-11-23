Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6BE9C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Nov 2021 13:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IPzvB/rw3cAE32b9BCCmAYUPMe7OG9zQkndin8dCSlU=; b=w+BhPSWLH/kCYS
	DFhuKWvwxI+V+cYEVWQJXVnEK9U+iKe5tuXbr8mLHfPewCPPMSyAyQTZqcq4XdXefnZufhv5N+wvX
	mJNV9Egob1Tpx9cs88r6gZS6qjAxBXM2XnKhGwgkOD3oAMuGGHCJ0zsqlKGSsM4HMMSMgH51PlWhh
	yiVQHlSOJ1nBs4gJbYOwW2ZmyYV1aUgVC69mtK2HIikQk3VvjdVzoemRlYDVL3FX+42+9pyAs4iae
	ftmwj38y4A4YIQqZnwd2kUlLdZ0Oigvi7lo/oae9rkJY7I8wm5n3RiY6xRw3es7d/8CRnC5o83EYC
	YjX4Dd0sG9bFXNbF4Y/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpVzT-002QDv-FE; Tue, 23 Nov 2021 13:37:43 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpVzN-002QAP-CR
 for linux-riscv@lists.infradead.org; Tue, 23 Nov 2021 13:37:40 +0000
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 979544001F
 for <linux-riscv@lists.infradead.org>; Tue, 23 Nov 2021 13:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1637674654;
 bh=sQ/aKUx6TD41nvQIdvI6z2IwbCTpDn9sO75YCG3lse0=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=vYFwPxvvb2Sfb+grppc+CrgcGwuAlBWa22sm2vbVdODglPV3IwutkqtWiuxRn8OQC
 CrI0jZgeFWLEqqI8zYAGQ849/ff95E4Dfv4nBoBggwqs5j4fHqAved2tQIcQLYOYBg
 +equk0RgfniSwIJktmEJ+bIPDupOv1WesgiaKPqc6VezUX3TYqiMIItQ6S9Ob4SOLF
 dEZR4QufVxD7ixP6lC78oZ/ouOGnFoF5g8hDM7MyF/r3eRMMuJ3qULFmzDabgHqLZf
 l0oPNnTX4tnzLP4YYbzSWf9J8lnqndJt6Z3RlG/X9hIk838bqyX8vYSfOz6ejZpsXy
 ZoHUZ/wUm620A==
Received: by mail-ed1-f72.google.com with SMTP id
 a3-20020a05640213c300b003e7d12bb925so17909060edx.9
 for <linux-riscv@lists.infradead.org>; Tue, 23 Nov 2021 05:37:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sQ/aKUx6TD41nvQIdvI6z2IwbCTpDn9sO75YCG3lse0=;
 b=8C4S6+5LJyiUc7wmng0YYCWGNa7gfVAoJYOelfwVXk0QtxtJqcAm7ldTUt37pxuobN
 4wIZiFtzIalSxhmyc1ZNgVjGSzKxZTXbq3zzZ5hyC/Az4LkD34lhzY/HUVygdrOsWfYU
 IhJNhhYBKWzT7p/hF/niJDsQH9H9MRDh0+IWRLnjUdZbaxYE86nFW0vrM2Klqz6iLhNw
 iRFYCRZKWIdxj+E7aNbuBXO+qRbm+aN9kSwe8GLcvQ7M+Y77AFMTaBO+Wst6Ym+iUo+X
 VrItFLcuDLhrVfYvlXyeUpmiNytrBGapG3OjaQxxRqIMcMsOwT2ujZ8td1qx4k9Dh+Pq
 ruPQ==
X-Gm-Message-State: AOAM530QIWPPRL+4BjJBN79yZ+XV+B/fb+vSI078hJW14B9sKI/wV6Mj
 hkRKxQgIyL4ECwqDU61nvjeGmVMgh1o3zeDIEJdOxl3nVelnVuZczu7ZWDr3MfqReyve8FUWMMY
 wNZX1ZOxDhHMZ8ZlM/uj4db/MxszaNU4XNEc5zVa6lJjpsJRW7KDnQ44SvC3roQ==
X-Received: by 2002:a05:6402:44c:: with SMTP id
 p12mr9319532edw.234.1637674654382; 
 Tue, 23 Nov 2021 05:37:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxrrCzppU4wLLvhdliEWCPVhjPtH1WE5HhdkoKCbHQLQrIYyujzENmBboX3fRsWoSSk0IO8CtpixcYxbw3vU1A=
X-Received: by 2002:a05:6402:44c:: with SMTP id
 p12mr9319503edw.234.1637674654238; 
 Tue, 23 Nov 2021 05:37:34 -0800 (PST)
MIME-Version: 1.0
References: <20211123015717.542631-1-guoren@kernel.org>
 <20211123015717.542631-3-guoren@kernel.org>
 <CAAhSdy0LLu4o6uOB8t_Wv6jsOrrrSMx0pv1E1B5F679gan3i6g@mail.gmail.com>
 <07AD2CEA-3C9B-48FA-8E67-3B60448A08F0@jrtc27.com>
In-Reply-To: <07AD2CEA-3C9B-48FA-8E67-3B60448A08F0@jrtc27.com>
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Date: Tue, 23 Nov 2021 14:37:23 +0100
Message-ID: <CA+zEjCuKJBWy36kZhEn-E3BNXAPMnw-+Dty5xfO3_6ex0Q6LWg@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] riscv: Add early_param to decrease firmware region
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: Anup Patel <anup@brainfault.org>, Guo Ren <guoren@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, atishp@rivosinc.com, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>, 
 Anup Patel <anup.patel@wdc.com>, Alexandre Ghiti <alex@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_053737_629908_E859D067 
X-CRM114-Status: GOOD (  33.68  )
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

T24gVHVlLCBOb3YgMjMsIDIwMjEgYXQgMTI6NTMgUE0gSmVzc2ljYSBDbGFya2UgPGpydGMyN0Bq
cnRjMjcuY29tPiB3cm90ZToKPgo+IE9uIDIzIE5vdiAyMDIxLCBhdCAwMzo0NCwgQW51cCBQYXRl
bCA8YW51cEBicmFpbmZhdWx0Lm9yZz4gd3JvdGU6Cj4gPgo+ID4gK0FsZXgKPiA+Cj4gPiBPbiBU
dWUsIE5vdiAyMywgMjAyMSBhdCA3OjI3IEFNIDxndW9yZW5Aa2VybmVsLm9yZz4gd3JvdGU6Cj4g
Pj4KPiA+PiBGcm9tOiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4gPj4KPiA+
PiBVc2luZyByaXNjdi5md19zaXplIGluIGNtZGxpbmUgdG8gdGVsbCB0aGUga2VybmVsIHdoYXQg
dGhlCj4gPj4gZmlybXdhcmUgKG9wZW5zYmkpIHNpemUgaXMuIFRoZW4gcmVzZXJ2ZSB0aGUgcHJv
cGVyIHNpemUgb2YKPiA+PiBmaXJtd2FyZSB0byBzYXZlIG1lbW9yeSBpbnN0ZWFkIG9mIHRoZSB3
aG9sZSAyTUIuIEl0J3MgaGVscGZ1bAo+ID4+IHRvIHNhdGlzZnkgYSBzbWFsbCBtZW1vcnkgc3lz
dGVtIChEMXMvRjEzMyBmcm9tIEFsbHdpbm5lcikuCj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBH
dW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4gPj4gQ2M6IFBhbG1lciBEYWJiZWx0
IDxwYWxtZXJAZGFiYmVsdC5jb20+Cj4gPj4gQ2M6IEFudXAgUGF0ZWwgPGFudXAucGF0ZWxAd2Rj
LmNvbT4KPiA+PiBDYzogQXRpc2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+Cj4gPj4gLS0t
Cj4gPj4gYXJjaC9yaXNjdi9tbS9pbml0LmMgfCAxNCArKysrKysrKysrKysrLQo+ID4+IDEgZmls
ZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPj4KPiA+PiBkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9tbS9pbml0LmMgYi9hcmNoL3Jpc2N2L21tL2luaXQuYwo+ID4+
IGluZGV4IDkyMGU3OGY4YzNlNC4uZjdkYjZkNDAyMTNkIDEwMDY0NAo+ID4+IC0tLSBhL2FyY2gv
cmlzY3YvbW0vaW5pdC5jCj4gPj4gKysrIGIvYXJjaC9yaXNjdi9tbS9pbml0LmMKPiA+PiBAQCAt
MTU5LDYgKzE1OSwxNSBAQCBzdGF0aWMgaW50IF9faW5pdCBlYXJseV9tZW0oY2hhciAqcCkKPiA+
PiB9Cj4gPj4gZWFybHlfcGFyYW0oIm1lbSIsIGVhcmx5X21lbSk7Cj4gPj4KPiA+PiArc3RhdGlj
IHBoeXNfYWRkcl90IGZpcm13YXJlX3NpemUgX19pbml0ZGF0YTsKPiA+PiArc3RhdGljIGludCBf
X2luaXQgZWFybHlfZ2V0X2Zpcm13YXJlX3NpemUoY2hhciAqYXJnKQo+ID4+ICt7Cj4gPj4gKyAg
ICAgICBmaXJtd2FyZV9zaXplID0gbWVtcGFyc2UoYXJnLCAmYXJnKTsKPiA+PiArCj4gPj4gKyAg
ICAgICByZXR1cm4gMDsKPiA+PiArfQo+ID4+ICtlYXJseV9wYXJhbSgicmlzY3YuZndzeiIsIGVh
cmx5X2dldF9maXJtd2FyZV9zaXplKTsKPiA+PiArCj4gPgo+ID4gV2UgaGF2ZSBhdm9pZGVkIGFu
eSBSSVNDLVYgc3BlY2lmaWMga2VybmVsIHBhcmFtZXRlciB0aWxsIG5vdwo+ID4gYW5kIEkgZG9u
J3QgdGhpbmsgYWRkaW5nICJyaXNjdi5md3N6IiBpcyB0aGUgcmlnaHQgYXBwcm9hY2guCj4gPgo+
ID4gT3BlblNCSSBhZGRzIGEgcmVzZXJ2ZWQgbWVtb3J5IG5vZGUgKG1tb2RlX3Jlc3ZAODAwMDAw
MCkKPiA+IHRvIG1hcmsgdGhlIG1lbW9yeSB3aGVyZSBpdCBpcyBydW5uaW5nIGFzIHJlc2VydmVk
LiBJbiBmYWN0LCBhbGwKPiA+IE0tbW9kZSBydW50aW1lIGZpcm13YXJlIHNob3VsZCBiZSBhZGRp
bmcgYSByZXNlcnZlZCBtZW1vcnkKPiA+IG5vZGUganVzdCBsaWtlIE9wZW5TQkkuCgpZZXMgSSBh
Z3JlZSB0aGF0IHRoaXMgc2hvdWxkIGJlIGluIHRoZSBkZXZpY2UgdHJlZSwgSU1PIHRoZXJlIGlz
IG5vCm5lZWQgdG8gaW50cm9kdWNlIGEgbmV3IGtlcm5lbCBwYXJhbWV0ZXIuCgo+Cj4gQkJMIGRv
ZXMgbm90IGRvIHRoaXMgYW5kLCBldmVuIGlmIGl04oCZcyBtb2RpZmllZCB0b2RheSwgb2xkZXIg
dmVyc2lvbnMKPiB3aWxsIHN0aWxsIG5lZWQgdG8gYmUgc3VwcG9ydGVkIGZvciBxdWl0ZSBhIHdo
aWxlIGxvbmdlci4KCkl0J3MgZmFpciB0byBleHBlY3QgdGhlIGZpcm13YXJlIHRvIGFkdmVydGlz
ZSBpdHMgZXhpc3RlbmNlOiB3ZQpicmllZmx5IGRpc2N1c3NlZCB0aGF0IGxhc3QgeWVhciB3aXRo
IEF0aXNoIFsxXSBhbmQgaGUgcHJvcG9zZWQgdG8KaW50cm9kdWNlIGEgZG9jdW1lbnQgdGhhdCBk
ZXNjcmliZXMgd2hhdCB0aGUga2VybmVsIGV4cGVjdHMgZnJvbSB0aGUKJ3BsYXRmb3JtJyB3aGVu
IGl0IGJvb3RzLCB0aGF0IHdvdWxkIGJlIGEgd2F5IHRvIGRyb3AgdGhvc2Ugb2xkIGxlZ2FjeQpi
b290bG9hZGVycy4KClsxXSBodHRwczovL2xrbWwub3JnL2xrbWwvMjAyMC82LzMvNjk2CgoKCj4K
PiBJbiBGcmVlQlNEWzFdIHdlIG9ubHkgcmVzZXJ2ZSB0aGUgZmlyc3QgMiBNaUIgb2YgRFJBTSAo
d2UgZG9u4oCZdCBjYXJlCj4gYWJvdXQgUlYzMikgaWYgdGhlcmUgaXMgbm8gcmVzZXJ2ZWQgbWVt
b3J5IG5vZGUgY292ZXJpbmcgdGhlIERSQU0gYmFzZQo+IGFkZHJlc3MsIHdoaWNoIGF2b2lkcyB0
aGlzIGlzc3VlLiBUaGUgb25seSBkb3duc2lkZSB3aXRoIHRoYXQgYXBwcm9hY2gKPiBpcyB0aGF0
IGlmIGZpcm13YXJlIG9jY3VwaWVzIGEgZGlmZmVyZW50IHJlZ2lvbiB0aGFuIHRoZSBiZWdpbm5p
bmcgb2YKPiBEUkFNIChvciB0aGVyZSBpcyBubyBmaXJtd2FyZSByZXNpZGVudCBpbiB0aGUgc3Vw
ZXJ2aXNvcuKAmXMgcGh5c2ljYWwKPiBhZGRyZXNzIHNwYWNlLCBhcyBpcyB0aGUgY2FzZSBmb3Ig
YSB2aXJ0dWFsaXNlZCBndWVzdCkgdGhlbiBpdAo+IHVubmVjZXNzYXJpbHkgcmVzZXJ2ZXMgdGhh
dCBmaXJzdCAyIE1pQiwgYnV0IHRoYXTigJlzIG5vdCBhIGh1Z2UgZGVhbCwKPiBhbmQgY2Fu4oCZ
dCBiZSBhdm9pZGVkIHNvIGxvbmcgYXMgQkJMIGNvbnRpbnVlcyB0byBleGlzdCAod2VsbCwgSSBn
dWVzcwo+IHlvdSBjb3VsZCBwcm9iZSB0aGUgU0JJIGltcGxlbWVudGF0aW9uIElEIGlmIHlvdSBy
ZWFsbHkgY2FyZWQgYWJvdXQKPiB0aGF0LCBidXQgSeKAmXZlIHlldCB0byBoZWFyIG9mIGEgcGxh
dGZvcm0gd2hlcmUgdGhlIFNCSSBpbXBsZW1lbnRhdGlvbiwKPiBpZiBpdCBleGlzdHMsIGlzbuKA
mXQgYXQgdGhlIHN0YXJ0IG9mIERSQU0sIGFuZCBpZiB5b3XigJlyZSB2aXJ0dWFsaXNpbmcKPiB0
aGVuIHlvdSBwcm9iYWJseSBoYXZlIGVub3VnaCBEUkFNIHRoYXQgeW91IGRvbuKAmXQgbm90aWNl
IDIgTWlCIGdvaW5nCj4gbWlzc2luZykuCj4KPiBKZXNzCj4KPiBbMV0gaHR0cHM6Ly9naXRodWIu
Y29tL2ZyZWVic2QvZnJlZWJzZC1zcmMvYmxvYi9tYWluL3N5cy9yaXNjdi9yaXNjdi9tYWNoZGVw
LmMjTDU1NC1MNTY4Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
