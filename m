Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E221606A31A
	for <linux-riscv@archiver.kernel.org>; Sat, 31 Oct 2026 16:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3qUYjHL1;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IsPNerAo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=I04G4TZSFOc4o2TeW+Dq743A1zphC51Kw4ExlLeQn1s=; b=3qUYjHL16UI+wRnc9+UDVkWKp1
	hAH9J+9kyfBsJwPqYTV7DBIbMBONufs3LUoq/EyXpGLAOJBhPZ/7Yv1sXYHi0canUg/LRsmn6dufu
	RYLpHC6Y+YS9EaMlyUrkSV//UWhvbnJ8QSq9E5QXK+0D81Mt0S0lG9FW1qFGCvfes70b2cTQIHOyu
	M7wvQHQuBPjY6fS3ntEeLokQhAvU0NN9yGVIXS0DtM0DsG1+u8+Ci7mqbn8uXXISZeEI2dlo2OEe8
	FrFzAftKqtOYNaJNouhzLzlVGCggkTF+c1s9EGgbA9FTetd2GsVz8bZkSFbVdbs9DuctZSPFAKONW
	NCqVrvow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNC2r-0000000DUTz-16va;
	Sat, 31 Oct 2026 16:35:05 +0000
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNC2o-0000000DUTH-10km
	for linux-riscv@lists.infradead.org;
	Sat, 31 Oct 2026 16:35:03 +0000
Received: by mail-yx1-xb131.google.com with SMTP id 956f58d0204a3-6798af41644so1089353d50.2
        for <linux-riscv@lists.infradead.org>; Sat, 31 Oct 2026 09:35:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793464500; cv=none;
        d=google.com; s=arc-20260327;
        b=sk4l/clS6x2mU+GV5cUd2hH3SJjOhCU7W+1aYghfmAgqemiJp7XQIByHPRCfpn4xt6
         Tf3FsstHJsqODgQKEx7nWFwRQkrV7vgMm3xU0i5gs7/TXK6Icgeehf06v+GQVeOq0WUA
         0BwxGXEJ8wxkvrnpBOGlbvoXiwpWvxnHAKJlnlI6JAr2u29jCr6yicmMwIB337ZpkeYz
         fnBkgBJrY2VgRAzJ30bvdyeEBESgV4aYXJwEossCievTRUw1pTmKwW9L+tOgXenynBTX
         AoJlkrtIDNbNMidd2mL05geWjitqX4wnIEPex64MPGacZDeAzXYK99QLhvBw1TT6Ibca
         wENw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xh4+zw2NsvluCtokX+uj0ZJ8AJtCAX02SKccWbKLLC0=;
        fh=cU1JQsShK2jkR6KU84d2e2fI5JUC+j48p26RiYqdsyA=;
        b=k2eFhO99mbFPqeHCKhuMu1p4VRWXWwGy/fYv2H8kJI8pUtpr3jTYXrl5VvcG2ySxUD
         2mdz8CAF99TaTAar272yD1/MtUNmdg2YLZPeHkEymN4Mkj+s2o14L9/fYHWDnlxIr6Yx
         dRlnkJp+4UlSKH4DaXQmBts6aoBeqzn2aa1THLWrJV/0LsGPwas7t8QEeVliEIf6IL5U
         UF88AH+zrm9goz47wfesiYsi+290+vO0A34GMYlu4WVHJ7tAg8MwF7qaTOrUzj9sn5z7
         fxkCT6ESudTpJFwPmKG8b/YjH9C7cyu0sBPnf+5sdXliHdmDmYoR0EZE3C+k6yzOP37h
         o8Fg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793464500; x=1794069300; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xh4+zw2NsvluCtokX+uj0ZJ8AJtCAX02SKccWbKLLC0=;
        b=IsPNerAoaE337A46rfyI3ybH5kx1O+88MzxIFI53i1RRdI91WEP1rMkZ1jWlD0NmUn
         CSru7I49jj2NTEjM8vRoAfnTLH7fONtuszrmYzPS6nqlZiQ0sFxATDXmVf+WrllbSyHo
         R7BaPdffy5e8IlfZRczK7n2HMqKHr0i2Oxaob4+8IyYMKO51u6/DcXDxVMi6FHloDvrW
         XNQb+Mjrv7uEc83kt4bcJFT9BL/QJTUNGwA2N9sVzWOJebkPMJ6pymZGLz+1r8WPBQdT
         UHR9JKJPlh/Q9YXomIku60h6sCQP9lupcwm2nD0Te3JEo/YCnNLecMtR/V1l2TXUMPvs
         xdow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793464500; x=1794069300;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xh4+zw2NsvluCtokX+uj0ZJ8AJtCAX02SKccWbKLLC0=;
        b=zWv/uLp6K1V28YIu+ZI25uY7m3SHXuHFSv6E53VQ70WQEimMrFdB3W+NnWgIA04zyp
         4i5c/Hx6xdzqLnwJcgflwyLKKskyxFAlXHmSXhB/rkfjEEIpPJ5fS9bwTErKi1PDFsHN
         2pvA4xtQpfcRo6xUM3AqlfCeJpMxKdtVlSZFpKHidEqX9YqWncefUzTzvTymkbs7oa7l
         HL1/1xF1fUMiPJGlvbQc4ROQxpFQumGgX5oDxfH0tsVqqO08qfHgr2iaKLNi2rZwdLEL
         Ifsa+5UgvcMUOknfNlgE+ZxSB4EVWdxb98fG/lrgsYwiaIXQpwZaAoT5nhNVQEQbmwI8
         +avw==
X-Forwarded-Encrypted: i=1; AKwUvBwRpE4pEe9sJy3eSfBlLNjUJfrnmFoxIyaYgmD0Reflp8BKvVzuXWHO2+XVunObIr9ce8pGy0VGY6dJzg==@lists.infradead.org
X-Gm-Message-State: APuU4Z/G4gtuh9WFXMUVZ942CocZ+cJsGl0ur3apZgHUfe/Azx3sFKYp
	CHtHW7qZ2Qjlj9xeGr1dHTSblU6FOt8etCMY2KOe8ulQRYyTL6SPOAeI1W9f6pI4iPaQ8puuNKL
	vHQDGNA4Xbsv3QRTFYlAgrYhURxLf2hM=
X-Gm-Gg: AYBFou3YC40heqPw45ye2CDVIRwGGYPEhV4FSxpsDYvADj27J8MVM2Isv/ObnJSzbcO
	1MzNouC0miaC/qG7eUY453qN7g5i/lq007i29PtG6Lhws/jOW6/SFZD87b4E5UE3zIMyoKVW/KR
	q/wlITlCbJqLy2QEhtU5qzQZUCz2Dy036rNCZPjCcZqNV0MaeQkLVL9rj4K5rim7kdn3V21ynT7
	BqSASZYKsT0qCVlRzxiAZZbNPgUNdnUlKQ7rX4Av/5oONJ+ZH+nj7S6XtboUhUWBRzDnVEz6eGY
	KT+GsAa9NH3pQitAXB0ncPPG7uisnzII5oXULTxp7uSqbCOH/tX3ZDd4HrjZR58o+hD8gLDg5Zb
	7rY+3AuMhCOi9vYTDfmS1s4jpAkFKb3Px+jU5aO8TOhIoWDFvP2eDfuD0CP00
X-Received: by 2002:a05:690e:4514:10b0:670:fe59:3f7d with SMTP id
 956f58d0204a3-67ba502f92amr2477741d50.52.1793464500102; Sat, 31 Oct 2026
 09:35:00 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261029-img-pm-autosuspend-v1-1-26851840a34e@linux.spacemit.com> <DMHSRIU2XCB0.35RV6ADY6W1IE@kernel.org>
In-Reply-To: <DMHSRIU2XCB0.35RV6ADY6W1IE@kernel.org>
From: Gyeyoung Baek <gye976@gmail.com>
Date: Sun, 1 Nov 2026 01:34:49 +0900
X-Gm-Features: AclHuK-jvh4fcghfPZ1KFb682ZDJ6x2_Cukku_cOj7Mrng853tNlYasYF_Ksjf8
Message-ID: <CAKbEzns6CYjNXmf4jTx_eGSH2j6AjpKJPx=EtoqxweGLiQ85JA@mail.gmail.com>
Subject: Re: [PATCH] drm/imagination: retry runtime idle when firmware is not
 yet idle
To: Troy Mitchell <troy@kernel.org>
Cc: Baihui Liang <liangbaihui@linux.spacemit.com>, 
	Alessio Belle <alessio.belle@imgtec.com>, Luigi Santivetti <luigi.santivetti@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Yixun Lan <dlan@kernel.org>, imagination@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_093502_341409_981DCFAB 
X-CRM114-Status: GOOD (  25.80  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgQmFpaHVpLCBUcm95LAoKCk9uIEZyaSwgT2N0IDMwLCAyMDI2IGF0IDEwOjU14oCvQU0gVHJv
eSBNaXRjaGVsbCA8dHJveUBrZXJuZWwub3JnPiB3cm90ZToKPgo+IEhpIEJhaWh1aSwKPgo+IE9u
IFRodSBPY3QgMjksIDIwMjYgYXQgNDozOCBQTSArMDgwMCwgQmFpaHVpIExpYW5nIHdyb3RlOgo+
ID4gUmV0dXJuaW5nIC1FQlVTWSBmcm9tIC0+cnVudGltZV9pZGxlKCkgcHJldmVudHMgdGhlIFBN
IGNvcmUgZnJvbQo+ID4gcmV0cnlpbmcgdGhlIGlkbGUgY2hlY2suIFNjaGVkdWxlIGFuIGF1dG9z
dXNwZW5kIHNvIHRoZSBpZGxlIHN0YXRlCj4gPiBjYW4gYmUgcmUtZXZhbHVhdGVkIG9uY2UgdGhl
IGZpcm13YXJlIHJlYWNoZXMgUk9HVUVfRldJRl9QT1dfSURMRS4KPiA+Cj4gPiBTaWduZWQtb2Zm
LWJ5OiBCYWlodWkgTGlhbmcgPGxpYW5nYmFpaHVpQGxpbnV4LnNwYWNlbWl0LmNvbT4KPiA+IC0t
LQo+ID4gVGVzdGVkIG9uIFNwYWNlbWlUIEszIChQb3dlclZSIFJvZ3VlIEJYTS00LTY0KSBieSBy
dW5uaW5nIHZ1bGthbmluZm8KPiA+IHJlcGVhdGVkbHkuIFdpdGhvdXQgdGhpcyBjaGFuZ2UgdGhl
IGRldmljZSBpbnRlcm1pdHRlbnRseSBzdGF5ZWQKPiA+IHJ1bnRpbWUtYWN0aXZlIGFmdGVyIHRo
ZSBsYXN0IHVzZXIgd2VudCBhd2F5LCBiZWNhdXNlIHRoZSBmaXJtd2FyZSBoYWQKPiA+IG5vdCB5
ZXQgcmVhY2hlZCBST0dVRV9GV0lGX1BPV19JRExFIHdoZW4gdGhlIGlkbGUgY2hlY2sgcmFuLiBX
aXRoIHRoZQo+ID4gY2hhbmdlIHRoZSBkZXZpY2UgcmVsaWFibHkgc3VzcGVuZHMuCj4gPiAtLS0K
PiA+ICBkcml2ZXJzL2dwdS9kcm0vaW1hZ2luYXRpb24vcHZyX3Bvd2VyLmMgfCAxMSArKysrKysr
KysrLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
Cj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9wdnJfcG93
ZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9wdnJfcG93ZXIuYwo+ID4gaW5kZXgg
ZWI0YjZlY2RmNGYuLjZmMzgyNDlmZmNiIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2ltYWdpbmF0aW9uL3B2cl9wb3dlci5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaW1hZ2lu
YXRpb24vcHZyX3Bvd2VyLmMKPiA+IEBAIC00MzQsNyArNDM0LDE2IEBAIHB2cl9wb3dlcl9kZXZp
Y2VfaWRsZShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gPiAgICAgICBzdHJ1Y3QgZHJtX2RldmljZSAq
ZHJtX2RldiA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBsYXRfZGV2KTsKPiA+ICAgICAgIHN0cnVj
dCBwdnJfZGV2aWNlICpwdnJfZGV2ID0gdG9fcHZyX2RldmljZShkcm1fZGV2KTsKPiA+Cj4gPiAt
ICAgICByZXR1cm4gcHZyX3Bvd2VyX2lzX2lkbGUocHZyX2RldikgPyAwIDogLUVCVVNZOwo+ID4g
KyAgICAgaWYgKHB2cl9wb3dlcl9pc19pZGxlKHB2cl9kZXYpKQo+ID4gKyAgICAgICAgICAgICBy
ZXR1cm4gMDsKPiA+ICsKPiA+ICsgICAgIC8qCj4gPiArICAgICAgKiBGaXJtd2FyZSBub3QgeWV0
IGlkbGU7IHJlamVjdCBidXQgc2NoZWR1bGUgYXV0b3N1c3BlbmQgc28KPiA+ICsgICAgICAqIHJ1
bnRpbWVfaWRsZSgpIGNhbiBiZSByZXRyaWVkLgo+ID4gKyAgICAgICovCj4gPiArICAgICBwbV9y
dW50aW1lX2F1dG9zdXNwZW5kKGRldik7Cj4KPiBJZiBJIHJlYWQgdGhlIFBNIGNvcmUgY29ycmVj
dGx5LCB3aGVuIHRoaXMgYXV0b3N1c3BlbmQgdGltZXIgZmlyZXMgaXQKPiBjYWxscyAtPnJ1bnRp
bWVfc3VzcGVuZCgpIGRpcmVjdGx5IHJhdGhlciB0aGFuIHJldHJ5aW5nCj4gLT5ydW50aW1lX2lk
bGUoKSwgc28gdGhpcyBsb29rcyBlcXVpdmFsZW50IHRvIHJldHVybmluZyAwLiBDb3VsZCB0aGUK
PiByZWFsIGlzc3VlIGJlIHRoZSBwbV9ydW50aW1lX3B1dCgpIGluIHB2cl93YXRjaGRvZ193b3Jr
ZXIoKSwgd2hpY2gKPiBwZXJoYXBzIHNob3VsZCBiZSBwbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVu
ZCgpPwoKSSB0aGluayBzYXNoaWtvJ3MgcG9pbnQgaXMgdmFsaWQuCgpDYWxsaW5nIHBtX3J1bnRp
bWVfYXV0b3N1c3BlbmQoKSBmcm9tIHB2cl9wb3dlcl9kZXZpY2VfaWRsZSgpIHdoZW4gdGhlCkZX
IGlzIGJ1c3kgb25seSBhZGRzIGEgZGVsYXksIGFuZCB0aGUgZGV2aWNlIGlzIHRoZW4gc3VzcGVu
ZGVkIHdpdGhvdXQKcmUtY2hlY2tpbmcgaWRsZSwgYW5kIHRoaXMgaXMgZWZmZWN0aXZlbHkgdGhl
IHNhbWUgYXMKcmV0dXJuaW5nIDAuIEkgZ3Vlc3MgaXQgd29ya2VkIGluIHRlc3RpbmcgYmVjYXVz
ZSB0aGUgRlcgd2FzIGJ1c3kgYXQKcHZyX3Bvd2VyX2RldmljZV9pZGxlKCkgdGltZSBidXQgcmVh
Y2hlZCBpZGxlIGJlZm9yZSB0aGUgYXV0b3N1c3BlbmQKZGVsYXkgZXhwaXJlZC4KCkhvdyBhYm91
dCBtb3ZpbmcgdGhlIHB2cl9wb3dlcl9pc19pZGxlKCkgY2hlY2sgaW50bwpwdnJfcG93ZXJfZGV2
aWNlX3N1c3BlbmQoKSAoYW5kIGRyb3BwaW5nIHB2cl9wb3dlcl9kZXZpY2VfaWRsZSgpKSwgYW5k
CnJldHVybmluZyAtRUJVU1kgYWZ0ZXIgcG1fcnVudGltZV9tYXJrX2xhc3RfYnVzeSgpIGlmIHRo
ZSBGVyBpcyBidXN5PwpUaGUgUE0gY29yZSB0aGVuIHJlc2NoZWR1bGVzIHRoZSBhdXRvc3VzcGVu
ZCByZWdhcmRsZXNzIG9mIHdoZXRoZXIgdGhlCmxhc3QgcHV0IGNvbWVzIGZyb20gdGhlIHdhdGNo
ZG9nIG9yIGVsc2V3aGVyZSwgc28gc3VzcGVuZCBpcyByZXRyaWVkCnVudGlsIHRoZSBGVyBiZWNv
bWVzIGlkbGUuCgpJIHRoaW5rIHRoaXMgaXMgdGhlIHBhdHRlcm4gZGVzY3JpYmVkIGluCkRvY3Vt
ZW50YXRpb24vcG93ZXIvcnVudGltZV9wbS5yc3QsIHNlY3Rpb24gOSAoIklmIHRoZQotPnJ1bnRp
bWVfc3VzcGVuZCgpIGNhbGxiYWNrIHJldHVybnMgLUVBR0FJTiBvciAtRUJVU1kgLi4uIikuCgot
LQpUaGFua3MsCkd5ZXlvdW5nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
