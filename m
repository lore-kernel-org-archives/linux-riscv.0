Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE682CCD192
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 14:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rWBu/1Tum9SrPzgNz/MU3R7K0rUkedajAr5/k8aXXVw=; b=JNPuEeiKrk5BsA
	wVAJ1444wONMH+Bg/sGw6nd8TVH5H9c2q5+J8y04kKJ+kpZuKvBHq+9POAncO4/ohTVyJ+Vt9YtGV
	veS02bfUvecXZwoeBueyD9046ruuYQFj2eDaOh5zu9+wuCtDTgNuLlv8anfutzb6w5vvhQ7yRbmVN
	NSDqTy2Y2rGvlibnkH6RxDOKtc1BRNuFFwP/NWN/Xmg+PlrBz3tIjL7ZIzMqGjgr4VjMofdiUWZnO
	7Ce6tVzdr/4PtjliuBr2LNQ9T/0TXC8LfCcjrm657IZy72D5RvZYIB2+Xi/PJguGesqGY2prFCOrQ
	BTM+4MJ3cXUaK04JrqVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8g7n-0000000Gdfk-1UYy;
	Tue, 14 Oct 2025 14:35:39 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8g7k-0000000GdfG-0YGy
	for linux-riscv@lists.infradead.org;
	Tue, 14 Oct 2025 14:35:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760452533;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MkDsCPEbcLpNNIg73v0m64/0N+FbfRudeNnq+y5jkqI=;
	b=IidRnlN4yiqiWlf+arTpsp8q3MjMcxrSWc/nnu0Y2on0g4ZLttBxket/tj14j/uKFYZcfS
	kXTQexqMqgS8xggEDwXfrWGdUtFKTxa2uZUAWVmYcwGU3bEjovZFFiTRJzHn6/Vb4rLIl1
	EgN3XkX6exXei9fgENEDyhcTsUrTMyM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-42-qLr1a1RpM8OIowxAQpZIIg-1; Tue, 14 Oct 2025 10:35:32 -0400
X-MC-Unique: qLr1a1RpM8OIowxAQpZIIg-1
X-Mimecast-MFC-AGG-ID: qLr1a1RpM8OIowxAQpZIIg_1760452531
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-46e31191379so39798395e9.3
        for <linux-riscv@lists.infradead.org>; Tue, 14 Oct 2025 07:35:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760452531; x=1761057331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MkDsCPEbcLpNNIg73v0m64/0N+FbfRudeNnq+y5jkqI=;
        b=Ktc323CL0oYntkFTpstcSuF3UgkNonOr+RcHXtRbZLupG+rcv8helNYL1ZITNw/kBU
         H4ETZjpaZWzKuhbxRKyJ/V9mlvF04gHk+KHT+qUssRvjcrZI1H25ev5OrfSHkFdMzaK4
         ez6cOj10HreghoKYjjtZYcs4mYVjPG1bD8LftqFAYMVi3U4tQi00WUo6Jf/JSHag/b/f
         c4R1fC4bCdKzZRFS138Q8ifcchhaLGbrNX/kOFjZnVY74tvMGwShTrQ/OsOYjraJ+nTK
         dX0UjJWOlbg5Wr1shBRkzrjtA3W5053EKHRAHwmux5GCk/VNT2rxEMWSLGxoQmP4izBo
         O3jA==
X-Forwarded-Encrypted: i=1; AJvYcCXXKhXRGe2LSMxoFaVNOdqqkdmBvnFKgy70imobLV49ppfI1ZQV39yM5e4duBk+jrGKDR9mrPoWWZ6YQw==@lists.infradead.org
X-Gm-Message-State: AOJu0YynUj/sJJ8yo4vu5KC805Ecffpv0hqlU/CDP89Ctj/lFjPdQvr0
	JqMLcnZBYSR5G61pLcjFnKxHXSTqLeTDq7Hj08AE6RtORF1PwpQHG5n4hU1Z0jMLev7FDsqiGqs
	6R0XFBJb3LJPMcC7aujCxDShKLWuL9TK4p7De4rRR8lrFAYfPnWt5wPac9APHhkhy1vWqfIWum4
	463FyEoStpAZaJ5Rp4Iw/YDMi9y60t+2LH9Go+46v2ccgd
X-Gm-Gg: ASbGnctouIiRyYp59zj5NKVp3hoA9fabkq9ZF7Dnn8xlnlwpfKv1rzfT1RY9Rz+w7qj
	TbNKHzMnPwK6rIEOHG6EshLrNVmlfSb0Dsl8dRXZesMfTVChYPpOqu4PYxYAkq0xpmLj7p4RPp+
	2jcTA5fWTaAdqLHcxMF04I
X-Received: by 2002:a05:600c:198f:b0:46e:3b1a:20d7 with SMTP id 5b1f17b1804b1-46fa9af8595mr204735775e9.19.1760452530941;
        Tue, 14 Oct 2025 07:35:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRryLs4WIGONNx/31gi7TRTpZGUqKiXRcYoOaODwhm9G1YC6At5q1zb3Ec5A0TF/vYqP4NuMRa2aDH00hz3h4=
X-Received: by 2002:a05:600c:198f:b0:46e:3b1a:20d7 with SMTP id
 5b1f17b1804b1-46fa9af8595mr204735495e9.19.1760452530521; Tue, 14 Oct 2025
 07:35:30 -0700 (PDT)
MIME-Version: 1.0
References: <20251013111539.2206477-1-lzampier@redhat.com> <20251013111539.2206477-4-lzampier@redhat.com>
 <20251013-trimness-stainless-48343053f204@spud> <6b7c3c90-d3bd-4d75-9cc0-74d3945fbdfd@iscas.ac.cn>
In-Reply-To: <6b7c3c90-d3bd-4d75-9cc0-74d3945fbdfd@iscas.ac.cn>
From: Lucas Zampieri <lzampier@redhat.com>
Date: Tue, 14 Oct 2025 15:35:18 +0100
X-Gm-Features: AS18NWDHw3ilq3xf4zsXNnm36BWMn-DfS6Dq0bHoaXz_kGv7G-Ly9Z3fIfWQqSg
Message-ID: <CAOOg__Cx1x0745LCPh5=EMiDeAVUWy+zzGCqb=BQ-RSFoyZDLQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] irqchip/plic: add support for UltraRISC DP1000 PLIC
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org, 
	Charles Mirabile <cmirabil@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Vivian Wang <dramforever@live.com>, linux-riscv@lists.infradead.org, 
	Zhang Xincheng <zhangxincheng@ultrarisc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QJEMA0jAnxIbDCdeonTEUl3kpt2IM9uD2xY5WFehv6g_1760452531
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_073536_431957_45CF0B93 
X-CRM114-Status: GOOD (  30.44  )
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

SGkgQ29ub3IgYW5kIFZpdmlhbiwKCk9uIFR1ZSwgT2N0IDE0LCAyMDI1IGF0IDEwOjE14oCvQU0g
Vml2aWFuIFdhbmcgPHdhbmdydWlrYW5nQGlzY2FzLmFjLmNuPiB3cm90ZToKPgo+IEhpIENvbm9y
LAo+Cj4gT24gMTAvMTQvMjUgMDI6MzAsIENvbm9yIERvb2xleSB3cm90ZToKPiA+IE9uIE1vbiwg
T2N0IDEzLCAyMDI1IGF0IDEyOjE1OjM4UE0gKzAxMDAsIEx1Y2FzIFphbXBpZXJpIHdyb3RlOgo+
ID4+IEZyb206IENoYXJsZXMgTWlyYWJpbGUgPGNtaXJhYmlsQHJlZGhhdC5jb20+Cj4gPj4KPiA+
PiBBZGQgYSBuZXcgY29tcGF0aWJsZSBmb3IgdGhlIHBsaWMgZm91bmQgaW4gVWx0cmFSSVNDIERQ
MTAwMCB3aXRoIGEgcXVpcmsgdG8KPiA+PiB3b3JrIGFyb3VuZCBhIGtub3duIGhhcmR3YXJlIGJ1
ZyB3aXRoIElSUSBjbGFpbWluZy4KPiA+Pgo+ID4+IFdoZW4gY2xhaW1pbmcgYW4gaW50ZXJydXB0
IG9uIHRoZSBEUDEwMDAgUExJQyBhbGwgb3RoZXIgaW50ZXJydXB0cyBtdXN0IGJlCj4gPj4gZGlz
YWJsZWQgYmVmb3JlIHRoZSBjbGFpbSByZWdpc3RlciBpcyBhY2Nlc3NlZCB0byBwcmV2ZW50IGlu
Y29ycmVjdAo+ID4+IGhhbmRsaW5nIG9mIHRoZSBpbnRlcnJ1cHQuCj4gPj4KPiA+PiBXaGVuIHRo
ZSBQTElDX1FVSVJLX0NMQUlNX1JFR0lTVEVSIGlzIHByZXNlbnQsIGR1cmluZyBwbGljX2hhbmRs
ZV9pcnEKPiA+PiB0aGUgZW5hYmxlIHN0YXRlIG9mIGFsbCBpbnRlcnJ1cHRzIGlzIHNhdmVkIGFu
ZCB0aGVuIGFsbCBpbnRlcnJ1cHRzCj4gPj4gZXhjZXB0IGZvciB0aGUgZmlyc3QgcGVuZGluZyBv
bmUgYXJlIGRpc2FibGVkIGJlZm9yZSByZWFkaW5nIHRoZSBjbGFpbQo+ID4+IHJlZ2lzdGVyLiBU
aGUgaW50ZXJydXB0cyBhcmUgdGhlbiByZXN0b3JlZCBiZWZvcmUgZnVydGhlciBwcm9jZXNzaW5n
IG9mCj4gPj4gdGhlIGNsYWltZWQgaW50ZXJydXB0IGNvbnRpbnVlcy4KPiA+Pgo+ID4+IFRoZSBk
cml2ZXIgbWF0Y2hlcyBvbiAidWx0cmFyaXNjLGNwMTAwLXBsaWMiIHRvIGFwcGx5IHRoZSBxdWly
ayB0byBhbGwKPiA+PiBTb0NzIHVzaW5nIFVSLUNQMTAwIGNvcmVzLCByZWdhcmRsZXNzIG9mIHRo
ZSBzcGVjaWZpYyBTb0MgaW1wbGVtZW50YXRpb24uCj4gPiBXaHkgaXMgdGhhdD8gSSBleHBlY3Qg
dGhhdCB5b3UncmUgZG9pbmcgdGhhdCBpbnRlbnRpb25hbGx5IGdpdmVuIHRoZQo+ID4gdWx0cmFy
aXNjIGVtcGxveWVlIGxpc3RlZCBhcyBhIGNvLWRldmVsb3BlciwgYnV0IHdpdGggb25seSBvbmUg
U29DIHVzaW5nCj4gPiB0aGlzIElQIGNvcmUgaXQgc2VlbXMgcG9zc2libGUgdGhhdCB0aGlzIGJ1
ZyBpbiB0aGUgaGFyZHdhcmUgY291bGQgYmUKPiA+IGZpeGVkIGZvciBvdGhlciBTb0NzIHRoYXQg
YXJlIGJ1aWx0IHVzaW5nIHRoaXMgSVAgY29yZS4KPiA+IElzIHRoZXJlIGEgcGxhbiB0bywgZm9y
IGV4YW1wbGUsIGNoYW5nZSB0aGUgY29yZSB2ZXJzaW9uIHRvIFVSLUNQMTAxCj4gPiB3aGVuIHRo
ZSBidWcgaXMgZml4ZWQ/Cj4KPiBJIG9yaWdpbmFsbHkgcHJvcG9zZWQgdG8gbWF0Y2ggb24gdWx0
cmFyaXNjLGNwMTAwLXBsaWMgdW5kZXIgdGhlCj4gYXNzdW1wdGlvbiB0aGF0IGl0IHdvdWxkIGJl
IHRoZSBjYXNlLgo+CkFzIGZhciBhcyBJIHdhcyBhYmxlIHRvIHZlcmlmeSB3aXRoIFVsdHJhUmlz
YywgdGhpcyBpcyBhIGJ1ZyB3aXRoIHRoZQpjcDEwMCBjb3JlcyBhbmQgbm90IHRoZSBEUC0xMDAw
IFNvQywgd2hhdCB0aGF0IG1lYW5zIGlzIHRoYXQgYW55IG90aGVyCmJvYXJkIHVzaW5nIHRob3Nl
IGNwMTAwIGNvcmVzIHNob3VsZCBoYXZlIHRoZSBzYW1lIGJ1Zy4gQW5kIEkgYWdyZWUKdGhhdCB0
aGUgZnVuY3Rpb24gbmFtaW5nIGluIHRoaXMgcGF0Y2ggbWFrZXMgaXQgY29uZnVzaW5nIGFuZCBz
ZWVtCmxpa2UgdGhpcyBpcyBhbiBpc3N1ZSB0byB0aGUgZHAxMDAwLCBJJ2xsIHJld29yZCB0aG9z
ZSBpbiBhIHYzLgoKPiBGdXJ0aGVybW9yZSwgaXQgaXMgbXkgdW5kZXJzdGFuZGluZyB0aGF0IGlm
IHRoZSBidWcgaXMgZml4ZWQgaW4sIHNheSwKPiBVUi1EUDEwMDEsIHRoZW4gdGhlIFBMSUMgbm9k
ZSBjYW4gc2ltcGx5IGJlCj4KPiAgICAgY29tcGF0aWJsZSA9ICJ1bHRyYXJpc2MsZHAxMDAxLXBs
aWMiLCAic2lmaXZlLHBsaWMtMS4wLjAiOwo+Cj4gSSBtZWFudCBteSByZXBseSB0aGF0IEkgaGFk
IGFzc3VtZWQgdGhpcyBidWcgd2FzIGFzc29jaWF0ZWQgd2l0aCB0aGUKPiBVUi1DUDEwMCBjb3Jl
LCBidXQgSSBzaG91bGQgaGF2ZSBzdGF0ZWQgc28gbW9yZSBjbGVhcmx5Lgo+Cj4gVml2aWFuICJk
cmFtZm9yZXZlciIgV2FuZwo+CgpMdWNhcyBaYW1waWVyaQoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
