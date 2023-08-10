Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A07FC001B0
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 21:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=iw78/2rKm1Qrgx8jfYSKErt9qn9qDvZ9G2fYXCyRhdM=; b=iBQj/sye65u9+DOL736YsTKy+J
	2SSDt3mEgxqiufJQld+blJ5Jo/N8SueQQ30OEFIbdsbZcFC2QbCJL7cv69SbYMTUTv5kn8P/0haBL
	v+qSkoJ5j1OVTn7dCYuWsSZPJ0V5D7H2GP/6NzE5rPn+58RB3kKHWrT6Q6iJfHziZNuRvuG8q7nQp
	hIZAnq8aY3VdEFmEHm0ZCZe1noROK4UwfoW8qA0iYlNpLUiaOc+Jz2CAbBidRr6InUsIXJuzG/JF5
	sF0CPmdwLl8Kmi1Nm/+G/DAvSAlm71BhrL5W99A/BZKmV9+Y1VoCm0jniEIqH8WZEvBtu5311Vgtb
	pEEeVAyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUCtP-008iXI-1Z;
	Thu, 10 Aug 2023 21:08:27 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUCtM-008iVm-0m
	for linux-riscv@lists.infradead.org;
	Thu, 10 Aug 2023 21:08:25 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-686daaa5f1fso1037735b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 10 Aug 2023 14:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1691701701; x=1692306501;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OXIUKkyCPEgNNkjTFW93aQW4gicEuSkO6Grvd3DkGHU=;
        b=YOlJeFIQE+/EcWIHVpcAqlbgQV+5IiHWL5Oi0Stq+k2jQDx89asfyWlZdejydVLfQj
         eaPCeNv8hYkA3ZcbQtvdUI0NWpt5OR0XvxgKm51fQuAaWnprMaCxrtPMQBUdFmJfy1RJ
         GhoUPJNF5fUKv00mWRZLSLHyuwVJFM5ovnb0+ArkZdlpCmjqNdkYMGVITZRznvF8o+7p
         O9HaXdJyI5DD5PJekN7nd/7xSDKGBvhVf0wTyOYDq6ym2oO+d1e1YIIQZgeByCPPm/2v
         2Sm7SIi+EOzkeJZLElAX+BCwyQe5Cv+zJVttVReGFXAiMxBpAxZzN2lkfNig07YA23pS
         ztVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691701701; x=1692306501;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OXIUKkyCPEgNNkjTFW93aQW4gicEuSkO6Grvd3DkGHU=;
        b=aC2TGuymttSYegeQCh4hjz78v/T1FYVKke2uP36Ck81G9iAq9R6ax+cxumqcN6pjKR
         qPEfH6qt7tDv2BjFECRmzUI/DhsyRiqbGi2SI7Ok4k6KDl9jCl3MXrIwMrspK/rnF5k/
         V/FyQUMoKFVYFGk6i4uiLtzg3zR0vZ1GW4d4idOPdil+dHmEMPTBNbhX2qLHdULe2G6E
         I2DM8paxteJEWurDGNz99Z6rfJyKmR0Vn9ew7LNTRVj2Sp3jQ3Wm+hzhU8D77ERaCONy
         tZ2tFF/WpZ9oAN4IJA2sc+qE1E3HFqTokBLuILUlFv5KDxNJO2q3lVL4PUBED6vInYEZ
         hiew==
X-Gm-Message-State: AOJu0YyQV8A4XvpOaV3BuKni6s9rGZYj59uhRiuOdMiiSQU+h+kffgsn
	GYwOx+8Fyr245tgyqWO7Y2RDXw==
X-Google-Smtp-Source: AGHT+IGjOmBAbPo3yGPRSJM8VsbKvqfLVq7Xn7SyNp67QktnBq3Ivr5cVQ+Z6W3nrAwAvvz5v4h0aA==
X-Received: by 2002:a05:6a20:728c:b0:13d:ee19:771f with SMTP id o12-20020a056a20728c00b0013dee19771fmr232804pzk.8.1691701701061;
        Thu, 10 Aug 2023 14:08:21 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id k15-20020aa7820f000000b006877a2e6285sm1947607pfi.128.2023.08.10.14.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 14:08:19 -0700 (PDT)
Date: Thu, 10 Aug 2023 14:08:19 -0700 (PDT)
X-Google-Original-Date: Thu, 10 Aug 2023 14:08:17 PDT (-0700)
Subject: Re: [PATCH] RISC-V: support for vector register accesses via ptrace() in RISC-V Linux native
In-Reply-To: <CABgGipUXWK3XSQNnY66z1EaOeLDrqJnW0bSCmSCv11xMiVppAg@mail.gmail.com>
CC: macro@orcam.me.uk, greg.savin@sifive.com, greentime.hu@sifive.com,
  oleg@redhat.com, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  linux-riscv@lists.infradead.org, gdb-patches@sourceware.org, andrew.burgess@embecosm.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: andy.chiu@sifive.com
Message-ID: <mhng-c7b5694f-7c9a-443f-802a-c50403cd0598@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_140824_494782_FC806968 
X-CRM114-Status: GOOD (  34.27  )
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

T24gVGh1LCAxMCBBdWcgMjAyMyAxMDoyMzozNCBQRFQgKC0wNzAwKSwgYW5keS5jaGl1QHNpZml2
ZS5jb20gd3JvdGU6Cj4gT24gVGh1LCBBdWcgMTAsIDIwMjMgYXQgOTo1NeKAr1BNIE1hY2llaiBX
LiBSb3p5Y2tpIDxtYWNyb0BvcmNhbS5tZS51az4gd3JvdGU6Cj4+Cj4+IE9uIFRodSwgMTAgQXVn
IDIwMjMsIE1hY2llaiBXLiBSb3p5Y2tpIHdyb3RlOgo+Pgo+PiA+ID4gRG9lcyBpdCBtYWtlIHNl
bnNlIHRvIHlvdSBpZiB3ZSBlbmNhcHN1bGF0ZSB0aGlzIHdpdGggYSBod3Byb2JlIHN5c2NhbGw/
Cj4+ID4gPiBlLmcgcHJvdmlkZSBhIGh3cHJvYmUgZW50cnkgdG8gZ2V0IHN5c3RlbSdzIFZMRU5C
LiBXZSB3aWxsIGhhdmUgdG8KPj4gPiA+IGluY3JlYXNlIGFuZCByZWFycmFuZ2UgdGhlIGJ1ZmZl
ciBmb3IgTlRfUklTQ1ZfVkVDVE9SIGlmIHdlIHdhbnQgdG8gdXNlCj4+ID4gPiBwdHJhY2UgYXMg
dGhlIGVudHJ5IHBvaW50IGZvciB0aGlzIHB1cnBvc2UuIEkgYW0gbm90IHZlcnkgc3VyZSBpZiBp
dCdkIGJlCj4+ID4gPiB0b28gbGF0ZSB0byBkbyB0aG91Z2guCj4+ID4KPj4gPiAgTm8sIGhvdyBk
byB5b3UgZXhwZWN0IGl0IHRvIHdvcmsgd2l0aCBhIGNvcmUgZHVtcCAodGhhdCBjYW4gYmUgZXhh
bWluZWQKPj4gPiBvbiBhIGRpZmZlcmVudCBzeXN0ZW0sIG9yIHdpdGggYSBjcm9zcy1kZWJ1Z2dl
cik/ICBZb3UgbmVlZCB0byBjaGFuZ2UgdGhlCj4+ID4gQVBJIEknbSBhZnJhaWQ7IGl0J3MgdW51
c2FibGUgYW55d2F5LiAgSXQncyBhIHBpdHkgdGhlIHRvb2xjaGFpbiBjb21tdW5pdHkKPj4gPiB3
YXNuJ3QgY29uc3VsdGVkIGlmIHlvdSB3ZXJlbid0IHN1cmUgaG93IHRvIGRlc2lnbiB0aGUgaW50
ZXJmYWNlLiAgQmV0dGVyCj4+ID4geWV0IGl0IHdvdWxkIGhhdmUgYmVlbiB0byBpbXBsZW1lbnQg
dGhlIEdEQiBzaWRlIGJlZm9yZSB0aGUga2VybmVsIHBhcnQKPj4gPiBoYXMgYmVlbiBjb21taXR0
ZWQuCj4KPiBJIGp1c3QgdG9vayBzb21lIGxvb2sgaW50byB0aGUgY29kZSBhbmQgaGVyZSBpcyB3
aGF0IEkgY2FtZSB1cCB3aXRoLgo+IEFjdHVhbGx5LCB5b3Uga25vdyBWTEVOQiBpbiBhIGNvcmUg
ZHVtcCBmaWxlLiBUaGUgc2l6ZSBvZgo+IE5UX1JJU0NWX1ZFQ1RPUiBpbiBhIGNvcmUgZHVtcCBm
aWxlIGp1c3QgZXF1YWxzIHNpemVvZihzdHJ1Y3QKPiBfX3Jpc2N2X3ZfZXh0X3N0YXRlKSwgd2hp
Y2ggaXMgNDBCLCBwbHVzIFZMRU5CICogMzIuIFNvLCB0aGUgZGVidWdnZXIKPiBjYW4gYWN0dWFs
bHkgY2FsY3VsYXRlIFZMRU5CIGFuZCByZXNvbHZlIHBsYWNlbWVudCBvZiBWIHJlZ2lzdGVycyBi
eQo+IHN1YnRyYWN0aW5nIDQwIGZyb20gdGhlIHNpemUgb2YgTlRfUklTQ1ZfVkVDVE9SIGluIGEg
Y29yZSBkdW1wIGZpbGUuCj4KPiBPbiB0aGUgb3RoZXIgaGFuZCwgcHRyYWNlIGlzIG5vdCBzbyBs
dWNreS4gVGhlIGtlcm5lbCB3aWxsIHJldHVybiB0aGUKPiBtaW4gb2YgZWl0aGVyIHVzZXIgc3Bl
Y2lmaWVkIHNpemUgb3IgdGhlIG1heGltdW0gVmVjdG9yIHNpemUuIEl0IGlzCj4gc3RpbGwgc2Fm
ZSBpZiB3ZSBjb25zaWRlciBTTVAgd2l0aCB0aGUgc2FtZSBWTEVOQiBhY3Jvc3MgY29yZXMgdGhv
dWdoLAo+IHdoaWNoIGlzIGFuIGFzc3VtcHRpb24gbWFkZSBvbiBMaW51eC4gV2UganVzdCBuZWVk
IGEgd2F5IHRvIGdldCBWTEVOQgo+IG9uIHRoZSBzeXN0ZW0uCj4KPj4KPj4gIE5CIHNpbmNlIHRo
aXMgc3R1ZmYgd2VudCBpbiB3aXRoIHY2LjUtcmMxIGFuZCB2Ni41IGhhc24ndCBiZWVuIHJlbGVh
c2VkCj4+IHlvdSBjYW4gc3RpbGwgYmFjayBvdXQgdGhlIHByb2JsZW1hdGljIGNoYW5nZSBhcyBu
byBvbmUgaXMgZXhwZWN0ZWQgdG8gdXNlCj4+IFJDIHN0dWZmIGluIHByb2R1Y3Rpb24uICBBbHRl
cm5hdGl2ZWx5IHlvdSBjYW4gcmVkZWZpbmUgTlRfUklTQ1ZfVkVDVE9SCj4+IGZvciBhIGNvcnJl
Y3RlZCBBQkksIGJ1dCBJIHRoaW5rIGl0IHNob3VsZG4ndCBiZSBuZWNlc3NhcnkuICBZb3UganVz
dCBuZWVkCj4+IHRvIGFjdCBxdWlja2x5IGFzIEkgZ3Vlc3MgdGhlcmUgbWF5IGJlIDEtMiBmdXJ0
aGVyIHY2LjUgUkNzIG9ubHkgYW5kIHlvdQo+PiBoYXZlIHRvIGdldCB3aXRoIHRoYXQgdG8gTGlu
dXMgcmlnaHQgYXdheS4gIFdlIGNhbiBoYXZlIGEgcmVsZWFzZSBvciB0d28KPj4gd2l0aG91dCBO
VF9SSVNDVl9WRUNUT1Igc3VwcG9ydCBmb3IgdGhlIG90aGVyd2lzZSBpbmNsdWRlZCB2ZWN0b3Ig
c3R1ZmYsCj4+IGl0IHNob3VsZG4ndCBiZSBhIGJpZyBkZWFsLiAgVGhlcmUganVzdCB3b24ndCBi
ZSBzdXBwb3J0IGZvciB0aGUgZGVidWcKPj4gQVBJLgoKSU1PIHRoYXQncyB0aGUgd2F5IHRvIGdv
OiBnaXZlbiB0aGF0IHdlJ3JlIHN0aWxsIGZpbmRpbmcgYnJlYWthZ2FlcyB0aGlzIApsYXRlIGlu
IHRoZSBjeWNsZSBpdCdzIGxpa2VseSB3ZSd2ZSBnb3Qgb3RoZXJzLiAgTGlrZSBNYWNpZWogc2Fp
ZCwgd2UgCnNob3VsZCBoYXZlIGdvdHRlbiB0aGUgR0RCIHN0dWZmIGluIGFsb25nIHdpdGggdGhl
IExpbnV4IHN0dWZmIHRvIGZpbmQgCnRoZSBwcm9ibGVtcy4KClNvIGxldCdzIGp1c3QgcmVtb3Zl
IHRoZSBwdHJhY2UoKSBhbmQgY29yZSBkdW1wIHN1cHBvcnQgZm9yIHZlY3RvciwgaXQncyAKbm90
IGJlZW4gcmVsZWFzZWQgc28gaXQncyBub3Qgc3RhYmxlIHVBQkkgeWV0LiAgV2UnbGwganVzdCBn
ZXQgaXQgcmlnaHQgCmJlZm9yZSBjb21taXR0aW5nIGl0LCB0aGF0IGNhbiBiZSBhcyBzaW1wbGUg
YXMganVzdCBvbmUgbW9yZSByZWxlYXNlLgoKPj4KPj4gIENDLWluZyBMaW51eCBwdHJhY2UvUklT
Qy1WIG1haW50YWluZXJzIG5vdyB0byBicmluZyB0aGVpciBhdHRlbnRpb24uCj4+Cj4+ICAgTWFj
aWVqCj4KPiBUaGFua3MsCj4gQW5keQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
