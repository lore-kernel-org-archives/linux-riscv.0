Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10E1CCCF9EA
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 22:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fX1EmxwT0TGbunVONHTep4/3G1PQYbtdx9mh64J4e9U=; b=47i6uUebs8sUuz
	p7DVEm6mlfxNG3LokR5HjKrDTV1RMdc+GGIlW+vO1oDDlCxe4x5Xr10iMmbc4e5tcOhc6OPt/Ua3m
	ayT8Gs7CAaQjMiuJYuk5zMYGEsg5ZqJNlJYKQfRhuGZF3oqvA/+8jw0Lq7kY/sr8j/fb6AZntMtlr
	XPht6jYTY5jwMZw/cZEs3HOZEzH+u7iZgddlBBaG41UGoDrG6tiTl5l3bokIf3stLs2TkYuYPWuKe
	vX97jxA8VF0gOUl26ftUNPFkrREAw10ZxV9Zgvr3UQwVIRmOuIdpsGdbmGzW3jhuR5Ge7woxCIsPk
	nArfWNSShHhndsFQkUmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDsDR-0000000GkDU-1gzL;
	Tue, 28 Oct 2025 22:30:57 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDsDP-0000000GkCA-1a90
	for linux-riscv@lists.infradead.org;
	Tue, 28 Oct 2025 22:30:56 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4770e7062b5so23388885e9.2
        for <linux-riscv@lists.infradead.org>; Tue, 28 Oct 2025 15:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761690653; x=1762295453; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w7MYXT8RdCoSxz7Hgl9+a32CaifYT+zfGLvjG0fFD9Q=;
        b=IbSPzZ6pFpHxuyRHIjk4C/RAbGRNMVKSmIXA/Sgr/EwwxPTGx3ALoryRElSHG8NGA6
         3Tal/oOxnu9tkXDLRenRFaIWtLz4EF0YiK2hEvJ5zXO6cr2oitAG7xzC7D9bk3okQdty
         MiU9Q/0esE07r8jotSft3UkBg8+elQE9XRz3+CN8YZhJUU4KeGq4SO8cHOPhWprd0L0p
         SNIrEuVvTCS6uTIvA+B822idFxaH0cGSu8586XmLEps24Xv8T/iN4BHcz/WwVLkQtI29
         DgSXqdaqK6DrpjmNCQ8PPvVpxwQ1ra+KhEo/UmKc0ybSHFGs/IIxISYDD6Zz9OCXBCBX
         yQ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761690653; x=1762295453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w7MYXT8RdCoSxz7Hgl9+a32CaifYT+zfGLvjG0fFD9Q=;
        b=pz4w+pc/gxrI+84T6QjACnlq7AcnxMUgC8XG2vHm6w5tKN/Bf3RV3JNP0+8CxDeQSS
         bob+NYNwfASXF8POyTCHCPwmJ4OpoxdgPJZcATlt53oI4MqyVBW9A4GRjf2JeFwLp3RF
         VvWPg0bj2Sx6f74HX8l4vP3XxCuNrFNUWxTOSbhSd13yY3XOk8Y2fU+bzxHduP+FMGIr
         ZdbevmvJRnRLwFQxBvJvAYbnHFkG+x5sy8JCgf3+SC0zZm7yAvu6FLQJMgTWRj0KYi51
         RLnneUCWIJe7PC/ncIhRDMookvaUr7npK/YHeGRoTUgdxP80tVa7QNZC0INtuASRemba
         Rddw==
X-Forwarded-Encrypted: i=1; AJvYcCVd4kxeF+GD0S0p1y7moLSniXIC/LW+KZmvSJBa6BVX7QaE+NYBCJqCVLIJBhuuKjKafDd9TYbbyTZYsg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwOiOOBwgAKDabimelKwBqMLAHvV9Lv6Y1mbKNkZ2KlTVte0uAN
	qKp30C4nkGkOJb400e8tncwAz/xlA19luE7DEw8tMgsUzK5qNx7rKYvm
X-Gm-Gg: ASbGncttZV8V7DPLl8/mLDzwJ8ViB8J0b6OVPp/CvzOwY05unborg4zdUjF8ZP4p8mC
	Gmp3Y/O+saeH1cUM7OiK6+2W8RPYcAMXKolmtrT9zdZZtHoFO9LyZNUPEYn3bLx4ijJOyc4Oyaw
	HEYxc0hz1tj5rEvDQjwLcEJYCou0xcNOXI4yJPJJxh+pQjE4h+uYTWgTqWa2WuWzPnFQ94pAnFD
	lwJlHg3BW7RQfqTDxara/Um/F6IF44++wOCx6fxhgFd5ScGOeW7KP1Q1ZNk+C/V5UxfpwYcrfB/
	nFmGtG5CRh3UAKFFD3DXvNhLzegxUqltg0BTFnTkHEdVAFO6FhMNRi+kAsCeq+E+DUhqyhi1Y7L
	zpDyBPoPTkpgFEqJy1wFOmOiEGkn73UVxIPBziaBGWW8kzgF/AdGbRpHXRHvb2XtBUDUVTLkEDB
	Bxv0tQoZ99APFU+Zv5SPSKQOlgU909u5W4KDLKcMhJzVX2CiNan9Kv
X-Google-Smtp-Source: AGHT+IGr3MaQmjLDcnechwHoyti0ltwYCF5fdXDSzbiJBdxMc2AUsas+y5bOu1/39BNyQHtZcenqXg==
X-Received: by 2002:a05:600c:474f:b0:477:df3:1453 with SMTP id 5b1f17b1804b1-4771e1ed170mr10187095e9.28.1761690652951;
        Tue, 28 Oct 2025 15:30:52 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771e3b7cb9sm16032815e9.15.2025.10.28.15.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 15:30:52 -0700 (PDT)
Date: Tue, 28 Oct 2025 22:30:50 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: dave.hansen@intel.com, alex@ghiti.fr, aou@eecs.berkeley.edu,
 axboe@kernel.dk, bp@alien8.de, brauner@kernel.org, catalin.marinas@arm.com,
 christophe.leroy@csgroup.eu, dave.hansen@linux.intel.com,
 edumazet@google.com, hpa@zytor.com, kuni1840@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 maddy@linux.ibm.com, mingo@redhat.com, mpe@ellerman.id.au,
 npiggin@gmail.com, palmer@dabbelt.com, pjw@kernel.org, tglx@linutronix.de,
 torvalds@linux-foundation.org, will@kernel.org, x86@kernel.org
Subject: Re: [PATCH v1 2/2] epoll: Use __user_write_access_begin() and
 unsafe_put_user() in epoll_put_uevent().
Message-ID: <20251028223050.3e3ce110@pumpkin>
In-Reply-To: <CAAVpQUARk-XeMdTeGy_s65sdwuLY2RzocGyJ=2_WkhsrFN-bUw@mail.gmail.com>
References: <ea7552f1-842c-4bb8-b19e-0410bf18c305@intel.com>
	<20251028053330.2391078-1-kuniyu@google.com>
	<20251028095407.2bb53f85@pumpkin>
	<CAAVpQUARk-XeMdTeGy_s65sdwuLY2RzocGyJ=2_WkhsrFN-bUw@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_153055_423969_DD896334 
X-CRM114-Status: GOOD (  16.94  )
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

T24gVHVlLCAyOCBPY3QgMjAyNSAwOTo0MjoyNSAtMDcwMApLdW5peXVraSBJd2FzaGltYSA8a3Vu
aXl1QGdvb2dsZS5jb20+IHdyb3RlOgoKPiBPbiBUdWUsIE9jdCAyOCwgMjAyNSBhdCAyOjU04oCv
QU0gRGF2aWQgTGFpZ2h0Cj4gPGRhdmlkLmxhaWdodC5saW51eEBnbWFpbC5jb20+IHdyb3RlOgo+
ID4KPiA+IE9uIFR1ZSwgMjggT2N0IDIwMjUgMDU6MzI6MTMgKzAwMDAKPiA+IEt1bml5dWtpIEl3
YXNoaW1hIDxrdW5peXVAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4gPgo+ID4gLi4uLiAgCj4gPiA+IEkg
cmViYXNlZCBvbiAxOWFiMGEyMmVmYmQgYW5kIHRlc3RlZCA0IHZlcnNpb25zIG9uCj4gPiA+IEFN
RCBFUFlDIDdCMTIgbWFjaGluZTogIAo+ID4KPiA+IFRoYXQgaXMgemVuNSB3aGljaCBJIGJlbGll
dmUgaGFzIG11Y2ggZmFzdGVyIGNsYWMvc3RhYyB0aGFuIGFueXRoaW5nIGVsc2UuCj4gPiAoSXQg
bWlnaHQgYWxzbyBoYXZlIGEgZmFzdGVyIGxmZW5jZSAtIG5vdCBzdXJlLikgIAo+IAo+IFRoaXMg
aXMgdGhlIFplbiAyIHBsYXRmb3JtLCBzbyBwcm9iYWJseSB0aGUgc3RhYy9jbGFjIGNvc3Qgd2ls
bCBiZQo+IG1vcmUgZXhwZW5zaXZlIHRoYW4geW91IGV4cGVjdCBvbiBaZW4gNS4KCkkgbXVzdCBo
YXMgbG9va2VkIHRoZSBjcHUgdHlwZSBpbmNvcnJlY3RseS4KQU1EIGhhdmVuJ3QgbWFkZSBpdCBl
YXN5IHdvcmtpbmcgb3V0IHRoZSBjcHUgYXJjaGl0ZWN0dXJlLgpJIG5lZWQgdG8gZ2V0IGFuIG9s
ZGVyIHplbiBjcHUgZm9yIG15IHNldCBvZiB0ZXN0IHN5c3RlbXMKKGFuZCBzb21lIG5ld2VyIElu
dGVsIG9uZXMpLgoKPiA+IEdldHRpbmcgYSAzJSBjaGFuZ2UgZm9yIHRoYXQgZGlmZiBhbHNvIHNl
ZW1zIHVubGlrZWx5Lgo+ID4gRXZlbiBpZiB5b3UgaGFsdmVkIHRoZSBleGVjdXRpb24gdGltZSBv
ZiB0aGF0IGNvZGUgdGhlIHN5c3RlbSB3b3VsZCBoYXZlCj4gPiB0byBiZSBzcGVuZGluZyA2JSBv
ZiB0aGUgdGltZSBpbiB0aGF0IGxvb3AuCj4gPiBFdmVuIHlvdXIgb3JpZ2luYWwgcG9zdCBvbmx5
IHNob3dzIDElIGluIGVwX3RyeV9zZW5kX2V2ZW50cygpLgoKSSByZWFsaXNlZCBhZnRlciB0aGF0
IHlvdSBtaWdodCBiZSBzaG93aW5nIGEgMyUgY2hhbmdlIGluIHRoYXQgMSUuCj4gCj4gV2Ugc2F3
IGEgc2ltaWxhciBpbXByb3ZlbWVudCBvbiB0aGUgc2FtZSBwbGF0Zm9ybSBieQo+IDFmYjBlNDcx
NjExZCAoIm5ldDogcmVtb3ZlIG9uZSBzdGFjL2NsYWMgcGFpciBmcm9tCj4gbW92ZV9hZGRyX3Rv
X3VzZXIoKSIpLgoKQ2VydGFpbmx5IHJlbW92aW5nIG9uZSBjb3VsZCBlYXNpbHkgYmUgbWVhc3Vy
YWJsZS4KCglEYXZpZAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
