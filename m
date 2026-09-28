Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08205C9833E
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 08:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bsxnta2ynd24XhC05r80/7NjJ6tI9xv4ZrB9mjlMTZ8=; b=GMuhEjpsder0xo
	wvXAY25vg90eZ9WWl2KhAv/ITXGQiVNSbn+TOKqumJd3nmA/UUds3FLdqPvHmKP23r0ukDHW/HMGK
	hGAS+cpEZrgR23FieT0ACWW5iUK0601QhQN5dJ2y41Wmg+QaGGWipxzO89hldIQIjaswm0vSYtRiB
	LLQBFWtXwNm6FldgOCh5x8Ed+t4omKfAwUIUJF7OGzu7puGrKCjEs/HRvmSCLv/UqJsoTZK2RQnvN
	ppdlQHn3eptBDMJywi/bsd6z0bQnEG6hvIzp1dryhwGXQfOiSaGKP+T+O5HrcXUyj7no/Hato5xex
	1fo8CSQIHzn9bSY+1EKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB6wT-000000007sL-3Efu;
	Mon, 28 Sep 2026 08:42:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB6wT-000000007s8-0ggc
	for linux-riscv@lists.infradead.org;
	Mon, 28 Sep 2026 08:42:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 346BF433E3
	for <linux-riscv@lists.infradead.org>; Mon, 28 Sep 2026 08:42:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B2F51F0089F
	for <linux-riscv@lists.infradead.org>; Mon, 28 Sep 2026 08:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790584952;
	bh=Sn6tDoFYWxK2ewNYx+8E/CdQ5QB/1Ewh3VOvTMWnBPg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=m8BmGDstNuOkdEoFfKUa026lUHmrWYRP9CvGM7PHq8QSh6Fy/EN7VkFmwFo7H5gpc
	 9IhuAa7VGOXqrnDGc6Zg9PLV2IOHUVmRiHS5WgJmO/IjYdNmK/rDQ+PDJi2JNhg+Ml
	 pxO1Rt2+tdj3DHaiyEs7sbxTzPitswdrQblbhqnzBwobR8qPebdwHdwFzbIoPJPo4f
	 gwvkRolqoafl/QPt6djlUDs5sV+HXMOIp0ZxNHceKjgaGmDVeQk1rgC8ry/JpZhhiQ
	 sOxXzN0ixZn87p06mSAS8rhNyW7oOFvyhCi2Q68P782fjSMCjqWPVOIZsVMr7TfJI3
	 jb8Gwp0a4JeAg==
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485933b24c3so1600828f8f.0
        for <linux-riscv@lists.infradead.org>; Mon, 28 Sep 2026 01:42:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz4hXhrc9PrfM7OdITeGFvZuFQvFGGH18BYfKOnJI5o2rWYrFCYLRk1KMDIoiUECd5ZTrjE0PYCzJJXJQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYLudR1PNlwnsHzn5/dJ+qBSr8tGnSnFn6Rx0gXtzqGceLgTXuFf
	fiyliuJXBIHxTZCPucm4057GaS/4+FJPQrkRIr+ntsKnl4/y1zwBRXxsc6+rllAnN9Sq5cGDRFd
	qIWlmJdMh6c4OEawfiDelCvwGch4uI4Y=
X-Received: by 2002:a05:6000:25c2:b0:487:2354:d9d5 with SMTP id
 ffacd0b85a97d-488717240c7mr25172189f8f.55.1790584950591; Mon, 28 Sep 2026
 01:42:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260816070049.2097442-1-guoren@kernel.org> <20260816070049.2097442-2-guoren@kernel.org>
 <20260908222349.GA2324870@ax162> <CAJF2gTRYaiskhtZckt9ccRqv7an+OBKE34N=0uR3uKW9F8r6kA@mail.gmail.com>
 <arDSR9S3tZPB91Zm@monoceros>
In-Reply-To: <arDSR9S3tZPB91Zm@monoceros>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 28 Sep 2026 16:42:16 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSsHamRg4uRaDEXomR31mv0otXGf_waxqqCbVSZ+gRahQ@mail.gmail.com>
X-Gm-Features: AclHuK9ZTdr4DJypk-aoHyBAEmJJZLWh2enaYUZLnKzosB_yBlbrUCehBGUIVBs
Message-ID: <CAJF2gTSsHamRg4uRaDEXomR31mv0otXGf_waxqqCbVSZ+gRahQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] riscv: smp: Move enum ipi_message_type to asm/smp.h
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Nathan Chancellor <nathan@kernel.org>, tglx@kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, palmer@dabbelt.com, pjw@kernel.org, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, daniel.lezcano@kernel.org, 
	anup@brainfault.org, hui.wang@canonical.com, samuel.holland@sifive.com
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

T24gTW9uLCBTZXAgMjEsIDIwMjYgYXQgMjo0NeKAr1BNIFV3ZSBLbGVpbmUtS8O2bmlnCjx1Lmts
ZWluZS1rb2VuaWdAYmF5bGlicmUuY29tPiB3cm90ZToKPgo+IE9uIEZyaSwgU2VwIDExLCAyMDI2
IGF0IDA5OjE3OjExQU0gKzA4MDAsIEd1byBSZW4gd3JvdGU6Cj4gPiBPbiBXZWQsIFNlcCA5LCAy
MDI2IGF0IDY6MjPigK9BTSBOYXRoYW4gQ2hhbmNlbGxvciA8bmF0aGFuQGtlcm5lbC5vcmc+IHdy
b3RlOgo+ID4gPgo+ID4gPiBPbiBTdW4sIEF1ZyAxNiwgMjAyNiBhdCAwNzowMDo0NUFNICswMDAw
LCBHdW8gUmVuIHdyb3RlOgo+ID4gPiA+IEZyb206ICJHVU8gUmVuIChYdWFuVGllKSIgPGd1b3Jl
bkBrZXJuZWwub3JnPgo+ID4gPiA+Cj4gPiA+ID4gVGhlIElQSSBtZXNzYWdlIHR5cGUgZW51bWVy
YXRpb24gKGFuZCB0aGVyZWZvcmUgSVBJX01BWCkgaXMgY3VycmVudGx5Cj4gPiA+ID4gcHJpdmF0
ZSB0byBhcmNoL3Jpc2N2L2tlcm5lbC9zbXAuYy4gIFNldmVyYWwgSVBJIHByb3ZpZGVycyBuZWVk
IHRvIGtub3cKPiA+ID4gPiB0aGUgZXhhY3QgbnVtYmVyIG9mIElQSXMgdGhhdCB0aGUgYXJjaGl0
ZWN0dXJlIHJlcXVpcmVzLCBzbyBtb3ZlIHRoZQo+ID4gPiA+IGVudW0gaW50byB0aGUgcHVibGlj
IGhlYWRlci4KPiA+ID4gPgo+ID4gPiA+IFRoaXMgaXMgYSBwdXJlIGNvZGUgbW92ZW1lbnQgd2l0
aCBubyBmdW5jdGlvbmFsIGNoYW5nZS4KPiA+ID4KPiA+ID4gT3RoZXIgdGhhbiBhIGJ1aWxkIGJy
ZWFrYWdlIHdpdGggYWxsbW9kY29uZmlnIDopIC1uZXh0IGhhcyB0aGlzIGNoYW5nZQo+ID4gPiBh
cyBjb21taXQgMWFlOTFkYzM5N2ViICgicmlzY3Y6IHNtcDogTW92ZSBlbnVtIGlwaV9tZXNzYWdl
X3R5cGUgdG8KPiA+ID4gYXNtL3NtcC5oIiksIHdoZXJlIGl0IGJyZWFrcyBhbGxtb2Rjb25maWcg
d2l0aCBzZXZlcmFsIGVycm9ycyBhbG9uZyB0aGUKPiA+ID4gbGluZXMgb2Y6Cj4gPiA+Cj4gPiA+
ICAgSW4gZmlsZSBpbmNsdWRlZCBmcm9tIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsv
bWRwL210a19tZHBfbTJtLmM6MjA6Cj4gPiA+ICAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRp
YXRlay92cHUvbXRrX3ZwdS5oOjYzOjk6IGVycm9yOiByZWRlY2xhcmF0aW9uIG9mIGVudW1lcmF0
b3IgJ0lQSV9NQVgnCj4gPiA+ICAgICAgNjMgfCAgICAgICAgIElQSV9NQVgsCj4gPiA+ICAgICAg
ICAgfCAgICAgICAgIF5+fn5+fn4KPiA+ID4gICBJbiBmaWxlIGluY2x1ZGVkIGZyb20gaW5jbHVk
ZS9saW51eC9zbXAuaDoxMTksCj4gPiA+ICAgICAgICAgICAgICAgICAgICBmcm9tIGluY2x1ZGUv
bGludXgvaW50ZXJydXB0X3JjLmg6MTcsCj4gPiA+ICAgICAgICAgICAgICAgICAgICBmcm9tIGlu
Y2x1ZGUvbGludXgvc3BpbmxvY2suaDo2MCwKPiA+ID4gICAgICAgICAgICAgICAgICAgIGZyb20g
aW5jbHVkZS9saW51eC9zY2hlZC5oOjM4LAo+ID4gPiAgICAgICAgICAgICAgICAgICAgZnJvbSBp
bmNsdWRlL2xpbnV4L3JhdGVsaW1pdC5oOjYsCj4gPiA+ICAgICAgICAgICAgICAgICAgICBmcm9t
IGluY2x1ZGUvbGludXgvZGV2X3ByaW50ay5oOjE2LAo+ID4gPiAgICAgICAgICAgICAgICAgICAg
ZnJvbSBpbmNsdWRlL2xpbnV4L2RldmljZS5oOjE1LAo+ID4gPiAgICAgICAgICAgICAgICAgICAg
ZnJvbSBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL21kcC9tdGtfbWRwX20ybS5jOjg6
Cj4gPiA+ICAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zbXAuaDoyNzo5OiBub3RlOiBwcmV2aW91
cyBkZWZpbml0aW9uIG9mICdJUElfTUFYJyB3aXRoIHR5cGUgJ2VudW0gaXBpX21lc3NhZ2VfdHlw
ZScKPiA+ID4gICAgICAyNyB8ICAgICAgICAgSVBJX01BWAo+ID4gPiAgICAgICAgIHwgICAgICAg
ICBefn5+fn5+Cj4gPiA+Cj4gPiA+IFNvIG9uZSBvZiB0aGVzZSBuZWVkcyB0byBjaGFuZ2UuCj4g
Pgo+ID4gSSBwcmVmZXIgdG8ga2VlcCBJUElfTUFYIGZvciBTTVAgYW5kIHJlbmFtZSBJUElfTUFY
IGluIG10a192cHUuaCB0bwo+ID4gVlBVX0lQSV9NQVgsIGNvbnNpc3RlbnQgd2l0aCBTQ1BfSVBJ
X01BWCBpbiBtdGtfc2NwLmguCj4KPiBUaGF0J3Mgd2h5IHVzaW5nIGRyaXZlciBzcGVjaWZpYyBw
cmVmaXhlcyBhcmUgZ3JlYXQuIFdoeSBub3QKPiBNVEtfVlBVX0lQSV9NQVggb3Igc29tZXRoaW5n
IGFsb25nIHRoZXNlIGxpbmVzPwoKSSBhZ3JlZSB0aGF0IGEgZHJpdmVyLXNwZWNpZmljIHByZWZp
eCBzdWNoIGFzIE1US19WUFVfIHdvdWxkIGJlCmNsZWFyZXIuIE9uZSBjb3JyZWN0aW9uIHRvIG15
IGVhcmxpZXIgcmVwbHk6IHRoZSBwYXRjaCB1c2VzCklQSV9WUFVfTUFYLCBub3QgVlBVX0lQSV9N
QVguIFRoaXMgZm9sbG93cyB0aGUgZXhpc3RpbmcgSVBJX1ZQVV9JTklUCm5hbWluZyBpbiBtdGtf
dnB1Lmg7IHRoZSBvdGhlciBpZGVudGlmaWVycyB1c2UgcHJlZml4ZXMgc3VjaCBhcwpJUElfVkRF
Q18gYW5kIElQSV9WRU5DXy4KClRoZSBpbnRlbnQgb2YgdGhpcyBwYXRjaCBbMV0gaXMgdG8gZml4
IHRoZSBJUElfTUFYIGNvbGxpc2lvbiB3aXRoIGEKbWluaW1hbCBjaGFuZ2UuIEFwcGx5aW5nIGEg
Y29uc2lzdGVudCBNVEtfVlBVXyBwcmVmaXggYWNyb3NzIHRoZSBlbnVtCndvdWxkIGJlIGEgYnJv
YWRlciBjbGVhbnVwLCB3aGljaCBJIHRoaW5rIGlzIGJlc3QgaGFuZGxlZCBzZXBhcmF0ZWx5Cmlu
IGNvb3JkaW5hdGlvbiB3aXRoIHRoZSBkcml2ZXIgbWFpbnRhaW5lcnMuCgpbMV0gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYwOTExLWlwaV9tYXgtdjItNi1hNzc4MjZmZjE4OWVAa2Vy
bmVsLm9yZy8KCi0tCkJlc3QgUmVnYXJkcwogR3VvIFJlbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
