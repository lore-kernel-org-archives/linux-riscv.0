Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CCBAC3064D
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jun 2024 09:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4mbGpCf9fIdzwPd4yMdzhjgRvD/W9t7EAHIZZhVooKM=; b=PKt85cjjyDBuWH
	n+EgDuGChkAzgzXy2qX3C0S6pEnQmJwjvscKlWJe/JpCt4/PpvEsqprpFt7Ftdfqyjerb6gKvsAIJ
	TwvqwH16OjcFDZlNpevijMP3fG1h5hnF+eaHATlmwTlifTE2rcOa5lGfqC2D81/XN4nTUtKAP9rjf
	STI40uyOh7Pn+C+/j+lHEJbJwNhWINYUFC/vvYymRCzpPly+NchBYnRAC1KTWbGbIy4k9SBRWKS1/
	CX/38KCYsViUG+WgtPfg35M5YyO447wIY05WtJxGbdu4yxURat1/fK1jb9DiFhR+7Hyv07auMrC9n
	d9xFKT0ePnPd79+YsFSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN7nf-0000000DEy4-3ReH;
	Fri, 28 Jun 2024 09:21:47 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN7nd-0000000DExN-1o15
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jun 2024 09:21:46 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a724958f118so49507966b.0
        for <linux-riscv@lists.infradead.org>; Fri, 28 Jun 2024 02:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719566504; x=1720171304; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GUUeOl5OTYU1P+SJ7athIDCY6ruVMMiJN7zw6ctaH28=;
        b=FdQB5BMo8n1tNhEvkr1r288/zFCf2vSYhbW5viSLR4DFPH2fJ+Xqsboi1XioOyuDtN
         YoVWez3h070lsqWJBumiIaAZp1h/MEkZI7zcRj61m2Yohdy4Xkj+Uu1tlHLVVWTw6MzX
         QZ629UMinAZy3l7R1wweCZTsjo0dlzSi/sH3F9xgRbYg9JObRmbdFlWnz80/M8VAtHbl
         NI23l7RdbFPi2Smw75UJst358Pef1e5IIYNo8CcPTHi7498EKBntKeBUkoHiUDcI8joj
         /t5k729l6JBA0o540rxKycnMWUPUpY9U4iA2I8q/GqcdL4ofqjItVNKWuGVmJa2rnjJx
         ANow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719566504; x=1720171304;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GUUeOl5OTYU1P+SJ7athIDCY6ruVMMiJN7zw6ctaH28=;
        b=PSUf/mRBv1AT658PnSvhWeofyv5NvFTQiYCgW3YbD6U3oR92S1PS4OiKFZm6Kmah+Y
         pNjJjh5uylFFIkymn+2GR7OkdvnVcnrfmfnTZK8zsP1KvCpQiY0jS5Yae5hs/P1w6uea
         8M4v/vibfX/bbv48a4hDcqUStnKIoyRyjADv2xW6XmBXJhAP/ov5K7ECHnDuYYANyy6F
         sPwevARQfNQv6OPHOBrLdXxl6o0QXKXjgXtQhckT55ydJsgrLwQvwaGM5OS2zUDFHx/Q
         +RZ8A2D8EpdMgePqN96bpKbJTJh+dZ9vHvY12sng3Xe2wYpsjM7yQpXbvTRwWmpXLVy2
         CRog==
X-Forwarded-Encrypted: i=1; AJvYcCWqD455jBJ1132AnVn4/49SF1ZxNoZf54QlhEMM/iefgcTGAWhzFWXWktiT0c5UlCmXD77vP01vfAjZAIsTHXL2yDGVyVy3ZJbt2yTDqfAn
X-Gm-Message-State: AOJu0YwCyQFR4gfWHfhPm/tQps/g/LF9VRWGC2fWQaHHwjQ9x0F/xD2Q
	JHgsxAknmP7Yig6jttCA4zHD0wOiFOAK3xso3fvxQH7tfYnGSAyCWpNapEUr0JjXrehoT5G5BGF
	k7OwSalPQ/9mBidejpyNP2XzaO1ENFUIIQhAJ6vuwDpYh99Tj
X-Google-Smtp-Source: AGHT+IF7NFei1EQBJfySUv3C79EdZFXolxqVCoTcA7eZAbhURusjPaToikXelhSoNh/rrjdKoBeJoJz3xOL6E3X1Vt4=
X-Received: by 2002:a17:906:c44d:b0:a72:548a:6f42 with SMTP id
 a640c23a62f3a-a72548a702emr1002466966b.18.1719566503875; Fri, 28 Jun 2024
 02:21:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240626171652.366415-1-jesse@rivosinc.com> <20240627-boring-handgun-40ae5bf2651e@wendy>
In-Reply-To: <20240627-boring-handgun-40ae5bf2651e@wendy>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Fri, 28 Jun 2024 11:21:33 +0200
Message-ID: <CAHVXubik-T=dv3hds4VuJFFxen1CRhfintGdOu3JsdAeouuOtg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] RISC-V: pi: Force hidden visibility for all symbol references
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Jesse Taube <jesse@rivosinc.com>, linux-riscv@lists.infradead.org, 
	Ard Biesheuvel <ardb@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Wende Tan <twd2.me@gmail.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Sami Tolvanen <samitolvanen@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>, 
	Chen Jiahao <chenjiahao16@huawei.com>, "Mike Rapoport (IBM)" <rppt@kernel.org>, 
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_022145_490424_5253DBD8 
X-CRM114-Status: GOOD (  12.25  )
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

SGkgSmVzc2UsCgpPbiBUaHUsIEp1biAyNywgMjAyNCBhdCAxMjozNeKAr1BNIENvbm9yIERvb2xl
eQo8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBKdW4gMjYs
IDIwMjQgYXQgMDE6MTY6NTBQTSAtMDQwMCwgSmVzc2UgVGF1YmUgd3JvdGU6Cj4gPiBFbGltaW5h
dGUgYWxsIEdPVCBlbnRyaWVzIGluIHRoZSAucGkgc2VjdGlvbiwgYnkgZm9yY2luZyBoaWRkZW4K
PiA+IHZpc2liaWxpdHkgZm9yIGFsbCBzeW1ib2wgcmVmZXJlbmNlcywgd2hpY2ggaW5mb3JtcyB0
aGUgY29tcGlsZXIgdGhhdAo+ID4gc3VjaCByZWZlcmVuY2VzIHdpbGwgYmUgcmVzb2x2ZWQgYXQg
bGluayB0aW1lIHdpdGhvdXQgdGhlIG5lZWQgZm9yCj4gPiBhbGxvY2F0aW5nIEdPVCBlbnRyaWVz
Lgo+ID4KPiA+IEluY2x1ZGUgbGludXgvaGlkZGVuLmggaW4gTWFrZWZpbGUsIGxpa2UgYXJtNjQs
IGZvciB0aGUKPiA+IGhpZGRlbiB2aXNpYmlsaXR5IGF0dHJpYnV0ZS4KPiA+Cj4gPiBTaWduZWQt
b2ZmLWJ5OiBKZXNzZSBUYXViZSA8amVzc2VAcml2b3NpbmMuY29tPgo+Cj4gRGlkIHlvdSBmb3Jn
ZXQgdG8gYWRkIC0tY292ZXItbGV0dGVyIHRvIHlvdXIgZm9ybWF0LXBhdGNoIGluY2FudGF0aW9u
PwoKSSBhZG1pdHRlZGx5IGRvbid0IHVuZGVyc3RhbmQgYWxsIHRoZSBkZXRhaWxzIGJ1dCBpdCBt
YWtlcyB0aGUgR09UCmVudHJ5IGRpc2FwcGVhciBhbmQgYXJtNjQgdXNlcyBpdCB0b28sIHNvOgoK
UmV2aWV3ZWQtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KClRo
YW5rcywKCkFsZXgKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
