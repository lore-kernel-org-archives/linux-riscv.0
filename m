Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8805C001DB
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 10:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pIZaWu2XQhZLjzVeVaZUGzPlLtoVe/O5+wE8dQ9iIwM=; b=H2HiB5PaRvXgFw
	R3Q2TcCcTHWBZqlOa5FRayiBKJXqF1m+Q5BUk+JLuw0FjJdC483ksCSEiUAQv8YEZY0Th0McT/yeS
	8ZjOSwHSsf//oPSUYlAoNR+qFkMOWunvRu0qNbDqPvx+N6TyXqdMRv1Lp8uuDlBGuHomKA2vxcCHu
	RRChj2c3p0nfwp8C895X1WXC1miCl8D5soLRNzUNhzZQzDBBh1Kb97GkYmiChSXGhGF0v3wuK/PMU
	9By89lnzbT2SIUlJeXeY9zKk9SsJy7c6jdjIjkpfgOzbSCKd2mwv01mZstFcZ2HwOzS/gpnhjGZ5g
	/fP1vbSs8nWOo9+MD8qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU3Jn-007JSx-2l;
	Thu, 10 Aug 2023 10:55:03 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU3Jk-007JRg-1E
	for linux-riscv@lists.infradead.org;
	Thu, 10 Aug 2023 10:55:02 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4fe7e67cc77so1136229e87.2
        for <linux-riscv@lists.infradead.org>; Thu, 10 Aug 2023 03:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691664898; x=1692269698;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C5CKhf24mVhXnvggf5refaUhJYITC6vy/rasjIALuEw=;
        b=BgUuXUQh9cvomfQAzgBwVP7H1toj/gU/Yf4ixGbFUmFL63YyD5FB1vx2FTQzVLBskU
         JZLxpKoqic4LD3d3ttY5PcOaL61PSbBATWrUuN8cqiBrkV/w+Nn/QxYeSXFRaL4FoYW5
         0hOiSYcFoNnHxWBwM8kuBspQIPrmKSrKjAplNqAa7moZgcZ5ZjefT+wYGXkm4wYXV9as
         cLO5PLgZ6AESC4VWUN+1xsEgUFYl35zwL4JhGwU4Aj39uy0JvczFVAzzDHlTpAgDInJ8
         r/fUEBpA9b4NYMgmwhAoY1AKxklKN3lSVs6PJqj6pgVxG8PjOoONSq8v1UMGxfLeozks
         NJ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691664898; x=1692269698;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C5CKhf24mVhXnvggf5refaUhJYITC6vy/rasjIALuEw=;
        b=dzBpHZUtLPSFsO10HxCWkSTQ9/g85B45Aa66NDACSFEUG26N6MHUqN+X+lE/AB636G
         NJvKHA8iWX1GNFNccosVi1m8c4Unn2zKnknwnAJvRCJy56aArBGy8vpnkrO4IEF2+R4B
         X3JnlrlvydSikwE4AS+5PULIoAb4IqP9cxDb2/ZQ5Z+SbTzLxxPan2+d+PZ1sQ1cpAq5
         kuXRmBqyytLWUh2lu0BHQofW+YRNPiwu/rEH96o4sbnfhNMOa0a4YPtchd+63rY53VRO
         eAy5vPDpkCzN9J3ws6kPQJPdlNJQqYDrpkMP4zB1lsv+Y0pom/YXVMOoNjlxVNZ3Uz9e
         GcNg==
X-Gm-Message-State: AOJu0Yzf77QFprC5M5pbrrPk9gdN6mvWu5NDADG6TAH+9HPLf+tE4yO8
	QGEt/g4wpTkVmOholtg6iCJNjOujWqjGx9+GYC18Xg==
X-Google-Smtp-Source: AGHT+IGL6buMyyNOjgnbUK4UjsTVw+zgqQfEbCXKl5tbWkypoPSmz9hri1FV3vwqA60sD7Bpy+Bcgw==
X-Received: by 2002:a2e:864e:0:b0:2b9:40c7:f5ed with SMTP id i14-20020a2e864e000000b002b940c7f5edmr1747785ljj.17.1691664897953;
        Thu, 10 Aug 2023 03:54:57 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id xa5-20020a170907b9c500b0099bd0b5a2bcsm767184ejc.101.2023.08.10.03.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 03:54:57 -0700 (PDT)
Date: Thu, 10 Aug 2023 12:54:56 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, Evan Green <evan@rivosinc.com>, 
	linux-riscv@lists.infradead.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, apatel@ventanamicro.com
Subject: Re: [PATCH 2/6] RISC-V: Enable cbo.zero in usermode
Message-ID: <20230810-87ec8c9c6bac02f5513c9f78@orel>
References: <20230809115516.214537-8-ajones@ventanamicro.com>
 <20230809115516.214537-10-ajones@ventanamicro.com>
 <CALs-HssK7ys8kjZPuodoz9qEe_hReyihfbBdQsp1exLH3vxkSQ@mail.gmail.com>
 <20230809-7aa41e2dd2fd2909f1266a20@orel>
 <20230809-disrupt-jersey-f2545c5903fe@spud>
 <20230810-30583d716fb7652e22c868ee@orel>
 <20230810-caution-rise-a12e7210c670@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230810-caution-rise-a12e7210c670@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_035500_446375_753BC66F 
X-CRM114-Status: GOOD (  52.28  )
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

T24gVGh1LCBBdWcgMTAsIDIwMjMgYXQgMTA6MzQ6MzNBTSArMDEwMCwgQ29ub3IgRG9vbGV5IHdy
b3RlOgo+IE9uIFRodSwgQXVnIDEwLCAyMDIzIGF0IDA5OjMxOjU0QU0gKzAyMDAsIEFuZHJldyBK
b25lcyB3cm90ZToKPiA+IE9uIFdlZCwgQXVnIDA5LCAyMDIzIGF0IDA3OjEyOjU4UE0gKzAxMDAs
IENvbm9yIERvb2xleSB3cm90ZToKPiA+ID4gT24gV2VkLCBBdWcgMDksIDIwMjMgYXQgMDY6NTg6
MTVQTSArMDIwMCwgQW5kcmV3IEpvbmVzIHdyb3RlOgo+ID4gPiA+IE9uIFdlZCwgQXVnIDA5LCAy
MDIzIGF0IDA5OjAwOjM1QU0gLTA3MDAsIEV2YW4gR3JlZW4gd3JvdGU6Cj4gPiA+ID4gPiBPbiBX
ZWQsIEF1ZyA5LCAyMDIzIGF0IDQ6NTXigK9BTSBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5h
bWljcm8uY29tPiB3cm90ZToKPiA+ID4gPiAuLi4KPiA+ID4gPiA+ID4gK3N0YXRpYyBfX2Fsd2F5
c19pbmxpbmUgYm9vbCByaXNjdl90aGlzX2NwdV9oYXNfZXh0ZW5zaW9uX2xpa2VseShjb25zdCB1
bnNpZ25lZCBsb25nIGV4dCkKPiA+ID4gPiA+ID4gK3sKPiA+ID4gPiA+ID4gKyAgICAgICBpZiAo
SVNfRU5BQkxFRChDT05GSUdfUklTQ1ZfQUxURVJOQVRJVkUpICYmIHJpc2N2X2hhc19leHRlbnNp
b25fbGlrZWx5KGV4dCkpCj4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gdHJ1ZTsK
PiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiArICAgICAgIHJldHVybiBfX3Jpc2N2X2lzYV9leHRl
bnNpb25fYXZhaWxhYmxlKGhhcnRfaXNhW3NtcF9wcm9jZXNzb3JfaWQoKV0uaXNhLCBleHQpOwo+
ID4gPiA+ID4gPiArfQo+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ICtzdGF0aWMgX19hbHdheXNf
aW5saW5lIGJvb2wgcmlzY3ZfdGhpc19jcHVfaGFzX2V4dGVuc2lvbl91bmxpa2VseShjb25zdCB1
bnNpZ25lZCBsb25nIGV4dCkKPiA+ID4gPiA+ID4gK3sKPiA+ID4gPiA+ID4gKyAgICAgICBpZiAo
SVNfRU5BQkxFRChDT05GSUdfUklTQ1ZfQUxURVJOQVRJVkUpICYmIHJpc2N2X2hhc19leHRlbnNp
b25fdW5saWtlbHkoZXh0KSkKPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIHJldHVybiB0cnVl
Owo+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ICsgICAgICAgcmV0dXJuIF9fcmlzY3ZfaXNhX2V4
dGVuc2lvbl9hdmFpbGFibGUoaGFydF9pc2Fbc21wX3Byb2Nlc3Nvcl9pZCgpXS5pc2EsIGV4dCk7
Cj4gPiA+ID4gPiA+ICt9Cj4gPiA+ID4gPiAKPiA+ID4gPiA+IEFub3RoZXIgd2F5IHRvIGRvIHRo
aXMgd291bGQgYmUgdG8gYWRkIGEgcGFyYW1ldGVyIHRvCj4gPiA+ID4gPiByaXNjdl9oYXNfZXh0
ZW5zaW9uXyooKSAoYXMgdGhlcmUgYXJlIHZlcnkgZmV3IHVzZXJzKSwgdGhlbiB0aGVzZSBuZXcK
PiA+ID4gPiA+IGZ1bmN0aW9ucyBjYW4gdHVybiBhcm91bmQgYW5kIGNhbGwgdGhvc2Ugd2l0aCB0
aGUgbmV3IHBhcmFtZXRlciBzZXQgdG8KPiA+ID4gPiA+IGhhcnRfaXNhW3NtcF9wcm9jZXNzb3Jf
aWQoKV0uaXNhLiBJdCdzIGEgdG9zc3VwLCBzbyB1cCB0byB5b3UuIFRoZQo+ID4gPiA+ID4gb25s
eSBhZHZhbnRhZ2UgdG8gaXQgSSBjYW4gYXJndWUgaXMgaXQga2VlcHMgdGhlIGNvZGUgZmxvd3Mg
bW9yZQo+ID4gPiA+ID4gdW5pZmllZC4KPiA+ID4gPiA+Cj4gPiA+ID4gCj4gPiA+ID4gSSBsaWtl
IHVuaWZpY2F0aW9uLCBidXQgSSB0aGluayBJJ2QgcHJlZmVyIHdlIGNyZWF0ZSB3cmFwcGVycyBh
bmQKPiA+ID4gPiB0cnkgdG8gYXZvaWQgY2FsbGVycyBuZWVkaW5nIHRvIGNvbnN0cnVjdCBoYXJ0
X2lzYVtdLmlzYSBwYXJhbWV0ZXJzCj4gPiA+ID4gdGhlbXNlbHZlcy4gSSdtIGFsc28gbm90IGEg
YmlnIGZhbiBvZiB0aGUgTlVMTCBwYXJhbWV0ZXIgbmVlZGVkIHdoZW4KPiA+ID4gPiByaXNjdl9p
c2FfZXh0ZW5zaW9uX2F2YWlsYWJsZSgpIGlzIGludm9rZWQgZm9yIHRoZSByaXNjdl9pc2EgYml0
bWFwLgo+ID4gPiA+IFNvIHdlIG5lZWQ6Cj4gPiA+ID4gCj4gPiA+ID4gICAxLiBjaGVjayBpZiBh
biBleHRlbnNpb24gaXMgaW4gcmlzY3ZfaXNhCj4gPiA+ID4gICAyLiBjaGVjayBpZiBhbiBleHRl
bnNpb24gaXMgaW4gYSBiaXRtYXAgcHJvdmlkZWQgYnkgdGhlIGNhbGxlcgo+ID4gPiA+ICAgMy4g
Y2hlY2sgaWYgYW4gZXh0ZW5zaW9uIGlzIGluIHRoaXMgY3B1J3MgaXNhIGJpdG1hcAo+ID4gPiA+
ICAgNC4gY2hlY2sgaWYgYW4gZXh0ZW5zaW9uIGlzIGluIHRoZSBpc2EgYml0bWFwIG9mIGEgY3B1
IHByb3ZpZGVkIGJ5IHRoZQo+ID4gPiA+ICAgICAgY2FsbGVyCj4gPiA+ID4gCj4gPiA+ID4gVGhl
IG9ubHkgb25lIHdlIGNhbiBvcHRpbWl6ZSB3aXRoIGFsdGVybmF0aXZlcyBpcyAoMSksIHNvIGl0
IGRlZmluaXRlbHkKPiA+ID4gPiBnZXRzIHdyYXBwZXJzIChyaXNjdl9oYXNfZXh0ZW5zaW9uX2xp
a2VseS91bmxpa2VseSgpKS4gKDMpIGFuZCAoNCkgY2FuCj4gPiA+ID4gYWxzbyBnZXQgd3JhcHBl
cnMgd2hpY2ggZmlyc3QgdHJ5IHRoZSBvcHRpbWl6ZWQgKDEpLCBsaWtlIEkgaGF2ZSBhYm92ZS4K
PiA+ID4gPiBBY3R1YWxseSAoMykncyB3cmFwcGVyIGNvdWxkIGJlIGJhc2VkIG9uICg0KSdzLCBv
ciBvbmx5IHByb3ZpZGUgd3JhcHBlcnMKPiA+ID4gPiBmb3IgKDQpCj4gPiA+ID4gCj4gPiA+ID4g
IHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgYm9vbCByaXNjdl9jcHVfaGFzX2V4dGVuc2lvbl9saWtl
bHkoaW50IGNwdSwgY29uc3QgdW5zaWduZWQgbG9uZyBleHQpCj4gPiA+ID4gIHsKPiA+ID4gPiAg
ICAgIGlmIChJU19FTkFCTEVEKENPTkZJR19SSVNDVl9BTFRFUk5BVElWRSkgJiYgcmlzY3ZfaGFz
X2V4dGVuc2lvbl9saWtlbHkoZXh0KSkKPiA+ID4gPiAgICAgICAgICByZXR1cm4gdHJ1ZTsKPiA+
ID4gPiAKPiA+ID4gPiAgICAgIHJldHVybiBfX3Jpc2N2X2lzYV9leHRlbnNpb25fYXZhaWxhYmxl
KGhhcnRfaXNhW2NwdV0uaXNhLCBleHQpOwo+ID4gPiA+ICB9Cj4gPiA+ID4gCj4gPiA+ID4gIHN0
YXRpYyBfX2Fsd2F5c19pbmxpbmUgYm9vbCByaXNjdl9jcHVfaGFzX2V4dGVuc2lvbl91bmxpa2Vs
eShpbnQgY3B1LCBjb25zdCB1bnNpZ25lZCBsb25nIGV4dCkKPiA+ID4gPiAgewo+ID4gPiA+ICAg
ICAgaWYgKElTX0VOQUJMRUQoQ09ORklHX1JJU0NWX0FMVEVSTkFUSVZFKSAmJiByaXNjdl9oYXNf
ZXh0ZW5zaW9uX3VubGlrZWx5KGV4dCkpCj4gPiA+IAo+ID4gPiBXaHkgYXJlIHlvdSBnYXRpbmcg
b24gQ09ORklHX1JJU0NWX0FMVEVSTkFUSVZFIGhlcmU/Cj4gPiAKPiA+IFRoaXMgZW5zdXJlcyB3
ZSByZW1vdmUgdGhlIHJpc2N2X2hhc19leHRlbnNpb25fW3VuXWxpa2VseSgpIGNhbGwKPiA+IHdo
ZW4gdGhhdCBjYWxsIHdvdWxkIGVuZCB1cCB1c2luZyBpdHMKPiA+IF9fcmlzY3ZfaXNhX2V4dGVu
c2lvbl9hdmFpbGFibGUoTlVMTCwgZXh0KSBmYWxsYmFjay4gSWYgdGhhdCBmYWxsYmFjawo+ID4g
d2hlcmUgdG8gcmV0dXJuIGZhbHNlLCB0aGVuIHdlJ2Qgc3RpbGwgbmVlZCB0byBtYWtlIHRoZQo+
ID4gX19yaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZShoYXJ0X2lzYVtjcHVdLmlzYSwgZXh0
KSBjYWxsLCBkb3VibGluZwo+ID4gdGhlIGNvc3QuIFdoZXJlYXMsIHdoZW4gd2UgZ2F0ZSBvbiBD
T05GSUdfUklTQ1ZfQUxURVJOQVRJVkUsIHdlIGtub3cgdGhhdAo+ID4gcmlzY3ZfaGFzX2V4dGVu
c2lvbl9bdW5dbGlrZWx5KCkgd2lsbCB1c2UgYW4gYWx0ZXJuYXRpdmUgdG8gY2hlY2sgdGhlCj4g
PiBnbG9iYWwgc2V0IG9mIGV4dGVuc2lvbnMuIFdoZW4gdGhlIGV4dGVuc2lvbiBpcyB0aGVyZSwg
dGhlIGNvbXBpbGVyCj4gPiBlbnN1cmVzIHRoYXQgZXZlcnl0aGluZyB2YW5pc2hlcy4gV2hlbiBp
dCdzIG5vdCwgd2UnbGwgZmFsbGJhY2sgdG8gYQo+ID4gc2luZ2xlIHNlYXJjaCBvZiB0aGUgY3B1
J3MgaXNhIGJpdG1hcC4KPiAKPiBSaWdodCwgdGhhdCBpcyB3aGF0IEkgc3VzcGVjdGVkIHRoYXQg
eW91IHdlcmUgdHJ5aW5nIHRvIGFjY29tcGxpc2ggaGVyZS4KPiBJIHdhcyBub3QganVzdCBub3Qg
ZW50aXJlbHkgc3VyZSB3aGV0aGVyIGl0IHdhcyBvciB5b3UnZCBqdXN0IG1pc3NlZCB0aGUKPiBm
YWxsYmFjayBwYXRoLiBJbiBteSBvcmlnaW5hbCBtYWlsIEkgd2FzIGp1c3QgZ29pbmcgdG8gc2F5
ICJQbGVhc2UgYWRkIGEKPiBjb21tZW50IGhlcmUgYXMgdG8gd2h5IHlvdSB3YW50IHRvIGF2b2lk
IHRoZSBmYWxsYmFjayIsIGJ1dCBmaWd1cmVkIEkKPiBzaG91bGQgZmlndXJlIG91dCB5b3VyIGlu
dGVudCBmaXJzdCEKClRoYW5rcywgSSdsbCBhZGQgYSBjb21tZW50IGZvciB2Mi4KCj4gCj4gSnVz
dCB0byBub3RlLCBhbHRlcm5hdGl2ZXMgYXJlIGF2YWlsYWJsZSBvbiBhbGwgIVhJUCBrZXJuZWxz
IG5vdywgc28KPiBpdCdzIG9ubHkgaW4gdGhlIGNhc2UgdGhhdCB0aGUgZmFsbGJhY2sgcGF0aCB3
aWxsIGJlIGFjdGl2YXRlZC4KPiAKPiA+ID4gPiAgICAgICAgICByZXR1cm4gdHJ1ZTsKPiA+ID4g
PiAKPiA+ID4gPiAgICAgIHJldHVybiBfX3Jpc2N2X2lzYV9leHRlbnNpb25fYXZhaWxhYmxlKGhh
cnRfaXNhW2NwdV0uaXNhLCBleHQpOwo+ID4gPiA+ICB9Cj4gPiA+ID4gCj4gPiA+ID4gYW5kIHRo
ZW4gdXNlIHNtcF9wcm9jZXNzb3JfaWQoKSBkaXJlY3RseSBpbiB0aGUgY2FsbGVycyB0aGF0IG5l
ZWQKPiA+ID4gPiB0byBjaGVjayB0aGlzX2NwdSdzIGV4dGVuc2lvbnMuCj4gPiA+ID4gCj4gPiA+
ID4gRm9yIGNhc2UgKDIpLCBJJ2QgYWR2b2NhdGUgd2UgcmVuYW1lIF9fcmlzY3ZfaXNhX2V4dGVu
c2lvbl9hdmFpbGFibGUoKSB0bwo+ID4gPiA+IHJpc2N2X2hhc19leHRlbnNpb24oKSBhbmQgZHJv
cCB0aGUgcmlzY3ZfaXNhX2V4dGVuc2lvbl9hdmFpbGFibGUoKSBtYWNybwo+ID4gPiA+IGluIG9y
ZGVyIHRvIGF2b2lkIGhhdmluZyBzb21lIGNhbGxzIHdpdGggUklTQ1ZfSVNBX0VYVF8qIHNwZWxs
ZWQgb3V0IGFuZAo+ID4gPiA+IG90aGVycyB0aGF0IHJlbHkgb24gdGhlIHBhc3RpbmcuCj4gPiA+
IAo+ID4gPiA+IEFuZCwgaWRlYWxseSwgd2UnZCBjb252ZXJ0IG1vc3QKPiA+ID4gPiByaXNjdl9o
YXNfZXh0ZW5zaW9uKE5VTEwsIGV4dCkgY2FsbHMgdG8gcmlzY3ZfaGFzX2V4dGVuc2lvbl9bdW5d
bGlrZWx5KCkuCj4gPiA+IAo+ID4gPiA+IEknbSBhbHNvIG5vdCBhIGJpZyBmYW4gb2YgdGhlIE5V
TEwgcGFyYW1ldGVyIG5lZWRlZCB3aGVuCj4gPiA+ID4gcmlzY3ZfaXNhX2V4dGVuc2lvbl9hdmFp
bGFibGUoKSBpcyBpbnZva2VkIGZvciB0aGUgcmlzY3ZfaXNhIGJpdG1hcAo+ID4gPiAKPiA+ID4g
UmF0aGVyIHRoYW4gYWN0dWFsbHkgYWN0IG9uIG15IGNvbmNlcm5zIGFib3V0Cj4gPiA+IF9fcmlz
Y3ZfaXNhX2V4dGVuc2lvbl9hdmFpbGFibGUoKSwgSSd2ZSBiZWVuIGJ1c3kgZGV2b3RpbmcgbXkg
c3BhcmUKPiA+ID4gdGltZSB0byBwbGF5aW5nIE1NT3Mgd2l0aCB0aGUgZXhjdXNlIG9mIG5vdCB3
YW50aW5nIHRvIGZpZGRsZSBmdXJ0aGVyCj4gPiA+IHdpdGggY3B1ZmVhdHVyZS5jIGV0IGFsIHVu
dGlsIFBhbG1lciBtZXJnZWQgdGhlIG5ldyBEVCBwcm9wZXJ0eSBzdHVmZiwKPiA+ID4gYnV0IHNw
bGl0dGluZyBvdXQgeW91ciBjYXNlIDEgYWJvdmUgc2VlbXMgbGlrZSBpdCB3b3VsZCByZWFsbHkg
aGVscAo+ID4gPiB0aGVyZS4gVGhlIE5VTEwgYXJndW1lbnQgY2FzZSBpcyB0aGUgb25lIEkgdGhp
bmsgaGFzIHRoZSBwb3RlbnRpYWwgdG8KPiA+ID4gYmUgYSBmb290Z3VuIGluIHRoZSBmYWNlIG9m
IGNvbmZpZyBvcHRpb25zLgo+ID4gPiBTcGxpdCBvdXQgd2UgY2FuIGRvY3VtZW50IHRoYXQgcHVy
cG9zZSBvZiBlYWNoIGZ1bmN0aW9uICYgaG9wZWZ1bGx5Cj4gPiA+IGhhdmUgb25lIHNldCBvZiBm
dW5jdGlvbnMgdGhhdCBkZWFscyB3aXRoICJ0aGlzIGV4dGVuc2lvbiB3YXMgZGV0ZWN0ZWQKPiA+
ID4gdG8gYmUgcHJlc2VudCBpbiB0aGUgaGFyZHdhcmUiIGFuZCBvbmUgdGhhdCBkb2VzICJ0aGlz
IGV4dGVuc2lvbiB3YXMKPiA+ID4gZGV0ZWN0ZWQgJiBzdXBwb3J0ZWQgYnkgdGhpcyBwYXJ0aWN1
bGFyIGtlcm5lbCIuCj4gPiAKPiA+IFNvdW5kcyBnb29kIHRvIG1lIQo+IAo+IEkgZmlndXJlIHNh
aWQgY2hhbmdlIHNob3VsZCBiZSBpbmRlcGVuZGVudCBvZiB3aGF0J3MgZ29pbmcgb24gaW4gdGhp
cwo+IHNlcmllcz8KClllYWgsIEkgY29uc2lkZXJlZCBkb2luZyBpdCBhcyBwYXJ0IG9mIHRoaXMg
c2VyaWVzLCBidXQgdGhlbiBkZWNpZGVkIHRvCm9ubHkgc3RhcnQgZG93biB0aGUgcGF0aCB3aXRo
IHR3byBuZXcgd3JhcHBlcnMsIHdoaWNoLCBmb3IgdjIsIEknbGwKY2hhbmdlIHRvIHRoZSBjcHUg
cGFyYW1ldGVyIHRha2luZyB2YXJpYW50LiBUaGUgcmVzdCBvZiB0aGUgcmV3b3JrCndvdWxkIHBy
b2JhYmx5IGJlIGJlc3QgdG8gZG8gYXMgYSBzZXBhcmF0ZSBzZXJpZXMsIHdoaWNoIEkgY2FuIHN0
YXJ0CnNvb24uCgpUaGFua3MsCmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
