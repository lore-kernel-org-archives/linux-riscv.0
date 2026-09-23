Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F27DFC98304
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 20:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w2Mldk85XTOnvErdvzmJ2gx5409k/0nSmAkRJfXkEdM=; b=YJqP5AxyAvIz2I
	LC2ZA3QG/ukbE+flEsywXmZVnI1OpPAu35UzPydSJxfdzBE1aNp/yrxV2c/hA7Ho+iaPslhTa6lh+
	gydfq+P5i+o1vXonwWsQrUde70zny8p32juzD+dexG/51Jv8+j9bO/H8piwAaKq/sbwkZPZgCEw74
	0BIs2Sk/O2cHHGDeL6aQLgIt6xCVLp1T+/e8r0XKMoyQpOmy+P7Gtb7MhZx/N1zkVUy8U6hapla2B
	jLKKci38RiRULiREqNqsSKRmlTWu/UeAFc5DEMNsvTh7lZp3VaBYu0vmAlN2ttBsFUBJyN4oU14VU
	Wgn767bcMM6y0QXjIO1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9TDY-00000009OI5-06Zv;
	Wed, 23 Sep 2026 20:05:24 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9TDV-00000009OGU-2TOS
	for linux-riscv@lists.infradead.org;
	Wed, 23 Sep 2026 20:05:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790193919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=81DZGA9FL/IAuER9hPI/dybgl88+ZKCRPSLQjN963CY=;
	b=MmH0neUe5Z1Vn8BoOAjEpSWoee//jmmzwMTyRB8/f1HzRUZKrl576tUHCHN9sU6XIt7POj
	ijeWXH70vq5YLaLt+HG48UyxwK5v9P8icgiBII277873EEGbfr+aRK5SyN43bbh3OccF2K
	DizV+SWmJUhxINbkrTJKvDkB8vFUaHY=
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com
 [74.125.224.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-iBoO02ToMSGt315BYk0sjA-1; Wed, 23 Sep 2026 16:03:37 -0400
X-MC-Unique: iBoO02ToMSGt315BYk0sjA-1
X-Mimecast-MFC-AGG-ID: iBoO02ToMSGt315BYk0sjA_1790193817
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-672e7c0d4d4so739388d50.0
        for <linux-riscv@lists.infradead.org>; Wed, 23 Sep 2026 13:03:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790193817; x=1790798617;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=81DZGA9FL/IAuER9hPI/dybgl88+ZKCRPSLQjN963CY=;
        b=cAnIMZer+4mdcO9PRsc5ZBZRTxkKeNsU7K/5hYNarWAtHkPCyyvoevZKOmh5kuaKBX
         NvMnyFaZqDYFJzdvFMQTk8Pbu4rV3ntmGoisAsTdTjt3AaA5Hqshp8w0we+fpZOPROE9
         nhEWnakL1Kusn5tfRGqMrB+i2ZCO89yJqPhnpAFbS4JQMyAyTkcM4/WV8eopTkG+NSc5
         yxT5HGcFJiY38bH2PBimkqI4JkIDcLnFLUvLnxADoFgd/40CR/VDrcM7Z8ulR20rZV9c
         d0NEs4EP9ZuuMKP7YozfD2JVRGcxJvkih02GChs+gEdGruG5GKNn9JyeTy7iHUYEMFLA
         zvnw==
X-Forwarded-Encrypted: i=1; AKwUvBzu9PNjgEbu7pgz9FL7JXvnCMtE8Rw2A9XsrM1tlCGRydWkQlZ6sYETTF0Nie5wX5Gbdxk3CsCfL/2wBA==@lists.infradead.org
X-Gm-Message-State: AFuF++nkxYzpyKu5teNnlwLaw5eWepGjXDQN3jOtqh/gZ8gDtHAozUqF
	Bz1omirUnC5sGZx6KL5R72nObTOcMDE0Ekz4MPJPtWmDfzxFE/xre1H7lmemOYA4L9o40HHukm1
	Uhp2rfNvsj4ogxgeTXT1DhBRBBqJVeXhGoyfoeVnzrEJTtyiNfG87ngK7yYxd34qZjFIkaByFHO
	IcTc03ap5KpyaJhFMisDdw3MlZ8kjyX0xp0i4ipxKAyiTd
X-Gm-Gg: AYBFou1ViLDPm6gPK/W9ZJvaC225FGoiJYIfPkewd0PZjvWlFVzy6qNw98kYOJ0F41d
	xECUlGUR7FJ/H63CGRb01QK3fNP1tjDJmlY4DyfaUyYYwhv+SYTaLTbiIcwqJOREzRPYdC7SS5L
	BO+TJxERCzgZrhV4tjje9hQcOzCZ3e9WuONA3Iw9JVi1QHbBHelQL7EzN8ZQ==
X-Received: by 2002:a05:690e:4805:b0:672:a055:f98a with SMTP id 956f58d0204a3-672ed51a9a9mr116072d50.100.1790193816914;
        Wed, 23 Sep 2026 13:03:36 -0700 (PDT)
X-Received: by 2002:a05:690e:4805:b0:672:a055:f98a with SMTP id
 956f58d0204a3-672ed51a9a9mr116058d50.100.1790193816473; Wed, 23 Sep 2026
 13:03:36 -0700 (PDT)
MIME-Version: 1.0
References: <aolxiwRzSDlJt2t5@aurel32.net> <20260824161259141TiMgABa1lW5yLKfzn4DnF@zte.com.cn>
In-Reply-To: <20260824161259141TiMgABa1lW5yLKfzn4DnF@zte.com.cn>
From: Jason Montleon <jmontleo@redhat.com>
Date: Wed, 23 Sep 2026 16:03:24 -0400
X-Gm-Features: AclHuK_kTUkYKrD6IxvGRUy1fLZzftbYinHX455LrTz5v_FdMhIrrFWYdq4Nqn8
Message-ID: <CAJD_bPKrb2Xw16M7E2MB1n3jGPsMTueFPnaex5pOkSU-Y2iTMg@mail.gmail.com>
Subject: Re: [PATCH] riscv: lib: Fix address overflow due to large count
 values in strnlen ZBB path
To: gao.rui@zte.com.cn
Cc: aurelien@aurel32.net, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, jiangfeng@kylinos.cn, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fiRBIUw7yI4GkGZlYWnc-0TEYVskieyQt9OLhD2edFI_1790193817
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_130521_703883_E9035B10 
X-CRM114-Status: GOOD (  23.90  )
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

T24gTW9uLCBBdWcgMjQsIDIwMjYgYXQgNDoxMuKAr0FNIDxnYW8ucnVpQHp0ZS5jb20uY24+IHdy
b3RlOgo+Cj4KPiBIaSBBdXJlbGllbiwKPgo+ID5PbiAyMDI2LTA4LTE5IDE2OjE4LCBnYW8ucnVp
QHp0ZS5jb20uY24gd3JvdGU6Cj4gPj4gSGkgYWxsLAo+ID4+Cj4gPj4gVGhpcyBwYXRjaCBmaXhl
cyBhbiBpc3N1ZSBpbiB0aGUgUklTQy1WIFpCQiBvcHRpbWl6ZWQgc3RybmxlbiBpbXBsZW1lbnRh
dGlvbi4KPiA+Pgo+ID4+IFByb2JsZW0gZGVzY3JpcHRpb246IFdoZW4gdXNpbmcgdGhlIFpCQiBv
cHRpbWl6ZWQgc3RybmxlbiBpbXBsZW1lbnRhdGlvbiwgcGFzc2luZyB2ZXJ5IGxhcmdlIGNvdW50
IHZhbHVlcyAoc3VjaCBhcyBTSVpFX01BWCkgY2FuIGNhdXNlIGFkZHJlc3Mgb3ZlcmZsb3cgYW5k
IHJldHVybiBpbmNvcnJlY3QgcmVzdWx0cy4KPiA+Pgo+ID4+IFRoaXMgaXNzdWUgd2FzIG9ic2Vy
dmVkIGluIGRldmljZS1tYXBwZXIgdGVzdHM6Cj4gPj4KPiA+PiBzaC01LjIjIGRtc2V0dXAgY3Jl
YXRlIHRlc3RuYW1lOSAtLXRhYmxlICIwIDggemVybyIKPiA+PiBzaC01LjIjIGNhdCAvc3lzL2Js
b2NrL2RtLSovZG0vbmFtZQo+ID4+IHRlc3RuYW1lCj4gPj4gc2gtNS4yIyBkbXNldHVwIHJlbW92
ZSB0ZXN0bmFtZTkKPiA+Pgo+ID4+IFRoZSBvdmVyZmxvdyBpbiBzdHJubGVuIGNhdXNlZCBmYWls
dXJlcyBpbiBzdHJpbmcgaGFuZGxpbmcgZHVyaW5nIGRldmljZS1tYXBwZXIgb3BlcmF0aW9ucy4K
PiA+Pgo+ID4+IFBhdGNoIHN1bW1hcnk6Cj4gPj4gLSBFeHBsaWNpdGx5IGludHJvZHVjZSB0aGUg
c3Rybmxlbl9nZW5lcmljIGxhYmVsLgo+ID4+IC0gU2ltcGxpZnkgdGhlIGdlbmVyaWMgaW1wbGVt
ZW50YXRpb24gbG9vcC4KPiA+Cj4gPlRoaXMgcGFydCBzaG91bGQgYmUgaW4gYSBzZXBhcmF0ZSBw
YXRjaCwgc2VwYXJhdGVkIGZyb20gdGhlIGJ1ZyBmaXgsIGFuZAo+ID5pZiBwb3NzaWJsZSB3aXRo
IHNvbWUgYmVuY2htYXJrLgo+Cj4gSSBhZ3JlZSwgSSB3aWxsIHNwbGl0IHRoZSBnZW5lcmljIGlt
cGxlbWVudGF0aW9uIGNoYW5nZXMgaW50byBhIHNlcGFyYXRlIHBhdGNoIGFuZCBwcm92aWRlIGJl
bmNobWFyayByZXN1bHRzCj4gdG8gc2hvdyB0aGUgcGVyZm9ybWFuY2UgaW1wYWN0LgoKSGkgUnVp
LApIYXZlIHlvdSBtYWRlIGFueSBwcm9ncmVzcyBvbiBhbiB1cGRhdGVkIHBhdGNoPyBUaGlzIHBy
b2JsZW0gYXBwZWFycwp0byBiZSBicmVha2luZyBMVk0gb24gcmVjZW50IGtlcm5lbCB2ZXJzaW9u
cy4gV2UgYXR0ZW1wdGVkIHRvIGJvb3QgYW4KZWFybHkgcmlzY3Y2NCBGZWRvcmEgNDUgaW1hZ2Ug
d2l0aCBrZXJuZWwgNy4yLjcgdW5kZXIgUUVNVSB0b2RheSBhbmQKYm9vdGluZyBmYWlsZWQgdW5l
eHBlY3RlZGx5LgoKQWZ0ZXIgc29tZSBkaWdnaW5nIHdlIGZvdW5kIHRoYXQgTFZNIHdhcyBicm9r
ZW4gYmVjYXVzZSB0aGUgVVVJRCBmb3IKZG0tMCB3YXMgdHJ1bmNhdGVkLiBTaW5jZSB3ZSB3ZXJl
IHVzaW5nIExpYnZpcnQvUUVNVSBJIGFkanVzdGVkIHRoZSBWTQpjb25maWd1cmF0aW9uIHRvIGRp
c2FibGUgWkJCIGFmdGVyIHdoaWNoIHRoZSBWTSBib290ZWQgc3VjY2Vzc2Z1bGx5LgpgYGAKIDxj
cHUgbW9kZT0nY3VzdG9tJyBtYXRjaD0nZXhhY3QnIGNoZWNrPSdub25lJz4KICAgIDxtb2RlbCBm
YWxsYmFjaz0nZm9yYmlkJz5ydjY0PC9tb2RlbD4KICAgIDxmZWF0dXJlIHBvbGljeT0nZGlzYWJs
ZScgbmFtZT0nemJiJy8+CiAgPC9jcHU+CmBgYAoKUmVwcm9kdWNlcjogaHR0cHM6Ly9naXN0Lmdp
dGh1Yi5jb20vam1vbnRsZW9uLzRjY2EwN2U2ZTVlNWFhMDZiNmIzZTk4Y2VkMDUyNGUxCgpUaGFu
ayB5b3UsCkphc29uIE1vbnRsZW9uCgoKPgo+ID4+IC0gQWRkIGZhbGxiYWNrIGxvZ2ljIGluIHN0
cm5sZW5femJiIHRvIHJlZGlyZWN0IHRvIHRoZSBnZW5lcmljIHBhdGggd2hlbiBhMCArIGExIG92
ZXJmbG93cy4KPiA+PiBUaGlzIGVuc3VyZXMgY29ycmVjdCBiZWhhdmlvciBmb3IgbGFyZ2UgY291
bnQgdmFsdWVzIGFuZCBTSVpFX01BWCBjYXNlcy4KPiA+Cj4gPklzIHRoZXJlIGEgd2F5IHRvIGlu
c3RlYWQgdG8gZml4IHRoZSBzdHJubGVuX3piYiB0byBhdm9pZCB0aGUgZmFsbGJhY2s/Cj4gPgo+
Cj4gSXQgaXMgcG9zc2libGUgdG8gbWFrZSBzdHJubGVuX3piYiB3b3JrIGNvcnJlY3RseSB3aXRo
b3V0IGZhbGxiYWNrLCBJIHdpbGwgcmVjb25zaWRlciB0aGlzIHBvaW50OiAgaWYgdGhlIHBlcmZv
cm1hbmNlIGxvc3MKPiBvZiB0aGUgbm9uLWZhbGxiYWNrIHZlcnNpb24gdHVybnMgb3V0IHRvIGJl
IHNtYWxsLCB0aGVuIHVzaW5nIHRoZSBub24tZmFsbGJhY2sgY29kZSBtYXkgYmUgYWNjZXB0YWJs
ZS4KPgo+IFJlZ2FyZHMsCj4gUnVpCj4KPgo+Cj4KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
