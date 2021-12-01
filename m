Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4272FC433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Dec 2021 02:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/AR2VCynZqvlRZfEF7bctirKfxl6cmOtaZBJ0LCWGn8=; b=CMo++8nTI6mP+f
	vZlS0HqXBR9qM8DEIi0PyHJ4NNAolJx8c16JHUloCyHgwG2JjGjxkS/tkVq1lvcbN9mvaoTw7X3ON
	J7w7zUuJP/hlBtfMzOi0wz7OlqObGRkx4KNJJ4TCrIO3V6nyGc9kNFWntGMWpH0sz0tfSqbLyX+Kn
	twif84mxxO7bybrsAnpHJJLj0fhHgVp8Nu62we2kssfWCbxJ1hwZp3pYXAZnKVvaR2Ma33fCiexGo
	ie7Yc+7GLc3nnjF+G34+S5ZqzH0fJYk3SYchI+Y0B2e6pxsI5GAZPWT8FhbvBeWIbxnbbkNd2qFVn
	lcOeJvNi48oV3onxWk1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msFpt-007LUM-6R; Wed, 01 Dec 2021 02:59:09 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msFpp-007LSv-To
 for linux-riscv@lists.infradead.org; Wed, 01 Dec 2021 02:59:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638327542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4BVobWc8X9sJwevm+EBIIDhYcgiVeWUwDPJ5DXAQgTo=;
 b=cWtulnh5dqC6nnBBcAJL7cl1N66Gu/BTD104sAF5pvjvVWtz2otW3xoGZNlISu6F9YA+M9
 T3sV5vsoyoWFMo3unFfEELBmShxQTNZvgd60QTkPJiev5H5HeqndG/I73AmrC7MhnhqOqy
 sX1+7oGAoSXE4pC2ewvMnTrYC0MHWhs=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-573-1RE0QQ-_P8eTe2GRccdRLQ-1; Tue, 30 Nov 2021 21:58:58 -0500
X-MC-Unique: 1RE0QQ-_P8eTe2GRccdRLQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 m17-20020aa7d351000000b003e7c0bc8523so18795060edr.1
 for <linux-riscv@lists.infradead.org>; Tue, 30 Nov 2021 18:58:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4BVobWc8X9sJwevm+EBIIDhYcgiVeWUwDPJ5DXAQgTo=;
 b=32GdkTsgs1OculyGQLmzT+/90LSPVe3ptzRoUX+fZP7GF2V1ywrkyKRCg3DrSS+YeE
 RUdESZ+FCYaaxN9cYgrUgt+QuxnDnygcQjD34o5Ky/a1n//5zBh9TD/RnbAhNsr+5jg7
 oxnZPyB/z4rtIdgXNsrhcwIx4QWhsLr4UnToLeqfMkJfjxc4eWT+XeEfxYw53TBaY5jt
 OJsHrcHCrxMKU4fJd/pgav3XVCMCzMqTU7hY/UUPJsu6Dlk969dpxfRd5CLOZyvFj9fC
 eH/iRtbVwqQVApV+RNf8eo8eNeHG5C3aD6tErapMX7/zqGzrXYIQEDY+V4/gREgjG/1o
 MhUQ==
X-Gm-Message-State: AOAM5305GDa8cnElK/MMBe8gzdlC2SjmrK5GdSO0MB4JbYnbutCBnfs8
 Y0gW+6BseJwbjBn6yFuuicYHKvgXyGCa/Qe28GeaI1dbnPrgOmGUkP8s+yov1WGn8l+Kus4CHg0
 TE3PonfsKMk5hyKtEZNETmKYprkLHmB29D7nRiHzvwqMs
X-Received: by 2002:a50:fb16:: with SMTP id d22mr4465040edq.367.1638327537736; 
 Tue, 30 Nov 2021 18:58:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzL7+hFiZ7XkfzJIfqci5Jn+cAtPo+VQOJrHSI1MBuWP0rWY9c55kf1rq+0YMOYPx4EWtWCJSODBb+rZA+f8Wk=
X-Received: by 2002:a50:fb16:: with SMTP id d22mr4465020edq.367.1638327537553; 
 Tue, 30 Nov 2021 18:58:57 -0800 (PST)
MIME-Version: 1.0
References: <20211129014007.286478-1-wefu@redhat.com>
 <20211129014007.286478-2-wefu@redhat.com>
 <10924379.EydaIB8Zb3@diego>
In-Reply-To: <10924379.EydaIB8Zb3@diego>
From: Wei Fu <wefu@redhat.com>
Date: Wed, 1 Dec 2021 10:58:46 +0800
Message-ID: <CA+YCwKnwkdWY2b6XtAwM=ZmQ=mVMMDnG3s746GQA_DLhLVtBSg@mail.gmail.com>
Subject: Re: [PATCH V4 1/2] dt-bindings: riscv: add MMU Standard Extensions
 support for Svpbmt
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Anup Patel <anup.patel@wdc.com>, atishp04@gmail.com, 
 Palmer Dabbelt <palmer@dabbelt.com>, Guo Ren <guoren@kernel.org>, 
 =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Christoph Hellwig <hch@lst.de>, 
 Liu Shaohua <liush@allwinnertech.com>,
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Drew Fustini <drew@beagleboard.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 taiten.peng@canonical.com, Aniket Ponkshe <aniket.ponkshe@canonical.com>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
 Gordan Markus <gordan.markus@canonical.com>, Guo Ren <guoren@linux.alibaba.com>,
 Arnd Bergmann <arnd@arndb.de>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime@cerno.tech>, 
 Daniel Lustig <dlustig@nvidia.com>, Greg Favor <gfavor@ventanamicro.com>, 
 Andrea Mondelli <andrea.mondelli@huawei.com>,
 Jonathan Behrens <behrensj@mit.edu>, 
 Xinhaoqu <xinhaoqu@huawei.com>, Bill Huffman <huffman@cadence.com>, 
 Nick Kossifidis <mick@ics.forth.gr>, Allen Baum <allen.baum@esperantotech.com>,
 Josh Scheid <jscheid@ventanamicro.com>, Richard Trauben <rtrauben@gmail.com>, 
 Anup Patel <anup@brainfault.org>, Rob Herring <robh+dt@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wefu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_185906_176340_32D83DD2 
X-CRM114-Status: GOOD (  18.48  )
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

SGkgSGVpa28sClRoYW5rcyBmb3IgeW91ciBjb3JyZWN0aW9uICwgIHRoaXMgd2FzIG15IHR5cG8g
d2hlbiBJIGRpZCB0aGUgInNlZCIgdG8KcmVwbGFjZSB0aGUgd29yZC4KSSBuZWVkIHRvIG1ha2Ug
YSBWNSBBU0FQCgpPbiBXZWQsIERlYyAxLCAyMDIxIGF0IDI6NDYgQU0gSGVpa28gU3TDvGJuZXIg
PGhlaWtvQHNudGVjaC5kZT4gd3JvdGU6Cj4KPiBBbSBNb250YWcsIDI5LiBOb3ZlbWJlciAyMDIx
LCAwMjo0MDowNiBDRVQgc2NocmllYiB3ZWZ1QHJlZGhhdC5jb206Cj4gPiBGcm9tOiBXZWkgRnUg
PHdlZnVAcmVkaGF0LmNvbT4KPiA+Cj4gPiBQcmV2aW91cyBwYXRjaCBoYXMgYWRkZWQgc3ZwYm10
IGluIGFyY2gvcmlzY3YgYW5kIGFkZCAicmlzY3Ysc3ZwbWJ0Igo+ID4gaW4gdGhlIERUIG1tdSBu
b2RlLiBVcGRhdGUgZHQtYmluZGluZ3MgcmVsYXRlZCBwcm9wZXJ0eSBoZXJlLgo+ID4KPiA+IFNp
Z25lZC1vZmYtYnk6IFdlaSBGdSA8d2VmdUByZWRoYXQuY29tPgo+ID4gQ28tZGV2ZWxvcGVkLWJ5
OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KPiA+IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4g
PGd1b3JlbkBrZXJuZWwub3JnPgo+ID4gQ2M6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5v
cmc+Cj4gPiBDYzogUGFsbWVyIERhYmJlbHQgPHBhbG1lckBkYWJiZWx0LmNvbT4KPiA+IENjOiBS
b2IgSGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPgo+ID4gLS0tCj4gPiAgRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2NwdXMueWFtbCB8IDEwICsrKysrKysrKysKPiA+
ICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvY3B1cy55YW1sIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2NwdXMueWFtbAo+ID4gaW5kZXggYWE1
ZmI2NGQ1N2ViLi45ZmY5Y2JkZDhhODUgMTAwNjQ0Cj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvcmlzY3YvY3B1cy55YW1sCj4gPiArKysgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvY3B1cy55YW1sCj4gPiBAQCAtNjMsNiArNjMsMTYg
QEAgcHJvcGVydGllczoKPiA+ICAgICAgICAtIHJpc2N2LHN2NDgKPiA+ICAgICAgICAtIHJpc2N2
LG5vbmUKPiA+Cj4gPiArICBtbXU6Cj4gPiArICAgIGRlc2NyaXB0aW9uOgo+ID4gKyAgICAgIERl
c2NyaWJlcyB0aGUgQ1BVJ3MgTU1VIFN0YW5kYXJkIEV4dGVuc2lvbnMgc3VwcG9ydC4KPiA+ICsg
ICAgICBUaGVzZSB2YWx1ZXMgb3JpZ2luYXRlIGZyb20gdGhlIFJJU0MtViBQcml2aWxlZ2VkCj4g
PiArICAgICAgU3BlY2lmaWNhdGlvbiBkb2N1bWVudCwgYXZhaWxhYmxlIGZyb20KPiA+ICsgICAg
ICBodHRwczovL3Jpc2N2Lm9yZy9zcGVjaWZpY2F0aW9ucy8KPiA+ICsgICAgJHJlZjogJy9zY2hl
bWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3N0cmluZycKPiA+ICsgICAgZW51bToKPiA+ICsg
ICAgICAtIHJpc2N2LHN2cG1idAo+Cj4gc2hvdWxkbid0IHRoYXQgYmUgInJpc2N2LHN2cGJtdCIg
PyBbdGhlIG0gaXMgYXQgdGhlIHdyb25nIGxvY2F0aW9uIGl0IHNlZW1zXQo+Cj4gPiArCj4gPiAg
ICByaXNjdixpc2E6Cj4gPiAgICAgIGRlc2NyaXB0aW9uOgo+ID4gICAgICAgIElkZW50aWZpZXMg
dGhlIHNwZWNpZmljIFJJU0MtViBpbnN0cnVjdGlvbiBzZXQgYXJjaGl0ZWN0dXJlCj4gPgo+Cj4K
Pgo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
