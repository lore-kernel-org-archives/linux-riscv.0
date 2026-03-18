Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D16103E199
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Mar 2026 15:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p4HFS9Q2uCnjdOFYQyeMMmEWTNUPpxTFj4yboHAGZH4=; b=1QDomK0+oClspe
	CTaXroMbs4Wh0EuO6TMwyA71Sm09io3e2HAwkn19oGOHxPLn9h9mVUpaXucmdfLRWikNplu2zGnkI
	EekFhz88IkQMdPVVGlITafJSob2hxDTHTY3FESsFXfS8ikCG0z3pUFeE+csVkBfyXTVFUllPYzeRQ
	wp4Gfu6JZD3BJNZr3w2+xJqsFyEsQE0CN4lWNQCLJ1FmQG7iKQlPA115LEkS2Ze+Sa5un3ixHGmYc
	Jd5jHlB6JeyvnN7NLurG0j6K1b/eYDxL+3qb46c6cVIHdd8xBoAQKWdNFj6EPJICUQRksNRr17/uu
	W6e4XdZalA4UuFZWGOTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2stL-00000008ixB-0bTT;
	Wed, 18 Mar 2026 15:33:03 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2stI-00000008iwp-3I7V
	for linux-riscv@lists.infradead.org;
	Wed, 18 Mar 2026 15:33:01 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-667d8f30bb7so48795a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 18 Mar 2026 08:32:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773847978; cv=none;
        d=google.com; s=arc-20240605;
        b=PhG2jUicYgXmDXAaJZq9TkGzMNgw99BotkrWy1ftBn67+VBvM93BiJbSFSK2AfIgm7
         9yvMOnXrtkHUKPE/gB2oPMGPsljDB3QRZB8nWBu7UHRTuF1/P+8vlfrvATf9fFJL+n3D
         qt43xGnwXu5XN0L2BdQjlVW7xScCKQTi4In21WmsK4UexikW/zOPmMwXBUO4kfHOwyWf
         vuksI3IkJaOZdUuiaiBpMZ5qAkTeg81mLlgQyebFY7Nx+siAAcUzoV7RBWKhMPdUViqM
         w7/l+gt2WPafl9lfPq+SVEqUESE6zn5f/inpgHEcE6ympk89cHD3yvOAerrEYE0lr6+c
         xrhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GCKw9Uhv3YzwPf7aqi1WbVCttX+v96RUntNWLlLtpCs=;
        fh=Fos0cv7L7pI8tS+yyXP0+GKSx5+rfwJxSwNMlsM/DsA=;
        b=WOwsohfdr3Wm5eR5WPZqh6BiheUGnat+4WlHGFJ9Y6xQP+1bKzuYZILE+qEeaPQyOh
         SIKk4byS2fm4g0+jSfDu2QIwSuqYPc+3I4+nSlZySuIx9Tgf3I5WxfUNxy7JJsrzryAx
         1MMR0fpdU3FnNZenYKGiLQzY6UyMpp+Fj2OZDgGkQGLnnuTn2ARxEvu/c62wHlI8OXo1
         IpXHMpHshyx9bYVHVHru1QfeZ9imcW5a/aj4aW/rRXsVR1NDVWU7/GQ32OR5dP8BpQtf
         b3kp4ZUf+OHJKnVfxb7+ff2GBRwiK0qGTU0Lv4rJyY67b4e3JfAgx/P4hGidM+GTqpZa
         emnQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773847978; x=1774452778; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GCKw9Uhv3YzwPf7aqi1WbVCttX+v96RUntNWLlLtpCs=;
        b=A2VJxoGUaP2UAPEq9wkz4sgCeQQ3GYBh+bEc6GHTaZ8d9+Z3vZX7rAnODWr4Qpj2m/
         Jt2bSCyatKWhF0P3v3Sc4/HHyTm5bnx1ysmZLTtXq0fBeh137B3O5JJ9nEFtD35yfM9Y
         kCTOvb43D9LesEIutCZV0SUZWoF8U3AGAoWDRWzHJjtqPojCbcePXlfXg0nK2HjPa1Y3
         EqRRuQ3lVPQ0TRuD8ULKbw6VQV2NJgYnLcVGejmSsENPmybvsteMVLAzn3IiqtRNZxcn
         h1QKcjB4lm+o3vIe7ELTRK8gK1W8u+wbKhM+EdSzlaX5aKXfo7Xm6PoAJS9QiFKanM9t
         Noyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773847978; x=1774452778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GCKw9Uhv3YzwPf7aqi1WbVCttX+v96RUntNWLlLtpCs=;
        b=rZDH3ehJXfLH5eKRKPdaOh4wph7IvktHrBaC9uRvmKbp2H7OmXeLW1yMf9Ne4SO1dR
         +wP7Piet08JQeOpGwVafG4wvSQehI/YouCUH+ZQjNyx1Q8C3amhPRN//ql06bAmQ9CGk
         9jM0DXMbRvf+Tg/hJPoemmzm0akRY7uLOU50TWlm4zE1EIV4Ry+bBvH0vML52rguZoBA
         NiNd/KTjhdUdiYjsfIKUsDYEqsJCw0pPUzTNtmaD58JFqcU40+cn7W/VYhzH2cfpDaFv
         pKVfquNcXx1bVZva8lz7sqO9BeJzpw40Zia6f4qp/0XbhKE1StdzqmG4VxfcYHhhRayf
         U6XQ==
X-Gm-Message-State: AOJu0Yzg8mDiAn9KiPdMVX3oJ89tW74NTe+MTXU8zWZ0OYRNW8f81iuB
	jBgx23mQdhneJ7ChPdyoUBxbnIORDapTEW8wUZffoJmeZWwCoOovYscX35wG43cE+tB6TinDQuz
	W1eeeup8RB719x/IZWZamTAv/IeatLkDlZg==
X-Gm-Gg: ATEYQzxa40XYOoc8Rg5n/5EooYxN5daAbdidSUkoDS8loH0mAZCLvtkcz0ERSI70pFy
	JG/iyyQm7f4iK2hCa53J2C01vNMlZ4nXqVmgEcfa66nlZYxKjTdFpe88yGXaVC9TlRpNqMiFsYn
	4BBqpdfkIjujSdqUVhYfcqeWRuHq8dEqJ+P+Hq5UPTjO6EWS89ePcyPK/StGCdCBCE3y42fw7wb
	pFCQA8m8xX++Yc4z9UxmhA0YWp8VAo1O7lhCRanpKSxO/351bxB3QdIQ2AtVqFpbL8ZVhkN5LC8
	np0VaHv4rA==
X-Received: by 2002:a17:906:fe08:b0:b96:dd1c:9408 with SMTP id
 a640c23a62f3a-b97f4b60f52mr266277966b.54.1773847977583; Wed, 18 Mar 2026
 08:32:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240628-dev-vstate_discard-v1-1-18e1c5d7997e@sifive.com> <20260318151924.1037423-1-andybnac@gmail.com>
In-Reply-To: <20260318151924.1037423-1-andybnac@gmail.com>
From: Andy Chiu <andybnac@gmail.com>
Date: Wed, 18 Mar 2026 10:32:00 -0500
X-Gm-Features: AaiRm50rE7EjeAFC_qhhbsG2KQAP0RKy-2mNCi6TpI19-Hv9vOF5e7WpTiZn-wc
Message-ID: <CAFTtA3MyuPYMX5b1n_ioTKN=1qgz1cKGKPvi20=xsFoarR1y=A@mail.gmail.com>
Subject: Re: [PATCH] riscv: vector: treat VS_INITIAL as discard
To: linux-riscv@lists.infradead.org
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, samuel@sholland.org, 
	bjorn@kernel.org, Alexandre Ghiti <alex@ghiti.fr>, greentime.hu@sifive.com, 
	nick.hu@sifive.com, nylon.chen@sifive.com, eric.lin@sifive.com, 
	vincent.chen@sifive.com, zong.li@sifive.com, yongxuan.wang@sifive.com, 
	samuel.holland@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_083300_868758_1420617C 
X-CRM114-Status: GOOD (  19.02  )
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

T24gV2VkLCBNYXIgMTgsIDIwMjYgYXQgMTA6MTnigK9BTSBBbmR5IENoaXUgPGFuZHlibmFjQGdt
YWlsLmNvbT4gd3JvdGU6Cj4KPiBJdCB0dXJucyBvdXQgdGhhdCB0aGUgb3B0aW1pemVkIHZyZXN0
b3JlIG9uIHN5c2NhbGwgcGF0aCBoYXMgbm90IGJlZW4KPiBtZXJnZWQgeWV0LiBJIHRoaW5rIHRo
aXMgcGF0Y2ggaGFzIG5vdCBnb3R0ZW4gZW5vdWdoIGF0dGVudGlvbiBhbmQgd2FzCj4gbG9zdCBs
b25nIGFnby4gSXQgc2VlbXMgbm90IGFibGUgdG8gYXBwbHkgZGlyZWN0bHkgb24gY3VycmVudCBo
ZWFkLiBJCj4gY2FuIHJlc2VuZCBvbiB0b3Agb2YgdGhlIHRyZWUgYWZ0ZXIgd2Ugc2V0dGxlIGRv
d24gdGhlIGRpc2N1c3Npb24uCgpBZGRpbmcgdGhlIG9yaWdpbmFsIHBhdGNoIGZvciByZWZlcmVu
Y2U6CgpGcm9tIGdpdEB6IFRodSBKYW4gIDEgMDA6MDA6MDAgMTk3MApTdWJqZWN0OiBbUEFUQ0hd
IHJpc2N2OiB2ZWN0b3I6IHRyZWF0IFZTX0lOSVRJQUwgYXMgZGlzY2FyZApGcm9tOiBBbmR5IENo
aXUgPGFuZHkuY2hpdUBzaWZpdmUuY29tPgpEYXRlOiBGcmksIDI4IEp1biAyMDI0IDE5OjQ5OjEy
ICswODAwCk1lc3NhZ2UtSWQ6IDwyMDI0MDYyOC1kZXYtdnN0YXRlX2Rpc2NhcmQtdjEtMS0xOGUx
YzVkNzk5N2VAc2lmaXZlLmNvbT4KTUlNRS1WZXJzaW9uOiAxLjAKQ29udGVudC1UeXBlOiB0ZXh0
L3BsYWluOyBjaGFyc2V0PSJ1dGYtOCIKQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogN2JpdAoK
VGhlIHB1cnBvc2Ugb2YgcmlzY3Zfdl92c3RhdGVfZGlzY2FyZCgpIGlzIHRvIGludmFsaWRhdGUg
diBjb250ZXh0IGF0CmVudHJpZXMgb2Ygc3lzY2FsbHMuIFNvIHVzZXJzIGhhcHBlbiB0byB1c2Ug
diBhZnRlciBhIHN5c2NhbGwgd2l0aG91dApyZS1jb25maWd1cmluZyB3b3VsZCBzZWUgYSBmYWls
dXJlLiBJdCB3YXMgYWNoaWV2ZWQgYnkgc2V0dGluZyB2ZWN0b3IKcmVnaXN0ZXJzIGFuZCBDU1Jz
IHRvIC0xIGFuZCBtYXJraW5nIHRoZSBjb250ZXh0IGJ1c3kuIEhvd2V2ZXIsIHRoaXMKcmVzdWx0
cyBpbiByZWR1bmRhbnQgc2F2aW5nIG9mIHYtY29udGV4dCBpZiB0aGUgcHJvY2VzcyBpcyBzY2hl
ZHVsZWQgb3V0CmluIGEgc3lzY2FsbC4gTW9yZW92ZXIsIHJlc3RvcmluZyB0aGUgaW52YWxpZGF0
ZWQgY29udGV4dCBmcm9tIG1lbW9yeSBpcwphIGNvc3RseSBvcGVyYXRpb24uIEluIGZhY3QsIGFs
bCBjYW4gYmUgcHJldmVudGVkIGlmIHdlIGNhbiBkZWxheQp2c3RhdGVfZGlzY2FyZCBiZWZvcmUg
cmV0dXJuaW5nIGJhY2sgdG8gdGhlIHVzZXIgc3BhY2UuIFRvIGJlIG1vcmUKc3BlY2lmaWMsIHRo
ZSBrZXJuZWwgY2FuIG1hcmsgdi1jb250ZXh0IGFzIElOSVRJQUwgYW5kIHNldCB0aGUgcmVzdG9y
ZQpmbGFnIGF0IHN5c2NhbGwgZW50cmllcy4gVGhpcyBpcyB0aGUgaW5kaWNhdGlvbiBmb3IgdGhl
IHZzdGF0ZV9yZXN0b3JlLApzbyBpdCBhd2FyZXMgdGhhdCB0aGUgdnN0YXRlIGhhcyB0byBiZSBp
bnZhbGlkYXRlZCBiZWZvcmUgcmV0dXJuaW5nIGJhY2sKdG8gdGhlIHVzZXIgc3BhY2UuCgpBZnRl
ciBhcHBseWluZyB0aGlzIHBhdGNoLCB0aGUgY29udGV4dCBzd2l0Y2ggcGVyZm9ybWFuY2UgaGFz
IGltcHJvdmVkCjYuNzglIG9uIHZlY3RvciBlbmFibGVkIGxtYmVuY2ggcnVubmluZyBvbiBhIEZQ
R0Egd2l0aCBWTEVOPTUxMi4gVGhlCnJlc3VsdCB3YXMgb2J0YWluZWQgYnkgYXZlcmFnaW5nIHRo
ZSBvdXRwdXQgZnJvbSB0aGUgZm9sbG93aW5nIGNvbW1hbmQuCgokIGxhdF9jdHggMgpCZWZvcmUg
dGhlIHBhdGNoOiA1OTkuODM1NzY5MgpBZnRlciB0aGUgcGF0Y2g6IDU1OS4xNzQ4MTQ4CgpTaWdu
ZWQtb2ZmLWJ5OiBBbmR5IENoaXUgPGFuZHkuY2hpdUBzaWZpdmUuY29tPgotLS0KIGFyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vdmVjdG9yLmggfCAxMCArKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwg
NiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vdmVjdG9yLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3ZlY3Rvci5oCmlu
ZGV4IGJlN2QzMDljY2E4YS4uMTIyMWY4YjhmNTY0IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL3ZlY3Rvci5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmVjdG9yLmgK
QEAgLTE3MCw4ICsxNzAsOCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgcmlzY3Zfdl92c3RhdGVfZGlz
Y2FyZChzdHJ1Y3QKcHRfcmVncyAqcmVncykKICAgICBpZiAoKHJlZ3MtPnN0YXR1cyAmIFNSX1ZT
KSA9PSBTUl9WU19PRkYpCiAgICAgICAgIHJldHVybjsKCi0gICAgX19yaXNjdl92X3ZzdGF0ZV9k
aXNjYXJkKCk7Ci0gICAgX19yaXNjdl92X3ZzdGF0ZV9kaXJ0eShyZWdzKTsKKyAgICBzZXRfdHNr
X3RocmVhZF9mbGFnKGN1cnJlbnQsIFRJRl9SSVNDVl9WX0RFRkVSX1JFU1RPUkUpOworICAgIHJp
c2N2X3ZfdnN0YXRlX29uKHJlZ3MpOwogfQoKIHN0YXRpYyBpbmxpbmUgdm9pZCByaXNjdl92X3Zz
dGF0ZV9zYXZlKHN0cnVjdCBfX3Jpc2N2X3ZfZXh0X3N0YXRlICp2c3RhdGUsCkBAIC0xODYsNyAr
MTg2LDkgQEAgc3RhdGljIGlubGluZSB2b2lkIHJpc2N2X3ZfdnN0YXRlX3NhdmUoc3RydWN0Cl9f
cmlzY3Zfdl9leHRfc3RhdGUgKnZzdGF0ZSwKIHN0YXRpYyBpbmxpbmUgdm9pZCByaXNjdl92X3Zz
dGF0ZV9yZXN0b3JlKHN0cnVjdCBfX3Jpc2N2X3ZfZXh0X3N0YXRlICp2c3RhdGUsCiAgICAgICAg
ICAgICAgICAgICAgICAgc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCiB7Ci0gICAgaWYgKChyZWdzLT5z
dGF0dXMgJiBTUl9WUykgIT0gU1JfVlNfT0ZGKSB7CisgICAgaWYgKChyZWdzLT5zdGF0dXMgJiBT
Ul9WUykgPT0gU1JfVlNfSU5JVElBTCkgeworICAgICAgICBfX3Jpc2N2X3ZfdnN0YXRlX2Rpc2Nh
cmQoKTsKKyAgICB9IGVsc2UgaWYgKChyZWdzLT5zdGF0dXMgJiBTUl9WUykgIT0gU1JfVlNfT0ZG
KSB7CiAgICAgICAgIF9fcmlzY3Zfdl92c3RhdGVfcmVzdG9yZSh2c3RhdGUsIHZzdGF0ZS0+ZGF0
YXApOwogICAgICAgICBfX3Jpc2N2X3ZfdnN0YXRlX2NsZWFuKHJlZ3MpOwogICAgIH0KQEAgLTE5
Nyw3ICsxOTksNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQKcmlzY3Zfdl92c3RhdGVfc2V0X3Jlc3Rv
cmUoc3RydWN0IHRhc2tfc3RydWN0ICp0YXNrLAogewogICAgIGlmICgocmVncy0+c3RhdHVzICYg
U1JfVlMpICE9IFNSX1ZTX09GRikgewogICAgICAgICBzZXRfdHNrX3RocmVhZF9mbGFnKHRhc2ss
IFRJRl9SSVNDVl9WX0RFRkVSX1JFU1RPUkUpOwotICAgICAgICByaXNjdl92X3ZzdGF0ZV9vbihy
ZWdzKTsKKyAgICAgICAgX19yaXNjdl92X3ZzdGF0ZV9jbGVhbihyZWdzKTsKICAgICB9CiB9CgoK
LS0tCmJhc2UtY29tbWl0OiA2MGE2NzA3ZjU4MmViYmRmYjZiMzc4ZjQ1ZDdiZjkyOTEwNmExY2Q1
CmNoYW5nZS1pZDogMjAyNDA2MjgtZGV2LXZzdGF0ZV9kaXNjYXJkLTU3ODQ2NTI5NjhhMwoKQmVz
dCByZWdhcmRzLAoKLS0KQW5keSBDaGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
