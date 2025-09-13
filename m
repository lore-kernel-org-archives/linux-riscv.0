Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E5E2CAC587
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Sep 2025 09:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xoWA/3EJZfBghcT5mXW5wale0brC/GcbtAEXKyWFjU8=; b=ucNFRekfHwtty7
	KZkFmeYx5ErLVEzNrxVnO7rUD09rkcCfizkDP580truE1RCyD5umPBUt0jTigkTQNFOOQWSka7DXc
	GZHuBnIKIujn7L4NXil06ILBa1yczSDHJrXad6XDwdAinWxuB/+PdOkpnzyEFIMtTTP3exUEAiMyr
	4MK1XPTsvKWJO8wQuzIHhgVZPaNBe9LMMpL0aISY/A3KT2V5kW+dx4rvOdWPERDmhE3+E6wBsYByt
	BP1d/WVBM3jte8oMUDRGX2t9aoPCa6AV8nPre20GdEj3wcAxs5/sBznif2MdSWxo+eFSLQJzxT3VX
	zRViJwGlhc67WIH3+29w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxMZN-0000000E6nV-471F;
	Sat, 13 Sep 2025 09:29:21 +0000
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxMZK-0000000E6n2-3zne
	for linux-riscv@lists.infradead.org;
	Sat, 13 Sep 2025 09:29:20 +0000
Received: by mail-ua1-x932.google.com with SMTP id a1e0cc1a2514c-89e5b87f406so722898241.0
        for <linux-riscv@lists.infradead.org>; Sat, 13 Sep 2025 02:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757755757; x=1758360557; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3hpXAGaVCNI8VKWlBxzDF3/2pMhCFKKzKfanUfijSGo=;
        b=cZDZgUTupbig8QkxnQKQ94YPqUrqJv3rICmji0EgLiXFniMBP8ok8KgfekqR/wSTsV
         iCuKUWkZSMnKzJGFugQIfrItz7EhAaC0aVcfxGojy5D/ZlZHUW0gChov7sZL8KN/tUZ1
         fuAWd08UvK1yVFhwWBbhU5+WuWL9B920YTKq8XWKhiJO7PKk24gICPm2E1Z9hiTzTZIW
         BHBrHRpvtTJKMVhUefw4L7P/paW5cZqci8yKsnvWKX9V6njJeku71/FKorwoYLhdsaQ1
         IChdu7NH89+MeNZ0IfYIjHNs5WGlDRFregPDD51SFmqAmV0WmoRIPlT+8vM65uwewBsC
         xjig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757755757; x=1758360557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3hpXAGaVCNI8VKWlBxzDF3/2pMhCFKKzKfanUfijSGo=;
        b=Mxz/ccYbus0GDyMQPUd3PEnwFYdooMt/0JgxxkbhT9CMadAXsJi7TcipafFvBP3or9
         0SaX4yQpQ6dOjCAc7ZX45Q0j7hmDxFEP47NK5JVL5A2ZgM4vCyJBdGkLfBnSiqCMU9SO
         0HFbYr7Ynsq5Ksj83RUhUNm/CtoNd80JE6bpCFZ8eOjQN07mNqDUPzIrZaSbPPx+jRHx
         hJZ+t8jFU385Rv2G8kqfBBH07gH+Xl9FzlI9Bvb9k11z76tvhvctIRl0QUiE5+/zDSKO
         rl2kfPGea7HBrcM3oBslof/ZLH24RsfIbXuVNwBTWSfc4RWItOUgiU9RfMhULAzUiNha
         xP0A==
X-Forwarded-Encrypted: i=1; AJvYcCXquno4rwT/DJK8R5tL3pOjcY1rOTroPSZIUgf3mVdt7r+MHaN0GpeUp04GlxIwMLNjYfjnxehlB3FZhg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyt21rUkFMxVxSU+Io9ogmfE0t78LDarUKeggGZ8AAjBP2/BYnp
	yXlMZj1jbcsQyPbpqeyDz2X7CE6zOUINZBOWC7/xhEflIDZVGqNdYXE7Jia9uQAKaDs8ubFtPs6
	vubBNY8vvn/5R1eWvif5yQOYAU5HyLbM=
X-Gm-Gg: ASbGncv0xuIx5JAtjEh8l5XMN9qEUt2Nx/dy6Jqw4rpcdui1GqUNoQ/RIQzNCOA9/UR
	BOJd6UqPAqjKZAxG45syhRdxoKw9CKK+1eeyIdnDe6n87nBkwfr4WQMlXlyBrvzpHBxqrmel2AE
	K8GyNm5YZAxHTwFAVFhB3M54Sg1BgURldr9GVVZffCN2Zvafw1y9360DVgu9YvyDLlwaGCPTkIC
	p3i8fo=
X-Google-Smtp-Source: AGHT+IF1tpIgRKc0Kjd90cmIEFUZM2Fe4ziJOCTrd+iiCXW/77FmQOzrFrTYzgnyYA+0/gkm3WFMSyhFsQeg+Kodd1o=
X-Received: by 2002:a05:6102:d8d:b0:555:56e0:f372 with SMTP id
 ada2fe7eead31-5560908d470mr2397200137.2.1757755757060; Sat, 13 Sep 2025
 02:29:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250911184528.1512543-1-rabenda.cn@gmail.com>
 <20250911184528.1512543-3-rabenda.cn@gmail.com> <20250912-gander-fox-d20c2e431816@spud>
In-Reply-To: <20250912-gander-fox-d20c2e431816@spud>
From: Han Gao <rabenda.cn@gmail.com>
Date: Sat, 13 Sep 2025 17:29:06 +0800
X-Gm-Features: AS18NWD-tBqk49KioxOmXqHDB8mXESNI-lFCAKSwfVB70oRBqo6Nz_fXy22ttJU
Message-ID: <CAAT7Ki_WD+X64oTPro=yn2de+Y_W9B2iDVE2cmRhV=TnQiUmPQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] riscv: dts: thead: add ziccrse for th1520
To: Conor Dooley <conor@kernel.org>
Cc: devicetree@vger.kernel.org, Drew Fustini <fustini@kernel.org>, 
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Han Gao <gaohan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_022919_007130_8F98FEE7 
X-CRM114-Status: GOOD (  17.88  )
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

T24gU2F0LCBTZXAgMTMsIDIwMjUgYXQgMTo1N+KAr0FNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBGcmksIFNlcCAxMiwgMjAyNSBhdCAwMjo0NToyN0FNICsw
ODAwLCBIYW4gR2FvIHdyb3RlOgo+ID4gdGgxNTIwIHN1cHBvcnQgWmljY3JzZSBJU0EgZXh0ZW5z
aW9uIFsxXS4KPiA+Cj4gPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNDEx
MDMxNDUxNTMuMTA1MDk3LTEyLWFsZXhnaGl0aUByaXZvc2luYy5jb20vIFsxXQo+Cj4gSSBkb24n
dCBzZWUgd2hhdCB0aGlzIGxpbmsgaGFzIHRvIGRvIHdpdGggdGgxNTIwIHN1cHBvcnRpbmcgdGhl
Cj4gZXh0ZW5zaW9uLiBUaGUga2VybmVsIHN1cHBvcnRpbmcgaXQgaGFzIG5vdGhpbmcgdG8gZG8g
d2l0aCB3aGV0aGVyIGl0Cj4gc2hvdWxkIGJlIGluIHRoZSBkdHMgb3Igbm90LiBBIHVzZWZ1bCBs
aW5rIHdvdWxkIHN1YnN0YW50aWF0ZSB5b3VyCj4gY2xhaW0uCgpFeGlzdGluZyBydjY0IGhhcmR3
YXJlIGNvbmZvcm1zIHRvIHRoZSBydmEyMCBwcm9maWxlLgoKWmljY3JzZSBpcyBhbiBhZGRpdGlv
bmFsIGV4dGVuc2lvbiByZXF1aXJlZCBieSB0aGUgcnZhMjAgcHJvZmlsZSwgc28KdGgxNTIwIGhh
cyB0aGlzIGV4dGVuc2lvbi4KCkxpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi9yaXNjdi1w
cm9maWxlcy9ibG9iL21haW4vc3JjL3Byb2ZpbGVzLmFkb2MjNTExLXJ2YTIwdTY0LW1hbmRhdG9y
eS1iYXNlClsxXQoKPgo+ID4gU2lnbmVkLW9mZi1ieTogSGFuIEdhbyA8cmFiZW5kYS5jbkBnbWFp
bC5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBIYW4gR2FvIDxnYW9oYW5AaXNjYXMuYWMuY24+Cj4K
PiBZb3Ugb25seSBuZWVkIHRvIHNpZ24gdGhpcyBvZmYgb25jZS4KPgo+IENoZWVycywKPiBDb25v
ci4KPgo+ID4gLS0tCj4gPiAgYXJjaC9yaXNjdi9ib290L2R0cy90aGVhZC90aDE1MjAuZHRzaSB8
IDI0ICsrKysrKysrKysrKysrKystLS0tLS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNl
cnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2Jvb3QvZHRzL3RoZWFkL3RoMTUyMC5kdHNpIGIvYXJjaC9yaXNjdi9ib290L2R0cy90aGVhZC90
aDE1MjAuZHRzaQo+ID4gaW5kZXggNTlkMTkyNzc2NGE2Li43ZjA3Njg4YWE5NjQgMTAwNjQ0Cj4g
PiAtLS0gYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3RoZWFkL3RoMTUyMC5kdHNpCj4gPiArKysgYi9h
cmNoL3Jpc2N2L2Jvb3QvZHRzL3RoZWFkL3RoMTUyMC5kdHNpCj4gPiBAQCAtMjQsOCArMjQsMTAg
QEAgYzkxMF8wOiBjcHVAMCB7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgZGV2aWNlX3R5cGUg
PSAiY3B1IjsKPiA+ICAgICAgICAgICAgICAgICAgICAgICByaXNjdixpc2EgPSAicnY2NGltYWZk
YyI7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgcmlzY3YsaXNhLWJhc2UgPSAicnY2NGkiOwo+
ID4gLSAgICAgICAgICAgICAgICAgICAgIHJpc2N2LGlzYS1leHRlbnNpb25zID0gImkiLCAibSIs
ICJhIiwgImYiLCAiZCIsICJjIiwgInppY250ciIsICJ6aWNzciIsCj4gPiAtICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiemlmZW5jZWkiLCAiemlocG0iLCAieHRo
ZWFkdmVjdG9yIjsKPiA+ICsgICAgICAgICAgICAgICAgICAgICByaXNjdixpc2EtZXh0ZW5zaW9u
cyA9ICJpIiwgIm0iLCAiYSIsICJmIiwgImQiLCAiYyIsCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAiemljY3JzZSIsICJ6aWNudHIiLCAiemljc3IiLAo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgInppZmVuY2Vp
IiwgInppaHBtIiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICJ4dGhlYWR2ZWN0b3IiOwo+ID4gICAgICAgICAgICAgICAgICAgICAgIHRoZWFkLHZsZW5i
ID0gPDE2PjsKPiA+ICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MD47Cj4gPiAgICAgICAg
ICAgICAgICAgICAgICAgaS1jYWNoZS1ibG9jay1zaXplID0gPDY0PjsKPiA+IEBAIC00OSw4ICs1
MSwxMCBAQCBjOTEwXzE6IGNwdUAxIHsKPiA+ICAgICAgICAgICAgICAgICAgICAgICBkZXZpY2Vf
dHlwZSA9ICJjcHUiOwo+ID4gICAgICAgICAgICAgICAgICAgICAgIHJpc2N2LGlzYSA9ICJydjY0
aW1hZmRjIjsKPiA+ICAgICAgICAgICAgICAgICAgICAgICByaXNjdixpc2EtYmFzZSA9ICJydjY0
aSI7Cj4gPiAtICAgICAgICAgICAgICAgICAgICAgcmlzY3YsaXNhLWV4dGVuc2lvbnMgPSAiaSIs
ICJtIiwgImEiLCAiZiIsICJkIiwgImMiLCAiemljbnRyIiwgInppY3NyIiwKPiA+IC0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJ6aWZlbmNlaSIsICJ6aWhwbSIs
ICJ4dGhlYWR2ZWN0b3IiOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHJpc2N2LGlzYS1leHRl
bnNpb25zID0gImkiLCAibSIsICJhIiwgImYiLCAiZCIsICJjIiwKPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJ6aWNjcnNlIiwgInppY250ciIsICJ6aWNz
ciIsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiemlm
ZW5jZWkiLCAiemlocG0iLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgInh0aGVhZHZlY3RvciI7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgdGhlYWQs
dmxlbmIgPSA8MTY+Owo+ID4gICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwxPjsKPiA+ICAg
ICAgICAgICAgICAgICAgICAgICBpLWNhY2hlLWJsb2NrLXNpemUgPSA8NjQ+Owo+ID4gQEAgLTc0
LDggKzc4LDEwIEBAIGM5MTBfMjogY3B1QDIgewo+ID4gICAgICAgICAgICAgICAgICAgICAgIGRl
dmljZV90eXBlID0gImNwdSI7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgcmlzY3YsaXNhID0g
InJ2NjRpbWFmZGMiOwo+ID4gICAgICAgICAgICAgICAgICAgICAgIHJpc2N2LGlzYS1iYXNlID0g
InJ2NjRpIjsKPiA+IC0gICAgICAgICAgICAgICAgICAgICByaXNjdixpc2EtZXh0ZW5zaW9ucyA9
ICJpIiwgIm0iLCAiYSIsICJmIiwgImQiLCAiYyIsICJ6aWNudHIiLCAiemljc3IiLAo+ID4gLSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgInppZmVuY2VpIiwgInpp
aHBtIiwgInh0aGVhZHZlY3RvciI7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgcmlzY3YsaXNh
LWV4dGVuc2lvbnMgPSAiaSIsICJtIiwgImEiLCAiZiIsICJkIiwgImMiLAo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgInppY2Nyc2UiLCAiemljbnRyIiwg
InppY3NyIiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICJ6aWZlbmNlaSIsICJ6aWhwbSIsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAieHRoZWFkdmVjdG9yIjsKPiA+ICAgICAgICAgICAgICAgICAgICAgICB0
aGVhZCx2bGVuYiA9IDwxNj47Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDI+Owo+
ID4gICAgICAgICAgICAgICAgICAgICAgIGktY2FjaGUtYmxvY2stc2l6ZSA9IDw2ND47Cj4gPiBA
QCAtOTksOCArMTA1LDEwIEBAIGM5MTBfMzogY3B1QDMgewo+ID4gICAgICAgICAgICAgICAgICAg
ICAgIGRldmljZV90eXBlID0gImNwdSI7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgcmlzY3Ys
aXNhID0gInJ2NjRpbWFmZGMiOwo+ID4gICAgICAgICAgICAgICAgICAgICAgIHJpc2N2LGlzYS1i
YXNlID0gInJ2NjRpIjsKPiA+IC0gICAgICAgICAgICAgICAgICAgICByaXNjdixpc2EtZXh0ZW5z
aW9ucyA9ICJpIiwgIm0iLCAiYSIsICJmIiwgImQiLCAiYyIsICJ6aWNudHIiLCAiemljc3IiLAo+
ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgInppZmVuY2Vp
IiwgInppaHBtIiwgInh0aGVhZHZlY3RvciI7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgcmlz
Y3YsaXNhLWV4dGVuc2lvbnMgPSAiaSIsICJtIiwgImEiLCAiZiIsICJkIiwgImMiLAo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgInppY2Nyc2UiLCAiemlj
bnRyIiwgInppY3NyIiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICJ6aWZlbmNlaSIsICJ6aWhwbSIsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAieHRoZWFkdmVjdG9yIjsKPiA+ICAgICAgICAgICAgICAgICAg
ICAgICB0aGVhZCx2bGVuYiA9IDwxNj47Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgcmVnID0g
PDM+Owo+ID4gICAgICAgICAgICAgICAgICAgICAgIGktY2FjaGUtYmxvY2stc2l6ZSA9IDw2ND47
Cj4gPiAtLQo+ID4gMi40Ny4zCj4gPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
