Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3850C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jan 2022 20:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8dZ2dzdvInsjkn8UL+g7eYPL9JCySdXkMWK1VRpFz1c=; b=czvKbCg084xJzB
	2khCWn2ledSSdzlfIY2qU6dvRC9cyE6T4vLEgIrkt0OMz5JKhGSQTAkbq/N6ayMrddQO/DTXinPX7
	tvRXla0Usl9hExbueR6GQA2P+ipXKBn4qdG19BTzL9Q/w81AAjitVgbZueQ2wp+sO04WrJC4yHjoz
	yvgAgmbXQpxYjxYhMRP916nugIQ/6lx3y29L/PDH8xjJMwtMXf+8Ya2nD/r0qypGij3PDK/hkVFz2
	G/apF0egp1wJcbTh4F7Ouv8Fe3h3W+thQvfLu2rYC4VEV8emjYUwaLgfIq1k4Bn1Jh8vVBBIAHNzS
	IlimjmpJTmN7n0iN8Xaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAHt2-007O9f-8z; Wed, 19 Jan 2022 20:48:56 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAHsz-007O7O-Ls
 for linux-riscv@lists.infradead.org; Wed, 19 Jan 2022 20:48:54 +0000
Received: by mail-wm1-x335.google.com with SMTP id
 i187-20020a1c3bc4000000b0034d2ed1be2aso15668019wma.1
 for <linux-riscv@lists.infradead.org>; Wed, 19 Jan 2022 12:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jrtc27.com; s=gmail.jrtc27.user;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=VUx/FixPaEe6YT7F4YysqIz+YufT/bqww2Y78WeYZFs=;
 b=mDIxsahHNCOZMq2u6spiErkwTPbcHGPtRXj5dQGR5QmB0ZU56Z5BoDCoj6iItpBlpP
 JEf8jxKyVWUNnSHQQPp/RGtng9w0DuZWAIy34RvdVllTdACcMBuD7IMtFvR2XOxiwj1A
 OUvbAW/JQyzGfe/uxCb51JZL9WRfbnvJ0DPXIdjR5dey5yZtYGtPVcxGbHzNDGx7f0Tm
 L6nEnANQCuzEiaN5epZkXOHaiwT/mLdsO4qK5A2PF2DnrfcbNuAnVrWzlZe7T2NL1jZe
 bU1mWXESbAHBJcI7wjw+VaPQB7pgKQPfgZamh5otlqTcLIQw8nRGUsDNJRqTONOaWgpk
 TQzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=VUx/FixPaEe6YT7F4YysqIz+YufT/bqww2Y78WeYZFs=;
 b=x9SZlRYyrImYwTfSUaBZhkXWB+LNOnpEQ9JMJX1d6XdIBGNRgH0mNuHyNtSYnx1Atq
 yixFmiLX8o+92Zzfj987w4pj16d3R77UmiK6xPIvVxzc1fO71vBHtNReT3fCKgWskPOl
 q454v1flFPGZCnsa5QiTy0O0+6xRpqIcLyAoj4lU6FX5CS19/+iPgmhESNTHhDFAKBsE
 aZIM1v52GBCjovNoNrvv275DR1q800p++E4Mm1URbByKdFRhq2MuX3DXjlVdrr9s5anW
 SLoftoEtN65TBv0p8tn95JIrkvixTg++k1xkc0GQYV5a4w72KLK0b3yxF8Af92o6JDtp
 VHMA==
X-Gm-Message-State: AOAM531pMqWQfJ5/Rz9Sm00UxHv65KsW1qVIdWvNBXBXT9C0Sp7/bN2n
 g8l9LAGY9j/xm/2BynbDXgndbA==
X-Google-Smtp-Source: ABdhPJxNQ7+g3Z8/6ZFolPPK7IHxtQZ8opBbkLpaHkG7DAXF52LD+FGIve4H0T+pKSZfKCmggxi1ew==
X-Received: by 2002:a1c:4d09:: with SMTP id o9mr5402464wmh.22.1642625329512;
 Wed, 19 Jan 2022 12:48:49 -0800 (PST)
Received: from smtpclient.apple (global-5-142.nat-2.net.cam.ac.uk.
 [131.111.5.142])
 by smtp.gmail.com with ESMTPSA id d11sm1134397wri.65.2022.01.19.12.48.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Jan 2022 12:48:49 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.40.0.1.81\))
Subject: Re: [PATCH] riscv: eliminate unreliable __builtin_frame_address(1)
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <8735lj78wu.fsf@igel.home>
Date: Wed, 19 Jan 2022 20:48:48 +0000
Cc: Changbin Du <changbin.du@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>, linux-kernel@vger.kernel.org
Message-Id: <8F8D535F-3637-4BC7-8853-B709EC5D14C9@jrtc27.com>
References: <20220117154433.3124-1-changbin.du@gmail.com>
 <C2470F2D-9E45-49D7-A03B-E6A7BB4B9738@jrtc27.com> <87v8yg6lhf.fsf@igel.home>
 <AAAA7852-EBCA-47A3-B74E-A425023468C6@jrtc27.com> <8735lj78wu.fsf@igel.home>
To: Andreas Schwab <schwab@linux-m68k.org>
X-Mailer: Apple Mail (2.3693.40.0.1.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_124853_800678_9FF86A74 
X-CRM114-Status: UNSURE (   9.41  )
X-CRM114-Notice: Please train this message.
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

T24gMTkgSmFuIDIwMjIsIGF0IDIwOjQ0LCBBbmRyZWFzIFNjaHdhYiA8c2Nod2FiQGxpbnV4LW02
OGsub3JnPiB3cm90ZToKPiAKPiBPbiBKYW4gMTkgMjAyMiwgSmVzc2ljYSBDbGFya2Ugd3JvdGU6
Cj4gCj4+IExlYWYgZnVuY3Rpb25zIGJ5IGRlZmluaXRpb24gZG9u4oCZdCBoYXZlIGNhbGxlZXMg
dGhhdCBhcmUgdHJ5aW5nIHRvIHJlYWQKPj4gdGhlaXIgZnJhbWUgcG9pbnRlciBzbyBhcmVu4oCZ
dCByZWxldmFudCBoZXJlLgo+IAo+ID8/PyBfX2J1aWx0aW5fZnJhbWVfYWRkcmVzcygxKSBpcyBh
Ym91dCB0aGUgY2FsbGVyLCBub3QgdGhlIGNhbGxlZS4KCk15IHBvaW50IGlzIHRoYXQgdGhlIG9u
bHkgdGhpbmcgdGhhdCBjYW4gcG9zc2libHkgcmVhZCB0aGUgaW5jb21pbmcKZnJhbWUgcG9pbnRl
ciBvZiBhIGxlYWYgZnVuY3Rpb24gaXMgdGhlIGxlYWYgZnVuY3Rpb24gaXRzZWxmLCBhbmQgc2lu
Y2UKaXQga25vd3Mgd2hlcmUgaXTigJlzIHB1dHRpbmcgaXQgdGhlbiB0aGVyZSBpcyBubyBBQkkg
aXNzdWUsIGl0IGp1c3QKcmVtZW1iZXJzIHdoZXJlIGl0IHB1dCBpdCBhbmQgbG9hZHMgaXQgZnJv
bSB0aGVyZS4gVGhlIGlzc3VlIG9mIHdoZXRoZXIKaXTigJlzIHBhcnQgb2YgdGhlIEFCSSBvciBu
b3Qgb25seSBhcmlzZXMgd2hlbiB5b3XigJlyZSB0cnlpbmcgdG8gcmVhZCB0aGUKaW5jb21pbmcg
ZnJhbWUgcG9pbnRlciBmcm9tIGEgY2FsbGVyLCB3aGljaCBieSBkZWZpbml0aW9uIGlzIG5vdCBh
IGxlYWYKZnVuY3Rpb24uCgpKZXNzCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
