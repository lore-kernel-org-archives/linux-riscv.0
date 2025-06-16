Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D446C71136
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Jun 2025 10:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=arpnmNCwza1LXMH7RVNZMjDIZmbtSEVRf5i0LBtkLxA=; b=o4XQcnFeP9zt1S
	DAq1pyA+cNEb8oEv+MhS8iR6x6STndOnL8UK9rgpBmWh3zDXp9qPRewoTaw4RfXXou6URQAbqYNNl
	zkBFnUYz3vK6uvIagyIX3smg+WHEULnEmxU3r25Ym43yERKX9Qp6d2JM1ua4TbGjJw62wswBpRYMK
	Gtjgvj/+jcqPf++OJHeJRQanO7Kh4DMwwyeWtk5dYT1qHj+OFQvmHvK9VyTK/J3iSxYM/zmzgsXai
	6MUW4A4p3a/LeUVygokpotWR4kiYlFCk8TJByJFoVIh1KQxM0ZZgAoU6FNsFZkgUK7l65rpg8rK/F
	rprszwQCvvKv4rQSe/nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR6zq-000000043e4-3f9n;
	Mon, 16 Jun 2025 10:23:22 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR6Kv-00000003wUQ-1qDr
	for linux-riscv@lists.infradead.org;
	Mon, 16 Jun 2025 09:41:06 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-54e7967cf67so4341166e87.0
        for <linux-riscv@lists.infradead.org>; Mon, 16 Jun 2025 02:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750066864; x=1750671664; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZadNMdHIaOPYoMnd8DCHGg9pjL54W3auftd8ZPyuMno=;
        b=rEDz48Jz1ul2q4r76ZEWbfJqmlPPoMwK71rLXwapGhT7P6uPSeTP7O3cUPN0eKcNnc
         jrqrMF9S+hw24qgc4xtfQt1ADJW8noyZA+oCCse9wszHORbRkyyQGG2d+uwnT0i28F4t
         LR1jTvySlrwgc04oLZ8arm5gu/HGHxrhemQt+GcxiMvkRwQ8+s0xjjUCQxJ5GptIek5B
         OdFgmZxFWJ9mAwZ2bOEC0YvDsoq0NcAR5YYp3YNZTkJ71SCpF8rI4LHkXjb9Pf1y38HS
         5FLNG3WCz9AUALTOJJNMcb38jqb4g1E2SyX5jxbm1CQG+9xH3PqJ2Emx2YlgEv3xNywW
         e0HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750066864; x=1750671664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZadNMdHIaOPYoMnd8DCHGg9pjL54W3auftd8ZPyuMno=;
        b=iFHSYyywtPpTHP6+bdvVnWajlkAA0u44x6XPO8pFKp5Qkl69A3Ud2jyyyB+hX3O4W7
         Gz0oHkKuRD0qmO/tcSzSYuX9p2zgxRgJLKM8B2sljqiv4ifuhT4PBtzZnekGeQLj89Q1
         xTV+nY0tXzqtaFvs/uDXtMQRTaA3x2OSY91kXyP+kHL6RImalnNHeb4D4NvCDNAcqqfz
         XhnmwJChWUpFRDaWHHC40FkJfJ5ojQ7SZVi2e4ORUACs0JArTpR8m96BpBlfruv+Ts9q
         kqfw1I4tMo6aGVNrZN5J5rZsvSdDcpMAK4+TW+jMiaH1uIV2ULnLciygIQdeqnm5xccp
         KDRQ==
X-Forwarded-Encrypted: i=1; AJvYcCW18lciXLkGnJJlcQNWyrlO5V2NBpfbZpJeuMnOJvlDY4qbHYxk/ji5IyhimmYkyLMR9k8UqiClOFIgWQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwqGolSl6UB8X1xJUjW/MG+oaVV4esGIvjnQCidbyISX0K5KVaR
	KRLE8Y4NO+Vt9NrSVm8sgrFuqhwmeT1QSAR8hktEw1H4HjMNwLO5PWyTq/IVLLvdAwTSBD8OLS2
	A0Nv2yEKf7imIA3k76CBGhriwNPl8y4R4kV7T7qXLbw==
X-Gm-Gg: ASbGncs5zAjRKS1SeW3th64qvoDEe4ZSnJRhiJeDoI3kzjQYb6GLQZ938hkxWR17h53
	2vVe6ooh7oMZrlGY78ELo2W0/Y67HH7XdK5WySclpJG5WWhbHRLsOvNE22h19PSmk3d/f3KtR1x
	N/2QSMbocAGQCrcElZUuWf1fvaqbl0eEKkPwV5RM/MFbaqeD8XRj0OrwkoDh4HE8RW8KrP4Dxku
	Mk=
X-Google-Smtp-Source: AGHT+IGQWWfUkusHDrOLuRcyzoECeHHGTF7H0pzgq8rg6Tj7LyO4hdSVch5xZMTnr/dQPwUpgGJMqB60ks8Us882nLo=
X-Received: by 2002:a05:6512:12d1:b0:553:663d:7354 with SMTP id
 2adb3069b0e04-553b6f31175mr1628391e87.48.1750066863507; Mon, 16 Jun 2025
 02:41:03 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250614180911eucas1p16c9fb4a8160253c253f623bec2529f70@eucas1p1.samsung.com>
 <20250614-apr_14_for_sending-v4-0-8e3945c819cd@samsung.com> <20250614-apr_14_for_sending-v4-4-8e3945c819cd@samsung.com>
In-Reply-To: <20250614-apr_14_for_sending-v4-4-8e3945c819cd@samsung.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 16 Jun 2025 11:40:50 +0200
X-Gm-Features: AX0GCFt1wszk0eSWs2NPgAoE3A4kwN-NyBJ_b5il4mUmGBJkPe4uMiqiWgyvPn0
Message-ID: <CAMRc=MfdBd6HBwM4F1TcjDvwbOJ03kxgRk4hJQ8HFK7Wz2XBAg@mail.gmail.com>
Subject: Re: [PATCH v4 4/8] drm/imagination: Use pwrseq for TH1520 GPU power management
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns <frank.binns@imgtec.com>, 
	Matt Coster <matt.coster@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_024105_478234_8C96F033 
X-CRM114-Status: GOOD (  22.12  )
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

T24gU2F0LCBKdW4gMTQsIDIwMjUgYXQgODowOeKAr1BNIE1pY2hhbCBXaWxjenluc2tpCjxtLndp
bGN6eW5za2lAc2Ftc3VuZy5jb20+IHdyb3RlOgo+Cj4gVXBkYXRlIHRoZSBJbWFnaW5hdGlvbiBQ
VlIgRFJNIGRyaXZlciB0byBsZXZlcmFnZSB0aGUgcHdyc2VxIGZyYW1ld29yawo+IGZvciBtYW5h
Z2luZyB0aGUgcG93ZXIgc2VxdWVuY2Ugb2YgdGhlIEdQVSBvbiB0aGUgVC1IRUFEIFRIMTUyMCBT
b0MuCj4KPiBUbyBjbGVhbmx5IGhhbmRsZSB0aGUgVEgxNTIwJ3Mgc3BlY2lmaWMgcG93ZXIgcmVx
dWlyZW1lbnRzIGluIHRoZQo+IGdlbmVyaWMgZHJpdmVyLCB0aGlzIHBhdGNoIGltcGxlbWVudHMg
dGhlICJkcml2ZXIgbWF0Y2ggZGF0YSIgcGF0dGVybi4gQQo+IGhhc19wd3JzZXEgZmxhZyBpbiBh
IG5ldyBwdnJfc29jX2RhdGEgc3RydWN0IGlzIG5vdyBhc3NvY2lhdGVkIHdpdGgKPiB0aGVhZCx0
aDE1MjAtZ3B1IGNvbXBhdGlibGUgc3RyaW5nIGluIHRoZSBvZl9kZXZpY2VfaWQgdGFibGUuCj4K
PiBBdCBwcm9iZSB0aW1lLCB0aGUgZHJpdmVyIGNoZWNrcyB0aGlzIGZsYWcuIElmIHRydWUsIGl0
IGNhbGxzCj4gZGV2bV9wd3JzZXFfZ2V0KCJncHUtcG93ZXIiKSwgcmVxdWlyaW5nIGEgdmFsaWQg
c2VxdWVuY2VyIGFuZCBkZWZlcnJpbmcKPiBwcm9iZSBvbiBmYWlsdXJlLiBJbiB0aGlzIG1vZGUs
IGFsbCBwb3dlciBhbmQgcmVzZXQgY29udHJvbCBpcyBkZWxlZ2F0ZWQKPiB0byB0aGUgcHdyc2Vx
IHByb3ZpZGVyLiBJZiB0aGUgZmxhZyBpcyBmYWxzZSwgdGhlIGRyaXZlciBza2lwcyB0aGlzCj4g
bG9naWMgYW5kIGZhbGxzIGJhY2sgdG8gaXRzIHN0YW5kYXJkIG1hbnVhbCBwb3dlciBtYW5hZ2Vt
ZW50LiBDbG9jawo+IGhhbmRsZXMgYXJlIHN0aWxsIGFjcXVpcmVkIGRpcmVjdGx5IGJ5IHRoaXMg
ZHJpdmVyIGluIGJvdGggY2FzZXMgZm9yCj4gb3RoZXIgcHVycG9zZXMgbGlrZSBkZXZmcmVxLgo+
Cj4gVGhlIHJ1bnRpbWUgUE0gY2FsbGJhY2tzLCBwdnJfcG93ZXJfZGV2aWNlX3Jlc3VtZSgpIGFu
ZAo+IHB2cl9wb3dlcl9kZXZpY2Vfc3VzcGVuZCgpLCBhcmUgbW9kaWZpZWQgdG8gY2FsbCBwd3Jz
ZXFfcG93ZXJfb24oKSBhbmQKPiBwd3JzZXFfcG93ZXJfb2ZmKCkgcmVzcGVjdGl2ZWx5IHdoZW4g
dGhlIHNlcXVlbmNlciBpcyBwcmVzZW50LiAgQSBoZWxwZXIKPiBmdW5jdGlvbiwgcHZyX3Bvd2Vy
X29mZl9zZXF1ZW5jZV9tYW51YWwoKSwgaXMgaW50cm9kdWNlZCB0byBlbmNhcHN1bGF0ZQo+IHRo
ZSBtYW51YWwgcG93ZXItZG93biBsb2dpYy4KPgo+IFJldmlld2VkLWJ5OiBVbGYgSGFuc3NvbiA8
dWxmLmhhbnNzb25AbGluYXJvLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWwgV2lsY3p5bnNr
aSA8bS53aWxjenluc2tpQHNhbXN1bmcuY29tPgo+IC0tLQoKW3NuaXBdCgo+Cj4gK3N0YXRpYyBp
bnQgcHZyX3Bvd2VyX29mZl9zZXF1ZW5jZV9tYW51YWwoc3RydWN0IHB2cl9kZXZpY2UgKnB2cl9k
ZXYpCj4gK3sKPiArICAgICAgIGludCBlcnI7Cj4gKwo+ICsgICAgICAgZXJyID0gcmVzZXRfY29u
dHJvbF9hc3NlcnQocHZyX2Rldi0+cmVzZXQpOwo+ICsKPiArICAgICAgIGNsa19kaXNhYmxlX3Vu
cHJlcGFyZShwdnJfZGV2LT5tZW1fY2xrKTsKPiArICAgICAgIGNsa19kaXNhYmxlX3VucHJlcGFy
ZShwdnJfZGV2LT5zeXNfY2xrKTsKPiArICAgICAgIGNsa19kaXNhYmxlX3VucHJlcGFyZShwdnJf
ZGV2LT5jb3JlX2Nsayk7Cj4gKwo+ICsgICAgICAgcmV0dXJuIGVycjsKPiArfQo+ICsKPiAgaW50
Cj4gIHB2cl9wb3dlcl9kZXZpY2Vfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gIHsKPiBA
QCAtMjUyLDExICsyNjYsMTAgQEAgcHZyX3Bvd2VyX2RldmljZV9zdXNwZW5kKHN0cnVjdCBkZXZp
Y2UgKmRldikKPiAgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIGVycl9kcm1fZGV2X2V4aXQ7
Cj4gICAgICAgICB9Cj4KPiAtICAgICAgIGNsa19kaXNhYmxlX3VucHJlcGFyZShwdnJfZGV2LT5t
ZW1fY2xrKTsKPiAtICAgICAgIGNsa19kaXNhYmxlX3VucHJlcGFyZShwdnJfZGV2LT5zeXNfY2xr
KTsKPiAtICAgICAgIGNsa19kaXNhYmxlX3VucHJlcGFyZShwdnJfZGV2LT5jb3JlX2Nsayk7Cj4g
LQo+IC0gICAgICAgZXJyID0gcmVzZXRfY29udHJvbF9hc3NlcnQocHZyX2Rldi0+cmVzZXQpOwo+
ICsgICAgICAgaWYgKHB2cl9kZXYtPnB3cnNlcSkKPiArICAgICAgICAgICAgICAgZXJyID0gcHdy
c2VxX3Bvd2VyX29mZihwdnJfZGV2LT5wd3JzZXEpOwo+ICsgICAgICAgZWxzZQo+ICsgICAgICAg
ICAgICAgICBlcnIgPSBwdnJfcG93ZXJfb2ZmX3NlcXVlbmNlX21hbnVhbChwdnJfZGV2KTsKPgo+
ICBlcnJfZHJtX2Rldl9leGl0Ogo+ICAgICAgICAgZHJtX2Rldl9leGl0KGlkeCk7Cj4gQEAgLTI3
Niw0NCArMjg5LDU1IEBAIHB2cl9wb3dlcl9kZXZpY2VfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRl
dikKPiAgICAgICAgIGlmICghZHJtX2Rldl9lbnRlcihkcm1fZGV2LCAmaWR4KSkKPiAgICAgICAg
ICAgICAgICAgcmV0dXJuIC1FSU87Cj4KPiAtICAgICAgIGVyciA9IGNsa19wcmVwYXJlX2VuYWJs
ZShwdnJfZGV2LT5jb3JlX2Nsayk7Cj4gLSAgICAgICBpZiAoZXJyKQo+IC0gICAgICAgICAgICAg
ICBnb3RvIGVycl9kcm1fZGV2X2V4aXQ7Cj4gKyAgICAgICBpZiAocHZyX2Rldi0+cHdyc2VxKSB7
Cj4gKyAgICAgICAgICAgICAgIGVyciA9IHB3cnNlcV9wb3dlcl9vbihwdnJfZGV2LT5wd3JzZXEp
Owo+ICsgICAgICAgICAgICAgICBpZiAoZXJyKQo+ICsgICAgICAgICAgICAgICAgICAgICAgIGdv
dG8gZXJyX2RybV9kZXZfZXhpdDsKPiArICAgICAgIH0gZWxzZSB7Cj4gKyAgICAgICAgICAgICAg
IGVyciA9IGNsa19wcmVwYXJlX2VuYWJsZShwdnJfZGV2LT5jb3JlX2Nsayk7Cj4gKyAgICAgICAg
ICAgICAgIGlmIChlcnIpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgZ290byBlcnJfZHJtX2Rl
dl9leGl0Owo+Cj4gLSAgICAgICBlcnIgPSBjbGtfcHJlcGFyZV9lbmFibGUocHZyX2Rldi0+c3lz
X2Nsayk7Cj4gLSAgICAgICBpZiAoZXJyKQo+IC0gICAgICAgICAgICAgICBnb3RvIGVycl9jb3Jl
X2Nsa19kaXNhYmxlOwo+ICsgICAgICAgICAgICAgICBlcnIgPSBjbGtfcHJlcGFyZV9lbmFibGUo
cHZyX2Rldi0+c3lzX2Nsayk7Cj4gKyAgICAgICAgICAgICAgIGlmIChlcnIpCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgZ290byBlcnJfY29yZV9jbGtfZGlzYWJsZTsKPgo+IC0gICAgICAgZXJy
ID0gY2xrX3ByZXBhcmVfZW5hYmxlKHB2cl9kZXYtPm1lbV9jbGspOwo+IC0gICAgICAgaWYgKGVy
cikKPiAtICAgICAgICAgICAgICAgZ290byBlcnJfc3lzX2Nsa19kaXNhYmxlOwo+ICsgICAgICAg
ICAgICAgICBlcnIgPSBjbGtfcHJlcGFyZV9lbmFibGUocHZyX2Rldi0+bWVtX2Nsayk7Cj4gKyAg
ICAgICAgICAgICAgIGlmIChlcnIpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgZ290byBlcnJf
c3lzX2Nsa19kaXNhYmxlOwo+CgpJbiBvcmRlciB0byBkZWNyZWFzZSB0aGUgbnVtYmVyIG9mIGlm
LWVsc2VzLCB3b3VsZCBpdCBtYWtlIHNlbnNlIHRvCnB1dCB0aGUgIm1hbnVhbCIgYW5kICJwd3Jz
ZXEiIG9wZXJhdGlvbnMgaW50byB0aGVpciBvd24gc2VwYXJhdGUKZnVuY3Rpb25zIGFuZCB0aGVu
IHN0b3JlIGFkZHJlc3NlcyBvZiB0aGVzZSBmdW5jdGlvbnMgaW4gdGhlIGRldmljZQptYXRjaCBk
YXRhIHN0cnVjdCBhcyBmdW5jdGlvbiBwb2ludGVycyAoaW5zdGVhZCBvZiB0aGUgaGFzX3B3cnNl
cQpmbGFnKT8gVGhpcyB3YXkgd2UnZCBqdXN0IGNhbGwgdGhlbSBkaXJlY3RseS4KCkJhcnQKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
