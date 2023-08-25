Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65499C3DA66
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Aug 2023 18:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gAEEhSCQZrUN2abKc4dx8Xih8G2T744xsj1VmNXSYbM=; b=dLUBUUBciN7bY9
	UNSGGvc+qkHCnmycQeWvxRtky/t7SukiR+Q7vZkX7qEjoC2ugyJ0Yv2W4cQdnoncKu98LC0Cxvcgl
	+TPKCVJNKYDvzRatuVwbuDj5I/8hywWNjOt4W/54bR/dQAJ4T096vLu4VKdj5pVLg/Uo6IRWee9I8
	8CIBeR0TURRxmKzMtGKDV84dRmNBghkmB6J2liOa/qC1+dTl21LIKnnFT/NhaXTg1CWgZPqFQkmXN
	6jyPB3jZJosRPAL78Hdi3IApgGiRSUZAuXMPSy1v213j6LsHly5WP0WQVaoo91eYgYAp2SW6F5bVD
	QZ03TcKE++9juGhrWLWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZbwU-005tkM-28;
	Fri, 25 Aug 2023 18:53:58 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZbwR-005tjy-0a
	for linux-riscv@lists.infradead.org;
	Fri, 25 Aug 2023 18:53:56 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2bcb89b4767so18650031fa.3
        for <linux-riscv@lists.infradead.org>; Fri, 25 Aug 2023 11:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692989632; x=1693594432;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BTNsb8ZD5nYCip/qmAJsV2FZCF/nHIHZIkkwz3tv4Dw=;
        b=pb+g/Y6GZHZS+GGwxtAU4pQWV56mJqsoMgXzerBWSod+yCPbJAaYRjY9qvA3arNZKE
         fwl+kXu9Cd+Kpi8zHes91txNh+5av0nJ41Lo53A4bm0DJ7Qd6zCdgshWolKgkUvjuJd8
         P0SEI/r5nMlGpTOWV8Q79j+d9ZW08Gt77KjVv+guVC80Vjml1euwe5SpdkPGexgzFiBU
         2gEii/W6pTUtcoxfMBMAvVTI6B3BhjiJMzpgLZCL7OSRPZK7Ml6n6OeeVVRhuOS7tIAO
         /VBZQ22wHOx0nRPbo+FXXqGQ1yB5MS3fGzAa7oiwubLFjOpOfvhUOj5fGUDvoaP/Omhu
         1nJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692989632; x=1693594432;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BTNsb8ZD5nYCip/qmAJsV2FZCF/nHIHZIkkwz3tv4Dw=;
        b=SUNwibgoE5/wKSNP42OP38sW3kQHxdISpZX5fFM6s/2Wsa/fdBb11DccqCRt+1Z0fo
         nU9xydTuJA00S/97pys2R0/R3Glz0wUtR1mabPGXx4LSrvLzXzv6rgA18n3Ijs7C0JV2
         sgO2ncHhnG8UsvpFLIUtuYdVk9XHKsFTw+AoL8+ge7V9u+8X9o1E3SHb4hTtrb5poU0K
         73gKHlRfTXOyQNFx3yvw++kG+gtbDFkkwlP2YB2d8Zrhgi+8I9PivkmJ3C0ajgePUAX1
         KTJm2f3DT6//N0KjaUC7UIgjSkJIaie2x/FnSw8cBa3OahFm4H86NQt9EwkGf3Mf6VDT
         UjwQ==
X-Gm-Message-State: AOJu0YwGpEW7TA8FfqjXmPLetQB0JWsibu8G9z9bFLnL3l5+jKm0nuqE
	r8I989ZVMWBpwcYM104GNJkE6vR3aDfjrIGCO9U=
X-Google-Smtp-Source: AGHT+IH1lj6IJ2Oqh5+YmwsxP5iRpd/0RsQY38qRwZGE8zdW9QCWIVhcsBNg/WB6zxnQUYsORFjwY63xRDe8TzYIxjM=
X-Received: by 2002:a2e:920b:0:b0:2bb:94e4:490 with SMTP id
 k11-20020a2e920b000000b002bb94e40490mr15845256ljg.23.1692989632311; Fri, 25
 Aug 2023 11:53:52 -0700 (PDT)
MIME-Version: 1.0
References: <87jztjmmy4.fsf@all.your.base.are.belong.to.us> <2f4f0dfc-ec06-8ac8-a56a-395cc2373def@linux.dev>
In-Reply-To: <2f4f0dfc-ec06-8ac8-a56a-395cc2373def@linux.dev>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 25 Aug 2023 11:53:41 -0700
Message-ID: <CAADnVQ+sthRd1CHtCNo=AKN7mXZEMkA5fS6zh-Ncbh8uC3FERQ@mail.gmail.com>
Subject: Re: WARNING: CPU: 3 PID: 261 at kernel/bpf/memalloc.c:342
To: Yonghong Song <yonghong.song@linux.dev>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Dave Marchevsky <davemarchevsky@meta.com>
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	bpf <bpf@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_115355_244746_49FF3980 
X-CRM114-Status: GOOD (  22.45  )
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

T24gRnJpLCBBdWcgMjUsIDIwMjMgYXQgODoyOOKAr0FNIFlvbmdob25nIFNvbmcgPHlvbmdob25n
LnNvbmdAbGludXguZGV2PiB3cm90ZToKPgo+Cj4KPiBPbiA4LzI1LzIzIDM6MzIgQU0sIEJqw7Zy
biBUw7ZwZWwgd3JvdGU6Cj4gPiBJJ20gY2hhc2luZyBhIHdvcmtxdWV1ZSBoYW5nIG9uIFJJU0Mt
Vi9xZW11IChUQ0cpLCB1c2luZyB0aGUgYnBmCj4gPiBzZWxmdGVzdHMgb24gYnBmLW5leHQgOWUz
YjQ3YWJlYjhmLgo+ID4KPiA+IEknbSBhYmxlIHRvIHJlcHJvZHVjZSB0aGUgaGFuZyBieSBtdWx0
aXBsZSBydW5zIG9mOgo+ID4gICB8IC4vdGVzdF9wcm9ncyAtYSBsaW5rX2FwaSAtYSBsaW5rZWRf
bGlzdAo+ID4gSSdtIGN1cnJlbnRseSBpbnZlc3RpZ2F0aW5nIHRoYXQuCj4gPgo+ID4gQnV0ISBT
b21ldGltZXMgKGV2ZXJ5IGJsdWUgbW9vbikgSSBnZXQgYSB3YXJuX29uX29uY2UgaGl0Ogo+ID4g
ICB8IC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUgXS0tLS0tLS0tLS0tLQo+ID4gICB8IFdBUk5JTkc6
IENQVTogMyBQSUQ6IDI2MSBhdCBrZXJuZWwvYnBmL21lbWFsbG9jLmM6MzQyIGJwZl9tZW1fcmVm
aWxsKzB4MWZjLzB4MjA2Cj4gPiAgIHwgTW9kdWxlcyBsaW5rZWQgaW46IGJwZl90ZXN0bW9kKE9F
KQo+ID4gICB8IENQVTogMyBQSUQ6IDI2MSBDb21tOiB0ZXN0X3Byb2dzLWNwdXYgVGFpbnRlZDog
RyAgICAgICAgICAgT0UgICAgTiA2LjUuMC1yYzUtMDE3NDMtZ2RjYjE1MmJiODMyOCAjMgo+ID4g
ICB8IEhhcmR3YXJlIG5hbWU6IHJpc2N2LXZpcnRpbyxxZW11IChEVCkKPiA+ICAgfCBlcGMgOiBi
cGZfbWVtX3JlZmlsbCsweDFmYy8weDIwNgo+ID4gICB8ICByYSA6IGlycV93b3JrX3NpbmdsZSsw
eDY4LzB4NzAKPiA+ICAgfCBlcGMgOiBmZmZmZmZmZjgwMWIxYmM0IHJhIDogZmZmZmZmZmY4MDE1
ZmU4NCBzcCA6IGZmMjAwMDAwMDAwMWJlMjAKPiA+ICAgfCAgZ3AgOiBmZmZmZmZmZjgyZDI2MTM4
IHRwIDogZmY2MDAwMDA4NDc3YTgwMCB0MCA6IDAwMDAwMDAwMDAwNDY2MDAKPiA+ICAgfCAgdDEg
OiBmZmZmZmZmZjgxMmI2ZGRjIHQyIDogMDAwMDAwMDAwMDAwMDAwMCBzMCA6IGZmMjAwMDAwMDAw
MWJlNzAKPiA+ICAgfCAgczEgOiBmZjVmZmZmZmZmZmU4OTk4IGEwIDogZmY1ZmZmZmZmZmZlODk5
OCBhMSA6IGZmNjAwMDAzZmVmNGIwMDAKPiA+ICAgfCAgYTIgOiAwMDAwMDAwMDAwMDAwMDNmIGEz
IDogZmZmZmZmZmY4MDAwODI1MCBhNCA6IDAwMDAwMDAwMDAwMDAwNjAKPiA+ICAgfCAgYTUgOiAw
MDAwMDAwMDAwMDAwMDgwIGE2IDogMDAwMDAwMDAwMDAwMDAwMCBhNyA6IDAwMDAwMDAwMDA3MzUw
NDkKPiA+ICAgfCAgczIgOiBmZjVmZmZmZmZmZmU4OTk4IHMzIDogMDAwMDAwMDAwMDAwMDAyMiBz
NCA6IDAwMDAwMDAwMDAwMDEwMDAKPiA+ICAgfCAgczUgOiAwMDAwMDAwMDAwMDAwMDA3IHM2IDog
ZmY1ZmZmZmZmZmZlODU3MCBzNyA6IGZmZmZmZmZmODJkNmJkMzAKPiA+ICAgfCAgczggOiAwMDAw
MDAwMDAwMDAwMDNmIHM5IDogZmZmZmZmZmY4MmQyYzVlOCBzMTA6IDAwMDAwMDAwMDAwMGZmZmYK
PiA+ICAgfCAgczExOiBmZmZmZmZmZjgyZDJjNWQ4IHQzIDogZmZmZmZmZmY4MWVhOGYyOCB0NCA6
IDAwMDAwMDAwMDAwMDAwMDAKPiA+ICAgfCAgdDUgOiBmZjYwMDAwMDhmZDI4Mjc4IHQ2IDogMDAw
MDAwMDAwMDA0MDAwMAo+ID4gICB8IHN0YXR1czogMDAwMDAwMDIwMDAwMDEwMCBiYWRhZGRyOiAw
MDAwMDAwMDAwMDAwMDAwIGNhdXNlOiAwMDAwMDAwMDAwMDAwMDAzCj4gPiAgIHwgWzxmZmZmZmZm
ZjgwMWIxYmM0Pl0gYnBmX21lbV9yZWZpbGwrMHgxZmMvMHgyMDYKPiA+ICAgfCBbPGZmZmZmZmZm
ODAxNWZlODQ+XSBpcnFfd29ya19zaW5nbGUrMHg2OC8weDcwCj4gPiAgIHwgWzxmZmZmZmZmZjgw
MTVmZWI0Pl0gaXJxX3dvcmtfcnVuX2xpc3QrMHgyOC8weDM2Cj4gPiAgIHwgWzxmZmZmZmZmZjgw
MTVmZWZhPl0gaXJxX3dvcmtfcnVuKzB4MzgvMHg2Ngo+ID4gICB8IFs8ZmZmZmZmZmY4MDAwODI4
YT5dIGhhbmRsZV9JUEkrMHgzYS8weGI0Cj4gPiAgIHwgWzxmZmZmZmZmZjgwMGE1YzNhPl0gaGFu
ZGxlX3BlcmNwdV9kZXZpZF9pcnErMHhhNC8weDFmOAo+ID4gICB8IFs8ZmZmZmZmZmY4MDA5ZmFm
YT5dIGdlbmVyaWNfaGFuZGxlX2RvbWFpbl9pcnErMHgyOC8weDM2Cj4gPiAgIHwgWzxmZmZmZmZm
ZjgwMGFlNTcwPl0gaXBpX211eF9wcm9jZXNzKzB4YWMvMHhmYQo+ID4gICB8IFs8ZmZmZmZmZmY4
MDAwYThlYT5dIHNiaV9pcGlfaGFuZGxlKzB4MmUvMHg4OAo+ID4gICB8IFs8ZmZmZmZmZmY4MDA5
ZmFmYT5dIGdlbmVyaWNfaGFuZGxlX2RvbWFpbl9pcnErMHgyOC8weDM2Cj4gPiAgIHwgWzxmZmZm
ZmZmZjgwN2VlNzBlPl0gcmlzY3ZfaW50Y19pcnErMHgzNi8weDRlCj4gPiAgIHwgWzxmZmZmZmZm
ZjgxMmI1ZDNhPl0gaGFuZGxlX3Jpc2N2X2lycSsweDU0LzB4ODYKPiA+ICAgfCBbPGZmZmZmZmZm
ODEyYjY5MDQ+XSBkb19pcnErMHg2Ni8weDk4Cj4gPiAgIHwgLS0tWyBlbmQgdHJhY2UgMDAwMDAw
MDAwMDAwMDAwMCBdLS0tCj4gPgo+ID4gQ29kZToKPiA+ICAgfCBzdGF0aWMgdm9pZCBmcmVlX2J1
bGsoc3RydWN0IGJwZl9tZW1fY2FjaGUgKmMpCj4gPiAgIHwgewo+ID4gICB8ICAgc3RydWN0IGJw
Zl9tZW1fY2FjaGUgKnRndCA9IGMtPnRndDsKPiA+ICAgfCAgIHN0cnVjdCBsbGlzdF9ub2RlICps
bG5vZGUsICp0Owo+ID4gICB8ICAgdW5zaWduZWQgbG9uZyBmbGFnczsKPiA+ICAgfCAgIGludCBj
bnQ7Cj4gPiAgIHwKPiA+ICAgfCAgIFdBUk5fT05fT05DRSh0Z3QtPnVuaXRfc2l6ZSAhPSBjLT51
bml0X3NpemUpOwo+ID4gICB8IC4uLgo+ID4KPiA+IEknbSBub3Qgd2VsbCB2ZXJzZWQgaW4gdGhl
IG1lbW9yeSBhbGxvY2F0b3I7IEJlZm9yZSBJIGRpdmUgaW50byBpdCAtLQo+ID4gaGFzIGFueW9u
ZSBlbHNlIGhpdCBpdD8gSWRlYXMgb24gd2h5IHRoZSB3YXJuX29uX29uY2UgaXMgaGl0Pwo+Cj4g
TWF5YmUgdGFrZSBhIGxvb2sgYXQgdGhlIHBhdGNoCj4gICAgODIyZmIyNmJkYjU1ICBicGY6IEFk
ZCBhIGhpbnQgdG8gYWxsb2NhdGVkIG9iamVjdHMuCj4KPiBJbiB0aGUgYWJvdmUgcGF0Y2gsIHdl
IGhhdmUKPgo+ICsgICAgICAgLyoKPiArICAgICAgICAqIFJlbWVtYmVyIGJwZl9tZW1fY2FjaGUg
dGhhdCBhbGxvY2F0ZWQgdGhpcyBvYmplY3QuCj4gKyAgICAgICAgKiBUaGUgaGludCBpcyBub3Qg
YWNjdXJhdGUuCj4gKyAgICAgICAgKi8KPiArICAgICAgIGMtPnRndCA9ICooc3RydWN0IGJwZl9t
ZW1fY2FjaGUgKiopbGxub2RlOwo+Cj4gSSBzdXNwZWN0IHRoYXQgdGhlIHdhcm5pbmcgbWF5IGJl
IHJlbGF0ZWQgdG8gdGhlIGFib3ZlLgo+IEkgdHJpZWQgdGhlIGFib3ZlIC4vdGVzdF9wcm9ncyBj
b21tYW5kIGxpbmUgKHJ1bm5pbmcgbXVsdGlwbGUKPiBhdCB0aGUgc2FtZSB0aW1lKSBhbmQgZGlk
bid0IHRyaWdnZXIgdGhlIGlzc3VlLgoKSW50ZXJlc3RpbmcuIFRoYW5rcyBmb3IgdGhlIHJlcG9y
dC4KSSB3YXNuJ3QgYWJsZSB0byByZXBvIHRoZSB3YXJuIGVpdGhlciwgYnV0IEkgY2FuIGNvbmZp
cm0gdGhhdCBsaW5rZWRfbGlzdAp0ZXN0IGlzIHN1cGVyIHNsb3cgb24gdGhlIGtlcm5lbCB3aXRo
IGRlYnVncyBvbiBhbmQgbWF5IGFwcGVhciB0byAiaGFuZyIsCnNpbmNlIGl0IGRvZXNuJ3QgcmVz
cG9uZCB0byBrZXkgcHJlc3MgZm9yIG1hbnkgc2Vjb25kcy4KCnRpbWUgLi90ZXN0X3Byb2dzIC1h
IGxpbmtlZF9saXN0ClN1bW1hcnk6IDEvMTMyIFBBU1NFRCwgMCBTS0lQUEVELCAwIEZBSUxFRAoK
cmVhbCAgICAwbTM1Ljg5N3MKdXNlciAgICAwbTEuODYwcwpzeXMgICAgMG0zMi4xMDVzCgpUaGF0
J3Mgbm90IG5vcm1hbC4KCkt1bWFyLCBEYXZlLAoKZG8geW91IGhhdmUgYW55IHN1Z2dlc3Rpb25z
PwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
