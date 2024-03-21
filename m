Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F5CC54E58
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Mar 2024 17:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fF2Bz2Nf8UWQUF6vJr2xzxOt2lLyFrxDQBIeElXJGIE=; b=bMjg69FS2On3Qh
	3AYzc6biD8IjNSNnUAioKQT1KO92wtn/ZhTtjcBBp2E8imLlwNEmFwQ3oS9qfKsfLI16tqS4se5WZ
	3em8EANVIkOP0yLwdVJSZEievVLjC4i9z6irES4JZ4kuczp2rba2Hz+BVPb6DCPiZ6V+gd2skGDNU
	LN8pZk2E19G4v9ohplXU+p0UCn93ReJ6Nc0g+LzkvaJbE90aX8j8cHTtTu/Wi3S8r5DGyFHe62dA1
	jq3OUQ9uNzOJo/iivFVEmluZFRiAqjQWWdhl+cLC7u9LCyDCVeK5Z/HH2QfHAGdLTbP6U8f1iknkx
	YuwbSeyDj48INRTe27Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnMNv-000000047mZ-2829;
	Thu, 21 Mar 2024 17:39:23 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnMNr-000000047lr-44rL
	for linux-riscv@lists.infradead.org;
	Thu, 21 Mar 2024 17:39:21 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-dcc7cdb3a98so1243069276.2
        for <linux-riscv@lists.infradead.org>; Thu, 21 Mar 2024 10:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711042754; x=1711647554; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eWa9Gp1UOA4TQWk/Eto3UyuRiNhA+KGh+CdUx4ew+tQ=;
        b=BDgHN/8IXQcC5weYM4Rs8XW9HSU3Nd7lLxhWa4le/vof9TQNKii5bopr2HfOwoA6ar
         zsi5lSTy8SoR+F8AqEkgbNQO7TbR0pNn07QOzSa1GEpn8iNw0DeuVGaDdiI3b+ihwPsV
         S8AeAF+Nh4Tb/eUYnFoz81E3oUty+2WKzCI+CMfKrHMnbsr3MBH6Z8tKYYQteTC1dNd3
         /Sa7xvN1+jdHVcRGVcgGnIEMdIXQ6EPmQwBo944T0QYgw+tMzMib0qSh/u8o15krYG0g
         CdouN+nSZ/4Ahaoi67oyP4l4k6HSxy+Mdj1K4IUKeE6NfdfzzbcZ5WmmJZoeLSmyWVYX
         qRqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711042754; x=1711647554;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eWa9Gp1UOA4TQWk/Eto3UyuRiNhA+KGh+CdUx4ew+tQ=;
        b=QYpErLbTtO1aFxX216dI+cdUkaNPa6TaYwP1x+EqaIHwW9EfiC8xaDBEdhFUbg5Gnd
         9aStqLiGXp/dsA9Hbs3YA+CUHUamal3ZOLkTNpzMI5AZPS7FqaJhQ4GHMbspVSlJs+2l
         G4lQnaptqDe/nwGq9CSIYWETUCLIIhd0FP4fjmBTMbgOyO8Xxih0OTI6uKUKtiBDr9sD
         3T6b66VW8ZXU1HWeybgkBam37Wc5XQb9neNgSdfNua8xvQZ8gkC09jU4zsCcLIM54oFo
         +3HGtNGqAWcXOmxed9PA3cdsNlqiu75x06LiIJiBRBDNaVCL8t0l7hbSgZUVJgshBkcG
         yCBw==
X-Forwarded-Encrypted: i=1; AJvYcCWi7tAkJBU1FoFO4b0S9wuUt6xsRlLYlo9iJ1+EWIDbn3OAaUGwTI+eRF8kkrCjSatPuevvrpujjdsHETWEr2L1zu78XhSeGKa934559s92
X-Gm-Message-State: AOJu0Ywm8jxfcVTKwu1pGdr9USwYKkMe2uBZb48ei9uHr/+hnvwLVa2O
	J813VH/+qoh8HL0bRSq95tYcu7OiDSNPLiP4RxZu5eWH/r4sp06nXwXdmd6z0bvOni1neDT0JrT
	Z51kOJravi38efa1j8R0gES6lJjHteTOD1usFRg==
X-Google-Smtp-Source: AGHT+IGLaHoKDEUpZTaFbsTHYjBWd8sycSKG1qiDbSuCEaocfB12w3HAsQSoCaBKqaTj0o1wrETMbkjfOME91imXWE0=
X-Received: by 2002:a25:86cd:0:b0:dcf:f9bd:fe05 with SMTP id
 y13-20020a2586cd000000b00dcff9bdfe05mr18608462ybm.48.1711042754275; Thu, 21
 Mar 2024 10:39:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240306165904.108141-1-puranjay12@gmail.com> <87ttlhdeqb.fsf@all.your.base.are.belong.to.us>
 <ZfBbxPDd0rz6FN2T@FVFF77S0Q05N> <8734suqsth.fsf@all.your.base.are.belong.to.us>
 <mb61pplvw6grf.fsf@gmail.com> <87zfv0onre.fsf@all.your.base.are.belong.to.us>
 <87il1oedx8.fsf@all.your.base.are.belong.to.us> <CABgGipWPuvwi43v1+60-=0_MN_q_CD0ZGasxHHVWJ37cig5MmA@mail.gmail.com>
 <87msqsotr8.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87msqsotr8.fsf@all.your.base.are.belong.to.us>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Fri, 22 Mar 2024 01:39:03 +0800
Message-ID: <CABgGipUayONdvaH0nexBJUai=qT3yqURhinTbDWxORfMDQ_5pw@mail.gmail.com>
Subject: Re: [RFC PATCH] riscv: Implement HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Puranjay Mohan <puranjay12@gmail.com>, Mark Rutland <mark.rutland@arm.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Guo Ren <guoren@kernel.org>, Ley Foon Tan <leyfoon.tan@starfivetech.com>, 
	Deepak Gupta <debug@rivosinc.com>, Sia Jee Heng <jeeheng.sia@starfivetech.com>, 
	Bjorn Topel <bjorn@rivosinc.com>, Song Shuai <suagrfillet@gmail.com>, 
	"Cl'ement L'eger" <cleger@rivosinc.com>, Al Viro <viro@zeniv.linux.org.uk>, 
	Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	Robbin Ehn <rehn@rivosinc.com>, Brendan Sweeney <brs@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_103920_137395_0742D0FE 
X-CRM114-Status: GOOD (  31.03  )
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

T24gVGh1LCBNYXIgMjEsIDIwMjQgYXQgNDo0OOKAr1BNIEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gQW5keSwKPgo+IFB1bGxpbmcgb3V0IHRoZSBBIG9wdGlvbjoK
Pgo+ID4+ID4gQSkgVXNlIGF1aXBjL2phbHIsIG9ubHkgcGF0Y2ggamFsciB0byB0YWtlIHVzIHRv
IGEgY29tbW9uCj4gPj4gPiAgICBkaXNwYXRjaGVyL3RyYW1wb2xpbmUKPiA+PiA+Cj4gPj4gPiAg
fCA8ZnVuY190cmFjZV90YXJnZXRfZGF0YV84Qj4gIyBwcm9iYWJseSBvbiBhIGRhdGEgY2FjaGUt
bGluZSAhPSBmdW5jIC50ZXh0IHRvIGF2b2lkIHBpbmctcG9uZwo+ID4+ID4gIHwgLi4uCj4gPj4g
PiAgfCBmdW5jOgo+ID4+ID4gIHwgICAuLi5tYWtlIHN1cmUgcmEgaXNuJ3QgbWVzc2VkIHVwLi4u
Cj4gPj4gPiAgfCAgIGF1cGljCj4gPj4gPiAgfCAgIG5vcCA8PT4gamFsciAjIFRleHQgcGF0Y2gg
cG9pbnQgLT4gY29tbW9uX2Rpc3BhdGNoCj4gPj4gPiAgfCAgIEFDVFVBTF9GVU5DCj4gPj4gPiAg
fAo+ID4+ID4gIHwgY29tbW9uX2Rpc3BhdGNoOgo+ID4+ID4gIHwgICBsb2FkIDxmdW5jX3RyYWNl
X3RhcmdldF9kYXRhXzhCPiBiYXNlZCBvbiByYQo+ID4+ID4gIHwgICBqYWxyCj4gPj4gPiAgfCAg
IC4uLgo+ID4+ID4KPiA+PiA+IFRoZSBhdWlwYyBpcyBuZXZlciB0b3VjaGVkLCBhbmQgd2lsbCBi
ZSBvdmVyaGVhZC4gQWxzbywgd2UgbmVlZCBhIG12IHRvCj4gPj4gPiBzdG9yZSByYSBpbiBhIHNj
cmF0Y2ggcmVnaXN0ZXIgYXMgd2VsbCAtLSBsaWtlIEFybS4gV2UnbGwgaGF2ZSB0d28gaW5zbgo+
ID4+ID4gcGVyLWNhbGxlciBvdmVyaGVhZCBmb3IgYSBkaXNhYmxlZCBjYWxsZXIuCj4gPgo+ID4g
TXkgcGF0Y2ggc2VyaWVzIHRha2VzIGEgc2ltaWxhciAiaW4tZnVuY3Rpb24gZGlzcGF0Y2giIGFw
cHJvYWNoLiBBCj4gPiBkaWZmZXJlbmNlIGlzIHRoYXQgdGhlIDxmdW5jX3RyYWNlX3RhcmdldF9k
YXRhXzhCX3Blcl9mdW5jdGlvbj4gaXMKPiA+IGVtYmVkZGVkIHdpdGhpbiBlYWNoIGZ1bmN0aW9u
IGVudHJ5LiBJJ2QgbGlrZSB0byBoYXZlIGl0IG1vdmVkIHRvIGEKPiA+IHJ1bi10aW1lIGFsbG9j
YXRlZCBhcnJheSB0byByZWR1Y2UgdG90YWwgdGV4dCBzaXplLgo+Cj4gVGhpcyBpcyB3aGF0IGFy
bTY0IGhhcyBhcyB3ZWxsLiBJdCdzIGEgOEIgKyAxLTIgZGlydCBjaGVhcCBtb3Zpc2ggbGlrZQo+
IGluc3RydWN0aW9ucyAoc2F2ZSByYSwgcHJlcGFyZSBqdW1wIHdpdGggYXVpcGMpLiBJIHRoaW5r
IHRoYXQncyBhCj4gcmVhc29uYWJsZSBvdmVyaGVhZC4KPgo+ID4gQW5vdGhlciBkaWZmZXJlbmNl
IGlzIHRoYXQgbXkgc2VyaWVzIGNoYW5nZXMgdGhlIGZpcnN0IGluc3RydWN0aW9uIHRvCj4gPiAi
aiBBQ1RVQUxfRlVOQyIgZm9yIHRoZSAiZnRyYWNlIGRpc2FibGUiIGNhc2UuIEFzIGxvbmcgYXMg
dGhlCj4gPiBhcmNoaXRlY3R1cmUgZ3VhcmFudGVlcyB0aGUgYXRvbWljaXR5IG9mIHRoZSBmaXJz
dCBpbnN0cnVjdGlvbiwgdGhlbgo+ID4gd2UgYXJlIHNhZmUuIEZvciBleGFtcGxlLCB3ZSBhcmUg
c2FmZSBpZiB0aGUgZmlyc3QgaW5zdHJ1Y3Rpb24gY291bGQKPiA+IG9ubHkgYmUgIm12IHRtcCwg
cmEiIG9yICJqIEFDVFVBTF9GVU5DIi4gQW5kIHNpbmNlIHRoZSBsb2FkZWQgYWRkcmVzcyBpcwo+
ID4gYWx3YXlzIHZhbGlkLCB3ZSBjYW4gZml4ICJtdiArIGphbHIiIGRvd24gc28gd2UgZG9uJ3Qg
aGF2ZSB0bwo+ID4gcGxheSB3aXRoIHRoZSBleGNlcHRpb24gaGFuZGxlciB0cmljay4gVGhlIGd1
YXJhbnRlZSBmcm9tIGFyY2ggd291bGQKPiA+IHJlcXVpcmUgemljY2lmIChpbiBSVkEyMikgdGhv
dWdoLCBidXQgSSB0aGluayBpdCBpcyB0aGUgc2FtZSBmb3IgdXMKPiA+ICh1bmxlc3Mgd2l0aCBz
dG9wX21hY2hpbmUpLiBGb3IgemljY2lmLCBJIHdvdWxkIHJhdGhlciBjYWxsIHRoYXQgb3V0Cj4g
PiBkdXJpbmcgYm9vdCB0aGFuIGJsaW5kbHkgYXNzdW1lLgo+Cj4gSSdtIG1heWJlIGJpYXNlZCwg
YnV0IEknZCBwcmVmZXIgdGhlIEEpIG92ZXIgeW91ciB2ZXJzaW9uIHdpdGggdGhlCj4gdW5jb25k
aXRpb25hbCBqdW1wLiBBKSBoYXMgdGhlIG92ZXJoZWFkIG9mIHR3bywgSSdkIHNheSwgZnJlZQo+
IGluc3RydWN0aW9ucyAoYWdhaW4gIk1ldGVuIGlzIFdldGVuISIgOy0pKS4KClllcywgSSdkIGFs
c28gcHJlZmVyIEEgZm9yIGxlc3Mgb3ZlcmFsbCBwYXRjaCBzaXplLiBXZSBjYW4gYWxzbwpvcHRp
bWl6ZSB0aGUgb3ZlcmhlYWQgd2l0aCBhIGRpcmVjdCBqdW1wIGlmIHRoYXQgbWFrZXMgc2Vuc2Uu
IFRob3VnaCwKd2UgbmVlZCB0byBzb3J0IG91dCBhIHdheSB0byBtYXAgZnVuY3Rpb25zIHRvIGNv
cnJlc3BvbmRpbmcKdHJhbXBvbGluZXMuIEEgZGlyZWN0IHdheSBJIGNvdWxkIGltYWdlIGlzIENB
TExfT1BTJ2lzaCBwYXRjaGluZwpzdHlsZSwgaWYgdGhlIGZ0cmFjZSBkZXN0aW5hdGlvbiBoYXMg
dG8gYmUgcGF0Y2hlZCBpbiBhIHBlci1mdW5jdGlvbgptYW5uZXIuIEZvciBleGFtcGxlOgoKPGlu
ZGV4LWluLWRpc3BhdGNoLWxpc3Q+CmZ1bmNfc3ltYm9sOgphdWlwYyB0MCwgY29tbW9uX2Rpc3Bh
dGNoOmhpZ2ggPD0+IGogYWN0dWFsX2Z1bmM6CmphbHIgdDAsIGNvbW1vbl9kaXNwYXRjaDpsb3co
dDApCgpjb21tb25fZGlzcGF0Y2g6CmxvYWQgdDEsIGluZGV4ICsgZGlzcGF0Y2gtbGlzdApsZCB0
MSwgMCh0MSkKanIgdDEKCgo+Cj4gPiBIb3dldmVyLCBvbmUgdGhpbmcgSSBhbSBub3QgdmVyeSBz
dXJlIGlzOiBkbyB3ZSBuZWVkIGEgZGVzdGluYXRpb24KPiA+IGFkZHJlc3MgaW4gYSAicGVyLWZ1
bmN0aW9uIiBtYW5uZXI/IEl0IHNlZW1zIGxpa2UgbW9zdCBvZiB0aGUgdGltZSB0aGUKPiA+IGRl
c3RpbmF0aW9uIGFkZHJlc3MgY2FuIG9ubHkgYmUgZnRyYWNlX2NhbGwsIG9yIGZ0cmFjZV9yZWdz
X2NhbGwuIElmCj4gPiB0aGUgbnVtYmVyIG9mIGRlc3RpbmF0aW9uIGFkZHJlc3NlcyBpcyB2ZXJ5
IGZldywgdGhlbiB3ZSBjb3VsZAo+ID4gcG90ZW50aWFsbHkgcmVkdWNlIHRoZSBzaXplIG9mCj4g
PiA8ZnVuY190cmFjZV90YXJnZXRfZGF0YV84Ql9wZXJfZnVuY3Rpb24+Lgo+Cj4gWWVzLCB3ZSBk
byBuZWVkIGEgcGVyLWZ1bmN0aW9uIG1hbm5lci4gQlBGLCBlLmcuLCB1c2VzCj4gZHluYW1pY2Fs
bHkvSklUOmVkIHRyYW1wb2xpbmVzL3RhcmdldHMuCj4KPgo+Cj4gQmrDtnJuCgpDaGVlcnMsCkFu
ZHkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
