Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50CEBC77B75
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Apr 2023 16:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VQtDNi45pWaGveOLAoNzpAwxAVfNlRnSifU6VlIT5Xo=; b=3XMeUl+GclwWYU
	3TjLj4tElzRm6USfBNXNPH+zAVeeENwjW1cAiY6v+AKbCpkWzor2cc3qkOh3JrkDHrqH4rfc9+S2U
	wNw34Bv2G37XTTm77z5QBY037crdE6+o9+cqtKrsM2ZvKrt+wei9evJBlUK2TZwLjXDciTgwj9k5n
	fhzvdMAUfXTccwmGbzGnJldoBTnBqbuewDcDyMYwgcE0RXVFbYT/XYzrjVRmr0WwqHm04nB08YjXs
	v1ayzqewEvPzwJNuMtCut0YFRNgERuFGf45vQj5ACt7lvPe8puU5uAwp16suUlkYj898kPKez4xmx
	pZcoqXau3MsYK15Vtrqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pooQQ-002o59-15;
	Tue, 18 Apr 2023 16:43:26 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pooQM-002o3w-3A
	for linux-riscv@lists.infradead.org;
	Tue, 18 Apr 2023 16:43:24 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1a6762fd23cso18593885ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 18 Apr 2023 09:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1681836199; x=1684428199;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EI0tXRwzJg1CxP2c/386HAhch5rVHFdN2/6jKvh2HxM=;
        b=GkX06FUQ//rDOHadMgR8CxNTR8YS+xZB3cC9uP9/mD2fk0SxJVeaYx9NRU60KH0iZN
         ck0EvZyVCu3Mi1tDqVXymDudsuoDaVhE1Q00Y6Lsx4oD5ylHi3J+D/Mh5LJ3f5RG1A8q
         OFli+ciVF67TPTeFFb5kGKCqA7DLYPehR+w4A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681836199; x=1684428199;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EI0tXRwzJg1CxP2c/386HAhch5rVHFdN2/6jKvh2HxM=;
        b=KwiBrV7cKmTNF8kptqGSsV34hu2/o4ELMBcrsSJda/jqGRw1ci2nhJ2aCYW3p1Mlow
         Oh0v6j14bgO/RijGxFbkKCzWjyLfr4iQ+SCoxo1Z+S6xy6mdHZ2xSaVD9U3Nvw9Xz5x8
         DqVZAtIBkjzTSaLfJCRJLH8eMHyHmDHU3uJAdjx371CkheYYUYouUppeoFFf3SgOThbF
         /mSjVLm2r0hvu/sVgJ9NeSkVGvuU5DxoRzdzyBGzfYtpzp+ftdWnRajE4Og5haeWlKSU
         F1ZwYYb3j85wxf1JYqGjmK2eJeJpa4vcjQzpjoKYQVd382AAUNtEnmcoA7jalAKLLvhj
         8M1Q==
X-Gm-Message-State: AAQBX9dbrhgafZ1tykXzvyhh/qgtszYUHfPvmBrxk5ZfAdn6qD6PzKcM
	3ywm/Ep31crSpELz4rk2O2KCm/LgN+kmJBIE59AI
X-Google-Smtp-Source: AKy350aVTDS4DC0sb8DZUPCXT0pwXJk0a0YNagw4pCKeLGyY+nYagZ7EbBKNjrvMvF/PkOAWLbNhYq7mBdKN1K9PSvc=
X-Received: by 2002:a17:903:2346:b0:1a6:4543:d295 with SMTP id
 c6-20020a170903234600b001a64543d295mr1115236plh.5.1681836199357; Tue, 18 Apr
 2023 09:43:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230413161725.195417-1-alexghiti@rivosinc.com>
 <CAOnJCU+72PV1=o1c_TpogkmBT36278BneVWEMr1=tqX0CZi+ag@mail.gmail.com> <aadca595b4a24e36932ba41e61f4e263@AcuMS.aculab.com>
In-Reply-To: <aadca595b4a24e36932ba41e61f4e263@AcuMS.aculab.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 18 Apr 2023 22:13:07 +0530
Message-ID: <CAOnJCUJ7mY+fh9VqE4dRntnVAEAc26=NnOCPUqkXk6ky__cUZQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] riscv: Allow userspace to directly access perf counters
To: David Laight <David.Laight@aculab.com>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>, Jonathan Corbet <corbet@lwn.net>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
	Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_094323_204585_660937B8 
X-CRM114-Status: GOOD (  28.33  )
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

T24gRnJpLCBBcHIgMTQsIDIwMjMgYXQgMjo0MOKAr0FNIERhdmlkIExhaWdodCA8RGF2aWQuTGFp
Z2h0QGFjdWxhYi5jb20+IHdyb3RlOgo+Cj4gRnJvbTogQXRpc2ggUGF0cmEKPiA+IFNlbnQ6IDEz
IEFwcmlsIDIwMjMgMjA6MTgKPiA+Cj4gPiBPbiBUaHUsIEFwciAxMywgMjAyMyBhdCA5OjQ34oCv
UE0gQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPiB3cm90ZToKPiA+ID4K
PiA+ID4gcmlzY3YgdXNlZCB0byBhbGxvdyBkaXJlY3QgYWNjZXNzIHRvIGN5Y2xlL3RpbWUvaW5z
dHJldCBjb3VudGVycywKPiA+ID4gYnlwYXNzaW5nIHRoZSBwZXJmIGZyYW1ld29yaywgdGhpcyBw
YXRjaHNldCBpbnRlbmRzIHRvIGFsbG93IHRoZSB1c2VyIHRvCj4gPiA+IG1tYXAgYW55IGNvdW50
ZXIgd2hlbiBhY2Nlc3NlZCB0aHJvdWdoIHBlcmYuIEJ1dCB3ZSBjYW4ndCBicmVhayB0aGUKPiA+
ID4gZXhpc3RpbmcgYmVoYXZpb3VyIHNvIHdlIGludHJvZHVjZSBhIHN5c2N0bCBwZXJmX3VzZXJf
YWNjZXNzIGxpa2UgYXJtNjQKPiA+ID4gZG9lcywgd2hpY2ggZGVmYXVsdHMgdG8gdGhlIGxlZ2Fj
eSBtb2RlIGRlc2NyaWJlZCBhYm92ZS4KPiA+ID4KPiA+Cj4gPiBJdCB3b3VsZCBiZSBnb29kIHBy
b3ZpZGUgYWRkaXRpb25hbCBkaXJlY3Rpb24gZm9yIHVzZXIgc3BhY2UgcGFja2FnZXM6Cj4gPgo+
ID4gVGhlIGxlZ2FjeSBiZWhhdmlvciBpcyBzdXBwb3J0ZWQgZm9yIG5vdyBpbiBvcmRlciB0byBh
dm9pZCBicmVha2luZwo+ID4gZXhpc3Rpbmcgc29mdHdhcmUuCj4gPiBIb3dldmVyLCByZWFkaW5n
IGNvdW50ZXJzIGRpcmVjdGx5IHdpdGhvdXQgcGVyZiBpbnRlcmFjdGlvbiBtYXkKPiA+IHByb3Zp
ZGUgaW5jb3JyZWN0IHZhbHVlcyB3aGljaAo+ID4gdGhlIHVzZXJzcGFjZSBzb2Z0d2FyZSBtdXN0
IGF2b2lkLiBXZSBhcmUgaG9waW5nIHRoYXQgdGhlIHVzZXIgc3BhY2UKPiA+IHBhY2thZ2VzIHdo
aWNoCj4gPiByZWFkIHRoZSBjeWNsZS9pbnN0cmV0IGRpcmVjdGx5LCB3aWxsIG1vdmUgdG8gdGhl
IHByb3BlciBpbnRlcmZhY2UKPiA+IGV2ZW50dWFsbHkgaWYgdGhleSBhY3R1YWxseSBuZWVkIGl0
Lgo+ID4gTW9zdCBvZiB0aGUgdXNlcnMgYXJlIHN1cHBvc2VkIHRvIHJlYWQgInRpbWUiIGluc3Rl
YWQgb2YgImN5Y2xlIiBpZgo+ID4gdGhleSBpbnRlbmQgdG8gcmVhZCB0aW1lc3RhbXBzLgo+Cj4g
SWYgeW91IGFyZSB0cnlpbmcgdG8gbWVhc3VyZSB0aGUgcGVyZm9ybWFuY2Ugb2Ygc2hvcnQgY29k
ZQo+IGZyYWdtZW50cyB0aGVuIHlvdSBuZWVkIHByZXR0eSBtdWNoIHJhdyBhY2Nlc3MgZGlyZWN0
bHkgdG8KPiB0aGUgY3ljbGUvY2xvY2sgY291bnQgcmVnaXN0ZXIuCj4KPiBJJ3ZlIGRvbmUgdGhp
cyBvbiB4ODYgdG8gY29tcGFyZSB0aGUgYWN0dWFsIGN5Y2xlIHRpbWVzCj4gb2YgZGlmZmVyZW50
IGltcGxlbWVudGF0aW9ucyBvZiB0aGUgSVAgY2hlY2tzdW0gbG9vcAo+IChhbmQgY29tcGFyZSB0
aGVtIHRvIHRoZSB0aGVvcmV0aWNhbCBsaW1pdCkuCj4gVGhlIHBlcmYgZnJhbWV3b3JrIGp1c3Qg
YWRkZWQgZmFyIHRvbyBtdWNoIGxhdGVuY3ksCj4gb25seSBkaXJlY3RseSByZWFkaW5nIHRoZSBj
cHUgcmVnaXN0ZXJzIGdhdmUgYW55dGhpbmcKPiBsaWtlIHJlbGlhYmxlIChhbmQgY29uc2lzdGVu
dCkgYW5zd2Vycy4KPgoKVGhpcyBzZXJpZXMgYWxsb3dzIGRpcmVjdCBhY2Nlc3MgdG8gdGhlIGNv
dW50ZXJzIG9uY2UgY29uZmlndXJlZAp0aHJvdWdoIHRoZSBwZXJmLgpFYXJsaWVyIHRoZSBjeWNs
ZS9pbnN0cmV0IGNvdW50ZXJzIGFyZSBkaXJlY3RseSBleHBvc2VkIHRvIHRoZQp1c2Vyc3BhY2Ug
d2l0aG91dCBrZXJuZWwvcGVyZiBmcmFtZXdvcmtpbmcga25vd2luZwp3aGVuL3doaWNoIHVzZXIg
c3BhY2UgYXBwbGljYXRpb24gaXMgcmVhZGluZyBpdC4gVGhhdCBoYXMgc2VjdXJpdHkgaW1wbGlj
YXRpb25zLgoKV2l0aCB0aGlzIHNlcmllcyBhcHBsaWVkLCB0aGUgdXNlciBzcGFjZSBhcHBsaWNh
dGlvbiBqdXN0IG5lZWRzIHRvCmNvbmZpZ3VyZSB0aGUgZXZlbnQgKGN5Y2xlL2luc3RyZXQpIHRo
cm91Z2ggcGVyZiBzeXNjYWxsLgpPbmNlIGNvbmZpZ3VyZWQsIHRoZSB1c2Vyc3BhY2UgYXBwbGlj
YXRpb24gY2FuIGZpbmQgb3V0IHRoZSBjb3VudGVyCmluZm9ybWF0aW9uIGZyb20gdGhlIG1tYXAg
JiBkaXJlY3RseQpyZWFkIHRoZSBjb3VudGVyLiBUaGVyZSBpcyBubyBsYXRlbmN5IHdoaWxlIHJl
YWRpbmcgdGhlIGNvdW50ZXJzLgoKVGhpcyBtZWNoYW5pc20gYWxsb3dzIHN0b3AvY2xlYXIgdGhl
IGNvdW50ZXJzIHdoZW4gdGhlIHJlcXVlc3RpbmcgdGFzawppcyBub3QgcnVubmluZy4gSXQgYWxz
byB0YWtlcyBjYXJlIG9mIGNvbnRleHQgc3dpdGNoaW5nCndoaWNoIG1heSByZXN1bHQgaW4gaW52
YWxpZCB2YWx1ZXMgYXMgeW91IG1lbnRpb25lZCBiZWxvdy4gVGhpcyBpcwpub3RoaW5nIG5ldyBh
bmQgYWxsIG90aGVyIGFyY2ggKHg4NiwgQVJNNjQpIGFsbG93IHVzZXIgc3BhY2UKY291bnRlciBy
ZWFkIHRocm91Z2ggdGhlIHNhbWUgbWVjaGFuaXNtLgoKSGVyZSBpcyB0aGUgcmVsZXZhbnQgdXBz
dHJlYW0gZGlzY3Vzc2lvbjoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC9ZN3dMYTdJMmhs
ejNyS3clMkZAaGlyZXoucHJvZ3JhbW1pbmcua2lja3MtYXNzLm5ldC9ULwoKQVJNNjQ6Cmh0dHBz
Oi8vZG9jcy5rZXJuZWwub3JnL2FybTY0L3BlcmYuaHRtbD9oaWdobGlnaHQ9cGVyZl91c2VyX2Fj
Y2VzcyNwZXJmLXVzZXJzcGFjZS1wbXUtaGFyZHdhcmUtY291bnRlci1hY2Nlc3MKCmV4YW1wbGUg
dXNhZ2UgaW4geDg2OgpodHRwczovL2dpdGh1Yi5jb20vYW5kaWtsZWVuL3BtdS10b29scy9ibG9i
L21hc3Rlci9qZXZlbnRzL3JkcG1jLmMKCj4gQ2xlYXJseSBwcm9jZXNzIHN3aXRjaGVzIChlc3Bl
Y2lhbGx5IGNwdSBtaWdyYXRpb25zKSBjYXVzZQo+IHByb2JsZW1zLCBidXQgdGhleSBhcmUgb2J2
aW91c2x5IGludmFsaWQgdmFsdWVzIGFuZCBjYW4KPiBiZSBpZ25vcmVkLgo+Cj4gU28gd2hpbGUg
YSBsb3Qgb2YgdXNlcyBtYXkgYmUgJ2hhcHB5JyB3aXRoIHRoZSB2YWx1ZXMgdGhlCj4gcGVyZiBm
cmFtZXdvcmsgZ2l2ZXMsIHNvbWV0aW1lcyB5b3UgZG8gbmVlZCB0byBkaXJlY3RseQo+IHJlYWQg
dGhlIHJlbGV2YW50IHJlZ2lzdGVycy4KPgo+ICAgICAgICAgRGF2aWQKPgo+IC0KPiBSZWdpc3Rl
cmVkIEFkZHJlc3MgTGFrZXNpZGUsIEJyYW1sZXkgUm9hZCwgTW91bnQgRmFybSwgTWlsdG9uIEtl
eW5lcywgTUsxIDFQVCwgVUsKPiBSZWdpc3RyYXRpb24gTm86IDEzOTczODYgKFdhbGVzKQoKCgot
LSAKUmVnYXJkcywKQXRpc2gKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
