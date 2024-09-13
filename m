Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE587FC6172
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Sep 2024 22:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RF+6AaLTfd6Sk1It2wOSZ/oQfVz7q6ih+Bz3W86VeNU=; b=F2YhdGLkz3GYCY
	TJ2t+Q+q26+fMx948hzB9LKBRmO+eHmggD3o1GDyirFVXx0t5WX0L3lPcJimw0maqAckt90V5BAzX
	3rBPTySThoxDt5XNYePIJb/N4kewojBBen5gKVcRn97B/3rHMTzO1UWtbQuqKf9UrRHY1XlkQYf94
	hcyOgBZ04h/bavqp/5RySGL/rE/AQqJn65wOOVXCoSwEKii1wvsj0fuXScJT/8dV/+sbed5tQ5zFL
	Fk0bb2eYCEdZfFgcRiCX3cF9cNkiY1xPOjS5Iqp5agGaomylle7qGEx2lhNiN/WWt8ZTdDM5ydVnd
	rJNURbCxoo58v+nunaOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spF0P-0000000HHwT-2Cth;
	Fri, 13 Sep 2024 22:43:09 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spF0J-0000000HHsL-2XKC
	for linux-riscv@lists.infradead.org;
	Fri, 13 Sep 2024 22:43:06 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-206f9b872b2so26800675ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 13 Sep 2024 15:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726267383; x=1726872183; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O6sngbm26h9u68OT2Hd+S9sd4uKNVxzO4t+yTVxFgok=;
        b=P4ZwopoyPWvCdhg7ypYTg9U6OPZ/ebli/meUQIISDDHuByiRJba6+thn0uUhWAAuSM
         SDjgXZD97ca63mhNDwsGRUL/3eU+sRdUUuQ6NACS4Yd2zPqekUrPeRP07/vHbS+K81K7
         la0YFNFn0X9XkzEL3LAvPYeoRKsJrh2a29FY8puBbERtnwFsnLHcgPiw7OjjIYCE9Pd8
         HIy9SKrmhHHK2hktDiHYOx9vrOll6QgK1KxyoEnJHsfLs1vGT8yF6omDSx7aQ/NnMI64
         3ValQoKrjcJjq9IC5WJqPh9mWR5UZaYOObmcErO1urz6WTb6ist311m64P8LYpaT5RI1
         yeBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726267383; x=1726872183;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O6sngbm26h9u68OT2Hd+S9sd4uKNVxzO4t+yTVxFgok=;
        b=RYZfPxVGWynjDj6TZyOTMDhdhQzsZnwsGx4+nHbIAtDU/uZTQZeV8+TC5VRs632mHP
         wOZb0v+KTfRShBfYlRRzYcnakwOWRisGdVPIyhDVL9SivLu+v8oj3zLs6pZQm5Lha27J
         vlKOKj1Yza4YTnoYtn7PEfZexNhwQ/Temcy/gOM2n6RzgzDl372nHfTygB62K/vWbE6E
         VdAUZ5xOECRPxIFzvFSp/S9+9Yl2Oyzh5e0Js9Swx4AIFzFDA+QH+I35xp64URzK31P5
         6doyjw0Ow/st/7hk5OgjqOaJYuJEeH7LZJhagjR/wtAU75Xzu6i50fAICX6SgewBE+f2
         +Y1w==
X-Gm-Message-State: AOJu0YwrrS02B5bnZ4WgBzS+1fonQnA39Uqtsxuf8rY5CSnInwV8bvzH
	bAlPR74mOPHry740U6jBMExMqu2OGwtjSa9pb7VYfQJfKx2YdqcuOPwOq/NY9/g=
X-Google-Smtp-Source: AGHT+IGf2SOi6tkHTO2oql3h4t6EuXMmRNqzskV8RoeuNWAj+sTqSIO7GAeH/mWaCxr3NkGyjHgNBA==
X-Received: by 2002:a17:90a:be08:b0:2db:89f0:99a3 with SMTP id 98e67ed59e1d1-2dba006807fmr8766616a91.26.1726267382419;
        Fri, 13 Sep 2024 15:43:02 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dbd145b2cesm55467a91.42.2024.09.13.15.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 15:43:01 -0700 (PDT)
Date: Fri, 13 Sep 2024 15:42:59 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Juhan Jin <juhan.jin@foxmail.com>
Cc: linux-riscv@lists.infradead.org, peterz@infradead.org,
	jpoimboe@kernel.org, juhanj2@illinois.edu
Subject: Re: Is RISC-V Static Call worth implementing ?
Message-ID: <ZuS/83B9hA5wvR/q@ghost>
References: <tencent_24E1437DFC1D2BB7528A2A28D503C8033107@qq.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <tencent_24E1437DFC1D2BB7528A2A28D503C8033107@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_154303_935753_57CE0112 
X-CRM114-Status: GOOD (  29.85  )
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

T24gRnJpLCBTZXAgMTMsIDIwMjQgYXQgMDM6MDU6MzNBTSAtMDUwMCwgSnVoYW4gSmluIHdyb3Rl
Ogo+IEhpIGZvbGtzLAo+IAo+IEnigJltIGludGVyZXN0ZWQgaW4gaW1wbGVtZW50aW5nIFN0YXRp
YyBDYWxsIGZvciBSSVNDLVYsIGFuZCBJIHdhbnQgdG8KPiBrbm93IHdoZXRoZXIgaXQgaXMgd29y
dGggdGhlIGVmZm9ydHMgdG8gaW1wbGVtZW50IFN0YXRpYyBDYWxsIGZvcgo+IFJJU0MtVi4KPiAK
PiBJbiBzdW1tYXJ5LCBTdGF0aWMgQ2FsbCBpcyBhIG1lY2hhbmlzbSB0aGF0IHdvcmtzIHNpbWls
YXJseSB0byBnbG9iYWwKPiBmdW5jdGlvbiBwb2ludGVycy4gQSBzaW1wbGUgdXNlIGNhc2UgaXMg
YXMgZm9sbG93czoKPiAKPiBpbnQgZnVuY19hKGludCBhcmcxLCBpbnQgYXJnMik7Cj4gLy8gZGVm
aW5lIGEgc3RhdGljIGNhbGwgbmFtZWQgbXlfbmFtZSBwb2ludGluZyB0byBmdW5jX2EKPiBERUZJ
TkVfU1RBVElDX0NBTEwobXlfbmFtZSwgZnVuY19hKTsgCj4gLy8gY2FsbCBmdW5jX2EgdGhyb3Vn
aCBzdGF0aWMgY2FsbCBteV9uYW1lCj4gc3RhdGljX2NhbGwobXlfbmFtZSkoYXJnMSwgYXJnMik7
Cj4gLy8gbWFrZSBteV9uYW1lIHBvaW50IHRvIGEgbmV3IGZ1bmN0aW9uIGZ1bmNfYgo+IHN0YXRp
Y19jYWxsX3VwZGF0ZShteV9uYW1lLCAmZnVuY19iKTsKPiAvLyBjYWxsIGZ1bmNfYgo+IHN0YXRp
Y19jYWxsKG15X25hbWUpKGFyZzEsIGFyZzIpOwo+IAo+IFRoZSBhZHZhbnRhZ2Ugb2YgYSBzdGF0
aWMgY2FsbCBvdmVyIGEgZnVuY3Rpb24gcG9pbnRlciBpcyB0aGF0IHN0YXRpYwo+IGNhbGxzIGFy
ZSBkaXJlY3QgY2FsbHMgd2hlcmVhcyBmdW5jdGlvbiBwb2ludGVycyBhcmUgaW5kaXJlY3QgY2Fs
bHMuCj4gT24geDg2LCBkaXJlY3QgY2FsbHMgYXJlIG11Y2ggZmFzdGVyIHRoYW4gaW5kaXJlY3Qg
Y2FsbHMgd2hlbiB5b3UKPiBjb25zaWRlciBzcGVjdWxhdGlvbiBtaXRpZ2F0aW9uIG9wdGlvbnMg
c3VjaCBhcyByZXRwb2xpbmUuIFNvIFN0YXRpYwo+IENhbGwgaXMgbWVhbmluZ2Z1bCBhbmQgaGFz
IGFscmVhZHkgYmVlbiBpbXBsZW1lbnRlZCBmb3IgeDg2LgoKU2luY2UgcmV0cG9saW5lcyBhcmUg
bm90IHVzZWQgb24gcmlzY3YsIEkgYW0gbm90IHN1cmUgaWYgdGhlcmUgaXMgYQptZWFuaW5nZnVs
IGJlbmVmaXQgZm9yIHN0YXRpYyBjYWxscy4gV2l0aG91dCByZXRwb2xpbmVzLCBicmFuY2gKcHJl
ZGljdG9ycyBzaG91bGQgYmUgcHJldHR5IGdvb2QgYXQganVtcGluZyB0byB0aGUgY29ycmVjdCBw
bGFjZS4KVGhlIGJlbmVmaXQgb2YgdGhlIHN0YXRpYyBjYWxsIG1pbnVzIHRoZSBvdmVyaGVhZCBv
ZiBzZXR0aW5nIHVwIHRoZQpzdGF0aWMgY2FsbCBuZWVkcyB0byBiZSBncmVhdGVyIHRoYW4gdGhl
IHRpbWUgc3BlbnQgZXZhbHVhdGluZyB0aGUKaW5kaXJlY3QgY2FsbHMuCgo+IAo+IEZvciBSSVND
LVYsIGEgZ2VuZXJhbCBpbmRpcmVjdCBjYWxsIGlzIGxpa2UgdGhpczoKPiAKPiBhdWlwYyBhNSwg
aW1tCj4gIyBsb2FkIHRoZSB2YWx1ZSBvZiBmdW5jdGlvbiBwb2ludGVyIGludG8gYTUKPiBsZCAg
ICBhNSwgaW1tKGE1KQo+ICMgd2l0aCB0aGUgYWRkcmVzcyBvZiB0YXJnZXQgZnVuY3Rpb24gaW4g
YTUsIHdlIGNhbiBub3cganVtcCB0byBpdAo+IGphbHIgIHJhLCAwKGE1KQo+IAo+IFRoZXJlIGFy
ZSB0d28gdmVyc2lvbnMgb2YgU3RhdGljIENhbGw6IG91dC1vZi1saW5lIGFuZCBpbmxpbmUuIElu
bGluZQo+IHZlcnNpb24gYnVpbGRzIG9uIHRvcCBvZiBvdXQtb2YtbGluZSB2ZXJzaW9uLCBhbmQg
aXMgZmFzdGVyIHRoYW4KPiBvdXQtb2YtbGluZSB2ZXJzaW9uLgo+IAo+IEZvciBhbiBvdXQtb2Yt
bGluZSBzdGF0aWMgY2FsbCwgdGhlIHN0YXRpYyBjYWxsIGZpcnN0IGp1bXBzIHRvIGEKPiB0cmFt
cG9saW5lLCB0aGVuIGp1bXBzIHRvIHRoZSBhY3R1YWwgZnVuY3Rpb24uIFRoZSBiZXN0IGFwcHJv
YWNoIEkgCj4gY2FuIGNvbWUgdXAgd2l0aCBpcyBhIHRocmVlLWluc3RydWN0aW9uIHRyYW1wb2xp
bmUuIFRocmVlIGluc3RydWN0aW9ucwo+IHBsdXMgdHdvIGluc3RydWN0aW9ucyAoQVVJUEMgSkFM
UikgdG8ganVtcCB0byB0aGUgdHJhbXBvbGluZSBlcXVhbHMKPiBmaXZlLgo+IAo+IEZpdmUgaW5z
dHJ1Y3Rpb25zIHdpdGggbm8gbWVtIG9wIHZlcnN1cyB0aHJlZSBpbnN0cnVjdGlvbnMgd2l0aCBv
bmUKPiBtZW0gb3AuIE5vdCBzdXJlIHdoaWNoIG9uZSBpcyBmYXN0ZXIuCj4gCj4gRm9yIGFuIGlu
bGluZSBzdGF0aWMgY2FsbCwgdGhlIHN0YXRpYyBjYWxsIGRpcmVjdGx5IGp1bXBzIHRvIHRoZQo+
IHRhcmdldCBmdW5jdGlvbi4gSSBkaXNjdXNzZWQgd2l0aCBQZXRlciBaaWpsc3RyYSwgb25lIG9m
IHRoZQo+IG1haW50YWluZXJzIG9mIFN0YXRpYyBDYWxsLiBJIGd1ZXNzIHdlIGNhbiB1c2UgdGhl
IHR3byByZWd1bGFyCj4gaW5zdHJ1Y3Rpb25zIEFVSVBDIGFuZCBKQUxSIHRvIGp1bXAgdG8gYSB0
YXJnZXQgZnVuY3Rpb24uCgpUaGUgSkFMIGluc3RydWN0aW9uIGhhcyBhIDIwLWJpdCBpbW1lZGlh
dGUgc28gaWYgdGhlIGZ1bmN0aW9uIGlzIHdpdGhpbgpQQystMjBiaXRzIHRoYW4gdGhlIEFVSVBD
K0pBTFIgY291bGQganVzdCBiZSBhIEpBTCAoYW5kIGZhbGwgYmFjayB0bwpBVUlQQytKQUxSIGlm
IHRvbyBmYXIpLgoKPiAKPiBUd28gaW5zdHJ1Y3Rpb25zIHdpdGggbm8gbWVtIG9wIHZlcnN1cyB0
aHJlZSBpbnN0cnVjdGlvbnMgd2l0aCBvbmUgbWVtCj4gb3AuIEFuIGlubGluZSBzdGF0aWMgY2Fs
bCBzaG91bGQgYmUgZmFzdGVyIHRoYW4gYW4gaW5kaXJlY3QgY2FsbC4KPiAKPiBEb2VzIHRoZSBh
Zm9yZW1lbnRpb25lZCBiZW5lZml0cyBtZXJpdCBhIFJJU0MtViBzdGF0aWMgY2FsbCBpbXBsZW1l
bnRhdGlvbiAKPiAoZXNwZWNpYWxseSBpbmxpbmUpPyBPciBhcmUgdGhlIGJlbmVmaXRzIHNvIG5l
Z2xpZ2libGUgdGhhdCBpdOKAmXMgc2ltcGx5IG5vdCAKPiB3b3J0aCB0aGUgZWZmb3J0IHRvIGRv
IGEgUklTQy1WIGltcGxlbWVudGF0aW9uPwo+IAoKSSBhbSBsZXNzIGNvbnZpbmNlZCBhYm91dCB0
aGUgb3V0LW9mLWxpbmUgY2FzZSwgYnV0IEkgdGhpbmsgdGhlIGlubGluZQpjYXNlIChlc3BlY2lh
bGx5IHdoZW4gYSBKQUwgY2FuIGJlIHVzZWQpIGlzIHByb21pc2luZy4KCi0gQ2hhcmxpZQoKPkl0
IHNob3VsZCBiZSBub3RlZCB0aGF0IHVwZGF0aW5nIGEgc3RhdGljIGNhbGwgaXMgbXVjaCBtb3Jl
IHRyb3VibGVzb21lCj4gdGhhbiB1cGRhdGluZyBhIGZ1bmN0aW9uIHBvaW50ZXIuIFNvIHN0YXRp
YyBjYWxscyBhcmUgc3VpdGFibGUgdG8KPiByZXBsYWNlIGZ1bmN0aW9uIHBvaW50ZXJzIHRoYXQg
ZG9u4oCZdCBjaGFuZ2Ugb2Z0ZW4uIE9uZSBzY2VuYXJpbyBpcwo+IHRyYWNlcG9pbnRzLiBXaXRo
IGlubGluZSBzdGF0aWMgY2FsbHMsIFJJU0MtViB0cmFjZXBvaW50IHBlcmZvcm1hbmNlCj4gc2hv
dWxkIGltcHJvdmUuIE5vdCBzdXJlIGJ5IGhvdyBtdWNoLCB0aG91Z2guCj4gIAo+IEJlc3QsCj4g
SnVoYW4KPiAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
