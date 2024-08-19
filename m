Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E4ECC3DA4A
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Aug 2024 07:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mv+I/bjr8/y9XahTKRTijXO2anCXyfBo5d0MYRaKzBU=; b=LwKMkT83LPhGaY
	Rd9M793qft2ze0gRzF+BO3LE8JfP5ZblmxUslrmI5N+iVpDQk+HEVO5zjzofd/I7iHmU9yZRFcQhC
	sft7gfvXdiKq7XMv8OVwV0xXTDw+Bp208AICcv2K2ruhxt03wr76jx/JNEH8SUIgymd2yI9xwuq1q
	8o5y4MhprVvACE9a8x8mZRin83tgF29WcjhhODODnD3ppaA5IiuukielJBKLtsdJ45nUCRk2tKidC
	0IuJa7vS2pfZtFpV2BkQ7CORUbJxLhy8hhQXANmdrd8B4ltqlEu2qdCKUKCKbXotzVT/i9T/ZVr7U
	VkCSr6ZX7S83dBp10cQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfx9X-00000000gmt-1bbf;
	Mon, 19 Aug 2024 07:50:11 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfx8r-00000000gdY-3JOB
	for linux-riscv@lists.infradead.org;
	Mon, 19 Aug 2024 07:49:31 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2d3c0d587e4so2695760a91.2
        for <linux-riscv@lists.infradead.org>; Mon, 19 Aug 2024 00:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1724053768; x=1724658568; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YUVuHKHVrcEtqoNkxteJqRlTWi2IdXz9WHlXJpbxXpI=;
        b=FGVGzEU0EAqg+WBs0aLLzAagQK/ZYRFXtqvvvjU3BVWeyN7JBvyCNe64ErvyXxI8ZC
         xrvs5lSwnpsc0i4Crls2JVoyZ5zYtqqjCnsbEIe5fMq6EL7UFd9+xfDahcodoERQBwPk
         5diAHu6SDbTe4iyqGCVLldn6Bq6HP/YLWi0OlAey3LK2OutV8wEv+vbdV9lI616IVLsa
         CCUxvZfVDJVQTscvHXaJtcp+6BXqiiXArC9ZakySaZhAmlmVvaOA9XCafEjrbyOAjJGN
         TGLdMJfaF2MqKrR1650AVUEqaXVibIoBqLtf18WzimrmniwM9KXHK0+QNAbAFCqCnLc+
         t5Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724053768; x=1724658568;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YUVuHKHVrcEtqoNkxteJqRlTWi2IdXz9WHlXJpbxXpI=;
        b=i2zAoV8bAeTzV3YgfonJKVFwQNLqghLuCgSi9m8vS2E1oOrs07qYSmRNJZsfKuSfi/
         KoEFSxKDlRkspb2eCfJ1R8jDLIbh7nnDB0c5y/AxByAg+yLmDDqujW/6+ByVKwLmcpfI
         nW+Deyyp8S7p6seeexXjETs1Ji9o8Rc9Olcb3xXLazVJ3Snu7jLp7WP+PhTS1b99+yz7
         Mv5Are8dT/AL5mj2N036jl78JGvoyMjLU5LMkaibBHZnGdubqqSmclWixN0V4AuWoyt7
         UTYDGLvzeTNmmLcepTbsk87BUlRhbtEJ5JB8Xc2sYX5szSMjP2MXO4IVYior/5qnTk9A
         QTfg==
X-Forwarded-Encrypted: i=1; AJvYcCUBOqajKrJhHoqprJHjySe9o5gj9aVDUfP1P2hlso5BpR752mxjxXv0GAnCJ4iHuExQEHPNwEFYcq9136LQ7Y6WP7fO/UUPH6DiLeovYiXR
X-Gm-Message-State: AOJu0YwpMtctKwY3xHzA964/5ec2S62I6xxc/redKZq9EdV1nxlPddql
	aBfvgI++WmRcl0y6kclQxzXfLxG00mc+u/1sJoVprxio+ZLsKI2eBS177t2mX5AWxbTN7EDXeOP
	sLxEaoEzrmQBGX6n9QDTvqABEC86OVdhYI7U68g==
X-Google-Smtp-Source: AGHT+IGMUxO+SbJNNsJNOeCjlAxiHYJmrGmzXoT7AF6Cdx1Io2AIZBXwOGeT+8FzlSsn1R93xMpQ61uziEW80Qs3BTQ=
X-Received: by 2002:a17:90a:c28b:b0:2d3:c4d3:de19 with SMTP id
 98e67ed59e1d1-2d3dfac98f0mr8696169a91.0.1724053767927; Mon, 19 Aug 2024
 00:49:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAPYmKFsTcurrUiWqM8cFj+GgqfRiaLqPDGOTSE+RLyKJGSKE2g@mail.gmail.com>
 <B0C91D33-8C1C-4C67-B9B4-41206EFD8ECF@jrtc27.com>
In-Reply-To: <B0C91D33-8C1C-4C67-B9B4-41206EFD8ECF@jrtc27.com>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Mon, 19 Aug 2024 15:49:16 +0800
Message-ID: <CAPYmKFs7ZyHyKo8uULvYp3YK8ABOJo8+FWDG_cr2YU_cXgfRww@mail.gmail.com>
Subject: Re: [External] Re: Some feedbacks on RISC-V IOMMU driver
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: Tomasz Jeznach <tjeznach@rivosinc.com>, Anup Patel <apatel@ventanamicro.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, Will Deacon <will@kernel.org>, 
	joro@8bytes.org, LKML <linux-kernel@vger.kernel.org>, 
	Yongji Xie <xieyongji@bytedance.com>, iommu@lists.linux.dev, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, wangqian.rd@bytedance.com, 
	linux-riscv <linux-riscv@lists.infradead.org>, robin.murphy@arm.com, 
	Hangjing Li <lihangjing@bytedance.com>, baolu.lu@linux.intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_004929_856737_2CED9EC9 
X-CRM114-Status: GOOD (  24.48  )
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

SGkgSmVzc2ljYSwKCk9uIE1vbiwgQXVnIDE5LCAyMDI0IGF0IDE6MTfigK9QTSBKZXNzaWNhIENs
YXJrZSA8anJ0YzI3QGpydGMyNy5jb20+IHdyb3RlOgo+Cj4gT24gMTkgQXVnIDIwMjQsIGF0IDA0
OjU2LCBYdSBMdSA8bHV4dS5rZXJuZWxAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4gPgo+ID4gSGkg
VG9tYXN6LAo+ID4KPiA+IFRoYW5rcyBmb3IgeW91ciBicmlsbGlhbnQgam9iIG9uIFJJU0MtViBJ
T01NVSBkcml2ZXIuIEl0IGhlbHBzIHVzIGEKPiA+IGxvdCBmb3Igd2hhdCB3ZSBhcmUgZG9pbmcu
IEJlbG93IGlzIG91ciBmZWVkYmFjayBvbiB0aGUgZXhpc3RpbmcKPiA+IGltcGxlbWVudGF0aW9u
WzFdLgo+ID4KPiA+IDEpIFNvbWUgSU9NTVUgSFcgbWF5IG9ubHkgc3VwcG9ydCAzMi1iaXQgZ3Jh
bnVsYXJpdHkgYWNjZXNzIG9uIGl0cwo+ID4gY29udHJvbCByZWdpc3RlcnMgKGV2ZW4gd2hlbiB0
aGUgcmVnaXN0ZXIgaXMgOCBieXRlIGxlbmd0aCkuIE1heWJlIGl0Cj4gPiBpcyBiZXR0ZXIgdG8g
cHJvdmlkZSBhIDMyLWJpdCBhY2Nlc3MgbWV0aG9kIGZvciA4IGJ5dGUgbGVuZ3RoCj4gPiByZWdp
c3RlcnMgbGlrZSB3aGF0IG9wZW5zYmkgZG9lcyBvbiBBQ0xJTlQgTVRJTUUgcmVnaXN0ZXIuCj4K
PiBUaGF0IE9wZW5TQkkgaGFzIHRvIGFjY2VzcyBNVElNRSBwaWVjZXdpc2UgaXMgYSB3b3JrYXJv
dW5kIGZvciBhIHZlbmRvcgo+IG5vdCBpbXBsZW1lbnRpbmcgd2hhdCB0aGUgc3BlYyBjbGVhcmx5
IGludGVuZGVkLCBldmVuIGlmIGl0IHdhc27igJl0Cj4gZXhwbGljaXRseSBzdGF0ZWQgKGJ1dCBp
cyBub3csIGluIHJlc3BvbnNlIHRvIHRoYXQpLiBSZXBlYXRpbmcgdGhhdAo+IHNpdHVhdGlvbiB3
b3VsZCBiZSBhIHBpdGlmdWwgbWlzdGFrZS4KPgo+IFRoZSBjdXJyZW50IElPTU1VIHNwZWMgZHJh
ZnQgdmVyeSBjbGVhcmx5IHN0YXRlczoKPgo+ICAgIlJlZ2lzdGVycyB0aGF0IGFyZSA2NC1iaXQg
d2lkZSBtYXkgYmUgYWNjZXNzZWQgdXNpbmcgZWl0aGVyIGEgMzItYml0Cj4gICAgb3IgYSA2NC1i
aXQgYWNjZXNzLuKAnQo+CgpUaGUgc3BlYydzIGRlc2NyaXB0aW9uIGFib3V0IHRoaXMgaXMgcHJl
dHR5IGNvbmZ1c2luZy4KICJUaGUgOCBieXRlIElPTU1VIHJlZ2lzdGVycyBhcmUgZGVmaW5lZCBp
biBzdWNoIGEgd2F5IHRoYXQgc29mdHdhcmUKY2FuIHBlcmZvcm0gdHdvIGluZGl2aWR1YWwgNCBi
eXRlIGFjY2Vzc2VzLCBvciBoYXJkd2FyZSBjYW4gcGVyZm9ybQp0d28gaW5kZXBlbmRlbnQgNCBi
eXRlIHRyYW5zYWN0aW9ucyByZXN1bHRpbmcgZnJvbSBhbiA4IGJ5dGUgYWNjZXNzLiIKSXQgc2Vl
bXMgdGhhdCB0aGVyZSBpcyBubyByZXF1aXJlbWVudCB0byBpbXBsZW1lbnQgOC1ieXRlIGFjY2Vz
cy4KSXQncyBPSyB0aGVuIGlmIHdlIHRoaW5rIHRoaXMgaXMgbm90IGEgcHJvYmxlbS4KCj4gSmVz
cwo+Cj4gPiAyKSBJbiB0aGUgSU9NTVUgZmF1bHQgcXVldWUgaGFuZGxpbmcgcHJvY2VkdXJlLCBJ
IHdvbmRlciB3aGV0aGVyIGl0IGlzCj4gPiBiZXR0ZXIgdG8gY2xlYXIgdGhlIGZxbWYvZnFvZiBi
aXQgZmlyc3QsIGFuZCB0aGVuIGNsZWFyIHRoZSBpcHNyLmZpcAo+ID4gYml0LiBPdGhlcndpc2Ug
dGhlIGlwc3IuZmlwIGNhbiBub3QgYmUgY2xlYXJlZCBhbmQgYSByZWR1bmRhbnQKPiA+IGludGVy
cnVwdCB3aWxsIGJlIHNpZ25hbGVkLgoKQnkgdGhlIHdheSwgaXQgc2VlbXMgdGhlIGlycSBoYW5k
bGVyIG11c3QgY2xlYXIgaXBzci5maXAgZmlyc3QgdG8KYXZvaWQgbWlzc2luZyBvdXQgc29tZSBm
YXVsdHMgbm8gbWF0dGVyIHdoZXRoZXIgYSByZWR1bmRhbnQgaXJxIHdpbGwKYmUgZ2VuZXJhdGVk
LgoKSWYgaXBzci5maXEgcGVuZGluZyB2aWEgZnFvZi9mcW1mIGlzIGltcGxlbWVudGVkIGFzIGVk
Z2UgdHJpZ2dlcmluZywKdGhlbiBpcHNyLmZpcSBjYW4gYmUgY2xlYXJlZCBhdCBmaXJzdC4gSW4g
dGhpcyBjYXNlIHdlIGNhbiBub3QgY2xlYXIKaXBzci5maXAgYWdhaW4gYWZ0ZXIgY2xlYXJpbmcg
ZnFvZi9mcW1mIGJpdCwgYXMgaXQgaW5kaWNhdGVzIGEgbmV3CmZhdWx0IHRvIGJlIGhhbmRsZWQu
CgpJZiBpcHNyLmZpcSBwZW5kaW5nIHZpYSBmcW9mL2ZxbWYgaXMgaW1wbGVtZW50ZWQgYXMgbGV2
ZWwgdHJpZ2dlcmluZywKdGhlbiBpcHNyLmZpcSBjYW4gbm90IGJlIGNsZWFyZWQgYXQgZmlyc3Qg
YW5kIGEgcmVkdW5kYW50IGlycSB3aWxsIGJlCmdlbmVyYXRlZCBhZnRlciB0aGlzIGhhbmRsZXIn
cyByZXR1cm4uIEJ1dCBpdCBpcyBPSyBhcyBubyBmYXVsdCB3aWxsCmJlIG1pc3NlZC4gT3RoZXJ3
aXNlIGl0IGlzIGhhcmQgdG8gZGV0ZWN0IHdoZXRoZXIgdGhlIGlwc3IuZmlxIGlzIGFuCm9sZCBv
bmUgb3IgYSBuZXcgb25lLgoKUGxlYXNlIGNvcnJlY3QgbWUgaWYgSSBoYXZlIGFueSBtaXN1bmRl
cnN0YW5kaW5nLiBMb29raW5nIGZvcndhcmQgdG8KdGhlIHN1YnNlcXVlbnQgY29kZS4KCkJlc3Qg
cmVnYXJkcyEKCj4gPgo+ID4gQmVzdCByZWdhcmRzIQo+ID4gWHUgTHUKPiA+Cj4gPiBbMV0gaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL2NvdmVyLjE3MTgzODg5MDguZ2l0LnRqZXpuYWNoQHJp
dm9zaW5jLmNvbS8KPiA+Cj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+ID4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gPiBsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCj4gPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
