Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB78C83F01
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Aug 2023 21:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uMXwWIZNCFNFL0O5a8KCMxJ5nyOKao9AU9GEiKz1El0=; b=ZGKeyWrgHFLqIe
	cgnt2xOjsEp1zSfpLoTK/XzeFczOjc/97wQbDcbuJHWS88fKD2Xp1DcZfnCws3+yRDcx6YV9tz/Cc
	3kNDvEPv08t4TKEda/U9XLXaDE08NoEK+ikTEf+RNH99aX18mXzNbsQaOLB+wRjAF1AH4yrG5JK60
	TVSdeYyF6EVaQBhGGsZwWhiKmK6LcYFZiQ7rukcPSHg9Hgmc3FT8+bAOjQbNzOI00VSib6oqTIQmw
	o8BfwrDExmt/7A9adQP9Q38AFPu/dtK6gqJT+a/i/osJ0/275RB17/4eB4ooUlIYkirnJxDcT2K89
	YKcl/SkOLsjHOjtvYYRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbSNd-00EAjW-0s;
	Wed, 30 Aug 2023 21:05:37 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbSNZ-00EAiy-27
	for linux-riscv@lists.infradead.org;
	Wed, 30 Aug 2023 21:05:35 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2bcc14ea414so4589361fa.0
        for <linux-riscv@lists.infradead.org>; Wed, 30 Aug 2023 14:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693429529; x=1694034329; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lE091EAMyBUkgqinpZjH9mkYDXTVY9tjdEA2YqEI9+o=;
        b=cc8/x7mo5zau9JYq0o3ADJCeCVw5KHyvWksYQciulMk3Ztw4L4P2mGSZoUnAqY235t
         ZeRmKNNU7QjHLb+BoPxiNah/fejZQnF4K/X+3DMFJtvVCfvf9rTEAw/4orgQWDpEbSDd
         jnFvduFHSJ8+wqaA/4toNod/SlJnkPfyhE8MDkttbqyUwoPACKLbE+AVH/m4wW6Vxuym
         Frm8Cxu0WFAtTfPT81hcFLlW3ckxoTVIdKcRHZg+Yuf+eG/SS29isedJU5vVJeuSsIfZ
         X3zmiZDAVfylMLZt9GZ/TcgjuJkdl6/20Hzm5Xf0+hrLKhk84FFYrxV6FbFLixB+oBgQ
         c8Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693429529; x=1694034329;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lE091EAMyBUkgqinpZjH9mkYDXTVY9tjdEA2YqEI9+o=;
        b=C0j9DpwdtWRV2gdnwatfEyuzID3KkB8FEr2RplBm+lPCY7OpyG+/nmAdTv+cps7srU
         P76Jwp/+RmvpNEMiPYB71zMvG+xnbmZWOCXJtQ4+iu6yxD+GlHKwPsnDsGW4YUYozWlw
         GnZa/pokXWdA31K/6wfqQzh7XW8+WphnomAzmdg8ff1W/0cuKvbOMK8/pL9LZb6lAu4u
         WKW8eZ99H1pWY9572plUmiqagYHtDtwbx3/CGJFMQlqLMbdBGxEO32GFntQJL64Ss7yk
         CHddrrIUGYa/+DvZxWVLrYUXsc1WW+Xno2u8YI85nZ9eka9AH7OD+BoqamPb4e1QeeJ4
         6Etw==
X-Gm-Message-State: AOJu0YwTRSAf5/dYwMqiSrn3875ez+vIIgWEy2/ysIYN07lnxLEmG4vJ
	uUNEzwY3bjpBZdzn60pZKrK13jwPw8eMY5h59GI=
X-Google-Smtp-Source: AGHT+IHzyDVjRy2AE3OelchKTho4bCvxzRnsVwCW99+Y1Zk3iNfcE6dC3PaMjb0rp+5CHdDS0fs1kcngazPXjEqAgEA=
X-Received: by 2002:a2e:9f50:0:b0:2bd:1d02:5026 with SMTP id
 v16-20020a2e9f50000000b002bd1d025026mr2644298ljk.15.1693429528758; Wed, 30
 Aug 2023 14:05:28 -0700 (PDT)
MIME-Version: 1.0
References: <87jztjmmy4.fsf@all.your.base.are.belong.to.us>
 <2f4f0dfc-ec06-8ac8-a56a-395cc2373def@linux.dev> <200dcce6-34ff-83e0-02fb-709a24403cc6@huaweicloud.com>
 <87zg2e88ds.fsf@all.your.base.are.belong.to.us> <64873e42-9be1-1812-b80d-5ea86b4677f0@huaweicloud.com>
 <87sf8684ex.fsf@all.your.base.are.belong.to.us> <878r9wswwy.fsf@all.your.base.are.belong.to.us>
 <fd07e0a3-f4da-b447-c47a-6e933220d452@linux.dev> <65c9e8d9-7682-2c8d-cd4d-9f0ca1213066@huaweicloud.com>
 <CAADnVQJGVJCh=i1tuov4t1MmUx5=ybjF544i4F4m-SbHd5N6vA@mail.gmail.com> <76151038-155d-eac7-d6bb-d569c69fca3d@huaweicloud.com>
In-Reply-To: <76151038-155d-eac7-d6bb-d569c69fca3d@huaweicloud.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 30 Aug 2023 14:05:17 -0700
Message-ID: <CAADnVQK-syC0MBOR1eg_xp3kkhOcojHv1OT4eDu3=u1CekOTtA@mail.gmail.com>
Subject: Re: WARNING: CPU: 3 PID: 261 at kernel/bpf/memalloc.c:342
To: Hou Tao <houtao@huaweicloud.com>
Cc: Yonghong Song <yonghong.song@linux.dev>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	bpf <bpf@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_140533_723293_77E3DE89 
X-CRM114-Status: GOOD (  45.94  )
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

T24gV2VkLCBBdWcgMzAsIDIwMjMgYXQgNTowOeKAr0FNIEhvdSBUYW8gPGhvdXRhb0BodWF3ZWlj
bG91ZC5jb20+IHdyb3RlOgo+Cj4gSGksCj4KPiBPbiA4LzI5LzIwMjMgMTE6MjYgUE0sIEFsZXhl
aSBTdGFyb3ZvaXRvdiB3cm90ZToKPiA+IE9uIE1vbiwgQXVnIDI4LCAyMDIzIGF0IDY6NTfigK9B
TSBIb3UgVGFvIDxob3V0YW9AaHVhd2VpY2xvdWQuY29tPiB3cm90ZToKPiA+PiBIaSwKPiA+Pgo+
ID4+IE9uIDgvMjcvMjAyMyAxMDo1MyBQTSwgWW9uZ2hvbmcgU29uZyB3cm90ZToKPiA+Pj4KPiA+
Pj4gT24gOC8yNy8yMyAxOjM3IEFNLCBCasO2cm4gVMO2cGVsIHdyb3RlOgo+ID4+Pj4gQmrDtnJu
IFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4gd3JpdGVzOgo+ID4+Pj4KPiA+Pj4+PiBIb3UgVGFv
IDxob3V0YW9AaHVhd2VpY2xvdWQuY29tPiB3cml0ZXM6Cj4gPj4+Pj4KPiA+Pj4+Pj4gSGksCj4g
Pj4+Pj4+Cj4gPj4+Pj4+IE9uIDgvMjYvMjAyMyA1OjIzIFBNLCBCasO2cm4gVMO2cGVsIHdyb3Rl
Ogo+ID4+Pj4+Pj4gSG91IFRhbyA8aG91dGFvQGh1YXdlaWNsb3VkLmNvbT4gd3JpdGVzOgo+ID4+
Pj4+Pj4KPiA+Pj4+Pj4+PiBIaSwKPiA+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+IE9uIDgvMjUvMjAyMyAx
MToyOCBQTSwgWW9uZ2hvbmcgU29uZyB3cm90ZToKPiA+Pj4+Pj4+Pj4gT24gOC8yNS8yMyAzOjMy
IEFNLCBCasO2cm4gVMO2cGVsIHdyb3RlOgo+ID4+Pj4+Pj4+Pj4gSSdtIGNoYXNpbmcgYSB3b3Jr
cXVldWUgaGFuZyBvbiBSSVNDLVYvcWVtdSAoVENHKSwgdXNpbmcgdGhlIGJwZgo+ID4+Pj4+Pj4+
Pj4gc2VsZnRlc3RzIG9uIGJwZi1uZXh0IDllM2I0N2FiZWI4Zi4KPiA+Pj4+Pj4+Pj4+Cj4gPj4+
Pj4+Pj4+PiBJJ20gYWJsZSB0byByZXByb2R1Y2UgdGhlIGhhbmcgYnkgbXVsdGlwbGUgcnVucyBv
ZjoKPiA+Pj4+Pj4+Pj4+ICAgIHwgLi90ZXN0X3Byb2dzIC1hIGxpbmtfYXBpIC1hIGxpbmtlZF9s
aXN0Cj4gPj4+Pj4+Pj4+PiBJJ20gY3VycmVudGx5IGludmVzdGlnYXRpbmcgdGhhdC4KPiA+Pj4+
Pj4+Pj4+Cj4gPj4+Pj4+Pj4+PiBCdXQhIFNvbWV0aW1lcyAoZXZlcnkgYmx1ZSBtb29uKSBJIGdl
dCBhIHdhcm5fb25fb25jZSBoaXQ6Cj4gPj4+Pj4+Pj4+PiAgICB8IC0tLS0tLS0tLS0tLVsgY3V0
IGhlcmUgXS0tLS0tLS0tLS0tLQo+ID4+Pj4+Pj4+Pj4gICAgfCBXQVJOSU5HOiBDUFU6IDMgUElE
OiAyNjEgYXQga2VybmVsL2JwZi9tZW1hbGxvYy5jOjM0Mgo+ID4+Pj4+Pj4+Pj4gYnBmX21lbV9y
ZWZpbGwrMHgxZmMvMHgyMDYKPiA+Pj4+Pj4+Pj4+ICAgIHwgTW9kdWxlcyBsaW5rZWQgaW46IGJw
Zl90ZXN0bW9kKE9FKQo+ID4+Pj4+Pj4+Pj4gICAgfCBDUFU6IDMgUElEOiAyNjEgQ29tbTogdGVz
dF9wcm9ncy1jcHV2IFRhaW50ZWQ6IEcgICAgICAgICAgIE9FCj4gPj4+Pj4+Pj4+PiBOIDYuNS4w
LXJjNS0wMTc0My1nZGNiMTUyYmI4MzI4ICMyCj4gPj4+Pj4+Pj4+PiAgICB8IEhhcmR3YXJlIG5h
bWU6IHJpc2N2LXZpcnRpbyxxZW11IChEVCkKPiA+Pj4+Pj4+Pj4+ICAgIHwgZXBjIDogYnBmX21l
bV9yZWZpbGwrMHgxZmMvMHgyMDYKPiA+Pj4+Pj4+Pj4+ICAgIHwgIHJhIDogaXJxX3dvcmtfc2lu
Z2xlKzB4NjgvMHg3MAo+ID4+Pj4+Pj4+Pj4gICAgfCBlcGMgOiBmZmZmZmZmZjgwMWIxYmM0IHJh
IDogZmZmZmZmZmY4MDE1ZmU4NCBzcCA6Cj4gPj4+Pj4+Pj4+PiBmZjIwMDAwMDAwMDFiZTIwCj4g
Pj4+Pj4+Pj4+PiAgICB8ICBncCA6IGZmZmZmZmZmODJkMjYxMzggdHAgOiBmZjYwMDAwMDg0Nzdh
ODAwIHQwIDoKPiA+Pj4+Pj4+Pj4+IDAwMDAwMDAwMDAwNDY2MDAKPiA+Pj4+Pj4+Pj4+ICAgIHwg
IHQxIDogZmZmZmZmZmY4MTJiNmRkYyB0MiA6IDAwMDAwMDAwMDAwMDAwMDAgczAgOgo+ID4+Pj4+
Pj4+Pj4gZmYyMDAwMDAwMDAxYmU3MAo+ID4+Pj4+Pj4+Pj4gICAgfCAgczEgOiBmZjVmZmZmZmZm
ZmU4OTk4IGEwIDogZmY1ZmZmZmZmZmZlODk5OCBhMSA6Cj4gPj4+Pj4+Pj4+PiBmZjYwMDAwM2Zl
ZjRiMDAwCj4gPj4+Pj4+Pj4+PiAgICB8ICBhMiA6IDAwMDAwMDAwMDAwMDAwM2YgYTMgOiBmZmZm
ZmZmZjgwMDA4MjUwIGE0IDoKPiA+Pj4+Pj4+Pj4+IDAwMDAwMDAwMDAwMDAwNjAKPiA+Pj4+Pj4+
Pj4+ICAgIHwgIGE1IDogMDAwMDAwMDAwMDAwMDA4MCBhNiA6IDAwMDAwMDAwMDAwMDAwMDAgYTcg
Ogo+ID4+Pj4+Pj4+Pj4gMDAwMDAwMDAwMDczNTA0OQo+ID4+Pj4+Pj4+Pj4gICAgfCAgczIgOiBm
ZjVmZmZmZmZmZmU4OTk4IHMzIDogMDAwMDAwMDAwMDAwMDAyMiBzNCA6Cj4gPj4+Pj4+Pj4+PiAw
MDAwMDAwMDAwMDAxMDAwCj4gPj4+Pj4+Pj4+PiAgICB8ICBzNSA6IDAwMDAwMDAwMDAwMDAwMDcg
czYgOiBmZjVmZmZmZmZmZmU4NTcwIHM3IDoKPiA+Pj4+Pj4+Pj4+IGZmZmZmZmZmODJkNmJkMzAK
PiA+Pj4+Pj4+Pj4+ICAgIHwgIHM4IDogMDAwMDAwMDAwMDAwMDAzZiBzOSA6IGZmZmZmZmZmODJk
MmM1ZTggczEwOgo+ID4+Pj4+Pj4+Pj4gMDAwMDAwMDAwMDAwZmZmZgo+ID4+Pj4+Pj4+Pj4gICAg
fCAgczExOiBmZmZmZmZmZjgyZDJjNWQ4IHQzIDogZmZmZmZmZmY4MWVhOGYyOCB0NCA6Cj4gPj4+
Pj4+Pj4+PiAwMDAwMDAwMDAwMDAwMDAwCj4gPj4+Pj4+Pj4+PiAgICB8ICB0NSA6IGZmNjAwMDAw
OGZkMjgyNzggdDYgOiAwMDAwMDAwMDAwMDQwMDAwCj4gPj4+Pj4+Pj4+PiAgICB8IHN0YXR1czog
MDAwMDAwMDIwMDAwMDEwMCBiYWRhZGRyOiAwMDAwMDAwMDAwMDAwMDAwIGNhdXNlOgo+ID4+Pj4+
Pj4+Pj4gMDAwMDAwMDAwMDAwMDAwMwo+ID4+Pj4+Pj4+Pj4gICAgfCBbPGZmZmZmZmZmODAxYjFi
YzQ+XSBicGZfbWVtX3JlZmlsbCsweDFmYy8weDIwNgo+ID4+Pj4+Pj4+Pj4gICAgfCBbPGZmZmZm
ZmZmODAxNWZlODQ+XSBpcnFfd29ya19zaW5nbGUrMHg2OC8weDcwCj4gPj4+Pj4+Pj4+PiAgICB8
IFs8ZmZmZmZmZmY4MDE1ZmViND5dIGlycV93b3JrX3J1bl9saXN0KzB4MjgvMHgzNgo+ID4+Pj4+
Pj4+Pj4gICAgfCBbPGZmZmZmZmZmODAxNWZlZmE+XSBpcnFfd29ya19ydW4rMHgzOC8weDY2Cj4g
Pj4+Pj4+Pj4+PiAgICB8IFs8ZmZmZmZmZmY4MDAwODI4YT5dIGhhbmRsZV9JUEkrMHgzYS8weGI0
Cj4gPj4+Pj4+Pj4+PiAgICB8IFs8ZmZmZmZmZmY4MDBhNWMzYT5dIGhhbmRsZV9wZXJjcHVfZGV2
aWRfaXJxKzB4YTQvMHgxZjgKPiA+Pj4+Pj4+Pj4+ICAgIHwgWzxmZmZmZmZmZjgwMDlmYWZhPl0g
Z2VuZXJpY19oYW5kbGVfZG9tYWluX2lycSsweDI4LzB4MzYKPiA+Pj4+Pj4+Pj4+ICAgIHwgWzxm
ZmZmZmZmZjgwMGFlNTcwPl0gaXBpX211eF9wcm9jZXNzKzB4YWMvMHhmYQo+ID4+Pj4+Pj4+Pj4g
ICAgfCBbPGZmZmZmZmZmODAwMGE4ZWE+XSBzYmlfaXBpX2hhbmRsZSsweDJlLzB4ODgKPiA+Pj4+
Pj4+Pj4+ICAgIHwgWzxmZmZmZmZmZjgwMDlmYWZhPl0gZ2VuZXJpY19oYW5kbGVfZG9tYWluX2ly
cSsweDI4LzB4MzYKPiA+Pj4+Pj4+Pj4+ICAgIHwgWzxmZmZmZmZmZjgwN2VlNzBlPl0gcmlzY3Zf
aW50Y19pcnErMHgzNi8weDRlCj4gPj4+Pj4+Pj4+PiAgICB8IFs8ZmZmZmZmZmY4MTJiNWQzYT5d
IGhhbmRsZV9yaXNjdl9pcnErMHg1NC8weDg2Cj4gPj4+Pj4+Pj4+PiAgICB8IFs8ZmZmZmZmZmY4
MTJiNjkwND5dIGRvX2lycSsweDY2LzB4OTgKPiA+Pj4+Pj4+Pj4+ICAgIHwgLS0tWyBlbmQgdHJh
Y2UgMDAwMDAwMDAwMDAwMDAwMCBdLS0tCj4gPj4+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+Pj4gQ29kZToK
PiA+Pj4+Pj4+Pj4+ICAgIHwgc3RhdGljIHZvaWQgZnJlZV9idWxrKHN0cnVjdCBicGZfbWVtX2Nh
Y2hlICpjKQo+ID4+Pj4+Pj4+Pj4gICAgfCB7Cj4gPj4+Pj4+Pj4+PiAgICB8ICAgICBzdHJ1Y3Qg
YnBmX21lbV9jYWNoZSAqdGd0ID0gYy0+dGd0Owo+ID4+Pj4+Pj4+Pj4gICAgfCAgICAgc3RydWN0
IGxsaXN0X25vZGUgKmxsbm9kZSwgKnQ7Cj4gPj4+Pj4+Pj4+PiAgICB8ICAgICB1bnNpZ25lZCBs
b25nIGZsYWdzOwo+ID4+Pj4+Pj4+Pj4gICAgfCAgICAgaW50IGNudDsKPiA+Pj4+Pj4+Pj4+ICAg
IHwKPiA+Pj4+Pj4+Pj4+ICAgIHwgICAgIFdBUk5fT05fT05DRSh0Z3QtPnVuaXRfc2l6ZSAhPSBj
LT51bml0X3NpemUpOwo+ID4+Pj4+Pj4+Pj4gICAgfCAuLi4KPiA+Pj4+Pj4+Pj4+Cj4gPj4+Pj4+
Pj4+PiBJJ20gbm90IHdlbGwgdmVyc2VkIGluIHRoZSBtZW1vcnkgYWxsb2NhdG9yOyBCZWZvcmUg
SSBkaXZlIGludG8KPiA+Pj4+Pj4+Pj4+IGl0IC0tCj4gPj4+Pj4+Pj4+PiBoYXMgYW55b25lIGVs
c2UgaGl0IGl0PyBJZGVhcyBvbiB3aHkgdGhlIHdhcm5fb25fb25jZSBpcyBoaXQ/Cj4gPj4+Pj4+
Pj4+IE1heWJlIHRha2UgYSBsb29rIGF0IHRoZSBwYXRjaAo+ID4+Pj4+Pj4+PiAgICA4MjJmYjI2
YmRiNTUgIGJwZjogQWRkIGEgaGludCB0byBhbGxvY2F0ZWQgb2JqZWN0cy4KPiA+Pj4+Pj4+Pj4K
PiA+Pj4+Pj4+Pj4gSW4gdGhlIGFib3ZlIHBhdGNoLCB3ZSBoYXZlCj4gPj4+Pj4+Pj4+Cj4gPj4+
Pj4+Pj4+ICsgICAgICAgLyoKPiA+Pj4+Pj4+Pj4gKyAgICAgICAgKiBSZW1lbWJlciBicGZfbWVt
X2NhY2hlIHRoYXQgYWxsb2NhdGVkIHRoaXMgb2JqZWN0Lgo+ID4+Pj4+Pj4+PiArICAgICAgICAq
IFRoZSBoaW50IGlzIG5vdCBhY2N1cmF0ZS4KPiA+Pj4+Pj4+Pj4gKyAgICAgICAgKi8KPiA+Pj4+
Pj4+Pj4gKyAgICAgICBjLT50Z3QgPSAqKHN0cnVjdCBicGZfbWVtX2NhY2hlICoqKWxsbm9kZTsK
PiA+Pj4+Pj4+Pj4KPiA+Pj4+Pj4+Pj4gSSBzdXNwZWN0IHRoYXQgdGhlIHdhcm5pbmcgbWF5IGJl
IHJlbGF0ZWQgdG8gdGhlIGFib3ZlLgo+ID4+Pj4+Pj4+PiBJIHRyaWVkIHRoZSBhYm92ZSAuL3Rl
c3RfcHJvZ3MgY29tbWFuZCBsaW5lIChydW5uaW5nIG11bHRpcGxlCj4gPj4+Pj4+Pj4+IGF0IHRo
ZSBzYW1lIHRpbWUpIGFuZCBkaWRuJ3QgdHJpZ2dlciB0aGUgaXNzdWUuCj4gPj4+Pj4+Pj4gVGhl
IGV4dHJhIDgtYnl0ZXMgYmVmb3JlIHRoZSBmcmVlZCBwb2ludGVyIGlzIHVzZWQgdG8gc2F2ZSB0
aGUKPiA+Pj4+Pj4+PiBwb2ludGVyCj4gPj4+Pj4+Pj4gb2YgdGhlIG9yaWdpbmFsIGJwZiBtZW1v
cnkgYWxsb2NhdG9yIHdoZXJlIHRoZSBmcmVlZCBwb2ludGVyIGNhbWUKPiA+Pj4+Pj4+PiBmcm9t
LAo+ID4+Pj4+Pj4+IHNvIHVuaXRfZnJlZSgpIGNvdWxkIGZyZWUgdGhlIHBvaW50ZXIgYmFjayB0
byB0aGUgb3JpZ2luYWwKPiA+Pj4+Pj4+PiBhbGxvY2F0b3IgdG8KPiA+Pj4+Pj4+PiBwcmV2ZW50
IGFsbG9jLWFuZC1mcmVlIHVuYmFsYW5jZS4KPiA+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+IEkgc3VzcGVj
dCB0aGF0IGEgd3JvbmcgcG9pbnRlciB3YXMgcGFzc2VkIHRvIGJwZl9vYmpfZHJvcCwgYnV0IGRv
Cj4gPj4+Pj4+Pj4gbm90Cj4gPj4+Pj4+Pj4gZmluZCBhbnl0aGluZyBzdXNwaWNpb3VzIGFmdGVy
IGNoZWNraW5nIGxpbmtlZF9saXN0LiBBbm90aGVyCj4gPj4+Pj4+Pj4gcG9zc2liaWxpdHkKPiA+
Pj4+Pj4+PiBpcyB0aGF0IHRoZXJlIGlzIHdyaXRlLWFmdGVyLWZyZWUgcHJvYmxlbSB3aGljaCBj
b3JydXB0cyB0aGUgZXh0cmEKPiA+Pj4+Pj4+PiA4LWJ5dGVzIGJlZm9yZSB0aGUgZnJlZWQgcG9p
bnRlci4gQ291bGQgeW91IHBsZWFzZSBhcHBseSB0aGUKPiA+Pj4+Pj4+PiBmb2xsb3dpbmcKPiA+
Pj4+Pj4+PiBkZWJ1ZyBwYXRjaCB0byBjaGVjayB3aGV0aGVyIG9yIG5vdCB0aGUgZXh0cmEgOC1i
eXRlcyBhcmUKPiA+Pj4+Pj4+PiBjb3JydXB0ZWQgPwo+ID4+Pj4+Pj4gVGhhbmtzIGZvciBnZXR0
aW5nIGJhY2shCj4gPj4+Pj4+Pgo+ID4+Pj4+Pj4gSSB0b29rIHlvdXIgcGF0Y2ggZm9yIGEgcnVu
LCBhbmQgdGhlcmUncyBhIGhpdDoKPiA+Pj4+Pj4+ICAgIHwgYmFkIGNhY2hlIGZmNWZmZmZmZmZm
ZTg1NzA6IGdvdCBzaXplIDk2IHdvcmsKPiA+Pj4+Pj4+IGZmZmZmZmZmODAxYjE5YzgsIGNhY2hl
IGZmNWZmZmZmZmZmZTg5ODAgZXhwIHNpemUgMTI4IHdvcmsKPiA+Pj4+Pj4+IGZmZmZmZmZmODAx
YjE5YzgKPiA+Pj4+Pj4gVGhlIGV4dHJhIDgtYnl0ZXMgYXJlIG5vdCBjb3JydXB0ZWQuIEJvdGgg
b2YgdGhlc2UgdHdvCj4gPj4+Pj4+IGJwZl9tZW1fY2FjaGUgYXJlCj4gPj4+Pj4+IHZhbGlkIGFu
ZCB0aGVyZSBhcmUgaW4gdGhlIGNhY2hlIGFycmF5IGRlZmluZWQgaW4gYnBmX21lbV9jYWNoZXMu
IEJQRgo+ID4+Pj4+PiBtZW1vcnkgYWxsb2NhdG9yIGFsbG9jYXRlZCB0aGUgcG9pbnRlciBmcm9t
IDk2LWJ5dGVzIHNpemVkLWNhY2hlLAo+ID4+Pj4+PiBidXQgaXQKPiA+Pj4+Pj4gdHJpZWQgdG8g
ZnJlZSB0aGUgcG9pbnRlciB0aHJvdWdoIDEyOC1ieXRlcyBzaXplZC1jYWNoZS4KPiA+Pj4+Pj4K
PiA+Pj4+Pj4gTm93IEkgc3VzcGVjdCB0aGVyZSBpcyBubyA5Ni1ieXRlcyBzbGFiIGluIHlvdXIg
c3lzdGVtIGFuZCBrc2l6ZShwdHIgLQo+ID4+Pj4+PiBMTElTVF9OT0RFX1NaKSByZXR1cm5zIDEy
OCwgc28gYnBmIG1lbW9yeSBhbGxvY2F0b3Igc2VsZWN0ZWQgdGhlCj4gPj4+Pj4+IDEyOC1ieXRl
IHNpemVkLWNhY2hlIGluc3RlYWQgb2YgOTYtYnl0ZXMgc2l6ZWQtY2FjaGUuIENvdWxkIHlvdSBw
bGVhc2UKPiA+Pj4+Pj4gY2hlY2sgdGhlIHZhbHVlIG9mIEtNQUxMT0NfTUlOX1NJWkUgaW4geW91
ciBrZXJuZWwgLmNvbmZpZyBhbmQKPiA+Pj4+Pj4gdXNpbmcgdGhlCj4gPj4+Pj4+IGZvbGxvd2lu
ZyBjb21tYW5kIHRvIGNoZWNrIHdoZXRoZXIgdGhlcmUgaXMgOTYtYnl0ZXMgc2xhYiBpbiB5b3Vy
Cj4gPj4+Pj4+IHN5c3RlbToKPiA+Pj4+PiBLTUFMTE9DX01JTl9TSVpFIGlzIDY0Lgo+ID4+Pj4+
Cj4gPj4+Pj4+ICQgY2F0IC9wcm9jL3NsYWJpbmZvIHxncmVwIGttYWxsb2MtOTYKPiA+Pj4+Pj4g
ZG1hLWttYWxsb2MtOTYgICAgICAgICAwICAgICAgMCAgICAgOTYgICA0MiAgICAxIDogdHVuYWJs
ZXMgICAgMCAgICAwCj4gPj4+Pj4+IDAgOiBzbGFiZGF0YSAgICAgIDAgICAgICAwICAgICAgMAo+
ID4+Pj4+PiBrbWFsbG9jLTk2ICAgICAgICAgIDE4NjUgICAyMjY4ICAgICA5NiAgIDQyICAgIDEg
OiB0dW5hYmxlcyAgICAwICAgIDAKPiA+Pj4+Pj4gMCA6IHNsYWJkYXRhICAgICA1NCAgICAgNTQg
ICAgICAwCj4gPj4+Pj4+Cj4gPj4+Pj4+IEluIG15IHN5c3RlbSwgc2xhYiBoYXMgOTYtYnl0ZXMg
Y2FjaGVkLCBzbyBncmVwIG91dHB1dHMgc29tZXRoaW5nLAo+ID4+Pj4+PiBidXQgSQo+ID4+Pj4+
PiB0aGluayB0aGVyZSB3aWxsIG5vIG91dHB1dCBpbiB5b3VyIHN5c3RlbS4KPiA+Pj4+PiBZb3Un
cmUgcmlnaHQhIE5vIGttYWxsb2MtOTYuCj4gPj4+PiBUbyBnZXQgcmlkIG9mIHRoZSB3YXJuaW5n
LCBsaW1pdCBhdmFpbGFibGUgc2l6ZXMgZnJvbQo+ID4+Pj4gYnBmX21lbV9hbGxvY19pbml0KCk/
Cj4gPj4gSXQgaXMgbm90IGVub3VnaC4gV2UgbmVlZCB0byBhZGp1c3Qgc2l6ZV9pbmRleCBhY2Nv
cmRpbmdseSBkdXJpbmcKPiA+PiBpbml0aWFsaXphdGlvbi4gQ291bGQgeW91IHBsZWFzZSB0cnkg
dGhlIGF0dGFjaGVkIHBhdGNoIGJlbG93ID8gSXQgaXMKPiA+PiBub3QgYSBmb3JtYWwgcGF0Y2gg
YW5kIEkgYW0gY29uc2lkZXJpbmcgdG8gZGlzYWJsZSBwcmVmaWxsaW5nIGZvciB0aGVzZQo+ID4+
IHJlZGlyZWN0ZWQgYnBmX21lbV9jYWNoZXMuCj4gPj4+IERvIHlvdSBrbm93IHdoeSB5b3VyIHN5
c3RlbSBkb2VzIG5vdCBoYXZlIGttYWxsb2MtOTY/Cj4gPj4gQWNjb3JkaW5nIHRvIHRoZSBpbXBs
ZW1lbnRhdGlvbiBvZiBzZXR1cF9rbWFsbG9jX2NhY2hlX2luZGV4X3RhYmxlKCkgYW5kCj4gPj4g
Y3JlYXRlX2ttYWxsb2NfY2FjaGVzKCksICB3aGVuIEtNQUxMT0NfTUlOX1NJWkUgaXMgZ3JlYXRl
ciB0aGFuIDY0LAo+ID4+IGttYWxsb2MtOTYgd2lsbCBiZSBvbWl0dGVkLiBJZiBLTUFMTE9DX01J
Tl9TSVpFIGlzIGdyZWF0ZXIgdGhhbiAxMjgsCj4gPj4ga21hbGxvYy0xOTIgd2lsbCBiZSBvbWl0
dGVkIGFzIHdlbGwuCj4gPiBHcmVhdCBjYXRjaC4gVGhlIGZpeCBsb29rcyBnb29kLgo+ID4gUGxl
YXNlIHN1Ym1pdCBpdCBvZmZpY2lhbGx5IGFuZCBhZGQgYW4gZXJyb3IgY2hlY2sgdG8gYnBmX21l
bV9hbGxvY19pbml0KCkKPiA+IHRoYXQgdmVyaWZpZXMgdGhhdCBrc2l6ZSgpIG1hdGNoZXMgdGhl
IGV4cGVjdGF0aW9ucy4KPgo+IERvIHlvdSBtZWFuIHRvIGNoZWNrIHRoZSByZXR1cm4gdmFsdWVz
IG9mIGtzaXplKCkgZm9yIHRoZXNlIHByZWZpbGwKPiBvYmplY3RzIGluIGZyZWVfbGxpc3QgYXJl
IGV4cGVjdGVkLCByaWdodCA/CgpJJ2QgbGlrZSB0byBhdm9pZCBhZGRpbmcgZXh0cmEgZmxhZ3Mg
dG8gYWxsb2NfYnVsaygpIGFuZCBwYXNzaW5nIHRoZW0gYWxvbmcuCkluc3RlYWQgcHJlZmlsbF9t
ZW1fY2FjaGUoKSBjYW4gcGVlayBpbnRvIDFzdCBlbGVtZW50IGFmdGVyIGFsbG9jX2J1bGsoKQph
bmQgY2hlY2sgaXRzIGtzaXplLgoKPiA+IFRoZSBhbHRlcm5hdGl2ZSBpcyB0byB1c2Uga21hbGxv
Y19zaXplX3JvdW5kdXAoKSBkdXJpbmcgYWxsb2MgZm9yCj4gPiBjaGVja2luZyBpbnN0ZWFkIG9m
IGtzaXplKCkuCj4gPiBUZWNobmljYWxseSB3ZSBjYW4gdXNlIGttYWxsb2Nfc2l6ZV9yb3VuZHVw
IGluIHVuaXRfYWxsb2MoKSBhbmQgYXZvaWQKPiA+IHNldHVwX2ttYWxsb2NfY2FjaGVfaW5kZXhf
dGFibGUoKS1saWtlIGNvcHkgcGFzdGUsIGJ1dCBwZXJmb3JtYW5jZQo+ID4gb3ZlcmhlYWQgbWln
aHQgYmUgdG9vIGhpZ2guCj4gPiBTbyB5b3VyIHBhdGNoICsgZXJyb3IgY2hlY2sgYXQgYnBmX21l
bV9hbGxvY19pbml0KCkgaXMgcHJlZmVycmVkLgo+IEkgc2VlLiBVc2luZyBrbWFsbG9jX3NpemVf
cm91bmQoKSBpbiBicGZfbWVtX2FsbG9jKCkgaXMgaW5kZWVkIGFuCj4gYWx0ZXJuYXRpdmUgc29s
dXRpb24uIFdpbGwgcG9zdCBpdC4KCk5vIG5lZWQuIEkgdGhpbmsgcGVyZiBkZWdyYWRhdGlvbiBm
b3IgYSBjb3JuZXIgY2FzZSBpcyBwcm9oaWJpdGl2ZS4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
