Return-Path: <SRS0=9QI1=LA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7927DC4743E
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jun 2021 18:15:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CB3C61377
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jun 2021 18:15:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CB3C61377
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zO9+KbXStCU4+D6fh4Msapct6QAAFcwiLmEnBYJKhv8=; b=wADcSiKqmzZnoO4CUiDpSh5GTE
	ujFwF8t4S58NLZiXYtLe4196uj1MLlsOBch3COfWv4iIL1/XXjVnD4Npedp8tei9SHBlxAds4IoRu
	S/iiZQYIE/S4nPt3YraQqfjVllW5A3JMw6NE3c5P2TBUSiv4HoNSFPHjTbWDXyM6oE5J91pKx7gYQ
	Lko5dE/uF7UOQ+gMsmNIROMV1scbZQMEphyx+7gw1wDDkaBDfXw3h8YJuFw4VQat8Gr84iDvrrz7m
	Qsq1i1wlxyUa9HS+hxuOOAjuYTyaT6my7lHIDkWh5JPDpobFdTueXf3YY4Ujb1ZgafhfL+z1I20B1
	l8CqOLAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpxIH-000dss-Ah; Sun, 06 Jun 2021 18:14:41 +0000
Received: from mailgate.ics.forth.gr ([139.91.1.2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpxID-000dsM-O0
 for linux-riscv@lists.infradead.org; Sun, 06 Jun 2021 18:14:39 +0000
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
 by mailgate.ics.forth.gr (8.15.2/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 156IEZVt052678
 for <linux-riscv@lists.infradead.org>; Sun, 6 Jun 2021 21:14:35 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; d=ics.forth.gr; s=av; c=relaxed/simple;
 q=dns/txt; i=@ics.forth.gr; t=1623003270; x=1625595270;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=npEuPgoCmYcLXuGAj3lk3Z8Qz7Q4T7SBKRpOBm5UgpU=;
 b=hHDfDtMKpOyRtSkZhq7xBlnJ04RmBqARosUatJPpiYEEAzkTDz1/XCIEtmvaKA2H
 daXiSsGxxQHvUqI8eom59MU6ie0qGSaGBwLNtNm1B791BSOh5ZYYDoNjNRrVJh1w
 zGcZkeCFcE44viI0P1K0UjoF2LFnUgiFsRgdLXVL54xUxenQC+d6wNaXB2aBZ6oJ
 cChED7Low7gW8a8BEwjJxbKbqatGFFSxC/Zuk6C1LBZgC0amSvQsvocRGyVjX6Gp
 T3vfxsBf3pR3EtsL74RYViiMqz1ybhsQJM/M4gMqT9TneJcaHArVYCC1ZJrvZ/7Z
 iS5aqRjvzHkdA5Fx7bSqNw==;
X-AuditID: 8b5b014d-96ef2700000067b6-54-60bd108627a9
Received: from enigma.ics.forth.gr (webmail.ics.forth.gr [139.91.151.35])
 by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id
 53.4A.26550.6801DB06; Sun,  6 Jun 2021 21:14:30 +0300 (EEST)
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Sun, 06 Jun 2021 21:14:28 +0300
From: Nick Kossifidis <mick@ics.forth.gr>
To: Guo Ren <guoren@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Drew Fustini <drew@beagleboard.org>,
 Anup Patel <anup.patel@wdc.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, wefu@redhat.com,
 lazyparser@gmail.com, linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, linux-sunxi@lists.linux.dev,
 Guo Ren <guoren@linux.alibaba.com>, Paul
 Walmsley <paul.walmsley@sifive.com>,
 Nick Kossifidis <mick@ics.forth.gr>, Benjamin Koch <snowball@c3pb.de>,
 Matteo Croce <mcroce@linux.microsoft.com>, Wei Fu <tekkamanninja@gmail.com>
Subject: Re: [PATCH RFC 0/3] riscv: Add DMA_COHERENT support
Organization: FORTH
In-Reply-To: <CAJF2gTR4FXRbp7oky-ypdVJba6btFHpp-+dPyJStRaQX_-5rzg@mail.gmail.com>
References: <1621400656-25678-1-git-send-email-guoren@kernel.org>
 <20210519052048.GA24853@lst.de>
 <CAJF2gTTjwB4U-NxCtfgMA5aR2HzoQtA8a51W5UM1LHGRbjz9pg@mail.gmail.com>
 <20210519064435.GA3076809@x1> <20210519065352.GA31590@lst.de>
 <CAJF2gTR4FXRbp7oky-ypdVJba6btFHpp-+dPyJStRaQX_-5rzg@mail.gmail.com>
Message-ID: <29733b0931d9dd6a2f0b6919067c7efe@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.3.16
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKIsWRmVeSWpSXmKPExsXSHT1dWbdNYG+CwbZz2hZPPkxks7i3Yhm7
 xYu9jSwWxx/tYrFYufook8WlL9dYLDp2fWWxuLxrDpvFts8tbBZT9u1is7j4az6jRfO7c+wW
 WzeuY7Rom8VvMWvxbXaL++vOsVm07J/C4iDo8e73MkaPe2+fMHnsnHWX3WPBplKPh5suMXls
 WtXJ5rHzoaXHr+1HmTw2L6n3eLF5JqPH7psNbB7v911l87jUfJ3d4/MmOY/2A91MAfxRXDYp
 qTmZZalF+nYJXBlrFu5mKejkqdj+4xtbA+Ntzi5GTg4JAROJ2xs2MnUxcnEICRxjlOhseskG
 kTCVmL23kxHE5hUQlDg58wkLiM0sYCEx9cp+RghbXqJ562xmEJtFQFVi1r9JTCA2m4CmxPxL
 B8HqRYBqfh/tZIWoX80q8fpdGIgtLGAjcejKerA4v4CwxKe7F8FsToFAiddTpjFDHLSRSeLJ
 pN3MEEe4SNy+spgR4jgViQ+/H7B3MXJwiALZm+cqTWAUnIXk1FlITp2F5NQFjMyrGAUSy4z1
 MpOL9dLyi0oy9NKLNjGCY5bRdwfj7c1v9Q4xMnEwHmKU4GBWEuH1ktmTIMSbklhZlVqUH19U
 mpNafIhRmoNFSZyXV29CvJBAemJJanZqakFqEUyWiYNTqoFpG4fN0ocMwZzHjpt3dH+Oni5Z
 Jp2zljU7XeLuS966xVtu5/cvmrI2+OHaiX8qnNcumsxw4tkUA7+EGV2x8a2bRbMSfP7m/DTc
 FDTniM2PhH3bpVceX7z/1cPLSfzfuV7wX1rupSGR78T0UuLeI2GxJIuWI9r51zqf5M2I7ply
 6aR/4NtU4UcC3oW7+9KPhpf9m1bI4lhhapt00coxfsG2wjXSDnfLEr4XqZrMuVbiFsti4P+0
 vSdzzzO1GYtfMrbFqXjNevAvt+rHxF8nj/U9uVPzb9tqlbOTpaR+WbH93P32e43mjq+PnZM3
 z34hpRiZfv2uF79EEUvpo09sCXHcPkcz+JLf7QndFLY5YDOvEktxRqKhFnNRcSIARuBeSEgD
 AAA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_111438_182736_59FDB085 
X-CRM114-Status: GOOD (  15.55  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

zqPPhM65z4IgMjAyMS0wNS0yMCAwNDo0NSwgR3VvIFJlbiDOrc6zz4HOsc+IzrU6Cj4gT24gV2Vk
LCBNYXkgMTksIDIwMjEgYXQgMjo1MyBQTSBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4g
d3JvdGU6Cj4+IAo+PiBPbiBUdWUsIE1heSAxOCwgMjAyMSBhdCAxMTo0NDozNVBNIC0wNzAwLCBE
cmV3IEZ1c3Rpbmkgd3JvdGU6Cj4+ID4gVGhpcyBwYXRjaCBzZXJpZXMgbG9va3MgbGlrZSBpdCBt
aWdodCBiZSB1c2VmdWwgZm9yIHRoZSBTdGFyRml2ZSBKSDcxMDAKPj4gPiBbMV0gWzJdIHRvbyBh
cyBpdCBoYXMgcGVyaXBoZXJhbHMgb24gYSBub24tY29oZXJlbnQgaW50ZXJjb25uZWN0LiBHTUFD
LAo+PiA+IFVTQiBhbmQgU0RJTyByZXF1aXJlIHRoYXQgdGhlIEwyIGNhY2hlIG11c3QgYmUgbWFu
dWFsbHkgZmx1c2hlZCBhZnRlcgo+PiA+IERNQSBvcGVyYXRpb25zIGlmIHRoZSBkYXRhIGlzIGlu
dGVuZGVkIHRvIGJlIHNoYXJlZCB3aXRoIFU3NCBjb3JlcyBbMl0uCj4+IAo+PiBOb3QgdG9vIG11
Y2gsIGdpdmVuIHRoYXQgdGhlIFNpRml2ZSBsaW5lYWdlIENQVXMgaGF2ZSBhbiB1bmNhY2hlZAo+
PiB3aW5kb3csIHRoYXQgaXMgYSB0b3RhbGx5IGRpZmZlcmVudCB3YXkgdG8gYWxsb2NhdGUgdW5j
YWNoZWQgbWVtb3J5Lgo+IEl0J3MgYSB2ZXJ5IGJpZyBNSVBTIHNtZWxsLiBXaGF0J3MgdGhlIGF0
dHJpYnV0ZSBvZiB0aGUgdW5jYWNoZWQKPiB3aW5kb3c/ICh1bmNhY2hlZCArIHN0cm9uZy1vcmRl
ci8gdW5jYWNoZWQgKyB3ZWFrLCBtb3N0IHZlbmRvcnMgc3RpbGwKPiB1c2UgQVhJIGludGVyY29u
bmVjdCwgaG93IHRvIGRlYWwgd2l0aCBhIGJ1ZmZlcmFibGUgYXR0cmlidXRlPykgSW4KPiBmYWN0
LCBjdXN0b21lcnMnIGRyaXZlcnMgdXNlIGRpZmZlcmVudCB3YXlzIHRvIGRlYWwgd2l0aCBETUEg
bWVtb3J5IGluCj4gbm9uLWNvaGVyZW50IFNPQy4gTW9zdCByaXNjdiBTT0MgdmVuZG9ycyBhcmUg
ZnJvbSBBUk0sIHNvIGdpdmluZyB0aGVtCj4gdGhlIHNhbWUgd2F5IGluIERNQSBtZW1vcnkgaXMg
YSBzbWFydCBjaG9pY2UuIFNvIHVzaW5nIFBURSBhdHRyaWJ1dGVzCj4gaXMgbW9yZSBzdWl0YWJs
ZS4KPiAKPiBTZWU6Cj4gaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2L3ZpcnR1YWwtbWVtb3J5L2Js
b2IvbWFpbi9zcGVjcy82MTEtdmlydHVhbC1tZW1vcnktZGlmZi5wZGYKPiA0LjQuMQo+IFRoZSBk
cmFmdCBzdXBwb3J0cyBjdXN0b20gYXR0cmlidXRlIGJpdHMgaW4gUFRFLgo+IAoKTm90IG9ubHkg
aXQgZG9lc24ndCBzdXBwb3J0IGN1c3RvbSBhdHRyaWJ1dGVzIG9uIFBURXM6CgoiQml0czYz4oCT
NTQgYXJlIHJlc2VydmVkIGZvciBmdXR1cmUgc3RhbmRhcmQgdXNlIGFuZCBtdXN0IGJlIHplcm9l
ZCBieSAKc29mdHdhcmUgZm9yIGZvcndhcmQgY29tcGF0aWJpbGl0eS4iCgpJdCBhbHNvIGdvZXMg
ZnVydGhlciB0byBzYXkgdGhhdDoKCiJpZiBhbnkgb2YgdGhlc2UgYml0cyBhcmUgc2V0LCBhIHBh
Z2UtZmF1bHQgZXhjZXB0aW9uIGlzIHJhaXNlZCIKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
