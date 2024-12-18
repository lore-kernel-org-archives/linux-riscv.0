Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4043BE77187
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Dec 2024 20:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vM2anBHFfJsenVEvrf5wQM31cDBtxp9SQvVPj1F7gcE=; b=mhCk8mmTpWxt3V
	4efvfaiKRUpa90oVjOt1VdD0/Mjv67fBSp/Jyy3jMGRe1MxHEfIsr0Vz3zlTosZiWtPoboOrVu/H1
	+iSM0tZiBwDGj5M7RoEj2QLDNlQSe8nxcroLXujiISY1Wm7gcigZp9QdvSzWHjiD721M0Tat/Ldgy
	7067bvb/fPI2kcV1S3khVzyyGfuoKGE2Lqm1IiLj8yUTo166T2xAk9aIkIMVHwyWyuxj9i5dUotF7
	/cJmeNb7B8x7L86CN0/JZAzKnBCFdx0aLPzBDCQZ5Vuo4TOmT1EAgp1BMCFioGBXwFeUyCxS/b1RJ
	S4E3jYoEBV/tJzV+OywA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tO171-000000005Ct-0JhE;
	Wed, 18 Dec 2024 20:57:43 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tO16y-000000005CB-2VJR
	for linux-riscv@lists.infradead.org;
	Wed, 18 Dec 2024 20:57:42 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-21654fdd5daso1050955ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 18 Dec 2024 12:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1734555460; x=1735160260; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DnlzBZ1bNkNrCyadScSxNwpP2f0bFLt+gzSGc7X//Xk=;
        b=YHQzibwQQJCVrgWBvVTALXpIx9aGtdS3z9KFc0BGuGnBm8YjCELW3m9mswvG4xOKFQ
         0l4rcKbw4836+mouMuazdRO9JBzI/5cV7EtluNcGZavoEbqYATsdKoiZGuvM2KbWPb2Z
         nNBlD/F6Bt007qwxdnp0jylxqqoi3oFBcI9U4q/hwNgcL35oBOYJexSwxVGdl8lV/G6D
         dUcvV0j0M5t14i7z5X69FrubaOJyfqDLUUU+7Iz7R01UvpPz6ilOYZ2XcFj1224SfQsu
         Zvt90ART3Rr9RcPxrLSjD6kfp8phcAOq28DDOw9H6QszOQfZPok+6R/8p+grPXR/OV+l
         iYRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734555460; x=1735160260;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DnlzBZ1bNkNrCyadScSxNwpP2f0bFLt+gzSGc7X//Xk=;
        b=irpQBDfv0ICed14w3icmN7nDlNhrjJVLLcDq32EYkRx49h/RGP+SVaiHGNOsNXJ/eU
         jMiCqwHDnA6OnIVsVDI3KKUW/6BgQj+wylGs2Kivs2ciGDEKMaJuEJBXLS5LWcnEF/bf
         GzmcBpRjPxHQTZNn8YE/wDZfWaRj0vc8QgRtFc+o02oms9q1YtFvTEr6L/I+38R0dj7x
         z4elBkHNL+7cteOQ/PWHvjufkEkyap2SFcO/9sk/slO+HykXItUU8qmAydAJo5hzGYzX
         ivFSpPDFyWET1b0g0OBHAMODp5RvftvhlwdDK2RgOqrTUZZWS+sazAFc1n5WXBi9aZP7
         KG2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWmB30NumE0AkBXlEfchFEQF6hGAnJmoy//sfjK1q5vcUhgdvroVlpjaImL30q7wDiy+aG5olHWrsqG/Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwUAP6VtB72tRkG1PfEDHKtcmhmd3DHwgh3FSDeNSwlh8Ys5NF9
	Sg7PD9Y4Eg73xDQsuD7fjRjJmdfG9Y3A4JnbDgbBwxkLecG7OfJu3P+obtiAopk=
X-Gm-Gg: ASbGncvwhrqpfv2t5MUc1Msii+NbmTUo8Ai+Jh4xMx2FhdJ4E+6u7CdrkJZIoI+RyWI
	RAx1IBDOmgzcHf986kCAECvbZEB/SdIvqLJoJscWUj8uNL7+2RtNGIhMkZR7Ai7l5xK7gvxL3kl
	GnX0y27Q7E3sWDGRkXlL8OtwG5cEsD9PEh/gWgppW08SSlpHG0sbeIlZHL7jO2i9f4k/wAC62lI
	2hUM95h81TiVW5PLn4j+iLM6r8lEtrBudAlT5UQMenO7SA=
X-Google-Smtp-Source: AGHT+IFbrr3Ugx9sJuxckBLXykfeFQB9mdy4wgUJpUjJFCoKZYBQ4+1F1qUWmiA9nhDeXvGo84jWaQ==
X-Received: by 2002:a17:902:e741:b0:216:386e:dbc with SMTP id d9443c01a7336-218d6fdfd08mr57672385ad.13.1734555459502;
        Wed, 18 Dec 2024 12:57:39 -0800 (PST)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e5437asm80558955ad.162.2024.12.18.12.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 12:57:38 -0800 (PST)
Date: Wed, 18 Dec 2024 12:57:36 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Ian Rogers <irogers@google.com>, Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2] tools: perf: tests: Fix code reading for riscv
Message-ID: <Z2M3QNqQ_Sl1ZKtm@ghost>
References: <20241217-perf_fix_riscv_obj_reading-v2-1-58f81b7b4c7d@rivosinc.com>
 <CAP-5=fXK6HRzBKHzF=T_w9cn7ohWOdmZNRMXvJzN6QG11HE6tA@mail.gmail.com>
 <Z2IXl5cuKQJInJb0@ghost>
 <Z2MXXFhUzoQmW4xV@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z2MXXFhUzoQmW4xV@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_125740_725447_97F354BB 
X-CRM114-Status: GOOD (  28.10  )
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

T24gV2VkLCBEZWMgMTgsIDIwMjQgYXQgMDM6NDE6MzJQTSAtMDMwMCwgQXJuYWxkbyBDYXJ2YWxo
byBkZSBNZWxvIHdyb3RlOgo+IE9uIFR1ZSwgRGVjIDE3LCAyMDI0IGF0IDA0OjMwOjE1UE0gLTA4
MDAsIENoYXJsaWUgSmVua2lucyB3cm90ZToKPiA+IE9uIFR1ZSwgRGVjIDE3LCAyMDI0IGF0IDA0
OjE4OjMyUE0gLTA4MDAsIElhbiBSb2dlcnMgd3JvdGU6Cj4gPiA+IE9uIFR1ZSwgRGVjIDE3LCAy
MDI0IGF0IDM6NTLigK9QTSBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPiB3
cm90ZToKPiA+ID4gPiBBZnRlciBiaW51dGlscyBjb21taXQgZTQzZDg3NiB3aGljaCB3YXMgZmly
c3QgaW5jbHVkZWQgaW4gYmludXRpbHMgMi40MSwKPiA+ID4gPiByaXNjdiBubyBsb25nZXIgc3Vw
cG9ydHMgZHVtcGluZyBpbiB0aGUgbWlkZGxlIG9mIGluc3RydWN0aW9ucy4gSW5jcmVhc2UKPiA+
ID4gPiB0aGUgb2JqZHVtcCB3aW5kb3cgYnkgMi1ieXRlcyB0byBlbnN1cmUgdGhhdCBhbnkgaW5z
dHJ1Y3Rpb24gdGhhdCBzaXRzCj4gPiA+ID4gb24gdGhlIGJvdW5kYXJ5IG9mIHRoZSBzcGVjaWZp
ZWQgc3RvcC1hZGRyZXNzIGlzIG5vdCBjdXQgaW4gaGFsZi4KPiAKPiA+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPgo+IAo+ID4gPiBSZXZp
ZXdlZC1ieTogSWFuIFJvZ2VycyA8aXJvZ2Vyc0Bnb29nbGUuY29tPgo+IAo+ID4gPiA+IEEgYmlu
dXRpbHMgcGF0Y2ggaGFzIGJlZW4gc2VudCBhcyB3ZWxsIHRvIGZpeCB0aGlzIGluIG9iamR1bXAg
WzFdLgo+IAo+ID4gPiA+IExpbms6IGh0dHBzOi8vc291cmNld2FyZS5vcmcvcGlwZXJtYWlsL2Jp
bnV0aWxzLzIwMjQtRGVjZW1iZXIvMTM4MTM5Lmh0bWwgWzFdCj4gCj4gPiA+ID4gQ2hhbmdlcyBp
biB2MjoKPiA+ID4gPiAtIERvIG9iamR1bXAgdmVyc2lvbiBkZXRlY3Rpb24gYXQgcnVudGltZSAo
SWFuKQo+ID4gPiA+IC0gTGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0
MTIxNi1wZXJmX2ZpeF9yaXNjdl9vYmpfcmVhZGluZy12MS0wLWI3NTk2MjY2MGE5YkByaXZvc2lu
Yy5jb20KPiAKPiA+ID4gPiAtLS0gYS90b29scy9wZXJmL3Rlc3RzL2NvZGUtcmVhZGluZy5jCj4g
PiA+ID4gQEAgLTE4Myw5ICsyNDQsMzAgQEAgc3RhdGljIGludCByZWFkX3ZpYV9vYmpkdW1wKGNv
bnN0IGNoYXIgKmZpbGVuYW1lLCB1NjQgYWRkciwgdm9pZCAqYnVmLAo+ID4gPiA+ICAgICAgICAg
Y29uc3QgY2hhciAqZm10Owo+ID4gPiA+ICAgICAgICAgRklMRSAqZjsKPiA+ID4gPiAgICAgICAg
IGludCByZXQ7Cj4gPiA+ID4gKyAgICAgICB1NjQgc3RvcF9hZGRyZXNzID0gYWRkciArIGxlbjsK
PiA+ID4gPiArCj4gPiA+ID4gKyAgICAgICBpZiAoSVNfRU5BQkxFRChfX3Jpc2N2KSkgewo+IAo+
ID4gPiBOb3Qgc3VyZSBpZiB0aGVyZSBpcyBhIGNvbnNpc3RlbmN5IGlzc3VlIGhlcmUuIEVsc2V3
aGVyZSB3ZSdyZSBqdXN0Cj4gPiA+IHVzaW5nIGlmZGVmLCBzdWNoIGFzOgo+ID4gPiBodHRwczov
L2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9wZXJmL3BlcmYtdG9vbHMt
bmV4dC5naXQvdHJlZS90b29scy9wZXJmL3V0aWwvaW5jbHVkZS9kd2FyZi1yZWdzLmg/aD1wZXJm
LXRvb2xzLW5leHQjbjY5Cj4gIAo+ID4gSSBkb24ndCBoYXZlIGFueSBzdHJvbmcgZmVlbGluZ3Mg
YWJvdXQgdGhhdC4gSSBjYW4gY2hhbmdlIGl0IHRvIGJlIGFuCj4gPiBpZmRlZi4gT24gb3RoZXIg
bGlzdHMgSSBoYXZlIGJlZW4gdG9sZCB0byB1c2UgSVNfRU5BQkxFRCB3aGVuZXZlcgo+ID4gcG9z
c2libGUsIGJ1dCBpdCdzIG9ubHkgYSBzbWFsbCBkaWZmZXJlbmNlLgo+IAo+IENhbid0IHdlIGp1
c3QgdXNlIHVuYW1lIGhlcmU/Cj4gCj4gU28gdGhhdCB3ZSBkb24ndCB1c2Uga2NvbmZpZy5oIHNp
bmNlIGl0cyBub3QgdXNlZCBpbiB0b29scy9wZXJmLyBhbmQKPiBtYWtlcyBpdCBsb29rcyBsaWtl
IHBlcmYgaXMgaW4gbG9ja3N0ZXAgd2l0aCB0aGUga2VybmVsIHNvdXJjZSB0cmVlCj4gdmVyc2lv
biBpdCB3YXMgY29tcGlsZWQgZnJvbT8KPiAKPiAkIGdpdCBncmVwIGtjb25maWcuaCB0b29scy9w
ZXJmLwo+ICQKPiAKPiBCVFcsIHdoYXQgd291bGQgaGFwcGVuIGlmIEkgY29sbGVjdGVkIGEgcGVy
Zi5kYXRhIGZpbGUgb24geDg2XzY0IGFuZAo+IHdvdWxkIHJlYWQgaXQgaW4gYSBSaXNjViBtYWNo
aW5lIHdpdGggc3VjaCBhIG9iamR1bXAgdmVyc2lvbj8gVGhlIHNhbWUKPiBwcm9ibGVtPwoKWWVz
IHRoYXQncyBhIGdvb2QgcG9pbnQsIHdlIHNob3VsZCBiZSBkZXRlY3RpbmcgcmlzY3YgYXQgcnVu
dGltZSB0b28uCgotIENoYXJsaWUKCj4gCj4gLSBBcm5hbGRvCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
