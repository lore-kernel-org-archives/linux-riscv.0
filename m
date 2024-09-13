Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27DA1FC6172
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Sep 2024 23:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0xIlripCIMA1LYtv+pzrT682RMjSRO4s9Du0qYduWqs=; b=juPlJPCadsCL2O
	hCzHc6yrawwJqNl4p/uleqV/32ni4Bl305q8GbgCajJILhwTDaDSWD3olpihgtMmiLiwCUMYJc10j
	K/QezeNzwBCJanJGqLrsVlXTPKNDzRWIuTk3agqb3ocT5R9lRcj8BRkOfu9oZ3BCDJyOSgT1ca3cf
	8JxM1MDXEqmepiNuTzKfk+2yZZAzxUi/4BJLyLcOG5pcXmqjo7FL3WF+BGfrYhvC3wVj482HH1t8l
	73uAnh/eFtxoo5FdVgAb1uFdJ9LtnvZYRjCcNRL8WM/V9S01pAMTRTBiZP+kUXjV/JkTRt09Dz5VH
	nmCydKjIIb6JKf0m2mTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spG4Z-0000000HNiY-0fRq;
	Fri, 13 Sep 2024 23:51:31 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spG3m-0000000HNfX-0UoR
	for linux-riscv@lists.infradead.org;
	Fri, 13 Sep 2024 23:50:43 +0000
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-82cdada0f21so55273739f.3
        for <linux-riscv@lists.infradead.org>; Fri, 13 Sep 2024 16:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1726271440; x=1726876240; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ys9D+RLXwhTpgH1pWEB+6o3E3W0DAjyQ5WRdSmgexZs=;
        b=dZG6DCTnDLDijwhjBRFFOSnbjPv8BCGUhrPKQXVG+OihPaqP3EM3IPOymA0lIZ2m7g
         Pc6/aW+i48icZgfgeBZdWyQPo1Zw1b6NhzKdB0mboP2EBFWOmBshO/+IdVOy4r/lmGqj
         kfTAsvWsKaA2FwfdVlJs9aY2/s7HLaY/gW17GeL7VT9fLY2AHRxASthw9E1l7aGSOav9
         sNDI9YHVm3GjD67wVBlcitD12h1CqiKastF2POZjMDmeBAIvOeWlF6hVYF9/lwQhbqcm
         g5vSzJ34D58ZYA05GUdTg+dua+i4bnk2Xmi8jDM6jNv+dnmFwMf4z4LCuzfLe2W5DUq/
         86yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726271440; x=1726876240;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ys9D+RLXwhTpgH1pWEB+6o3E3W0DAjyQ5WRdSmgexZs=;
        b=I/hKQzZIwL8qGNmS3X6Ybrv6Lyk0SlVQRdJutLUtKFSmd9BJQTriQOxNWQZU3+vh+B
         AZscQpus6r+gH7HFFJT/AysOZAHPsXk4PbyGjXXNjTkc4Ia5mI3YYcPvkgtE2i4LFM60
         cwOghhoWXvKY/es9oj3bHXPP7hqohNMjDC3ObFhluz8wNuE76OkrDHO3v+rD+5TVkz2K
         2Q0GvPrJGsSq+NBZn5m30QdIaUI0ojEA0v0u8Yp4omCGN9ni0pNOGBK58AxO7uM1Im1Q
         F/8xvcQYlI5DnoDwykbsvV0S4nF9yRhN0aKBIC51d/Z1RIGfpQ1aMUrqtL0Cw0s+Cps4
         WeSg==
X-Gm-Message-State: AOJu0Yyw45naebXtUORAWjca5s857YhlJo6D8vjptM82aU0XL2KKfVmX
	ns3up2LrYd4BukO8wIrTkgvBtckCQDatmTXlCUAaeNYp/d5/cyNhr/pnRE0ItLw=
X-Google-Smtp-Source: AGHT+IE308z1W4TCDHUUF03ezwRzE9xkKqtY4m1O5nmNwXAeBrU0VE783Zv01Z5VI0le8m/Y+OuFlw==
X-Received: by 2002:a05:6e02:219b:b0:3a0:4bd1:c1d6 with SMTP id e9e14a558f8ab-3a08b710dccmr38499675ab.9.1726271439932;
        Fri, 13 Sep 2024 16:50:39 -0700 (PDT)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4d37ed13d31sm118864173.98.2024.09.13.16.50.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Sep 2024 16:50:39 -0700 (PDT)
Message-ID: <54ce36a6-8be1-4ce8-b246-2255df333d00@sifive.com>
Date: Fri, 13 Sep 2024 18:50:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Is RISC-V Static Call worth implementing ?
To: Conor Dooley <conor@kernel.org>, Juhan Jin <juhan.jin@foxmail.com>
Cc: linux-riscv@lists.infradead.org, peterz@infradead.org,
 jpoimboe@kernel.org, juhanj2@illinois.edu, alexghiti@rivosinc.com,
 palmer@dabbelt.com, ajones@ventanamicro.com
References: <tencent_24E1437DFC1D2BB7528A2A28D503C8033107@qq.com>
 <20240913-spearfish-feeble-4c0032f37484@spud>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20240913-spearfish-feeble-4c0032f37484@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_165042_189897_09C4D7EA 
X-CRM114-Status: UNSURE (   9.85  )
X-CRM114-Notice: Please train this message.
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

T24gMjAyNC0wOS0xMyAzOjU1IFBNLCBDb25vciBEb29sZXkgd3JvdGU6Cj4gT24gRnJpLCBTZXAg
MTMsIDIwMjQgYXQgMDM6MDU6MzNBTSAtMDUwMCwgSnVoYW4gSmluIHdyb3RlOgo+PiBIaSBmb2xr
cywKPj4KPj4gSeKAmW0gaW50ZXJlc3RlZCBpbiBpbXBsZW1lbnRpbmcgU3RhdGljIENhbGwgZm9y
IFJJU0MtViwgYW5kIEkgd2FudCB0bwo+PiBrbm93IHdoZXRoZXIgaXQgaXMgd29ydGggdGhlIGVm
Zm9ydHMgdG8gaW1wbGVtZW50IFN0YXRpYyBDYWxsIGZvcgo+PiBSSVNDLVYuCj4+Cj4+IERvZXMg
dGhlIGFmb3JlbWVudGlvbmVkIGJlbmVmaXRzIG1lcml0IGEgUklTQy1WIHN0YXRpYyBjYWxsIGlt
cGxlbWVudGF0aW9uIAo+PiAoZXNwZWNpYWxseSBpbmxpbmUpPyBPciBhcmUgdGhlIGJlbmVmaXRz
IHNvIG5lZ2xpZ2libGUgdGhhdCBpdOKAmXMgc2ltcGx5IG5vdCAKPj4gd29ydGggdGhlIGVmZm9y
dCB0byBkbyBhIFJJU0MtViBpbXBsZW1lbnRhdGlvbj8KPiAKPiBQcmV0dHkgc3VyZSB3ZSd2ZSB0
YWxrZWQgYWJvdXQgd2FudGluZyBpdCBiZWZvcmUgLSBTYW11ZWwsIEFsZXgsIERyZXcKPiBKb25l
cyBvciBQYWxtZXIgbWlnaHQgcmVtZW1iZXIgYmVzdCB3aGF0IGV4YWN0bHkgd2Ugd2FudGVkIGl0
IGZvcgo+IGhvd2V2ZXIsIGFzIEkgZG8gbm90LgoKSWYgSSByZW1lbWJlciBjb3JyZWN0bHksIHdl
IGhhZCBkaXNjdXNzZWQgaXQgaW4gdGhlIGNvbnRleHQgb2Ygbm9uLWNvaGVyZW50IERNQQpvcGVy
YXRpb25zLCBidXQgd2UgZGVjaWRlZCB0aGF0IHRoZSBiZW5lZml0IHdhcyBuZWdsaWdpYmxlIGZv
ciB0aGF0IHVzZSBjYXNlLgoKVGhlcmUgYXJlIG90aGVyIHBsYWNlcyB0aGF0IGNvdWxkIGxpa2Vs
eSBiZW5lZml0IGZyb20gc3RhdGljIGNhbGxzLCBzdWNoIGFzClN2MzkvU3Y0OC9TdjU3IGRpZmZl
cmVuY2VzLCBzb21lIHVzZXJzIG9mIHJpc2N2X2hhc19leHRlbnNpb25fKigpLCBvciBtYXliZSBz
b21lCmhvdCBpbmRpcmVjdCBTQkkgZnVuY3Rpb25zIGxpa2Ugc2JpX3NldF90aW1lcigpLiBCdXQg
aXQgZGVwZW5kcyBvbiB0aGUgb3ZlcmhlYWQuCgpSZWdhcmRzLApTYW11ZWwKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
