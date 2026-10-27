Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15801606A9C3
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Oct 2026 11:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qQiQrUAM;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=Eh3WLnfO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ij3dnpsVMdO6JYw40RROIJhB2hlZy8CGiAb0SjSqX0A=; b=qQiQrUAM5M/wMbswZnclnTBOdt
	rL5siOou7I1pLrR7gj/EohCn6W4COEm65GRe5LnHhIt/gQwauC6Osl93L0wS3RCWVyncJ35vYOQBd
	aYBkNOP+7hkROrDm0rGJ8hqI3lo41+ckaqkF8LgfHI7Iy628swDPST2m8uIaWLUJ0+9PZy4G9fDeo
	nGkKcJKIIqVj/1eODhv2DD7PjDxmE6hOoLMlmsdXHlzpJuwHQNh5Mx2wXOFs3pcYCQw1o1hGSz9+E
	6cxCDZ1vYm05omsEmjNyxN8pgnh8QghxpASwn4hQ1LPucb/zvuhKO5Qh7t2WtZ29qzzUXEFpaJPpT
	+8EIzMrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLfaO-00000004VWz-2fxr;
	Tue, 27 Oct 2026 11:43:24 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLfaM-00000004VVv-1bXj
	for linux-riscv@lists.infradead.org;
	Tue, 27 Oct 2026 11:43:23 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso2429169f8f.3
        for <linux-riscv@lists.infradead.org>; Tue, 27 Oct 2026 04:43:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793101399; cv=none;
        d=google.com; s=arc-20260327;
        b=aWMOxkpMl3ES6YXqNhSZQOOydt0uYZVBYijGTD70+DU4gkH3F1LkRFbVvQmQ+b1rXZ
         i7LyCX1c4sXn7FGAXxFzRU5BH0p4SWLl3PC87l7jruBZr1afb8hxgJxTQ+PlDmvgSC96
         R8gIkFsgHUNHnsLNKB0bXxCdbeBk11PYJ8IrA+aL6v9XxXZFPUOE+MpeczRfOHFIDStp
         7eySpjjklEg/T51NyS3qKHrG4oNo4Mlwrn2JRTcdSKR9am+cNUdkk6scPoLskPCiPAjd
         PzPDNXgpkwvpBfjJplMSK8vJW4kced77TPzPjQVr11R+UnrmsABWxW0xE8hAEVCudMvS
         HH1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EHBq5VztpAn2AdPs1YW6B/lO82en/xJ+WK6rO9j64qA=;
        fh=HmcnVS+rjW+EMk5+FshohG5KIjq8YkgnY4WCr4styME=;
        b=gy1bNEK5dtIBrab3pV/kROj5PPuCQk1iGOreoT8HIuzX7Sc6fLUS/wSwKbZvJl8/oQ
         WwZrRgPaChOc5DOLqxzal4bCFYy4xuVmrGdoGZAbRRfi2E9FeSgrbLT+hYKGrGbIffjW
         9ULeZ4BE1A8gly5bZBFwz+EkxXHu4uHByPGpT0lAof+FfJh2MRzbrAO1/IfHArPKS9C7
         PWrELh0TbcQn3o6w9ysCyji5CFBtmSCb3VniD244eMFYtWoUorDtnXonFZ+mpDaF3uaW
         MujjIIlVEn65E7gsC4fAsoyrwOSr3XrO/yBIGYCfU1ljTrNkARzeA+AcBMDIy0OFY8OQ
         PATA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1793101399; x=1793706199; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EHBq5VztpAn2AdPs1YW6B/lO82en/xJ+WK6rO9j64qA=;
        b=Eh3WLnfORb94LQMWj4u9Ia9xN20v8SmMYagHB70tzBWUGuyByqaTV6WX3VBYtR2PGU
         1PgmmkjCrTbdTAeLAGIp9+GI7g6n6acXCcqCIk5DfYU2rbMvJe0tMP6mEXcqM37CVOyz
         GbbzFoZhuVLhtZ3VPrTPeBPo2+zSbk9QDqLnFKO26kek2DfWzmZyiOMIo5G/iigubnLd
         4PntAtzThNQKDFXBn6Z8nH6pYh+ge/znn1lmCgf88Gx53OPLcT71SG++I3USmPERRvdK
         kc9FAC5Urv39grbiHQqa/11tuWgJid/QE3eKmd5cyN9/7Muu0s1QhnJGJTVRtgWD8uK+
         j8mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101399; x=1793706199;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EHBq5VztpAn2AdPs1YW6B/lO82en/xJ+WK6rO9j64qA=;
        b=USMg5uDP2vavlY/4dr4My5axlGQ8HeMper/tGTszBS+EZ3qbsiskVX1TpN40Zh8R4T
         sssDHzW7ay9SMEI6sOa6wla4CJhhJMieTSLK+1IbepnLI/BSMi+6oSCHiwMmvYcXZ9nI
         RrJw0JIu4yNUG8J1mLraN6582/bOYxCEwJpS9ek/MpEIBk+/b4nGGL0tIgnIp/ISDrY7
         m5le/2KxA4SwsYclPpoY8o/xD+PGVxIkYmrzKYK9o5gYZbwPtvrXgB6XYjpIWaAXSNfg
         Tzwiv3g8gVjFLo7rjC7xbLDX8Tod59yryfHdEF7J6o4cTytD/LESNV1qUrYOjwOVvkmH
         sM/A==
X-Forwarded-Encrypted: i=1; AKwUvBwx9X+BOqoo23XrjxeLRd1JdeQLzJNBBJXl1RIOEB8MgsOaw1nFKTNYq+Gwm0efaLSgbyWQ+90+plkHOw==@lists.infradead.org
X-Gm-Message-State: AFq9FYJsfJ54DMF0dyPTAvENYdlJ8UMFFMCAaXzAvleh3wO3vku08Pb2
	HE/xB/BxCMr8TFRRNOnMSVWOM3iXmoF+6UB64+gPI393ZoCvCYDCKiY8saG234+RqERbKtPLaaC
	US4kHoyJiz6lut8fFB2A9HEXEJcYew4k3x6zkNfki2w==
X-Gm-Gg: AYBFou0KRlCcmFpJaeC8bMsZFB/4ONfi9O69/VO5Nc+vFUryNJF7yixvvPr6b0WPMNZ
	EfrbaTJvKcoQarHJ4WwcZPpwFSQqfbcBR662bwbg1Z8lSv/E4WxXAutt0YkAMppmcpu2dUDBipl
	igtxr6Xy32TkBkAEwrht5DW8vkx0Mgt80uaGyrf9MXiS1JecAb1DMIFUNYAPeWD2tMhPBBJ2Iml
	Rdxf6K4g9X4cDGJ14U9gQ4ZFrTY0yeG48ZrFsKBcAqlvGJ+WV8kYYQyDLwvcHU4DfLRHccGorCo
	CJPSzDp/o0DSOeBkiRhAlQLFOs8VRrafEp0qG/TuOHW0SXePVvAXdHpEjNHhUiv+5W3HTICaScR
	mVddpq4Gaq/GVsuHkIvu69XQrhIt+DALdlQDs8diuQsq3rtR7uBUYW2cILvJE12aXo0lf8Nyp9O
	M92fMrLO/Y31zH0CsFtFNIcOcPA9dvDVAyJMgo4Qc4eJLNBB5BooJgi70=
X-Received: by 2002:a05:6000:2312:b0:48c:557d:ab24 with SMTP id
 ffacd0b85a97d-48e3eb2cdbfmr18502041f8f.4.1793101399218; Tue, 27 Oct 2026
 04:43:19 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261026122641.3292904-2-thnkslprpt@gmail.com>
In-Reply-To: <20261026122641.3292904-2-thnkslprpt@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 27 Oct 2026 17:13:07 +0530
X-Gm-Features: AclHuK_YxyDIyftc25iUYC8NVVRB1Cvcm_VUFCydYG2U01f8I4k1oeSJn7Y-8Jg
Message-ID: <CAAhSdy2RDTujdV1xmXjEwjAU7VCOpHL2MidOFqt1UpY07GWXmQ@mail.gmail.com>
Subject: Re: [PATCH] irqchip/riscv-imsic: Report successful hardware retrigger
To: Avi Weiss <thnkslprpt@gmail.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Bjorn Topel <bjorn@rivosinc.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_044322_453489_258D4862 
X-CRM114-Status: GOOD (  16.36  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gTW9uLCBPY3QgMjYsIDIwMjYgYXQgNTo1NuKAr1BNIEF2aSBXZWlzcyA8dGhua3NscHJwdEBn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gaW1zaWNfaXJxX3JldHJpZ2dlcigpIHdyaXRlcyB0byB0aGUg
SU1TSUMgTVNJIHJlZ2lzdGVyIHRvIHJldHJpZ2dlcgo+IGFuIGludGVycnVwdCwgYnV0IHJldHVy
bnMgMC4gVGhlIElSUSBjb3JlIHRyZWF0cyB6ZXJvIGFzIGZhaWx1cmUgYW5kCj4gbWF5IHNjaGVk
dWxlIGEgc29mdHdhcmUgcmVzZW5kIGRlc3BpdGUgdGhlIGhhcmR3YXJlIHJldHJpZ2dlci4KPgo+
IFJldHVybiAxIGFmdGVyIHRoZSBNU0kgd3JpdGUgdG8gcmVwb3J0IHN1Y2Nlc3NmdWwgaGFyZHdh
cmUKPiByZXRyaWdnZXJpbmcgYW5kIHByZXZlbnQgdGhlIHVubmVjZXNzYXJ5IHNvZnR3YXJlIHJl
c2VuZC4KPgo+IEZpeGVzOiAwMjdlMTI1YWNkYmEgKCJpcnFjaGlwL3Jpc2N2LWltc2ljOiBBZGQg
ZGV2aWNlIE1TSSBkb21haW4gc3VwcG9ydCBmb3IgcGxhdGZvcm0gZGV2aWNlcyIpCj4gU2lnbmVk
LW9mZi1ieTogQXZpIFdlaXNzIDx0aG5rc2xwcnB0QGdtYWlsLmNvbT4KClRoYW5rcyBmb3IgY2F0
Y2hpbmcuCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClJl
Z2FyZHMsCkFudXAKCj4gLS0tCj4gIGRyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMtcGxh
dGZvcm0uYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1w
bGF0Zm9ybS5jIGIvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1wbGF0Zm9ybS5jCj4g
aW5kZXggOTVmZjc2ZTYzYTY5Li41ZjcyYjJhODA4ODcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9p
cnFjaGlwL2lycS1yaXNjdi1pbXNpYy1wbGF0Zm9ybS5jCj4gKysrIGIvZHJpdmVycy9pcnFjaGlw
L2lycS1yaXNjdi1pbXNpYy1wbGF0Zm9ybS5jCj4gQEAgLTYxLDcgKzYxLDcgQEAgc3RhdGljIGlu
dCBpbXNpY19pcnFfcmV0cmlnZ2VyKHN0cnVjdCBpcnFfZGF0YSAqZCkKPgo+ICAgICAgICAgbG9j
YWwgPSBwZXJfY3B1X3B0cihpbXNpYy0+Z2xvYmFsLmxvY2FsLCB2ZWMtPmNwdSk7Cj4gICAgICAg
ICB3cml0ZWxfcmVsYXhlZCh2ZWMtPmxvY2FsX2lkLCBsb2NhbC0+bXNpX3ZhKTsKPiAtICAgICAg
IHJldHVybiAwOwo+ICsgICAgICAgcmV0dXJuIDE7Cj4gIH0KPgo+ICBzdGF0aWMgdm9pZCBpbXNp
Y19pcnFfYWNrKHN0cnVjdCBpcnFfZGF0YSAqZCkKPgo+IGJhc2UtY29tbWl0OiA2YjRiNTQzZmEx
ODc1NzI5N2FjNzU2YTZmZTZlNjRmNTA2Yjc4NDRhCj4gLS0KPiAyLjQzLjAKPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
