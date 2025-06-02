Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D29C5AD49
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Jun 2025 14:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TqiirVu44a5GX94XddfFv4wqOCLkqSKykynzT8bBaXY=; b=WrklEGTIp83bXk
	m/oT27qCIVwNHxLFxlUd/Z0jNR7z8AVC6KoIUohajCO2mwHuw00XM7YD9vf31lf+fwQiQXylwq3j+
	curIXW+aPjBfjrpR4Xo7869fOZMb3B89nlSHxskl5xA57lulaRUUZkPcsDYQylFtjFfmeyWLazCeR
	PNKrmygEfHnUqEuMyt3MX+OtgAmAF7RNczndhn5MbtcwTT11O9HodWx+VUiWPs/ZjjFy3W5RiJFp6
	FF/6C25XWqyTddq/xMtNLGniEdyGfdBFxj1U6/zHmX0gCPJhZKPQM2clpyujMfpunNbb3B1At1WoJ
	pTZ09hKT9dHRP0PXgVNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM6Td-00000007fWT-0MLA;
	Mon, 02 Jun 2025 14:49:25 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM6R1-00000007fAn-0mVm
	for linux-riscv@lists.infradead.org;
	Mon, 02 Jun 2025 14:46:44 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-551fe46934eso5176409e87.1
        for <linux-riscv@lists.infradead.org>; Mon, 02 Jun 2025 07:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1748875601; x=1749480401; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KKpz5+EW5yvhjp8ha7JB1AbvVpuNxn56ERF8Ng3mq4o=;
        b=TQwDlW2pswwVXNHMCHNEOfeje0nxRF7kwEoitXj1PAsJBfnf2ol0bjsF/ZCWO7ninw
         BXnuuRDHCpJdcVgp6o94GAL0f/vuQCxAlPPSj93EhvK1n66I1eeL30sslT0TnFagjEJi
         PA79p48VKl+oWRbfb9AYj8qFNhjRV/UX6j2ZJBC8LPCbdpzrPwyaAuI1AJSqjBvHUfZT
         A3h7RTXyYanCqtTLTtXu/wdXK1usCUgRlH4takwJ4s6xpkeNynf8VdR1fQEbFu34jQq1
         4iSLGjhx6yuLFXyM1v8yvXB/9ERXIPfxAQ3Kd3NVzXzcv9YF9jszbZ6YUk6rmUxU/HW8
         6RoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748875601; x=1749480401;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KKpz5+EW5yvhjp8ha7JB1AbvVpuNxn56ERF8Ng3mq4o=;
        b=Z4u442aWL9ZlsNo3vHzvxUCquGtiTecpQaOe9CdJ9SHPB28YOuy/dpJ8gDNkDMB2XP
         fUc/VXSqxF2jweRLgoG/xZTThNsLElUbU79vOYPuE4Qf9dcsNBe1TL+PHAN0JbEt4qWh
         RzkjvMcQIGOP/R3DoNYEMcPKbyYuOb4ZpjXdlI64bza3H+r01qRg7I9zFamrQdn90Tim
         EO6ruGgTlWHgAGxuE8lWTQSUG/hnabUbkLKTDT/dFPvSVuqcjUfcdDzL+ap3KmMVWKfN
         nJh18Ur7fMHRAJvbTRRIX9iOqfnGLJNXpE7a+FmNAmefkyYO2mzJsdKwcBTYWVxiIa/R
         Cuyw==
X-Forwarded-Encrypted: i=1; AJvYcCW/VlfYLd5LwzveUiiTU/IDIbYnR2vk+ng7H3zIHTAd+84LC2c1OtVjXxF3ueUUBiLhp2WQoVGxLXzrmQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0CyXvhRuaq7x8NGMtqv6YecXaVANU/54DTJFFxR5RArFGMAFE
	DJ7rUbJtfzptd3xJeJbWvqIbpqS0UFF1ASjJXShy9LVzVvDjCx5XYrgxX4WyOxERkd/CjXphlAL
	RNw49Yc5wNh7+vWRFYhIO3sXZUPJ6XniDFntFSSUeGw==
X-Gm-Gg: ASbGncvsJAx0Ag0jpn5/viwrWplN/Cboufb2Z/mwVKhbPMsfMlIMYjm4lLqhebDzZPU
	YfAwUihMGc2jzeZ79k1kq1ZKT+jC7Ljchuaa3IFakP6AFFJ6PPfP0dISLWg+HHWA4FCkruX6KUt
	Kxu5k3aS37e4XBpiVoaGmyk64SdQ2tKvCPARcxTGtSJpDCrHksWP7nvx1PbCWIYQDFbKjobJKxG
	HY=
X-Google-Smtp-Source: AGHT+IGw32F/MdMOccKhZO4XhdGXd2zDj9BI3w6oPi/36aYPhkJHPAtjAIeBiB8am3xWo3XPqYfLxYrbf7Mw3kihmy8=
X-Received: by 2002:a05:6512:118d:b0:553:2bdf:8b87 with SMTP id
 2adb3069b0e04-55335b117ebmr4997380e87.10.1748875600944; Mon, 02 Jun 2025
 07:46:40 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250529222403eucas1p1923fe09240be34e3bbadf16822574d75@eucas1p1.samsung.com>
 <20250530-apr_14_for_sending-v3-0-83d5744d997c@samsung.com> <20250530-apr_14_for_sending-v3-1-83d5744d997c@samsung.com>
In-Reply-To: <20250530-apr_14_for_sending-v3-1-83d5744d997c@samsung.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 2 Jun 2025 16:46:29 +0200
X-Gm-Features: AX0GCFvisvrL36l-aUNnU_LsfSK7tpw2-raHvXmZ5rzs225tzGALdRdBL2pjUL8
Message-ID: <CAMRc=Me9cWfe2mL=Q6JQbAFjpd55MOBZuAWC793Us0criiQr4Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: power: Add T-HEAD TH1520 GPU power sequencer
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
X-CRM114-CacheID: sfid-20250602_074643_307730_6B6344FB 
X-CRM114-Status: GOOD (  18.87  )
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

T24gRnJpLCBNYXkgMzAsIDIwMjUgYXQgMTI6MjTigK9BTSBNaWNoYWwgV2lsY3p5bnNraQo8bS53
aWxjenluc2tpQHNhbXN1bmcuY29tPiB3cm90ZToKPgo+IEludHJvZHVjZSBkZXZpY2UgdHJlZSBi
aW5kaW5ncyBmb3IgYSBuZXcgcG93ZXIgc2VxdWVuY2VyIHByb3ZpZGVyCj4gZGVkaWNhdGVkIHRv
IHRoZSBULUhFQUQgVEgxNTIwIFNvQydzIEdQVS4KPgo+IFRoZSB0aGVhZCx0aDE1MjAtZ3B1LXB3
cnNlcSBjb21wYXRpYmxlIGRlc2lnbmF0ZXMgYSBub2RlIHRoYXQgd2lsbAo+IG1hbmFnZSB0aGUg
Y29tcGxleCBwb3dlci11cCBhbmQgcG93ZXItZG93biBzZXF1ZW5jZSBmb3IgdGhlIEdQVS4gVGhp
cwo+IHNlcXVlbmNlciByZXF1aXJlcyBhIGhhbmRsZSB0byB0aGUgR1BVJ3MgY2xvY2sgZ2VuZXJh
dG9yIHJlc2V0IGxpbmUKPiAoZ3B1LWNsa2dlbiksIHdoaWNoIGlzIHNwZWNpZmllZCBpbiBpdHMg
ZGV2aWNlIHRyZWUgbm9kZS4KPgo+IFRoaXMgYmluZGluZyB3aWxsIGJlIHVzZWQgYnkgYSBuZXcg
cHdyc2VxIGRyaXZlciB0byBhYnN0cmFjdCB0aGUKPiBTb0Mgc3BlY2lmaWMgcG93ZXIgbWFuYWdl
bWVudCBkZXRhaWxzIGZyb20gdGhlIGdlbmVyaWMgR1BVIGRyaXZlci4KPgo+IFNpZ25lZC1vZmYt
Ynk6IE1pY2hhbCBXaWxjenluc2tpIDxtLndpbGN6eW5za2lAc2Ftc3VuZy5jb20+Cj4gLS0tCj4g
IC4uLi9iaW5kaW5ncy9wb3dlci90aGVhZCx0aDE1MjAtcHdyc2VxLnlhbWwgICAgICAgIHwgNDIg
KysrKysrKysrKysrKysrKysrKysrKwo+ICBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8ICAxICsKPiAgMiBmaWxlcyBjaGFuZ2VkLCA0MyBpbnNlcnRp
b25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3Bvd2VyL3RoZWFkLHRoMTUyMC1wd3JzZXEueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9wb3dlci90aGVhZCx0aDE1MjAtcHdyc2VxLnlhbWwKPiBuZXcgZmlsZSBtb2Rl
IDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAu
LjRjMzAyYWJmYjc2ZmI5ZTI0Mzk0NmY0ZWVmYTMzM2M2YjAyZTU5ZDMKPiAtLS0gL2Rldi9udWxs
Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Bvd2VyL3RoZWFkLHRo
MTUyMC1wd3JzZXEueWFtbAo+IEBAIC0wLDAgKzEsNDIgQEAKPiArIyBTUERYLUxpY2Vuc2UtSWRl
bnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpCj4gKyVZQU1MIDEuMgo+ICst
LS0KPiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9wb3dlci90aGVhZCx0aDE1
MjAtcHdyc2VxLnlhbWwjCj4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNj
aGVtYXMvY29yZS55YW1sIwo+ICsKPiArdGl0bGU6IFQtSEVBRCBUSDE1MjAgR1BVIFBvd2VyIFNl
cXVlbmNlcgo+ICsKPiArbWFpbnRhaW5lcnM6Cj4gKyAgLSBNaWNoYWwgV2lsY3p5bnNraSA8bS53
aWxjenluc2tpQHNhbXN1bmcuY29tPgo+ICsKPiArZGVzY3JpcHRpb246IHwKPiArICBUaGlzIGJp
bmRpbmcgZGVzY3JpYmVzIHRoZSBwb3dlciBzZXF1ZW5jZXIgZm9yIHRoZSBULUhFQUQgVEgxNTIw
IEdQVS4KPiArICBUaGlzIHNlcXVlbmNlciBoYW5kbGVzIHRoZSBzcGVjaWZpYyBwb3dlci11cCBh
bmQgcG93ZXItZG93biBzZXF1ZW5jZXMKPiArICByZXF1aXJlZCBieSB0aGUgR1BVLCBpbmNsdWRp
bmcgbWFuYWdpbmcgY2xvY2tzIGFuZCByZXNldHMgZnJvbSBib3RoIHRoZQo+ICsgIHNlcXVlbmNl
ciBhbmQgdGhlIEdQVSBkZXZpY2UgaXRzZWxmLgo+ICsKPiArcHJvcGVydGllczoKPiArICBjb21w
YXRpYmxlOgo+ICsgICAgY29uc3Q6IHRoZWFkLHRoMTUyMC1ncHUtcHdyc2VxCj4gKwoKQmVmb3Jl
IEkgcmV2aWV3IHRoZSByZXN0OiBpcyB0aGlzIGFjdHVhbGx5IGEgcGh5c2ljYWwgZGV2aWNlIHRo
YXQKdGFrZXMgY2FyZSBvZiB0aGUgcG93ZXIgc2VxdWVuY2luZz8gU29tZSBraW5kIG9mIGEgcG93
ZXIgbWFuYWdlbWVudAp1bml0IGZvciB0aGUgR1BVPyBJZiBzbywgSSBiZXQgaXQncyBub3QgY2Fs
bGVkICJwb3dlciBzZXF1ZW5jZXIiIHNvCmxldCdzIHVzZSBpdHMgYWN0dWFsIG5hbWUgYXMgcGVy
IHRoZSBkYXRhc2hlZXQ/CgpCYXJ0CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
