Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B5FC02192
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 06:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yifUXcP2X8XE4Dfu2keyzs/wVyDX02nPDc7GP3b4cZc=; b=bCjLTsikCKwveb
	OFOWa3If/O2aU2fbjda22+qWoEo8rV9DcfcdkzGp5u2100LrgfBKlT4vTiUNO6TDDfIdF+1Ltzbg9
	K7/ZksGEa4PtTezrz311AR2PYd9tbTztjjMYgFi7GvBtWAF5ekms1anr9u/bplAxW0bU2Kj3d0HIH
	jIuKTRM35a1zLipmPsbYmGTHBLb1V1T+XdXpHak2gpDZTboyEfkJdk69dgb2EhwPYDZXvvyaHbNnu
	Kr61Z9yQtKN5jaBKJrO1yffvTVu6QikMHYI2PMbFQlvFchydsPxa8n6cfcX1MHwS00Y5cvs8N2W2q
	ANGuTVSTCeFONZyjvJ6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfZNq-00000002Sua-3n33;
	Wed, 05 Feb 2025 06:59:38 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfZNo-00000002Sta-2mDb
	for linux-riscv@lists.infradead.org;
	Wed, 05 Feb 2025 06:59:37 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-724a5d04befso291095a34.1
        for <linux-riscv@lists.infradead.org>; Tue, 04 Feb 2025 22:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738738775; x=1739343575; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=UUFk6TgopSWQITCEbcE120wI7n+sBN7sqpPKgJ7PFf0=;
        b=HdvuLAzC3PTxXTMMADpxL4ByaKl6MJDZ2DD7wM9UrTMTbOI6Fb9yqK4LVkziPH5IIA
         C7fQXZp9W0nUPyblYM5pQ+UzXG3JZiuxPYXGf2S4nbQdLHUctoC3Ii84GfxW5WN8hUw6
         mgkuDTh8cPHZHR6Ia2pKF6IwIIC1kzpi00VTeOc3gVNqGwuHF43feTGsal8rbtCmn2DZ
         VWZSepvSVwGibXDn/JTFU9tAK00dA2h6cGQYn8GgSdTIC70mjdgAbVzwHVTNKkYUJfx2
         TNfN6JhnRpdBMKLBeVdSi5UXx7bnu/KFDQnJjCGqTlI5XJ885EN5Th69Au8e4hjbRtbO
         QYmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738738775; x=1739343575;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UUFk6TgopSWQITCEbcE120wI7n+sBN7sqpPKgJ7PFf0=;
        b=NrU8VDrW6Gt07bhh9k2rTW3xCny7qju0lkjsGZS0zVDmcoputn9Bfy0WGxZIuL1W44
         LJNw/9DVa9qEdypUTQUNEpvWiFCt088vsYhRmC3u0HQrxVtbxbgwmMorkd1L3TopXGi3
         vUcQloDNuf0BMjJA46THjVt4KZ+KNRrEkJ+6Lr3R5ndyLlXKYVUEgvfrYGo7VPK04wQV
         zebpdsdRV6keQKgGVN40sPtB6WJAgmrHKVbw6cuHvf2g0Bm6w+lyDesVYts8eKXWfqry
         XUJnDvSC7mZ1+JNRHWr+p92B6vp+G+mdr4ApnWRgWJYGUGZlwk3//ote6GnJ37mo/at5
         g5sQ==
X-Forwarded-Encrypted: i=1; AJvYcCUj+0tWyvgyGKUb03xu7PubH97Ii7UY9J+/cdXco9eDMSnit3DV46kuPYM2DfrT3R/enAGuHQpklGGJEg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxNZDwbsITEAcliZJMewQVPV4aEbunR7+n0ou9gLoZVVVVchJaD
	kKv8nTSwqK3plGa9FvSZ3QivtRkAZUu+ug0b6imXlTHi8GtsTcA0
X-Gm-Gg: ASbGncuKSjhaxatKq/6K9E3C2WllYpAZZ0+QURcAD73l+hhIuLTifM9SIuc+bVjbl+l
	Mix5L3uJ46E6WUQs9GhZN9PJwoXuFS4j80o6723Quq3aTm06rXvdwXNHio5ahHkSLOm2vP2OSDg
	M7IV08E40pKvGsFynnl6cDBqA/HwThZlQ8EslF/m9FFIJb5JOIU/48p/BHV/TM1SUe3ryc0QAgI
	BMIGglmTrdCQ/SaCF7C/YRx4zuDS8j7XJZeO/AU1FgxgBsTV6NTj71e17qP+kj2Au1D8i+Yv3jW
	C4IKv+9YecASlp/2UsdNOv7v6g==
X-Google-Smtp-Source: AGHT+IFG1SDTKozMPahzThei5PB6whL1v2BM+EVscsLeVPRgrXAkEdyUvEUjkRuufTiB8wtsfVoRXA==
X-Received: by 2002:a05:6830:3204:b0:71d:efeb:7c78 with SMTP id 46e09a7af769-726976bd30cmr3273225a34.14.1738738774982;
        Tue, 04 Feb 2025 22:59:34 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-726617cba50sm3804291a34.16.2025.02.04.22.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 22:59:33 -0800 (PST)
From: Chen Wang <unicornxw@gmail.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	unicorn_wang@outlook.com,
	inochiama@outlook.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com,
	haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com,
	chunzhi.lin@sophgo.com
Subject: [PATCH v7 0/3] pwm: Add pwm driver for Sophgo SG2042
Date: Wed,  5 Feb 2025 14:59:16 +0800
Message-Id: <cover.1738737617.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_225936_716425_D5BF0766 
X-CRM114-Status: GOOD (  13.01  )
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

RnJvbTogQ2hlbiBXYW5nIDx1bmljb3JuX3dhbmdAb3V0bG9vay5jb20+CgpBZGQgZHJpdmVyIGZv
ciBwd20gY29udHJvbGxlciBvZiBTb3BoZ28gU0cyMDQyIFNvQy4KClRoYW5rcywKQ2hlbgoKLS0t
CgpDaGFuZ2VzIGluIHY3OgogIFRoZSBwYXRjaCBzZXJpZXMgaXMgYmFzZWQgb24gdjYuMTQtcmMx
LgoKICBGaXhlZCBmb2xsb3dpbmcgaXNzdWVzIGFzIHBlciBjb21tZW50cyBmcm9tIFV3ZSBLbGVp
bmUtS8O2bmlnLCB0aGFua3MuCgogIC0gZHQtYmluZGluZ3M6IGNoYW5nZSB2YWx1ZSBvZiAiI3B3
bS1jZWxscyIgZnJvbSAyIHRvIDMuCiAgLSBkcml2ZXI6IHJlbmFtZSB2YXJpYWJsZXMgcGVyaW9k
L2hscGVyaW9kIHRvIHBlcmlvZF90aWNrcy9obHBlcmlvZF90aWNrcyBhbmQKICAgIGltcHJvdmUg
Y29kaW5nIG9mIGFwcGx5KCkvZ2V0X3N0YXRlKCk7IHVzZQogICAgZGV2bV9yZXNldF9jb250cm9s
X2dldF9vcHRpb25hbF9zaGFyZWRfZGVhc3NlcnRlZCgpIGluc3RlYWQgb2YKICAgIGRldm1fcmVz
ZXRfY29udHJvbF9nZXRfb3B0aW9uYWxfc2hhcmVkKCkgYW5kIHJlc2V0X2NvbnRyb2xfZGVhc3Nl
cnQoKTsKICAgIGFkZCBtb3JlIGNvbW1lbnRzIGFuZCBvdGhlciBtaXNjZWxsYW5lb3VzIGNvZGUg
aW1wcm92ZW1lbnRzLgoKQ2hhbmdlcyBpbiB2NjoKICBOb3RoaW5nIG1ham9yIGNoYW5nZXMganVz
dCByZWJhc2VkIG9udG8gdjYuMTMtcmMxIGFuZCByZXRlc3RlZC4gWW91IGNhbgogIHNpbXBseSBy
ZXZpZXcgb3IgdGVzdCB0aGUgcGF0Y2hlcyBhdCB0aGUgbGluayBbNl0uCgpDaGFuZ2VzIGluIHY1
OgogIFRoZSBwYXRjaCBzZXJpZXMgaXMgYmFzZWQgb24gdjYuMTItcmMxLiBZb3UgY2FuIHNpbXBs
eSByZXZpZXcgb3IgdGVzdAogIHRoZSBwYXRjaGVzIGF0IHRoZSBsaW5rIFs1XS4KCiAgVXBkYXRl
ZCBkcml2ZXIgdG8gYWRkIHJlc2V0cyBwcm9wZXJ0eSBmb3IgcHdtIGNvbnRyb2xsZXIgbm9kZSBh
cyBwZXIKICBzdWdnZXN0aW9uIGZyb20gSW5vY2hpLgoKQ2hhbmdlcyBpbiB2NDoKICBUaGUgcGF0
Y2ggc2VyaWVzIGlzIGJhc2VkIG9uIHY2LjEyLXJjMS4gWW91IGNhbiBzaW1wbHkgcmV2aWV3IG9y
IHRlc3QKICB0aGUgcGF0Y2hlcyBhdCB0aGUgbGluayBbNF0uCgogIFVwZGF0ZWQgZHJpdmVyIHRv
IHNldCBwcm9wZXJ0eSBhdG9taWMgb2YgcHdtX2NoaXAgdG8gdHJ1ZSBhcyBwZXIgc3VnZ2VzdGlv
bgogIGZyb20gU2Vhbi4KCkNoYW5nZXMgaW4gdjM6CiAgVGhlIHBhdGNoIHNlcmllcyBpcyBjYXRj
aGVkIHVwIHdpdGggdjYuMTItcmMxLiBZb3UgY2FuIHNpbXBseSByZXZpZXcgb3IgdGVzdAogIHRo
ZSBwYXRjaGVzIGF0IHRoZSBsaW5rIFszXS4KCiAgQWRkIHBhdGNoICMzIGZvciBkdHMgcGFydCBj
aGFuZ2UuCgpDaGFuZ2VzIGluIHYyOgogIFRoZSBwYXRjaCBzZXJpZXMgaXMgYmFzZWQgb24gdjYu
MTEtcmM2LiBZb3UgY2FuIHNpbXBseSByZXZpZXcgb3IgdGVzdCB0aGUKICBwYXRjaGVzIGF0IHRo
ZSBsaW5rIFsyXS4KCiAgRml4ZWQgZm9sbG93aW5nIGlzc3VlcyBhcyBwZXIgY29tbWVudHMgZnJv
bSBZaXh1biBMYW4sIEtyenlzenRvZiBLb3psb3dza2kKICBhbmQgVXdlIEtsZWluZS1Lw7ZuaWcs
IHRoYW5rcy4KCiAgLSBTb21lIG1pbm9yIGlzc3VlcyBpbiBkdC1iaW5kaW5ncy4KICAtIGRyaXZl
ciBpc3N1ZXMsIHVzZSBtYWNyb3Mgd2l0aCBuYW1lIHByZWZpeCBmb3IgcmVnaXN0ZXJzIGFjY2Vz
czsgYWRkCiAgICBsaW1pdGF0aW9ucyBjb21tZW50czsgZml4ZWQgcG90ZW50aWFsIGNhbGN1bGF0
aW9uIG92ZXJmbG93IHByb2JsZW07CiAgICBhZGQgLmdldF9zdGF0ZSgpIGNhbGxiYWNrIGFuZCBv
dGhlciBtaXNjZWxsYW5lb3VzIGNvZGUgaW1wcm92ZW1lbnRzLgoKQ2hhbmdlcyBpbiB2MToKICBU
aGUgcGF0Y2ggc2VyaWVzIGlzIGJhc2VkIG9uIHY2LjExLXJjNi4gWW91IGNhbiBzaW1wbHkgcmV2
aWV3IG9yIHRlc3QgdGhlCiAgcGF0Y2hlcyBhdCB0aGUgbGluayBbMV0uCgpMaW5rOiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi9jb3Zlci4xNzI1NTM2ODcwLmdpdC51bmljb3Ju
X3dhbmdAb3V0bG9vay5jb20vIFsxXQpMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51
eC1yaXNjdi9jb3Zlci4xNzI1OTMxNzk2LmdpdC51bmljb3JuX3dhbmdAb3V0bG9vay5jb20vIFsy
XQpMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi9jb3Zlci4xNzI4MzU1
OTc0LmdpdC51bmljb3JuX3dhbmdAb3V0bG9vay5jb20vIFszXQpMaW5rOiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9saW51eC1yaXNjdi9jb3Zlci4xNzI5MDM3MzAyLmdpdC51bmljb3JuX3dhbmdA
b3V0bG9vay5jb20vIFs0XQpMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNj
di9jb3Zlci4xNzI5ODQzMDg3LmdpdC51bmljb3JuX3dhbmdAb3V0bG9vay5jb20vIFs1XQpMaW5r
OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi9jb3Zlci4xNzMzMjgxNjU3Lmdp
dC51bmljb3JuX3dhbmdAb3V0bG9vay5jb20vIFs2XQotLS0KCkNoZW4gV2FuZyAoMyk6CiAgZHQt
YmluZGluZ3M6IHB3bTogc29waGdvOiBhZGQgUFdNIGNvbnRyb2xsZXIgZm9yIFNHMjA0MgogIHB3
bTogc29waGdvOiBhZGQgZHJpdmVyIGZvciBTb3BoZ28gU0cyMDQyIFBXTQogIHJpc2N2OiBzb3Bo
Z286IGR0czogYWRkIHB3bSBjb250cm9sbGVyIGZvciBTRzIwNDIgU29DCgogLi4uL2JpbmRpbmdz
L3B3bS9zb3BoZ28sc2cyMDQyLXB3bS55YW1sICAgICAgIHwgIDU4ICsrKysrKwogYXJjaC9yaXNj
di9ib290L2R0cy9zb3BoZ28vc2cyMDQyLmR0c2kgICAgICAgIHwgICA5ICsKIGRyaXZlcnMvcHdt
L0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxMCArCiBkcml2ZXJzL3B3bS9N
YWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwogZHJpdmVycy9wd20vcHdt
LXNvcGhnby1zZzIwNDIuYyAgICAgICAgICAgICAgIHwgMTk2ICsrKysrKysrKysrKysrKysrKwog
NSBmaWxlcyBjaGFuZ2VkLCAyNzQgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wd20vc29waGdvLHNnMjA0Mi1wd20ueWFt
bAogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvcHdtL3B3bS1zb3BoZ28tc2cyMDQyLmMKCgpi
YXNlLWNvbW1pdDogMjAxNGM5NWFmZWNlZTNlNzZjYTRhNTY5NTZhOTM2ZTIzMjgzZjA1YgotLSAK
Mi4zNC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
