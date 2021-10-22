Return-Path: <SRS0=Id5u=PK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB3B5C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 10:41:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72FD6610FF
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 10:41:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 72FD6610FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bluespec.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0D3QNp8AZUEZ1pp6L8GsdxdVxOtRouL6gfW5tPv1QJM=; b=2Tb9j8SVJKlNs6
	5/ebE4nuPPN5vfGG2BcuDmLjonoeYliIvHdWjIxaS/4+84EPoLdLb0XSbGwpvjryiSChrrTlDEyvO
	Bzwsqih7VxXl+2nboH5P4NjfY01R19HpWrU9+Apqa5QqXs2BipNodl2+JGtFLNZVQHdfPzjJDeFwp
	MKut2PMhefKRTwb20L4l7D1JBJff/OuKdRW1z2YsE/Ifr7o39vrhZoKAJvSZwUh8m6yqdIITI+upu
	A/EXZNe5v62gATdSpSKWk2wHTQhmrYFUz6n2Si3HHnhPJworsy2F77NKlMUv6fia2CufVcPxeqH5t
	3y4TvyfdmVtNFkIoP9PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdryo-00AZPx-Oq; Fri, 22 Oct 2021 10:40:54 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdryl-00AZOr-A9
 for linux-riscv@lists.infradead.org; Fri, 22 Oct 2021 10:40:52 +0000
Received: by mail-qv1-xf34.google.com with SMTP id k19so2138929qvm.13
 for <linux-riscv@lists.infradead.org>; Fri, 22 Oct 2021 03:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bluespec-com.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=sUVjp8ylZZVSdfkE1WPLfIZTKc+gVGNAh/eKy9l2f8A=;
 b=BqkJ/dhwTBmp2BOeOgHLCnxzSAVykRsIWMhm8Hs+vm2yxtc0TQfa2DvmoFWsBrUT60
 XJsSHQ23WjE2nN7xkVOgI7rq34K3Ao9w7tygPYZZmEI3L7L3Zxn73qPwuOwUxgdLJtmP
 /UXqnfieObs9ucNqHx1B5ULpnGgS0JzqwwMjRl65266+Ngv3PhWjeW6NrEsXwnmKMSwI
 XJtPmtRKAmvhwfd3ib+S1eDZDOTFuEVzJbtLlZppiNrjYgIpjwN0fogEVllsAHfxAwjF
 /Ufo+alPYEFgUMHASM9ETDBnMYC+LXdlMYx2KjxzNrlTwdX1SHL7zFdm8Tmk+kxaPuHi
 pEZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=sUVjp8ylZZVSdfkE1WPLfIZTKc+gVGNAh/eKy9l2f8A=;
 b=jWFHJc71jAAaq6+X3tP/Xe8TIU0wrGokNUOQ6TXaHWVFn3FOa9UbFnzrY/S7+3KRWU
 0As6mdjgHh4MwIrStroxY7kxc8okBSUjsPm6wiMjpkAw6PHz1vb3y0UyKtH/PquzAKJh
 IT86Uinm3E1oyZvy26FUL9XiSYY3pWTE0gjVv4CVFThpL5G0hntZORRtt7UywWhJ/tif
 IU9SxFtJepOCmdN/kqiovOP2v4t4XujPHZzv6aewnL1Uw6Uew3lIAX5/M5x2jzsIzG/+
 dYePGABbYCJnwcL3t24AHxsR7gCZ0XfmG+oQkDaPfIJuNDgfFEFNwUmbcl11vDOhWl6D
 NKPA==
X-Gm-Message-State: AOAM5339mATOlbjpdWqiDvnEIiJ+/O0JDwFP/muo/1TVsImHIKH3JYpK
 wH3SN40cidv0bl/2MBTScU0l
X-Google-Smtp-Source: ABdhPJxSmVzGUzviEqV3mXU210bnW76vIBwtO040YCDRErzisjptsK6wp4mcgfwVGWptW68yO+zHQw==
X-Received: by 2002:a05:6214:e41:: with SMTP id
 o1mr11046829qvc.0.1634899249145; 
 Fri, 22 Oct 2021 03:40:49 -0700 (PDT)
Received: from bruce.bluespec.com ([154.3.44.94])
 by smtp.gmail.com with ESMTPSA id g1sm3877775qkd.89.2021.10.22.03.40.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Oct 2021 03:40:48 -0700 (PDT)
Date: Fri, 22 Oct 2021 06:40:46 -0400
From: Darius Rad <darius@bluespec.com>
To: Vincent Chen <vincent.chen@sifive.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [RFC PATCH v8 09/21] riscv: Add task switch support for vector
Message-ID: <YXKVLtT2U2g3JDrm@bruce.bluespec.com>
Mail-Followup-To: Vincent Chen <vincent.chen@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <cover.1631121222.git.greentime.hu@sifive.com>
 <0e65c165e3d54a38cbba01603f325dca727274de.1631121222.git.greentime.hu@sifive.com>
 <c81267bc-4c91-3978-8c1f-78925c46c78b@bluespec.com>
 <CAHCEehJ1uuSFqFWreS1kh+fR5GFfnEycdLMe+4FHXpFsHrRUvA@mail.gmail.com>
 <YVRp5uWFGQrwBpgf@bruce.bluespec.com>
 <CAHCEeh+dA9243=PwNtYvyU1Myu_E8YO2g4UNACxRogQ=6UavLQ@mail.gmail.com>
 <YVxZspMO7rAvtMBS@bruce.bluespec.com>
 <3c9797f6-2fd3-5530-ba34-6e4c4deec984@sifive.com>
 <YXFGAqTzHMeQA+R+@bruce.bluespec.com>
 <CABvJ_xjMyZ3HDLinMvY88HtKywb=cwhQNOOCZYTEeL407Gyz2A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABvJ_xjMyZ3HDLinMvY88HtKywb=cwhQNOOCZYTEeL407Gyz2A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_034051_455604_69C0ED6D 
X-CRM114-Status: GOOD (  46.65  )
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

T24gRnJpLCBPY3QgMjIsIDIwMjEgYXQgMTE6NTI6MDFBTSArMDgwMCwgVmluY2VudCBDaGVuIHdy
b3RlOgo+IE9uIFRodSwgT2N0IDIxLCAyMDIxIGF0IDY6NTAgUE0gRGFyaXVzIFJhZCA8ZGFyaXVz
QGJsdWVzcGVjLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gV2VkLCBPY3QgMjAsIDIwMjEgYXQgMDY6
MDE6MzFQTSAtMDcwMCwgUGF1bCBXYWxtc2xleSB3cm90ZToKPiA+ID4gSGVsbG8gRGFyaXVzLAo+
ID4gPgo+ID4gPiBPbiBUdWUsIDUgT2N0IDIwMjEsIERhcml1cyBSYWQgd3JvdGU6Cj4gPiA+Cj4g
PiA+ID4gT24gTW9uLCBPY3QgMDQsIDIwMjEgYXQgMDg6MzY6MzBQTSArMDgwMCwgR3JlZW50aW1l
IEh1IHdyb3RlOgo+ID4gPiA+ID4gRGFyaXVzIFJhZCA8ZGFyaXVzQGJsdWVzcGVjLmNvbT4g5pa8
IDIwMjHlubQ55pyIMjnml6Ug6YCx5LiJIOS4i+WNiDk6Mjjlr6vpgZPvvJoKPiA+ID4gPiA+ID4K
PiA+ID4gPiA+ID4gT24gVHVlLCBTZXAgMjgsIDIwMjEgYXQgMTA6NTY6NTJQTSArMDgwMCwgR3Jl
ZW50aW1lIEh1IHdyb3RlOgo+ID4gPiA+ID4gPiA+IERhcml1cyBSYWQgPGRhcml1c0BibHVlc3Bl
Yy5jb20+IOaWvCAyMDIx5bm0OeaciDEz5pelIOmAseS4gCDkuIvljYg4OjIx5a+r6YGT77yaCj4g
PiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gT24gOS84LzIxIDE6NDUgUE0sIEdyZWVudGlt
ZSBIdSB3cm90ZToKPiA+ID4gPiA+ID4gPiA+ID4gVGhpcyBwYXRjaCBhZGRzIHRhc2sgc3dpdGNo
IHN1cHBvcnQgZm9yIHZlY3Rvci4gSXQgc3VwcG9ydHMgcGFydGlhbCBsYXp5Cj4gPiA+ID4gPiA+
ID4gPiA+IHNhdmUgYW5kIHJlc3RvcmUgbWVjaGFuaXNtLiBJdCBhbHNvIHN1cHBvcnRzIGFsbCBs
ZW5ndGhzIG9mIHZsZW4uCj4gPiA+Cj4gPiA+IFsgLi4uIF0KPiA+ID4KPiA+ID4gPiA+ID4gPiA+
IFNvIHRoaXMgd2lsbCB1bmNvbmRpdGlvbmFsbHkgZW5hYmxlIHZlY3RvciBpbnN0cnVjdGlvbnMs
IGFuZCBhbGxvY2F0ZQo+ID4gPiA+ID4gPiA+ID4gbWVtb3J5IGZvciB2ZWN0b3Igc3RhdGUsIGZv
ciBhbGwgcHJvY2Vzc2VzLCByZWdhcmRsZXNzIG9mIHdoZXRoZXIgdmVjdG9yCj4gPiA+ID4gPiA+
ID4gPiBpbnN0cnVjdGlvbnMgYXJlIHVzZWQ/Cj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBZ
ZXMsIGl0IHdpbGwgZW5hYmxlIHZlY3RvciBpZiBoYXNfdmVjdG9yKCkgaXMgdHJ1ZS4gVGhlIHJl
YXNvbiB0aGF0IHdlCj4gPiA+ID4gPiA+ID4gY2hvb3NlIHRvIGVuYWJsZSBhbmQgYWxsb2NhdGUg
bWVtb3J5IGZvciB1c2VyIHNwYWNlIHByb2dyYW0gaXMgYmVjYXVzZQo+ID4gPiA+ID4gPiA+IHdl
IGFsc28gaW1wbGVtZW50IHNvbWUgY29tbW9uIGZ1bmN0aW9ucyBpbiB0aGUgZ2xpYmMgc3VjaCBh
cyBtZW1jcHkKPiA+ID4gPiA+ID4gPiB2ZWN0b3IgdmVyc2lvbiBhbmQgaXQgaXMgY2FsbGVkIHZl
cnkgb2Z0ZW4gYnkgZXZlcnkgcHJvY2Vzcy4gU28gdGhhdAo+ID4gPiA+ID4gPiA+IHdlIGFzc3Vt
ZSBpZiB0aGUgdXNlciBwcm9ncmFtIGlzIHJ1bm5pbmcgaW4gYSBDUFUgd2l0aCB2ZWN0b3IgSVNB
Cj4gPiA+ID4gPiA+ID4gd291bGQgbGlrZSB0byB1c2UgdmVjdG9yIGJ5IGRlZmF1bHQuIElmIHdl
IGRpc2FibGUgaXQgYnkgZGVmYXVsdCBhbmQKPiA+ID4gPiA+ID4gPiBtYWtlIGl0IHRyaWdnZXIg
dGhlIGlsbGVnYWwgaW5zdHJ1Y3Rpb24sIHRoYXQgbWlnaHQgYmUgYSBidXJkZW4gc2luY2UKPiA+
ID4gPiA+ID4gPiBhbG1vc3QgZXZlcnkgcHJvY2VzcyB3aWxsIHVzZSB2ZWN0b3IgZ2xpYmMgbWVt
Y3B5IG9yIHNvbWV0aGluZyBsaWtlCj4gPiA+ID4gPiA+ID4gdGhhdC4KPiA+ID4gPiA+ID4KPiA+
ID4gPiA+ID4gRG8geW91IGhhdmUgYW55IGV2aWRlbmNlIHRvIHN1cHBvcnQgdGhlIGFzc2VydGlv
biB0aGF0IGFsbW9zdCBldmVyeSBwcm9jZXNzCj4gPiA+ID4gPiA+IHdvdWxkIHVzZSB2ZWN0b3Ig
b3BlcmF0aW9ucz8gIE9uZSBjb3VsZCBlYXNpbHkgYXJndWUgdGhhdCB0aGUgY29udmVyc2UgaXMK
PiA+ID4gPiA+ID4gdHJ1ZTogbm8gZXhpc3Rpbmcgc29mdHdhcmUgdXNlcyB0aGUgdmVjdG9yIGV4
dGVuc2lvbiBub3csIHNvIG1vc3QgbGlrZWx5IGEKPiA+ID4gPiA+ID4gcHJvY2VzcyB3aWxsIG5v
dCBiZSB1c2luZyBpdC4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBHbGliYyB1c3RyZWFtaW5nIGlzIGp1
c3Qgc3RhcnRpbmcgc28geW91IGRpZG4ndCBzZWUgc29mdHdhcmUgdXNpbmcgdGhlCj4gPiA+ID4g
PiB2ZWN0b3IgZXh0ZW5zaW9uIG5vdyBhbmQgdGhpcyBwYXRjaHNldCBpcyB0ZXN0aW5nIGJhc2Vk
IG9uIHRob3NlCj4gPiA+ID4gPiBvcHRpbWl6ZWQgZ2xpYmMgdG9vLiBWaW5jZW50IENoZW4gaXMg
d29ya2luZyBvbiB0aGUgZ2xpYmMgdmVjdG9yCj4gPiA+ID4gPiBzdXBwb3J0IHVwc3RyZWFtaW5n
IGFuZCB3ZSB3aWxsIGFsc28gdXBzdHJlYW0gdGhlIHZlY3RvciB2ZXJzaW9uIGdsaWJjCj4gPiA+
ID4gPiBtZW1jcHksIG1lbWNtcCwgbWVtY2hyLCBtZW1tb3ZlLCBtZW1zZXQsIHN0cmNtcCwgc3Ry
bGVuLiBUaGVuIHdlIHdpbGwKPiA+ID4gPiA+IHNlZSBwbGF0Zm9ybSB3aXRoIHZlY3RvciBzdXBw
b3J0IGNhbiB1c2UgdmVjdG9yIHZlcnNpb24gbWVtKiBhbmQgc3RyKgo+ID4gPiA+ID4gZnVuY3Rp
b25zIGF1dG9tYXRpY2FsbHkgYmFzZWQgb24gaWZ1bmMgYW5kIHBsYXRmb3JtIHdpdGhvdXQgdmVj
dG9yCj4gPiA+ID4gPiB3aWxsIHVzZSB0aGUgb3JpZ2luYWwgb25lIGF1dG9tYXRpY2FsbHkuIFRo
ZXNlIGNvdWxkIGJlIGRvbmUgdG8gc2VsZWN0Cj4gPiA+ID4gPiB0aGUgY29ycmVjdCBvcHRpbWl6
ZWQgZ2xpYmMgZnVuY3Rpb25zIGJ5IGlmdW5jIG1lY2hhbmlzbS4KPiA+ID4KPiA+ID4gSW4geW91
ciByZXBseSwgSSBub3RpY2VkIHRoYXQgeW91IGRpZG4ndCBhZGRyZXNzIEdyZWVudGltZSdzIHJl
c3BvbnNlCj4gPiA+IGhlcmUuICBCdXQgdGhpcyBsb29rcyBsaWtlIHRoZSBrZXkgaXNzdWUuICBJ
ZiBjb21tb24gbGlicmFyeSBmdW5jdGlvbnMgYXJlCj4gPiA+IHZlY3Rvci1hY2NlbGVyYXRlZCwg
d291bGRuJ3QgaXQgbWFrZSBzZW5zZSB0aGF0IGFsbW9zdCBldmVyeSBwcm9jZXNzIHdvdWxkCj4g
PiA+IHdpbmQgdXAgdXNpbmcgdmVjdG9yIGluc3RydWN0aW9ucz8gIEFuZCB0aHVzIHRoZXJlIHdv
dWxkbid0IGJlIG11Y2ggcG9pbnQKPiA+ID4gdG8gc2tpcHBpbmcgdGhlIHZlY3RvciBjb250ZXh0
IG1lbW9yeSBhbGxvY2F0aW9uPwo+ID4gPgo+ID4KPiA+IFRoaXMgaXNzdWUgd2FzIGFkZHJlc3Nl
ZCBpbiB0aGUgdGhyZWFkIHJlZ2FyZGluZyBJbnRlbCBBTVggSSBsaW5rZWQgdG8gaW4gYQo+ID4g
cHJldmlvdXMgbWVzc2FnZS4gIEkgZG9uJ3QgYWdyZWUgdGhhdCB0aGlzIGlzIHRoZSBrZXkgaXNz
dWU7IGl0IGlzIG9uZSBvZiBhCj4gPiBudW1iZXIgb2YgaXNzdWVzLiAgV2hhdCBpZiBJIGRvbid0
IHdhbnQgdG8gdGFrZSB0aGUgcG90ZW50aWFsCj4gPiBwb3dlci9mcmVxdWVuY3kgaGl0IGZvciB0
aGUgdmVjdG9yIHVuaXQgZm9yIGEgd29ya2xvYWQgdGhhdCwgYXQgYmVzdCwgdXNlcwo+ID4gaXQg
Zm9yIHRoZSBvY2Nhc2lvbmFsIG1lbWNweT8gIFdoYXQgaWYgdGhlIGFsbG9jYXRpb24gZmFpbHMs
IGhvdyB3aWxsIHRoYXQKPiAKPiBIaSBEYXJpdXMsCj4gVGhlIG1lbWNweSBmdW5jdGlvbiBzZWVt
cyBub3QgdG8gYmUgb2NjYXNpb25hbGx5IHVzZWQgaW4gdGhlIHByb2dyYW1zCj4gYmVjYXVzZSBt
YW55IGZ1bmN0aW9ucyBpbiBHbGliYyB1c2UgbWVtY3B5KCkgdG8gY29tcGxldGUgdGhlIG1lbW9y
eQo+IGNvcHkuIEkgdXNlIHRoZSBmb2xsb3dpbmcgc2ltcGxlIGNhc2UgYXMgYW4gZXhhbXBsZS4K
PiB0ZXN0LmMKPiB2b2lkIG1haW4odm9pZCkgewo+ICAgICByZXR1cm47Cj4gfQo+IFRoZW4sIHdl
IGNvbXBpbGUgaXQgYnkgImdjYyB0ZXN0LmMgLW8gYS5vdXQiIGFuZCBleGVjdXRlIGl0LiBJbiB0
aGUKPiBleGVjdXRpb24sIHRoZSBtZW1jcHkoKSBoYXMgYmVlbiBjYWxsZWQgdW5leHBlY3RlZGx5
LiBJdCBpcyBiZWNhdXNlCj4gbWFueSBsaWJjIGluaXRpYWxpemVkIGZ1bmN0aW9ucyB3aWxsIGJl
IGV4ZWN1dGVkIGJlZm9yZSBlbnRlcmluZyB0aGUKPiB1c2VyLWRlZmluZWQgbWFpbiBmdW5jdGlv
bi4gT25lIG9mIHRoZSBleGFtcGxlIGlzIF9fbGliY19zZXR1cF90bHMoKSwKPiB3aGljaCBpcyBj
YWxsZWQgYnkgX19saWJjX3N0YXJ0X21haW4oKS4gVGhlIF9fbGliY19zZXR1cF90bHMoKSB3aWxs
Cj4gdXNlIG1lbWNweSgpIGR1cmluZyB0aGUgcHJvY2VzcyBvZiBjcmVhdGluZyB0aGUgRHluYW1p
YyBUaHJlYWQgVmVjdG9yCj4gKERUVikuCj4gCj4gVGhlcmVmb3JlLCBJIHRoaW5rIHRoZSBtZW1j
cHkoKSBpcyB3aWRlbHkgdXNlZCBpbiBtb3N0IHByb2dyYW1zLgo+IAoKWW91J3JlIG1pc3Npbmcg
bXkgcG9pbnQuICBOb3QgZXZlcnkgKGFueT8pIHByb2dyYW0gc3BlbmRzIGEgbWFqb3JpdHkgb2Yg
dGhlCnRpbWUgZG9pbmcgbWVtY3B5KCksIGFuZCBldmVuIGlmIGEgcHJvZ3JhbSBkaWQsIGFsbCBv
ZiBteSBwb2ludHMgYXJlIHN0aWxsCnZhbGlkLgoKUGxlYXNlIHJlYWQgdGhlIGRpc2N1c3Npb24g
aW4gdGhlIHRocmVhZCBJIHJlZmVyZW5jZWQgYW5kIHRoZSBxdWVzdGlvbnMgaW4KbXkgcHJpb3Ig
bWVzc2FnZS4KCj4gPiBnZXQgcmVwb3J0ZWQgdG8gdXNlciBzcGFjZSAoaGludDogbm90IHdlbGwp
PyAgQWNjb3JkaW5nIHRvIEdyZWVudGltZSwKPiA+IFJJU0MtViB2ZWN0b3IgaXMgc2ltaWxhciB0
byBBUk0gU1ZFLCB3aGljaCBhbGxvY2F0ZXMgbWVtb3J5IGZvciBjb250ZXh0Cj4gPiBzdGF0ZSBv
biBmaXJzdCB1c2UgYW5kIG5vdCB1bmNvbmRpdGlvbmFsbHkgZm9yIGFsbCBwcm9jZXNzZXMuCj4g
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
