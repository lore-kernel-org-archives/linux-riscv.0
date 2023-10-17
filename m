Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E578CDB474
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Oct 2023 08:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xtlPbBLkJabO5nD3ARyzzdrICJveBauntxSRGxptvs4=; b=jRpWixlNakJhz4
	KBQQArqw4bY1rxr8jxIloYFKHElR5oTNSfyLW6ybKfrfAi9iuuzeEjpCZ34bU/asaSKjzcgy3ti4d
	Jkyr39EZfsmx9U6ME3usBa0IHP/7/vy+RfBFnbiNshFlZ3bOCNWWGXqwQDwe2cpeUA6ANHIlbmbR0
	vhmrMy1MPR+dsriJEQ+OakcnkddKZT0hjVk1uE9s+0eDDjuWqVa6h0WPBCDJXb0oOTiQQx3PwD3dt
	7lvscqPT09dM/xUVPcsgQDB/KHn6HusBZkYEN8AwRkSy0CJ6DKBD+S6J5OypswLDUnjGyIKkiUd93
	4eEk8GQc+xdUw4sX0jmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsfdD-00BiMq-1O;
	Tue, 17 Oct 2023 08:40:51 +0000
Received: from mail-yb1-f179.google.com ([209.85.219.179])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsfdA-00BiM5-1J
	for linux-riscv@lists.infradead.org;
	Tue, 17 Oct 2023 08:40:49 +0000
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-d9c1989509bso1108412276.1
        for <linux-riscv@lists.infradead.org>; Tue, 17 Oct 2023 01:40:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697532046; x=1698136846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KZlS/7U1efr6AK8aT2dfiOZNDdagRiOd/6FdP6Lb3EM=;
        b=VkV+29v063BSjAGwjafcHC1Qt+3KXwTQrssQTRtiq4H/dVlJ8m3w21LorImrfg3e/U
         y3Saj/jmnR0bJE2qMk9LHI4j6sTEHZSFzPmKZWFyDX5DWdtJQ3MOmdILxVFi4HAXLQYH
         CPyAoSEm72qtxEONmMulyVNoM6umfqIjUCotQVNksA05J/OBzhRdDPMwgPDP2M5cgj+m
         QWefMW6JWOX/ydDnK9FnFaK0iv1/ieeSNVlw/8cdxKtp+56AciDqcn3Gv0b8c2qzqy92
         Zh9wTkVOkOiFNOcuZXRBLgPRjNixzSBuulRiTCEJYFHKNWd80D5V2q4WnEOzAW5Ni5hG
         ecJw==
X-Gm-Message-State: AOJu0YxRTp98LerK0+Yb/Iu30sUkSLLqu//i2AawDzRD4T8jApu0+nSn
	mDHRS518TKv1va4Bt/cD+2C/AWeZoXTgHA==
X-Google-Smtp-Source: AGHT+IERQ0uWww6eUTPzo5weo5Xw5vlaQEyzuSA5NWQRHhPQdOyRO+STsPsNJdTFje3XesFOJpO6Xw==
X-Received: by 2002:a25:bc41:0:b0:d9c:796:34e8 with SMTP id d1-20020a25bc41000000b00d9c079634e8mr871094ybk.26.1697532045819;
        Tue, 17 Oct 2023 01:40:45 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id 5-20020a250905000000b00d9b33e0b952sm355436ybj.8.2023.10.17.01.40.44
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 01:40:44 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-5a8628e54d4so19797147b3.0
        for <linux-riscv@lists.infradead.org>; Tue, 17 Oct 2023 01:40:44 -0700 (PDT)
X-Received: by 2002:a0d:ca50:0:b0:5a7:ba02:9c9a with SMTP id
 m77-20020a0dca50000000b005a7ba029c9amr1017206ywd.2.1697532044608; Tue, 17 Oct
 2023 01:40:44 -0700 (PDT)
MIME-Version: 1.0
References: <20231016054755.915155-1-hch@lst.de> <20231016054755.915155-10-hch@lst.de>
In-Reply-To: <20231016054755.915155-10-hch@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Oct 2023 10:40:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVq0ihLthVQF-2v4_E=m7jdOZty8b69eizJyWoU+0CFCw@mail.gmail.com>
Message-ID: <CAMuHMdVq0ihLthVQF-2v4_E=m7jdOZty8b69eizJyWoU+0CFCw@mail.gmail.com>
Subject: Re: [PATCH 09/12] m68k: use the coherent DMA code for coldfire
 without data cache
To: Christoph Hellwig <hch@lst.de>
Cc: Greg Ungerer <gerg@linux-m68k.org>, iommu@lists.linux.dev, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Conor Dooley <conor@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Robin Murphy <robin.murphy@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Wei Fang <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
	Clark Wang <xiaoning.wang@nxp.com>, NXP Linux Team <linux-imx@nxp.com>, 
	linux-m68k@lists.linux-m68k.org, netdev@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	Jim Quinlan <james.quinlan@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_014048_443258_C1B6CD8A 
X-CRM114-Status: GOOD (  17.67  )
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

T24gTW9uLCBPY3QgMTYsIDIwMjMgYXQgNzo0OOKAr0FNIENocmlzdG9waCBIZWxsd2lnIDxoY2hA
bHN0LmRlPiB3cm90ZToKPiBDb2xkZmlyZSBjb3JlcyBjb25maWd1cmVkIHdpdGhvdXQgYSBkYXRh
IGNhY2hlIGFyZSBETUEgY29oZXJlbnQgYW5kCj4gc2hvdWxkIHRodXMgc2ltcGx5IHVzZSB0aGUg
c2ltcGxlIGNvaGVyZW50IHZlcnNpb24gb2YgZG1hLWRpcmVjdC4KPgo+IEludHJvZHVjZSBhIG5l
dyBDT0xERklSRV9DT0hFUkVOVF9ETUEgS2NvbmZpZyBzeW1ib2wgYXMgYSBjb252ZW5pZW50Cj4g
c2hvcnQgaGFuZCBmb3Igc3VjaCBjb25maWd1cmF0aW9ucywgYW5kIGEgTTY4S19OT05DT0hFUkVO
VF9ETUEgc3ltYm9sCj4gZm9yIGFsbCBjYXNlcyB3aGVyZSB3ZSBuZWVkIHRvIGJ1aWxkIG5vbi1j
b2hlcmVudCBETUEgaW5mcmFzdHJ1Y3R1cmUKPiB0byBzaW1wbGlmeSB0aGUgS2NvbmZpZyBhbmQg
Y29kZSBjb25kaXRpb25hbHMuCj4KPiBOb3QgYnVpbGRpbmcgdGhlIG5vbi1jb2hlcmVudCBETUEg
Y29kZSBzbGlnaHRseSByZWR1Y2VzIHRoZSBjb2RlCj4gc2l6ZSBmb3Igc3VjaCBjb25maWd1cmF0
aW9ucy4KPgo+IE51bWVycyBmb3IgbTUyNDlldmJfZGVmY29uZmlnIGJlbG93Ogo+Cj4gICB0ZXh0
ICAgICBkYXRhICAgICBic3MgICAgIGRlYyAgICAgaGV4IGZpbGVuYW1lCj4gMjg5NjE1OCAgNDAx
MDUyICAgNjUzOTIgMzM2MjYwMiAgMzM0ZjJhIHZtbGludXguYmVmb3JlCj4gMjg5NTE2NiAgNDAw
OTg4ICAgNjUzOTIgMzM2MTU0NiAgMzM0YjBhIHZtbGludXguYWZ0ZXIKPgo+IFNpZ25lZC1vZmYt
Ynk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgoKVGhlIG02OGtjbGFzc2ljLXdpdGgt
TU1VIHBhcnRzIGxvb2sgZmluZSB0byBtZSwgc28KQWNrZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZl
biA8Z2VlcnRAbGludXgtbTY4ay5vcmc+CgpJJ2xsIGRlZmVyIHRvIEdyZWcgZm9yIHRoZSBub21t
dSBhbmQgQ29sZGZpcmUgcGFydHMuLi4KCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAg
ICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3Rz
IG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25h
bCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhh
Y2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJv
Z3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
