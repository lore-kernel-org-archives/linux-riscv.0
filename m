Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8415AD41178
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 11:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7mWo1zH1lI7pNBIix2HXHV3C/aGMPB/NaGCr4L5iUnQ=; b=ClMOLXDgaHJT8k
	CTJHYohQXmdvWLZ+5ePlzO7Xex/ZPJkKRFpH1Zf+0kZ2ukbekWogsAEeqm5TSmtw7ufhkKjr7U+Gm
	y9UpHv94m6Qkd1V+6JifNFgXR1aH+EBq2KyLUszfeyJQcUO3nqVEU3VaEn5f+448Bt6nVUNv2YSXl
	vQC7BYdK04PXC4d/OW2Owx8v0WVg2CKCi6n2LTSwmOwWheWZ59awhXkoeKl75mXZwu4RrhmqpWvkk
	54GRRBdwRLqrApWjkUsSvMLf/snbxV3WSwI8hFw6p76vKGGa260irn63t5IWJx+e+Ki86+mKhoJ88
	f9AYMhiT5fbS43EIiF5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgLsL-0000000CGdh-3mrr;
	Thu, 15 Jan 2026 11:50:54 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgLsI-0000000CGdK-251n
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 11:50:51 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-b6ce6d1d3dcso325425a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 15 Jan 2026 03:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768477849; x=1769082649; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vxL6yKXO/K+VFMQh+Ey78JIDvfbOPEMGyxh7p8iQq3s=;
        b=PZz6wjZlFP2zN3wRJU2Tn3pcC0NUSXPDOabzYfXUSUJsTFLp76URpKGaxEL3xL3WYj
         Dt3yX3Tx72keyU/czO/2SB9+nWKV8jV/vTlTP8IFfx4OWy99Oaz6m9FoLsFv9VRBUbiz
         JuFF8PugzrAO3VCRKt7Mlt+g94ZZcPG+i7+8tDT1UIgs4Q8bgzRYtSBJ4BtvxwC2ZwnH
         kpfm+fxCQI1jYdCuMxuVS2BpNkMHbyQa0UdcgaWAE+blYzUD5ym9lfcv5gWPDqptH0dW
         69yTEzw+39hwEcw5MYRbyCmkP0hh0ehmm//sxsjByWpzyIQXV6wdroTG6zP5bBI3lFy9
         e7Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768477849; x=1769082649;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vxL6yKXO/K+VFMQh+Ey78JIDvfbOPEMGyxh7p8iQq3s=;
        b=Oss7GJ6BYr9oL3afzkENuhOdHSomqf8BnzSUrryypMTqNDDQPwCpqsZ5O429e+zCOr
         2RWjjvjrhWHc1C6Ioit60WHhO/CufBL/CZKZm4xPlyMfWQGALKAMzXaKHdRz/E0psRH8
         D64KZeNwlbGogFWyIhRohC5tJqUjhR/PoL4A1NFAjsCFPWdXuurUMGLiJALEbu7Q027u
         IuJkMHmaDCACTBIIvIoyn3nRY4G4y3jFASiQCCEpCwZJH48EOkTTyR1KDqmiJ2Y6JNMw
         aKqjXR/xcnNXbPsR4H9ZbQdcSltB/h8IfTaA5NkMdrh+qbNkcprnIS13ivK3ehM/c/c8
         OsWA==
X-Forwarded-Encrypted: i=1; AJvYcCVsu3L6Rna9FIJHd1hFi0wsxi7qT5DK8wRLRPSITe+JcsaTAlellcjWXWT7VeF7MZeSb85ULo7KY+Xi4Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzwYTzvMHvF2r+YgAkQ7S6D89HwuG0CQ1R+Jk1g41U4WR3kEYfJ
	q+QsJmgarMLLw+gqSPOA7rINQKfBO+9y9veiVeODGYWl6dL4QDu/hz1C6sfzVtqFdebHPfTQyxO
	bnyodIfzVdFeYxhx1O/PQa7BR7V70UT8=
X-Gm-Gg: AY/fxX5jec2FuMUk4cH+JZkBsjE6JOjz74fgCQrO0vrCi1flfz/FAZtZQ8T6Y0CRB6H
	UKkYKgjIuOrfO/FsShQKEdgsN8gT3oPAGpHtqaokINa8PeGkCpjE6Lamka/M8uokkb+/KesLb/f
	b6v4TfVwhFY6ZF0MGed3wgqcE2eEC0LGDcoboGAAWWFrmNCmhxq9hWnh+mxB7PguBQwnHWih3qx
	pMccny2tr6qYMY9zWFMlbULCNmeJHxhrlqOfyC2S5YXE/s0Pr+BVC04/iiwNLaUvjQyuQZd/RBw
	aTaIX86P8qj9RIzayooZ/G6eWoDSzw==
X-Received: by 2002:a17:90b:2544:b0:339:eff5:ef26 with SMTP id
 98e67ed59e1d1-3510b1439cfmr5252420a91.30.1768477848958; Thu, 15 Jan 2026
 03:50:48 -0800 (PST)
MIME-Version: 1.0
References: <20260113134025.905627-1-florian.schmaus@codasip.com>
In-Reply-To: <20260113134025.905627-1-florian.schmaus@codasip.com>
From: =?UTF-8?B?6rmA64+Z7ZiE?= <austin.lkml@gmail.com>
Date: Thu, 15 Jan 2026 20:50:39 +0900
X-Gm-Features: AZwV_Qg57LecLEJV8QW1IsavYply7MmtcSc63xeIDU-zgaFJqmZKAAMf-GqR-0g
Message-ID: <CA+mHjF7+HF9y2AfdqECfXfh_VTZoOe8O0mD3gD-Ysg+g0k8Ang@mail.gmail.com>
Subject: Re: [PATCH] riscv: mm: define copy_user_page() as copy_page()
To: Florian Schmaus <florian.schmaus@codasip.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Austin Kim <austindh.kim@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_035050_679586_3871C757 
X-CRM114-Status: GOOD (  17.85  )
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

SGVsbG8sCgoyMDI264WEIDHsm5QgMTPsnbwgKO2ZlCkg7Jik7ZuEIDEwOjQyLCBGbG9yaWFuIFNj
aG1hdXMgPGZsb3JpYW4uc2NobWF1c0Bjb2Rhc2lwLmNvbT7ri5jsnbQg7J6R7ISxOgo+Cj4gQ3Vy
cmVudGx5LCB0aGUgaW1wbGVtZW50YXRpb24gb2YgY29weV91c2VyX3BhZ2UoKSBpcyBpZGVudGlj
YWwgdG8KPiBjb3B5X3BhZ2UoKS4KPgo+IEFsaWduIHJpc2N2IHdpdGggb3RoZXIgYXJjaGl0ZWN0
dXJlcyAoYWxwaGEsIGFyYywgYXJtNjQsIGhleGFnb24sCj4gbG9uZ2FyY2gsIG02OGssIG9wZW5y
aXNjLCBzMzkwLCB1bSwgeHRlbnNhKSBhbmQgbWFwIGNvcHlfdXNlcl9wYWdlKCkKPiB0byBjb3B5
X3BhZ2UoKSBnaXZlbiB0aGF0IHRoZWlyIGltcGxlbWVudGF0aW9uIGlzIGlkZW50aWNhbC4KPgo+
IEluIGFkZGl0aW9uIHRvIGZvbGxvd2luZyBhIGNvbW1vbiBwYXR0ZXJuLCB0aGlzIGNlbnRyYWxp
emVzIHRoZQo+IGltcGxlbWVudGF0aW9uLiBBbnkgY2hhbmdlcyB0byB0aGUgdW5kZXJseWluZyBw
YWdlIGNvcHkgbG9naWMgKGUuZy4sCj4gZm9yIENIRVJJKSB3aWxsIG5vdyBhdXRvbWF0aWNhbGx5
IHByb3BhZ2F0ZSB0byBjb3B5X3VzZXJfcGFnZSgpLgo+Cj4gU2lnbmVkLW9mZi1ieTogRmxvcmlh
biBTY2htYXVzIDxmbG9yaWFuLnNjaG1hdXNAY29kYXNpcC5jb20+Cj4gLS0tCj4gIGFyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vcGFnZS5oIHwgMyArLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vcGFnZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wYWdlLmgKPiBpbmRleCBmZmUy
MTNhZDY1YTQuLjNjNTE3YmM5ZWFjNSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL3BhZ2UuaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGFnZS5oCj4gQEAgLTUx
LDggKzUxLDcgQEAgdm9pZCBjbGVhcl9wYWdlKHZvaWQgKnBhZ2UpOwo+ICAjZGVmaW5lIGNvcHlf
cGFnZSh0bywgZnJvbSkgICAgICAgICAgICAgICAgICAgIG1lbWNweSgodG8pLCAoZnJvbSksIFBB
R0VfU0laRSkKPgo+ICAjZGVmaW5lIGNsZWFyX3VzZXJfcGFnZShwZ2FkZHIsIHZhZGRyLCBwYWdl
KSAgIGNsZWFyX3BhZ2UocGdhZGRyKQo+IC0jZGVmaW5lIGNvcHlfdXNlcl9wYWdlKHZ0bywgdmZy
b20sIHZhZGRyLCB0b3BnKSBcCj4gLSAgICAgICAgICAgICAgICAgICAgICAgbWVtY3B5KCh2dG8p
LCAodmZyb20pLCBQQUdFX1NJWkUpCj4gKyNkZWZpbmUgY29weV91c2VyX3BhZ2UodnRvLCB2ZnJv
bSwgdmFkZHIsIHRvcGcpIGNvcHlfcGFnZSh2dG8sIHZmcm9tKQoKSGVyZSBhcmUgdGhlIG9ic2Vy
dmF0aW9uIG92ZXIgdGhpcyBwYXRjaDoKCjEuIEFmdGVyIGNvbXBpbGluZyB3aXRoICdDUk9TU19D
T01QSUxFPXJpc2N2NjQtbGludXgtZ251LScgb3B0aW9uLAp0aGUgZm9sbG93aW5nIGlzIHRoZSBj
b3JyZXNwb25kaW5nIHN0YXRlbWVudCBmb3IgY29weV91c2VyX3BhZ2UoKSBpbgpwcmVwcm9jZXNz
ZWQgZmlsZS4KCiBkbyB7IGRvIHsgX19hdHRyaWJ1dGVfXygoX19ub3JldHVybl9fKSkgZXh0ZXJu
IHZvaWQKX19jb21waWxldGltZV9hc3NlcnRfMzMzKHZvaWQpIF9fYXR0cmlidXRlX18oKF9fZXJy
b3JfXygiQlVJTERfQlVHX09OCmZhaWxlZDogIiAiX19zYW1lX3R5cGUoKHZ0byksIHN0cnVjdCBw
YWdlICopIikpKTsgaWYKKCEoIShfX2J1aWx0aW5fdHlwZXNfY29tcGF0aWJsZV9wKHR5cGVvZigo
dnRvKSksIHR5cGVvZihzdHJ1Y3QgcGFnZQoqKSkpKSkgX19jb21waWxldGltZV9hc3NlcnRfMzMz
KCk7IH0gd2hpbGUgKDApOyBfX2t1bm1hcF9hdG9taWModnRvKTsKfSB3aGlsZSAoMCk7CgpPdXRw
dXQgaXMgdGhlIHNhbWUgLSBiZWZvcmUvYWZ0ZXIgcGF0Y2g6IFRoYXQgbWVhbnMgdGhhdCB0aGUg
Z2VuZXJhdGVkCnJpc2MtdiBpbnN0cnVjdGlvbiBpcyB0aGUgc2FtZS4KCjIuIGNvcHlfdXNlcl9w
YWdlKCkgaXMgb25seSB1c2VkIGluIGRheCBmaWxlIHN5c3RlbSAoZnMvZGF4LmMpCgozLiBXaXRo
IHRoZSBuZXcgcGF0Y2gsIHRoZSBmdWxsIGNvbXBpbGF0aW9uIGZvciBhbGwgb2YgdGhlIGNvZGUg
aGFwcGVucy4KCkJSLApBdXN0aW4gS2ltCj4KPiAgLyoKPiAgICogVXNlIHN0cnVjdCBkZWZpbml0
aW9ucyB0byBhcHBseSBDIHR5cGUgY2hlY2tpbmcKPiAtLQo+IDIuNTIuMAo+Cj4KPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
