Return-Path: <SRS0=LGYn=NG=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91124C6786E
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 26 Oct 2018 16:20:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CCEF20665
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 26 Oct 2018 16:20:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KbQqbDGZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lt1Z+vRK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5CCEF20665
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dlf5hCfQvUb2p7C83w4mN+a6nUa0yckLZ/EdV10NiUI=; b=KbQqbDGZPzGwjk
	+5TVH16ZxXYC9rFDKiM6jXxleOzkigyB704OQv0KZLMr8e9TypUOO1wpWkkWBH0zgX613lFJs5z/m
	jkCZjNcZBqwkgK+zEo2NJkiAsv6LstSuTUTdNyJSYBMdmf45X3mE43F73FfA3Fla/5X5vw29nMOrb
	9Lbeo6nPboXerpvejSDBlfEMI8zptVTm8XQPSjoZFq/X6/zFXrytCnVaEW9vXST0N5H3aZ3n5bilV
	w1WvlFYqy7/O+pD+wBU0R7uFbylSbDE0JdZYTbLcm0WIi/U7/rgH2+VB+EuIEP/JF7b7+Y8vQT/Tp
	BQh/eDSOWvbv5xnQQUjg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gG4qq-0008TI-Sc; Fri, 26 Oct 2018 16:20:44 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gG4q9-0006u9-5h
 for linux-riscv@lists.infradead.org; Fri, 26 Oct 2018 16:20:03 +0000
Received: by mail-io1-xd44.google.com with SMTP id q4-v6so1051931iob.8
 for <linux-riscv@lists.infradead.org>; Fri, 26 Oct 2018 09:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RSh7kRhXEWlL4ZPRCJjxv0xc1GMDwLvMmYBKObW+BxY=;
 b=Lt1Z+vRKvPN96sFAhiCv3V4ilmX745GShpjFEpSfTdPVi1e9VKf5vL4y+38ZBwKDNK
 hTQqSWdUlheJLCRdC5o8Fyq2TZtgehHTYXitOhW2hLOV/MHZVRoCmWD665SITrGHhB2W
 OsGS24jJ5YpITuAUZ6OO5DLXv45msCZyLFOfWHGWF+8NZVyu4z+AuQbMxR4LjtWtFKrR
 ygIg/oQh0FCWQ2CxtNIg9vbIatgtBXfSH6pT8TeSEPmsCx/94nK0oGljakj8jOYD2ZVG
 kAr2Rcy03dwNSwsxr2oWKm4HJdb+lG4oWc6Cdbk3ZAw53Jwg5Eqndj3brBmNikV5jXJ3
 FSUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RSh7kRhXEWlL4ZPRCJjxv0xc1GMDwLvMmYBKObW+BxY=;
 b=glmJJfzoMyDkwU10EPQK9pbblGjqwbhjtdNCTXR1qHSXvXGiai5E9+X/ROImaAWv44
 /f2SPVdJ/zLTPhxtrQHZoN8B/4vDDahu9Rk3fvFOavAcNYi4K3IKnd2d0M7E7aptcRiR
 +DoAmdEZ2BK66FXMMOfps2xgfTU1BlKtM8PaO7p9o0HK+rLROJFcajFxmHibvkLFVaBh
 xHs79zulQVGyk4ZpuJWW7RygPal+2awIeMSCu/66k5P8rUtsxviIWDzm4k41EhAzW4Fj
 afOCCpZEoU7Kixrx4c9HlMNe+qAbxS2KKq+f6wD7DZXvHhq69ryiBftz43ssQXdkORt/
 qP1A==
X-Gm-Message-State: AGRZ1gJTtL4SHTiP9paIWN7LsV9U88r3fubDmALmhZJoZBPutKhAQDBZ
 8zv7Edo844fGhuLuIvV0GOeeM/KKk73Jz0yfcJo=
X-Google-Smtp-Source: AJdET5c6dmQ/3sSVFCIHorOsu8btoUVFJt8om/WYDWY3NjyVoTqei7bS3IH/39fxaG8RojiDRK4jyVmeDwPK1wTkZ1c=
X-Received: by 2002:a6b:bf04:: with SMTP id
 p4-v6mr2274617iof.141.1540570789947; 
 Fri, 26 Oct 2018 09:19:49 -0700 (PDT)
MIME-Version: 1.0
References: <mhng-80deacac-267f-4b3a-ac60-4e24f120d86e@palmer-si-x1c4>
 <CAHk-=wimJ+g2O7DND0XZ54XZSrY_aiVWsiyyAXL9T1+=BG9Ptg@mail.gmail.com>
 <41b34e47-57de-bcc1-c86e-8b98f663367a@sifive.com>
In-Reply-To: <41b34e47-57de-bcc1-c86e-8b98f663367a@sifive.com>
From: Zong Li <zongbox@gmail.com>
Date: Sat, 27 Oct 2018 00:19:38 +0800
Message-ID:
 <CA+ZOyaiPpM4gBHGqRcus_TtH-mqZHkvApj1xP0ep5-p81_ffeg@mail.gmail.com>
Subject: Re: [GIT PULL] RISC-V Patches for the 4.20 Merge Window, Part 1
To: paul.walmsley@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181026_092001_261459_C3639000 
X-CRM114-Status: GOOD (  18.71  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: gregkh@linuxfoundation.org, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@sifive.com>, torvalds@linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181026161938.4t2H9dFFGjeI5ClyP5ROlk1ZHST15e3W4CDRBeXpGd0@z>

UGF1bCBXYWxtc2xleSA8cGF1bC53YWxtc2xleUBzaWZpdmUuY29tPiDmlrwgMjAxOOW5tDEw5pyI
Mjbml6Ug6YCx5LqUIOS4iuWNiDk6MzXlr6vpgZPvvJoKPgo+ICsgWm9uZyBMaQo+Cj4gWm9uZywK
Pgo+IE9uIDEwLzI1LzE4IDY6MTIgUE0sIExpbnVzIFRvcnZhbGRzIHdyb3RlOgo+ID4gT24gV2Vk
LCBPY3QgMjQsIDIwMTggYXQgMTo0MiBQTSBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHNpZml2ZS5j
b20+IHdyb3RlOgo+ID4+IEknbSBwcmV0dHkgc3VyZSB0aGlzIGlzIG91ciBsYXJnZXN0IHBhdGNo
IHNldCBzaW5jZSB0aGUgb3JpZ2luYWwga2VybmVsCj4gPj4gY29udHJpYnV0aW9uLCBhbmQgaXQn
cyBjZXJ0YWlubHkgdGhlIG9uZSB3aXRoIHRoZSBtb3N0IGNvbnRyaWJ1dG9ycy4KPiA+PiBXaGls
ZSBJIGRvbid0IGhhdmUgYW55dGhpbmcgZWxzZSBJIGtub3cgSSdtIGdvaW5nIHRvIHN1Ym1pdCBm
b3IgdGhlCj4gPj4gbWVyZ2Ugd2luZG93LCBJIHdvdWxkIGJlIHNvbWV3aGF0IHN1cnByaXNlZCBp
ZiBJIGRpZG4ndCBzY3JldyBhbnl0aGluZwo+ID4+IHVwLgo+ID4gU28gSSdtIG5vdCBlbnRpcmVs
eSBzdXJlIHRoaXMgaXMgYSBzY3Jldy11cCwgYnV0IGl0IGRvZXMgaGF2ZSBzb21lCj4gPiBzaWdu
cyBvZiBiZWluZyBvbmU6Cj4gPgo+ID4+ICAgICAgICBsaWI6IEFkZCB1bW9kZGkzIGFuZCB1ZGl2
bW9kZGk0IG9mIEdDQyBsaWJyYXJ5IHJvdXRpbmVzCj4gPiBXZSBoYXZlICphY3RpdmVseSogdHJp
ZWQgdG8gYXZvaWQgbmVlZGluZyB1bW9kZGkzIGFuZCBmcmllbmRzLCBhbmQKPiA+IGhhdmUgc28g
ZmFyIHN1Y2NjZWVkZWQgaW4gZG9pbmcgdGhhdCBhY3Jvc3MgbWFueSBkaWZmZXJlbnQKPiA+IGFy
Y2hpdGVjdHVyZXMsIGFuZCBtYW55IG1hbnkgeWVhcnMuCj4gPgo+ID4gQW5kIHdoZW4gd2UgX2hh
dmVfIGFkZGVkIGl0LCB3ZSd2ZSBhZGRlZCBpdCBhcyBhcmNoaXRlY3R1cmUtc3BlY2lmaWMKPiA+
IG9wdGltaXplZCByb3V0aW5lcyB3aGVuIHBlb3BsZSByZWFsbHkgbmVlZCBpdC4KPiA+Cj4gPiBU
aGUgcmVhc29uIHRvIGF2b2lkIGEgZnVsbCA2NC1ieS02NCBkaXZpZGUgaXMgdGhhdAo+ID4KPiA+
ICAgKGEpIGl0IGlzIHJlYWxseSBleHBlbnNpdmUKPiA+Cj4gPiAgIChiKSBjb2RlIHRoYXQgbmVl
ZHMgaXQgaXMgYWxtb3N0IGFsd2F5cyBhY3R1YWxseSB3cm9uZwo+ID4KPiA+IEFsbW9zdCBhbHdh
eXMsIHRoZSA2NC1iaXQgZGl2aWRlIHR1cm5zIG91dCB0byBiZSBlbnRpcmVseSBwb2ludGxlc3Ms
Cj4gPiBhbmQgdGhlIGNvZGUgY2FuIGJlIHdyaXR0ZW4gYXMgYSAobXVjaCBjaGVhcGVyKSA2NC1i
eS0zMiBkaXZpZGUKPiA+IGluc3RlYWQgdXNpbmcgdGhlIGZ1bmN0aW9ucyBpbiA8YXNtL2Rpdi5o
PiBpbnN0ZWFkLgo+ID4KPiA+IERvZXMgUklTQy1WIF9yZWFsbHlfIG5lZWQgdGhhdCBkaXNndXN0
aW5nIGZ1bGwgNjQtYml0IGRpdmlkZSwgb3Igd2FzCj4gPiB0aGUgYWRkaXRpb24gb2YgdGhhdCBz
aW1wbHkgYSAid2UgZGlkbid0IGtub3cgYmV0dGVyLCBhbmQgZGlkbid0Cj4gPiByZWFsaXplIGp1
c3QgaG93IGV4cGVuc2l2ZSBhbmQgd3JvbmcgaXQgaXMiPwo+Cj4KPiBJIGJlbGlldmUgdGhlIHJl
cXVlc3QgZm9yIHRob3NlIHJvdXRpbmVzIGNhbWUgZnJvbSB5b3U6Cj4KPgo+IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2xrbWwvNzc5YjBiMjVjYzk2MTAxYTUyNTQwMmYzODA1M2RiNWUyZjM2MGQ2
Zi4xNTM4NTM1NTI4LmdpdC56b25nYm94QGdtYWlsLmNvbS8KPgo+Cj4gRG8geW91IGluIGZhY3Qg
bmVlZCBhIGZ1bGwgNjQtYnktNjQgYml0IGRpdmlkZSBpbiB5b3VyIERNQSBkcml2ZXIsIG9yCj4g
Y2FuIHlvdQo+Cj4gZ2V0IGF3YXkgd2l0aCB1c2luZyBkaXZfdTY0KCkgZXQgYWwuPwo+Cj4KPiBo
dHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9s
aW51eC5naXQvdHJlZS9pbmNsdWRlL2xpbnV4L21hdGg2NC5oI24xMjMKPgoKVGhhbmtzIGZvciB0
aGUgaW5mb3JtYXRpb24uIFRoZSBETUEgZHJpdmVyIGNvdWxkIHVzZSB0aGUgNjQtYnktMzIKZGl2
aWRlcyBpbiBmYWN0IG9mIHRoZSBzaXR1YXRpb24uIEkgd291bGQgc3VibWl0IGEgcGF0Y2ggdG8g
ZHJvcCB0aGlzLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
