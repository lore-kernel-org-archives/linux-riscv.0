Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC3DC43458
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 12:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UGAz0469cpjszLVwvfFjJ5F1NWC+A6s9WDYEUVp/qoA=; b=Dww4KYzhpa0sU+
	ISmnRtDWhdQP2IouRW0FfIXknOpU8HaiZYUZJ6WP9fn6+zcIGEwLGi+Jhoy6i1aqpXQyl9mDr+pK+
	wh96eQhRWX9Lb6wAtvKHC8mUX2LU1Bt9Unx+gFvtgz6LvnyUQyX3maCbrGHV1L3wpz5KrPPhdzM+y
	53CogS8VuIJye4mYNFc2MmHFFvb6swpp5iDcTsA4FmuqhL9ERu58NZ/akYdOnKcZQ/E+NbGv9r1sw
	9wC+oD4bvzvHEynBjCNjbdt/GoznMUy4VfC0PV5QX8i9YgYUpaGeqRj6uOQJohhI1+i9YVkBUaYjz
	lvokevEZ713mZd/hcoYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfcay-00000006tAq-2xRo;
	Fri, 03 Jul 2026 12:02:12 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfcav-00000006t9i-14et
	for linux-riscv@lists.infradead.org;
	Fri, 03 Jul 2026 12:02:11 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-493bfe9f886so2680955e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 03 Jul 2026 05:02:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783080125; cv=none;
        d=google.com; s=arc-20260327;
        b=X3v+CSFAYXhLbBhJybIgVlFruwF7fiiJAo7xgy/fu2HmdMTSCltKoJb2rE5+b/Fg4q
         nSOXQfkhMdg12qGO3g49GVjlxQ9xJxhwiiHESMjqvfVFwEOv/9n+cFzUurNwzc3dp/Vg
         BAL9V1pgfRU0tQHmaQfqAI0qGG7LHgSv/5d2ZLT3QiP/67vJPL2nJ8SKMEJLEKz5Yap2
         CjFUaQmcHkbuOHf7vhU3AF0bKwpqvbJBwMgZxQh71Fjqhk5zRq60PA7UvD5qbzG1I6zm
         JAlljikynaCljeF9BuFtK/1YTJQfJtpQB98BElRb19Jz3tamGeIpa0kRKy/eUrN5zHCI
         xp5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bwDyQXTlq+/xEQtBMjWLe7Se3wIpqNvnPc/TahNVe6E=;
        fh=uDPy1mOzxWZ7GiMobs7i3gepufARYgXw3mC06KsEkJY=;
        b=rEQZTgOMoz0tN6xGTYypHGkDAxoiA+p3C+HPLMW/kB/IRtIRu0LPhP71wzvev2VYLY
         4ISmbpZBqG9RyG2axFMsFpbVBab1I1oqRcTHw1m6md1HQsAzbAcRb0OOuomWDALg18fa
         i1NmwDtCzmYirxtwjBPp6Z9+2BJkPWRIYmQKktGNPAACQjUUejWDtBbYgJdvkUDdfkyr
         VSQO1hc1KI79UynoV4T60iGpJdEDG2N6etWBX0o4izxtt/47YXXJ1WOAR/EO0b5m5WDv
         erNN1+/sarup2/tWh66djEG7wuSjUn7iv3ar/73yRe5djHRSuBCsc4R2KiVFDpD3qux0
         Ewzg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1783080125; x=1783684925; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bwDyQXTlq+/xEQtBMjWLe7Se3wIpqNvnPc/TahNVe6E=;
        b=sbYktd5TcE0rxWUYrE1/jWb0YZ+9V0Ig32uSaK2OmwOwoOgv0Xoji11lM/wQg4hxD4
         1a/CE+kKameIPxdhAZDXTtP9nyFEOIvsdeGqLz82wDTmM+ykmlTNn1FWLfN+TJH2HKtt
         DNHb1Ij5ICOKxxc2k0k/M6a+X7ixccYFteb99E7tR3jYKMZi0r/gPWQH3ZCK8blQhnwf
         KuPTRSFvXNS/swrDH2maYGJb3gmxgcjp3TK2aqTlEIUrZKOw2Ez8rV01/o4UjJI0yW4U
         X0MW/g6cdQaC2OnNfKqlLZB07hCfXzQEO8whSL7KblD630xe6FbOaQqM5gunq/2cRaK6
         8jPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783080125; x=1783684925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bwDyQXTlq+/xEQtBMjWLe7Se3wIpqNvnPc/TahNVe6E=;
        b=KY39xDDaodq56C5MbWFe6YSurjup2kifA6P2bpYv3HG+bt7V9/Muvj91Iyr3E62uD8
         HVx1vXZ5Ny+rjbgVIoYhk1EBdgQc4fkO/GHF7RG3kSrBW0J1Br+YmKpGnO+ylj+GZNO2
         zs261eHBCkI/FE4ghPjJ+yxf/NPglUEn1DWNFmE4myrAWcgxMtTX7G3Af/+mYiURfg7e
         kvYVG4//bv9d4lIVJqg/6JGOfnqGnYHmV3QpjuBJZHUg7CvlvLAHVh+by7dQi2GbCi5n
         499+aIzZBnVV2KARQsg+4N2rAKURxjuuh38Wcm2Zx4wZ3d5Zz85tl+en4VR8KbE5LLNL
         YxRQ==
X-Forwarded-Encrypted: i=1; AFNElJ/mJrNSa21hnQqiQjHfS2KdrSoOTwnLMZCje26cmM+dz/JEKgyyx38Eeo95kJvpME+yynu0iD1ZB/dG/Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxA70jBXIuwtVRU3vd7s+KZ0XsztKAaTfIaWWBhnsIL7dIxlrzf
	9cDa/DYfnzo1FL+4J/RHEjHHR4W1j8+vetcxP092piLXsWNgdFf2T4DMJtEILMViiqsko1E/xtm
	O4+JyY+DPkmiVGe+nIzs9y3LM2n7zudkCXnmO/sDefg==
X-Gm-Gg: AfdE7cmSWFctQlN5EESzMSQKft2lUVaCwLMRnoXKAUzMHgoTth5Tjvd1a4VXgn39XNi
	xrbx90WHpqbwWzzMtIP7tWJvRVx+0Sl/kSbJKQJioGxPfbHflAfHYdJuiOeNrdnVwf2M5d+5fDO
	JTWjcShV/V6x6oSlhD2uVG+9jZuFv7OfOXdzkQE0mNVYrcjO1PmYNfEWuewcmXnhakNPY4iONY6
	H0rVvfZ3nCFFWIvWzYITLSD0FfUgmbHTrREqgfcBtFKZE4VOVSsm5ZFzffOHnawENLlVq/8HIpr
	dMOzF1Ca4HyyO+1a/wU/lKJZfmL5yp28yXOvUs3CpmdegWda+PF9E0mmYYrn9MNeZIdZWTXSF3M
	+3i4xkBA/Ik/cAt7/EmuE/nIHzg==
X-Received: by 2002:a05:600c:1988:b0:493:c84c:2b57 with SMTP id
 5b1f17b1804b1-493c84c2bf1mr66489165e9.29.1783080124943; Fri, 03 Jul 2026
 05:02:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260429125135.1983498-3-anup.patel@oss.qualcomm.com>
 <BDD9553502347B02+ee3069d3-eb04-4a37-b364-107cf8d0653c@linux.spacemit.com>
 <2026070316-surgery-unneeded-bceb@gregkh> <138BCDE3F4A1D624+2488a822-cf77-4155-8492-b8a1c47d5589@linux.spacemit.com>
 <2026070300-submitter-humbly-833a@gregkh> <4A32964890BBF288+37eaa5a2-eaff-49c4-8501-2b02736f3584@linux.spacemit.com>
In-Reply-To: <4A32964890BBF288+37eaa5a2-eaff-49c4-8501-2b02736f3584@linux.spacemit.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 3 Jul 2026 17:31:53 +0530
X-Gm-Features: AVVi8CcR6CoUoZAzLjAFLHFIn-Btp_hgZON7-FmGe_V0DS8PdhVFU56m1idXpx0
Message-ID: <CAAhSdy2sfwaBQVif_N_Gk3yMs+0kqO-_PsDTicSNZW_Pez6Lbg@mail.gmail.com>
Subject: Re: [PATCH v4 02/12] rvtrace: Initial implementation of driver framework
To: Zane Leung <liangzhen@linux.spacemit.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, anup.patel@oss.qualcomm.com, 
	adrian.hunter@intel.com, alex@ghiti.fr, alexander.shishkin@linux.intel.com, 
	andrew.jones@oss.qualcomm.com, atish.patra@linux.dev, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, irogers@google.com, jolsa@kernel.org, 
	krzk+dt@kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, mark.rutland@arm.com, 
	mayuresh.chitale@oss.qualcomm.com, mchitale@gmail.com, mingo@redhat.com, 
	namhyung@kernel.org, palmer@dabbelt.com, peterz@infradead.org, pjw@kernel.org, 
	robh@kernel.org, sunilvl@oss.qualcomm.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_050209_467154_691E8873 
X-CRM114-Status: GOOD (  31.82  )
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

T24gRnJpLCBKdWwgMywgMjAyNiBhdCAyOjMx4oCvUE0gWmFuZSBMZXVuZyA8bGlhbmd6aGVuQGxp
bnV4LnNwYWNlbWl0LmNvbT4gd3JvdGU6Cj4KPgo+IE9uIDcvMy8yMDI2IDM6NDEgUE0sIEdyZWcg
S0ggd3JvdGU6Cj4gPiBPbiBGcmksIEp1bCAwMywgMjAyNiBhdCAwMzozMjo1MFBNICswODAwLCBa
YW5lIExldW5nIHdyb3RlOgo+ID4+IE9uIDcvMy8yMDI2IDE6NDEgUE0sIEdyZWcgS0ggd3JvdGU6
Cj4gPj4+IE9uIFRodSwgSnVsIDAyLCAyMDI2IGF0IDA0OjE5OjUzUE0gKzA4MDAsIFphbmUgTGV1
bmcgd3JvdGU6Cj4gPj4+PiBIaSwKPiA+Pj4+Cj4gPj4+PiBCYXNlZCBvbiB0aGUgY3VycmVudCBm
cmFtZXdvcmssIEkgYW0gY29uY2VybmVkIGFib3V0IGhvdyB0byBzdXBwb3J0IFJJU0MtViBBVEIg
YW5kIHJldXNlIHRoZSBDb3Jlc2lnaHQgY29tcG9uZW50IChFVEIvdG1jL1RQSVUpIGluIHRoZSBm
dXR1cmUuCj4gPj4+IFRoYXQgaXMgdmVyeSB2YWd1ZS4gIFBsZWFzZSBwcm92aWRlIHNwZWNpZmlj
IGV4YW1wbGVzLgo+ID4+IEFjY29yZGluZyB0byB0aGUgL3RyYWNlIGNvbnRyb2wgaW50ZXJmYWNl
LyBbMV0gc3BlYzogIlRoZSBBVEIgQnJpZGdlIGFsbG93cyBzZW5kaW5nIFJJU0MtViB0cmFjZSB0
byBBcm0gQ29yZVNpZ2h0Cj4gPj4KPiA+PiBpbmZyYXN0cnVjdHVyZSAoaW5zdGVhZCBvZiBSSVND
LVYgY29tcGxpYW50IHNpbmsgZGVmaW5lZCBpbiB0aGlzIGRvY3VtZW50KSBhcyBhbiBBVEIgaW5p
dGlhdG9yLiBBVEIgQnJpZGdlIGlzIG5vdAo+ID4+Cj4gPj4gbmVlZGVkIGZvciBSSVNDLVYgb25s
eSBzeXN0ZW1zLiIKPiA+Pgo+ID4+IEZvciBBVEIgQnJpZGdlLCByZWFkIHRyYWNlIHVzaW5nIENv
cmVzaWdodCBjb21wb25lbnRzIChFVEIvVE1DL1RQSVUpLCAgc28gd2UgbmVlZCBhbHNvIEFSTSBj
b3Jlc2lnaHQgZHJpdmVyIGluCj4gPj4gUklTQy1WIHRyYWNlIHN5c3RlbXMuIEN1cnJlbnQgZnJh
bWV3b3JrIHNlZW1zIHRvIG9ubHkgYmUgYXBwbGljYWJsZSB0byBSSVNDLVYgb25seSBzeXN0ZW1z
LCBhbmQgZG9lcyBub3Qgc3VwcG9ydAo+ID4+IEFUQiBhbmQgIEFSTSBjb3Jlc2lnaHQgdXNlIGNh
c2UgbGlrZSB0aGUgSzMgKEszIFNvQyBjb250YWlucyBSSVNDLVYgRW5jb2RlciwgRnVubmVsLCBB
VEIsIENvcmVTaWdodCBGdW5uZWwsIGFuZAo+ID4+Cj4gPj4gQ29yZVNpZ2h0IFRNQyBjb21wb25l
bnRzKS4gRm9yIG1vcmUgZGlzY3Vzc2lvbiwgcGxlYXNlIHJlZmVyIHRvIFsyXS4KPiA+Pgo+ID4+
Cj4gPj4gWzFdOiBodHRwczovL2RvY3MucmlzY3Yub3JnL3JlZmVyZW5jZS90cmFjZS1jb250cm9s
LWludGVyZmFjZS92MS4wL3RjaV9zeXN0ZW1fb3ZlcnZpZXcuaHRtbCNhdGItYnJpZGdlCj4gPj4g
WzJdOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNjA0MTQwMzQxNTMuMzI3MjQ4NS0x
LWxpYW5nemhlbkBsaW51eC5zcGFjZW1pdC5jb20vCj4gPiBTbywgd2hhdCBzcGVjaWZpY2FsbHkg
ZG9lcyB0aGlzIG1lYW4/ICBQbGVhc2UgcHJvdmlkZSByZXZpZXcgY29tbWVudHMKPiA+IGZvciB0
aGUgY29kZSBpdHNlbGYuCj4KPiBUaGUgaXNzdWUgSSBwb2ludGVkIG91dCBpcyBub3QgYWJvdXQg
c3BlY2lmaWMgbGluZXMgb2YgY29kZSwgYnV0IGFib3V0IHRoZSBlbnRpcmUgUmlzY3YgdHJhY2Ug
ZHJpdmVyIHJlZ2lzdHJhdGlvbiBhbmQgYnVpbGRpbmcgYSBwYXRoIGZyb20gc291cmNlIC0+Cj4g
c2luayBkaWQgbm90IHRha2UgaW50byBhY2NvdW50IHRoZSBhcHBsaWNhdGlvbiBvZiBhcm1fY29t
ZXNpZ2h0LiB0aGUgY3VycmVudCBwYXRjaCBzZXQgYXNzdW1lcyBhIHJpZ2lkLCBob21vZ2VuZW91
cyBSSVNDLVYtb25seSB0b3BvbG9neS4KPgo+IFNwZWNpZmljYWxseSwgaWYgd2UgaGF2ZSBBUk0g
Y29yZXNpZ2h0IGNvbXBvbmVudHMsIGhvdyBjYW4gd2UgcmV1c2UgdGhlbSBsaWtlLCBmdW5uZWwg
KGRyaXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQtZnVubmVsLmMpICwKPgo+IFRN
QyAoZHJpdmVycy9od3RyYWNpbmcvY29yZXNpZ2h0L2NvcmVzaWdodC1mdW5uZWwuYykgLCBUUElV
IChkcml2ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0LXRwaXUuYykgYW5kIHNvIG9u
IGJhc2VkIG9uIHRoZSBjdXJyZW50Cj4KPiBmcmFtZXdvcmsuCj4KPgo+ID4KPiA+IFdlIHdyaXRl
IGNvZGUgZm9yIHN0dWZmIHdlIGhhdmUgbm93LCB0b2RheS4gIElmIGZ1dHVyZSBuZWVkcyBjaGFu
Z2UsIHdlCj4gPiBjaGFuZ2UgdGhlIGNvZGUgdG8gaGFuZGxlIHRoYXQgdGhlbi4KPgo+IEkgYmVs
aWV2ZSB0aGF0IGlmIHRoZSBiYXNpYyBmcmFtZXdvcmsgZm9yIFJJU0MtViBkb2VzIG5vdCBjb25z
aWRlciBjb21wYXRpYmlsaXR5IHdpdGggQVJNIENvcmVzaWdodCwgb25jZSB0aGUgZnJhbWV3b3Jr
IGlzIGZpeGVkLCB0aGVyZSB3aWxsIGJlIGdyZWF0ZXIgcmVzaXN0YW5jZSB0byBmdXR1cmUgbW9k
aWZpY2F0aW9ucy4KPgo+ID4gVGhlIG9ubHkgcHJvYmxlbSBpcyB3aXRoIHVzZXIva2VybmVsIGFw
aXMsIHRob3NlIG5lZWQgdG8gYmUgbmFpbGVkIGRvd24KPiA+IHNvIHRoYXQgdGhleSBkb24ndCBj
aGFuZ2UuICBJIGNhbid0IHRlbGwgaGVyZSBpZiB5b3UgYXJlIG9ubHkgcmVmZXJyaW5nCj4gPiB0
byB0aGUgaW4ta2VybmVsIHN0dWZmLCBvciB1c2VyL2tlcm5lbCBhcGlzLCBzb3JyeS4KPiA+Cj4g
PiB0aGFua3MsCj4gPgo+ID4gZ3JlZyBrLWgKPgo+Cj4gSSBiZWxpZXZlIHRoYXQgUklTQy1WIHRy
YWNpbmcgaXMgY29yZXNpZ2h0LWFsaWtlLCB3aGVyZSBoYXZlIGVuY29kZXJzL2Z1bm5lbC9zaW5r
L2JyaWRnZStjb3Jlc2lnaHRfY29tcC4KCkkgdGhpbmsgeW91IGFyZSBvdmVyIHNpbXBsaWZ5aW5n
IHRoZSBjb21wYXJpc29uLiBBdCBoaWdoLWxldmVsIG9ubHkKdGhlIHRvcG9sb2d5IG9mIGNvbXBv
bmVudHMgaXMgc2ltaWxhciBiZXR3ZWVuIFJJU0MtViBhbmQgQVJNIGJ1dCB0aGUKaW5kaXZpZHVh
bCBjb21wb25lbnRzIGhhdmUgZ3JlYXRlciBhcmNoaXRlY3R1cmUgaW5mbHVuY2UuIEluIGZhY3Qs
IHdlCnVwY29taW5nIFJJU0MtViBzZWxmLWhvc3RlZCB0cmFjZSB1bmRlciBkZXZlbG9wbWVudCB3
aGVyZSBib3RoIGVuY29kZXIKYW5kIHJhbXNpbmsgYXJlIHByb2dyYW1tZWQgdmlhIENQVSBDU1Jz
LgoKVGhlIG9ubHkgdGhpbmcgd2hpY2ggY2FuIGJlIHNoYXJlZCBpcyBhIGNvbW1vbiB0cmFjZSBm
cmFtZXdvcmsgKHdoaWNoCmlzIHZlcnkgc21hbGwgcGFydCBvZiB0aGlzIHNlcmllcykgYnV0IHRo
ZSBjb21wb25lbnQgZHJpdmVycywgZHJpdmVyCnByb2JpbmcsIHBlcmYgZHJpdmVyIGV0YyB3aWxs
IGJlIGhpZ2hseSBhcmNoaXRlY3R1cmUgc3BlY2lmaWMuCgo+IEkgdGhpbmsgd2Ugc2hvdWxkIGFi
c3RyYWN0IHNvbWUgb2YgQ29yZVNpZ2h0J3MgY29yZSBsb2dpYyBzbyB0aGF0IGl0IGNhbiBCb3Ro
IGNvcmVzaWdodCBhbmQgcnZ0cmFjZSBjYW4gYmUgcmV1c2VkLgo+IEdlbmVyYWwgbG9naWMgZm9y
IGJ1aWxkaW5nIHBhdGhzIGZyb20gc291cmNlIC0+IFNpbmsgYW5kIHBlcmZfcG11IHNob3VsZCBi
ZSB1bml2ZXJzYWwgaW4gY29yZXNpZ2h0L3J2dHJhY2UgYW5kCgpNeSBzdWdnZXN0aW9uIGlzIHRv
IHRha2UgY3VycmVudCBydnRyYWNlIGZyYW1ld29yayAod2hpY2ggaXMgbWluaW1hbAplbm91Z2gp
IGFuZCBjcmVhdGUgYSBzaW1wbGUgImd0cmFjZSIgZnJhbWV3b3JrIChha2EgZ2VuZXJpYyB0cmFj
ZQpkcml2ZXIgZnJhbWV3b3JrKSB3aGljaCBjYW4gYmUgZW5hYmxlZCBieSBtdWx0aXBsZSBhcmNo
aXRlY3R1cmVzLiBUaGUKUklTQy1WIHRyYWNlIGRyaXZlcnMgY2FuIGJlIHRoZSBmaXJzdCBvbmVz
IHRvIGFkb3B0IHRoaXMgImd0cmFjZSIKZnJhbWV3b3JrLiBBcyBzZXBhcmF0ZSBzZXJpZXMsIHRo
ZSBBUk0gY29yZXNpZ2h0IGNvbXBvbmVudCBkcml2ZXJzCmdyYWR1YWxseSB1cGRhdGVkIHRvIHN1
cHBvcnQgImd0cmFjZSIgZnJhbWV3b3JrLiBUaGlzIHdheSBvbmx5CnJlcXVpcmVkIHN0dWZmIHdp
bGwgYmUgc2hhcmVkIHdpbGwgYmUgYnJvdWdodCB1bmRlciB0aGUgY29tbW9uCiJndHJhY2UiIGZy
YW1ld29yay4KCkkgd2lsbCB1cGRhdGUgdGhpcyBzZXJpZXMgYXMtcGVyIGFib3ZlIHN1Z2dlc3Rp
b24gaWYgdGhlcmUgaXMgbm8gb2JqZWN0aW9uLgoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
