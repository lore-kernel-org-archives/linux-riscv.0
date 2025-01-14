Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1759EC02183
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 09:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yzPO0O4DCxsYLs11Tj58I81ycoLHEZakGGzzIUki4kM=; b=MQ/7XPlU9UDVNd
	C0etaG8K58H8maAjnYQOGm7KXi01U1hAT7yoj/t57ADYxqKwyMwtsgg8joPPtTN2BCjZQhZUtEqYP
	IZv86ZMnbAKFtQMaPTz3fshiPEjSqvRVjfQYSlJ6pufAkryS6bdpK97GoKzhV3MJWjLu/df2Wlfum
	G8mcfNko6GoadupdUYePt/EmZS19Z+A+f+CgZR8JyZBhWyZdxvwBuhmGEaHVHOv6p9d4iQJlytvpY
	IcZgCR0TCQ7LcAn24W+gkMbcPi5A0nchb+8DNcS8whzBbKpPHzr/JX3hernse/4yNZBKbaMVhrviH
	iaQ3vKtqgpkngiuIbMYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXctP-00000007uQH-07Am;
	Tue, 14 Jan 2025 09:07:23 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXctL-00000007uPm-0DUD
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jan 2025 09:07:20 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2f4448bf96fso6591459a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jan 2025 01:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736845637; x=1737450437; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nih/FIqJzQKn/GSOn17sCvQDSCR7cqVxb0PjKE6ABzk=;
        b=Xy89fBcKF685T35pTBbNI5PN82w9BH8jIiILKyEDbyql4L5e3uNPu+YpqLx/ygBrE6
         /xIbZXKMLYZgsPvb5mjgSZWybmFdelbTbQcTS77j2s6Z2FAEx6DsNFe4C9G7lFw3M4gG
         MGJuXz/Dxil/1EIhbPVGN9WXp4Qqm8q8EySD+fdcZljt2zXDl6c85QGI1Eat6Nu9YL2Y
         f8lyOh8rw0/8dtK8u1a90keUBU4rdch6Bmfm9vE+SS7QtzLvIvidKHUzgCfm0+5HBQK+
         b3uoV5x/fVK3N7HeyVfKl6VOJeFcy8SfQmijWmG8wbO2J3XUeNqThAOvpTpxpWrYEsHW
         dEoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736845637; x=1737450437;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nih/FIqJzQKn/GSOn17sCvQDSCR7cqVxb0PjKE6ABzk=;
        b=Y2DJx3vj7iVjYdUFdyTYqtnOJWyU0QG6Fk8MmLKZ5mChNmtOxY1RDeOP00pY4dzp+9
         oslrMd4wt2ObYnca+0nKJoIjq1TreFU945MIywi8GHvTSgAHrx6b2JFhKP+/9B6qsy3g
         DWecgxTcgR9WeVGOqncNtXLqZk3jcGx5DyYGw7B6XtWbqy0wBccwFm/UetDNIVcyKKrv
         tG6XouQPjtn0BCHW6zwea9wLc+4RyVxDoLsjVfN+X9N/SqF4Iky9SsNnHHCqeED7zCGF
         0e7nrWgrhUMk7kmoY8bFBQ5X9rs5lM8AgaICakN87fExUO4yZZK0Xe1Jh0uaXNTljrsy
         U2TQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2S5diE6UbtNb+1oKPy8XdbPJj0AozzvRqIePU99YAAw6UEiaZ/XlzakN/XxIVV2cSKUC4OdsGIAo+ww==@lists.infradead.org
X-Gm-Message-State: AOJu0YxnwsRp6hzqm/PonFocD0ABm00xjy3RfUyyAnd6uK1ToaohMu8m
	SIvo+mOwOaUMSOmerqIsfC1F+XByno9o17z0Xjq//ejqApxJOAH0rAfk3Fv29jPxgKvYIX4eUrn
	lXqlWKtLR7Z2YSyMqWd8Qa0F9Y/DP0oRo0hF0eQ==
X-Gm-Gg: ASbGncuMTfK4KUselzIoXeoBibENN4BVbIKzEgSmwRpkYRkLnH5NSHfGrBzyHdHJsVy
	TE28iJ0XQtvYFlfhSVDBGYMSTMHJ78T6GWJ7P4/Xgr21OLNyjQ10=
X-Google-Smtp-Source: AGHT+IH+Gh0/xC0ImKRaxHvaa/vL2wP8ItRT4mSediS1fGCZykxW0t/q6on8C8+vUjx4Qh5kQXzHLzZ6z0jVGLIooTI=
X-Received: by 2002:a17:90b:2e0b:b0:2ee:7698:e565 with SMTP id
 98e67ed59e1d1-2f548e9a4bemr35165880a91.8.1736845637417; Tue, 14 Jan 2025
 01:07:17 -0800 (PST)
MIME-Version: 1.0
References: <20250113150933.65121-1-luxu.kernel@bytedance.com>
 <20250113150933.65121-4-luxu.kernel@bytedance.com> <CAAhSdy1UaFVyGMCtGHZZTuEhxGAja=9viN10SbFXKcNwjwJ8yw@mail.gmail.com>
 <CAPYmKFviTHKTH=Me74qvjFwq6JxwiCYwtrpft-jMb_SkyvRuSQ@mail.gmail.com> <CAAhSdy3edVEus88NiTvxQDZqstsCxwGjO-H4XThZcFxCcPGqZA@mail.gmail.com>
In-Reply-To: <CAAhSdy3edVEus88NiTvxQDZqstsCxwGjO-H4XThZcFxCcPGqZA@mail.gmail.com>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Tue, 14 Jan 2025 17:07:06 +0800
X-Gm-Features: AbW1kvbwu3qvUq-XSfO-Es6RgmIM1VCCM2HXcbiIBdg-Qvp2Ir0u4fFuwPHPoUk
Message-ID: <CAPYmKFsTEzs2tPoCYwyj-BXEsfPMs+0XiNEUM+gRORpYbHE4dQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH 3/5] irqchip/riscv-imsic: Use wmb() to
 order normal writes and IPI writes
To: Anup Patel <anup@brainfault.org>
Cc: daniel.lezcano@linaro.org, tglx@linutronix.de, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, lihangjing@bytedance.com, xieyongji@bytedance.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_010719_413984_9251FACE 
X-CRM114-Status: GOOD (  27.66  )
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

T24gVHVlLCBKYW4gMTQsIDIwMjUgYXQgNDo1OeKAr1BNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+IHdyb3RlOgo+Cj4gT24gVHVlLCBKYW4gMTQsIDIwMjUgYXQgMTI6MDnigK9QTSBY
dSBMdSA8bHV4dS5rZXJuZWxAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4gPgo+ID4gSGkgQW51cCwK
PiA+Cj4gPiBJIHdhbnQgdG8gZW5zdXJlIHdoZW4gdGhlIHJlY2VpdmVyIENQVSB0cmFwcyBpbnRv
IGludGVycnVwdCwgaXQgY2FuCj4gPiBzZWUgYWxsIG1lbW9yeSB1cGRhdGVzIG1hZGUgYnkgdGhl
IHNlbmRlciBiZWZvcmUuCj4gPgo+ID4gVGhlIHNtcF9tYl9fYWZ0ZXJfYXRvbWljKCkgdXNlcyAn
ZmVuY2UgcncsIHJ3JyB3aGljaCBvcmRlcnMgbm9ybWFsCj4gPiBtZW1vcnkgcmVhZHMvd3JpdGVz
LiBUaGUgSU1TSUMgd3JpdGUgaXMgYWN0dWFsbHkgSU8gd3JpdGVzIGFuZCBpcyBub3QKPiA+IG9y
ZGVyZWQgYnkgaXQuCj4gPgo+ID4gU28gSSB3b3JyeSBpbiBleHRyZW1lIGNhc2VzLCB0aGUgcmVj
ZWl2ZXIgQ1BVIGNhbiByZWNlaXZlIHRoZSBJUEkKPiA+IGZpcnN0LCBzZWUgbm8gdXBkYXRlcyB0
byBpcGlfbXV4X3BjcHUtPmJpdHMgYW5kIHJldHVybiBpbW1lZGlhdGVseS4KPiA+IFRoZW4gdGhp
cyBJUEkgd2lsbCBub3QgYmUgaGFuZGxlZCB1bnRpbCBhbm90aGVyIElQSSBjb21lcy4KPgo+IFVz
aW5nIHdtYigpIGlzIHN0aWxsIGluYXBwcm9wcmlhdGUgYmVjYXVzZSBpZiB5b3Ugd2FudCB0byBz
aW1wbHkKPiBlbnN1cmUgSU8gd3JpdGVzIGFyZSBub3Qgb3JkZXJlZCBiZWZvcmUgdGhlIG5vcm1h
bCBtZW1vcnkgd3JpdGVzCj4gdGhlbiBqdXN0IGNvbnZlcnQgd3JpdGVsX3JlbGF4ZWQoKSB0byB3
cml0ZSgpLgoKR290IGl0LiBJIHdpbGwgdXNlIHdyaXRlbCgpIGluc3RlYWQuCgpUaGFua3MhCgpY
dSBMdQoKPgo+IFJlZ2FyZHMsCj4gQW51cAo+Cj4gPgo+ID4gQmVzdCBSZWdhcmRzLAo+ID4KPiA+
IFh1IEx1Cj4gPgo+ID4gT24gVHVlLCBKYW4gMTQsIDIwMjUgYXQgMTI6MzTigK9QTSBBbnVwIFBh
dGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gTW9uLCBKYW4g
MTMsIDIwMjUgYXQgODozOeKAr1BNIFh1IEx1IDxsdXh1Lmtlcm5lbEBieXRlZGFuY2UuY29tPiB3
cm90ZToKPiA+ID4gPgo+ID4gPiA+IER1cmluZyBhbiBJUEkgcHJvY2VkdXJlLCB3ZSBuZWVkIHRv
IGVuc3VyZSBhbGwgcHJldmlvdXMgd3JpdGUgb3BlcmF0aW9ucwo+ID4gPiA+IGFyZSB2aXNpYmxl
IHRvIG90aGVyIENQVXMgYmVmb3JlIHNlbmRpbmcgYSByZWFsIElQSS4gV2UgdXNlIHdtYigpIGJh
cnJpZXIKPiA+ID4gPiB0byBlbnN1cmUgdGhpcyBhcyBJTVNJQyBpc3N1ZXMgSVBJIHZpYSBtbWlv
IHdyaXRlcy4KPiA+ID4gPgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFh1IEx1IDxsdXh1Lmtlcm5l
bEBieXRlZGFuY2UuY29tPgo+ID4gPiA+IC0tLQo+ID4gPiA+ICBkcml2ZXJzL2lycWNoaXAvaXJx
LXJpc2N2LWltc2ljLWVhcmx5LmMgfCA2ICsrKysrKwo+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwg
NiBpbnNlcnRpb25zKCspCj4gPiA+ID4KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pcnFj
aGlwL2lycS1yaXNjdi1pbXNpYy1lYXJseS5jIGIvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1p
bXNpYy1lYXJseS5jCj4gPiA+ID4gaW5kZXggNjMwOTdmMmJiYWRmLi5jNjMxN2NiNTU3ZmIgMTAw
NjQ0Cj4gPiA+ID4gLS0tIGEvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1lYXJseS5j
Cj4gPiA+ID4gKysrIGIvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1lYXJseS5jCj4g
PiA+ID4gQEAgLTI5LDYgKzI5LDEyIEBAIHN0YXRpYyB2b2lkIGltc2ljX2lwaV9zZW5kKHVuc2ln
bmVkIGludCBjcHUpCj4gPiA+ID4gIHsKPiA+ID4gPiAgICAgICAgIHN0cnVjdCBpbXNpY19sb2Nh
bF9jb25maWcgKmxvY2FsID0gcGVyX2NwdV9wdHIoaW1zaWMtPmdsb2JhbC5sb2NhbCwgY3B1KTsK
PiA+ID4gPgo+ID4gPiA+ICsgICAgICAgLyoKPiA+ID4gPiArICAgICAgICAqIEVuc3VyZSB0aGF0
IHN0b3JlcyB0byBub3JtYWwgbWVtb3J5IGFyZSB2aXNpYmxlIHRvIHRoZSBvdGhlciBDUFVzCj4g
PiA+ID4gKyAgICAgICAgKiBiZWZvcmUgaXNzdWluZyBJUEkuCj4gPiA+ID4gKyAgICAgICAgKi8K
PiA+ID4gPiArICAgICAgIHdtYigpOwo+ID4gPiA+ICsKPiA+ID4KPiA+ID4gVGhlIGltc2ljX2lw
aV9zZW5kKCkgaXMgY2FsbGVkIHRocm91Z2ggaXBpX211eF9zZW5kX21hc2soKQo+ID4gPiB3aGlj
aCBkb2VzIHNtcF9tYl9fYWZ0ZXJfYXRvbWljKCkgYmVmb3JlIGNhbGxpbmcgc28gbm8gbmVlZAo+
ID4gPiBmb3IgYW55IGJhcnJpZXIgaGVyZS4gQWxzbywgYmFycmllcnMgbmVlZCB0byBiZSBpbi1w
YWlyIHNvIGFkZGluZwo+ID4gPiBhIHNpbmdsZSBiYXJyaWVyIGF0IHJhbmRvbSBsb2NhdGlvbiBp
cyBpbmFwcHJvcHJpYXRlLgo+ID4gPiAoUmVmZXIsIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHVi
L3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL2tlcm5lbC9pcnEv
aXBpLW11eC5jP2g9djYuMTMtcmM3I243OCkKPiA+ID4KPiA+ID4gQmFzZWQgb24gdGhlIGFib3Zl
LCB0aGlzIHBhdGNoIGlzIG5vdCBuZWVkZWQuCj4gPiA+Cj4gPiA+IFJlZ2FyZHMsCj4gPiA+IEFu
dXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
