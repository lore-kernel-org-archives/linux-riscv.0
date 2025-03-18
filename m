Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32205C28B2F
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Mar 2025 04:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WYJJU+Qjq4GUJAABKazRdI1wlE76rmNAjyJN7T/2Zjw=; b=mLWRsbyRTFqcfP
	Mc8Alk9xeaVjswMPX7QZff9HwUQ1ucDhDYgaUUYb3syq6zAngqTnqyyetQjfJb9DZhgyFno1WCjpY
	GiXNIKf+CqYbyGw9Kzyf2kWsHwRsL51kzAXkBFmHp2Bwn7y3EIs8QVlq2fXEBP0Xsn3Qw0C/uTwOq
	LMA1aDRYOT1g/TiVVzleuFUW/XrGP2yV4QlYsPAx/NDQ8IuNX8Dq5+UCkTfVn3BECWtJwtaIYW0w0
	974hte3QWCSATbVHpu7ocRQpl6g6NOBidm1D7V3PkESeu8x8T72D0gH5nhgcAdao9wyqHLz1fknJn
	1eimGIsJbsyIStpyYEZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuOEZ-00000004bUb-1CRQ;
	Tue, 18 Mar 2025 04:07:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuO1G-00000004Zth-1zBh
	for linux-riscv@bombadil.infradead.org;
	Tue, 18 Mar 2025 03:53:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=titXZ1u8sqgmcv29C5GX0zJ9XE5maVA48khuDzjVSvs=; b=bBDoUv3TuHsqQYBKCy1xcfZiHS
	t8LRFQZiCcDdiCaGctSq4ALZKu6KXIcuEYSfxcPotJbqy9Ab9YWG/XUKPSCq15qksR27i0YH9E8Vu
	QzW7GaBT81EZlFam5DPjMMOvJLXPmxRhZbbi0QLBZdMmaKfqA3MOp5mfgQXaMeXeLpn7Y73iY9KON
	jR5z5d54tNly5u4ceiRd5BQE4UjKVj5HBQdr/9PPX9ZPUUs6YFt1wvUrk8jclxOx1JFND3SFXhWxQ
	Cri8PIgWmOUohrV9gS9XNOrUbZEL+tMlzrwpcSNwbjYau2biHjfaujh7g7IXlxuwSxbHeje+R7/9d
	TWZxZo0g==;
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuO1C-00000003eQy-3ZAL
	for linux-riscv@lists.infradead.org;
	Tue, 18 Mar 2025 03:53:33 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-223594b3c6dso105770955ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 17 Mar 2025 20:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1742270004; x=1742874804; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=titXZ1u8sqgmcv29C5GX0zJ9XE5maVA48khuDzjVSvs=;
        b=JUNBLb8LGdnXq6vkhntwYM+Hhwa55YdQJNqCL3PWbH4tXkTFgPHtcU/98XwR8Mej5M
         CENR0n7u2tINVnZy2FJBqv2L0atcCeTLH44wRbSOxrLNouTBuP6QW0qok+/R3L1CDRBB
         S/UPHYnv1zhViI6mXlrLUn/grJz86/TPsvZC2+Yt2uMCuresKU9J5Bp1/5OL1GLoxZWK
         0mpD/KGt6QrOWLVvWaERKGPZQRlAlM54Ly5PA3ORWz0Yd95wJTrHtDvpZjBryt0ywVGN
         hQn96SMtbwhX06nkdvc9Dy8gQcX3GJF7oxRQpaWIEXenMaNR8dfNVamK/epgvi1ZdkTG
         MrEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742270004; x=1742874804;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=titXZ1u8sqgmcv29C5GX0zJ9XE5maVA48khuDzjVSvs=;
        b=Xvw3mYq/3YMB69faFYCP8bTcygx0STf9FJe8jRWhl0/xYXmxAhHHX7HFq3uc2exogO
         cSM+iwirrp/lc2Vo12+xS6umCSrFsEWO54UOfdtlgsqu6se3mXAVf/nJbnaO6rKqmkM+
         KOFuOFBQIgBDvtA2/fdAuCZVkZVNDvNi0mEGWAGHontVwiWx1Qt0O6WVs2+xuxQ0s7vj
         IpQfn48s2+3BPxHKJtfbyfPBJWnSpcN8cVy0A7t591rek9wbpAJNU7Sqa0qi9P0W6Bqt
         pY2KgVfMOFsfCGtsFTT4R+1/BDeHkqSaQNLjAN352Psi5XJoxrmKBsStJTDf8kQZc8dX
         ziGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAGuoFA3o8/poZyUPpusRjpnZXApj227XNKel/U+zBc/0plyTysgb7u2bQw5g6iWYV//mBK5TU4SPDgw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwrXma5PhMi0UvP+6sq4bgUEUrjPgtbl44I/w0gnzY7Tq5UjrF1
	nVGX+DSUTSXKxBVuDVHoVfmFeVrepv2U6T4Fn1ZFr08/alYlrMpzJdar9pbljYNsELgAvwCAgAY
	ZUC+fMz03N1VAjQt+/eVospNqjdd+IZIRZwI+GQ==
X-Gm-Gg: ASbGncuWYfgU/Qaml8n1sqF+PMavPbLjaBGfhOk1IbZW2jdwce8W2pk97avKmk28YId
	1dSE+61mURY7jUHt+XdHBR8bMhNSJLKCV8uGQsnQIFSuoO/fr7Gay055SoSWBLly62XLomCfCaE
	EmHPcKbBP4GF5OqFbE2iFmagFYTBsg83krWkqnTiQ=
X-Google-Smtp-Source: AGHT+IG326VMe4vn7e9NQdmf2Gzb6Z5/6rNqL13aLduhiRSSWgBSBYvNvoDGVOzk0pLh/BjjILq/QbGgoCbsljXCb84=
X-Received: by 2002:a17:903:41cc:b0:21f:85d0:828 with SMTP id
 d9443c01a7336-225e0afb823mr208706225ad.41.1742270003946; Mon, 17 Mar 2025
 20:53:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250311122510.72934-1-luxu.kernel@bytedance.com> <b7969702-5e88-4891-bd0e-8728562ff5f5@ghiti.fr>
In-Reply-To: <b7969702-5e88-4891-bd0e-8728562ff5f5@ghiti.fr>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Tue, 18 Mar 2025 11:53:13 +0800
X-Gm-Features: AQ5f1JofhabKG_lWUnMk5-B6NxJsL7pxsKmBBMbcb9NW6YGeRX47Tog6Ry8a4Is
Message-ID: <CAPYmKFstx5_huJu05Dv4jEO7CiOJuQb1QVds218tfcFC1G1f7w@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v2 0/4] riscv: iommu: Support Svnapot
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: akpm@linux-foundation.org, jhubbard@nvidia.com, 
	kirill.shutemov@linux.intel.com, tjeznach@rivosinc.com, joro@8bytes.org, 
	will@kernel.org, robin.murphy@arm.com, lihangjing@bytedance.com, 
	xieyongji@bytedance.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_035331_257488_0F6086F7 
X-CRM114-Status: GOOD (  17.44  )
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

SGkgQWxleCwKClRoYW5rcyBmb3IgdGhlIHJlbWluZGVyLiBJIHdpbGwgcmVzZW5kIHRoZSBwYXRj
aCBhbmQgY2MgbGludXgtbW0uCgpSZWdhcmRzLAoKWHUgTHUKCk9uIFR1ZSwgTWFyIDE4LCAyMDI1
IGF0IDEyOjQ34oCvQU0gQWxleGFuZHJlIEdoaXRpIDxhbGV4QGdoaXRpLmZyPiB3cm90ZToKPgo+
IEhpIFh1LAo+Cj4gWW91IGRpZCBub3QgK2NjIGxpbnV4LW1tIG9uIHlvdXIgc2VyaWVzLCBpdCB3
b3VsZCBiZSBuaWNlIHRvIGhhdmUKPiBmZWVkYmFjayBmcm9tIHRoZW0uIEknZCBzYXkgaXQgd291
bGQgYmUgZWFzaWVyIHRvIHJlc2VuZCB0aGUgd2hvbGUKPiBwYXRjaHNldCB3aXRoIHRoZW0gaW4g
K2NjLgo+Cj4gVGhhbmtzLAo+Cj4gQWxleAo+Cj4gT24gMTEvMDMvMjAyNSAxMzoyNSwgWHUgTHUg
d3JvdGU6Cj4gPiBBY2NvcmRpbmcgdG8gdGhlIFJJU0MtViBJT01NVSBoYXJkd2FyZSBzcGVjLCB0
aGUgSU9NTVUgaW1wbGVtZW50YXRpb24KPiA+IGhhcyB0aGUgc2FtZSB0cmFuc2xhdGlvbiBwcm9j
ZXNzIGFzIE1NVSBhbmQgc3VwcG9ydHMgU3ZuYXBvdCBzdGFuZGFyZAo+ID4gZXh0ZW5zaW9uIGFz
IHdlbGwuIFRoZXNlIHBhdGNoZXMgYWRkIHN1cHBvcnQgZm9yIFN2bmFwb3QgaW4gdGhlIElPTU1V
Cj4gPiBkcml2ZXIgdG8gbWFrZSA2NEsgYWxzbyBhbiBhdmFpbGFibGUgcGFnZSBzaXplIGR1cmlu
ZyBETUEgbWFwcGluZy4KPiA+Cj4gPiBDaGFuZ2VzIGluIFYyOgo+ID4gMS4gU3VwcGx5IG1vcmUg
ZGV0YWlscyBhYm91dCBodWdlIHB0ZSBpc3N1ZSBpbiBmb2xsb3dfcGFnZV9wdGUoKS4KPiA+IDIu
IEZpeCBzb21lIHN0eWxlIHByb2JsZW1zLgo+ID4KPiA+IFh1IEx1ICg0KToKPiA+ICAgIG1tL2d1
cDogQWRkIGh1Z2UgcHRlIGhhbmRsaW5nIGxvZ2ljIGluIGZvbGxvd19wYWdlX3B0ZSgpCj4gPiAg
ICBpb21tdS9yaXNjdjogVXNlIHB0ZV90IHRvIHJlcHJlc2VudCBwYWdlIHRhYmxlIGVudHJ5Cj4g
PiAgICBpb21tdS9yaXNjdjogSW50cm9kdWNlIElPTU1VIHBhZ2UgdGFibGUgbG9jawo+ID4gICAg
aW9tbXUvcmlzY3Y6IEFkZCBzdXBwb3J0IGZvciBTdm5hcG90Cj4gPgo+ID4gICBhcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3BndGFibGUuaCB8ICAgNiArCj4gPiAgIGRyaXZlcnMvaW9tbXUvcmlzY3Yv
aW9tbXUuYyAgICAgIHwgMjU4ICsrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0KPiA+ICAg
aW5jbHVkZS9saW51eC9wZ3RhYmxlLmggICAgICAgICAgfCAgIDggKwo+ID4gICBtbS9ndXAuYyAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAxNyArLQo+ID4gICA0IGZpbGVzIGNoYW5nZWQsIDIz
MyBpbnNlcnRpb25zKCspLCA1NiBkZWxldGlvbnMoLSkKPiA+Cj4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
