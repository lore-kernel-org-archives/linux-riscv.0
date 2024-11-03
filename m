Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 424EEE67819
	for <linux-riscv@archiver.kernel.org>; Sun,  3 Nov 2024 00:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i/f3l7XATVIvBlqee2HRvs+iu1Q++R2UWItc03AWLT4=; b=gB3J/Y9E8ut21B
	PRhEDbcncygUE+pzUEgtZg+4SUoQ/EkTE74KsJ8mdUj3vNYrAWQlh37OfuxfVaK9fq65yyAFMnDph
	30kcIOOzP6Da703rsZxfXvDLnaYA8EFmXYYz2NuPDBvxAWn3eBwgAXOaYF/JB3xMdxDI54lIOBHrB
	KQwGtzMU9DaYUYoW/0QDyfxaj3C0BeS/mnPrPpp0hIA+2imJyo+aF/+dauHMsMOlXEvZe6yJPmJC7
	/ADYcEVI5DlHRiDSJsOO1bPMKz4AM8IshE08Rbmx1nZ42NdUEtQYq+J2Hv+JYogT4I9mz4NeDQYSv
	i+2rNWQ8Cq0uuoEVNUrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7OOj-0000000AffA-0M3A;
	Sun, 03 Nov 2024 00:23:17 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7OOg-0000000Afea-3sgC
	for linux-riscv@lists.infradead.org;
	Sun, 03 Nov 2024 00:23:16 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-3e612437c09so1799316b6e.2
        for <linux-riscv@lists.infradead.org>; Sat, 02 Nov 2024 17:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730593393; x=1731198193; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cy+oQJ2GEMRpNjhFn1LJw929fydtHkD4JsoP5UMnHEE=;
        b=LG75n2pYGn46C2HIA9nVPmseHyuczBhORp6iTGoQG6M3/5sfOBesR8/vD/5NMn9SWo
         Qrx6rZUWwWqZ5ED+ghd2E2jctDCWxZrucBSOcIMnFEEN2feaNZi2q7QrN6vUKzdpcnzA
         NB2U+F3tPoM9dWqPxpOzKNgM7TYmNMwYhQG16QC3pjFaZIuk98SkOVnXXUcjwXcReVRq
         kNnwk/U+nk56Sg1ucgnCAKixCz+4azDKNX47lT/7umqXdsBbcfyrCvnuoRuiwcsYsbQ4
         ck4wQvtfsvTWWwNH7y7kXpLVgb27v+R15NGWDr2ZmiYaD3m2qYVoD5nhHTsgDJjECF95
         yEbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730593393; x=1731198193;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cy+oQJ2GEMRpNjhFn1LJw929fydtHkD4JsoP5UMnHEE=;
        b=dsbM4ZcR66+KdqXsTEP4CPvKcpbxlyI6vhQBmolr38MXQZdr3y5j/3oBfVyzxIdm4Y
         Pz0Xak5BMFbDxfzrjepT2iiWPcF1MdGXsUr4NJ+OzuxyJnbVO5bEKPJRvQMzrmnbQ9AQ
         162q9spl/e0rmAQq7ruEGoYsPg6licfpsKoY9LYRuhk6T8Wanbu5dC0Ry5ksFkS1GEzq
         MCkvDk4c1NK8ev5r8EGaa1X15/FbGbyIoN9fdmGdfGRliePkvKKXhpCgu2vfTTw4YFYw
         aQ2M363K5QGeLooh8yeznb+T+o3Y3f6RgLdBByIv9xbKkMdWKxwxGT3frdqpZaV1RoKg
         WIGA==
X-Forwarded-Encrypted: i=1; AJvYcCWYn3EJ/ZE1jGQR2YnZptgJuzI5zkbzQzTAUDTMj/uGZUpr2MXvtH0gK8tMxDFMSfczBOUGZKyuyFD0Hw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyqPoz2coWLo6JiRRotonpuVQs48cwJhgpxkHGeIzVF/r9fyMLh
	3oAmrUQCKnBJAWjgI+l2oPrcdz2VdfgOn72oQQeWzGjYkYAyb+Xhx98WoXCIYnpFXI2CXvDUq6x
	NorxB9F3+GoJRbW6xrPizXrejfrg=
X-Google-Smtp-Source: AGHT+IH1/AqKguweEOJ8EZHcTlXSXIH8nwkWs4syLgX8RZ0uDmap1bE6uGoyjAxjUn7dGn0O2qZi1jtZGw0jSkQ9ph0=
X-Received: by 2002:a05:6808:2f0e:b0:3e2:9e62:37d5 with SMTP id
 5614622812f47-3e65834f25dmr15244041b6e.5.1730593393243; Sat, 02 Nov 2024
 17:23:13 -0700 (PDT)
MIME-Version: 1.0
References: <20241025125110.1347757-1-valentina.fernandezalanis@microchip.com> <20241025125110.1347757-4-valentina.fernandezalanis@microchip.com>
In-Reply-To: <20241025125110.1347757-4-valentina.fernandezalanis@microchip.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sat, 2 Nov 2024 19:23:01 -0500
Message-ID: <CABb+yY3cDD-E-P1MPKQjdX7R2XVVKjwXUW-BANWcz-9aR6kskA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] mailbox: add Microchip IPC support
To: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	peterlin@andestech.com, conor.dooley@microchip.com, conor+dt@kernel.org, 
	ycliang@andestech.com, dminus@andestech.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, robh@kernel.org, krzk+dt@kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_172314_987129_4D879D7F 
X-CRM114-Status: GOOD (  14.23  )
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

T24gRnJpLCBPY3QgMjUsIDIwMjQgYXQgNzozNuKAr0FNIFZhbGVudGluYSBGZXJuYW5kZXoKPHZh
bGVudGluYS5mZXJuYW5kZXphbGFuaXNAbWljcm9jaGlwLmNvbT4gd3JvdGU6CgouLi4uCj4gKwo+
ICtlbnVtIGlwY19pcnFfdHlwZSB7Cj4gKyAgICAgICBJUENfT1BTX05PVF9TVVBQT1JURUQgICA9
IDEsCj4gKyAgICAgICBJUENfTVBfSVJRICAgICAgICAgICAgICA9IDIsCj4gKyAgICAgICBJUENf
TUNfSVJRICAgICAgICAgICAgICA9IDQsCj4gK307CnRvdGFsbHkgdW51c2VkLgoKPiArCj4gKy8q
Kgo+ICsgKiBzdHJ1Y3QgbWNocF9pcGNfcHJvYmUgLSBJUEMgcHJvYmUgbWVzc2FnZSBmb3JtYXQK
PiArICoKPiArICogQGh3X3R5cGU6ICAgICAgICAgICBJUEMgaW1wbGVtZW50YXRpb24gYXZhaWxh
YmxlIGluIHRoZSBoYXJkd2FyZQo+ICsgKiBAbnVtX2NoYW5uZWxzOiAgICAgIG51bWJlciBvZiBJ
UEMgY2hhbm5lbHMgYXZhaWxhYmxlIGluIHRoZSBoYXJkd2FyZQo+ICsgKgo+ICsgKiBVc2VkIHRv
IHJldHJpZXZlIGluZm9ybWF0aW9uIG9uIHRoZSBJUEMgaW1wbGVtZW50YXRpb24KPiArICogdXNp
bmcgdGhlIFNCSV9FWFRfSVBDX1BST0JFIFNCSSBmdW5jdGlvbiBpZC4KPiArICovCj4gK3N0cnVj
dCBtY2hwX2lwY19wcm9iZSB7CiBzYW1lIGFzIHRoZSBkcml2ZXIucHJvYmUoKSwgc28gbWF5YmUg
Y2FsbCB0aGlzIG1pY3JvY2hpcF9tYm94X2luZm8KCi4uLi4uLgoKPiArc3RydWN0IG1jaHBfaXBj
X2NsdXN0ZXJfY2ZnIHsKPiArICAgICAgIHZvaWQgKmJ1Zl9iYXNlOwo+ICsgICAgICAgdW5zaWdu
ZWQgbG9uZyBidWZfYmFzZV9hZGRyOwo+ICsgICAgICAgaW50IGlycTsKPiArfTsKPiArCj4gK3N0
cnVjdCBpcGNfY2hhbl9pbmZvIHsKIEkgc3VnZ2VzdCBzL2lwY19jaGFuX2luZm8vbWljcm9jaGlw
X3NiaV9jaGFuIGFuZCBob29raW5nIGl0IHRvCm1ib3hfY2hhbi5jb25fcHJpdgoKLi4uLgoKPiAr
ICAgICAgIHVuc2lnbmVkIGxvbmcgYnVmX2Jhc2VfdHhfYWRkcjsKPiArICAgICAgIHVuc2lnbmVk
IGxvbmcgYnVmX2Jhc2VfcnhfYWRkcjsKPiArICAgICAgIHVuc2lnbmVkIGxvbmcgbXNnX2J1Zl90
eF9hZGRyOwo+ICsgICAgICAgdW5zaWduZWQgbG9uZyBtc2dfYnVmX3J4X2FkZHI7CklmIHRoZXNl
IGFyZSBfX3BhKCksIHRoZW4gcGh5c19hZGRyX3QgcGxlYXNlLgoKPiArICAgICAgIGludCBjaGFu
X2FnZ3JlZ2F0ZWRfaXJxOwo+ICsgICAgICAgaW50IG1wX2lycTsKPiArICAgICAgIGludCBtY19p
cnE7Cj4gKyAgICAgICB1MzIgaWQ7Cj4gKyAgICAgICB1MzIgbWF4X21zZ19zaXplOwo+ICt9Owo+
ICsKPiArc3RydWN0IG1pY3JvY2hpcF9pcGMgewogTWF5YmUgcy9taWNyb2NoaXBfaXBjL21pY3Jv
Y2hpcF9zYmlfbWJveCA/CgoKPiArICAgICAgIHN0cnVjdCBkZXZpY2UgKmRldjsKPiArICAgICAg
IHN0cnVjdCBtYm94X2NoYW4gKmNoYW5zOwo+ICsgICAgICAgc3RydWN0IG1jaHBfaXBjX2NsdXN0
ZXJfY2ZnICpjbHVzdGVyX2NmZzsKPiArICAgICAgIHN0cnVjdCBpcGNfY2hhbl9pbmZvICpwcml2
OwogIHJlcGxhY2UgdGhpcyB3aXRoICdzdHJ1Y3QgbWJveF9jaGFuICpjaGFuJyBhbmQgaG9vawog
ICAgIGNoYW5baV0uY29uX3ByaXYgPSBwcml2W2ldCiAgdGhpcyB3aWxsIGhlbHAgYXZvaWQgaGF2
aW5nIHRvIEVYUE9SVCBtY2hwX2lwY19nZXRfY2hhbl9pZAoKCj4gKyAgICAgICB2b2lkICpidWZf
YmFzZTsKPiArICAgICAgIHVuc2lnbmVkIGxvbmcgYnVmX2Jhc2VfYWRkcjsKcGh5c19hZGRyX3Qg
YnVmX2Jhc2VfYWRkciA/Cgo+ICsgICAgICAgc3RydWN0IG1ib3hfY29udHJvbGxlciBjb250cm9s
bGVyOwo+ICsgICAgICAgdTggbnVtX2NoYW5uZWxzOwp0aGlzIGNvdWxkIGJlIGRyb3BwZWQgYnkg
ZGlyZWN0bHkgdXNpbmcgJ2NvbnRyb2xsZXIubnVtX2NoYW5zJwoKLi4uLi4uCgo+ICtzdGF0aWMg
aW50IG1jaHBfaXBjX3NlbmRfZGF0YShzdHJ1Y3QgbWJveF9jaGFuICpjaGFuLCB2b2lkICpkYXRh
KQo+ICt7Cj4gKyAgICAgICBzdHJ1Y3QgaXBjX2NoYW5faW5mbyAqY2hhbl9pbmZvID0gKHN0cnVj
dCBpcGNfY2hhbl9pbmZvICopY2hhbi0+Y29uX3ByaXY7Cj4gKyAgICAgICBjb25zdCBzdHJ1Y3Qg
bWNocF9pcGNfbXNnICptc2cgPSBkYXRhOwo+ICsgICAgICAgc3RydWN0IG1jaHBfaXBjX3NiaV9t
c2cgc2JpX3BheWxvYWQ7Cj4gKwo+ICsgICAgICAgbWVtY3B5KGNoYW5faW5mby0+bXNnX2J1Zl90
eCwgbXNnLT5idWYsIG1zZy0+c2l6ZSk7Cj4gKyAgICAgICBzYmlfcGF5bG9hZC5idWZfYWRkciA9
IGNoYW5faW5mby0+bXNnX2J1Zl90eF9hZGRyOwo+ICsgICAgICAgc2JpX3BheWxvYWQuc2l6ZSA9
IG1zZy0+c2l6ZTsKPiArICAgICAgIG1lbWNweShjaGFuX2luZm8tPmJ1Zl9iYXNlX3R4LCAmc2Jp
X3BheWxvYWQsIHNpemVvZihzYmlfcGF5bG9hZCkpOwpIb3cgZG9lcyB0aGlzIHdvcms/IHNpemVv
ZihzYmlfcGF5bG9hZCkgaXMgbW9yZSB0aGFuCnNpemVvZigqY2hhbl9pbmZvLT5idWZfYmFzZV90
eCkKSSB0aGluayBidWZfYmFzZV90eCBuZWVkcyB0byBiZSB1OCBhcnJheSBvZiBtYXh7c2l6ZW9m
KHN0cnVjdAptY2hwX2lwY19pbml0KSwgc2l6ZW9mKHN0cnVjdCBtY2hwX2lwY19zYmlfbXNnKX0s
IGlmIHRoZXJlIGFyZQphbGlnbm1lbnQgcmVxdWlyZW1lbnRzIHRoZW4gbWF5YmUga21hbGxvYyB0
aGF0IHNpemUuClNpbWlsYXJseSBmb3IgYnVmX2Jhc2VfcnguCgouLi4KCj4gK3N0YXRpYyBzdHJ1
Y3QgcGxhdGZvcm1fZHJpdmVyIG1jaHBfaXBjX2RyaXZlciA9IHsKPiArICAgICAgIC5kcml2ZXIg
PSB7Cj4gKyAgICAgICAgICAgICAgIC5uYW1lID0gIm1pY3JvY2hpcF9pcGMiLAo+ICsgICAgICAg
ICAgICAgICAub2ZfbWF0Y2hfdGFibGUgPSBtY2hwX2lwY19vZl9tYXRjaCwKPiArICAgICAgIH0s
Cj4gKyAgICAgICAucHJvYmUgPSBtY2hwX2lwY19wcm9iZSwKVGhlIGRyaXZlciBjb3VsZCBiZSBi
dWlsdCBhcyBhIG1vZHVsZSwgc28gcGxlYXNlIHByb3ZpZGUgLnJlbW92ZSgpCmV2ZW4gaWYgeW91
IG5ldmVyIGludGVuZCB0byB1bmxvYWQgaXQuCgpjaGVlcnMuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
