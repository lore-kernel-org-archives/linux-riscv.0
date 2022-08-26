Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9348BECAAD2
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Aug 2022 08:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FfziefYh2mydlnYJ9gfyfitiX0j0nEI81GxEovdRMAE=; b=g60P3gRzoz5W/N
	wLN/ak3OomKpq3D3UWcvu2kR8OJsIp1fBPH2NNr39CpNOCguB7Mb9jAdCAJXtYMhzOeuiBIdhgOS4
	Qev7yRb3AxKrfOSWUwfjtTT/4KXb9OpfRhku574UIyb29VbXASTupMeTCCwBp/qMj7X9g+Pmn9dT3
	ZvacIQODQX4u3njwgskHfxpO8P0SsudbbMVwnFExgKuYjjs7ARVG4jnUp5WOyZ/wFGNo+ZUEwuOQa
	aPLP6C+kIEE5NtXIbNBNhLv4u34VxY4braecvtWcubJyDwnfNM9cV5MKpXQLFJgg8vqwsh/gmNYjC
	uvncYW0i8Y83xf8mHSCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRUVi-00GsKY-Ll; Fri, 26 Aug 2022 08:16:14 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRUVg-00GsFB-4c
	for linux-riscv@lists.infradead.org; Fri, 26 Aug 2022 08:16:13 +0000
Received: by mail-ej1-x631.google.com with SMTP id gb36so1708020ejc.10
        for <linux-riscv@lists.infradead.org>; Fri, 26 Aug 2022 01:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc;
        bh=vSLa1x3yM/LYq8duQfSkPR7UjODiLbU3hMPX4a6qvnM=;
        b=UqyAlLYFjk8ZZXCZkUAkMzFHX94KU2J+l4l4rJrrQqciOEX6BHzsNxrwAFkdpANkj1
         DpFc90cp+HrdEdqAcWeb9GHE5MNqBYWVLf0ATbQGWJ5/VRMnMRmSqujnVkjPqAx5zwRN
         LeTyDNz/rscKZ8eplAnrC+SXS6utmYet2gqkNKUVIzbH02r3pVXxmUoYUVbScvNBSSHs
         a4KUorsMpqnXHyxa6s2S/svK0lbqMdlZi/h5op4aZqHk88SCZznn1RjaUNth/wqZmiN3
         U/O2G8zqGMEln7g3snEQbSw+ueJYb6Rje+GWy2Y1OACAxfY7qEkOA2oMJyqQAveB0Ab5
         P/bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc;
        bh=vSLa1x3yM/LYq8duQfSkPR7UjODiLbU3hMPX4a6qvnM=;
        b=yVtkbo67ODrZjkt0Br3z7B0/rXTUzdgzHPexE3I6CGSA+VHIp+d76bT+zqSopWUqkW
         ThxHJ+QdxDBbHT775IhxkjBHqUQDwEvF8j0ckTAA8aoTNQf0Q0Hc9XiY6BpbBFyYeu5/
         kSCW8Uhs5m5CVpoR3sOl/nZbv+OJHjT+X7ZqpsAYZvWa1GPLdv6S3g2YzXKOq4DlNTaH
         N1Qajx+D7yeUyNH5OrzThI4vbkMMOJFZPiIiHVvQJyBGbnDIdpZjmYIfQOVDIuciOG/7
         sjUI76sJwmYwiGlA+s/AP9pdHTEcsY/7MGcmq4/BFgFlkT/Qrp0idoI/bAwKxvMkZihD
         0SjA==
X-Gm-Message-State: ACgBeo2Vqp1Z3kO3fd4F6EXI4+F4OovMWI8LvLRSmFC2GnfesqpZIwWk
	SclRE1BATh3ep3x/iGrmwrpkDw==
X-Google-Smtp-Source: AA6agR7QQFuPvk2/UcrqfPRvBVDgErUw2JqMJaaJBD2nyOQrRspsGSM+8O8zg2pcCsGFDSNrUvWSeg==
X-Received: by 2002:a17:907:2854:b0:740:2574:1f33 with SMTP id el20-20020a170907285400b0074025741f33mr883705ejc.105.1661501769444;
        Fri, 26 Aug 2022 01:16:09 -0700 (PDT)
Received: from localhost (cst2-173-67.cust.vodafone.cz. [31.30.173.67])
        by smtp.gmail.com with ESMTPSA id a3-20020a1709063e8300b0072b3406e9c2sm601689ejj.95.2022.08.26.01.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Aug 2022 01:16:08 -0700 (PDT)
Date: Fri, 26 Aug 2022 10:16:07 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Tong Tiangen <tongtiangen@huawei.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor.Dooley@microchip.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	wangkefeng.wang@huawei.com, Guohanjun <guohanjun@huawei.com>
Subject: Re: [PATCH -next v2 2/2] riscv: extable: add new extable type
 EX_TYPE_KACCESS_ERR_ZERO support
Message-ID: <20220826081607.ci42sbffrmsfhk2w@kamzik>
References: <20220815032025.2685516-1-tongtiangen@huawei.com>
 <20220815032025.2685516-3-tongtiangen@huawei.com>
 <20220825110602.bog5mjpascvikwxx@kamzik>
 <7718a9bc-e976-daeb-f490-e7b5190e50b6@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7718a9bc-e976-daeb-f490-e7b5190e50b6@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220826_011612_199080_3897B814 
X-CRM114-Status: GOOD (  22.79  )
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

T24gRnJpLCBBdWcgMjYsIDIwMjIgYXQgMDI6NDQ6NDhQTSArMDgwMCwgVG9uZyBUaWFuZ2VuIHdy
b3RlOgo+IAo+IAo+IOWcqCAyMDIyLzgvMjUgMTk6MDYsIEFuZHJldyBKb25lcyDlhpnpgZM6Cj4g
PiBPbiBNb24sIEF1ZyAxNSwgMjAyMiBhdCAwMzoyMDoyNUFNICswMDAwLCBUb25nIFRpYW5nZW4g
d3JvdGU6Cj4gPiA+IEN1cnJlbnRseSwgVGhlIGV4dGFibGUgdHlwZSBFWF9UWVBFX1VBQ0NFU1Nf
RVJSX1pFUk8gaXMgdXNlZCBieQo+ID4gPiBfX2dldC9wdXRfa2VybmVsX25vZmF1bHQoKSwgYnV0
IHRob3NlIGhlbHBlcnMgYXJlIG5vdCB1YWNjZXNzIHR5cGUsIHNvIHdlCj4gPiA+IGFkZCBhIG5l
dyBleHRhYmxlIHR5cGUgRVhfVFlQRV9LQUNDRVNTX0VSUl9aRVJPIHdoaWNoIGNhbiBiZSB1c2Vk
IGJ5Cj4gPiA+IF9fZ2V0L3B1dF9rZXJuZWxfbm9fZmF1bHQoKS4KPiA+ID4gCj4gPiA+IE9ubHkg
cmVmYWN0b3IgY29kZSB3aXRob3V0IGFueSBmdW5jdGlvbmFsIGNoYW5nZXMuCj4gPiAKPiA+IFRo
aXMgaXNuJ3QgcXVpdGUgdHJ1ZS4gX19nZXQvcHV0X2tlcm5lbF9ub2ZhdWx0IG5vdyBzZXRzIGEg
ZGlmZmVyZW50Cj4gPiBleHRhYmxlIHR5cGUgKGFzIHRoZSBjb21taXQgbWVzc2FnZSBzYXlzKS4g
QnV0LCBub3RoaW5nIHNwZWNpYWwgc2VlbXMKPiA+IHRvIGJlIGRvbmUgd2l0aCB0aGF0LCBzbyB0
aGVyZSdzIGVmZmVjdGl2ZWx5IG5vIGZ1bmN0aW9uYWwgY2hhbmdlLiBDYW4KPiA+IHlvdSBwbGVh
c2UgZWxhYm9yYXRlIG9uIHRoZSBtb3RpdmF0aW9uIGZvciB0aGlzIGNoYW5nZT8gV2hlcmUgd2ls
bCB0aGUKPiA+IEtBQ0NFU1MgdHlwZSBuZWVkIHRvIGJlIGRpc3Rpbmd1aXNoZWQgZnJvbSB0aGUg
VUFDQ0VTUyB0eXBlPwo+IAo+IFRoZSBpbnRyb2R1Y3Rpb24gb2YgRVhfVFlQRV9LQUNDRVNTX0VS
Ul9aRVJPIGRvZXMgbm90IGNoYW5nZSBhbnkgZnVuY3Rpb24sCj4gYnV0IG1ha2VzIGEgY29ycmVj
dCBkaXN0aW5jdGlvbiBpbiB0aGUgYWN0dWFsIHR5cGUsIGluZGljYXRpbmcgdGhhdCB0aGVyZQo+
IGFyZSBpbmRlZWQgc29tZSBrYWNjZXNzIGVudHJpZXMgaW4gZXh0YWJsZS4gSSB0aGluayB0aGlz
IG9wdGltaXphdGlvbiBpcwo+IG1vcmUgY2xlYXIgYW5kIHJlYXNvbmFibGUuCgpXZWxsLCBjcmVh
dGluZyBuZXcgdHlwZXMsIGp1c3QgZm9yIG5ldyB0eXBlIHNha2UsIGp1c3QgYmxvYXRzIGNvZGUu
Cgo+IAo+IEEgZmV3IHdlZWtzIGFnbywgSSBkaWQgc29tZXRoaW5nIHNpbWlsYXIgb24gYXJtNjRb
MV0uIEkgdGhpbmsgdGhpcwo+IG9wdGltaXphdGlvbiBjYW4gYWxzbyBiZSB1c2VkIG9uIHJpc2N2
Lgo+IAo+IFdlIGNhbiBkbyBzb21lIGZlYXR1cmVzIHRoYXQgYXJlIHVzZWQgb24gdWFjY3NzIGJ1
dCBub3QgYXBwbGljYWJsZSBvbgo+IGthY2Nlc3MgaW4gdGhlIGZ1dHVyZVsyXS4KPiAKPiBbMV0K
PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjIwNjIxMDcyNjM4LjEyNzM1OTQtMi10
b25ndGlhbmdlbkBodWF3ZWkuY29tLwo+IFsyXWh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwv
MjAyMjA4MTIwNzA1NTcuMTAyODQ5OS00LXRvbmd0aWFuZ2VuQGh1YXdlaS5jb20vCj4gCgpUaGlz
IGlzIHBhcnQgb2YgdGhlIGluZm9ybWF0aW9uLCBidXQgSSBoYWQgYWxyZWFkeSBmb3VuZCB0aGlz
LiBXaGF0J3MKc3RpbGwgbWlzc2luZyB0byBtZSBhcmUgdGhlIHJpc2N2IHBhdGNoZXMsIG9yIGF0
IGxlYXN0IGEgcmlzY3YgcGxhbiwgZm9yCmFjdHVhbGx5IGltcGxlbWVudGluZyBzb21ldGhpbmcg
d2hpY2ggcmVxdWlyZXMga2FjY2VzcyBhbmQgdWFjY2VzcyB0byBoYXZlCmRpc3RpbmN0IHR5cGVz
LgoKVGhhbmtzLApkcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
