Return-Path: <SRS0=QRI7=AL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B937C433DF
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2020 00:13:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E52A120780
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2020 00:13:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TKdjrmpG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Py1tgRPv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E52A120780
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+lpyM1hX1ptpEvdbk/tQP/g4qoXmjkbRF+L6u4B4zu4=; b=TKdjrmpGfHbReUb202+TFWZ7+
	7asdSvAnTsJplAP43ahUQyVmXpULS2MyMVR8tlNBUbVVP0NYn2/wt4JakgiP8QKRWcBRJtKoEH3F+
	k7p75JpBhhjlE6ov+2VQHV6VCGL15PW/ZxebsiY2yOIzUkLXy4Dj2dB0ADEGigLHfCqejRXq+c1hS
	5Lz8ux+bYH5fKf49a7LUH8Hy8gjYeet9qa+ooBD7lsIuhtb0CEZcn1keIfNXiPmUx0BQxa/12UO+I
	t/W3PvFv51wjcJxPj6RwUqsIdJh9fofWeEtc/srN/+ciOBzVNb7VWtTnjqpI6uASFgQg4wOJ2ts+D
	KFBFSt4UA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jq3tU-0003wx-88; Tue, 30 Jun 2020 00:13:00 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jq3tR-0003vE-6A
 for linux-riscv@lists.infradead.org; Tue, 30 Jun 2020 00:12:58 +0000
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 549F320781
 for <linux-riscv@lists.infradead.org>; Tue, 30 Jun 2020 00:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593475975;
 bh=Eun4NbTfii0sW6QvTru7wRSuIGDGkkNEhp0AOlaNHNE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Py1tgRPvgo9LIcjYU1cqG1eObUlUJhT6HW0GA2FfobvWok6kLb/+5KWVyDjsHyTSt
 zB7pyxrK37gPMIyrmt9QFrggg0sy2lBX5vDCK9CZzaaF6JQGmWiP+QIrjJ3p4GkYCl
 eJ/RDztRABDZpB1hepOGzJ/XSimfXWB8LI/pko/o=
Received: by mail-lj1-f179.google.com with SMTP id q7so7158075ljm.1
 for <linux-riscv@lists.infradead.org>; Mon, 29 Jun 2020 17:12:55 -0700 (PDT)
X-Gm-Message-State: AOAM533H91fo9ssXitlwaZYYGUPJv9nHMgbtCpCOwbfEgMp6Ud0+jS+h
 XZOrDfCqyYNEtu8UZVdi8bF7i1fZnnCRZYFv/B0=
X-Google-Smtp-Source: ABdhPJxjszLCB+6P/QOKJOqow+AAN21SNdoVF1M0w8qzY2jVobe7wqsxOnzyz9cWZ7vJYU0iobiOGI8eZIH6eqcyzyI=
X-Received: by 2002:a2e:5344:: with SMTP id t4mr7382221ljd.79.1593475973227;
 Mon, 29 Jun 2020 17:12:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200629012524.c941a5f18aa7f312d325f714@kernel.org>
 <mhng-37e70bbc-2616-41e6-bc8a-f144ca647c97@palmerdabbelt-glaptop1>
In-Reply-To: <mhng-37e70bbc-2616-41e6-bc8a-f144ca647c97@palmerdabbelt-glaptop1>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 30 Jun 2020 08:12:41 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQ-LcZ_fxTCkHNBYqZn-C-QVeLp12FysaTjPe6PuTQYxg@mail.gmail.com>
Message-ID: <CAJF2gTQ-LcZ_fxTCkHNBYqZn-C-QVeLp12FysaTjPe6PuTQYxg@mail.gmail.com>
Subject: Re: [PATCH V2] riscv: Fixup compile error BUILD_BUG_ON failed
To: Palmer Dabbelt <palmerdabbelt@google.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Guo Ren <guoren@linux.alibaba.com>, Anup Patel <anup@brainfault.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>,
 Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgUGFsbWVyLAoKT24gVHVlLCBKdW4gMzAsIDIwMjAgYXQgNzoyMiBBTSBQYWxtZXIgRGFiYmVs
dCA8cGFsbWVyZGFiYmVsdEBnb29nbGUuY29tPiB3cm90ZToKPgo+IE9uIFN1biwgMjggSnVuIDIw
MjAgMDk6MjU6MjQgUERUICgtMDcwMCksIG1oaXJhbWF0QGtlcm5lbC5vcmcgd3JvdGU6Cj4gPiBP
biBTdW4sIDI4IEp1biAyMDIwIDE2OjA3OjM3ICswMDAwCj4gPiBndW9yZW5Aa2VybmVsLm9yZyB3
cm90ZToKPiA+Cj4gPj4gRnJvbTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+
ID4+Cj4gPj4gVW5mb3J0dW5hdGVseSwgdGhlIGN1cnJlbnQgY29kZSBjb3VsZG4ndCBiZSBjb21w
aWxlZDoKPiA+Pgo+ID4+ICAgQ0MgICAgICBhcmNoL3Jpc2N2L2tlcm5lbC9wYXRjaC5vCj4gPj4g
SW4gZmlsZSBpbmNsdWRlZCBmcm9tIC4vaW5jbHVkZS9saW51eC9rZXJuZWwuaDoxMSwKPiA+PiAg
ICAgICAgICAgICAgICAgIGZyb20gLi9pbmNsdWRlL2xpbnV4L2xpc3QuaDo5LAo+ID4+ICAgICAg
ICAgICAgICAgICAgZnJvbSAuL2luY2x1ZGUvbGludXgvcHJlZW1wdC5oOjExLAo+ID4+ICAgICAg
ICAgICAgICAgICAgZnJvbSAuL2luY2x1ZGUvbGludXgvc3BpbmxvY2suaDo1MSwKPiA+PiAgICAg
ICAgICAgICAgICAgIGZyb20gYXJjaC9yaXNjdi9rZXJuZWwvcGF0Y2guYzo2Ogo+ID4+IEluIGZ1
bmN0aW9uIOKAmGZpeF90b192aXJ04oCZLAo+ID4+ICAgICBpbmxpbmVkIGZyb20g4oCYcGF0Y2hf
bWFw4oCZIGF0IGFyY2gvcmlzY3Yva2VybmVsL3BhdGNoLmM6Mzc6MTc6Cj4gPj4gLi9pbmNsdWRl
L2xpbnV4L2NvbXBpbGVyLmg6MzkyOjM4OiBlcnJvcjogY2FsbCB0byDigJhfX2NvbXBpbGV0aW1l
X2Fzc2VydF8yMDXigJkgZGVjbGFyZWQgd2l0aCBhdHRyaWJ1dGUgZXJyb3I6IEJVSUxEX0JVR19P
TiBmYWlsZWQ6IGlkeCA+PSBfX2VuZF9vZl9maXhlZF9hZGRyZXNzZXMKPiA+PiAgIF9jb21waWxl
dGltZV9hc3NlcnQoY29uZGl0aW9uLCBtc2csIF9fY29tcGlsZXRpbWVfYXNzZXJ0XywgX19DT1VO
VEVSX18pCj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeCj4gPj4g
Li9pbmNsdWRlL2xpbnV4L2NvbXBpbGVyLmg6MzczOjQ6IG5vdGU6IGluIGRlZmluaXRpb24gb2Yg
bWFjcm8g4oCYX19jb21waWxldGltZV9hc3NlcnTigJkKPiA+PiAgICAgcHJlZml4ICMjIHN1ZmZp
eCgpOyAgICBcCj4gPj4gICAgIF5+fn5+fgo+ID4+IC4vaW5jbHVkZS9saW51eC9jb21waWxlci5o
OjM5MjoyOiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYX2NvbXBpbGV0aW1lX2Fzc2Vy
dOKAmQo+ID4+ICAgX2NvbXBpbGV0aW1lX2Fzc2VydChjb25kaXRpb24sIG1zZywgX19jb21waWxl
dGltZV9hc3NlcnRfLCBfX0NPVU5URVJfXykKPiA+PiAgIF5+fn5+fn5+fn5+fn5+fn5+fn4KPiA+
PiAuL2luY2x1ZGUvbGludXgvYnVpbGRfYnVnLmg6Mzk6Mzc6IG5vdGU6IGluIGV4cGFuc2lvbiBv
ZiBtYWNybyDigJhjb21waWxldGltZV9hc3NlcnTigJkKPiA+PiAgI2RlZmluZSBCVUlMRF9CVUdf
T05fTVNHKGNvbmQsIG1zZykgY29tcGlsZXRpbWVfYXNzZXJ0KCEoY29uZCksIG1zZykKPiA+PiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+Cj4g
Pj4gLi9pbmNsdWRlL2xpbnV4L2J1aWxkX2J1Zy5oOjUwOjI6IG5vdGU6IGluIGV4cGFuc2lvbiBv
ZiBtYWNybyDigJhCVUlMRF9CVUdfT05fTVNH4oCZCj4gPj4gICBCVUlMRF9CVUdfT05fTVNHKGNv
bmRpdGlvbiwgIkJVSUxEX0JVR19PTiBmYWlsZWQ6ICIgI2NvbmRpdGlvbikKPiA+PiAgIF5+fn5+
fn5+fn5+fn5+fn4KPiA+PiAuL2luY2x1ZGUvYXNtLWdlbmVyaWMvZml4bWFwLmg6MzI6Mjogbm90
ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmEJVSUxEX0JVR19PTuKAmQo+ID4+ICAgQlVJTERf
QlVHX09OKGlkeCA+PSBfX2VuZF9vZl9maXhlZF9hZGRyZXNzZXMpOwo+ID4+ICAgXn5+fn5+fn5+
fn5+Cj4gPj4KPiA+PiBCZWNhdXNlIGZpeF90b192aXJ0KCwgaWR4KSBuZWVkcyBhIGNvbnN0IHZh
bHVlLCBub3QgYSBkeW5hbWljIHZhcmlhYmxlIG9mCj4gPj4gcmVnLWEwIG9yIEJVSUxEX0JVR19P
TiBmYWlsZWQgd2l0aCAiaWR4ID49IF9fZW5kX29mX2ZpeGVkX2FkZHJlc3NlcyIuCj4gPgo+ID4g
TG9va3MgZ29vZCB0byBtZSA6KQo+ID4KPiA+IFJldmlld2VkLWJ5OiBNYXNhbWkgSGlyYW1hdHN1
IDxtaGlyYW1hdEBrZXJuZWwub3JnPgo+Cj4gSXMgdGhlcmUgYSBjb25maWd1cmF0aW9uIHRoYXQg
cnVucyBpbnRvIHRoaXMgYnVnPyAgSXQncyBub3Qgc2hvd2luZyB1cCBmb3IgbWUsCj4gYW5kIEkg
Z2VuZXJhbGx5IHRyeSB0byBhZGQgcmVncmVzc2lvbnMgdG8gbXkgdGVzdCBzdWl0ZS4KPgo+ID4g
VGhhbmtzIQoKS1BST0JFLCBJJ2xsIHNlbmQgdGhlIHBhdGNoIHNvb24uCgotLSAKQmVzdCBSZWdh
cmRzCiBHdW8gUmVuCgpNTDogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtY3NreS8KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
