Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BCD9EB64DC
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 21:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tmyR5dOwt/kWciuKT7jAzC3PN31DSrBsficTPW6VM7U=; b=FrchEIXwv06zkS
	cO0H/j62R8ISX0WPnFqvOzSYXkHX3Qeuiz5fFCqdThprSb2y3jb2bNRF+wp5mw2TBntRugZR4nUPr
	XuazNDefP/n1QeBkP2PclGHX45wLeSoU6e60CXPdhH5xUU3wrUYlx8pSqske9stInUlO1suNhMUBo
	GYCf+mw288+IK0RL1elV01/gZhzcx0XTKmEfgsogEKgVDNFSJzfsEGWQ0X/ofVCqUPb5IIgDFIAt5
	KmxrGgiUafB9Jd7IZle+bT6Xs9K41+d8CqRtUQYF2TPTL61FobSxuuzMIPW842TIbe0uO0ajQ9m68
	NznVHgzu4unNtwz3xwuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGRAW-00BTOy-1T;
	Mon, 03 Jul 2023 21:33:12 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGRAT-00BTO0-0h
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jul 2023 21:33:10 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3142a9ff6d8so3150384f8f.3
        for <linux-riscv@lists.infradead.org>; Mon, 03 Jul 2023 14:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1688419985; x=1691011985;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TASmMtwbIxli+7tWQRTe5fwYmq+zTlIZOGDtWB8DCS0=;
        b=l1wXjViWZSqHEh9r5oKxB8DvxzfYszlgbDyL13NyKKF90rVqdiYyFreFicbzkDYKGW
         XhtvIUToeUwUaaEeLHC/KqKUeJLGPIL6yDER4bgrR+D1lpZf0RQPozyyP1MDsBRWMFud
         h9cEkO2gnI90QEOenTMHOjFIOcFO2gqIcvLNJt1u/BPkI6ad/0BioBVWsX2MIk973y2X
         8Gdm57L23aOj6o6Ki1X/9hE/oQC5vC8nCiUQbL0moBuNPGxvqxiz8MYPOiVmK+3y8n1M
         Qu6ueixORiydHkAlks+roRcKtFpUfE0ePcKGX5Wrk9u9flpU5eoroKrg7uuiJdGzSWR1
         YCXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688419985; x=1691011985;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TASmMtwbIxli+7tWQRTe5fwYmq+zTlIZOGDtWB8DCS0=;
        b=QFckh4AXpFnzQr/pv9/EAFPUOWzaDLYtpj4DeJByAmUtsw4RwxBINSpffNnBs8c4MK
         /E51Hq3gVkxeHKf3iWaq7DIu1P9IXDiz72+bC/xJt9JzdPBVDhlw6XfuYuqupV3Uqwnm
         7JMkOehURTE/qqAIZ3Bb8thYYLdKgpEGNS09/q2BUfOwbg5rEDUAg655DdljThwTJlqa
         +ZO7BqCGajEit4mzhPXVIIais43R4WiapRbR2eErXwLivfrnFOzukLbKgyPCZ8Hbnqf6
         xOpwGi1w0EjCDpwnGc4BPFxcfsyFSu+Pa9top1zPy/ANnG5nfNNy0iX/OS+y7Evu93gm
         z1ig==
X-Gm-Message-State: ABy/qLaJ6T3xbmZlzjT8tZ4no73KVM8Zj6fXWC1HBGWantCe6cnuN4sR
	b+M++DeKgHcqbG6gX5yO/3Dxtw==
X-Google-Smtp-Source: APBJJlGQauzJhuAE1TkruIBNvoTDpKBOgqo8SJRBTE/8BSHJTNS8sEowarihoPnaeK4kc7cjkMZiyw==
X-Received: by 2002:adf:e747:0:b0:314:2f5b:2ce with SMTP id c7-20020adfe747000000b003142f5b02cemr5724980wrn.12.1688419985132;
        Mon, 03 Jul 2023 14:33:05 -0700 (PDT)
Received: from smtpclient.apple ([131.111.5.246])
        by smtp.gmail.com with ESMTPSA id y9-20020a7bcd89000000b003fbb5506e54sm14610785wmj.29.2023.07.03.14.33.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Jul 2023 14:33:04 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.600.7\))
Subject: Re: [External] [PATCH v2 1/3] riscv: obtain ACPI RSDP from FFI.
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <CANBLGcwcvK55dZ1__wvWCtcw=XoKt=qki8g6C_QYo+TBqqJ=TA@mail.gmail.com>
Date: Mon, 3 Jul 2023 22:32:53 +0100
Cc: =?utf-8?B?6L+Q6L6J5bSU?= <cuiyunhui@bytedance.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Ard Biesheuvel <ardb@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 rminnich@gmail.com,
 Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Len Brown <lenb@kernel.org>,
 jdelvare@suse.com,
 yc.hung@mediatek.com,
 angelogioacchino.delregno@collabora.com,
 allen-kh.cheng@mediatek.com,
 pierre-louis.bossart@linux.intel.com,
 tinghan.shen@mediatek.com,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-acpi@vger.kernel.org,
 geshijian@bytedance.com,
 weidong.wd@bytedance.com
Message-Id: <50F3BD62-78F1-456E-A44A-0C7D9A2D4113@jrtc27.com>
References: <20230702095735.860-1-cuiyunhui@bytedance.com>
 <20230703-71f67eb66a037f5c0fb825c6@orel>
 <CAEEQ3w=7tBHyG=CvuktPN5cvfpY6ayamnbry6eOYxMDrPN+oZg@mail.gmail.com>
 <CANBLGcwcvK55dZ1__wvWCtcw=XoKt=qki8g6C_QYo+TBqqJ=TA@mail.gmail.com>
To: Emil Renner Berthing <emil.renner.berthing@gmail.com>
X-Mailer: Apple Mail (2.3731.600.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_143309_333183_E67B6976 
X-CRM114-Status: GOOD (  16.07  )
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

T24gMyBKdWwgMjAyMywgYXQgMTk6NTgsIEVtaWwgUmVubmVyIEJlcnRoaW5nIDxlbWlsLnJlbm5l
ci5iZXJ0aGluZ0BnbWFpbC5jb20+IHdyb3RlOgo+IAo+IE9uIE1vbiwgMyBKdWwgMjAyMyBhdCAx
NTozMywg6L+Q6L6J5bSUIDxjdWl5dW5odWlAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4+IAo+PiBI
aSBkcmV3LAo+PiAKPj4gT24gTW9uLCBKdWwgMywgMjAyMyBhdCA5OjAx4oCvUE0gQW5kcmV3IEpv
bmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4+PiAKPj4+IAo+Pj4gKFRoaXMg
aXMgYSByZXBseSB0byBhIG5vbi1leGlzdGVudCBjb3ZlciBsZXR0ZXIuKQo+PiAKPj4gVGhpcyBo
YXMgYmVlbiBkaXNjdXNzZWQgbWFueSB0aW1lcyB3aXRoIEFyZCwgUGxlYXNlIHJlZmVyIHRvIDoK
Pj4gaHR0cHM6Ly9wYXRjaGVzLmxpbmFyby5vcmcvcHJvamVjdC9saW51eC1hY3BpL3BhdGNoLzIw
MjMwNDI2MDM0MDAxLjE2LTEtY3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20vCj4gCj4gSGkgWXVuaHVp
LAo+IAo+IEZyb20gdGhhdCBkaXNjdXNzaW9uIGl0IHdhcyBtZW50aW9uZWQgdGhhdCB0aGF0IGFy
bSBzdXBwb3J0cyAzIG1ldGhvZHMKPiBvZiBib290aW5nOgo+ICBkaXJlY3QgKyBkZXZpY2V0cmVl
Cj4gIEVGSSArIGRldmljZXRyZWUKPiAgRUZJICsgQUNQSQo+IC4uYnV0IG5vdAo+ICBkaXJlY3Qg
KyBBQ1BJCj4gCj4gVG8gbWUgaXQgaXNuJ3Qgb2J2aW91cyBmcm9tIHRoYXQgb3IgdGhpcyB0aHJl
YWQsIGFuZCBzaW5jZSBhcm0gc2VlbXMKPiB0byBiZSBkb2luZyBmaW5lIHdpdGhvdXQgdGhlIDR0
aCBvcHRpb24gSSdtIGN1cmlvdXMgd2h5IHRoYXQncwo+IG5lY2Vzc2FyeSBvbiByaXNjdj8KCklm
IGFueXRoaW5nIHdlIHNob3VsZCBiZSByZW1vdmluZyBvcHRpb24gMSwgYmVjYXVzZSB0aGF04oCZ
cyBub3QgYQpjcm9zcy1PUyBzdGFuZGFyZCAodGhvdWdoIFJJU0MtVuKAmXMgU0JJIGRpcmVjdCBi
b290aW5nIGlzIGF0IGxlYXN0IG5vdAp0aWVkIHRvIHRoZSBPUykuIEFueSBhcHBsaWNhdGlvbi1j
bGFzcyBwbGF0Zm9ybSBzcGVjIGlzIGdvaW5nIHRvCm1hbmRhdGUgRUZJLCBiZWNhdXNlLCB3aGF0
ZXZlciB5b3VyIHRob3VnaHRzIG9mIEVGSSBhcmUsIHRoYXQgaXMgKnRoZSoKc3RhbmRhcmQuIEFu
ZCBpZiB5b3XigJlyZSB3aWxsaW5nIHRvIHBpY2sgdXAgYWxsIHRoZSBjb21wbGV4aXR5IG9mIEFD
UEksCndoYXTigJlzIGEgYml0IG9mIEVGSSAoZXNwZWNpYWxseSBpZiB5b3Ugb25seSBnbyBmb3Ig
YSBtaW5pbWFsIG9uZSBhIGxhClUtQm9vdCk/CgpKZXNzCgo+Pj4gSSdtIG5vdCBhIGJpZyBmYW4g
b2YgYWRkaW5nIHlldCBhbm90aGVyIGludGVyZmFjZS4gSGF2ZSB5b3UgY29uc2lkZXJlZAo+Pj4g
ZG9pbmcgc29tZXRoaW5nIGxpa2UgWzFdPwo+Pj4gCj4+PiBbMV0gaHR0cHM6Ly9naXRodWIuY29t
L3RpYW5vY29yZS90aWFub2NvcmUuZ2l0aHViLmlvL3dpa2kvVWVmaVBheWxvYWRQa2cKPiAKPiBB
bHNvIHlvdSBkaWRuJ3QgYW5zd2VyIHRoaXMgcXVlc3Rpb24sIHdoaWNoIEknZCBhbHNvIGxpa2Ug
dG8gaGVhciBhIHJlcGx5IHRvLgo+IAo+IC9FbWlsCj4gCj4+PiBUaGFua3MsCj4+PiBkcmV3Cj4+
IAo+PiBUaGFua3MsCj4+IFl1bmh1aQo+PiAKPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4+IGxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
