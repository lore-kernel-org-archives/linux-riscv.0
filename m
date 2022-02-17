Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E88B7C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Feb 2022 20:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OHyMYwbWvPeMFtmYqFa9ryuag37zNzSlpsOtJXOQ/kM=; b=Zv1ZD6KDRMA3Hw
	jgWVtKjwl2UNFxnGyM9kIhvmBCCpeQT7WhOz+P+753kdUSFjmgmWJystz8k34/xir2nxBo/KRWOef
	oUvRRRebVjS8EzjKJHYqJPHBbpCKrzqUtUpOzefqTR5oog0kZdQ2qUgy2bcZyPQ1dTwzlHuVwgVy/
	xB23DYE/5/LXYOkbv4TpFAE36dmK9vQFXFlSakc9omsaWdv3i01ztRQXUc8x8+fd124MDb2FBMcFz
	GjwOWTkM/i0MHMWsHqjJ48F96I950B5GnwiM5Eg9uquqZhcQyaZU2l+umbbV2585mH7YX8RtvKtvc
	sAtD5Hq7AH6bcqThOzFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKndA-00CCkL-Vw; Thu, 17 Feb 2022 20:44:01 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKnPb-00C66N-UG
 for linux-riscv@lists.infradead.org; Thu, 17 Feb 2022 20:30:02 +0000
Received: by mail-yb1-xb36.google.com with SMTP id p19so15416916ybc.6
 for <linux-riscv@lists.infradead.org>; Thu, 17 Feb 2022 12:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IUl1+sbxUPJhNhrxqJaq+c36PTDFKTH/KVRlSQmIXs8=;
 b=Vx98KnCngkenU+PXAobN/H3fGJpONX7rpPSfP45QOYevZFRetL3e4+v94QEhhi+ce1
 vJe8bvtS4kDfUkppkTIY20jDgwzPlSXJFdpbqXtHLnee62S1cLB+aI2/AN7SQc5AW8Pt
 yB96SyH1nLRLOICDYADYPYQ81gNW+hpIFEtLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IUl1+sbxUPJhNhrxqJaq+c36PTDFKTH/KVRlSQmIXs8=;
 b=lcAUBT2LE0JJEzf+UzOtbgM2deTMAxpxJni2YwAeMPME9h13Kv8/S1GNiTXQUTfY+r
 BuR1qfZ94V2II7udLbxeIoiBd/h4unmlIf0vxNlTIR6A0nvv6ZY7H7+vph1odC1M/6KF
 vxJ7mUlS375VFjHoQe2IOmAjHC9F6gjjdebTTgZze8+DeXjS5ncxwgFFDqr98qNTME41
 Rz8jO7IIDl/O3ARh8WImoalB23sX3zxaDn1RAsarDq5vPV02nCpe3X0LF7Co1Kpzxb2g
 rtRTkI9Zut6+nOWsvSsjQKN9XZ5O+jtLUrMnj17YbTGvVnPKxFwYjyi0S0c1kIjDxlbk
 OnLA==
X-Gm-Message-State: AOAM532QL21KhkA3hvtVdyQoPgN6S2hHtjZnM5v9QJaBtLevqDI0PgsF
 pUpKW/zW/3b4Wo9vZb8H4xIBSYRPtAIEqmX8xUJq
X-Google-Smtp-Source: ABdhPJwtifBjREmUKE8lnzM07bCU1YQ5vaFRwlmUKCwZZHYsIXoEnYXAMPM3uD+1xbRX1g5Vjn8xH9uMFCDx57j0jc4=
X-Received: by 2002:a25:86c9:0:b0:61e:188a:d71f with SMTP id
 y9-20020a2586c9000000b0061e188ad71fmr4135038ybm.14.1645129798862; Thu, 17 Feb
 2022 12:29:58 -0800 (PST)
MIME-Version: 1.0
References: <20211225054647.1750577-1-atishp@rivosinc.com>
 <20211225054647.1750577-7-atishp@rivosinc.com>
 <13483045.gklhn8uf4L@diego>
In-Reply-To: <13483045.gklhn8uf4L@diego>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 17 Feb 2022 12:29:48 -0800
Message-ID: <CAOnJCUJ_TB9+e=W6aC2gFn-iiQe9YDNAM6RzQx646+9_7MVu6w@mail.gmail.com>
Subject: Re: [v5 6/9] RISC-V: Add perf platform driver based on SBI PMU
 extension
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Atish Patra <atishp@rivosinc.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
 Damien Le Moal <damien.lemoal@wdc.com>, devicetree <devicetree@vger.kernel.org>,
 Jisheng Zhang <jszhang@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_123000_067558_66220762 
X-CRM114-Status: GOOD (  26.55  )
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

T24gTW9uLCBKYW4gMjQsIDIwMjIgYXQgNToxNiBBTSBIZWlrbyBTdMO8Ym5lciA8aGVpa29Ac250
ZWNoLmRlPiB3cm90ZToKPgo+IEFtIFNhbXN0YWcsIDI1LiBEZXplbWJlciAyMDIxLCAwNjo0Njo0
NCBDRVQgc2NocmllYiBBdGlzaCBQYXRyYToKPiA+IEZyb206IEF0aXNoIFBhdHJhIDxhdGlzaC5w
YXRyYUB3ZGMuY29tPgo+ID4KPiA+IFJJU0MtViBTQkkgc3BlY2lmaWNhdGlvbiBhZGRlZCBhIFBN
VSBleHRlbnNpb24gdGhhdCBhbGxvd3MgdG8gY29uZmlndXJlCj4gPiBzdGFydC9zdG9wIGFueSBw
bXUgY291bnRlci4gVGhlIFJJU0MtViBwZXJmIGNhbiB1c2UgbW9zdCBvZiB0aGUgZ2VuZXJpYwo+
ID4gcGVyZiBmZWF0dXJlcyBleGNlcHQgaW50ZXJydXB0IG92ZXJmbG93IGFuZCBldmVudCBmaWx0
ZXJpbmcgYmFzZWQgb24KPiA+IHByaXZpbGVnZSBtb2RlIHdoaWNoIHdpbGwgYmUgYWRkZWQgaW4g
ZnV0dXJlLgo+ID4KPiA+IEl0IGFsc28gYWxsb3dzIHRvIG1vbml0b3IgYSBoYW5kZnVsIG9mIGZp
cm13YXJlIGNvdW50ZXJzIHRoYXQgY2FuIHByb3ZpZGUKPiA+IGluc2lnaHRzIGludG8gZmlybXdh
cmUgYWN0aXZpdHkgZHVyaW5nIGEgcGVyZm9ybWFuY2UgYW5hbHlzaXMuCj4gPgo+ID4gU2lnbmVk
LW9mZi1ieTogQXRpc2ggUGF0cmEgPGF0aXNoLnBhdHJhQHdkYy5jb20+Cj4gPiBTaWduZWQtb2Zm
LWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4KPiA+IC0tLQo+Cj4gWy4uLl0K
Pgo+ID4gK3N0YXRpYyBpbnQgcG11X3NiaV9kZXZpY2VfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rl
dmljZSAqcGRldikKPiA+ICt7Cj4gPiArICAgICBzdHJ1Y3QgcmlzY3ZfcG11ICpwbXUgPSBOVUxM
Owo+ID4gKyAgICAgaW50IG51bV9jb3VudGVyczsKPiA+ICsgICAgIGludCByZXQ7Cj4gPiArCj4g
PiArICAgICBwcl9pbmZvKCJTQkkgUE1VIGV4dGVuc2lvbiBpcyBhdmFpbGFibGVcbiIpOwo+ID4g
KyAgICAgLyogTm90aWZ5IGxlZ2FjeSBpbXBsZW1lbnRhdGlvbiB0aGF0IFNCSSBwbXUgaXMgYXZh
aWxhYmxlKi8KPiA+ICsgICAgIHJpc2N2X3BtdV9sZWdhY3lfaW5pdCh0cnVlKTsKPgo+IEp1c3Qg
d29uZGVyaW5nLCBzaG91bGRuJ3QgdGhlIHJpc2N2X3BtdV9sZWdhY3lfaW5pdCgpIGNhbGwgbGl2
ZSBpbgo+IHBtdV9zYmlfZGV2aW5pdCkgYmVsb3c/Cj4KClRoYXQgd29ya3MgdG9vLiBGaXhlZCBp
dC4gVGhhbmtzLgoKPiBJLmUuIHdoZW4geW91IGRldGVjdGVkIHRoZSBwcmVzZW5jZSBvZiB0aGUg
UE1VIHNiaSBleHRlbnNpb24geW91IGFscmVhZHkKPiBrbm93IHRoYXQgeW91IGRvbid0IHdhbnQg
dGhlIGxlZ2FjeSBvbmUgYW5kIHlvdSBoYXZlIGxlc3MgY29udHJvbCBvdmVyCj4gcHJvYmUtb3Jk
ZXJpbmcgKHdoZW4gdGhlIGRyaXZlciBhY3R1YWxseSBwcm9iZXMpIHRoYW4gdGhlIGluaXRjYWxs
IGl0c2VsZi4KPgo+Cj4gQWxzbywgSSB0aGluayBhIGJldHRlciBuYW1pbmcgZm9yIHRoZSBmdW5j
dGlvbiBtaWdodCBiZSBnb29kLgo+IFJpZ2h0IG5vdyBqdXN0IHJlYWRpbmcKPgo+ICAgICAgICAg
cmlzY3ZfcG11X2xlZ2FjeV9pbml0KHRydWUpOwo+Cj4gc3VnZ2VzdHMgdGhhdCB5b3UgX3dhbnRf
IHRoZSBsZWdhY3ktaW5pdCB0byBiZSBlbmFibGVkLCB3aGlsZQo+IGluIHJlYWxpdHkgdGhlIGZ1
bmN0aW9uIG1lYW5zIHRoZSBvcHBvc2l0ZSwgZGlzYWJsaW5nIHRoZSBsZWdhY3kgaW5pdC4KPgo+
IFNvIG1heWJlIHNvbWV0aGluZyBsaWtlCj4gICAgICAgICByaXNjdl9wbXVfZGlzYWJsZV9sZWdh
Y3kodHJ1ZSk7ID8KPgoKeWVhaC4gQW51cCBoYWQgYSBzaW1pbGFyIHN1Z2dlc3Rpb24gYXMgd2Vs
bC4gSSBoYXZlIGNoYW5nZWQgaXQgdG8KcmlzY3ZfcG11X2xlZ2FjeV9za2lwX2luaXQKd2l0aG91
dCBhbnkgYXJndW1lbnQuCgo+Cj4gSGVpa28KPgo+ID4gKyAgICAgcG11ID0gcmlzY3ZfcG11X2Fs
bG9jKCk7Cj4gPiArICAgICBpZiAoIXBtdSkKPiA+ICsgICAgICAgICAgICAgcmV0dXJuIC1FTk9N
RU07Cj4gPiArCj4gPiArICAgICBudW1fY291bnRlcnMgPSBwbXVfc2JpX2ZpbmRfbnVtX2N0cnMo
KTsKPiA+ICsgICAgIGlmIChudW1fY291bnRlcnMgPCAwKSB7Cj4gPiArICAgICAgICAgICAgIHBy
X2VycigiU0JJIFBNVSBleHRlbnNpb24gZG9lc24ndCBwcm92aWRlIGFueSBjb3VudGVyc1xuIik7
Cj4gPiArICAgICAgICAgICAgIHJldHVybiAtRU5PREVWOwo+ID4gKyAgICAgfQo+ID4gKwo+ID4g
KyAgICAgLyogY2FjaGUgYWxsIHRoZSBpbmZvcm1hdGlvbiBhYm91dCBjb3VudGVycyBub3cgKi8K
PiA+ICsgICAgIGlmIChwbXVfc2JpX2dldF9jdHJpbmZvKG51bV9jb3VudGVycykpCj4gPiArICAg
ICAgICAgICAgIHJldHVybiAtRU5PREVWOwo+ID4gKwo+ID4gKyAgICAgcG11LT5udW1fY291bnRl
cnMgPSBudW1fY291bnRlcnM7Cj4gPiArICAgICBwbXUtPmN0cl9zdGFydCA9IHBtdV9zYmlfY3Ry
X3N0YXJ0Owo+ID4gKyAgICAgcG11LT5jdHJfc3RvcCA9IHBtdV9zYmlfY3RyX3N0b3A7Cj4gPiAr
ICAgICBwbXUtPmV2ZW50X21hcCA9IHBtdV9zYmlfZXZlbnRfbWFwOwo+ID4gKyAgICAgcG11LT5j
dHJfZ2V0X2lkeCA9IHBtdV9zYmlfY3RyX2dldF9pZHg7Cj4gPiArICAgICBwbXUtPmN0cl9nZXRf
d2lkdGggPSBwbXVfc2JpX2N0cl9nZXRfd2lkdGg7Cj4gPiArICAgICBwbXUtPmN0cl9jbGVhcl9p
ZHggPSBwbXVfc2JpX2N0cl9jbGVhcl9pZHg7Cj4gPiArICAgICBwbXUtPmN0cl9yZWFkID0gcG11
X3NiaV9jdHJfcmVhZDsKPiA+ICsKPiA+ICsgICAgIHJldCA9IGNwdWhwX3N0YXRlX2FkZF9pbnN0
YW5jZShDUFVIUF9BUF9QRVJGX1JJU0NWX1NUQVJUSU5HLCAmcG11LT5ub2RlKTsKPiA+ICsgICAg
IGlmIChyZXQpCj4gPiArICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gPiArCj4gPiArICAgICBy
ZXQgPSBwZXJmX3BtdV9yZWdpc3RlcigmcG11LT5wbXUsICJjcHUiLCBQRVJGX1RZUEVfUkFXKTsK
PiA+ICsgICAgIGlmIChyZXQpIHsKPiA+ICsgICAgICAgICAgICAgY3B1aHBfc3RhdGVfcmVtb3Zl
X2luc3RhbmNlKENQVUhQX0FQX1BFUkZfUklTQ1ZfU1RBUlRJTkcsICZwbXUtPm5vZGUpOwo+ID4g
KyAgICAgICAgICAgICByZXR1cm4gcmV0Owo+ID4gKyAgICAgfQo+ID4gKwo+ID4gKyAgICAgcmV0
dXJuIDA7Cj4gPiArfQo+ID4gKwo+ID4gK3N0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHBt
dV9zYmlfZHJpdmVyID0gewo+ID4gKyAgICAgLnByb2JlICAgICAgICAgID0gcG11X3NiaV9kZXZp
Y2VfcHJvYmUsCj4gPiArICAgICAuZHJpdmVyICAgICAgICAgPSB7Cj4gPiArICAgICAgICAgICAg
IC5uYW1lICAgPSBSSVNDVl9QTVVfUERFVl9OQU1FLAo+ID4gKyAgICAgfSwKPiA+ICt9Owo+ID4g
Kwo+ID4gK3N0YXRpYyBpbnQgX19pbml0IHBtdV9zYmlfZGV2aW5pdCh2b2lkKQo+ID4gK3sKPiA+
ICsgICAgIGludCByZXQ7Cj4gPiArICAgICBzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2Owo+
ID4gKwo+ID4gKyAgICAgaWYgKCgoc2JpX21ham9yX3ZlcnNpb24oKSA9PSAwKSAmJiAoc2JpX21p
bm9yX3ZlcnNpb24oKSA8IDMpKSB8fAo+ID4gKyAgICAgICAgICAgICBzYmlfcHJvYmVfZXh0ZW5z
aW9uKFNCSV9FWFRfUE1VKSA8PSAwKSB7Cj4gPiArICAgICAgICAgICAgIHJldHVybiAwOwo+ID4g
KyAgICAgfQo+ID4gKwo+ID4gKyAgICAgcmV0ID0gY3B1aHBfc2V0dXBfc3RhdGVfbXVsdGkoQ1BV
SFBfQVBfUEVSRl9SSVNDVl9TVEFSVElORywKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICJwZXJmL3Jpc2N2L3BtdTpzdGFydGluZyIsCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBwbXVfc2JpX3N0YXJ0aW5nX2NwdSwgcG11X3NiaV9keWluZ19j
cHUpOwo+ID4gKyAgICAgaWYgKHJldCkgewo+ID4gKyAgICAgICAgICAgICBwcl9lcnIoIkNQVSBo
b3RwbHVnIG5vdGlmaWVyIGZvciBSSVNDLVYgUE1VIGNvdWxkIG5vdCBiZSByZWdpc3RlcmVkOiAl
ZFxuIiwKPiA+ICsgICAgICAgICAgICAgICAgICAgIHJldCk7Cj4gPiArICAgICAgICAgICAgIHJl
dHVybiByZXQ7Cj4gPiArICAgICB9Cj4gPiArCj4gPiArICAgICByZXQgPSBwbGF0Zm9ybV9kcml2
ZXJfcmVnaXN0ZXIoJnBtdV9zYmlfZHJpdmVyKTsKPiA+ICsgICAgIGlmIChyZXQpCj4gPiArICAg
ICAgICAgICAgIHJldHVybiByZXQ7Cj4gPiArCj4gPiArICAgICBwZGV2ID0gcGxhdGZvcm1fZGV2
aWNlX3JlZ2lzdGVyX3NpbXBsZShSSVNDVl9QTVVfUERFVl9OQU1FLCAtMSwgTlVMTCwgMCk7Cj4g
PiArICAgICBpZiAoSVNfRVJSKHBkZXYpKSB7Cj4gPiArICAgICAgICAgICAgIHBsYXRmb3JtX2Ry
aXZlcl91bnJlZ2lzdGVyKCZwbXVfc2JpX2RyaXZlcik7Cj4gPiArICAgICAgICAgICAgIHJldHVy
biBQVFJfRVJSKHBkZXYpOwo+ID4gKyAgICAgfQo+ID4gKwo+ID4gKyAgICAgcmV0dXJuIHJldDsK
PiA+ICt9Cj4gPiArZGV2aWNlX2luaXRjYWxsKHBtdV9zYmlfZGV2aW5pdCkKPiA+Cj4KPgo+Cj4K
Pgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+
IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
CgoKLS0gClJlZ2FyZHMsCkF0aXNoCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
