Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2DD5C25B76
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jun 2024 12:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8q2dwQhQvGPEEGeauM3EaS+hHl/2tsd12kLN0jqqCz0=; b=SjM98eAK2nS+8b
	wb9rBGkkeKRnMx7c0QQZ3NKQfCQKlcQXHtw6zgtoFz/R6W0WnIpa58UwsNXF5FXiWKr9MFkfvSUxp
	vzbINk03CNB8jmB7WvUN5om2UQKhvCwo6wZ2Nalnuo+KPJKrgk7N36qbRLiDsyhbx5vkupC+wxgb5
	6JlfyltXLpO0wME1V4KgAZ+hzDD2AFghF0PH01NAa1zpyWpF1jQKZpiu1dRjvXq9L89+O3LFk0qTS
	gVzx4P9h1fvZU2FY/A40YVutdB6wFBUFdzpvSZIiu134oMj/XaKxyisyZ5g/DgSYdT5FJuM9QwQ+d
	HHs7q4gUkSvHYn+z7S8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH0HL-00000008mXg-4B0l;
	Tue, 11 Jun 2024 12:07:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH0HD-00000008mTk-0AHu
	for linux-riscv@lists.infradead.org;
	Tue, 11 Jun 2024 12:07:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 742AE60E0B
	for <linux-riscv@lists.infradead.org>; Tue, 11 Jun 2024 12:06:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 384F1C4AF48
	for <linux-riscv@lists.infradead.org>; Tue, 11 Jun 2024 12:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718107608;
	bh=izbQACBXKg7/xAfr+T6NfWco5xbmu+bfnAsIHYpOdVw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DeJj4q5++zj+R3KhmhuzK4d1y38/q9RlXNvB80U8sWohX93yRvAYBbRWeNJI+hEkm
	 k+6zKhoYuXFyb07P2kL/gMmg/FK9/y7H81SPPXOQI54Ebtv+gaujOBYPQ2BRaVYtr9
	 4lnDhr8IOcynWAd4LHkUKBtKY+YHivapA0KcI4qKSTAzc4SDzmPp4RqbTJTVrp/i06
	 yeFezpNqoJVDv03VNIjOBZEqJZ7lwd6ZgUNgF0gsfzovWKsFQcHGsAyw1jhVsfafjZ
	 Lbe7woGXDn9ZOOtxQ1qkBeigUZLfV/hyl1O4hYcRLn41/8zOCV4apxu/JPqpRIYjBJ
	 hgZeTXX2xJnaA==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a6ef8e62935so116108166b.3
        for <linux-riscv@lists.infradead.org>; Tue, 11 Jun 2024 05:06:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXzgeGyZG9SJy7ihy9cLO/MKoX+p1PnnTGFduLcEJVGIWa/5aCi8l8JmyqoDiYFj89DfHOHqKKYXEjZ3jtvyhymahoUUQgAhqaoJKWPI/Kp
X-Gm-Message-State: AOJu0Yw5o/W3w+bKiX08swvooh2jdB4Mmj/prNluaqJHAmQHYVCY0REm
	OP/Z9bwzsp6jrw20tkIHj9PuJ7nbJ0c/pZvKiiKUT2s+64FrwNDC58kHKuTm/+sqmxG3Cv2B1zt
	5rkM+IZ4qVMvtVQmJ91VSv0wyEW4=
X-Google-Smtp-Source: AGHT+IFFPTTll7ACEEwwlIU5pUww8R0bMpeHE5EPA9sRicSO1H8r8Hj10JvtLT4RCL9oaDh0AQArdk5Tw1koxKQr8oM=
X-Received: by 2002:a17:906:b810:b0:a6f:1f66:8335 with SMTP id
 a640c23a62f3a-a6f1f66841fmr408155266b.4.1718107606517; Tue, 11 Jun 2024
 05:06:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240609-xtheadvector-v1-0-3fe591d7f109@rivosinc.com> <20240609-xtheadvector-v1-1-3fe591d7f109@rivosinc.com>
In-Reply-To: <20240609-xtheadvector-v1-1-3fe591d7f109@rivosinc.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 11 Jun 2024 20:06:34 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTVu4ZQt+gK7pVYEDVG23Sic=jswkVvX4To=VAD0TMzxw@mail.gmail.com>
Message-ID: <CAJF2gTTVu4ZQt+gK7pVYEDVG23Sic=jswkVvX4To=VAD0TMzxw@mail.gmail.com>
Subject: Re: [PATCH 01/13] dt-bindings: riscv: Add xtheadvector ISA extension description
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, Evan Green <evan@rivosinc.com>, 
	Andy Chiu <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_050659_980511_33CE7075 
X-CRM114-Status: GOOD (  15.42  )
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

T24gTW9uLCBKdW4gMTAsIDIwMjQgYXQgMTI6NDXigK9QTSBDaGFybGllIEplbmtpbnMgPGNoYXJs
aWVAcml2b3NpbmMuY29tPiB3cm90ZToKPgo+IFRoZSB4dGhlYWR2ZWN0b3IgSVNBIGV4dGVuc2lv
biBpcyBkZXNjcmliZWQgb24gdGhlIFQtSGVhZCBleHRlbnNpb24gc3BlYwo+IEdpdGh1YiBwYWdl
IFsxXSBhdCBjb21taXQgOTUzNThjYjJjY2E5Lgo+Cj4gTGluazogaHR0cHM6Ly9naXRodWIuY29t
L1QtaGVhZC1TZW1pL3RoZWFkLWV4dGVuc2lvbi1zcGVjL2Jsb2IvOTUzNThjYjJjY2E5NDg5MzYx
YzYxZDMzNWUwM2QzMTM0YjE0MTMzZi94dGhlYWR2ZWN0b3IuYWRvYyBbMV0KPgo+IFNpZ25lZC1v
ZmYtYnk6IENoYXJsaWUgSmVua2lucyA8Y2hhcmxpZUByaXZvc2luYy5jb20+Cj4gUmV2aWV3ZWQt
Ynk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4gLS0tCj4gIERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwgfCAx
MCArKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCj4KPiBkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lv
bnMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNp
b25zLnlhbWwKPiBpbmRleCA0NjhjNjQ2MjQ3YWEuLjk5ZDJhOWU4YzUyZCAxMDA2NDQKPiAtLS0g
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1s
Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lv
bnMueWFtbAo+IEBAIC00NzcsNiArNDc3LDEwIEBAIHByb3BlcnRpZXM6Cj4gICAgICAgICAgICAg
IGxhdGVuY3ksIGFzIHJhdGlmaWVkIGluIGNvbW1pdCA1NmVkNzk1ICgiVXBkYXRlCj4gICAgICAg
ICAgICAgIHJpc2N2LWNyeXB0by1zcGVjLXZlY3Rvci5hZG9jIikgb2YgcmlzY3YtY3J5cHRvLgo+
Cj4gKyAgICAgICAgIyB2ZW5kb3IgZXh0ZW5zaW9ucywgZWFjaCBleHRlbnNpb24gc29ydGVkIGFs
cGhhbnVtZXJpY2FsbHkgdW5kZXIgdGhlCj4gKyAgICAgICAgIyB2ZW5kb3IgdGhleSBiZWxvbmcg
dG8uIFZlbmRvcnMgYXJlIHNvcnRlZCBhbHBoYW51bWVyaWNhbGx5IGFzIHdlbGwuCj4gKwo+ICsg
ICAgICAgICMgQW5kZXMKPiAgICAgICAgICAtIGNvbnN0OiB4YW5kZXNwbXUKPiAgICAgICAgICAg
IGRlc2NyaXB0aW9uOgo+ICAgICAgICAgICAgICBUaGUgQW5kZXMgVGVjaG5vbG9neSBwZXJmb3Jt
YW5jZSBtb25pdG9yIGV4dGVuc2lvbiBmb3IgY291bnRlciBvdmVyZmxvdwo+IEBAIC00ODQsNSAr
NDg4LDExIEBAIHByb3BlcnRpZXM6Cj4gICAgICAgICAgICAgIFJlZ2lzdGVycyBpbiB0aGUgQVg0
NU1QIGRhdGFzaGVldC4KPiAgICAgICAgICAgICAgaHR0cHM6Ly93d3cuYW5kZXN0ZWNoLmNvbS93
cC1jb250ZW50L3VwbG9hZHMvQVg0NU1QLTFDLVJldi4tNS4wLjAtRGF0YXNoZWV0LnBkZgo+Cj4g
KyAgICAgICAgIyBULUhFQUQKPiArICAgICAgICAtIGNvbnN0OiB4dGhlYWR2ZWN0b3IKPiArICAg
ICAgICAgIGRlc2NyaXB0aW9uOgo+ICsgICAgICAgICAgICBUaGUgVC1IRUFEIHNwZWNpZmljIDAu
Ny4xIHZlY3RvciBpbXBsZW1lbnRhdGlvbiBhcyB3cml0dGVuIGluCj4gKyAgICAgICAgICAgIGh0
dHBzOi8vZ2l0aHViLmNvbS9ULWhlYWQtU2VtaS90aGVhZC1leHRlbnNpb24tc3BlYy9ibG9iLzk1
MzU4Y2IyY2NhOTQ4OTM2MWM2MWQzMzVlMDNkMzEzNGIxNDEzM2YveHRoZWFkdmVjdG9yLmFkb2Mu
ClVSTCBjaGFuZ2VkCmh0dHBzOi8vZ2l0aHViLmNvbS9YVUFOVElFLVJWL3RoZWFkLWV4dGVuc2lv
bi1zcGVjL2Jsb2IvOTUzNThjYjJjY2E5NDg5MzYxYzYxZDMzNWUwM2QzMTM0YjE0MTMzZi94dGhl
YWR2ZWN0b3IuYWRvYwoKT3RoZXJzLCBMR1RNLgoKPiArCj4gIGFkZGl0aW9uYWxQcm9wZXJ0aWVz
OiB0cnVlCj4gIC4uLgo+Cj4gLS0KPiAyLjQ0LjAKPgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBS
ZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
