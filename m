Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00544C77B7A
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Apr 2023 16:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=23S2YBB7VzLxs0ZAq/xkg+n+CBuyxifWo35L2Nm/ly8=; b=PhvqM5pDhCy0d4
	Nt4vYuFQha+Q6A8PZ09KPp68fWh7EhbxLQIVJ2RAtZ7KAzgSuj91CCrYZPllA6BK+KBOPc+ihIMNQ
	xKkYAJ+yfxRZyDivLT9Jry/ZPTb7gAMGgGug4GrbJjgPtr6gIbzwmpnPXMpFQZchjGKvq4pH93lde
	PGQ4L+rm5CmzaSsWorYem68DXXCYL/0qSIO9XnbAxQNN3wXRFKcJUo0TBvGiBPaVDyxaWuwYAM8s5
	zbY1WoxshiuSEm0bnXyCCt1sJgAubvwvKopUh0qruf7jOvEySCrUARpWITxYTCRSjpoL6mTXYTxUE
	xKtu2AC3Fa+6YYgttbWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poRgv-00H3MT-0T;
	Mon, 17 Apr 2023 16:26:57 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poRgr-00H3KU-1O
	for linux-riscv@lists.infradead.org;
	Mon, 17 Apr 2023 16:26:55 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4ec817735a7so1564350e87.3
        for <linux-riscv@lists.infradead.org>; Mon, 17 Apr 2023 09:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1681748810; x=1684340810;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fc9CAPaVpkJctXfsZlqqV20QxzF/PQB/adI+baqjcD8=;
        b=iL6znh5GR8oosa9rL6uJVoky5+f2hBn4M87bQIRlX2KlbMZVujYwljyTdO54pPlQn/
         FElmGA62P6lB/KufhDaVpMtNSfhmkaDR8mh1iGq5kG/9wWwy1AhTEYmq7wb5B/QqOBxs
         HN/aYkofWjzPuVZwDsErWrEhSKuAjkemOEOXSGGlMiVoQ++l1XwkaVHVcntOi52stxF1
         NPlPfQZtHUfuOJk8v4AXXQLMjrcmfDPhqy/RXh2+jp9sl1PxpJg8pZVlO6VOogsi6Bpf
         VwxpXCPddL8mmaxI0YGjKxtZs7RL3j8GZa5hn9SbdOb5TPbFR97ss1QYsjNYLvYr5YDK
         k8Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681748810; x=1684340810;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fc9CAPaVpkJctXfsZlqqV20QxzF/PQB/adI+baqjcD8=;
        b=i3dVfYGoe22azkBfAfs2U4BiAGt2cCqIlm09E9A+diGvtrJk0cDZTHxr3REhpb0BQu
         VukeL2LuH36pEjHU/C6zfCt5EjP3fsaPBP/PHr8ESfNUOO2yHy6PQBmev2abtGofgowO
         huI7dXlnJq6lDCi1AAMAeDS0f6QDs5tsm43QZEvx0oMPqGABzsHhpTtM6Rufbq1dI2hM
         n39mp0e7oWKQBSQgiBgoBS201nH35UrbDcVHIDQ6AvymTnpjWe0R1dywOIMHFJhs1nlr
         YZn54xuR9yq0bStpQ/mFhBjZMb2iU9IdIZGDoMhWFnBm5Ll/2T3w6s/vw8ffUv7gnUFY
         pKHg==
X-Gm-Message-State: AAQBX9cp3kfNAKoR31qhEjPmwV00nw6m29pvCxFsy1O2Ugh+yKoXb+vu
	Kx8mySe2DdHYp1KuZqHbTNeyvacNsTZDUgFDqqlqexic8xq2f+/B
X-Google-Smtp-Source: AKy350ZvkTCGazJNdSfIMp24oXdlgrSSq3R97mEnBScc701HboTp8ViRgvYwP04GNq5+ouw1iJjhwt3+Xo/xjNRghlc=
X-Received: by 2002:a05:6512:96b:b0:4ec:8a46:d1e with SMTP id
 v11-20020a056512096b00b004ec8a460d1emr2431242lft.4.1681748809923; Mon, 17 Apr
 2023 09:26:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230414155843.12963-1-andy.chiu@sifive.com> <eae19ece-0d56-a91c-3417-f00b9b71f04d@codethink.co.uk>
In-Reply-To: <eae19ece-0d56-a91c-3417-f00b9b71f04d@codethink.co.uk>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Tue, 18 Apr 2023 00:26:37 +0800
Message-ID: <CABgGipWwj=3pCefAUkv0fHDKoyqXxuXfqji4KGPo=2hixTgv_A@mail.gmail.com>
Subject: Re: [PATCH -next v18 00/20] riscv: Add vector ISA support
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_092653_599569_D67FD94C 
X-CRM114-Status: GOOD (  24.82  )
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

SGkgQmVuLAoKT24gTW9uLCBBcHIgMTcsIDIwMjMgYXQgMTE6NTbigK9QTSBCZW4gRG9va3MgPGJl
bi5kb29rc0Bjb2RldGhpbmsuY28udWs+IHdyb3RlOgo+Cj4gT24gMTQvMDQvMjAyMyAxNjo1OCwg
QW5keSBDaGl1IHdyb3RlOgo+ID4gVGhpcyBwYXRjaHNldCBpcyBpbXBsZW1lbnRlZCBiYXNlZCBv
biB2ZWN0b3IgMS4wIHNwZWMgdG8gYWRkIHZlY3RvciBzdXBwb3J0Cj4gPiBpbiByaXNjdiBMaW51
eCBrZXJuZWwuIFRoZXJlIGFyZSBzb21lIGFzc3VtcHRpb25zIGZvciB0aGlzIGltcGxlbWVudGF0
aW9ucy4KPiA+Cj4gPiAxLiBXZSBhc3N1bWUgYWxsIGhhcnRzIGhhcyB0aGUgc2FtZSBJU0EgaW4g
dGhlIHN5c3RlbS4KPiA+IDIuIFdlIGRpc2FibGUgdmVjdG9yIGluIGJvdGgga2VybmVsIGFuZCB1
c2VyIHNwYWNlIFsxXSBieSBkZWZhdWx0LiBPbmx5Cj4gPiAgICAgZW5hYmxlIGFuIHVzZXIncyB2
ZWN0b3IgYWZ0ZXIgYW4gaWxsZWdhbCBpbnN0cnVjdGlvbiB0cmFwIHdoZXJlIGl0Cj4gPiAgICAg
YWN0dWFsbHkgc3RhcnRzIGV4ZWN1dGluZyB2ZWN0b3IgKHRoZSBmaXJzdC11c2UgdHJhcCBbMl0p
Lgo+ID4gMy4gV2UgZGV0ZWN0ICJyaXNjdixpc2EiIHRvIGRldGVybWluZSB3aGV0aGVyIHZlY3Rv
ciBpcyBzdXBwb3J0IG9yIG5vdC4KPiA+Cj4gPiBXZSBkZWZpbmVkIGEgbmV3IHN0cnVjdHVyZSBf
X3Jpc2N2X3ZfZXh0X3N0YXRlIGluIHN0cnVjdCB0aHJlYWRfc3RydWN0IHRvCj4gPiBzYXZlL3Jl
c3RvcmUgdGhlIHZlY3RvciByZWxhdGVkIHJlZ2lzdGVycy4gSXQgaXMgdXNlZCBmb3IgYm90aCBr
ZXJuZWwgc3BhY2UKPiA+IGFuZCB1c2VyIHNwYWNlLgo+ID4gICAtIEluIGtlcm5lbCBzcGFjZSwg
dGhlIGRhdGFwIHBvaW50ZXIgaW4gX19yaXNjdl92X2V4dF9zdGF0ZSB3aWxsIGJlCj4gPiAgICAg
YWxsb2NhdGVkIHRvIHNhdmUgdmVjdG9yIHJlZ2lzdGVycy4KPiA+ICAgLSBJbiB1c2VyIHNwYWNl
LAo+ID4gICAgICAgLSBJbiBzaWduYWwgaGFuZGxlciBvZiB1c2VyIHNwYWNlLCB0aGUgc3RydWN0
dXJlIGlzIHBsYWNlZAo+ID4gICAgICAgICByaWdodCBhZnRlciBfX3Jpc2N2X2N0eF9oZHIsIHdo
aWNoIGlzIGVtYmVkZGVkIGluIGZwIHJlc2VydmVkCj4gPiAgICAgICAgIGFlcmEuIFRoaXMgaXMg
cmVxdWlyZWQgdG8gYXZvaWQgQUJJIGJyZWFrIFsyXS4gQW5kIGRhdGFwIHBvaW50cwo+ID4gICAg
ICAgICB0byB0aGUgZW5kIG9mIF9fcmlzY3Zfdl9leHRfc3RhdGUuCj4gPiAgICAgICAtIEluIHB0
cmFjZSwgdGhlIGRhdGEgd2lsbCBiZSBwdXQgaW4gdWJ1ZiBpbiB3aGljaCB3ZSB1c2UKPiA+ICAg
ICAgICAgcmlzY3ZfdnJfZ2V0KCkvcmlzY3ZfdnJfc2V0KCkgdG8gZ2V0IG9yIHNldCB0aGUKPiA+
ICAgICAgICAgX19yaXNjdl92X2V4dF9zdGF0ZSBkYXRhIHN0cnVjdHVyZSBmcm9tL3RvIGl0LCBk
YXRhcCBwb2ludGVyCj4gPiAgICAgICAgIHdvdWxkIGJlIHplcm9lZCBhbmQgdmVjdG9yIHJlZ2lz
dGVycyB3aWxsIGJlIGNvcGllZCB0byB0aGUKPiA+ICAgICAgICAgYWRkcmVzcyByaWdodCBhZnRl
ciB0aGUgX19yaXNjdl92X2V4dF9zdGF0ZSBzdHJ1Y3R1cmUgaW4gdWJ1Zi4KPiA+Cj4gPiBUaGlz
IHBhdGNoc2V0IGlzIHJlYmFzZWQgdG8gdjYuMy1yYzEgYW5kIGl0IGlzIHRlc3RlZCBieSBydW5u
aW5nIHNldmVyYWwKPiA+IHZlY3RvciBwcm9ncmFtcyBzaW11bHRhbmVvdXNseS4gSXQgZGVsaXZl
cnMgc2lnbmFscyBjb3JyZWN0bHkgaW4gYSB0ZXN0Cj4gPiB3aGVyZSB3ZSBjYW4gc2VlIGEgdmFs
aWQgdWNvbnRleHRfdCBpbiBhIHNpZ25hbCBoYW5kbGVyLCBhbmQgYSBjb3JyZWN0IFYKPiA+IGNv
bnRleHQgcmV0dXJpbmcgYmFjayBmcm9tIGl0LiBBbmQgdGhlIHB0cmFjZSBpbnRlcmZhY2UgaXMg
dGVzdGVkIGJ5Cj4gPiBQVFJBQ0Vfe0dFVCxTRVR9UkVHU0VULiBMYXN0bHksIEtWTSBpcyB0ZXN0
ZWQgYnkgcnVubmluZyBhYm92ZSB0ZXN0cyBpbgo+ID4gYSBndWVzdCB1c2luZyB0aGUgc2FtZSBr
ZXJuZWwgaW1hZ2UuIEFsbCB0ZXN0cyBhcmUgZG9uZSBvbiBhbiBydjY0Z2N2Cj4gPiB2aXJ0IFFF
TVUuCj4KPiBPaywgYXJlIHRoZXJlIHBsYW5zIGZvciBpbi1rZXJuZWwgdmVjdG9yIHBhdGNoZXMs
IG9yIGhhdmUgSSBtaXNzZWQKPiBzb21ldGhpbmcgaW4gdGhpcyBsaXN0PyBJIGV4cGVjdCBvbmNl
IHRoaW5ncyBsaWtlIHRoZSB2ZWN0b3ItY3J5cHRvCj4gaGl0IHRoZW4gcGVvcGxlIHdpbGwgYmUg
d2FudGluZyBpbi1rZXJuZWwgYWNjZWxlcmF0b3JzLgo+CgpZZXMsIEkgYW0gcmVkZXNpZ25pbmcg
YW5kIHBsYW5uaW5nIHRvIHN1Ym1pdCB0aGUgaW4ta2VybmVsIFZlY3RvcgpzdXBwb3J0IHJlY2Vu
dGx5LiBDdXJyZW50bHkgdGhlIG9yaWdpbmFsIG9uZSBpcyBjYXJyaWVkIGJ5IEhlaWtvJ3MKdmVj
dG9yIGNyeXB0byBzZXJpZXMuIFRoZSBBUEkgaW50ZXJmYWNlIG9mIHRoZSByZWZpbmVkIG9uZSBz
aG91bGQKcmVtYWluIHRoZSBzYW1lIGJ1dCB3aXRoIHNvbWUgb3B0aW1pemF0aW9ucy4KCj4gLS0K
PiBCZW4gRG9va3MgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaHR0cDovL3d3dy5jb2Rl
dGhpbmsuY28udWsvCj4gU2VuaW9yIEVuZ2luZWVyICAgICAgICAgICAgICAgICAgICAgICAgIENv
ZGV0aGluayAtIFByb3ZpZGluZyBHZW5pdXMKPgo+IGh0dHBzOi8vd3d3LmNvZGV0aGluay5jby51
ay9wcml2YWN5Lmh0bWwKPgoKQ2hlZXJzLApBbmR5CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
