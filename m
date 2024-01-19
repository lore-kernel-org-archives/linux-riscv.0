Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11044C4725D
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jan 2024 09:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gD8u0LmAMhrsb5pibG92y/27UBoxEge6ZgxIkuwpGMM=; b=vxgTP3jLyCnSBL
	Mfa0NkoF6WQaL7iK1el8O/bPeZeNBN1y5jShnuu1C8hJgm4lckUcS+PcCg8x5v4+ldMdlGCX5Dwh8
	dr7zCJY26haCghWQc8PqMLkU9pxiuT+zd1KEAFiuMW2+l62Sd3fHD50IgGLXtxxuS/cwv3jF/1QB4
	O7D0ybZwE3qdqE9WfBPNO+HXpZLf3Zqg65Ofa1f1w/FoOczYwGuNHREy92aRRmliMuX0BQWgU7Wi4
	osbcsMjBi2cCD+hV6xPQk2a0D8zLecj9GRpKbQ9yVQKVZlJtQ5P7V5pu3MZFQctdA8LpApz6rGH3P
	ajFVfbkxo1WgwNj0KvOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQkje-004uS8-2X;
	Fri, 19 Jan 2024 09:00:22 +0000
Received: from mail-oi1-f177.google.com ([209.85.167.177])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQkjb-004uRG-2U
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jan 2024 09:00:21 +0000
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3bd884146e9so465856b6e.0
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jan 2024 01:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1705654756; x=1706259556; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1eI7oKwluJHufrmR/+t/jl4QJYaRvhGdlhKsHX8IrHk=;
        b=iUCYcQ1HjLgdLa8Z8u2dZrYWTkBQmPisWkFqUqif1bQ2hta7aJWCj2W2LLwyqOdDUf
         330M8IAMISqbWIc90KZGDXRDNA9MmxGvtPPKq9D3GdRqkmvPZtRHABndOfXeDpY/agm3
         9WkOQ4W/4tcfeqCHfoZa/48GszKVTVWD/76uD8NkROhfj8D1Dsm4+Nw2y0bRLmBLAD8m
         A9HsYlHm5XTrAF7kHJrt1/CUCk6xQELlvWfFcFVnxy8JJ74mdJeNMYn1i62QtZtzXbx5
         weYV9i8LoAdEWmgec2sqZHa/mi9Im1nTr7G8qx7LZWFIGgf9Z8pFjXhKF0hDTSDYyKyv
         qlKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705654756; x=1706259556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1eI7oKwluJHufrmR/+t/jl4QJYaRvhGdlhKsHX8IrHk=;
        b=ZjDMa0fd5GrCQGqTZWjnzAoC9yvebFkpJNTQ78yWDfOs7PYaj0DieYJ7dlDUmyF3+9
         uLIVRxO7u2LI1kBCYBA7BSy4bZLaJTIpzD7lvUQsoUjUAMy/4hydige7YPk2vlvrTz3m
         7rgyDwgiT1JdJNYVed1gnMPVBugBl14qZ2TYHh45T07LFpuqVZ32aOXZuql6tDUxNaLH
         5rw0SOCaUKhWhvZ/PiBnqrEeUfyxAiEiI2X+HbEq+QWyZGR//+5Z9aJ2zEXLVJgT4Ipu
         2Y73fWdN+MTSlsnMx2N5MyiQD+TLqV7GbwbCMPi8avKIPrqFgADwn1Rh6YDCiYk+Kp2e
         Z09w==
X-Gm-Message-State: AOJu0YxnRgtj0mHKKjuH5mAZcKiuk8Bo0YPsYaaAKA/P+9m1BVn1kpfi
	uG2tuNTSKlo3VFULqFo1UXRP6YPvu/k79HBCHYOM86EC+3u9iqrevQtyP3bSTPaGR1boVBUvtsP
	S1hjJsOG2XV21cRFdvjlkf+sqxQ9XnlyDPGhM4w==
X-Google-Smtp-Source: AGHT+IGDtKifdyFbFl00vUqXaaQDmLQawsOIqTsOfIBA/q8ZMMBaCOKOHGION9x3ktROew68PVHj7FnEjK+UWbE+HrI=
X-Received: by 2002:a05:6870:659e:b0:203:c5ca:5333 with SMTP id
 fp30-20020a056870659e00b00203c5ca5333mr2258133oab.41.1705654756634; Fri, 19
 Jan 2024 00:59:16 -0800 (PST)
MIME-Version: 1.0
References: <CAEEQ3wn=TkGULh=kqUxxi913_AVrRW1Edb6tTe7CuKS=YkP1BA@mail.gmail.com>
 <20240118-enjoyment-defuse-3b5a2b76afb7@spud> <CAEEQ3w=_SNRVCg9tGU+SjPVO57FhGQW7Pk9BZ-f97Lh5U0LXEA@mail.gmail.com>
 <20240119-majestic-unsheathe-4ff839d416ac@wendy>
In-Reply-To: <20240119-majestic-unsheathe-4ff839d416ac@wendy>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Fri, 19 Jan 2024 16:59:05 +0800
Message-ID: <CAEEQ3wk9JEMHX59GE5m5n2Tk0fddfXPQ_6tZjQnN_y7DLBAQnw@mail.gmail.com>
Subject: Re: [External] Re: Current status of RISC-V init_cache_level()
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_010020_151460_DDC21C46 
X-CRM114-Status: GOOD (  25.64  )
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

SGkgQ29ub3LvvIwKCk9uIEZyaSwgSmFuIDE5LCAyMDI0IGF0IDQ6MjLigK9QTSBDb25vciBEb29s
ZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPiB3cm90ZToKPgo+IE9uIEZyaSwgSmFuIDE5
LCAyMDI0IGF0IDEwOjMyOjM4QU0gKzA4MDAsIHl1bmh1aSBjdWkgd3JvdGU6Cj4gPiBPbiBUaHUs
IEphbiAxOCwgMjAyNCBhdCA5OjI14oCvUE0gQ29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3Jn
PiB3cm90ZToKPiA+ID4gT24gVGh1LCBKYW4gMTgsIDIwMjQgYXQgMDc6NDA6NDJQTSArMDgwMCwg
eXVuaHVpIGN1aSB3cm90ZToKPiA+ID4KPiA+ID4gRmlyc3RseSwgcGxlYXNlIGRvbid0IHNlbmQg
bWUgb2ZmLWxpc3QgbWFpbHMgYWJvdXQgc3VjaCB0aGluZ3MKPiA+ID4gYW5kIGluc3RlYWQsIHBs
ZWFzZSByZXBseSB0byB0aGUgcmVsZXZhbnQgdGhyZWFkcyBvbiBsa21sLgo+ID4gPgo+ID4gPiA+
IFRoZXJlIGlzIG5vIGNhY2hlIHN1YmRpcmVjdG9yeSBpbiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUwLywgc28KPiA+ID4gPiBsc2NwdSBjYW5ub3Qgc2VlIHRoZSBjYWNoZSBpbmZvcm1hdGlv
bi4gSSBmb3VuZCB0aGF0IHRoZSByZWFzb24gaXMKPiA+ID4gPiB0aGF0IGluaXRfY2FjaGVfbGV2
ZWwoKSBpcyBub3QgaW1wbGVtZW50ZWQgb24gUklTQy1WLgo+ID4gPgo+ID4gPiBXaGF0IHZlcnNp
b24gb2YgdGhlIGtlcm5lbCBhcmUgeW91IHVzaW5nPyBJIGhhZCBhIGJyaWVmIGNoZWNrIHRvIG1h
a2UKPiA+ID4gc3VyZSBzb21ldGhpbmcgaGFkIG5vdCBnb25lIGF3cnkgcmVjZW50bHkgYW5kIEkg
Y291bGQgc2VlIHRoZW0gb24gbXkKPiA+ID4gc3lzdGVtLiBXaGF0IGRvIHRoZSBjcHUgbm9kZXMg
aW4geW91ciBEVCBsb29rIGxpa2UsIGFzc3VtaW5nIHlvdSBhcmUKPiA+ID4gb24gYSBEVCBzeXN0
ZW0/Cj4gPgo+ID4gVGhlIHJlc3VsdHMgb2YgdG9wIGNvbW1pdCB1c2luZyBsaW51eC1uZXh0IG9u
IHFlbXUsIEl0IHNob3VsZCBub3QKPiA+IG1hdHRlciBpZiBpdCBpcyBjb21iaW5lZCB3aXRoIERU
LCBiZWNhdXNlIHRoZSBmb2xsb3dpbmcgZnVuY3Rpb24gZmxvdwo+ID4gZGlyZWN0bHkgZmFpbHMu
Cj4KPiBPaCBubywgaXQgdG90YWxseSBkb2VzIG1hdHRlciB3aGF0IHRoZSBEVCBsb29rcyBsaWtl
LiBUaGUgZGVmYXVsdCBEVCBpbgo+IFFFTVUncyB2aXJ0IG1hY2hpbmUgZG9lcyBub3QgcG9wdWxh
dGUgYW55IGNhY2hlIHByb3BlcnRpZXMuIE9uIGEgc3lzdGVtCj4gd2hlcmUgdGhlIERUIHBvcHVs
YXRlcyB0aGVzZSB2YWx1ZXMsIGluaXRfb2ZfY2FjaGVfbGV2ZWwoKSB3aWxsIGVuc3VyZQo+IHRo
YXQgdGhlIGNvcnJlY3Qgc3lzZnMgZW50cmllcyBhcmUgc2V0IHVwLgo+Cj4gPiBjYWNoZWluZm9f
c3lzZnNfaW5pdCgpLi4uaW5pdF9jYWNoZV9sZXZlbCgpCj4gPiBpbnQgX193ZWFrIGluaXRfY2Fj
aGVfbGV2ZWwodW5zaWduZWQgaW50IGNwdSkKPiA+IHsKPiA+IHJldHVybiAtRU5PRU5UOwo+ID4g
fQo+ID4gSXMgaXQgbmVjZXNzYXJ5IHRvIGltcGxlbWVudCBhbiBpbml0X2NhY2hlX2xldmVsKCkg
b24gUklTQy1WIGxpa2Ugb3RoZXIgYXJjaGVzPwo+Cj4gSW4gb3JkZXIgdG8gaW1wbGVtZW50IHRo
YXQgZnVuY3Rpb24sIHdlIHdvdWxkIG5lZWQgc29tZSBtZWNoYW5pc20gZm9yCj4gZmluZGluZyB0
aGF0IGluZm9ybWF0aW9uLiBXaGVyZSBkbyB5b3Ugc3VnZ2VzdCB3ZSBnZXQgaXQgZnJvbSwgaWYg
aXQgaXMgbm90Cj4gcHJvdmlkZWQgdG8gdXMgZnJvbSBEVD8KCkl0J3Mgbm90IHRoYXQgd2UgZG9u
J3QgZ2V0IGNhY2hlIGluZm9ybWF0aW9uIGZyb20gRFQuIFdoYXQgSSB3YW50IHRvCmV4cHJlc3Mg
aXMgdGhhdCB3ZSBuZWVkIHRvIGltcGxlbWVudCBpbml0X2NhY2hlX2xldmVsKCkgb24gUklTQy1W
LApvdGhlcndpc2UgY2FjaGVpbmZvX2NwdV9vbmxpbmUoKSB3aWxsIHJldHVybiBmcm9tCmRldGVj
dF9jYWNoZV9hdHRyaWJ1dGVzKCkgYW5kIHdpbGwgbm90IGV4ZWN1dGUgY2FjaGVfYWRkX2Rldigp
LCBzbyBpdAp3aWxsIG5vdCBiZSBpbi8gc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHV4LyBjcmVh
dGVzIGEgImNhY2hlIiBub2RlLgoKVGhhbmtzLApZdW5odWkKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
