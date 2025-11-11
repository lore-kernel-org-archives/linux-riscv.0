Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2124FCCF9E3
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Nov 2025 07:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c/vWAgbb40dkv5Gc0rGrUO2fQbixCVF5TR5BBetq2mE=; b=nxphls4cdfQzud
	x7e+1Qu67TXDe8uFgosQ9Mk/iWrThLM6iMmVQ9BBqoPkSZBUfh+x7hfEBJebakinsYneD+MzrYtSw
	wew8XoroHK0+WxLY9nC2GreKUGcE65H2dYLjzsJw0bRbe+A4OovJVHqd5GUX9XQKepINNQbL5U5s5
	1Trz8IB8moAHgd0ae+JQLGFuTMgJGuj1sMtwdkjcFJIbTXezRQtZoai+SjJyzJstX0DBHRIUhbH1B
	ZVgoihVF+NwAg2bacS+VnAeSallEhopIz+C3yopth9Tj4yeRhuugwS/jqp0hpsL1EU4sNbUmlsERt
	GDZ/iKVSYv7nEG3Rf2uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIibN-00000006far-2WMl;
	Tue, 11 Nov 2025 07:15:41 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIibK-00000006fYd-44NT
	for linux-riscv@lists.infradead.org;
	Tue, 11 Nov 2025 07:15:40 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-3c73e93eadfso1298666fac.3
        for <linux-riscv@lists.infradead.org>; Mon, 10 Nov 2025 23:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1762845333; x=1763450133; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dGMbS3VEvjhgNpVe1MttoJ7jTkjbM/PBhlD1Dx+012U=;
        b=LXlciulrI3V7A19/4wSpt9nQ/6XmznBSTMH/IKD2Q81Pj2txnVBbSM60yxzqwDP5HD
         fGHmhH3u85MUlXKLoraYWJrPqmIEFmaSipJDGeA73vbnxyDXnHXeoGEMQoGGXomx6BJr
         wOTMbbFb4YeqRmsNVbqRWSjndiw66kJjfIjwm0ve6b8OCyZFjhRU4+zEALBB0djDgSb0
         O0jz3WnOO4Ectf/kJBJopDcl1U4smvOJa2n7HKKe6I87RUbhlEezsZg9UlHrG4+JVX4K
         OAF9NVFk/gNyGo8sCI9doognf4fnO7AhPcpsB0CSi+ZBiiG0SdhCxa/tcKXgCSrr314R
         goJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762845333; x=1763450133;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dGMbS3VEvjhgNpVe1MttoJ7jTkjbM/PBhlD1Dx+012U=;
        b=RjyRjN0VBW0xje+lfGrNWTt0IOvsed/xcNpc8+h9m8HUTcGB+I+n141QBRF58adNFK
         Rk7FLLVNT/0f57GbFfgwvir8STfTPx6zenQECnbh+3WPA+05XE0DKy01ukMIks9bfi8X
         se+v9HIduvC7qW2w3vW/R9yJLOadzSHWUwnPvgUlr8SHLyJTTBEFcfh9xtQp9hWC9X/J
         Pw3R45bWYJ39bwr1tN8Jip22DnOBRcvvgiBOgDYA237InYcK4K4E//v9D/O62hAZ18j+
         rjEpOPoSArVmBWGCVMRJ2JcEB5DW0qSJL2ffubm+DKr61Dw55f9JJ7ns6b2jHz7Hyehi
         WuUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMXHS/8uOBx7FX3DGPRCPeLFpzP66g050lLn4JbqqZ7B3l301GuJcPfn229zOc865rJwn1cVyGSYzkog==@lists.infradead.org
X-Gm-Message-State: AOJu0YzE5+e6aOHxYjW4qj1lJdw6MRYFU7XGLu//jiePt6mXQ3RKYNA9
	4Sy1bvI8Rr1Mes+lHhtgUy1Ffs9I5O4DrBQEA/FWKmS/0WwWBh2yHGq6u1rLjCT3nWGzmKmuR1D
	4Xtn3MvsFOxKL2bl093xL3sOIJTRGEn3aA2XJeWtiCw==
X-Gm-Gg: ASbGncvyu+ST2ix8p1Ev+CZkiAjC8wxR5ivLpf53rAcc0GVg1wLCPLWAyY54PWjVvd7
	MRsAZp0Kj1ora0ibg1sT5Fj9DonyZkFi702tO5ml7dfBG0qrRjti0JWJ5Yh7NJ2vr71sltuiS0h
	p5brZbXfZBbLrH2jNugAUQlcIFghwA6G3E+vAH88zAwu+PDaAWH0GTuCKHTHjh3Ecd9bKXFQw6w
	roMA04914Cz7i0DUdZEuYOFhmpj4f4/y4Xy31XL3OHbOvHYbD7Sa8N7FgDDc3kKyz7MRf/eiQ==
X-Google-Smtp-Source: AGHT+IHWbJ4Yp3gQoh0gR8ti6hW2JnDfbC3dn3VOEzDDEL8ykj+19tubGTkAQQf4eOHdb+UN2vP0PrZVV2xFeQuhHI4=
X-Received: by 2002:a05:6808:15a6:b0:44d:badf:f41a with SMTP id
 5614622812f47-4502a2df5d2mr5427044b6e.32.1762845333082; Mon, 10 Nov 2025
 23:15:33 -0800 (PST)
MIME-Version: 1.0
References: <20251014031425.93284-1-cuiyunhui@bytedance.com>
 <20251014031425.93284-2-cuiyunhui@bytedance.com> <aQixsIQXTjYyhRVj@willie-the-truck>
 <CAEEQ3wk5Ru4-=4Ecnc6kQAAbR57806xxYTz0o1z4KfgZE6Cg6w@mail.gmail.com> <aQ3v15yrm9JaWgrm@willie-the-truck>
In-Reply-To: <aQ3v15yrm9JaWgrm@willie-the-truck>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Tue, 11 Nov 2025 15:15:21 +0800
X-Gm-Features: AWmQ_bnoZJigBSCLU3lJje6heEEH-Frt6iL4puU2iLrcXPWUx0zHPoaDlQHxw1Y
Message-ID: <CAEEQ3wnC-xGZ_m4+vJ42KzU4DdQb1CGfZh_=Nz5wkFuXKS7Y3w@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v4 1/2] watchdog: move arm64 watchdog_hld
 into common code
To: Will Deacon <will@kernel.org>
Cc: akpm@linux-foundation.org, alex@ghiti.fr, anup@brainfault.org, 
	aou@eecs.berkeley.edu, atish.patra@linux.dev, catalin.marinas@arm.com, 
	dianders@chromium.org, johannes@sipsolutions.net, lihuafei1@huawei.com, 
	mark.rutland@arm.com, masahiroy@kernel.org, maz@kernel.org, mingo@kernel.org, 
	nicolas.schier@linux.dev, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	suzuki.poulose@arm.com, thorsten.blum@linux.dev, wangjinchao600@gmail.com, 
	yangyicong@hisilicon.com, zhanjie9@hisilicon.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_231539_006187_235A1389 
X-CRM114-Status: GOOD (  22.33  )
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

SGkgV2lsbCwKCk9uIEZyaSwgTm92IDcsIDIwMjUgYXQgOToxMeKAr1BNIFdpbGwgRGVhY29uIDx3
aWxsQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gRnJpLCBOb3YgMDcsIDIwMjUgYXQgMTA6NDI6
MjVBTSArMDgwMCwgeXVuaHVpIGN1aSB3cm90ZToKPiA+IE9uIE1vbiwgTm92IDMsIDIwMjUgYXQg
OTo0NOKAr1BNIFdpbGwgRGVhY29uIDx3aWxsQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPgo+ID4g
PiBPbiBUdWUsIE9jdCAxNCwgMjAyNSBhdCAxMToxNDoyNEFNICswODAwLCBZdW5odWkgQ3VpIHdy
b3RlOgo+ID4gPiA+IEBAIC0zMDYsMyArMzA3LDg1IEBAIHZvaWQgX19pbml0IGhhcmRsb2NrdXBf
Y29uZmlnX3BlcmZfZXZlbnQoY29uc3QgY2hhciAqc3RyKQo+ID4gPiA+ICAgICAgIHdkX2h3X2F0
dHIudHlwZSA9IFBFUkZfVFlQRV9SQVc7Cj4gPiA+ID4gICAgICAgd2RfaHdfYXR0ci5jb25maWcg
PSBjb25maWc7Cj4gPiA+ID4gIH0KPiA+ID4gPiArCj4gPiA+ID4gKyNpZmRlZiBDT05GSUdfV0FU
Q0hET0dfUEVSRl9BREpVU1RfUEVSSU9ECj4gPiA+ID4gKy8qCj4gPiA+ID4gKyAqIFNhZmUgbWF4
aW11bSBDUFUgZnJlcXVlbmN5IGluIGNhc2UgYSBwYXJ0aWN1bGFyIHBsYXRmb3JtIGRvZXNuJ3Qg
aW1wbGVtZW50Cj4gPiA+ID4gKyAqIGNwdWZyZXEgZHJpdmVyLiBBbHRob3VnaCwgYXJjaGl0ZWN0
dXJlIGRvZXNuJ3QgcHV0IGFueSByZXN0cmljdGlvbnMgb24KPiA+ID4gPiArICogbWF4aW11bSBm
cmVxdWVuY3kgYnV0IDUgR0h6IHNlZW1zIHRvIGJlIHNhZmUgbWF4aW11bSBnaXZlbiB0aGUgYXZh
aWxhYmxlCj4gPiA+ID4gKyAqIENQVXMgaW4gdGhlIG1hcmtldCB3aGljaCBhcmUgY2xvY2tlZCBt
dWNoIGxlc3MgdGhhbiA1IEdIei4gT24gdGhlIG90aGVyCj4gPiA+ID4gKyAqIGhhbmQsIHdlIGNh
bid0IG1ha2UgaXQgbXVjaCBoaWdoZXIgYXMgaXQgd291bGQgbGVhZCB0byBhIGxhcmdlIGhhcmQt
bG9ja3VwCj4gPiA+ID4gKyAqIGRldGVjdGlvbiB0aW1lb3V0IG9uIHBhcnRzIHdoaWNoIGFyZSBy
dW5uaW5nIHNsb3dlciAoZWcuIDFHSHogb24KPiA+ID4gPiArICogRGV2ZWxvcGVyYm94KSBhbmQg
ZG9lc24ndCBwb3NzZXNzIGEgY3B1ZnJlcSBkcml2ZXIuCj4gPiA+ID4gKyAqLwo+ID4gPiA+ICsj
ZGVmaW5lIFNBRkVfTUFYX0NQVV9GUkVRICAgIDUwMDAwMDAwMDBVTCAvLyA1IEdIego+ID4gPiA+
ICtfX3dlYWsgdTY0IGh3X25taV9nZXRfc2FtcGxlX3BlcmlvZChpbnQgd2F0Y2hkb2dfdGhyZXNo
KQo+ID4gPiA+ICt7Cj4gPiA+ID4gKyAgICAgdW5zaWduZWQgaW50IGNwdSA9IHNtcF9wcm9jZXNz
b3JfaWQoKTsKPiA+ID4gPiArICAgICB1bnNpZ25lZCBsb25nIG1heF9jcHVfZnJlcTsKPiA+ID4g
PiArCj4gPiA+ID4gKyAgICAgbWF4X2NwdV9mcmVxID0gY3B1ZnJlcV9nZXRfaHdfbWF4X2ZyZXEo
Y3B1KSAqIDEwMDBVTDsKPiA+ID4gPiArICAgICBpZiAoIW1heF9jcHVfZnJlcSkKPiA+ID4gPiAr
ICAgICAgICAgICAgIG1heF9jcHVfZnJlcSA9IFNBRkVfTUFYX0NQVV9GUkVROwo+ID4gPiA+ICsK
PiA+ID4gPiArICAgICByZXR1cm4gKHU2NCltYXhfY3B1X2ZyZXEgKiB3YXRjaGRvZ190aHJlc2g7
Cj4gPiA+ID4gK30KPiA+ID4KPiA+ID4gV2h5IGRvZXMgdGhpcyBmdW5jdGlvbiBiZWNvbWUgX193
ZWFrPyBOZWl0aGVyIGFybTY0IG5vciByaXNjdiBvdmVycmlkZQo+ID4gPiBpdCBhZmFpY3QuCj4g
Pgo+ID4gV291bGQgeW91IHNheSB0aGVyZeKAmXMgYW55IHBhcnRpY3VsYXIgaXNzdWUgaGVyZT8g
SWYgc29tZSBhcmNoaXRlY3R1cmVzCj4gPiBtaWdodCBuZWVkIHRvIG92ZXJyaWRlIHRoZSBod19u
bWlfZ2V0X3NhbXBsZV9wZXJpb2QoKSBmdW5jdGlvbiBsYXRlcgo+ID4gb24sIHdvdWxkbuKAmXQg
X193ZWFrIGJlIGEgbW9yZSByZWFzb25hYmxlIGNob2ljZT8KPgo+IF9fd2VhayBpcyBwcmV0dHkg
YnJpdHRsZSAoaXQgY2FuIGRlcGVuZCBvbiBsaW5rIG9yZGVyIGlmIHlvdSBoYXZlIG11bHRpcGxl
Cj4gdGFyZ2V0cykgYW5kIEkgc3VzcGVjdCBpdCBwcmV2ZW50cyBpbmxpbmluZyB3aGVuIExUTyBp
c24ndCBlbmFibGVkLiBJdCdzCj4gY2xlYW5lciBhbmQgbW9yZSByb2J1c3QgZm9yIGFyY2hpdGVj
dHVyZXMgdG8gcHJvdmlkZSB0aGVpciBob29rcyBieQo+ICNkZWZpbmluZyB0aGUgc3ltYm9sLCBh
cyBpcyBkb25lIGNvbW1vbmx5IGluIG90aGVyIHBhcnRzIG9mIHRoZSBrZXJuZWwuCj4KPiBCdXQg
aW4gdGhpcyBwYXJ0aWN1bGFyIGNhc2UsIGl0J3MgY29tcGxldGVseSB1bm5lY2Vzc2FyeSBiZWNh
dXNlIHRoZXJlCj4gaXNuJ3QgYW4gYXJjaGl0ZWN0dXJhbCBvdmVycmlkZSBhbmQgc28gdGhpcyBm
dW5jdGlvbiBzaG91bGQgc2ltcGx5IGJlCj4gc3RhdGljLgoKU2luY2UgdGhlIGZ1bmN0aW9uIGlz
IGRlY2xhcmVkIGFzIHU2NCBod19ubWlfZ2V0X3NhbXBsZV9wZXJpb2QoaW50CndhdGNoZG9nX3Ro
cmVzaCkgaW4gbm1pLmgsIGl0IGNhbm5vdCBiZSBzdGF0aWMuCkkgd2lsbCByZW1vdmUgdGhlIF9f
d2VhayBtb2RpZmllciBpbiB0aGUgbmV4dCB2ZXJzaW9uLgoKPgo+IFdpbGwKClRoYW5rcywKWXVu
aHVpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
