Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5592CCDB47E
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 14:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WET2IcjVyF8ObGY5B1TjzmnC/Y4yss6atgvhFxcc6CA=; b=pZY74aawuLKdyI
	/b2fln3S0faJHV+LbVNwpOjZ9ZafV1uux+u7dr4EZr2zaIoqvGIQaBtWqxO0IV8CPm3rz5ZI+vusB
	WgTyu60EZCIKxX/HBEgcYJk+HuZUxm4KJGR0iXUTTdWgFhPbru2sSCEh8G1BcQ7JDMGhzvTabfvDf
	D4iqqelMojetpVpdnG0juAIwEpCh8kLQwc+hMbyr71tdLlqtfI65+eyfphDF1MUuXSApzFtLMsrrq
	Yvf0uHChsl8n3Ph6JL7ihjvOU6PKlarR6ETT7SLxbvZlrVZdpMsoQXm8YKPhEM2flXNlisXjR6fbZ
	0nLOo32krioCsMjckm5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqwIw-0019A6-2J;
	Thu, 12 Oct 2023 14:04:46 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqwIt-00197m-2Y
	for linux-riscv@lists.infradead.org;
	Thu, 12 Oct 2023 14:04:45 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-69101d33315so830312b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 12 Oct 2023 07:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1697119479; x=1697724279; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q3ropCljelAQ4xMLZKutsQltAGHtknBuH4fIH4/voyA=;
        b=XV8aXtRX7Q3DMCpio+AYkR2xsH/QnBqnyYSeACAzhxjnF/fiQtU0DQYSXZGsyGuidE
         A9aTIjSjm1mCLKalorLNiT2DjgymN5AohkRkVy73CrK95s64ElLCEiqwOkt1fe5VLy1x
         xTR9IOpoET6VFMB7amuuN5Lc119CAgkI1jvuJIxEsIYRJU5skIjvffyTGqYJZXkge/wV
         wrDK5nXS6km1d4Ug4bESnQpFFkUZ+9c9InecW/gJ7sxWzssItjtI4YzywfsUhxwMBi2l
         Enkd7LvoqTC/rYon5+LF4PbLxXY7Dn6bKEZD1flAq4QzK0QvMfVptL2RLUuOABgFjTbq
         QBFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697119479; x=1697724279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q3ropCljelAQ4xMLZKutsQltAGHtknBuH4fIH4/voyA=;
        b=hQlyIHpYVQwBBNxpL/5X1N+7burA94xJ6iOL9xstTu9BnWgs10gjtxmtXj5wRyEV8I
         OT+dwfztVP1t1KbQ3fdNfCgCGE8pcplT4Ogbc5pZ5/eP7I7FUYmwwyPw/D3ElK1IxuLt
         RFRSPRdTCP2B+EOJzCdkP0k/vAmEwdz4g0AkPqYz67JSrpf9lRd0T/SgvrPC21zi4HsR
         3D8KS52S5NInWKVvTSD7WrK2AoNfu65aaF5DGL9KLkttwU0JLJJd9LjEE3chckBFXKzI
         7zELnft5q2w97M7C/3gukXyN0FqCqolE1PUlheWsJFi4MoSCxnqY1+ub3laJf5NuMCr0
         khXQ==
X-Gm-Message-State: AOJu0YyRslcXxjC0uKPkjBaKvxZ0dUOhvlwKQ9Mjx5dwHFa/YbsCxwH/
	7jicrdm47EQR0g130KffCkG55u5jQ/8wdtb1lSLDCQ==
X-Google-Smtp-Source: AGHT+IFYzz1udWcTeV4meGkJeMqGjEeSeMlU+XeqwQooukBcx18KN/ZD2OzwwabFVNJ4dm5BRlOrQ5y5vfkWL1S6KVI=
X-Received: by 2002:a05:6a20:c518:b0:14b:7d8b:cbaf with SMTP id
 gm24-20020a056a20c51800b0014b7d8bcbafmr18395717pzb.57.1697119478939; Thu, 12
 Oct 2023 07:04:38 -0700 (PDT)
MIME-Version: 1.0
References: <20231003035226.1945725-1-apatel@ventanamicro.com> <CAAhSdy0P=5WiFfFyMHjkd63JKCcjsTsvhLTNgUB+LOCd8A9iOQ@mail.gmail.com>
In-Reply-To: <CAAhSdy0P=5WiFfFyMHjkd63JKCcjsTsvhLTNgUB+LOCd8A9iOQ@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 12 Oct 2023 19:34:27 +0530
Message-ID: <CAAhSdy2XLqB-NPVfqYdO07bPxkc2VXBpethHppiKkBms2ysvZA@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] KVM RISC-V Conditional Operations
To: Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Shuah Khan <shuah@kernel.org>, 
	Andrew Jones <ajones@ventanamicro.com>, Mayuresh Chitale <mchitale@ventanamicro.com>, 
	devicetree@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Anup Patel <apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_070443_838069_B70ACA0F 
X-CRM114-Status: GOOD (  19.60  )
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

SGkgUGFsbWVyLAoKT24gVGh1LCBPY3QgNSwgMjAyMyBhdCAxMTozNeKAr0FNIEFudXAgUGF0ZWwg
PGFudXBAYnJhaW5mYXVsdC5vcmc+IHdyb3RlOgo+Cj4gT24gVHVlLCBPY3QgMywgMjAyMyBhdCA5
OjIy4oCvQU0gQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+ID4K
PiA+IFRoaXMgc2VyaWVzIGV4dGVuZHMgS1ZNIFJJU0MtViB0byBhbGxvdyBHdWVzdC9WTSBkaXNj
b3ZlciBhbmQgdXNlCj4gPiBjb25kaXRpb25hbCBvcGVyYXRpb25zIHJlbGF0ZWQgSVNBIGV4dGVu
c2lvbnMgKG5hbWVseSBYVmVudGFuYUNvbmRPcHMKPiA+IGFuZCBaaWNvbmQpLgo+ID4KPiA+IFRv
IHRyeSB0aGVzZSBwYXRjaGVzLCB1c2UgS1ZNVE9PTCBmcm9tIHJpc2N2X3pieF96aWNudHJfc21z
dGF0ZWVuX2NvbmRvcHNfdjEKPiA+IGJyYW5jaCBhdDogaHR0cHM6Ly9naXRodWIuY29tL2F2cGF0
ZWwva3ZtdG9vbC5naXQKPiA+Cj4gPiBUaGVzZSBwYXRjaGVzIGFyZSBiYXNlZCB1cG9uIHRoZSBs
YXRlc3QgcmlzY3Zfa3ZtX3F1ZXVlIGFuZCBjYW4gYWxzbyBiZQo+ID4gZm91bmQgaW4gdGhlIHJp
c2N2X2t2bV9jb25kb3BzX3YzIGJyYW5jaCBhdDoKPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9hdnBh
dGVsL2xpbnV4LmdpdAo+ID4KPiA+IENoYW5nZXMgc2luY2UgdjI6Cj4gPiAgLSBEcm9wcGVkIHBh
dGNoMSwgcGF0Y2gyLCBhbmQgcGF0Y2g1IHNpbmNlIHRoZXNlIHBhdGNoZXMgZG9uJ3QgbWVldAo+
ID4gICAgdGhlIHJlcXVpcmVtZW50cyBvZiBwYXRjaCBhY2NlcHRhbmNlIHBvbGljeS4KPiA+Cj4g
PiBDaGFuZ2VzIHNpbmNlIHYxOgo+ID4gIC0gUmViYXNlZCB0aGUgc2VyaWVzIG9uIHJpc2N2X2t2
bV9xdWV1ZQo+ID4gIC0gU3BsaXQgUEFUQ0gxIGFuZCBQQVRDSDIgb2YgdjEgc2VyaWVzIGludG8g
dHdvIHBhdGNoZXMKPiA+ICAtIEFkZGVkIHNlcGFyYXRlIHRlc3QgY29uZmlncyBmb3IgWFZlbnRh
bmFDb25kT3BzIGFuZCBaaWNvbmQgaW4gUEFUQ0g3Cj4gPiAgICBvZiB2MSBzZXJpZXMuCj4gPgo+
ID4gQW51cCBQYXRlbCAoNik6Cj4gPiAgIGR0LWJpbmRpbmdzOiByaXNjdjogQWRkIFppY29uZCBl
eHRlbnNpb24gZW50cnkKPiA+ICAgUklTQy1WOiBEZXRlY3QgWmljb25kIGZyb20gSVNBIHN0cmlu
Zwo+ID4gICBSSVNDLVY6IEtWTTogQWxsb3cgWmljb25kIGV4dGVuc2lvbiBmb3IgR3Vlc3QvVk0K
PiA+ICAgS1ZNOiByaXNjdjogc2VsZnRlc3RzOiBBZGQgc2VudmNmZyByZWdpc3RlciB0byBnZXQt
cmVnLWxpc3QgdGVzdAo+ID4gICBLVk06IHJpc2N2OiBzZWxmdGVzdHM6IEFkZCBzbXN0YXRlZW4g
cmVnaXN0ZXJzIHRvIGdldC1yZWctbGlzdCB0ZXN0Cj4gPiAgIEtWTTogcmlzY3Y6IHNlbGZ0ZXN0
czogQWRkIGNvbmRvcHMgZXh0ZW5zaW9ucyB0byBnZXQtcmVnLWxpc3QgdGVzdAo+Cj4gUXVldWVk
IHRoaXMgc2VyaWVzIGZvciBMaW51eC02LjcKCkkgaGF2ZSBjcmVhdGVkIHNoYXJlZCB0YWcga3Zt
LXJpc2N2LXNoYXJlZC10YWctNi43IGluIHRoZQpLVk0gUklTQy1WIHJlcG8gYXQ6Cmh0dHBzOi8v
Z2l0aHViLmNvbS9rdm0tcmlzY3YvbGludXguZ2l0CgpUaGlzIHNoYXJlZCB0YWcgaXMgYmFzZWQg
b24gNi42LXJjNSBhbmQgY29udGFpbnMgZm9sbG93aW5nIDQgcGF0Y2hlczoKZHQtYmluZGluZ3M6
IHJpc2N2OiBBZGQgWmljb25kIGV4dGVuc2lvbiBlbnRyeQpSSVNDLVY6IERldGVjdCBaaWNvbmQg
ZnJvbSBJU0Egc3RyaW5nCmR0LWJpbmRpbmdzOiByaXNjdjogQWRkIHNtc3RhdGVlbiBlbnRyeQpS
SVNDLVY6IERldGVjdCBTbXN0YXRlZW4gZXh0ZW5zaW9uCgpUaGFua3MsCkFudXAKCgoKPgo+IFRo
YW5rcywKPiBBbnVwCj4KPiA+Cj4gPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0
ZW5zaW9ucy55YW1sIHwgIDYgKysrCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5o
ICAgICAgICAgICAgICAgIHwgIDEgKwo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9r
dm0uaCAgICAgICAgICAgICB8ICAxICsKPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJl
LmMgICAgICAgICAgICAgICAgfCAgMSArCj4gPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9vbmVyZWcu
YyAgICAgICAgICAgICAgICAgIHwgIDIgKwo+ID4gIC4uLi9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dl
dC1yZWctbGlzdC5jICAgICAgICB8IDU0ICsrKysrKysrKysrKysrKysrKysKPiA+ICA2IGZpbGVz
IGNoYW5nZWQsIDY1IGluc2VydGlvbnMoKykKPiA+Cj4gPiAtLQo+ID4gMi4zNC4xCj4gPgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
