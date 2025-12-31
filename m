Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1ABAEE57E5
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Dec 2025 07:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wR5cpdAhHJnDXIlBadoETajL4LwlMLcAe/NiUalfw8w=; b=4RIPD4uGW5IZ/R
	nfcOGPFQux7FOj+0y7Zh3Z0ZRIh71XunaVlHLQ82KCfsEJnmNqubS/H4Ud+qoKBS/QSOB1WIGJyCc
	8t1E/lLdpDxhzGR+1++6fORCMEo88Pzi5+j2/pt7zwsy4zLfy69caIcjZudLQVex6XQ5QkzmrhrBN
	YPL8CASY04a79imS6FC6QxKmnTO59oDqYDkBKL+2YNj+3aI6KCerTV319/zIcBiY5iRBKTAbLwgbx
	8b0IX5BncWgKCmwAoPHxoO3pSwz0Q49JSSBBxQowjV4IJxCCKRwspiSW/fObAaNT0LQgvD+k5xHeb
	NvD7J8zInPMKo7hI2+0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1var63-00000005mAU-09cL;
	Wed, 31 Dec 2025 07:58:19 +0000
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1var5z-00000005mA9-3pI4
	for linux-riscv@lists.infradead.org;
	Wed, 31 Dec 2025 07:58:17 +0000
Received: by mail-yx1-xb12e.google.com with SMTP id 956f58d0204a3-6467c5acb7dso6173114d50.1
        for <linux-riscv@lists.infradead.org>; Tue, 30 Dec 2025 23:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767167894; x=1767772694; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KTe+uww2iCrHymaii5h3grRGLClKo9EOT5Ashcba0hE=;
        b=NzDnEvUdfEpPhZuJ2bmfBtXpuCfHONKF3yfJr6tteMjXKOR3FQ+Lk+9GNTceSJLjsN
         Fcaeaq6K8HQOe6oVK70t5j366wlpSq8gG5BAOqXAdXeX9n7gQHPDHTP85cAtQXOfaNS4
         NKvkTtNRvG3zx1IKYo5ooPEES6AhYq+pngn57D3Y9GgoDPxpiuvLYN0FN8EUNoxw7PO2
         8ooX+IpUgbGZjLHcLo3Wd51AYlCdDUW9TouxBqauBR5aZQzZ+ytFKO5prDBRa31XXyO1
         pl5iEnd4/tpR+QTKw44vpv52mOda1uvDPDpS4FtjP7eZZy481OdpTLs8hRe0gu9HmyAH
         zntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767167894; x=1767772694;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KTe+uww2iCrHymaii5h3grRGLClKo9EOT5Ashcba0hE=;
        b=h241kISaiahxbUjbHfGe+dwhGyQ6ZaaMC5eZVDRwKFmpM8PADHfYDtatX7bGepVhzK
         OCkcBnP3HVNk95CTkzVU9B9xiwz7V0W9jYmoVaUMIqTRlTVMK2CtdASZPzvrBTl7+M3s
         Z1XvMUgFQa5EY6Nhs+uJQTMLAschl2AkpYJ/tE5GRDpxSsdgWTciJWW79ybl2RtOsDGu
         xfVbempmQnhCwHI/yxg+7M0oeCXOJ8VLwge/WUycESFLxMGyPU/Utwnt+Ai94mV7lX7n
         ZBGl6j22AacdzVtT3XW6fK1s1jKd1Kd6IsuyCeFWTRlHRpr/e0xq1x4kodBh6bLiudXF
         POpw==
X-Forwarded-Encrypted: i=1; AJvYcCXaZKjIRb1IBBXxcYG0+4VtgyRUfVUk+5RmjkLxfHjmzC+oXlQS3RD7N0UA16Pf6fXDQy5XBe9uUvo+SQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzhgjzQORTzTLoGkfOzRTjQWlpxyeLgX66wwy3+NyDZ7j4DILgf
	4mciErpFBnayz9oMU8eJw7KOUJaKmmRUB7GRsqFZIaWtFDtul8vzez3LbLkIKnYuYmoCRPShYvS
	ImCz9aFl0JZjtl9osTpVBSh3I5VFQj/46bo7H8mALEw==
X-Gm-Gg: AY/fxX4lGC8JsuHEPHPxfCZS9PIRNOw6Ox2GeN8PlAdVYG2yYIRQSMP/pTs0T9OCeEs
	g6aFJxUIVnMwPNpQR0+U+vk1G96be9ZnTTOZpxDIGjc8OYrz1yE52El5XhKy7k4mITqKpf+w7kh
	8sTZ0rkW++pARZwDFPYas1vzK5rdEpMvPYBtg+qzghYzDVWwZWEYLya81H5q+lZs75cuSjndHtN
	7WZ3hJBesSr/nQMR1BlYNxgPSeHO1DXXm18e+vEHaHoF7atJoqXwrkUVYVAucJxBRMd2TI4T3QX
	gwZtxZnKpak1dnlj6NxKpkivTf0y/ftaIRAWPS/s0mNX
X-Google-Smtp-Source: AGHT+IH53FvUpz0dR04OFmctNYeppfU38AmPI7x8yHnkIoO7J4A8mQkJ+AGynPvCIOVfnVQmo938afWT4z4sYjqeQLk=
X-Received: by 2002:a53:b98b:0:b0:63f:ce86:8b81 with SMTP id
 956f58d0204a3-6466a8445c0mr23299917d50.18.1767167894213; Tue, 30 Dec 2025
 23:58:14 -0800 (PST)
MIME-Version: 1.0
References: <20251229-k3-reset-v1-0-eda0747bded3@riscstar.com>
 <20251229-k3-reset-v1-1-eda0747bded3@riscstar.com> <20251230-charming-nonchalant-goat-98bbde@quoll>
 <6ed0436e-e03b-4b17-a70b-6f848f14e1d8@kernel.org>
In-Reply-To: <6ed0436e-e03b-4b17-a70b-6f848f14e1d8@kernel.org>
From: Guodong Xu <guodong@riscstar.com>
Date: Wed, 31 Dec 2025 15:58:03 +0800
X-Gm-Features: AQt7F2qzhgUj-QKv44VxiXKT9CGYXUenv1CyhrZqOLWPCsSao1lPbDdY4t_Ch_U
Message-ID: <CAH1PCMbKwBUJoVfL-wqsd_5RWNVFVVC_UPxk2B3VFeRkDertng@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: reset: spacemit: Add K3 reset IDs
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Alex Elder <elder@riscstar.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_235816_196694_762BDE10 
X-CRM114-Status: GOOD (  16.58  )
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

SGksIEtyenlzenRvZgoKT24gVHVlLCBEZWMgMzAsIDIwMjUgYXQgODoyNOKAr1BNIEtyenlzenRv
ZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiAzMC8xMi8yMDI1IDEz
OjIxLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+ID4gT24gTW9uLCBEZWMgMjksIDIwMjUg
YXQgMDc6MDQ6MDRQTSArMDgwMCwgR3VvZG9uZyBYdSB3cm90ZToKPiA+PiBBZGQgcmVzZXQgSURz
IGZvciBTcGFjZW1pVCBLMyBTb0MuCj4gPgo+ID4gV2h5PyBXaGVyZSBpcyB0aGUgYWN0dWFsIGJp
bmRpbmc/IFlvdSBoYXZlIGVudGlyZSBjb21taXQgbXNnIHRvIGV4cGxhaW4KPiA+IHRoYXQsIGlu
c3RlYWQgb2YgZHVwbGljYXRpbmcgc3ViamVjdC4KPgo+IC4uLiBhbHNvIGJlY2F1c2UgdGhlbiBJ
IHdvdWxkIGFzayB3aGF0IGlzIHRoZSBjb21wYXRpYmxlIGFuZCB3aHkgdGhlCj4gZmlsZW5hbWUg
ZG9lcyBub3QgbWF0Y2ggdGhlIGNvbXBhdGlibGUuCj4KClRoYW5rIHlvdSBmb3IgdGhlIHJldmll
dy4KCkkgc2VlIHlvdXIgcG9pbnQgbm93LiBJdCdzIG15IG1pc3Rha2Ugbm90IGV4cGxhaW5pbmcg
dGhlIHJlbGF0aW9uc2hpcApiZXR3ZWVuIEszIHJlc2V0IGFuZCBjbG9jayBjb250cm9sbGVyLiBJ
IHdpbGwgdXBkYXRlIHRoZSBjb21taXQgbWVzc2FnZQppbiB2Mi4KCkszIHJlc2V0IGRldmljZXMg
YXJlIHJlZ2lzdGVyZWQgYXQgcnVuIHRpbWUgYXMgYXV4aWxpYXJ5IGRldmljZXMgYnkgdGhlCmsz
IGNjdSBkcml2ZXIuIFRoaXMgd2F5LCB0aGV5IGRvbid0IGhhdmUgdGhlaXIgb3duIHlhbWwgYmlu
ZGluZyBmaWxlLCBidXQKcmV1c2UgdGhlIEszIGNjdSBiaW5kaW5nLCB3aGljaCBpcyBidWlsdCBv
biB0b3Agb2YgazEgc3lzY29uOgpEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc29j
L3NwYWNlbWl0L3NwYWNlbWl0LGsxLXN5c2Nvbi55YW1sCgo+Cj4gLi4uIGFsc28gYmVjYXVzZSB0
aGVuIEkgd291bGQgYXNrIHdoYXQgaXMgdGhlIGNvbXBhdGlibGUgYW5kIHdoeSB0aGUKPiBmaWxl
bmFtZSBkb2VzIG5vdCBtYXRjaCB0aGUgY29tcGF0aWJsZS4KCkZvciB0aGUgZmlsZW5hbWUsIHNp
bmNlIGl0IGxpc3RzIHRoZSBpbmRleCB2YWx1ZXMgZm9yIHJlc2V0IGRhdGEsIEkKY2hvc2UgdG8g
cHV0IGl0IGludG8gaW5jbHVkZS9kdC1iaW5kaW5ncy9yZXNldC9zcGFjZW1pdCxrMy1yZXNldHMu
aCwKd2hpY2ggbWlycm9ycyB0aGUgY2xvY2sgcGFydCBhdCBpbmNsdWRlL2R0LWJpbmRpbmdzL2Ns
b2NrL3NwYWNlbWl0LGszLWNsb2Nrcy5oLgoKSSB3aWxsIHVwZGF0ZSB0aGUgeWFtbCBmaWxlIChz
cGFjZW1pdCxrMS1zeXNjb24ueWFtbCkgaW4gdGhlIHYyIHZlcnNpb24KdG8gZG9jdW1lbnQgSzMg
cmVzZXQgc3VwcG9ydCBhbmQgaW5jbHVkZSB0aGUgcmVzZXQgaGVhZGVyIGluIHRoZQpkZXNjcmlw
dGlvbiwgc28gcGVvcGxlIGNhbiBjbGVhcmx5IGxpbmsgJ3NwYWNlbWl0LGszLXJlc2V0cy5oJyB3
aXRoIHRoZQpiaW5kaW5nIGNvbXBhdGlibGUuCgo+ID4KPiA+IEkgYW0gcHJldHR5IHN1cmUgSSBh
bHJlYWR5IGFza2VkIHRoaXMgZm9yIGEgZGlmZmVyZW50IHBhdGNoc2V0IGZyb20KPiA+IHlvdS4u
LgoKSSBhcG9sb2dpemUgZm9yIHRoYXQuIEkgd2lsbCBiZSBtb3JlIGNhcmVmdWwgaW4gZnV0dXJl
IHN1Ym1pc3Npb25zLgoKQmVzdCByZWdhcmRzLApHdW9kb25nCgoKPiA+Cj4gPgo+ID4+Cj4gQmVz
dCByZWdhcmRzLAo+IEtyenlzenRvZgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
