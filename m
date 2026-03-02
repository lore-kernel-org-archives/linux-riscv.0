Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E8A8EA4E24
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 15:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Y8BB5ZfZ+cRyKRTs5DXv2afroirgUzG2uX8LfTsh40=; b=zXaKcemWgu/+jI
	xI2lfmOEgusDT7f87jBhZMTXXspwj6lo9zHGz6lipAPyzHr1MOHd1eYHoAgxtxlXUz/mQ2uIszsCX
	/SK2hfCDjOTNEVQAvbUFMlGTe3m2/BTt/Dfaw+kwghylgI7xy/nQd2XD0pZqIpIhcvjfGSGWf3vcz
	8ypRqL8Co7M/EC+DJqjOvf0wHNB+EBJ5svilf2K4t304DzuHTl1V+aMLFcHE9aLwJzBbWPKfJARJQ
	V7RUDidoRRM7NSxaNJBmWuBmBOMrBkxQXEDIIMTvp+KR42Z2s77L2Y3JJhk7gBbknYPzkLMx8yT0U
	HhzqGS+yJVmnziopqLPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5P4-0000000DNzf-043u;
	Mon, 02 Mar 2026 15:41:50 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5P1-0000000DNyu-1lSM
	for linux-riscv@lists.infradead.org;
	Mon, 02 Mar 2026 15:41:48 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-899f79df682so13018586d6.2
        for <linux-riscv@lists.infradead.org>; Mon, 02 Mar 2026 07:41:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772466105; cv=none;
        d=google.com; s=arc-20240605;
        b=b6gLNIW5R6Ka8bGSqwXUHV29tA1GkxBpfqLAU4s+DU6zvZn5atTQlInpnIdMae4Xua
         0I2sRR3buC4CVM0tQpNehqBBxYcCJDcvwgZa1g24n+nsOO9HyjJUdFDR+c+eOFpavArj
         HLjeiOd8SvlgK8tnMcLmE4WXeKvBy2kAluFEgcj66meR5y+XohoKzXpSUau8OdwquOPt
         YwQ9YOVanVhpWvTC4zuh5J3zheYP67wxaItOLMwlZdyhG3IGk7k8ZPeNH63ILZ5LXWkj
         GQ18ucyHvddNLmzFIh3PzH215pPIS4tMpLXcmcLPuEd5PzQKRpbm88eXVeGvboFDI9Va
         MTJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AXg6Ypvqjq2PoxAf2Q1/vJlxrd14L9sIF+RlfxzIaKI=;
        fh=CIWGZ0uJEjODnvVo89ea19khyP/STPyFzfYyEtdGRA8=;
        b=d1aFwKHBc00yYQzHB6ViFguuFl6wOg+981lL2X6OI1266olnvzbPpDml85Macpbsgs
         1pJ+3uO0eOf/qizb3BN/xEdjO31KV7T6ZeZIyyWqgpT4HxcVzMJ0YbL7d2VmNZA9VARk
         2++3KVmUVBxPlfDfGEeHIPp/0GufWCusTUlnjE0JM8VyLwoCVOIyrhBzKl7uo8bnQLO9
         9i+V+5AOfY3IUXn0cP+TGkIumbsPeFramBdqUKHG6IRew15sXFhpYWKKx1lK5lf+bKL6
         R6NWt0ajeo8h9quS6rmrMvhh5JglVFOg71D/x1kycF1xMtPy8B/8ydzRgbjfnoM2dvif
         m7Fg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772466105; x=1773070905; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AXg6Ypvqjq2PoxAf2Q1/vJlxrd14L9sIF+RlfxzIaKI=;
        b=EoP2LvmUrQvS6iuiuY4N0LShpUQMn2VqWOyM2BeZR9Zv3qYZThIFZjk4bJmF/MLulm
         D1uKmYsYOgqLXihRq+xRrGuwxKHskZhsNL2tHQhlT/BuqhL42MGNApdJflAg/+iOO6JV
         xzvv07u92ls6b2Y6+RzGo1MHZVuDJWF/2a0wL/v1elnAIsdFjV6wDLPCuIvTZJbCRjEH
         ce6gluTlG+YGEXMCmVBuuPPPKmcLoFtknJZIy6GgKrT18/LG/ycdE0H3Ebmbr8BmbTPL
         w7ZkWg/Xl1Rp5mmKnMi1XJsUEY8B++E2GyxeYrkLXJWIZ5FWQQRVJdMrs6VrqvoSd/d4
         vaWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772466105; x=1773070905;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AXg6Ypvqjq2PoxAf2Q1/vJlxrd14L9sIF+RlfxzIaKI=;
        b=ReIl0yYpFl3o6722BY4Li5/NHv1zYxaPghAgkV3rpQ1yb7Bk1NR69WI1BZDorldBO5
         BiJB+/8+vTsQSaoEMwOnrLolBeeY3ZgmhZbsFIGjOT+ooalTH7CEcoPbJBm6sD37y7M0
         twdiQlqr1aZBkI4efNv2y49Cku5GJEICRib7UGRbzOKgFHeRBVU06pOeW+WTjH67I97b
         nc8yxtGWUQGt0GItFCm8vsVyA8F0/62O0LdsbktaeJ8oiRZwLGcxsKEWiRhvCaahU7GR
         IQwibKOW9rwQrX/5/oyTui8GmTKM/f0bLXUBNareTX5gHV69y/OSZdrtKd0VVdcO7g3G
         dWpg==
X-Forwarded-Encrypted: i=1; AJvYcCW/V91tA4MPVnqHuLc0/1uF//Ld1OEs8UQmp/P31QANZtPinlAePBFnprBt6i8wunWxGPrxyVSPuQqGmQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxu3CTUwIIukP1K53Ekp4ncu27heKDrvIvwcl9zIxB1oW+O/JAl
	C1EOsNGKG6zIVhYLYWJN/YF/F7v/nYm3K1FeHQzsjsg6E5lrObRVyvV7KbAIJvGA3WAJl5jK0Dv
	FzeTTTC+9UCD3/0e15xXXbyYZo36FBN0i4k4Qi9ex
X-Gm-Gg: ATEYQzxcW5YJNz8GE8Wf1STIw5E175CXU+Oy59tcJyDLCECQKT1rHvWb6je2EMWdDxF
	x6WUY0ruPgnGmnSMEFqjsAjpLmvVc/+od8CxZyl5HVcTMSyd0BXAtsuKLOWO66+GVwdPx0dXcdJ
	TGeQ0dH9UaX0lUvk0RNlvGDVPNvt4EUBiOTdRBaTQga0kbyYCZgVdevKkW9xODagaiLVqRmZxJ1
	50x738AaXEqqAIAwDRp5J41uejgIxP3VPT/BOfYxSDjBkJB8FqAYuAEDxw8cv1G5cf+VPITiA9w
	YApB6GNBQwJ0M6vAizj/nhcVkMjwjgC8hkmhLg==
X-Received: by 2002:a05:6214:b61:b0:899:edac:29da with SMTP id
 6a1803df08f44-899edac2ea4mr92564036d6.9.1772466104463; Mon, 02 Mar 2026
 07:41:44 -0800 (PST)
MIME-Version: 1.0
References: <20260302-handle-kfence-protect-spurious-fault-v1-0-25c82c879d9c@iscas.ac.cn>
 <20260302-handle-kfence-protect-spurious-fault-v1-1-25c82c879d9c@iscas.ac.cn>
In-Reply-To: <20260302-handle-kfence-protect-spurious-fault-v1-1-25c82c879d9c@iscas.ac.cn>
From: Alexander Potapenko <glider@google.com>
Date: Mon, 2 Mar 2026 16:41:05 +0100
X-Gm-Features: AaiRm519c31SJCJvVbfmwtY5C0BIz6yZb5Q3Hs1_ztYk30q3Q8m7aBM-_x2qO04
Message-ID: <CAG_fn=UQj+bdY2YojmfVf=qRQgCttD=PqE0h=vm4pAbtNRP-uw@mail.gmail.com>
Subject: Re: [PATCH 1/3] riscv: mm: Rename new_vmalloc into new_valid_map_cpus
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Marco Elver <elver@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	Palmer Dabbelt <palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_074147_463651_3EE685E7 
X-CRM114-Status: GOOD (  13.74  )
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

T24gTW9uLCBNYXIgMiwgMjAyNiBhdCAzOjIx4oCvQU0gVml2aWFuIFdhbmcgPHdhbmdydWlrYW5n
QGlzY2FzLmFjLmNuPiB3cm90ZToKPgo+IEluIHByZXBhcmF0aW9uIG9mIGEgZnV0dXJlIHBhdGNo
IHVzaW5nIHRoaXMgbWVjaGFuaXNtIGZvciBub24tdm1hbGxvYwo+IG1hcHBpbmdzLCByZW5hbWUg
bmV3X3ZtYWxsb2MgaW50byBuZXdfdmFsaWRfbWFwX2NwdXMgdG8gYXZvaWQgbWlzbGVhZGluZwo+
IHJlYWRlcnMuCj4KPiBObyBmdW5jdGlvbmFsIGNoYW5nZSBpbnRlbmRlZC4KPgo+IFNpZ25lZC1v
ZmYtYnk6IFZpdmlhbiBXYW5nIDx3YW5ncnVpa2FuZ0Bpc2Nhcy5hYy5jbj4KPiAtLS0KPiAgYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9jYWNoZWZsdXNoLmggfCAgNiArKystLS0KPiAgYXJjaC9yaXNj
di9rZXJuZWwvZW50cnkuUyAgICAgICAgICAgfCAzOCArKysrKysrKysrKysrKysrKystLS0tLS0t
LS0tLS0tLS0tLS0tCj4gIGFyY2gvcmlzY3YvbW0vaW5pdC5jICAgICAgICAgICAgICAgIHwgIDIg
Ky0KPiAgMyBmaWxlcyBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCAyMyBkZWxldGlvbnMoLSkK
Pgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NhY2hlZmx1c2guaCBiL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vY2FjaGVmbHVzaC5oCj4gaW5kZXggMDA5MjUxM2MzMzc2Li5i
NmQxYTVlYjc1NjQgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jYWNoZWZs
dXNoLmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NhY2hlZmx1c2guaAo+IEBAIC00
MSw3ICs0MSw3IEBAIGRvIHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFwKPiAgfSB3aGlsZSAoMCkKPgo+ICAjaWZkZWYgQ09ORklHXzY0QklUCj4gLWV4
dGVybiB1NjQgbmV3X3ZtYWxsb2NbTlJfQ1BVUyAvIHNpemVvZih1NjQpICsgMV07Cj4gK2V4dGVy
biB1NjQgbmV3X3ZhbGlkX21hcF9jcHVzW05SX0NQVVMgLyBzaXplb2YodTY0KSArIDFdOwoKbmV3
X3ZhbGlkX21hcF9jcHVzIGlzIGEgYml0bWFwLCByaWdodD8gSWYgc28sIHlvdSBhcmUgYWxsb2Nh
dGluZyA4eAptb3JlIG1lbW9yeSB0aGFuIG5lZWRlZC4KQ2FuIHdlIHVzZSBERUNMQVJFX0JJVE1B
UCBpbnN0ZWFkPwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
