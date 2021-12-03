Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7CCFC433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Dec 2021 10:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KnKrE4REXiRGU9Q3ekZ+HyVpI/VnsL8l5c2aisZv4Pw=; b=1zIZkQWnhpaUCZ
	ro7KQqmQXfzwqJWqMPjA0ub1rrt2dnCprQYCnfFZf2TMAsJ4zSytfN3Snv5wlRUJEiIZwaTxtBJ8O
	M+/AMkRde86DwTljmWhpMBP0owYSs5OgJrwekETrZGHqI8ssHu7plT1EotwRVyIdrVvyu06hlHwIz
	PSrStJJEuxkbu9eKrEd+oIbO593z9P6QQmIuI4eqk7UPLMb27C2DmSvCsSZZBvUICh3Q9StVf5/i0
	p20A7znQGusYEMVRoOKMWrNF2CxuewVsUYEfT1FmAWvhy/ZW8x/zWajCv5o6vbtyQc/boIJ6a9whG
	W8gIbugExbQkTZJORhrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mt69V-00FGEo-2E; Fri, 03 Dec 2021 10:50:53 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mt69S-00FGCN-3p
 for linux-riscv@lists.infradead.org; Fri, 03 Dec 2021 10:50:51 +0000
Received: by mail-wr1-x435.google.com with SMTP id i5so4869303wrb.2
 for <linux-riscv@lists.infradead.org>; Fri, 03 Dec 2021 02:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jrtc27.com; s=gmail.jrtc27.user;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=QcF+l5bxXvtlevCx7Zr3XRmHnTSAGcextsc6b2RTbnE=;
 b=REtLPeXKrovJCDXe1uVHNen+AMMqYqS6tOv73PooICV0Gul/ZqoZrBJxPgph99Vk/y
 90QeFD+RPq//ggQZnYAowJ2BZdI67r1KDCeEeeRVKdUXHIFjyNFN81Lg4t3q7gBd3yKh
 GPNgWCB0EaVOJeuXm6TMh8xJSXxib7jvaw+7GAJKggEQEp4BF2uJew3rpq77G//+VA60
 SbBpeMFMCfsHMSygAmb9B5C2lsQ3vXaWQ5T2TEnTYBIF0OG5KeozlZurU5SMoSHjz+Wg
 SIZPmnXET3Fsmb9vZy7ObI7cn5p8s0lTc0dPi6rvHWtZOA9zWbO8W05XvRX+CACCUCO1
 z2Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=QcF+l5bxXvtlevCx7Zr3XRmHnTSAGcextsc6b2RTbnE=;
 b=xTDeH1BT7eFs9VcUX0T893Gj9CFc/Lc3Jg98osS9tBGnDi6dDE+upPjGKJH/JukS4P
 W5gAFhPDj2ZLex6kHe+2/T7XiI8Ht7ny2R+h9uhblv9UrqzVDFCv/IRBKZPORWPrW2eN
 jdXc/Uc2Ol5erTEr1VSATQ5zaEvCwPnhuodZCeUwVwuudZzx7meSDyaWkGm8DsujTWil
 I9rweJH+vjTuP9NXYoK6gl4Lm1ysPwE2MMelfVF9uPDkY/c1rToA0EWhNQglJyQZfrHU
 gwv4tqJ5v0MQZautEAVxzOaWlGxkpAsuBBJw9ahFeb0s9S1VAUfNIgxkpeU1tWtGuFUg
 44FA==
X-Gm-Message-State: AOAM5332mMj6DG1WnS9So48ldH3IlZ26rSAJbe3NXLitCOof0rcqIXdI
 NnbrKy1Q5Ad7qzL1fIzs2asseg==
X-Google-Smtp-Source: ABdhPJwtE7MY6B9ILicxX+ipAFjRWWhoqcsyqm9KXIhK6J1ESCTtU6qGOsrgXqzeLU46AdZEjiOiEA==
X-Received: by 2002:a5d:42cf:: with SMTP id t15mr20888702wrr.444.1638528647512; 
 Fri, 03 Dec 2021 02:50:47 -0800 (PST)
Received: from smtpclient.apple (global-5-141.nat-2.net.cam.ac.uk.
 [131.111.5.141])
 by smtp.gmail.com with ESMTPSA id o10sm2897628wri.15.2021.12.03.02.50.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 Dec 2021 02:50:47 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH 1/1] riscv: dts: fu740: Add PDMA node
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20211203095744.1717706-2-v.v.mitrofanov@yadro.com>
Date: Fri, 3 Dec 2021 10:50:46 +0000
Cc: Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 David Abdurachmanov <david.abdurachmanov@sifive.com>,
 Yash Shah <yash.shah@sifive.com>, Atish Patra <atish.patra@wdc.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 devicetree <devicetree@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, linux-kernel@vger.kernel.org
Message-Id: <DC14F9FB-D4E8-48DC-958A-CFEF2115F803@jrtc27.com>
References: <20211203095744.1717706-1-v.v.mitrofanov@yadro.com>
 <20211203095744.1717706-2-v.v.mitrofanov@yadro.com>
To: "v.v.mitrofanov" <v.v.mitrofanov@yadro.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_025050_202405_0BA2B33C 
X-CRM114-Status: GOOD (  14.84  )
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

T24gMyBEZWMgMjAyMSwgYXQgMDk6NTcsIHYudi5taXRyb2Zhbm92IDx2LnYubWl0cm9mYW5vdkB5
YWRyby5jb20+IHdyb3RlOgo+IAo+IEhpRml2ZSB1bm1hdGNoZWQgc3VwcG9ydHMgUERNQSBidXQg
aXMgbm90IGltcGxlbWVudGVkIGluIERULgo+IAo+IEFkZCB0aGUgUERNQSBub2RlIGluIFNpRml2
ZSBGVTc0MCBzb2Mtc3BlY2lmaWMgRFQgZmlsZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiB2LnYubWl0
cm9mYW5vdiA8di52Lm1pdHJvZmFub3ZAeWFkcm8uY29tPgo+IC0tLQo+IGFyY2gvcmlzY3YvYm9v
dC9kdHMvc2lmaXZlL2Z1NzQwLWMwMDAuZHRzaSB8IDcgKysrKysrKwo+IDEgZmlsZSBjaGFuZ2Vk
LCA3IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy9z
aWZpdmUvZnU3NDAtYzAwMC5kdHNpIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zaWZpdmUvZnU3NDAt
YzAwMC5kdHNpCj4gaW5kZXggNjRmZjJlNzU4MzM2Li44MzNmYjRmNDM3NmIgMTAwNjQ0Cj4gLS0t
IGEvYXJjaC9yaXNjdi9ib290L2R0cy9zaWZpdmUvZnU3NDAtYzAwMC5kdHNpCj4gKysrIGIvYXJj
aC9yaXNjdi9ib290L2R0cy9zaWZpdmUvZnU3NDAtYzAwMC5kdHNpCj4gQEAgLTE2NCw2ICsxNjQs
MTMgQEAgcHJjaTogY2xvY2stY29udHJvbGxlckAxMDAwMDAwMCB7Cj4gCQkJI2Nsb2NrLWNlbGxz
ID0gPDE+Owo+IAkJCSNyZXNldC1jZWxscyA9IDwxPjsKPiAJCX07Cj4gKwkJZG1hOiBkbWFAMzAw
MDAwMCB7Cj4gKwkJCWNvbXBhdGlibGUgPSAic2lmaXZlLGZ1NTQwLWMwMDAtcGRtYSI7CgpJIGtu
b3cgdGhlIFBMSUMgYW5kIENHRU0gZGV2aWNlcyBhYnVzZSBmdTU0MC1zcGVjaWZpYyBjb21wYXRp
YmxlCnN0cmluZ3MgKHdoaWNoIGl0IHdvdWxkIGJlIGdyZWF0IHRvIGZpeDsgRnJlZUJTRCBpcyBh
bHJlYWR5IHByZXBhcmVkCmZvciB0aGF0LCB0aG91Z2ggaXTigJlkIGFsc28gYmUgbmljZSB0byBp
bnRyb2R1Y2UgYSBnZW5lcmljIGNvbXBhdGlibGUKc3RyaW5nIGZvciB0aGUgU2lGaXZlIENHRU0g
cmF0aGVyIHRoYW4gaGF2aW5nIGp1c3QgYSBTb0Mtc3BlY2lmaWMgb25lCmdpdmVuIHRoZSBGVTU0
MCBhbmQgRlU3NDAgaGF2ZSB0aGUgc2FtZSBpbnRlcmZhY2UpLCBidXQgbGV04oCZcyBub3QgbWFr
ZQp0aGluZ3Mgd29yc2UuIFRoaXMgc2hvdWxkIHNheSBmdTc0MCwgYW5kIHRoZXJlIHNob3VsZCBh
bHNvIGJlIGEgZ2VuZXJpYwpTaUZpdmUgUERNQSBjb21wYXRpYmxlIHNvIHdlIGRvbuKAmXQgbmVl
ZCB0byBhZGQgYSBuZXcgY29tcGF0aWJsZSB0byBhbgpvdGhlcndpc2UtdW5jaGFuZ2VkIGRyaXZl
ciBldmVyeSB0aW1lIGEgbmV3IFNpRml2ZSBTb0MgYXBwZWFycy4KCkplc3MKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
