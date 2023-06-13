Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7002EC77B7A
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jun 2023 10:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k5eNTBCpZd7bIknednCKLrAarlXxWJh9P7Byw2bB9N8=; b=IgEUODKNGl0/Df
	whsudHGrxtEmZ8zSVmn+7WOUjrVnnpFUkQotDTtNXef0/Aev9N6kbB63W4afLDy5BpLUQD1Hc5kqC
	FCaZYSQ+2IH9MBvjyu9LC9B+16gGgC51+xzckODoyqbXhsjNZNWb6vK73yCCGmF8l7HSypJ6As5Qc
	k1nNEKAESlZWVnrztKz7FKkDOZIbR62sfMHlP06lLbpRjCgj34WTdYKUbaV/o6VRUasKt9pZqvO+N
	xzHIk3sDELfn9JyNdy7Ye+0rZ5vJuT2KlWQ1LCogRa6vYh7rhKgtPB0j+n9sUhTrldaKvsmxExkr+
	T83XL/L9mGZh5LX5FDGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q91P6-007foY-1f;
	Tue, 13 Jun 2023 10:37:36 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q91P3-007fmh-07
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jun 2023 10:37:34 +0000
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-bcc50a23645so1698759276.2
        for <linux-riscv@lists.infradead.org>; Tue, 13 Jun 2023 03:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1686652642; x=1689244642;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u6v7bAOnlXSpxwVByNrc2wz3YyV0QI4pSQ1WAf4/fwQ=;
        b=XYe7DUHMvGV7y2bk4ogTIjbkVzcgzUmWBbBgPF1keLUauqwTFso2aU41gu9FLKluKu
         E6nipZ8KQrqhbgbP6eMpWe5q3qri0rXk+bWJv7HFMOae77UL2k7/845wYD8x9kH+wNhx
         2ayxk0svBQENhTEER+t6TCNp+pXvad9K+spGe2yTQkmbk6i65MNaoFDRMaipn2r+vOs7
         x4QiwKtfa8Nq7oCB+Ww4EJZ1Q/O9awqHQe7KlpLCHo2YOarsxYOHwh6vY05YXxDT0Bvl
         72eaNF/Qm9LlPOuKgjVC0dQCkvOx2bLPW2eUO86Uha9sWk6PcHEICRBnAqRlVbMJr8TW
         bUpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686652642; x=1689244642;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u6v7bAOnlXSpxwVByNrc2wz3YyV0QI4pSQ1WAf4/fwQ=;
        b=E8P/wRa9EdEmRS/PI+5fe6xexaWFtqJCIUK5oxZI3gaZMLz0zdq4hMXfh/eq1T6LUb
         kvF0Z6AF+kAIuMwyp3vwiM0ieMiWYv19rsMBSBCA5TgRuPHw/05xjMv2B46WeEU1P0ok
         Op5LDjiNGaxPznVCBQvZZ7wGQRs+M9NMfSykniAwLPoTIQrI7akTLpA2vzVIZdT5LrDi
         S6QPnBayOeMe3UAIfzxvgZx94F+pbJ3oXVHhdJ3WSfqGFRIXdK4KVGkTcFm/QeKjIwSg
         QHhN7XE6ZA/g7VeN65OszhbAPXTChGEAA99ppeEtZkdiNyIcpNrmFiph0GH9pPREO5TB
         VNdw==
X-Gm-Message-State: AC+VfDw8BYCHUIk7PPrCjyEuIk4DPgTYHhwMmUw6Ba4FqoBw9bDyg1rJ
	1l2DAx3+GT400rSGZF8bboCYDpux6wK97756Ai1ZUw==
X-Google-Smtp-Source: ACHHUZ5/Qvp7DqZ5pP3PN3ixTFHH2JNuoNmRb0aB0KXX5cNFjw0dq25o+ZtOjcjIGQZHYqGbkftMsLProALMoOCNzLk=
X-Received: by 2002:a25:b901:0:b0:bc6:9e29:f2c2 with SMTP id
 x1-20020a25b901000000b00bc69e29f2c2mr1018625ybj.44.1686652642636; Tue, 13 Jun
 2023 03:37:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230508142842.854564-1-apatel@ventanamicro.com>
 <20230508142842.854564-9-apatel@ventanamicro.com> <20230510-retry-paced-644f5a95ba3f@spud>
In-Reply-To: <20230510-retry-paced-644f5a95ba3f@spud>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 13 Jun 2023 16:07:11 +0530
Message-ID: <CAK9=C2W1=DAME7uYKu82qcpfn=V5N=4tZ4NTa2EygR+HDQCsmQ@mail.gmail.com>
Subject: Re: [PATCH v3 08/11] dt-bindings: interrupt-controller: Add RISC-V
 advanced PLIC
To: Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
	Atish Patra <atishp@atishpatra.org>, Andrew Jones <ajones@ventanamicro.com>, 
	Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	iommu@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_033733_074025_172BD37A 
X-CRM114-Status: GOOD (  26.95  )
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

T24gV2VkLCBNYXkgMTAsIDIwMjMgYXQgOToxMeKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBIZXkgQW51cCwKPgo+IE9uIE1vbiwgTWF5IDA4LCAyMDIzIGF0
IDA3OjU4OjM5UE0gKzA1MzAsIEFudXAgUGF0ZWwgd3JvdGU6Cj4gPiArICBpbnRlcnJ1cHRzLWV4
dGVuZGVkOgo+ID4gKyAgICBtaW5JdGVtczogMQo+ID4gKyAgICBtYXhJdGVtczogMTYzODQKPiA+
ICsgICAgZGVzY3JpcHRpb246Cj4gPiArICAgICAgR2l2ZW4gQVBMSUMgZG9tYWluIGRpcmVjdGx5
IGluamVjdHMgZXh0ZXJuYWwgaW50ZXJydXB0cyB0byBhIHNldCBvZgo+ID4gKyAgICAgIFJJU0Mt
ViBIQVJUUyAob3IgQ1BVcykuIEVhY2ggbm9kZSBwb2ludGVkIHRvIHNob3VsZCBiZSBhIHJpc2N2
LGNwdS1pbnRjCj4gPiArICAgICAgbm9kZSwgd2hpY2ggaGFzIGEgcmlzY3Ygbm9kZSAoaS5lLiBS
SVNDLVYgSEFSVCkgYXMgcGFyZW50Lgo+Cj4gU2FtZSBuaXQgaGVyZSwgcy9yaXNjdiBub2RlL2Nw
dSBub2RlLz8KCk9rYXksIEkgd2lsbCB1cGRhdGUuCgo+Cj4gPiArCj4gPiArICBtc2ktcGFyZW50
Ogo+ID4gKyAgICBkZXNjcmlwdGlvbjoKPiA+ICsgICAgICBHaXZlbiBBUExJQyBkb21haW4gZm9y
d2FyZHMgd2lyZWQgaW50ZXJydXB0cyBhcyBNU0lzIHRvIGEgQUlBIGluY29taW5nCj4gPiArICAg
ICAgbWVzc2FnZSBzaWduYWxlZCBpbnRlcnJ1cHQgY29udHJvbGxlciAoSU1TSUMpLiBJZiBib3Ro
ICJtc2ktcGFyZW50IiBhbmQKPiA+ICsgICAgICAiaW50ZXJydXB0cy1leHRlbmRlZCIgcHJvcGVy
dGllcyBhcmUgcHJlc2VudCB0aGVuIGl0IG1lYW5zIHRoZSBBUExJQwo+ID4gKyAgICAgIGRvbWFp
biBzdXBwb3J0cyBib3RoIE1TSSBtb2RlIGFuZCBEaXJlY3QgbW9kZSBpbiBIVy4gSW4gdGhpcyBj
YXNlLCB0aGUKPiA+ICsgICAgICBBUExJQyBkcml2ZXIgaGFzIHRvIGNob29zZSBiZXR3ZWVuIE1T
SSBtb2RlIG9yIERpcmVjdCBtb2RlLgo+ID4gKwo+ID4gKyAgcmlzY3YsbnVtLXNvdXJjZXM6Cj4g
PiArICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMgo+ID4g
KyAgICBtaW5pbXVtOiAxCj4gPiArICAgIG1heGltdW06IDEwMjMKPiA+ICsgICAgZGVzY3JpcHRp
b246Cj4gPiArICAgICAgU3BlY2lmaWVzIHRoZSBudW1iZXIgb2Ygd2lyZWQgaW50ZXJydXB0IHNv
dXJjZXMgc3VwcG9ydGVkIGJ5IHRoaXMKPiA+ICsgICAgICBBUExJQyBkb21haW4uCj4KPiBSb2Ig
YXNrZWQ6Cj4gfCBXZSBkb24ndCBub3JtYWxseSBuZWVkIHRvIGhvdyBtYW55IGludGVycnVwdHMs
IHdoeSBoZXJlPwo+Cj4gQnV0IEkgZG8gbm90IHNlZSBhbiBhbnN3ZXIgdG8gdGhhdCBvbiBsb3Jl
LgoKVGhlIEFQTElDIHNwZWMgZGVmaW5lcyBtYXhpbXVtIGludGVycnVwdCBzb3VyY2VzIHRvIGJl
IDEwMjMuCgo+Cj4gPiArCj4gPiArICByaXNjdixjaGlsZHJlbjoKPiA+ICsgICAgJHJlZjogL3Nj
aGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRsZS1hcnJheQo+ID4gKyAgICBtaW5J
dGVtczogMQo+ID4gKyAgICBtYXhJdGVtczogMTAyNAo+ID4gKyAgICBpdGVtczoKPiA+ICsgICAg
ICBtYXhJdGVtczogMQo+ID4gKyAgICBkZXNjcmlwdGlvbjoKPiA+ICsgICAgICBBIGxpc3Qgb2Yg
Y2hpbGQgQVBMSUMgZG9tYWlucyBmb3IgdGhlIGdpdmVuIEFQTElDIGRvbWFpbi4gRWFjaCBjaGls
ZAo+ID4gKyAgICAgIEFQTElDIGRvbWFpbiBpcyBhc3NpZ25lZCBhIGNoaWxkIGluZGV4IGluIGlu
Y3JlYXNpbmcgb3JkZXIsIHdpdGggdGhlCj4gPiArICAgICAgZmlyc3QgY2hpbGQgQVBMSUMgZG9t
YWluIGFzc2lnbmVkIGNoaWxkIGluZGV4IDAuIFRoZSBBUExJQyBkb21haW4gY2hpbGQKPiA+ICsg
ICAgICBpbmRleCBpcyB1c2VkIGJ5IGZpcm13YXJlIHRvIGRlbGVnYXRlIGludGVycnVwdHMgZnJv
bSB0aGUgZ2l2ZW4gQVBMSUMKPiA+ICsgICAgICBkb21haW4gdG8gYSBwYXJ0aWN1bGFyIGNoaWxk
IEFQTElDIGRvbWFpbi4KPiA+ICsKPiA+ICsgIHJpc2N2LGRlbGVnYXRlOgo+ID4gKyAgICAkcmVm
OiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9waGFuZGxlLWFycmF5Cj4gPiArICAg
IG1pbkl0ZW1zOiAxCj4gPiArICAgIG1heEl0ZW1zOiAxMDI0Cj4gPiArICAgIGl0ZW1zOgo+ID4g
KyAgICAgIGl0ZW1zOgo+ID4gKyAgICAgICAgLSBkZXNjcmlwdGlvbjogY2hpbGQgQVBMSUMgZG9t
YWluIHBoYW5kbGUKPiA+ICsgICAgICAgIC0gZGVzY3JpcHRpb246IGZpcnN0IGludGVycnVwdCBu
dW1iZXIgb2YgdGhpcyBBUExJQyBkb21haW4gKGluY2x1c2l2ZSkKPiA+ICsgICAgICAgIC0gZGVz
Y3JpcHRpb246IGxhc3QgaW50ZXJydXB0IG51bWJlciBvZiB0aGlzIEFQTElDIGRvbWFpbiAoaW5j
bHVzaXZlKQo+ID4gKyAgICBkZXNjcmlwdGlvbjoKPiA+ICsgICAgICBBIGludGVycnVwdCBkZWxl
Z2F0aW9uIGxpc3Qgd2hlcmUgZWFjaCBlbnRyeSBpcyBhIHRyaXBsZSBjb25zaXN0aW5nIG9mCj4g
PiArICAgICAgY2hpbGQgQVBMSUMgZG9tYWluIHBoYW5kbGUsIGZpcnN0IGludGVycnVwdCBudW1i
ZXIgb2YgdGhpcyBBUExJQyBkb21haW4sCj4gPiArICAgICAgYW5kIGxhc3QgaW50ZXJydXB0IG51
bWJlciBvZiB0aGlzIEFQTElDIGRvbWFpbi4gRmlybXdhcmUgbXVzdCBjb25maWd1cmUKPiA+ICsg
ICAgICBpbnRlcnJ1cHQgZGVsZWdhdGlvbiByZWdpc3RlcnMgYmFzZWQgb24gaW50ZXJydXB0IGRl
bGVnYXRpb24gbGlzdC4KPgo+IEkgcmVhZCBiYWNrIFJvYidzIGNvbW1lbnRzIG9uIHRoaXMgZnJv
bSBsYXN0IHRpbWUuIEhlIHNhaWQ6Cj4gfCBUaGUgbm9kZSdzIGRvbWFpbiBpdCBkZWxlZ2F0aW5n
IGl0cyBpbnRlcnJ1cHRzIHRvIHRoZSBjaGlsZCBkb21haW4gb3IKPiB8IHRoZSBvdGhlciB3YXkg
YXJvdW5kPyBUaGUgaW50ZXJydXB0IG51bWJlcnMgaGVyZSBhcmUgdGhpcyBkb21haW4ncyBvcgo+
IHwgdGhlIGNoaWxkJ3M/CgpUaGUgbm9kZSdzIGRvbWFpbiBpcyBkZWxlZ2F0aW5nIGl0cyBpbnRl
cnJ1cHRzIHRvIHRoZSBjaGlsZCBkb21haW4uCgo+Cj4gSU1PIGl0J3MgYW1iaWd1b3VzIGZyb20g
dGhlIGJpbmRpbmcgZGVzY3JpcHRpb24gd2hldGhlciB0aGUgbnVtYmVycwo+IHJlZmVyIHRvIHRo
ZSAiZmlyc3QgaW50ZXJydXB0IGluIHRoZSBwYXJlbnQgZG9tYWluIHRoYXQgaXMgZGVsZWdhdGVk
Cj4gdG8gdGhlIGNoaWxkIiBvciB0byBudW1iZXJpbmcgb2YgdGhlIGludGVycnVwdHMgd2l0aGlu
IHRoZSBjaGlsZCBkb21haW4uCj4gIlRoaXMiIGNhbiBiZSBxdWl0ZSBhbiBhbWJpZ3VvdXMgd29y
ZCwgYW5kIGl0J3Mgbm90IHRvdGFsbHkgb2J2aW91cwo+IHdoZXRoZXIgdGhlICJ0aGlzIiByZWZl
cnMgdG8gdGhlICJjaGlsZCBkb21haW4iIGVhcmxpZXIgaW4gdGhlIHNlbnRlbmNlLgo+Cj4gSSBh
bHNvIGRvIG5vdCBub3QgdGhpbmsgeW91IGhhdmUgYW5zd2VyZWQgaGlzIHF1ZXN0aW9uIGFib3V0
IHRoZQo+IGRpcmVjdGlvbmFsaXR5IG9mIHRoZSBkZWxlZ2F0aW9uIGVpdGhlciAoaXQgc2hvdWxk
IGp1c3QgYmUgYSBjb3B5LXBhc3RlCj4gZnJvbSByaXNjdixjaGlsZHJlbiwgbm8/KS4KCkZvciBB
UExJQywgdGhlIGludGVycnVwdCBkZWxlZ2F0aW9uIGlzIGFsd2F5cyBmcm9tIHBhcmVudCBkb21h
aW4KdG8gdGhlIGNoaWxkIGRvbWFpbi4KCkkgd2lsbCBhZGQgYSBzdGF0ZW1lbnQgYWJvdXQgdGhp
cyBpbiB0aGUgZGVzY3JpcHRpb24uCgo+Cj4gPiArCj4gPiArcmVxdWlyZWQ6Cj4gPiArICAtIGNv
bXBhdGlibGUKPiA+ICsgIC0gcmVnCj4gPiArICAtIGludGVycnVwdC1jb250cm9sbGVyCj4gPiAr
ICAtICIjaW50ZXJydXB0LWNlbGxzIgo+ID4gKyAgLSByaXNjdixudW0tc291cmNlcwo+Cj4gYnR3
LCBkbyB3ZSBuZWVkIHNvbWV0aGluZyBsaWtlOgo+Cj4gYW55T2Y6Cj4gICAtIHJlcXVpcmVkOgo+
ICAgICAgIC0gaW50ZXJydXB0cy1leHRlbmRlZAo+ICAgLSByZXF1aXJlZDoKPiAgICAgICAtIG1z
aS1wYXJlbnQKCk9rYXksIEkgd2lsbCB1cGRhdGUuCgo+Cj4gJiBob3BlZnVsbHkgSSBkaWRuJ3Qg
cHJldmlvdXNseSBhc2sgdGhpcyBvbmU6Cj4gZGVwZW5kZW5jaWVzOgo+ICAgcmlzY3YsZGVsZWdh
dGU6IFsgcmlzY3YsY2hpbGRyZW4gXQo+Cj4gQXMgYW4gYXNpZGUsIEkgc3RpbGwgdGhpbmsgInJp
c2N2LGRlbGVnYXRlIiBsb29rcyBzdHJhbmdlIGhlcmUgYWxvbmdzaWRlCj4gInJpc2N2LGNoaWxk
cmVuIiBzaW5jZSAiZGVsZWdhdGUiIGlzIHNpbmd1bGFyIGFuZCAiY2hpbGRyZW4iIGlzIHBsdXJh
bC4KPiBUaGUgcGx1cmFsIHdvdWxkIGJlICJkZWxlZ2F0ZXMiLCBidXQgImRlbGVnYXRpb24iIHdv
dWxkIGFsc28gZml0IGJldHRlcgo+IHRoYW4gImRlbGVnYXRlIi4KCk9rYXksIEkgd2lsbCByZW5h
bWUgaXQgdG8gInJpc2N2LGRlbGVnYXRpb24iLgoKPgo+IENoZWVycywKPiBDb25vci4KClJlZ2Fy
ZHMsCkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
