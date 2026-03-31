Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6CB6FF60D3
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Mar 2026 06:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j8Jx4UdiipN1wLw95fGE1lyc93DIoNdP+nXdCakVtnE=; b=rt37FgjfzGkg1S
	zGMD7yaFrdjc+vQaU1kdeuAxh6fDL7p2AKFrY/148AIFogkaf0v/INtMaKA+iGje0HRogbnjHZdJl
	S08qFk9+fP+zwRTdxF/LFsjc85E3hgX9dkfPxj4mcDNVkmMXD23CizEWJqz20go9+I1mOOfU33knS
	YvgUjbimHF+r684bYQVG0D8bfErejwyb0v5++gOExHfuYN+fIl5lsovKpdkRJ1XWiqYCWQlGVOEJF
	Gnc5S1X1Ov+ijneAGchTQjy2bxl93SYoTHVCCuzerYiTjP/wEnBD2+aPGIcXVzaOjwCrGf5uAzyPQ
	2ghh2zEiUi2eENf3ysxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Swg-0000000CPTA-0WSM;
	Tue, 31 Mar 2026 06:51:26 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Swe-0000000CPSn-1RO4
	for linux-riscv@lists.infradead.org;
	Tue, 31 Mar 2026 06:51:25 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-43cff5dafc3so1434003f8f.1
        for <linux-riscv@lists.infradead.org>; Mon, 30 Mar 2026 23:51:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774939882; cv=none;
        d=google.com; s=arc-20240605;
        b=SCT+zc1nFDq9AI71FqzfSW1IiB9fSmcCiDCbe+1ZZ3GaFQHbzigaEIJ5lrEullcrr7
         s7hf3g75kY7zjijgVbiuyBmq5T2v7pYSsORYHeglf5AeEhRtaQUZxudkswcsPqo0hdCr
         5INmoozdNxgPR+W73zjCrMXptSczVhKkFOmqx26GIAwDZQaaFMXiH26sBn3rEPqrmCpy
         VQwd3rpFmmZ1TBEj5X4lbDsnntWyglQUINFtJayyG4lQhZIZ4dOe88bE/FxrL2x+bruQ
         hXFmSnsr8524wUffw9+B/5SWVMf4nUVhESTl0vatKFUWMFAXkFrABXHkb6I2dWtyG3OE
         g5jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XCQsl+ozRn5+ypqqZQEeuLCWJMj0eWq4IY235nukBE0=;
        fh=Z6LWW4BDhu6IgYP4bRwm/Ml0kmZ9EY/PXIT9XPi+clg=;
        b=LDHSvGOqSKvSLvP+zMWd21tv/6Ffn4r04SnscWc3J8+gwDKbN26K64kfLv1poAMlWb
         PzcDN80UJ/E+3hwCS2li0Kk5XcozOUOYJPkiJaYbo1TvLdTEBp4t7VvK+oCzeBD9++n1
         PCqQ7L9DcpfRdTxufdAOTAfv17DQ32fbvUx0LHTMTak9lRevcQiQDd2FaobtvLY9B0ni
         prqahWMqbJp9WtAD18A7RalYVYnRiIhV96v+EwkcPNhVAvDyMRHTojXQdVSskBm+lzcw
         p3m4Sb0RRvWOkIr1dH3zya9yym94DIwf+CTF0dmf++/070LGklEDLBzWE1v+YBzTnLKX
         ZOAQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774939882; x=1775544682; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XCQsl+ozRn5+ypqqZQEeuLCWJMj0eWq4IY235nukBE0=;
        b=e/gaIrTvQYuCmOTyq62uQYlBNDD8wFX6k8qWiknbfb56zpTTMBjlsMp8CocEB3fi4B
         EPMPyvwYZLikN4tqCeNHcUfP0Qphi40njxz0qpARUSKL5XIPM02L/d2yJw0nA3NFMv/h
         qNxyk9iD65sjleDe7AHjvJTIRwDY+0s+Ze8+uxM/JpnQZKN8vUPXpaanD/U8sUHzvNNX
         JywTRWKpHKVM/I1d6Gf5tFRbai955JEyQKw8cHKS8Z1EAlGeiullz8mDxTAv415GroHf
         8zHVmXok25K5BfhjU5cb6hLibyeGmyoOuiU/+zYObNur9sTr4c9FtaLZ3fEKuCQLeJ2F
         vjfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774939882; x=1775544682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XCQsl+ozRn5+ypqqZQEeuLCWJMj0eWq4IY235nukBE0=;
        b=BqV5bf+l5auhIGxoluJWcJ8+e5c5l4DSCaP0UCK4QavPhtJI/NFYpfgWK96A9GfqSf
         7fWJqI5vqHM+T7v63ufTsbybmrxAAxA27b/UTyXMm8U+VjrsIFQK8pj5xCkvU+5jIiEG
         9917z4M5fl15gvipcH+QU3gf28327gfW9zAnogyvwHQVYArdqdj9tzk2oeLf/NYYWPvl
         ya3deJL2M9VE8QpWs3F7bLPTlI6Ac4lQLZ52QOW8aL54XZGRhYYdoDzL9mJxTMUN3YFI
         +Wn2mynn4F6El9BsJby9cnuvGkYOctd3mTrmpLkrttCseH+7UqWsK6163PPNCeYKRfvB
         IbjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUI9Hubxm2ZfD6wbbwxjxIMxwUfcZJ2PdoVixdQ8ra2/cqZR4ybAML7hNK8qmwNBUnB44ApKgb6fw2+pg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzYBvGlK8SDrewXOccPnTvwG9XM8cMEaZzg+GJca7bQ/FrgCMx+
	yzhkvhrf08Ep6yUgBuiTakKmUoqXy8/qaoh6wMxZ6q3fbO/zIgjT8S5SFlrSvA2Z7lvANfoQYMD
	NnUWP9xaTGhsNvwyQuQYMt2lVN4c4PHQ=
X-Gm-Gg: ATEYQzzKzcYuTty4UXOHno0SU29VFs1zer7KA4P4Ph31FcCsFnbNqMwoTQ/xU9G7SYd
	0PbTc5LVrPFZYCAQqyAw/iXhGqwTDCTxo2Yt5NJ18ZMDRKsIMx9MVQb9S31WRXHw0U3keyTICaY
	qjAAMsqGIkJglR+0AxKV9uE1ucW28IwlQZKCi7zwR5uyEQcavqwuuL+XsIMKlUfZkG41KpR09jP
	QLkp3HqiILA66lCTDyIfAxSBWVRiSQ29V5wpC/sSjNV/MaC+OkXCWD5ZykdArgK86oAfqNWXXQk
	iq4HxM8=
X-Received: by 2002:a05:6000:186f:b0:43d:4c:22be with SMTP id
 ffacd0b85a97d-43d004c2495mr9507571f8f.36.1774939881834; Mon, 30 Mar 2026
 23:51:21 -0700 (PDT)
MIME-Version: 1.0
References: <acn9Yha4JufGcQah@adminpc-PowerEdge-R7525> <248cd5c4-e1ac-4d08-a88a-efb472f94752@kernel.org>
In-Reply-To: <248cd5c4-e1ac-4d08-a88a-efb472f94752@kernel.org>
From: Austin Kim <austindh.kim@gmail.com>
Date: Tue, 31 Mar 2026 15:51:08 +0900
X-Gm-Features: AQROBzDZqtX-0mk7FmEAWC6ePiFbVQ4IeZIAMnhvv9-SAVPXk_mNFAspK7ZHEL4
Message-ID: <CADLLry7jQR+V+kMHoAz1kNJsE+w+sF7SQ0cQGec8oLnFaNcCLA@mail.gmail.com>
Subject: Re: [PATCH] riscv: signal: refactor debug logging to use macros
To: Michael Ellerman <mpe@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_235124_400082_94BEC206 
X-CRM114-Status: GOOD (  15.69  )
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

SGVsbG8sIE1pY2hhZWwKCjIwMjbrhYQgM+yblCAzMeydvCAo7ZmUKSBQTSAxMjozNiwgTWljaGFl
bCBFbGxlcm1hbiA8bXBlQGtlcm5lbC5vcmc+64uY7J20IOyekeyEsToKPgo+IE9uIDMwLzMvMjAy
NiAxNTozNCwgQXVzdGluIEtpbSB3cm90ZToKPiA+IEZyb206IEF1c3RpbiBLaW0gPGF1c3Rpbi5r
aW1AbGdlLmNvbT4KPiA+Cj4gPiBSZXBsYWNlIG1hbnVhbCAjaWYgREVCVUdfU0lHIGJsb2NrcyB3
aXRoIGEgdW5pZmllZCBERUJVR1AgbWFjcm8uCj4gPiBUaGlzIHdpbGwgaW1wcm92ZSBjb2RlIHJl
YWRhYmlsaXR5Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEF1c3RpbiBLaW0gPGF1c3Rpbi5raW1A
bGdlLmNvbT4KPiA+IC0tLQo+ID4gICBhcmNoL3Jpc2N2L2tlcm5lbC9jb21wYXRfc2lnbmFsLmMg
fCAxMCArKysrKystLS0tCj4gPiAgIGFyY2gvcmlzY3Yva2VybmVsL3NpZ25hbC5jICAgICAgICB8
IDEwICsrKysrKy0tLS0KPiA+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCA4
IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9jb21w
YXRfc2lnbmFsLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jb21wYXRfc2lnbmFsLmMKPiA+IGluZGV4
IDZlYzRlMzQyNS4uYzgyMjM1YmU3IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwv
Y29tcGF0X3NpZ25hbC5jCj4gPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jb21wYXRfc2lnbmFs
LmMKPiA+IEBAIC0xMiw3ICsxMiwxMSBAQAo+ID4gICAjaW5jbHVkZSA8YXNtL3Vjb250ZXh0Lmg+
Cj4gPiAgICNpbmNsdWRlIDxhc20vdmRzby5oPgo+ID4KPiA+IC0jZGVmaW5lIENPTVBBVF9ERUJV
R19TSUcgMAo+ID4gKyNpZmRlZiBERUJVR19TSUcKPiA+ICsjICBkZWZpbmUgREVCVUdQKGZtdCwg
YXJncy4uLikgcHJfaW5mbygiJXM6ICIgZm10LCBfX2Z1bmNfXywgIyNhcmdzKQo+ID4gKyNlbHNl
Cj4gPiArIyAgZGVmaW5lIERFQlVHUChmbXQsIGFyZ3MuLi4pCj4gPiArI2VuZGlmCj4gPgo+ID4g
ICBzdHJ1Y3QgY29tcGF0X3NpZ2NvbnRleHQgewo+ID4gICAgICAgc3RydWN0IGNvbXBhdF91c2Vy
X3JlZ3Nfc3RydWN0IHNjX3JlZ3M7Cj4gPiBAQCAtMjMzLDExICsyMzcsOSBAQCBpbnQgY29tcGF0
X3NldHVwX3J0X2ZyYW1lKHN0cnVjdCBrc2lnbmFsICprc2lnLCBzaWdzZXRfdCAqc2V0LAo+ID4g
ICAgICAgcmVncy0+YTEgPSAodW5zaWduZWQgbG9uZykoJmZyYW1lLT5pbmZvKTsgLyogYTE6IHNp
Z2luZm8gcG9pbnRlciAqLwo+ID4gICAgICAgcmVncy0+YTIgPSAodW5zaWduZWQgbG9uZykoJmZy
YW1lLT51Yyk7ICAgLyogYTI6IHVjb250ZXh0IHBvaW50ZXIgKi8KPiA+Cj4gPiAtI2lmIENPTVBB
VF9ERUJVR19TSUcKPiA+IC0gICAgIHByX2luZm8oIlNJRyBkZWxpdmVyICglczolZCk6IHNpZz0l
ZCBwYz0lcCByYT0lcCBzcD0lcFxuIiwKPiA+ICsgICAgIERFQlVHUCgiU0lHIGRlbGl2ZXIgKCVz
OiVkKTogc2lnPSVkIHBjPSVwIHJhPSVwIHNwPSVwXG4iLAo+ID4gICAgICAgICAgICAgICBjdXJy
ZW50LT5jb21tLCB0YXNrX3BpZF9ucihjdXJyZW50KSwga3NpZy0+c2lnLAo+ID4gICAgICAgICAg
ICAgICAodm9pZCAqKXJlZ3MtPmVwYywgKHZvaWQgKilyZWdzLT5yYSwgZnJhbWUpOwo+ID4gLSNl
bmRpZgo+ID4KPiA+ICAgICAgIHJldHVybiAwOwo+ID4gICB9Cj4gSXMgdGhlcmUgYW55IHJlYXNv
biBub3QgdG8gdXNlIHByX2RldmVsKCk/Cj4KPiBPciBwcl9kZWJ1ZygpIGlmIGVuYWJsaW5nIGl0
IGF0IHJ1bnRpbWUgaXMgZGVzaXJhYmxlICh3aXRoCj4gQ09ORklHX0RZTkFNSUNfREVCVUc9eSku
CgpUaGFuayB5b3UgZm9yIHRoZSBpZGVhLgpwcl9kZWJ1ZygpIGlzIGFub3RoZXIgZ29vZCBvcHRp
b24sIGFzIGl0IGNhbiBiZSBlbmFibGVkIHdpdGgKQ09ORklHX0RZTkFNSUNfREVCVUc9eS4KVGhl
IGNvZGUgd2lsbCBsb29rIHNpbXBsZXIgdGhpcyB3YXkuIEkgd2lsbCBwcm9wb3NlIGFub3RoZXIg
cGF0Y2guCgpCUiwKQXVzdGluIEtpbQoKPgo+IGNoZWVycwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
