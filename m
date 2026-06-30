Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64DB5C43458
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 00:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N5hkuIXoHZO8JNTykT4vSvqNK1hVBFgIANRhYORXhk4=; b=4jdnnZtex93IXe
	TYvpbu+7asFf0tsx3VAOwT5KZrWux6TIwwI9sqGvBOKycaDJU456j6kav3aE5TyKf58BTYvHmETXg
	SxsAKKKvSgBGz23Ti26ucoVjD5i87ZUs6OtA2YzmmiIwNw+pg8H1kEAEOKF7Imoki1vAf3Nplqc9A
	uq97TVYPBYX3/9tL0iEHvFp1yfGcCgjd/ASA4ht4OJKvhqp2abTQw71GUMRavgJIjCtRQRDdyDRfD
	/8w5My4H/XzYAo2NvsFF3D+azhznbRy/teUNyoM8c5++oLh0E/4oPryC1OsGuiR+AuEPePnR0Vrtl
	cWR/5zZMK5WqbNC8+7bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weMHl-0000000Fbmh-3vVV;
	Tue, 30 Jun 2026 00:25:09 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weMH2-0000000FblR-2u07
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jun 2026 00:25:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782779061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0wMkHt1yiC9aluHHTld/vXF2ndSc+3tCY4NweikcXiQ=;
	b=g1kQXI+APvMj8gKlNxgPs+ok3M49o9HU2+LPLOHfRJkVx1r3Ai+vkMmFfxeyD9IpOVSBQE
	pv6yMiQL2VQEgm8fy2AxciT0nCdZKaJ5dqaEWK0MJbMIb0h5YHoYYpGyQ7t6Yq9XjzHkqo
	Eig0kWyvYkqCnwG/Ukl83sOHFGaheCo=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-600-f4bp4K80Ozuxc9OqSZ7WQw-1; Mon, 29 Jun 2026 20:24:19 -0400
X-MC-Unique: f4bp4K80Ozuxc9OqSZ7WQw-1
X-Mimecast-MFC-AGG-ID: f4bp4K80Ozuxc9OqSZ7WQw_1782779059
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-519fd6364c9so73444181cf.1
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jun 2026 17:24:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782779059; x=1783383859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0wMkHt1yiC9aluHHTld/vXF2ndSc+3tCY4NweikcXiQ=;
        b=ab6kUIbzpLnpBfWkHuRfw1Dpk9tdpnFC0mgpqHO8d9jnvE5WkmAZyQbT4VKJn6mQRp
         1rzD22OvXArhmbwJD1rSVmrsncga+5oxIAjOCG+Z+uVLweOTgtoM8Ya6X28MSwvIgVaO
         badNyse4zF0Ztd/5aQGAps2R/wltl/CfBBEzVFEbqC+NjjjdVWVFkKVVpBMQJtx2BgMs
         Sz8pQMYCBgzGXSywoxWoccIWxU5dfZk/DYKD3ENsm8VjWzoXoEZBe4ET+qK47quin2Bz
         4lCY5tAachEIj1zsc1yBE5UirdSrce7HlckuCBUNfC9R+y6doeOqSEvZinK6S9oagtEK
         r4oQ==
X-Gm-Message-State: AOJu0YwQr57r6dxkGiFQ6PeeKRu4fowB4J6BZ9LB9gkfz5M9fZDhN+oK
	DbIbRPtwSCMa/wCzKOU1dKY+tCqxricvIJo5DigCfq02mlXId0DmCumGwbFzPwEpzuhqFBEULTC
	AFceE+ha3YDHEesJE2WGJMQTrB9tjjpCfJOCQ1QUjttcJJRInvnTDwWeiCzb3Q4X88vfGqBSIFX
	i1eo/vDuN3ysMYvqNqBV7bYb2+UUq55JBwTZawBthj0JWS
X-Gm-Gg: AfdE7cnn+AyVpR8i2G+eLmJI+zZ1udK/wRltmqBr8x3yR7HqXoeXuiON6hxroyMRhQE
	RvvkcvYiwjhjDdpnlTmiIoEu9FysCcK+pi1DP56Kj6W5q2kPob4tyqDOJ+BCvU/+4vPalS5umH+
	TaTca1AQcXEBYxZhA0cPGQpWbbzrVrCbteq9cyDSriigbR4azybJMnTzKM4hPKHAwcGCw=
X-Received: by 2002:a05:622a:4808:b0:51b:f563:f613 with SMTP id d75a77b69052e-51c1089ce79mr23434711cf.35.1782779058980;
        Mon, 29 Jun 2026 17:24:18 -0700 (PDT)
X-Received: by 2002:a05:622a:4808:b0:51b:f563:f613 with SMTP id
 d75a77b69052e-51c1089ce79mr23434121cf.35.1782779057989; Mon, 29 Jun 2026
 17:24:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260529032739.13264-2-ltao@redhat.com> <f1adcf3e-1489-4131-ab62-277cab6a29b9@web.de>
In-Reply-To: <f1adcf3e-1489-4131-ab62-277cab6a29b9@web.de>
From: Tao Liu <ltao@redhat.com>
Date: Tue, 30 Jun 2026 12:23:41 +1200
X-Gm-Features: AVVi8Cc2KsmKA8vZOsBz9V_FtCI8517u9AsNGYliB96gBIfd-jn1GvHtlVtrPvo
Message-ID: <CAO7dBbW9s6uu3gHHF5QR=_HdqN9shEfYBH6roR814ZEAw392Jw@mail.gmail.com>
Subject: Re: [PATCH] riscv: Fix a NULL pointer reference in machine_kexec_prepare
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-riscv@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Baoquan He <bhe@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <pjw@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: THXpOm8boBXS6ik7RBZoay9Ch9QnKy2Az4kPP2KhSqo_1782779059
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_172424_811535_A73E9E32 
X-CRM114-Status: GOOD (  10.47  )
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

SGkgTWFya3VzLAoKT24gVHVlLCBKdW4gMzAsIDIwMjYgYXQgMTowMOKAr0FNIE1hcmt1cyBFbGZy
aW5nIDxNYXJrdXMuRWxmcmluZ0B3ZWIuZGU+IHdyb3RlOgo+Cj4gPiBBIE5VTEwgcG9pbnRlciBy
ZWZlcmVuY2UgaXNzdWUgaXMgbm90aWNlZCBpbiByaXNjdidzIG1hY2hpbmVfa2V4ZWNfcHJlcGFy
ZSwKPiDigKYKPiAgICAgICAgICAgICAgICAgIGRlcmVmZXJlbmNlPwo+Cj4KPiDigKYKPiA+IEZp
eCB0aGlzIGJ5IHNpbXBseSBhZGRpbmcgYSBjaGVjayBiZWZvcmUgY29weS4KPgo+IEhvdyBkbyB5
b3UgdGhpbmsgYWJvdXQgdG8gYWRkIGFueSB0YWdzIChsaWtlIOKAnEZpeGVz4oCdIGFuZCDigJxD
Y+KAnSkgYWNjb3JkaW5nbHk/CgpSaWdodCwgdGhhbmtzIGZvciB0aGUgc3VnZ2VzdGlvbi4gSSB3
aWxsIGltcHJvdmUgdGhlIGNvbW1pdCBtZXNzYWdlCndvcmRpbmcgaW4gdjMuCgpUaGFua3MsClRh
byBMaXUKCj4KPiBTZWUgYWxzbzoKPiAqIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9s
aW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL0RvY3VtZW50YXRpb24vcHJv
Y2Vzcy9zdWJtaXR0aW5nLXBhdGNoZXMucnN0P2g9djcuMi1yYzEjbjE0NQo+ICogaHR0cHM6Ly9n
aXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0
L3RyZWUvRG9jdW1lbnRhdGlvbi9wcm9jZXNzL3N0YWJsZS1rZXJuZWwtcnVsZXMucnN0P2g9djcu
Mi1yYzEjbjM0Cj4KPgo+IFJlZ2FyZHMsCj4gTWFya3VzCj4KCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
