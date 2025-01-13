Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 799C0C02180
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jan 2025 12:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Brq8tN+pWJoYU+e99EzQHzhqDvzg8LFPosZQKJoZHZ0=; b=qlX6PrSTUamlpn
	mj9ZrYfUZGrx2O2qo8sRrrXssBV3sF8ra+myAwwdCXcWqooijCD9Y989zk87nsODm4l2AVwBOJX3d
	GckeP4MhLw0E6i35m80OWfjA8nocAztQzl/nSpi8aOiDGcbQX6PDCjHN4dmPB2yBlZt0EV9s21qj7
	ckgnlG8hHX9tB/csisA+fY9NJ/d3dnNayYeJwDh3GZvHzu0kp5vXYjSzLgUgyalJpKHkx+02c8rAP
	kwnGm2vOGwrRaW+/zHPVp4qUW1ohp/WA48dLedfUAumkWCh9to8w1d0rRG6DMckYbRqvGNS+eCcIa
	8ONEqlv8ap9hHRNxh5pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXJl0-000000057uD-0xxr;
	Mon, 13 Jan 2025 12:41:26 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXJkw-000000057tc-3yr4
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jan 2025 12:41:25 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5d3d14336f0so7379244a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 13 Jan 2025 04:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1736772081; x=1737376881; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=huUeYxgEHQ+QkCankWz8xkLpv2eADhRNrifi/EU0k50=;
        b=VdLnhmElzVUper3jyvwM7+Px05+8DrMJ64NUcFlebCdIL/5CYijIl5uOyHrWxbq/VO
         1AHeCa1T3L41Sd0q2FTf6pHahKJn818htvLGLq9n6qaMIZinGjK214RVfyr9Yxf/FQq3
         JyFdmEP9jRlMt0g6kKWINhZN/BEAz3HHszCH0hDOduKJ7cZEhTp2e/FeeqcrsXKSidqm
         0ZbMbFbIZUlt0hM6lh0Wqp5VgHp6tFOISV4c7dOzF9Rd1oWoyZfBYZA/lba7VaPGJxkP
         YyGfOGzgBvd/c4dhd+4mzLJMdgOgO3gBPZsF1vlA4WDlyf6KzXGw2Wn0PZgxABG+t2RQ
         2B/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736772081; x=1737376881;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=huUeYxgEHQ+QkCankWz8xkLpv2eADhRNrifi/EU0k50=;
        b=BoxKzEstE8COR9MGgLVN+Sd+0DqF30L5EmsUtIQOofxDMftd3koEfBTULM4jJNsD6P
         ElGVBGZ4krXE65TqISMIERwkPw9UcQrOidS43q7RGYEWxDxCWh7/5KYgIpwcRliW7l8C
         qaIm5cMlC9erzq7jjWmwCHdmH63YCbcqT+TlZkAhw5b+qr4dPwhUd85ZH0RgeixiWmGE
         mD4uUve7zlMHGVxzMD/eFs3TsJrUz1mtP75T5naxzBy/8+MR/zNXCp4vt6fBtWMJaG5X
         BI+rSicpyg6E9p1IKTp6e2FB/E8U78ryHHS5JkNQXXqTTm49hn+/eViFJj7XNKw9wJ8M
         RN0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVZWbVJItwk+idtZ/lSkFdDfkO/67d1+ymxf8XXxiR6A5xcUtTmd0ihH9lk10Ut4t+ldUrH3h8ZT2zw6g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3Tqln/yyB78JznHe823DI/bZJzf30VPIN81BpWwbQBbLitA6P
	FJkiSwW6mQElivWT3ZEt1yenIbQHMEIkvdJkpgDR3a9ooEqTlJ4eeP5wRgMHbdI=
X-Gm-Gg: ASbGncvLZGag9szx9KbypaP1ITKmguoShTwEV+Krjpp/Msw5jwtFcOEihQPX+oD6cjT
	RDcIXo9xqDaQMNLYrxfTc33143SvgjisfrwRk3Qk/JXrWnzB4SL37gi1d94DnlSMDWwE7pW3UHj
	ArWp26igH/3av+xKDgduEokTIstHIylcPFa6FP2VDPEALF0C5sGQSKSpRUZqPDsi6Mef1Gnykfa
	Bn1Zu0weDqKbIIh7XUBIw8Jz1S8He1TpMuW5NxW0QwgxPHXixZIwS4AZdpzbGCvuwszdyph4FWX
	rktCkIMKeal2G4amUDJ2fD54PfX36+EyobDDwfuQgQ==
X-Google-Smtp-Source: AGHT+IH/2QV8V4ediKclPA9gLPWZd3mIbosx/ICvvUfzixLKWMRsrnwfp0jkVU/aUAETM94untErKQ==
X-Received: by 2002:a17:907:3f92:b0:aac:439:10ce with SMTP id a640c23a62f3a-ab2ab73e812mr1850195066b.27.1736772080946;
        Mon, 13 Jan 2025 04:41:20 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c9564848sm490993366b.125.2025.01.13.04.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 04:41:20 -0800 (PST)
Date: Mon, 13 Jan 2025 13:41:19 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: alexghiti@rivosinc.com, andybnac@gmail.com, aou@eecs.berkeley.edu, 
	charlie@rivosinc.com, cleger@rivosinc.com, conor.dooley@microchip.com, 
	conor@kernel.org, corbet@lwn.net, evan@rivosinc.com, jesse@rivosinc.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	samuel.holland@sifive.com, shuah@kernel.org
Subject: Re: [External] Re: [PATCH v3 2/3] RISC-V: hwprobe: Expose Zicbom
 extension and its block size
Message-ID: <20250113-da3ae77c9eb1342ac19ec59c@orel>
References: <20250113083635.73826-1-cuiyunhui@bytedance.com>
 <20250113083635.73826-2-cuiyunhui@bytedance.com>
 <20250113-65f27ad723c0f6585f86ae7f@orel>
 <CAEEQ3w=fgb7Jxg6SP_hp0Z+T0Tfb-_Pa4-CzU8PpGUKA+dHxyA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEEQ3w=fgb7Jxg6SP_hp0Z+T0Tfb-_Pa4-CzU8PpGUKA+dHxyA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_044122_987317_1417636A 
X-CRM114-Status: GOOD (  20.44  )
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

T24gTW9uLCBKYW4gMTMsIDIwMjUgYXQgMDc6Mjk6MzlQTSArMDgwMCwgeXVuaHVpIGN1aSB3cm90
ZToKPiBIaSBkcmV3LAo+IAo+IE9uIE1vbiwgSmFuIDEzLCAyMDI1IGF0IDU6MDfigK9QTSBBbmRy
ZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBNb24s
IEphbiAxMywgMjAyNSBhdCAwNDozNjozNFBNICswODAwLCBZdW5odWkgQ3VpIHdyb3RlOgo+ID4g
PiBFeHBvc2UgWmljYm9tIHRocm91Z2ggaHdwcm9iZSBhbmQgYWxzbyBwcm92aWRlIGEga2V5IHRv
IGV4dHJhY3QgaXRzCj4gPiA+IHJlc3BlY3RpdmUgYmxvY2sgc2l6ZS4KPiA+ID4KPiA+ID4gU2ln
bmVkLW9mZi1ieTogWXVuaHVpIEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+Cj4gPiA+IC0t
LQo+ID4gPiAgRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0ICB8IDYgKysrKysr
Cj4gPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3cHJvYmUuaCAgICAgIHwgMiArLQo+ID4g
PiAgYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaCB8IDIgKysKPiA+ID4gIGFy
Y2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMgICAgICAgfCA2ICsrKysrKwo+ID4gPiAgNCBm
aWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPiA+Cj4gPiA+
IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QgYi9Eb2N1
bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QKPiA+ID4gaW5kZXggOTU1ZmJjZDE5Y2U5
Li43YTQ3Y2JkYmNmOGUgMTAwNjQ0Cj4gPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vYXJjaC9yaXNj
di9od3Byb2JlLnJzdAo+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9i
ZS5yc3QKPiA+ID4gQEAgLTk0LDYgKzk0LDkgQEAgVGhlIGZvbGxvd2luZyBrZXlzIGFyZSBkZWZp
bmVkOgo+ID4gPiAgICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0VYVF9aSUNCT1pgOiBUaGUg
WmljYm96IGV4dGVuc2lvbiBpcyBzdXBwb3J0ZWQsIGFzCj4gPiA+ICAgICAgICAgcmF0aWZpZWQg
aW4gY29tbWl0IDNkZDYwNmYgKCJDcmVhdGUgY21vYmFzZS12MS4wLnBkZiIpIG9mIHJpc2N2LUNN
T3MuCj4gPiA+Cj4gPiA+ICsgICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfRVhUX1pJQ0JPTWA6
IFRoZSBaaWNib20gZXh0ZW5zaW9uIGlzIHN1cHBvcnRlZCwgYXMKPiA+ID4gKyAgICAgICByYXRp
ZmllZCBpbiBjb21taXQgM2RkNjA2ZiAoIkNyZWF0ZSBjbW9iYXNlLXYxLjAucGRmIikgb2Ygcmlz
Y3YtQ01Pcy4KPiA+ID4gKwo+ID4KPiA+IFRoaXMgc2hvdWxkIGNvbWUgYWZ0ZXIgUklTQ1ZfSFdQ
Uk9CRV9FWFRfU1VQTSBzaW5jZSB0aGlzIGRvY3VtZW50IGhhcyB0aGUKPiA+IGRlZmluZXMgc29y
dGVkIGluIHRoZSBvcmRlciBpbiB3aGljaCB0aGV5IGFyZSBpbnRyb2R1Y2VkIChhbHRob3VnaCBJ
Cj4gPiBwZXJzb25hbGx5IHdvdWxkbid0IG1pbmQgaWYgd2Ugb3JkZXJlZCB0aGVtIGFscGhhYmV0
aWNhbGx5IGluc3RlYWQpCj4gT0sKPiAKPiA+Cj4gPiA+ICAgICogOmM6bWFjcm86YFJJU0NWX0hX
UFJPQkVfRVhUX1pCQ2AgVGhlIFpiYyBleHRlbnNpb24gaXMgc3VwcG9ydGVkLCBhcyBkZWZpbmVk
Cj4gPiA+ICAgICAgICAgaW4gdmVyc2lvbiAxLjAgb2YgdGhlIEJpdC1NYW5pcHVsYXRpb24gSVNB
IGV4dGVuc2lvbnMuCj4gPiA+Cj4gPiA+IEBAIC0yNzMsNiArMjc2LDkgQEAgVGhlIGZvbGxvd2lu
ZyBrZXlzIGFyZSBkZWZpbmVkOgo+ID4gPiAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9LRVlf
WklDQk9aX0JMT0NLX1NJWkVgOiBBbiB1bnNpZ25lZCBpbnQgd2hpY2gKPiA+ID4gICAgcmVwcmVz
ZW50cyB0aGUgc2l6ZSBvZiB0aGUgWmljYm96IGJsb2NrIGluIGJ5dGVzLgo+ID4gPgo+ID4gPiAr
KiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9LRVlfWklDQk9NX0JMT0NLX1NJWkVgOiBBbiB1bnNp
Z25lZCBpbnQgd2hpY2gKPiA+ID4gKyAgcmVwcmVzZW50cyB0aGUgc2l6ZSBvZiB0aGUgWmljYm9t
IGJsb2NrIGluIGJ5dGVzLgo+ID4gPiArCj4gPgo+ID4gU2hvdWxkIGJlIG1vdmVkIGJlbG93IFJJ
U0NWX0hXUFJPQkVfS0VZX1RJTUVfQ1NSX0ZSRVEKPiAKPiBXaHkgc2hvdWxkIGl0IGJlIG1vdmVk
IGJlbG93IFJJU0NWX0hXUFJPQkVfS0VZX1RJTUVfQ1NSX0ZSRVE/CgpPaCwgcmlnaHQuIEl0IHNo
b3VsZCBiZSBiZWxvdyBSSVNDVl9IV1BST0JFX0tFWV9NSVNBTElHTkVEX1ZFQ1RPUl9QRVJGIGZv
cgp0aGUgc2FtZSByZWFzb24gYXMgYWJvdmUgKG9yZGVyIG9mIGludHJvZHVjdGlvbikuCgpUaGFu
a3MsCmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
