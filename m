Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93DF3CFC279
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Nov 2025 13:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=K1ZZghcIoanavmVJCxDjSaNxhXZSWJGQGOTZPrWLTD8=; b=fC65cDXkeBv2Nr
	3rZ8evQz5M6PrdHRx4QQNa2gauMvkpwDB+BEPHeg5NNnJcAvQGq6vTOSr0yn3/xxx/VY+txVsV1hw
	uJuPoTjvd6S4sR2gD/pmfQ6QQW1gLDWJ4yQtIAZCztQytgimtE6eiEPyyrZtY4+JHkw/V8E5ee9jb
	W75p9mHYPEucJk8zBrXtoz6eT2MgYTPjs5a21Iu+E/rmqhjkGVL7uzTDoOFLrTOUk9po46MS0lXnf
	GOGuDIXJYViSLOgw8KyvEF5ZHoct/ZftFOEP+m2OOhhi4K+Mq6j72k7WY2f2r9fg4daYBoyMebe7Q
	Nykl+6fmMNeiA8xdSY2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMRUv-00000008RxR-210r;
	Fri, 21 Nov 2025 13:48:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMRUu-00000008Rws-2NXj
	for linux-riscv@bombadil.infradead.org;
	Fri, 21 Nov 2025 13:48:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=rrY3SHusps5/5qA8/cncoJy7l+pDMbgMB9Ky427icWE=; b=dZSA0nOIh2g7GDjFhZR7cK5/vt
	LCa0Noko2ebsZW5TFhNCuqwNSNMIL3DIWoeYtzGKGG0HGhmtKbJySbw4Wrtzidn1ArGyivUVj+MbA
	DeDy86D1B/WJ66daFfsjbnSaLB2wpF5B9Q8I6gv12phDtQCy21TvfZjMOEIM8DiKX6b24c9nXtv+C
	2dWXJT0bHTohueJuRp8DKaLpIYVr/058MJHB49dkSrEhx1KUPXBmqqTjQmkKSuB373AIz9Kp6sLaE
	GEzSqoZltHXdXvvoDy4Z5U8qZZF8g0c7PE70SN7lWEmgN+mTiEn0TGz6RSvwj7eD0zecjeyDzUFDK
	7xu8GNLQ==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMQdF-0000000Gswr-1GMd
	for linux-riscv@lists.infradead.org;
	Fri, 21 Nov 2025 12:52:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763732888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rrY3SHusps5/5qA8/cncoJy7l+pDMbgMB9Ky427icWE=;
	b=NCTKB101dSK/SHXMG35tCAV/rRsj0wsHwcEVVAtY+6kvpMYAIN4fxMsSlm0IN1EOBJDOYs
	ZzXUR60ABTErGlTQfB0qGUxgY2ZtkgYLxMwKDDMnIKfMFd+poX9m5kp4GsCGLysjZtmR7X
	L5Eg8YL0j5xid/jJ3o0K3HnDewrEQrQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763732898;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rrY3SHusps5/5qA8/cncoJy7l+pDMbgMB9Ky427icWE=;
	b=IQ9XR47/utljkIg0SlIikMcxE+ghkNQoSLnK1FZpOBvYGT4THWZcSJ2zykO8SViYzcvTcE
	h6tY9np6YulU/k0mMUeV67PF3QnFGwycLeHWdnVW0sNcz6dDg/DE3HSYoabuRb4RyjpoN3
	Nrrb/udPOf6wuBGJebthxESr5wOeS1k=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-145-Z8yKFkbUNquK2Kw4Lhrrvg-1; Fri, 21 Nov 2025 08:48:06 -0500
X-MC-Unique: Z8yKFkbUNquK2Kw4Lhrrvg-1
X-Mimecast-MFC-AGG-ID: Z8yKFkbUNquK2Kw4Lhrrvg_1763732886
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-47777158a85so28408715e9.3
        for <linux-riscv@lists.infradead.org>; Fri, 21 Nov 2025 05:48:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763732886; x=1764337686;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rrY3SHusps5/5qA8/cncoJy7l+pDMbgMB9Ky427icWE=;
        b=mnR/neIf/V1f8pi6ZOGeWCNt1pUh9oUxrZhOSkh2mJSeQQZ8udrjwnrJ/07rmgxI8O
         dLfGW5LUU15K3C8w6Tjvwl02yOcw0//cuKjtByB78HbHWN1jvuA4IOy9/qREeA3U49pU
         z2ls+QH30RqFpSLY8eHIs5blGT6WFmwdSisg20axjtqUvR3BnyEKDSBC0O6KPankE6d3
         hJcRUea+o5wDE+ISl2ozZ0r4WVBkjRWW02fwsn6AXnEgfwjSt09qf6akanVqe3SXmxry
         hf8tmwJliiz+5r4r1SbI7wXaZwhUU620XdoPWRZRNlpjOhU7dViZl+OJnOqoxTcxQTpb
         Yaow==
X-Forwarded-Encrypted: i=1; AJvYcCU7lA9GyYpfO0YkfPhWWWH8Joq5F0OlJFfBb0f5RScpZybqdCsfi9Dqkb1mCIsbrI+QtioxgOwxGitQEw==@lists.infradead.org
X-Gm-Message-State: AOJu0YycvPD20YiTFTiX6jYyrpLeVjgpGgQUDa0nk3qAHcg7GRHBTeot
	GmaQ+yVSB87mkrWEgDdkXScJdP1CcOpb10WJINJhSsRg1N8H9JIZZInHrkPgbtSgdewa+QpyCoH
	NHPGI3qNmnMPi49CqgPDDBq96FUBhBWEHaj9lftZkASmSHXWC1BGLyjkEEJGtgC0bFyEckw==
X-Gm-Gg: ASbGncsufHLmbfDrX0XnxlAvtWm9HB/yzQDybt9AOhi/mRhG5eaNDcVOH21mh8gCfCh
	GYEySqyaeAbWp10u79zfbJyAq2IWUvqiMe6eXnvdfj0DaRlxblYw3tKhawg2NojkIeRQpBckxuo
	QwhIdwR1gJM20qEDI6v/6dvHfagugk44ZNXSfo1Yo0KqYq08y9/7cX2XKaRnxEN0lNjL+tBnOHv
	T1GEmlSDYjLGrw2sTS8smJkpqbmpSohDYBN/ZPkUJi9/00X9/LfP1bDk+DCU+lH1+f8WnVM88kF
	Wz+vagD2s0bipTlZEIjAp+dV7s1DqLrZoHxWDZ1QeAgn6zX8Oy5GOM5Yh/vTsYPV/x2uSExoaO8
	EyshGTEupWHTykwYG8vYgA564gt3yvdHVQHbTgCeZCEW/ZMFO+vmPVTIw9RU=
X-Received: by 2002:a05:600c:8b35:b0:475:d8b3:a9d5 with SMTP id 5b1f17b1804b1-477c10d6fdamr23385295e9.10.1763732885711;
        Fri, 21 Nov 2025 05:48:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHegkSSe+SGWHMtR6kA9u/Q4TOGuunCa4Ux8zesgUiVCtqnZZi1NI5I0T5vVAJrKK/r4LK5Pw==
X-Received: by 2002:a05:600c:8b35:b0:475:d8b3:a9d5 with SMTP id 5b1f17b1804b1-477c10d6fdamr23384955e9.10.1763732885315;
        Fri, 21 Nov 2025 05:48:05 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:1622:5a48:afdc:799f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f34ff3sm11713394f8f.16.2025.11.21.05.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 05:48:04 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Conor Dooley <conor@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Himanshu Chauhan <himanshu@thechauhan.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: refer to intended files in RISC-V SSE DRIVER
Date: Fri, 21 Nov 2025 14:47:55 +0100
Message-ID: <20251121134757.120782-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Wz_RYtddSokknaSZ3VsztT2dJ67Vy8g-TPsjfjt9s00_1763732886
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_125257_483513_C5AC7D20 
X-CRM114-Status: GOOD (  11.79  )
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

RnJvbTogTHVrYXMgQnVsd2FobiA8bHVrYXMuYnVsd2FobkByZWRoYXQuY29tPgoKQ29tbWl0IDVm
ZmU2MGQyNjEwNyAoImRyaXZlcnM6IGZpcm13YXJlOiBhZGQgcmlzY3YgU1NFIHN1cHBvcnQiKSBh
ZGRzIHRoZQpmaWxlcyByaXNjdl9zYmlfc3NlLltjaF0gYW5kIGludGVuZHMgdG8gcmVmZXIgdG8g
dGhlbSBpbiB0aGUgbmV3Ck1BSU5UQUlORVJTIHNlY3Rpb24gUklTQy1WIFNTRSBEUklWRVIuIFRo
aXMgc2VjdGlvbiBob3dldmVyIHJlZmVycyB0byB0aGUKbm9uLWV4aXN0aW5nIGZpbGVzIHJpc2N2
X3NzZS5bY2hdLgoKQWRqdXN0IHRoZSBmaWxlIGVudHJpZXMgdG8gdGhlIGludGVuZGVkIGZpbGUg
bmFtZXMuCgpTaWduZWQtb2ZmLWJ5OiBMdWthcyBCdWx3YWhuIDxsdWthcy5idWx3YWhuQHJlZGhh
dC5jb20+Ci0tLQogTUFJTlRBSU5FUlMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlO
VEFJTkVSUwppbmRleCBlMmVkOTgyN2JlM2YuLjRhMjlhZjNmOWQ3NCAxMDA2NDQKLS0tIGEvTUFJ
TlRBSU5FUlMKKysrIGIvTUFJTlRBSU5FUlMKQEAgLTIyNDgzLDggKzIyNDgzLDggQEAgTToJQ2zD
qW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgogUjoJSGltYW5zaHUgQ2hhdWhhbiA8
aGltYW5zaHVAdGhlY2hhdWhhbi5kZXY+CiBMOglsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCiBTOglNYWludGFpbmVkCi1GOglkcml2ZXJzL2Zpcm13YXJlL3Jpc2N2L3Jpc2N2X3NzZS5j
Ci1GOglpbmNsdWRlL2xpbnV4L3Jpc2N2X3NzZS5oCitGOglkcml2ZXJzL2Zpcm13YXJlL3Jpc2N2
L3Jpc2N2X3NiaV9zc2UuYworRjoJaW5jbHVkZS9saW51eC9yaXNjdl9zYmlfc3NlLmgKIAogUklT
Qy1WIFRFTlNUT1JSRU5UIFNvQyBTVVBQT1JUCiBNOglEcmV3IEZ1c3RpbmkgPGRmdXN0aW5pQG9z
cy50ZW5zdG9ycmVudC5jb20+Ci0tIAoyLjUxLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
