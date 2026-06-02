Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03821C5DF71
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jun 2026 08:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nhRdg4Q8ZOOPglIXXirrFXxD4Dn9yFN9Ov7u/F4Odyw=; b=Ev8fohjfLVw3n7
	P6iQN6zC/gWihMPXLaas3xRwrY8/gqzTibDduWI6IUhMYPgHf11k7orI2D+E+6h+8oAERekRVFao6
	GItRwanzVZKlei8dCVRHkine4tQ0f8t9ONZRkbVs2/VtB0phyTwOZCRlPHysg/GvSWZltWHeXNJ1C
	rCQqWiJ51UqIRrLBRxKohJ4gW94yJuqS0fN628tg4M5IPhEJ54QF1CliFP04lmc2nGVeEo8qU+xFn
	SCrtwhc9u0bmabBAz1hP0+QJOTck8pDhj3fcO0d+qunUoGh3cxGY5KpZk4on30nvkBW+qW0DyKNn0
	JBH1lOnov86ra4JUI0BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUK3Q-0000000CWeb-08n0;
	Tue, 02 Jun 2026 08:00:52 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUK3M-0000000CWdH-2AyD
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jun 2026 08:00:50 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-7e6a306fec0so1665980a34.0
        for <linux-riscv@lists.infradead.org>; Tue, 02 Jun 2026 01:00:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780387247; cv=none;
        d=google.com; s=arc-20240605;
        b=WlhgiMYnyaOTruhTDXPFZC5HKpYdMqV9cDClEBXREx/ar3JX29aK3DrAXAVzlc7+AD
         XbTWXXUxIrV+7icyLGGOwMuU8W1tl+BzZJjzwL491JZwxen8a9/O6/PxMc4rtzKWDnuf
         jxNTP235ge/OnSbiwDVnaXmAyVB2dRmO2Qs2EXoz9ZKHYbF+Lb3OPvW5IM3DsxPq7Id0
         NwHLaegqVrkM2L7+KTXS0OzP7cLtehLFTmyDrnZE8Fu0PXwQunbiEp/gBqhwA7e6S6Gm
         HLIinN87SyQbdNFzenGWJ3enuPSUFFlyTPOCnNVIx/5JruaIGXOodqZgnd4kTStbX8Dp
         1uXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IgrLvh/X4k97Px4HlbHkqTDpeesPxMpXfPyUt4B4fe8=;
        fh=jt6QQlDHf40eq5XOPi8MX5HxuDLrUQzgcF3/tZT3nBY=;
        b=bS3zrZmmQTtH4aTCvQ5CkYkM0ecBJrQNC7PflXnmQ1VCPSWD8w4McwchuxTtMXeG4/
         cDU0H6V6JIrETiSw59H/I/fo5qIEVItmSNnHtwUphAR2UR5DuMl8/X4cc6xSaQiVIuKx
         6ONKj6HUrHw404b1B7xF0Eh2VKNLkQSCr+gwR8aemuLOBzjB9hdIfp+/GAEasbHffwHx
         rj9WPIQAaphhsNZik/+If/p3W1DFTgJSNSckV8XfR/8zKOceE+qqX+hvdftXzb3HrtnN
         5s/zruNfG/pDsuBQWRUFrvoZIS0/7Oy6oKMNubXe5tGoSCwjmDGawU1XDy8MeZyrWM5T
         28+Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1780387247; x=1780992047; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IgrLvh/X4k97Px4HlbHkqTDpeesPxMpXfPyUt4B4fe8=;
        b=tXD26SnwYn8wHaRimWDiGSZko1+Dc6CGSRhQd7/jxtkV/UIRYzmiVY9RL9xuWX2rHy
         SNZOHWy8kC3iXP3+So2l4Ecz8QPGVVv1pvJA02psx/2VqR5xkp9SEzcIMh8jzVlb0zzW
         r+hoQvRbimPf/6UPaNkpncGfA1HUM/UJcW2lVbCjq8tvPwODJ5002P41Q5ILQOnbi3IT
         rEn5XXQDl1MndwCNloTLu8GqmLAQw6SKlbr5N7M1EXyCX1BVr97Su2TsSVkJGytcJG4x
         bu8CQPOF4CgIPX/UfTr9Zg+3UE5O0Wg20U/dLJ8t4e55DzNqLxvAlUUiK83dgGMVtikd
         v/Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780387247; x=1780992047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IgrLvh/X4k97Px4HlbHkqTDpeesPxMpXfPyUt4B4fe8=;
        b=oSWCsnhL0/yJxAF8n/b808hm4qlt3WdMVyCNHmUTLO6nAEjxYdeZopZuJ5HIqip10m
         yOTJivp2ru8YdhTDFUE/pnxo7R2k5W8ZtOE6AbHOFHTQeJ05KBlGAFj17zf5QvWRrePb
         j6Usfui3S1XgLHCKQ13pS4XBTbdrYMibRUrGkJ4luVan9EqG35vvtFTO9cavQortlAUJ
         spX3uKseiARPozIf5rRV8dyqHfs8rZrtc75xrcUMW3hM8l1okKysEKgKv3rN4Dtff9c3
         0tTs1mDoy4Z4ZCsLqcMyw35MtMc8+Vi9Hn+6I1tkAAR2JfTt2RthojMSAELT74L7rSgp
         vMug==
X-Forwarded-Encrypted: i=1; AFNElJ8m3UY6p81Ghc0E0SzPYZdu7CQwFosGJQF/kCnuZlTw3pfLvEr+aPPlEKYzzUmVTE3+R2vzWztRyd7Rtw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwNC3QfVtx5OzAZm0lLaXUzEbot3VBjSaCQjsms4czjpmVBFskn
	d01A+c2Yko+fvkaxpT+nlGnhwVNU2xq4pqN3DKhL2K/uwzxOdO5TZTz3OVDt3b7kotF0chAAZzd
	F+LT4gl5DA2kAcgwc1nwJgojPKidQGMW7ZxzCy5Zs8Q==
X-Gm-Gg: Acq92OGFIIS5OXm2LJ8+qf9Wuawd0HP0zyentgYL4TMjkePaNVRcyrTVj1XhuAHrq/T
	MWVNelKIg8zGRPd25j4Dl/6HxTMmUyRDh1HKXM5RHuKhjvZWtaAcr+ZxUUDkDMSSE7idzucsH7a
	CDUH6SQfZTNsv6bky5K1z0QFbvimoD9T+Xp+PSMslsz+YGpEmu52Oa9bA4Rg+bDp8vmddAIrqKF
	HIj+Md66HQ3g3vOmBtmwCBO6W0OaDvnAVQT/xxhg/r8xRMPCUbA4FcJXMGOo7a4yFljoq09xYcC
	T3qj08IO/WuCPtlQsPUPpOMmq9BuAKLtqhJhQ1GEvfGbOx1XY4/Z7/pf1CYGAwxbOesCqg95Ubu
	2lCPDMugjOj3Xs0W2cL6H+Jkmnl7FsIMnlDjtSJ4zNUNw+f//
X-Received: by 2002:a05:6820:4d06:b0:69d:5138:5540 with SMTP id
 006d021491bc7-69e368628ecmr1455529eaf.9.1780387246859; Tue, 02 Jun 2026
 01:00:46 -0700 (PDT)
MIME-Version: 1.0
References: <202605111849442561v1a0B_7W1L2Z-ENusLaP@zte.com.cn> <202605111130.64BBUjU6013213@mse-fl2.zte.com.cn>
In-Reply-To: <202605111130.64BBUjU6013213@mse-fl2.zte.com.cn>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 2 Jun 2026 13:30:34 +0530
X-Gm-Features: AVHnY4Ly_ncquhNUG3b2y2WGAOsB8396bhb2a_G3mSJVFu24acqBWILI6kpavM8
Message-ID: <CAAhSdy25JUiM2QnJbvqsQBu5eaB4L2TdSNfkmaaqFMjNOk+Stg@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5BPATCH_2=2F3=5D_RISC=2DV=3A_KVM=3A_Fix_skip_of_valid_pages?=
	=?UTF-8?Q?_in=C2=A0kvm=5Friscv=5Fgstage=5Fwp=5Frange?=
To: wu.fei9@sanechips.com.cn
Cc: linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, atish.patra@linux.dev, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, pbonzini@redhat.com, 
	shuah@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_010048_814032_0A836C5F 
X-CRM114-Status: GOOD (  17.16  )
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

T24gTW9uLCBNYXkgMTEsIDIwMjYgYXQgNTowMOKAr1BNIDx3dS5mZWk5QHNhbmVjaGlwcy5jb20u
Y24+IHdyb3RlOgo+Cj4gVGhlIGN1cnJlbnQgZ3N0YWdlIHJhbmdlIHdhbGtlciB1bmNvbmRpdGlv
bmFsbHkgYWR2YW5jZXMgYnkgJ3BhZ2Vfc2l6ZScKPiB3aGVuIGEgbGVhZiBQVEUgaXMgbm90IGZv
dW5kLCBlLmcuIHdoZW4gdGhlIHJhbmdlIHRvIHdwIGlzCj4gWzB4ZmZmZmYwMWZjMDAwLCAweGZm
ZmZmMDIzYzAwMCkgYW5kIHBhZ2Vfc2l6ZSBpcyAyTUIsIGlmIGZvdW5kX2xlYWYgb2YKPiAweGZm
ZmZmMDFmYzAwMCByZXR1cm5zIGZhbHNlLCBpdCBza2lwIHRoZSB3aG9sZSByYW5nZSwgYnV0IGl0
J3MgcG9zc2libGUKPiB0byBoYXZlIHZhbGlkIGVudHJpZXMgaW4gWzB4ZmZmZmYwMjAwMDAwLCAw
eGZmZmZmMDIzYzAwMCkuCj4KPiBTaWduZWQtb2ZmLWJ5OiBXdSBGZWkgPHd1LmZlaTlAc2FuZWNo
aXBzLmNvbS5jbj4KCkkgc2VlIGFsbCB0YWJzIGNvbnZlcnRlZCB0byBzcGFjZXMuIExvb2tzIGxp
a2UgdGhpcyBwYXRjaCB3YXMKbm90IHNlbmQgdXNpbmcgZ2l0IHNlbmQtZW1haWwuCgpQbGVhc2Ug
cmViYXNlIGFuZCBzZW5kIHVwZGF0ZWQgc2VyaWVzIHVzaW5nIGdpdCBzZW5kLWVtYWlsLgoKUmVn
YXJkcywKQW51cAoKPiAtLS0KPiAgYXJjaC9yaXNjdi9rdm0vZ3N0YWdlLmMgfCAxNiArKysrKysr
Ky0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25z
KC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vZ3N0YWdlLmMgYi9hcmNoL3Jpc2N2
L2t2bS9nc3RhZ2UuYwo+IGluZGV4IGQ5ZmU4YmUyYTE1MS4uMmIxNDFhNzhlY2FjIDEwMDY0NAo+
IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL2dzdGFnZS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vZ3N0
YWdlLmMKPiBAQCAtNDI5LDE0ICs0MjksMTQgQEAgdm9pZCBrdm1fcmlzY3ZfZ3N0YWdlX3dwX3Jh
bmdlKHN0cnVjdCBrdm1fZ3N0YWdlICpnc3RhZ2UsIGdwYV90IHN0YXJ0LCBncGFfdCBlbmQKPiAg
ICAgICAgICAgICAgICAgaWYgKHJldCkKPiAgICAgICAgICAgICAgICAgICAgICAgICBicmVhazsK
Pgo+IC0gICAgICAgICAgICAgICBpZiAoIWZvdW5kX2xlYWYpCj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgZ290byBuZXh0Owo+IC0KPiAtICAgICAgICAgICAgICAgYWRkciA9IEFMSUdOX0RPV04o
YWRkciwgcGFnZV9zaXplKTsKPiAtICAgICAgICAgICAgICAga3ZtX3Jpc2N2X2dzdGFnZV9vcF9w
dGUoZ3N0YWdlLCBhZGRyLCBwdGVwLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBwdGVwX2xldmVsLCBHU1RBR0VfT1BfV1ApOwo+IC1uZXh0Ogo+IC0gICAgICAgICAg
ICAgICBhZGRyICs9IHBhZ2Vfc2l6ZTsKPiArICAgICAgICAgICAgICAgaWYgKCFmb3VuZF9sZWFm
KSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgYWRkciA9IEFMSUdOKGFkZHIgKyAxLCBwYWdl
X3NpemUpOwo+ICsgICAgICAgICAgICAgICB9IGVsc2Ugewo+ICsgICAgICAgICAgICAgICAgICAg
ICAgIGFkZHIgPSBBTElHTl9ET1dOKGFkZHIsIHBhZ2Vfc2l6ZSk7Cj4gKyAgICAgICAgICAgICAg
ICAgICAgICAga3ZtX3Jpc2N2X2dzdGFnZV9vcF9wdGUoZ3N0YWdlLCBhZGRyLCBwdGVwLAo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHB0ZXBfbGV2ZWws
IEdTVEFHRV9PUF9XUCk7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgYWRkciArPSBwYWdlX3Np
emU7Cj4gKyAgICAgICAgICAgICAgIH0KPiAgICAgICAgIH0KPiAgfQo+Cj4gLS0KPiAyLjQzLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
