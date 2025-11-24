Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8668ECFA466
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Nov 2025 15:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q62YZ+xOeFb3jSIMPG+rpsWumeLh0rHrGWhsp46ydH8=; b=w8c3SdBL1FlM+8
	5hqljh9oPYhco14UI8vFb9A5STboGbzBcYyUqx28ZUWBNOrafcrAREfnj+QY46ZrSwyDtfcoOaR/P
	KgB/5gCe+Jn6pvmwlOVkgfQ/csDdj9T8d7SiHUDgl7uMFHRARK1k4oHwmOfws5tCpUxPlDWb9qX1k
	vzTTnrRORnMPz0bMcMWoLqXp4KlfX8HkrI+Jr+Gy/Izkwo0owLRNyMTsSf9mk7LySHDY76k3MHgyp
	HU95Jz+NxValNFjEwrucChNr6uGeAXl7dTJmtGL0bHCb6GE3xQYLYAksP4wimoByfxvi+6VD/IwF+
	CD18cDyKo9hc1dT01Cxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNYPn-0000000BulO-3EqE;
	Mon, 24 Nov 2025 15:23:43 +0000
Received: from sender3-op-o12.zoho.com ([136.143.184.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNYPl-0000000BukP-0qKC
	for linux-riscv@lists.infradead.org;
	Mon, 24 Nov 2025 15:23:42 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1763997792; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iNB7BxoqiLAq10HGNy7UNMt+FVvadPlofhvAdncbXm5RVwtSJIsWMy8F/UjgIlRwJ0NVzhVKP93MBcbF5Xjr2AcHs8LmY6hy31oRC39SSk0XK5qqsgTVXB3/8tHFDYT/G3ek0UB7xYV3vpwdZZ1viTrChvOYhEq45Vd/7TRWnx0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1763997792; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Ed8aM3uE6K2wq2P/cGnFcTZ4sC7TrbmDm4/XKpy1kbU=; 
	b=OyBKSWBa8ciG2bXtDOnJjGzxu+Kn6PqYA3WGzZ6DcxQup0fDF5H5wSFwJa4hXt/mE3KABehj/C7y/rpB834sHe6X9uxsayqI++QRJp5elRS2DkVl5ISehdY68H+hp+RwYEt6FmoZF6pRzPHUVAyl6XzOPafsdmfqgklVBqZLM9g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763997792;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=Ed8aM3uE6K2wq2P/cGnFcTZ4sC7TrbmDm4/XKpy1kbU=;
	b=PRcWDjSR64CsYv0s1t2Wf6bNKMc9RQlLGOlTNXqNQW3b3RquFKp8Zh1Viq5LgJy+
	VaW7DZS4Fg9s11NZpuDBlokGYhxfu83Sm/Ou0EfsVGcAMSCY1ny1tzNpkN2W3rd5ERN
	KSZjDxVCgqkla6JEweKfsIYaAdeRyyE99adaW0G4iKBm4hUG/oHMcUvXZQ7UC3XuChw
	bD9sCVSzqS34PWNJwdU0l6BMEIjfWq81v6zdby+4OqpxdyQqUCp1/3hCcp6S63OTDIS
	io87bLHe+n9+9KarbPqDkPURtsrJRFVS0ULz/DgOCrHDvog9DaV/CeiryDlKc5SQmmG
	wlS0DwPlHQ==
Received: by mx.zohomail.com with SMTPS id 1763997790359486.0877922892978;
	Mon, 24 Nov 2025 07:23:10 -0800 (PST)
Message-ID: <24a3104c9879519c70554510766aba98afd663e7.camel@icenowy.me>
Subject: Re: [PATCH v3 0/9] Verisilicon DC8200 driver (and adaption to
 TH1520)
From: Icenowy Zheng <uwu@icenowy.me>
To: Krzysztof Kozlowski <krzk@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Drew
 Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei
 <wefu@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner
 <heiko@sntech.de>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>,  Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Michal
 Wilczynski <m.wilczynski@samsung.com>
Cc: Han Gao <rabenda.cn@gmail.com>, Yao Zi <ziyao@disroot.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Date: Mon, 24 Nov 2025 23:23:01 +0800
In-Reply-To: <374aa38b-c16f-46da-985e-266fdfb4c717@kernel.org>
References: <20251124105226.2860845-1-uwu@icenowy.me>
	 <374aa38b-c16f-46da-985e-266fdfb4c717@kernel.org>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_072341_324471_F902153A 
X-CRM114-Status: GOOD (  12.03  )
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

5ZyoIDIwMjUtMTEtMjTmmJ/mnJ/kuIDnmoQgMTE6NTcgKzAxMDDvvIxLcnp5c3p0b2YgS296bG93
c2tp5YaZ6YGT77yaCj4gT24gMjQvMTEvMjAyNSAxMTo1MiwgSWNlbm93eSBaaGVuZyB3cm90ZToK
PiA+IFRoaXMgcGF0Y2hzZXQgdHJpZXMgdG8gYWRkIGEgZHJpdmVyIGZvciBWZXJpc2lsaWNvbiBE
QzgyMDAgZHJpdmVyLAo+ID4gYW5kCj4gPiBkZW1vbnN0cmF0ZXMgdGhlIGRyaXZlciBvbiBULUhl
YWQgVEgxNTIwIHdpdGggaXRzIEhETUkgb3V0cHV0Lgo+ID4gCj4gPiBUaGlzIGRpc3BsYXkgY29u
dHJvbGxlciBJUCBpcyB1c2VkIG9uIFN0YXJGaXZlIEpINzExMCB0b28sIGJ1dCBhcwo+ID4gdGhl
Cj4gPiBIRE1JIGNvbnRyb2xsZXIgdXNlZCB0aGVyZSBpc24ndCBhcyBjb21tb24gYXMgdGhlIERl
c2lnbldhcmUgb25lLCBJCj4gPiBjaG9vc2UgdG8gdXNlIFRIMTUyMCBpbiB0aGlzIHBhdGNoc2V0
Lgo+IAo+IAo+IFRoYXQncyBhIHYzLCBzbyBwbGVhc2Uga2luZGx5IGFsd2F5cyB3cml0ZSBjaGFu
Z2Vsb2cuCgpXZWxsIEkgbGlzdCBjaGFuZ2VzIGluIGFsbCBpbmRpdmlkdWFsIGNvbW1pdHMuCgpT
aG91bGQgSSBtZXJnZSB0aGVtIHRvIHRoZSBjb3ZlciBsZXR0ZXIgdGhlIG5leHQgdGltZT8KCj4g
Cj4gQmVzdCByZWdhcmRzLAo+IEtyenlzenRvZgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
