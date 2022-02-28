Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EAE2C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Feb 2022 13:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BZohNVdjuTJP1yWdeOFzFIKD5YzEmDg41S0t0T2adHs=; b=a23CxiOb7nHcun
	R9M+EecloB8zjvwVemadUdZ0em1k6nCv4yNFC6rqfQfuxf91zdtDYHr8g9X8fxRAjtwdDjZE3sCX0
	Z4cJ6Dahd+lkcEZsLH1pKelsMeFJEEZOPIgAKlTDoFxaycfsdvNurG17nXDyITqXUOlz2gxDhGh4I
	Zol9zTrg4TKDR9ToeJPDED4QD0EAPNrkBOJgtfamWN9AS4lJ36xitfj3n8Ly/q5n4sWG3ju5KnJ6F
	qZOXk5Zfs/zuP/jjskO/sIFNPAtFCvqW9sf8cSqwTwu96U3H9AyKRMHgClle8qBiqGu6bgFMDMk/L
	qqqE2Wt3JMqALU35t5XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOfj1-00CQqk-Jm; Mon, 28 Feb 2022 13:06:03 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOfPp-00CJOl-Ss
 for linux-riscv@lists.infradead.org; Mon, 28 Feb 2022 12:46:15 +0000
Received: by mail-pl1-x62e.google.com with SMTP id c9so10655510pll.0
 for <linux-riscv@lists.infradead.org>; Mon, 28 Feb 2022 04:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qwzeJF2B6Di3rDERG8soz+b1Ps+s3Pm44BHmxxR7QCY=;
 b=qtbGBSdD/gQ1lKhk5tZ6TUn/GBPJmKrm1MxIxIzCPIGJqN+39MNgxuN9sqFmhVKrzr
 z291TCh81mpJult+1IktilWv0MmSSu6aapiTKrWFWGGSdPKbd346r3t7VNgjlXPUea5p
 OBZAa47+FhUnEKuD8YGJN8pD4xKnXuZ0O685ncSMMID8t2cv6lbOcX7GU//AhRb3eq1G
 HmMcE/Cy+kaNqMXQwLG6CnCPxUSixb4NiST+caV9tF9LlaEYfTlr5fH2vDrVSIeL7q8s
 KiOohITDLb4tu0K4yFNhLziuSdflP9d3VU9MDDhyBk5zcFUtIDQMAa1IJObVt02DR+71
 gJOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qwzeJF2B6Di3rDERG8soz+b1Ps+s3Pm44BHmxxR7QCY=;
 b=3wK44IpfH6mPLG+U7vZvr/4I9V3wQFF8DZkiz4BTGS31+az6TAoJ8opqqXCUfG7xwR
 kwqyuaAlDTYtTPOQl5pnAcbiL9QUd8TvIKbjJMMWJisGAVtx79+opkbNg5r0r+md94DT
 77WA6xqFEGRgM3My6GT+CZmxi7aZS3YAUxToMsh3H8x7+o2Ib4Iu6X5+3GrOYmF+Eune
 Anvl9SniDJOyrLoji8pcFhMNGfrEmPAMb/B+LWeIt0UIlU1FwgvRg9Ru9bFgjjAoMiVu
 x8ZTHrpwuJXHDRiw2665NoEbwzdrm7UKxMXydnve+CMOQO3wrpGiYuCCIQXDspKS/+ev
 M8Jg==
X-Gm-Message-State: AOAM5334YuSkxrzmfyAlOK4A9Se8CDVJp9tLWmmau4aYClQiw2N2H594
 iP8+SASsVqqyP/FfCIkonto0e/25j7dgz2oGt68=
X-Google-Smtp-Source: ABdhPJyPl3dOQnPhGsi+4kZmEEqOlf28gc2APwLdJ138ZzdPOZ2ylsXazmS2xgNZ0Ss/gw0ULba1JMbNNCHB4ifv7ck=
X-Received: by 2002:a17:90a:ca16:b0:1bc:16a7:e840 with SMTP id
 x22-20020a17090aca1600b001bc16a7e840mr16442697pjt.225.1646052372123; Mon, 28
 Feb 2022 04:46:12 -0800 (PST)
MIME-Version: 1.0
References: <20220224152456.493365-1-kernel@esmil.dk>
 <20220224152456.493365-2-kernel@esmil.dk>
 <87zgme6xna.fsf@DESKTOP-5JD7O8D.localdomain>
In-Reply-To: <87zgme6xna.fsf@DESKTOP-5JD7O8D.localdomain>
From: Emil Renner Berthing <emil.renner.berthing@gmail.com>
Date: Mon, 28 Feb 2022 13:46:00 +0100
Message-ID: <CANBLGczP5OKPsVbs3Ydm9EfHkSoCd=ksYZ6NOnTdmH3Bh2e_fw@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] riscv: Avoid unaligned access when relocating
 modules
To: Samuel Bronson <naesten@gmail.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_044613_992312_E9B62A7F 
X-CRM114-Status: GOOD (  14.09  )
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

T24gTW9uLCAyOCBGZWIgMjAyMiBhdCAwMTo0NSwgU2FtdWVsIEJyb25zb24gPG5hZXN0ZW5AZ21h
aWwuY29tPiB3cm90ZToKPgo+IEVtaWwgUmVubmVyIEJlcnRoaW5nIDxrZXJuZWxAZXNtaWwuZGs+
IHdyaXRlczoKPgo+ID4gV2l0aCB0aGUgQy1leHRlbnNpb24gcmVndWxhciAzMmJpdCBpbnN0cnVj
dGlvbnMgYXJlIG5vdAo+ID4gbmVjZXNzYXJpbHkgYWxpZ25lZCBvbiA0LWJ5dGUgYm91bmRhcmll
cy4gUklTQy1WIGluc3RydWN0aW9ucwo+ID4gYXJlIGluIGZhY3QgYW4gb3JkZXJlZCBsaXN0IG9m
IDE2Yml0IG5hdGl2ZS1lbmRpYW4KPiA+ICJwYXJjZWxzIiwgc28gYWNjZXNzIHRoZSBpbnN0cnVj
dGlvbiBhcyBzdWNoLgo+Cj4gSG9sZCBvbiBhIG1pbnV0ZSwgdGhpcyBpcyB3aGF0IGl0IHNheXMg
aW4gbXkgY29weSBvZiB0aGUgVW5wcml2aWxlZ2VkCj4gSVNBOgo+Cj4gLC0tLS0KPiB8IFJJU0Mt
ViBiYXNlIElTQXMgaGF2ZSBlaXRoZXIgbGl0dGxlLWVuZGlhbiBvciBiaWctZW5kaWFuIG1lbW9y
eSBzeXN0ZW1zLAo+IHwgd2l0aCB0aGUgcHJpdmlsZWdlZCBhcmNoaXRlY3R1cmUgZnVydGhlciBk
ZWZpbmluZyBiaS1lbmRpYW4gb3BlcmF0aW9uLgo+IHwgSW5zdHJ1Y3Rpb25zIGFyZSBzdG9yZWQg
aW4gbWVtb3J5IGFzIGEgc2VxdWVuY2Ugb2YgMTYtYml0ICpsaXR0bGUtZW5kaWFuKgo+IHwgcGFy
Y2VscywgcmVnYXJkbGVzcyBvZiBtZW1vcnkgc3lzdGVtIGVuZGlhbm5lc3MuICBQYXJjZWxzIGZv
cm1pbmcgb25lCj4gfCBpbnN0cnVjdGlvbiBhcmUgc3RvcmVkIGF0IGluY3JlYXNpbmcgaGFsZndv
cmQgYWRkcmVzc2VzLCB3aXRoIHRoZQo+IHwgKmxvd2VzdC1hZGRyZXNzZWQgcGFyY2VsIGhvbGRp
bmcgdGhlIGxvd2VzdC1udW1iZXJlZCBiaXRzKiBpbiB0aGUKPiB8IGluc3RydWN0aW9uIHNwZWNp
ZmljYXRpb24uCj4gYC0tLS0KPiBbRW1waGFzaXMgbWluZS5dCj4KPiBJbiBvdGhlciB3b3Jkcywg
dGhlIHBhcmNlbHMgYXJlIGxpdHRsZSBlbmRpYW4sIGFuZCB0aGV5J3JlIGFycmFuZ2VkIGluCj4g
bGl0dGxlLWVuZGlhbiBvcmRlci4gIFN5c3RlbSBlbmRpYW5uZXNzIGRvZXNuJ3QgbWF0dGVyLCBp
dCBjb2xsYXBzZXMgdG8KPiBwbGFpbiBvbGQgbGl0dGxlLWVuZGlhbi4KCldvdywgdGhpcyBhY3R1
YWxseSBjaGFuZ2VkIHNpbmNlIEkgd3JvdGUgdGhpcyBjb2RlLCBuaWNlIGNhdGNoLiBJbgpzcGVj
cyB1cCB1bnRpbCB0aGUgbGF0ZXN0IGl0IHVzZWQgdG8gc2F5ICJJbnN0cnVjdGlvbnMgYXJlIHN0
b3JlZCBpbgptZW1vcnkgd2l0aCBlYWNoIDE2LWJpdCBwYXJjZWwKc3RvcmVkIGluIGEgbWVtb3J5
IGhhbGZ3b3JkIGFjY29yZGluZyB0byB0aGUgaW1wbGVtZW50YXRpb27igJlzIG5hdHVyYWwKZW5k
aWFubmVzcyIuIEkgaG9wZSBub29uZSBkZXNpZ25lZCBhIGJpZy1lbmRpYW4gY29yZSBiZWZvcmUg
dGhleQpjaGFuZ2VkIGl0LgoKPiAoSSdtIHJlYWxseSBub3Qgc3VyZSB3aHkgdGhleSBkZXNjcmli
ZSB0aGUgb3JkZXJpbmcgaW4gc3VjaCBhCj4gcm91bmQtYWJvdXQgd2F5OyBJIGFzc3VtZSB0aGF0
J3MgdGhlIHNvdXJjZSBvZiB0aGUgY29uZnVzaW9uIGhlcmU/KQoKSSBndWVzcyB0aGUgcm91bmQt
YWJvdXQgd2F5IGlzIGV4YWN0bHkgYmVjYXVzZSB0aGUgcGFyY2VscyB1c2VkIHRvIGJlCm5hdGl2
ZS1lbmRpYW4sIGJ1dCB0aGUgb3JkZXIgb2YgdGhlIHBhcmNlbHMgYWxzd2F5cyBsaXR0bGUtZW5k
aWFuLgoKL0VtaWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
