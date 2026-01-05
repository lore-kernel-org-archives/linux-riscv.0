Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED442C79FA3
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jan 2026 16:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q2y/RDJTXhNNGzwuj+pDXLnaC6P5SRc6CCGFGsL/mKU=; b=TX8wboUaRtXiFE
	jZpSP1E3+68/sAAM6UxdxR+mlusOA8tFaiPDY1homdmd5AgL8XilIU+mbSuHpdbcQd4U89sefc2PX
	INmeTPwyjB7Zak//uw1l3XNmQatw+RQbWF+LS3I1xdehdrkyLHWifNyJzVzdhE5JGNBhAvSO8ZsKj
	zDMNVRld7g00aUifXEMOmWE3a+es9YE30YeNUYnnZ4XOQMrGYtr/5kciYaWrVsoYb4zuyCEkvTvsU
	E+GSNgwvbAMEqNihXyatZxwz7sktf0huNAM0XgsSAiy1Y6pjnok8wHApsY/d8RBfOhHtPSiy1gPqH
	JjCMYa2DH3hIqzOO4J1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcnKK-0000000BiuV-3NFr;
	Mon, 05 Jan 2026 16:21:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcnKD-0000000BitW-05p4
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jan 2026 16:21:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 502CE4096A
	for <linux-riscv@lists.infradead.org>; Mon,  5 Jan 2026 16:20:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32AE9C19424
	for <linux-riscv@lists.infradead.org>; Mon,  5 Jan 2026 16:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767630054;
	bh=NukNRG8cCLvj5Dx0ePjiHo3AWT0zmoJjI8U969/fmiI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SjyOu1jvthRV9iPD3okrpQgPnFncuaPsY1hr9SnI7Ch8xzMwhiy7mIEVFPJD2mrw2
	 uEtJLmwp2RjVVjGQ2xLywBbbYJEcPMn/6IxEgVJozoCgKMW1o8M7SqohH7I69Laz6x
	 EIJHsD1Z8u60ko9N95OJ1FX7eUJ3iTfG4HTUjIi2t0BhJgt/kGYuXS477RtkuzHPOX
	 IRpt5z+YnVeWjNkQ/taYoJk2Pu80ryyp1sgf33b68rMmTLzG+1mK0DXg6gr1SaDjsH
	 Qwaiz39WyH6ICAfK+NR1WFMpQ7kuxFOhaSWAE0hAYonS+3ahB59o1ttbbQZcZx0Pdw
	 MFJ58bG+f1XTA==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b83b72508f3so21974866b.2
        for <linux-riscv@lists.infradead.org>; Mon, 05 Jan 2026 08:20:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX+3yx5Co7S/UDqILE+nxDYnQUo68SHVAa1fGsaA7hXMPRVwo0B7dnkluzu4XahLxYtMRmhIfpLzuMdrA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7AtcEjvsGWZmnNyliavCy1siEggPJwB3sdlS3DF9BT56cX2Yi
	i9uG31R6ogqqsxosrxq/6dZ4wf6QCUqrpVA/YiWUMkAje07JwDMTjjAGUwekDXCx8ZU9ZSucFKU
	I3Uy/ycjneLNQy89Yk9BVj1WYLlK3sA==
X-Google-Smtp-Source: AGHT+IFDcsB9cGrXZS17et5spTanzSuiDv2eXGriYKQ2r+jnoBl/BbFbMkXpScUjSnJR1b4zlgjELg50ZXxfiQwZwR0=
X-Received: by 2002:a17:907:97cf:b0:b84:206f:c0e1 with SMTP id
 a640c23a62f3a-b8426a743d0mr38798366b.18.1767630052751; Mon, 05 Jan 2026
 08:20:52 -0800 (PST)
MIME-Version: 1.0
References: <20251224161205.1132149-1-zhengxingda@iscas.ac.cn>
 <20251224161205.1132149-3-zhengxingda@iscas.ac.cn> <20260105154656.GA2585570-robh@kernel.org>
 <a838dc0f8bd39c6d9da95f5fd137eba8c131c58a.camel@icenowy.me>
In-Reply-To: <a838dc0f8bd39c6d9da95f5fd137eba8c131c58a.camel@icenowy.me>
From: Rob Herring <robh@kernel.org>
Date: Mon, 5 Jan 2026 10:20:40 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKC6FaJZubvxQaX-uQBhWFNs2EHuTG8JK1FJaD1tPOaSw@mail.gmail.com>
X-Gm-Features: AQt7F2o9BFJZ8sc5_YNuKcdmxDzwwUg67C6I3vE6DTXNMYGUxygNfRHDV7MRa8k
Message-ID: <CAL_JsqKC6FaJZubvxQaX-uQBhWFNs2EHuTG8JK1FJaD1tPOaSw@mail.gmail.com>
Subject: Re: [PATCH v4 2/9] dt-bindings: display: add verisilicon,dc
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, Han Gao <rabenda.cn@gmail.com>, 
	Yao Zi <ziyao@disroot.org>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_082057_099395_E223E894 
X-CRM114-Status: GOOD (  35.58  )
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

T24gTW9uLCBKYW4gNSwgMjAyNiBhdCAxMDoxM+KAr0FNIEljZW5vd3kgWmhlbmcgPHV3dUBpY2Vu
b3d5Lm1lPiB3cm90ZToKPgo+IOWcqCAyMDI2LTAxLTA15pif5pyf5LiA55qEIDA5OjQ2IC0wNjAw
77yMUm9iIEhlcnJpbmflhpnpgZPvvJoKPiA+IE9uIFRodSwgRGVjIDI1LCAyMDI1IGF0IDEyOjEx
OjU4QU0gKzA4MDAsIEljZW5vd3kgWmhlbmcgd3JvdGU6Cj4gPiA+IEZyb206IEljZW5vd3kgWmhl
bmcgPHV3dUBpY2Vub3d5Lm1lPgo+ID4gPgo+ID4gPiBWZXJpc2lsaWNvbiBoYXMgYSBzZXJpZXMg
b2YgZGlzcGxheSBjb250cm9sbGVycyBwcmVmaXhlZCB3aXRoIERDCj4gPiA+IGFuZAo+ID4gPiB3
aXRoIHNlbGYtaWRlbnRpZmljYXRpb24gZmFjaWxpdHkgbGlrZSB0aGVpciBHQyBzZXJpZXMgR1BV
cy4KPiA+ID4KPiA+ID4gQWRkIGEgZGV2aWNlIHRyZWUgYmluZGluZyBmb3IgaXQuCj4gPiA+Cj4g
PiA+IERlcGVuZHMgb24gdGhlIHNwZWNpZmljIERDIG1vZGVsLCBpdCBjYW4gaGF2ZSBlaXRoZXIg
b25lIG9yIHR3bwo+ID4gPiBkaXNwbGF5Cj4gPiA+IG91dHB1dHMsIGFuZCBlYWNoIGRpc3BsYXkg
b3V0cHV0IGNvdWxkIGJlIHNldCB0byBEUEkgc2lnbmFsIG9yICJEUCIKPiA+ID4gc2lnbmFsICh3
aGljaCBzZWVtcyB0byBiZSBzb21lIHBsYWluIHBhcmFsbGVsIGJ1cyB0byBIRE1JCj4gPiA+IGNv
bnRyb2xsZXJzKS4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogSWNlbm93eSBaaGVuZyA8dXd1
QGljZW5vd3kubWU+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEljZW5vd3kgWmhlbmcgPHpoZW5neGlu
Z2RhQGlzY2FzLmFjLmNuPgo+ID4gPiAtLS0KPiA+ID4gQ2hhbmdlcyBpbiB2NDoKPiA+ID4gLSBB
ZGRlZCBhIGNvbW1lbnQgZm9yICJ2ZXJpc2lsaWNvbixkYyIgdGhhdCBzYXlzIHRoZSBJRC9yZXZp
c2lvbiBpcwo+ID4gPiAgIGRpc2NvdmVyYWJsZSB2aWEgcmVnaXN0ZXJzLgo+ID4gPiAtIFJlbW92
ZWQgY2xvY2sgbWluSXRlbXMgY29uc3RyYWludCB3L28gc3BlY2lmaWMgY29tcGF0aWJsZQo+ID4g
PiBzdHJpbmdzLgo+ID4gPgo+ID4gPiBDaGFuZ2VzIGluIHYzOgo+ID4gPiAtIEFkZGVkIFNvQy1z
cGVjaWZpYyBjb21wYXRpYmxlIHN0cmluZywgYW5kIGFybSB0aGUgYmluZGluZyB3aXRoCj4gPiA+
IGNsb2NrIC8KPiA+ID4gICBwb3J0IGNoZWNraW5nIGZvciB0aGUgc3BlY2lmaWMgU29DICh3aXRo
IGEgMi1vdXRwdXQgREMpLgo+ID4gPgo+ID4gPiBDaGFuZ2VzIGluIHYyOgo+ID4gPiAtIEZpeGVk
IG1pc3NwZWx0ICJ2ZXJzaWxpY29uIiBpbiB0aXRsZS4KPiA+ID4gLSBNb3ZlZCBtaW5JdGVtcyBp
biBjbG9jayBwcm9wZXJ0aWVzIHRvIGJlIGVhcmxpZXIgdGhhbiBpdGVtcy4KPiA+ID4gLSBSZS1h
bGlnbmVkIG11bHRpLWxpbmUgY2xvY2tzIGFuZCByZXNldHMgaW4gZXhhbXBsZS4KPiA+ID4KPiA+
ID4gIC4uLi9iaW5kaW5ncy9kaXNwbGF5L3ZlcmlzaWxpY29uLGRjLnlhbWwgICAgICB8IDE0NAo+
ID4gPiArKysrKysrKysrKysrKysrKysKPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxNDQgaW5zZXJ0
aW9ucygrKQo+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0Cj4gPiA+IERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3ZlcmlzaWxpY29uLGRjLnlhbWwKPiA+ID4KPiA+ID4g
ZGlmZiAtLWdpdAo+ID4gPiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L3ZlcmlzaWxpY29uLGRjLnlhbWwKPiA+ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZGlzcGxheS92ZXJpc2lsaWNvbixkYy55YW1sCj4gPiA+IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0Cj4gPiA+IGluZGV4IDAwMDAwMDAwMDAwMDAuLmZlNjRjYzE0NjY2OTAKPiA+ID4gLS0t
IC9kZXYvbnVsbAo+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS92ZXJpc2lsaWNvbixkYy55YW1sCj4gPiA+IEBAIC0wLDAgKzEsMTQ0IEBACj4gPiA+
ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMCBPUiBCU0QtMi1DbGF1c2UpCj4g
PiA+ICslWUFNTCAxLjIKPiA+ID4gKy0tLQo+ID4gPiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5v
cmcvc2NoZW1hcy9kaXNwbGF5L3ZlcmlzaWxpY29uLGRjLnlhbWwjCj4gPiA+ICskc2NoZW1hOiBo
dHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKPiA+ID4gKwo+ID4g
PiArdGl0bGU6IFZlcmlzaWxpY29uIERDLXNlcmllcyBkaXNwbGF5IGNvbnRyb2xsZXJzCj4gPiA+
ICsKPiA+ID4gK21haW50YWluZXJzOgo+ID4gPiArICAtIEljZW5vd3kgWmhlbmcgPHV3dUBpY2Vu
b3d5Lm1lPgo+ID4gPiArCj4gPiA+ICtwcm9wZXJ0aWVzOgo+ID4gPiArICAkbm9kZW5hbWU6Cj4g
PiA+ICsgICAgcGF0dGVybjogIl5kaXNwbGF5QFswLTlhLWZdKyQiCj4gPiA+ICsKPiA+ID4gKyAg
Y29tcGF0aWJsZToKPiA+ID4gKyAgICBpdGVtczoKPiA+ID4gKyAgICAgIC0gZW51bToKPiA+ID4g
KyAgICAgICAgICAtIHRoZWFkLHRoMTUyMC1kYzgyMDAKPiA+ID4gKyAgICAgIC0gY29uc3Q6IHZl
cmlzaWxpY29uLGRjICMgREMgSVBzIGhhdmUgZGlzY292ZXJhYmxlCj4gPiA+IElEL3JldmlzaW9u
IHJlZ2lzdGVycwo+ID4gPiArCj4gPiA+ICsgIHJlZzoKPiA+ID4gKyAgICBtYXhJdGVtczogMQo+
ID4gPiArCj4gPiA+ICsgIGludGVycnVwdHM6Cj4gPiA+ICsgICAgbWF4SXRlbXM6IDEKPiA+ID4g
Kwo+ID4gPiArICBjbG9ja3M6Cj4gPiA+ICsgICAgaXRlbXM6Cj4gPiA+ICsgICAgICAtIGRlc2Ny
aXB0aW9uOiBEQyBDb3JlIGNsb2NrCj4gPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBETUEgQVhJ
IGJ1cyBjbG9jawo+ID4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogQ29uZmlndXJhdGlvbiBBSEIg
YnVzIGNsb2NrCj4gPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBQaXhlbCBjbG9jayBvZiBvdXRw
dXQgMAo+ID4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogUGl4ZWwgY2xvY2sgb2Ygb3V0cHV0IDEK
PiA+ID4gKwo+ID4gPiArICBjbG9jay1uYW1lczoKPiA+ID4gKyAgICBpdGVtczoKPiA+ID4gKyAg
ICAgIC0gY29uc3Q6IGNvcmUKPiA+ID4gKyAgICAgIC0gY29uc3Q6IGF4aQo+ID4gPiArICAgICAg
LSBjb25zdDogYWhiCj4gPiA+ICsgICAgICAtIGNvbnN0OiBwaXgwCj4gPiA+ICsgICAgICAtIGNv
bnN0OiBwaXgxCj4gPiA+ICsKPiA+ID4gKyAgcmVzZXRzOgo+ID4gPiArICAgIGl0ZW1zOgo+ID4g
PiArICAgICAgLSBkZXNjcmlwdGlvbjogREMgQ29yZSByZXNldAo+ID4gPiArICAgICAgLSBkZXNj
cmlwdGlvbjogRE1BIEFYSSBidXMgcmVzZXQKPiA+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IENv
bmZpZ3VyYXRpb24gQUhCIGJ1cyByZXNldAo+ID4gPiArCj4gPiA+ICsgIHJlc2V0LW5hbWVzOgo+
ID4gPiArICAgIGl0ZW1zOgo+ID4gPiArICAgICAgLSBjb25zdDogY29yZQo+ID4gPiArICAgICAg
LSBjb25zdDogYXhpCj4gPiA+ICsgICAgICAtIGNvbnN0OiBhaGIKPiA+ID4gKwo+ID4gPiArICBw
b3J0czoKPiA+ID4gKyAgICAkcmVmOiAvc2NoZW1hcy9ncmFwaC55YW1sIy9wcm9wZXJ0aWVzL3Bv
cnRzCj4gPiA+ICsKPiA+ID4gKyAgICBwcm9wZXJ0aWVzOgo+ID4gPiArICAgICAgcG9ydEAwOgo+
ID4gPiArICAgICAgICAkcmVmOiAvc2NoZW1hcy9ncmFwaC55YW1sIy9wcm9wZXJ0aWVzL3BvcnQK
PiA+ID4gKyAgICAgICAgZGVzY3JpcHRpb246IFRoZSBmaXJzdCBvdXRwdXQgY2hhbm5lbCAsIGVu
ZHBvaW50IDAgc2hvdWxkCj4gPiA+IGJlCj4gPgo+ID4gTm8gc3BhY2UgYmVmb3JlIGNvbW1hLiBP
ciBwZXJoYXBzIHNob3VsZCBiZSBhIHBlcmlvZCBpbnN0ZWFkLgo+Cj4gV2VsbCBJIGRvbid0IGtu
b3cgd2h5IEkgaW5zZXJ0ZWQgc3VjaCBhIHNwYWNlLCB3aWxsIHJlbW92ZSBpdC4KPgo+ID4KPiA+
Cj4gPiA+ICsgICAgICAgICAgdXNlZCBmb3IgRFBJIGZvcm1hdCBvdXRwdXQgYW5kIGVuZHBvaW50
IDEgc2hvdWxkIGJlIHVzZWQKPiA+ID4gKyAgICAgICAgICBmb3IgRFAgZm9ybWF0IG91dHB1dC4K
PiA+ID4gKwo+ID4gPiArICAgICAgcG9ydEAxOgo+ID4gPiArICAgICAgICAkcmVmOiAvc2NoZW1h
cy9ncmFwaC55YW1sIy9wcm9wZXJ0aWVzL3BvcnQKPiA+ID4gKyAgICAgICAgZGVzY3JpcHRpb246
IFRoZSBzZWNvbmQgb3V0cHV0IGNoYW5uZWwgaWYgdGhlIERDIHZhcmlhbnQKPiA+ID4gKyAgICAg
ICAgICBzdXBwb3J0cy4gRm9sbG93IHRoZSBzYW1lIGVuZHBvaW50IGFkZHJlc3NpbmcgcnVsZSB3
aXRoCj4gPiA+ICsgICAgICAgICAgdGhlIGZpcnN0IHBvcnQuCj4gPiA+ICsKPiA+ID4gKyAgICBy
ZXF1aXJlZDoKPiA+ID4gKyAgICAgIC0gcG9ydEAwCj4gPiA+ICsKPiA+ID4gK3JlcXVpcmVkOgo+
ID4gPiArICAtIGNvbXBhdGlibGUKPiA+ID4gKyAgLSByZWcKPiA+ID4gKyAgLSBpbnRlcnJ1cHRz
Cj4gPiA+ICsgIC0gY2xvY2tzCj4gPiA+ICsgIC0gY2xvY2stbmFtZXMKPiA+ID4gKyAgLSBwb3J0
cwo+ID4gPiArCj4gPiA+ICthbGxPZjoKPiA+ID4gKyAgLSBpZjoKPiA+ID4gKyAgICAgIHByb3Bl
cnRpZXM6Cj4gPiA+ICsgICAgICAgIGNvbXBhdGlibGU6Cj4gPiA+ICsgICAgICAgICAgY29udGFp
bnM6Cj4gPiA+ICsgICAgICAgICAgICBjb25zdDogdGhlYWQsdGgxNTIwLWRjODIwMAo+ID4gPiAr
ICAgIHRoZW46Cj4gPiA+ICsgICAgICBwcm9wZXJ0aWVzOgo+ID4gPiArICAgICAgICBjbG9ja3M6
Cj4gPiA+ICsgICAgICAgICAgbWluSXRlbXM6IDUKPiA+Cj4gPiBUaGF0J3MgYWxyZWFkeSBpbXBs
aWNpdGx5IHRoZSBtaW4uIFBlcmhhcHMgeW91IHdhbnRlZCAnbWluSXRlbXM6IDQnCj4gPiBvbgo+
ID4gdGhlIGNsb2NrcyBhbmQgY2xvY2stbmFtZXMgZGVmaW5pdGlvbnMgZm9yIHZlcnNpb25zIHdp
dGggb25seSAxCj4gPiBvdXRwdXQ/Cj4KPiBQcmV2aW91c2x5IEkgc3BlY2lmaWVkIG1pbkl0ZW1z
OiA0IGluIHRoZSBnZW5lcmFsIHBhcnQsIGhvd2V2ZXIgdGhpcwo+IGRvZXMgbm90IHBsYXkgd2Vs
bCB3aGVuIHNvbWUgb2YgY29yZS9heGkvYWhiIGNsb2NrcyBhcmUgbm90IHByZXNlbnQuCgpJIGRv
bid0IHVuZGVyc3RhbmQuIFRoYXQgd291bGQgb25seSBtYWtlIHBpeDEgb3B0aW9uYWwuIFRoZXJl
IG9mCmNvdXJzZSBpcyBubyB3YXkgd2UgY2FuIGNoZWNrIHRoYXQgJ2Nsb2NrcycgZW50cmllcyBh
cmUgcG9pbnRpbmcgdG8KdGhlIGNvcnJlY3QgY2xvY2tzLgoKPiA+ID4gKyAgICAgICAgcG9ydHM6
Cj4gPiA+ICsgICAgICAgICAgcmVxdWlyZWQ6Cj4gPiA+ICsgICAgICAgICAgICAtIHBvcnRAMAo+
ID4gPiArICAgICAgICAgICAgLSBwb3J0QDEKPiA+Cj4gPiBJdCBpcyB2YWxpZCB0byBvbWl0IHRo
ZXNlIGlmIHRoZSBvdXRwdXQgaXMgcHJlc2VudCwgYnV0IHVudXNlZC4KPgo+IFdlbGwgdGhpcyBz
b3VuZHMgcmVhc29uYWJsZSwgYWx0aG91Z2ggbXkgZHJpdmVyIGRvZXMgbm90IHBsYXkgd2VsbCBp
Zgo+IG9ubHkgYSBwb3J0QDEgaXMgZGVmaW5lZCB3L28gcG9ydEAwIC4KClNvdW5kcyBsaWtlIHlv
dXIgZHJpdmVyIHNob3VsZCBiZSBmaXhlZC4KCj4gQ29uc2lkZXJpbmcgdGhlIHByZXZpb3VzIHR3
byBzbmlwcGV0cywgc2hvdWxkIEkganVzdCByZW1vdmUgdGhpcyBpZgo+IHBhcnQ/CgpJIHdvdWxk
LCB5ZXMuCgpSb2IKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
