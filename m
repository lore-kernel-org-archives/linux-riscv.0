Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD58FE77173
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Dec 2024 18:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rsZC51Jc0sPrBrSsD9/gqAE+oYvMuPCqUH7E5y7eM1E=; b=KELMMv+L/fSPsf
	AunmMT1fMJo6kJg7XneX4UJLP6ATXNq9v9XN+910XktkN0hSydfH1NxJ2DqNrn24UegKUsDRs+n/i
	ub116Cq5Mu2KHf4ytGohgGV3BJrwbwe81wvQ1R8zr1vdbfII8zZmHaBOwLrPY+b/1HC1vX0jP+0Fb
	O+2K0LwbcaHMDh0+fay+EcD/N4vYZRF1mC6zDteiGbSLZetv6ksivw2ppjRu3Zfg/OxRJr9kIT7q2
	SZmpCHGTEIT0ztRBH3/rK85tZo/3KAUw8Y9bGqM7cKvBbqnvCCBzfbfdtkAb0qHs4Mj93FTIvV6WZ
	d/jVHgCp+S6WqAT26LTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJdQe-00000002Twc-2jY8;
	Fri, 06 Dec 2024 18:51:52 +0000
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJdNy-00000002Tfo-06qa
	for linux-riscv@lists.infradead.org;
	Fri, 06 Dec 2024 18:49:07 +0000
Received: by mail-vs1-xe34.google.com with SMTP id ada2fe7eead31-4afc8743f59so370019137.3
        for <linux-riscv@lists.infradead.org>; Fri, 06 Dec 2024 10:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733510944; x=1734115744; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zDe94JiUBLyj5M0Nz9phYsYy6Pis/1/rK91oYvpIJPc=;
        b=j2GN43YmTl0keXjtwATVL6yF8WwlPLRCkCtxrhvTzHmgH2BnC1z0LuQynBYlaWhjP2
         VuxMjZzi5wASCzBDkr57Yxk49HGRsP5fy3wo+Nnj3U/CLcAWrFYk5AIU8mFYwYzXGL9P
         vcJ+teoOrJX5ns6RIv6aQ5AZnAKDlFiUrFQgxxMPokCC8COvvj987G08j5kXIVyvzFXe
         TY1F6ND0eFUVIbg/q5R7kheG9OdlC2E5csQT1nTYMKN5S3R0FjQVXPQyn/0EiYoaoLbp
         puTgdrjzB4gDM+ijGCjvC2q0BaBg2VGrQTZ7owfmEg+AzO/zVYz3Q8T03UyzS0gJBgn9
         e15g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733510944; x=1734115744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zDe94JiUBLyj5M0Nz9phYsYy6Pis/1/rK91oYvpIJPc=;
        b=CyQQO0QrYNny4a80dj+DXNqDG3nD+3PgQtitetFdtVym2TYoLqFgz4WehdlWCX8IcX
         w4WtiPwijEAWyYDD/TAVuXRb+rVlAPedMrJARF4yop/G4AWdn2EmYY+xhGjaD/dJ+mHr
         ko+aLSgvGNA5FIAayhMu3kXbs19QcmndA5JyZ3cIExtKydbMFolJHPoX8nrMK4vDjQtZ
         Dc8028B9aPWGMfqeYUuhp6rJRfqSh8NDknqiLOnRsOxQetXqVDeJ1UIMCttSnb0h/ia6
         Z4T340QzkIg0fgb6FPwPTDcCEC96oCL5qZNIEwub7Gs5W+Erm9Ie3VGHpJnRHYIUmXIM
         3RKA==
X-Forwarded-Encrypted: i=1; AJvYcCXmgtcmtJtK28sWV6CI+jHYOMYGcV/7SsYv5SZMQGJNQ5SSM7oasXYlj/6mD6Os9u16LuHu29E9GJy6PA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzDV7J4jyp3YYgWYsBe2gcq28apLPjDpLCfopghKqj+XQ2CbJkj
	vtXG7NoLW3kmUMF4sjfMyQ2gtWvq+xH3FFT/yQdqNTw3Wd2YD0wmsnpWWPKXuaaKCiWWeNYVhiR
	dKrV2uS0Th/Afv6lUAPoeUbItEzE=
X-Gm-Gg: ASbGncsd/uB+JoCJOFuyo6+1fpOTH2mqbQJtl0ckqiQQyhYx1nPo3Mimrk/HMrWsSMk
	MkWvZrCpLS0jhtPesuJqzQ9ruDE/52YNTpUDPSGkHP4ZO9gr5/oESeDlu5TcEUJA=
X-Google-Smtp-Source: AGHT+IFdVK/2SW0dQA9D83t33zskmSCGjoh2wu0VKQvtZhnyeVm/Yo0+w+FJ+Tpyj82NsvB6vY+bbP+azdgpqNLFeRs=
X-Received: by 2002:a05:6102:3714:b0:4a4:781f:167e with SMTP id
 ada2fe7eead31-4afcaaa5ceemr5632763137.16.1733510944103; Fri, 06 Dec 2024
 10:49:04 -0800 (PST)
MIME-Version: 1.0
References: <20241205103729.14798-1-luxu.kernel@bytedance.com>
 <F94D21C0-8189-404A-B796-BB3C6620AB89@nvidia.com> <315752c5-6129-4c8b-bf8c-0cc26f0ad5c5@redhat.com>
 <CAPYmKFuAKNw86auGUHBOpJDTK4=UFC6z4QMJWO6qn3BWczbuYw@mail.gmail.com>
In-Reply-To: <CAPYmKFuAKNw86auGUHBOpJDTK4=UFC6z4QMJWO6qn3BWczbuYw@mail.gmail.com>
From: Pedro Falcato <pedro.falcato@gmail.com>
Date: Fri, 6 Dec 2024 18:48:52 +0000
Message-ID: <CAKbZUD27ZiA+xX56_FG1WOnaFjEB2LFC0-qgPwf3pXdgErfKtA@mail.gmail.com>
Subject: Re: [External] Re: [RFC PATCH v2 00/21] riscv: Introduce 64K base page
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, ardb@kernel.org, 
	anup@brainfault.org, atishp@atishpatra.org, xieyongji@bytedance.com, 
	lihangjing@bytedance.com, punit.agrawal@bytedance.com, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Linux MM <linux-mm@kvack.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_104906_067860_C914C44E 
X-CRM114-Status: GOOD (  34.65  )
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

T24gRnJpLCBEZWMgNiwgMjAyNCBhdCAxOjQy4oCvUE0gWHUgTHUgPGx1eHUua2VybmVsQGJ5dGVk
YW5jZS5jb20+IHdyb3RlOgo+Cj4gSGkgRGF2aWQsCj4KPiBPbiBGcmksIERlYyA2LCAyMDI0IGF0
IDY6MTPigK9QTSBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4gd3JvdGU6Cj4g
Pgo+ID4gT24gMDYuMTIuMjQgMDM6MDAsIFppIFlhbiB3cm90ZToKPiA+ID4gT24gNSBEZWMgMjAy
NCwgYXQgNTozNywgWHUgTHUgd3JvdGU6Cj4gPiA+Cj4gPiA+PiBUaGlzIHBhdGNoIHNlcmllcyBh
dHRlbXB0cyB0byBicmVhayB0aHJvdWdoIHRoZSBsaW1pdGF0aW9uIG9mIE1NVSBhbmQKPiA+ID4+
IHN1cHBvcnRzIGxhcmdlciBiYXNlIHBhZ2Ugb24gUklTQy1WLCB3aGljaCBvbmx5IHN1cHBvcnRz
IDRLIHBhZ2Ugc2l6ZQo+ID4gPj4gbm93LiBUaGUga2V5IGlkZWEgaXMgdG8gYWx3YXlzIG1hbmFn
ZSBhbmQgYWxsb2NhdGUgbWVtb3J5IGF0IGEKPiA+ID4+IGdyYW51bGFyaXR5IG9mIDY0SyBhbmQg
dXNlIFNWTkFQT1QgdG8gYWNjZWxlcmF0ZSBhZGRyZXNzIHRyYW5zbGF0aW9uLgo+ID4gPj4gVGhp
cyBpcyB0aGUgc2Vjb25kIHZlcnNpb24gYW5kIHRoZSBkZXRhaWxlZCBpbnRyb2R1Y3Rpb24gY2Fu
IGJlIGZvdW5kCj4gPiA+PiBpbiBbMV0uCj4gPiA+Pgo+ID4gPj4gQ2hhbmdlcyBmcm9tIHYxOgo+
ID4gPj4gLSBSZWJhc2Ugb24gdjYuMTIuCj4gPiA+Pgo+ID4gPj4gLSBBZGp1c3QgdGhlIHBhZ2Ug
dGFibGUgZW50cnkgc2hpZnQgdG8gcmVkdWNlIHBhZ2UgdGFibGUgbWVtb3J5IHVzYWdlLgo+ID4g
Pj4gICAgICBGb3IgZXhhbXBsZSwgaW4gU1YzOSwgdGhlIHRyYWRpdGlvbmFsIHZhIGJlaGF2ZXMg
YXM6Cj4gPiA+Pgo+ID4gPj4gICAgICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCj4gPiA+PiAgICAgIHwgcGdkIGluZGV4IHwgcG1kIGluZGV4IHwgcHRlIGlu
ZGV4IHwgb2Zmc2V0IHwKPiA+ID4+ICAgICAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQo+ID4gPj4gICAgICB8IDM4ICAgICAzMCB8IDI5ICAgICAyMSB8IDIw
ICAgICAxMiB8IDExICAgMCB8Cj4gPiA+PiAgICAgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+ID4+Cj4gPiA+PiAgICAgIFdoZW4gd2UgY2hvb3NlIDY0
SyBhcyBiYXNpYyBzb2Z0d2FyZSBwYWdlLCB2YSBub3cgYmVoYXZlcyBhczoKPiA+ID4+Cj4gPiA+
PiAgICAgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+
ID4+ICAgICAgfCBwZ2QgaW5kZXggfCBwbWQgaW5kZXggfCBwdGUgaW5kZXggfCBvZmZzZXQgfAo+
ID4gPj4gICAgICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
Cj4gPiA+PiAgICAgIHwgMzggICAgIDM0IHwgMzMgICAgIDI1IHwgMjQgICAgIDE2IHwgMTUgICAw
IHwKPiA+ID4+ICAgICAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQo+ID4gPj4KPiA+ID4+IC0gRml4IHNvbWUgYnVncyBpbiB2MS4KPiA+ID4+Cj4gPiA+PiBU
aGFua3MgaW4gYWR2YW5jZSBmb3IgY29tbWVudHMuCj4gPiA+Pgo+ID4gPj4gWzFdIGh0dHBzOi8v
bHduLm5ldC9BcnRpY2xlcy85NTI3MjIvCj4gPiA+Cj4gPiA+IFRoaXMgbG9va3MgdmVyeSBpbnRl
cmVzdGluZy4gQ2FuIHlvdSBjYyBtZSBhbmQgbGludXgtbW1Aa3ZhY2sub3JnCj4gPiA+IGluIHRo
ZSBmdXR1cmU/IFRoYW5rcy4KPiA+ID4KPiA+ID4gSGF2ZSB5b3UgdGhvdWdodCBhYm91dCBkb2lu
ZyBpdCBmb3IgQVJNNjQgNEtCIGFzIHdlbGw/IEFSTTY04oCZcyBjb250aWcgUFRFCj4gPiA+IHNo
b3VsZCBoYXZlIHNpbWlsYXIgZWZmZWN0IG9mIFJJU0MtVuKAmXMgU1ZOQVBPVCwgcmlnaHQ/Cj4g
Pgo+ID4gV2hhdCBpcyB0aGUgcmVhbCBiZW5lZml0IG92ZXIgNGsgKyBsYXJnZSBmb2xpb3MvbVRI
UD8KPiA+Cj4gPiA2NEsgY29tZXMgd2l0aCB0aGUgcHJvYmxlbSBvZiBpbnRlcm5hbCBmcmFnbWVu
dGF0aW9uOiBmb3IgZXhhbXBsZSwgYQo+ID4gcGFnZSB0YWJsZSB0aGF0IG9ubHkgb2NjdXBpZXMg
NGsgb2YgbWVtb3J5IHN1ZGRlbmx5IGNvbnN1bWVzIDY0SzsgcXVpdGUKPiA+IGEgZG93bnNpZGUu
Cj4KPiBUaGUgb3JpZ2luYWwgaWRlYSBjb21lcyBmcm9tIHRoZSBwZXJmb3JtYW5jZSBiZW5lZml0
cyB3ZSBhY2hpZXZlZCBvbgo+IHRoZSBBUk0gNjRLIGtlcm5lbC4gV2UgcnVuIHNldmVyYWwgcmVh
bCB3b3JsZCBhcHBsaWNhdGlvbnMgb24gdGhlIEFSTQo+IEFtcGVyZSBBbHRyYSBwbGF0Zm9ybSBh
bmQgZm91bmQgdGhlc2UgYXBwcycgcGVyZm9ybWFuY2UgYmFzZWQgb24gdGhlCj4gNjRLIHBhZ2Ug
a2VybmVsIGlzIHNpZ25pZmljYW50bHkgaGlnaGVyIHRoYW4gdGhhdCBvbiB0aGUgNEsgcGFnZQo+
IGtlcm5lbDoKPiBGb3IgUmVkaXMsIHRoZSB0aHJvdWdocHV0IGhhcyBpbmNyZWFzZWQgYnkgMjUw
JSBhbmQgbGF0ZW5jeSBoYXMKPiBkZWNyZWFzZWQgYnkgNzAlLgo+IEZvciBNeXNxbCwgdGhlIHRo
cm91Z2hwdXQgaGFzIGluY3JlYXNlZCBieSAxNi45JSBhbmQgbGF0ZW5jeSBoYXMKPiBkZWNyZWFz
ZWQgYnkgMTQuNSUuCj4gRm9yIG91ciBvd24gbmV3c3FsIGRhdGFiYXNlLCB0aHJvdWdocHV0IGhh
cyBpbmNyZWFzZWQgYnkgMTYuNSUgYW5kCj4gbGF0ZW5jeSBoYXMgZGVjcmVhc2VkIGJ5IDEzLjgl
Lgo+Cj4gQWxzbywgd2UgaGF2ZSBjb21wYXJlZCB0aGUgcGVyZm9ybWFuY2UgYmV0d2VlbiA2NEsg
YW5kIDRrICsgbGFyZ2UKPiBmb2xpb3MvbVRIUCBvbiBBUk0gTmVvdmVyc2UtTjIuIFRoZSByZXN1
bHQgc2hvd3MgY29uc2lkZXJhYmxlCj4gcGVyZm9ybWFuY2UgaW1wcm92ZW1lbnQgb24gNjRLIGtl
cm5lbCBmb3IgYm90aCBzcGVjY3B1IGFuZCBsbWJlbmNoLAo+IGV2ZW4gd2hlbiA0SyBrZXJuZWwg
ZW5hYmxlcyBUSFAgYW5kIEFSTTY0X0NPTlRQVEU6Cj4gRm9yIHNwZWNjcHUgYmVuY2htYXJrLCA2
NEsga2VybmVsIHdpdGhvdXQgYW55IGh1Z2UgcGFnZXMgb3B0aW1pemF0aW9uCj4gY2FuIHN0aWxs
IGFjaGlldmUgNC4xNyUgaGlnaGVyIHNjb3JlIHRoYW4gNEsga2VybmVsIHdpdGggdHJhbnNwYXJl
bnQKPiBodWdlIHBhZ2VzIGFzIHdlbGwgYXMgQ09OVFBURSBvcHRpbWl6YXRpb24uCj4gRm9yIGxt
YmVuY2gsIDY0SyBrZXJuZWwgYWNoaWV2ZXMgNzUuOTglIGxvd2VyIG1lbW9yeSBtYXBwaW5nCj4g
bGF0ZW5jeSgxNk1CKSB0aGFuIDRLIGtlcm5lbCB3aXRoIHRyYW5zcGFyZW50IGh1Z2UgcGFnZXMg
YW5kIENPTlRQVEUKPiBvcHRpbWl6YXRpb24sIDg0LjM0JSBoaWdoZXIgbWFwIHJlYWQgb3BlbjJj
bG9zZSBiYW5kd2lkdGgoMTZNQiksIGFuZAo+IDEwLjcxJSBsb3dlciByYW5kb20gbG9hZCBsYXRl
bmN5KDE2TUIpLgo+IEludGVyZXN0aW5nbHksIHNvbWV0aW1lcyBrZXJuZWwgd2l0aCB0cmFuc3Bh
cmVudCBwYWdlcyBzdXBwb3J0IGhhdmUKPiBwb29yZXIgcGVyZm9ybWFuY2UgZm9yIGJvdGggNEsg
YW5kIDY0SyAoZm9yIGV4YW1wbGUsIG1tYXAgcmVhZAo+IGJhbmR3aWR0aCBiZW5jaCkuIFdlIGFz
c3VtZSB0aGlzIGlzIGR1ZSB0byB0aGUgb3ZlcmhlYWQgb2YgaHVnZSBwYWdlcycKPiBjb21iaW5h
dGlvbiBhbmQgY29sbGFwc2UuCj4gQWxzbywgaWYgeW91IGNoZWNrIHRoZSBmdWxsIHJlc3VsdCwg
eW91IHdpbGwgZmluZCB0aGF0IHVzdWFsbHkgdGhlCj4gbGFyZ2VyIHRoZSBtZW1vcnkgc2l6ZSB1
c2VkIGZvciB0ZXN0aW5nIGlzLCB0aGUgYmV0dGVyIHRoZSBwZXJmb3JtYW5jZQo+IG9mIDY0ayBr
ZXJuZWwgaXMgKGNvbXBhcmVkIHRvIDRLIGtlcm5lbCkuIFVubGVzcyB0aGUgbWVtb3J5IHNpemUg
bGllcwo+IGluIGEgcmFuZ2Ugd2hlcmUgNEsga2VybmVsIGNhbiBhcHBseSAyTUIgaHVnZSBwYWdl
cyB3aGlsZSA2NEsga2VybmVsCj4gY2FuJ3QuCj4gSW4gc3VtbWFyeSwgZm9yIHBlcmZvcm1hbmNl
IHNlbnNpdGl2ZSBhcHBsaWNhdGlvbnMgd2hpY2ggcmVxdWlyZQo+IGhpZ2hlciBiYW5kd2lkdGgg
YW5kIGxvd2VyIGxhdGVuY3ksIHNvbWV0aW1lcyA0SyBwYWdlcyB3aXRoIGh1Z2UgcGFnZXMKPiBt
YXkgbm90IGJlIHRoZSBiZXN0IGNob2ljZSBhbmQgNjRrIHBhZ2UgY2FuIGFjaGlldmUgYmV0dGVy
IHJlc3VsdHMuCj4gVGhlIHRlc3QgZW52aXJvbm1lbnQgYW5kIHJlc3VsdCBpcyBhdHRhY2hlZC4K
Pgo+IEFzIFJJU0MtViBoYXMgbm8gbmF0aXZlIDY0SyBNTVUgc3VwcG9ydCwgd2UgaW50cm9kdWNl
IGEgc29mdHdhcmUKPiBpbXBsZW1lbnRhdGlvbiBhbmQgYWNjZWxlcmF0ZSBpdCB2aWEgU3ZuYXBv
dC4gT2YgY291cnNlLCB0aGVyZSB3aWxsIGJlCj4gc29tZSBleHRyYSBvdmVyaGVhZCBjb21wYXJl
ZCB3aXRoIG5hdGl2ZSA2NEsgTU1VLiBUaHVzLCB3ZSBhcmUgYWxzbwo+IHRyeWluZyB0byBwZXJz
dWFkZSB0aGUgUklTQy1WIGNvbW11bml0eSB0byBzdXBwb3J0IHRoZSBleHRlbnNpb24gb2YKPiBu
YXRpdmUgNjRLIE1NVSBbMV0uIFBsZWFzZSBqb2luIHVzIGlmIHlvdSBhcmUgaW50ZXJlc3RlZC4K
PgoKT2ssIHNvIHlvdS4uLiBkaWRuJ3QgdGVzdCB0aGlzIG9uIHJpc2N2PyBBbmQgeW91J3JlIGJh
c2luZyB0aGlzCnBhdGNoc2V0IG9mZiBvZiBhIG5hdGl2ZSA2NEtpQiBwYWdlIHNpemUga2VybmVs
IGJlaW5nIGZhc3RlciB0aGFuIDRLaUIKKyBDT05UUFRFPyBJIGRvbid0IHNlZSBob3cgdGhhdCBt
YWtlcyBzZW5zZT8KCi9tZSBpcyBjb25mdXNlZAoKSG93IG1hbnkgb2YgdGhlc2UgUEFHRV9TSVpF
IHdpbnMgYXJlIHJlbGF0ZWQgdG8gZS5nIHVzZXJzcGFjZSBiYXNpbmcKaXRzIGJ1ZmZlciBzaXpl
cyAob3Igd2hhdGV2ZXIpIG9mZiBvZiB0aGUgc3lzdGVtIHBhZ2Ugc2l6ZT8gV2hlcmUKZXhhY3Rs
eSBhcmUgeW91IGdhaW5pbmcgdGltZSB2ZXJzdXMgdGhlIENPTlRQVEUgc3R1ZmY/CkkgdGhpbmsg
TU0gaW4gZ2VuZXJhbCB3b3VsZCBiZSBiZXR0ZXIgb2ZmIGlmIHdlIHdlcmUgbW9yZSB0cmFuc3Bh
cmVudAp3aXRoIHJlZ2FyZCB0byBDT05UUFRFIGFuZCBwYWdlIHNpemVzIGluc3RlYWQgb2YgaGFu
ZCB3YXZpbmcgd2l0aAoiaGFyZHdhcmUgcGFnZSBzaXplICE9IHNvZnR3YXJlIHBhZ2Ugc2l6ZSIs
IHdoaWNoIGlzIHN1Y2ggYSAqY2hlY2tzCm5vdGVzKiA0LjRCU0QgaWRlYS4uLiA6KSBBdCB0aGUg
dmVyeSBsZWFzdCwgdGhpcyBwYXRjaHNldCBzZWVtcyB0byBnbwphZ2FpbnN0IGFsbCB0aGUgd29y
ayBvbiBiZXR0ZXIgc3VwcG9ydGluZyBsYXJnZSBmb2xpb3MgYW5kIENPTlRQVEUuCgotLSAKUGVk
cm8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
