Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0AF9C71153
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Aug 2023 15:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d/6M4IDKi5FsuKpNShCPwYLe3/7ff4cfiSIzDgUqrM8=; b=J1tnUpHroIGNUt
	DUip+UfJVR/Yc7LaooQl2MH22iSCHJuTxgYBcg72FAGeTkDK4Bk/+tHJOTwNTyHEuh9TznbC+ozp5
	FOrk+/Gkwrywcrf+bKq/g5Mf04FQaK1ua+SrIHUClI4taxI8Z6s+JpNK1sXU75UKBz8lkhzyLrAxz
	9UFYmriIcr13aQRalCrOFrsYNf+h+0xmSV7QPApBZYwlECM8ZtjvJE2qLLgmoeicxu6vZkeijJOOg
	A7hIl00zu0GhTJp/A+/dALmuNrZJ7w8RiRL5qXuEnAmVTRItw31dXbI/bB0pG3sFyFjuT53ZdLYuA
	2/egbIEPhINcK2VcG6Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qb0br-00Bmj9-0Y;
	Tue, 29 Aug 2023 15:26:27 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qb0bo-00Bmhh-05
	for linux-riscv@lists.infradead.org;
	Tue, 29 Aug 2023 15:26:25 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2bc63e0d8cdso66898371fa.2
        for <linux-riscv@lists.infradead.org>; Tue, 29 Aug 2023 08:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693322780; x=1693927580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=50mcfLiz7pKWihf7pV3Nv61gQMWu7yH2UtWWZoG6nBE=;
        b=n2Ax+nu4E6n0M8RHIlS6y0bBossY0+RHgL46fhS1bWKI9ZN+LzgasdQ9kwq93aQttc
         IJCaKThjPz1WZp2nozneLWyyJ1c9X+XRR2bw9LNoh03nGeDunWF6lG589pzpglPBQ7RN
         QGtf+BITjchsrF8jsZkzoBV7MBpxcLDwvaf1L5aV/x+byl/JTtFLw3hfjSVrRFa7bRCO
         tygCnl2BzATlmW39QunED6123ct6PseRMga6rNKfVDxBCEKAEKPGYvTWKtT/5HEaI+RN
         Jcqh5M2q7yEcp9XIKuWf6gW+YslptXn/qIDfeRAJ4B2eycLhxfor0KE7xlsMR5ZHK4EF
         paiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693322780; x=1693927580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=50mcfLiz7pKWihf7pV3Nv61gQMWu7yH2UtWWZoG6nBE=;
        b=CybxcmapZ4C+46h3ytlzlJz70aaBGLisermGV3hEEbTWXBLGwy916hcBjZrybo30bX
         J2llntgc8IFt6OYvkgxLP87gG8kk4ZIvMWIdLj7E0b2i+begtUlTvd5iAAP1d7PPzYgL
         zs1c0+5JGxSkXFoSL8VSadZ1xgTHJb2ICSLxxbHFco4Iepl06mgwMXIKdG21o6tCkhDy
         FCjq2oOaBxaHjy/svdLi7wrDDdwv9TU8us8D6cdH22oZRwxJiY+08hnuKjY55a3OV8GQ
         JjdX+PlTQCuhegyj5hlc0F6NVqhgcbHujNsEbWwT2SowKHn2/u+MND8OjRWKu9Xlwpj7
         xtKA==
X-Gm-Message-State: AOJu0YxmXPg6bugu+GV1zFFKDs6VBqJXt6dxWRUYB+7S9iSiJxhvh2c0
	mSSEjYqHjya01iFmhl4yerrPP5SrOC+vOrERQQE=
X-Google-Smtp-Source: AGHT+IF5uePVMV9wlzk8ZmlVAfyZNGnD6jtBJ3lU/97ukwTNrH6W1enYQVNX0c/Glt34Ri1jPiCs7z7hmg84tekrxas=
X-Received: by 2002:a2e:b5b7:0:b0:2bc:f9d0:c3d7 with SMTP id
 f23-20020a2eb5b7000000b002bcf9d0c3d7mr7419473ljn.3.1693322780067; Tue, 29 Aug
 2023 08:26:20 -0700 (PDT)
MIME-Version: 1.0
References: <87jztjmmy4.fsf@all.your.base.are.belong.to.us>
 <2f4f0dfc-ec06-8ac8-a56a-395cc2373def@linux.dev> <200dcce6-34ff-83e0-02fb-709a24403cc6@huaweicloud.com>
 <87zg2e88ds.fsf@all.your.base.are.belong.to.us> <64873e42-9be1-1812-b80d-5ea86b4677f0@huaweicloud.com>
 <87sf8684ex.fsf@all.your.base.are.belong.to.us> <878r9wswwy.fsf@all.your.base.are.belong.to.us>
 <fd07e0a3-f4da-b447-c47a-6e933220d452@linux.dev> <65c9e8d9-7682-2c8d-cd4d-9f0ca1213066@huaweicloud.com>
In-Reply-To: <65c9e8d9-7682-2c8d-cd4d-9f0ca1213066@huaweicloud.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 29 Aug 2023 08:26:08 -0700
Message-ID: <CAADnVQJGVJCh=i1tuov4t1MmUx5=ybjF544i4F4m-SbHd5N6vA@mail.gmail.com>
Subject: Re: WARNING: CPU: 3 PID: 261 at kernel/bpf/memalloc.c:342
To: Hou Tao <houtao@huaweicloud.com>
Cc: Yonghong Song <yonghong.song@linux.dev>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	bpf <bpf@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230829_082624_072730_44CB2BED 
X-CRM114-Status: GOOD (  39.47  )
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

T24gTW9uLCBBdWcgMjgsIDIwMjMgYXQgNjo1N+KAr0FNIEhvdSBUYW8gPGhvdXRhb0BodWF3ZWlj
bG91ZC5jb20+IHdyb3RlOgo+Cj4gSGksCj4KPiBPbiA4LzI3LzIwMjMgMTA6NTMgUE0sIFlvbmdo
b25nIFNvbmcgd3JvdGU6Cj4gPgo+ID4KPiA+IE9uIDgvMjcvMjMgMTozNyBBTSwgQmrDtnJuIFTD
tnBlbCB3cm90ZToKPiA+PiBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJuZWwub3JnPiB3cml0ZXM6
Cj4gPj4KPiA+Pj4gSG91IFRhbyA8aG91dGFvQGh1YXdlaWNsb3VkLmNvbT4gd3JpdGVzOgo+ID4+
Pgo+ID4+Pj4gSGksCj4gPj4+Pgo+ID4+Pj4gT24gOC8yNi8yMDIzIDU6MjMgUE0sIEJqw7ZybiBU
w7ZwZWwgd3JvdGU6Cj4gPj4+Pj4gSG91IFRhbyA8aG91dGFvQGh1YXdlaWNsb3VkLmNvbT4gd3Jp
dGVzOgo+ID4+Pj4+Cj4gPj4+Pj4+IEhpLAo+ID4+Pj4+Pgo+ID4+Pj4+PiBPbiA4LzI1LzIwMjMg
MTE6MjggUE0sIFlvbmdob25nIFNvbmcgd3JvdGU6Cj4gPj4+Pj4+Pgo+ID4+Pj4+Pj4gT24gOC8y
NS8yMyAzOjMyIEFNLCBCasO2cm4gVMO2cGVsIHdyb3RlOgo+ID4+Pj4+Pj4+IEknbSBjaGFzaW5n
IGEgd29ya3F1ZXVlIGhhbmcgb24gUklTQy1WL3FlbXUgKFRDRyksIHVzaW5nIHRoZSBicGYKPiA+
Pj4+Pj4+PiBzZWxmdGVzdHMgb24gYnBmLW5leHQgOWUzYjQ3YWJlYjhmLgo+ID4+Pj4+Pj4+Cj4g
Pj4+Pj4+Pj4gSSdtIGFibGUgdG8gcmVwcm9kdWNlIHRoZSBoYW5nIGJ5IG11bHRpcGxlIHJ1bnMg
b2Y6Cj4gPj4+Pj4+Pj4gICAgfCAuL3Rlc3RfcHJvZ3MgLWEgbGlua19hcGkgLWEgbGlua2VkX2xp
c3QKPiA+Pj4+Pj4+PiBJJ20gY3VycmVudGx5IGludmVzdGlnYXRpbmcgdGhhdC4KPiA+Pj4+Pj4+
Pgo+ID4+Pj4+Pj4+IEJ1dCEgU29tZXRpbWVzIChldmVyeSBibHVlIG1vb24pIEkgZ2V0IGEgd2Fy
bl9vbl9vbmNlIGhpdDoKPiA+Pj4+Pj4+PiAgICB8IC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUgXS0t
LS0tLS0tLS0tLQo+ID4+Pj4+Pj4+ICAgIHwgV0FSTklORzogQ1BVOiAzIFBJRDogMjYxIGF0IGtl
cm5lbC9icGYvbWVtYWxsb2MuYzozNDIKPiA+Pj4+Pj4+PiBicGZfbWVtX3JlZmlsbCsweDFmYy8w
eDIwNgo+ID4+Pj4+Pj4+ICAgIHwgTW9kdWxlcyBsaW5rZWQgaW46IGJwZl90ZXN0bW9kKE9FKQo+
ID4+Pj4+Pj4+ICAgIHwgQ1BVOiAzIFBJRDogMjYxIENvbW06IHRlc3RfcHJvZ3MtY3B1diBUYWlu
dGVkOiBHICAgICAgICAgICBPRQo+ID4+Pj4+Pj4+IE4gNi41LjAtcmM1LTAxNzQzLWdkY2IxNTJi
YjgzMjggIzIKPiA+Pj4+Pj4+PiAgICB8IEhhcmR3YXJlIG5hbWU6IHJpc2N2LXZpcnRpbyxxZW11
IChEVCkKPiA+Pj4+Pj4+PiAgICB8IGVwYyA6IGJwZl9tZW1fcmVmaWxsKzB4MWZjLzB4MjA2Cj4g
Pj4+Pj4+Pj4gICAgfCAgcmEgOiBpcnFfd29ya19zaW5nbGUrMHg2OC8weDcwCj4gPj4+Pj4+Pj4g
ICAgfCBlcGMgOiBmZmZmZmZmZjgwMWIxYmM0IHJhIDogZmZmZmZmZmY4MDE1ZmU4NCBzcCA6Cj4g
Pj4+Pj4+Pj4gZmYyMDAwMDAwMDAxYmUyMAo+ID4+Pj4+Pj4+ICAgIHwgIGdwIDogZmZmZmZmZmY4
MmQyNjEzOCB0cCA6IGZmNjAwMDAwODQ3N2E4MDAgdDAgOgo+ID4+Pj4+Pj4+IDAwMDAwMDAwMDAw
NDY2MDAKPiA+Pj4+Pj4+PiAgICB8ICB0MSA6IGZmZmZmZmZmODEyYjZkZGMgdDIgOiAwMDAwMDAw
MDAwMDAwMDAwIHMwIDoKPiA+Pj4+Pj4+PiBmZjIwMDAwMDAwMDFiZTcwCj4gPj4+Pj4+Pj4gICAg
fCAgczEgOiBmZjVmZmZmZmZmZmU4OTk4IGEwIDogZmY1ZmZmZmZmZmZlODk5OCBhMSA6Cj4gPj4+
Pj4+Pj4gZmY2MDAwMDNmZWY0YjAwMAo+ID4+Pj4+Pj4+ICAgIHwgIGEyIDogMDAwMDAwMDAwMDAw
MDAzZiBhMyA6IGZmZmZmZmZmODAwMDgyNTAgYTQgOgo+ID4+Pj4+Pj4+IDAwMDAwMDAwMDAwMDAw
NjAKPiA+Pj4+Pj4+PiAgICB8ICBhNSA6IDAwMDAwMDAwMDAwMDAwODAgYTYgOiAwMDAwMDAwMDAw
MDAwMDAwIGE3IDoKPiA+Pj4+Pj4+PiAwMDAwMDAwMDAwNzM1MDQ5Cj4gPj4+Pj4+Pj4gICAgfCAg
czIgOiBmZjVmZmZmZmZmZmU4OTk4IHMzIDogMDAwMDAwMDAwMDAwMDAyMiBzNCA6Cj4gPj4+Pj4+
Pj4gMDAwMDAwMDAwMDAwMTAwMAo+ID4+Pj4+Pj4+ICAgIHwgIHM1IDogMDAwMDAwMDAwMDAwMDAw
NyBzNiA6IGZmNWZmZmZmZmZmZTg1NzAgczcgOgo+ID4+Pj4+Pj4+IGZmZmZmZmZmODJkNmJkMzAK
PiA+Pj4+Pj4+PiAgICB8ICBzOCA6IDAwMDAwMDAwMDAwMDAwM2YgczkgOiBmZmZmZmZmZjgyZDJj
NWU4IHMxMDoKPiA+Pj4+Pj4+PiAwMDAwMDAwMDAwMDBmZmZmCj4gPj4+Pj4+Pj4gICAgfCAgczEx
OiBmZmZmZmZmZjgyZDJjNWQ4IHQzIDogZmZmZmZmZmY4MWVhOGYyOCB0NCA6Cj4gPj4+Pj4+Pj4g
MDAwMDAwMDAwMDAwMDAwMAo+ID4+Pj4+Pj4+ICAgIHwgIHQ1IDogZmY2MDAwMDA4ZmQyODI3OCB0
NiA6IDAwMDAwMDAwMDAwNDAwMDAKPiA+Pj4+Pj4+PiAgICB8IHN0YXR1czogMDAwMDAwMDIwMDAw
MDEwMCBiYWRhZGRyOiAwMDAwMDAwMDAwMDAwMDAwIGNhdXNlOgo+ID4+Pj4+Pj4+IDAwMDAwMDAw
MDAwMDAwMDMKPiA+Pj4+Pj4+PiAgICB8IFs8ZmZmZmZmZmY4MDFiMWJjND5dIGJwZl9tZW1fcmVm
aWxsKzB4MWZjLzB4MjA2Cj4gPj4+Pj4+Pj4gICAgfCBbPGZmZmZmZmZmODAxNWZlODQ+XSBpcnFf
d29ya19zaW5nbGUrMHg2OC8weDcwCj4gPj4+Pj4+Pj4gICAgfCBbPGZmZmZmZmZmODAxNWZlYjQ+
XSBpcnFfd29ya19ydW5fbGlzdCsweDI4LzB4MzYKPiA+Pj4+Pj4+PiAgICB8IFs8ZmZmZmZmZmY4
MDE1ZmVmYT5dIGlycV93b3JrX3J1bisweDM4LzB4NjYKPiA+Pj4+Pj4+PiAgICB8IFs8ZmZmZmZm
ZmY4MDAwODI4YT5dIGhhbmRsZV9JUEkrMHgzYS8weGI0Cj4gPj4+Pj4+Pj4gICAgfCBbPGZmZmZm
ZmZmODAwYTVjM2E+XSBoYW5kbGVfcGVyY3B1X2RldmlkX2lycSsweGE0LzB4MWY4Cj4gPj4+Pj4+
Pj4gICAgfCBbPGZmZmZmZmZmODAwOWZhZmE+XSBnZW5lcmljX2hhbmRsZV9kb21haW5faXJxKzB4
MjgvMHgzNgo+ID4+Pj4+Pj4+ICAgIHwgWzxmZmZmZmZmZjgwMGFlNTcwPl0gaXBpX211eF9wcm9j
ZXNzKzB4YWMvMHhmYQo+ID4+Pj4+Pj4+ICAgIHwgWzxmZmZmZmZmZjgwMDBhOGVhPl0gc2JpX2lw
aV9oYW5kbGUrMHgyZS8weDg4Cj4gPj4+Pj4+Pj4gICAgfCBbPGZmZmZmZmZmODAwOWZhZmE+XSBn
ZW5lcmljX2hhbmRsZV9kb21haW5faXJxKzB4MjgvMHgzNgo+ID4+Pj4+Pj4+ICAgIHwgWzxmZmZm
ZmZmZjgwN2VlNzBlPl0gcmlzY3ZfaW50Y19pcnErMHgzNi8weDRlCj4gPj4+Pj4+Pj4gICAgfCBb
PGZmZmZmZmZmODEyYjVkM2E+XSBoYW5kbGVfcmlzY3ZfaXJxKzB4NTQvMHg4Ngo+ID4+Pj4+Pj4+
ICAgIHwgWzxmZmZmZmZmZjgxMmI2OTA0Pl0gZG9faXJxKzB4NjYvMHg5OAo+ID4+Pj4+Pj4+ICAg
IHwgLS0tWyBlbmQgdHJhY2UgMDAwMDAwMDAwMDAwMDAwMCBdLS0tCj4gPj4+Pj4+Pj4KPiA+Pj4+
Pj4+PiBDb2RlOgo+ID4+Pj4+Pj4+ICAgIHwgc3RhdGljIHZvaWQgZnJlZV9idWxrKHN0cnVjdCBi
cGZfbWVtX2NhY2hlICpjKQo+ID4+Pj4+Pj4+ICAgIHwgewo+ID4+Pj4+Pj4+ICAgIHwgICAgIHN0
cnVjdCBicGZfbWVtX2NhY2hlICp0Z3QgPSBjLT50Z3Q7Cj4gPj4+Pj4+Pj4gICAgfCAgICAgc3Ry
dWN0IGxsaXN0X25vZGUgKmxsbm9kZSwgKnQ7Cj4gPj4+Pj4+Pj4gICAgfCAgICAgdW5zaWduZWQg
bG9uZyBmbGFnczsKPiA+Pj4+Pj4+PiAgICB8ICAgICBpbnQgY250Owo+ID4+Pj4+Pj4+ICAgIHwK
PiA+Pj4+Pj4+PiAgICB8ICAgICBXQVJOX09OX09OQ0UodGd0LT51bml0X3NpemUgIT0gYy0+dW5p
dF9zaXplKTsKPiA+Pj4+Pj4+PiAgICB8IC4uLgo+ID4+Pj4+Pj4+Cj4gPj4+Pj4+Pj4gSSdtIG5v
dCB3ZWxsIHZlcnNlZCBpbiB0aGUgbWVtb3J5IGFsbG9jYXRvcjsgQmVmb3JlIEkgZGl2ZSBpbnRv
Cj4gPj4+Pj4+Pj4gaXQgLS0KPiA+Pj4+Pj4+PiBoYXMgYW55b25lIGVsc2UgaGl0IGl0PyBJZGVh
cyBvbiB3aHkgdGhlIHdhcm5fb25fb25jZSBpcyBoaXQ/Cj4gPj4+Pj4+PiBNYXliZSB0YWtlIGEg
bG9vayBhdCB0aGUgcGF0Y2gKPiA+Pj4+Pj4+ICAgIDgyMmZiMjZiZGI1NSAgYnBmOiBBZGQgYSBo
aW50IHRvIGFsbG9jYXRlZCBvYmplY3RzLgo+ID4+Pj4+Pj4KPiA+Pj4+Pj4+IEluIHRoZSBhYm92
ZSBwYXRjaCwgd2UgaGF2ZQo+ID4+Pj4+Pj4KPiA+Pj4+Pj4+ICsgICAgICAgLyoKPiA+Pj4+Pj4+
ICsgICAgICAgICogUmVtZW1iZXIgYnBmX21lbV9jYWNoZSB0aGF0IGFsbG9jYXRlZCB0aGlzIG9i
amVjdC4KPiA+Pj4+Pj4+ICsgICAgICAgICogVGhlIGhpbnQgaXMgbm90IGFjY3VyYXRlLgo+ID4+
Pj4+Pj4gKyAgICAgICAgKi8KPiA+Pj4+Pj4+ICsgICAgICAgYy0+dGd0ID0gKihzdHJ1Y3QgYnBm
X21lbV9jYWNoZSAqKilsbG5vZGU7Cj4gPj4+Pj4+Pgo+ID4+Pj4+Pj4gSSBzdXNwZWN0IHRoYXQg
dGhlIHdhcm5pbmcgbWF5IGJlIHJlbGF0ZWQgdG8gdGhlIGFib3ZlLgo+ID4+Pj4+Pj4gSSB0cmll
ZCB0aGUgYWJvdmUgLi90ZXN0X3Byb2dzIGNvbW1hbmQgbGluZSAocnVubmluZyBtdWx0aXBsZQo+
ID4+Pj4+Pj4gYXQgdGhlIHNhbWUgdGltZSkgYW5kIGRpZG4ndCB0cmlnZ2VyIHRoZSBpc3N1ZS4K
PiA+Pj4+Pj4gVGhlIGV4dHJhIDgtYnl0ZXMgYmVmb3JlIHRoZSBmcmVlZCBwb2ludGVyIGlzIHVz
ZWQgdG8gc2F2ZSB0aGUKPiA+Pj4+Pj4gcG9pbnRlcgo+ID4+Pj4+PiBvZiB0aGUgb3JpZ2luYWwg
YnBmIG1lbW9yeSBhbGxvY2F0b3Igd2hlcmUgdGhlIGZyZWVkIHBvaW50ZXIgY2FtZQo+ID4+Pj4+
PiBmcm9tLAo+ID4+Pj4+PiBzbyB1bml0X2ZyZWUoKSBjb3VsZCBmcmVlIHRoZSBwb2ludGVyIGJh
Y2sgdG8gdGhlIG9yaWdpbmFsCj4gPj4+Pj4+IGFsbG9jYXRvciB0bwo+ID4+Pj4+PiBwcmV2ZW50
IGFsbG9jLWFuZC1mcmVlIHVuYmFsYW5jZS4KPiA+Pj4+Pj4KPiA+Pj4+Pj4gSSBzdXNwZWN0IHRo
YXQgYSB3cm9uZyBwb2ludGVyIHdhcyBwYXNzZWQgdG8gYnBmX29ial9kcm9wLCBidXQgZG8KPiA+
Pj4+Pj4gbm90Cj4gPj4+Pj4+IGZpbmQgYW55dGhpbmcgc3VzcGljaW91cyBhZnRlciBjaGVja2lu
ZyBsaW5rZWRfbGlzdC4gQW5vdGhlcgo+ID4+Pj4+PiBwb3NzaWJpbGl0eQo+ID4+Pj4+PiBpcyB0
aGF0IHRoZXJlIGlzIHdyaXRlLWFmdGVyLWZyZWUgcHJvYmxlbSB3aGljaCBjb3JydXB0cyB0aGUg
ZXh0cmEKPiA+Pj4+Pj4gOC1ieXRlcyBiZWZvcmUgdGhlIGZyZWVkIHBvaW50ZXIuIENvdWxkIHlv
dSBwbGVhc2UgYXBwbHkgdGhlCj4gPj4+Pj4+IGZvbGxvd2luZwo+ID4+Pj4+PiBkZWJ1ZyBwYXRj
aCB0byBjaGVjayB3aGV0aGVyIG9yIG5vdCB0aGUgZXh0cmEgOC1ieXRlcyBhcmUKPiA+Pj4+Pj4g
Y29ycnVwdGVkID8KPiA+Pj4+PiBUaGFua3MgZm9yIGdldHRpbmcgYmFjayEKPiA+Pj4+Pgo+ID4+
Pj4+IEkgdG9vayB5b3VyIHBhdGNoIGZvciBhIHJ1biwgYW5kIHRoZXJlJ3MgYSBoaXQ6Cj4gPj4+
Pj4gICAgfCBiYWQgY2FjaGUgZmY1ZmZmZmZmZmZlODU3MDogZ290IHNpemUgOTYgd29yawo+ID4+
Pj4+IGZmZmZmZmZmODAxYjE5YzgsIGNhY2hlIGZmNWZmZmZmZmZmZTg5ODAgZXhwIHNpemUgMTI4
IHdvcmsKPiA+Pj4+PiBmZmZmZmZmZjgwMWIxOWM4Cj4gPj4+Pgo+ID4+Pj4gVGhlIGV4dHJhIDgt
Ynl0ZXMgYXJlIG5vdCBjb3JydXB0ZWQuIEJvdGggb2YgdGhlc2UgdHdvCj4gPj4+PiBicGZfbWVt
X2NhY2hlIGFyZQo+ID4+Pj4gdmFsaWQgYW5kIHRoZXJlIGFyZSBpbiB0aGUgY2FjaGUgYXJyYXkg
ZGVmaW5lZCBpbiBicGZfbWVtX2NhY2hlcy4gQlBGCj4gPj4+PiBtZW1vcnkgYWxsb2NhdG9yIGFs
bG9jYXRlZCB0aGUgcG9pbnRlciBmcm9tIDk2LWJ5dGVzIHNpemVkLWNhY2hlLAo+ID4+Pj4gYnV0
IGl0Cj4gPj4+PiB0cmllZCB0byBmcmVlIHRoZSBwb2ludGVyIHRocm91Z2ggMTI4LWJ5dGVzIHNp
emVkLWNhY2hlLgo+ID4+Pj4KPiA+Pj4+IE5vdyBJIHN1c3BlY3QgdGhlcmUgaXMgbm8gOTYtYnl0
ZXMgc2xhYiBpbiB5b3VyIHN5c3RlbSBhbmQga3NpemUocHRyIC0KPiA+Pj4+IExMSVNUX05PREVf
U1opIHJldHVybnMgMTI4LCBzbyBicGYgbWVtb3J5IGFsbG9jYXRvciBzZWxlY3RlZCB0aGUKPiA+
Pj4+IDEyOC1ieXRlIHNpemVkLWNhY2hlIGluc3RlYWQgb2YgOTYtYnl0ZXMgc2l6ZWQtY2FjaGUu
IENvdWxkIHlvdSBwbGVhc2UKPiA+Pj4+IGNoZWNrIHRoZSB2YWx1ZSBvZiBLTUFMTE9DX01JTl9T
SVpFIGluIHlvdXIga2VybmVsIC5jb25maWcgYW5kCj4gPj4+PiB1c2luZyB0aGUKPiA+Pj4+IGZv
bGxvd2luZyBjb21tYW5kIHRvIGNoZWNrIHdoZXRoZXIgdGhlcmUgaXMgOTYtYnl0ZXMgc2xhYiBp
biB5b3VyCj4gPj4+PiBzeXN0ZW06Cj4gPj4+Cj4gPj4+IEtNQUxMT0NfTUlOX1NJWkUgaXMgNjQu
Cj4gPj4+Cj4gPj4+PiAkIGNhdCAvcHJvYy9zbGFiaW5mbyB8Z3JlcCBrbWFsbG9jLTk2Cj4gPj4+
PiBkbWEta21hbGxvYy05NiAgICAgICAgIDAgICAgICAwICAgICA5NiAgIDQyICAgIDEgOiB0dW5h
YmxlcyAgICAwICAgIDAKPiA+Pj4+IDAgOiBzbGFiZGF0YSAgICAgIDAgICAgICAwICAgICAgMAo+
ID4+Pj4ga21hbGxvYy05NiAgICAgICAgICAxODY1ICAgMjI2OCAgICAgOTYgICA0MiAgICAxIDog
dHVuYWJsZXMgICAgMCAgICAwCj4gPj4+PiAwIDogc2xhYmRhdGEgICAgIDU0ICAgICA1NCAgICAg
IDAKPiA+Pj4+Cj4gPj4+PiBJbiBteSBzeXN0ZW0sIHNsYWIgaGFzIDk2LWJ5dGVzIGNhY2hlZCwg
c28gZ3JlcCBvdXRwdXRzIHNvbWV0aGluZywKPiA+Pj4+IGJ1dCBJCj4gPj4+PiB0aGluayB0aGVy
ZSB3aWxsIG5vIG91dHB1dCBpbiB5b3VyIHN5c3RlbS4KPiA+Pj4KPiA+Pj4gWW91J3JlIHJpZ2h0
ISBObyBrbWFsbG9jLTk2Lgo+ID4+Cj4gPj4gVG8gZ2V0IHJpZCBvZiB0aGUgd2FybmluZywgbGlt
aXQgYXZhaWxhYmxlIHNpemVzIGZyb20KPiA+PiBicGZfbWVtX2FsbG9jX2luaXQoKT8KPgo+IEl0
IGlzIG5vdCBlbm91Z2guIFdlIG5lZWQgdG8gYWRqdXN0IHNpemVfaW5kZXggYWNjb3JkaW5nbHkg
ZHVyaW5nCj4gaW5pdGlhbGl6YXRpb24uIENvdWxkIHlvdSBwbGVhc2UgdHJ5IHRoZSBhdHRhY2hl
ZCBwYXRjaCBiZWxvdyA/IEl0IGlzCj4gbm90IGEgZm9ybWFsIHBhdGNoIGFuZCBJIGFtIGNvbnNp
ZGVyaW5nIHRvIGRpc2FibGUgcHJlZmlsbGluZyBmb3IgdGhlc2UKPiByZWRpcmVjdGVkIGJwZl9t
ZW1fY2FjaGVzLgo+ID4KPiA+IERvIHlvdSBrbm93IHdoeSB5b3VyIHN5c3RlbSBkb2VzIG5vdCBo
YXZlIGttYWxsb2MtOTY/Cj4KPiBBY2NvcmRpbmcgdG8gdGhlIGltcGxlbWVudGF0aW9uIG9mIHNl
dHVwX2ttYWxsb2NfY2FjaGVfaW5kZXhfdGFibGUoKSBhbmQKPiBjcmVhdGVfa21hbGxvY19jYWNo
ZXMoKSwgIHdoZW4gS01BTExPQ19NSU5fU0laRSBpcyBncmVhdGVyIHRoYW4gNjQsCj4ga21hbGxv
Yy05NiB3aWxsIGJlIG9taXR0ZWQuIElmIEtNQUxMT0NfTUlOX1NJWkUgaXMgZ3JlYXRlciB0aGFu
IDEyOCwKPiBrbWFsbG9jLTE5MiB3aWxsIGJlIG9taXR0ZWQgYXMgd2VsbC4KCkdyZWF0IGNhdGNo
LiBUaGUgZml4IGxvb2tzIGdvb2QuClBsZWFzZSBzdWJtaXQgaXQgb2ZmaWNpYWxseSBhbmQgYWRk
IGFuIGVycm9yIGNoZWNrIHRvIGJwZl9tZW1fYWxsb2NfaW5pdCgpCnRoYXQgdmVyaWZpZXMgdGhh
dCBrc2l6ZSgpIG1hdGNoZXMgdGhlIGV4cGVjdGF0aW9ucy4KVGhlIGFsdGVybmF0aXZlIGlzIHRv
IHVzZSBrbWFsbG9jX3NpemVfcm91bmR1cCgpIGR1cmluZyBhbGxvYyBmb3IKY2hlY2tpbmcgaW5z
dGVhZCBvZiBrc2l6ZSgpLgpUZWNobmljYWxseSB3ZSBjYW4gdXNlIGttYWxsb2Nfc2l6ZV9yb3Vu
ZHVwIGluIHVuaXRfYWxsb2MoKSBhbmQgYXZvaWQKc2V0dXBfa21hbGxvY19jYWNoZV9pbmRleF90
YWJsZSgpLWxpa2UgY29weSBwYXN0ZSwgYnV0IHBlcmZvcm1hbmNlCm92ZXJoZWFkIG1pZ2h0IGJl
IHRvbyBoaWdoLgpTbyB5b3VyIHBhdGNoICsgZXJyb3IgY2hlY2sgYXQgYnBmX21lbV9hbGxvY19p
bml0KCkgaXMgcHJlZmVycmVkLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
