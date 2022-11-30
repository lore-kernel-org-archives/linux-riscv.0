Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB063C47088
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 18:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rv8AN9+PB1kL8cVw2MsxhxyjQ2aK3wC6gE32jD+y19Q=; b=eWYNqa2D+rlXFp
	jqe+FyOIqoxGIzG/txR7785pUku/TM0olLAffCnBLOEheafVQ/mkuOb8iLy+3zg0hUfTZ6lA0Z/lq
	9D8tm9yQJ1K2sQoCRvXY3o2l1MX00X6UxydZhq+155V9itvwUPOzJvpZO400p8Ec30cqZYcsI9zAP
	e5GG+Yo6DvamaJ5oUxIcDKxwzsUf/bfqBTt5duDDn5ePoUHSOFC85GGNNwZYSmi67F5A85sDn/fEa
	GH7YtHHffQuY7pwFEuxbVWAhIEAFq5Osmpq5+h26OZa3JxBrqL4q3w2X/OsUq35rZ1rT0DgyuFXAD
	Kq9aX6HNb6rj3KqQ16BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Rqw-001Zwp-Hj; Wed, 30 Nov 2022 18:30:38 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Rpk-001ZCB-QY
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 18:29:28 +0000
Received: by mail-wr1-x42b.google.com with SMTP id z4so28551648wrr.3
        for <linux-riscv@lists.infradead.org>; Wed, 30 Nov 2022 10:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I/mhURiSnctmudftnFtdoz6/q2M4E0iTIngIl1pzogU=;
        b=EXkGs8WY3WnjbsfHyJzvRucfFYBCKLg2OoAAZnOb/QPwRH+3S4V5sgJNGwMMKQ3nT9
         2Xb0YGfoWg8veu7GPIpZ0GgkLWVbqZ3fJ4/YQSHytBk3p1ctC993cy3PKZil2/yVVUTE
         cId59KXf8H6siK7W2A00aylbLGNYI+MHnOxsu2GjMYrFio9S+YHO87jgpUBSDofME/+W
         4Jl0H0EnSKxnDzGQs3a5WhNe7L3vjXj9Uw/xvOR6prOCoMB5ePFP+H9FzyEA2Fw86LfT
         nn33xq8pXc/UotbEvk9rwn673hiz0rGlVWl6rMmgFCuvlo0vH7ggJQulg587nx2obfos
         lj8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I/mhURiSnctmudftnFtdoz6/q2M4E0iTIngIl1pzogU=;
        b=wbjucRPd2Vb8wbW2P0NgzJiC0mOuyTXzBPsZOCF2ykNriZeL1MDiO892/NLCj+H5ro
         H+gHbHJDL826mb1P0890OLd2Pwp6gVSkMIoA2/Rh1TOSnPotBGCu80Dk4dVhIzeP+zMW
         f91IemnuBALs5GgEW9SDenAZ7RZlYcV4Ng2xkjaBo/Fi83mDEQ12aWU5ROpmPsntOFNI
         1CXmtaJvg6s7tyQ/j92HpaLZchGshvx+qdUMmnXZpgdRiRbTN9poTMFXY5jkumx1/AEd
         lMJsEL3rNqaCOrwBDzl03i4TeNkj7SPNT53tqv8hnMeUJputP5WXVjSoZegIElvV2jUI
         95kg==
X-Gm-Message-State: ANoB5pnJEWvR/r9dDqjY9N0XaGufgrMM7TBwiBdF9+eVReDa9EVwC0EL
	DIqTIPlco1NoDXOcEWptdKin3A==
X-Google-Smtp-Source: AA0mqf5dX/d2F14h/RN8hhwb9Smb/cMdcFa+bUh//IbKL245pVd2GTk7zTR9//+D8GoEll5KQTO2jA==
X-Received: by 2002:a5d:414b:0:b0:242:b59:c3c6 with SMTP id c11-20020a5d414b000000b002420b59c3c6mr14720594wrq.91.1669832959724;
        Wed, 30 Nov 2022 10:29:19 -0800 (PST)
Received: from smtpclient.apple (global-5-141.n-2.net.cam.ac.uk. [131.111.5.141])
        by smtp.gmail.com with ESMTPSA id 16-20020a05600c22d000b003b497138093sm2691867wmg.47.2022.11.30.10.29.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 30 Nov 2022 10:29:19 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH v2 1/2] dt-bindings: riscv: fix underscore requirement for
 addtional standard extensions
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20221130180422.1642652-2-conor@kernel.org>
Date: Wed, 30 Nov 2022 18:29:18 +0000
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Stuebner <heiko@sntech.de>,
 Andrew Jones <ajones@ventanamicro.com>,
 Guo Ren <guoren@kernel.org>,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <E52B0E0B-F27B-43C8-85DA-4C7AC0C52369@jrtc27.com>
References: <20221130180422.1642652-1-conor@kernel.org>
 <20221130180422.1642652-2-conor@kernel.org>
To: Conor Dooley <conor@kernel.org>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_102924_911949_E93CC56E 
X-CRM114-Status: GOOD (  17.46  )
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

T24gMzAgTm92IDIwMjIsIGF0IDE4OjA0LCBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+
IHdyb3RlOgo+IAo+IEZyb206IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5j
b20+Cj4gCj4gVGhlIFJJU0MtViBJU0EgTWFudWFsIGFsbG93cyBmb3IgdGhlIGZpcnN0IEFkZGl0
aW9uYWwgU3RhbmRhcmQKPiBFeHRlbnNpb24gaGF2aW5nIG5vIGxlYWRpbmcgdW5kZXJzY29yZS4g
T25seSBpZiB0aGVyZSBhcmUgbXVsdGlwbGUKPiBBZGRpdGlvbmFsIFN0YW5kYXJkIEV4dGVuc2lv
bnMgaXMgaXQgbmVlZGVkIHRvIGhhdmUgYW4gdW5kZXJzY29yZS4KPiAKPiBUaGUgZHQtYmluZGlu
ZyBkb2VzIG5vdCB2YWxpZGF0ZSB0aGF0IGEgbXVsdGktbGV0dGVyIGV4dGVuc2lvbiBpcwo+IGNh
bm9uaWNhbGx5IG9yZGVyZWQsIGFzIHRoYXQnZCBuZWVkIGFuIGV2ZW4gd29yc2UgcmVnZXggdGhh
biBpcyBoZXJlLAo+IGJ1dCBpdCBzaG91bGQgbm90IGZhaWwgdmFsaWRhdGlvbiBmb3IgdmFsaWQg
SVNBIHN0cmluZ3MuCj4gCj4gQWxsb3cgdGhlIGZpcnN0IFogbXVsdGktbGV0dGVyIGV4dGVuc2lv
biB0byBhcHBlYXIgaW1tZWRpYXRlbHkgcHJpb3IKPiBhZnRlciB0aGUgc2luZ2xlLWxldHRlciBl
eHRlbnNpb25zLgo+IAo+IExpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi9yaXNjdi1pc2Et
bWFudWFsL3JlbGVhc2VzL3RhZy9yaXNjdi11bnByaXYtcGRmLWZyb20tYXNjaWlkb2MtMTUxMTIw
MjIgIyBDaGFwdGVyIDI5LjUKPiBGaXhlczogMjk5ODI0ZTY4YmQwICgiZHQtYmluZGluZ3M6IHJp
c2N2OiBhZGQgbmV3IHJpc2N2LGlzYSBzdHJpbmdzIGZvciBlbXVsYXRvcnMiKQo+IEFja2VkLWJ5
OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBDb25vciBEb29s
ZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+IC0tLQo+IERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9jcHVzLnlhbWwgfCAyICstCj4gMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9jcHVzLnlhbWwgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvY3B1cy55YW1sCj4gaW5kZXggOTBhN2NhYmY1OGZl
Li5lODBjOTY3YTRmYTQgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3Jpc2N2L2NwdXMueWFtbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9yaXNjdi9jcHVzLnlhbWwKPiBAQCAtODAsNyArODAsNyBAQCBwcm9wZXJ0aWVzOgo+
ICAgICAgIGluc2Vuc2l0aXZlLCBsZXR0ZXJzIGluIHRoZSByaXNjdixpc2Egc3RyaW5nIG11c3Qg
YmUgYWxsCj4gICAgICAgbG93ZXJjYXNlIHRvIHNpbXBsaWZ5IHBhcnNpbmcuCj4gICAgICRyZWY6
ICIvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9zdHJpbmciCj4gLSAgICBwYXR0ZXJu
OiBecnYoPzo2NHwzMilpbWFmP2Q/cT9jP2I/dj9rP2g/KD86X1toc3h6XSg/OlthLXpdKSspKiQK
PiArICAgIHBhdHRlcm46IF5ydig/OjY0fDMyKWltYWY/ZD9xP2M/Yj92P2s/aD8oPzp6KD86W2Et
el0pKyk/KD86X1toc3h6XSg/OlthLXpdKSspKiQKCklzbuKAmXQgaXQgYW55IG11bHRpLWxldHRl
ciBleHRlbnNpb24sIGkuZSwgdGhpcyBzaG91bGQgYmUgW2hzeHpdIGFnYWluPwoKSXQgY2VydGFp
bmx5IHVzZWQgdG8gYmUgYXQgbGVhc3Q7IHdlIHVzZSBydjY0Z2N4Y2hlcmkuLi4KCkplc3MKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
