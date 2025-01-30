Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16996C0218A
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jan 2025 17:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wPOj051BxGisPqQ1U9ipIA2mxnyrJ0MKc8PpbCj1oe4=; b=NJPqHzFy1MKaIw
	ehOrtiyHu+2vnxx0z8hbLia/NrTDYhbhbwbyXsUVId5fblRMDnQmJcxZe2oUmrFpLmUXL3ig4MaA8
	lubeLwcnWpQLKjNBR1V7jrZK9LPki/b/ZzLfNDiNgMeUJSEZS6UXtvteDzSvepWPz3AHYaMpRReRx
	IByw5Aej3C3eLzpkIXcJfPwC9xDeOHkqfb+5Xkoe8HA51iiKROI0PYXVAfDAvgY4iKorGr1KWLLCQ
	PMo+GYJsUeE3OGd66bjAlK9QRZ4UDIstKgRclqrIIjijIvYIAqLj6y1PtXy1zy272+uwgfHJ0c4ax
	vrNmzNcZHmayPDGwAjww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdYEa-00000009GZW-2thx;
	Thu, 30 Jan 2025 17:21:44 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdYEY-00000009GZ9-1dbZ
	for linux-riscv@lists.infradead.org;
	Thu, 30 Jan 2025 17:21:43 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43675b1155bso12552255e9.2
        for <linux-riscv@lists.infradead.org>; Thu, 30 Jan 2025 09:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1738257700; x=1738862500; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EmlbAWWBKZdvIU2V9lLarLuH6pI9xLKB4n4tT0QWAsA=;
        b=nqULsPh6SIFL/zlTA7yx45kGFPL/StS1Bb7EhKDADpK+DFjhdBd7U1hlPWhD/ezO9n
         ILXS8NrMgncJIIepEErdbmBtkLXAnILwqvbIGulHj2Rj+cUuXGMzBOz0KK3ImO1bEMta
         XDDcDHDTR3fgnrxZ4OPqtNEIdC+c3uzBicQoeUgt0MA0ix6A09A2gQwZRSqCsfh1udes
         CrOGfSkX+3QqFwOH65q1GZTCCOO/xAnmOuwcCbmQw3FkQ778OKGIIMPJzDbWA2bVAyR3
         S6nMMTu2i+7gpQWvprpxVPzJYkAYlLjsY2c0GokMWPNiAgvYRkoAt4v3lhD0kVyFxKrC
         F4mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738257700; x=1738862500;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EmlbAWWBKZdvIU2V9lLarLuH6pI9xLKB4n4tT0QWAsA=;
        b=c7THrzLHy8tcFyXIpNGjcxuXichaxRnpt63bzYHGFGNEL/Vbjo5QRXbNLFAuSlZgUW
         qCtBflFdYNK0P7JsK8vifVVgVzZ0YarK9eTbL/x5QyCM/61h/ZBFCLckDNzCx7TeSxqr
         T13KuhKowYhqWYp4TJva85/ypqzGG/7NWd9EVH4+pSR2ro2xeEkz+ptahAlzPl6Ako3X
         MSVRWQ6ShC8j4aCvS/lnq+e8xnICtCNPgaJ3R+q2YiUitWUFcTzD7brd4TnyNFzTZBzi
         MquRk0v30JHiFNHX9uSbVJSdgM6hd6JDTcej4leuSTpAyA1K2LRCgKkHsdGgq577Qaby
         V6tg==
X-Forwarded-Encrypted: i=1; AJvYcCVqQWQ01BqR8469lO4aJQRmdEPCTnMrYVyZ8cjeEC3+tHPlmpGOSbnewiYd42Oe4ziWkK3PDLpYXNRfPA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4daQrPoWFw5PwNBEI9xKLtIRN4gLN+hZtgIJmOaeRo405YD22
	lviNNtZe5wBeTYYCEZ1bCRQk3q61fBG6XPNjUZbvgMOMlV5QYke873XIktihJUs=
X-Gm-Gg: ASbGncsF/xI2rp/3joYCeISp5uBXCNP4CJusgFres8Y7pRUhbAxi3ms3gV9tcsmjeZM
	Ue6RerInisl0COJd4dGtxovbD8ntXylfE6k9Z/wqVQOMikxdPRwiVPmHPU4V8yAW9U4sbj/miSj
	6LCphBo76RixwM8pG7rTRPKvS6UzN+xJZGVviL/WuBMm/4SttVCnM++artdGj+AJHg3a6OZlRQZ
	S2ZoJiRJNFqZ+ucZkintPEO0mGK9GyPNDDJuvy9LDIn+xh7Fl/VMEGhKDUjpvij9/RaU56ZIrIx
	MgeZ2iOW/sVo8OxaXhcuU6Jm03+T
X-Google-Smtp-Source: AGHT+IEA3QinVd6YP+HnUwsrfnbEDxZBHCObVP3XKrEUyZXRM0hNCM4PGW5LxoktwFLYP/PvE7wd0A==
X-Received: by 2002:a05:600c:3149:b0:434:fd15:3adc with SMTP id 5b1f17b1804b1-438dc424f5emr62875505e9.25.1738257699900;
        Thu, 30 Jan 2025 09:21:39 -0800 (PST)
Received: from smtpclient.apple ([131.111.5.201])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec02bsm2593578f8f.13.2025.01.30.09.21.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Jan 2025 09:21:39 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: [PATCH] riscv/atomic: Do proper sign extension also for unsigned
 in arch_cmpxchg
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <mvmwmec2t7u.fsf@suse.de>
Date: Thu, 30 Jan 2025 17:21:28 +0000
Cc: Alexandre Ghiti <alex@ghiti.fr>,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <CC2D9220-F8DE-4CC8-ACAD-7B1A21E276FE@jrtc27.com>
References: <mvmed0k4prh.fsf@suse.de>
 <c9cbc2be-d1fd-44ef-aa14-fd25a5ff8490@ghiti.fr> <mvm5xlw4anb.fsf@suse.de>
 <ac53a62e-4f89-49c9-a755-fdfa7a582337@ghiti.fr> <mvmwmec2t7u.fsf@suse.de>
To: Andreas Schwab <schwab@suse.de>
X-Mailer: Apple Mail (2.3826.300.87.4.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_092142_447995_04DF6572 
X-CRM114-Status: GOOD (  10.67  )
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

T24gMzAgSmFuIDIwMjUsIGF0IDE1OjUzLCBBbmRyZWFzIFNjaHdhYiA8c2Nod2FiQHN1c2UuZGU+
IHdyb3RlOgo+IAo+IE9uIEphbiAzMCAyMDI1LCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4gCj4+
IGEyIGlzIHVzZWQgYXMgaXQgaXMgcGFzc2VkIGJ5IHRoZSBjYWxsaW5nIGZ1bmN0aW9uLCBzbyB3
ZSBjYW4ndCBiZSBzdXJlIGEyCj4+IGlzIHNpZ24gZXh0ZW5kZWQgdG8gbWUsIHdoYXQgYW0gSSBt
aXNzaW5nPwo+IAo+IDMyLWJpdCBzY2FsYXIgYXJndW1lbnRzIGFyZSBndWFyYW50ZWVkIHRvIGJl
IHNpZ24gZXh0ZW5kZWQgb24gZW50cnkuCgpGaXJzdGx5LCB0aGUgY2FsbGluZyBjb252ZW50aW9u
IGlzIGlycmVsZXZhbnQgaWYgdGhlIGZ1bmN0aW9uIGlzCmlubGluZWQsIHdoaWNoIHRoaXMgYWxt
b3N0IGFsd2F5cyB3aWxsIGJlLgoKU2Vjb25kbHksIHdoaWxzdCBHQ0MgKHN0aWxsPykgbWFpbnRh
aW5zIHRoZSBpbnZhcmlhbnQgdGhhdCAzMi1iaXQKcmVnaXN0ZXJzIGFyZSBrZXB0IHNpZ24tZXh0
ZW5kZWQgaW4gcmVnaXN0ZXJzIG9uIFJJU0MtViwgYW5kIHRoZXJl4oCZcyBhCm5vbi1ub3JtYXRp
dmUgbm90ZSBpbiB0aGUgdW5wcml2aWxlZ2VkIHNwZWMgYWJvdXQgdGhpcywgTExWTSBkb2VzIG5v
dCwKYW55IGV4dHJhIGJpdHMgYXJlIHdob2xseSB1bnNwZWNpZmllZCwgc28geW91IG11c3Qgbm90
IHdyaXRlIGlubGluZQphc3NlbWJseSB0aGF0IGRlcGVuZHMgb24gdGhlbSBiZWluZyB3ZWxsLWRl
ZmluZSwgZWl0aGVyIGJ5IGlnbm9yaW5nIHRoZQpiaXRzIG9yIGJ5IGNvbnZlcnRpbmcgeW91ciBh
cmd1bWVudHMgdG8gYmUgd2hvbGUtcmVnaXN0ZXIgdHlwZXMuIElmCnlvdXIgY29tcGlsZXIgaGFz
IGFscmVhZHkgZXh0ZW5kZWQgdGhlIHZhbHVlIGluIHRoZSBtYW5uZXIgeW91IGNhcmUKYWJvdXQg
dGhlbiB0aGF04oCZbGwgYmUgYSBuby1vcCwgYW5kIGlmIGl0IGhhc27igJl0IHRoZW4gaXTigJls
bCBkbyB3aGF0IHlvdQpuZWVkLgoKV2UgaGFkIGFuIGlzc3VlIGxpa2UgdGhpcyB5ZWFycyBhZ28g
aW4gRnJlZUJTRCAoYWxzbyBmb3IgYSB1aW50MzJfdApDQVMpIGFuZCB0aGlzIHdhcyB0aGUgY29u
Y2x1c2lvbiBJIHJlYWNoZWQgWzFdLgoKSmVzcwoKWzFdIGh0dHBzOi8vcmV2aWV3cy5mcmVlYnNk
Lm9yZy9EMjIwODQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
