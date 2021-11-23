Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03BBBC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Nov 2021 20:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cyzzpGJnpm3NVOsAUbLEFukngloO90knR1XcKh0Ooyc=; b=O+RwEFKQUXDlOs
	GY5FPqiChQbvL+ykmUTdX386r2dlkcebJcXeDZmUK1+efvfYekyqBboRBClrfhtJ2OvQjHaxtloly
	gGalKMIusfmGDLwVI+XsTNKa9WKZbdnnKCxsnMlE6GrThCuUODg0/ASK9GC4PryUM9DctfmXYfp/m
	W9BK+yeqOc1vRosc1PgytP5V7O8Rw7iWWsqFSFjwDj0RsLnkLolj5u1w2K+gV8F4kBkZllkGQeGly
	dIVXviMQAu7DArkScZY1QVxO80MbLwJA4+ka3oNF7OdQgKlwEgWqFzIpooAev2IxFRep8V8RaYD4L
	FS60nfjEIudDY89VyIKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpbz8-003OUO-68; Tue, 23 Nov 2021 20:01:46 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpbz4-003OT0-Nj
 for linux-riscv@lists.infradead.org; Tue, 23 Nov 2021 20:01:44 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id v64so647669ybi.5
 for <linux-riscv@lists.infradead.org>; Tue, 23 Nov 2021 12:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=t/v+kSxz1eiji85Dg0icG/ia7nsKdb5UQNgj4yu1XbA=;
 b=IwRqsQL5HJZ2NNAgvFIi1eoEuWD9tyK9eiN7sz6ZqH03QgbCLrTVI5ymeaYArtG3rQ
 Y6yudwUhG/R2NCwwz3YKxhz7q/2T+Vbe0HqrQpzUKdTBIWvkTcl/GTNfZkdudMkdxRli
 EMoiBdEhsZYYwQAByJnvzZQHmWqqoANt2vLLQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=t/v+kSxz1eiji85Dg0icG/ia7nsKdb5UQNgj4yu1XbA=;
 b=dWXw+bbhs/vP3dnoLvSN+aW5OlfQiuCl/n5sxl18SqQ55z0GVtKmzAptMXKos042+h
 v6DjIVN5SNVcPKiRJQyAjt8wJvuLgx5oItk56rj5fx47WKCvRt4XNwpBZJzQ7SAjOLNK
 OdJxKPvWjf5MpJ9lnDHBG5lXnjBGb9mPsMcPnQpZ1qHiWCYLppNIiVtwr41dlMFeyjfd
 e7HFNXHWRAqXvMyne7il5U7gUYqhulgTuJJ0mjCXe+9FQqISyxF3AZo/QQDeqpjP9l8t
 mnKOVq6bsOPeSmFkIyj5vtbRSxXzUBz+WME24fs7JzDzy//aH5tVOgtmKV6cikqIXw+9
 NgZQ==
X-Gm-Message-State: AOAM530d+jlg52lTic5ahnhLaJbDFkIqeF2wZ+Kh0nIijx4cE8FUKfbj
 jYWUVWbFtI3NqSYuxIgH7vYYu6C24pQuTVoZ5kvx
X-Google-Smtp-Source: ABdhPJxwy2lpaMGVdBaEtmzNC/OVDfQyJQupRowAmg8DGXxghxRN8N4XPTU8UHC6petkfR4neTSFZGp5e6jxHqNyij8=
X-Received: by 2002:a25:73d0:: with SMTP id o199mr8906443ybc.87.1637697700555; 
 Tue, 23 Nov 2021 12:01:40 -0800 (PST)
MIME-Version: 1.0
References: <20211123015717.542631-1-guoren@kernel.org>
 <1913356.JkcO0Xq8vV@diego>
In-Reply-To: <1913356.JkcO0Xq8vV@diego>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 23 Nov 2021 12:01:29 -0800
Message-ID: <CAOnJCU+-WCHA9vgrbcMFsLMaimwJNEXOpqMLS_0Gq_JRM5QNWQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] riscv: Add riscv.fwsz kernel parameter to save
 memory
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Guo Ren <guoren@kernel.org>, Anup Patel <anup@brainfault.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, atishp@rivosinc.com, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>, 
 Philipp Tomsich <philipp.tomsich@vrull.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_120142_904259_4F965751 
X-CRM114-Status: GOOD (  26.02  )
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

T24gVHVlLCBOb3YgMjMsIDIwMjEgYXQgMTE6MzMgQU0gSGVpa28gU3TDvGJuZXIgPGhlaWtvQHNu
dGVjaC5kZT4gd3JvdGU6Cj4KPiBIaSBHdW8sCj4KPiBBbSBEaWVuc3RhZywgMjMuIE5vdmVtYmVy
IDIwMjEsIDAyOjU3OjE0IENFVCBzY2hyaWViIGd1b3JlbkBrZXJuZWwub3JnOgo+ID4gRnJvbTog
R3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+ID4KPiA+IFRoZSBmaXJtd2FyZSBv
ZiByaXNjdiAoc3VjaCBhcyBvcGVuc2JpKSBvY2N1cHkgMk1CKDY0Yml0KSAvCj4gPiA0TUIoMzJi
aXQpIGluIExpbnV4LiBJdCdzIHZlcnkgd2FzdGVmdWwgdG8gc21hbGwgbWVtb3J5IGZvb3Rwcmlu
dAo+ID4gc29jIGNoaXAgc3VjaCBhcyBBbGx3aW5uZXIgRDFzL0YxMzMuIFRoZSBrZXJuZWwgcGFy
YW1ldGVyIGdpdmVzIGEKPiA+IGNoYW5jZSB0byB1c2VycyB0byBzZXQgdGhlIHByb3BlciBzaXpl
IG9mIHRoZSBmaXJtd2FyZSBhbmQgZ2V0Cj4gPiBtb3JlIHRoYW4gMS41TUIgb2YgbWVtb3J5Lgo+
Cj4gaXMgdGhpcyBrZXJuZWwgcGFyYW1ldGVyIGFwcHJvYWNoIGEgcmVzdWx0IG9mIHRoZSBULUhl
YWQgSWNlLVNvQwo+IGN1cnJlbnRseSBsb2FkaW5nIGl0cyBvcGVuU0JJIGZyb20gaW5zaWRlIHRo
ZSBtYWluIHUtYm9vdCB2aWEgZXh0ZnMtbG9hZCwKPiBkaXJlY3RseSBiZWZvcmUgdGhlIGtlcm5l
bCBpdHNlbGYgWzBdID8KCkxvb2tpbmcgYXQgdGhlIGRlZmNvbmZpZ1sxXSwgaXQgbWF5IGJlIFUt
Qm9vdCBTUEwgbm90IFUtQm9vdCBwcm9wZXIuIEkKbWF5IGJlIGxvb2tpbmcgYXQgdGhlIHdyb25n
IGNvbmZpZyB0aG91Z2guCklmIFUtQm9vdCBTUEwgaXMgYWN0dWFsbHkgdXNlZCwgeW91IGRvbid0
IGV2ZW4gbmVlZCB0byBtYW51YWxseSBsb2FkCk9wZW5TQkkgImZ3X2p1bXAiIGJpbmFyeS4KCkFz
IEhlaWtvIHBvaW50ZWQsIHlvdSBzaG91bGQganVzdCBmb2xsb3cgaG93IFUtQm9vdCBTUEwgd29y
a3Mgb24KaGlmaXZlIHVubWF0Y2hlZCAoY3JlYXRpbmcgdGhlIEZJVCBpbWFnZSkKVGhlIHN0YW5k
YXJkIFUtQm9vdCBTUEwgdXNlcyB3aXRoIGZ3X2R5bmFtaWMgd2hpY2ggcHJvdmlkZXMgYWxsIHRo
ZQpmbGV4aWJpbGl0eSB5b3Ugd2FudC4KClsxXSBodHRwczovL2dpdGh1Yi5jb20vVC1oZWFkLVNl
bWkvdS1ib290L2Jsb2IvbWFpbi9jb25maWdzL2ljZV9ldmJfYzkxMF9kZWZjb25maWcKPgo+IEJl
Y2F1c2UgdGhhdCBhcHByb2FjaCBpbiBnZW5lcmFsIGxvb2tzIG5vdCBpZGVhbC4KPgo+IE5vcm1h
bGx5IHlvdSB3YW50IHRoZSBtYWluIHUtYm9vdCBhbHJlYWR5IHJ1bm5pbmcgd2l0aCBsZXNzIHBy
aXZpbGVnZXMKPiBzbyBmaXJtd2FyZSBsaWtlIG9wZW5TQkkgc2hvdWxkJ3ZlIGJlZW4gYWxyZWFk
eSBsb2FkZWQgYmVmb3JlIHRoYXQuCj4gRXZlbiBtb3JlIHRydWUgd2hlbiB5b3UncmUgZW1wbG95
aW5nIG1ldGhvZHMgdG8gcHJvdGVjdCBtZW1vcnkgcmVnaW9ucwo+IGZyb20gbGVzcyBwcml2aWxl
Z2VkIGFjY2Vzcy4KPgo+IEEgbG90IG9mIHNvY3Mgc2V0IHUtYm9vdCBhcyBvcGVuc2JpIHBheWxv
YWQsIGJ1dCBmb3IgdGhlIGV4YW1wbGUgdGhlIEQxCj4gbWFpbmxpbmUgYXBwcm9hY2ggdXNlcyB0
aGUgQWxsd2lubmVyIFRPQzEgaW1hZ2UgZm9ybWF0IHRvIGxvYWQgYm90aAo+IG9wZW5zYmkgYW5k
IHRoZSBtYWluIHVib290IGludG8gbWVtb3J5IGZyb20gaXRzIDFzdCBzdGFnZSBsb2FkZXIuCj4K
Pgo+IE9mIGNvdXJzZSB0aGUgYmVzdCB3YXkgd291bGQgYmUgdG8ganVzdCBtaW1pYyB3aGF0IGEg
bnVtYmVyIG9mCj4gYXJtNjQgYW5kIGFsc28gcmlzY3Ygc29jcyBkbyBhbmQgdXNlIGFscmVhZHkg
ZXhpc3RpbmcgdS1ib290IHV0aWxpdGllcy4KPgo+IFUtQm9vdCBjYW4gY3JlYXRlIGEgRklUIGlt
YWdlIGNvbnRhaW5pbmcgYm90aCBtYWluIHUtYm9vdCwgZHRiIGFuZAo+IGZpcm13YXJlIGltYWdl
cyB0aGF0IGFsbCBnZXQgbG9hZGVkIGZyb20gU1BMIGFuZCBwbGFjZWQgYXQgdGhlIGNvcnJlY3QK
PiBhZGRyZXNzZXMgYmVmb3JlIGhhdmluZyB0aGUgU1BMIGp1bXAgaW50byBvcGVuc2JpIGFuZCBm
cm9tIHRoZXJlCj4gaW50byB1LWJvb3QgWzFdIC4KPgo+IEFuZCBhcyBBbnVwIHdhcyB3cml0aW5n
LCByZXNlcnZlZC1tZW1vcnkgc2hvdWxkIHRoZW4gYmUgdGhlIHdheQo+IHRvIGdvIHRvIHRlbGwg
dGhlIGtlcm5lbCB3aGF0IHJlZ2lvbnMgdG8gb21pdC4KPgo+IEFuZCBtYWlubGluZSB1LWJvb3Qg
aGFzIGFscmVhZHkgdGhlIG1lYW5zIHRvIGV2ZW4gdGFrZSB0aGUgcmVzZXJ2ZWQtbWVtb3J5Cj4g
ZnJvbSB0aGUgZGV2aWNldHJlZSB1c2VkIGJ5IG9wZW5zYmkgYW5kIGNvcHkgaXQgdG8gYSBuZXcg
ZGV2aWNldHJlZSwKPiBpZiB0aGUgc2Vjb25kIG9uZSBpcyBkaWZmZXJlbnQuCj4KPgo+IEhlaWtv
Cj4KPgo+IFswXSBodHRwczovL2dpdGh1Yi5jb20vVC1oZWFkLVNlbWkvdS1ib290L2Jsb2IvbWFp
bi9pbmNsdWRlL2NvbmZpZ3MvaWNlLWM5MTAuaCNMNDYKPiBbMV0gc2VlIHNwbF9pbnZva2Vfb3Bl
bnNiaSgpIGluIGNvbW1vbi9zcGwvc3BsX29wZW5zYmkuYwo+IFsyXSBzZWUgcmlzY3ZfYm9hcmRf
cmVzZXJ2ZWRfbWVtX2ZpeHVwKCkgaW4gYXJjaC9yaXNjdi9saWIvZmR0X2ZpeHVwLmMKPgo+ID4K
PiA+IEd1byBSZW4gKDMpOgo+ID4gICByaXNjdjogUmVtb3ZlIDJNQiBvZmZzZXQgaW4gdGhlIG1t
IGxheW91dAo+ID4gICByaXNjdjogQWRkIGVhcmx5X3BhcmFtIHRvIGRlY3JlYXNlIGZpcm13YXJl
IHJlZ2lvbgo+ID4gICByaXNjdjogQWRkIHJpc2N2LmZ3c3oga2VybmVsIHBhcmFtZXRlcgo+ID4K
PiA+ICAuLi4vYWRtaW4tZ3VpZGUva2VybmVsLXBhcmFtZXRlcnMudHh0ICAgICAgICAgfCAgMyAr
KysKPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BhZ2UuaCAgICAgICAgICAgICAgICAgfCAg
OCArKysrKysrCj4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvaGVhZC5TICAgICAgICAgICAgICAgICAg
ICAgIHwgMTAgKysrLS0tLS0KPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC92bWxpbnV4Lmxkcy5TICAg
ICAgICAgICAgICAgfCAgNSArKy0tCj4gPiAgYXJjaC9yaXNjdi9tbS9pbml0LmMgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgMjMgKysrKysrKysrKysrKysrKy0tLQo+ID4gIDUgZmlsZXMgY2hh
bmdlZCwgMzYgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCj4gPgo+ID4KPgo+Cj4KPgo+
Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4g
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoK
CgotLSAKUmVnYXJkcywKQXRpc2gKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
