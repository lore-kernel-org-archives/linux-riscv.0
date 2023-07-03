Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E779DC0015E
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 09:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k35KHD8Sh36Gpe2TOh/VaOlP4CkG1JdCC88uBFEnJEw=; b=RRKLIxx0+f0V+y
	s8QrGoMcua03LF2WGlLOLt9WloQTv8wTl6ZKoaubQQMR8ebXq35krcTNCvSTs6w+EOyOatQM8kZrS
	8B+NWLMdRhD+RGh51wd4J8wxbMZxztAJNYNsJrCuC+R2tX4aIFeUrVd1wddoisfhFLw1tNz/EgKcs
	KGNe3LKobVqqMa3wfruE3czSYjMm+cWNR+VSDpPKHFHy6AEwjeI60cB81afTqv/MXpobfsWPOCG9X
	5GW/qQnVuXcelgcoymNbkBWhrCLYmzMUdBJXG/1CsAZmMw8e5CETrY2BY73lKCZSWr4Y6MgY6o+mI
	qZ4i70VtYvDH+rRudpKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGG7P-009ypX-3C;
	Mon, 03 Jul 2023 09:45:15 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGG7M-009ynJ-13
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jul 2023 09:45:13 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3fbc77e769cso36167895e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 03 Jul 2023 02:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688377511; x=1690969511;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rYrikqEYLAou4pnYR2Aq6pNjv0Vdk8l8/0T1K6ojTeg=;
        b=2tXF85BjqNH/+g3RjKxu5KayJ5sZPo7Hf7CG6Rs2NqvX6hmkBrEvQuTxNo1lYNPDKz
         KV4Z4oA24Y7BjKB1xYxChMdvy2tp1kH/12HdWcz5qmLpAZIBPVOGp9zwKIIzZGmg8rQu
         fOe4HZ+2Gn94vJCDnNBMYLltoSeL+WUWEuLSdbeIYaqbbFxE0TAHBIsbsNejzaTJpM67
         /wcm95xGEECPHfT6Cd4x3kpsl+CaCDtNBghXs/fIVeMZJ/s5Uay3fW9SHeoLBOKLLmtJ
         el1gtaSLGON+Ih6l8SaFeLZm9ybTSF/jxT6c1RT6i5Rv0//NC/vZ2yPsP3Zh+aURel4c
         EwJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688377511; x=1690969511;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rYrikqEYLAou4pnYR2Aq6pNjv0Vdk8l8/0T1K6ojTeg=;
        b=jXcA5aIC7K8SmhLGewtY/oiNLmAz3DdPIWXpigmYYhEgRBcr4/ofijZVfA903+LVfa
         PD6DAAcjxSDlRAmA/ld4m6TbEGPhy97KNEZ55TaBHZ0rtuAajURdONnupV6irJeQRnZj
         HIM+PPvGzwCB260VP98uYXrVrq/287MfRU1ARgC3MHcZx0jKK8fiZlEnQrLtJUIAiF/X
         WlguAbIn2rjPAGZ7yCAr4y2K7lrXF8mZz5ZsyQHxdqI/KFFpCD6MhSIwW/rZowKdpuqJ
         +wDJ4DbUlSS06zIRxMghKhpjoJr7FyhCh4Bw+MglYR0UKgmEI/D95aIZguzRRZI+abhT
         0hLg==
X-Gm-Message-State: AC+VfDxpuftkkQPbtSsTRuX43RWOUVG/IhcvgY4WmCWQMuEI83bGrCau
	5sFws1AWSUPOQpWIUwzqwSNi7bDMB0pQCBhj2MsPlw==
X-Google-Smtp-Source: ACHHUZ68NLQzXNzGeeF7k2ifsyB3gqwunDPHxpAfWYOPgJw1xDOPD6ZNy0ihSYOsi4YSHukqztCwt/Z/vGICPKx+RDA=
X-Received: by 2002:a05:600c:3787:b0:3fa:8c67:fc43 with SMTP id
 o7-20020a05600c378700b003fa8c67fc43mr8267813wmr.32.1688377510814; Mon, 03 Jul
 2023 02:45:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230630083013.102334-1-alexghiti@rivosinc.com>
 <20230630083013.102334-9-alexghiti@rivosinc.com> <20230630-f714cc46ee65cc65318f2ada@orel>
In-Reply-To: <20230630-f714cc46ee65cc65318f2ada@orel>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Mon, 3 Jul 2023 11:45:00 +0200
Message-ID: <CAHVXubh97QyXbiQ6wcaEOkPBKJwzCzm77FgQ+eHEYFFEQyToJw@mail.gmail.com>
Subject: Re: [PATCH v3 08/10] Documentation: admin-guide: Add riscv sysctl_perf_user_access
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atishp@atishpatra.org>, 
	Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_024512_362922_24BA7114 
X-CRM114-Status: GOOD (  28.35  )
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

T24gRnJpLCBKdW4gMzAsIDIwMjMgYXQgMToxNuKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBKdW4gMzAsIDIwMjMgYXQgMTA6MzA6
MTFBTSArMDIwMCwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+ID4gcmlzY3Ygbm93IHVzZXMgdGhp
cyBzeXNjdGwgc28gZG9jdW1lbnQgaXRzIHVzYWdlIGZvciB0aGlzIGFyY2hpdGVjdHVyZS4KPiA+
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5j
b20+Cj4gPiAtLS0KPiA+ICBEb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL3N5c2N0bC9rZXJuZWwu
cnN0IHwgMjYgKysrKysrKysrKysrKysrKystLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIyIGlu
c2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vYWRtaW4tZ3VpZGUvc3lzY3RsL2tlcm5lbC5yc3QgYi9Eb2N1bWVudGF0aW9uL2FkbWlu
LWd1aWRlL3N5c2N0bC9rZXJuZWwucnN0Cj4gPiBpbmRleCBkODVkOTBmNWQwMDAuLmMzNzY2OTJi
MzcyYiAxMDA2NDQKPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvc3lzY3RsL2tl
cm5lbC5yc3QKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvc3lzY3RsL2tlcm5l
bC5yc3QKPiA+IEBAIC05NDEsMTYgKzk0MSwzNCBAQCBlbmFibGVkLCBvdGhlcndpc2Ugd3JpdGlu
ZyB0byB0aGlzIGZpbGUgd2lsbCByZXR1cm4gYGAtRUJVU1lgYC4KPiA+ICBUaGUgZGVmYXVsdCB2
YWx1ZSBpcyA4Lgo+ID4KPiA+Cj4gPiAtcGVyZl91c2VyX2FjY2VzcyAoYXJtNjQgb25seSkKPiA+
IC09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KPiA+ICtwZXJmX3VzZXJfYWNjZXNz
IChhcm02NCBhbmQgcmlzY3Ygb25seSkKPiA+ICs9PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT0KPiA+ICsKPiA+ICtDb250cm9scyB1c2VyIHNwYWNlIGFjY2VzcyBmb3IgcmVh
ZGluZyBwZXJmIGV2ZW50IGNvdW50ZXJzLgo+ID4KPiA+IC1Db250cm9scyB1c2VyIHNwYWNlIGFj
Y2VzcyBmb3IgcmVhZGluZyBwZXJmIGV2ZW50IGNvdW50ZXJzLiBXaGVuIHNldCB0byAxLAo+ID4g
LXVzZXIgc3BhY2UgY2FuIHJlYWQgcGVyZm9ybWFuY2UgbW9uaXRvciBjb3VudGVyIHJlZ2lzdGVy
cyBkaXJlY3RseS4KPiA+ICthcm02NAo+ID4gKz09PT09Cj4gPgo+ID4gIFRoZSBkZWZhdWx0IHZh
bHVlIGlzIDAgKGFjY2VzcyBkaXNhYmxlZCkuCj4KPiBTaG91bGQgYWRkIGEgYmxhbmsgbGluZSBo
ZXJlLgoKRG9uZSwgdGhhbmtzCgo+Cj4gPiArV2hlbiBzZXQgdG8gMSwgdXNlciBzcGFjZSBjYW4g
cmVhZCBwZXJmb3JtYW5jZSBtb25pdG9yIGNvdW50ZXIgcmVnaXN0ZXJzCj4gPiArZGlyZWN0bHku
Cj4gPgo+ID4gIFNlZSBEb2N1bWVudGF0aW9uL2FybTY0L3BlcmYucnN0IGZvciBtb3JlIGluZm9y
bWF0aW9uLgo+ID4KPiA+ICtyaXNjdgo+ID4gKz09PT09Cj4gPiArCj4gPiArV2hlbiBzZXQgdG8g
MCwgdXNlciBhY2Nlc3MgaXMgZGlzYWJsZWQuCj4gPiArCj4gPiArV2hlbiBzZXQgdG8gMSwgdXNl
ciBzcGFjZSBjYW4gcmVhZCBwZXJmb3JtYW5jZSBtb25pdG9yIGNvdW50ZXIgcmVnaXN0ZXJzCj4g
PiArZGlyZWN0bHkgb25seSB0aHJvdWdoIHBlcmYsIGFueSBkaXJlY3QgYWNjZXNzIHdpdGhvdXQg
cGVyZiBpbnRlcnZlbnRpb24gd2lsbAo+Cj4gUmVtb3ZlICdkaXJlY3RseSBvbmx5Jwo+Cj4gKEl0
IGNhbid0IGJlIGJvdGggImRpcmVjdCIgYW5kICJ0aHJvdWdoIiBhdCB0aGUgc2FtZSB0aW1lLikK
Pgo+ID4gK3RyaWdnZXIgYW4gaWxsZWdhbCBpbnN0cnVjdGlvbi4KPiA+ICsKPiA+ICtUaGUgZGVm
YXVsdCB2YWx1ZSBpcyAyLAo+Cj4gVGhpcyBpcyBubyBsb25nZXIgdHJ1ZS4KCkRhbW4sIHNvcnJ5
IGFib3V0IHRoYXQuCgo+Cj4gPiB3aGljaCBlbmFibGVzIGxlZ2FjeSBtb2RlICh1c2VyIHNwYWNl
IGhhcyBkaXJlY3QKPiA+ICthY2Nlc3MgdG8gY3ljbGUgYW5kIGluc3JldCBDU1JzIG9ubHkpLiBO
b3RlIHRoYXQgdGhpcyBsZWdhY3kgdmFsdWUKPiA+ICtpcyBkZXByZWNhdGVkIGFuZCB3aWxsIGJl
IHJlbW92ZWQgb25jZSBhbGwgdXNlcnNwYWNlIGFwcGxpY2F0aW9ucyBhcmUgZml4ZWQuCj4gPiAr
Cj4gPiArTm90ZSB0aGF0IHRoZSB0aW1lIENTUiBpcyBmb3Igbm93IGFsd2F5cyBhY2Nlc3NpYmxl
IHRvIGFsbCBtb2Rlcy4KPgo+IHMvYWx3YXlzIGFjY2Vzc2libGUvYWx3YXlzIGRpcmVjdGx5IGFj
Y2Vzc2libGUvCj4KPiBBbHNvLCByZW1vdmUgJ2ZvciBub3cnLiBXaGlsZSB3ZSBtYXkgY2hhbmdl
IHRoaXMgaW4gdGhlIGZ1dHVyZSwgSSdtIG5vdAo+IHN1cmUgaWYgdGhlICdmb3Igbm93JyBoZWxw
cyBtdWNoLiBNYXliZSBhICJUaGlzIG1heSBjaGFuZ2UgaW4gdGhlIGZ1dHVyZS4iCj4gdHlwZSBv
ZiBzZW50ZW5jZT8gT3IsIGp1c3Qgbm90aGluZyAoZm9yIG5vdyA6LSkgYW5kIHdlJ2xsIG1vZGlm
eSB0aGlzCj4gZG9jdW1lbnQgaWYgaXQgY2hhbmdlcyBsYXRlci4KCkkgd29uJ3Qgc2F5IGFueXRo
aW5nIGFib3V0IHRoZSBmdXR1cmUsIHRoYW5rcyEKCkkgYWxzbyBoYXJtb25pemVkIHRoZSAidXNl
ciBzcGFjZSIgYW5kICJ1c2Vyc3BhY2UiIGluIHRoaXMgZG9jdW1lbnQKd2l0aCB3aGF0IGFybTY0
IGRvZXMuCgpUaGFua3MKCj4KPiBUaGFua3MsCj4gZHJldwo+Cj4gPgo+ID4gIHBpZF9tYXgKPiA+
ICA9PT09PT09Cj4gPiAtLQo+ID4gMi4zOS4yCj4gPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
