Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B11EBC3ABC3
	for <linux-riscv@archiver.kernel.org>; Mon, 12 May 2025 10:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m9+uaJ9wTWnUVpRoDdVLRSqmK39RHrAqVLFWL9Vcsfw=; b=LDUSj9gcFeLMUv
	oWFPNDFljz7PZywVU6sdiDlB9dkqv4AMze5qCLbMncV1qJd3VNL0k50bDzr+EYOFYIyL8r1Z8vM4O
	C1SvqnjFRpeV33HrhbQgK6fxK1LaqpUx5bBzz6OJwkE3ibQBO07eP+ckPtexfFcR/16xWsK7CQ4AT
	lbWu0v/vOQ7wh6HlhvjLXJdLGlj/OJQYCQTIcEXiCGCPJj4SDtp28sxMlT44uNeo7VJ77F4c052i+
	62SFMjwvKEci1MC4hn9xGaKLZADtAHxyHZkMiHTEB/V0xIzxTaDgXt8UgfknHDxE4rPfbyApBjzW0
	nB4BccMEoCtoGVQojM4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEQNc-0000000963A-1epM;
	Mon, 12 May 2025 10:27:28 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEQ2c-000000093Vk-0UPJ
	for linux-riscv@lists.infradead.org;
	Mon, 12 May 2025 10:05:47 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3a108684f90so2532765f8f.1
        for <linux-riscv@lists.infradead.org>; Mon, 12 May 2025 03:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747044344; x=1747649144; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wWrnZKTmDa27byamh1hKNbF5CE+D6DlGjHH+M4r/udk=;
        b=liWUxEmVw0ZaWJAFyj3oetA1odmCivGFxLmA+Ex2iiGuVJXVeJnLZ97VRNLu21ztk6
         oqCiScTmWjm0SD+ctbGFVERX+qs1WkPCUmZnZMdaQqYkckUh1FcrrdFbmkGkMwD1d4rt
         jTnCiOEvG+zc3M8ZbVFHOhWdd/kCfc1ufpOFrv5EEWdR7P2E0voPypDFBYokw1Ju2UoO
         JUa1ieh0oyHlExEwFZHnCdNBvZOfC9FCKIhDKBKXdgANxXowOJPma16nvVg2LsrBC0y6
         0ISOj7qS/5axpnKfADBbHYToDMiub9Jv1yXoOPzZPCLM8yqLq73MxtO3jONXt8r3XZRM
         V4Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747044344; x=1747649144;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wWrnZKTmDa27byamh1hKNbF5CE+D6DlGjHH+M4r/udk=;
        b=ffJxmAte0ANTw5jmt/gMEFPe0ymLgn1hRJvJ0SXIXqx0sE2ECARFCa1pS6JseGgUrs
         NuwbN/Lf8qUiMi1Gy+lTi6GBJo8virOWo81lJCtTnSkd6Qh0CaFUZlxsuF1ofI3oxl3M
         LojtlHm9zbGRoYW2aHqSuOwex/Jznslf364x6ieXY6hXN/aUfBzJqknSJZe0GLQ8x37i
         FQhU5kEJxnefDTREveB9WHJX8eLMrixfO6tqWclx4ebN22R2ULmsgUjxeGc7k6QdPuCi
         gYcO3vnXJAn5Po/TgjQRSOfUyeGvuPwKj2qR2nsMfvnc+UPQk1msRk2BtDvciSwT1fPk
         NchQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuk1rxXxgdK0i28aJIfWQd8F5ylJWkDwLvPUyytJkJVA537iDAsKEGX01T1WIlcyLBA3T1nUxliD/5dQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YybhXw/s7QxEDxZuGyTsDDz+Q1NVxAbPHbQk08KC/9229jS4t8V
	h8JspHd2wR+FvGJdh/Qkj3ri3BqMWQTlEpgsWN3Z2PTVHQ63DFtXpC5tcYl/Lkzx4oKsVoSxRyI
	GMq4MNhH3IiqDIO6quZLY3zruwPM=
X-Gm-Gg: ASbGncv359vHegrgcf5ARBsde/7erYBZ+UfpU8ivuN16HPnGPd1ozMzthz9V7I987kF
	6TAQCOKUXE3Y/0RAwdb7G049CcRdkVP5a7To1slCnap5GQs2Lro2R47Dhf1SQKtPXopI35bzdN3
	s9IVmIC/thJS7QWvrkRPrrnJKPYFd8J/A=
X-Google-Smtp-Source: AGHT+IF988+YYtCFKDfHfq0riU8jX0iVCIlEgn39eMhT5b0J5UZn6atp+YZiqB2f2vhp3l6T+P2n8HzWKXXURplcMAg=
X-Received: by 2002:a05:6000:3103:b0:3a0:8495:cb75 with SMTP id
 ffacd0b85a97d-3a1f6423243mr10400388f8f.9.1747044343759; Mon, 12 May 2025
 03:05:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250509-sapling-exhale-72815a023ac1@spud> <20250509-dwindle-remold-98b3d03d0631@spud>
 <CAMuHMdVWznEm4Kg-MvgCT5+cBtdwGi9YrzFK6mBaoPJ+VK8S+Q@mail.gmail.com> <20250512-disaster-plaster-9dc63205cd6e@spud>
In-Reply-To: <20250512-disaster-plaster-9dc63205cd6e@spud>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 12 May 2025 11:05:17 +0100
X-Gm-Features: AX0GCFvlNSGSQ3PtDGg0yEHkC9yOSWx2r_Q2w6kDcWVgBNfDLkKNDhCtbAm5VKc
Message-ID: <CA+V-a8sJUsNsF+AT1v3ySLiH9RGwDukMHHOC44JuV4JE3YKEpg@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: cache: add specific RZ/Five
 compatible to ax45mp
To: Conor Dooley <conor@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, Ben Zong-You Xie <ben717@andestech.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_030546_158444_FBA585D6 
X-CRM114-Status: GOOD (  20.91  )
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

SGkgQ29ub3IgYW5kIEdlZXJ0LAoKT24gTW9uLCBNYXkgMTIsIDIwMjUgYXQgMTA6NTnigK9BTSBD
b25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gTW9uLCBNYXkgMTIs
IDIwMjUgYXQgMTE6MDE6MjZBTSArMDIwMCwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOgo+ID4g
SGkgQ29ub3IsCj4gPgo+ID4gT24gRnJpLCA5IE1heSAyMDI1IGF0IDE3OjM5LCBDb25vciBEb29s
ZXkgPGNvbm9yQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPiBGcm9tOiBDb25vciBEb29sZXkgPGNv
bm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+ID4gPgo+ID4gPiBXaGVuIHRoZSBiaW5kaW5nIHdh
cyBvcmlnaW5hbGx5IHdyaXR0ZW4sIGl0IHdhcyBhc3N1bWVkIHRoYXQgYWxsCj4gPiA+IGF4NDVt
cC1jYWNoZXMgaGFkIHRoZSBzYW1lIHByb3BlcnRpZXMgZXRjLiBUaGlzIGhhcyB0dXJuZWQgb3V0
IHRvIGJlCj4gPiA+IGluY29ycmVjdCwgYXMgdGhlIFFpTGFpIFNvQyBoYXMgYSBkaWZmZXJlbnQg
bnVtYmVyIG9mIGNhY2hlLXNldHMuCj4gPiA+Cj4gPiA+IEFkZCBhIHNwZWNpZmljIGNvbXBhdGli
bGUgZm9yIHRoZSBSWi9GaXZlIGZvciBwcm9wZXJ0eSBlbmZvcmNlbWVudCBhbmQKPiA+ID4gaW4g
Y2FzZSB0aGVyZSB0dXJucyBvdXQgdG8gYmUgYWRkaXRpb25hbCBkaWZmZXJlbmNlcyBiZXR3ZWVu
IHRoZXNlCj4gPiA+IGltcGxlbWVudGF0aW9ucyBvZiB0aGUgY2FjaGUgY29udHJvbGxlci4KPiA+
ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9j
aGlwLmNvbT4KPiA+Cj4gPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghCj4gPgo+ID4gPiAtLS0gYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2FjaGUvYW5kZXN0ZWNoLGF4NDVtcC1j
YWNoZS55YW1sCj4gPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9j
YWNoZS9hbmRlc3RlY2gsYXg0NW1wLWNhY2hlLnlhbWwKPiA+ID4gQEAgLTI4LDYgKzI4LDcgQEAg
c2VsZWN0Ogo+ID4gPiAgcHJvcGVydGllczoKPiA+ID4gICAgY29tcGF0aWJsZToKPiA+ID4gICAg
ICBpdGVtczoKPiA+ID4gKyAgICAgIC0gY29uc3Q6IHJlbmVzYXMscjlhMDdnMDQzZi1jYWNoZQo+
ID4KPiA+IFRoaXMgbmFtZSBsb29rcyBhIGJpdCB0b28gZ2VuZXJpYyB0byBtZSwgYXMgdGhpcyBp
cyBub3QgYSBnZW5lcmljCj4gPiBjYWNoZSBvbiB0aGUgUjlBMDdHMDQzRiBTb0MsIGJ1dCBzcGVj
aWZpYyB0byB0aGUgQ1BVIGNvcmVzLgo+Cj4gU28gInJlbmVhc2FzLHI5Li4uLWNwdS1jYWNoZSI/
CgpNYXliZSAicmVuZXNhcyxyOWEwN2cwNDNmLXJpc2N2LWNhY2hlIiA/CgpDaGVlcnMsClByYWJo
YWthcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
