Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C314DECAAA1
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Sep 2022 01:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XbwI1gI+an0ommUBVMBb9wuuc9q4tl+SgsS7YBr5eZU=; b=TlnHb3vgWxfhxT
	MnLZOYi8DTiJjSzjWlI2UpyFaGviWIKV96nojI+qgO0u08m6PAn4H7x/iyAq1smTnsvZFHBOntw7P
	cpe1BtrosJuVGSlbrVfO26pPm6650PmhqDsS1He76aenKcjrJIAB5wQ9GC0YoEekF/nU8EVPfP6/i
	uST0R/x5Ew7FKDk1tiGaA89U5zQw9VnzRanDqXVY/l0zZhldraP2IKg11pjLUrIF7/MM1bZdMtI2T
	g6vPwbMljJhdDPx4J1wcd+UaruJDqEfwtGKAZFAOkjeLIURs3IKLTwbIsOmbphU+KGvOnYBJMfvdO
	esQPYmmYt4pLMLq5Q+IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVNdT-001R0J-3c; Tue, 06 Sep 2022 01:44:19 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVNdP-001Qyl-3H
	for linux-riscv@lists.infradead.org; Tue, 06 Sep 2022 01:44:16 +0000
Received: by mail-io1-xd31.google.com with SMTP id z72so7828877iof.12
        for <linux-riscv@lists.infradead.org>; Mon, 05 Sep 2022 18:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=e08D4SbYcUhaLYKlJn1NPNEeQS9ZOdXgn69FJxpJUWU=;
        b=aSf23VvqYq9Z9jdxRlZRJnEDJ7mvD/LHSdN8oA/u47qteegSQ8x0ao1esHDGm4oa2C
         k+Dvbmdxt4429HmYjGNYHNbMjVa5CqcDHeMYlS5YiX4Y/RNeIfYnazKP7CCcKpzO6m1B
         bq/tkOXVBPUmE4dMXlE6r/L96eop3rSNYx0TCPDvJeibI3ol0i+lyQCTxv64UVhq7hJk
         cHVHMwzGYpwtoJtc9vGXnxL8zK0m48T+eDHXBYjmkP5/eB818ZK5eOT+7ovgZS9mNSHN
         yekuhVwAYg598tep+YJ++aQU/Dlbrd18IzF5iXb9sWesBBQxxTlJ/AjtM9cE1sTgxTyw
         d7zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=e08D4SbYcUhaLYKlJn1NPNEeQS9ZOdXgn69FJxpJUWU=;
        b=jwLIz3pUDosVa7dxu2CjEIfA587o4HBp59mnRlZL3uuStJn0PB2HXPz1MAShIhcCKw
         ns+N/GKgKIDXvurnvZX+96vD8/hb2/Tl/AVwVjqb0l8QBh6X8qqdFVzF84s8jHlzq02p
         wuXSoYmfZtJ07S+QxFSvQm3cXAHwzDICY8veywWVT6EoLIf/vWTOflt4oATT5bgxTnX2
         p31uNRrBCQm2yq+w+Yzy+ZoahAM3z0PXMftN5sWWJnTaL4nfIu6UUREgBt3j3hRi7Tc9
         FV767Fl4o/AL1d2mMS2jpmG62o2E/qPVOrJEn40RvSrx0HgYj3Bb5kq9pIoYu0hv3sa4
         AtNQ==
X-Gm-Message-State: ACgBeo0t89B6OceT4Rj2r/WBYTz+EzQ1Q0YMnS6lbdDWcwTja1lwCqHn
	JgL7r4i0LEA1y8uCOnqvWyFUUFj3zS9hqh6ifLE=
X-Google-Smtp-Source: AA6agR7xh1vB2jFhH2LWVWFGJ55z+0Yj4EDaWMZotdc41OWc9x+Bg1vM4mSD3IyJX4nRCXIrG/8QekXPK7zob+GxIfI=
X-Received: by 2002:a05:6602:1482:b0:688:d06b:223e with SMTP id
 a2-20020a056602148200b00688d06b223emr23881601iow.3.1662428653335; Mon, 05 Sep
 2022 18:44:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220905083125.29426-1-zong.li@sifive.com> <20220905083125.29426-3-zong.li@sifive.com>
 <2a22c6ac-dc0e-7066-8f5f-04c428c77ee2@microchip.com>
In-Reply-To: <2a22c6ac-dc0e-7066-8f5f-04c428c77ee2@microchip.com>
From: Zong Li <zongbox@gmail.com>
Date: Tue, 6 Sep 2022 09:44:01 +0800
Message-ID: <CA+ZOyah199Vsa9haepO=uizymy947aLv3tMoO=5ye=FHqhkYCA@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] soc: sifive: ccache: Rename SiFive L2 cache to
 Composable cache.
To: Conor.Dooley@microchip.com
Cc: zong.li@sifive.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu, 
	greentime.hu@sifive.com, ben.dooks@sifive.com, bp@alien8.de, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_184415_175688_073639E7 
X-CRM114-Status: GOOD (  15.67  )
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

PENvbm9yLkRvb2xleUBtaWNyb2NoaXAuY29tPiDmlrwgMjAyMuW5tDnmnIg25pelIOmAseS6jCDl
h4zmmagyOjQ45a+r6YGT77yaCj4KPiBOb3RpY2VkIGEgYW5vdGhlciB0aGluZywgc29ycnkuLgo+
Cj4gT24gMDUvMDkvMjAyMiAwOTozMSwgWm9uZyBMaSB3cm90ZToKPiA+IEVYVEVSTkFMIEVNQUlM
OiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cg
dGhlIGNvbnRlbnQgaXMgc2FmZQo+ID4KPiA+IEZyb206IEdyZWVudGltZSBIdSA8Z3JlZW50aW1l
Lmh1QHNpZml2ZS5jb20+Cj4gPgo+ID4gU2luY2UgY29tcG9zYWJsZSBjYWNoZSBtYXkgYmUgTDMg
Y2FjaGUgaWYgcEwyIGNhY2hlIGV4aXN0cywgd2Ugc2hvdWxkIHVzZQo+ID4gaXRzIG9yaWdpbmFs
IG5hbWUgY29tcG9zYWJsZSBjYWNoZSB0byBwcmV2ZW50IGNvbmZ1c2lvbi4KPiA+Cj4gPiBBcGFy
dCBmcm9tIHJlbmFtaW5nLCB3ZSBhbHNvIGFkZCB0aGUgY29tcGF0aWJsZSAic2lmaXZlLGNjYWNo
ZTAiIGludG8gSUQKPiA+IHRhYmxlLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEdyZWVudGltZSBI
dSA8Z3JlZW50aW1lLmh1QHNpZml2ZS5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBab25nIExpIDx6
b25nLmxpQHNpZml2ZS5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL3NvYy9zaWZpdmUvS2NvbmZp
ZyAgICAgICAgICAgICAgICAgICAgfCAgIDYgKy0KPiA+ICBkcml2ZXJzL3NvYy9zaWZpdmUvTWFr
ZWZpbGUgICAgICAgICAgICAgICAgICAgfCAgIDIgKy0KPiA+ICAuLi4ve3NpZml2ZV9sMl9jYWNo
ZS5jID0+IHNpZml2ZV9jY2FjaGUuY30gICAgfCAxNjMgKysrKysrKysrLS0tLS0tLS0tCj4gPiAg
Li4uL3tzaWZpdmVfbDJfY2FjaGUuaCA9PiBzaWZpdmVfY2NhY2hlLmh9ICAgIHwgIDE2ICstCj4g
PiAgNCBmaWxlcyBjaGFuZ2VkLCA5NCBpbnNlcnRpb25zKCspLCA5MyBkZWxldGlvbnMoLSkKPiA+
ICByZW5hbWUgZHJpdmVycy9zb2Mvc2lmaXZlL3tzaWZpdmVfbDJfY2FjaGUuYyA9PiBzaWZpdmVf
Y2NhY2hlLmN9ICgzNSUpCj4gPiAgcmVuYW1lIGluY2x1ZGUvc29jL3NpZml2ZS97c2lmaXZlX2wy
X2NhY2hlLmggPT4gc2lmaXZlX2NjYWNoZS5ofSAoMTIlKQo+ID4KPgo+ID4gLXN0YXRpYyBzc2l6
ZV90IGwyX3dyaXRlKHN0cnVjdCBmaWxlICpmaWxlLCBjb25zdCBjaGFyIF9fdXNlciAqZGF0YSwK
PiA+ICtzdGF0aWMgc3NpemVfdCBjY2FjaGVfd3JpdGUoc3RydWN0IGZpbGUgKmZpbGUsIGNvbnN0
IGNoYXIgX191c2VyICpkYXRhLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZV90IGNv
dW50LCBsb2ZmX3QgKnBwb3MpCj4KPiBZb3UgbmVlZCB0byBmaXggdGhlIGFsaWdubWVudCBoZXJl
IGFzIHBlciBjaGVja3BhdGNoOgo+IENIRUNLOiBBbGlnbm1lbnQgc2hvdWxkIG1hdGNoIG9wZW4g
cGFyZW50aGVzaXMKPiAjMTEyOiBGSUxFOiBkcml2ZXJzL3NvYy9zaWZpdmUvc2lmaXZlX2NjYWNo
ZS5jOjUzOgo+ICtzdGF0aWMgc3NpemVfdCBjY2FjaGVfd3JpdGUoc3RydWN0IGZpbGUgKmZpbGUs
IGNvbnN0IGNoYXIgX191c2VyICpkYXRhLAo+ICsgICAgICAgICAgICAgICAgICAgICAgIHNpemVf
dCBjb3VudCwgbG9mZl90ICpwcG9zKQo+CgpJJ20gbm90IHN1cmUgd2h5IEkgZG9uJ3Qgc2VlIHRo
YXQgYnkgY2hlY2twYXRjaCwgYnV0IGl0IGxvb2tzIHRoYXQgaXQKaXMgYWN0dWFsbHkgbWlzYWxp
Z25tZW50IHRoZXJlLCBJIHdvdWxkIHJlLWNoZWNrIGFsbCBpbmRlbnRzIGluCnNvdXJjZS4gVGhh
bmtzLgoKPiA+ICB7Cj4gPiAgICAgICAgIHVuc2lnbmVkIGludCB2YWw7Cj4gPiBAQCAtNTcsNzUg
KzU3LDc2IEBAIHN0YXRpYyBzc2l6ZV90IGwyX3dyaXRlKHN0cnVjdCBmaWxlICpmaWxlLCBjb25z
dCBjaGFyIF9fdXNlciAqZGF0YSwKPiA+ICAgICAgICAgaWYgKGtzdHJ0b3VpbnRfZnJvbV91c2Vy
KGRhdGEsIGNvdW50LCAwLCAmdmFsKSkKPiA+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZB
TDsKPiA+ICAgICAgICAgaWYgKCh2YWwgPCAweEZGKSB8fCAodmFsID49IDB4MTAwMDAgJiYgdmFs
IDwgMHgxMDBGRikpCj4gPiAtICAgICAgICAgICAgICAgd3JpdGVsKHZhbCwgbDJfYmFzZSArIFNJ
RklWRV9MMl9FQ0NJTkpFQ1RFUlIpOwo+ID4gKyAgICAgICAgICAgICAgIHdyaXRlbCh2YWwsIGNj
YWNoZV9iYXNlICsgU0lGSVZFX0NDQUNIRV9FQ0NJTkpFQ1RFUlIpOwo+ID4gICAgICAgICBlbHNl
Cj4gPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gPiAgICAgICAgIHJldHVybiBj
b3VudDsKPiA+ICB9Cj4gPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
