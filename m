Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D5F5C77B75
	for <linux-riscv@archiver.kernel.org>; Wed, 17 May 2023 01:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0ZVL3nJgbLQN7AMZAUpq3GR2Rf2MdhGVAsMsM+5T9RU=; b=AG1h60CodtmkpH
	ee0tl3EOlfVh/aEr1/cunppdte8M/xoGrtrSewh5skp/OrA4m+RQmOdhhQcdXum/7Ji4MJLbMLbky
	UW6sUFEKtuWwz0UkXxz9F7lKWWP9toXcxRQhGWe/r4zyQ5BNvRvjaUyHiB3lMpe31s/0SYp2jtUo2
	ekoqBDwiCuWfAnoCWZBglKkuOJKT7dEUCPx5LRLVYGL5hqVklOEWgsjSQOr95iYO54TVWO/H0TLpD
	w72BYT9bHyUVcLddNZOyD70xXz1PYVLgKbj7TXnh6FDeS6lQn+wTmmaeLMwimHdnArFHMK2K0li5L
	uo7mc6vXZmlnZAG78T1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pz6Ni-007kO8-0r;
	Wed, 17 May 2023 01:55:10 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pz6Nf-007kN2-0K
	for linux-riscv@lists.infradead.org;
	Wed, 17 May 2023 01:55:08 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-50bc570b4a3so351232a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 16 May 2023 18:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684288504; x=1686880504;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PzZh0bIZSJ+JPhYvLDEGW/XgH4+hk0vQUZAdjfNNsdg=;
        b=ZbE0g5qJQ2o9t0i1MOgKVdjGyHIxLEcWxeQfDxs9Z/f5sK1/cZh05zbTDuiM0wv3eT
         ifv1XJk4gYn/uZi7kgIM/IAxyph61Tn2TfJC2F78HRn5M/CORQJx+zPrpnDyhFaEyTDR
         LzSPODZYS8B+7Piwap7DrMRvMQAhcQq13pxT3TzPd2kQ8VxzzWAOi1GZSKN6HsO2GlT+
         SURfW30bGy/IxQevnxxYtzfGiQXGQlofTtqcXMTIVTA9YKL4/PiNVhgqTtVcG1dh/Hpx
         Tp8rlIoSdBsO1ummd85QXj8qkuq0A/hhhdM9X31zqAz0nVvl7IUBn545twb9SIKOLo3D
         Uj/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684288504; x=1686880504;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PzZh0bIZSJ+JPhYvLDEGW/XgH4+hk0vQUZAdjfNNsdg=;
        b=IcOYuYBfK2JExr+UIq4tU/1LOW26bAZT7E2Xdpu+X1/Y5rvswOxuYFyqGxzn6A0JXh
         3JSAkphZKG3LBdUBrEuwe5zTiWiBTVdD3YXx77MDOpIKMLOKqna692Mzy39/bIVdzhd6
         FTcWrwLM51sEV5Y7SVRX1VAIfIcVO1AvxnRVdE8Yd8h3irpGvV86t89difix8J2JB0jo
         gnuNv4HId5pyv45CqUgd9wbQC/a1UHLqpOzXHu6um9+7esriOmV+QxwIhgR1nqkyic2j
         y0G9Fy/mPrKlg09izsqnL0P14mnCkStWJgVJ9XWoOtOQsHi2J2HbVTdDEyJVxHeIcPjC
         srHg==
X-Gm-Message-State: AC+VfDxgyKwsugXZHHIWEtCRfJ+KcFWCULii/W/1fbmAgGviqhNVBSJV
	71V7TuAptiMcCFvda4nXgXDMSYnvhE/Bbg9roKg=
X-Google-Smtp-Source: ACHHUZ7NsRASUg7F+CJyPuN2am+wh93OmEnhfAmtdtKJmfYbwMRaHk8oJ5Ft6fHAO6vVt499Vf2lbNpMiyi2+jQzsxE=
X-Received: by 2002:a50:fb9a:0:b0:506:9805:7b56 with SMTP id
 e26-20020a50fb9a000000b0050698057b56mr856882edq.32.1684288504486; Tue, 16 May
 2023 18:55:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230516071830.8190-1-zegao@tencent.com> <20230516071830.8190-3-zegao@tencent.com>
 <20230516091820.GB2587705@hirez.programming.kicks-ass.net>
 <CAD8CoPDFp2_+D6nykj6mu_Pr57iN+8jO-kgA_FRrcxD8C7YU+Q@mail.gmail.com> <20230517010311.f46db3f78b11cf9d92193527@kernel.org>
In-Reply-To: <20230517010311.f46db3f78b11cf9d92193527@kernel.org>
From: Ze Gao <zegao2021@gmail.com>
Date: Wed, 17 May 2023 09:54:53 +0800
Message-ID: <CAD8CoPAw_nKsm4vUJ_=aSwzLc5zo8D5pY6A7-grXENxpMYz9og@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] fprobe: make fprobe_kprobe_handler recursion free
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Alexei Starovoitov <ast@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Heiko Carstens <hca@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Vasily Gorbik <gor@linux.ibm.com>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	Conor Dooley <conor@kernel.org>, Jiri Olsa <jolsa@kernel.org>, Yonghong Song <yhs@fb.com>, 
	Ze Gao <zegao@tencent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_185507_146633_25D705FE 
X-CRM114-Status: GOOD (  18.38  )
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

T29wcywgSSBtaXN1bmRlcnN0b29kIHlvdXIgY29tbWVudHMgYmVmb3JlLgoKWWVzLCBpdCdzIG5v
dCBuZWNlc3NhcnkgdG8gZG8gdGhpcyByZW9yZGVyaW5nIGFzIHJlZ2FyZHMgdG8ga3Byb2JlLgoK
VGhhbmtzIGZvciB5b3VyIHJldmlldy4KCkknbGwgcmViYXNlIG9udG8gdGhlIGxhdGVzdCB0cmVl
IGFuZCBzZW5kIHYzIEFTQVAuCgpSZWdhcmRzLApaZQoKT24gV2VkLCBNYXkgMTcsIDIwMjMgYXQg
MTI6MDPigK9BTSBNYXNhbWkgSGlyYW1hdHN1IDxtaGlyYW1hdEBrZXJuZWwub3JnPiB3cm90ZToK
Pgo+IE9uIFR1ZSwgMTYgTWF5IDIwMjMgMTc6NDc6NTIgKzA4MDAKPiBaZSBHYW8gPHplZ2FvMjAy
MUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gPiBQcmVjaXNlbHksIHRoZXNlIHRoYXQgYXJlIGNhbGxl
ZCB3aXRoaW4ga3Byb2JlX2J1c3lfe2JlZ2luLCBlbmR9LAo+ID4gd2hpY2ggdGhlIHByZXZpb3Vz
IHBhdGNoIGRvZXMgbm90IHJlc29sdmUuCj4KPiBOb3RlIHRoYXQga3Byb2JlX2J1c3lfe2JlZ2lu
LGVuZH0gZG9uJ3QgbmVlZCB0byB1c2Ugbm90cmFjZSB2ZXJzaW9uCj4gYmVjYXVzZSBrcHJvYmUg
aXRzZWxmIHByb2hpYml0cyBwcm9iaW5nIG9uIHByZWVtcHRfY291bnRfe2FkZCxzdWJ9Lgo+Cj4g
VGhhbmsgeW91LAo+Cj4gPiBJIHdpbGwgcmVmaW5lIHRoZSBjb21taXQgbWVzc2FnZSB0byBtYWtl
IGl0IGNsZWFyLgo+ID4KPiA+IEZZSSwgZGV0YWlscyBjYW4gY2hlY2tlZCBvdXQgaGVyZToKPiA+
ICAgICBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC10cmFjZS1rZXJuZWwvMjAy
MzA1MTYxMzI1MTYuYzkwMmVkY2YyMTAyODg3NGE3NGZiODY4QGtlcm5lbC5vcmcvCj4gPgo+ID4g
UmVnYXJkcywKPiA+IFplCj4gPgo+ID4gT24gVHVlLCBNYXkgMTYsIDIwMjMgYXQgNToxOOKAr1BN
IFBldGVyIFppamxzdHJhIDxwZXRlcnpAaW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4gPiA+Cj4gPiA+
IE9uIFR1ZSwgTWF5IDE2LCAyMDIzIGF0IDAzOjE4OjI4UE0gKzA4MDAsIFplIEdhbyB3cm90ZToK
PiA+ID4gPiBDdXJyZW50IGltcGxlbWVudGF0aW9uIGNhbGxzIGtwcm9iZSByZWxhdGVkIGZ1bmN0
aW9ucyBiZWZvcmUgZG9pbmcKPiA+ID4gPiBmdHJhY2UgcmVjdXJzaW9uIGNoZWNrIGluIGZwcm9i
ZV9rcHJvYmVfaGFuZGxlciwgd2hpY2ggb3BlbnMgZG9vcgo+ID4gPiA+IHRvIGtlcm5lbCBjcmFz
aCBkdWUgdG8gc3RhY2sgcmVjdXJzaW9uIGlmIHByZWVtcHRfY291bnRfe2FkZCwgc3VifQo+ID4g
PiA+IGlzIHRyYWNlYWJsZS4KPiA+ID4KPiA+ID4gV2hpY2ggcHJlZW1wdF9jb3VudCooKSBhcmUg
eW91IHJlZmVycmluZyB0bz8gVGhlIG9uZXMgeW91IGp1c3QgbWFkZQo+ID4gPiBfbm90cmFjZSBp
biB0aGUgcHJldmlvdXMgcGF0Y2g/Cj4KPgo+IC0tCj4gTWFzYW1pIEhpcmFtYXRzdSAoR29vZ2xl
KSA8bWhpcmFtYXRAa2VybmVsLm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
