Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4EDACD343F
	for <linux-riscv@archiver.kernel.org>; Fri, 15 May 2026 06:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V36AjX9aY55uU8hthTyMpyyvSIUmxg5WH86vxcEoQXM=; b=flemPoe34bGql2
	iu5tslfzdehBplJo+68kkrGkJVtEHr3BO0JadzxOOJlT1F7JvrLXa4A1CyiEjz7SyE6IIhTdPi91u
	jZECeDLY8BskNvEmfPONISo0Uxa4WETqV4QjqmET6oHkgHsNS6raPbdn7w1nn7QPmPg/cZEo/QA97
	8UR+2nFXrn+ut9XN0HJmU+KDDct72iSBvZvnZureX5bGVETHk7q4bXh1gIXPmeWhm1YfTzhk9DGNl
	GltpDxtM1GpTF0rjPfMjLNBausDwk96QmzR23OYCbUtQ00YvN79FrST3ADCVI5d3Lr5TllZlT33DJ
	nzqaePVdhxOVKBOdO+ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNmAn-00000007WRq-1QNp;
	Fri, 15 May 2026 06:37:25 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNmAk-00000007WRC-2mvl
	for linux-riscv@lists.infradead.org;
	Fri, 15 May 2026 06:37:24 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-bd4f7f05e90so275587966b.2
        for <linux-riscv@lists.infradead.org>; Thu, 14 May 2026 23:37:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778827040; cv=none;
        d=google.com; s=arc-20240605;
        b=KQeqrRfj5lGtPkTIsdyH1S7cVetZMurZ/v6IWsE1mkSa2Zfy94kObbeUwl24AEUL0J
         hvTsmXUstZxqFpd6CFQrexSajFYncG0MX+a2QXZhzQjt/DSPtIcBvm/OUp6M9s0t+Kub
         uCLAVVKjqs+/683fWvD4Jpp9DelGG+fd3Lsf9oZwH6yF8EHUdcS/PXOjRwNuhlm/QwWY
         rBWQMVkfhFc+2OfAsa6Z4DEdGR3iB5npdB7fSE83CwYWdLr1R9U0+yWGXz5xY2qtTtXS
         rVi3Kh0cmwRFx+dU8ccJyNARvNNht/G4huEmsh3zggrHIqUY8bGe559DWSql8vPjTero
         PuXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4LMCqVFSjOu6qSrwojx1FavaW0eHqSxzlXVygC4r2vs=;
        fh=hTjiok/YRedEs8vQCGXPoSm4jPNVlS12PWtIYqOxJno=;
        b=ZtTU94pfxlSNo0Lgz3EjL7fzhTSQP76jUUMZm8PDrb05C2J8zdKlTMyORo3hw6F0me
         SdQlysef/dwl3LlJIMCwSR2kvEaASb+eym6Co5ywWaw5zcIoJ7g4H52knNmQ5qjGZK42
         v5s2JKHthnVv7cAN1+s8+YpT/8CHOdE6HH0mMlBridUdHKy08u6LS9gU7+xiFkf+qIKX
         LH5FV7E12qK/l5/xdxIc7onme4AFjOqGGhOdqeNiCRVNs9MDofki5ejPht6IbiKDNhIc
         O9QD1u/rk4bNe4R+qlqmIu7eNLeZ1Y4ARR2p1WNli1yMfoDz1CrJfSPlkimVwmgSjGLd
         gVRA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778827040; x=1779431840; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4LMCqVFSjOu6qSrwojx1FavaW0eHqSxzlXVygC4r2vs=;
        b=DSw26MER7LJtv7okbsL6Jws6XfVlZt2FTf5+gpsQ17AELV2jEkElNVR+szCrFP/3mf
         cpNZ9pBDcJM3LMQyRulsCqoISgbrqrSOU4gyi/wezK4GE2P4bEobxwJxcjGyFldlI1Nn
         Gjt5I9QdTOSla2m4kmUrvhNvHoj6ENTOsu5CNsvZW8Taxa0m3wNcRqVR2fNUyFLmQgpr
         9C7x4Vn/p4ed0F+l7rhGwekk1kOD9k8WzPd6c1TweFPriTwHa4WIL9tiAVQzh0aGS5CC
         rb2EhhavTwX+WlaBZ1cFlVM9Okq8wc/2V25yC96XPTUN15Kl7xsCzMBVxKfW2GkVfoEp
         r/sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778827040; x=1779431840;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4LMCqVFSjOu6qSrwojx1FavaW0eHqSxzlXVygC4r2vs=;
        b=NRaacld1mfI6sZkfx21JuD0q0gt7Knrn7Q4rvS7BCwCDmK46F7uEcUKFQ+f9t8Tlx7
         YCMlgasykQ62EQHDtDR71iEI16w8T2QD3cXzXJNBxjbVMO/KgENNcElxeXsd+fC/id+T
         Exk8AYGX25X656lzMCktGoLry2GejiocpjnMOqRWHP2MFejIi4PyrJuNkwuvWummrQ0U
         3oci8jo7D7lj+boup+WMMFuRKTn6ctSkGRkznQ0y0l7weR85i0D1NFtBXtiwvFX/JZIZ
         zjoUa4Z6CkHyKMvRR2Pa089MfGdl7HE7TbaN7ad8acscpnr67/PIYCwWLGsWZ/DTcnCB
         tXBw==
X-Forwarded-Encrypted: i=1; AFNElJ8FmFPz5Nkyap5DsC8qOLCchRiISJbDgZ/hwW+W2LLtCvt+E9US/vJJOE8WhgEqjxMZ0jpplS1PPSGaFA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4jVmiwj41IA2RjhsByw9uKIii4P5sKmh94LBUZO1v34XREIh8
	MnyMgBr8Jbe0PEoING306FUCusyF2oynL+M18xQ6ZWKfLbG1m57Up3bVQ0ej20SH+XZUWQa37db
	YTZ4CiaU1hn94wwHKSJ/6uH8gMpyBxU3CVMxEjp0=
X-Gm-Gg: Acq92OHMWgivhm2OEG8b+JIVhPE/79+sFpuMKd9g6EaXu3bzP0UrKxVJBLeiIbFuQHA
	k8EoxJ97W9l1+xbRLbfcT9vH5YftwKfz5hwu5gIJabWoobYDv3DgIoReYFZcE32KUFkilzqyf4Z
	iUZuV+MttXE2Ilu0WQUeH9lTof3YbcvDCfDFtF9qqEYO5bILD3I+5T+QIs1Kqw9huwVAKgvoWdy
	YvTZboAqAhccN4+OrJwjcR5Ld/nVfByChtQ6/CNS317xYMWqiemuWVcQlnlsmwBmJRnD5RlsVte
	d31fLQwPt0IRl1oeZTxeBIKbxzMmXl9bOSHRDdykN9umEDCSgJJKYBifU0/B15qv8AZuCOTLQmV
	WiZYHkNA=
X-Received: by 2002:a17:907:c247:b0:bcd:c899:904e with SMTP id
 a640c23a62f3a-bd5177d9a69mr147258366b.7.1778827039790; Thu, 14 May 2026
 23:37:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260514121359.931999-1-milant2002@gmail.com> <20260514121359.931999-3-milant2002@gmail.com>
 <202605140916.09FBB1A4@keescook>
In-Reply-To: <202605140916.09FBB1A4@keescook>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 15 May 2026 09:36:43 +0300
X-Gm-Features: AVHnY4LTtUgH9l_UEKEjClBIDSN7f6fhD3s_31tgGoM3D-Skkze3R3ylHD52Z_s
Message-ID: <CAHp75Vfb=J6gQ=YbpA8OxTpti-n2CaAGh+Ro1iZJWRxwbGd8eA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] lib/string_kunit: extend benchmarks and unit test
 to memcmp()
To: Kees Cook <kees@kernel.org>
Cc: Milan Tripkovic <milant2002@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andy Shevchenko <andy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	llvm@lists.linux.dev, Dusan Stojkovic <Dusan.Stojkovic@rt-rk.com>, 
	Milan Tripkovic <Milan.Tripkovic@rt-rk.com>, kernel test robot <lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_233722_731888_81D18454 
X-CRM114-Status: GOOD (  16.18  )
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

T24gVGh1LCBNYXkgMTQsIDIwMjYgYXQgNzoxOeKAr1BNIEtlZXMgQ29vayA8a2Vlc0BrZXJuZWwu
b3JnPiB3cm90ZToKPiBPbiBUaHUsIE1heSAxNCwgMjAyNiBhdCAwMjoxMzo1OFBNICswMjAwLCBN
aWxhbiBUcmlwa292aWMgd3JvdGU6Cj4gPiBGcm9tOiBNaWxhbiBUcmlwa292aWMgPE1pbGFuLlRy
aXBrb3ZpY0BydC1yay5jb20+Cj4gPgo+ID4gRXh0ZW5kIHRoZSBzdHJpbmcgYmVuY2htYXJraW5n
IHN1aXRlIHRvIGluY2x1ZGUgbWVtY21wKCkuCj4gPiBFeHRlbmQgdGhlIHN0cmluZyB1bml0IHRl
c3QgdG8gaW5jbHVkZSBtZW1jbXAoKS4KCj4gPiBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9i
b3QgPGxrcEBpbnRlbC5jb20+Cj4gPiBDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL29l
LWtidWlsZC1hbGwvMjAyNjA1MTQwODI3LlFnMURacGNCLWxrcEBpbnRlbC5jb20vCgpXaGF0IGRv
ZXMgdGhpcyBtZWFuPyBUaGUgYWJzZW5jZSBvZiB0aGUgdGVzdCBjYXNlcyB3b24ndCBldmVyIGJl
CnJlcG9ydGVkIGJ5IExLUC4KCi4uLgoKPiA+ICsjaWYgSVNfRU5BQkxFRChDT05GSUdfU1RSSU5H
X0tVTklUX0JFTkNIKQo+ID4gK3N0YXRpYyB2b2lkIHN0cmluZ19iZW5jaF9tZW1jbXAoc3RydWN0
IGt1bml0ICp0ZXN0KQoKPiBJIHRoaW5rIEknZCBwcmVmZXIsIGluc3RlYWQgb2YgYSBpZmRlZiBz
dHViLCB0byBkbzoKPgo+ICAgICAgICAgaWYgKCFJU19FTkFCTEVEKENPTkZJR19TVFJJTkdfS1VO
SVRfQkVOQ0gpKQo+ICAgICAgICAgICAgICAgICBrdW5pdF9za2lwKHRlc3QsICJDT05GSUdfU1RS
SU5HX0tVTklUX0JFTkNIIG5vdCBlbmFibGVkIikKPgo+IGhlcmUuCgpXaGF0IGFib3V0IGhhdmlu
ZyB0d28gZnVuY3Rpb25zPwoKc3RhdGljIHZvaWQgZG9fdGVzdF9zdHJpbmdfYmVuY2hfbWVtY21w
KCkgLy8gY2hvb3NlIGJldHRlciBuYW1lCnsKICAuLi4KfQoKc3RhdGljIHZvaWQgc3RyaW5nX2Jl
bmNoX21lbWNtcChzdHJ1Y3Qga3VuaXQgKnRlc3QpCnsKICAgICAgICBpZiAoSVNfRU5BQkxFRChD
T05GSUdfU1RSSU5HX0tVTklUX0JFTkNIKSkKICAgICAgICAgICAgICAgIGRvX3Rlc3Rfc3RyaW5n
X2JlbmNoX21lbWNtcCguLi4pOwogICAgICAgIGVsc2UKICAgICAgICAgICAgICAgIGt1bml0X3Nr
aXAodGVzdCwgIkNPTkZJR19TVFJJTkdfS1VOSVRfQkVOQ0ggbm90IGVuYWJsZWQiKTsKfQoKLi4u
Cgo+ID4gKyAgICAgZm9yIChpbnQgbyA9IDA7IG8gPCBBUlJBWV9TSVpFKG9mZnNldHMpOyBvKysp
IHsKPiA+ICsgICAgICAgICAgICAgaW50IG9mZiA9IG9mZnNldHNbb107Cj4gPiArCj4gPiArICAg
ICAgICAgICAgIGZvciAoaW50IGkgPSAwOyBpIDwgQVJSQVlfU0laRShsZW5ndGhzKTsgaSsrKSB7
Cgp1bnNpZ25lZCBpbnQgaQoKPiA+ICsgICAgICAgICAgICAgICAgICAgICBzaXplX3QgbGVuID0g
bGVuZ3Roc1tpXTsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBjaGFyICpwMSA9IGJ1ZjE7Cj4g
PiArICAgICAgICAgICAgICAgICAgICAgY2hhciAqcDIgPSBidWYyICsgb2ZmOwoKPiA+ICsKClJl
ZHVuZGFudCBibGFuayBsaW5lCgo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHUzMiBpdGVyYXRp
b25zID0gKGxlbiA8IDUxMikgPyAxMDAwMDAgOiAxMDAwMDsKPiA+ICsKPiA+ICsgICAgICAgICAg
ICAgICAgICAgICBmb3IgKHUzMiBqID0gMDsgaiA8IGl0ZXJhdGlvbnM7IGorKykgewo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgKHZvaWQpbWVtY21wKHAxLCBwMiwgbGVuKTsKPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJhcnJpZXIoKTsKPiA+ICsgICAgICAgICAg
ICAgICAgICAgICB9Cgo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHU2NCBlbGFwc2VkID0gU1RS
SU5HX0JFTkNIKGl0ZXJhdGlvbnMsIG1lbWNtcCwgcDEsIHAyLCBsZW4pOwo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgIHU2NCBuc19wZXJfY2FsbCA9IGRpdl91NjQoZWxhcHNlZCwgaXRlcmF0aW9u
cyk7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgdTY0IG1icHMgPSBsZW4gPyBkaXZfdTY0KCh1
NjQpbGVuICogaXRlcmF0aW9ucyAqIDEwMDAsCgpJbnN0ZWFkIG9mIGNhc3RpbmcganVzdCBtYWtl
IGl0ZXJhdGlvbnMgdG8gYmUgdTY0LgoKICAgICAgICAgICAgICAgICAgICAgbWJwcyA9IGxlbiA/
IGRpdl91NjQoaXRlcmF0aW9ucyAqIDEwMDAgKiBsZW4sCgo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBlbGFw
c2VkKSA6IDA7CgpXZSBkb24ndCB1c3VhbGx5IGFsbG93IHRoZSBDOTkgZGVmaW5pdGlvbiBpbml0
aWFsaXNlcnMgaW5zaWRlIHRoZQpjb2RlLCBldmVuIGZvciB0ZXN0cy4KCihXaXRoIHRoYXQgdGhl
IGxhc3Qgd2lsbCBiZSBhIHNpbmdsZSBsaW5lLikKCj4gPiArICAgICAgICAgICAgICAgICAgICAg
aWYgKG9mZiA9PSAwKSB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBrdW5pdF9p
bmZvKHRlc3QsICJiZW5jaF9tZW1jbXBfYWxpZ25lZDogbGVuPSUtNHp1OiAlbGx1IE1CL3MgKCVs
bHUgbnMvY2FsbClcbiIsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGxlbiwgbWJwcywgbnNfcGVyX2NhbGwpOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgIH0g
ZWxzZSB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBrdW5pdF9pbmZvKHRlc3Qs
ICJiZW5jaF9tZW1jbXBfdW5hbGlnbmVkKG9mZj0lZCk6IGxlbj0lLTR6dTogJWxsdSBNQi9zICgl
bGx1IG5zL2NhbGwpXG4iLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBvZmYsIGxlbiwgbWJwcywgbnNfcGVyX2NhbGwpOwo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgIH0KPiA+ICsgICAgICAgICAgICAgfQo+ID4gKyAgICAgfQoKLS0gCldpdGggQmVzdCBSZWdh
cmRzLApBbmR5IFNoZXZjaGVua28KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
