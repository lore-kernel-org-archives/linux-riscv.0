Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8347CEACEF
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Nov 2025 17:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cYvIst4A+hH6XE5j5HZPNtrgqNhzPgWXV7MEfrwRjjk=; b=gk8xhJgmJg7KrR
	CrslWQ9ol/92nj1fhCL+6LZJbNtQWA81BFcAHskYaG6WA7LEHcEku4duM3ZROFy2awekNFeIScjRd
	G9EEYcsueYsQxiDva0r2Ami2rNwN6iHEdACL6VlmA0ZJyrpvcOUBF5xGOdOM8dVBLcdub2RZblwOF
	nKoL5g6T0jQEnkSdLB078i64iVSVLT6P464ZqkcwdNO7/yLUnpeU7kE35SxO5m9V68N5s2miYNpfT
	k7QofVN3m6oqhoPa/hytPqy3EeLeyQTcHobrfV11xxauKhePc6rG801Qe0ys2/8bNbJOhU0BvT87D
	Uw7gjpWrTHGacs5gfytQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL2mX-0000000GVnF-21hZ;
	Mon, 17 Nov 2025 17:12:49 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL2mU-0000000GVmC-0Sow
	for linux-riscv@lists.infradead.org;
	Mon, 17 Nov 2025 17:12:48 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-43380a6fe8cso33072525ab.0
        for <linux-riscv@lists.infradead.org>; Mon, 17 Nov 2025 09:12:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1763399565; x=1764004365; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UVyQ1lgChGCDzR3SsqjIRgL3e2y5+BZfD9Zpt6v7tGs=;
        b=g1rP6oYYQ3uJR5xMJQ3QjDPSCXJpb2FlfemWgj98WSoP9178ZF4tq9USg6aD3KNZba
         PghkboSPSf9S6fU0q970bmHR6jY0p+2FVHEDJJ6SMLcz+bi+MV32YOfzFtn+UBFA1WEQ
         GlV7nXnpgUvjqMCm1wjG/mnYhURigMDbWK5t1kqWKLzV0GytKvvx8VjQkEIvrYIqKXPh
         bHO7s1HqZ18HtZdhJv5Vivffy7JcXGXKVvyDAEiWG8bvnBz8X8RrNeJ9s9DwcnC5wBG2
         WqVv0ARE4XFx3CcYGXT8J4se9GSpuPgSthiDLrMv8qJCNNklsB8VjZ3y2XfpFjBmVjyl
         TIkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763399565; x=1764004365;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UVyQ1lgChGCDzR3SsqjIRgL3e2y5+BZfD9Zpt6v7tGs=;
        b=w4J/FC2fSaBpfWGEqDiSAN+uuX7SnavavE/PwVqcSkSM+VbEHsj8btsm/9p7PMj3gx
         5aOm4mqD51Fq4Q6Rnxyk9tIF7N04iLJLhS2ijUzYrl3YOrGKvG3UbphKi5U7eknJJLea
         5VMuFcTEVFGGcss/3dfDUtSbc6v8Aa8ymo4K+VJBuEQZ/U8C1drAk2LMPnrbBvtXOGdF
         dik07RGtXo2vdMZOKFrAwrs3HzDMckKEcfXrdUHyQaJGd1GjEjrDwWDndYXbyhhBB2KO
         3dYbwyLLCxi5jnSLrhsLWIZQr9kM67NH+17NGzNuvcxKurn7OiIXsMG/GSn8V+HXX1O9
         A+yg==
X-Forwarded-Encrypted: i=1; AJvYcCX1JEWP+WgykuXei2i1Nrbh+jWzwV3Z994o450E6dsm/yO77FKilU52Iy6TJ8pm6RAJ18XF6xD2BV/Hmg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxUbpkH7HidXOz4BGDQIQaZQModLCtOxpM3HFrhvlsBYuShCtF6
	i9ZG++9L6xYKvcMjt8Wjb6RDs52CioPPoz/8b+fm6W1Js80cuk2OjGMVkQXHoIeGfzY=
X-Gm-Gg: ASbGncts5ONV+B1Rbw3ghN0fC+a4srTXYre2tixtv8vqY+DoK0z2cFR75wkXmdyKynx
	BneP+oQRXrLQmCXhs9AGvdUVw1+DTNMZ2ZS0FjvLD0xD1t3dSKYuMseEd23IrETTZHmSU6j3JY2
	E7YSqE3565CTBd5OXD6SS3T9PSnolJpFpFVBE65GX9x2n2+oxj6F6KN5YeuG32ux0GYHnRzMLcV
	VbvSQ/u3qVQJLKuc8XblE1/ZfstiqQJnsD6BTku9lHMut4sZOpVR/O+Zb9PvNIpurXO4C+OMaiw
	qTElgVU2j33zz10ZHgTeG3a01peji6eZaTf7qubATDWPg+DpJopTmLx41wXSQArc2O3k8LtC3a7
	uAEnjsJQiFidkUtL4Zz7Ct+pSEWakMUDuTuv493+UUlCwm2Ir5tY21TklwDHTICPYhkKLmeLwsN
	hO38XeGI4VtBQNtxpLPZE9ykSWd/EaAYSnhrth+nBvMvV1m0YC4QNFC4RueQs1
X-Google-Smtp-Source: AGHT+IFGKqdRJLV9RQOyvs5MvCac0JQUqvPl4j+mCywXmiQhs/UBqawUJsZSrZzGsMyRTHumxUBE2g==
X-Received: by 2002:a05:6638:4b8b:b0:5b7:1ebd:4d11 with SMTP id 8926c6da1cb9f-5b7c9c45d2bmr9122365173.3.1763399564687;
        Mon, 17 Nov 2025 09:12:44 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5b7bd24d5e9sm4708226173.3.2025.11.17.09.12.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 09:12:44 -0800 (PST)
Message-ID: <b9769b9f-cbc4-459f-911e-f29f848b6ce7@riscstar.com>
Date: Mon, 17 Nov 2025 11:12:41 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/7] Introduce SpacemiT K1 PCIe phy and host controller
To: Jason Montleon <jmontleo@redhat.com>
Cc: dlan@gentoo.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, vkoul@kernel.org, kishon@kernel.org,
 bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
 mani@kernel.org, ziyao@disroot.org, aurelien@aurel32.net,
 johannes@erdfelt.com, mayank.rana@oss.qualcomm.com,
 qiang.yu@oss.qualcomm.com, shradha.t@samsung.com, inochiama@gmail.com,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 p.zabel@pengutronix.de, christian.bruel@foss.st.com,
 thippeswamy.havalige@amd.com, krishna.chundru@oss.qualcomm.com,
 guodong@riscstar.com, devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-phy@lists.infradead.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251113214540.2623070-1-elder@riscstar.com>
 <CAJD_bP+AjhNCB6kCeKdnXERjP9j8dhbCejnS1OVmFf_VShti5Q@mail.gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <CAJD_bP+AjhNCB6kCeKdnXERjP9j8dhbCejnS1OVmFf_VShti5Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_091246_391473_8655C23E 
X-CRM114-Status: GOOD (  15.94  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTEvMTQvMjUgMTA6MjEgUE0sIEphc29uIE1vbnRsZW9uIHdyb3RlOgo+IE9uIFRodSwgTm92
IDEzLCAyMDI1IGF0IDQ6NDXigK9QTSBBbGV4IEVsZGVyIDxlbGRlckByaXNjc3Rhci5jb20+IHdy
b3RlOgo+Pgo+PiBUaGlzIHNlcmllcyBpbnRyb2R1Y2VzIGEgUEhZIGRyaXZlciBhbmQgYSBQQ0ll
IGRyaXZlciB0byBzdXBwb3J0IFBDSWUKPj4gb24gdGhlIFNwYWNlbWlUIEsxIFNvQy4gIFRoZSBQ
Q0llIGltcGxlbWVudGF0aW9uIGlzIGRlcml2ZWQgZnJvbSBhCj4+IFN5bm9wc3lzIERlc2lnbldh
cmUgUENJZSBJUC4gIFRoZSBQSFkgZHJpdmVyIHN1cHBvcnRzIG9uZSBjb21iaW5hdGlvbgo+PiBQ
Q0llL1VTQiBQSFkgYXMgd2VsbCBhcyB0d28gUENJZS1vbmx5IFBIWXMuICBUaGUgY29tYm8gUEhZ
IHBvcnQgdXNlcwo+PiBvbmUgUENJZSBsYW5lLCBhbmQgdGhlIG90aGVyIHR3byBwb3J0cyBlYWNo
IGhhdmUgdHdvIGxhbmVzLiAgQWxsIFBDSWUKPj4gcG9ydHMgb3BlcmF0ZSBhdCA1IEdUL3NlY29u
ZC4KPj4KPj4gVGhlIFBDSWUgUEhZcyBtdXN0IGJlIGNvbmZpZ3VyZWQgdXNpbmcgYSB2YWx1ZSB0
aGF0IGNhbiBvbmx5IGJlCj4+IGRldGVybWluZWQgdXNpbmcgdGhlIGNvbWJvIFBIWSwgb3BlcmF0
aW5nIGluIFBDSWUgbW9kZS4gIFRvIGFsbG93Cj4+IHRoYXQgUEhZIHRvIGJlIHVzZWQgZm9yIFVT
QiwgdGhlIG5lZWRlZCBjYWxpYnJhdGlvbiBzdGVwIGlzIHBlcmZvcm1lZAo+PiBieSB0aGUgUEhZ
IGRyaXZlciBhdXRvbWF0aWNhbGx5IGF0IHByb2JlIHRpbWUuICBPbmNlIHRoaXMgc3RlcCBpcyBk
b25lLAo+PiB0aGUgUEhZIGNhbiBiZSB1c2VkIGZvciBlaXRoZXIgUENJZSBvciBVU0IuCj4+Cj4+
IFRoZSBkcml2ZXIgc3VwcG9ydHMgMjU2IE1TSXMsIGFuZCBpbml0aWFsbHkgZG9lcyBub3Qgc3Vw
cG9ydCBQQ0kgSU5UeAo+PiBpbnRlcnJ1cHRzLiAgVGhlIGhhcmR3YXJlIGRvZXMgbm90IHN1cHBv
cnQgTVNJLVguCj4+Cj4+IFZlcnNpb24gNiBvZiB0aGlzIHNlcmllcyBhZGRyZXNzZXMgYSBmZXcg
Y29tbWVudHMgZnJvbSBDaHJpc3RvcGhlCj4+IEphaWxsZXQsIGFuZCBpbXByb3ZlcyBhIHdvcmth
cm91bmQgdGhhdCBkaXNhYmxlcyBBU1BNIEwxLiAgVGhlIHR3bwo+PiBwZW9wbGUgd2hvIGhhZCBy
ZXBvcnRlZCBlcnJvcnMgb24gZWFybGllciB2ZXJzaW9ucyBvZiB0aGlzIGNvZGUgaGF2ZQo+PiBj
b25maXJtZWQgdGhlaXIgTlZNZSBkZXZpY2VzIG5vdyB3b3JrIHdoZW4gY29uZmlndXJlZCB3aXRo
IHRoZSBkZWZhdWx0Cj4+IFJJU0MtViBrZXJuZWwgY29uZmlndXJhdGlvbi4KPiAKPiBJIHN1Y2Nl
c3NmdWxseSB0ZXN0ZWQgdGhpcyBwYXRjaHNldCBvbiBhIEJhbmFuYSBQaSBGMyBhbmQgYWxzbyBh
Cj4gTWlsay1WIE0xIEp1cGl0ZXIgYnkgbWFraW5nIHRoZSBzYW1lIGFkZGl0aW9ucyB0byBrMS1t
aWxrdi1qdXBpdGVyLmR0cwo+IGFzIHdlcmUgbWFkZSB0byBrMS1iYW5hbmFwaS1mMy5kdHMuCj4g
SSBubyBsb25nZXIgaGF2ZSBwcm9ibGVtcyB3aXRoIE5WTUUgZGV2aWNlcyBsaWtlIEkgZGlkIHdo
ZW4gSSB0cmllZCB2MyBhbmQgdjQuCj4gCj4gVGVzdGVkLWJ5OiBKYXNvbiBNb250bGVvbiA8am1v
bnRsZW9AcmVkaGF0LmNvbT4KClRoYW5rIHlvdSB2ZXJ5IG11Y2ggZm9yIHRlc3RpbmcgdGhpcy4g
IFlvdXIgVGVzdGVkLWJ5IGlzIGluY2x1ZGVkCmluIE1hbmkncyBjb21taXQuCgoJCQkJCS1BbGV4
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
