Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 702A4E77188
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jan 2025 12:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Iwzj4kxTeceOtlupzNZT8zz/z8sOF9GU/A/5TEDZMzQ=; b=aiwBFEPOLR81Ki
	b/z4Fc/ob1fUNLLwHPMVEEiIQS+hYcFekynVG694rPvl0psUAhaBHTnh1lNxjkBBLMmPOLfrNxTYO
	5f1MNswQkeGD4wN12+ba48ccVRnSQmPRulBRvkr4P5Ni/ggtFAqZg+LljT/FBmQZeY8Bc6CXYvvzp
	bhZ8qCgaqOXmMdV42F9HkrtSKMS6BNqEOFeSs8f7SEM5IBnD5TpZEJ6jQW1jaWZBwIMGeX9DxAJDp
	Y6XrCS825VZn74j9z6MwjwHjDlxh4oeY2jKRWo9nll/sQmrF5dNEqrXVJKmKjpJ5ywITzF6AEYijp
	DpzZF6GrfIevrOigwENA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTKg1-0000000AOr1-1db4;
	Thu, 02 Jan 2025 12:51:49 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTKcn-0000000AO9o-1g6a
	for linux-riscv@lists.infradead.org;
	Thu, 02 Jan 2025 12:48:30 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3a9cb80dbfdso83791535ab.0
        for <linux-riscv@lists.infradead.org>; Thu, 02 Jan 2025 04:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1735822108; x=1736426908; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=htb8lqDGw35JYE+3oU0x+D+hwZrrHaGw4OPmXBsVYcM=;
        b=wWh+jCzq7uAn+UgAMsn8MlrHb2KQjeBS7pq/aFcY2hOAUagx8Y9MwWMwHUHhSLEl51
         Xa5KAPX78GcsnNI3h/6OBgX+XAsUPyBE/jzecUJ27aZjIvpuwWVTYLTpqfmlxiyeuxP+
         nr6jovmLAGqAKGe7woZv1LkigBzS2JIg0X4iUEz8G/G8bOOvxM0VWwaVunVDuz3YYwuo
         8A0vtqSFY2OkOtgLUOyOOsqHQUl6Uz+jOdJdVjnqJW42MGUKspB6+IDwaCyow8wlTppA
         DSRkW3sA6HWqERtMGZzUF+JlgA4zncdiWi2QA0YPyftHCoySKdAggcD8ky96U+VdlonK
         6jLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735822108; x=1736426908;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=htb8lqDGw35JYE+3oU0x+D+hwZrrHaGw4OPmXBsVYcM=;
        b=lQiiu6M4tR6QLjHwH++bEt+vBcTCT5IX1ERn3rXPqb4pk4x23OuaVZ20C2b51xZ0Ew
         Xk7fH4z9qDQYJfuutumW4s/u3ZSKokfpfjcIIKeYIJVRrtBdYNoKntSeFxHP+SyZRHIH
         updaujyvvE8ey6Q9rpg2OMES3sizK3RbGbD6BXTxC2XaUYoHuViANYlJZcK329rKkUrh
         rCPoWy6ayHt7LT5nqXLx5WL1NHOFGTHu4AROm9oKL+BElxiV4RxpFWjDBG27tVZz7Kgg
         FJpkG65AMn7uf0ZRi0pFZJimjnBXBhg7jXiIXei6lpHW+VSTvXfpVjWPP/ILjOdD7Pso
         c8sA==
X-Forwarded-Encrypted: i=1; AJvYcCWRhzWXIu507RTIPvirSSo4+ZY5EaRomQl48ffJBOGrx33GhUbCX40uqsQS5jIyllcl4UBZZTWAxB+rpA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwgWV+U5qB/zfe5MI90g+/UsIs6NwO5YuyGpa4jcgcDs0KVESiq
	SF/sgmCStSP+EV5dAcoqk7g5UeZrTeZH35zkt6XGeAC7nvBSNoBpgHgB2DQRYY1JgnhooTxJmJl
	2r27BAEhraLI8rJVQLeDCzoqE3TQWM2H69nLqnw==
X-Gm-Gg: ASbGnct+NUZyCcbIuwSPxWy4jxLBZaoIHv/wZ+SgWCZ+PqmD0csTx2HlsAjh9WqslD6
	V92srEB4+Q06SMIBf+udVGwN61JmO5EXVTGUpKQk=
X-Google-Smtp-Source: AGHT+IHhcscFd0foArFRjCY8olZcuTm9LulhMnRFc36gpM5bEvm31KfGC4tMH4d0v2YwVaRuvE/6sjQDvnXNPlnsyWA=
X-Received: by 2002:a05:6e02:1c2b:b0:3a7:7ded:5219 with SMTP id
 e9e14a558f8ab-3c2d59193b5mr346054555ab.21.1735822107884; Thu, 02 Jan 2025
 04:48:27 -0800 (PST)
MIME-Version: 1.0
References: <20250102094116.3847894-1-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20250102094116.3847894-1-vladimir.kondratiev@mobileye.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 2 Jan 2025 18:18:17 +0530
X-Gm-Features: AbW1kvZmLYoVDzYbLPs-t3bjXuk7tSEmS2bUO8YN1gw3Uy5PBVZUwY-bN0ouxkc
Message-ID: <CAAhSdy0cBkogjR1DbcS9-TLRbKiDqVTydrYQCihnEHDRu69CoQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] riscv,aplic: support for hart indexes
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_044829_603064_72A34FAC 
X-CRM114-Status: GOOD (  19.96  )
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

T24gVGh1LCBKYW4gMiwgMjAyNSBhdCAzOjEx4oCvUE0gVmxhZGltaXIgS29uZHJhdGlldgo8dmxh
ZGltaXIua29uZHJhdGlldkBtb2JpbGV5ZS5jb20+IHdyb3RlOgo+Cj4gUmlzYy12IEFQTElDIHVz
ZXMgImhhcnQgaW5kZXgiIHRvIGFjY2VzcyBkYXRhIHBlciBkZXN0aW5hdGlvbiBoYXJ0Lgo+IEN1
cnJlbnQgaW1wbGVtZW50YXRpb24gYXNzdW1lcyBoYXJ0IGluZGV4ZXMgYXJlIGNvbnNlY3V0aXZl
IGludGVnZXJzCj4gc3RhcnRpbmcgZnJvbSAwLCB3aGlsZSBSaXNjLVYgZG9jdW1lbnRhdGlvbiBz
YXlzIGl0IG1heSBiZQo+IGFyYml0cmFyeSBudW1iZXJzLCB3aXRoIGEgY2x1ZSB0aGF0IGl0IG1h
eSBiZSByZWxhdGVkIHRvIHRoZSBoYXJ0IElEcy4KPgo+IEluIGFsbCBib2FyZHMgSSBzZWUgaW4g
dG9kYXkncyBrZXJuZWwsIGhhcnQgSURzIGFyZSBjb25zZWN1dGl2ZQo+IGludGVnZXJzLCB0aHVz
IHVzaW5nIGRhcnQgSURzIGlzIHRoZSBzYW1lIGFzIGluZGV4ZXMuCj4KPiBIb3dldmVyLCBmb3Ig
dGhlIE1JUFMgUDg3MDAsIGhhcnQgSURzIGFyZSBkaWZmZXJlbnQgZnJvbSBpbmRleGVzLAo+IG9u
IHRoaXMgU29DIHRoZXkgZW5jb2RlIHRocmVhZCBudW1iZXIsIGNvcmUgYW5kIGNsdXN0ZXIgaW4g
Yml0cwo+IFswLi4zXSwgWzQuLjE1XSwgWzE2Li4xOV0gcmVzdWx0aW5nIFNvYyBjb25zaXN0aW5n
IG9mIDMgY2x1c3RlcnMgKgo+IDQgY29yZXMgKiAyIHRocmVhZHMgd2l0aCBoYXJ0IElEczoKPiAw
eDAsIDB4MSwgMHgxMCwgMHgxMSwgMHgyMCwgMHgyMSwgMHgzMCwgMHgzMSwgMHgxMDAwMCBldGMu
Cj4KPiBDaGFuZ2UgZGVmYXVsdCBoYXJ0IGluZGV4IHRvIGJlIGhhcnQgSUQgcmVsYXRlZCB0byB0
aGUgc3RhcnQgb2YgZG9tYWluLAo+IGFuZCBhZGQgb3B0aW9uYWwgcHJvcGVydHkgdG8gY29uZmln
dXJlIGFyYml0cmFyeSBpbmRleGVzLgoKV2UgZG9uJ3QgbmVlZCBhbnkgQVBMSUMgRFQgYmluZGlu
ZyBjaGFuZ2UgZm9yIHN1cHBvcnRpbmcgcmFuZG9tCkhBUlQgSUQgYXNzaWdubWVudHMuIFBsZWFz
ZSBzZWUgYmVsb3cgZm9yIGEgZGV0YWlsZWQgZXhwbGFuYXRpb24uCgo+Cj4gVXNlIG9mICJkZXZp
Y2VfcHJvcGVydHkiIEFQSSBhbGxvd3MgdG8gY292ZXIgYm90aCBBQ1BJIGFuZCBPRiBpbiBzaW5n
bGUKPiBjb2RlCj4KPiAxLXN0IGNvbW1pdCBhZGRzIGR0LWJpbmRpbmdzLCAyLW5kIC0gY29kZQo+
Cj4gVmxhZGltaXIgS29uZHJhdGlldiAoMik6Cj4gICBkdC1iaW5kaW5nczogaW50ZXJydXB0LWNv
bnRyb2xsZXI6IGFkZCByaXNjLXYsYXBsaWMgaGFydCBpbmRleGVzCj4gICBpcnFjaGlwL3Jpc2N2
LWFwbGljOiBhZGQgc3VwcG9ydCBmb3IgaGFydCBpbmRleGVzCgpUaGUgUklTQy1WIEFQTElDIGRy
aXZlciBkb2VzIG5vdCBhc3N1bWUgYW55IGNvcnJlbGF0aW9uIGJldHdlZW4KQVBMSUMgIkhBUlQg
SW5kZXgiIGFuZCB0aGUgYWN0dWFsIEhBUlQgSUQgb2YgdmFyaW91cyBIQVJUcy4KCkVhY2ggQVBM
SUMgZG9tYWluIGhhcyBpdHMgb3duIDE0Yml0ICJIQVJUIEluZGV4IiBzcGFjZSBhbmQgdGhlCkFQ
TElDIGRyaXZlciBkZXRlcm1pbmVzICJIQVJUIEluZGV4IiBiYXNlZCBvbiB0aGUgQVBMSUMgbW9k
ZQooRGlyZWN0L01TSSBtb2RlKS4KClRoZSBBUExJQyBkb21haW4gaW4gZGlyZWN0IG1vZGUgcmVx
dWlyZXMgIkhBUlQgSW5kZXgiIHRvIGJlCmJldHdlZW4gMCB0byBOIC0gMSB3aGVyZSBOIGlzIHRo
ZSBudW1iZXIgb2YgSEFSVHMgdGFyZ2V0ZWQgYnkKdGhlIEFQTElDIGRvbWFpbiBiZWNhdXNlIHRo
ZSBBUExJQyBJREMgc3RydWN0dXJlcyBhcmUgcGxhY2VkCmNvbnNlY3V0aXZlbHkgaW4gdGhlIE1N
SU8gc3BhY2UgYW5kIGxvY2F0ZWQgYmFzZWQgb24gIkhBUlQgaW5kZXgiLgooUmVmZXIsIGZpcnN0
IHBhcmFncmFwaCBvZiB0aGUgc2VjdGlvbiAiNC44IEludGVycnVwdCBkZWxpdmVyeSBkaXJlY3Rs
eQpieSB0aGUgQVBMSUMiIG9mIHRoZSByYXRpZmllZCBSSVNDLVYgQUlBIHYxLjAgc3BlY2lmaWNh
dGlvbikKCk9uIHRoZSBvdGhlciBoYW5kLCB0aGVyZSBpcyBubyBjb25zdHJhaW50IG9uIHRoZSAi
SEFSVCBJbmRleCIgc3BhY2UKZm9yIHRoZSBBUExJQyBkb21haW4gaW4gTVNJIG1vZGUgYmVjYXVz
ZSB0aGUgIkhBUlQgSW5kZXgiIGJpdHMKYXJlIHBhcnQgb2YgdGhlIE1TSSB0YXJnZXQgYWRkcmVz
cyBnZW5lcmF0ZWQgYnkgQVBMSUMuCihSZWZlciwgc2VjdGlvbiAiNC45LjEgQWRkcmVzc2VzIGFu
ZCBkYXRhIGZvciBvdXRnb2luZyBNU0lzIiBvZgp0aGUgcmF0aWZpZWQgUklTQy1WIEFJQSB2MS4w
IHNwZWNpZmljYXRpb24pLgoKVGhlIFJJU0MtViBBUExJQyBkaXJlY3QgbW9kZSBkcml2ZXIgdXNl
cyB0aGUgImludGVycnVwdHMtZXh0ZW5kZWQiCkRUIHByb3BlcnR5IHRvIGRldGVybWluZSBob3cg
YW4gQVBMSUMgZG9tYWluIGNvbm5lY3RzIHRvIGEKc2V0IG9mIEhBUlRzLiBIZXJlJ3MgaG93IHRo
aXMgRFQgcHJvcGVydHkgaXMgdXNlZDoKMSkgVGhlIG51bWJlciBvZiBlbnRyaWVzIGluIHRoZSAi
aW50ZXJydXB0cy1leHRlbmRlZCIgRFQgcHJvcGVydHkKdGVsbHMgdGhlIG51bWJlciBvZiBBUExJ
QyBJREMgc3RydWN0dXJlcyB3aGVyZSB0aGUgZmlyc3QgZW50cnkgaXMgZm9yCiJIQVJUIEluZGV4
ID0gMCIsIHRoZSBzZWNvbmQgZW50cnkgaXMgZm9yICJIQVJUIEluZGV4ID0gMSIgYW5kIHNvIG9u
LgoyKSBUaGUgZmlyc3QgdmFsdWUgKGFrYSBwaGFuZGxlKSBvZiBlYWNoIGVudHJ5IGluIHRoZSAi
aW50ZXJydXB0cy1leHRlbmRlZCIKRFQgcHJvcGVydHkgcG9pbnRzIHRvIHRoZSB0YXJnZXQgSEFS
VCBJTlRDLgozKSBUaGUgc2Vjb25kIHZhbHVlIG9mIGVhY2ggZW50cnkgaW4gdGhlICJpbnRlcnJ1
cHRzLWV4dGVuZGVkIiBEVApwcm9wZXJ0eSBkZXRlcm1pbmVzIHRoZSB0YXJnZXQgcHJpdmlsZWdl
IGxldmVsIG9uIHRoZSBIQVJULiBGb3IKZXhhbXBsZSwgMTEgbWVhbnMgIk0tbW9kZSBleHRlcm5h
bCBpbnRlcnJ1cHQiIGFuZCA5IG1lYW5zCiJTLW1vZGUgZXh0ZXJuYWwgaW50ZXJydXB0IgoKVGhl
IFJJU0MtViBBUExJQyBNU0kgbW9kZSBkcml2ZXIgZXh0cmFjdHMgdGhlICJIQVJUIEluZGV4Igp0
aGUgdGFyZ2V0IE1TSSBhZGRyZXNzIGFuZCB0aGUgUklTQy1WIElNU0lDIGRyaXZlciBzZWxlY3Rz
CnRoZSB0YXJnZXQgSEFSVCBmb3IgaGFuZGxpbmcgYSBwYXJ0aWN1bGFyIEFQTElDIE1TSS1tb2Rl
CmludGVycnVwdC4KCkNsZWFybHksIHRoZSBBUExJQyBEVCBiaW5kaW5nIGlzIGZsZXhpYmxlIGFu
ZCBkb2VzIG5vdCBkZXBlbmQKdXBvbiB0aGUgSEFSVCBJRHMgYXNzaWduZWQgdG8gdGhlIEhBUlRz
LgoKVGhlICJFeGFtcGxlMSIgb2YgdGhlIHJpc2N2LGFwbGljLnlhbWwgYWxyZWFkeSBzaG93cyB0
aHJlZQpkaWZmZXJlbnQgQVBMSUMgZG9tYWlucyB0YXJnZXRpbmcgZGlmZmVyZW50IHNldHMgb2Yg
SEFSVHMgYW5kCnByaXZpbGVnZSBsZXZlbHMuIEluIGZhY3QsIHRoZSB1cHN0cmVhbSBRRU1VIHZp
cnQgbWFjaGluZSBhbHJlYWR5CnN1cHBvcnRzIGNyZWF0aW5nIHVwIHRvIDggQVBMSUMgZG9tYWlu
cyBpbiBkaXJlY3QgbW9kZSB3aGVyZQplYWNoIHRhcmdldHMgYSBkaWZmZXJlbnQgc2V0IG9mIEhB
UlRzIGFuZCBwcml2aWxlZ2UgbGV2ZWxzLgoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
