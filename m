Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD3AC004D4
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jan 2023 10:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YogIGPBMFkwACWYBmniPUjY3XceGg1BlgsKFVzYVgbo=; b=V7zs/D9R02neoB
	HX58k+fbibkfFYbqy2wfsmitAh2Mq4AhSydkfBROT/a3CAzc02L8YV6smf9zyPfeK8knbKS+7PtUU
	JFQFHoPsjwNBRfLwZzPyyLUIiqBvZd8u2E3XTsgsXi6hQqwZozyH7jqNNIUihArKHjRHxoa6svruw
	yQ6WsQd76GojyHLRuXdnyKM3AqDS9gWmWAisQpL3wb3/L4C5XSq2+C2TzRBLbC4VKVXceE8O8FmEC
	UlrNoqtfQHbsrazRTtuYV6YbvuNk9kwAXqglEy+r5MhY66n3BMaYQcXACIxGOp1meElcMU8HmeZzA
	kkO6sAsZGGRnJ2OWVrnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI60B-000Pqt-MK; Wed, 18 Jan 2023 10:49:07 +0000
Received: from mail-lf1-f47.google.com ([209.85.167.47])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI608-000PqW-EF
	for linux-riscv@lists.infradead.org; Wed, 18 Jan 2023 10:49:06 +0000
Received: by mail-lf1-f47.google.com with SMTP id f34so51101151lfv.10
        for <linux-riscv@lists.infradead.org>; Wed, 18 Jan 2023 02:49:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TNJOWHq+We13SH7/7e+I5fS8M1OBmfqEsNTjgJP5AnE=;
        b=XoxVE8dSt5UyegzBY3UxE3KilHizQIae+qRYNphV7Cyozznz7/DILTJ5Yay9Y1hZDv
         12KdriOudy1lw/ULhxWYKdn5LRgzI6BTc2rcycH7vnliwueXMxnTcAbBQ2saEHs7f6ne
         HWUY/mgT8EqJYUQCcSn76frST1x1FeP7RuwnDsm2HYWPfGtIQKxlJBb9fTcqHfYmQXcC
         DBvjtLII9DoYm8mGKDB4A3tI7d3943QKKGDQ4ZRnqSBBWtIcc6VeaEIsblAG/G3fJ+kv
         v3pujy5NiqV2D/hnFBhb0NGB9Yhxgo1sBq6VPwM99fqDYj34C4Ze8sKJszgAvwE0lcRn
         fBcg==
X-Gm-Message-State: AFqh2kqRVjnQlyaJThegDrovhg3VQyX8KkA6IwD3DaUuPa2aPQvpcSyC
	5pzCo+dCED9GSs3BaR/QRH+dehm9D5lpY7CF
X-Google-Smtp-Source: AMrXdXsPwz+lUGPjXN3sIKHe4VsWhCNaB4pg/W53uXEDaYczUjzbd5kaaoeh6mEggp4Jw7qEzFU6vQ==
X-Received: by 2002:ac2:494f:0:b0:4ca:eebd:3bd2 with SMTP id o15-20020ac2494f000000b004caeebd3bd2mr4933427lfi.45.1674038940397;
        Wed, 18 Jan 2023 02:49:00 -0800 (PST)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id v16-20020a056512049000b004b564e1a4e0sm982909lfq.76.2023.01.18.02.48.57
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 02:48:59 -0800 (PST)
Received: by mail-lf1-f43.google.com with SMTP id br9so15838999lfb.4
        for <linux-riscv@lists.infradead.org>; Wed, 18 Jan 2023 02:48:57 -0800 (PST)
X-Received: by 2002:a05:6512:1153:b0:4b6:eaec:f7a6 with SMTP id
 m19-20020a056512115300b004b6eaecf7a6mr364384lfg.586.1674038937447; Wed, 18
 Jan 2023 02:48:57 -0800 (PST)
MIME-Version: 1.0
References: <20230116073834.333129-1-bjorn@kernel.org> <20230116073834.333129-2-bjorn@kernel.org>
In-Reply-To: <20230116073834.333129-2-bjorn@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Jan 2023 11:48:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXi7yEiS73YhQAQKqj+3rTCNmuRrdnNKS4prvG96Xgqog@mail.gmail.com>
Message-ID: <CAMuHMdXi7yEiS73YhQAQKqj+3rTCNmuRrdnNKS4prvG96Xgqog@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] riscv: Add instruction dump to RISC-V splats
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Andreas Schwab <schwab@linux-m68k.org>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_024904_519542_CCEB7D8B 
X-CRM114-Status: GOOD (  22.43  )
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

SGkgQmrDtnJuLAoKT24gTW9uLCBKYW4gMTYsIDIwMjMgYXQgODo0MSBBTSBCasO2cm4gVMO2cGVs
IDxiam9ybkBrZXJuZWwub3JnPiB3cm90ZToKPiBGcm9tOiBCasO2cm4gVMO2cGVsIDxiam9ybkBy
aXZvc2luYy5jb20+Cj4KPiBBZGQgaW5zdHJ1Y3Rpb24gZHVtcCAoQ29kZTopIG91dHB1dCB0byBS
SVNDLVYgc3BsYXRzLiBEdW1wIDE2Ygo+IHBhcmNlbHMuCj4KPiBBbiBleGFtcGxlOgo+ICAgVW5h
YmxlIHRvIGhhbmRsZSBrZXJuZWwgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIGF0IHZpcnR1YWwg
YWRkcmVzcyAwMDAwMDAwMDAwMDAwMDAwCj4gICBPb3BzIFsjMV0KPiAgIE1vZHVsZXMgbGlua2Vk
IGluOgo+ICAgQ1BVOiAwIFBJRDogMSBDb21tOiBzd2FwcGVyLzAgTm90IHRhaW50ZWQgNi4yLjAt
cmMzLTAwMzAyLWc4NDBmZjQ0YzU3MWQtZGlydHkgIzI3Cj4gICBIYXJkd2FyZSBuYW1lOiByaXNj
di12aXJ0aW8scWVtdSAoRFQpCj4gICBlcGMgOiBrZXJuZWxfaW5pdCsweGM4LzB4MTBlCj4gICAg
cmEgOiBrZXJuZWxfaW5pdCsweDcwLzB4MTBlCj4gICBlcGMgOiBmZmZmZmZmZjgwYmQ5YTQwIHJh
IDogZmZmZmZmZmY4MGJkOTllOCBzcCA6IGZmMjAwMDAwMDA2MGJlYzAKPiAgICBncCA6IGZmZmZm
ZmZmODE3MzBiMjggdHAgOiBmZjYwMDAwMDdmZjAwMDAwIHQwIDogNzk3NDY5NzI3NTYzNjU3Mwo+
ICAgIHQxIDogMDAwMDAwMDAwMDAwMDAwMCB0MiA6IDMwMzAzMDMyNzAzOTNkNmUgczAgOiBmZjIw
MDAwMDAwNjBiZWUwCj4gICAgczEgOiBmZmZmZmZmZjgxNzMyMDI4IGEwIDogMDAwMDAwMDAwMDAw
MDAwMCBhMSA6IGZmNjAwMDAwODBkZDE3ODAKPiAgICBhMiA6IDAwMDAwMDAwMDAwMDAwMDIgYTMg
OiBmZmZmZmZmZjgxNzZhNDcwIGE0IDogMDAwMDAwMDAwMDAwMDAwMAo+ICAgIGE1IDogMDAwMDAw
MDAwMDAwMDAwYSBhNiA6IDAwMDAwMDAwMDAwMDAwODEgYTcgOiBmZjYwMDAwMDgwZGQxNzgwCj4g
ICAgczIgOiAwMDAwMDAwMDAwMDAwMDAwIHMzIDogMDAwMDAwMDAwMDAwMDAwMCBzNCA6IDAwMDAw
MDAwMDAwMDAwMDAKPiAgICBzNSA6IDAwMDAwMDAwMDAwMDAwMDAgczYgOiAwMDAwMDAwMDAwMDAw
MDAwIHM3IDogMDAwMDAwMDAwMDAwMDAwMAo+ICAgIHM4IDogMDAwMDAwMDAwMDAwMDAwMCBzOSA6
IDAwMDAwMDAwMDAwMDAwMDAgczEwOiAwMDAwMDAwMDAwMDAwMDAwCj4gICAgczExOiAwMDAwMDAw
MDAwMDAwMDAwIHQzIDogZmZmZmZmZmY4MTE4NjAxOCB0NCA6IDAwMDAwMDAwMDAwMDAwMjIKPiAg
ICB0NSA6IDAwMDAwMDAwMDAwMDAwM2QgdDYgOiAwMDAwMDAwMDAwMDAwMDAwCj4gICBzdGF0dXM6
IDAwMDAwMDAyMDAwMDAxMjAgYmFkYWRkcjogMDAwMDAwMDAwMDAwMDAwMCBjYXVzZTogMDAwMDAw
MDAwMDAwMDAwZgo+ICAgWzxmZmZmZmZmZjgwMDAzNTI4Pl0gcmV0X2Zyb21fZXhjZXB0aW9uKzB4
MC8weDE2Cj4gICBDb2RlOiA4NjJhIGQxNzkgNjA4YyBhNTE3IDAwNjkgMDUxMyAyYmU1IGQwZWYg
ZGIyZSA0N2E5IChjMTFjKSBhNTE3Cj4gICAtLS1bIGVuZCB0cmFjZSAwMDAwMDAwMDAwMDAwMDAw
IF0tLS0KPiAgIEtlcm5lbCBwYW5pYyAtIG5vdCBzeW5jaW5nOiBBdHRlbXB0ZWQgdG8ga2lsbCBp
bml0ISBleGl0Y29kZT0weDAwMDAwMDBiCj4gICBTTVA6IHN0b3BwaW5nIHNlY29uZGFyeSBDUFVz
Cj4gICAtLS1bIGVuZCBLZXJuZWwgcGFuaWMgLSBub3Qgc3luY2luZzogQXR0ZW1wdGVkIHRvIGtp
bGwgaW5pdCEgZXhpdGNvZGU9MHgwMDAwMDAwYiBdLS0tCj4KPiBTaWduZWQtb2ZmLWJ5OiBCasO2
cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+CgpUaGFua3MgZm9yIHlvdXIgcGF0Y2ghCgo+
IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5l
bC90cmFwcy5jCj4gQEAgLTI5LDYgKzI5LDI3IEBAIGludCBzaG93X3VuaGFuZGxlZF9zaWduYWxz
ID0gMTsKPgo+ICBzdGF0aWMgREVGSU5FX1NQSU5MT0NLKGRpZV9sb2NrKTsKPgo+ICtzdGF0aWMg
dm9pZCBkdW1wX2tlcm5lbF9pbnN0cihjb25zdCBjaGFyICpsb2dsdmwsIHN0cnVjdCBwdF9yZWdz
ICpyZWdzKQo+ICt7Cj4gKyAgICAgICBjaGFyIHN0cltzaXplb2YoIjAwMDAgIikgKiAxMiArIDIg
KyAxXSwgKnAgPSBzdHI7Cj4gKyAgICAgICB1bnNpZ25lZCBsb25nIGFkZHIgPSByZWdzLT5lcGM7
CgpHaXZlbiB5b3UgbmV2ZXIgdXNlIHRoaXMgYXMgYW4gdW5zaWduZWQgbG9uZywgd2hhdCBhYm91
dAoKICAgIGNvbnN0IHUxNiAqaW5zbnMgPSAodTE2ICopaW5zdHJ1Y3Rpb25fcG9pbnRlcihyZWdz
KTsKCnNvIHlvdSBubyBsb25nZXIgbmVlZCBjYXN0cyBiZWxvdz8KCj4gKyAgICAgICBsb25nIGJh
ZDsKPiArICAgICAgIHUxNiB2YWw7Cj4gKyAgICAgICBpbnQgaTsKPiArCj4gKyAgICAgICBmb3Ig
KGkgPSAtMTA7IGkgPCAyOyBpKyspIHsKPiArICAgICAgICAgICAgICAgYmFkID0gZ2V0X2tlcm5l
bF9ub2ZhdWx0KHZhbCwgJigodTE2ICopYWRkcilbaV0pOwo+ICsgICAgICAgICAgICAgICBpZiAo
IWJhZCkgewo+ICsgICAgICAgICAgICAgICAgICAgICAgIHAgKz0gc3ByaW50ZihwLCBpID09IDAg
PyAiKCUwNGh4KSAiIDogIiUwNGh4ICIsIHZhbCk7Cj4gKyAgICAgICAgICAgICAgIH0gZWxzZSB7
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgcHJpbnRrKCIlc0NvZGU6IFVuYWJsZSB0byBhY2Nl
c3MgaW5zdHJ1Y3Rpb24gYXQgMHglbHguXG4iLAoKJXB4LCBzbyB5b3UgY2FuIGRyb3AgdGhlIGNh
c3QgdG8gbG9uZyBiZWxvdy4KCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxvZ2x2
bCwgKGxvbmcpJigodTE2ICopYWRkcilbaV0pOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJl
dHVybjsKPiArICAgICAgICAgICAgICAgfQo+ICsgICAgICAgfQo+ICsgICAgICAgcHJpbnRrKCIl
c0NvZGU6ICVzXG4iLCBsb2dsdmwsIHN0cik7Cj4gK30KPiArCj4gIHZvaWQgZGllKHN0cnVjdCBw
dF9yZWdzICpyZWdzLCBjb25zdCBjaGFyICpzdHIpCj4gIHsKPiAgICAgICAgIHN0YXRpYyBpbnQg
ZGllX2NvdW50ZXI7CgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAg
IEdlZXJ0CgotLQpHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJl
eW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRp
b25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0Cndo
ZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Ig
c29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBM
aW51cyBUb3J2YWxkcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
